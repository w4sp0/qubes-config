---
id: TASK-001.02
title: 'cloud: decision-001 conflicts with the Debian template'
status: To Do
assignee: []
created_date: '2026-09-23 20:39'
labels:
  - cloud
  - decision
milestone: m-1
dependencies: []
references:
  - backlog/decisions/decision-001 - use-fedora-template-for-cloud-qube.md
  - salt/cloud/clone.sls
parent_task_id: TASK-001
priority: low
type: docs
ordinal: 9500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`decision-001` has status `proposed` and selects Fedora 42. Commit 7241c93 changed `salt/cloud/clone.sls` to `debian-minimal`. The Consequences section is empty.

### Proposed solution

Record the Debian decision and the reason for it. Set the status to `accepted`, or add a new decision that supersedes decision-001.

### The value to a user, and who that user might be

- Developer: knows which template the cloud formulas use, and why.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The accepted decision identifies debian-minimal as the cloud template base
- [ ] #2 The Consequences section lists the tools that are not in Debian and how the formula installs them
- [ ] #3 Decision status is accepted or superseded
<!-- AC:END -->
