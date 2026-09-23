---
id: TASK-010
title: 'dev-tofu: generate rpm spec'
status: To Do
assignee: []
created_date: '2026-09-23 20:39'
updated_date: '2026-09-23 20:41'
labels:
  - dev-tofu
  - rpm
milestone: m-0
dependencies:
  - TASK-005
  - TASK-001.08
references:
  - scripts/spec-gen.sh
  - rpm_spec/template/template.spec
  - salt/dev-tofu/README.md
priority: low
type: chore
ordinal: 8000
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

`rpm_spec/qusal-dev-tofu.spec` does not exist. The formula is not packaged.

### Proposed solution

Generate the spec with `scripts/spec-gen.sh dev-tofu` after TASK-005 corrects `install.top`.

### The value to a user, and who that user might be

- User: installs dev-tofu from the qusal RPM repository.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 rpm_spec/qusal-dev-tofu.spec exists
- [ ] #2 scripts/spec-build.sh dev-tofu exits 0
- [ ] #3 The spec post-install section matches the pkg:begin:post-install block in README.md
<!-- AC:END -->

## Comments

<!-- COMMENTS:BEGIN -->
created: 2026-09-23 20:41
---
Blocked by TASK-001.08. If that decision removes or merges dev-tofu, archive this task.
---
<!-- COMMENTS:END -->
