{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - utils.tools.common.update

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
      - curl
      - git
      - golang-go
      - tar
      - gzip
      - unzip

"{{ slsdotpath }}-install-binary-script":
  file.managed:
    - name: /usr/bin/qusal-install-binary
    - source: salt://{{ slsdotpath }}/files/builder/bin/qusal-install-binary
    - mode: '0755'
    - user: root
    - group: root

{% endif -%}
