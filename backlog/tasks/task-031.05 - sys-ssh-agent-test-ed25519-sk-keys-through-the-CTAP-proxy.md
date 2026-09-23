---
id: TASK-031.05
title: 'sys-ssh-agent: test ed25519-sk keys through the CTAP proxy'
status: To Do
assignee: []
created_date: '2026-09-23 21:25'
labels:
  - sys-ssh-agent
  - yubikey
  - fido2
  - ssh
milestone: m-8
dependencies:
  - TASK-031.03
references:
  - salt/sys-ssh-agent/README.md
  - salt/sys-usb/README.md
  - 'https://man.openbsd.org/ssh-keygen#FIDO_AUTHENTICATOR'
parent_task_id: TASK-031
priority: medium
type: spike
ordinal: 1600
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

SSH keys in `sys-ssh-agent` are software keys. A compromised `sys-ssh-agent` can copy them, and clients can use them with no physical confirmation. OpenSSH supports FIDO2 keys (`ed25519-sk`), where the private key never leaves the YubiKey. `salt/sys-usb/README.md` lists only `ctap.GetInfo`, `ctap.ClientPin`, `u2f.Register` and `u2f.Authenticate`, so it is not known if the proxy supports the FIDO2 calls that OpenSSH uses.

### Proposed solution

Enable the CTAP proxy on `sys-ssh-agent`. Generate an `ed25519-sk` key with `-O verify-required` in `sys-ssh-agent`, load it in the agent, and sign from a client qube. Test with both YubiKeys (one key handle per YubiKey). Record the result.

### The value to a user, and who that user might be

- User: SSH to GitHub and the Proxmox nodes needs a touch of the YubiKey, and no qube holds the private key.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A written result states if ssh-keygen -t ed25519-sk and a signature from a client work through the proxy
- [ ] #2 The result states which qrexec services and policy are needed
- [ ] #3 If it works, a follow-up task exists for the implementation; if not, the result states the alternative
<!-- AC:END -->
