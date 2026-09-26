{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{#
Install a recent Go toolchain with its source and documentation, so 'go doc'
works offline.

Debian stable ships an older Go, thus it is installed from the backports of
the release, which are signed by the Debian archive key and fetched through
the same Update Proxy as the other packages. Backports have a lower priority,
so only the packages installed here come from them. The toolchain is in
'/usr/lib/go-VERSION' and its binaries are linked to '/usr/bin'. To move to
a newer Go, change 'go_version'.
#}

{% if grains['nodename'] != 'dom0' -%}

{% set go_version = '1.27' -%}

include:
{% if grains['os_family']|lower == 'debian' -%}
  - {{ slsdotpath }}.install-backports-repo
{% endif -%}
  - utils.tools.common.update

{% set pkg = {
    'Debian': {
      'pkg': ['golang-' ~ go_version ~ '-go', 'golang-' ~ go_version ~ '-src',
              'golang-' ~ go_version ~ '-doc'],
      'fromrepo': grains['oscodename'] ~ '-backports',
      'goroot': '/usr/lib/go-' ~ go_version,
    },
    'RedHat': {
      'pkg': ['golang', 'golang-src', 'golang-docs'],
    },
}.get(grains.os_family) -%}

"{{ slsdotpath }}-installed-go-tools":
  pkg.installed:
    - require:
      {% if grains['os_family']|lower == 'debian' -%}
      - sls: {{ slsdotpath }}.install-backports-repo
      {% endif -%}
      - sls: utils.tools.common.update
    {% if pkg.fromrepo is defined -%}
    - refresh: True
    - fromrepo: {{ pkg.fromrepo }}
    {% endif -%}
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs: {{ pkg.pkg|sequence|yaml }}

{% if pkg.goroot is defined -%}
{% for bin in ['go', 'gofmt'] -%}
"{{ slsdotpath }}-linked-go-{{ bin }}":
  file.symlink:
    - require:
      - pkg: "{{ slsdotpath }}-installed-go-tools"
    - name: /usr/bin/{{ bin }}
    - target: {{ pkg.goroot }}/bin/{{ bin }}
    - force: True

{% endfor -%}
{% endif -%}

{% endif -%}
