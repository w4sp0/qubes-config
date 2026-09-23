---
id: TASK-026.04
title: 'backup: remove old backups on the destination'
status: To Do
assignee: []
created_date: '2026-09-23 21:03'
updated_date: '2026-09-23 21:11'
labels:
  - backup
  - retention
milestone: m-6
dependencies:
  - TASK-026.03
references:
  - salt/dom0/files/bin/qvm-backup-find-last
parent_task_id: TASK-026
priority: medium
type: feature
ordinal: 1400
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`qvm-backup` writes a full backup each run. Without retention, the destination becomes full and the next backup fails.

### Proposed solution

Remove backups older than the retention from TASK-026.01, only after the newest backup is verified (TASK-026.03). Read the retention from pillar.

### The value to a user, and who that user might be

- User: the destination does not become full, and a verified backup always remains.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 After a verified run, the destination contains no more backups than the retention
- [ ] #2 When verification fails, no backup is removed
- [ ] #3 The newest verified backup is never removed
<!-- AC:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-23 21:11
---
If TASK-026.01 gives the backup account write-only access, the backup qube cannot delete files. Then retention must run on the Proxmox side (for example a timer on the target node), and it must keep the newest backup that dom0 verified. Update the ACs after the decision.
---
<!-- COMMENTS:END -->
