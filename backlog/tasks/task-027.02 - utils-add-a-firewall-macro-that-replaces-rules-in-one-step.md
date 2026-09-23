---
id: TASK-027.02
title: 'utils: add a firewall macro that replaces rules in one step'
status: To Do
assignee: []
created_date: '2026-09-23 21:12'
labels:
  - utils
  - firewall
  - idempotency
milestone: m-7
dependencies: []
references:
  - salt/mail/firewall.sls
  - salt/utils/macros/
parent_task_id: TASK-027
priority: high
type: enhancement
ordinal: 1200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/mail/firewall.sls` has three defects that a copy to other formulas would repeat:

- `qvm-firewall reset` sets a single `accept` rule. Until the final `drop` and `del --rule-no 0`, the qube can connect to any address.
- The `cmd.run` has no `unless`, so each apply rewrites the rules and reports a change.
- The logic is inline, so another formula cannot use it.

### Proposed solution

Add a macro in `salt/utils/macros/` that takes a qube and a rule list. It replaces the full rule list in one Admin API call (`admin.vm.firewall.Set`, for example with `qubesadmin` in Python). It changes nothing when the current rules are equal to the requested rules. Change `mail.firewall` to use the macro.

### The value to a user, and who that user might be

- User: no apply opens a qube to all addresses, even for a moment.
- Developer: adds egress rules to a formula with one macro call.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 At no time during an apply does qvm-firewall of the target qube list a rule that accepts all traffic
- [ ] #2 A second apply with the same rules reports 0 changes
- [ ] #3 mail.firewall uses the macro and creates the same final rules as before
- [ ] #4 The macro docstring documents its arguments
<!-- AC:END -->
