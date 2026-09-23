---
id: TASK-031.03
title: 'sys-usb: enable the CTAP proxy for web login qubes'
status: To Do
assignee: []
created_date: '2026-09-23 21:24'
labels:
  - sys-usb
  - yubikey
  - fido2
  - qrexec
milestone: m-8
dependencies: []
references:
  - salt/sys-usb/install-client-fido.sls
  - salt/sys-usb/README.md
  - salt/browser/create.sls
  - 'https://www.qubes-os.org/doc/ctap-proxy/'
parent_task_id: TASK-031
priority: high
type: feature
ordinal: 1400
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`sys-usb.install-client-fido` exists, but no formula applies it or sets `service.qubes-ctap-proxy`. Browsers in qubes cannot use the YubiKey for WebAuthn.

### Proposed solution

Apply `sys-usb.install-client-fido` to the templates of the qubes that log in to web services (`browser`, the homelab disposable of TASK-025.03, and others from TASK-031.01). Enable `service.qubes-ctap-proxy` on those qubes in their `create.sls`. Set the `ctap.*` and `u2f.*` policy to `ask` for these qubes and `deny` for all others.

### The value to a user, and who that user might be

- User: logs in with the YubiKey from a browser qube, and each use is confirmed in dom0.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A WebAuthn test page registers and authenticates the YubiKey from qube browser
- [ ] #2 A qube not in the list gets a deny for ctap.GetInfo
- [ ] #3 The policy file is managed by a state, not edited by hand
- [ ] #4 README.md of each changed formula documents the CTAP proxy
<!-- AC:END -->
