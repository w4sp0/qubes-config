---
id: TASK-027.03
title: 'sys-bitcoin: ConnectTCP deny rule has a misspelled tag'
status: To Do
assignee: []
created_date: '2026-09-23 21:12'
labels:
  - sys-bitcoin
  - qrexec
  - policy
  - upstream
milestone: m-7
dependencies: []
references:
  - salt/sys-bitcoin/files/admin/policy/default.policy
parent_task_id: TASK-027
priority: medium
type: bug
ordinal: 1300
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b (defect is inherited from upstream qusal).

### Brief summary

Line 16 of `salt/sys-bitcoin/files/admin/policy/default.policy` is `qubes.ConnectTCP * @tag:bitcoin-clinet @anyvm deny`. The tag is `bitcoin-client`. The rule matches no qube, so it does not stop other ports for bitcoin clients.

### Expected behavior

A qube with tag `bitcoin-client` can connect only to ports 8332, 8333 and 8433 of `sys-bitcoin`. This file denies all other `qubes.ConnectTCP` calls from it.

### Actual behavior

This file does not deny the other calls. A policy file that is evaluated later can allow them.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The deny rule uses @tag:bitcoin-client
- [ ] #2 qrexec-policy for a bitcoin-client qube and qubes.ConnectTCP+22 reports deny from this file
<!-- AC:END -->
