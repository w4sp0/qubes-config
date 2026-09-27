---
id: TASK-038.01
title: 'otee-dev: create the formula skeleton'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - otee-dev
milestone: m-2
dependencies: []
references:
  - salt/otee-embedded/
parent_task_id: TASK-038
priority: high
type: feature
ordinal: 26500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

There is no formula for a merged work qube.

### Proposed solution

Create `salt/otee-dev/` with clone, create, init and top files and a README, based on `salt/otee-embedded/`. Qubes: `tpl-otee-dev`; `otee-dev` with no netvm and `vcpus: 2`, `memory: 600`, `maxmem: 2000`; `dvm-otee-dev` and `disp-otee-dev` with `vcpus: 6`, `memory: 1000`, `maxmem: 6000`.

### The value to a user, and who that user might be

- Developer: has a work qube that is managed by salt.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Applying otee-dev.create creates tpl-otee-dev and otee-dev and dvm-otee-dev and disp-otee-dev
- [ ] #2 qvm-prefs of each qube shows the netvm and vcpus and memory and maxmem of the proposed solution
- [ ] #3 The formula passes the repository lint
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
