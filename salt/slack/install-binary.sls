{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{%- import slsdotpath ~ "/binaries.jinja" as binaries -%}
{%- from 'utils/macros/install-binary.sls' import install_binary -%}

{{ install_binary(binaries.slack_tui, 'tpl-' ~ slsdotpath) }}
