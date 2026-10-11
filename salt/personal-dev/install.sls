{#
SPDX-FileCopyrightText: 2023 - 2024 Benjamin Grande M. S. <ben.grande.b@gmail.com>
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - dev.install-common
  - dev.install-c-tools
  - dev.install-rust-tools
  - dev.install-go-tools
  - dev.install-python-tools

"{{ slsdotpath }}-installed":
  pkg.installed:
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - check
      - libsubunit-dev
      - valgrind
      - libmbedtls-dev
      - libssl-dev
      - libwebsockets-dev
      - zlib1g-dev
      - gdb

{% endif -%}
