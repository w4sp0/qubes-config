---
id: TASK-028.01
title: 'gui: define which qubes need a GUI'
status: To Do
assignee: []
created_date: '2026-09-23 21:13'
labels:
  - gui
  - decision
milestone: m-7
dependencies: []
references:
  - 'https://www.qubes-os.org/doc/gui-domain/'
  - 'https://www.qubes-os.org/doc/console-troubleshooting/'
parent_task_id: TASK-028
priority: medium
type: spike
ordinal: 2100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

No rule states which qubes need a GUI. Setting `guivm: ""` removes the GUI connection, but a qube can then not open a terminal window or show a notification.

### Proposed solution

Write a backlog decision with a table of each qube (templates, app qubes, disposable templates, service qubes) and:

1. If it needs a GUI, and why (browser, NetworkManager applet in `sys-net`, a terminal for interactive work, notifications).
2. For qubes with no GUI: how to debug them (`qvm-console-dispvm`, `qvm-run --pass-io`) and how to update the template.
3. If the `menu-items` and `default-menu-items` features are removed from qubes with no GUI.
4. Qubes that need a GUI only for setup (for example `sys-tailscale` for `tailscale up`): keep the GUI, or document a CLI procedure.

### The value to a user, and who that user might be

- User: knows which qubes can show windows, and how to reach the others.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision contains a table of each qube with GUI yes or no and the reason
- [ ] #2 The decision states the debug procedure for a qube with no GUI
- [ ] #3 Follow-up tasks exist for each formula that must change
<!-- AC:END -->
