{#
SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>

SPDX-License-Identifier: AGPL-3.0-or-later
#}

{% if grains['nodename'] != 'dom0' -%}

include:
  - dev.home-cleanup
  - dotfiles.copy-x11

"{{ slsdotpath }}-create-aws-directory":
  file.directory:
    - name: /home/user/.aws
    - mode: '0700'
    - user: user
    - group: user
    - makedirs: True

## Generate .aws/config from pillar data (all profiles, SSO-native).
## Pillar structure:
##   qusal:
##     sys-aws:
##       sso_start_url: "https://myorg.awsapps.com/start"
##       sso_region: "us-east-1"
##       default_region: "us-east-1"
##       profiles:
##         admin:
##           account_id: "111111111111"
##           role_name: "AdministratorAccess"
##         sandbox:
##           account_id: "222222222222"
##           role_name: "PowerDeveloperAccess"
{%- set aws = salt['pillar.get']('qusal:sys-aws', {}) %}
{%- set sso_start_url = aws.get('sso_start_url', '') %}
{%- set sso_region = aws.get('sso_region', 'us-east-1') %}
{%- set default_region = aws.get('default_region', 'us-east-1') %}
{%- set profiles = aws.get('profiles', {}) %}

{%- if sso_start_url and profiles %}
"{{ slsdotpath }}-aws-config":
  file.managed:
    - name: /home/user/.aws/config
    - mode: '0600'
    - user: user
    - group: user
    - contents: |
        # Managed by Salt - do not edit manually.
        # SSO login: qvm-aws-sso login <profile>
        # SSO status: qvm-aws-sso status
        {%- for profile_name, profile_data in profiles.items() %}

        [profile {{ profile_name }}]
        sso_start_url = {{ sso_start_url }}
        sso_region = {{ sso_region }}
        sso_account_id = {{ profile_data.get('account_id', '') }}
        sso_role_name = {{ profile_data.get('role_name', '') }}
        region = {{ profile_data.get('region', default_region) }}
        output = json
        {%- endfor %}

{%- endif %}

{% endif -%}
