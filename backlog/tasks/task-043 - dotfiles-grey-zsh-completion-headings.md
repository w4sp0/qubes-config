---
id: TASK-043
title: 'dotfiles: grey zsh completion headings'
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
ordinal: 90000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

.zshrc formats completion descriptions in blue, messages in purple, warnings in red and colours the kill listing. The grey version exists only in ~/.zshrc.local in qube dev.

### Proposed solution

Format descriptions and messages in slot 8, warnings in slot 1, and the kill listing in slots 8 and 15, as in ~/.zshrc.local of qube dev.

### The value to a user, and who that user might be

- User: completion listings match the prompt in both modes.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 Completion descriptions and messages use slot 8 and warnings use slot 1
- [ ] #2 The kill completion listing uses slots 8 and 15
<!-- AC:END -->
