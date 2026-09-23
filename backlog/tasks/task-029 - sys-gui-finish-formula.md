---
id: TASK-029
title: 'sys-gui: finish formula'
status: To Do
assignee: []
created_date: '2026-09-23 21:13'
labels:
  - sys-gui
  - gui
milestone: m-7
dependencies:
  - TASK-028.02
references:
  - salt/sys-gui/
  - docs/TROUBLESHOOT.md
priority: medium
type: feature
ordinal: 3000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/sys-gui/README.md` marks the formula as unfinished (version 0.0.1). The states have the defects in the subtasks. `sys-gui-gpu` uses `sys-gui.install`, `sys-gui.configure`, `sys-gui.cancel-common` and `sys-gui.prefs-mgmt`, so the defects also affect it.

### Proposed solution

Fix the subtasks, test the hybrid GUI domain on this machine, and remove the unfinished warning. If TASK-028.02 rejects `sys-gui` as the GUI domain, fix only the states that `sys-gui-gpu` uses.

### The value to a user, and who that user might be

- User: can move the GUI out of dom0 and back with the documented commands.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
- [ ] #2 The README installation commands apply without error on this machine
- [ ] #3 The README uninstallation commands restore dom0 as the GUI domain
<!-- AC:END -->
