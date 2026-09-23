---
id: TASK-031.01
title: 'creds: define credential storage and injection'
status: To Do
assignee: []
created_date: '2026-09-23 21:24'
labels:
  - credentials
  - secrets
  - qrexec
  - decision
milestone: m-8
dependencies: []
references:
  - salt/vault/README.md
  - salt/sys-pgp/README.md
  - salt/sys-ssh-agent/README.md
  - salt/mail/
parent_task_id: TASK-031
priority: high
type: spike
ordinal: 1100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

TASK-001.07 asks how to inject one token. The same question applies to all secrets in the system and the homelab. Without one answer, each formula makes its own choice.

### Proposed solution

Write a backlog decision with a table of secret classes and, for each: the holder (`vault`, `sys-pgp`, `sys-ssh-agent`, a YubiKey, or the qube itself), the injection method, and the rotation. Classes to include:

- SSH keys (GitHub, Proxmox nodes, backup target).
- PGP keys.
- API tokens: `ORG_GITHUB_TOKEN`, Proxmox API token for OpenTofu, Tailscale auth keys.
- Cluster credentials: talosconfig, kubeconfig.
- OpenTofu state encryption key.
- Backup passphrase.
- Web logins and recovery codes.

Rules to decide:

1. Injection: a qrexec service from the holder that returns the secret on stdout to one process (for example `vault` with `pass`), with an `ask` policy. Never a file or a shell profile in the client.
2. Pillar contains no secrets. It contains configuration and public data only (public keys, `known_hosts`, host names, versions). Reasons: pillar is plain text in dom0 `/srv/pillar`, is sent to each management disposable, is written to the target (and all AppVMs of a target template), can show in state diffs, and can be committed to the public repository by mistake.
3. Which secrets need a hardware key (see TASK-031.03 to TASK-031.06).

### The value to a user, and who that user might be

- User: every formula follows the same secret rules.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision contains the table of secret classes with holder, injection method and rotation
- [ ] #2 The decision states the pillar rule and the reasons
- [ ] #3 The decision states the qrexec service name and policy for secret injection
- [ ] #4 Follow-up tasks exist for the implementation, including TASK-001.07
<!-- AC:END -->
