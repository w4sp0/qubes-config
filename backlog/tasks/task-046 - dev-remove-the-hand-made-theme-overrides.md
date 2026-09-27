---
id: TASK-046
title: 'dev: remove the hand-made theme overrides'
status: To Do
assignee: []
created_date: '2026-09-27 13:30'
labels:
  - dev
  - dotfiles
  - theme
milestone: m-3
dependencies:
  - TASK-041
  - TASK-042
  - TASK-043
  - TASK-044
  - TASK-045
priority: low
type: chore
ordinal: 52500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Qube dev has ~/.shrc.local, ~/.zshrc.local, ~/.bashrc.local and ~/.tmux.conf.local with the theme work that TASK-041 to TASK-045 move into the dotfiles. Kept, they hide whether the dotfiles are correct.

### Proposed solution

After dev.configure applies the current dotfiles, delete the four files.

### The value to a user, and who that user might be

- User: dev and new qubes use one source for the theme.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The four files do not exist in qube dev
- [ ] #2 The prompt of dev looks the same as before in both modes
<!-- AC:END -->
