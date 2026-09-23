---
id: TASK-004
title: 'cloud: install-repo.top applies docker.install-repo'
status: To Do
assignee: []
created_date: '2026-09-23 20:39'
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
ordinal: 2000
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
- [ ] #1 salt/cloud/install-repo.top applies cloud.install-repo to tpl-cloud
- [ ] #2 Highstate with the top enabled adds /etc/apt/sources.list.d/mise.sources and no docker.sources
<!-- AC:END -->
