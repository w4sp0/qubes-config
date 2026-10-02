---
id: TASK-037.08
title: 'dev: add a clean mode to devrun'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dev
  - qrexec
milestone: m-3
dependencies:
  - TASK-037.07
parent_task_id: TASK-037
priority: medium
type: feature
ordinal: 75000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Session builds reuse state from earlier runs. A final build or test needs a disposable with no earlier state.

### Proposed solution

Add `devrun --clean <command>`, which calls `qusal.DevRun` on `@dispvm:dvm-dev`.

### The value to a user, and who that user might be

- Developer: runs a final build or test in a new disposable.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 devrun --clean runs the command in a new disposable of dvm-dev
- [ ] #2 The disposable is removed after the call
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
