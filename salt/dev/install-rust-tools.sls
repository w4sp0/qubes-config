{#
SPDX-FileCopyrightText: 2025 - 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{#
Install the latest stable Rust toolchain with rustup instead of the
distribution packages, which lag behind upstream.

The toolchain lives in the template under '/opt/rust' so every qube based on
it gets it. The user's shell profile points 'RUSTUP_HOME' and 'CARGO_HOME' to
the home directory, which would hide a system wide rustup installation, thus
the toolchain binaries are linked to '/usr/bin' instead of exposing the rustup
proxies. Not to '/usr/local/bin', as qubes based on the template have their
own '/usr/local' on the private volume. 'CARGO_HOME' keeps pointing to the
home directory, so the registry cache and 'cargo install' stay per user.

The download goes through the Qubes update proxy, which is only reachable
from templates, so apply the state to a template.

Apply the state again to update the toolchain.
#}

{% if grains['nodename'] != 'dom0' -%}

{% set rustup_home = '/opt/rust/rustup' -%}
{% set cargo_home = '/opt/rust/cargo' -%}
{% set triple = grains['cpuarch'] ~ '-unknown-linux-gnu' -%}
{% set toolchain_bin = rustup_home ~ '/toolchains/stable-' ~ triple ~ '/bin' -%}
{% set rustup_url = 'https://static.rust-lang.org/rustup/dist/' ~ triple ~ '/rustup-init' -%}
{% set rust_env = [
    {'RUSTUP_HOME': rustup_home},
    {'CARGO_HOME': cargo_home},
    {'https_proxy': 'http://127.0.0.1:8082'},
  ] -%}

include:
  - utils.tools.common.update

{% set pkg = {
    'Debian': {
      'pkg': ['build-essential', 'pkg-config', 'libssl-dev'],
    },
    'RedHat': {
      'pkg': ['gcc', 'pkgconf-pkg-config', 'openssl-devel'],
    },
}.get(grains.os_family) -%}

"{{ slsdotpath }}-installed-rust-deps":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - ca-certificates
      - curl

"{{ slsdotpath }}-installed-rust-deps-os-specific":
  pkg.installed:
    - require:
      - sls: utils.tools.common.update
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs: {{ pkg.pkg|sequence|yaml }}

"{{ slsdotpath }}-installed-rustup":
  cmd.run:
    - require:
      - pkg: "{{ slsdotpath }}-installed-rust-deps"
      - pkg: "{{ slsdotpath }}-installed-rust-deps-os-specific"
    - env: {{ rust_env|yaml }}
    - creates: {{ cargo_home }}/bin/rustup
    - name: |
        set -eu
        tmp="$(mktemp -d)"
        trap 'rm -rf -- "${tmp}"' EXIT
        for suffix in "" .sha256; do
          curl --location \
            --connect-timeout 10 \
            --tlsv1.2 --proto =https \
            --fail --no-progress-meter --show-error \
            --output "${tmp}/rustup-init${suffix}" \
            -- "{{ rustup_url }}${suffix}"
        done
        hash="$(cut -d " " -f1 -- "${tmp}/rustup-init.sha256")"
        printf '%s  %s\n' "${hash}" "${tmp}/rustup-init" | sha256sum --check --strict
        chmod 0755 -- "${tmp}/rustup-init"
        "${tmp}/rustup-init" -y --no-modify-path \
          --profile default --default-toolchain stable \
          --component rust-analyzer --component rust-src

"{{ slsdotpath }}-updated-rust":
  cmd.run:
    - require:
      - cmd: "{{ slsdotpath }}-installed-rustup"
    - env: {{ rust_env|yaml }}
    - name: |
        set -eu
        {{ cargo_home }}/bin/rustup self update
        {{ cargo_home }}/bin/rustup update stable
        {{ cargo_home }}/bin/rustup default stable

{% for bin in ['cargo', 'cargo-clippy', 'cargo-fmt', 'clippy-driver',
               'rust-analyzer', 'rust-gdb', 'rust-gdbgui', 'rust-lldb',
               'rustc', 'rustdoc', 'rustfmt'] -%}
"{{ slsdotpath }}-linked-rust-{{ bin }}":
  file.symlink:
    - require:
      - cmd: "{{ slsdotpath }}-updated-rust"
    - name: /usr/bin/{{ bin }}
    - target: {{ toolchain_bin }}/{{ bin }}
    - force: True

{% endfor -%}

{% endif -%}
