# Switcher API Helm Charts

Deploy Switcher API using `switcherapi/switcher-api` Helm Charts.

## Usage

> Install MongoDB (optional)
```console
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install db bitnami/mongodb \
    --namespace=switcherapi --create-namespace \
    --set auth.enabled=false
```

> Install Switcher API
```console
helm repo add switcherapi https://switcherapi.github.io/helm-charts
helm install switcherapi switcherapi/switcher-api \
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

| Name                                  | Description                                   | Value                 |
| ------------------------------------- | --------------------------------------------- | --------------------- |
| `api.env.sslSecretName`               | API SSL Secret Name (enable HTTPS)            | ``                    |
| `api.env.resourceSecret`              | API Swagger (user: admin)                     | `admin`               |
| `api.env.switcherApiLogger`           | API log                                       | true                  |
| `api.env.historyActivated`            | API Change Log record                         | true                  |
| `api.env.permissionCacheActivated`    | API Permission Cache                          | true                  |
| `api.env.googleSkipAuth`              | Skip Google ReCaptcha validation              | true                  |
| `api.env.metricsMaxPage`              | Metrics: max logs per page                    | 50                    |
| `api.env.strategyMaxOperation`        | Strategy: max operation entries               | 100                   |
| `api.env.relayBypassHttps`            | Relay: Bypass HTTPS validation                | false                 |
| `api.env.relayBypassVerification`     | Relay: Bypass Verification                    | false                 |
| `api.env.maxRequestPerMinute`         | API max Request per minute                    | 1000                  |
| `api.env.jwtAdminTokenRenewInterval`  | User token renew interval                     | `5m`                  |
| `api.env.mongoUri`                    | API Database URI                              | < see values.yml >    |
| `api.env.bitbucketClientId`           | Bitbucket Client Id                           | ``                    |
| `api.env.bitbucketClientSecret`       | Bitbucket Client Secret                       | ``                    |
| `api.env.githubClientId`              | GitHub Client Id                              | ``                    |
| `api.env.githubClientSecret`          | GitHub Client Secret                          | ``                    |
| `api.env.googleRecaptchaSecret`       | Google ReCaptcha Secret                       | ``                    |
| `api.env.switcherSlackJwtSecret`      | Switcher Slack Secret                         | ``                    |
| `api.env.switcherGitOpsJwtSecret`     | Switcher GitOps Secret                        | ``                    |
| `api.env.switcherGitOpsUrl`           | Switcher GitOps URL                           | ``                    |

### Resolver API parameters

| Name                            | Description                                    | Value                  |
| ------------------------------- | ---------------------------------------------- | ---------------------- |
| `resolver.image.tag`            | Switcher Resolver Image tag                    | `latest`               |
| `resolver.service.port`         | API Service port                               | 3001                   |

| Name                                       | Description                                   | Value                 |
| ------------------------------------------ | --------------------------------------------- | --------------------- |
| `resolver.env.sslSecretName`               | API SSL Secret Name (enable HTTPS)            | ``                    |
| `resolver.env.resourceSecret`              | API Swagger (user: admin)                     | `admin`               |
| `resolver.env.switcherApiLogger`           | API log                                       | true                  |
| `resolver.env.metricsActivated`            | API Metrics record                            | true                  |
| `resolver.env.relayBypassHttps`            | Relay: Bypass HTTPS validation                | false                 |
| `resolver.env.relayBypassVerification`     | Relay: Bypass Verification                    | false                 |
| `resolver.env.regexMaxTimeout`             | Regex Validator: max timeout in ms            | 3000                  |
| `resolver.env.regexMaxBlacklist`           | Regex Validator: max blacklist entries        | 50                    |
| `resolver.env.maxRequestPerMinute`         | API max Request per minute                    | 0 (unlimited)         |
| `resolver.env.jwtClientTokenExpTime`       | Component token renew interval                | `5m`                  |
| `resolver.env.mongoUri`                    | API Database URI                              | < see values.yml >    |

### Management parameters

| Name                       | Description                                    | Value                  |
| -------------------------- | ---------------------------------------------- | ---------------------- |
| `management.image.tag`     | Switcher Management Image tag                  | `latest`               |
| `management.service.port`  | Management Service port                        | 8080                   |

| Name                                  | Description                                    | Value                     |
| ------------------------------------- | ---------------------------------------------- | ------------------------- |
| `management.env.switcherApiUrl`       | Switcher API URL                               | `http://localhost:3000`   |
| `management.env.switcherManagementUrl`| Management callback URL                        | `http://localhost:8080`   |
| `management.env.switcherSlackUrl`     | Switcher Slack App URL                         | `http://localhost:5000`   |
| `management.env.allowHomeView`        | Allow Home View                                | false                     |
| `management.env.googleRecaptcha`      | Google ReCaptcha Public Key                    | ``                        |
| `management.env.bitbucketClientId`    | Bitbucket Client Id                            | ``                        |
| `management.env.githubClientId`       | GitHub Client Id                               | ``                        |

## Local

Validate Chart from local Values
```console
helm install -f charts/switcher-api/values.yaml switcherapi ./charts/switcher-api/ \
    --namespace=switcherapi --create-namespace
```

SSL Enabled
```console
helm install -f charts/switcher-api/values.yaml switcherapi ./charts/switcher-api/ \
    --namespace=switcherapi --create-namespace \
    --set api.env.sslSecretName="[CHANGE_ME]" \
    --set management.env.switcherApiUrl="https://localhost:3000" \
    --set management.env.switcherManagementUrl="https://localhost:8080"
```