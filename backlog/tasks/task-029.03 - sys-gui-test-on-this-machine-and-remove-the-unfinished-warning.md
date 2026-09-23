---
id: TASK-029.03
title: 'sys-gui: test on this machine and remove the unfinished warning'
status: To Do
assignee: []
created_date: '2026-09-23 21:13'
labels:
  - sys-gui
  - test
  - docs
milestone: m-7
dependencies:
  - TASK-029.01
  - TASK-029.02
references:
  - salt/sys-gui/README.md
  - salt/sys-gui/version
  - rpm_spec/qusal-sys-gui.spec
parent_task_id: TASK-029
priority: medium
type: task
ordinal: 3300
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The README warns that the formula is unfinished. No test on this machine is recorded.

### Proposed solution

Apply the README installation commands, log in to session `GUI Domain (sys-gui)`, start qubes with `guivm` set to `sys-gui`, and run the uninstallation commands. Record the result in the task notes. Then remove the warning, set a release version and regenerate the spec.

### The value to a user, and who that user might be

- User: can trust the README procedure.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The task notes record the Qubes version, the result of each README step and each problem found
- [ ] #2 An app qube with guivm sys-gui shows windows in the sys-gui session
- [ ] #3 The README has no unfinished warning and salt/sys-gui/version is at least 1.0.0
- [ ] #4 scripts/spec-build.sh sys-gui exits 0
<!-- AC:END -->
