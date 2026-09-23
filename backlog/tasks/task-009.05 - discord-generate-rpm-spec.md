---
id: TASK-009.05
title: 'discord: generate rpm spec'
status: In Progress
assignee: []
created_date: '2026-09-23 20:41'
updated_date: '2026-09-23 22:06'
labels:
  - discord
  - rpm
milestone: m-0
dependencies:
  - TASK-009.01
  - TASK-009.02
  - TASK-009.03
  - TASK-009.04
references:
  - scripts/spec-gen.sh
  - rpm_spec/template/template.spec
parent_task_id: TASK-009
priority: low
type: chore
ordinal: 7500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`rpm_spec/qusal-discord.spec` does not exist. The formula is not packaged.

### Proposed solution

Generate the spec with `scripts/spec-gen.sh discord` after the other TASK-009 subtasks are Done.

### The value to a user, and who that user might be

- User: installs discord from the qusal RPM repository.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 rpm_spec/qusal-discord.spec exists
- [ ] #2 scripts/spec-build.sh discord exits 0
- [x] #3 The spec post-install section matches the pkg:begin:post-install block in README.md
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
Generated rpm_spec/qusal-discord.spec with scripts/spec-gen.sh at a3e8d1c (Requires include qusal-builder); spec-gen.sh test passes. AC #2 not run: rpmbuild, rpmlint, rpmsign and dnf are missing in the dev qube. Note: %post runs discord.install, which fails until the discordo sha256 pin is set (TASK-009.02).
<!-- SECTION:NOTES:END -->
