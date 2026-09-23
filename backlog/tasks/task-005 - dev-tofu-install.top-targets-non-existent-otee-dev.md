---
id: TASK-005
title: 'dev-tofu: install.top targets non-existent otee-dev'
status: To Do
assignee: []
created_date: '2026-09-23 20:39'
labels:
  - dev-tofu
  - top
milestone: m-0
dependencies: []
references:
  - salt/dev-tofu/install.top
priority: high
type: bug
ordinal: 3000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b

### Brief summary

`salt/dev-tofu/install.top` targets minion `tpl-otee-dev` with state `otee-dev.install`. The minion and the state do not exist.

### Steps to reproduce

1. Run `sudo qubesctl top.enable dev-tofu.install`.
2. Run `sudo qubesctl --skip-dom0 --targets=tpl-dev-tofu state.highstate`.

### Expected behavior

`dev-tofu.install` is applied to `tpl-dev-tofu`.

### Actual behavior

No state is applied to `tpl-dev-tofu`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 salt/dev-tofu/install.top applies dev-tofu.install to tpl-dev-tofu
- [ ] #2 No file under salt/dev-tofu/ contains the string otee-dev
<!-- AC:END -->
