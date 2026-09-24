---
id: TASK-035
title: 'docs: point install and verification steps to this fork'
status: To Do
assignee: []
created_date: '2026-09-23 23:16'
labels:
  - docs
  - signing
  - qubes-builder
milestone: m-0
dependencies: []
references:
  - docs/INSTALL.md
  - salt/qubes-builder/files/client/qusal/qusal.yml
  - salt/qubes-builder/files/client/qusal/keys/
priority: medium
type: docs
ordinal: 7700
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The trusted key in `salt/qubes-builder/files/client/qusal/keys/` is now `A3A03DD3ED22D21E653E842B47B7A28B999E0D56` (wassp), and Ben Grande's key is removed. `docs/INSTALL.md` still tells the user to clone `github.com/ben-grande/qusal` and to verify with `DF3834875B65758713D92E91A475969DE4E371E3` (`ben-code.asc`). `qusal.yml` still has `git.prefix: ben-grande/`; the `qusal` component now has its own `url`.

### Proposed solution

Change the clone URL, the key URL, the key file name and the fingerprint in `docs/INSTALL.md` to this fork. Point the key download to the key file in this repository. Check other docs for the upstream URL and key.

### The value to a user, and who that user might be

- User: can verify the repository by following the install guide.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 docs/INSTALL.md contains no reference to DF3834875B65758713D92E91A475969DE4E371E3 or ben-code.asc
- [ ] #2 The verification commands in docs/INSTALL.md succeed on a fresh clone of this fork
- [ ] #3 A qubes-builder fetch of component qusal verifies commits with the new key, or the task notes record why it was not tested
<!-- AC:END -->
