---
id: TASK-001.06
title: 'cloud: install the cloud CLIs'
status: In Progress
assignee: []
created_date: '2026-09-23 20:40'
updated_date: '2026-09-25 21:56'
labels:
  - cloud
  - aws
  - supply-chain
  - builder
milestone: m-1
dependencies:
  - TASK-032
references:
  - salt/cloud/install.sls
  - salt/utils/macros/install-binary.sls
  - salt/slack/binaries.jinja
modified_files:
  - salt/cloud/install.sls
  - salt/cloud/README.md
parent_task_id: TASK-001
priority: medium
type: feature
ordinal: 4000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

TASK-001 lists the operations tools for qube `cloud`. `salt/cloud/install.sls` installs none of them. Some are in Debian trixie: `awscli`, `kubectl`, `valkey-tools` (no `redis-cli` binary; `valkey-cli` works with Redis servers). The others are not packaged: `helm`, `k9s`, `argocd`, `cilium`, `hubble`, `cloud-nuke`. The project does not use `mise`.

### Proposed solution

- Debian packages: add `awscli`, `kubectl` and `valkey-tools` to state `cloud-installed`.
- Other tools: install each into `tpl-cloud` with the builder macro of TASK-032 (release method). Pin the release version, the archive SHA-256 and the binary SHA-256 of each tool in `salt/cloud/binaries.jinja`. Take the archive SHA-256 from the release checksums file or the GitHub asset digest, and the binary SHA-256 from the `hash` action in a `dvm-builder` disposable.
- Add the policy for each tool to `salt/cloud/files/admin/policy/default.policy`, and the dom0 state and README commands.

Merged from TASK-001.05 on 2026-09-25.

### The value to a user, and who that user might be

- User: runs AWS, Kubernetes, Argo CD, Cilium and Valkey operations from qube `cloud`, with the same verified versions in each qube based on `tpl-cloud`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 aws --version, kubectl version --client and valkey-cli --version run in qube cloud
- [ ] #2 helm, k9s, argocd, cilium, hubble and cloud-nuke print their version in qube cloud
- [ ] #3 Each non-Debian tool has a pinned version, archive SHA-256 and binary SHA-256 in salt/cloud/binaries.jinja
- [ ] #4 A second apply of the cloud states reports no changes
- [ ] #5 README.md lists every installed client and the install commands
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
2026-09-25: added awscli (2.23.6), kubectl (1.32.3) and valkey-tools (8.1.1) to cloud-installed in salt/cloud/install.sls. All three are in trixie main. valkey-tools installs valkey-cli but no redis-cli binary; valkey-cli works with Redis servers. The README Usage section lists the clients and states that the qube has no netvm yet (TASK-001.04). markdown-lint passes; salt-lint is not installed in the dev qube. The copyright-lint failure on README.md is TASK-036. AC #1 needs an apply to tpl-cloud and the version commands in qube cloud.
<!-- SECTION:NOTES:END -->
