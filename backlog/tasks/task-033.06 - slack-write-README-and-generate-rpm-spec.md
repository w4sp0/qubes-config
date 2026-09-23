---
id: TASK-033.06
title: 'slack: write README and generate rpm spec'
status: To Do
assignee: []
created_date: '2026-09-23 21:50'
labels:
  - slack
  - docs
  - rpm
milestone: m-9
dependencies:
  - TASK-033.03
  - TASK-033.04
  - TASK-033.05
references:
  - scripts/spec-gen.sh
  - salt/discord/README.md
parent_task_id: TASK-033
priority: low
type: docs
ordinal: 1600
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The formula needs a README with installation, sign-in, firewall and update (pin change) procedures, and an rpm spec.

### Proposed solution

Write `salt/slack/README.md` in the format of the other formulas, with the post-install block. Generate the spec with `scripts/spec-gen.sh slack`.

### The value to a user, and who that user might be

- User: installs and updates the formula from the README only.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 scripts/markdown-lint.sh salt/slack/README.md exits 0
- [ ] #2 The README documents how to change the slack-tui pin
- [ ] #3 rpm_spec/qusal-slack.spec exists and scripts/spec-build.sh slack exits 0
<!-- AC:END -->
