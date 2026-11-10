# Осигуряване на ресурси в Azure с AZD

**Навигация в главата:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 4 - Инфраструктура като код и разгръщане
- **⬅️ Предишна**: [Ръководство за разгръщане](deployment-guide.md)
- **➡️ Следваща глава**: [Глава 5: Мулти-агентни AI решения](../../examples/retail-scenario.md)
- **🔧 Свързани**: [Глава 6: Предварителна валидация преди разгръщане](../chapter-06-pre-deployment/capacity-planning.md)

## Въведение

Това ръководство обхваща осигуряване и управление на ресурси в Azure с помощта на Azure Developer CLI и вградените му провайдъри Bicep и Terraform.

> Прегледано спрямо `azd 1.37.2` (ноември 2026). Ако не е посочено друго, примерите с Bicep, Terraform и скриптове са **илюстративни фрагменти**, а не пълен шаблон. Обединете ги в проект, който предоставя посочените параметри, модули, идентичности, мрежова конфигурация и код на приложението. В този преглед разполагането в Azure не е изпълнено.

## Цели за обучение

След завършване на това ръководство ще можете:
- Да овладеете принципите на Infrastructure as Code и осигуряването на ресурси в Azure
- Да разберете няколко IaC провайдъра, поддържани от Azure Developer CLI
- Да проектирате и имплементирате Bicep шаблони за често срещани архитектури на приложения
- Да конфигурирате параметри, променливи и настройки специфични за околната среда
- Да приложите напреднали инфраструктурни модели, включително мрежи и сигурност
- Да управлявате жизнения цикъл на ресурсите, актуализации и разрешаване на зависимости

## Резултати от обучението

След завършване ще можете:
- Да проектирате и осигурявате инфраструктура в Azure с Bicep и ARM шаблони
- Да конфигурирате сложни многослойни архитектури с правилни зависимости между ресурсите
- Да имплементирате параметризирани шаблони за различни среди и конфигурации
- Да отстранявате проблеми с осигуряването на инфраструктура и да разрешавате неуспешни разгръщания
- Да прилагате принципите на Azure Well-Architected Framework при проектиране на инфраструктура
- Да управлявате актуализации на инфраструктурата и да прилагате стратегии за версиониране

## Обзор на осигуряването на инфраструктура

Azure Developer CLI поддържа няколко провайдъра за Infrastructure as Code (IaC):
- **Bicep** (препоръчително) - специфичен език за Azure
- **ARM шаблони** - Bicep се компилира в ARM; суров ARM JSON не е отделен вграден `infra.provider`
- **Terraform** - инструмент за инфраструктура в множество облаци
- **Разширителни провайдъри** - изискват отделно инсталиране на разширение и документирана конфигурация; не приемайте, че всеки низ на провайдър е поддържан

## Разбиране на Azure ресурсите

### Йерархия на ресурсите
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Често използвани Azure услуги за приложения
- **Изчисления**: App Service, Container Apps, Functions, Виртуални машини
- **Съхранение**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Мрежи**: Virtual Network, Application Gateway, CDN
- **Сигурност**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI услуги, Azure OpenAI, Azure Machine Learning

## Bicep инфраструктурни шаблони

### Основна структура на Bicep шаблон
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

За пълен azd проект, извикайте този модул от `infra/main.bicep` с обхват на абонамент, който създава етикетирана ресурсна група и предава обхвата й. Съответствайте с `environmentName`/`location` в `main.parameters.json`. Етикетът `azd-service-name: web` свързва ресурса с `services.web`; произволните имена на изходи сами по себе си не конфигурират откриване на услуги.

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

#### Условно създаване на ресурс
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

Bicep е по подразбиране в azd, но azd също поддържа **Terraform** – полезен, ако вашият екип вече го стандартизира или управлявате мултиоблачна инфраструктура. Работният процес на azd (`azd up`, `azd provision`, `azd down`) е идентичен; променят се само езикът на инфраструктура и структурата на папките.

### Кажете на azd да използва Terraform

Добавете секция `infra` към `azure.yaml`, сочеща към Terraform провайдъра:

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

### Структура на папката за Terraform

С Terraform провайдър, папката `infra/` използва `.tf` файлове вместо Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### `main.tf` фрагмент

Това създава само ресурсна група и план, а не разгръщаема услуга. Трябва също да декларирате входни променливи, съвместим `azurerm` провайдър, уеб приложението и съответствия на тагове/имена на ресурсите.

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

