---
id: TASK-041
title: 'dotfiles: colour the prompt from palette slots'
status: Done
assignee: []
created_date: '2026-09-27 13:30'
updated_date: '2026-09-27 18:29'
labels:
  - dotfiles
  - theme
milestone: m-3
dependencies: []
references:
  - salt/dotfiles/files/sh/.config/sh/shrc
priority: medium
type: enhancement
ordinal: 47500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

shrc sets `usercolor` to 256-colour 184 and `dircolor` to 27, and `_git_prompt_info` prints a blue branch. theme(1) remaps only slots 0-15, so the prompt keeps the same colours in light and dark mode. The theme-aware version exists only in ~/.shrc.local in qube dev.

### Proposed solution

Set `usercolor` to slot 7 (slot 1 for root), `dircolor` to slot 15, and print the git branch and its parentheses in slot 8, as in ~/.shrc.local of qube dev.

### The value to a user, and who that user might be

- User: the prompt follows theme(1) in every qube, not only in dev.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 shrc sets usercolor and dircolor from slots 7 (1 for root) and 15
- [x] #2 The git branch in the prompt is printed in slot 8
- [x] #3 In a qube without ~/.shrc.local the user and directory colours change with theme light and theme dark
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
shrc: usercolor slot 7 (slot 1 for root), dircolor slot 15, git branch and its parentheses in slot 8. 88-colour terminals share the 256-colour codes; 8/16-colour terminals fall back to setaf 7 and bold setaf 7. Checked: sh -n, shellcheck, _git_prompt_info renders `\e[38;5;8m(main)\e[0m` in bash and zsh. Pending: AC #3 on one test qube, then roll out.
<!-- SECTION:NOTES:END -->

## Final Summary

<!-- SECTION:FINAL_SUMMARY:BEGIN -->
shrc colours the prompt from palette slots: user@host slot 7 (slot 1 for root), directory slot 15, git branch and its parentheses slot 8. Verified on otee-dev without ~/.shrc.local: colours switch in place with theme light and theme dark.
<!-- SECTION:FINAL_SUMMARY:END -->
