---
id: TASK-038.11
title: 'otee-dev: install probe-rs'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
labels:
  - otee-dev
  - rust
  - supply-chain
milestone: m-2
dependencies:
  - TASK-032
  - TASK-038.02
references:
  - 'https://probe.rs/docs/getting-started/installation/'
parent_task_id: TASK-038
priority: medium
type: feature
ordinal: 36500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`probe-rs` is not in Debian. `tpl-otee-dev` has no Rust flash and RTT tool. Replaces TASK-016.

### Proposed solution

Install a pinned `probe-rs-tools` release in the template with the builder macro of TASK-032.

### The value to a user, and who that user might be

- Developer: flashes and debugs targets with `cargo embed` and `probe-rs`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 probe-rs --version runs in otee-dev
- [ ] #2 The version and checksum are pinned in one location
- [ ] #3 The install fails when the checksum does not match
- [ ] #4 A second apply reports no changes
<!-- AC:END -->

## Definition of Done
<!-- DOD:BEGIN -->
- [ ] #1 README.md documents the change
<!-- DOD:END -->
