---
id: TASK-011
title: 'dev: set Rust targets and components from pillar'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - dev
  - rust
  - pillar
milestone: m-2
dependencies: []
references:
  - salt/dev/install-rust-tools.sls
  - salt/dotfiles/pillar.sls.example
priority: high
type: enhancement
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`dev.install-rust-tools` installs only the host target and the components `rust-analyzer` and `rust-src`. The toolchain is in `/opt/rust` in the template, and `/opt` in an AppVM is reset at each restart. So `rustup target add` in an AppVM does not persist.

### Proposed solution

Read extra targets and components from pillar (for example `qusal:rust:targets`, `qusal:rust:components`). Install them in the template with `rustup`.

### The value to a user, and who that user might be

- Developer: a formula such as `otee-embedded` gets cross targets without a separate Rust state.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Targets in pillar are listed by rustup target list --installed in the template
- [ ] #2 Components in pillar are listed by rustup component list --installed
- [ ] #3 With no pillar data, the state installs the same toolchain as now
- [ ] #4 The state docstring documents the pillar keys
<!-- AC:END -->
