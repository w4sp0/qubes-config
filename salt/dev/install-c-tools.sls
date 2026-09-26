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
## Fedora doesn't have: cppreference-doc-en-html (C and C++ reference in HTML)
{% set pkg = {
    'Debian': {
      'pkg': ['clangd', 'clang-tidy', 'manpages-dev', 'glibc-doc',
              'cppreference-doc-en-html'],
    },
    'RedHat': {
      'pkg': ['clang-tools-extra', 'man-pages', 'glibc-doc'],
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
