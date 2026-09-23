---
id: TASK-030.02
title: 'sys-gui-gpu: input policy is active before activation and after cancel'
status: To Do
assignee: []
created_date: '2026-09-23 21:14'
labels:
  - sys-gui-gpu
  - input
  - qrexec
  - policy
milestone: m-7
dependencies: []
references:
  - salt/sys-gui-gpu/create.sls
  - salt/sys-gui-gpu/cancel.sls
  - salt/sys-gui-gpu/prefs.sls
parent_task_id: TASK-030
priority: high
type: bug
ordinal: 4200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b

### Brief summary

`sys-gui-gpu.create` writes `/etc/qubes/policy.d/45-sys-gui-gpu.policy` and `/etc/qubes/input-proxy-target` (`TARGET_DOMAIN=sys-gui-gpu`) in dom0. The policy sends `qubes.InputMouse` and `qubes.InputKeyboard` from `sys-usb` to `sys-gui-gpu`, and it is evaluated before the default input policy. `create` runs before `prefs` makes `sys-gui-gpu` the GUI domain. `sys-gui-gpu.cancel` does not remove either file.

With the default pillar, the keyboard action is `deny`. So USB keyboards, such as the Corne, do not work in `sys-gui-gpu` unless the pillar sets `qvm:sys-usb:keyboard-action`.

### Steps to reproduce

1. Apply `sys-gui-gpu.create` only. Keep dom0 as the GUI domain.
2. Connect a USB mouse to `sys-usb`.
3. Alternatively, apply `sys-gui-gpu.cancel` after an install, reboot, and connect a USB mouse.

### Expected behavior

The input policy and the input proxy target point to `sys-gui-gpu` only while `sys-gui-gpu` is the GUI domain.

### Actual behavior

Expected from the policy order: dom0 asks for, or sends, the mouse input to `sys-gui-gpu`, which does not show the display. Confirm on the machine.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The policy file and input-proxy-target are written by sys-gui-gpu.prefs, not by sys-gui-gpu.create
- [ ] #2 sys-gui-gpu.cancel removes both files
- [ ] #3 The README states the keyboard-action pillar needed for USB keyboards
- [ ] #4 After cancel and reboot, a USB mouse and keyboard in sys-usb control dom0
<!-- AC:END -->
