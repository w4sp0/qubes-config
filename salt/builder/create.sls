{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{#
Disposable builders that download or compile a pinned binary and send it to
a template with 'qusal.InstallBinary'. See 'utils/macros/install-binary.sls'.
#}

{%- from "qvm/template.jinja" import load -%}

include:
  - {{ slsdotpath }}.clone

{% load_yaml as defaults -%}
name: tpl-{{ slsdotpath }}
force: True
require:
- sls: {{ slsdotpath }}.clone
prefs:
- audiovm: ""
{%- endload %}
{{ load(defaults) }}

{% load_yaml as defaults -%}
name: dvm-{{ slsdotpath }}
force: True
require:
- sls: {{ slsdotpath }}.clone
present:
- template: tpl-{{ slsdotpath }}
- label: red
prefs:
- template: tpl-{{ slsdotpath }}
- label: red
- audiovm: ""
- default_dispvm: ""
- memory: 400
- maxmem: 4000
- vcpus: 2
- autostart: False
- template_for_dispvms: True
- include_in_backups: False
features:
- disable:
  - appmenus-dispvm
  - service.cups
  - service.cups-browsed
## Disposables copy the tags of their template. Policies use the tag as the
## source, because '@dispvm:dvm-builder' matches only as a target.
tags:
- add:
  - "qusal-builder"
{%- endload %}
{{ load(defaults) }}

## Go toolchains, module cache and build cache live in the home directory.
"{{ slsdotpath }}-resize-private-volume":
  cmd.run:
    - require:
      - qvm: dvm-{{ slsdotpath }}
    - name: qvm-volume extend dvm-{{ slsdotpath }}:private 10Gi
    - unless: test "$(qvm-volume info dvm-{{ slsdotpath }}:private size)" -ge 10737418240
