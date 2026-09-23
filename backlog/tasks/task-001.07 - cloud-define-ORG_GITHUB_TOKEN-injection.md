---
id: TASK-001.07
title: 'cloud: inject ORG_GITHUB_TOKEN from vault'
status: To Do
assignee: []
created_date: '2026-09-23 20:40'
updated_date: '2026-09-23 21:26'
labels:
  - cloud
  - secrets
  - qrexec
milestone: m-1
dependencies:
  - TASK-001.08
  - TASK-031.01
references:
  - salt/mail/
  - salt/vault/
  - salt/sys-pgp/
parent_task_id: TASK-001
priority: medium
type: feature
ordinal: 5000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The gitops qube needs `ORG_GITHUB_TOKEN`. The token must not be stored in a shell profile, an environment file or the qube private volume.

### Proposed solution

Implement the injection method that TASK-031.01 selects: the token stays in its holder qube (for example `vault`) and is given on request to the one process that needs it. The choice of method is made in TASK-031.01, not here.

### The value to a user, and who that user might be

- User: a compromised gitops qube does not keep the token at rest.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The gitops qube gets ORG_GITHUB_TOKEN with the method of TASK-031.01
- [ ] #2 grep -r for the token value in the gitops qube home and /rw finds no match
- [ ] #3 Each token request is allowed by the qrexec policy of TASK-031.01
- [ ] #4 README.md of the gitops formula documents the usage
<!-- AC:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-23 21:26
---
Scope narrowed: the method decision moved to TASK-031.01, which covers all secrets. This task is now the ORG_GITHUB_TOKEN implementation.
---
<!-- COMMENTS:END -->
