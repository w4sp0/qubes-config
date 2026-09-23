---
id: TASK-009
title: 'discord: implement formula'
status: To Do
assignee: []
created_date: '2026-09-23 20:39'
labels:
  - discord
milestone: m-0
dependencies: []
references:
  - salt/discord/
  - salt/signal/
priority: medium
type: feature
ordinal: 7000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/discord` is a copy of `salt/signal`. It installs Signal, not a Discord client. It has no `rpm_spec`.

### Proposed solution

Make the formula install `discordo` (TUI Discord client) in `tpl-discord`. Do each fix in a subtask.

### The value to a user, and who that user might be

- User: gets a Discord client in an isolated qube.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
- [ ] #2 The README.md installation commands apply without error
<!-- AC:END -->
