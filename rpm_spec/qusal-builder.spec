# SPDX-FileCopyrightText: 2023 - 2025 Benjamin Grande M. S. <ben.grande.b@gmail.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

%define project         builder
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

Name:           qusal-builder
Version:        0.0.1
Release:        1%{?dist}
Summary:        Install pinned binaries that are not packaged in Qubes OS
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
Requires:       qusal-utils


%description
Creates the Template for DispVMs "dvm-builder". A disposable based on it
downloads a pinned release, or builds a pinned git commit with Go, and sends
the binary to a template with the `qusal.InstallBinary` Qrexec service. The
template installs the binary to `/usr/bin` only if its SHA-256 matches the
pin that the formula wrote in the template. The template does not trust the
disposable, and the binary never passes through Dom0.

Templates get no compilers and no extra Update Proxy access, because the
download and the build happen in the disposable.

This formula is not the same as `utils.tools.builder`, which installs
packaging tools.

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
  qubesctl state.apply builder.create
  qubesctl --skip-dom0 --targets=tpl-builder state.apply builder.install
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
* Thu Sep 24 2026 Radek Janik <cyberwassp@gmail.com> - b85f1ec
- feat(builder): install pinned binaries from disp
