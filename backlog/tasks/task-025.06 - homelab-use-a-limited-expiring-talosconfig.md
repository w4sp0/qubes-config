---
id: TASK-025.06
title: 'homelab: use a limited, expiring talosconfig'
status: To Do
assignee: []
created_date: '2026-09-23 21:25'
labels:
  - homelab
  - talos
  - secrets
milestone: m-5
dependencies:
  - TASK-025.02
  - TASK-031.01
references:
  - 'https://www.talos.dev/latest/talos-guides/configuration/rbac/'
parent_task_id: TASK-025
priority: medium
type: feature
ordinal: 1600
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`talosctl` authenticates only with the client certificate in talosconfig. It cannot use a YubiKey. The default talosconfig has the `os:admin` role.

### Proposed solution

Keep the `os:admin` talosconfig in `vault`. For daily use, generate a talosconfig with the smallest role that covers normal work (for example `os:operator` or `os:reader`) and a short certificate lifetime (`talosctl config new --roles ... --crt-ttl ...`). Store only that one in the operations qube, and document how to renew it.

### The value to a user, and who that user might be

- User: a copied talosconfig from the operations qube cannot reset nodes and stops working soon.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The talosconfig in the operations qube has a role other than os:admin
- [ ] #2 Its client certificate expires within the lifetime stated in the TASK-031.01 decision
- [ ] #3 The os:admin talosconfig is in vault only
- [ ] #4 README.md documents the renewal command
<!-- AC:END -->
