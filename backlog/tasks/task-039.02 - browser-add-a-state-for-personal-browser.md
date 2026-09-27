---
id: TASK-039.02
title: 'browser: add a state for personal-browser'
status: To Do
assignee: []
created_date: '2026-09-27 10:44'
labels:
  - browser
  - performance
milestone: m-3
dependencies: []
references:
  - salt/browser/create.sls
parent_task_id: TASK-039
priority: medium
type: feature
ordinal: 44500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`personal-browser` is not in salt and has `memory: 4000`, `maxmem: 4000`.

### Proposed solution

Add a state that manages `personal-browser` on `tpl-browser` with `vcpus: 4`, `memory: 800` and `maxmem: 4000`.

### The value to a user, and who that user might be

- User: the personal browser gives memory back when idle.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 qvm-prefs personal-browser shows vcpus 4 and memory 800 and maxmem 4000 after the state is applied
- [ ] #2 Applying the state to the existing qube keeps its home directory
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
