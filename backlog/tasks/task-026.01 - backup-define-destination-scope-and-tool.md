---
id: TASK-026.01
title: 'backup: define Proxmox destination, scope and tool'
status: To Do
assignee: []
created_date: '2026-09-23 21:03'
updated_date: '2026-09-23 21:24'
labels:
  - backup
  - dom0
  - decision
  - homelab
  - proxmox
milestone: m-6
dependencies: []
references:
  - salt/dom0/files/backup/qusal.conf.example
  - 'https://www.qubes-os.org/doc/how-to-back-up-restore-and-migrate/'
  - 'https://github.com/tasket/wyng-backup'
parent_task_id: TASK-026
priority: high
type: spike
ordinal: 1100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Backups go to the homelab Proxmox cluster. dom0 has no network, so a backup qube must forward the stream over the tailnet. The details are not defined.

### Proposed solution

Write a backlog decision that answers these questions:

1. Tool: `qvm-backup` with a profile (full, encrypted in dom0, streamed to `destination_vm`) or `wyng-backup` (incremental, from LVM thin snapshots, with an SSH destination).
2. Target on the cluster: which node or shared storage, the dataset or directory, and what happens when that node is down.
3. Backup qube: name, template, netvm (`sys-tailscale` with a firewall that allows only the target SSH port, see TASK-025), and where its SSH key is kept (`sys-ssh-agent`).
4. Account on Proxmox: a dedicated user that can only write new backup files (for example a forced command). A compromised backup qube must not delete or read other data.
5. Scope: the qubes with `include_in_backups: True` in each `create.sls`, dom0 home, and exclusions (templates, `@tag:skip-backup`).
6. Passphrase: `passphrase_text` in the profile is plain text in dom0. State who can read the file.
7. Running qubes: examine which revision of the private volume the tool exports for a running qube.
8. Schedule and retention: interval, number of kept backups, and what happens when the laptop is off or not on the tailnet at the scheduled time.

### The value to a user, and who that user might be

- User: knows what is backed up, where, and how old the oldest restorable backup is.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision records the tool, the Proxmox target, the backup qube, the scope, the schedule and the retention
- [ ] #2 The decision states the permissions of the backup account on Proxmox
- [ ] #3 The decision states where the passphrase and the SSH key are stored and who can read them
- [ ] #4 The decision states the data state that a backup of a running qube contains
- [ ] #5 Follow-up tasks TASK-026.02 to TASK-026.04 agree with the decision or are changed
<!-- AC:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-23 21:24
---
Dependency on TASK-025 removed: backups must not wait for the full homelab decision. Decide only the network path of the backup qube here (sys-tailscale netvm, firewall to the target SSH port). TASK-025 must then include the backup qube in its table.
---
<!-- COMMENTS:END -->
