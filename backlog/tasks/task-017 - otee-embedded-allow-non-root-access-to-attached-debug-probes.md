---
id: TASK-017
title: 'otee-embedded: allow non-root access to attached debug probes'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - otee-embedded
  - usb
  - udev
milestone: m-2
dependencies: []
references:
  - salt/sys-usb/
  - 'https://probe.rs/files/69-probe-rs.rules'
priority: medium
type: feature
ordinal: 7000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

A debug probe (ST-Link, J-Link, CMSIS-DAP) attached from `sys-usb` with `qvm-usb attach` is owned by root in qube `otee-embedded`. `probe-rs` and `openocd` fail with a permission error as user `user`.

### Proposed solution

Install udev rules for the supported probes in the template. Document the `qvm-usb attach` procedure.

### The value to a user, and who that user might be

- User: flashes a board as user `user` after the probe is attached.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 After qvm-usb attach, probe-rs list shows the probe as user user
- [ ] #2 The udev rules are installed in /etc/udev/rules.d in the template
- [ ] #3 README.md documents the qvm-usb attach command and the supported probes
<!-- AC:END -->
