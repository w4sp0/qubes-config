---
id: TASK-025.01
title: 'sys-tailscale: clients cannot resolve tailnet names'
status: To Do
assignee: []
created_date: '2026-09-23 21:02'
labels:
  - sys-tailscale
  - dns
  - network
milestone: m-5
dependencies: []
references:
  - salt/sys-tailscale/README.md
  - 'https://tailscale.com/kb/1081/magicdns'
parent_task_id: TASK-025
priority: medium
type: spike
ordinal: 1100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/sys-tailscale/README.md` states that clients of `sys-tailscale` reach tailnet devices by IP only. Qubes sends client DNS to `10.139.1.1` and `10.139.1.2` in the netvm, not to MagicDNS (`100.100.100.100`). Homelab qubes must then use hard-coded IP addresses in kubeconfig, talosconfig and bookmarks.

### Proposed solution

Examine if `sys-tailscale` can send client DNS to MagicDNS and to the upstream resolver for other names. Keep the Qubes DNS redirection for non-tailnet names.

### The value to a user, and who that user might be

- User: uses tailnet host names in homelab qubes.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A written result states if MagicDNS works for sys-tailscale clients and the configuration it needs
- [ ] #2 The result confirms that non-tailnet names still resolve
- [ ] #3 If possible, a follow-up task exists for the implementation
<!-- AC:END -->
