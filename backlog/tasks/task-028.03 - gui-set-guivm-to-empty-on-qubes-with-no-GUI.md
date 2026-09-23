---
id: TASK-028.03
title: 'gui: set guivm to empty on qubes with no GUI'
status: To Do
assignee: []
created_date: '2026-09-23 21:13'
labels:
  - gui
  - hardening
milestone: m-7
dependencies:
  - TASK-028.01
references:
  - salt/sys-ssh-agent/create.sls
  - salt/sys-git/create.sls
  - salt/sys-pgp/create.sls
parent_task_id: TASK-028
priority: medium
type: feature
ordinal: 2300
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

After TASK-028.01, the qubes with no GUI still have `guivm` set to the default.

### Proposed solution

In each `create.sls` from the TASK-028.01 table, set `guivm: ""`, and remove `menu-items` and `default-menu-items` if the decision says so. Make sure that the formula states that call these qubes use `qvm-run --no-gui` or qrexec only.

### The value to a user, and who that user might be

- User: the headless qubes have no GUI connection after a normal formula install.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 qvm-prefs guivm is empty for each qube with GUI no in the TASK-028.01 table
- [ ] #2 Each changed formula applies without error
- [ ] #3 The services of each changed qube (for example ssh-agent, git, split-gpg2) still work from their clients
<!-- AC:END -->
