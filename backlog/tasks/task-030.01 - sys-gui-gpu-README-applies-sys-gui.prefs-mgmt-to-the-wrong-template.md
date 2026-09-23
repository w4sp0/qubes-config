---
id: TASK-030.01
title: 'sys-gui-gpu: README applies sys-gui.prefs-mgmt to the wrong template'
status: To Do
assignee: []
created_date: '2026-09-23 21:14'
labels:
  - sys-gui-gpu
  - upstream
milestone: m-7
dependencies:
  - TASK-029.01
references:
  - salt/sys-gui-gpu/README.md
  - salt/sys-gui/prefs-mgmt.sls
parent_task_id: TASK-030
priority: high
type: bug
ordinal: 4100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b (defect is inherited from upstream qusal).

### Brief summary

The `sys-gui-gpu` README runs `sudo qubesctl state.apply sys-gui.prefs-mgmt`. That state sets `management_dispvm` on `tpl-sys-gui`, which the `sys-gui-gpu` install does not create. The template `tpl-sys-gui-gpu` does not get the setting.

### Steps to reproduce

1. On a system with no `sys-gui`, follow the `sys-gui-gpu` README state commands.
2. Run `qvm-prefs tpl-sys-gui-gpu management_dispvm`.

### Expected behavior

`tpl-sys-gui-gpu` has `management_dispvm` set to the default, and the step completes without error.

### Actual behavior

The step fails or changes `tpl-sys-gui` only. `tpl-sys-gui-gpu` keeps the value from the clone.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 salt/sys-gui-gpu has a prefs-mgmt state that targets tpl-sys-gui-gpu
- [ ] #2 The README uses sys-gui-gpu.prefs-mgmt
- [ ] #3 qvm-prefs tpl-sys-gui-gpu management_dispvm shows the default after the README commands
<!-- AC:END -->
