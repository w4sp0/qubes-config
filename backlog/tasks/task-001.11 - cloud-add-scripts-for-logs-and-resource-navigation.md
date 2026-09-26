---
id: TASK-001.11
title: 'cloud: add scripts for logs and resource navigation'
status: To Do
assignee: []
created_date: '2026-09-25 21:56'
labels:
  - cloud
  - dotfiles
  - kubernetes
milestone: m-1
dependencies:
  - TASK-001.06
references:
  - salt/cloud/install.sls
  - salt/dotfiles/files/sh/.config/sh/shrc
parent_task_id: TASK-001
priority: low
type: feature
ordinal: 12500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Reading logs and moving between resources in a cluster takes long `kubectl` commands. `k9s` covers interactive use, but not quick shell work or scripts.

### Proposed solution

Collect the workflows that are used most, then add small POSIX shell scripts or functions for them. Candidates:
- Follow the logs of all pods of a deployment or label selector, with fzf to pick one.
- Pick a pod, container or namespace with fzf, then exec, describe or port-forward.
- Show recent events of a namespace, sorted by time.
- Show which Argo CD application owns a resource.

Put generic helpers in the dotfiles (`shrc`, loaded only when `kubectl` exists) and cloud-only scripts in `salt/cloud`. Use only tools that `tpl-cloud` installs (`kubectl`, `fzf`, `jq`).

### The value to a user, and who that user might be

- User: reads logs and moves between cluster resources with short commands.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The task notes list the workflows the scripts cover
- [ ] #2 Each script runs in qube cloud with only the packages of tpl-cloud
- [ ] #3 Each script passes scripts/shell-lint.sh
- [ ] #4 README.md of cloud lists the scripts and their usage
<!-- AC:END -->
