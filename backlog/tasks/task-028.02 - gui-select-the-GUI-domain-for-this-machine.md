---
id: TASK-028.02
title: 'gui: select the GUI domain for this machine'
status: To Do
assignee: []
created_date: '2026-09-23 21:13'
labels:
  - gui
  - sys-gui
  - sys-gui-gpu
  - decision
milestone: m-7
dependencies: []
references:
  - salt/sys-gui/
  - salt/sys-gui-gpu/
  - salt/sys-gui-vnc/
  - 'https://www.qubes-os.org/doc/gui-domain/'
parent_task_id: TASK-028
priority: high
type: spike
ordinal: 2200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The repository has three GUI domain formulas: `sys-gui` (hybrid, dom0 keeps the X server and drivers), `sys-gui-gpu` (the GPU is passed through to the qube) and `sys-gui-vnc`. All are marked unfinished. dom0 is the GUI domain now. It is not decided which one this machine uses, so it is not clear which formula to finish.

### Proposed solution

Record the GPU (integrated or discrete, vendor), IOMMU support, and the PCI reset behavior of the GPU on this machine. Select one option: stay with dom0, `sys-gui`, or `sys-gui-gpu`. State the risk of each (for example: with `sys-gui-gpu` on the only GPU, a failed start leaves no display, and recovery needs `qubes.skip_autostart`). State what happens to the formulas that are not selected.

### The value to a user, and who that user might be

- User: effort goes to the one GUI domain that works on this hardware.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision records the GPU, the IOMMU support and the selected GUI domain
- [ ] #2 The decision states the recovery procedure if the GUI domain does not start
- [ ] #3 The decision states if sys-gui, sys-gui-gpu and sys-gui-vnc are kept, finished or removed
<!-- AC:END -->
