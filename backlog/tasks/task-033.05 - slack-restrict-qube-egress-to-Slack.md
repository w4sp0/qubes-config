---
id: TASK-033.05
title: 'slack: restrict qube egress to Slack'
status: To Do
assignee: []
created_date: '2026-09-23 21:50'
updated_date: '2026-09-23 21:51'
labels:
  - slack
  - firewall
  - network
milestone: m-9
dependencies:
  - TASK-027.02
  - TASK-033.02
references:
  - salt/mail/firewall.sls
parent_task_id: TASK-033
priority: medium
type: feature
ordinal: 1500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Qube `slack` would have full network access. slack-tui needs HTTPS and WebSocket to Slack only.

### Proposed solution

Add `slack.firewall` with the TASK-027.02 macro: allow DNS and TCP 443, and drop the rest. Examine if `dsthost` rules for Slack domains are usable. `qubes-firewall` resolves host names only when the rules are applied, and Slack uses CDN addresses that change (see the note in `salt/mail/firewall.sls`). If they are not usable, restrict to port 443 only and record why.

### The value to a user, and who that user might be

- User: a compromised slack-tui can reach only HTTPS, and Slack hosts if possible.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 qvm-firewall slack shows only the DNS rule, the 443 rules and a final drop
- [ ] #2 slack-tui works with the rules active for one day with no connection errors
- [ ] #3 The task notes record if dsthost rules were usable
<!-- AC:END -->
