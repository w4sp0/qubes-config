---
id: TASK-024.02
title: 'qmk: install the QMK build toolchain'
status: To Do
assignee: []
created_date: '2026-09-23 21:02'
updated_date: '2026-09-23 21:11'
labels:
  - qmk
  - toolchain
milestone: m-4
dependencies:
  - TASK-024.01
references:
  - salt/otee-embedded/install.sls
  - 'https://docs.qmk.fm/newbs_getting_started'
parent_task_id: TASK-024
priority: high
type: feature
ordinal: 1200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`tpl-qmk` does not exist. QMK needs an ARM cross compiler for the RP2040 controllers of the Corne.

### Proposed solution

Install `gcc-arm-none-eabi` and `libnewlib-arm-none-eabi` from Debian. Add `picotool` only if TASK-024.01 selects it. No AVR or DFU tools are needed.

Build with `make` from the repository, so that the `qmk` Python CLI is optional. If the CLI is needed, pin its version. TASK-015 installs the same ARM packages in `otee-embedded`; use one shared state if possible.

### The value to a user, and who that user might be

- Developer: builds the firmware with distribution packages only.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 arm-none-eabi-gcc --version runs in qube qmk
- [ ] #2 No AVR or DFU package is installed in tpl-qmk
- [ ] #3 The packages are installed with install_recommends False
- [ ] #4 README.md lists the packages
<!-- AC:END -->
