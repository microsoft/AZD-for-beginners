# Провизионисање Azure ресурса помоћу AZD

**Навигација по поглављима:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 4 - Инфраструктура као код и распоређивање
- **⬅️ Претходно**: [Водич за распоређивање](deployment-guide.md)
- **➡️ Наредно поглавље**: [Поглавље 5: Мулти-агентска АИ решења](../../examples/retail-scenario.md)
- **🔧 Повезано**: [Поглавље 6: Валидација пре распоређивања](../chapter-06-pre-deployment/capacity-planning.md)

## Увод

Овај свеобухватни водич обухвата све што вам треба да знате о провизионисању и управљању Azure ресурсима помоћу Azure Developer CLI. Научите како да имплементирате обрасце Инфраструктуре као кода (IaC) од основног креирања ресурса до напредних инфраструктонских архитеκтура предузећа користећи Bicep, ARM шаблоне, Terraform и Pulumi.

## Циљеви учења

Након завршетка овог водича, ви ћете:
- Усвојити принципе Инфраструктуре као кода и провизионисање Azure ресурса
- Разумети више IaC провајдера који су подржани од стране Azure Developer CLI
- Дизајнирати и имплементирати Bicep шаблоне за уобичајене архитектуре апликација
- Конфигурисати параметре ресурса, променљиве и подешавања специфична за окружење
- Имплементирати напредне инфраструктонске обрасце укључујући мрежу и безбедност
- Управљати животним циклом ресурса, ажурирањима и решавањем зависности

## Очекивани резултати учења

После завршетка, моћи ћете да:
- Дизајнирате и провизионишете Azure инфраструктуру користећи Bicep и ARM шаблоне
- Конфигуришете сложене мултисервисне архитектуре са правилним зависностима ресурса
- Имплементирате параметризоване шаблоне за више окружења и конфигурација
- Решавате проблеме при провизионисању инфраструктуре и отклањате неуспехе распоређивања
- Примените принципе Azure Well-Architected Framework на дизајн инфраструктуре
- Управљате ажурирањима инфраструктуре и имплементирате стратегије верзионисања инфраструктуре

## Преглед провизионисања инфраструктуре

Azure Developer CLI подржава више провајдера Инфраструктуре као кода (IaC):
- **Bicep** (препоручено) - Azure-ов домен-специфични језик
- **ARM Templates** - JSON-based Azure Resource Manager шаблони
- **Terraform** - Мулти-клауд алат за инфраструктуру
- **Pulumi** - Модерна инфраструктура као код са програмским језицима

## Разумевање Azure ресурса

### Хијерархија ресурса
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Уобичајене Azure услуге за апликације
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep инфраструктонски шаблони

### Основна структура Bicep шаблона
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

### Напредни Bicep шаблони

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

## 🌐 Коришћење Terraform-а са azd

Bicep је подразумевани избор у azd, али azd такође подржава **Terraform**—корисно ако ваш тим већ то стандардује или управљате мулти-клауд инфраструктуром. azd радни токови (`azd up`, `azd provision`, `azd down`) су идентични; само се језик инфраструктуре и распоред фасцикли мењају.

### Реците azd да користи Terraform

Додајте `infra` секцију у `azure.yaml` која показује на Terraform провајдер:

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

### Terraform распоред фасцикле

Са Terraform провајдером, ваша `infra/` фасцикла користи `.tf` датотеке уместо Bicep-а:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Минималан `main.tf`

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

### Како azd повезује ваше Terraform излазе

azd чита Terraform **излазне параметре** да би сазнао ваше крајње тачке и да би вратио вредности окружења назад у вашу апликацију. Имена излаза су важна—azd тражи одређена имена:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Важно:** azd користи `azd-env-name` таг и `AZURE_*` излазне параметре да прати ресурсе по окружењу. Увек означите групу ресурса са `"azd-env-name" = var.environment_name` како би `azd down` могао да пронађе и уклони све.

### Деплој са Terraform-ом

