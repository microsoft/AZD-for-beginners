# Azure išteklių teikimas su AZD

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 4 skyrius - infrastruktūra kaip kodas ir diegimas
- **⬅️ Ankstesnis**: [Diegimo vadovas](deployment-guide.md)
- **➡️ Kitas skyrius**: [5 skyrius: Daugiaagentės DI sprendimai](../../examples/retail-scenario.md)
- **🔧 Susiję**: [6 skyrius: Išankstinė diegimo patikra](../chapter-06-pre-deployment/capacity-planning.md)

## Įvadas

Šis išsamus vadovas apima viską, ką reikia žinoti apie Azure išteklių teikimą ir valdymą naudojant Azure Developer CLI. Išmoksite įgyvendinti Infrastructure as Code (IaC) modelius nuo paprasto išteklių kūrimo iki pažangių įmonės lygio infrastruktūros architektūrų naudojant Bicep, ARM šablonus, Terraform ir Pulumi.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Išmoksite Infrastructure as Code principų ir Azure išteklių teikimo
- Suprasite kelis IaC tiekėjus, kuriuos palaiko Azure Developer CLI
- Suprasite ir įgyvendinsite Bicep šablonus bendroms programų architektūroms
- Konfigūruosite išteklių parametrus, kintamuosius ir aplinkai specifinius nustatymus
- Įgyvendinsite pažangius infrastruktūros modelius, įskaitant tinklų ir saugumo sprendimus
- Valdysite išteklių gyvavimo ciklą, atnaujinimus ir priklausomybių sprendimą

## Mokymosi rezultatai

Baigę kursą galėsite:
- Projektuoti ir tiekti Azure infrastruktūrą naudojant Bicep ir ARM šablonus
- Konfigūruoti sudėtingas daugiapaslapių paslaugų architektūras su tinkamomis išteklių priklausomybėmis
- Įgyvendinti parametrizuotus šablonus kelioms aplinkoms ir konfigūracijoms
- Troubleshootinti (spręsti) infrastruktūros teikimo problemas ir išspręsti diegimo klaidas
- Taikyti Azure Well-Architected Framework principus infrastruktūros projektavime
- Valdyti infrastruktūros atnaujinimus ir įgyvendinti infrastruktūros versijavimo strategijas

## Infrastruktūros teikimo apžvalga

Azure Developer CLI palaiko kelis Infrastructure as Code (IaC) tiekėjus:
- **Bicep** (rekomenduojama) - Azure domenui skirta specializuota kalba
- **ARM Templates** - JSON pagrindu veikiantys Azure Resource Manager šablonai
- **Terraform** - įrankis kelių debesų (multi-cloud) infrastruktūrai
- **Pulumi** - modernesnis infrastruktūros kaip kodo požiūris su programavimo kalbomis

## Supratimas apie Azure išteklius

### Išteklų hierarchija
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Bendros Azure paslaugos programoms
- **Skaičiavimo paslaugos**: App Service, Container Apps, Functions, Virtual Machines
- **Saugykla**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Tinklų paslaugos**: Virtual Network, Application Gateway, CDN
- **Saugumas**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep infrastruktūros šablonai

### Pagrindinė Bicep šablono struktūra
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

### Išplėstiniai Bicep modeliai

#### Modulinė infrastruktūra
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

#### Sąlyginis išteklių kūrimas
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

## 🌐 Terraform naudojimas su azd

Bicep yra azd numatytasis pasirinkimas, tačiau azd taip pat palaiko **Terraform** — tai naudinga, jei jūsų komanda jau naudoja Terraform arba valdote kelių debesų infrastruktūrą. azd darbo eiga (`azd up`, `azd provision`, `azd down`) yra identiška; keičiasi tik infrastruktūros kalba ir aplanko struktūra.

### Nurodykite azd naudoti Terraform

Pridėkite `infra` skyrių į `azure.yaml`, nukreipiantį į Terraform tiekėją:

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

### Terraform katalogo struktūra

Naudojant Terraform tiekėją, jūsų `infra/` aplankas naudoja `.tf` failus vietoje Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Minimalus `main.tf`

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

### Kaip azd jungiasi prie jūsų Terraform išvesties

azd skaito Terraform **outputs**, kad sužinotų jūsų galinius taškus ir prijungtų aplinkos reikšmes atgal į jūsų programą. Išvesties pavadinimai yra svarbūs — azd ieško konkrečių:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Svarbu:** azd naudoja žymą `azd-env-name` ir `AZURE_*` išvestis, kad stebėtų išteklius pagal aplinką. Visada pažymėkite savo išteklių grupę su `"azd-env-name" = var.environment_name`, kad `azd down` galėtų rasti ir pašalinti viską.

### Diegimas su Terraform

