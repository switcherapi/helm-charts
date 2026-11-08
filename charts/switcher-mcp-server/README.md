
# Switcher MCP Server Helm Charts

Deploy Switcher MCP Server using `switcherapi/switcher-mcp-server` Helm Charts.

## Usage

> Install Switcher MCP Server
```console
helm repo add switcherapi https://switcherapi.github.io/helm-charts
helm install switchermcpserver switcherapi/switcher-mcp-server \
    --namespace=switcherapi --create-namespace \
    --set app.env.switcherApiUrl=https://switcherapi.com/api \
    --set app.env.switcherApiInternalUrl=http://switcher-api.switcherapi.svc.cluster.local:3000 \
    --set app.env.switcherMcpPublicUrl=https://mcp.switcherapi.com
```

> Uninstall Switcher MCP Server
```console
helm uninstall switchermcpserver --namespace switcherapi
```

### App parameters

| Name                       | Description                                    | Value                  |
| -------------------------- | ---------------------------------------------- | ---------------------- |
| `app.image.tag`            | Switcher MCP Server Image tag                  | `latest`               |
| `app.service.port`         | Server port                                    | 8000                   |

| Name                              | Description                              | Value                        |
| --------------------------------- | ---------------------------------------- | ---------------------------- |
| `app.env.switcherApiUrl`          | Switcher API URL                         | `https://switcherapi.com/api`|
| `app.env.switcherApiInternalUrl`  | Switcher API Internal URL (tool requests)| ``                           |
| `app.env.switcherApiCertPath`     | Switcher API Cert Path                   | ``                           |
| `app.env.switcherMcpTransport`    | Switcher MCP Transport                   | `streamable-http`            |
| `app.env.switcherMcpHost`         | Switcher MCP Bind Host                   | `0.0.0.0`                    |
| `app.env.switcherMcpPort`         | Switcher MCP Bind Port                   | 8000                         |
| `app.env.switcherMcpPublicUrl`    | Switcher MCP Public URL                  | `http://127.0.0.1:8000`      |
| `app.env.switcherMcpWorkers`      | Switcher MCP Workers                     | 4                            |
| `app.env.sslSecretName`           | SSL Secret Name                          | ``                           |

## Local

Validate Chart from local Values
```console
helm install -f charts/switcher-mcp-server/values.yaml switchermcpserver ./charts/switcher-mcp-server/ \
    --namespace=switcherapi --create-namespace \
    --set app.env.switcherApiUrl=http://localhost:3000 \
    --set app.env.switcherApiInternalUrl=http://switcher-api.switcherapi.svc.cluster.local:3000 \
    --set app.env.switcherMcpPublicUrl=http://localhost:8000

```

### switcher-api Chart example

The example below shows the installation of the switcher-api chart to work with switcher-mcp-server.

```console
helm install -f charts/switcher-api/values.yaml switcherapi ./charts/switcher-api/ \
    --namespace=switcherapi --create-namespace \
    --set api.env.oauthIssuerUrl="http://localhost:3000" \
    --set api.env.oauthConsentUrl="http://localhost:8080" \
    --set management.env.switcherApiUrl="http://localhost:3000" \
    --set management.env.switcherManagementUrl="http://localhost:8080"
```