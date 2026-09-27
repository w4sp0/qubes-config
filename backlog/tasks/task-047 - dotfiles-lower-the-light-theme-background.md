---
id: TASK-047
title: 'dotfiles: lower the light theme background'
status: To Do
assignee: []
created_date: '2026-09-27 13:44'
labels:
  - dotfiles
  - theme
milestone: m-3
dependencies: []
references:
  - salt/dotfiles/files/sh/.local/bin/theme
  - salt/dotfiles/files/tmux/.config/tmux/theme-light.conf
  - salt/dotfiles/files/sh/.config/dircolors/dircolors-light
priority: high
type: enhancement
ordinal: 53500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The light theme ground #d4d4d4 is too bright for long sessions and causes eye strain.

### Proposed solution

Lower the ground to #b8b8b8 (27% less luminance). Darken the foreground, cursor, 16-colour palette, tmux greys and dircolors greys so that each keeps its contrast ratio against the ground.

### The value to a user, and who that user might be

- User: light mode is comfortable for long sessions without losing legibility.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 theme light sets the background to #b8b8b8
- [ ] #2 The foreground and each palette colour keep their contrast ratio against the ground within 0.1
- [ ] #3 theme-light.conf and dircolors-light use the shifted greys
- [ ] #4 The comments that name the ground colour name #b8b8b8
<!-- AC:END -->
