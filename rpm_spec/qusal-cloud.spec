# SPDX-FileCopyrightText: 2023 - 2025 Benjamin Grande M. S. <ben.grande.b@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

%define project         cloud
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

Name:           qusal-cloud
Version:        0.0.1
Release:        1%{?dist}
Summary:        Cloud operations environment in Qubes OS
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
Requires:       qusal-dev
Requires:       qusal-dotfiles
Requires:       qusal-sys-git
Requires:       qusal-sys-net
Requires:       qusal-sys-ssh-agent
Requires:       qusal-utils


%description
Setup a devops qube named "cloud", dedicated to AWS and Kubernetes
operations. As there is a very broad set of repositories, only common packages
will be installed.

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
  qubesctl state.apply cloud.create
  qubesctl --skip-dom0 --targets=tpl-cloud state.apply cloud.install
  qubesctl --skip-dom0 --targets=dvm-cloud state.apply cloud.configure-dvm
  qubesctl --skip-dom0 --targets=cloud state.apply cloud.configure
  proxy_target="$(qusal-report-updatevm-origin)"
  if test -n "${proxy_target}"; then
    qubesctl --skip-dom0 --targets="${proxy_target}" state.apply sys-net.install-proxy
  fi
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
* Thu Sep 24 2026 Radek Janik <cyberwassp@gmail.com> - 364e8cc
- docs(cloud): describe cloud operations in README

* Thu Sep 24 2026 Radek Janik <cyberwassp@gmail.com> - 98808c5
- refactor(cloud): drop mise

* Thu Sep 24 2026 Radek Janik <cyberwassp@gmail.com> - 6ecfa16
- fix(cloud): open URLs with qvm-open-in-dvm

* Thu Sep 24 2026 Radek Janik <cyberwassp@gmail.com> - 177606f
- fix: correct state references in top files

* Wed Sep 23 2026 Radek Janik <cyberwassp@gmail.com> - 5d95735
- chore(backlog): Plan next steps for the project

* Mon May 18 2026 Radek Janik <cyberwassp@gmail.com> - 7241c93
- fix: switch cloud formulas to debian

* Sun May 10 2026 Radek Janik <cyberwassp@gmail.com> - 8313707
- chore: update tooling for cloud  qube

* Sun Dec 21 2025 wassp <cyberwassp@gmail.com> - 1203114
- feat(cloud-qube): Add copr mise resources

* Sat Dec 20 2025 wassp <cyberwassp@gmail.com> - 20039d7
- feat(cloud): add fedora native tools

* Mon Dec 15 2025 wassp <cyberwassp@gmail.com> - 18e009e
- feat: bump fedora and debian versions

* Tue Dec 09 2025 wassp <cyberwassp@gmail.com> - eefda73
- feat(cloud): add mise install script

* Tue Dec 09 2025 wassp <cyberwassp@gmail.com> - 9f26681
- feat(cloud): add mise to sortware list

* Mon Dec 08 2025 wassp <cyberwassp@gmail.com> - 15e500a
- feat(cloud): add cloud qube definitions
