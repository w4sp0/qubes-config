{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' %}

include:
  - dotfiles.copy-x11
  - dotfiles.copy-sh

"{{ slsdotpath }}-token-config-dir":
  file.directory:
    - name: /home/user/.config/qusal
    - mode: "0700"
    - user: user
    - group: user
    - makedirs: True

"{{ slsdotpath }}-token-mail-token.conf.example":
  file.managed:
    - require:
      - file: "{{ slsdotpath }}-token-config-dir"
    - name: /home/user/.config/qusal/mail-token.conf.example
    - source: salt://{{ slsdotpath }}/files/token/mail-token.conf.example
    - mode: "0600"
    - user: user
    - group: user
    - makedirs: True

{% endif -%}
