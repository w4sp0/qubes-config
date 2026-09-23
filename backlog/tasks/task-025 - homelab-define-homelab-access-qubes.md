---
id: TASK-025
title: 'homelab: define homelab access qubes'
status: To Do
assignee: []
created_date: '2026-09-23 21:02'
updated_date: '2026-09-23 21:26'
labels:
  - homelab
  - tailscale
  - proxmox
  - talos
  - decision
milestone: m-5
dependencies: []
references:
  - salt/dev-tofu/
  - salt/sys-tailscale/
  - salt/cloud/
  - >-
    backlog/tasks/task-001.08 -
    cloud-define-gitops-qube-vs-dev-tofu-opentofu-terraform.md
  - backlog/tasks/task-031.01 - creds-define-credential-storage-and-injection.md
priority: high
type: spike
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The homelab has a 3-node Proxmox cluster, self-hosted services and a Talos Kubernetes cluster. All are on my tailnet. Qube `dev-tofu` provisions them. No qube is defined for operations (`talosctl`, `kubectl`, SSH to nodes) or for the web interfaces (Proxmox on port 8006, service dashboards). Credentials for work and homelab must not share a qube.

### Proposed solution

Write a backlog decision that answers these questions:

1. Qubes and trust split: provisioning (OpenTofu, Proxmox API token, Talos machine secrets), operations (`talosctl`, `kubectl`, `k9s`, `helm`, SSH), and web browsing. Can an operations AppVM `homelab` use `tpl-cloud`, with its own kubeconfig and talosconfig?
2. Network path: `sys-tailscale` as netvm with `qvm-firewall` limited to the tailnet and routed subnets, Tailscale in each qube, or `qusal.ConnectTCP` for each host and port. `sys-tailscale` clients cannot resolve tailnet names now. Include the backup qube of TASK-026.01.
3. Tailnet ACL: the tag of the Qubes node and the ports it can reach.
4. Secrets: where the Proxmox token, talosconfig, kubeconfig and OpenTofu state are kept, following the rules of TASK-031.01. Subtasks TASK-025.04 to TASK-025.07 cover single sign-on, kubectl OIDC, talosconfig and Proxmox credentials.
5. Relation to TASK-001.08: is the homelab provisioning qube the gitops qube, or a separate qube?

### The value to a user, and who that user might be

- User: operates the homelab from qubes that hold only homelab credentials and reach only homelab hosts.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision lists each homelab qube with its purpose, template, netvm and credentials
- [ ] #2 The decision states the firewall rules or qrexec policy of each qube
- [ ] #3 The decision states where OpenTofu state is stored and how it is backed up
- [ ] #4 The decision states the relation to the TASK-001.08 gitops qube
- [ ] #5 Follow-up tasks exist for the implementation
<!-- AC:END -->
