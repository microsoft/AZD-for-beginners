# 使用 AZD 配置 Azure 資源

**章節導覽:**
- **📚 課程首頁**：[AZD 初學者指南](../../README.md)
- **📖 目前章節**：第 4 章 - 基礎設施即代碼及部署
- **⬅️ 上一節**：[部署指南](deployment-guide.md)
- **➡️ 下一章**：[第 5 章：多代理 AI 解決方案](../../examples/retail-scenario.md)
- **🔧 相關章節**：[第 6 章：部署前驗證](../chapter-06-pre-deployment/capacity-planning.md)

## 介紹

本綜合指南涵蓋使用 Azure Developer CLI 配置和管理 Azure 資源所需的所有知識。學習如何運用基礎設施即代碼 (IaC) 模式，從基礎資源創建到使用 Bicep、ARM 模板、Terraform 和 Pulumi 實現先進的企業級基礎設施架構。

## 學習目標

完成本指南後，您將能夠：
- 精通基礎設施即代碼原則及 Azure 資源配置
- 理解 Azure Developer CLI 支援的多個 IaC 供應商
- 設計及實現適用於常見應用架構的 Bicep 模板
- 配置資源參數、變數及針對環境的特定設定
- 實施進階基礎設施模式，包括網絡與安全性
- 管理資源生命週期、更新及依賴關係解析

## 學習成果

完成後，您將能夠：
- 使用 Bicep 和 ARM 模板設計及提供 Azure 基礎設施
- 配置具適當資源依賴的複雜多服務架構
- 對多環境及配置實現參數化模板
- 疑難排解基礎設施配置問題及部署失敗
- 將 Azure 優良架構框架原則應用於基礎設施設計
- 管理基礎設施更新並實施版本控制策略

## 基礎設施配置概述

Azure Developer CLI 支援多種基礎設施即代碼 (IaC) 供應商：
- **Bicep**（推薦）— Azure 專屬領域語言
- **ARM 模板**— 基於 JSON 的 Azure 資源管理器模板
- **Terraform**— 多雲基礎設施工具
- **Pulumi**— 使用通用程式語言的現代基礎設施即代碼

## 了解 Azure 資源

### 資源層級結構
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### 常用 Azure 應用服務
- <strong>計算</strong>：App Service、Container Apps、Functions、虛擬機器
- <strong>儲存</strong>：儲存帳戶、Cosmos DB、SQL 資料庫、PostgreSQL
- <strong>網絡</strong>：虛擬網路、應用程式閘道、CDN
- <strong>安全性</strong>：Key Vault、Application Insights、Log Analytics
- **AI/ML**：Azure AI 服務、Azure OpenAI、Azure Machine Learning

## Bicep 基礎設施模板

### 基本 Bicep 模板結構
```bicep
// infra/main.bicep
@description('The name of the environment')
param environmentName string

@description('The location for all resources')
param location string = resourceGroup().location

@description('The name of the application')
param applicationName string = 'myapp'

// Variables
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
}

// Resource Group (created automatically by azd)
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  name: '${applicationName}-${environmentName}-rg'
}

// App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${applicationName}-${environmentName}-plan'
  location: location
  tags: tags
  sku: {
    name: 'B1'
    capacity: 1
  }
  properties: {
    reserved: true // Linux App Service Plan
  }
}

// Web App
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  tags: tags
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'
      alwaysOn: true
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      appSettings: [
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
    httpsOnly: true
  }
}

// Output values for azd
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output WEB_NAME string = webApp.name
```

### 進階 Bicep 範式

#### 模組化基礎設施
```bicep
// infra/modules/app-service.bicep
@description('App Service configuration')
param name string
param location string
param planId string
param appSettings array = []

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: name
  location: location
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|18-lts'
      alwaysOn: true
    }
    httpsOnly: true
  }
}

output hostname string = webApp.properties.defaultHostName
output principalId string = webApp.identity.principalId
```

```bicep
// infra/main.bicep - Using modules
module webAppModule 'modules/app-service.bicep' = {
  name: 'webApp'
  params: {
    name: '${applicationName}-web-${resourceToken}'
    location: location
    planId: appServicePlan.id
    appSettings: [
      {
        name: 'API_URL'
        value: apiModule.outputs.endpoint
      }
      {
        name: 'DATABASE_URL'
        value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-url)'
      }
    ]
  }
}
```

