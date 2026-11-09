# Забезпечення ресурсів Azure за допомогою AZD

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 4 - Інфраструктура як код і розгортання
- **⬅️ Попередній**: [Посібник з розгортання](deployment-guide.md)
- **➡️ Наступний розділ**: [Розділ 5: Багатоагентні AI-рішення](../../examples/retail-scenario.md)
- **🔧 Пов’язані**: [Розділ 6: Валідація перед розгортанням](../chapter-06-pre-deployment/capacity-planning.md)

## Вступ

Цей посібник охоплює забезпечення та керування ресурсами Azure за допомогою Azure Developer CLI з його вбудованими провайдерами Bicep та Terraform.

> Перевірено станом на `azd 1.37.2` (листопад 2026). Якщо не зазначено інше, приклади Bicep, Terraform і скриптів є **ілюстративними фрагментами**, а не повним шаблоном. Об’єднайте їх у проект, який надає посилання на параметри, модулі, ідентичності, мережу та код застосунку. Під час цієї перевірки забезпечення Azure не виконувалось.

## Цілі навчання

Завершивши цей посібник, ви:
- Опануєте принципи Інфраструктури як коду та забезпечення ресурсів Azure
- Зрозумієте кілька IaC провайдерів, підтримуваних Azure Developer CLI
- Розробите та реалізуєте шаблони Bicep для поширених архітектур застосунків
- Налаштуєте параметри ресурсів, змінні та налаштування для конкретних середовищ
- Реалізуєте просунуті патерни інфраструктури, включно з мережею та безпекою
- Керуєте життєвим циклом ресурсів, оновленнями та розв’язанням залежностей

## Очікувані результати навчання

Після завершення ви зможете:
- Проєктувати та забезпечувати інфраструктуру Azure за допомогою шаблонів Bicep та ARM
- Налаштовувати складні багатосервісні архітектури з правильними залежностями ресурсів
- Впроваджувати параметризовані шаблони для кількох середовищ і конфігурацій
- Виправляти проблеми з забезпеченням інфраструктури та усувати помилки розгортання
- Застосовувати принципи Azure Well-Architected Framework до проєктування інфраструктури
- Керувати оновленнями інфраструктури та впроваджувати стратегії версіонування інфраструктури

## Огляд забезпечення інфраструктури

Azure Developer CLI підтримує кілька провайдерів Інфраструктури як Коду (IaC):
- **Bicep** (рекомендовано) – доменно-специфічна мова Azure
- **ARM Templates** – Bicep компілюється у ARM; сирий ARM JSON не є окремим вбудованим `infra.provider`
- **Terraform** – мультихмарний інструмент інфраструктури
- **Розширення провайдерів** – потребують окремо встановленого розширення провайдера та його документованої конфігурації; не варто припускати, що підтримується будь-який рядок із провайдером

## Розуміння ресурсів Azure

### Ієрархія ресурсів
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Поширені служби Azure для застосунків
- **Виконання**: App Service, Container Apps, Functions, Віртуальні машини
- **Зберігання**: Аккаунт зберігання, Cosmos DB, SQL Database, PostgreSQL
- **Мережа**: Віртуальна мережа, Application Gateway, CDN
- **Безпека**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Шаблони інфраструктури Bicep

### Базова структура шаблону Bicep
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

Для повного проєкту azd викличте цей модуль із скоупом облікового запису підписки `infra/main.bicep`, який створює теговану групу ресурсів і передає її область. Підтримуйте відповідність `environmentName`/`location` у `main.parameters.json`. Тег `azd-service-name: web` асоціює ресурс з `services.web`; довільні імена виводів самі по собі не налаштовують виявлення сервісу.

### Просунуті патерни Bicep

#### Модульна інфраструктура
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

#### Умовне створення ресурсу
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

## 🌐 Використання Terraform з azd

Bicep є за замовчуванням у azd, але azd також підтримує **Terraform** — корисно, якщо ваша команда вже стандартизує його або ви керуєте мультихмарною інфраструктурою. Робочий процес azd (`azd up`, `azd provision`, `azd down`) ідентичний; змінюється лише мова інфраструктури та структура папок.

### Скажіть azd використовувати Terraform

Додайте у `infra` секцію у `azure.yaml`, яка вказує на провайдера Terraform:

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

З провайдером Terraform ваша папка `infra/` містить файли `.tf` замість Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Фрагмент `main.tf`

Це створює лише групу ресурсів і план, а не розгортальний сервіс. Ви також маєте оголосити вхідні змінні, сумісного провайдера `azurerm`, веб-застосунок та його відображення тегів сервісу/імені ресурсу.

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

### Як azd підключається до ваших виводів Terraform

