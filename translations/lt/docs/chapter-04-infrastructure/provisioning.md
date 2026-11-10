# Azure išteklių tiekimas naudojant AZD

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 4 skyrius - Infrastruktūra kaip kodas ir diegimas
- **⬅️ Ankstesnis**: [Diegimo vadovas](deployment-guide.md)
- **➡️ Kitas skyrius**: [5 skyrius: Daugelio agentų DI sprendimai](../../examples/retail-scenario.md)
- **🔧 Susiję**: [6 skyrius: Išankstinė diegimo patikra](../chapter-06-pre-deployment/capacity-planning.md)

## Įvadas

Šiame vadove aprašomas Azure išteklių tiekimas ir valdymas naudojant Azure Developer CLI su įtaisytomis Bicep ir Terraform tiekėjų priemonėmis.

> Peržiūrėta pagal `azd 1.37.2` (2026 m. lapkritis). Nebent nurodyta kitaip, Bicep, Terraform ir scenarijų pavyzdžiai yra **iliustracinės dalys**, o ne pilnas šablonas. Sujunkite juos į projektą, kuris teikia nurodytus parametrus, modulius, tapatybes, tinklą ir programos kodą. Azure tiekimas šioje peržiūroje nebuvo vykdomas.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite Infrastruktūros kaip kodo principus ir Azure išteklių tiekimą
- Suprasite kelis IaC tiekėjus, kuriuos palaiko Azure Developer CLI
- Sukursite ir įgyvendinsite Bicep šablonus įprastoms programų architektūroms
- Sugebėsite konfigūruoti išteklių parametrus, kintamuosius ir aplinkai būdingus nustatymus
- Įgyvendinsite pažangius infrastruktūros modelius, įskaitant tinklą ir saugumą
- Valdysite išteklių gyvavimo ciklą, atnaujinimus ir priklausomybių sprendimą

## Mokymosi rezultatai

Baigę kursą galėsite:
- Kurti ir tiekti Azure infrastruktūrą naudojant Bicep ir ARM šablonus
- Konfigūruoti sudėtingas daugiapaskirties architektūras su tinkamomis išteklių priklausomybėmis
- Įgyvendinti parametrizuotus šablonus skirtingoms aplinkoms ir konfigūracijoms
- Spręsti infrastruktūros tiekimo problemas ir pašalinti diegimo klaidas
- Taikyti Azure gerai suprojektuotos infrastruktūros rėmų principus
- Valdyti infrastruktūros atnaujinimus ir įgyvendinti infrastruktūros versijų valdymo strategijas

## Infrastruktūros tiekimo apžvalga

Azure Developer CLI palaiko kelis Infrastruktūros kaip Kodo (IaC) tiekėjus:
- **Bicep** (rekomenduojama) – Azure domenui būdinga kalba
- **ARM šablonai** – Bicep konvertuojamas į ARM; grynas ARM JSON nėra atskiras įtaisytas `infra.provider`
- **Terraform** – daugialypės debesijos infrastruktūros įrankis
- **Priedų tiekėjai** – reikalauja atskiro tiekėjo priedo įdiegimo ir jo dokumentuotos konfigūracijos; ne visų tiekėjų eilutės palaikomos

## Azure išteklių supratimas

### Išteklių hierarchija
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Įprastos Azure paslaugos programoms
- **Skaičiavimas**: Programų paslauga, Konteinerių programos, Funkcijos, Virtualios mašinos
- **Saugojimas**: Saugyklos paskyra, Cosmos DB, SQL duomenų bazė, PostgreSQL
- **Tinklai**: Virtualus tinklas, Programų vartai, CDN
- **Saugumas**: Raktų saugykla, Programų įžvalgos, Žurnalų analizė
- **DI/ML**: Azure DI paslaugos, Azure OpenAI, Azure mašininis mokymasis

## Bicep infrastruktūros šablonai

### Bazinė Bicep šablono struktūra
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

Pilnam azd projektui iškvieskite šį modulį iš prenumeratos lygmens `infra/main.bicep`, kuris sukuria pažymėtą išteklių grupę ir perduoda jos sritį. Suderinkite `environmentName`/`location` su `main.parameters.json`. Žyma `azd-service-name: web` susieja išteklius su `services.web`; vien eilutės išvesties pavadinimai nepateikia paslaugų atradimo.

