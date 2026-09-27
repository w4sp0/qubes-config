---
id: TASK-038.15
title: 'dom0: remove the otee-embedded qubes'
status: Done
assignee: []
created_date: '2026-09-27 10:44'
updated_date: '2026-09-27 12:52'
labels:
  - dom0
milestone: m-2
dependencies:
  - TASK-038.02
  - TASK-038.05
  - TASK-038.09
  - TASK-038.10
parent_task_id: TASK-038
priority: medium
type: chore
ordinal: 40500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`otee-embedded`, `disp-otee-embedded`, `dvm-otee-embedded` and `tpl-otee-embedded` are replaced by the `otee-dev` qubes.

### Proposed solution

Remove the four qubes with `qvm-remove`, in the order disposable, dvm, AppVM, template.

### The value to a user, and who that user might be

- User: one set of work qubes and templates to update.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 qvm-ls lists no qube whose name contains otee-embedded
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
2026-09-27: the user removed the otee-embedded qubes with Qubes Manager. qvm-ls --raw-list | grep otee-embedded has no output.
<!-- SECTION:NOTES:END -->
