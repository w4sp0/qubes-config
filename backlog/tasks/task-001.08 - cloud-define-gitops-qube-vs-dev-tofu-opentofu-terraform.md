---
id: TASK-001.08
title: 'cloud: define gitops qube vs dev-tofu, opentofu, terraform'
status: To Do
assignee: []
created_date: '2026-09-23 20:40'
labels:
  - cloud
  - dev-tofu
  - gitops
milestone: m-1
dependencies: []
references:
  - salt/dev-tofu/
  - salt/opentofu/
  - salt/terraform/
parent_task_id: TASK-001
priority: medium
type: spike
ordinal: 2000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

TASK-001 separates ops (`cloud`) and gitops qubes. Formulas `dev-tofu`, `opentofu` and `terraform` overlap, and `dev-tofu` is unfinished (`install.sls`: "TODO: define properly, unfinished").

### Proposed solution

Select one formula as the gitops qube. Record which formulas stay, which merge and which are removed.

### The value to a user, and who that user might be

- Developer: maintains one gitops formula, not three.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision names the gitops formula
- [ ] #2 The decision lists the tools of TASK-001 that the gitops qube installs
- [ ] #3 Follow-up tasks exist for each merge or removal
<!-- AC:END -->
