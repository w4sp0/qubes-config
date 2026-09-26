{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{#
Make the system wide Rust toolchain of the template, installed by
'dev.install-rust-tools', the default toolchain of the user's rustup, so
'rustup' works with 'RUSTUP_HOME' in the home directory. The link is kept in
the home directory and follows the toolchain when the template updates it.
Components and targets are still added in the template.

'RUSTUP_HOME' is the one set by the user's shell profile, as Salt does not
read it.
#}

{% if grains['nodename'] != 'dom0' -%}

{%- from 'dev/rust.jinja' import toolchain, toolchain_link with context -%}
{% set user_rustup_home = '/home/user/.local/share/rustup' -%}

"{{ slsdotpath }}-linked-rust-template-toolchain":
  cmd.run:
    - env:
      - RUSTUP_HOME: {{ user_rustup_home }}
    - runas: user
    - name: |
        set -eu
        test -x {{ toolchain }}/bin/rustc
        rm -f -- {{ user_rustup_home }}/toolchains/{{ toolchain_link }}
        rustup toolchain link {{ toolchain_link }} {{ toolchain }}
        rustup default {{ toolchain_link }}
    - unless: |
        test "$(readlink -- {{ user_rustup_home }}/toolchains/{{ toolchain_link }})" = "{{ toolchain }}" &&
        rustup default | grep -q -- '^{{ toolchain_link }}'

{% endif -%}
