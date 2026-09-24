# slack

Slack terminal client in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)
    *   [Get the pin of slack-tui](#get-the-pin-of-slack-tui)
    *   [Update slack-tui](#update-slack-tui)

## Description

Creates an app qube named "slack" for work Slack with
[slack-tui](https://github.com/kurenn/slack-tui), a Slack client for the
terminal. A disposable of the [builder](../builder/README.md) formula
downloads a pinned release, and the template "tpl-slack" installs the binary
only if its SHA-256 matches the pin in `binaries.jinja`.

slack-tui is an unofficial client, and its Slack app asks for broad user
scopes. Check that the workspace allows the app before you sign in. The qube
holds only work Slack data.

## Installation

The [builder](../builder/README.md) formula must be installed, and `sha256`
in `binaries.jinja` must be set, see
[Get the pin of slack-tui](#get-the-pin-of-slack-tui).

*   Top:

```sh
sudo qubesctl top.enable slack
sudo qubesctl --targets=tpl-slack,slack state.apply
sudo qubesctl top.disable slack
sudo qubesctl state.apply slack.install-binary
sudo qubesctl state.apply slack.appmenus
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply slack.create
sudo qubesctl --skip-dom0 --targets=tpl-slack state.apply slack.install
sudo qubesctl state.apply slack.install-binary
sudo qubesctl --skip-dom0 --targets=slack state.apply slack.configure
sudo qubesctl state.apply slack.appmenus
```

<!-- pkg:end:post-install -->

The state `slack.install-binary` runs in Dom0 after `slack.install`, because
the template needs the pin and the Qrexec service first. Restart the qube
`slack` afterwards, as it gets the new binary from the template only at
start.

## Access Control

_Default policy_: `denies` `all` qubes from calling `qusal.InstallBinary`

Allow disposables of `dvm-builder` to install `slack-tui` in `tpl-slack`:

```qrexecpolicy
qusal.InstallBinary +slack-tui @tag:qusal-builder  tpl-slack allow user=root
qusal.InstallBinary +slack-tui @anyvm              @anyvm    deny
```

## Usage

Open a terminal in the qube `slack` and run `slack-tui`.

### Get the pin of slack-tui

The disposable checks the download against `url_sha256`, then prints the
SHA-256 of the binary. Run it in Dom0 with the values of `binaries.jinja`:

```sh
qvm-run --dispvm=dvm-builder --pass-io --no-gui -- \
  'qusal-install-binary hash release slack-tui URL URL_SHA256 slack-tui'
```

Set `sha256` in `salt/slack/binaries.jinja` to the value.

### Update slack-tui

1.  Set the new version in `url` in `salt/slack/binaries.jinja`.
2.  Set `url_sha256` to the line of the archive in the `checksums.txt` of
    the release.
3.  Get the new `sha256` as described in
    [Get the pin of slack-tui](#get-the-pin-of-slack-tui).
4.  Apply `slack.install` and `slack.install-binary` again, then restart
    the qube `slack`.
