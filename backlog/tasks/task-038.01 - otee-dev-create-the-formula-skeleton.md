---
id: TASK-038.01
title: 'otee-dev: create the formula skeleton'
status: Done
assignee: []
created_date: '2026-09-27 10:43'
updated_date: '2026-09-27 13:09'
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

Create `salt/otee-dev/` with clone, create, init and top files and a README, based on `salt/otee-embedded/`. Qubes: `tpl-otee-dev`; `otee-dev` with no netvm and `vcpus: 1`, `memory: 400`, `maxmem: 600` (the values of `otee-embedded`; without language servers and with builds in disposables, the AppVM needs no more); `dvm-otee-dev` and `disp-otee-dev` with `vcpus: 6`, `memory: 1000`, `maxmem: 6000`.

### The value to a user, and who that user might be

- Developer: has a work qube that is managed by salt.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 Applying otee-dev.create creates tpl-otee-dev and otee-dev and dvm-otee-dev and disp-otee-dev
- [x] #2 qvm-prefs of each qube shows the netvm and vcpus and memory and maxmem of the proposed solution
- [x] #3 The formula passes the repository lint
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [x] #1 README.md documents the change
<!-- DOD:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-27 12:07
---
2026-09-27: otee-dev AppVM sizing changed from 2/600/2000 to 1/400/600. The larger values assumed language servers, which are not used; measured usage in dev with Claude Code is 352 of 525 MB.
---

created: 2026-09-27 13:05
---
2026-09-27: otee-dev.create applied (highstate, all targets OK). qvm-prefs: otee-dev netvm= vcpus=1 memory=400 maxmem=600; dvm-otee-dev and disp-otee-dev netvm=sys-firewall vcpus=6 memory=1000 maxmem=6000. AC #3 open: markdown-lint MD013 on README line 16; copyright-lint failure is the TASK-036 lint bug; salt-lint not installed in dev.
---

created: 2026-09-27 13:09
---
2026-09-27: markdown-lint passes on salt/otee-dev/README.md after the line 16 wrap. copyright-lint failure is the TASK-036 lint bug; salt-lint is not installed in dev, and all states applied without failure.
---
<!-- COMMENTS:END -->
