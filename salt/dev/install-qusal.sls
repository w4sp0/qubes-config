{#
SPDX-FileCopyrightText: 2023 - 2025 Benjamin Grande M. S. <ben.grande.b@gmail.com>
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{#
Tooling needed to lint this repository, that is, every program the
'pre-commit' hooks and the scripts under 'scripts/' call. What is not
listed here comes from 'dev.install-common' (gitlint, shellcheck, mdl,
file, fd) and from 'dev.install-python-tools' (pylint, python3-pip).
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - utils.tools.common.update
  - {{ slsdotpath }}.install-common
  - {{ slsdotpath }}.install-python-tools

"{{ slsdotpath }}-installed-qusal":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - yamllint
      - codespell
      - pre-commit
      - reuse

## Fedora packages salt-lint, Debian does not, install it with pipx there.
{% set pkg = {
    'Debian': {
      'pkg': ['pipx'],
    },
    'RedHat': {
      'pkg': ['salt-lint'],
    },
}.get(grains.os_family) -%}

"{{ slsdotpath }}-installed-qusal-os-specific":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs: {{ pkg.pkg|sequence|yaml }}

{% if grains['os_family'] == 'Debian' %}
"{{ slsdotpath }}-installed-qusal-salt-lint":
  cmd.run:
    - require:
      - pkg: "{{ slsdotpath }}-installed-qusal-os-specific"
    - name: pipx install --global salt-lint
    - runas: root
    - unless: command -v salt-lint
{% endif %}

{% endif -%}
