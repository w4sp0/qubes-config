# SPDX-FileCopyrightText: 2023 - 2025 Benjamin Grande M. S. <ben.grande.b@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

%define project         dotfiles
%define license_csv     AGPL-3.0-or-later,BSD-2-Clause,CC-BY-SA-3.0,CC-BY-SA-4.0,GFDL-1.3-or-later,GPL-2.0-only,GPL-3.0-only,GPL-3.0-or-later,MIT,OFL-1.1,Vim
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

Name:           qusal-dotfiles
Version:        0.0.1
Release:        1%{?dist}
Summary:        Dotfiles
Group:          qusal
Packager:       %{?_packager}%{!?_packager:Radek Janik <cyberwassp@gmail.com>}
Vendor:         Radek Janik
License:        AGPL-3.0-or-later AND BSD-2-Clause AND CC-BY-SA-3.0 AND CC-BY-SA-4.0 AND GFDL-1.3-or-later AND GPL-2.0-only AND GPL-3.0-only AND GPL-3.0-or-later AND MIT AND OFL-1.1 AND Vim
URL:            https://github.com/w4sp0/qubes-config
BugURL:         https://github.com/w4sp0/qubes-config/issues
Source0:        %{name}-%{version}.tar.gz
BuildArch:      noarch

Requires:       qubes-mgmt-salt
Requires:       qubes-mgmt-salt-dom0


%description
Configuration and scripts targeting:

*   Usability:
    *   Vi keybindings for application movement
    *   Emacs keybindings for command-line editing
    *   XDG Specification to not clutter $HOME
*   Portability:
    *   POSIX compliant code
    *   Drop-in configuration files
    *   Tested in Qubes OS Dom0, Debian, Fedora, OpenBSD
*   Tasks:
    *   GUI: x11, gtk, font
    *   SCM: git, tig, git-shell
    *   Keys: gpg, ssh
    *   Networking: curl, urlview, wget, w3m
    *   Productivity: tmux, vim
    *   Shell: sh, bash, zsh, less, dircolors

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
  true
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
* Wed Sep 09 2026 Radek Janik <cyberwassp@gmail.com> - 9b45fe3
- chore: update dotfiles submodule

* Wed Sep 09 2026 Radek Janik <cyberwassp@gmail.com> - b0d71ae
- chore: update dotfiles submodule

* Wed Sep 09 2026 Radek Janik <cyberwassp@gmail.com> - b45f540
- feat(dotfiles): add Source Code Pro font

* Wed Apr 29 2026 Radek Janik <cyberwassp@gmail.com> - 0885321
- chore: update submodule

* Sun Jan 04 2026 rad-jan <cyberwassp@gmail.com> - 094e8bf
- chore(dotfiles): update submodule

* Sat Nov 01 2025 wassp <cyberwassp@gmail.com> - 7b90651
- feat: submodule: update

* Sat Nov 01 2025 wassp <cyberwassp@gmail.com> - 099c1e9
- feat: submodules: Update submodules

* Wed Oct 29 2025 wassp <cyberwassp@gmail.com> - b2cbd3f
- feat: Update submodule

* Thu Sep 11 2025 wassp <cyberwassp@gmail.com> - 649c979
- feat: Update submodule

* Thu Sep 11 2025 wassp <cyberwassp@gmail.com> - e5688cf
- feat: Update submodule

* Thu Sep 11 2025 wassp <cyberwassp@gmail.com> - e87584b
- feat: Update submodule

* Tue Jul 22 2025 wassp <cyberwassp@gmail.com> - 8c8cf04
- feat: Update submodule

* Sun Jul 13 2025 wassp <cyberwassp@gmail.com> - 74aef51
- feat: Update submodule

* Sun Jul 13 2025 wassp <cyberwassp@gmail.com> - 2c5979e
- feat: Update submodules

* Sun Jul 13 2025 wassp <cyberwassp@gmail.com> - f9f8ad2
- feat: Update submodule

* Sun Jul 13 2025 wassp <cyberwassp@gmail.com> - b2c6d1b
- feat: Update submodule

* Sun Jun 22 2025 wassp <cyberwassp@gmail.com> - b1d542d
- feat: Update submodule

