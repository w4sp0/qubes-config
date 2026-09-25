{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

{% if grains['os_family'] == 'Debian' -%}

"common-locale-installed":
  pkg.installed:
    - require:
      - pkg: common-updated
    - install_recommends: False
    - skip_suggestions: True
    - pkgs:
      - locales

"common-locale-configured":
  file.replace:
    - require:
      - pkg: common-locale-installed
    - name: /etc/locale.gen
    - pattern: '^# *en_US\.UTF-8 UTF-8 *$'
    - repl: 'en_US.UTF-8 UTF-8'

"common-locale-generated":
  cmd.run:
    - require:
      - file: common-locale-configured
    - name: /usr/sbin/locale-gen
    - runas: root
    - unless: locale -a | grep -qxi 'en_US\.utf-\?8'

{% elif grains['os_family'] == 'RedHat' -%}

"common-locale-installed":
  pkg.installed:
    - require:
      - pkg: common-updated
    - install_recommends: False
    - skip_suggestions: True
    - setopt: "install_weak_deps=False"
    - pkgs:
      - glibc-langpack-en

{% endif -%}

{% endif -%}
