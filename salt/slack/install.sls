{#
SPDX-FileCopyrightText: 2023 - 2025 Benjamin Grande M. S. <ben.grande.b@gmail.com>
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

{%- import slsdotpath ~ "/binaries.jinja" as binaries -%}
{%- from 'utils/macros/install-binary.sls' import install_binary_pin %}

include:
  - utils.tools.common.update
  - dotfiles.copy-x11
  - builder.install-target

"{{ slsdotpath }}-installed":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - qubes-core-agent-networking
      - ca-certificates
      - xclip

## The binary itself is sent by the dom0 state 'slack.install-binary'.
{{ install_binary_pin(binaries.slack_tui) }}

{% endif -%}