azd читає **виводи** Terraform у значення середовища. Цей фрагмент припускає, що ви визначили `azurerm_linux_web_app.web`; для виявлення служб все ще потрібна відповідна назва ресурсу або тег `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Важливо:** azd використовує тег `azd-env-name` і виводи `AZURE_*` для відстеження ресурсів у кожному середовищі. Завжди тегіть вашу групу ресурсів тегом `"azd-env-name" = var.environment_name`, щоб `azd down` міг знайти та видалити все.

### Розгортання за допомогою Terraform

Команди точно такі ж, як у Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Вимога:** Terraform має бути встановлено і бути у вашому `PATH`. azd керує *процесом* Terraform, але не встановлює Terraform за вас. Для стану за замовчуванням azd використовує локальний стан; для команд налаштуйте віддалений бекенд (наприклад, Azure Storage backend) у `provider.tf`.

Для повних робочих стартових наборів на базі Terraform перегляньте [Awesome AZD gallery](https://azure.github.io/awesome-azd/) і відфільтруйте за Terraform, або дивіться офіційну [документацію azd по Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Інші інструменти інфраструктури

Pulumi не є вбудованим провайдером azd 1.37.2 для провізії. Встановлення лише `infra.provider: pulumi` не створює робочу інтеграцію, і `azd env new` не створює/не вибирає автоматично стек Pulumi. Якщо ви використовуєте інший IaC інструмент, дотримуйтесь документації перевіреного розширення провайдера або керуйте його життєвим циклом явно у вашому власному робочому процесі. Цей курс не постачає і не перевіряє провайдера Pulumi.

## 🎯 Вибір хостингу для вашої служби

Поле `host` у `azure.yaml` визначає, де виконуватиметься ваш код. azd підтримує кілька хостів — правильний вибір важливіший за мову інфраструктури. Ось порівняння для початківців:

| Значення `host` | Найкраще підходить для | Чому |
|--------------|----------|-----|
| `appservice` | Традиційні веб-додатки і API | Найпростіший PaaS; контейнери не потрібні |
| `staticwebapp` | Фронтенд SPA (React, Vue, Angular) | Глобальний CDN + безкоштовний SSL, вбудована підтримка API |
| `function` | Подієво-керовані і безсерверні навантаження | Масштабування до нуля, оплата за виконання |
| `containerapp` | Контейнеризовані мікросервіси | Безсерверні контейнери, масштабування до нуля, вбудований доступ |
| `aks` | Складні потреби оркестрації | Повний контроль Kubernetes, коли він дійсно потрібен |
| `springapp` | Існуючі розгортання Azure Spring Apps | Спадковий таргет; сервіс завершує роботу 31 березня 2028 та закритий для нових клієнтів |

### Коли обирати AKS

**Azure Kubernetes Service (`host: aks`)** надає вам повну потужність Kubernetes — користувацькі контролери, mesh-сервіси, складні мережі та тонке планування. Ця потужність несе за собою операційну навантаженість: ви керуєте пулами вузлів, оновленнями і мережею кластера.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Починайте простіше, якщо можете.** Для більшості мікросервісів **Container Apps** пропонує контейнери, автоскейлінг і масштабування до нуля без управління кластером. Вибирайте AKS лише тоді, коли потрібні специфічні для Kubernetes функції.

### Коли використовувати Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** – це керована середовище виконання, спеціально створена для Spring Boot. Вона обробляє виявлення служб, сервер конфігурації та blue-green деплоймент, щоб Java-команди не керували власною інфраструктурою.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Не вибирайте Azure Spring Apps для нового початківця проекту: вона закрита для нових клієнтів і [припиняє роботу 31 березня 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Віддавайте перевагу підтримуваним альтернативам, таким як Container Apps, та плануйте міграцію для існуючих розгортань.

## 🗃️ Провізія баз даних

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
**Вимоги до фрагмента:** оголосіть `@secure() param databasePassword string` і використовуйте надійне задане значення. Виберіть публічний доступ **або** інтегруйте делеговану підмережу/приватний DNS нижче; два фрагменти не підключаються автоматично.

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

Правило `0.0.0.0` дозволяє з’єднання з Azure сервісів поза вашою підпискою. Це не приватна мережа; для реальних навантажень віддавайте перевагу обмеженому мережевому дизайну.

## 🔒 Безпека та управління секретами

### Інтеграція Key Vault
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

### Конфігурація Managed Identity
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

Для ідентичності, призначеної системою, не задавайте `AZURE_CLIENT_ID` як її principal ID. Ідентичність, призначена користувачем, використовує **client ID**, а не object/principal ID. Посилання на Key Vault також потребує призначення ролі на сховищі для ідентичності додатку та мережевого доступу.

## 🌍 Мережі та підключення

### Конфігурація віртуальної мережі
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

### Application Gateway з SSL
**Неповний архітектурний фрагмент, не є розгортаємим шлюзом:** додайте виділений `gateway-subnet` до VNet, а також backend-пули, HTTP-настройки, слухачів, правила маршрутизації з пріоритетами і сертифікат TLS (або авторизоване посилання на Key Vault). Проста відкрита порт 443 не налаштовує HTTPS.

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

## 📊 Моніторинг та спостережуваність

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

### Користувацькі метрики та оповіщення
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

## 🔧 Конфігурації, специфічні для середовища

### Файли параметрів для різних середовищ
Два наведені нижче файли є **альтернативними прикладами файлів параметрів**. azd не вибирає автоматично `main.parameters.dev.json` або `main.parameters.prod.json` за назвою середовища. Використовуйте фактичний `main.parameters.json` з підстановками середовищ (наприклад, `${APP_SERVICE_SKU=B1}`), а кожен параметр оголошуйте і споживайте у Bicep.

Приклад вмісту для `infra/main.parameters.dev.json`:

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

Приклад вмісту для `infra/main.parameters.prod.json`:

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

### Умовне провізіювання ресурсів
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

## 🚀 Розширені шаблони провізії

### Мульти-регіональне розгортання
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

### Тестування інфраструктури
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Провізія інфраструктури не розгортає ваш код додатку. Запускайте перевірки додатку лише після `azd deploy`/`azd up`, і використовуйте `/health` тільки якщо ваш додаток його реалізує. ARM-скрипти розгортання створюють ресурси Azure і потребують додаткової ідентичності, підтримуваних версій runtime і дозволів; вони не є локальними юніт-тестами.

## 🧪 Попередній перегляд та валідація інфраструктури (НОВИНКА)

### Попередній перегляд змін інфраструктури перед розгортанням

Функція `azd provision --preview` дозволяє **симулювати провізіювання інфраструктури** перед фактичним розгортанням ресурсів. Вона подібна за духом до `terraform plan` або `bicep what-if`, даючи вам **перегляд dry-run** того, які зміни будуть внесені до вашого Azure-середовища.

#### 🛠️ Що вона робить
- **Аналізує ваші IaC шаблони** (Bicep або Terraform)
- **Показує попередній перегляд змін ресурсів**: додавання, видалення, оновлення
- **Не застосовує запропоновані зміни провайдера інфраструктури** — спочатку перегляньте хуки проекту; скрипти можуть мати побічні ефекти, а перегляд все одно потребує дозволів Azure

#### Випадки використання
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Ця команда допомагає вам:
- **Валідувати зміни інфраструктури** перед комітом ресурсів
- **Раннє виявлення неправильних налаштувань** у циклі розробки
- **Безпечно співпрацювати** у командних середовищах
- **Забезпечувати мінімальний рівень дозволів під час розгортання** без несподіванок

Особливо корисна коли:
- Працюєте з складними багатосервісними середовищами
- Вносите зміни у виробничу інфраструктуру
- Перевіряєте зміни шаблонів перед затвердженням PR
- Навчаєте нових членів команди шаблонам інфраструктури

### Приклад виводу попереднього перегляду
Точний вивід попереднього перегляду залежить від провайдера та структури проекту, але результат повинен чітко ідентифікувати запропоновані зміни перед застосуванням.

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

## �🔄 Оновлення ресурсів та міграції

### Безпечне оновлення ресурсів
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

### Міграції баз даних
**Неповний шаблон скрипту розгортання:** потребує налаштованої ідентичності, призначеної користувачем, там, де це потрібно, підтримуване середовище Azure CLI, наявні інструменти міграції, вказану директорію/конфігурацію міграції та підключення до бази даних. Не виконується просто вставкою цього ресурсу у шаблон.

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

## 🎯 Найкращі практики

### 1. Конвенції іменування ресурсів
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Стратегія тегів
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

### 3. Валідація параметрів
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

### 4. Організація виводів
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

## Наступні кроки

- [Планування перед розгортанням](../chapter-06-pre-deployment/capacity-planning.md) - Валідація доступності ресурсів
- [Поширені проблеми](../chapter-07-troubleshooting/common-issues.md) - Усунення проблем інфраструктури
- [Посібник з налагодження](../chapter-07-troubleshooting/debugging.md) - Вирішення проблем з розгортанням
- [Вибір SKU](../chapter-06-pre-deployment/sku-selection.md) - Вибір відповідних рівнів послуг

## Додаткові ресурси

- [Документація Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Шаблони Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Центр архітектури Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Навігація**
- **Попередній урок**: [Посібник із розгортання](deployment-guide.md)
- **Наступний урок**: [Планування потужностей](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->