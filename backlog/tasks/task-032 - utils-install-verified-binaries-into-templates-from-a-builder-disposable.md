---
id: TASK-032
title: 'utils: install verified binaries into templates from a builder disposable'
status: In Progress
assignee: []
created_date: '2026-09-23 21:47'
updated_date: '2026-09-23 22:58'
labels:
  - utils
  - qrexec
  - supply-chain
  - builder
milestone: m-0
dependencies: []
references:
  - salt/sys-bitcoin/configure-builder.sls
  - salt/sys-bitcoin/configure-builder-source.sls
  - salt/sys-bitcoin/files/admin/policy/default.policy
  - salt/fetcher/
priority: high
type: feature
ordinal: 7050
---

## Description

<!-- SECTION:DESCRIPTION:BEGIN -->
### Current problem (if any)

Several tools are not in Debian: `discordo`, `slack-tui`, `argocd`, `cilium`, `hubble`, `helm`, `k9s`, `cloud-nuke`, `talosctl`, `kubelogin`, `probe-rs`. The project does not use `mise`. A download or build inside a template needs extra `sys-cacher` passthrough hosts (for Go: `github.com`, `proxy.golang.org`, `sum.golang.org`, `storage.googleapis.com`) and puts build tools and build-time code in the template.

### Proposed solution

Generalize the `sys-bitcoin` builder pattern (`disp-bitcoin-builder` and `qusal.InstallBitcoin`) into one reusable mechanism:

1. A disposable template for builders with network, `git`, `curl` and `golang-go` (Go fetches newer toolchains with `GOTOOLCHAIN=auto`, verified by `sum.golang.org`). Extend `fetcher` or add a `builder` formula.
2. A macro that a formula calls with: tool name, target template, and one of: a release URL with a pinned SHA-256, or a git URL with a pinned commit hash and a build command.
3. A qrexec service in the target template, for example `qusal.InstallBinary+<name>`, that receives one file and installs it to `/usr/bin/<name>` with mode 0755. It accepts only names in an allow list.
4. The template checks the pinned SHA-256 of the received file before install, so it does not trust the disposable. For source builds, pin the SHA-256 of the build output (`CGO_ENABLED=0`, `-trimpath`, fixed toolchain), and record in the task notes if the Go build is reproducible.
5. A policy for each tool: `qusal.InstallBinary +<name> disp-<formula>-builder tpl-<formula> allow user=root`, and deny for all other sources.
6. An apply is a no-op when the installed file already has the pinned SHA-256.

### The value to a user, and who that user might be

- User: templates contain only verified binaries, and no template runs build tools or third-party build code.
- Developer: adds a non-Debian tool with one macro call and one pin.
<!-- SECTION:DESCRIPTION:END -->

## Acceptance Criteria
<!-- AC:BEGIN -->
- [x] #1 A backlog decision records the builder template, the qrexec service, the policy format and the pin format
- [ ] #2 The macro installs a release binary with a pinned SHA-256 into a template
- [x] #3 The macro builds a pinned git commit in the disposable and installs the result into a template
- [ ] #4 The template refuses a file whose SHA-256 does not match the pin, and installs nothing
- [ ] #5 A second apply with an unchanged pin reports 0 changes and starts no disposable
- [ ] #6 No template gets golang-go or new sys-cacher passthrough hosts because of this mechanism
<!-- AC:END -->

## Implementation Notes

<!-- SECTION:NOTES:BEGIN -->
Implemented: formula salt/builder (tpl-builder, dvm-builder, builder.install, builder.install-target), script qusal-install-binary, service qusal.InstallBinary, macro salt/utils/macros/install-binary.sls, decision-002. First user: discord.

Tested in this qube with shims for curl and qrexec-client-vm (no Qubes calls): release download with archive extraction, hash action, install with correct pin, refusal of a wrong download SHA-256, a wrong builder pin, a path in the archive member, an invalid name; the service refuses a tampered payload (installed file unchanged), input over the size limit, names with a path or leading dot, and a malformed pin; no temporary files are left. shell-lint passes on both scripts. The macro renders to the expected states with jinja2; an empty pin gives test.fail_without_changes, and a quote in a pin raises.

Not tested: the go method (this qube has 525 MB RAM and no Go), qvm-run --dispvm and the policy on a real system, salt-lint (not installed). Still to do: rpm spec for builder (scripts/spec-gen.sh builder).

Generated rpm_spec/qusal-builder.spec at a3e8d1c; spec-gen.sh test passes. spec-build.sh not run (no rpmbuild in the dev qube).

2026-09-24: the go method works in dvm-builder. Two builds of discordo de2f2c94 with go1.27.0 in separate disposables gave the same SHA-256 (93e5d93a42890778c566bf826946e6b7d5ff1016ee760e8d18be5fae5c865c35), so the Go build is reproducible with the script flags. Fixed: cleanup failed on read-only Go toolchain files (chmod -R u+w before rm).

2026-09-24 dom0 test: the build passed and the builder-side pin check passed, but qrexec refused qusal.InstallBinary+discordo (policy 45-discord line 8, the deny). '@dispvm:dvm-builder' does not match a running disposable as a source. Fix: tag dvm-builder with qusal-builder (disposables copy template tags) and use @tag:qusal-builder as the policy source.

2026-09-24 dom0 test: with @tag:qusal-builder, discord.install-binary built discordo in a dvm-builder disposable and tpl-discord installed it; after a restart, /usr/bin/discordo in qube discord has the pinned SHA-256. From the dev qube (no tag), qrexec-client-vm tpl-discord qusal.InstallBinary+discordo returns 'Request refused' (exit 126). Open: AC #2 (release method on a real system), AC #4 (mismatch refusal on a real system), AC #5 (second apply), AC #6.
<!-- SECTION:NOTES:END -->
