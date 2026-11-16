# Предоставление ресурсов Azure с помощью AZD

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 4 - Инфраструктура как код и развертывание
- **⬅️ Предыдущая**: [Руководство по развертыванию](deployment-guide.md)
- **➡️ Следующая глава**: [Глава 5: Многоагентные AI решения](../../examples/retail-scenario.md)
- **🔧 Связанные темы**: [Глава 6: Предварительная проверка перед развертыванием](../chapter-06-pre-deployment/capacity-planning.md)

## Введение

В этом руководстве рассматривается предоставление и управление ресурсами Azure с помощью Azure Developer CLI с его встроенными провайдерами Bicep и Terraform.

> Проверено с использованием `azd 1.37.2` (ноябрь 2026). Если не указано иное, Bicep, Terraform и примеры скриптов являются **иллюстративными фрагментами**, а не полным шаблоном. Объединяйте их в проект, который обеспечивает необходимые параметры, модули, идентичности, сеть и код приложения. Предоставление ресурсов Azure не выполнялось в ходе этой проверки.

## Цели обучения

Завершив это руководство, вы сможете:
- Овладеть принципами инфраструктуры как кода и предоставления ресурсов Azure
- Понять несколько провайдеров IaC, поддерживаемых Azure Developer CLI
- Разрабатывать и реализовывать шаблоны Bicep для общих архитектур приложений
- Настраивать параметры ресурсов, переменные и настройки, специфичные для окружения
- Внедрять продвинутые инфраструктурные шаблоны, включая сеть и безопасность
- Управлять жизненным циклом ресурсов, обновлениями и разрешением зависимостей

## Результаты обучения

По завершении вы сможете:
- Проектировать и предоставлять инфраструктуру Azure с помощью шаблонов Bicep и ARM
- Настраивать сложные много-сервисные архитектуры с правильными зависимостями ресурсов
- Реализовывать параметризованные шаблоны для нескольких окружений и конфигураций
- Устранять проблемы с предоставлением инфраструктуры и решать ошибки развертывания
- Применять принципы Azure Well-Architected Framework к проектированию инфраструктуры
- Управлять обновлениями инфраструктуры и внедрять стратегии версионирования инфраструктуры

## Обзор предоставления инфраструктуры

Azure Developer CLI поддерживает несколько провайдеров инфраструктуры как кода (IaC):
- **Bicep** (рекомендуется) — специализированный язык Azure
- **ARM Templates** — Bicep компилируется в ARM; сырые ARM JSON не являются отдельным встроенным `infra.provider`
- **Terraform** — инструмент для инфраструктуры мультиоблака
- **Провайдеры расширений** — требуют отдельной установки расширения провайдера и его документированной конфигурации; не следует предполагать поддержку любых строк провайдера

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
- **Хранение**: Учётная запись хранения, Cosmos DB, SQL база данных, PostgreSQL
- **Сетевые сервисы**: Виртуальная сеть, Application Gateway, CDN
- **Безопасность**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Сервисы Azure AI, Azure OpenAI, Azure Machine Learning

## Шаблоны инфраструктуры Bicep

### Базовая структура шаблона Bicep
```bicep
// infra/modules/web.bicep - resource-group-scoped module fragment
targetScope = 'resourceGroup'
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
  tags: union(tags, { 'azd-service-name': 'web' })
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|22-lts'
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

Для полноценного проекта azd, вызовите этот модуль из подписки `infra/main.bicep`, который создаёт тегированную группу ресурсов и передаёт её область. Совпадите с `environmentName`/`location` в `main.parameters.json`. Тег `azd-service-name: web` связывает ресурс с `services.web`; одних произвольных имён выходных данных недостаточно для настройки обнаружения службы.

### Продвинутые шаблоны Bicep

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
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|22-lts'
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

Bicep является языком по умолчанию для azd, но azd также поддерживает **Terraform** — полезно, если ваша команда уже стандартизировала его или вы управляете мультиоблачной инфраструктурой. Рабочий процесс azd (`azd up`, `azd provision`, `azd down`) идентичен; меняются только язык инфраструктуры и структура папок.

### Как указать azd использовать Terraform

Добавьте раздел `infra` в `azure.yaml`, указывающий на провайдера Terraform:

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

### Структура папок Terraform

С провайдером Terraform ваша папка `infra/` использует файлы `.tf` вместо шаблонов Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Фрагмент `main.tf`

Этот фрагмент создаёт только группу ресурсов и план, а не развёртываемый сервис. Вам также нужно объявить входные переменные, совместимого провайдера `azurerm`, веб-приложение и его отображение тегов/имён ресурсов.

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

### Как azd подключается к вашим выходным данным Terraform

azd читает **outputs** Terraform в значения окружения. В этом фрагменте предполагается, что вы определили `azurerm_linux_web_app.web`; для обнаружения служб всё ещё требуется совпадающее имя ресурса или тег `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Важное замечание:** azd использует тег `azd-env-name` и выходные данные `AZURE_*` для отслеживания ресурсов по окружениям. Всегда отмечайте группу ресурсов тегом `"azd-env-name" = var.environment_name`, чтобы `azd down` мог найти и удалить всё.

