---
id: TASK-047
title: 'dotfiles: lower the light theme background'
status: To Do
assignee: []
created_date: '2026-09-27 13:44'
updated_date: '2026-09-27 17:42'
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

The light theme ground #d4d4d4 is too bright for long sessions and causes eye strain, and the #474747 text is too faint on it.

### Proposed solution

Lower the ground to #c2c2c2 (18% less luminance) and make the text near black. Values chosen by previewing them live with OSC sequences on 2026-09-27.

| What | Now | New | Contrast on #c2c2c2 |
|---|---|---|---|
| background | #d4d4d4 | #c2c2c2 | |
| foreground | #474747 | #1c1c1c | 9.6 (was 6.3) |
| cursor | #6b6b6b | #5f5f5f | 3.6 (held) |
| slot 7, prompt user@host | #646464 | #3b3b3b | 6.3 (was 4.0) |
| slot 8, prompt frame and branch | #808080 | #5f5f5f | 3.6 (was 2.7) |
| slot 15, prompt directory | #303030 | #000000 | 11.8 (was 8.9) |

The other slots keep their contrast ratio against the ground:

    0 #3e3e3e  1 #8c2922  2 #456233  3 #7b5e1b  4 #2f4a7a  5 #693878  6 #325e5e
    9 #751913  10 #334d21  11 #60470d  12 #1e3466  13 #542662  14 #244a4a

theme-light.conf greys, each keeping its contrast:

    #d4d4d4 -> #c2c2c2  #c4c4c4 -> #b3b3b3  #bebebe -> #adadad  #808080 -> #737373
    #6b6b6b -> #5f5f5f  #5f5f5f -> #535353  #474747 -> #3b3b3b  #303030 -> #222222

dircolors-light moves the grey ladder one step down the 256-colour ramp (241-247 -> 240-246; badge backgrounds 240 -> 239, 243 -> 242, 250 -> 248). DIR moves from 237 to 232 so directories stay darker than the #1c1c1c text; xterm draws no bold (allowBoldFonts: false), so darkness is what sets them apart.

### The value to a user, and who that user might be

- User: light mode is comfortable for long sessions and the text is crisp.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 theme light sets the background to #c2c2c2, the foreground to #1c1c1c and the cursor to #5f5f5f
- [ ] #2 The light palette sets slots 7, 8 and 15 to #3b3b3b, #5f5f5f and #000000, and every other slot keeps its contrast ratio against the ground within 0.1
- [ ] #3 theme-light.conf and dircolors-light use the shifted greys, with DIR on 232
- [ ] #4 The comments that name the ground colour or contrast figures match the new values
<!-- AC:END -->
