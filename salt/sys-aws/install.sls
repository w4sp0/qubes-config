{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - utils.tools.common.update
  - dev.home-cleanup
  - dotfiles.copy-sh
  - dotfiles.copy-x11

"{{ slsdotpath }}-installed":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - qubes-core-agent-networking
      - qubes-core-agent-nautilus
      - ca-certificates
      - socat
      - xdg-utils
      - man-db

"{{ slsdotpath }}-install-rpc-service":
  file.managed:
    - name: /etc/qubes-rpc/qusal.AwsCred
    - source: salt://{{ slsdotpath }}/files/server/rpc/qusal.AwsCred
    - mode: '0755'
    - user: root
    - group: root
    - makedirs: True

"{{ slsdotpath }}-server-bin-dir":
  file.recurse:
    - source: salt://{{ slsdotpath }}/files/server/bin
    - name: /usr/bin
    - file_mode: '0755'
    - user: root
    - group: root

"{{ slsdotpath }}-skel-create-aws-directory":
  file.directory:
    - name: /etc/skel/.aws
    - mode: '0700'
    - user: root
    - group: root
    - makedirs: True

{% endif -%}
