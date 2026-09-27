---
id: TASK-037.10
title: 'dev: fetch build artifacts with devrun'
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
priority: low
type: feature
ordinal: 23500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Build output stays in the disposable. Some artifacts (a binary or a firmware image) are needed in `dev`.

### Proposed solution

Add `devrun --fetch <path>`, which copies the given path from the disposable to `~/QubesIncoming/` in `dev`.

### The value to a user, and who that user might be

- Developer: gets an artifact without adding it to the work tree.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 devrun --fetch copies the given path to ~/QubesIncoming in dev
- [ ] #2 devrun --fetch writes no file in the work tree
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
