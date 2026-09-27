---
id: TASK-037.05
title: 'dev: keep the work tree between qusal.DevRun calls'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dev
  - qrexec
  - performance
milestone: m-3
dependencies:
  - TASK-037.04
parent_task_id: TASK-037
priority: medium
type: enhancement
ordinal: 18500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Each `qusal.DevRun` call extracts the tree again, so every file gets a new modification time and `cargo` and `make` rebuild everything.

### Proposed solution

Keep the work tree in the disposable between calls. Update only files whose content changed, remove deleted files, and do not touch the build directories.

### The value to a user, and who that user might be

- Developer: a second build in the same session is incremental.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 After a second call with one changed file the other files keep their modification time
- [ ] #2 A file deleted in dev is deleted in the disposable work tree
- [ ] #3 A second cargo build after a one-line change compiles only the changed crate
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
