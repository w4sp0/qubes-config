---
id: TASK-036
title: 'copyright: files changed in 2026 fail copyright-lint'
status: To Do
assignee: []
created_date: '2026-09-25 21:24'
labels:
  - ci
  - reuse
  - lint
milestone: m-0
dependencies: []
references:
  - scripts/copyright-lint.sh
  - .reuse/dep5
  - .pre-commit-config.yaml
  - .github/workflows/main.yaml
priority: medium
type: bug
ordinal: 10500
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 0a9f7d4

### Brief summary

`scripts/copyright-lint.sh` requires each changed file to list the committer's e-mail with a copyright year of at least the current year. About 110 files changed in 2026 have no `2026 Radek Janik <cyberwassp@gmail.com>` entry, because `.reuse/dep5` still gives them to Benjamin Grande (up to 2025). They include all `rpm_spec/*.spec` files, `docs/*`, `.github/ISSUE_TEMPLATE/*`, `.gitmodules`, `.pre-commit-config.yaml`, `.qubesbuilder`, `salt/sys-usb/README.md`, and files in `salt/slack`, `salt/cloud`, `salt/dev`, `salt/discord` and others.

Nothing blocks these commits:
- No git hooks are installed in the local repository, so the `commit` stage hook never runs.
- CI runs the hook with `GIT_EMAIL: ben.grande.b@gmail.com`, and it reports `Passed`. Why it passes is not known yet. `SPEC_VENDOR` and `SPEC_PACKAGER` in the workflow also still name Ben Grande.

### Steps to reproduce

1. Run `scripts/copyright-lint.sh docs/INSTALL.md salt/sys-usb/README.md`.

### Expected behavior

The script exits 0 for files changed in 2026.

### Actual behavior

`docs/INSTALL.md: : outdated copyright year: <cyberwassp@gmail.com>` for each file.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 scripts/copyright-lint.sh exits 0 for every existing file changed since 2026-01-01
- [ ] #2 Upstream copyright lines in .reuse/dep5 and file headers are kept
- [ ] #3 The task notes record why the CI copyright-lint step passed with GIT_EMAIL set to ben.grande.b@gmail.com, and CI checks the fork maintainer's e-mail
- [ ] #4 docs/CONTRIBUTE.md states how to install the pre-commit hooks locally, or the task notes record why hooks stay manual
<!-- AC:END -->
