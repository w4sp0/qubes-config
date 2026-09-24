---
id: TASK-033.01
title: 'slack: confirm workspace policy and app approval'
status: To Do
assignee: []
created_date: '2026-09-23 21:50'
updated_date: '2026-09-24 16:44'
labels:
  - slack
  - work
  - policy
milestone: m-9
dependencies: []
references:
  - 'https://github.com/kurenn/slack-tui#connect-to-slack'
parent_task_id: TASK-033
priority: high
type: spike
ordinal: 1100
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

slack-tui signs in through a Slack app that must exist in the workspace (the built-in app or my own app from its manifest). Many company workspaces require an admin to approve third-party apps, and company policy may forbid unofficial clients or user tokens outside managed devices.

### Proposed solution

Before any build work, check the work workspace settings and company policy: is app installation allowed or approved by an admin, are user tokens (`xoxp-`) allowed, and is an unofficial client allowed at all. Record the answer.

### The value to a user, and who that user might be

- User: does not build a qube that the company does not allow, and does not break a policy.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The task notes record if a slack-tui app can be installed in the work workspace, and who approved it
- [ ] #2 The task notes record if a user token is allowed
- [ ] #3 If the answer is no, TASK-033 and its subtasks are archived
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
2026-09-24: blocked. The workspace subscription has no room for another app, so the slack-tui app cannot be created. No approval or token policy answer yet.
<!-- SECTION:NOTES:END -->
