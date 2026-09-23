---
id: TASK-027.01
title: 'net: define the network policy of each qube'
status: To Do
assignee: []
created_date: '2026-09-23 21:12'
labels:
  - network
  - firewall
  - decision
milestone: m-7
dependencies: []
references:
  - salt/mail/firewall.sls
  - salt/sys-net/files/server/rpc/qusal.ConnectTCP
  - 'https://www.qubes-os.org/doc/firewall/'
parent_task_id: TASK-027
priority: high
type: spike
ordinal: 1100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

There is no written rule for when a qube gets a netvm, when it uses `qusal.ConnectTCP` instead, and which egress a networked qube may have.

### Proposed solution

Write a backlog decision with:

1. The default: no netvm, and `qusal.ConnectTCP` for a small set of host and port pairs (as `dev` does now).
2. The criteria for a netvm (for example many hosts, UDP, or a browser).
3. For each networked qube: the netvm (`sys-firewall`, `sys-tailscale`, `sys-wireguard`, whonix) and the allowed egress. State where `dsthost` is not usable because the provider rotates addresses (see the note in `salt/mail/firewall.sls`).
4. The global `default_netvm`: keep it, or set it to empty so that a new qube has no network until a formula gives it one.

Include the qubes of TASK-001.04 (`cloud`) and TASK-025 (homelab).

### The value to a user, and who that user might be

- User: each qube's network access follows one written rule.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision contains a table of each qube with netvm, egress rules or ConnectTCP targets, and the reason
- [ ] #2 The decision states the value of the global default_netvm
- [ ] #3 Follow-up tasks exist for each formula that must change
<!-- AC:END -->
