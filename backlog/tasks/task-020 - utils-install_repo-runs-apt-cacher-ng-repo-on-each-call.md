---
id: TASK-020
title: 'utils: install_repo runs apt-cacher-ng-repo on each call'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - utils
  - sys-cacher
  - idempotency
milestone: m-3
dependencies: []
references:
  - salt/utils/macros/install-repo.sls
priority: low
type: enhancement
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Macro `install_repo` adds `cmd.run: apt-cacher-ng-repo` with no requisite. The command runs on each apply, once for each repository, and reports a change each time.

### Proposed solution

Run `apt-cacher-ng-repo` only when the repository file of the same macro call changes.

### The value to a user, and who that user might be

- User: a repeated apply reports no false changes and completes faster.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A second apply of a state that calls install_repo reports 0 changes
- [ ] #2 A new or changed repository file still triggers apt-cacher-ng-repo
<!-- AC:END -->
