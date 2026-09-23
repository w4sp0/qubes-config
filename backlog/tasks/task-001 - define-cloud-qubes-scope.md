---
id: task-001
title: define-cloud-qubes-scope
status: In Progress
assignee:
  - '@wassp'
created_date: '2025-12-20 19:57'
updated_date: '2026-09-23 21:47'
labels:
  - cloud
  - gitops
  - devops
  - feature
milestone: m-1
dependencies: []
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
As a DevSecOps Engineer and Qubes OS user, I keep my boundary contexts clear and separated from each other. I need to have a clear distinction for gitops and ops qubes.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 Clear separation between ops and gitops qubes defined
- [x] #2 Tools required for both qubes enumerated
- [ ] #3 Installation procedures follow qusal requirements
- [ ] #4 All salt state formulas tested and verified
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
Tools enumeration for gitops qube:
  * `opentofu`
  * `terragrunt`
  * `git`
  * `sys-ssh-agent-client`
  * `aws-cli`
  * I also need to work out how to propertly inject `ORG_GITHUB_TOKEN` without explicictly storing it in an environment variable

Tools enumeration for `cloud` qube:
  * `kubectl` -> kubernetes1.34-client
  * `helm` - works natively
  * `k9s`- works natively
  * `git`
  * `redis-cli` -> valkey
  * `sys-ssh-agent-client`
  * `aws-cli`
  * `kubectx (includes `kubens`) - requires COPR enabled
  * `argocd` cli - not available natively
  * `cillium` cli - not available natively
  * `hubble cli` - not available natively
  * `cloud-nuke` - not available natively
  * `kubecolor` (OPTIONAL: not sure I need that really)

NOTE: most of these tools can be handled by `mise` tool,
<!-- SECTION:NOTES:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-23 21:47
---
2026-09-23: the project does not use mise. The note above about mise is superseded; non-Debian tools come from the builder disposable (TASK-032).
---
<!-- COMMENTS:END -->
