---
id: TASK-038.13
title: 'dom0: remove the otee-platform qube'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dom0
milestone: m-2
dependencies:
  - TASK-038.02
  - TASK-038.03
  - TASK-038.04
  - TASK-038.05
parent_task_id: TASK-038
priority: medium
type: chore
ordinal: 38500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`otee-platform` holds 8000 MB of static memory. Its data is on GitHub and its work moves to `otee-dev`.

### Proposed solution

Remove the qube with `qvm-remove otee-platform`.

### The value to a user, and who that user might be

- User: 8 GB of memory is free for other qubes.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 qvm-ls does not list otee-platform
<!-- AC:END -->
