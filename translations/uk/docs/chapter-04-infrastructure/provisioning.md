# Забезпечення ресурсів Azure з AZD

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 4 - Інфраструктура як код і розгортання
- **⬅️ Попередній**: [Посібник з розгортання](deployment-guide.md)
- **➡️ Наступний розділ**: [Розділ 5: Багатоагентні AI рішення](../../examples/retail-scenario.md)
- **🔧 Пов’язано**: [Розділ 6: Перевірка перед розгортанням](../chapter-06-pre-deployment/capacity-planning.md)

## Вступ

Цей комплексний посібник охоплює все, що вам потрібно знати про забезпечення та керування ресурсами Azure за допомогою Azure Developer CLI. Навчіться впроваджувати шаблони Інфраструктури як коду (IaC) від базового створення ресурсів до складних корпоративних інфраструктурних архітектур з використанням Bicep, ARM шаблонів, Terraform та Pulumi.

## Цілі навчання

Пройшовши цей посібник, ви:
- Опануєте принципи Інфраструктури як коду та забезпечення ресурсів Azure
- Зрозумієте кілька провайдерів IaC, підтримуваних Azure Developer CLI
- Спроектуєте та реалізуєте шаблони Bicep для звичних архітектур застосунків
- Налаштуєте параметри ресурсів, змінні та специфічні параметри для середовищ
- Впровадите складні інфраструктурні патерни, включно з мережею та безпекою
- Керуєте життєвим циклом ресурсів, оновленнями та вирішенням залежностей

## Результати навчання

Після завершення ви зможете:
- Проектувати та забезпечувати інфраструктуру Azure за допомогою Bicep та ARM шаблонів
- Налаштовувати складні багатосервісні архітектури з правильними залежностями ресурсів
- Впроваджувати параметризовані шаблони для кількох середовищ та конфігурацій
- Усувати проблеми з забезпеченням інфраструктури та вирішувати помилки розгортання
- Застосовувати принципи Azure Well-Architected Framework до дизайну інфраструктури
- Керувати оновленнями інфраструктури та впроваджувати стратегії версіонування інфраструктури

## Огляд забезпечення інфраструктури

Azure Developer CLI підтримує кілька провайдерів Інфраструктури як коду (IaC):
- **Bicep** (рекомендовано) — домен-специфічна мова Azure
- **ARM Templates** — шаблони Azure Resource Manager в форматі JSON
- **Terraform** — інструмент для мультихмарної інфраструктури
- **Pulumi** — сучасна інфраструктура як код на мовах програмування

## Розуміння ресурсів Azure

### Ієрархія ресурсів
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Поширені сервіси Azure для застосунків
- **Обчислення**: App Service, Container Apps, Functions, Віртуальні машини
- **Зберігання**: Обліковий запис зберігання, Cosmos DB, SQL Database, PostgreSQL
- **Мережа**: Віртуальна мережа, Application Gateway, CDN
- **Безпека**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Сервіси Azure AI, Azure OpenAI, Azure Machine Learning

## Шаблони інфраструктури Bicep

### Базова структура шаблону Bicep
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

### Розширені шаблони Bicep

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

#### Умовне створення ресурсів
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

Bicep — це мова за замовчуванням для azd, але azd також підтримує **Terraform** — корисно, якщо ваша команда вже використовує його або ви керуєте мультихмарною інфраструктурою. Робочий процес azd (`azd up`, `azd provision`, `azd down`) ідентичний; змінюється тільки мова інфраструктури та структура папок.

### Як налаштувати azd для використання Terraform

Додайте секцію `infra` в `azure.yaml`, вказавши провайдера Terraform:

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

З провайдером Terraform папка `infra/` містить файли `.tf` замість Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Мінімальний `main.tf`

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

### Як azd з'єднується з виходами Terraform

azd читає **outputs** Terraform, щоб дізнатися ваші кінцеві точки і передати значення середовища у ваше застосування. Імена виходів важливі — azd шукає конкретні:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Важливо:** azd використовує тег `azd-env-name` і виходи `AZURE_*` для відслідковування ресурсів по середовищах. Завжди позначайте вашу групу ресурсів тегом `"azd-env-name" = var.environment_name`, щоб `azd down` міг знайти і видалити все.

