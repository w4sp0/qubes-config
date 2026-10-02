---
id: TASK-037
title: 'dev: build and run code only in disposables'
status: To Do
assignee: []
created_date: '2026-09-27 10:43'
updated_date: '2026-09-27 12:16'
labels:
  - dev
  - qrexec
  - hardening
milestone: m-3
dependencies: []
references:
  - salt/dev/
priority: high
type: feature
ordinal: 68000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Qube `dev` holds the sources and also builds and runs them. A malicious build script or dependency runs in the qube that holds the sources and the git and SSH access.

### Proposed solution

Keep `dev` for editing and documentation, without a netvm. Send the work tree to a disposable of `dvm-dev` with a qrexec service `qusal.DevRun`, and stream the output back. Offer a session mode (named `disp-dev`, incremental builds) and a clean mode (new `@dispvm:dvm-dev` per run). Do each part in a subtask.

### The value to a user, and who that user might be

- Developer: code that is built or run cannot change the sources or reach the git and SSH access of `dev`.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 All subtasks are Done
<!-- AC:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-27 12:16
---
2026-09-27: dev.configure-rust-tools targets only the qube dev. The shell profile sets RUSTUP_HOME in the home directory, so disposables of dvm-dev have no default toolchain and cargo fails there. Apply dev.configure-rust-tools to dvm-dev before devrun can build Rust (found in TASK-038.02).
---
<!-- COMMENTS:END -->
