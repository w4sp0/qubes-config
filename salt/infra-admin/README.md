# infra-admin

Infrastructure administration environment in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)

## Description

Setup an infrastructure administration qube named "infra-admin". Installs
tools for managing the homelab Proxmox cluster and Kubernetes infrastructure:
`talosctl`, `kubectl`, `tofu`, `ansible`, `ssh`. The qube has no direct
network access; it reaches the homelab network (`10.0.0.0/24`) via
`sys-tailscale` and the `qusal.ConnectTCP` RPC service.

The qube is a client of `sys-pgp`, `sys-git` and `sys-ssh-agent`. It pulls
infrastructure repositories from `sys-git` and authenticates to remote hosts
via split-ssh-agent. The step-ca root CA certificate is installed for TLS
trust to `*.homelab.internal` services.

This qube is intended for use alongside the
[Privileged Access Workstation](../../spec.md#lenovo-nixos--privileged-access-workstation-paw)
(PAW). Administrative operations that require full infrastructure access
should be performed from the PAW. The `infra-admin` qube is for development
and staging operations only.

## Installation

*   Top:

```sh
sudo qubesctl top.enable infra-admin
sudo qubesctl --targets=tpl-infra-admin,infra-admin state.apply
sudo qubesctl top.disable infra-admin
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply infra-admin.create
sudo qubesctl --skip-dom0 --targets=tpl-infra-admin state.apply infra-admin.install
sudo qubesctl --skip-dom0 --targets=infra-admin state.apply infra-admin.configure
```

<!-- pkg:end:post-install -->

Install the step-ca root CA certificate for TLS trust:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-infra-admin state.apply step-ca-trust.install
```

## Access Control

_Default policy_: `denies` `all` qubes from calling `qusal.ConnectTCP`.

The `infra-admin` qube requires access to the homelab network for managing
infrastructure. All connections go through `sys-tailscale` via the
`qusal.ConnectTCP` RPC service.

Allow qube `infra-admin` to connect to the Kubernetes API VIP and Proxmox
management interfaces via `sys-tailscale`:

```qrexecpolicy
qusal.ConnectTCP +10.0.0.20+6443 infra-admin @default allow target=sys-tailscale
qusal.ConnectTCP +10.0.0.2+8006  infra-admin @default allow target=sys-tailscale
qusal.ConnectTCP +10.0.0.3+8006  infra-admin @default allow target=sys-tailscale
qusal.ConnectTCP +10.0.0.4+8006  infra-admin @default allow target=sys-tailscale
qusal.ConnectTCP *               infra-admin @anyvm   deny
```

Allow `infra-admin` to fetch and push to `sys-git`:

```qrexecpolicy
qusal.GitFetch * infra-admin @default allow target=sys-git
qusal.GitPush  * infra-admin @default allow target=sys-git
qusal.GitInit  * infra-admin @default deny
qusal.GitFetch * infra-admin @anyvm   deny
qusal.GitPush  * infra-admin @anyvm   deny
qusal.GitInit  * infra-admin @anyvm   deny
```

## Usage

The `infra-admin` qube is used for:

*   Managing Talos Linux Kubernetes clusters with `talosctl` and `kubectl`;
*   Provisioning Proxmox VMs and LXCs with `tofu`;
*   Running Ansible playbooks for cluster orchestration; and
*   SSH access to infrastructure nodes via split-ssh-agent.

Pull the homelab infrastructure repository from `sys-git`:

```sh
git clone qrexec://@default/homelab.git ~/src/homelab
```

Infrastructure tools are version-managed by [mise](https://mise.jdx.dev/).
After cloning, install pinned tool versions:

```sh
cd ~/src/homelab/ha-k8s-proxmox
mise install
```
