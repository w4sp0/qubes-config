---
id: TASK-001.01
title: 'cloud: README describes a development environment'
status: In Progress
assignee: []
created_date: '2026-09-23 20:39'
updated_date: '2026-09-24 07:58'
labels:
  - cloud
  - docs
milestone: m-1
dependencies: []
references:
  - salt/cloud/README.md
parent_task_id: TASK-001
priority: low
type: docs
ordinal: 9000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b

### Brief summary

The first line of `salt/cloud/README.md` is "Development environment in Qubes OS.", copied from `salt/dev`. Lines 14 and 37 are longer than 78 columns and fail rule MD013.

### Expected behavior

The README describes the cloud operations qube and passes `scripts/markdown-lint.sh`.

### Actual behavior

The README has the dev summary. `mdl` reports MD013 on lines 14 and 37.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 The README summary line describes the cloud operations qube
- [x] #2 scripts/markdown-lint.sh salt/cloud/README.md exits 0
- [ ] #3 Usage lists the installed tools
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
Summary line is now 'Cloud operations environment in Qubes OS.'; long description line wrapped and the double blank line removed. markdown-lint passes. AC #3 (Usage lists the tools) is open; rpm_spec/qusal-cloud.spec Summary changes at the next spec regeneration.
<!-- SECTION:NOTES:END -->
