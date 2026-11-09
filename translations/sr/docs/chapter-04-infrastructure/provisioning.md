# Провизија Azure ресурса помоћу AZD

**Навигација кроз поглавља:**
- **📚 Почетна страна курсева**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 4 - Инфраструктура као код и објављивање
- **⬅️ Претходно**: [Водич за објављивање](deployment-guide.md)
- **➡️ Следеће поглавље**: [Поглавље 5: Мулти-агентски AI решења](../../examples/retail-scenario.md)
- **🔧 Повезано**: [Поглавље 6: Валидација пре објављивања](../chapter-06-pre-deployment/capacity-planning.md)

## Увод

Овај водич обухвата провизију и управљање Azure ресурсима користећи Azure Developer CLI са уграђеним Bicep и Terraform провајдерима.

> Прегледано у односу на `azd 1.37.2` (новембар 2026). Ако није другачије наведено, Bicep, Terraform, и скрипт примери су **илустративни исечци**, а не комплетан шаблон. Укључите их у пројекат који обезбеђује назначене параметре, модуле, идентитете, мрежу и код апликације. Провизија Azure ресурса није извршена у овом прегледу.

## Циљеви учења

Завршавањем овог водича, научићете:
- Савладати принципе Инфраструктуре као кода и провизију Azure ресурса
- Разумети више IaC провајдера које подржава Azure Developer CLI
- Дизајнирати и имплементирати Bicep шаблоне за уобичајене архитектуре апликација
- Конфигурисати параметре ресурса, променљиве и подешавања специфична за окружење
- Имплементирати напредне инфраструктурне паттерне укључујући мрежу и безбедност
- Управљати животним циклусом ресурса, ажурирањима и решавањем зависности

## Резултати учења

Након завршетка, моћи ћете да:
- Дизајнирате и провизирате Azure инфраструктуру користећи Bicep и ARM шаблоне
- Конфигуришете сложене мултисервисне архитектуре са исправним зависностима ресурса
- Имплементирате параметризоване шаблоне за више окружења и конфигурација
- Решавате проблеме у провизији инфраструктуре и отклоните грешке при објављивању
- Примените принципе Azure Well-Architected Framework у дизајну инфраструктуре
- Управљате ажурирањима инфраструктуре и имплементирате стратегије верзионисања инфраструктуре

## Преглед провизије инфраструктуре

Azure Developer CLI подржава више провајдера за Инфраструктуру као код (IaC):
- **Bicep** (препоручено) - Azure-ов доменски језик
- **ARM шаблони** - Bicep се компајлира у ARM; сирови ARM JSON није засебан уграђени `infra.provider`
- **Terraform** - алат за мултиклауд инфраструктуру
- **Провајдери екстензија** - захтевају посебно инсталирану екстензију провајдера и његову документацију; не узимајте да је сваки провајдерски стринг подржан

## Разумевање Azure ресурса

### Хијерархија ресурса
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Уобичајене Azure услуге за апликације
- **Обраду**: App Service, Container Apps, Functions, Virtual Machines
- **Складиштење**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Мрежа**: Virtual Network, Application Gateway, CDN
- **Безбедност**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep инфраструктурне шаблоне

### Основна структура Bicep шаблона
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

За комплетан azd пројекат, позовите овај модул из претплатом обухваћеног `infra/main.bicep` који креира означену ресурсну групу и прослеђује њен опсег. Поклапајте `environmentName`/`location` у `main.parameters.json`. Означавање `azd-service-name: web` повезује ресурс са `services.web`; самостално име излаза не конфигурише откривање услуге.

### Напредни Bicep паттерни

#### Модуларна инфраструктура
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

#### Условно креирање ресурса
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

## 🌐 Коришћење Terraform са azd

Bicep је подразумевани у azd, али azd такође подржава **Terraform** — корисно ако ваш тим већ стандардује на њему или управљате мултиклауд инфраструктуром. azd радни ток (`azd up`, `azd provision`, `azd down`) је идентичан; само се менја језик инфраструктуре и распоред фасцикли.

### Реците azd да користи Terraform

Додајте `infra` одељак у `azure.yaml` који показује на Terraform провајдера:

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

### Распоред фасцикли у Terraform-у

Са Terraform провајдером, ваша `infra/` фасцикла користи `.tf` фајлове уместо Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### `main.tf` исечак

Ово креира само ресурсну групу и план, а не сервис који се може објавити. Такође морате декларативно назначити улазне променљиве, компатибилног провајдера `azurerm`, веб апликацију и њену мапу тагова/имена ресурса.

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

