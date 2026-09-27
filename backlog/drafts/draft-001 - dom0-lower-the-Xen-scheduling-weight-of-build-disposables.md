---
id: DRAFT-001
title: 'dom0: lower the Xen scheduling weight of build disposables'
status: Draft
assignee: []
created_date: '2026-09-27 10:44'
labels:
  - dom0
  - performance
milestone: m-3
dependencies: []
priority: low
type: spike
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

A build with 6 vCPUs competes for CPU time with interactive qubes on 12 cores.

### Proposed solution

Examine a dom0 hook that sets `xl sched-credit2 -w 128` on disposables of `dvm-dev` and `dvm-otee-dev` when they start.

### The value to a user, and who that user might be

- User: interactive qubes stay responsive during a build.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A written result states if the hook works with Qubes and its maintenance cost
- [ ] #2 If it works a follow-up task exists for the implementation
<!-- AC:END -->
