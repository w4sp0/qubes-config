---
id: TASK-009.02
title: 'discord: install discordo from a checksum-pinned release'
status: To Do
assignee: []
created_date: '2026-09-23 20:40'
labels:
  - discord
  - security
  - supply-chain
milestone: m-0
dependencies: []
references:
  - salt/discord/files/repo/discordo_Linux_X64.zip
  - 'https://github.com/ayn2op/discordo/releases'
  - salt/dev/install-rust-tools.sls
parent_task_id: TASK-009
priority: high
type: feature
ordinal: 7200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/discord/files/repo/discordo_Linux_X64.zip` (4 MB) is committed to git. It has no version and no checksum, and no state installs it.

### Proposed solution

Download a pinned `discordo` release in `tpl-discord` through the update proxy. Verify the SHA-256 before extraction. Install the binary to `/usr/bin/discordo`. Remove the zip from the tree.

### The value to a user, and who that user might be

- User: runs a known, verified `discordo` build.
- Developer: the repository has no opaque binary.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 salt/discord/files/repo/discordo_Linux_X64.zip is removed
- [ ] #2 The state pins the release version and SHA-256 in one location
- [ ] #3 The state fails and installs nothing when the SHA-256 does not match
- [ ] #4 discordo --help runs in qube discord
- [ ] #5 A second apply reports no changes
<!-- AC:END -->
