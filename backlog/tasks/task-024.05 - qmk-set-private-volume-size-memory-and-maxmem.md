---
id: TASK-024.05
title: 'qmk: set private volume size, memory and maxmem'
status: To Do
assignee: []
created_date: '2026-09-23 21:02'
labels:
  - qmk
  - performance
milestone: m-4
dependencies:
  - TASK-024.03
references:
  - salt/dev/create.sls
parent_task_id: TASK-024
priority: low
type: enhancement
ordinal: 1500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

A `qmk_firmware` clone with submodules and build output can be larger than the default private volume.

### Proposed solution

Measure disk and memory use after a clone and a full build. Set the private volume size, `memory` and `maxmem` in `create.sls` from the measurement.

### The value to a user, and who that user might be

- Developer: clones and builds without a full disk or an OOM kill.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The values in create.sls are based on a recorded measurement
- [ ] #2 A clean clone and build leaves at least 20% free space on the private volume
<!-- AC:END -->
