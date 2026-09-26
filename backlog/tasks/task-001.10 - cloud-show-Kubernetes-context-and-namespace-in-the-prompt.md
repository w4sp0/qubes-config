---
id: TASK-001.10
title: 'cloud: show Kubernetes context and namespace in the prompt'
status: To Do
assignee: []
created_date: '2026-09-25 21:56'
labels:
  - cloud
  - dotfiles
  - prompt
milestone: m-1
dependencies:
  - TASK-001.06
references:
  - salt/dotfiles/files/sh/.config/zsh/.zshrc
  - salt/dotfiles/files/sh/.config/bash/bashrc
  - salt/cloud/install.sls
parent_task_id: TASK-001
priority: medium
type: feature
ordinal: 11500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The prompt in qube `cloud` does not show which cluster or namespace `kubectl`, `helm` and `k9s` will act on. A command can run against the wrong cluster. The zsh prompt (`.zshrc` lines 73-85) shows the user, host, directory and git branch (`_git_prompt_info`). The bash prompt is set in `bashrc`.

### Proposed solution

Add a prompt segment to the dotfiles that appears only when `kubectl` is installed and a kubeconfig exists. It shows the current context and namespace.
- Read the context and namespace from the kubeconfig file, not with `kubectl` on each prompt, so that a prompt costs no process and no API call. `_theme_precmd` in `.zshrc` is an example of a cheap precmd hook.
- Use a warning color for contexts that match a pillar or environment list of production names.

First, decide which other annotations to show. Candidates:
- AWS profile and region (`AWS_PROFILE`, `AWS_REGION`), and a warning when the SSO session has expired.
- Argo CD server or context.
- Talos context (`talosctl config info`), for the homelab (TASK-025).
- Terraform or OpenTofu workspace in a directory with `.terraform`.
- The exit code of the last command (already in `RPS1`).

Record the chosen set and the reasons in the task notes before implementing.

### The value to a user, and who that user might be

- User: sees the target cluster and namespace before each command, and notices a production context.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The task notes list the chosen annotations and the reason for each
- [ ] #2 In qube cloud, the zsh and bash prompts show the current Kubernetes context and namespace
- [ ] #3 A prompt with the segment starts no kubectl or other external process
- [ ] #4 Qubes without kubectl or without a kubeconfig show no segment
- [ ] #5 A context that matches the production list is shown in a warning color
<!-- AC:END -->
