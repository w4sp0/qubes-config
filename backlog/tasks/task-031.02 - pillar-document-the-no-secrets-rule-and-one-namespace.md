---
id: TASK-031.02
title: 'pillar: document the no-secrets rule and one namespace'
status: To Do
assignee: []
created_date: '2026-09-23 21:24'
labels:
  - pillar
  - docs
  - secrets
milestone: m-8
dependencies:
  - TASK-031.01
references:
  - salt/dotfiles/pillar.sls.example
  - salt/dotfiles/pillar.top.example
  - salt/mail/firewall.sls
  - docs/
parent_task_id: TASK-031
priority: medium
type: docs
ordinal: 1200
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Upstream states read `qvm:<formula>:...` pillar keys. New states and tasks use `qusal:<formula>:...` (`mail.firewall`, TASK-011). No document states which namespace to use, where a private pillar tree lives, or that pillar contains no secrets.

### Proposed solution

Add a pillar page to `docs/` that states:

- The rule from TASK-031.01: no secrets in pillar.
- The namespace for new keys, and that upstream `qvm:` keys stay unchanged.
- Where the private pillar tree lives (outside the public repository) and how to enable it with a top file.
- The list of pillar keys that formulas read, with their defaults.

Set `show_changes: False` on each `file.managed` state that can write sensitive but non-secret content.

### The value to a user, and who that user might be

- Developer: adds pillar keys with one convention and does not commit private values.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [ ] #1 docs/ contains a pillar page with the rule, the namespace, the private tree location and the key list
- [ ] #2 Each pillar key read by a state in salt/ is in the key list
- [ ] #3 scripts/markdown-lint.sh exits 0 on the page
<!-- AC:END -->
