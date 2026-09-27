---
id: TASK-044
title: 'dotfiles: grey zsh syntax highlighting'
status: To Do
assignee: []
created_date: '2026-09-27 13:30'
labels:
  - dotfiles
  - theme
  - zsh
milestone: m-3
dependencies: []
references:
  - salt/dotfiles/files/sh/.config/zsh/.zshrc
priority: low
type: enhancement
ordinal: 50500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

.zshrc keeps the zsh-syntax-highlighting colours (green, cyan, yellow, magenta; comments black on black in dark mode). The grey version exists only in ~/.zshrc.local in qube dev.

### Proposed solution

Set the highlight styles to slots 15 (commands), 7 (quoted data) and 8 (punctuation, keywords, comments), bracket levels through 15, 7, 8 and bold, unknown tokens and bracket errors in slot 1, and sudo and doas in bold slot 1, as in ~/.zshrc.local of qube dev.

### The value to a user, and who that user might be

- User: the command line is legible in both modes and only errors are coloured.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 ZSH_HIGHLIGHT_STYLES in .zshrc uses only slots 1 and 7 and 8 and 15
- [ ] #2 A command starting with sudo or doas is highlighted in bold slot 1
- [ ] #3 Comments are readable in dark mode
<!-- AC:END -->
