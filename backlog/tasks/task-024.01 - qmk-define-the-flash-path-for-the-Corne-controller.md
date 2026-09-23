---
id: TASK-024.01
title: 'qmk: define the RP2040 flash path for the Corne'
status: To Do
assignee: []
created_date: '2026-09-23 21:01'
updated_date: '2026-09-23 21:11'
labels:
  - qmk
  - usb
  - sys-usb
  - decision
milestone: m-4
dependencies: []
references:
  - salt/sys-usb/keyboard.sls
  - salt/sys-usb/create.sls
  - 'https://docs.qmk.fm/platformdev_rp2040'
  - 'https://docs.qmk.fm/features/split_keyboard#handedness-by-eeprom'
  - 'https://www.qubes-os.org/doc/how-to-use-block-storage-devices/'
parent_task_id: TASK-024
priority: high
type: spike
ordinal: 1100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The Corne has RP2040 controllers. `sys-usb` sends the keyboard to dom0 as an input device (`qubes-input-proxy`). To flash, each half resets into the RP2040 boot ROM (the QMK `QK_BOOT` key, or a double tap of reset if the firmware enables it). It then connects as the UF2 mass storage drive `RPI-RP2` (USB ID `2e8a:0003`). While a half is in the boot ROM, it gives no input, so a second keyboard must be available.

Split handedness must be written to each half. QMK provides the `uf2-split-left` and `uf2-split-right` make targets for this.

### Proposed solution

Compare these flash paths:

1. `qvm-block attach qmk sys-usb:<dev>` of the `RPI-RP2` drive, mount it in `qmk`, and copy the `.uf2` file.
2. Auto-attach by device assignment of `2e8a:0003` to `qmk`, so that `make ...:uf2-split-left` finds the drive.
3. `picotool` over USB (`qvm-usb attach`).

Record the decision as a backlog decision. Prefer a path that does not install tooling in `sys-usb`.

### The value to a user, and who that user might be

- User: flashes both halves with one documented procedure.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision records the selected flash path and the rejected options
- [ ] #2 The decision states the dom0 commands, device assignment or policy needed
- [ ] #3 The decision states how each half gets its handedness
- [ ] #4 Follow-up tasks exist for the implementation
<!-- AC:END -->
