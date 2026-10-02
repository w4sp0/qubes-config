---
id: TASK-038.10
title: 'otee-dev: install ARM GCC, gdb-multiarch and openocd'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - otee-dev
  - c
milestone: m-2
dependencies:
  - TASK-038.02
parent_task_id: TASK-038
priority: medium
type: feature
ordinal: 83000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`tpl-otee-dev` has no cross compiler, no cross debugger and no on-chip debugger. Replaces TASK-015.

### Proposed solution

Install Debian packages `gcc-arm-none-eabi`, `libnewlib-arm-none-eabi`, `gdb-multiarch` and `openocd` in `otee-dev.install`.

### The value to a user, and who that user might be

- Developer: builds and debugs C firmware.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 arm-none-eabi-gcc --version and gdb-multiarch --version and openocd --version run in otee-dev
- [ ] #2 The packages are installed with install_recommends False
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
