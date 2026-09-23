---
id: TASK-001.06
title: 'cloud: install Debian-packaged cloud CLIs'
status: To Do
assignee: []
created_date: '2026-09-23 20:40'
updated_date: '2026-09-23 20:42'
labels:
  - cloud
  - aws
milestone: m-1
dependencies: []
references:
  - salt/cloud/install.sls
parent_task_id: TASK-001
priority: medium
type: feature
ordinal: 4000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

TASK-001 lists `aws-cli`, `kubectl` and `redis-cli` for qube `cloud`. `salt/cloud/install.sls` does not install them. Debian trixie has `awscli`, `kubectl` and `valkey-tools`.

### Proposed solution

Add `awscli`, `kubectl` and `valkey-tools` to state `cloud-installed`.

### The value to a user, and who that user might be

- User: runs AWS, Kubernetes and Valkey operations from qube `cloud`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 aws --version, kubectl version --client and valkey-cli --version run in qube cloud
- [ ] #2 README.md lists the three packages in Usage
<!-- AC:END -->
