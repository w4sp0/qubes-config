---
id: TASK-029.01
title: 'sys-gui: prefs states require sys-gui.create without including it'
status: To Do
assignee: []
created_date: '2026-09-23 21:13'
labels:
  - sys-gui
  - requisite
  - upstream
milestone: m-7
dependencies: []
references:
  - salt/sys-gui/prefs.sls
  - salt/sys-gui/prefs-mgmt.sls
parent_task_id: TASK-029
priority: high
type: bug
ordinal: 3100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b (defect is inherited from upstream qusal).

### Brief summary

`sys-gui.prefs` and `sys-gui.prefs-mgmt` both contain state `sys-gui-set-tpl-sys-gui-management_dispvm-to-default` with `require: - sls: sys-gui.create`. Neither file includes `sys-gui.create`. The README applies each of them alone with `state.apply`. The two files also duplicate the same state ID.

### Steps to reproduce

1. Run `sudo qubesctl state.apply sys-gui.prefs-mgmt`.

### Expected behavior

The state sets `management_dispvm` of `tpl-sys-gui` to the default.

### Actual behavior

Expected from the Salt requisite rules: Salt reports that the requisite `sls: sys-gui.create` is not found, and the state fails. Confirm on the machine.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 sudo qubesctl state.apply sys-gui.prefs-mgmt completes without error
- [ ] #2 sudo qubesctl state.apply sys-gui.prefs completes without error
- [ ] #3 The management_dispvm state is defined in one file only
<!-- AC:END -->
