---
id: TASK-021
title: 'scripts: lint top files for missing SLS references'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - scripts
  - lint
  - pre-commit
milestone: m-3
dependencies: []
references:
  - scripts/salt-lint.sh
  - .pre-commit-config.yaml
priority: high
type: feature
ordinal: 2000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

No check makes sure that each state in a `.top` file has an `.sls` file. TASK-004, TASK-005, TASK-006, TASK-007 and TASK-009.01 were not found by CI.

### Proposed solution

Add `scripts/top-lint.sh`. It fails when a `.top` file references a missing SLS, or a formula `install-repo.top` references the state of another formula. Add it to `.pre-commit-config.yaml`.

### The value to a user, and who that user might be

- Developer: gets an error at commit time, not at apply time.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 scripts/top-lint.sh exits 1 and prints file and state for each missing reference
- [ ] #2 scripts/top-lint.sh exits 0 on a tree with no defect
- [ ] #3 pre-commit runs the script on changed .top and .sls files
- [ ] #4 The script passes scripts/shell-lint.sh
<!-- AC:END -->
