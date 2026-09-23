---
id: TASK-031
title: 'creds: centralise credential handling'
status: To Do
assignee: []
created_date: '2026-09-23 21:24'
labels:
  - credentials
  - secrets
  - yubikey
  - hardening
milestone: m-8
dependencies: []
references:
  - salt/vault/
  - salt/sys-pgp/
  - salt/sys-ssh-agent/
  - salt/sys-usb/install-client-fido.sls
  - backlog/tasks/task-001.07 - cloud-define-ORG_GITHUB_TOKEN-injection.md
priority: high
type: feature
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Each area defines its own secrets: `ORG_GITHUB_TOKEN` (TASK-001.07), the Proxmox API token, talosconfig and kubeconfig (TASK-025), the backup passphrase and SSH key (TASK-026.01), and OpenTofu state. No rule states where a secret is kept, how a process gets it, or whether pillar may contain it. I have a YubiKey that no qube uses.

### Proposed solution

Make one credentials decision, then implement it in subtasks: YubiKey enrolment, the CTAP proxy for web login, hardware-backed SSH keys, OpenTofu state encryption, and a pillar rule.

### The value to a user, and who that user might be

- User: every secret has one known location, and the most valuable ones need a physical touch to use.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
- [ ] #2 docs/ contains a credentials page that lists each secret class, its holder qube and its injection method
<!-- AC:END -->
