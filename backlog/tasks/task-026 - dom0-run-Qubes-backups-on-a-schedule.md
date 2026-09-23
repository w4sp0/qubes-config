---
id: TASK-026
title: 'dom0: run Qubes backups on a schedule'
status: To Do
assignee: []
created_date: '2026-09-23 21:02'
labels:
  - dom0
  - backup
  - feature
milestone: m-6
dependencies: []
references:
  - salt/dom0/backup.sls
  - salt/dom0/files/backup/qusal.conf.example
  - salt/dom0/files/bin/qvm-backup-find-last
priority: high
type: feature
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

I start Qubes backups manually. Formula `dom0.backup` installs only an example profile and `qvm-backup-find-last`. No state runs, verifies or prunes backups.

### Proposed solution

Extend `dom0.backup` to run a backup profile on a schedule, verify the last backup, and remove old backups. Do each part in a subtask.

### The value to a user, and who that user might be

- User: has a recent, verified backup without a manual step.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
- [ ] #2 salt/dom0/README.md documents the schedule, the verification and the retention
<!-- AC:END -->
