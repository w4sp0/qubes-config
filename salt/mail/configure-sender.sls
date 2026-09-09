{#
SPDX-FileCopyrightText: 2023 - 2024 Benjamin Grande M. S. <ben.grande.b@gmail.com>
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' %}

include:
  - dotfiles.copy-x11
  - dotfiles.copy-sh

"{{ slsdotpath }}-sender-msmtprc":
  file.managed:
    - name: /home/user/.msmtprc.example
    - source: salt://{{ slsdotpath }}/files/sender/msmtprc.example
    - mode: "0600"
    - user: user
    - group: user
    - makedirs: True

"{{ slsdotpath }}-sender-msmtprc-oauth2":
  file.managed:
    - name: /home/user/.msmtprc-oauth2.example
    - source: salt://{{ slsdotpath }}/files/sender/msmtprc-oauth2.example
    - mode: "0600"
    - user: user
    - group: user
    - makedirs: True

"{{ slsdotpath }}-sender-log-dir":
  file.directory:
    - name: /home/user/log
    - mode: "0700"
    - user: user
    - group: user
    - makedirs: True

{% endif -%}
