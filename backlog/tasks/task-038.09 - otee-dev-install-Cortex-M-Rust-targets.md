---
id: TASK-038.09
title: 'otee-dev: install Cortex-M Rust targets'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - otee-dev
  - rust
milestone: m-2
dependencies:
  - TASK-011
  - TASK-038.02
parent_task_id: TASK-038
priority: high
type: feature
ordinal: 34500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`tpl-otee-dev` has only the host Rust target. Firmware builds need `thumbv*-none-eabi*` targets. Replaces TASK-014.

### Proposed solution

Set the pillar keys from TASK-011 for `tpl-otee-dev` to the targets of the OTEE boards.

### The value to a user, and who that user might be

- Developer: builds firmware in a disposable of `dvm-otee-dev` without a manual `rustup` step.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 rustup target list --installed in tpl-otee-dev shows the defined thumbv* targets
- [ ] #2 devrun cargo build --target thumbv7em-none-eabihf of a no_std example completes from otee-dev
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
