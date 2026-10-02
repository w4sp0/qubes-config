---
id: TASK-042
title: 'dotfiles: build the zsh prompt from palette slots'
status: To Do
assignee: []
created_date: '2026-09-27 13:30'
labels:
  - dotfiles
  - theme
  - zsh
milestone: m-3
dependencies:
  - TASK-041
references:
  - salt/dotfiles/files/sh/.config/zsh/.zshrc
priority: medium
type: enhancement
ordinal: 89000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

.zshrc builds PS1 with magenta brackets and RPS1 with a red exit status. The theme-aware prompt exists only in ~/.zshrc.local in qube dev.

### Proposed solution

Build PS1 with brackets and prompt symbol in slot 8, user and host in slot 7 (1 for root) and the directory in slot 15, and RPS1 with the exit status in slot 1 inside slot 8 parentheses, as in ~/.zshrc.local of qube dev.

### The value to a user, and who that user might be

- User: the zsh prompt follows theme(1) in every qube.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 PS1 in .zshrc uses slots 8 and 7 and 15 and no fixed hue
- [ ] #2 RPS1 shows a non-zero exit status in slot 1 and nothing on success
- [ ] #3 In a qube without ~/.zshrc.local the prompt matches the prompt of qube dev in both modes
<!-- AC:END -->