### Розгортання з Terraform

Команди такі ж, як для Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd запускає 'terraform plan' під капотом
azd up                    # підготовка + розгортання
azd down --force          # знищує ресурси, керовані Terraform
```

> **Вимога:** Terraform має бути встановлений і вказаний в `PATH`. azd керує робочим процесом Terraform, але не встановлює його для вас. Для стану за замовчуванням azd використовує локальний стан; для команд налаштуйте віддалений бекенд (наприклад Azure Storage) в `provider.tf`.

Для повноцінних запускних проектів на базі Terraform перегляньте [Awesome AZD галерею](https://azure.github.io/awesome-azd/) з фільтром Terraform або офіційну [документацію azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Використання Pulumi з azd

Якщо ваша команда пише інфраструктуру на загальномовних мовах (TypeScript, Python, Go чи C#) замість DSL, azd також підтримує **Pulumi**. Як і з Terraform, робочий процес `azd up` / `azd provision` / `azd down` залишається незмінним — змінюється лише інструмент і структура папок.

### Як налаштувати azd для використання Pulumi

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

### Мінімальний `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Позначте кожен ресурс, щоб azd міг відстежувати їх та очищувати
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd зчитує ці вихідні дані назад у ваше середовище
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Стек відповідає середовищам azd

Pulumi організовує деплоями у **стеки**, і azd відображає кожне середовище azd на стек Pulumi з таким самим ім’ям. Коли ви запускаєте `azd env new staging`, azd обирає (або створює) стек Pulumi з назвою `staging`. Застосовуються ті ж правила тегування `azd-env-name` та виходів `AZURE_*`, щоб `azd down` міг знайти і все вилучити.

### Розгортання з Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd виконує 'pulumi preview' у фоні
azd up                    # забезпечення + розгортання
azd down --force          # виконує 'pulumi destroy'
```

> **Вимога:** Pulumi має бути встановлений і вказаний в `PATH`, і потрібен бекенд для стану (Pulumi Cloud або самостійний, наприклад Azure Blob Storage). azd керує робочим процесом Pulumi, але не встановлює його. Перегляньте офіційну [документацію azd Pulumi](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Вибір хоста для вашого сервісу

Поле `host` в `azure.yaml` визначає, де ваш код буде запускатися. azd підтримує кілька хостів — правильний вибір важливіший за мову інфраструктури. Ось порівняння для початківців:

| Значення `host` | Найкраще для | Чому |
|-----------------|--------------|------|
| `appservice`    | Традиційні вебзастосунки та API | Найпростіший PaaS; не потрібні контейнери |
| `staticwebapp`  | Front-end SPA (React, Vue, Angular) | Глобальний CDN + безкоштовний SSL, вбудована підтримка API |
| `function`      | Подієві та безсерверні завдання    | Масштабування до нуля, оплата за виконання |
| `containerapp`  | Контейнеризовані мікросервіси     | Безсерверні контейнери, масштабування до нуля, вбудований інгрес |
| `aks`           | Складні оркестрації                | Повний контроль Kubernetes, коли справді потрібен |
| `springapp`     | Java Spring Boot застосунки       | Керований Azure Spring Apps runtime, оптимізований для Spring |

### Коли обирати AKS

**Azure Kubernetes Service (`host: aks`)** дає вам повну потужність Kubernetes — власні контролери, сітки сервісів, складні мережі та тонке планування. Ця потужність потребує додаткових операційних ресурсів: ви керуєте пулами вузлів, оновленнями і мережею кластера.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Розпочинайте простіше, якщо можна.** Для більшості мікросервісів **Container Apps** пропонує контейнери, автоскейлінг і масштабування до нуля без управління кластером. AKS обирайте лише, коли потрібні специфічні функції Kubernetes.

### Коли використовувати Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** — це керований runtime, спеціально створений для Spring Boot. Він обробляє виявлення сервісів, конфігураційний сервер та синій-зелений деплоймент, щоб Java-команди не керували власною інфраструктурою.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Використовуйте `springapp`, якщо у вас є існуючі Spring Boot застосунки і ви хочете runtime, орієнтований на них. Для нових контейнеризованих Java-застосунків без потреб у Spring, `containerapp` зазвичай простіший вибір.

## 🗃️ Забезпечення баз даних

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

## 🔒 Безпека та управління секретами

### Інтеграція з Key Vault
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

### Налаштування керованої ідентичності
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

## 🌍 Мережі та підключення

### Налаштування віртуальної мережі
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

### Application Gateway зі SSL
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

## 📊 Моніторинг та огляд

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

## 🔧 Конфігурації специфічні для середовища

### Файли параметрів для різних середовищ
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

### Умовне забезпечення ресурсів
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

## 🚀 Розширені шаблони забезпечення

### Розгортання в кількох регіонах
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

## 🧪 Попередній перегляд та валідація інфраструктури (НОВЕ)

### Перегляд змін інфраструктури перед розгортанням

Функція `azd provision --preview` дозволяє **симулювати забезпечення інфраструктури** перед фактичним розгортанням ресурсів. Це схоже на `terraform plan` або `bicep what-if`, надаючи вам **оглядовий результат сухого запуску**, що показує, які зміни будуть внесені у ваше середовище Azure.

#### 🛠️ Що робить ця команда
- **Аналізує ваші IaC шаблони** (Bicep або Terraform)
- **Показує попередній перегляд змін ресурсів**: додавання, видалення, оновлення
- **Не застосовує зміни** — це лише для читання і безпечно запускати

#### Варіанти використання
```bash
# Попередній перегляд змін інфраструктури перед розгортанням
azd provision --preview

