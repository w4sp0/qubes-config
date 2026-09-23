---
id: TASK-009.03
title: 'discord: remove Signal packages from install.sls'
status: In Progress
assignee: []
created_date: '2026-09-23 20:40'
updated_date: '2026-09-23 21:40'
labels:
  - discord
milestone: m-0
dependencies: []
references:
  - salt/discord/install.sls
parent_task_id: TASK-009
priority: medium
type: bug
ordinal: 7300
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b

### Brief summary

`salt/discord/install.sls` installs `signal-desktop`, `libayatana-appindicator3-1`, XFCE, Thunar and the `sys-audio` client. `discordo` is a terminal client and does not use these packages.

### Expected behavior

`tpl-discord` contains only the packages that `discordo` needs.

### Actual behavior

`tpl-discord` contains Signal Desktop and a GUI stack.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 install.sls does not install signal-desktop, libayatana-appindicator3-1, thunar or qubes-core-agent-thunar
- [x] #2 install.sls does not include utils.tools.xfce or sys-audio.install-client
- [ ] #3 discordo starts in qube discord with the remaining packages
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
install.sls keeps qubes-core-agent-networking and ca-certificates only (dunst removed too). utils.tools.xfce also removed from configure.sls. create.sls: audiovm set to empty (no audio client) and the file manager menu item removed (thunar is gone). The terminal is xterm from the minimal template, as in mail-reader.

Open for AC #3: discordo stores its token with go-keyring (D-Bus Secret Service) and uses golang.design/x/clipboard (X11). A minimal template has no Secret Service. Test the login after TASK-009.02; the options are a keyring package, or DISCORDO_TOKEN injected from vault (TASK-031.01).
<!-- SECTION:NOTES:END -->
