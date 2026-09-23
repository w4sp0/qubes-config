---
id: TASK-001.09
title: 'cloud: increase memory and maxmem'
status: To Do
assignee: []
created_date: '2026-09-23 20:40'
labels:
  - cloud
  - performance
milestone: m-1
dependencies: []
references:
  - salt/cloud/create.sls
parent_task_id: TASK-001
priority: low
type: enhancement
ordinal: 8000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/cloud/create.sls` sets `memory: 400` and `maxmem: 600` on `cloud`, `dvm-cloud` and `disp-cloud`. `firefox-esr`, `k9s` and `kubectl` with large clusters use more memory.

### Proposed solution

Measure peak memory in qube `cloud` during a typical session. Set `memory` and `maxmem` from the measurement.

### The value to a user, and who that user might be

- User: the qube does not swap or trigger OOM kills during operations.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The values in create.sls are based on a recorded measurement
- [ ] #2 A typical session in qube cloud causes no OOM kill in journalctl -k
<!-- AC:END -->
