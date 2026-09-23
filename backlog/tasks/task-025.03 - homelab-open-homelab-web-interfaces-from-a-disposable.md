---
id: TASK-025.03
title: 'homelab: open homelab web interfaces from a disposable'
status: To Do
assignee: []
created_date: '2026-09-23 21:02'
labels:
  - homelab
  - browser
  - tailscale
milestone: m-5
dependencies: []
references:
  - salt/browser/
  - salt/sys-tailscale/
parent_task_id: TASK-025
priority: low
type: feature
ordinal: 1300
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The Proxmox web interface and the self-hosted service dashboards are on the tailnet. No qube has a browser with a tailnet netvm and a firewall limited to the homelab.

### Proposed solution

Add a disposable template with a browser, `sys-tailscale` as netvm, and a firewall that allows only the homelab addresses from TASK-025.

### The value to a user, and who that user might be

- User: opens homelab web interfaces in a disposable that cannot reach the internet.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The Proxmox web interface opens in the disposable
- [ ] #2 qvm-firewall of the disposable template drops traffic to addresses outside the homelab
- [ ] #3 README.md documents how to start the disposable
<!-- AC:END -->
