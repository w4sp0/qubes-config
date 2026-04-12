# osint

OSINT environment in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)

## Description

Setup an OSINT (Open Source Intelligence) qube named "osint". Installs tools
for passive reconnaissance, metadata analysis, and open-source intelligence
gathering. The qube has network access for querying public sources.

When OSINT-specific VMs are added to the security lab (reserved range
`10.0.0.63-79`), this qube can connect to them via `qusal.ConnectTCP`
through `sys-tailscale`.

## Installation

*   Top:

```sh
sudo qubesctl top.enable osint
sudo qubesctl --targets=tpl-osint,osint state.apply
sudo qubesctl top.disable osint
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply osint.create
sudo qubesctl --skip-dom0 --targets=tpl-osint state.apply osint.install
sudo qubesctl --skip-dom0 --targets=osint state.apply osint.configure
```

<!-- pkg:end:post-install -->

## Access Control

_Default policy_: `denies` `all` qubes from calling `qusal.ConnectTCP`.

The `osint` qube has standard network access via its `netvm` for querying
public sources. No Qrexec policies are required for basic usage.

When OSINT VMs are added to the security lab, allow connections:

```qrexecpolicy
qusal.ConnectTCP +10.0.0.63+22 osint @default allow target=sys-tailscale
qusal.ConnectTCP *             osint @anyvm   deny
```

## Usage

The `osint` qube is used for:

*   Passive reconnaissance and metadata analysis;
*   Querying public databases and search engines; and
*   Connecting to security lab OSINT VMs when available.

The qube has network access by default. Tools that require API keys should
store them in the qube's persistent private volume (`/home/user`).
