***

<div align="center">
<b>Switcher API Kubernetes Helm Charts</b>
</div>

<div align="center">

[![Release Charts](https://github.com/switcherapi/helm-charts/actions/workflows/release.yml/badge.svg)](https://github.com/switcherapi/helm-charts/actions/workflows/release.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Slack: Switcher-HQ](https://img.shields.io/badge/slack-@switcher/hq-blue.svg?logo=slack)](https://switcher-hq.slack.com/)

</div>

***

> Work in progress...

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, follow the steps below:

> Install MongoDB
```console
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install db bitnami/mongodb \
    --namespace=switcherapi --create-namespace
```

> Install Switcher API
```console
helm repo add switcherapi https://switcherapi.github.io/helm-charts
helm install switcherapi helm-charts/switcher-api \
    --namespace=switcherapi --create-namespace
```