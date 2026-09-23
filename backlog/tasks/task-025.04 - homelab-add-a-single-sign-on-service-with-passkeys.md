---
id: TASK-025.04
title: 'homelab: add a single sign-on service with passkeys'
status: To Do
assignee: []
created_date: '2026-09-23 21:25'
labels:
  - homelab
  - sso
  - oidc
  - yubikey
milestone: m-5
dependencies:
  - TASK-031.04
references:
  - 'https://goauthentik.io/'
  - 'https://www.authelia.com/'
  - 'https://github.com/pocket-id/pocket-id'
parent_task_id: TASK-025
priority: medium
type: spike
ordinal: 1400
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Each self-hosted service has its own login. Most use passwords only. The disposable browser of TASK-025.03 needs a password for each service.

### Proposed solution

Select an OIDC provider to run in the homelab (for example Authentik, Authelia or Pocket-ID) that supports passkeys (WebAuthn) as the primary factor. Put the self-hosted services and the Proxmox web interface behind it where they support OIDC. The deployment belongs in the homelab repository. This task records the selection and the Qubes side.

### The value to a user, and who that user might be

- User: logs in to all homelab services with a YubiKey touch, and no browser qube stores homelab passwords.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 A backlog decision records the selected provider and the reasons
- [ ] #2 The decision lists which services use OIDC and which keep a local login
- [ ] #3 The decision states the recovery login when both YubiKeys are unavailable
- [ ] #4 A follow-up task exists in the homelab repository for the deployment
<!-- AC:END -->
