{#
SPDX-FileCopyrightText: 2023 - 2025 Benjamin Grande M. S. <ben.grande.b@gmail.com>
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - utils.tools.common.update

"{{ slsdotpath }}-installed-python-tools":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - python3-setuptools
      - python3-pytest
      - python3-pip
      - python3-mypy
      - black
      - pylint

{% set pkg = {
    'Debian': {
        'pkg': ['python3-dev', 'python3-venv', 'python3-doc'],
      },
    'RedHat': {
        'pkg': ['python3-devel', 'python3-docs'],
      },
  }.get(grains.os_family) -%}

"{{ slsdotpath }}-installed-python-tools-os-specific":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs: {{ pkg.pkg|sequence|yaml }}

{% endif %}
