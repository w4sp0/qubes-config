---
id: TASK-016
title: 'otee-embedded: install probe-rs'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
updated_date: '2026-09-23 21:48'
labels:
  - otee-embedded
  - rust
  - supply-chain
milestone: m-2
dependencies:
  - TASK-032
references:
  - 'https://probe.rs/docs/getting-started/installation/'
  - salt/otee-embedded/install.sls
priority: medium
type: feature
ordinal: 6000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`probe-rs` is not in Debian. `tpl-otee-embedded` has no Rust flash and RTT tool.

### Proposed solution

Install a pinned `probe-rs-tools` release in the template, with checksum verification, through the update proxy.

### The value to a user, and who that user might be

- Developer: flashes and debugs targets with `cargo embed` and `probe-rs`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 probe-rs --version runs in qube otee-embedded
- [ ] #2 The version and checksum are pinned in one location
- [ ] #3 The install fails when the checksum does not match
- [ ] #4 A second apply reports no changes
<!-- AC:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-23 21:48
---
Use the TASK-032 builder macro for the pinned probe-rs-tools release.
---
<!-- COMMENTS:END -->
