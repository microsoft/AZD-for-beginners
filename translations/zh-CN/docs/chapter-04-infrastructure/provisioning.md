# 使用 AZD 配置 Azure 资源

**章节导航：**
- **📚 课程主页**: [AZD For Beginners](../../README.md)
- **📖 当前章节**: 第4章 - 基础设施即代码与部署
- **⬅️ 上一章**: [Deployment Guide](deployment-guide.md)
- **➡️ 下一章**: [第5章：多代理 AI 解决方案](../../examples/retail-scenario.md)
- **🔧 相关**: [第6章：预部署验证](../chapter-06-pre-deployment/capacity-planning.md)

## 介绍

本综合指南涵盖使用 Azure Developer CLI 配置和管理 Azure 资源所需的一切内容。学习如何使用 Bicep、ARM 模板、Terraform 和 Pulumi 从基本资源创建到高级企业级基础设施架构实现基础设施即代码（IaC）模式。

## 学习目标

完成本指南后，你将能：
- 掌握基础设施即代码原理和 Azure 资源配置
- 理解 Azure Developer CLI 支持的多种 IaC 提供程序
- 为常见应用架构设计并实现 Bicep 模板
- 配置资源参数、变量和特定环境设置
- 实施包括网络和安全在内的高级基础设施模式
- 管理资源生命周期、更新和依赖关系解析

## 学习成果

完成后，你将能够：
- 使用 Bicep 和 ARM 模板设计并配置 Azure 基础设施
- 配置具有适当资源依赖关系的复杂多服务架构
- 为多个环境和配置实现参数化模板
- 排查基础设施配置问题并解决部署失败
- 将 Azure 优秀架构框架原则应用于基础设施设计
- 管理基础设施更新并实现基础设施版本控制策略

## 基础设施配置概览

Azure Developer CLI 支持多种基础设施即代码（IaC）提供程序：
- **Bicep**（推荐）- Azure 的领域特定语言
- **ARM Templates** - 基于 JSON 的 Azure 资源管理器模板
- **Terraform** - 多云基础设施工具
- **Pulumi** - 使用编程语言的现代基础设施即代码

## 了解 Azure 资源

### 资源层级
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### 适用于应用程序的常见 Azure 服务
- <strong>计算</strong>：App Service、Container Apps、Functions、虚拟机
- <strong>存储</strong>：存储帐户、Cosmos DB、SQL Database、PostgreSQL
- <strong>网络</strong>：虚拟网络、Application Gateway、CDN
- <strong>安全</strong>：Key Vault、Application Insights、Log Analytics
- **AI/ML**：Azure AI Services、Azure OpenAI、Azure Machine Learning

## Bicep 基础设施模板

### 基本 Bicep 模板结构
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

### 高级 Bicep 模式

#### 模块化基础设施
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

#### 条件资源创建
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

Bicep 是 azd 的默认选项，但 azd 也支持 **Terraform**——如果你的团队已经以它为标准或你管理多云基础设施，它很有用。azd 的工作流（`azd up`、`azd provision`、`azd down`）是相同的；只有基础设施语言和文件夹布局不同。

### 指示 azd 使用 Terraform

在 `azure.yaml` 中添加一个指向 Terraform 提供程序的 `infra` 部分：

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

### Terraform 文件夹布局

使用 Terraform 提供程序时，你的 `infra/` 文件夹使用 `.tf` 文件而不是 Bicep：

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### 一个最小的 `main.tf`

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

### azd 如何连接到你的 Terraform 输出

azd 读取 Terraform 的 **outputs** 来了解你的端点并将环境值回写到你的应用。输出名称很重要——azd 会查找特定的名称：

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **重要：** azd 使用 `azd-env-name` 标签和 `AZURE_*` 输出来按环境跟踪资源。始终用 `"azd-env-name" = var.environment_name` 标记你的资源组，以便 `azd down` 可以找到并删除所有内容。

### 使用 Terraform 部署

命令与 Bicep 完全相同：

```bash
azd auth login
azd env new dev
azd provision --preview   # azd 在底层执行 'terraform plan'
azd up                    # 预配 + 部署
azd down --force          # 销毁由 Terraform 管理的资源
```

> **先决条件：** 必须在你的 `PATH` 中安装 Terraform。azd 管理 Terraform 的 *workflow*，但不会为你安装 Terraform。对于状态，azd 默认为本地状态；对于团队，请在 `provider.tf` 中配置远程后端（例如，Azure Storage 后端）。

