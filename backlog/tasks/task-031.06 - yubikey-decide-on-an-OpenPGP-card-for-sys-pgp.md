---
id: TASK-031.06
title: 'yubikey: decide on an OpenPGP card for sys-pgp'
status: To Do
assignee: []
created_date: '2026-09-23 21:25'
labels:
  - sys-pgp
  - yubikey
  - openpgp
  - decision
milestone: m-8
dependencies: []
references:
  - salt/sys-pgp/README.md
parent_task_id: TASK-031
priority: low
type: spike
ordinal: 1700
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`sys-pgp` keeps PGP keys in software in an offline qube. The OpenPGP applet of a YubiKey needs CCID, which `qubes-ctap` does not proxy. So the YubiKey must be attached to `sys-pgp` with `qvm-usb`, and while it is attached, `sys-usb` cannot use it for FIDO2.

### Proposed solution

Compare: keep software keys in `sys-pgp`; or use a dedicated third YubiKey that is attached to `sys-pgp` only. Consider the gain (touch to sign, key cannot be copied from a compromised `sys-pgp`) against the cost (a third key, `pcscd` in `sys-pgp`, re-attaching after each restart).

### The value to a user, and who that user might be

- User: knows if a hardware PGP key is worth the extra device and steps.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision records the selected option and the reasons
- [ ] #2 If a hardware key is selected, a follow-up task exists for pcscd, the device assignment and the key migration
<!-- AC:END -->
