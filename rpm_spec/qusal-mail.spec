# SPDX-FileCopyrightText: 2023 - 2025 Benjamin Grande M. S. <ben.grande.b@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

%define project         mail
%define license_csv     AGPL-3.0-or-later
## Reproducibility.
%define source_date_epoch_from_changelog 1
%define use_source_date_epoch_as_buildtime 1
%define clamp_mtime_to_source_date_epoch 1
## Changelog is trimmed according to current date, not last date from changelog.
%define _changelog_trimtime 0
%define _changelog_trimage 0
%global _buildhost %{name}
## Python bytecode interferes when updates occur and restart is not done.
%undefine __brp_python_bytecompile

Name:           qusal-mail
Version:        0.0.1
Release:        1%{?dist}
Summary:        Mail operations in Qubes OS
Group:          qusal
Packager:       %{?_packager}%{!?_packager:Radek Janik <cyberwassp@gmail.com>}
Vendor:         Radek Janik
License:        AGPL-3.0-or-later
URL:            https://github.com/w4sp0/qubes-config
BugURL:         https://github.com/w4sp0/qubes-config/issues
Source0:        %{name}-%{version}.tar.gz
BuildArch:      noarch

Requires:       qubes-mgmt-salt
Requires:       qubes-mgmt-salt-dom0
Requires:       qusal-dotfiles
Requires:       qusal-reader
Requires:       qusal-sys-pgp
Requires:       qusal-utils


%description
Create a mail fetcher qube named "(disp-)mail-fetcher", a mail reader qube
named "mail-reader", a mail sender qube named "(disp-)mail-sender" and an
OAuth2 token qube named "mail-token".

The online "(disp-)mail-fetcher" qube will fetch messages with POP3 or IMAP.
After being fetched, you can copy them to the offline "mail-reader" qube,
where you will be reading emails. After composing a message, the
"mail-reader" qube will save the messages to a queue, which can be forwarded
to the online "(disp-)mail-sender" qube. You can review messages to be sent
from the "(disp-)mail-sender" qube and then send them via SMTP.

For OAuth2 accounts, such as Gmail, the "mail-token" qube keeps the refresh
token and hands out short lived access tokens to the fetcher and the sender.

By default, the protocols used require SSL, POP3 on port 995, IMAP on port
993 and SMTP on port 465. You can always override any configuration via
included files.

This formula is based on Unman's SplitMutt guide, using POP3 and/or IMAP to
get mail, not considering SSH access to the mail server. We are using
qfile-agent and not Rsync to synchronize mails between qubes to avoid a higher
attack surface, but Rsync may be considered in the future in case qfile-agent
causes problems.

%prep
%setup -q

%build

%check

%pre

%install
rm -rf -- %{buildroot}
install -m 755 -d -- \
  %{buildroot}/srv/salt/qusal \
  %{buildroot}%{_docdir}/%{name} \
  %{buildroot}%{_defaultlicensedir}/%{name}

for license in $(printf '%s\n' "%{license_csv}" | tr "," " "); do
  license_dir="LICENSES"
  if test -d "salt/%{project}/LICENSES"; then
    license_dir="salt/%{project}/LICENSES"
  fi
  install -m 644 -- \
    "${license_dir}/${license}.txt" %{buildroot}%{_defaultlicensedir}/%{name}/
done

install -m 644 -- salt/%{project}/README.md %{buildroot}%{_docdir}/%{name}/
rm -rf -- \
  salt/%{project}/LICENSES \
  salt/%{project}/README.md \
  salt/%{project}/.*
cp -rv -- salt/%{project} %{buildroot}/srv/salt/qusal/%{name}

%post
if test "$1" = "1"; then
  ## Install
  qubesctl state.apply mail.create
  qubesctl state.apply mail.firewall
  qubesctl --skip-dom0 --targets=tpl-reader state.apply reader.install
  qubesctl --skip-dom0 --targets=tpl-mail-fetcher state.apply mail.install-fetcher
  qubesctl --skip-dom0 --targets=tpl-mail-reader state.apply mail.install-reader
  qubesctl --skip-dom0 --targets=tpl-mail-sender state.apply mail.install-sender
  qubesctl --skip-dom0 --targets=tpl-mail-token state.apply mail.install-token
  qubesctl --skip-dom0 --targets=dvm-mail-fetcher state.apply mail.configure-fetcher
  qubesctl --skip-dom0 --targets=mail-reader state.apply mail.configure-reader
  qubesctl --skip-dom0 --targets=dvm-mail-sender state.apply mail.configure-sender
  qubesctl --skip-dom0 --targets=mail-token state.apply mail.configure-token
  qubesctl state.apply mail.appmenus
elif test "$1" = "2"; then
  ## Upgrade
  true
fi

%preun
if test "$1" = "0"; then
  ## Uninstall
  true
elif test "$1" = "1"; then
  ## Upgrade
  true
fi

%postun
if test "$1" = "0"; then
  ## Uninstall
  true
