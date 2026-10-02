---
id: TASK-039
title: 'browser: manage otee-browser and personal-browser in salt'
status: To Do
assignee: []
created_date: '2026-09-27 10:44'
labels:
  - browser
  - performance
milestone: m-3
dependencies: []
references:
  - salt/browser/
priority: medium
type: feature
ordinal: 85000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`otee-browser` and `personal-browser` were created by hand from `tpl-browser`. Each has 4000 MB of static memory, and tabs crash in `otee-browser` when it reaches the limit.

### Proposed solution

Add a salt state for each qube with dynamic memory. Do each qube in a subtask.

### The value to a user, and who that user might be

- User: browser memory grows with load and is given back when idle.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
<!-- AC:END -->
