---
id: TASK-027.05
title: 'net: apply egress rules to the networked qubes'
status: To Do
assignee: []
created_date: '2026-09-23 21:12'
labels:
  - network
  - firewall
milestone: m-7
dependencies:
  - TASK-027.01
  - TASK-027.02
references:
  - salt/mail/firewall.sls
parent_task_id: TASK-027
priority: medium
type: feature
ordinal: 1500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

After TASK-027.01 and TASK-027.02, the formulas still have no egress rules.

### Proposed solution

For each formula in the TASK-027.01 table, add a `firewall.sls` that calls the macro, set the netvm in `create.sls`, and add the state to the README installation commands. Rules come from pillar with the decision values as defaults, as in `mail.firewall`.

### The value to a user, and who that user might be

- User: the rules of the decision are active after a normal formula install.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 qvm-firewall of each qube in the TASK-027.01 table matches the table
- [ ] #2 The netvm of each qube matches the table
- [ ] #3 Each changed README lists the firewall state and the pillar keys
<!-- AC:END -->