Команде су у потпуности исте као за Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd покреће 'terraform plan' у позадини
azd up                    # постављање + размештање
azd down --force          # уништава ресурсе којима управља Terraform
```

> **Предуслов:** Terraform мора бити инсталиран и на вашем `PATH`-у. azd управља Terraform *радним током*, али не инсталира Terraform за вас. За стање, azd подразумевано користи локално стање; за тимове, конфигуришите удаљени бекенд (на пример, Azure Storage бекенд) у `provider.tf`.

За потпуне, покретачке пројекте засноване на Terraform-у, прегледајте [Одличну AZD галерију](https://azure.github.io/awesome-azd/) и филтрирајте за Terraform, или погледајте званичну [azd Terraform документацију](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Коришћење Pulumi-а са azd

Ако ваш тим пише инфраструктуру у општенаменском језику (TypeScript, Python, Go или C#) уместо DSL-а, azd такође подржава **Pulumi**. Као и са Terraform-ом, `azd up` / `azd provision` / `azd down` радни ток је непромењен—само се разликује алат за инфраструктуру и распоред фасцикли.

### Реците azd да користи Pulumi

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

### Pulumi распоред фасцикле

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Минималан `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Означите сваки ресурс тако да azd може да их прати и очисти
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd учитава ове излазе назад у ваше окружење
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks се мапирају на azd окружења

Pulumi организује распоређивања у **стекове**, а azd мапира свако azd окружење на Pulumi стек истог имена. Када покренете `azd env new staging`, azd бира (или креира) `staging` Pulumi стек. Иста `azd-env-name` означавање и правила `AZURE_*` излазних параметара важе, тако да `azd down` може да пронађе и уклони све.

### Деплој са Pulumi-јем

```bash
azd auth login
azd env new dev
azd provision --preview   # azd покреће 'pulumi preview' у позадини
azd up                    # обезбеђивање + распоређивање
azd down --force          # покреће 'pulumi destroy'
```

> **Предуслов:** Pulumi мора бити инсталиран и на вашем `PATH`-у, и биће вам потребан бекенд за стање (Pulumi Cloud или самоуправљани бекенд као Azure Blob Storage). azd управља Pulumi *радним током*, не инсталацијом. Погледајте званичну [azd Pulumi документацију](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Изаберите хост за вашу услугу

Поље `host` у `azure.yaml` одлучује где се ваш код извршава. azd подржава неколико хостова—избор правог је важнији од језика инфраструктуре. Ево упоредбе прилагођене почетницима:

| `host` value | Најбоље за | Зашто |
|--------------|------------|-----|
| `appservice` | Традиционалне веб апликације и API-ји | Најједноставнији PaaS; није потребно користити контејнере |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | Глобални CDN + бесплатан SSL, уграђена подршка за API-је |
| `function` | Догађајно-вођени и безсерверски радни задаци | Скалирање до нуле, плаћање по извршењу |
| `containerapp` | Микросервисе у контејнерима | Безсерверски контејнери, скалирање до нуле, уграђени ингрес |
| `aks` | Захтеви за сложену оркестрацију | Потпуна контролa над Kubernetes-ом када вам заиста треба |
| `springapp` | Java Spring Boot апликације | Мењанирано Azure Spring Apps окружење прилагођено за Spring |

### Када треба изабрати AKS

**Azure Kubernetes Service (`host: aks`)** даје вам пуну моћ Kubernetes-а—прилагођене контролере, сервисне мреже, сложено мрежно повезивање и фино-нозно планирање. Та моћ долази са оперативним оптерећењем: ви управљате нодовима, надоградњама и мрежом кластера.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Почните једноставније ако можете.** За већину микросервиса, **Container Apps** пружа контејнере, аутоскалирање и скалирање до нуле без управљања кластером. Изаберите AKS само када вам заиста требaju Kubernetes-специфичне функције.

### Када користити Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** је менаџисано окружење посебно направљено за Spring Boot. Обрађује сервис-дискаверy, config сервер и blue-green деплојмент тако да Java тимови не морају да управљају сопственом инфраструктуром.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Користите `springapp` када већ имате постојеће Spring Boot апликације и желите окружење прилагођено за њих. За нове Java апликације у контејнерима без специфичних потреба за Spring-ом, `containerapp` је често једноставнији избор.

## 🗃️ Провизионисање база података

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

## 🔒 Безбедност и управљање тајнама

### Интеграција Key Vault-а
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
          name: 'AZURE_CLIENT_ID'
          value: webApp.identity.principalId
        }
      ]
    }
  }
}
```

## 🌍 Мрежа и повезивост

### Конфигурација Virtual Network-а
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

## 📊 Надгледање и опсервабилност

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

## 🔧 Конфигурације специфичне за окружење

### Фајлови параметара за различита окружења
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

### Условно провизионисање ресурса
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

## 🚀 Напредни обрасци провизионисања

### Распоређивање у више региона
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

## 🧪 Преглед и валидација инфраструктуре (НОВО)

### Преглед измена инфраструктуре пре распоређивања

Функција `azd provision --preview` вам омогућава да **симулирате провизионисање инфраструктуре** пре него што стварно распоредите ресурсе. То је слично духу `terraform plan` или `bicep what-if`, пружајући вам **dry-run преглед** које измене би биле направљене у вашем Azure окружењу.

#### 🛠️ Шта то ради
- **Анализира ваше IaC шаблоне** (Bicep или Terraform)
- **Приказује преглед измена ресурса**: додавања, брисања, ажурирања
- **Не примењује измене** — само за читање и безбедно је покренути

#### Случајеви употребе
```bash
# Преглед промена инфраструктуре пре распоређивања
azd provision --preview

