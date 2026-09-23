# otee-embedded

Development environment in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)

## Description

Setup a development qube named "otee-embedded". Defines the user interactive
shell, installing goodies, applying dotfiles, being client of sys-pgp, sys-git
and sys-ssh-agent. The qube has no netvm but can reach remote servers if the policy
allows.

## Installation

*   Top:

```sh
sudo qubesctl top.enable otee-embedded
sudo qubesctl --targets=tpl-otee-embedded,dvm-otee-embedded,otee-embedded state.apply
sudo qubesctl top.disable otee-embedded
proxy_target="$(qusal-report-updatevm-origin)"
if test -n "${proxy_target}"; then
  sudo qubesctl --skip-dom0 --targets="${proxy_target}" state.apply sys-net.install-proxy
fi
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply otee-embedded.create
sudo qubesctl --skip-dom0 --targets=tpl-otee-embedded state.apply otee-embedded.install
sudo qubesctl --skip-dom0 --targets=dvm-otee-embedded state.apply otee-embedded.configure-dvm
sudo qubesctl --skip-dom0 --targets=otee-embedded state.apply otee-embedded.configure
proxy_target="$(qusal-report-updatevm-origin)"
if test -n "${proxy_target}"; then
  sudo qubesctl --skip-dom0 --targets="${proxy_target}" state.apply sys-net.install-proxy
fi
```

<!-- pkg:end:post-install -->

The template gets the same tooling as the `dev` template (`dev.install-common`)
plus the C tools (`dev.install-c-tools`) and the latest stable Rust toolchain
from upstream (`dev.install-rust-tools`). The Rust toolchain is installed in
the template under `/opt/rust` and its binaries are linked to `/usr/bin`. Apply
the `install` state again to update it.

If you want some Python goodies, you can install them:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-otee-embedded state.apply dev.install-python-tools
```

## Access Control

_Default policy_: `denies` `all` qubes from calling `qusal.ConnectTCP`

Allow qube `otee-embedded` to `connect` to `github.com:22` via `disp-sys-net`
but not to any other host or via any other qube:

```qrexecpolicy
qusal.ConnectTCP +github.com+22 otee-embedded  @default allow target=disp-sys-net
qusal.ConnectTCP *              otee-embedded  @anyvm   deny
```

## Usage

The development qube `otee-embedded` can be used for:

*   everything the `dev` qube can do; and
*   contributing to OTee's embedded systems repository.

As the `otee-embedded` qube has no netvm, configure the Qrexec policy to allow
or ask calls to the `qusal.ConnectTCP` RPC service, so the qube can communicate
with a remote repository for example.