### Как azd се свързва с изходите на Terraform

azd чете Terraform **outputs** като стойности на околната среда. Този фрагмент предполага, че сте дефинирали `azurerm_linux_web_app.web`; откриването на услуги още изисква съответстващо име или таг `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Важно:** azd използва тага `azd-env-name` и изходите `AZURE_*`, за да проследява ресурсите на среда. Винаги маркирайте вашата ресурсна група с `"azd-env-name" = var.environment_name`, за да може `azd down` да намери и премахне всичко.

### Разгръщане с Terraform

Командите са същите като при Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Изискване:** Terraform трябва да е инсталиран и в `PATH`. azd управлява *работния процес* на Terraform, но не го инсталира вместо вас. По подразбиране azd използва локално състояние; за екипи настройте отдалечен бекенд (напр. Azure Storage бекенд) в `provider.tf`.

За пълни, работещи Terraform стартъри, разгледайте [Awesome AZD галерията](https://azure.github.io/awesome-azd/) с филтър за Terraform, или вижте официалната [azd документация за Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Други инфраструктурни инструменти

Pulumi не е вграден провайдър за осигуряване в azd 1.37.2. Самото задаване на `infra.provider: pulumi` не установява работеща интеграция, а `azd env new` не създава или избира Pulumi стек автоматично. Ако използвате друг IaC инструмент, следвайте документацията на проверен разширителен провайдър или управлявайте жизнения му цикъл изрично във вашия работен процес. Този курс не предоставя и не валидира Pulumi провайдър.

## 🎯 Избор на хост за вашата услуга

Полето `host` в `azure.yaml` определя къде ще се изпълнява кода ви. azd поддържа няколко хоста — изборът му е по-важен от езика на инфраструктурата. Ето сравнение, подходящо за начинаещи:

| Стойност `host` | Най-подходящо за | Защо |
|--------------|----------|-----|
| `appservice` | Традиционни уеб приложения и API-та | Най-простият PaaS; не са необходими контейнери |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | Глобален CDN + безплатен SSL, вградена поддръжка на API |
| `function` | Събитийно-управлявани и безсървърни задачи | Автоматично скалиране до нула, плащане на изпълнение |
| `containerapp` | Контейнеризирани микросервизи | Безсървърни контейнери, автоматично скалиране до нула, вграден вход |
| `aks` | Сложни оркестрационни нужди | Пълен контрол върху Kubernetes при реална необходимост |
| `springapp` | Съществуващи разгръщания на Azure Spring Apps | Стари цели; услугата се прекратява на 31 март 2028 и е затворена за нови клиенти |

### Кога да изберете AKS

**Azure Kubernetes Service (`host: aks`)** ви дава пълната мощ на Kubernetes — персонализирани контролери, service mesh, сложни мрежи и прецизно планиране. Тази мощ е придружена от оперативна сложност: вие управлявате node pool-ове, ъпгрейди и мрежи в кластера.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Започнете по-просто ако можете.** За повечето микросервизи, **Container Apps** предоставя контейнери, авто-скалиране и скалиране до нула без нужда от управление на клъстър. Изберете AKS само ако имате нужда от специфични Kubernetes функции.

### Кога да използвате Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** е управлявана среда, специално създадена за Spring Boot. Тя осигурява service discovery, конфигурационен сървър и blue-green разгръщане, така че Java екипите не трябва да управляват своята инфраструктура.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Не избирайте Azure Spring Apps за нов проект за начинаещи: услугата е затворена за нови клиенти и [се прекратява на 31 март 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Предпочитайте поддържани алтернативи като Container Apps и планирайте миграция за съществуващите разгръщания.

## 🗃️ Осигуряване на бази данни

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
**Изисквания към фрагмента:** декларирайте `@secure() param databasePassword string` и използвайте силно подадена стойност. Изберете публичен достъп **или** интегрирайте делегирана подсекция/частен DNS по-долу; двата фрагмента не се свързват автоматично помежду си.

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

Правилото `0.0.0.0` позволява връзки от Azure услуги извън вашия абонамент. Това не е частна мрежа; предпочитайте ограничен мрежов дизайн за реални натоварвания.

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

### Конфигурация на управлявана идентичност
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

За системно присвоена идентичност не задавайте `AZURE_CLIENT_ID` на нейния principal ID. Потребителската идентичност използва **client ID**, а не object/principal ID. Препратката към Key Vault също изисква роля и достъп до мрежата за идентичността на приложението.

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
**Незавършен архитектурен фрагмент, не разгръщаем gateway:** добавете посветен `gateway-subnet` към VNet плюс backend пулове, HTTP настройки, слушатели, правила за маршрутизиране с приоритети и TLS сертификат (или упълномощена референция към Key Vault). Само отваряне на порт 443 не конфигурира HTTPS.

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

### Потребителски метрики и аларми
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

## 🔧 Конфигурации, специфични за околната среда

### Файлове с параметри за различни среди
Двата файла по-долу са **примери за алтернативни параметърни файлове**. azd не избира автоматично `main.parameters.dev.json` или `main.parameters.prod.json` според името на средата. Използвайте реалния `main.parameters.json` с подмяна на променливи за средата (напр. `${APP_SERVICE_SKU=B1}`) и декларирайте/консумирайте всеки параметър в Bicep.

Примерно съдържание за `infra/main.parameters.dev.json`:

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

Примерно съдържание за `infra/main.parameters.prod.json`:

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

### Условно осигуряване на ресурси
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

## 🚀 Напреднали модели за осигуряване

### Много-регионално разгръщане
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
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Осигуряването на инфраструктура не разгръща вашия приложен код. Изпълнявайте проверки на приложението само след `azd deploy`/`azd up` и използвайте `/health` само ако приложението ви го поддържа. ARM скриптовете за разгръщане създават Azure ресурси и изискват допълнителни идентичности, поддържани версии на runtime и права; те не са локални unit тестове.

## 🧪 Преглед и валидация на инфраструктура (НОВО)

### Прегледайте инфраструктурните промени преди разгръщане

Функцията `azd provision --preview` ви позволява да **симулирате осигуряването на инфраструктура** преди да разположите ресурсите физически. Тя е подобна на `terraform plan` или `bicep what-if` и ви дава **поглед преди действията**, за да видите какви промени ще бъдат направени във вашата Azure среда.

#### 🛠️ Какво прави
- **Анализира вашите IaC шаблони** (Bicep или Terraform)
- **Показва преглед на промените в ресурсите**: добавяния, изтривания, актуализации
- **Не прилага предложените инфраструктурни промени от провайдъра** — прегледайте hooks на проекта първо; скриптовете могат да имат странични ефекти и прегледът въпреки това изисква права в Azure

#### Сценарии на употреба
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Тази команда ви помага:
- **Да валидирате инфраструктурни промени** преди да ангажирате ресурси
- **Да хванете ранни грешни конфигурации** в цикъла на разработка
- **Да си сътрудничите безопасно** в екипни среди
- **Да осигурите разгръщане с минимални права** без изненади

Особено полезно, когато:
- Работите със сложни многослойни среди
- Правите промени в продукционна инфраструктура
- Валидирате модификации на шаблони преди одобрение на pull request
- Обучавате нови членове на екип на инфраструктурни модели

### Примерен изход от прегледа
Точният изход зависи от провайдъра и структурата на проекта, но резултатът трябва ясно да посочи предложените промени преди прилагане.

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

## �🔄 Актуализации и миграции на ресурси

### Безопасни актуализации на ресурси
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

### Миграции на база данни
**Незавършен модел на скрипт за разгръщане:** изисква конфигурирана потребителска идентичност там където е нужна, поддържан Azure CLI runtime, налични миграционни инструменти, подадена миграционна директория/конфигурация и връзка с базата данни. Не може да се изпълни само чрез поставяне на този ресурс в шаблон.

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

## 🎯 Най-добри практики

### 1. Конвенции за именуване на ресурси
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Система за тагване
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

### 4. Организация на изходите
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

- [Планиране преди разгръщане](../chapter-06-pre-deployment/capacity-planning.md) - Валидация на наличност на ресурси
- [Чести проблеми](../chapter-07-troubleshooting/common-issues.md) - Отстраняване на инфраструктурни проблеми
- [Ръководство за отстраняване на грешки](../chapter-07-troubleshooting/debugging.md) - Отстраняване на проблеми с доставката
- [Избор на SKU](../chapter-06-pre-deployment/sku-selection.md) - Изберете подходящи нива на услугата

## Допълнителни ресурси

- [Документация за Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Шаблони на Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Център за архитектура на Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Добре проектирана рамка на Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Навигация**
- **Предишен урок**: [Ръководство за внедряване](deployment-guide.md)
- **Следващ урок**: [Планиране на капацитета](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->