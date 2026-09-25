---
id: TASK-008
title: 'ci: submodule checkout fails on qrexec:// URL'
status: Done
assignee: []
created_date: '2026-09-23 20:39'
updated_date: '2026-09-25 21:17'
labels:
  - ci
  - dotfiles
milestone: m-0
dependencies: []
references:
  - .gitmodules
  - .github/workflows/main.yaml
  - docs/CONTRIBUTE.md
priority: high
type: bug
ordinal: 6000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b

### Brief summary

`.gitmodules` sets the `salt/dotfiles` URL to `qrexec://@default/dotfiles`. Workflow `main.yaml` uses `actions/checkout` with `submodules: recursive`. GitHub runners cannot resolve the `qrexec://` transport.

### Steps to reproduce

1. Push a commit to `main` on GitHub.
2. Examine job `lint`, step `actions/checkout`.

### Expected behavior

The checkout step clones `salt/dotfiles`. The lint steps run.

### Actual behavior

The checkout step fails. No lint step runs.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 Job lint clones salt/dotfiles on a GitHub runner
- [x] #2 Local clones continue to fetch salt/dotfiles through qrexec
- [x] #3 docs/CONTRIBUTE.md states the git config needed for the local qrexec remote
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
.gitmodules URL is now https://github.com/w4sp0/dotfiles.git. The local .git/config keeps submodule.salt/dotfiles.url=qrexec://@default/dotfiles. CONTRIBUTE.md and INSTALL.md (dom0 qrexec clone) document the override.

AC #1 is blocked: the pinned submodule commit 20a52a4 is not on GitHub (public main is 2e9d03b, one commit behind). Push dotfiles main to the gh remote before the CI run. Note: git submodule sync would overwrite the local qrexec URL from .gitmodules.

2026-09-25: a CI run on GitHub checked out salt/dotfiles and ran all lint hooks. qubesbuilder-gen failed because .qubesbuilder did not list rpm_spec/qusal-slack.spec. That failure is not caused by the checkout, and .qubesbuilder was regenerated to fix it.
<!-- SECTION:NOTES:END -->
