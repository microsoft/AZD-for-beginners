# 使用 AZD 佈建 Azure 資源

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **➡️ Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Related**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## 介紹

本全面指南涵蓋使用 Azure Developer CLI 佈建與管理 Azure 資源的所有必要知識。學習如何從基本資源建立到使用 Bicep、ARM 範本、Terraform 與 Pulumi 的進階企業級基礎設施架構，實作基礎設施即程式碼（IaC）模式。

## 學習目標

完成本指南後，你將能：
- 精通基礎設施即程式碼原則與 Azure 資源佈建
- 理解 Azure Developer CLI 支援的多個 IaC 提供者
- 設計並實作常見應用架構的 Bicep 範本
- 設定資源參數、變數與環境專屬設定
- 實作包含網路與安全的進階基礎設施模式
- 管理資源生命週期、更新與相依性解析

## 學習成果

完成後，你將能：
- 使用 Bicep 與 ARM 範本設計與佈建 Azure 基礎設施
- 設定具有正確資源相依性的複雜多服務架構
- 為多個環境與組態實作參數化範本
- 疑難排解基礎設施佈建問題並解決部署失敗
- 在基礎設施設計上應用 Azure 良好架構（Well-Architected Framework）原則
- 管理基礎設施更新並實作版本化策略

## 基礎設施佈建總覽

Azure Developer CLI 支援多個基礎設施即程式碼（IaC）提供者：
- **Bicep** (推薦) - Azure 的領域特定語言
- **ARM Templates** - 基於 JSON 的 Azure Resource Manager 範本
- **Terraform** - 多雲基礎設施工具
- **Pulumi** - 使用一般程式語言的現代基礎設施即程式碼

## 理解 Azure 資源

### 資源階層
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### 應用常用的 Azure 服務
- **運算 (Compute)**: App Service, Container Apps, Functions, Virtual Machines
- **儲存 (Storage)**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **網路 (Networking)**: Virtual Network, Application Gateway, CDN
- **安全性 (Security)**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep 基礎設施範本

### 基本 Bicep 範本結構
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

### 進階 Bicep 模式

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

#### 條件式資源建立
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

## 🌐 在 azd 中使用 Terraform

Bicep 是 azd 的預設，但 azd 也支援 **Terraform**—若你的團隊已經以 Terraform 為標準或管理多雲基礎設施，這會很有用。azd 的工作流程（`azd up`、`azd provision`、`azd down`）相同；只有基礎設施語言與資料夾結構不同。

### 告訴 azd 使用 Terraform

在 `azure.yaml` 新增一個指向 Terraform 提供者的 `infra` 區段：

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

使用 Terraform 提供者時，`infra/` 資料夾會使用 `.tf` 檔案而非 Bicep：

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### 一個最小的 `main.tf`

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

### azd 如何連接你的 Terraform 輸出

azd 會讀取 Terraform 的 **outputs** 來得知你的端點並將環境值回傳到你的應用。輸出名稱很重要—azd 會尋找特定名稱：

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **重要：** azd 使用 `azd-env-name` 標籤與 `AZURE_*` 輸出來追蹤每個環境的資源。請務必在資源群組上加上 `"azd-env-name" = var.environment_name` 的標籤，讓 `azd down` 能找到並移除所有資源。

### 使用 Terraform 部署

指令與 Bicep 完全相同：

```bash
azd auth login
azd env new dev
azd provision --preview   # azd 在背後執行 'terraform plan'
azd up                    # 佈建 + 部署
azd down --force          # 銷毀由 Terraform 管理的資源
```

> **先決條件：** 必須在你的 `PATH` 中安裝 Terraform。azd 管理 Terraform 的 <em>工作流程</em>，但不會為你安裝 Terraform。關於狀態，azd 預設為本地狀態；對於團隊，請在 `provider.tf` 中設定遠端後端（例如 Azure Storage 後端）。

