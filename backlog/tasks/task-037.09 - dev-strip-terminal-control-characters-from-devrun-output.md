---
id: TASK-037.09
title: 'dev: strip terminal control characters from devrun output'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dev
  - qrexec
  - hardening
milestone: m-3
dependencies:
  - TASK-037.07
parent_task_id: TASK-037
priority: high
type: feature
ordinal: 76000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The output of `devrun` comes from code that runs in the disposable. Terminal escape sequences in it can change the terminal of `dev`.

### Proposed solution

Filter the output in `devrun` so that only printable characters, tabs and newlines reach the terminal.

### The value to a user, and who that user might be

- User: output of an untrusted build cannot control the terminal of `dev`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 An escape sequence printed in the disposable does not reach the dev terminal
- [ ] #2 Printable text and tabs and newlines are unchanged
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
