---
id: TASK-038.07
title: 'otee-dev: set the build job count in dvm-otee-dev'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - otee-dev
  - performance
milestone: m-2
dependencies:
  - TASK-038.01
  - TASK-037.11
parent_task_id: TASK-038
priority: medium
type: enhancement
ordinal: 80000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The disposables of `dvm-otee-dev` start one compile job per CPU.

### Proposed solution

Apply the job count state of TASK-037.11 to `dvm-otee-dev`.

### The value to a user, and who that user might be

- Developer: a large build is slower instead of killed.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 CARGO_BUILD_JOBS is 5 and MAKEFLAGS is -j5 and GOFLAGS is -p=5 in disp-otee-dev
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
