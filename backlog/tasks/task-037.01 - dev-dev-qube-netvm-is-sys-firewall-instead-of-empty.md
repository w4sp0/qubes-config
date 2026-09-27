---
id: TASK-037.01
title: 'dev: dev qube netvm is sys-firewall instead of empty'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dev
  - network
milestone: m-3
dependencies: []
references:
  - salt/dev/create.sls
parent_task_id: TASK-037
priority: high
type: bug
ordinal: 14500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/dev/create.sls` sets `netvm: ""` for qube `dev`, but the running qube has `netvm` set to `sys-firewall` by hand. `dev` can connect to any host, which bypasses the `qusal.ConnectTCP` policy that allows only `github.com:22`.

### Proposed solution

Apply `dev.create` so the running qube matches the formula.

### The value to a user, and who that user might be

- User: `dev` reaches only the hosts that the qrexec policy allows.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 qvm-prefs dev netvm prints an empty value
- [ ] #2 git fetch of a GitHub repository in dev succeeds through qusal.ConnectTCP
- [ ] #3 curl https://example.com in dev fails
<!-- AC:END -->
