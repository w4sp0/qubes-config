# discord

Discord terminal client in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)
    *   [Update discordo](#update-discordo)

## Description

Creates an app qube named "discord" with
[discordo](https://github.com/ayn2op/discordo), a Discord client for the
terminal. discordo has no releases, so a disposable of the
[builder](../builder/README.md) formula builds a pinned commit, and the
template "tpl-discord" installs the result only if its SHA-256 matches the
pin in `binaries.jinja`.

discordo is an unofficial client. Discord can suspend accounts that use
unofficial clients.

## Installation

The [builder](../builder/README.md) formula must be installed.

*   Top:

```sh
sudo qubesctl top.enable discord
sudo qubesctl --targets=tpl-discord,discord state.apply
sudo qubesctl top.disable discord
sudo qubesctl state.apply discord.install-binary
sudo qubesctl state.apply discord.appmenus
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply discord.create
sudo qubesctl --skip-dom0 --targets=tpl-discord state.apply discord.install
sudo qubesctl state.apply discord.install-binary
sudo qubesctl --skip-dom0 --targets=discord state.apply discord.configure
sudo qubesctl state.apply discord.appmenus
```

<!-- pkg:end:post-install -->

The state `discord.install-binary` runs in Dom0 after `discord.install`,
because the template needs the pin and the Qrexec service first.

## Access Control

_Default policy_: `denies` `all` qubes from calling `qusal.InstallBinary`

Allow disposables of `dvm-builder` to install `discordo` in `tpl-discord`:

```qrexecpolicy
qusal.InstallBinary +discordo @dispvm:dvm-builder tpl-discord allow user=root
qusal.InstallBinary +discordo @anyvm              @anyvm      deny
```

## Usage

Open a terminal in the qube `discord` and run `discordo`.

### Update discordo

1.  Set `commit` in `salt/discord/binaries.jinja` to the new commit hash.
2.  Get the SHA-256 of the build output, as described in
    [builder](../builder/README.md#get-the-pin-of-a-go-build), with:
    `go discordo https://github.com/ayn2op/discordo.git COMMIT . go1.27.0`.
    Change the toolchain if the `go` line of `go.mod` changed.
3.  Set `sha256` to the value and apply `discord.install` and
    `discord.install-binary` again.
