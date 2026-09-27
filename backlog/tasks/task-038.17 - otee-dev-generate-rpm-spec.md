---
id: TASK-038.17
title: 'otee-dev: generate rpm spec'
status: To Do
assignee: []
created_date: '2026-09-27 12:13'
labels:
  - otee-dev
  - rpm
milestone: m-2
dependencies:
  - TASK-038.01
references:
  - scripts/spec-gen.sh
  - scripts/qubesbuilder-gen.sh
parent_task_id: TASK-038
priority: low
type: chore
ordinal: 46500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The `otee-dev` formula has no RPM spec and is not listed in `.qubesbuilder`.

### Proposed solution

Generate the spec with `scripts/spec-gen.sh otee-dev` and `.qubesbuilder` with `scripts/qubesbuilder-gen.sh` after the other TASK-038 formula subtasks are Done.

### The value to a user, and who that user might be

- User: installs `otee-dev` as a package, like the other formulas.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 rpm_spec/qusal-otee-dev.spec exists
- [ ] #2 scripts/spec-build.sh otee-dev exits 0
- [ ] #3 The spec post-install section matches the pkg:begin:post-install block in README.md
- [ ] #4 .qubesbuilder lists rpm_spec/qusal-otee-dev.spec
<!-- AC:END -->
