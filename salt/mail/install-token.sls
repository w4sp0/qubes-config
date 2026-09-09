{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' %}

include:
  - utils.tools.common.update
  - dotfiles.copy-x11
  - dotfiles.copy-sh

"{{ slsdotpath }}-token-installed":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - skip_suggestions: True
    - install_recommends: False
    - setopt: "install_weak_deps=False"
    - pkgs:
      - qubes-core-agent-networking
      - ca-certificates
      - python3
      - man-db

"{{ slsdotpath }}-token-bin":
  file.recurse:
    - name: /usr/bin
    - source: salt://{{ slsdotpath }}/files/token/bin
    - file_mode: "0755"
    - user: root
    - group: root

"{{ slsdotpath }}-token-rpc":
  file.managed:
    - name: /etc/qubes-rpc/qusal.MailToken
    - source: salt://{{ slsdotpath }}/files/token/rpc/qusal.MailToken
    - mode: "0755"
    - user: root
    - group: root
    - makedirs: True

{% endif -%}
