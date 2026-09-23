---
id: TASK-033
title: 'slack: add work Slack TUI formula'
status: To Do
assignee: []
created_date: '2026-09-23 21:50'
labels:
  - slack
  - work
  - feature
milestone: m-9
dependencies: []
references:
  - 'https://github.com/kurenn/slack-tui'
  - salt/discord/
  - salt/mail/
priority: medium
type: feature
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

I use the work Slack workspace. No qube runs a Slack client, and the Electron client is a large GUI stack.

### Proposed solution

Add formula `salt/slack` with `tpl-slack` (from `debian-minimal`) and app qube `slack`, separate from the personal `discord` qube. Install the `slack-tui` terminal client (Go, MIT, releases with `checksums.txt`) through the TASK-032 builder. Do each part in a subtask.

Risks to keep in view: the project started in June 2026 and has one maintainer, and its Slack app asks for broad user scopes (history, write, files, search, profile). So the qube holds only work Slack data and reaches only Slack.

### The value to a user, and who that user might be

- User: reads and writes work Slack from a terminal in an isolated work qube.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
- [ ] #2 The README.md installation commands apply without error
- [ ] #3 rpm_spec/qusal-slack.spec exists and scripts/spec-build.sh slack exits 0
<!-- AC:END -->
