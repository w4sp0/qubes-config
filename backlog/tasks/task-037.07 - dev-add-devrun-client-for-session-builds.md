---
id: TASK-037.07
title: 'dev: add devrun client for session builds'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dev
  - qrexec
milestone: m-3
dependencies:
  - TASK-037.04
  - TASK-037.06
parent_task_id: TASK-037
priority: high
type: feature
ordinal: 74000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Calling `qrexec-client-vm` by hand with an archive on stdin is error-prone.

### Proposed solution

Install a `devrun` command in `tpl-dev`. `devrun <command>` archives the tracked and the untracked but not ignored files of the current git tree and calls `qusal.DevRun` on `disp-dev`.

### The value to a user, and who that user might be

- Developer: runs `devrun cargo test` from the project directory.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 devrun sends the tracked and the untracked but not ignored files to disp-dev
- [ ] #2 devrun does not send files that are ignored by git
- [ ] #3 The exit code of devrun is the exit code of the command in the disposable
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
