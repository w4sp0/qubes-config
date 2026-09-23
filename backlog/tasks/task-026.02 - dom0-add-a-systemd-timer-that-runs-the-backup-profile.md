---
id: TASK-026.02
title: 'dom0: add a systemd timer that runs the backup profile'
status: To Do
assignee: []
created_date: '2026-09-23 21:03'
labels:
  - dom0
  - backup
  - systemd
  - pillar
milestone: m-6
dependencies:
  - TASK-026.01
references:
  - salt/dom0/backup.sls
  - salt/dom0/files/backup/qusal.conf.example
parent_task_id: TASK-026
priority: high
type: feature
ordinal: 1200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

No unit in dom0 starts a backup.

### Proposed solution

Add a systemd service and timer to `dom0.backup`. The service runs the tool from TASK-026.01 with the profile. The timer uses `Persistent=true`, so a missed run starts after boot. Read the schedule and the profile name from pillar. On failure, send a desktop notification to the dom0 GUI user.

### The value to a user, and who that user might be

- User: gets a backup at each interval and a notification when it fails.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 systemctl list-timers in dom0 shows the backup timer with the schedule from pillar
- [ ] #2 A run missed while the system was off starts after the next boot
- [ ] #3 A failed run shows a desktop notification and a failed unit in systemctl
- [ ] #4 The profile file with the passphrase has the mode and owner that TASK-026.01 states
- [ ] #5 With no pillar data, the state installs no timer
<!-- AC:END -->
