{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later

Receive pinned binaries from builder disposables. Apply to each template
that gets a binary with 'utils/macros/install-binary.sls'.
#}

{% if grains['nodename'] != 'dom0' -%}

"{{ slsdotpath }}-install-target-rpc":
  file.managed:
    - name: /etc/qubes-rpc/qusal.InstallBinary
    - source: salt://{{ slsdotpath }}/files/target/rpc/qusal.InstallBinary
    - mode: '0755'
    - user: root
    - group: root
    - makedirs: True

"{{ slsdotpath }}-install-target-pin-dir":
  file.directory:
    - name: /etc/qusal-install-binary
    - mode: '0755'
    - user: root
    - group: root
    - makedirs: True

{% endif -%}
