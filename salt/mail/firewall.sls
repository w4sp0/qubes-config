{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{#
Restrict the egress of the network facing mail qubes.

The rules are enforced by 'qubes-firewall' running in the NetVM, therefore
they hold even if the mail qube itself is fully compromised.

Beware of 'dsthost': 'qubes-firewall' resolves host names with getaddrinfo()
only while applying the rule set, that is, on qube start or on rule change,
and never re-resolves them afterwards. Providers that round-robin over large
netblocks, such as Gmail, hand the client an address that was never pinned
and the connection is dropped. The defaults below therefore restrict the
ports only and leave 'dsthost' empty.

Applying this state momentarily resets the rule set before installing the
final 'drop', so avoid running it while a mail qube is untrusted.

Pillar:

qusal:
  mail:
    fetcher:
      dstports: [993]
      dsthost: []
    sender:
      dstports: [465]
      dsthost: []
#}

{% if grains['nodename'] == 'dom0' %}

include:
  - {{ slsdotpath }}.create

{% load_yaml as roles -%}
fetcher:
  dstports:
    - 993
  qubes:
    - {{ slsdotpath }}-fetcher
    - dvm-{{ slsdotpath }}-fetcher
    - disp-{{ slsdotpath }}-fetcher
sender:
  dstports:
    - 465
  qubes:
    - {{ slsdotpath }}-sender
    - dvm-{{ slsdotpath }}-sender
    - disp-{{ slsdotpath }}-sender
{%- endload %}

{% for role, conf in roles.items() %}
{%- set pillar_key = 'qusal:' ~ slsdotpath ~ ':' ~ role %}
{%- set dstports = salt['pillar.get'](pillar_key ~ ':dstports', conf['dstports']) %}
{%- set dsthost = salt['pillar.get'](pillar_key ~ ':dsthost', []) %}
{%- set rules = [] %}
{%- for port in dstports %}
{%- if dsthost %}
{%- for host in dsthost %}
{%- set _ = rules.append('accept proto=tcp dsthost=' ~ host ~ ' dstports=' ~ port) %}
{%- endfor %}
{%- else %}
{%- set _ = rules.append('accept proto=tcp dstports=' ~ port) %}
{%- endif %}
{%- endfor %}
{%- for qube in conf['qubes'] %}

"{{ slsdotpath }}-firewall-{{ qube }}":
  cmd.run:
    - require:
      - sls: {{ slsdotpath }}.create
    - runas: root
    - name: |
        set -eu
        qvm-firewall {{ qube }} reset
        qvm-firewall {{ qube }} add drop
        qvm-firewall {{ qube }} add --before 0 accept specialtarget=dns
{%- for rule in rules %}
        qvm-firewall {{ qube }} add --before 0 {{ rule }}
{%- endfor %}
{% endfor %}
{%- endfor %}

{% endif -%}