Komandos yra tokios pačios kaip su Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd po gaubtu vykdo 'terraform plan'
azd up                    # paruošimas + diegimas
azd down --force          # naikina Terraform valdomus išteklius
```

> **Išankstinė sąlyga:** Terraform turi būti įdiegtas ir pasiekiamas jūsų `PATH`. azd valdo Terraform *workflow*, bet neįdiegia Terraform už jus. Būsenai azd pagal nutylėjimą naudoja vietinę būseną; komandai sukonfigūruokite nuotolinį backend'ą (pavyzdžiui, Azure Storage backend) faile `provider.tf`.

Pilnam, vykdomam Terraform pagrindu sukurtų pradmenų rinkiniui peržiūrėti peržiūrėkite [Awesome AZD galeriją](https://azure.github.io/awesome-azd/) ir filtruokite pagal Terraform, arba žr. oficialią [azd Terraform dokumentaciją](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Pulumi naudojimas su azd

Jei jūsų komanda rašo infrastruktūrą bendros paskirties kalba (TypeScript, Python, Go arba C#) vietoje DSL, azd taip pat palaiko **Pulumi**. Kaip ir su Terraform, `azd up` / `azd provision` / `azd down` darbo eiga nekeičiasi — keičiasi tik infrastruktūros įrankiai ir aplanko struktūra.

### Nurodykite azd naudoti Pulumi

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

### Pulumi katalogo struktūra

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Minimalus `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Priskirkite žymes visiems ištekliams, kad azd galėtų juos sekti ir pašalinti
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd perskaito šias išvestis ir įkelia jas į jūsų aplinką
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks atitinka azd aplinkas

Pulumi organizuoja diegimus į **stacks**, o azd susieja kiekvieną azd aplinką su tokio pat pavadinimo Pulumi staku. Kai paleidžiate `azd env new staging`, azd parenka (arba sukuria) `staging` Pulumi stack'ą. Ta pati `azd-env-name` žymėjimo ir `AZURE_*` išvesties taisyklė galioja, todėl `azd down` gali rasti ir pašalinti viską.

### Diegimas su Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd po gaubtu vykdo 'pulumi preview'
azd up                    # paruošimas + diegimas
azd down --force          # vykdo 'pulumi destroy'
```

> **Išankstinė sąlyga:** Pulumi turi būti įdiegtas ir pasiekiamas jūsų `PATH`, ir jums reikės būsenos backend'o (Pulumi Cloud arba savarankiškai valdomas backend'as, pavyzdžiui, Azure Blob Storage). azd valdo Pulumi *workflow*, bet ne diegimą. Žr. oficialią [azd Pulumi dokumentaciją](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Kur talpinti jūsų paslaugą

Laukas `host` faile `azure.yaml` nulemia, kur paleidžiama jūsų programa. azd palaiko kelis host'us — teisingo pasirinkimo svarba dažnai didesnė už infrastruktūros kalbos pasirinkimą. Štai palyginimas pradedantiesiems:

| `host` value | Tinka | Kodėl |
|--------------|----------|-----|
| `appservice` | Tradicinėms žiniatinklio programoms ir API | Paprasčiausias PaaS; nereikia konteinerių |
| `staticwebapp` | Priekinės dalies SPA (React, Vue, Angular) | Globalus CDN + nemokamas SSL, įmontuota API palaikymas |
| `function` | Įvykių valdomoms ir serverless apkrovoms | Masto iki nulio, mokama už vykdymą |
| `containerapp` | Konteinerizuoti mikroservisai | Serverless konteineriai, masto iki nulio, įmontuotas įėjimas |
| `aks` | Sudėtingiems orkestracijos poreikiams | Pilna Kubernetes kontrolė, kai jos tikrai reikia |
| `springapp` | Java Spring Boot programoms | Valdomas Azure Spring Apps vykdymo laikas, pritaikytas Spring |

### Kada rinktis AKS

**Azure Kubernetes Service (`host: aks`)** suteikia pilną Kubernetes galingumą — pasirinktinius valdiklius, paslaugų tinklus (service meshes), sudėtingą tinklo valdymą ir smulkų planavimą. Ši galia ateina su operaciniu papildomu darbu: jūs valdote mazgų baseinus, atnaujinimus ir klasterio tinklą.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Pradėkite paprasčiau, jei galite.** Daugumai mikroservisų **Container Apps** suteikia konteinerius, automatinį mastelį ir mastelį iki nulio be klasterio valdymo. Rinkitės AKS tik tada, kai jums reikia Kubernetes specifinių funkcijų.

### Kada naudoti Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** yra valdomas vykdymo laikas, sukurtas specialiai Spring Boot. Jis tvarko service discovery, config server ir blue-green diegimus, todėl Java komandoms nereikia valdyti savo infrastruktūros.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Naudokite `springapp`, kai turite esamas Spring Boot programas ir norite vykdymo laiko, pritaikyto joms. Naujiems konteinerizuotiems Java programoms be Spring specifinių poreikių dažnai paprasčiau rinktis `containerapp`.

## 🗃️ Duomenų bazių teikimas

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

## 🔒 Saugumas ir slaptųjų duomenų valdymas

### Key Vault integracija
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

### Valdomos tapatybės konfigūracija
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

## 🌍 Tinklų ir ryšio nustatymai

### Virtual Network konfigūracija
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

### Application Gateway su SSL
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

## 📊 Stebėjimas ir matomumas

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

### Individualūs metrikai ir įspėjimai
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

## 🔧 Aplinkai specifinės konfigūracijos

### Parametrų failai skirtingoms aplinkoms
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

### Sąlyginis išteklių teikimas
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

## 🚀 Išplėstiniai teikimo modeliai

### Daugiavietis diegimas
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

### Infrastruktūros testavimas
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

## 🧪 Infrastruktūros peržiūra ir validacija (NAUJA)

### Peržiūrėkite infrastruktūros pakeitimus prieš diegimą

Savybė `azd provision --preview` leidžia jums **simuliuoti infrastruktūros teikimą** prieš iš tikrųjų diegiant išteklius. Tai panašu į `terraform plan` arba `bicep what-if`, suteikiant **dry-run** vaizdą apie tai, kokie pakeitimai būtų atlikti jūsų Azure aplinkoje.

#### 🛠️ Ką tai daro
- **Analizuoja jūsų IaC šablonus** (Bicep arba Terraform)
- **Rodo išteklių pakeitimų peržiūrą**: pridėjimai, šalinimai, atnaujinimai
- **Nevykdo pakeitimų** — tai tik skaitymo režimas ir saugu vykdyti

#### Panaudojimo atvejai
```bash
# Peržiūrėti infrastruktūros pakeitimus prieš diegimą
azd provision --preview