有关完整的、可运行的基于 Terraform 的入门示例，请浏览 [Awesome AZD gallery](https://azure.github.io/awesome-azd/) 并筛选 Terraform，或参阅官方的 [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd)。

## 🧩 在 azd 中使用 Pulumi

如果你的团队使用通用编程语言（TypeScript、Python、Go 或 C#）编写基础设施而不是 DSL，azd 也支持 **Pulumi**。与 Terraform 一样，`azd up` / `azd provision` / `azd down` 的工作流不变——只有基础设施工具和文件夹布局不同。

### 指示 azd 使用 Pulumi

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

### Pulumi 文件夹布局

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### 一个最小的 `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// 为每个资源打标签，以便 azd 跟踪并清理它们
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd 会将这些输出读回你的环境中
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks 映射到 azd 环境

Pulumi 将部署组织为 **stacks**，azd 将每个 azd 环境映射到同名的 Pulumi stack。当你运行 `azd env new staging` 时，azd 会选择（或创建）名为 `staging` 的 Pulumi stack。相同的 `azd-env-name` 标记和 `AZURE_*` 输出规则适用，以便 `azd down` 可以找到并删除所有内容。

### 使用 Pulumi 部署

```bash
azd auth login
azd env new dev
azd provision --preview   # azd 在底层运行 'pulumi preview'
azd up                    # 预配 + 部署
azd down --force          # 运行 'pulumi destroy'
```

> **先决条件：** 必须在你的 `PATH` 中安装 Pulumi，并且你需要一个状态后端（Pulumi Cloud 或自托管后端，例如 Azure Blob Storage）。azd 管理 Pulumi 的 *workflow*，而不负责安装。参阅官方的 [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd)。

## 🎯 为你的服务选择主机

`host` 字段在 `azure.yaml` 中决定你的代码运行位置。azd 支持多种主机——选择合适的主机比选择基础设施语言更重要。以下是面向初学者的对比：

| `host` value | 适用对象 | 原因 |
|--------------|----------|-----|
| `appservice` | 传统 Web 应用和 API | 最简单的 PaaS；不需要容器 |
| `staticwebapp` | 前端单页应用（React、Vue、Angular） | 全球 CDN + 免费 SSL，内置 API 支持 |
| `function` | 事件驱动和无服务器工作负载 | 支持缩减到零按调用付费 |
| `containerapp` | 容器化微服务 | 无服务器容器，支持缩减到零，内置入口 |
| `aks` | 需要复杂编排的场景 | 当你确实需要时，提供完整的 Kubernetes 控制 |
| `springapp` | Java Spring Boot 应用 | 为 Spring 优化的托管 Azure Spring Apps 运行时 |

### 何时选择 AKS

**Azure Kubernetes Service (`host: aks`)** 为你提供完整的 Kubernetes 能力——自定义控制器、服务网格、复杂网络和细粒度调度。这种能力伴随着运维开销：你需要管理节点池、升级和集群网络。

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **如果可能，请从更简单的方案开始。** 对于大多数微服务，**Container Apps** 提供容器、自动缩放和缩减到零的能力，而无需管理集群。只有在需要 Kubernetes 特定功能时才选择 AKS。

### 何时使用 Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** 是为 Spring Boot 专门构建的托管运行时。它处理服务发现、配置服务器和蓝绿部署，这样 Java 团队就无需自行运行基础设施。

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> 当你有现成的 Spring Boot 应用并希望使用为其优化的运行时时，使用 `springapp`。对于没有 Spring 特定需求的新容器化 Java 应用，`containerapp` 通常是更简单的选择。

## 🗃️ 数据库配置

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

## 🔒 安全与密钥管理

### Key Vault 集成
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

### 托管标识配置
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

## 🌍 网络与连接

### 虚拟网络配置
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

### 带 SSL 的 Application Gateway
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

## 📊 监控与可观测性

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

### 自定义指标与警报
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

## 🔧 环境特定配置

### 不同环境的参数文件
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

### 条件资源配置
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

## 🚀 高级配置模式

### 多区域部署
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

### 基础设施测试
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

## 🧪 基础设施预览与验证（新）

### 在部署前预览基础设施变更

`azd provision --preview` 功能让你在实际部署资源之前<strong>模拟基础设施配置</strong>。它的理念类似于 `terraform plan` 或 `bicep what-if`，为你提供一个在 Azure 环境中将执行何种更改的<strong>预演视图</strong>。

#### 🛠️ 它的作用
- **分析你的 IaC 模板**（Bicep 或 Terraform）
- <strong>显示资源更改的预览</strong>：新增、删除、更新
- <strong>不应用更改</strong>——这是只读的，运行安全

#### 使用场景
```bash
# 在部署前预览基础设施更改
azd provision --preview

# 针对特定环境的预览
azd provision --preview -e production
```

此命令可帮助你：
- <strong>在提交资源之前验证基础设施更改</strong>
- <strong>在开发周期早期捕获配置错误</strong>
- <strong>在团队环境中安全协作</strong>
- <strong>确保最小权限部署且没有意外</strong>

在以下情况尤为有用：
- 处理复杂的多服务环境
- 对生产基础设施进行更改
- 在 PR 批准前验证模板修改
- 培训新团队成员了解基础设施模式

### 示例预览输出
确切的预览输出因提供程序和项目结构而异，但结果应清晰标识在应用任何更改之前拟议的变更。

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

## �🔄 资源更新与迁移

### 安全的资源更新
```bash
# 首先预览基础设施更改（推荐）
azd provision --preview

# 在预览确认后应用更改
azd provision --confirm-with-no-prompt

# 如需回滚，请使用 Git 恢复基础设施更改：
git revert HEAD  # 回退最近的基础设施提交
azd provision    # 应用先前的基础设施状态
```

### 数据库迁移
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

## 🎯 最佳实践

### 1. 资源命名约定
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. 标签策略
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

### 3. 参数验证
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

### 4. 输出组织
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

- [预部署规划](../chapter-06-pre-deployment/capacity-planning.md) - 验证资源可用性
- [常见问题](../chapter-07-troubleshooting/common-issues.md) - 排查基础设施问题
- [调试指南](../chapter-07-troubleshooting/debugging.md) - 调试配置问题
- [SKU 选择](../chapter-06-pre-deployment/sku-selection.md) - 选择合适的服务层级

## 额外资源

- [Azure Bicep 文档](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

<strong>导航</strong>
- <strong>上一课</strong>: [Deployment Guide](deployment-guide.md)
- <strong>下一课</strong>: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**免责声明**：
本文件由 AI 翻译服务 [Co-op Translator](https://github.com/Azure/co-op-translator) 翻译完成。尽管我们力求准确，但请注意，自动翻译可能包含错误或不准确之处。原始语言版文件应视为权威来源。对于重要信息，建议使用专业人工翻译。我们对因使用本翻译而产生的任何误解或误释不承担责任。
<!-- CO-OP TRANSLATOR DISCLAIMER END -->