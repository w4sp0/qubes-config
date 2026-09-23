---
id: TASK-024.03
title: 'qmk: build Miryoku for the Corne in qube qmk'
status: To Do
assignee: []
created_date: '2026-09-23 21:02'
labels:
  - qmk
  - git
  - qrexec
milestone: m-4
dependencies:
  - TASK-024.02
references:
  - 'https://github.com/manna-harbour/miryoku_qmk'
  - 'https://github.com/qmk/qmk_userspace'
  - salt/dev/README.md
parent_task_id: TASK-024
priority: medium
type: feature
ordinal: 1300
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`miryoku_qmk` is a fork of `qmk_firmware`. The clone needs the QMK submodules (ChibiOS, LUFA and others) from GitHub. Qube `qmk` has no netvm.

### Proposed solution

Allow `qmk` to reach `github.com:22` through `qusal.ConnectTCP`, as in the `dev` formula. Document the clone and the build command (`make crkbd:manna-harbour_miryoku` with the `MIRYOKU_*` options I use).

Examine if a `qmk_userspace` repository with upstream `qmk_firmware` is easier to maintain than the fork. Record the result in the task notes.

### The value to a user, and who that user might be

- Developer: builds the keymap locally and keeps personal changes in a repository.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Qube qmk has no netvm
- [ ] #2 README.md contains the qrexec policy for github.com and the clone command
- [ ] #3 The documented build command produces the firmware file for both Corne halves
- [ ] #4 The task notes record the fork or userspace result
<!-- AC:END -->