### Pažangūs Bicep modeliai

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

Bicep yra azd numatytasis, bet azd taip pat palaiko **Terraform** – naudingą, jei jūsų komanda jau standartizuoja jį arba valdote daugiasluoksnę infrastruktūrą. azd darbo eiga (`azd up`, `azd provision`, `azd down`) yra identiška; keičiasi tik infrastruktūros kalba ir aplanko išdėstymas.

### Nurodykite azd naudoti Terraform

Pridėkite `infra` skirsnį į `azure.yaml`, nukreipiantį į Terraform tiekėją:

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

### Terraform aplanko struktūra

Naudojant Terraform tiekėją, jūsų `infra/` aplankas naudoja `.tf` failus vietoje Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### `main.tf` fragmentas

Tai sukuria tik išteklių grupę ir planą, o ne diegiamą paslaugą. Taip pat turite deklaruoti įvesties kintamuosius, suderinamą `azurerm` tiekėją, žiniatinklio programą ir jos paslaugų žymą/išteklių pavadinimo atitikimą.

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

azd įkelia Terraform **išvestis** į aplinkos reikšmes. Šis fragmentas daro prielaidą, kad apibrėžėte `azurerm_linux_web_app.web`; paslaugų atradimas vis dar reikalauja atitinkančio išteklių pavadinimo arba `azd-service-name` žymos:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Svarbu:** azd naudoja `azd-env-name` žymą ir `AZURE_*` išvestis, kad sektų išteklius pagal aplinką. Visada žymėkite savo išteklių grupę su `"azd-env-name" = var.environment_name`, kad `azd down` galėtų rasti ir pašalinti viską.

### Diegimas su Terraform

Komandos yra visiškai tokios pačios kaip Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Prieš sąlyga:** Terraform turi būti įdiegtas ir prieinamas jūsų `PATH`. azd valdo Terraform *darbo eigą*, bet neinstaliuoja Terraform už jus. Būsenos atžvilgiu azd numatyta naudoti vietinę būseną; komandoms sukonfigūruokite nuotolinį backend (pvz., Azure saugyklos backend) `provider.tf`.

