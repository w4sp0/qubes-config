---
id: TASK-037.04
title: 'dev: add qusal.DevRun RPC service'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - dev
  - qrexec
milestone: m-3
dependencies: []
references:
  - salt/dev/
  - salt/sys-net/files/server/rpc/qusal.ConnectTCP
parent_task_id: TASK-037
priority: high
type: feature
ordinal: 17500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

There is no way to send a work tree from `dev` to a disposable and get the result back.

### Proposed solution

Install a qrexec service `qusal.DevRun` in `tpl-dev`. It reads a work tree archive and a command from stdin, runs the command in the extracted tree, writes the output to stdout and exits with the exit code of the command.

### The value to a user, and who that user might be

- Developer: runs a build or test in a disposable with one call.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The service is installed in /etc/qubes-rpc/qusal.DevRun in tpl-dev
- [ ] #2 Given a Cargo project archive and the command cargo test the service writes the cargo output to stdout
- [ ] #3 The service exits with the exit code of the command
- [ ] #4 The service refuses to run in a qube that is not a disposable
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
