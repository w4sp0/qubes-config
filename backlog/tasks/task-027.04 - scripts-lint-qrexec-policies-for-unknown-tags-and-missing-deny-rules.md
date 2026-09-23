---
id: TASK-027.04
title: 'scripts: lint qrexec policies for unknown tags and missing deny rules'
status: To Do
assignee: []
created_date: '2026-09-23 21:12'
labels:
  - scripts
  - lint
  - qrexec
  - policy
milestone: m-7
dependencies: []
references:
  - salt/*/files/admin/policy/default.policy
  - >-
    backlog/tasks/task-021 -
    scripts-lint-top-files-for-missing-SLS-references.md
parent_task_id: TASK-027
priority: medium
type: feature
ordinal: 1400
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

No check found the misspelled tag of TASK-027.03. A policy file can allow a service for a source and leave out the final deny for that source.

### Proposed solution

Add `scripts/policy-lint.sh`. For each `default.policy`, it fails when a `@tag:` is not set by any state in the repository, or when a service and source pair with `allow` has no `deny` rule for that pair. Add it to `.pre-commit-config.yaml`, as TASK-021 does for top files.

### The value to a user, and who that user might be

- Developer: finds policy mistakes at commit time.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The script exits 1 on the policy of TASK-027.03 before the fix
- [ ] #2 The script exits 0 on the tree after the fixes
- [ ] #3 pre-commit runs the script on changed policy files
- [ ] #4 The script passes scripts/shell-lint.sh
<!-- AC:END -->
