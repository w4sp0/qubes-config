---
id: TASK-038.16
title: 'otee-embedded: remove the formula'
status: To Do
assignee: []
created_date: '2026-09-27 10:44'
updated_date: '2026-09-27 12:13'
labels:
  - otee-embedded
milestone: m-2
dependencies:
  - TASK-038.15
parent_task_id: TASK-038
priority: medium
type: chore
ordinal: 41500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/otee-embedded/` manages qubes that no longer exist.

### Proposed solution

Delete `salt/otee-embedded/` and every reference to it.

### The value to a user, and who that user might be

- User: the repository has no formula for removed qubes.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 salt/otee-embedded does not exist
- [ ] #2 grep -rn otee-embedded salt has no match
- [ ] #3 grep -rn otee-embedded rpm_spec .qubesbuilder .reuse/dep5 has no match
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
