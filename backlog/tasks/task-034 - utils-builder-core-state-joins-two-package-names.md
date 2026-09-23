---
id: TASK-034
title: 'utils: builder core state joins two package names'
status: To Do
assignee: []
created_date: '2026-09-23 21:58'
labels:
  - utils
  - upstream
milestone: m-0
dependencies: []
references:
  - salt/utils/tools/builder/core.sls
priority: medium
type: bug
ordinal: 7600
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b (defect is inherited from upstream qusal).

### Brief summary

The Debian package list in `salt/utils/tools/builder/core.sls` has `'build-essential' 'debhelper'` with no comma. Jinja joins adjacent string literals, so the list contains one package `build-essentialdebhelper`.

### Steps to reproduce

1. Run `sudo qubesctl --skip-dom0 --targets=<Debian template> state.apply utils.tools.builder.core`.

### Expected behavior

`build-essential` and `debhelper` are installed.

### Actual behavior

Expected: the state fails because package `build-essentialdebhelper` does not exist. Confirm on the machine.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The Debian list in core.sls has build-essential and debhelper as separate items
- [ ] #2 utils.tools.builder.core applies without error on a Debian template
<!-- AC:END -->
