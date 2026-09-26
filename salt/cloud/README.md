# cloud

Cloud operations environment in Qubes OS.

## Table of Contents

*   [Description](#description)
*   [Installation](#installation)
*   [Access Control](#access-control)
*   [Usage](#usage)

## Description

Setup a devops qube named "cloud", dedicated to AWS and Kubernetes
operations. As there is a very broad set of repositories, only common packages
will be installed.

## Installation

*   Top:

```sh
sudo qubesctl top.enable cloud
sudo qubesctl --targets=tpl-cloud,dvm-cloud,cloud state.apply
sudo qubesctl top.disable cloud
```

*   State:

<!-- pkg:begin:post-install -->

```sh
sudo qubesctl state.apply cloud.create
sudo qubesctl --skip-dom0 --targets=tpl-cloud state.apply cloud.install
sudo qubesctl --skip-dom0 --targets=dvm-cloud state.apply cloud.configure-dvm
sudo qubesctl --skip-dom0 --targets=cloud state.apply cloud.configure
proxy_target="$(qusal-report-updatevm-origin)"
if test -n "${proxy_target}"; then
  sudo qubesctl --skip-dom0 --targets="${proxy_target}" state.apply sys-net.install-proxy
fi
```

<!-- pkg:end:post-install -->

The installation will make the Qusal TCP Proxy available in the `updatevm`
(after it is restarted in case it is template based). If you want to have the
proxy available on a `netvm` that is not deployed by Qusal, install the Qusal
TCP proxy on the templates of your `netvm`:

```sh
sudo qubesctl --skip-dom0 --targets=TEMPLATE state.apply sys-net.install-proxy
```

Remember to restart the `netvms` after the proxy installation for the changes
to take effect.

## Usage

The operations qube `cloud` can be used for:

*   cloud (in particular, kubernetes) operations and monitoring;
*   helm chart validation and deployments;
*   fetching and pushing to and from local qube repository with split-git;

The following clients are installed from the Debian repositories:

*   `aws`, from package `awscli`;
*   `kubectl`, `kubectx` and `kubens`;
*   `valkey-cli`, from package `valkey-tools`, which also works with Redis
    servers.

The qube has no `netvm`, so these clients cannot reach remote APIs yet.
