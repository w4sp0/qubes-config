---
id: TASK-009.02
title: 'discord: build discordo from a pinned commit in the builder disposable'
status: In Progress
assignee: []
created_date: '2026-09-23 20:40'
updated_date: '2026-09-23 22:35'
labels:
  - discord
  - security
  - supply-chain
  - builder
milestone: m-0
dependencies:
  - TASK-032
references:
  - salt/discord/files/repo/discordo_Linux_X64.zip
  - 'https://github.com/ayn2op/discordo'
  - >-
    backlog/tasks/task-032 -
    utils-install-verified-binaries-into-templates-from-a-builder-disposable.md
parent_task_id: TASK-009
priority: high
type: feature
ordinal: 7200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`salt/discord/files/repo/discordo_Linux_X64.zip` (4 MB) is committed to git. It has no version and no checksum, and no state installs it. discordo has no releases or tags; upstream offers only CI artifacts through nightly.link, which expire.

### Proposed solution

Use the TASK-032 macro to build a pinned discordo commit in the builder disposable (`go build` with `CGO_ENABLED=0` and `-trimpath`; `go.mod` needs Go 1.27, fetched with `GOTOOLCHAIN=auto`) and install it to `/usr/bin/discordo` in `tpl-discord`. discordo and its dependencies have no cgo. Remove the zip from the tree.

Candidate pin (upstream main on 2026-09-23): `de2f2c94f0fc128730a90d88f3c3a7fb3b67dc92`.

### The value to a user, and who that user might be

- User: runs a known, verified `discordo` build.
- Developer: the repository has no opaque binary.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 salt/discord/files/repo/discordo_Linux_X64.zip is removed
- [x] #2 The commit hash and the SHA-256 of the build output are pinned in one location in salt/discord
- [ ] #3 tpl-discord refuses a binary whose SHA-256 does not match, and installs nothing
- [ ] #4 discordo --help runs in qube discord
- [ ] #5 A second apply reports no changes
- [ ] #6 tpl-discord has no golang-go package
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
Zip removed. salt/discord/binaries.jinja pins commit de2f2c94f0fc128730a90d88f3c3a7fb3b67dc92 with toolchain go1.27.0; sha256 is empty until the build output is hashed in two dvm-builder disposables (see salt/builder/README.md). Until then discord.install and discord.install-binary fail with 'No SHA-256 pin for discordo'. Added discord.install-binary (dom0) and the policy file.

Pin set in salt/discord/binaries.jinja: sha256 93e5d93a42890778c566bf826946e6b7d5ff1016ee760e8d18be5fae5c865c35, equal in two dvm-builder builds.
<!-- SECTION:NOTES:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-23 21:40
---
Blocked on a decision (2026-09-23): discordo has no GitHub releases and no tags. Upstream offers binaries only as CI artifacts through nightly.link, which expire (90 days by default). go.mod requires Go 1.27; Debian trixie has golang-go 1.24, which can fetch the 1.27 toolchain with GOTOOLCHAIN=auto (verified through sum.golang.org). Upstream main at check time: de2f2c94f0fc128730a90d88f3c3a7fb3b67dc92. Change the title and ACs to the selected method.
---
<!-- COMMENTS:END -->
