---
id: TASK-038.05
title: 'otee-dev: install devrun'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - otee-dev
  - qrexec
milestone: m-2
dependencies:
  - TASK-038.01
  - TASK-037.04
  - TASK-037.07
parent_task_id: TASK-038
priority: high
type: feature
ordinal: 30500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`tpl-otee-dev` has neither the `qusal.DevRun` service nor the `devrun` client.

### Proposed solution

Include the devrun states of the `dev` formula in `otee-dev.install`.

### The value to a user, and who that user might be

- Developer: uses devrun in otee-dev as in dev.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 qusal.DevRun and devrun are installed in tpl-otee-dev
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
