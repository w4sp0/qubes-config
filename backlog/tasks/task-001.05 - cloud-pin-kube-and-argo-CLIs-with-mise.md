---
id: TASK-001.05
title: 'cloud: pin non-Debian CLIs with mise'
status: To Do
assignee: []
created_date: '2026-09-23 20:40'
updated_date: '2026-09-23 20:42'
labels:
  - cloud
  - mise
  - supply-chain
milestone: m-1
dependencies: []
references:
  - salt/cloud/install.sls
  - 'https://mise.jdx.dev/configuration.html'
  - 'https://mise.jdx.dev/dev-tools/mise-lock.html'
parent_task_id: TASK-001
priority: medium
type: feature
ordinal: 3000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`helm`, `k9s`, `argocd`, `cilium`, `hubble` and `cloud-nuke` are not in Debian trixie. `mise` is installed in `tpl-cloud` but has no configuration.

### Proposed solution

Add a system `mise` configuration and lockfile to `tpl-cloud` that pins the version and checksum of each tool. Install the tools in the template through the update proxy.

### The value to a user, and who that user might be

- User: gets the same verified tool versions in each qube based on `tpl-cloud`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 helm, k9s, argocd, cilium, hubble and cloud-nuke are in PATH in qube cloud
- [ ] #2 Each tool has a pinned version and checksum in the repository
- [ ] #3 The install fails when a checksum does not match
- [ ] #4 A second apply reports no changes
<!-- AC:END -->