# Peržiūra konkrečiai aplinkai
azd provision --preview -e production
```

Ši komanda padeda jums:
- **Patikrinti infrastruktūros pakeitimus** prieš diegiant resursus
- **Aptikti klaidingas konfigūracijas anksti** plėtros cikle
- **Saugiai bendradarbiauti** komandų aplinkose
- **Užtikrinti mažiausių privilegijų diegimus** be staigmenų

Ypač naudinga, kai:
- Dirbate su sudėtingomis daugiapaslapių paslaugų aplinkomis
- Atliekate pakeitimus gamybos infrastruktūroje
- Patvirtinate šablono pakeitimus prieš PR patvirtinimą
- Mokote naujus komandos narius infrastruktūros modelių

### Pavyzdinė peržiūros išvestis
Tikroji peržiūros išvestis skirsis priklausomai nuo tiekėjo ir projekto struktūros, bet rezultatas turėtų aiškiai parodyti siūlomus pakeitimus prieš pradedant bet ką taikyti.

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

## �🔄 Resursų atnaujinimai ir migracijos

### Saugių išteklių atnaujinimai
```bash
# Pirmiausia peržiūrėkite infrastruktūros pakeitimus (REKOMENDUOJAMA)
azd provision --preview

# Taikykite pakeitimus po peržiūros patvirtinimo
azd provision --confirm-with-no-prompt

# Rollback atveju naudokite Git, kad atšauktumėte infrastruktūros pakeitimus:
git revert HEAD  # Atšaukti paskutinį infrastruktūros commit'ą
azd provision    # Taikyti ankstesnę infrastruktūros būseną
```

### Duomenų bazių migracijos
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

## 🎯 Geriausios praktikos

### 1. Išteklių pavadinimų konvencijos
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Žymėjimo strategija
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

### 3. Parametrų validacija
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

### 4. Išvesties organizavimas
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

## Tolimesni žingsniai

- [Išankstinis diegimo planavimas](../chapter-06-pre-deployment/capacity-planning.md) - Patikrinkite išteklių prieinamumą
- [Dažnos problemos](../chapter-07-troubleshooting/common-issues.md) - Išspręskite infrastruktūros problemas
- [Debug vadovas](../chapter-07-troubleshooting/debugging.md) - Debug'inimo gairės diegimo problemoms
- [SKU pasirinkimas](../chapter-06-pre-deployment/sku-selection.md) - Pasirinkite tinkamus paslaugų lygius

## Papildomi ištekliai

- [Azure Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager šablonai](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Naršymas**
- **Ankstesnė pamoka**: [Diegimo vadovas](deployment-guide.md)
- **Kita pamoka**: [Išankstinis diegimo planavimas](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->