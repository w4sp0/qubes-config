---
id: TASK-038.08
title: 'otee-dev: allow github.com:22 through qusal.ConnectTCP'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - otee-dev
  - network
  - policy
milestone: m-2
dependencies:
  - TASK-038.01
parent_task_id: TASK-038
priority: high
type: feature
ordinal: 81000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`otee-dev` has no netvm and no policy to reach GitHub.

### Proposed solution

Add the rule `qusal.ConnectTCP +github.com+22 otee-dev @default allow target=disp-sys-net` to the policy file of the `otee-dev` formula.

### The value to a user, and who that user might be

- Developer: pushes and pulls work repositories from otee-dev.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 git fetch of a GitHub repository in otee-dev succeeds
- [ ] #2 The rule is in the otee-dev formula and not in /etc/qubes/policy.d/30-user.policy
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
