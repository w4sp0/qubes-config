{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{#
Install Elixir and the Erlang/OTP documentation. The Elixir modules carry
their documentation, which 'h' in 'iex' prints offline.
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - utils.tools.common.update

{% set pkg = {
    'Debian': {
      'pkg': ['elixir', 'erlang-doc'],
    },
    'RedHat': {
      'pkg': ['elixir', 'elixir-doc', 'erlang-doc'],
    },
}.get(grains.os_family) -%}

"{{ slsdotpath }}-installed-elixir-tools":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs: {{ pkg.pkg|sequence|yaml }}

{% endif -%}
