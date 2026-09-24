# slack

Slack terminal client in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)
    *   [Sign in](#sign-in)
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

Open a terminal in the qube `slack` and run `slack-tui`. Run
`slack-tui doctor` to check the setup and the tokens.

Keys: `j`/`k` move, `Tab` or `h`/`l` change the pane, `i` writes, `Enter`
opens a thread, `r` replies, `/` finds, `s` searches the workspace, `Ctrl-K`
opens the command palette and `?` shows the help.

### Sign in

slack-tui signs in with its own Slack app, created from a manifest in the
work workspace. The built-in app of slack-tui cannot be used, because an app
that Slack does not distribute can only be installed in the workspace that
owns it. If the workspace requires admin approval of apps, get it first.

The redirect after sign-in goes to `http://localhost:9899/callback`, but the
browser runs in a disposable, so the redirect fails there and you send the
URL to the qube `slack`. Do all browser steps in one disposable, so that you
sign in to Slack only once.

1.  In the qube `slack`, run `slack-tui setup`. It copies the app manifest
    to the clipboard of the qube.
2.  Open the menu item `dvm-browser (dvm): Browser`, and keep this
    disposable open until the end.
3.  In the disposable, sign in to the work Slack at
    `https://slack.com/signin` (workspace URL, then SSO or email, and 2FA).
4.  In the same disposable, open `https://api.slack.com/apps`, select
    `Create New App`, `From a manifest` and the work workspace, and paste
    the manifest with the Qubes clipboard (`Ctrl+Shift+C` in `slack`,
    `Ctrl+Shift+V` then `Ctrl+V` in the disposable).
5.  Copy the Client ID of the new app to the prompt of `slack-tui setup` in
    the same way.
6.  When `slack-tui setup` shows the sign-in URL, paste it in the address
    bar of the disposable and allow the app. The browser then fails to open
    `http://localhost:PORT/callback?code=...`. This is expected.
7.  Copy that URL from the address bar, and in a second terminal in the
    qube `slack`, while `slack-tui setup` waits, run:

    ```sh
    curl 'http://localhost:PORT/callback?code=...&state=...'
    ```

    Keep the single quotes. The code is valid only once and for a short
    time. If it fails, run `slack-tui setup` again.

The tokens are stored in `~/.config/slack-tui/tokens.json` in the qube
`slack`. They expire after about 12 hours and slack-tui renews them. To add
another workspace, use `slack-tui login` with the same steps.

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
