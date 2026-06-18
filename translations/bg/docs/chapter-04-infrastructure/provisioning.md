# Въвеждане на Azure ресурси с AZD

**Навигация в глава:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 4 - Infrastructure as Code & Deployment
- **⬅️ Предишна**: [Deployment Guide](deployment-guide.md)
- **➡️ Следваща глава**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Свързани**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## Въведение

Това изчерпателно ръководство покрива всичко, което трябва да знаете за предоставянето и управлението на Azure ресурси с помощта на Azure Developer CLI. Научете как да прилагате модели Infrastructure as Code (IaC) от създаване на основни ресурси до напреднали корпоративни архитектури, използвайки Bicep, ARM templates, Terraform и Pulumi.

## Учебни цели

След завършване на това ръководство вие ще:
- Овладеете принципите на Infrastructure as Code и предоставянето на Azure ресурси
- Разберете множество доставчици на IaC, поддържани от Azure Developer CLI
- Проектирате и прилагате Bicep шаблони за общи архитектури на приложения
- Конфигурирате параметри на ресурси, променливи и настройки специфични за среди
- Прилагате напреднали инфраструктурни модели, включително мрежи и сигурност
- Управлявате жизнения цикъл на ресурсите, актуализации и разрешаване на зависимости

## Резултати от обучението

След завършване ще можете да:
- Проектирате и предоставяте Azure инфраструктура, използвайки Bicep и ARM шаблони
- Конфигурирате сложни многослойни архитектури с правилни зависимости между ресурсите
- Прилагате параметризирани шаблони за множество среди и конфигурации
- Отстранявате проблеми при предоставянето на инфраструктура и разрешавате неуспешни деплойменти
- Прилагате принципите на Azure Well-Architected Framework при проектиране на инфраструктура
- Управлявате актуализации на инфраструктурата и прилагате стратегии за версиониране на инфраструктурата

## Преглед на предоставяне на инфраструктура

Azure Developer CLI поддържа множество доставчици на Infrastructure as Code (IaC):
- **Bicep** (препоръчително) - домейн-специфичен език на Azure
- **ARM Templates** - JSON-базирани шаблони на Azure Resource Manager
- **Terraform** - инструмент за инфраструктура за множество облаци
- **Pulumi** - модерна инфраструктура като код с програмни езици

## Разбиране на Azure ресурсите

### Йерархия на ресурсите
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Чести Azure услуги за приложения
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep инфраструктурни шаблони

### Основна структура на Bicep шаблон
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

### Напреднали Bicep модели

#### Модулна инфраструктура
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

#### Условно създаване на ресурси
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

## 🌐 Използване на Terraform с azd

Bicep е по подразбиране за azd, но azd също поддържа **Terraform** — полезно, ако вашият екип вече го използва или управлявате мултиоблачна инфраструктура. Работният поток на azd (`azd up`, `azd provision`, `azd down`) е идентичен; единствено езикът за инфраструктура и структурата на папките се променят.

### Как да укажете на azd да използва Terraform

Добавете секция `infra` в `azure.yaml`, сочеща към Terraform доставчика:

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

### Структура на папките за Terraform

С Terraform доставчика вашата папка `infra/` използва `.tf` файлове вместо Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Минимален `main.tf`

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

### Как azd се свързва с вашите Terraform outputs

azd чете Terraform **outputs**, за да научи вашите крайни точки и да подаде стойности на средата обратно в приложението ви. Имената на output-ите имат значение — azd търси специфични:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Важно:** azd използва таг `azd-env-name` и `AZURE_*` outputs, за да проследява ресурсите по среди. Винаги тагвайте вашата resource group с `"azd-env-name" = var.environment_name`, за да може `azd down` да намери и премахне всичко.

### Деплой с Terraform

Командите са точно същите като при Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd изпълнява 'terraform plan' под капака
azd up                    # осигуряване + внедряване
azd down --force          # унищожава ресурсите, управлявани от Terraform
```

> **Предварително условие:** Terraform трябва да е инсталиран и в `PATH`. azd управлява Terraform *workflow*, но не инсталира Terraform вместо вас. За състоянието, azd по подразбиране използва локално състояние; за екипи конфигурирайте отдалечен backend (например Azure Storage backend) в `provider.tf`.

За пълни, изпълними стартери базирани на Terraform, разгледайте [Awesome AZD gallery](https://azure.github.io/awesome-azd/) и филтрирайте за Terraform, или вижте официалната [azd Terraform документация](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Използване на Pulumi с azd

Ако вашият екип пише инфраструктура на общо-практически език (TypeScript, Python, Go или C#) вместо DSL, azd също поддържа **Pulumi**. Както при Terraform, работният поток `azd up` / `azd provision` / `azd down` остава непроменен — само инструментите за инфраструктура и структурата на папките се различават.

### Как да укажете на azd да използва Pulumi

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

### Структура на папките за Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Минимален `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Маркирайте всеки ресурс, така че azd да може да го проследява и да го премахва
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd чете тези изходни данни обратно във вашата среда
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks съответстват на azd среди

Pulumi организира деплойментите в **stacks**, а azd съпоставя всяка azd среда със Pulumi stack със същото име. Когато изпълните `azd env new staging`, azd избира (или създава) Pulumi stack `staging`. Същите правила за тагване `azd-env-name` и `AZURE_*` outputs важат, така че `azd down` може да намери и премахне всичко.

