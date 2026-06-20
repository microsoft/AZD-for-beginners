# Provisioning Azure Resources with AZD

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 4 - Инфраструктура как код и развертывание
- **⬅️ Предыдущая**: [Руководство по развертыванию](deployment-guide.md)
- **➡️ Следующая глава**: [Глава 5: Многоагентные AI решения](../../examples/retail-scenario.md)
- **🔧 Связанные материалы**: [Глава 6: Проверка перед развертыванием](../chapter-06-pre-deployment/capacity-planning.md)

## Введение

Это подробное руководство охватывает всё, что нужно знать о создании и управлении ресурсами Azure с помощью Azure Developer CLI. Научитесь внедрять паттерны Infrastructure as Code (IaC) — от базового создания ресурсов до сложных корпоративных архитектур с использованием Bicep, ARM шаблонов, Terraform и Pulumi.

## Цели обучения

После прохождения этого руководства вы сможете:
- Овладеть принципами Infrastructure as Code и созданием ресурсов Azure
- Понять несколько провайдеров IaC, поддерживаемых Azure Developer CLI
- Проектировать и внедрять Bicep шаблоны для распространённых архитектур приложений
- Настраивать параметры ресурсов, переменные и настройки для разных окружений
- Реализовывать расширенные паттерны инфраструктуры, включая сеть и безопасность
- Управлять жизненным циклом ресурсов, обновлениями и разрешением зависимостей

## Результаты обучения

По окончании вы сможете:
- Проектировать и создавать инфраструктуру Azure с использованием Bicep и ARM шаблонов
- Настраивать сложные многосервисные архитектуры с правильными зависимостями ресурсов
- Внедрять параметризованные шаблоны для разных окружений и конфигураций
- Устранять неисправности при создании инфраструктуры и решать сбои развертывания
- Применять принципы Azure Well-Architected Framework при проектировании инфраструктуры
- Управлять обновлениями инфраструктуры и реализовывать стратегии версионирования

## Обзор создания инфраструктуры

Azure Developer CLI поддерживает несколько провайдеров Infrastructure as Code (IaC):
- **Bicep** (рекомендуется) — язык с доменной спецификой Azure
- **ARM шаблоны** — JSON-шаблоны Azure Resource Manager
- **Terraform** — инструмент для мультиоблачной инфраструктуры
- **Pulumi** — современный код инфраструктуры с использованием языков программирования

## Понимание ресурсов Azure

### Иерархия ресурсов
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Распространённые сервисы Azure для приложений
- **Вычисления**: App Service, Container Apps, Functions, Виртуальные машины
- **Хранение**: Учетная запись хранения, Cosmos DB, SQL Database, PostgreSQL
- **Сеть**: Виртуальная сеть, Application Gateway, CDN
- **Безопасность**: Key Vault, Application Insights, Log Analytics
- **ИИ/МО**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Шаблоны инфраструктуры Bicep

### Базовая структура шаблона Bicep
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

### Продвинутые паттерны Bicep

#### Модульная инфраструктура
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

#### Условное создание ресурсов
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

## 🌐 Использование Terraform с azd

Bicep — язык по умолчанию для azd, но azd также поддерживает **Terraform** — полезно, если ваша команда уже стандартизировалась на нём или вы управляете мультиоблачной инфраструктурой. Рабочий процесс azd (`azd up`, `azd provision`, `azd down`) идентичен; меняется только язык инфраструктуры и расположение папок.

### Сообщите azd о Terraform

Добавьте раздел `infra` в `azure.yaml`, указывающий провайдера Terraform:

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

### Структура папки Terraform

С провайдером Terraform в вашем каталоге `infra/` используются `.tf` файлы вместо Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Минимальный `main.tf`

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

### Как azd работает с выводами Terraform

azd читает **outputs** Terraform, чтобы узнать ваши конечные точки и связать значения окружений обратно в приложение. Имена выводов важны — azd ищет конкретные:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Важное:** azd использует тег `azd-env-name` и выводы `AZURE_*` для отслеживания ресурсов по окружениям. Всегда помечайте вашу группу ресурсов тегом `"azd-env-name" = var.environment_name`, чтобы `azd down` мог найти и удалить всё.

