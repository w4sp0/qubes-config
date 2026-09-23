---
id: TASK-025.07
title: 'homelab: limit Proxmox credentials'
status: To Do
assignee: []
created_date: '2026-09-23 21:25'
labels:
  - homelab
  - proxmox
  - secrets
  - yubikey
milestone: m-5
dependencies:
  - TASK-031.01
references:
  - 'https://pve.proxmox.com/wiki/User_Management'
  - 'https://registry.terraform.io/providers/bpg/proxmox/latest/docs'
parent_task_id: TASK-025
priority: medium
type: feature
ordinal: 1700
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The credentials that OpenTofu, the web interface and SSH use on the Proxmox cluster are not defined. A broad token or `root@pam` password gives full control of all three nodes and all guests.

### Proposed solution

- OpenTofu: a dedicated user with a privilege-separated API token and a custom role that has only the privileges the provider needs. The token is injected from `vault` (TASK-031.01).
- Web interface: WebAuthn second factor with both YubiKeys (TASK-031.04), or OIDC (TASK-025.04).
- SSH to nodes: `ed25519-sk` keys from `sys-ssh-agent` if TASK-031.05 succeeds; password login disabled.
- Backup account: as defined in TASK-026.01.

### The value to a user, and who that user might be

- User: a leaked OpenTofu token cannot administer the cluster, and interactive access needs a YubiKey.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The OpenTofu token has a custom role and privilege separation enabled
- [ ] #2 tofu plan succeeds with the token and root@pam is not used by OpenTofu
- [ ] #3 Web login to Proxmox requires a YubiKey
- [ ] #4 SSH password login is disabled on all three nodes
<!-- AC:END -->
