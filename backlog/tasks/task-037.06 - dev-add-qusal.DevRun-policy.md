---
id: TASK-037.06
title: 'dev: add qusal.DevRun policy'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dev
  - qrexec
  - policy
milestone: m-3
dependencies:
  - TASK-037.04
parent_task_id: TASK-037
priority: high
type: feature
ordinal: 19500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Without a policy no qube can call `qusal.DevRun`. A broad policy would let other qubes run code in the build disposables.

### Proposed solution

Add a policy file to the `dev` formula: `dev` may call `disp-dev` and `@dispvm:dvm-dev`; every other source and target is denied.

### The value to a user, and who that user might be

- User: only `dev` can start builds in its disposables.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 dev.create installs the policy file in /etc/qubes/policy.d
- [ ] #2 dev can call qusal.DevRun on disp-dev and on @dispvm:dvm-dev
- [ ] #3 A call from a qube other than dev is denied
- [ ] #4 A call from dev to any other target is denied
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