### Како azd повезује Terraform излазе

azd учитава Terraform **излазе** као вредности окружења. Овај исечак претпоставља да сте дефинисали `azurerm_linux_web_app.web`; за откривање услуге и даље је потребно одговарајуће име ресурса или `azd-service-name` таг:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Важно:** azd користи `azd-env-name` тег и `AZURE_*` излазе за праћење ресурса по окружењу. Увек означите своју ресурсну групу са `"azd-env-name" = var.environment_name` како би `azd down` могао да пронађе и уклони све.

### Обаљивање са Terraform-ом

Команде су потпуно исте као за Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Претпоставка:** Terraform мора бити инсталиран и доступан на вашем `PATH`. azd управља Terraform *радним током*, али не инсталира Terraform за вас. За стање, azd подразумевано користи локално стање; за тимове, конфигуришите удаљени backend (нпр. Azure Storage backend) у `provider.tf`.

За комплетне стартере базиране на Terraform-у, прегледајте [Awesome AZD галерију](https://azure.github.io/awesome-azd/) и филтрирајте по Terraform-у, или погледајте званичну [azd Terraform документацију](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Остали инфраструктурни алати

Pulumi није уграђени azd 1.37.2 провајдер за провизију. Подешавање `infra.provider: pulumi` само по себи не успоставља радну интеграцију, и `azd env new` не креира/селектује Pulumi stack аутоматски. Ако користите други IaC алат, пратите документацију верификованог продужетка провајдера или управљајте његовим животним циклусом експлицитно у свом радном току. Овај курс не обезбеђује нити валидацију Pulumi провајдера.

## 🎯 Избор хоста за вашу услугу

Поље `host` у `azure.yaml` одлучује где ваш код ради. azd подржава неколико хостова — избор правог је важнији од језика инфраструктуре. Ево пријатељског упоређења за почетнике:

| `host` вредност | Најбоље за | Зашто |
|--------------|----------|-----|
| `appservice` | Традиционалне веб апликације и API-и | Најједноставнији PaaS; не захтева контејнере |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | Глобални CDN + бесплатан SSL, уграђена подршка за API |
| `function` | Догађајем покретани и серверлесс послови | Може да скалира на 0, плаћате по извршењу |
| `containerapp` | Контейнеризовани микросервиси | Серверлесс контејнери, скалирање на 0, уграђен ингрeс |
| `aks` | Сложени потребе за оркестрацију | Потпуна контрола Kubernetes-а кад вам је стварно потребна |
| `springapp` | Постојећа Azure Spring Apps окружења | Наслеђе; услуга се угаси 31. марта 2028 и није доступна новим корисницима |

### Када користити AKS

**Azure Kubernetes Service (`host: aks`)** пружа потпуну снагу Kubernetes-а — прилагођене контролере, сервисне мреже, сложену мрежу и детаљно заказивање. Та снага доноси оперативни терет: ви управљате чворовима, надоградњама и мрежом кластера.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Почните једноставније ако можете.** За већину микросервиса, **Container Apps** нуди контејнере, ауто-скалирање и скалирање на нулу без управљања кластером. AKS изаберите само ако вам требају Kubernetes-специфичне функције.

### Када користити Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** је управљано окружење изграђено за Spring Boot. Обезбеђује откривање услуга, config server, и blue-green објављивање тако да тимови за Јаву не морају сами да воде инфраструктуру.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Не бирајте Azure Spring Apps за нови почетнички пројекат: затворен је за нове кориснике и [угашће се 31. марта 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Преферирајте подржане алтернативе као што су Container Apps и планирајте миграцију постојећих окружења.

## 🗃️ Провизија базе података

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
**Претпоставке исека:** наведите `@secure() param databasePassword string` и користите снажну вредност. Изаберите јавни приступ **или** интегришите делегирани subnet/приватни DNS испод; ова два исечка се не повезују аутоматски.

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

Правило `0.0.0.0` дозвољава везе са Azure услугама изван ваше претплате. Није приватна мрежа; преферирајте ограничену мрежну архитектуру за стварне пословне оптерећења.

## 🔒 Безбедност и управљање тајнама

### Интеграција са Key Vault-ом
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

### Конфигурација Managed Identity
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

За системски додељен идентитет, не постављајте `AZURE_CLIENT_ID` на његов principal ID. Кориснички додељен идентитет користи свој **client ID**, а не object/principal ID. Референца Key Vault такође треба да има улогу апликације и мрежни приступ.

## 🌍 Мрежа и повезивање

### Конфигурација виртуелне мреже
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

### Application Gateway са SSL-ом
**Непотпуни архитектонски исечак, није објављив gateway:** додајте посебан `gateway-subnet` мрежи и backend групе, HTTP подешавања, слушаоце, рутирање са приоритетима и TLS сертификат (или овлашћену референцу ка Key Vault-у). Само отварање порта 443 не конфигурише HTTPS.

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

## 📊 Надгледање и посматрање

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

### Прилагођене метрике и аларми
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

## 🔧 Подешавања специфична за окружења

### Фајлови параметара за различита окружења
Испод су **алтернативни примери фајлова параметара**. azd аутоматски не бира `main.parameters.dev.json` или `main.parameters.prod.json` по имену окружења. Користите стварни `main.parameters.json` са заменама окружења (нпр. `${APP_SERVICE_SKU=B1}`), и декларишите/конзумирајте сваки параметар у Bicep.

Пример садржаја за `infra/main.parameters.dev.json`:

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

Пример садржаја за `infra/main.parameters.prod.json`:

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

### Условна провизија ресурса
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

## 🚀 Напредни обрасци провизије

### Мултирегионално објављивање
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

### Тестирање инфраструктуре
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Провизија инфраструктуре не објављује ваш апликациони код. Покрените провере апликације тек након `azd deploy`/`azd up`, и користите `/health` само ако ваша апликација то имплементира. ARM скрипте за објављивање креирају Azure ресурсе и захтевају додатне идентитете, подржане верзије окружења и дозволе; оне нису јединични тестови.

## 🧪 Преглед и Валидација инфраструктуре (НОВО)

### Прегледајте промене у инфраструктури пре објављивања

Функција `azd provision --preview` вам омогућава да **симулирате провизију инфраструктуре** пре него што ресурси буду стварно објављени. Слична је духу `terraform plan` или `bicep what-if`, пружајући вам **преглед празног трчања** какве би промене биле извршене у вашем Azure окружењу.

#### 🛠️ Шта ради
- **Анализира ваше IaC шаблоне** (Bicep или Terraform)
- **Приказује преглед промена ресурса**: додаци, брисања, ажурирања
- **Не примењује предложене промене провајдера** — прво прегледајте hooks пројекта; скрипте могу имати споредне ефекте и преглед и даље захтева Azure дозволе

#### Случајеви употребе
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Ова команда вам помаже да:
- **Валидирате промене инфраструктуре** пре комитовања ресурса
- **Уочите неправилности раније** у развојном циклусу
- **Сарадњу безбедно** у тимским окружењима
- **Обезбедите приступе са најмање привилегија** без изненађења

Посебно је корисно када:
- Радите са сложеним мултисервисним окружењима
- Правите промене у продукционој инфраструктури
- Валидирате измене шаблона пре одобрења PR-а
- Тренирате нове чланове тима о паттернима инфраструктуре

### Пример излаза прегледа
Тачан излаз прегледа варира у зависности од провајдера и структуре пројекта, али резултат би требало јасно да идентификује предложене промене пре извршења било чега.

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

## �🔄 Ажурирања и миграције ресурса

### Безбедна ажурирања ресурса
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

### Миграције база података
**Непотпуни образац скрипте за објављивање:** захтева конфигурисани кориснички идентитет где је потребно, подржану Azure CLI верзију, доступне алате за миграцију, достављену фасциклу/конфигурацију миграције и конективност са базом. Не извршава се само налепљивањем овог ресурса у шаблон.

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

## 🎯 Најбоље праксе

### 1. Конвенције именовања ресурса
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Стратегија означавања
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

### 3. Валидација параметара
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

### 4. Организација излаза
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

## Следећи кораци

- [Планирање пре објављивања](../chapter-06-pre-deployment/capacity-planning.md) - Валидирање расположивости ресурса
- [Уобичајени проблеми](../chapter-07-troubleshooting/common-issues.md) - Решавање проблема инфраструктуре
- [Водич за отклањање грешака](../chapter-07-troubleshooting/debugging.md) - Решавање проблема са провизионисањем
- [Избор СКУ](../chapter-06-pre-deployment/sku-selection.md) - Изаберите одговарајуће нивое услуга

## Додатни ресурси

- [Azure Bicep документација](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager шаблони](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Центар за архитектуру](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure оквир за добру архитектуру](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Навигација**
- **Претходна лекција**: [Водич за разврставање](deployment-guide.md)
- **Наредна лекција**: [Планирање капацитета](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->