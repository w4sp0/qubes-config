---
id: TASK-027
title: 'net: restrict network egress of each qube'
status: To Do
assignee: []
created_date: '2026-09-23 21:12'
labels:
  - network
  - firewall
  - hardening
milestone: m-7
dependencies: []
references:
  - salt/mail/firewall.sls
  - salt/sys-wireguard/files/admin/bin/qvm-wireguard
priority: high
type: feature
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

These formulas leave `netvm` at the global default and set no `qvm-firewall` rules, so their qubes can connect to any host and port: `browser`, `discord`, `element`, `fetcher`, `mirage-builder`, `opentofu`, `qubes-builder`, `remmina`, `signal`, `ssh`, `terraform`, `video-companion`, `sys-tailscale` and `sys-wireguard`. `electrum` and `sys-electrs` set `netvm: "*default*"` on some qubes.

Only `mail` restricts egress (`salt/mail/firewall.sls`). Qubes with no netvm use `qusal.ConnectTCP` or `qubes.ConnectTCP` policies, which are not checked together.

### Proposed solution

Define a policy for each qube, make one reusable firewall state, and apply it. Do each part in a subtask.

### The value to a user, and who that user might be

- User: a compromised qube can reach only the hosts and ports its purpose needs.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
- [ ] #2 Each formula README documents the netvm and the egress rules of its qubes
<!-- AC:END -->