### Деплой с Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd изпълнява 'pulumi preview' под капака
azd up                    # осигуряване + внедряване
azd down --force          # изпълнява 'pulumi destroy'
```

> **Предварително условие:** Pulumi трябва да е инсталиран и в `PATH`, и ще ви трябва бекенд за състоянието (Pulumi Cloud или самоуправляем бекенд като Azure Blob Storage). azd управлява Pulumi *workflow*, а не инсталацията. Вижте официалната [azd Pulumi документация](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Избор на хост за вашата услуга

Полето `host` в `azure.yaml` решава къде ще се изпълнява вашият код. azd поддържа няколко хоста — изборът на правилния е по-важен от езика за инфраструктура. Ето едно подходящо за начинаещи сравнение:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | Traditional web apps and APIs | Simplest PaaS; no containers required |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | Global CDN + free SSL, built-in API support |
| `function` | Event-driven and serverless workloads | Scale-to-zero, pay-per-execution |
| `containerapp` | Containerized microservices | Serverless containers, scale-to-zero, built-in ingress |
| `aks` | Complex orchestration needs | Full Kubernetes control when you truly need it |
| `springapp` | Java Spring Boot apps | Managed Azure Spring Apps runtime tuned for Spring |

### Кога да изберете AKS

**Azure Kubernetes Service (`host: aks`)** ви дава пълната мощ на Kubernetes — персонализирани контролери, service mesh, сложни мрежови конфигурации и фино управление на планирането. Тази мощ идва с оперативни разходи: вие управлявате node пулове, ъпгрейди и мрежата на клъстера.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Започнете по-просто, ако можете.** За повечето микроуслуги, **Container Apps** ви дава контейнери, авто-скалиране и scale-to-zero без управление на клъстер. Изберете AKS само когато имате нужда от Kubernetes-специфични функции.

### Кога да използвате Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** е управляван runtime, специално създаден за Spring Boot. Той обработва service discovery, config server и blue-green деплойменти, така че Java екипите да не управляват собствена инфраструктура.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Използвайте `springapp`, когато имате съществуващи Spring Boot приложения и искате runtime, оптимизиран за тях. За нови контейнеризирани Java приложения без Spring-специфични нужди, `containerapp` често е по-простият избор.

## 🗃️ Предоставяне на бази данни

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

## 🔒 Сигурност и управление на тайни

### Интеграция с Key Vault
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

### Конфигурация на Managed Identity
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

## 🌍 Мрежи и свързаност

### Конфигурация на Virtual Network
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

### Application Gateway с SSL
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

## 📊 Мониторинг и наблюдаемост

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

### Персонализирани метрики и аларми
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

## 🔧 Конфигурации специфични за среди

### Файлове с параметри за различни среди
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

### Условно предоставяне на ресурси
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

## 🚀 Напреднали модели за предоставяне

### Деплой в множество региони
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

### Тестване на инфраструктурата
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

## 🧪 Преглед и валидация на инфраструктурата (НОВО)

### Прегледайте промените в инфраструктурата преди деплой

Функцията `azd provision --preview` ви позволява да **симулирате предоставянето на инфраструктура** преди действително да деплойнете ресурси. Тя е в духа на `terraform plan` или `bicep what-if`, давайки ви **dry-run преглед** на това какви промени биха били направени във вашата Azure среда.

#### 🛠️ Какво прави
- **Анализира вашите IaC шаблони** (Bicep или Terraform)
- **Показва преглед на промените по ресурсите**: добавяния, изтривания, актуализации
- **Не прилага промените** — това е само за четене и е безопасно за изпълнение

#### Сценарии за използване
```bash
# Преглед на промените в инфраструктурата преди внедряване
azd provision --preview

# Преглед за конкретна среда
azd provision --preview -e production
```

Тази команда ви помага да:
- **Валидирате промените в инфраструктурата** преди да предоставите ресурси
- **Откриете неправилни конфигурации рано** в процеса на разработка
- **Сътрудничите безопасно** в екипни среди
- **Осигурите least-privilege деплойменти** без изненади

Особено полезно е, когато:
- Работите със сложни многослойни среди
- Правите промени в продукционна инфраструктура
- Валидирате модификации на шаблони преди одобрение на PR
- Обучавате нови членове на екипа за инфраструктурни модели

### Примерен изход от преглед
Точният изход от прегледа варира в зависимост от доставчика и структурата на проекта, но резултатът трябва ясно да идентифицира предложените промени преди да бъде приложено каквото и да е.

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

## �🔄 Актуализации и миграции на ресурси

### Безопасни актуализации на ресурси
```bash
# Първо прегледайте промените в инфраструктурата (ПРЕПОРЪЧВА СЕ)
azd provision --preview

# Прилагайте промените след потвърждение на прегледа
azd provision --confirm-with-no-prompt

# За откат използвайте Git за връщане на промените в инфраструктурата:
git revert HEAD  # Отменете последния комит в инфраструктурата
azd provision    # Приложете предишното състояние на инфраструктурата
```

### Миграции на бази данни
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

## 🎯 Добри практики

### 1. Конвенции за именуване на ресурси
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Стратегия за тагване
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

### 3. Валидация на параметрите
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

### 4. Организация на outputs
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

## Следващи стъпки

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Валидирайте наличността на ресурси
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Отстранявайте проблеми с инфраструктурата
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - Отстраняване на проблеми при предоставяне
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Изберете подходящи нива на услуги

## Допълнителни ресурси

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Навигация**
- **Предишен урок**: [Deployment Guide](deployment-guide.md)
- **Следващ урок**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->