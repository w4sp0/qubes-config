---
id: TASK-022
title: 'ci: cache pip and pre-commit environments'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - ci
  - performance
milestone: m-3
dependencies:
  - TASK-008
references:
  - .github/workflows/main.yaml
  - dependencies/pip.txt
priority: low
type: enhancement
ordinal: 3000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Job `lint` in `main.yaml` installs `dependencies/pip.txt` and builds the pre-commit environments on each run with no cache.

### Proposed solution

Enable the `actions/setup-python` pip cache with `dependencies/pip.txt` as the key. Cache `~/.cache/pre-commit` with `.pre-commit-config.yaml` as the key.

### The value to a user, and who that user might be

- Developer: gets lint results faster.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A second run with unchanged dependency files restores both caches
- [ ] #2 A change to dependencies/pip.txt or .pre-commit-config.yaml invalidates the related cache
- [ ] #3 The job duration of a cached run is recorded in the task notes
<!-- AC:END -->
