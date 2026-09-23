---
id: TASK-009.04
title: 'discord: rewrite README for discordo'
status: In Progress
assignee: []
created_date: '2026-09-23 20:40'
updated_date: '2026-09-23 21:58'
labels:
  - discord
  - docs
milestone: m-0
dependencies:
  - TASK-009.02
references:
  - salt/discord/README.md
parent_task_id: TASK-009
priority: low
type: docs
ordinal: 7400
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/discord/README.md` is the Signal README. Title, description and commands refer to `signal`.

### Proposed solution

Describe qube `discord`, the `discordo` client and the correct `qubesctl` commands.

### The value to a user, and who that user might be

- User: installs and uses the formula from the README only.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 README.md contains no reference to Signal
- [x] #2 All commands in the README target discord states and qubes
- [x] #3 scripts/markdown-lint.sh salt/discord/README.md exits 0
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
README rewritten for discordo, the builder dependency, the install-binary step, the policy and the update procedure. markdown-lint passes. Set Done after the commands are run on the machine.
<!-- SECTION:NOTES:END -->
