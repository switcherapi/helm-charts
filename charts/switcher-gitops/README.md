# Switcher GitOps Helm Charts

Deploy Switcher GitOps using `switcherapi/switcher-gitops` Helm Charts.

## Usage

> Install Switcher GitOps
```console
helm repo add switcherapi https://switcherapi.github.io/helm-charts
helm install switchergitops switcherapi/switcher-gitops \
    --namespace=switcherapi --create-namespace \
    --set app.env.switcherAPIUrl="" \
    --set app.env.switcherApiJwtSecret="" \
    --set app.env.gitTokenPrivateKey=""
```

> Uninstall Switcher GitOps
```console
helm uninstall switchergitops --namespace switcherapi
```

### App parameters

| Name                       | Description                                    | Value                  |
| -------------------------- | ---------------------------------------------- | ---------------------- |
| `app.image.tag`            | Switcher GitOps Image tag                      | `latest`               |
| `app.service.port`         | App Service port                               | 8000                   |

| Name                              | Description                                    | Value                  |
| --------------------------------- | ---------------------------------------------- | ---------------------- |
| `api.env.sslEnabled`              | API SSL Enabled                                | `false`                |
| `api.env.sslSecretName`           | API SSL Secret Name (enable HTTPS)             | ``                     |
| `app.env.switcherCertPath`        | API SSL Cert Path                              | ``                     |
| `app.env.switcherKeyPath`         | API SSL Key Path                               | ``                     |
| `app.env.gitTokenPrivateKey`      | Git Token Private Key                          | ``                     |
| `app.env.switcherApiJwtSecret`    | Switcher API JWT Secret                        | ``                     |
| `app.env.switcherAPIUrl`          | Switcher API URL                               | ``                     |
| `app.env.switcherApiCACert`       | Switcher API SSL CA Cert Path                  | ``                     |
| `app.env.mongoUri`                | API Database URI                               | < see values.yml >     |
| `app.env.mongoDb`                 | API Database Name                              | `switcher-gitops`      |
| `app.env.handlerWaitingTime`      | Handler Waiting Time                           | `1m`                   |
| `app.env.gitUser`                 | Git User                                       | `switcher-gitops`      |

## Local

Validate Chart from local Values
```console
helm install -f charts/switcher-gitops/values.yaml switchergitops ./charts/switcher-gitops/ \
    --namespace=switcherapi --create-namespace \
    --set app.env.switcherApiJwtSecret="[CHANGE_ME]" \
    --set app.env.gitTokenPrivateKey="[CHANGE_ME]"
```