* Sat Jun 14 2025 wassp <cyberwassp@gmail.com> - 857f43e
- feat: Update dotiles submodule

* Sat Jun 14 2025 wassp <cyberwassp@gmail.com> - 47f22e5
- feat: Update dotfiles submodule

* Sat Jun 14 2025 wassp <cyberwassp@gmail.com> - a689554
- feat: Update submodule

* Sat Jun 14 2025 wassp <cyberwassp@gmail.com> - 7f44927
- feat: Update dotfiles submodule

* Sat Jun 14 2025 wassp <cyberwassp@gmail.com> - 568b7ee
- chore: Update submodule reference

* Sat Jun 14 2025 wassp <cyberwassp@gmail.com> - 2303d25
- feat: Update submodule

* Fri Jun 13 2025 wassp <cyberwassp@gmail.com> - 5deab89
- feat: Update submodules

* Fri Jun 13 2025 wassp <cyberwassp@gmail.com> - 691d388
- feat: Update submodules

* Thu Jun 12 2025 wassp <cyberwassp@gmail.com> - 222b333
- feat: Update submodule

* Thu Jun 12 2025 wassp <cyberwassp@gmail.com> - b33a4ae
- feat: Update submodules

* Thu Jun 12 2025 wassp <cyberwassp@gmail.com> - 9e17c71
- feat: Add dotfiles back

* Thu Jun 12 2025 wassp <cyberwassp@gmail.com> - 50fd2fc
- fix: Force remove broken salt/dotfiles submodule

* Thu Jun 12 2025 wassp <cyberwassp@gmail.com> - 32892f8
- feat: Update submodules

* Sun Jun 08 2025 wassp <cyberwassp@gmail.com> - 5bee086
- feat: Update submodules

* Sat May 03 2025 wassp <cyberwassp@gmail.com> - 012a761
- feat: Add discord to comms qubes

* Fri Apr 25 2025 wassp <cyberwassp@gmail.com> - 882ba6f
- feat: Updated submodule

* Tue Apr 22 2025 wassp <cyberwassp@gmail.com> - 95e01e6
- feat: Update submodule

* Sun Apr 20 2025 wassp <cyberwassp@gmail.com> - a405d99
- feat: Add C configuration to `dev` qube

* Sun Apr 20 2025 wassp <cyberwassp@gmail.com> - 03a62f7
- feat: Update dotfiles submodule

* Mon Apr 14 2025 wassp <cyberwassp@gmail.com> - 2d4481e
- feat: Update submodule

* Mon Apr 14 2025 wassp <cyberwassp@gmail.com> - 5a85972
- feat: Update submodule

* Mon Apr 14 2025 3np <3np@example.com> - 7246018
- fix: reference local sls imports by slsdotpath

* Mon Mar 03 2025 Ben Grande <ben.grande.b@gmail.com> - 2fe7d39
- feat: add pillar directory

* Thu Feb 27 2025 Ben Grande <ben.grande.b@gmail.com> - 90466e0
- feat: update dotfiles module

* Mon Jan 27 2025 Ben Grande <ben.grande.b@gmail.com> - 8609815
- feat: update dotfiles module

* Thu Jan 16 2025 Ben Grande <ben.grande.b@gmail.com> - 2d5d3af
- feat: update dotfiles module

* Tue Dec 03 2024 Ben Grande <ben.grande.b@gmail.com> - c713bd3
- fix: update dotfiles module

* Mon Oct 14 2024 Ben Grande <ben.grande.b@gmail.com> - 475b81a
- fix: skip edit of files owned by system packages

* Fri Aug 16 2024 Ben Grande <ben.grande.b@gmail.com> - c6582df
- fix: update dotfiles module

* Tue Aug 06 2024 Ben Grande <ben.grande.b@gmail.com> - bdd4c78
- fix: avoid echo usage

* Tue Aug 06 2024 Ben Grande <ben.grande.b@gmail.com> - 1b2f1ba
- fix: avoid operand evaluation as argument

* Tue Jul 16 2024 Ben Grande <ben.grande.b@gmail.com> - 43aaaff
- fix: update dotfiles module

* Mon Jul 15 2024 Ben Grande <ben.grande.b@gmail.com> - a36de84
- fix: update dotfiles module
