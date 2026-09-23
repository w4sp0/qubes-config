---
id: TASK-031.04
title: 'yubikey: enrol two keys on external accounts'
status: To Do
assignee: []
created_date: '2026-09-23 21:25'
labels:
  - yubikey
  - fido2
  - webauthn
milestone: m-8
dependencies:
  - TASK-031.03
references:
  - salt/vault/README.md
parent_task_id: TASK-031
priority: high
type: task
ordinal: 1500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

I have one YubiKey and use it on no account. One key only is a lockout risk: if it is lost or broken, every account that requires it is locked.

### Proposed solution

Get a second YubiKey. Set a FIDO2 PIN on both. Register both as WebAuthn or passkey authenticators on: GitHub, the identity provider of the Tailscale account, Google, and the Proxmox web interface. Store recovery codes in `vault`. Keep the second key in a separate physical location.

Enrol through the CTAP proxy (TASK-031.03), so the key stays in `sys-usb`.

### The value to a user, and who that user might be

- User: account logins need a physical key, and the loss of one key does not lock any account.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Both keys have a FIDO2 PIN
- [ ] #2 Each listed account shows two registered security keys
- [ ] #3 The recovery codes of each account are in vault
- [ ] #4 docs/ lists the accounts and which keys are registered, with no secrets
<!-- AC:END -->
