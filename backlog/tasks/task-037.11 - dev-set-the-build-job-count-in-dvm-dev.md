---
id: TASK-037.11
title: 'dev: set the build job count in dvm-dev'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dev
  - performance
milestone: m-3
dependencies: []
references:
  - salt/dev/configure-dvm.sls
parent_task_id: TASK-037
priority: medium
type: enhancement
ordinal: 78000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Cargo and make start one job per CPU. With about 1 GB per rustc job, 6 jobs can use more memory than `maxmem` allows and the build is killed.

### Proposed solution

Set `CARGO_BUILD_JOBS`, `MAKEFLAGS` and `GOFLAGS` in the disposables of `dvm-dev` to the lower of `vcpus` and `maxmem` in GB, minus 1.

### The value to a user, and who that user might be

- Developer: a large build is slower instead of killed.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 CARGO_BUILD_JOBS is 5 and MAKEFLAGS is -j5 and GOFLAGS is -p=5 in disp-dev
- [ ] #2 The job count is defined in one location
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
