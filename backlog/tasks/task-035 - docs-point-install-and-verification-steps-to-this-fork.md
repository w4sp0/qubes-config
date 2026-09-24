---
id: TASK-035
title: 'docs: point install and verification steps to this fork'
status: In Progress
assignee: []
created_date: '2026-09-23 23:16'
updated_date: '2026-09-24 17:50'
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
- [x] #1 docs/INSTALL.md contains no reference to DF3834875B65758713D92E91A475969DE4E371E3 or ben-code.asc
- [ ] #2 The verification commands in docs/INSTALL.md succeed on a fresh clone of this fork
- [ ] #3 A qubes-builder fetch of component qusal verifies commits with the new key, or the task notes record why it was not tested
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
2026-09-24: docs/INSTALL.md now clones github.com/w4sp0/qubes-config, takes the key from the repository key directory with https://github.com/w4sp0.gpg as a second source (or an export from the vault qube for the maintainer), checks fingerprint A3A0 3DD3 ED22 D21E 653E 842B 47B7 A28B 999E 0D56 and explains the subkey E465 C11C...6D7A and the trust warning. The sys-git clone uses qubes-config.git. TROUBLESHOOT.md and the issue templates link to the fork. Upstream credits (README e-mail, dotfiles history, vim plugins in CONTRIBUTE.md) are kept. The key import and git verify-commit HEAD were run in dom0 on 2026-09-24, but not on a fresh clone (AC #2). qusal.yml still has git.prefix: ben-grande/; both components that it builds have their own url, so the prefix looks unused; not changed. AC #3 not tested.
<!-- SECTION:NOTES:END -->
