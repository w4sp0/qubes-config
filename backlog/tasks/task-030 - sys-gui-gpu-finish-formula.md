---
id: TASK-030
title: 'sys-gui-gpu: finish formula'
status: To Do
assignee: []
created_date: '2026-09-23 21:13'
labels:
  - sys-gui-gpu
  - gui
  - pci
milestone: m-7
dependencies:
  - TASK-028.02
references:
  - salt/sys-gui-gpu/
  - docs/TROUBLESHOOT.md
priority: medium
type: feature
ordinal: 4000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/sys-gui-gpu/README.md` marks the formula as unfinished (version 0.0.1). The states and README have the defects in the subtasks. The formula depends on `sys-gui` states (see TASK-029).

### Proposed solution

Fix the subtasks, test the GPU GUI domain on this machine, and remove the unfinished warning. If TASK-028.02 rejects `sys-gui-gpu`, archive this task and its subtasks, and record if the formula is removed.

### The value to a user, and who that user might be

- User: can move the GPU and the GUI out of dom0 and back with the documented commands.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
- [ ] #2 The README installation commands apply without error on this machine
- [ ] #3 The README uninstallation procedure restores dom0 as the GUI domain with a working display, keyboard and mouse
<!-- AC:END -->
