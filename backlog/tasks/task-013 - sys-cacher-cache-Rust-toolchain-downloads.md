---
id: TASK-013
title: 'sys-cacher: cache Rust toolchain downloads'
status: To Do
assignee: []
created_date: '2026-09-23 20:41'
labels:
  - sys-cacher
  - rust
  - performance
milestone: m-2
dependencies: []
references:
  - salt/sys-cacher/files/server/conf/acng.conf
  - salt/dev/install-rust-tools.sls
  - 'https://rust-lang.github.io/rustup/environment-variables.html'
priority: medium
type: spike
ordinal: 3000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`acng.conf` sets `PassThroughPattern` for `static.rust-lang.org:443`. APT-Cacher-NG tunnels these connections and does not store them. Each template that applies `dev.install-rust-tools` downloads the full toolchain again.

### Proposed solution

Examine if `RUSTUP_DIST_SERVER` and `RUSTUP_UPDATE_ROOT` can point to an APT-Cacher-NG remap of `static.rust-lang.org`. Keep rustup SHA-256 verification.

### The value to a user, and who that user might be

- User: the second template gets the toolchain from the local cache.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A written result states if caching is possible and the configuration it needs
- [ ] #2 If possible, a follow-up task exists for the implementation
- [ ] #3 The result confirms that rustup still verifies checksums through the cache
<!-- AC:END -->
