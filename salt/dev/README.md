# dev

Development environment in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)

## Description

Setup a development qube named "dev". Defines the user interactive shell,
installing goodies, applying dotfiles, being client of sys-pgp, sys-git and
sys-ssh-agent. The qube has no netvm but can reach remote servers if the policy
allows.

## Installation

*   Top:

```sh
sudo qubesctl top.enable dev
sudo qubesctl --targets=tpl-dev,dvm-dev,dev state.apply
sudo qubesctl top.disable dev
proxy_target="$(qusal-report-updatevm-origin)"
if test -n "${proxy_target}"; then
  sudo qubesctl --skip-dom0 --targets="${proxy_target}" state.apply sys-net.install-proxy
fi
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply dev.create
sudo qubesctl --skip-dom0 --targets=tpl-dev state.apply dev.install
sudo qubesctl --skip-dom0 --targets=dvm-dev state.apply dev.configure-dvm
sudo qubesctl --skip-dom0 --targets=dev state.apply dev.configure
proxy_target="$(qusal-report-updatevm-origin)"
if test -n "${proxy_target}"; then
  sudo qubesctl --skip-dom0 --targets="${proxy_target}" state.apply sys-net.install-proxy
fi
```

<!-- pkg:end:post-install -->

If you want some Python goodies, you can install them:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-dev state.apply dev.install-python-tools
```

If you want the latest stable Rust toolchain from upstream (not the
distribution packages), install it with `rustup`:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-dev state.apply dev.install-rust-tools
```

The toolchain is installed in the template under `/opt/rust` and its binaries
are linked to `/usr/bin`. Apply the state again to update it.

Your shell profile keeps `RUSTUP_HOME` and `CARGO_HOME` in your home
directory, so `rustup` sees no toolchain there. Link the toolchain of the
template as your default toolchain, in the qube:

```sh
sudo qubesctl --skip-dom0 --targets=dev state.apply dev.configure-rust-tools
```

If you want a recent Go toolchain, install it from the Debian backports of
the template release, which are signed by the Debian archive key. On Fedora,
the distribution packages are installed:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-dev state.apply dev.install-go-tools
```

If you want Elixir, with the Erlang/OTP documentation:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-dev state.apply dev.install-elixir-tools
```

If you want C tools, with the C library manual pages and the C reference:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-dev state.apply dev.install-c-tools
```

### Offline documentation

The language states also install the offline documentation of the language.
Read it in the terminal with `devdoc`. Without a topic, it lets you pick one
with `fzf`. With `-b`, it browses the HTML manual with `w3m`:

```sh
devdoc go fmt.Println
devdoc rust Vec::push
devdoc python json.loads
devdoc c printf
devdoc elixir Enum.map/2
devdoc go
devdoc -b rust
```

In Vim, in Go, Rust, Python, C and Elixir buffers, `K` shows the
documentation of the name under the cursor, with its qualifier, such as
`fmt.Println`. `:Doc TOPIC` shows a topic and `:DocBrowse` browses the manual.

If you want to lint this repository and build its RPM packages, install the
tooling the `pre-commit` hooks and the `scripts/` call:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-dev state.apply dev.install-qusal
```

The installation will make the Qusal TCP Proxy available in the `updatevm`
(after it is restarted in case it is template based). If you want to have the
proxy available on a `netvm` that is not deployed by Qusal, install the Qusal
TCP proxy on the templates of your `netvm`:

```sh
sudo qubesctl --skip-dom0 --targets=TEMPLATE state.apply sys-net.install-proxy
```

Remember to restart the `netvms` after the proxy installation for the changes
to take effect.

## Access Control

_Default policy_: `denies` `all` qubes from calling `qusal.ConnectTCP`

Allow qube `dev` to `connect` to `github.com:22` via `disp-sys-net` but not to
any other host or via any other qube:

```qrexecpolicy
qusal.ConnectTCP +github.com+22 dev @default allow target=disp-sys-net
qusal.ConnectTCP *              dev @anyvm   deny
```

## Usage

The development qube `dev` can be used for:

*   code development;
*   building programs;
*   signing commits, tags, pushes and verifying with split-gpg;
*   fetching and pushing to and from local qube repository with split-git; and
*   fetching and pushing to and from remote repository with split-ssh-agent
    and without direct network connection, you can open port to the desired
    SSH or HTTP server.

As the `dev` qube has no netvm, configure the Qrexec policy to allow or ask
calls to the `qusal.ConnectTCP` RPC service, so the qube can communicate with
a remote repository for example.