# Преглед за одређено окружење
azd provision --preview -e production
```

Ова команда вам помаже да:
- **Потврдите измене инфраструктуре** пре него што примените ресурсе
- **Откријете погрешне конфигурације у раној фази** развоја
- **Сигурно сарађујете** у тимским окружењима
- **Осигурате минимална права при распоређивању** без изненађења

Посебно је корисно када:
- Радите са сложеним мултисервисним окружењима
- Правите измене у продукцијској инфраструктури
- Верификујете измене у шаблонима пре одобрења PR-а
- Употребљавате га за обучавање нових чланова тима о инфраструктурним обрасцима

### Пример излаза прегледа
Тачан излаз прегледа варира у зависности од провајдера и структуре пројекта, али резултат би требало јасно да идентификује предложене измене пре него што се било шта примени.

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

## �🔄 Ажурирања ресурса и миграције

### Безбедна ажурирања ресурса
```bash
# Прво прегледајте измене инфраструктуре (ПРЕПОРУЧЕНО)
azd provision --preview

# Примените измене након потврде прегледа
azd provision --confirm-with-no-prompt

# За враћање користите Git да поништите измене инфраструктуре:
git revert HEAD  # Поништите последњи комит инфраструктуре
azd provision    # Примените претходно стање инфраструктуре
```

### Миграције базе података
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

## 🎯 Најбоље праксе

### 1. Конвенције именовања ресурса
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Стратегија таговања
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

- [Планирање пре распоређивања](../chapter-06-pre-deployment/capacity-planning.md) - Потврдите доступност ресурса
- [Чести проблеми](../chapter-07-troubleshooting/common-issues.md) - Решавање проблема инфраструктуре
- [Водич за дебаговање](../chapter-07-troubleshooting/debugging.md) - Дебаговање проблема провизионисања
- [Одабир SKU-а](../chapter-06-pre-deployment/sku-selection.md) - Одаберите одговарајуће нивое услуга

## Додатни ресурси

- [Документација за Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Шаблони Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Центар за архитектуру](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Оквир добре архитектуре](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Навигација**
- **Претходна лекција**: [Водич за распоређивање](deployment-guide.md)
- **Наредна лекција**: [Планирање капацитета](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->