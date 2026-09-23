---
id: TASK-001.04
title: 'cloud: netvm is empty, so cloud APIs are not reachable'
status: To Do
assignee: []
created_date: '2026-09-23 20:39'
labels:
  - cloud
  - network
  - firewall
milestone: m-1
dependencies: []
references:
  - salt/cloud/create.sls
  - salt/sys-net/files/server/rpc/qusal.ConnectTCP
  - salt/mail/
parent_task_id: TASK-001
priority: high
type: bug
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b

### Brief summary

`salt/cloud/create.sls` sets `netvm: ""` on qube `cloud`. `service.qusal-proxy-client` proxies SSH only (`qusal.ConnectTCP`). `kubectl`, `aws`, `helm` and `argocd` need HTTPS to remote APIs.

### Steps to reproduce

1. Apply `cloud.create`.
2. In qube `cloud`, run `curl -sS https://sts.amazonaws.com`.

### Expected behavior

The qube connects to the cloud API endpoints that the firewall allows.

### Actual behavior

The command fails with "Could not resolve host".
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Qube cloud has a netvm
- [ ] #2 qvm-firewall cloud allows only the defined API endpoints and drops all other traffic
- [ ] #3 README.md documents the netvm and the firewall rules
<!-- AC:END -->
