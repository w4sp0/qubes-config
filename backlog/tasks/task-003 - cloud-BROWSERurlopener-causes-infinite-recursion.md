---
id: TASK-003
title: 'cloud: BROWSER=urlopener causes infinite recursion'
status: To Do
assignee: []
created_date: '2026-09-23 20:39'
labels:
  - cloud
  - dotfiles
milestone: m-0
dependencies: []
references:
  - salt/cloud/configure.sls
  - salt/cloud/install.sls
  - salt/dotfiles/files/net/.local/bin/urlopener
  - salt/dotfiles/files/sh/.config/sh/profile
priority: high
type: bug
ordinal: 1000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b, plus the uncommitted change to `salt/cloud/configure.sls`.

### Brief summary

State `cloud-browser-urlopener` writes `BROWSER="urlopener"` to `~/.config/sh/profile.d/browser.sh`. When `qvm-open-in-dvm` is not in `PATH`, `urlopener` runs `"${BROWSER}"`, so it calls itself again with no limit.

### Steps to reproduce

1. Apply `cloud.configure` to qube `cloud`.
2. In a login shell, remove `qvm-open-in-dvm` from `PATH`.
3. Run `urlopener https://example.org`.

### Expected behavior

`urlopener` opens the URL one time or exits with an error.

### Actual behavior

`urlopener` runs itself again and again. The process count increases until the shell stops it.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 BROWSER in qube cloud does not resolve to urlopener
- [ ] #2 urlopener exits after one call when qvm-open-in-dvm is not in PATH
- [ ] #3 firefox-esr is used as BROWSER or is removed from salt/cloud/install.sls
<!-- AC:END -->
