---
id: TASK-037.03
title: 'dev: size disp-dev for session builds'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
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
ordinal: 16500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The named disposable `disp-dev` has `vcpus: 1`. It cannot run parallel compile jobs.

### Proposed solution

Set `disp-dev` to `vcpus: 6`, `memory: 1000` and `maxmem: 6000`.

### The value to a user, and who that user might be

- Developer: session builds run parallel compile jobs.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 salt/dev/create.sls sets vcpus 6 and memory 1000 and maxmem 6000 for disp-dev
- [ ] #2 qvm-prefs disp-dev shows these values after dev.create is applied
<!-- AC:END -->
