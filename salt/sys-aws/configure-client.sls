{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

"{{ slsdotpath }}-client-create-aws-directory":
  file.directory:
    - name: /home/user/.aws
    - mode: '0700'
    - user: user
    - group: user
    - makedirs: True

## Generate .aws/config from pillar data (credential_process, no SSO).
## Only profiles allowed for this qube are included.
## Pillar structure:
##   qusal:
##     sys-aws:
##       default_region: "us-east-1"
##       profiles:
##         sandbox:
##           region: "us-east-1"
##       clients:
##         cloud:
##           - sandbox
##           - dev
{%- set aws = salt['pillar.get']('qusal:sys-aws', {}) %}
{%- set default_region = aws.get('default_region', 'us-east-1') %}
{%- set profiles = aws.get('profiles', {}) %}
{%- set clients = aws.get('clients', {}) %}
{%- set qube_name = grains['id'] %}
{%- set allowed_profiles = clients.get(qube_name, []) %}

{%- if allowed_profiles %}
"{{ slsdotpath }}-client-aws-config":
  file.managed:
    - name: /home/user/.aws/config
    - mode: '0600'
    - user: user
    - group: user
    - contents: |
        # Managed by Salt - do not edit manually.
        # Credentials are fetched from sys-aws via Qrexec.
        {%- for profile_name in allowed_profiles %}
        {%- set profile_data = profiles.get(profile_name, {}) %}

        [profile {{ profile_name }}]
        credential_process = qusal-aws-credential {{ profile_name }}
        region = {{ profile_data.get('region', default_region) }}
        output = json
        {%- endfor %}

{%- endif %}

{% endif -%}
