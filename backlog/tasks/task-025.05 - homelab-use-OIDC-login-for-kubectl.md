---
id: TASK-025.05
title: 'homelab: use OIDC login for kubectl'
status: To Do
assignee: []
created_date: '2026-09-23 21:25'
labels:
  - homelab
  - kubernetes
  - oidc
  - talos
milestone: m-5
dependencies:
  - TASK-025.04
  - TASK-025.03
references:
  - 'https://github.com/int128/kubelogin'
  - 'https://www.talos.dev/latest/kubernetes-guides/configuration/'
parent_task_id: TASK-025
priority: medium
type: feature
ordinal: 1500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The kubeconfig for the Talos cluster contains a long-lived admin client certificate. Anyone who copies it from the operations qube has full cluster access until the certificate expires.

### Proposed solution

Configure the Kubernetes API server of the Talos cluster to accept OIDC tokens from the provider of TASK-025.04. Install a pinned `kubelogin` (`kubectl oidc-login`) in the operations template. Make the login URL open in the homelab disposable browser (`qvm-open-in-dvm` with the TASK-025.03 disposable template), where the YubiKey works through the CTAP proxy. Keep the admin certificate kubeconfig in `vault` for recovery only.

### The value to a user, and who that user might be

- User: kubectl access needs a YubiKey touch and expires by itself.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 kubectl get nodes in the operations qube starts an OIDC login in the homelab disposable
- [ ] #2 The kubeconfig in the operations qube contains no client certificate or static token
- [ ] #3 The admin kubeconfig is in vault and not in the operations qube
- [ ] #4 kubelogin version and checksum are pinned in the repository
<!-- AC:END -->
