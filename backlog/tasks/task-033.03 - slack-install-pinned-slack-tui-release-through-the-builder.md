---
id: TASK-033.03
title: 'slack: install pinned slack-tui release through the builder'
status: Done
assignee: []
created_date: '2026-09-23 21:50'
updated_date: '2026-09-25 19:35'
labels:
  - slack
  - supply-chain
  - builder
milestone: m-9
dependencies:
  - TASK-032
  - TASK-033.02
references:
  - 'https://github.com/kurenn/slack-tui/releases/tag/v0.6.1'
  - >-
    backlog/tasks/task-032 -
    utils-install-verified-binaries-into-templates-from-a-builder-disposable.md
parent_task_id: TASK-033
priority: medium
type: feature
ordinal: 625
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

slack-tui is not in Debian. Its install script (`curl ... | sh`) runs unreviewed code.

### Proposed solution

Use the TASK-032 macro with the release archive. Candidate pin, from the GitHub asset digest on 2026-09-23:

- Version: `v0.6.1`
- Asset: `slack-tui_0.6.1_linux_amd64.tar.gz`
- SHA-256: `27b15b7c8a90d295aed926aac2a950fb949df6ba51cd51653107fbfda028ed55`

Check that this value matches the line in the release `checksums.txt`. The disposable verifies the archive and extracts the binary. The template verifies the pinned SHA-256 of the binary and installs it to `/usr/bin/slack-tui`. The checksums file is not signed, so the pin protects against a later change, not against a bad release.

### The value to a user, and who that user might be

- User: runs a known slack-tui build, and an update is a reviewed change of one pin.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 The release version, the archive SHA-256 and the binary SHA-256 are pinned in one location in salt/slack
- [x] #2 The archive SHA-256 matches the line in the release checksums.txt
- [x] #3 slack-tui --version runs in qube slack
- [x] #4 A wrong pin makes the install fail and installs nothing
- [x] #5 A second apply reports no changes
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
2026-09-24: pins in salt/slack/binaries.jinja. url_sha256 is the GitHub asset digest of v0.6.1. Binary sha256 6f1fed8e5f0a6c5dbe4babfb0540a012582f024460897252181e7cb50003e998 from the 'hash' action in a dvm-builder disposable, which also checked the download against url_sha256.
2026-09-25: url_sha256 matches the release checksums.txt. slack-tui --version runs in qube slack, a wrong pin fails the install without installing anything, and a second apply reports no changes (AC #2-#5).
<!-- SECTION:NOTES:END -->
