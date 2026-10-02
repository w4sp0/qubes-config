---
id: TASK-045
title: 'dotfiles: grey the bash prompt brackets and git branch'
status: To Do
assignee: []
created_date: '2026-09-27 13:30'
labels:
  - dotfiles
  - theme
  - bash
milestone: m-3
dependencies:
  - TASK-041
references:
  - salt/dotfiles/files/sh/.config/bash/bashrc
priority: low
type: enhancement
ordinal: 92000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

bashrc builds PS1 with magenta brackets and calls `_git_prompt_info`. The grey version exists only in ~/.bashrc.local in qube dev.

### Proposed solution

Build the brackets in slot 8 in bashrc; the git branch colour comes from TASK-041.

### The value to a user, and who that user might be

- User: the bash prompt follows theme(1) like the zsh prompt.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The bash PS1 has no magenta
- [ ] #2 In a qube without ~/.bashrc.local the bash prompt changes with theme light and theme dark
<!-- AC:END -->
