---
id: TASK-038.06
title: 'otee-dev: add qusal.DevRun policy'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - otee-dev
  - qrexec
  - policy
milestone: m-2
dependencies:
  - TASK-038.01
  - TASK-037.06
parent_task_id: TASK-038
priority: high
type: feature
ordinal: 79000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

No policy allows `otee-dev` to call `qusal.DevRun`.

### Proposed solution

Add a policy file to the `otee-dev` formula with the rules of TASK-037.06 for `otee-dev`, `disp-otee-dev` and `@dispvm:dvm-otee-dev`.

### The value to a user, and who that user might be

- User: only `otee-dev` can start builds in its disposables.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 otee-dev can call qusal.DevRun on disp-otee-dev and on @dispvm:dvm-otee-dev
- [ ] #2 A call from a qube other than otee-dev is denied
- [ ] #3 A call from otee-dev to any other target is denied
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