#### 條件資源建立
```bicep
@description('Whether to create a database')
param createDatabase bool = true

@description('Database SKU')
param databaseSku string = 'Basic'

resource database 'Microsoft.Sql/servers/databases@2021-11-01' = if (createDatabase) {
  name: '${sqlServer.name}/${applicationName}-db'
  location: location
  sku: {
    name: databaseSku
    tier: databaseSku == 'Basic' ? 'Basic' : 'Standard'
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
  }
}
```

## 🌐 使用 Terraform 搭配 azd

Bicep 是 azd 的預設語言，但 azd 也支援 **Terraform**—當您的團隊已標準化使用 Terraform 或管理多雲基礎設施時非常有用。azd 的工作流程（`azd up`、`azd provision`、`azd down`）相同，僅基礎設施語言及資料夾結構不同。

### 告訴 azd 使用 Terraform

在 `azure.yaml` 中新增一個指向 Terraform 供應商的 `infra` 部分：

```yaml
# azure.yaml
name: my-terraform-app
infra:
  provider: terraform   # default is "bicep"
  path: infra           # folder containing your .tf files
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### Terraform 資料夾結構

使用 Terraform 供應商時，您的 `infra/` 資料夾會使用 `.tf` 檔案取代 Bicep：

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### 一個簡易的 `main.tf`

```hcl
# infra/main.tf
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment_name}"
  location = var.location
  tags     = { "azd-env-name" = var.environment_name }
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-${var.environment_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}
```

### azd 如何連接 Terraform 輸出

azd 會讀取 Terraform **outputs** 以得知您的端點並將環境值連回您的應用。輸出名稱很重要—azd 尋找特定的名稱：

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **重要提示:** azd 使用 `azd-env-name` 標籤及 `AZURE_*` 輸出來追蹤每個環境的資源。始終以 `"azd-env-name" = var.environment_name` 標記您的資源群組，讓 `azd down` 能找到並清除所有資源。

### 使用 Terraform 部署

指令與 Bicep 完全相同：

```bash
azd auth login
azd env new dev
azd provision --preview   # azd 在背後執行 'terraform plan'
azd up                    # 配置 + 部署
azd down --force          # 銷毀由 Terraform 管理的資源
```

> **前置條件：** 必須安裝 Terraform 且在您的 `PATH` 中。azd 管理 Terraform <em>工作流程</em>，但不會為您安裝 Terraform。狀態預設為本地狀態；團隊環境應於 `provider.tf` 配置遠端後端（例如 Azure 儲存後端）。

若要取得完整且可執行的基於 Terraform 的入門範本，請瀏覽 [Awesome AZD 圖庫](https://azure.github.io/awesome-azd/) 並篩選 Terraform，或參見官方 [azd Terraform 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd)。

## 🧩 使用 Pulumi 搭配 azd

如果您的團隊使用通用程式語言（TypeScript、Python、Go 或 C#）而非 DSL 來撰寫基礎設施，azd 也支援 **Pulumi**。與 Terraform 一樣，`azd up` / `azd provision` / `azd down` 工作流程不變，只有基礎設施工具及資料夾結構不同。

### 告訴 azd 使用 Pulumi

```yaml
# azure.yaml
name: my-pulumi-app
infra:
  provider: pulumi      # default is "bicep"
  path: infra           # folder containing your Pulumi program
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### Pulumi 資料夾結構

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### 一個簡易的 `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// 為每個資源加標籤，以便 azd 可以追蹤及清理它們
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd 會將這些輸出讀回你的環境
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks 對應 azd 環境

Pulumi 以 **stacks** 組織部署，azd 將每個 azd 環境映射到同名的 Pulumi stack。當您執行 `azd env new staging` 時，azd 會選擇（或創建）名為 `staging` 的 Pulumi stack。相同的 `azd-env-name` 標記和 `AZURE_*` 輸出規則適用，讓 `azd down` 能找到並清除所有資源。

### 使用 Pulumi 部署

```bash
azd auth login
azd env new dev
azd provision --preview   # azd 在背後運行 'pulumi preview'
azd up                    # 佈置 + 部署
azd down --force          # 運行 'pulumi destroy'
```

