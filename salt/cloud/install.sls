{#
SPDX-FileCopyrightText: 2023 - 2025 wassp <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - utils.tools.common.update
  - utils.tools.zsh
  - cloud.install-repo
  - dev.home-cleanup
  - dotfiles.copy-all
  - sys-ssh-agent.install-client
  - sys-git.install-client
  - sys-aws.install-client

"{{ slsdotpath }}-installed":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
      - sls: {{ slsdotpath }}.install-repo
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - qubes-core-agent-networking # adds internet connectivity
      - qubes-core-agent-passwordless-root
      - ca-certificates
      # - kubernetes1.34-client
      # - k9s
      # - helm
      - git
      - man-db
      - valkey # drop-in replacement for redis-cli
      ## Searching files
      - file
      - tree
      - riprgep
      - fzf
      ## Usability
      - tmux
      - xclip
      - bash-completion
      - tig

{% endif -%}
