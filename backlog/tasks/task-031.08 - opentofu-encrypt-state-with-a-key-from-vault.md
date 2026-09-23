---
id: TASK-031.08
title: 'opentofu: encrypt state with a key from vault'
status: To Do
assignee: []
created_date: '2026-09-23 21:25'
labels:
  - opentofu
  - dev-tofu
  - secrets
  - homelab
milestone: m-8
dependencies:
  - TASK-031.01
  - TASK-001.08
references:
  - salt/dev-tofu/
  - 'https://opentofu.org/docs/language/state/encryption/'
parent_task_id: TASK-031
priority: medium
type: feature
ordinal: 1900
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

OpenTofu state for the homelab contains the Proxmox token, Talos machine secrets and other values in plain text. It is stored in the provisioning qube and in its backups.

### Proposed solution

Enable OpenTofu state encryption (`encryption` block, `pbkdf2` key provider). Get the passphrase at run time from `vault` with the injection service of TASK-031.01, and pass it to `tofu` in the environment of that process only. Enable encryption for plan files too.

### The value to a user, and who that user might be

- User: a copy of the state file or a backup of the qube does not expose homelab secrets.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The state file on disk contains no plain text secret values
- [ ] #2 tofu plan works with the passphrase from vault and fails without it
- [ ] #3 The passphrase is not stored in the provisioning qube
- [ ] #4 README.md of the gitops formula documents the procedure
<!-- AC:END -->
