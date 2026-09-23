---
id: TASK-001.05
title: 'cloud: install non-Debian CLIs from the builder disposable'
status: To Do
assignee: []
created_date: '2026-09-23 20:40'
updated_date: '2026-09-23 21:47'
labels:
  - cloud
  - supply-chain
  - builder
milestone: m-1
dependencies:
  - TASK-032
references:
  - salt/cloud/install.sls
  - >-
    backlog/tasks/task-032 -
    utils-install-verified-binaries-into-templates-from-a-builder-disposable.md
parent_task_id: TASK-001
priority: medium
type: feature
ordinal: 3000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`helm`, `k9s`, `argocd`, `cilium`, `hubble` and `cloud-nuke` are not in Debian trixie (confirm `helm` with `apt-cache policy` in `tpl-cloud`; decision-001 says it is packaged). The project does not use `mise`.

### Proposed solution

Install each tool into `tpl-cloud` with the TASK-032 macro. Pin the release version and SHA-256 of each tool in one place in the formula.

### The value to a user, and who that user might be

- User: gets the same verified tool versions in each qube based on `tpl-cloud`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 helm, k9s, argocd, cilium, hubble and cloud-nuke are in PATH in qube cloud
- [ ] #2 Each tool has a pinned version and SHA-256 in one location in salt/cloud
- [ ] #3 The install fails and installs nothing when a checksum does not match
- [ ] #4 A second apply reports no changes
<!-- AC:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-23 21:47
---
Rewritten: mise is not used in this project (2026-09-23). Tools come from the builder disposable of TASK-032.
---
<!-- COMMENTS:END -->
