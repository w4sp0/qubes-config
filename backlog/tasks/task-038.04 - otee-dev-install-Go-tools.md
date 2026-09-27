---
id: TASK-038.04
title: 'otee-dev: install Go tools'
status: Done
assignee: []
created_date: '2026-09-27 10:43'
updated_date: '2026-09-27 13:08'
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
- [x] #1 go version runs in otee-dev
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [x] #1 README.md documents the change
<!-- DOD:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
2026-09-27: included in salt/otee-dev/install.sls together with TASK-038.01 (the user chose to install all toolchains in the skeleton commit b51e9d3). Applied with the otee-dev highstate; the user confirmed that gcc, cargo, go and python3 run in otee-dev, and cargo runs in a disposable of dvm-otee-dev (dev.configure-rust-tools in configure and configure-dvm). README.md lists the tools.
<!-- SECTION:NOTES:END -->
