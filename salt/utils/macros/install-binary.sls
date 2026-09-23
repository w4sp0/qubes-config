{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{#
Install a pinned binary that is not packaged by the distribution. A builder
disposable (formula 'builder') downloads or builds it, then sends it to the
target template with 'qusal.InstallBinary'. The template installs it to
/usr/bin/NAME only if its SHA-256 matches the pin. Neither the binary nor
the build output passes through dom0.

Keep the pin of each binary in one file per formula, for example
'salt/FORMULA/binaries.jinja':

  {% set example = {
      'name': 'example',
      'method': 'release',
      'url': 'https://example.org/example_1.0_linux_amd64.tar.gz',
      'url_sha256': '<SHA-256 of the download>',
      'member': 'example',
      'sha256': '<SHA-256 of the binary>',
  } %}

  {% set example = {
      'name': 'example',
      'method': 'go',
      'repo': 'https://github.com/example/example.git',
      'commit': '<full commit hash>',
      'package': '.',
      'toolchain': 'go1.27.0',
      'sha256': '<SHA-256 of the build output>',
  } %}

For 'go', get 'sha256' by running the same build in two builder disposables
and comparing the output:

  qvm-run --dispvm=dvm-builder --pass-io -- \
    'qusal-install-binary hash go NAME REPO COMMIT PACKAGE TOOLCHAIN'

Usage:

Template state, applied to the target template:

  include:
    - builder.install-target
  {% from 'utils/macros/install-binary.sls' import install_binary_pin %}
  {{ install_binary_pin(example) }}

Dom0 state, applied after the template state:

  {% from 'utils/macros/install-binary.sls' import install_binary %}
  {{ install_binary(example, 'tpl-FORMULA') }}

Policy, in 'salt/FORMULA/files/admin/policy/default.policy':

  qusal.InstallBinary +example @dispvm:dvm-builder tpl-FORMULA allow user=root
  qusal.InstallBinary +example @anyvm              @anyvm      deny

The dom0 state does nothing when the template already has a binary with the
pinned SHA-256. Otherwise it starts a builder disposable, and after the
install it shuts down the template if the state started it, so qubes based
on the template get the new binary at their next start.
#}

{% macro _args(bin) -%}
  {%- if bin.method == 'release' -%}
    {%- set args = [bin.url, bin.url_sha256, bin.member] -%}
  {%- elif bin.method == 'go' -%}
    {%- set args = [bin.repo, bin.commit, bin.package, bin.toolchain] -%}
  {%- else -%}
    {{- raise('install-binary: unknown method for ' ~ bin.name) -}}
  {%- endif -%}
  {%- for arg in [bin.name] + args -%}
    {%- if "'" in arg or ' ' in arg -%}
      {{- raise('install-binary: quote or space in pin of ' ~ bin.name) -}}
    {%- endif -%}
  {%- endfor -%}
  {{- bin.method }} {{ bin.name }} {{ args|join(' ') -}}
{%- endmacro %}

{% macro install_binary_pin(bin) -%}
{% if not bin.sha256 -%}
"{{ bin.name }}-install-binary-pin-missing":
  test.fail_without_changes:
    - name: "No SHA-256 pin for '{{ bin.name }}'. See utils/macros/install-binary.sls."
{%- else -%}
"{{ bin.name }}-install-binary-pin":
  file.managed:
    - require:
      - sls: builder.install-target
    - name: /etc/qusal-install-binary/{{ bin.name }}.sha256
    - contents: "{{ bin.sha256 }}"
    - mode: '0644'
    - user: root
    - group: root
{%- endif %}
{%- endmacro %}

{% macro install_binary(bin, target) -%}
{% if not bin.sha256 -%}
"{{ bin.name }}-install-binary-pin-missing":
  test.fail_without_changes:
    - name: "No SHA-256 pin for '{{ bin.name }}'. See utils/macros/install-binary.sls."
{%- else -%}
"{{ bin.name }}-install-binary":
  cmd.run:
    - name: |
        set -eu
        running=0
        if qvm-check --quiet --running -- {{ target }}; then running=1; fi
        qvm-run --dispvm=dvm-builder --no-gui --pass-io \
          --filter-escape-chars --no-color-output --no-color-stderr \
          -- 'qusal-install-binary install {{ _args(bin) }} {{ target }} {{ bin.sha256 }}' \
          >/dev/null
        if test "${running}" = "0"; then qvm-shutdown --wait -- {{ target }}; fi
    - unless: |
        running=0
        if qvm-check --quiet --running -- {{ target }}; then running=1; fi
        rc=0
        qvm-run --no-gui --user=root --pass-io \
          --filter-escape-chars --no-color-output --no-color-stderr \
          -- {{ target }} \
          'printf "%s  %s\n" {{ bin.sha256 }} /usr/bin/{{ bin.name }} | sha256sum --check --status' \
          >/dev/null 2>&1 || rc="${?}"
        if test "${running}" = "0"; then qvm-shutdown --wait -- {{ target }}; fi
        exit "${rc}"
{%- endif %}
{%- endmacro %}
