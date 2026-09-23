---
id: TASK-030.04
title: 'sys-gui-gpu: README uses a qvm-assign command that does not exist'
status: To Do
assignee: []
created_date: '2026-09-23 21:14'
labels:
  - sys-gui-gpu
  - docs
  - pci
milestone: m-7
dependencies: []
references:
  - salt/sys-gui-gpu/README.md
  - 'https://www.qubes-os.org/doc/how-to-use-pci-devices/'
parent_task_id: TASK-030
priority: medium
type: docs
ordinal: 4400
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

The README tells the user to run `qvm-assign -v -o permissive=True -o no-strict-reset=True -r sys-gui-gpu dom0:00_02.1-00_00.0`. Qubes has no `qvm-assign` tool. The PCI assignment is done with `qvm-pci` (or `qvm-device pci`). The example device ID is also unusual for an Intel integrated GPU, which is usually at `00_02.0`.

### Proposed solution

Replace the command with the `qvm-pci` syntax of the installed Qubes release (dom0 is Fedora 41, so Qubes 4.3). Test it on this machine, and use `qvm-pci ls` output for the example.

### The value to a user, and who that user might be

- User: can assign the GPU by copying the README command.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 The README command runs without error on Qubes 4.3
- [ ] #2 After the command, qvm-pci ls shows the GPU assigned to sys-gui-gpu with the permissive and no-strict-reset options
- [ ] #3 scripts/markdown-lint.sh salt/sys-gui-gpu/README.md exits 0
<!-- AC:END -->
