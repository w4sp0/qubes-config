---
id: TASK-009.01
title: 'discord: remove Signal repository states'
status: To Do
assignee: []
created_date: '2026-09-23 20:40'
labels:
  - discord
  - top
  - repo
milestone: m-0
dependencies: []
references:
  - salt/discord/install-repo.sls
  - salt/discord/install-repo.top
  - salt/discord/install.sls
parent_task_id: TASK-009
priority: high
type: bug
ordinal: 7100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b

### Brief summary

`install-repo.top` applies `signal.install-repo`. `install-repo.sls` calls `install_repo(sls_path, 'signal')`, but `salt/discord/files/repo/signal.asc` does not exist. `discordo` has no APT repository.

### Steps to reproduce

1. Run `sudo qubesctl --skip-dom0 --targets=tpl-discord state.apply discord.install`.

### Expected behavior

The state completes without a repository.

### Actual behavior

`discord-install-signal-keyring` fails: source file `salt://discord/files/repo/signal.asc` not found.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 salt/discord contains no install-repo.sls and no install-repo.top
- [ ] #2 discord.install does not include an install-repo state
- [ ] #3 grep -ri signal salt/discord returns no match
<!-- AC:END -->
