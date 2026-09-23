---
id: TASK-031.07
title: 'dom0: evaluate YubiKey screen unlock and disk unlock'
status: To Do
assignee: []
created_date: '2026-09-23 21:25'
labels:
  - dom0
  - yubikey
  - luks
  - decision
milestone: m-8
dependencies: []
references:
  - 'https://www.qubes-os.org/doc/yubikey/'
parent_task_id: TASK-031
priority: low
type: spike
ordinal: 1800
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Screen unlock and disk unlock use a password only. Qubes documents a YubiKey screen unlock (`qubes-yubikey-dom0`) that sends the challenge through `sys-usb`. Disk unlock with FIDO2 would need support in the dom0 initramfs. Both can lock me out of the machine.

### Proposed solution

Examine both options. For each, state the threat it stops, the trust it puts on `sys-usb`, the recovery procedure when the key is lost, and if it works with two keys.

### The value to a user, and who that user might be

- User: knows if a hardware factor on the laptop itself is worth the lockout risk.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A written result states the threat, the sys-usb trust and the recovery procedure for each option
- [ ] #2 The result states a recommendation
- [ ] #3 No change is made to dom0 login or LUKS in this task
<!-- AC:END -->
