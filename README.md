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

# Switcher API Helm Chart

`helm-charts/switcher-api` enabled you to deploy in your K8s environment Switcher Management and Switcher API.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, follow the steps below:

> Install MongoDB
```console
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install db bitnami/mongodb \
    --namespace=switcherapi --create-namespace \
    --set auth.enabled=false
```

> Install Switcher API
```console
helm repo add switcherapi https://switcherapi.github.io/helm-charts
helm install switcherapi helm-charts/switcher-api \
    --namespace=switcherapi --create-namespace
```

> Uninstall Switcher API
```console
helm uninstall switcherapi --namespace switcherapi
```

### API parameters

| Name                       | Description                                    | Value                  |
| -------------------------- | ---------------------------------------------- | ---------------------- |
| `api.image.tag`            | Switcher API Image tag                         | `latest`               |
| `api.service.port`         | API Service port                               | 3000                   |

| Name                          | Description                                    | Value                  |
| ----------------------------- | ---------------------------------------------- | ---------------------- |
| `api.env.resourceSecret`      | API Swagger (user: admin)                      | `admin`                |
| `api.env.switcherApiLogger`   | API log                                        | true                   |
| `api.env.historyActivated`    | API Change Log record                          | true                   |
| `api.env.metricsActivated`    | API Metrics record                             | true                   |
| `api.env.googleSkipAuth`      | Skip Google ReCaptcha validation               | true                   |
| `api.env.metricsMaxPage`      | Metrics: max logs per page                     | 50                     |
| `api.env.strategyMaxOperation`| Strategy: max operation entries                | 100                    |
| `api.env.jwtAdminTokenRenewInterval`      | User token renew interval                      | `5m`                   |
| `api.env.jwtClientTokenExpTime`           | Component token renew interval                 | `5m`                   |
| `api.env.mongoUri`                        | API Database URI                               | < see values.yml >     |
| `api.env.bitbucketClientId`     | Bitbucket Client Id               | ''                    |
| `api.env.bitbucketClientSecret` | Bitbucket Client Secret           | ''                    |
| `api.env.githubClientId`        | GitHub Client Id                  | ''                    |
| `api.env.githubClientSecret`    | GitHub Client Secret              | ''                    |
| `api.env.googleRecaptchaSecret` | Google ReCaptcha Secret           | ''                    |
| `api.env.switcherSlackJwtSecret`| Switcher Slack Secret             | ''                    |

### Management parameters

| Name                       | Description                                    | Value                  |
| -------------------------- | ---------------------------------------------- | ---------------------- |
| `management.image.tag`     | Switcher Management Image tag                  | `latest`               |
| `management.service.port`  | Management Service port                        | 8080                   |

| Name                                  | Description                                    | Value                     |
| ------------------------------------- | ---------------------------------------------- | ------------------------- |
| `management.env.switcherApiUrl`       | Switcher API URI                               | `http://127.0.0.1:3000`   |
| `management.env.switcherManagementUrl`| Management callback URI                        | `http://127.0.0.1:8080`   |
| `management.env.googleRecaptcha`      | Google ReCaptcha Public Key                    | ''                        |
| `management.env.bitbucketClientId`    | Bitbucket Client Id                            | ''                        |
| `management.env.githubClientId`       | GitHub Client Id                               | ''                        |
| `management.env.switcherSlackUrl`     | Switcher Slack App URL                         | ''                        |

## Local

Validate Chart from local Values
```console
helm install -f charts/switcher-api/values.yaml switcherapi ./charts/switcher-api/ \
    --namespace=switcherapi --create-namespace
```

Use port-forward to access the Switcher Management and expose Switcher API
```console
kubectl -n switcherapi port-forward svc/switcherapi-switcher-api 3000:3000 & \
kubectl -n switcherapi port-forward svc/switcherapi-switcher-management 8080:8080 &
```

# Switcher Slack App Helm Chart

> TBD