# builder

Install pinned binaries that are not packaged in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)
    *   [Add a binary to a formula](#add-a-binary-to-a-formula)
    *   [Get the pin of a Go build](#get-the-pin-of-a-go-build)

## Description

Creates the Template for DispVMs "dvm-builder". A disposable based on it
downloads a pinned release, or builds a pinned git commit with Go, and sends
the binary to a template with the `qusal.InstallBinary` Qrexec service. The
template installs the binary to `/usr/bin` only if its SHA-256 matches the
pin that the formula wrote in the template. The template does not trust the
disposable, and the binary never passes through Dom0.

Templates get no compilers and no extra Update Proxy access, because the
download and the build happen in the disposable.

This formula is not the same as `utils.tools.builder`, which installs
packaging tools.

## Installation

*   Top:

```sh
sudo qubesctl top.enable builder
sudo qubesctl --targets=tpl-builder state.apply
sudo qubesctl top.disable builder
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply builder.create
sudo qubesctl --skip-dom0 --targets=tpl-builder state.apply builder.install
```

<!-- pkg:end:post-install -->

Formulas that use a builder include `builder.install-target` in the state of
their template.

## Access Control

_Default policy_: `denies` `all` qubes from calling `qusal.InstallBinary`

Each formula allows disposables of `dvm-builder` to send one named binary to
its own template, for example:

```qrexecpolicy
qusal.InstallBinary +discordo @dispvm:dvm-builder tpl-discord allow user=root
qusal.InstallBinary +discordo @anyvm              @anyvm      deny
```

## Usage

### Add a binary to a formula

Follow the instructions in `salt/utils/macros/install-binary.sls`. In short:

1.  Add the pin to `salt/FORMULA/binaries.jinja`.
2.  Call `install_binary_pin` in the template state and include
    `builder.install-target`.
3.  Call `install_binary` in a Dom0 state.
4.  Add the policy lines to `salt/FORMULA/files/admin/policy/default.policy`.

To update a binary, change its pin. The Dom0 state does nothing while the
template has a binary with the pinned SHA-256.

### Get the pin of a Go build

A Go build with a fixed toolchain, `CGO_ENABLED=0`, `-trimpath` and
`-buildvcs=false` is expected to give the same output each time. Run the
build in two disposables and compare the output:

```sh
for i in 1 2; do
  qvm-run --dispvm=dvm-builder --pass-io --no-gui -- \
    'qusal-install-binary hash go NAME REPO COMMIT PACKAGE TOOLCHAIN'
done
```

If the two SHA-256 values are equal, use the value as the pin. If they are
not equal, the build is not reproducible and cannot be pinned this way.