# Попередній перегляд для конкретного середовища
azd provision --preview -e production
```

Ця команда допомагає вам:
- **Перевірити зміни в інфраструктурі** перед фактичним додаванням ресурсів
- **Виявити помилки конфігурації на ранніх етапах** розробки
- **Безпечно співпрацювати** в командному середовищі
- **Забезпечити мінімальні права доступу** без сюрпризів

Особливо корисна, коли:
- Працюєте зі складними багатосервісними середовищами
- Вносите зміни у продуктивну інфраструктуру
- Перевіряєте модифікації шаблонів перед затвердженням PR
- Навчаєте нових членів команди шаблонам інфраструктури

### Приклад виводу попереднього перегляду
Точний вивід залежить від провайдера та структури проекту, але результат повинен чітко вказувати пропоновані зміни до їх застосування.

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

## 🔄 Оновлення ресурсів та міграції

### Безпечне оновлення ресурсів
```bash
# Попередньо перегляньте зміни інфраструктури (РЕКОМЕНДОВАНО)
azd provision --preview

# Застосуйте зміни після підтвердження перегляду
azd provision --confirm-with-no-prompt

# Для відкату використовуйте Git, щоб скасувати зміни інфраструктури:
git revert HEAD  # Скасуйте останній коміт інфраструктури
azd provision    # Застосуйте попередній стан інфраструктури
```

### Міграції баз даних
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

## 🎯 Рекомендовані практики

### 1. Конвенції найменування ресурсів
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Стратегія тегування
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

### 4. Організація вихідних даних
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

- [Планування перед розгортанням](../chapter-06-pre-deployment/capacity-planning.md) - Перевірка доступності ресурсів
- [Поширені проблеми](../chapter-07-troubleshooting/common-issues.md) - Усунення проблем інфраструктури
- [Посібник з налагодження](../chapter-07-troubleshooting/debugging.md) - Налагодження проблем з забезпеченням
- [Вибір SKU](../chapter-06-pre-deployment/sku-selection.md) - Вибір відповідних рівнів послуг

## Додаткові ресурси

- [Документація Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Шаблони Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Центр архітектури Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Навігація**
- **Попередній урок**: [Посібник з розгортання](deployment-guide.md)
- **Наступний урок**: [Планування потужностей](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->