> **前置條件：** Pulumi 必須安裝並在您的 `PATH` 中，且需要狀態後端（Pulumi Cloud 或 Azure Blob Storage 等自主管理後端）。azd 管理 Pulumi <em>工作流程</em>，不負責安裝。詳見官方 [azd Pulumi 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd)。

## 🎯 選擇服務的託管環境

`azure.yaml` 中的 `host` 欄位決定您的程式碼執行位置。azd 支援多種託管環境—選擇適合的比基礎設施語言更重要。以下是初學者友善的比較：

| `host` 值        | 適用場景               | 原因                              |
|------------------|------------------------|----------------------------------|
| `appservice`     | 傳統 web 應用和 API     | 最簡單的 PaaS；無需容器          |
| `staticwebapp`   | 前端單頁應用（React、Vue、Angular） | 全球 CDN + 免費 SSL，內建 API 支援 |
| `function`       | 事件驅動及無伺服器工作負載 | 支援彈性縮放至零，按執行付費      |
| `containerapp`   | 容器化微服務           | 無伺服器容器，彈性縮放至零，內建入口流量控制 |
| `aks`            | 複雜編排需求           | 真正需要時提供完整 Kubernetes 控制 |
| `springapp`      | Java Spring Boot 應用  | 針對 Spring 優化的 Azure Spring Apps 管理型執行環境 |

### 何時使用 AKS

**Azure Kubernetes Service (`host: aks`)** 為您提供 Kubernetes 的完整功能—自訂控制器、服務網格、複雜網絡及細緻排程。其強大功能帶來較高的運維負擔：您需要管理節點池、升級及叢集網絡。

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **若能，請先從簡單開始。** 對於大多數微服務來說，**Container Apps** 提供容器、彈性擴展及縮放至零，無須管理叢集。只有當您需要 Kubernetes 特定功能時才選擇 AKS。

### 何時使用 Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** 是專為 Spring Boot 打造的管理型執行環境。它處理服務發現、配置伺服器及藍綠部署，讓 Java 團隊無需自行營運基礎設施。

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> 若您已有 Spring Boot 應用並希望使用為其優化的執行環境，請使用 `springapp`。對於無 Spring 依賴的新容器化 Java 應用，`containerapp` 通常是更簡單的選擇。

## 🗃️ 資料庫配置

### Cosmos DB
```bicep
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: '${applicationName}-cosmos-${resourceToken}'
  location: location
  tags: tags
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  parent: cosmosAccount
  name: '${applicationName}db'
  properties: {
    resource: {
      id: '${applicationName}db'
    }
  }
}

resource todoContainer 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2023-04-15' = {
  parent: cosmosDatabase
  name: 'todos'
  properties: {
    resource: {
      id: 'todos'
      partitionKey: {
        paths: ['/userId']
        kind: 'Hash'
      }
    }
  }
}
```

### PostgreSQL
```bicep
resource postgresServer 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: '${applicationName}-postgres-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '14'
    administratorLogin: 'dbadmin'
    administratorLoginPassword: databasePassword
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    highAvailability: {
      mode: 'Disabled'
    }
  }
}

resource postgresDatabase 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2022-12-01' = {
  parent: postgresServer
  name: '${applicationName}db'
  properties: {
    charset: 'utf8'
    collation: 'en_US.utf8'
  }
}

// Allow Azure services to connect
resource firewallRule 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2022-12-01' = {
  parent: postgresServer
  name: 'AllowAzureServices'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}
```

## 🔒 安全性與密鑰管理

### Key Vault 整合
```bicep
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: '${applicationName}-kv-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
  }
}

// Grant Key Vault access to the web app
resource webAppKeyVaultAccess 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, webApp.id, 'Key Vault Secrets User')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      '4633458b-17de-408a-b874-0445c86b69e6' // Key Vault Secrets User
    )
    principalId: webApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// Store database connection string in Key Vault
resource databaseConnectionSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'database-connection-string'
  properties: {
    value: 'Server=${postgresServer.properties.fullyQualifiedDomainName};Database=${postgresDatabase.name};Port=5432;User Id=${postgresServer.properties.administratorLogin};Password=${databasePassword};'
  }
}
```

### 託管身份配置
```bicep
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'DATABASE_CONNECTION_STRING'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
        }
        {
          name: 'AZURE_CLIENT_ID'
          value: webApp.identity.principalId
        }
      ]
    }
  }
}
```

