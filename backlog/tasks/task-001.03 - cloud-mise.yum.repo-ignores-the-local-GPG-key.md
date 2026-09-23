---
id: TASK-001.03
title: 'cloud: mise.yum.repo ignores the local GPG key'
status: To Do
assignee: []
created_date: '2026-09-23 20:39'
labels:
  - cloud
  - repo
  - security
milestone: m-1
dependencies: []
references:
  - salt/cloud/files/repo/mise.yum.repo
  - salt/utils/macros/install-repo.sls
parent_task_id: TASK-001
priority: low
type: bug
ordinal: 9700
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Software version

Base commit: 3f52d2b

### Brief summary

Macro `install_repo` installs `mise.yum.asc` to `/etc/pki/rpm-gpg/RPM-GPG-KEY-mise`. `mise.yum.repo` sets `gpgkey=https://download.copr.fedorainfracloud.org/...`, so dnf downloads the key on first use (TOFU). Only Fedora templates are affected.

### Expected behavior

dnf verifies mise packages with the key in the repository.

### Actual behavior

dnf downloads and trusts the key from the network.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 mise.yum.repo sets gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mise
- [ ] #2 dnf makecache on a Fedora tpl-cloud does not download a GPG key
<!-- AC:END -->
