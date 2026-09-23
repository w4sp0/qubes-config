---
id: TASK-019
title: 'dev: increase memory and maxmem'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - dev
  - performance
milestone: m-2
dependencies: []
references:
  - salt/dev/create.sls
priority: low
type: enhancement
ordinal: 9000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/dev/create.sls` sets `memory: 400`, `maxmem: 600` and `vcpus: 1`. Since df2c659, `tpl-dev` can include the rustup toolchain with `rust-analyzer`.

### Proposed solution

Measure peak memory during a Rust build with `rust-analyzer` active. Set `memory`, `maxmem` and `vcpus` from the measurement.

### The value to a user, and who that user might be

- Developer: builds without OOM kills.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The values in create.sls are based on a recorded measurement
- [ ] #2 A Rust build with rust-analyzer active causes no OOM kill in journalctl -k
<!-- AC:END -->