## 🌍 網絡與連線

### 虛擬網路配置
```bicep
resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: '${applicationName}-vnet-${resourceToken}'
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'app-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
            }
            {
              service: 'Microsoft.KeyVault'
            }
          ]
        }
      }
      {
        name: 'db-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'postgres-delegation'
              properties: {
                serviceName: 'Microsoft.DBforPostgreSQL/flexibleServers'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private DNS Zone for PostgreSQL
resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: '${applicationName}.postgres.database.azure.com'
  location: 'global'
  tags: tags
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name: '${applicationName}-dns-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.id
    }
  }
}
```

### 帶 SSL 的應用程式閘道
```bicep
resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${applicationName}-agw-pip-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: '${applicationName}-agw-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: '${vnet.id}/subnets/gateway-subnet'
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port80'
        properties: {
          port: 80
        }
      }
      {
        name: 'port443'
        properties: {
          port: 443
        }
      }
    ]
  }
}
```

## 📊 監控與可觀察性

### Application Insights
```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${applicationName}-logs-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: '${applicationName}-ai-${resourceToken}'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

// Output connection string for applications
output APPLICATION_INSIGHTS_CONNECTION_STRING string = applicationInsights.properties.ConnectionString
```

### 自訂指標與警示
```bicep
resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: '${applicationName}-cpu-alert'
  location: 'global'
  tags: tags
  properties: {
    description: 'Alert when CPU usage is high'
    severity: 2
    enabled: true
    scopes: [webApp.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
          operator: 'GreaterThan'
          threshold: 80
          timeAggregation: 'Average'
        }
      ]
    }
    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}
```

## 🔧 環境特定配置

### 不同環境的參數檔案
```json
// infra/main.parameters.dev.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "B1"
    },
    "databaseSku": {
      "value": "Standard_B1ms"
    },
    "enableBackup": {
      "value": false
    }
  }
}
```

```json
// infra/main.parameters.prod.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "P1v3"
    },
    "databaseSku": {
      "value": "Standard_D2s_v3"
    },
    "enableBackup": {
      "value": true
    },
    "replicaCount": {
      "value": 3
    }
  }
}
```

### 條件式資源配置
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: '${applicationName}devstorage${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: '${applicationName}prodstorage${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}
```

## 🚀 進階配置模式

### 多區域部署
```bicep
@description('Primary region')
param primaryLocation string = 'eastus2'

@description('Secondary region')
param secondaryLocation string = 'westus2'

// Primary region resources
module primaryRegion 'modules/region.bicep' = {
  name: 'primary-region'
  params: {
    location: primaryLocation
    isPrimary: true
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Secondary region resources
module secondaryRegion 'modules/region.bicep' = {
  name: 'secondary-region'
  params: {
    location: secondaryLocation
    isPrimary: false
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficmanagerprofiles@2022-04-01' = {
  name: '${applicationName}-tm-${resourceToken}'
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: '${applicationName}-${environmentName}'
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryRegion.outputs.webAppId
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryRegion.outputs.webAppId
          priority: 2
        }
      }
    ]
  }
}
```

### 基礎設施測試
```bicep
// infra/test/main.test.bicep
param location string = resourceGroup().location

module mainTemplate '../main.bicep' = {
  name: 'main-template-test'
  params: {
    environmentName: 'test'
    location: location
    applicationName: 'testapp'
  }
}

// Test assertions
resource testScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'test-deployment'
  location: location
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '8.0'
    scriptContent: '''
      $webAppName = "${mainTemplate.outputs.WEB_NAME}"
      $response = Invoke-WebRequest -Uri "https://${mainTemplate.outputs.WEB_URL}/health" -UseBasicParsing
      if ($response.StatusCode -ne 200) {
        throw "Health check failed"
      }
      Write-Output "All tests passed!"
    '''
    timeout: 'PT10M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
  }
}
```

## 🧪 基礎設施預覽與驗證（新功能）

### 部署前預覽基礎設施變更

`azd provision --preview` 功能讓您在實際部署資源前，<strong>模擬基礎設施配置</strong>。其理念類似於 `terraform plan` 或 `bicep what-if`，提供您的 Azure 環境中將會被更改內容的<strong>乾跑檢視</strong>。

#### 🛠️ 它會做什麼
- **分析您的 IaC 模板**（Bicep 或 Terraform）
- <strong>顯示資源變更預覽</strong>：新增、刪除、更新
- <strong>不會套用變更</strong>—純讀取且安全執行

#### 使用情境
```bash
# 部署前預覽基礎設施變更
azd provision --preview

