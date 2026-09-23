---
id: TASK-024.04
title: 'qmk: allow non-root access to the keyboard bootloader'
status: To Do
assignee: []
created_date: '2026-09-23 21:02'
updated_date: '2026-09-23 21:11'
labels:
  - qmk
  - usb
  - udev
milestone: m-4
dependencies:
  - TASK-024.01
references:
  - 'https://github.com/qmk/qmk_firmware/blob/master/util/udev/50-qmk.rules'
  - >-
    backlog/tasks/task-017 -
    otee-embedded-allow-non-root-access-to-attached-debug-probes.md
parent_task_id: TASK-024
priority: low
type: feature
ordinal: 1400
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

A bootloader device attached to qube `qmk` is owned by root. The flash tool fails with a permission error as user `user`. This is not a problem if TASK-024.01 selects the UF2 copy path.

### Proposed solution

Install the QMK udev rule for the selected bootloader in `tpl-qmk`. TASK-017 needs the same state type for debug probes; use one macro if possible.

### The value to a user, and who that user might be

- User: flashes the keyboard as user `user`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 After the bootloader device is attached, the flash tool opens it as user user
- [ ] #2 The udev rule is installed in /etc/udev/rules.d in the template and covers only the selected bootloader
<!-- AC:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-23 21:11
---
The controller is an RP2040. The UF2 path through qvm-block needs no udev rule, because the drive is mounted as root. Keep this task only if TASK-024.01 selects picotool or a device assignment that the flash tool opens as user. Otherwise archive it.
---
<!-- COMMENTS:END -->
