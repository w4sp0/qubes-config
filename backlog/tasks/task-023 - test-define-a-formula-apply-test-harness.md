---
id: TASK-023
title: 'test: define a formula apply test harness'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - test
milestone: m-3
dependencies: []
references:
  - docs/CONTRIBUTE.md
  - README.md
priority: medium
type: spike
ordinal: 4000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

No automated test applies a formula. Defects in states are found only by a manual apply on the workstation.

### Proposed solution

Define a procedure that clones a disposable template, applies the formula states from the README, checks the result, and removes the qubes.

### The value to a user, and who that user might be

- Developer: finds apply errors before merge.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision records the harness design and its host requirements
- [ ] #2 The design states how it cleans up qubes after a failure
- [ ] #3 A follow-up task exists for the implementation
<!-- AC:END -->
