{#
SPDX-FileCopyrightText: 2023 - 2025 Benjamin Grande M. S. <ben.grande.b@gmail.com>
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - utils.tools.common.update

"{{ slsdotpath }}-installed-c-tools":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - cmake
      - cscope
      - cppcheck

## Fedora ships clangd and clang-tidy in clang-tools-extra.
{% set pkg = {
    'Debian': {
      'pkg': ['clangd', 'clang-tidy', 'manpages-dev'],
    },
    'RedHat': {
      'pkg': ['clang-tools-extra', 'man-pages'],
    },
}.get(grains.os_family) -%}

"{{ slsdotpath }}-installed-c-tools-os-specific":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs: {{ pkg.pkg|sequence|yaml }}

{% endif %}
