---
id: decision-002
title: install non-distribution binaries from a builder disposable
date: '2026-09-23 22:10'
status: accepted
---
## Context

Several tools are not packaged in Debian: discordo, slack-tui, argocd,
cilium, hubble, k9s, cloud-nuke, talosctl, kubelogin, probe-rs. The project
does not use mise. A download or a build inside a template needs compilers
in the template and extra Update Proxy hosts (for Go: github.com,
proxy.golang.org, sum.golang.org, storage.googleapis.com). discordo has no
releases, so it must be built from source.

The sys-bitcoin formula already downloads in a disposable and copies the
files to its template with qusal.InstallBitcoin, but the template does not
check what it receives.

## Decision

- Formula `builder`: `tpl-builder` (from debian-minimal, with curl, git,
  golang-go, tar, unzip) and the Template for DispVMs `dvm-builder`.
- Script `qusal-install-binary` in `tpl-builder`, methods `release` (URL and
  SHA-256 of the download, archive member) and `go` (repository, full commit
  hash, package, exact toolchain such as go1.27.0; CGO_ENABLED=0,
  -trimpath, -buildvcs=false, empty build ID). Actions `hash` and `install`.
- Qrexec service `qusal.InstallBinary+NAME` in the target template, from
  `builder.install-target`. It installs stdin to /usr/bin/NAME only if the
  SHA-256 matches /etc/qusal-install-binary/NAME.sha256, and refuses input
  over 512 MiB, unknown names and names with a path.
- Pin format: one Jinja dict per binary in `salt/FORMULA/binaries.jinja`.
  The template state writes the pin, the Dom0 state reads the same file.
- Macro `utils/macros/install-binary.sls`: `install_binary_pin` for the
  template, `install_binary` for Dom0. The Dom0 state starts a disposable
  with `qvm-run --dispvm=dvm-builder` only when the template binary does not
  have the pinned SHA-256.
- Policy per binary, in the formula policy file:
  `qusal.InstallBinary +NAME @dispvm:dvm-builder tpl-FORMULA allow user=root`
  followed by a deny for all other sources.

## Consequences

- Templates contain only verified binaries, and no compilers or third-party
  build code run in templates.
- A Go build output is pinned by its SHA-256, taken from two builds in
  separate disposables (trust on first build). If a build is not
  reproducible, it cannot use the `go` method.
- A pin change is a reviewed commit. An upstream change does not reach a
  template without it.
- A formula needs a Dom0 state and a policy file in addition to its template
  state, and the Dom0 state must run after the template state.
- sys-bitcoin keeps its own service. Moving it to this mechanism is optional.
