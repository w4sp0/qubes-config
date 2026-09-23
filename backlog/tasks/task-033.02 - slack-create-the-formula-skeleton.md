---
id: TASK-033.02
title: 'slack: create the formula skeleton'
status: To Do
assignee: []
created_date: '2026-09-23 21:50'
labels:
  - slack
  - formula
milestone: m-9
dependencies:
  - TASK-033.01
references:
  - salt/discord/
  - salt/mail/install-reader.sls
parent_task_id: TASK-033
priority: medium
type: feature
ordinal: 1200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/slack` does not exist.

### Proposed solution

Add `clone`, `create`, `install`, `configure` states and their top files, based on the cleaned `discord` formula: `tpl-slack` cloned from `debian-minimal`, app qube `slack` with a work label, no audio, menu items for a terminal only. Install `qubes-core-agent-networking`, `ca-certificates` and `xclip` (clipboard for slack-tui). Follow the GUI rules of TASK-028.01 if that decision exists.

### The value to a user, and who that user might be

- User: gets the qube and the template with one documented install.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 slack.create creates tpl-slack and slack
- [ ] #2 slack.install installs only the listed packages with install_recommends False
- [ ] #3 Every state named in a slack top file exists
- [ ] #4 tpl-slack is not shared with any other formula
<!-- AC:END -->
