---
id: TASK-008
title: 'ci: submodule checkout fails on qrexec:// URL'
status: To Do
assignee: []
created_date: '2026-09-23 20:39'
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
- [ ] #1 Job lint clones salt/dotfiles on a GitHub runner
- [ ] #2 Local clones continue to fetch salt/dotfiles through qrexec
- [ ] #3 docs/CONTRIBUTE.md states the git config needed for the local qrexec remote
<!-- AC:END -->
