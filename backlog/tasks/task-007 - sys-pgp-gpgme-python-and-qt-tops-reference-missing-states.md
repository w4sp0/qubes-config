---
id: TASK-007
title: 'sys-pgp: gpgme python and qt tops reference missing states'
status: In Progress
assignee: []
created_date: '2026-09-23 20:39'
updated_date: '2026-09-23 21:36'
labels:
  - sys-pgp
  - top
  - upstream
milestone: m-0
dependencies: []
references:
  - salt/sys-pgp/install-client-gpgme-python.top
  - salt/sys-pgp/install-client-gpgme-qt.top
priority: medium
type: bug
ordinal: 5000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b (defect is inherited from upstream qusal).

### Brief summary

`install-client-gpgme-python.top` references `sys-pgp.install-client-python`. `install-client-gpgme-qt.top` references `sys-pgp.install-client-qt`. The state files are `install-client-gpgme-python.sls` and `install-client-gpgme-qt.sls`.

### Steps to reproduce

1. Run `sudo qubesctl top.enable sys-pgp.install-client-gpgme-python`.
2. Apply highstate to a target of that top.

### Expected behavior

The gpgme Python client state is applied.

### Actual behavior

Salt reports that SLS `sys-pgp.install-client-python` is not found. The qt top has the same defect.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 install-client-gpgme-python.top references sys-pgp.install-client-gpgme-python
- [x] #2 install-client-gpgme-qt.top references sys-pgp.install-client-gpgme-qt
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
Both top files fixed. A script check over all salt/*/*.top (excluding qvm.* and update.*, which dom0 provides) finds no missing SLS.
<!-- SECTION:NOTES:END -->
