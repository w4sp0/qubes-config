---
id: TASK-038.04
title: 'otee-dev: install Go tools'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - otee-dev
  - go
milestone: m-2
dependencies:
  - TASK-038.01
parent_task_id: TASK-038
priority: high
type: feature
ordinal: 29500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`tpl-otee-dev` has no Go toolchain for the platform code.

### Proposed solution

Include `dev.install-go-tools` in `otee-dev.install`.

### The value to a user, and who that user might be

- Developer: works on the Go platform code.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 go version runs in otee-dev
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
