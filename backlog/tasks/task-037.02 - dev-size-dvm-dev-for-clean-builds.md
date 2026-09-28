---
id: TASK-037.02
title: 'dev: size dvm-dev for clean builds'
status: Done
assignee: [@wassp]
created_date: '2026-09-27 10:43'
updated_date: '2026-09-28 05:22'
labels:
  - dev
  - performance
milestone: m-3
dependencies: []
references:
  - salt/dev/create.sls
parent_task_id: TASK-037
priority: medium
type: enhancement
ordinal: 15500
---## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

A disposable created with `@dispvm:dvm-dev` takes `vcpus`, `memory` and `maxmem` from `dvm-dev`. `dvm-dev` has `vcpus: 1`, so a clean build has one CPU.

### Proposed solution

Set `dvm-dev` to `vcpus: 6`, `memory: 1000` and `maxmem: 6000`. The values only use resources while a disposable runs.

### The value to a user, and who that user might be

- Developer: a clean build has the same resources as a session build.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 salt/dev/create.sls sets vcpus 6 and memory 1000 and maxmem 6000 for dvm-dev
- [x] #2 qvm-prefs dvm-dev shows these values after dev.create is applied
<!-- AC:END -->
