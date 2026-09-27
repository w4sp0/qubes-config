---
id: TASK-048
title: 'dotfiles: tmux resets the cursor colour to the startup colour'
status: To Do
assignee: []
created_date: '2026-09-27 15:10'
updated_date: '2026-09-27 17:42'
labels:
  - dotfiles
  - theme
  - tmux
milestone: m-3
dependencies: []
references:
  - salt/dotfiles/files/tmux/.config/tmux/theme-light.conf
  - salt/dotfiles/files/tmux/.config/tmux/theme-dark.conf
priority: medium
type: bug
ordinal: 54500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

tmux 3.5a

### Brief summary

theme(1) sets the cursor colour with OSC 12. tmux has `cursor-colour none` and the xterm override `Cr=\033]112\007`, so on redraw it resets the cursor, and xterm restores the colour it started with. A terminal started in dark mode shows a white cursor in light mode.

### Steps to reproduce

1. Start xterm with tmux in dark mode.
2. Run `theme light`.
3. Switch tmux panes or windows.

### Expected behavior

The cursor is #5f5f5f (TASK-047) in light mode.

### Actual behavior

The cursor is white.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 theme-light.conf sets cursor-colour to the light cursor colour
- [ ] #2 theme-dark.conf sets cursor-colour to the dark cursor colour
- [ ] #3 After theme light in a terminal started in dark mode the cursor keeps the light colour when switching panes
<!-- AC:END -->