Norėdami rasti pilnus, veikiamus Terraform pagrindu veikiančius pradmenis, peržiūrėkite [Awesome AZD galeriją](https://azure.github.io/awesome-azd/) ir filtruokite pagal Terraform arba žiūrėkite oficialią [azd Terraform dokumentaciją](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Kitos infrastruktūros priemonės

Pulumi nėra įtrauktas į azd 1.37.2 tiekėjų paketą. Vien tik `infra.provider: pulumi` nustatymas nesukuria veikiančios integracijos, o `azd env new` automatiškai nesukuria ar nepasirenka Pulumi krūvos. Jei naudojate kitą IaC įrankį, laikykitės patikrinto tiekėjo priedo dokumentacijos arba valdykite jo gyvavimo ciklą savo darbo eigoje. Šis kursas nepateikia ir nepatvirtina Pulumi tiekėjo.

## 🎯 Paslaugos talpinimo pasirinkimas

Laukas `host` faile `azure.yaml` nustato, kur vykdoma jūsų programa. azd palaiko kelias talpinimo galimybes – tinkamas pasirinkimas svarbiau nei infrastruktūros kalba. Štai pradžiai draugiškas palyginimas:

| `host` reikšmė | Geriausia | Kodėl |
|--------------|----------|-----|
| `appservice` | Tradicinės interneto programos ir API | Paprasčiausias PaaS; konteineriai nereikalingi |
| `staticwebapp` | Priekinės dalies SPA (React, Vue, Angular) | Visuotinis CDN + nemokamas SSL, įtaisytas API palaikymas |
| `function` | Įvykių valdomos ir be serverio darbo apkrovos | Automatiškai keičiamas mastelis iki nulio, mokėjimas pagal vykdymą |
| `containerapp` | Konteinerizuotos mikroservisės | Be serverio konteineriai, mastelio keitimas iki nulio, įtatytas įėjimas |
| `aks` | Sudėtingas orkestras | Pilnas Kubernetes valdymas, kai tikrai reikia |
| `springapp` | Esami Azure Spring Apps diegimai | Senstelėjęs tikslas; paslauga nutraukiama 2028 m. kovo 31 d. ir uždaryta naujiems klientams |

### Kada pasirinkti AKS

**Azure Kubernetes Service (`host: aks`)** suteikia jums pilną Kubernetes galimybes – pritaikytus valdiklius, paslaugų tinklus, sudėtingą tinklą ir smulkų planavimą. Ši galia turi ir valdymo kaštų: jūs valdote mazgų rinkinius, atnaujinimus ir klasterio tinklą.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Pradėkite paprasčiau, jei galite.** Daugelio mikroservisių atveju **Konteinerių programos** suteikia konteinerius, automatinį mastelio keitimą ir mastelį iki nulio be klasterio valdymo. AKS rinkitės tik tada, kai reikia Kubernetes specifinių savybių.

### Kada naudoti Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** yra valdomas vykdymo laikotarpis, skirtas Spring Boot. Jis tvarko paslaugų atradimą, konfigūracijos serverį ir mėlynos-žalios diegimą, tad Java komandos neturi valdyti savo infrastruktūros.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Nesirinkite Azure Spring Apps naujam pradedantiesiems projektui: jis uždarytas naujiems klientams ir [nutraukiamas 2028 m. kovo 31 d.](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Rinkitės palaikomus alternatyvas, pvz., Konteinerių programas, ir planuokite migraciją esamiems diegimams.

## 🗃️ Duomenų bazės tiekimas

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
**Fragmneto reikalavimai:** deklaruokite `@secure() param databasePassword string` ir naudokite stiprią pateiktą reikšmę. Pasirinkite viešą prieigą **arba** integruokite toliau pateiktą deleguotą potinklį/privatų DNS; šie du fragmentai savarankiškai neprijungia vienas kito.

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

Taisyklė `0.0.0.0` leidžia prisijungimus iš Azure paslaugų už jūsų prenumeratos ribų. Tai nėra privatus tinklas; realioms apkrovoms geriau naudoti ribotą tinklo dizainą.

## 🔒 Saugumas ir paslapčių valdymas

### Raktų saugyklos integracija
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

### Tvarkomų tapatybių konfigūracija
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

Sistemos priskirtoje tapatybėje nenustatykite `AZURE_CLIENT_ID` reiškinio tapatybės ID. Vartotojo priskirta tapatybė naudoja savo **kliento ID**, o ne objekto/tapatybės ID. Raktų saugyklos nuoroda taip pat reikalauja programos tapatybės saugyklos vaidmens priskyrimo ir tinklo prieigos.

## 🌍 Tinklų ir ryšių konfigūracija

### Virtualaus tinklo konfigūracija
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

### Programų vartai su SSL
**Neužbaigtas architektūros fragmentas, ne diegiamas vartai:** pridėkite specialų `gateway-subnet` į VNet kartu su galinio plano saugyklomis, HTTP nustatymais, klausytojais, maršrutų taisyklėmis su prioritetais ir TLS sertifikatu (arba autorizuota Raktų saugyklos nuoroda). Vien tik atidarius prievadą 443 nepavyksta sukonfigūruoti HTTPS.

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

## 📊 Stebėsena ir stebėjimo priemonės

### Programų įžvalgos
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

### Nestandartiniai rodikliai ir įspėjimai
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

## 🔧 Aplinkai būdinga konfigūracija

### Parametrų failai skirtingoms aplinkoms
Žemiau pateikti du failai yra **alternatyvūs parametrų failų pavyzdžiai**. azd automatiškai nepasirenka `main.parameters.dev.json` ar `main.parameters.prod.json` pagal aplinkos pavadinimą. Naudokite tikrąjį `main.parameters.json` su aplinkos keitimais (pvz., `${APP_SERVICE_SKU=B1}`) ir deklaruokite bei naudokite kiekvieną parametrą Bicep.

Pvz., `infra/main.parameters.dev.json` turinys:

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

Pvz., `infra/main.parameters.prod.json` turinys:

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

### Sąlyginis išteklių tiekimas
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

## 🚀 Pažangūs tiekimo modeliai

### Daugiariaidenis diegimas
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
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Infrastruktūros tiekimas nediegia jūsų programos kodo. Vykdykite programos tikrinimus tik po `azd deploy`/`azd up` ir naudokite `/health` tik jei jūsų programa jį įgyvendina. ARM diegimo scenarijai sukuria Azure išteklius ir reikalauja papildomos tapatybės, palaikomų vykdymo laikų versijų ir leidimų; tai nėra vietiniai vienetiniai testai.

## 🧪 Infrastruktūros peržiūra ir patvirtinimas (NAUJA)

### Peržiūrėkite infrastruktūros pakeitimus prieš diegimą

Funkcija `azd provision --preview` leidžia jums **simuliuoti infrastruktūros tiekimą** prieš iš tikrųjų diegiant išteklius. Tai panašu į `terraform plan` ar `bicep what-if`, suteikiant jums **sausos veiklos peržiūrą** apie tai, kokie pakeitimai būtų padaryti jūsų Azure aplinkoje.

#### 🛠️ Ką tai daro
- **Analizuoja jūsų IaC šablonus** (Bicep arba Terraform)
- **Rodo išteklių pakeitimų peržiūrą**: pridėjimus, pašalinimus, atnaujinimus
- **Nepanaudoja tiekėjo pasiūlytų infrastruktūros pakeitimų** — pirmiausia patikrinkite projekto kabliukus; scenarijai gali turėti šalutinių poveikių, o peržiūra vis tiek reikalauja Azure leidimų

#### Naudojimo atvejai
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Ši komanda padeda jums:
- **Patikrinti infrastruktūros pakeitimus** prieš pridedant išteklius
- **Anksti aptikti neteisingas konfigūracijas** kūrimo ciklo metu
- **Saugiai bendradarbiauti** komandinėje aplinkoje
- **Užtikrinti mažiausių leidimų diegimą** be netikėtumų

Tai ypač naudinga, kai:
- Dirbate su sudėtingomis daugiapaskirties aplinkomis
- Darote pakeitimus gamybos infrastruktūrai
- Patvirtinate šablonų pakeitimus prieš PR patvirtinimą
- Mokote naujus komandos narius infrastruktūros modelių

### Peržiūros išvesties pavyzdys
Tiksli peržiūros išvestis skiriasi pagal tiekėją ir projekto struktūrą, tačiau rezultatas aiškiai parodo siūlomus pakeitimus prieš ką nors taikant.

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

## 🔄 Išteklių atnaujinimai ir migracijos

### Saugūs išteklių atnaujinimai
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

### Duomenų bazių migracijos
**Neužbaigtas diegimo scenarijaus modelis:** reikia konfigūruotos vartotojo priskirtos tapatybės, palaikomų Azure CLI vykdymo laikų, prieinamų migracijos įrankių, pateikto migracijos katalogo/konfigūracijos ir duomenų bazės ryšio. Negalima tiesiog įklijuoti šio ištekliaus į šabloną ir vykdyti.

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

## 🎯 Geriausios praktikos

### 1. Išteklių pavadinimų konvencijos
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Žymėjimo strategija
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

### 3. Parametrų patikra
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

- [Išankstinis planavimas](../chapter-06-pre-deployment/capacity-planning.md) – patikrinti išteklių prieinamumą
- [Dažnos klaidos](../chapter-07-troubleshooting/common-issues.md) – spręsti infrastruktūros problemas
- [Klaidų šalinimo vadovas](../chapter-07-troubleshooting/debugging.md) - Derinimas diegimo problemų
- [SKU pasirinkimas](../chapter-06-pre-deployment/sku-selection.md) - Pasirinkite tinkamus paslaugų lygius

## Papildomi ištekliai

- [Azure Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager šablonai](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure gerai projektuotas karkasas](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigacija**
- **Ankstesnė pamoka**: [Įdiegimo vadovas](deployment-guide.md)
- **Kita pamoka**: [Talpos planavimas](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->