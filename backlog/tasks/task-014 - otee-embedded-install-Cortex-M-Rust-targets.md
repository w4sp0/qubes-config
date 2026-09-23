---
id: TASK-014
title: 'otee-embedded: install Cortex-M Rust targets'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - otee-embedded
  - rust
milestone: m-2
dependencies:
  - TASK-011
references:
  - salt/otee-embedded/install.sls
  - salt/otee-embedded/README.md
priority: high
type: feature
ordinal: 4000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`tpl-otee-embedded` has only the host Rust target. Firmware builds need `thumbv*-none-eabi*` targets.

### Proposed solution

Set the pillar keys from TASK-011 for `tpl-otee-embedded` to the targets of the OTEE boards.

### The value to a user, and who that user might be

- Developer: builds firmware in qube `otee-embedded` without a manual `rustup` step.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 rustup target list --installed in tpl-otee-embedded shows the defined thumbv* targets
- [ ] #2 cargo build --target thumbv7em-none-eabihf of a no_std example completes in qube otee-embedded
- [ ] #3 README.md lists the installed targets
<!-- AC:END -->
