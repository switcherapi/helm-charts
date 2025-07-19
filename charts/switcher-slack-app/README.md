
# Switcher Slack App Helm Charts

Deploy Switcher Slack App using `switcherapi/switcher-slack-app` Helm Charts.

## Usage

Follow the [Switcher Slack App instructions](https://github.com/switcherapi/switcher-slack-app#create-slack-app) to create a Slack App before installing this Chart.

> Install Switcher Slack App
```console
helm repo add switcherapi https://switcherapi.github.io/helm-charts
helm install switcherslackapp switcherapi/switcher-slack-app \
    --namespace=switcherapi --create-namespace \
    --set app.env.slackClientId="" \
    --set app.env.switcherManagementUrl="" \
    --set app.env.switcherAPIUrl="" \
    --set app.env.switcherJwtSecret="" \
    --set app.env.slackSigningSecret="" \
    --set app.env.slackClientSecret=""
```

> Uninstall Switcher Slack App
```console
helm uninstall switcherslackapp --namespace switcherapi
```

### App parameters

| Name                       | Description                                    | Value                  |
| -------------------------- | ---------------------------------------------- | ---------------------- |
| `app.image.tag`            | Switcher Slack App Image tag                   | `latest`               |
| `app.service.port`         | App Service port                               | 5000                   |

| Name                              | Description                                    | Value                  |
| --------------------------------- | ---------------------------------------------- | ---------------------- |
| `app.env.slackClientId`           | Slack Client Id                                | ``                     |
| `app.env.switcherManagementUrl`   | Switcher Management URL for callback auth      | ``                     |
| `app.env.switcherAPIUrl`          | Switcher API URL                               | ``                     |
| `app.env.switcherCertPath`        | Switcher API SSL Cert Path                     | ``                     |
| `app.env.switcherJwtSecret`       | Switcher API JWT Secret                        | ``                     |
| `app.env.slackSigningSecret`      | Slack Signing Secret                           | ``                     |
| `app.env.slackClientSecret`       | Slack Client Secret                            | ``                     |
| `app.env.sslSecretName`           | SSL Secret Name (TLS for Switcher API)         | ``                     |

## Local

Validate Chart from local Values
```console
helm install -f charts/switcher-slack-app/values.yaml switcherslackapp ./charts/switcher-slack-app/ \
    --namespace=switcherapi --create-namespace \
    --set app.env.slackClientId="[CHANGE_ME]" \
    --set app.env.switcherManagementUrl="https://cloud.switcherapi.com" \
    --set app.env.switcherAPIUrl="https://switcherapi.com/api" \
    --set app.env.switcherJwtSecret="[CHANGE_ME]" \
    --set app.env.slackSigningSecret="[CHANGE_ME]" \
    --set app.env.slackClientSecret="[CHANGE_ME]"
```