# 指定環境的預覽
azd provision --preview -e production
```

此命令能助您：
- <strong>於資源確認前驗證基礎設施變更</strong>
- <strong>早期捕捉錯誤配置</strong>
- <strong>團隊協作時更安全</strong>
- <strong>確保最小權限部署無意外</strong>

尤其適用於：
- 處理複雜多服務環境
- 變更生產基礎設施
- PR 審核前驗證模板修改
- 教導新成員基礎設施模式

### 範例預覽輸出
實際預覽輸出依不同供應商及專案結構而異，但結果會清晰顯示建議的變更，讓您在套用前知道內容。

```bash
$ azd provision --preview

🔍 Previewing infrastructure changes...

The following resources will be created:
  + azurerm_resource_group.rg
  + azurerm_app_service_plan.plan
  + azurerm_linux_web_app.web
  + azurerm_cosmosdb_account.cosmos

The following resources will be modified:
  ~ azurerm_key_vault.kv
    ~ access_policy (forces replacement)

The following resources will be destroyed:
  - azurerm_storage_account.old_storage

⚠️  Warning: 1 resource will be replaced

✅ Preview completed successfully!
```

## 🔄 資源更新與遷移

### 安全的資源更新
```bash
# 先預覽基礎設施變更（建議）
azd provision --preview

# 在確認預覽後應用變更
azd provision --confirm-with-no-prompt

# 若要回滾，使用 Git 還原基礎設施變更：
git revert HEAD  # 還原最後一次基礎設施提交
azd provision    # 應用之前的基礎設施狀態
```

### 資料庫遷移
```bicep
resource migrationScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'database-migration'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.40.0'
    scriptContent: '''
      # Install database migration tools
      npm install -g db-migrate db-migrate-pg
      
      # Run migrations
      db-migrate up --config database.json --env production
      
      echo "Database migration completed successfully"
    '''
    environmentVariables: [
      {
        name: 'DATABASE_URL'
        secureValue: databaseConnectionString
      }
    ]
    timeout: 'PT30M'
    cleanupPreference: 'OnSuccess'
  }
}
```

## 🎯 最佳實踐

### 1. 資源命名規範
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. 標籤策略
```bicep
var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'created-date': utcNow('yyyy-MM-dd')
}
```

### 3. 參數驗證
```bicep
@description('Environment name')
@minLength(3)
@maxLength(20)
param environmentName string

@description('Location for resources')
@allowed(['eastus2', 'westus2', 'centralus'])
param location string

@description('App Service SKU')
@allowed(['B1', 'B2', 'S1', 'S2', 'P1v3', 'P2v3'])
param appServiceSku string = 'B1'
```

### 4. 輸出組織
```bicep
// Service endpoints
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output API_URL string = 'https://${apiApp.properties.defaultHostName}'

// Resource identifiers
output WEB_APP_NAME string = webApp.name
output API_APP_NAME string = apiApp.name
output DATABASE_NAME string = database.name

// Connection strings (for secure reference)
output DATABASE_CONNECTION_STRING_KEY string = '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
```

## 下一步

- [部署前規劃](../chapter-06-pre-deployment/capacity-planning.md) - 驗證資源可用性
- [常見問題](../chapter-07-troubleshooting/common-issues.md) - 疑難排解基礎設施問題
- [除錯指南](../chapter-07-troubleshooting/debugging.md) - 偵錯配置問題
- [SKU 選擇](../chapter-06-pre-deployment/sku-selection.md) - 選擇合適的服務等級

## 附加資源

- [Azure Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure 資源管理器模板](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 優良架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)

---

<strong>導覽</strong>
- <strong>上一課</strong>：[部署指南](deployment-guide.md)
- <strong>下一課</strong>：[容量規劃](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
本文件由 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻譯而成。雖然我們致力於確保準確性，但請注意，機器自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應被視為權威來源。對於重要資訊，建議進行專業人工翻譯。我們不對因使用本翻譯而產生的任何誤解或誤釋承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->