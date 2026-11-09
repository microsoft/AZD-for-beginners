# Upravljanje Azure virov z AZD

**Navigacija poglavij:**
- **📚 Domov tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 4 - Infrastruktura kot koda in uvajanje
- **⬅️ Prejšnje**: [Vodnik za uvajanje](deployment-guide.md)
- **➡️ Naslednje poglavje**: [Poglavje 5: Večagentne rešitve AI](../../examples/retail-scenario.md)
- **🔧 Sorodno**: [Poglavje 6: Pre-uvajalna validacija](../chapter-06-pre-deployment/capacity-planning.md)

## Uvod

Ta vodič pokriva upravljanje in zagotavljanje Azure virov z uporabo Azure Developer CLI z vgrajenimi Bicep in Terraform ponudniki.

> Pregledano glede na `azd 1.37.2` (november 2026). Če ni drugače navedeno, so primeri Bicep, Terraform in skript **ilustrativni fragmenti**, ne popolna predloga. Združite jih v projekt, ki zagotavlja omenjene parametre, module, identitete, omrežje in kodo aplikacije. Azure zagotavljanje ni bilo izvedeno pri tem pregledu.

## Cilji učenja

Ob zaključku tega vodiča boste:
- Obvladali principe infrastrukture kot kode in zagotavljanje Azure virov
- Razumeli več ponudnikov IaC, ki jih podpira Azure Developer CLI
- Oblikovali in implementirali Bicep predloge za običajne arhitekture aplikacij
- Konfigurirali parametre virov, spremenljivke in nastavitve specifične za okolje
- Uvedli napredne infrastrukturne vzorce, vključno z omrežjem in varnostjo
- Upravljali življenjski cikel virov, posodobitve in reševanje odvisnosti

## Rezultati učenja

Po zaključku boste sposobni:
- Oblikovati in zagotoviti Azure infrastrukturo z uporabo Bicep in ARM predlog
- Konfigurirati kompleksne večstoritevne arhitekture z ustreznimi odvisnostmi virov
- Izvajati parametrijske predloge za različna okolja in konfiguracije
- Odpravljati težave pri zagotavljanju infrastrukture in reševati neuspehe uvajanja
- Uporabljati načela Azure Well-Architected Framework pri oblikovanju infrastrukture
- Upravljati posodobitve infrastrukture in izvajati strategije verzioniranja infrastrukture

## Pregled zagotavljanja infrastrukture

Azure Developer CLI podpira več ponudnikov infrastrukture kot kode (IaC):
- **Bicep** (priporočeno) - Azure-jezik specifičen za domeno
- **ARM predloge** - Bicep se prevaja v ARM; surovi ARM JSON ni ločen vgrajen `infra.provider`
- **Terraform** - Orodje za infrastrukturo več oblakov
- **Razširitveni ponudniki** - Potrebujejo ločeno nameščen razširitveni ponudnik in njegovo dokumentirano konfiguracijo; ne domnevajte, da je podprt kateri koli niz ponudnika

## Razumevanje Azure virov

### Hierarhija virov
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Pogoste Azure storitve za aplikacije
- **Računanje**: App Service, Container Apps, Functions, Virtual Machines
- **Shranjevanje**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Omrežje**: Virtual Network, Application Gateway, CDN
- **Varnost**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI storitve, Azure OpenAI, Azure Machine Learning

## Bicep infrastrukturne predloge

### Osnovna struktura Bicep predloge
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

Za popoln azd projekt pokličite ta modul iz naročniško omejenega `infra/main.bicep`, ki ustvari označeno skupino virov in posreduje njen obseg. Ujemajte `environmentName`/`location` v `main.parameters.json`. Oznaka `azd-service-name: web` povezuje vir z `services.web`; sami imeni izhodov ne konfigurirata odkrivanja storitev.

### Napredni Bicep vzorci

#### Modularna infrastruktura
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

#### Pogojno ustvarjanje virov
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

## 🌐 Uporaba Terraform z azd

Bicep je privzet za azd, vendar azd podpira tudi **Terraform** — uporabno, če vaša ekipa že standardizira na njem ali upravlja infrastrukturo v več oblakih. Delovni tok azd (`azd up`, `azd provision`, `azd down`) je enak; spremeni se samo infrastrukturni jezik in postavitev map.

### Povejte azd, naj uporablja Terraform

Dodajte razdelek `infra` v `azure.yaml`, ki kaže na Terraform ponudnika:

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

### Postavitev mape Terraform

Z Terraform ponudnikom vaša mapa `infra/` uporablja datoteke `.tf` namesto Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Fragment `main.tf`

To ustvari le skupino virov in načrt, ne pa storitve za uvajanje. Prav tako morate deklarirati vhodne spremenljivke, združljivega ponudnika `azurerm`, spletno aplikacijo in preslikavo oznak/imen virov storitve.

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

### Kako azd povezuje vaše Terraform izhode

