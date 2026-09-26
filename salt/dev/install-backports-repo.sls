{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{#
Debian backports of the running release, signed by the Debian archive key
that the template already trusts. APT does not upgrade to backports unless
a package is installed from them explicitly.
#}

{% if grains['nodename'] != 'dom0' -%}

{% if grains['os_family']|lower == 'debian' -%}

"{{ slsdotpath }}-install-backports-repository":
  file.managed:
    - name: /etc/apt/sources.list.d/backports.sources
    - source: salt://{{ slsdotpath }}/files/repo/backports.sources
    - template: jinja
    - mode: '0644'
    - user: root
    - group: root
    - makedirs: True

{% if salt['cmd.has_exec']('apt-cacher-ng-repo') -%}
"{{ slsdotpath }}-backports-run-apt-cacher-ng-repo":
  cmd.run:
    - require:
      - file: "{{ slsdotpath }}-install-backports-repository"
    - name: apt-cacher-ng-repo
{% endif -%}

{% endif -%}

{% endif -%}
