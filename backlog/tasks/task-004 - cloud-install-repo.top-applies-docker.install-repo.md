---
id: TASK-004
title: 'cloud: install-repo.top applies docker.install-repo'
status: Done
assignee: []
created_date: '2026-09-23 20:39'
updated_date: '2026-09-25 19:34'
labels:
  - cloud
  - top
milestone: m-0
dependencies: []
references:
  - salt/cloud/install-repo.top
  - salt/cloud/install-repo.sls
priority: high
type: bug
ordinal: 1875
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b

### Brief summary

`salt/cloud/install-repo.top` targets `tpl-cloud` with state `docker.install-repo`. The correct state is `cloud.install-repo` (mise repository).

### Steps to reproduce

1. Run `sudo qubesctl top.enable cloud.install-repo`.
2. Run `sudo qubesctl --skip-dom0 --targets=tpl-cloud state.highstate`.

### Expected behavior

The mise repository is added to `tpl-cloud`.

### Actual behavior

The Docker repository is added to `tpl-cloud`. The mise repository is not added.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 salt/cloud has no install-repo.sls, no install-repo.top and no files/repo/mise.* files
- [x] #2 cloud.install does not include or require an install-repo state and does not install mise
- [x] #3 grep -rn cloud.install-repo salt docs returns no match
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
Resolution changed: the project does not use mise, and cloud.install-repo only added the mise repository. The state, its top file and the mise repository files are removed instead of fixed, and mise is removed from cloud.install. cloud.install applied on tpl-cloud.
<!-- SECTION:NOTES:END -->
