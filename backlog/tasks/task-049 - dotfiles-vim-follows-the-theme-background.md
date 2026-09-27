---
id: TASK-049
title: 'dotfiles: vim follows the theme background'
status: To Do
assignee: []
created_date: '2026-09-27 17:42'
labels:
  - dotfiles
  - theme
  - vim
milestone: m-3
dependencies: []
references:
  - salt/dotfiles/files/vim/.config/vim/vimrc
priority: medium
type: bug
ordinal: 55500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

vim 9.1, colorscheme quiet

### Brief summary

vimrc sets background=dark on VimEnter, and quiet paints Normal with its own background: #000000 with termguicolors (TERM=xterm-direct256, outside tmux) and colour 16 without (inside tmux). In light mode vim is black on the #c2c2c2 terminal.

### Steps to reproduce

1. Run `theme light`.
2. Open vim, inside and outside tmux.

### Expected behavior

vim uses the light variant of quiet and shows the terminal background.

### Actual behavior

vim uses the dark variant of quiet on a black background.

### Proposed solution

On VimEnter, set background from the theme(1) state file ($XDG_STATE_HOME/theme/mode, dark when missing). Add `autocmd ColorScheme quiet hi Normal guibg=NONE ctermbg=NONE` (terminal only) before `colorscheme quiet`, so the terminal background shows through. Tested in place with `:set background=light | hi Normal guibg=NONE ctermbg=NONE`. A vim already running keeps its mode after `theme`; out of scope.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 After theme light a new vim has background=light, inside and outside tmux
- [ ] #2 After theme dark a new vim has background=dark
- [ ] #3 vim shows the terminal background in both modes
- [ ] #4 Without the theme state file vim starts with background=dark
<!-- AC:END -->