elif test "$1" = "1"; then
  ## Upgrade
  true
fi

%files
%defattr(-,root,root,-)
%license %{_defaultlicensedir}/%{name}/*
%doc %{_docdir}/%{name}/README.md
%dir /srv/salt/qusal/%{name}
/srv/salt/qusal/%{name}/*
%dnl TODO: missing '%ghost', files generated during %post, such as Qrexec policies.

%changelog
* Tue Sep 22 2026 Radek Janik <cyberwassp@gmail.com> - a759d76
- docs(mail): clarify browser disposable handling

* Tue Sep 22 2026 Radek Janik <cyberwassp@gmail.com> - 41941f3
- fix(mail): remove accept left by firewall reset

* Tue Sep 22 2026 Radek Janik <cyberwassp@gmail.com> - 9643293
- feat(mail): suggest inbox only fetch for gmail

* Tue Sep 22 2026 Radek Janik <cyberwassp@gmail.com> - 67aebf4
- fix(mail): drop `libgnutls30` from seder packages

* Tue Sep 22 2026 Radek Janik <cyberwassp@gmail.com> - 4c3e40b
- fix(mail): harden oauth2 tken client and docs

* Thu Sep 10 2026 Radek Janik <cyberwassp@gmail.com> - 0bd3009
- fix: Remove fdm package

* Thu Sep 10 2026 Radek Janik <cyberwassp@gmail.com> - 7e20f69
- fix: fix oauth2 flow

* Thu Sep 10 2026 Radek Janik <cyberwassp@gmail.com> - 9799d5e
- fix: Fix the loopback port required by Google

* Thu Sep 10 2026 Radek Janik <cyberwassp@gmail.com> - d7ddf61
- feat(mail): split OAuth2 token handling into a mail-token qube

* Wed Sep 09 2026 Radek Janik <cyberwassp@gmail.com> - 99a4421
- feat(mail): restrict fetcher and sender egress with qvm-firewall

* Wed Sep 09 2026 Radek Janik <cyberwassp@gmail.com> - b45f540
- feat(dotfiles): add Source Code Pro font

* Sun Jun 08 2025 wassp <cyberwassp@gmail.com> - 569015d
- feat: Add urlscan to mail-reader

* Fri May 23 2025 wassp-ds <159651322+wassp-ds@users.noreply.github.com> - dfd57ed
- Merge branch 'ben-grande:main' into main

* Sat Apr 19 2025 wassp <cyberwassp@gmail.com> - 55c3f49
- feat: Add the oauth helper files for mail fetcher and sender

* Fri Apr 18 2025 wassp <cyberwassp@gmail.com> - b8f20c4
- feat: Add oauth2 helper script for mail

* Wed Apr 16 2025 Ben Grande <ben.grande.b@gmail.com> - 24628df
- fix: respect dotfiles pillar on mutt config sample

* Wed Apr 16 2025 Ben Grande <ben.grande.b@gmail.com> - 715fbcc
- fix: file.symlink with file.managed keys

* Mon Apr 14 2025 3np <3np@example.com> - 7246018
- fix: reference local sls imports by slsdotpath

* Thu Jan 09 2025 Ben Grande <ben.grande.b@gmail.com> - 3d4ab18
- feat: configure mail fetcher with offlineimap

* Wed Jan 08 2025 Ben Grande <ben.grande.b@gmail.com> - aea8438
- fix: stricter command-line parsing

* Fri Aug 16 2024 Ben Grande <ben.grande.b@gmail.com> - 56a4296
- fix: skip YUM weak dependencies installation

* Tue Aug 06 2024 Ben Grande <ben.grande.b@gmail.com> - bdd4c78
- fix: avoid echo usage

* Tue Aug 06 2024 Ben Grande <ben.grande.b@gmail.com> - 1b2f1ba
- fix: avoid operand evaluation as argument

* Thu Jul 04 2024 Ben Grande <ben.grande.b@gmail.com> - 383c840
- doc: lint markdown files

* Fri Jun 21 2024 Ben Grande <ben.grande.b@gmail.com> - c84dfea
- fix: generate RPM Specs for Qubes Builder V2

* Tue May 14 2024 Ben Grande <ben.grande.b@gmail.com> - d148599
- doc: nested list indentation

* Mon Mar 18 2024 Ben Grande <ben.grande.b@gmail.com> - f9ead06
- fix: remove extraneous package repository updates

* Fri Feb 23 2024 Ben Grande <ben.grande.b@gmail.com> - 5605ec7
- doc: prefix qubesctl with sudo

* Mon Jan 29 2024 Ben Grande <ben.grande.b@gmail.com> - 6efcc1d
- chore: copyright update

* Sat Jan 27 2024 Ben Grande <ben.grande.b@gmail.com> - dab2979
- fix: mail qrexec policy missing disp in name

* Fri Jan 26 2024 Ben Grande <ben.grande.b@gmail.com> - a04960c
- feat: initial split-mail setup
