---
id: TASK-038
title: 'otee-dev: replace otee-platform and otee-embedded'
status: In Progress
assignee: []
created_date: '2026-09-27 10:43'
updated_date: '2026-09-27 11:49'
labels:
  - otee-dev
  - work
milestone: m-2
dependencies: []
references:
  - salt/otee-embedded/
  - salt/dev/
priority: high
type: feature
ordinal: 25500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Work development uses two qubes: `otee-embedded` (C and Rust) and `otee-platform` (Python, Go and Rust, with 8000 MB of static memory). `otee-platform` is not in salt. Both hold the same trust domain, and they are rarely used at the same time.

### Proposed solution

Create one formula `otee-dev` with all toolchains, with builds in disposables as in TASK-037. Remove `otee-platform` and `otee-embedded`. Do each part in a subtask.

### The value to a user, and who that user might be

- Developer: one work qube, with 8 GB of static memory given back to the system.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
<!-- AC:END -->
