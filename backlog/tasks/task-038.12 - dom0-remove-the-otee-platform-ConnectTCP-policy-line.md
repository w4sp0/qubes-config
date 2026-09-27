---
id: TASK-038.12
title: 'dom0: remove the otee-platform ConnectTCP policy line'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dom0
  - policy
milestone: m-2
dependencies:
  - TASK-038.02
  - TASK-038.03
  - TASK-038.04
  - TASK-038.05
parent_task_id: TASK-038
priority: medium
type: chore
ordinal: 37500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`/etc/qubes/policy.d/30-user.policy` allows `otee-platform` to connect to `github.com:22`. The qube is replaced by `otee-dev`.

### Proposed solution

Remove the `otee-platform` line from `30-user.policy`.

### The value to a user, and who that user might be

- User: the policy has no rules for removed qubes.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 grep otee-platform /etc/qubes/policy.d/30-user.policy has no match
<!-- AC:END -->
