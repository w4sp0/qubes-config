---
id: TASK-024
title: 'qmk: add keyboard firmware formula'
status: To Do
assignee: []
created_date: '2026-09-23 21:01'
labels:
  - qmk
  - keyboard
  - feature
milestone: m-4
dependencies: []
references:
  - salt/dev/
  - salt/otee-embedded/
  - 'https://github.com/manna-harbour/miryoku_qmk'
  - 'https://docs.qmk.fm/newbs_getting_started'
priority: medium
type: feature
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The Corne keyboard uses the Miryoku layout on QMK (`manna-harbour/miryoku_qmk`). No qube builds or flashes the firmware, so I cannot develop the keymap locally.

### Proposed solution

Add formula `salt/qmk` with `tpl-qmk`, `dvm-qmk` and qube `qmk`, based on the `dev` formula pattern (no netvm, git through `qusal.ConnectTCP` or `sys-git`). Do each part in a subtask.

Keyboard firmware controls an input device. The qube that builds and flashes it is part of the input trust path, so it must not share a qube with untrusted code.

### The value to a user, and who that user might be

- User: changes the Miryoku keymap, builds it and flashes the Corne without leaving Qubes.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
- [ ] #2 The README.md installation commands apply without error
- [ ] #3 rpm_spec/qusal-qmk.spec exists and scripts/spec-build.sh qmk exits 0
<!-- AC:END -->
