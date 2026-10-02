---
id: TASK-019
title: 'dev: size the dev qube for editing only'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
updated_date: '2026-09-27 10:44'
labels:
  - dev
  - performance
milestone: m-3
dependencies: []
references:
  - salt/dev/create.sls
priority: low
type: enhancement
ordinal: 66000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/dev/create.sls` sets `vcpus: 1`, `memory: 400` and `maxmem: 600` for `dev`. After TASK-037, `dev` does not build; it runs an editor, git and documentation tools.

### Proposed solution

Set `dev` to `vcpus: 2`, `memory: 600` and `maxmem: 2000`.

### The value to a user, and who that user might be

- Developer: editing and reading documentation in dev is not limited by memory.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 salt/dev/create.sls sets vcpus 2 and memory 600 and maxmem 2000 for dev
- [ ] #2 qvm-prefs dev shows these values after dev.create is applied
<!-- AC:END -->
