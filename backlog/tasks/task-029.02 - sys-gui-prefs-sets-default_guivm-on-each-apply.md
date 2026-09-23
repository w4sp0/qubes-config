---
id: TASK-029.02
title: 'sys-gui: prefs sets default_guivm on each apply'
status: To Do
assignee: []
created_date: '2026-09-23 21:13'
labels:
  - sys-gui
  - sys-gui-gpu
  - idempotency
milestone: m-7
dependencies: []
references:
  - salt/sys-gui/prefs.sls
  - salt/sys-gui-gpu/prefs.sls
  - salt/sys-gui/cancel-common.sls
parent_task_id: TASK-029
priority: low
type: enhancement
ordinal: 3200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`sys-gui.prefs`, `sys-gui-gpu.prefs` and `sys-gui.cancel-common` run `qubes-prefs -- default_guivm <qube>` in a `cmd.run` with no `unless`. Each apply runs the command and reports a change.

### Proposed solution

Add `unless: test "$(qubes-prefs default_guivm)" = "<qube>"` to each of the three states.

### The value to a user, and who that user might be

- User: a repeated apply reports no false changes.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A second apply of sys-gui.prefs reports 0 changes
- [ ] #2 A second apply of sys-gui-gpu.prefs reports 0 changes
- [ ] #3 A second apply of sys-gui.cancel reports 0 changes
<!-- AC:END -->
