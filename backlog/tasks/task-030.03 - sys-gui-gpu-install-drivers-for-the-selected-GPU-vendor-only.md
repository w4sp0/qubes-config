---
id: TASK-030.03
title: 'sys-gui-gpu: install drivers for the selected GPU vendor only'
status: To Do
assignee: []
created_date: '2026-09-23 21:14'
labels:
  - sys-gui-gpu
  - pillar
milestone: m-7
dependencies: []
references:
  - salt/sys-gui-gpu/install.sls
  - salt/sys-gui-gpu/README.md
parent_task_id: TASK-030
priority: low
type: enhancement
ordinal: 4300
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`sys-gui-gpu.install` installs the firmware and X drivers for AMD, NVIDIA and Intel in `tpl-sys-gui-gpu`. Only one vendor is used. The README says that the formula needs a dedicated graphics card, and also that it assumes an Intel card (usually integrated).

### Proposed solution

Read the vendor from pillar (for example `qvm:sys-gui-gpu:vendor`, default `intel`). Install only that vendor's packages. Correct the README text about which GPUs are supported.

### The value to a user, and who that user might be

- User: the GUI domain template has fewer packages and a smaller attack surface.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 With the vendor set to intel, no AMD or NVIDIA package is installed in tpl-sys-gui-gpu
- [ ] #2 The pillar key is documented in the README and in the state docstring
- [ ] #3 The README states the supported GPU types without contradiction
<!-- AC:END -->