### Развёртывание с Terraform

Команды точно такие же, как для Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd выполняет 'terraform plan' в фоне
azd up                    # подготовка + развертывание
azd down --force          # уничтожает управляемые Terraform ресурсы
```

> **Требование:** Terraform должен быть установлен и добавлен в ваш `PATH`. azd управляет *рабочим процессом* Terraform, но не устанавливает его за вас. По умолчанию для состояния используется локальное хранилище; для команд настройте удалённый backend (например, Azure Storage) в `provider.tf`.

Для полноценных работающих стартовых шаблонов на Terraform просмотрите [галерею Awesome AZD](https://azure.github.io/awesome-azd/) с фильтром по Terraform или официальную [документацию azd по Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Использование Pulumi с azd

Если ваша команда пишет инфраструктуру на общем языке программирования (TypeScript, Python, Go или C#), а не на DSL, azd также поддерживает **Pulumi**. Как и с Terraform, рабочий процесс `azd up` / `azd provision` / `azd down` не меняется — меняется только инструментарий и структура папок для инфраструктуры.

### Сообщите azd о Pulumi

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

### Структура папки Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Минимальный `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Отметьте каждый ресурс тегом, чтобы azd мог отслеживать и очищать их
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd считывает эти выходные данные обратно в вашу среду
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Стэки соответствуют окружениям azd

Pulumi организует развертывания в **стэки**, а azd сопоставляет каждое окружение azd со стэком Pulumi с тем же названием. При запуске `azd env new staging` azd выбирает (или создаёт) стэк Pulumi `staging`. Применяются такие же правила тегирования `azd-env-name` и выводов `AZURE_*`, чтобы `azd down` мог найти и удалить всё.

### Развёртывание с Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd запускает 'pulumi preview' в фоновом режиме
azd up                    # подготовка + развертывание
azd down --force          # запускает 'pulumi destroy'
```

> **Требование:** Pulumi должен быть установлен и добавлен в ваш `PATH`, а также необходим backend для состояния (Pulumi Cloud или самостоятельное хранилище, например Azure Blob Storage). azd управляет *рабочим процессом* Pulumi, а не его установкой. Смотрите официальную [документацию azd по Pulumi](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Выбор хоста для вашего сервиса

Поле `host` в `azure.yaml` определяет, где будет работать ваш код. azd поддерживает несколько хостов — правильный выбор важнее, чем язык инфраструктуры. Вот удобное сравнение для новичков:

| Значение `host` | Лучшее для | Почему |
|--------------|----------|-----|
| `appservice` | Традиционные веб-приложения и API | Самый простой PaaS, контейнеры не требуются |
| `staticwebapp` | SPA на фронтенде (React, Vue, Angular) | Глобальный CDN + бесплатный SSL, встроенная поддержка API |
| `function` | Событийные и бессерверные нагрузки | Масштабирование до нуля, оплата за выполнение |
| `containerapp` | Контейнеризированные микросервисы | Бессерверные контейнеры, масштабирование до нуля, встроенный ingress |
| `aks` | Сложные задачи оркестрации | Полный контроль Kubernetes при реальной необходимости |
| `springapp` | Java Spring Boot приложения | Управляемое Azure Spring Apps runtime, оптимизированное для Spring |

### Когда использовать AKS

**Azure Kubernetes Service (`host: aks`)** даёт полный контроль над Kubernetes — пользовательские контроллеры, service mesh, сложные сети и тонкое управление расписанием. Но это накладывает операционные задачи: управление пулом нод, обновления, сеть кластера.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Начинайте проще, если можете.** Для большинства микросервисов **Container Apps** предоставляет контейнеры, автоскейлинг и масштабирование до нуля без управления кластером. Выбирайте AKS, лишь когда нужны специфические возможности Kubernetes.

### Когда использовать Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** — управляемое runtime, созданное специально для Spring Boot. Оно обеспечивает обнаружение сервисов, config server и blue-green deployment, чтобы Java-команды не управляли инфраструктурой самостоятельно.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Используйте `springapp`, если у вас уже есть приложения Spring Boot и нужен runtime, оптимизированный под них. Для новых контейнеризированных Java-приложений без особых требований Spring часто проще выбрать `containerapp`.

## 🗃️ Создание базы данных

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

## 🔒 Безопасность и управление секретами

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

### Настройка управляемой идентичности
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

## 🌍 Сеть и подключение

### Настройка виртуальной сети
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

## 📊 Мониторинг и мониторинговость

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

### Пользовательские метрики и оповещения
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

## 🔧 Конфигурации, зависящие от окружения

### Файлы параметров для разных окружений
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

### Условное создание ресурсов
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

## 🚀 Продвинутые паттерны создания инфраструктуры

### Развёртывание в нескольких регионах
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

### Тестирование инфраструктуры
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

## 🧪 Предварительный просмотр и проверка инфраструктуры (НОВОЕ)

### Предварительный просмотр изменений инфраструктуры перед развертыванием

Функция `azd provision --preview` позволяет **смоделировать создание инфраструктуры** до её фактического развертывания. Аналогично `terraform plan` или `bicep what-if`, она даёт **предварительный просмотр** изменений, которые будут внесены в ваше Azure окружение.

#### 🛠️ Что делает
- **Анализирует ваши IaC шаблоны** (Bicep или Terraform)
- **Показывает превью изменений ресурсов**: добавления, удаления, обновления
- **Не применяет изменения** — только чтение и безопасно для запуска

#### Сценарии использования
```bash
# Предварительный просмотр изменений инфраструктуры перед развертыванием
azd provision --preview

