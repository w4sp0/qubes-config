---
id: TASK-018
title: 'otee-embedded: increase memory and maxmem'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - otee-embedded
  - performance
milestone: m-2
dependencies: []
references:
  - salt/otee-embedded/create.sls
priority: medium
type: enhancement
ordinal: 8000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/otee-embedded/create.sls` sets `memory: 400`, `maxmem: 600` and `vcpus: 1`. `cargo build` with `rust-analyzer` uses more memory.

### Proposed solution

Measure peak memory during a firmware build with `rust-analyzer` active. Set `memory`, `maxmem` and `vcpus` from the measurement.

### The value to a user, and who that user might be

- Developer: builds without OOM kills and with parallel compile jobs.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The values in create.sls are based on a recorded measurement
- [ ] #2 A release build with rust-analyzer active causes no OOM kill in journalctl -k
<!-- AC:END -->
