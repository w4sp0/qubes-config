---
id: TASK-006
title: 'usb: init.top references usb.configur-dvm'
status: In Progress
assignee: []
created_date: '2026-09-23 20:39'
updated_date: '2026-09-23 21:36'
labels:
  - usb
  - top
  - upstream
milestone: m-0
dependencies: []
references:
  - salt/usb/init.top
  - 'https://github.com/ben-grande/qusal'
priority: medium
type: bug
ordinal: 4000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b (defect is inherited from upstream qusal).

### Brief summary

`salt/usb/init.top` references state `usb.configur-dvm`. The state file is `salt/usb/configure-dvm.sls`.

### Steps to reproduce

1. Run `sudo qubesctl top.enable usb`.
2. Run `sudo qubesctl --targets=<usb dvm> state.highstate`.

### Expected behavior

`usb.configure-dvm` is applied.

### Actual behavior

Salt reports that SLS `usb.configur-dvm` is not found.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 salt/usb/init.top references usb.configure-dvm
- [ ] #2 Highstate with the usb top enabled reports no missing SLS
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
Fixed in salt/usb/init.top. AC #2 needs a highstate on dvm-usb.
<!-- SECTION:NOTES:END -->
