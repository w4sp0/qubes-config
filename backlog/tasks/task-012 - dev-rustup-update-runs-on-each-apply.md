---
id: TASK-012
title: 'dev: rustup update runs on each apply'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - dev
  - rust
  - idempotency
milestone: m-2
dependencies: []
references:
  - salt/dev/install-rust-tools.sls
priority: medium
type: enhancement
ordinal: 2000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

State `dev-updated-rust` has no `unless`, `onlyif` or `onchanges`. Each apply runs `rustup self update` and `rustup update stable`, needs the network, and reports a change.

### Proposed solution

Run the update only when a pillar flag requests it or when `rustup check` reports an update.

### The value to a user, and who that user might be

- User: a repeated apply is fast and reports no false changes.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A second apply with no upstream release reports 0 changes for install-rust-tools
- [ ] #2 An apply with an upstream release available updates the toolchain when the update condition is met
- [ ] #3 The state docstring states how to request an update
<!-- AC:END -->
