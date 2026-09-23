---
id: TASK-033.04
title: 'slack: sign in without a loopback browser and keep the token in vault'
status: To Do
assignee: []
created_date: '2026-09-23 21:50'
labels:
  - slack
  - secrets
  - qrexec
milestone: m-9
dependencies:
  - TASK-031.01
  - TASK-033.03
references:
  - 'https://github.com/kurenn/slack-tui#connect-to-slack'
  - salt/vault/
parent_task_id: TASK-033
priority: medium
type: feature
ordinal: 1400
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

slack-tui signs in with OAuth PKCE and a redirect to `http://localhost:9899/callback`. In qube `slack`, `BROWSER` opens the URL in a disposable, so the redirect reaches the localhost of the disposable, not of `slack`, and sign-in fails. After sign-in, tokens are stored in `~/.config/slack-tui/tokens.json` on the private volume, and they rotate about every 12 hours.

### Proposed solution

Compare and select one:

1. A user token (`xoxp-`, does not expire) kept in `vault` and given to slack-tui as `SLACK_USER_TOKEN` by the injection method of TASK-031.01. No token file on disk.
2. OAuth in the disposable, then the final callback URL is sent to the `slack` qube (for example `curl` in `slack`). The rotating tokens stay in `tokens.json`.

Also decide if Socket Mode (`SLACK_APP_TOKEN`, `SLACK_BOT_TOKEN`) is needed, or if polling is sufficient.

### The value to a user, and who that user might be

- User: signs in once with a documented procedure, and a copy of the qube private volume does not contain a long-lived Slack token.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The task notes record the selected sign-in method and the reasons
- [ ] #2 slack-tui connects to the work workspace with the selected method
- [ ] #3 With option 1: ~/.config/slack-tui/tokens.json does not exist in qube slack
- [ ] #4 README.md documents the sign-in procedure
<!-- AC:END -->
