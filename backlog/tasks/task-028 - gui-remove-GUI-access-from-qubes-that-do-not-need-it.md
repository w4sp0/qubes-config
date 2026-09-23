---
id: TASK-028
title: 'gui: remove GUI access from qubes that do not need it'
status: To Do
assignee: []
created_date: '2026-09-23 21:12'
labels:
  - gui
  - hardening
milestone: m-7
dependencies: []
references:
  - salt/sys-ssh-agent/create.sls
  - salt/sys-git/create.sls
  - salt/sys-pgp/create.sls
  - 'https://www.qubes-os.org/doc/gui-domain/'
priority: medium
type: feature
ordinal: 2000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

All qubes use the default GUI domain (dom0). Service qubes such as `sys-ssh-agent`, `sys-git`, `sys-pgp`, `sys-rsync` and `sys-tailscale` get a GUI agent connection, and many set `menu-items` with a terminal. A qube with a GUI connection can draw windows and read the clipboard when the user pastes into it. For a headless service this is attack surface with no use.

### Proposed solution

Define which qubes need a GUI, then remove GUI access from the others. Do each part in a subtask.

### The value to a user, and who that user might be

- User: a compromised service qube cannot show windows or fake prompts.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
- [ ] #2 Each formula README states if its qubes have a GUI and how to debug a qube with no GUI
<!-- AC:END -->