# Предварительный просмотр для конкретной среды
azd provision --preview -e production
```

Эта команда помогает:
- **Проверить изменения инфраструктуры** до создания ресурсов
- **Раннее выявить ошибки настройки** на этапах разработки
- **Безопасно работать в командах**
- **Гарантировать минимальные права для развертывания** без сюрпризов

Особенно полезна при:
- Работе в сложных многосервисных окружениях
- Изменениях в продакшен инфраструктуре
- Проверке изменений шаблонов перед утверждением PR
- Обучении новых сотрудников инфраструктурным паттернам

### Пример вывода превью
Точный вывод превью зависит от провайдера и структуры проекта, но результат должен ясно указывать предлагаемые изменения до их применения.

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

## �🔄 Обновления и миграции ресурсов

### Безопасные обновления ресурсов
```bash
# Сначала просмотрите изменения инфраструктуры (РЕКОМЕНДУЕТСЯ)
azd provision --preview

# Примените изменения после подтверждения предварительного просмотра
azd provision --confirm-with-no-prompt

# Для отката используйте Git для возврата изменений инфраструктуры:
git revert HEAD  # Отмените последний коммит инфраструктуры
azd provision    # Примените предыдущее состояние инфраструктуры
```

### Миграции баз данных
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

## 🎯 Лучшие практики

### 1. Конвенции именования ресурсов
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Стратегия тегирования
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

### 3. Валидация параметров
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

### 4. Организация выводов
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

## Следующие шаги

- [Планирование перед развертыванием](../chapter-06-pre-deployment/capacity-planning.md) — проверка доступности ресурсов
- [Распространённые проблемы](../chapter-07-troubleshooting/common-issues.md) — устранение проблем инфраструктуры
- [Руководство по отладке](../chapter-07-troubleshooting/debugging.md) — отладка проблем с созданием
- [Выбор SKU](../chapter-06-pre-deployment/sku-selection.md) — как выбрать подходящий уровень сервиса

## Дополнительные ресурсы

- [Документация Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Шаблоны Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Навигация**
- **Предыдущий урок**: [Руководство по развертыванию](deployment-guide.md)
- **Следующий урок**: [Планирование мощности](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->