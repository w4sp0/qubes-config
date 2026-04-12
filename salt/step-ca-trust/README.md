# step-ca-trust

Internal CA root certificate trust in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Usage](#usage)

## Description

Distributes the [step-ca](https://smallstep.com/docs/step-ca/) root CA
certificate to qubes that need TLS trust for `*.homelab.internal` services.
The certificate is installed into the system trust store of the target
template, so all qubes based on that template inherit the trust.

The step-ca instance runs in an LXC on pve0 at `ca.homelab.internal`
(`10.0.0.10`). It provides ACME-capable certificate issuance for all
internal services.

Target templates:

| Template | Qubes using it | Reason |
|----------|----------------|--------|
| `tpl-infra-admin` | `infra-admin` | Connects to Proxmox, Kubernetes, Gitea over TLS |
| `tpl-dev` | `dev`, `dvm-dev` | Connects to Gitea, internal APIs over TLS |

## Installation

The root CA certificate must first be copied to dom0. Retrieve it from a
qube that has network access to `ca.homelab.internal`:

```sh
qube="CHANGEME"  # qube with access to ca.homelab.internal
qvm-run --no-gui --pass-io -- "${qube}" \
  "step ca root --ca-url https://ca.homelab.internal" \
  | tee /tmp/homelab-root-ca.pem >/dev/null
```

Verify the certificate fingerprint matches the one recorded during step-ca
provisioning before proceeding.

*   Top:

```sh
sudo qubesctl top.enable step-ca-trust
sudo qubesctl --targets=tpl-infra-admin,tpl-dev state.apply
sudo qubesctl top.disable step-ca-trust
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply step-ca-trust.create
sudo qubesctl --skip-dom0 --targets=tpl-infra-admin,tpl-dev state.apply step-ca-trust.install
```

<!-- pkg:end:post-install -->

## Usage

After installation, qubes based on the target templates trust certificates
issued by the homelab step-ca instance. No additional configuration is needed
in individual qubes.

To verify trust is working from a qube:

```sh
curl -s https://gitea.homelab.internal
```

If the step-ca root certificate is rotated, rerun the installation to
distribute the new certificate.

To add trust to additional templates, add them to the `--targets` list and
rerun the state:

```sh
sudo qubesctl --skip-dom0 --targets=tpl-NEW state.apply step-ca-trust.install
```
