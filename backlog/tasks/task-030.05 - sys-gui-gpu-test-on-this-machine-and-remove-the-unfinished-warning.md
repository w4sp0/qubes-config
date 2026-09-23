---
id: TASK-030.05
title: 'sys-gui-gpu: test on this machine and remove the unfinished warning'
status: To Do
assignee: []
created_date: '2026-09-23 21:14'
labels:
  - sys-gui-gpu
  - test
  - docs
milestone: m-7
dependencies:
  - TASK-030.01
  - TASK-030.02
  - TASK-030.03
  - TASK-030.04
  - TASK-029.02
references:
  - salt/sys-gui-gpu/README.md
  - salt/sys-gui-gpu/version
  - rpm_spec/qusal-sys-gui-gpu.spec
parent_task_id: TASK-030
priority: medium
type: task
ordinal: 4500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The README warns that the formula is unfinished. No test on this machine is recorded. A failed GPU domain can leave the machine with no display.

### Proposed solution

Before the test, write down the recovery steps (`qubes.skip_autostart` in GRUB, then `sys-gui-gpu.cancel`). Apply the README installation commands, reboot, log in to `sys-gui-gpu`, and use qubes, a USB keyboard and a USB mouse. Run the uninstallation procedure. Record the result in the task notes. Then remove the warning, set a release version and regenerate the spec.

### The value to a user, and who that user might be

- User: can trust the README procedure, including recovery.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The task notes record the Qubes version, the GPU, the result of each README step and each problem found
- [ ] #2 An app qube with guivm sys-gui-gpu shows windows and gets USB keyboard and mouse input
- [ ] #3 The uninstallation procedure was run and dom0 is the GUI domain again
- [ ] #4 The README has no unfinished warning and salt/sys-gui-gpu/version is at least 1.0.0
- [ ] #5 scripts/spec-build.sh sys-gui-gpu exits 0
<!-- AC:END -->
