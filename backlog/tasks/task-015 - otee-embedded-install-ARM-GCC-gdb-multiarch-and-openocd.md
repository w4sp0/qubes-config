---
id: TASK-015
title: 'otee-embedded: install ARM GCC, gdb-multiarch and openocd'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - otee-embedded
  - c
milestone: m-2
dependencies: []
references:
  - salt/otee-embedded/install.sls
priority: medium
type: feature
ordinal: 5000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`tpl-otee-embedded` has no cross compiler, no cross debugger and no on-chip debugger.

### Proposed solution

Install Debian packages `gcc-arm-none-eabi`, `libnewlib-arm-none-eabi`, `gdb-multiarch` and `openocd` in an `otee-embedded` install state.

### The value to a user, and who that user might be

- Developer: builds and debugs C firmware in qube `otee-embedded`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 arm-none-eabi-gcc --version, gdb-multiarch --version and openocd --version run in qube otee-embedded
- [ ] #2 The packages are installed with install_recommends False
- [ ] #3 README.md lists the packages
<!-- AC:END -->
