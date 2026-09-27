---
id: TASK-050
title: 'dotfiles: the first terminal of a qube starts in the default colours'
status: Done
assignee: []
created_date: '2026-09-27 18:02'
updated_date: '2026-09-27 18:28'
labels:
  - dotfiles
  - theme
milestone: m-3
dependencies: []
references:
  - salt/dotfiles/files/sh/.local/bin/theme
  - salt/dotfiles/files/sh/.config/sh/shrc
  - salt/dotfiles/files/x11/.config/x11/xprofile
priority: medium
type: bug
ordinal: 56500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

xterm in a Qubes AppVM (Debian), dotfiles 1992d65

### Brief summary

xprofile merges the colours saved by theme(1) into the X resources during the X session start. When a terminal is launched from the menu and that launch boots the qube, qubes.StartApp can start xterm before xprofile has run, so the first xterm reads the dark defaults from xresources. Confirmed in otee-dev: in the wrong terminal `xrdb -query` already shows `*.background: #c2c2c2`.

### Steps to reproduce

1. Run `theme light` in a qube and shut it down.
2. Start a terminal in that qube from the menu.

### Expected behavior

The terminal opens in the light theme.

### Actual behavior

The terminal opens in the dark defaults until `theme reload` is run.

### Proposed solution

Add `theme tty`, which paints only the current terminal in the saved mode, and call it from shrc when an interactive shell starts in an xterm or rxvt terminal outside tmux and ssh.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 theme tty paints only the current terminal with the colours of the saved mode and changes no state
- [x] #2 theme tty exits 0 silently without a controlling terminal
- [x] #3 shrc runs theme tty in interactive shells in xterm or rxvt, not inside tmux or over ssh
- [x] #4 After theme light and a qube restart, the first terminal opened from the menu is in the light theme
<!-- AC:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
Added `theme tty`, which paints only the current terminal in the saved mode, and shrc calls it in interactive xterm/rxvt shells outside tmux and ssh. Verified: shellcheck; light palette emitted under a pty; silent exit 0 without a controlling terminal; on otee-dev the first terminal after a restart opens in the light theme.
<!-- SECTION:FINAL_SUMMARY:END -->
