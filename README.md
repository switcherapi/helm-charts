***

<div align="center">
<b>Switcher API Helm Charts</b>
</div>

<div align="center">

[![Release Charts](https://github.com/switcherapi/helm-charts/actions/workflows/release.yml/badge.svg)](https://github.com/switcherapi/helm-charts/actions/workflows/release.yml)
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/switcherapi)](https://artifacthub.io/packages/search?repo=switcherapi)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/switcherapi/helm-charts/blob/main/LICENSE)
[![Slack: Switcher-HQ](https://img.shields.io/badge/slack-@switcher/hq-blue.svg?logo=slack)](https://switcher-hq.slack.com/)

</div>

***

Switcher API Helm Charts provide a set of Helm charts for deploying the Switcher API and its related components in Kubernetes environments. These charts simplify the deployment and management of the Switcher API ecosystem, including the core API, resolver node, management interface, Slack app integration, and GitOps orchestrator.

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

```bash
helm repo add switcherapi https://switcherapi.github.io/helm-charts
```

# Switcher API Helm Charts

[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/switcher-api)](https://artifacthub.io/packages/helm/switcherapi/switcher-api)
[![Charts README](https://img.shields.io/badge/charts-README-blue.svg)](https://github.com/switcherapi/helm-charts/blob/master/charts/switcher-api/README.md)

| Component | Description | Repository Link | Source Code |
|-----------|-------------|-----------------|-------------|
| Switcher API | Core API that manages Switcher API ecosystem | [Docker Hub](https://hub.docker.com/r/trackerforce/switcher-api) | [GitHub](https://github.com/switcherapi/switcher-api) |
| Switcher Resolver Node | Proxy handler that interfaces Switcher Components with Switcher API | [Docker Hub](https://hub.docker.com/r/trackerforce/switcher-resolver-node) | [GitHub](https://github.com/switcherapi/switcher-resolver-node) |
| Switcher Management | Web interface for managing Switcher API | [Docker Hub](https://hub.docker.com/r/trackerforce/switcher-management) | [GitHub](https://github.com/switcherapi/switcher-management) |

# Switcher Slack App Helm Charts

[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/switcher-slack-app)](https://artifacthub.io/packages/helm/switcherapi/switcher-slack-app)
[![Charts README](https://img.shields.io/badge/charts-README-blue.svg)](https://github.com/switcherapi/helm-charts/blob/master/charts/switcher-slack-app/README.md)

| Component | Description | Repository Link | Source Code |
|-----------|-------------|-----------------|-------------|
| Switcher Slack App | Allows teams to integrate Switcher API workflows with Slack | [Docker Hub](https://hub.docker.com/r/trackerforce/switcher-slack-app) | [GitHub](https://github.com/switcherapi/switcher-slack-app) |

# Switcher GitOps Helm Charts

[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/switcher-gitops)](https://artifacthub.io/packages/helm/switcherapi/switcher-gitops)
[![Charts README](https://img.shields.io/badge/charts-README-blue.svg)](https://github.com/switcherapi/helm-charts/blob/master/charts/switcher-gitops/README.md)

| Component | Description | Repository Link | Source Code |
|-----------|-------------|-----------------|-------------|
| Switcher GitOps | GitOps Domain Snapshot Orchestrator | [Docker Hub](https://hub.docker.com/r/trackerforce/switcher-gitops) | [GitHub](https://github.com/switcherapi/switcher-gitops) |