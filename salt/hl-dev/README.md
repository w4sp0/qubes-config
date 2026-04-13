# hl-dev

Homelab development environment in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)

## Description

Setup a homelab development qube named "hl-dev". Extends the base
[dev](../dev/README.md) formula with homelab-specific tooling and
connectivity. The qube is a client of `sys-pgp`, `sys-git` and
`sys-ssh-agent`. It has no direct network access; it reaches GitHub and
Gitea via `qusal.ConnectTCP` through `sys-tailscale`.

The step-ca root CA certificate is installed for TLS trust to
`*.homelab.internal` services.

The qube participates in the
[three-tier git workflow](../../spec.md#git-workflow):

```
hl-dev --> sys-git --> GitHub (source of truth)
                           |
                           v (auto-mirror)
                       Gitea (local, gitea.homelab.internal)
```

`hl-dev` pushes to `sys-git` via Qrexec. `sys-git` pushes to GitHub.
Gitea mirrors from GitHub automatically.

<!-- TODO: pushes to GitHub/Gitea are not possible through sys-git alone,
     sys-git only serves as an inter-qube git server. A separate mechanism
     is needed for sys-git to push to GitHub (e.g. sys-git with netvm
     access to GitHub via qusal.ConnectTCP, or a cron job in a networked
     qube that pulls from sys-git and pushes to GitHub). -->

## Installation

Requires the [dev](../dev/README.md) formula to be installed first.

*   Top:

```sh
sudo qubesctl top.enable hl-dev
sudo qubesctl --targets=tpl-hl-dev,dvm-hl-dev,hl-dev state.apply
sudo qubesctl top.disable hl-dev
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply hl-dev.create
sudo qubesctl --skip-dom0 --targets=tpl-hl-dev state.apply hl-dev.install
sudo qubesctl --skip-dom0 --targets=dvm-hl-dev state.apply hl-dev.configure-dvm
sudo qubesctl --skip-dom0 --targets=hl-dev state.apply hl-dev.configure
```

<!-- pkg:end:post-install -->

Install the step-ca root CA certificate for TLS trust:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-hl-dev state.apply step-ca-trust.install
```

## Access Control

_Default policy_: `denies` `all` qubes from calling `qusal.ConnectTCP`.

Allow qube `hl-dev` to connect to `github.com:22` and
`gitea.homelab.internal` via `sys-tailscale`:

```qrexecpolicy
qusal.ConnectTCP +github.com+22          hl-dev @default allow target=sys-tailscale
qusal.ConnectTCP +10.0.0.14+22           hl-dev @default allow target=sys-tailscale
qusal.ConnectTCP +10.0.0.14+3000         hl-dev @default allow target=sys-tailscale
qusal.ConnectTCP *                       hl-dev @anyvm   deny
```

Allow `hl-dev` to fetch and push to `sys-git`, but deny init:

```qrexecpolicy
qusal.GitFetch * hl-dev @default allow target=sys-git
qusal.GitPush  * hl-dev @default ask   target=sys-git default_target=sys-git
qusal.GitInit  * hl-dev @default ask   target=sys-git default_target=sys-git
qusal.GitFetch * hl-dev @anyvm   deny
qusal.GitPush  * hl-dev @anyvm   deny
qusal.GitInit  * hl-dev @anyvm   deny
```

## Usage

The `hl-dev` qube is used for:

*   Homelab infrastructure code development (Terraform, Ansible, Talos patches);
*   Signing commits, tags and pushes with split-gpg;
*   Fetching and pushing to the local `sys-git` repository with split-git;
*   Fetching and pushing to GitHub via split-ssh-agent without direct
    network access; and
*   Accessing Gitea at `gitea.homelab.internal` for code review and CI status.

Clone the homelab repository from `sys-git`:

```sh
git clone qrexec://@default/homelab.git ~/src/homelab
```

Add GitHub as a secondary remote for direct pushes when the `qusal.ConnectTCP`
policy allows:

```sh
cd ~/src/homelab
git remote add github git@github.com:USER/homelab.git
```
