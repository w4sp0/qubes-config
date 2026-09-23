---
id: TASK-026.03
title: 'dom0: verify the last backup on a schedule'
status: To Do
assignee: []
created_date: '2026-09-23 21:03'
labels:
  - dom0
  - backup
  - systemd
milestone: m-6
dependencies:
  - TASK-026.02
references:
  - salt/dom0/files/bin/qvm-backup-find-last
parent_task_id: TASK-026
priority: medium
type: feature
ordinal: 1300
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

A backup that completes can still fail to restore. I verify backups manually, if at all.

### Proposed solution

After a successful backup run, find the last backup with `qvm-backup-find-last` and run `qvm-backup-restore --verify-only` on it (or the verify command of the tool from TASK-026.01). Notify on failure.

### The value to a user, and who that user might be

- User: knows that the last backup can be restored.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Verification starts after each successful backup run
- [ ] #2 A corrupted backup file causes a failed unit and a desktop notification
- [ ] #3 The journal records the name of the verified backup
<!-- AC:END -->
