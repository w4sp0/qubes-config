---
id: TASK-040
title: 'sys-whonix: prefs differ from whonix-gateway create.sls'
status: Done
assignee: []
created_date: '2026-09-27 10:44'
updated_date: '2026-09-27 11:47'
labels:
  - whonix
  - performance
milestone: m-3
dependencies: []
references:
  - salt/whonix-gateway/create.sls
priority: low
type: bug
ordinal: 45500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/whonix-gateway/create.sls` sets `vcpus: 1`, `memory: 300` and `maxmem: 500` for `sys-whonix`. The running qube has `vcpus: 2` and `maxmem: 4000`, set by hand.

### Proposed solution

Apply `whonix-gateway.create` so the running qube matches the formula.

### The value to a user, and who that user might be

- User: sys-whonix cannot take up to 4 GB of memory.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 qvm-prefs sys-whonix shows vcpus 1 and memory 300 and maxmem 500
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
2026-09-27: applied whonix-gateway.create in dom0. Before: vcpus 2, memory 500, maxmem 4000 (set by hand). After: vcpus 1, memory 300, maxmem 500, as in salt/whonix-gateway/create.sls.
<!-- SECTION:NOTES:END -->