azd prebere Terraform **izhode** v vrednosti okolja. Ta fragment predvideva, da ste definirali `azurerm_linux_web_app.web`; odkrivanje storitev še vedno zahteva ujemajoče se ime vira ali oznako `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Pomembno:** azd uporablja oznako `azd-env-name` in izhode `AZURE_*` za sledenje virom po okoljih. Vedno označite skupino virov z `"azd-env-name" = var.environment_name`, da jih lahko `azd down` najde in odstrani.

### Uvajanje z Terraform

Ukazi so natanko enaki kot pri Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Pogoj:** Terraform mora biti nameščen in na vašem `PATH`. azd upravlja Terraform *delovni tok*, vendar ga ne namesti. Za stanje azd privzeto uporablja lokalno stanje; za ekipe konfigurirajte oddaljeni hrbtenik (npr. Azure Storage hrbtenik) v `provider.tf`.

Za popolne, izvedljive začetne Terraform projekte si oglejte [Awesome AZD galerijo](https://azure.github.io/awesome-azd/) in filtrirajte za Terraform ali uradno [azd Terraform dokumentacijo](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Druga infrastrukturna orodja

Pulumi ni vgrajen ponudnik azd 1.37.2. Nastavitev `infra.provider: pulumi` sama ne vzpostavi delujoče integracije, prav tako `azd env new` samodejno ne ustvari/izbere Pulumi sklada. Če uporabljate drugo orodje IaC, sledite dokumentaciji preverjene ponudniške razširitve ali upravljajte njen življenjski cikel eksplicitno v svojem delovnem toku. Ta tečaj ne zagotavlja niti ne potrjuje ponudnika Pulumi.

## 🎯 Izbira gostitelja za vašo storitev

Polje `host` v `azure.yaml` odloča, kje se vaša koda izvaja. azd podpira več gostiteljev — pravilna izbira je pomembnejša od jezika infrastrukture. Tukaj je primerjava prijazna začetnikom:

| Vrednost `host` | Najbolj primeren za | Zakaj |
|--------------|----------|-----|
| `appservice` | Tradicionalne spletne aplikacije in API-ji | Najpreprostejši PaaS; ne zahteva kontejnerjev |
| `staticwebapp` | Front-end SPA (React, Vue, Angular) | Globalni CDN + brezplačen SSL, vgrajena podpora za API |
| `function` | Dogodkovno usmerjena in strežnikov brez zasedajoča | Skaliranje na nič, plačilo na izvedbo |
| `containerapp` | Kontejnerizirane mikroservisne arhitekture | Strežniki brez kontejnerjev, skaliranje na nič, vgrajen vhod |
| `aks` | Kompleksne potrebe po orkestraciji | Poln Kubernetes nadzor, ko ga res potrebujete |
| `springapp` | Obstoječe uvajanja Azure Spring Apps | Zastarela ciljna možnost; storitev preneha z 31. marcem 2028 in ni na voljo novim strankam |

### Kdaj izbrati AKS

**Azure Kubernetes Service (`host: aks`)** vam nudi polno moč Kubernetes – prilagojeni kontrolerji, servisne mreže, kompleksno omrežje in natančno razporejanje. Ta moč prinaša operativni strošek: upravljati morate node pool-e, nadgradnje in omrežje gruče.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Če lahko, začnite preprosteje.** Za večino mikroservisov **Container Apps** nudi kontejnerje, samodejno skaliranje in skaliranje na nič brez upravljanja gruče. AKS izberite le, če potrebujete Kubernetes-specifične funkcije.

### Kdaj uporabiti Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** je upravljano runtime okolje, namenjeno Spring Boot. Obravnava odkrivanje storitev, strežnik konfiguracije in modro-zelene uvajanje, tako da Java ekipe ne upravljajo lastne infrastrukture.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Ne izberite Azure Spring Apps za nov začetni projekt: zaprto je za nove stranke in [preneha 31. marca 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Raje izberite podprte alternative kot Container Apps in načrtujte migracijo za obstoječa uvajanja.

## 🗃️ Zagotavljanje baz podatkov

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
**Pogoji fragmenta:** deklarirajte `@secure() param databasePassword string` in uporabite ustrezno podano vrednost. Izberite javni dostop **ali** integrirajte delegirano podomrežje/privatni DNS spodaj; oba kosa se samodejno ne povežeta.

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

Pravilo `0.0.0.0` dovoljuje povezave iz Azure storitev izven vaše naročnine. To ni zasebno omrežje; za resne delovne obremenitve raje uporabi omejeno omrežno zasnovo.

## 🔒 Varnost in upravljanje skrivnosti

### Integracija Key Vault
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

### Konfiguracija upravljane identitete
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

Za sistemsko dodeljeno identiteto ne nastavite `AZURE_CLIENT_ID` na njen ID glavnega subjekta. Uporabniško dodeljena identiteta uporablja svoj **ID stranke**, ne svojega ID objekta/glavnega subjekta. Ključno zakladnico je treba tudi povezati z dodelitvijo vlog identitete aplikacije in dostopom do omrežja.

## 🌍 Omrežje in povezljivost

### Konfiguracija virtualnega omrežja
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

### Application Gateway z SSL
**Nepopoln arhitekturni fragment, ni uvajalni gateway:** dodajte namenski `gateway-subnet` k VNet skupaj z backend pool-i, HTTP nastavitvami, poslušalci, pravilniki usmerjanja z prioritetami in TLS certifikatom (ali pooblaščeno referenco Key Vault). Odprtje vrat 443 samo po sebi ne nastavi HTTPS.

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

## 📊 Nadzor in opazovanje

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

### Po meri merila in opozorila
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

## 🔧 Okoljsko specifične konfiguracije

### Datoteke parametrov za različna okolja
Spodnji dve datoteki sta **alternativna primera datotek s parametri**. azd samodejno ne izbira `main.parameters.dev.json` ali `main.parameters.prod.json` po imenu okolja. Uporabite dejanski `main.parameters.json` z zamenjavami okolja (npr. `${APP_SERVICE_SKU=B1}`) in deklarirajte/porabite vsak parameter v Bicep.

Primer vsebine za `infra/main.parameters.dev.json`:

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

Primer vsebine za `infra/main.parameters.prod.json`:

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

### Pogojno zagotavljanje virov
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

## 🚀 Napredni vzorci zagotavljanja

### Večregionalno uvajanje
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

### Testiranje infrastrukture
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Zagotavljanje infrastrukture ne uvaja kode vaše aplikacije. Preverjanja aplikacije izvajajte šele po `azd deploy`/`azd up`, in uporabljajte `/health` samo, če jo vaša aplikacija implementira. Skripte uvajanja ARM ustvarjajo Azure vire in potrebujejo dodatne identitete, podprte verzije runtime in dovoljenja; niso lokalni enotni testi.

## 🧪 Predogled in validacija infrastrukture (NOVO)

### Predogled sprememb infrastrukture pred uvajanjem

Funkcija `azd provision --preview` vam omogoča, da **simulirate zagotavljanje infrastrukture** pred dejanskim uvajanjem virov. Je podobna duhu `terraform plan` ali `bicep what-if` in nudi **pogled na suho vožnjo**, kaj vse bi se spremenilo v vašem Azure okolju.

#### 🛠️ Kaj počne
- **Analizira vaše IaC predloge** (Bicep ali Terraform)
- **Prikaže predogled sprememb virov**: dodajanja, brisanja, posodobitve
- **Ne uveljavlja predlaganih infrastrukturnih sprememb** — najprej preglejte projektne kuke; skripte lahko imajo stranske učinke in predogled še vedno potrebuje dovoljenja Azure

#### Primeri uporabe
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Ta ukaz vam pomaga:
- **Validirati spremembe infrastrukture** pred dokončnim uvajanjem virov
- **Zgodaj odkriti napačne konfiguracije** med razvojem
- **Varno sodelovati** v ekipnih okoljih
- **Zagotavljati uvajanja z najmanjšimi privilegiji** brez presenečenj

Še posebej je uporaben, ko:
- Delate s kompleksnimi okolji več storitev
- Spreminjate produkcijsko infrastrukturo
- Validirate spremembe pred potrditvijo pull requesta
- Izobražujete nove člane ekipe o infrastrukturnih vzorcih

### Primer izpisa predogleda
Natančen izpis predogleda je odvisen od ponudnika in strukture projekta, vendar naj rezultat jasno označi predlagane spremembe pred dejansko uveljavitvijo.

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

## �🔄 Posodobitve in migracije virov

### Varne posodobitve virov
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

### Migracije baz podatkov
**Nepričrpan vzorec skripte uvajanja:** zahteva konfigurirano uporabniško dodeljeno identiteto, kjer je potrebna, podprt Azure CLI runtime, na voljo orodja za migracijo, določeno mapo/konfiguracijo migracije in povezljivost z bazo. Ne more se izvesti samo z lepljenjem tega vira v predlogo.

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

## 🎯 Najboljše prakse

### 1. Konvencije poimenovanja virov
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Strategija označevanja
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

### 3. Validacija parametrov
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

### 4. Organizacija izhodov
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

## Naslednji koraki

- [Pred-uvajalno načrtovanje](../chapter-06-pre-deployment/capacity-planning.md) - Validirati razpoložljivost virov
- [Pogoste težave](../chapter-07-troubleshooting/common-issues.md) - Odpravljanje težav z infrastrukturo
- [Vodnik za odpravljanje napak](../chapter-07-troubleshooting/debugging.md) - Odpravljanje težav pri uvajanju
- [Izbira SKU](../chapter-06-pre-deployment/sku-selection.md) - Izbira ustreznih stopenj storitve

## Dodatni viri

- [Dokumentacija Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Predloge Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Center za arhitekturo Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Okvir za dobro arhitekturo Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigacija**
- **Prejšnja lekcija**: [Vodnik za uvajanje](deployment-guide.md)
- **Naslednja lekcija**: [Načrtovanje zmogljivosti](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->