### Развёртывание с Terraform

Команды полностью совпадают с Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Предварительное условие:** Terraform должен быть установлен и доступен в вашем `PATH`. azd управляет *рабочим процессом* Terraform, но не устанавливает Terraform за вас. По умолчанию azd использует локальное состояние; для команд настройте удалённый backend (например, Azure Storage) в `provider.tf`.

Для полноценных, готовых к запуску стартовых шаблонов Terraform смотрите галерею [Awesome AZD](https://azure.github.io/awesome-azd/) с фильтром Terraform или официальный [документ azd по Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Другие инструменты инфраструктуры

Pulumi не является встроенным провайдером azd версии 1.37.2. Установка только `infra.provider: pulumi` не обеспечивает полноценную интеграцию, и `azd env new` не создаёт и не выбирает автоматически стек Pulumi. Если вы используете другой IaC-инструмент, следуйте документации проверенного расширения провайдера или управляйте его жизненным циклом явно в своём рабочем процессе. Этот курс не поставляет и не проверяет провайдера Pulumi.

## 🎯 Выбор хоста для вашего сервиса

Поле `host` в `azure.yaml` определяет, где выполняется ваш код. azd поддерживает несколько хостов — правильный выбор важнее языка инфраструктуры. Вот сравнение для начинающих:

| Значение `host` | Лучшее для | Почему |
|--------------|----------|-----|
| `appservice` | Традиционные веб-приложения и API | Самый простой PaaS; не требует контейнеров |
| `staticwebapp` | SPA на фронтенде (React, Vue, Angular) | Глобальный CDN + бесплатный SSL, встроенная поддержка API |
| `function` | Событийно-ориентированные и бессерверные нагрузки | Масштабирование до нуля, оплата за выполнение |
| `containerapp` | Контейнеризированные микросервисы | Бессерверные контейнеры, масштабирование до нуля, встроенный вход |
| `aks` | Сложные задачи оркестрации | Полное управление Kubernetes, когда это действительно нужно |
| `springapp` | Существующие развертывания Azure Spring Apps | Устаревшая цель; сервис закрывается 31 марта 2028 и недоступен новым клиентам |

### Когда использовать AKS

**Azure Kubernetes Service (`host: aks`)** предоставляет вам полную мощь Kubernetes — кастомные контроллеры, service mesh, сложные сети и тонкое расписание. Эта мощь сопровождается операционными издержками: вы управляете пулами узлов, обновлениями и сетью кластера.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Начинайте проще, если можете.** Для большинства микросервисов **Container Apps** обеспечивает контейнеры, автоскейлинг и масштабирование до нуля без управления кластером. Выбирайте AKS только при необходимости функций, специфичных для Kubernetes.

### Когда использовать Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** — это управляемая среда выполнения, специально созданная для Spring Boot. Она обрабатывает обнаружение сервисов, сервер конфигураций и blue-green деплоймент, так что Java-команды не управляют собственной инфраструктурой.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Не выбирайте Azure Spring Apps для нового начинающего проекта: сервис закрыт для новых клиентов и [закрывается 31 марта 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Предпочитайте поддерживаемые альтернативы, такие как Container Apps, и планируйте миграцию для существующих развертываний.

## 🗃️ Обеспечение баз данных

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
**Требования к фрагменту:** объявите `@secure() param databasePassword string` и используйте надёжное заданное значение. Выберите либо публичный доступ, **либо** интегрируйте делегированный подсеть / частный DNS ниже; два сниппета не подключаются автоматически.

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

Правило `0.0.0.0` разрешает подключения из Azure-сервисов вне вашей подписки. Это не приватная сеть; для реальных нагрузок предпочтительнее ограниченная сетевая архитектура.

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
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

Для системно назначенной идентичности не устанавливайте `AZURE_CLIENT_ID` в её principal ID. Идентичность, назначенная пользователем, использует **client ID**, а не object/principal ID. Ссылка Key Vault также требует назначения роли хранилища и сетевого доступа для идентичности приложения.

## 🌍 Сетевые подключения и связность

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
**Незавершённый фрагмент архитектуры, не готовый к развертыванию шлюз:** добавьте выделенный `gateway-subnet` в VNet, вместе с backend-пулами, настройками HTTP, слушателями, правилами маршрутизации с приоритетами и TLS-сертификатом (или авторизованной ссылкой на Key Vault). Просто открытие порта 443 не настраивает HTTPS.

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

## 📊 Мониторинг и наблюдаемость

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
    scopes: [appServicePlan.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
          metricNamespace: 'Microsoft.Web/serverfarms'
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

## 🔧 Конфигурации для разных сред

### Файлы параметров для разных сред
Ниже приведены **альтернативные примеры файлов параметров**. azd не выбирает автоматически `main.parameters.dev.json` или `main.parameters.prod.json` по названию среды. Используйте фактический `main.parameters.json` с подстановками среды (например, `${APP_SERVICE_SKU=B1}`), и объявляйте/используйте каждый параметр в Bicep.

Пример содержимого для `infra/main.parameters.dev.json`:

```json
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

Пример содержимого для `infra/main.parameters.prod.json`:

```json
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

### Условное обеспечение ресурсов
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: 'stdev${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: 'stprod${resourceToken}'
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

## 🚀 Продвинутые шаблоны обеспечения

### Мульти-региональное развертывание
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
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Обеспечение инфраструктуры не развёртывает ваш код приложения. Запускайте проверки приложения только после `azd deploy`/`azd up`, используйте `/health` только если ваше приложение это реализует. Скрипты развертывания ARM создают ресурсы Azure и требуют дополнительной идентичности, поддерживаемых версий времени выполнения и разрешений; это не локальные юнит-тесты.

## 🧪 Предварительный просмотр и проверка инфраструктуры (НОВОЕ)

### Предварительный просмотр изменений инфраструктуры перед развертыванием

Функция `azd provision --preview` позволяет **симулировать обеспечение инфраструктуры** перед фактическим развертыванием ресурсов. Это похоже по духу на `terraform plan` или `bicep what-if`, давая вам **просмотр "сухого прогона"** того, какие изменения будут внесены в вашу среду Azure.

#### 🛠️ Что она делает
- **Анализирует ваши шаблоны IaC** (Bicep или Terraform)
- **Показывает предварительный просмотр изменений ресурсов**: добавления, удаления, обновления
- **Не применяет предлагаемые провайдером изменения инфраструктуры** — сначала проверьте хуки проекта; скрипты могут иметь побочные эффекты, и для предпросмотра всё равно нужны разрешения Azure

#### Сценарии использования
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Эта команда помогает вам:
- **Проверять изменения инфраструктуры** перед фиксацией ресурсов
- **Раннее обнаружение ошибок конфигурации** в процессе разработки
- **Безопасно сотрудничать** в командных средах
- **Обеспечивать развертывания с минимальными правами** без неожиданностей

Особенно полезна при:
- Работе с комплексными мультисервисными средами
- Внесении изменений в продакшн-инфраструктуру
- Проверке изменений шаблонов перед одобрением PR
- Обучении новых участников команды паттернам инфраструктуры

### Пример вывода предпросмотра
Конкретный вывод предпросмотра зависит от провайдера и структуры проекта, но результат должен чётко показывать предложенные изменения до их применения.

```text
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

## �🔄 Обновления ресурсов и миграции

### Безопасные обновления ресурсов
```bash
# Preview infrastructure changes first (RECOMMENDED)
azd provision --preview

# Apply changes after preview confirmation
azd provision
# In automation, --no-prompt uses known values and fails on unresolved decisions;
# it is not an approval bypass.

# For rollback, use Git to revert infrastructure changes:
git revert HEAD  # Revert last infrastructure commit
azd provision    # Apply previous infrastructure state
```

### Миграции баз данных
**Незавершённый шаблон скрипта развертывания:** требует настроенной идентичности, назначенной пользователем, поддерживаемого времени выполнения Azure CLI, доступных инструментов миграции, заданной директории/конфигурации миграций и подключения к базе данных. Не исполняется просто вставкой этого ресурса в шаблон.

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
    retentionInterval: 'P1D'
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
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Стратегия тегирования
```bicep
// utcNow is only allowed in a parameter default, not directly in a variable.
param deploymentDate string = utcNow('yyyy-MM-dd')

var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'deployment-date': deploymentDate
}
```

### 3. Проверка параметров
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

### 4. Организация вывода
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

- [Планирование перед развертыванием](../chapter-06-pre-deployment/capacity-planning.md) - Проверка доступности ресурсов
- [Распространённые проблемы](../chapter-07-troubleshooting/common-issues.md) - Поиск и устранение проблем инфраструктуры
- [Руководство по отладке](../chapter-07-troubleshooting/debugging.md) - Отладка проблем с развертыванием
- [Выбор SKU](../chapter-06-pre-deployment/sku-selection.md) - Выбор соответствующих уровней обслуживания

## Дополнительные ресурсы

- [Документация Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Шаблоны Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Основы хорошей архитектуры Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Навигация**
- **Предыдущее занятие**: [Руководство по развертыванию](deployment-guide.md)
- **Следующее занятие**: [Планирование емкости](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->