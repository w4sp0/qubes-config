{#
SPDX-FileCopyrightText: 2023 - 2025 Benjamin Grande M. S. <ben.grande.b@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - dev.home-cleanup
  - dotfiles.copy-all

"{{ slsdotpath }}-browser-urlopener":
  file.managed:
    - require:
      - sls: dotfiles.copy-all
    - name: /home/user/.config/sh/profile.d/browser.sh
    - contents: |
        BROWSER="urlopener"
        export BROWSER
    - mode: "0644"
    - user: user
    - group: user
    - makedirs: True

{% endif -%}
