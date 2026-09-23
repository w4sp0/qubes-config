---
id: TASK-025.02
title: 'homelab: install talosctl in the operations template'
status: To Do
assignee: []
created_date: '2026-09-23 21:02'
labels:
  - homelab
  - talos
  - mise
  - supply-chain
milestone: m-5
dependencies:
  - TASK-001.05
references:
  - 'https://www.talos.dev/latest/talos-guides/install/talosctl/'
  - salt/cloud/install.sls
parent_task_id: TASK-025
priority: medium
type: feature
ordinal: 1200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`talosctl` is not in Debian. The operations template does not have it.

### Proposed solution

Pin `talosctl` with the `mise` configuration and lockfile from TASK-001.05, in the template that TASK-025 selects. Match the version to the Talos version of the cluster.

### The value to a user, and who that user might be

- User: runs `talosctl` against the cluster with a verified binary.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 talosctl version --client runs in the operations qube
- [ ] #2 The version and checksum are pinned in the repository
- [ ] #3 The install fails when the checksum does not match
<!-- AC:END -->