欲取得完整且可執行的 Terraform 範本範例，請瀏覽 [Awesome AZD 精選集](https://azure.github.io/awesome-azd/) 並篩選 Terraform，或參閱官方的 [azd Terraform 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd)。

## 🧩 在 azd 中使用 Pulumi

若你的團隊以通用程式語言（TypeScript、Python、Go 或 C#）撰寫基礎設施而非 DSL，azd 也支援 **Pulumi**。如同 Terraform，`azd up` / `azd provision` / `azd down` 的工作流程不變—只有基礎設施工具與資料夾結構不同。

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

### 一個最小的 `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// 為每個資源加上標籤，讓 azd 能追蹤並清理它們
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd 會將這些輸出讀回你的環境
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks 對應到 azd 環境

Pulumi 將部署組織為 **stacks**，azd 將每個 azd 環境對應到同名的 Pulumi stack。當你執行 `azd env new staging` 時，azd 會選取（或建立）名為 `staging` 的 Pulumi stack。相同的 `azd-env-name` 標籤與 `AZURE_*` 輸出規則同樣適用，讓 `azd down` 能找到並移除所有資源。

### 使用 Pulumi 部署

```bash
azd auth login
azd env new dev
azd provision --preview   # azd 在背後執行 'pulumi preview'
azd up                    # 佈建 + 部署
azd down --force          # 執行 'pulumi destroy'
```

> **先決條件：** 必須在你的 `PATH` 中安裝 Pulumi，並且你需要一個狀態後端（Pulumi Cloud 或自我管理的後端，例如 Azure Blob Storage）。azd 管理 Pulumi 的 <em>工作流程</em>，但不會為你安裝 Pulumi。請參閱官方的 [azd Pulumi 文件](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd)。

## 🎯 為你的服務選擇主機

`azure.yaml` 中的 `host` 欄位決定你的程式碼在哪執行。azd 支援多種主機—選擇正確的主機比選擇基礎設施語言更重要。以下是對初學者友好的比較：

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | 傳統網站應用與 API | 最簡單的 PaaS；不需要容器 |
| `staticwebapp` | 前端單頁應用 (React, Vue, Angular) | 全球 CDN + 免費 SSL，內建 API 支援 |
| `function` | 事件驅動與無伺服器工作負載 | 可縮減到零，按執行次數付費 |
| `containerapp` | 容器化微服務 | 無伺服器容器、可縮減到零、內建入口 |
| `aks` | 複雜的協調需求 | 當你真的需要時提供完整的 Kubernetes 控制 |
| `springapp` | Java Spring Boot 應用 | 為 Spring 調校的管理型 Azure Spring Apps 运行時 |

### 何時選擇 AKS

**Azure Kubernetes Service (`host: aks`)** 提供 Kubernetes 的完整功能—自訂控制器、服務網格、複雜網路與精細排程。這些能力會帶來營運上的額外負擔：你要管理節點叢集、升級與叢集網路。

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **如果可能，先從較簡單開始。** 對於大多數微服務，**Container Apps** 提供容器、彈性調整與縮減到零，而無需管理叢集。只有在你需要 Kubernetes 特有功能時才選擇 AKS。

### 何時使用 Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** 是為 Spring Boot 量身打造的管理型執行環境。它處理服務發現、設定伺服器與藍綠部署，讓 Java 團隊不需自行維運基礎設施。

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> 當你已有現有的 Spring Boot 應用並且想要一個為其優化的執行環境時，使用 `springapp`。對於沒有 Spring 特定需求的新容器化 Java 應用，`containerapp` 通常是較簡單的選擇。

## 🗃️ 資料庫佈建

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

## 🔒 安全性與祕密管理

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

### 設定 Managed Identity
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

## 🌍 網路與連線

### Virtual Network 設定
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

### Application Gateway 與 SSL
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

### 自訂度量與警示
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

## 🔧 環境特定設定

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

### 條件式資源佈建
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

## 🚀 進階佈建模式

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

## 🧪 基礎設施預覽與驗證 (NEW)

### 在部署前預覽基礎設施變更

`azd provision --preview` 功能讓你在實際部署資源前 <strong>模擬基礎設施佈建</strong>。它的精神類似 `terraform plan` 或 `bicep what-if`，提供你一個 **模擬執行（dry-run）視圖**，顯示將對你的 Azure 環境做出哪些變更。

#### 🛠️ 它會做什麼
- **分析你的 IaC 範本**（Bicep 或 Terraform）
- <strong>顯示資源變更預覽</strong>：新增、刪除、更新
- <strong>不會套用變更</strong> — 只讀且安全執行

#### 使用情境
```bash
# 在部署前預覽基礎架構變更
azd provision --preview

# 針對特定環境的預覽
azd provision --preview -e production
```

此命令可協助你：
- <strong>在提交資源前驗證基礎設施變更</strong>
- <strong>在開發週期早期捕捉錯誤配置</strong>
- <strong>在團隊環境中安全地協作</strong>
- <strong>確保以最低權限進行部署而不會意外變更</strong>

特別適用於：
- 處理複雜的多服務環境時
- 對生產基礎設施進行變更時
- 在 PR 核准前驗證範本修改時
- 訓練新成員了解基礎設施模式時

### 範例預覽輸出
實際的預覽輸出會依提供者與專案結構而異，但結果應清楚識別擬議的變更，且在任何套用前顯示出來。

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

## �🔄 資源更新與移轉

### 安全的資源更新
```bash
# 先預覽基礎設施變更（建議）
azd provision --preview

# 在預覽確認後套用變更
azd provision --confirm-with-no-prompt

# 如需回滾，請使用 Git 還原基礎設施變更：
git revert HEAD  # 還原最近一次基礎設施的提交
azd provision    # 套用先前的基礎設施狀態
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

## 🎯 最佳實務

### 1. 資源命名慣例
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

## 接下來的步驟

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - 驗證資源可用性
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - 疑難排解基礎設施問題
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - 偵錯佈建問題
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - 選擇適當的服務等級

## 其他資源

- [Azure Bicep 文件](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager 範本](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure 架構中心](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 良好架構框架](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Previous Lesson**: [Deployment Guide](deployment-guide.md)
- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免責聲明**：
此文件已使用 AI 翻譯服務 [Co-op Translator](https://github.com/Azure/co-op-translator) 進行翻譯。雖然我們努力追求準確性，但請注意自動翻譯可能包含錯誤或不準確之處。原始文件的母語版本應視為權威來源。對於關鍵資訊，建議採用專業人工翻譯。我們不對因使用此翻譯所產生的任何誤解或誤譯承擔責任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->