{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - utils.tools.common.update

"{{ slsdotpath }}-client-installed":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - qubes-core-agent-networking
      - ca-certificates
      - man-db

"{{ slsdotpath }}-client-credential-helper":
  file.recurse:
    - source: salt://{{ slsdotpath }}/files/client/bin
    - name: /usr/bin
    - file_mode: '0755'
    - user: root
    - group: root

"{{ slsdotpath }}-client-skel-create-aws-directory":
  file.directory:
    - name: /etc/skel/.aws
    - mode: '0700'
    - user: root
    - group: root
    - makedirs: True

{% endif -%}
