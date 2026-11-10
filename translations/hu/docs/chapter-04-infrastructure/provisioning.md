# Azure erőforrások biztosítása az AZD-vel

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 4. fejezet - Infrastruktúra kódként & Telepítés
- **⬅️ Előző**: [Telepítési útmutató](deployment-guide.md)
- **➡️ Következő fejezet**: [5. fejezet: Több ügynökös MI megoldások](../../examples/retail-scenario.md)
- **🔧 Kapcsolódó**: [6. fejezet: Előtelepítési érvényesítés](../chapter-06-pre-deployment/capacity-planning.md)

## Bevezetés

Ez az útmutató az Azure Developer CLI beépített Bicep és Terraform szolgáltatóival történő Azure erőforrások létrehozását és kezelését fedi le.

> Ellenőrizve a `azd 1.37.2` (2026. november) alapján. Ha nincs másként megadva, a Bicep, Terraform és szkript példák **illusztratív töredékek**, nem teljes sablonok. Egy projektbe illessze őket, amely biztosítja a hivatkozott paramétereket, modulokat, identitásokat, hálózatot és alkalmazáskódot. Az Azure erőforrások létrehozása nem történt meg ebben az ellenőrzésben.

## Tanulási célok

Az útmutató elvégzésével:
- Elsajátítja az Infrastruktúra kódként elveit és az Azure erőforrások biztosítását
- Megérti az Azure Developer CLI által támogatott több IaC szolgáltatót
- Tervez és megvalósít Bicep sablonokat általános alkalmazásarchitektúrákhoz
- Konfigurálja az erőforrás paramétereket, változókat és környezetspecifikus beállításokat
- Fejlett infrastruktúra mintákat hajt végre, beleértve a hálózatot és biztonságot
- Kezeli az erőforrás életciklust, frissítéseket és függőség feloldást

## Tanulási eredmények

A befejezéskor képes lesz:
- Azure infrastruktúra tervezésére és biztosítására Bicep és ARM sablonokkal
- Összetett többszolgáltatásos architektúrák konfigurálására megfelelő erőforrás-függőségekkel
- Paraméterezett sablonok megvalósítására több környezethez és konfigurációhoz
- Infrastruktúra biztosítási problémák hibaelhárítására és telepítési hibák megoldására
- Azure Well-Architected Framework elveinek alkalmazására az infrastruktúra tervezésében
- Infrastruktúra frissítések kezelésére és verziókezelési stratégiák alkalmazására

## Infrastruktúra biztosítás áttekintése

Az Azure Developer CLI több Infrastructure as Code (IaC) szolgáltatót támogat:
- **Bicep** (ajánlott) - Azure domain-specifikus nyelv
- **ARM Templates** - A Bicep ARM-re fordul; a nyers ARM JSON nem külön beépített `infra.provider`
- **Terraform** - Többfelhős infrastruktúra eszköz
- **Kiegészítő szolgáltatók** - Külön telepítendő szolgáltató kiegészítővel és dokumentált konfigurációval; ne feltételezzen semmilyen szolgáltató string támogatást

## Az Azure erőforrások megértése

### Erőforrás hierarchia
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Gyakori Azure szolgáltatások alkalmazásokhoz
- **Számítás**: App Service, Container Apps, Functions, Virtuális gépek
- **Tárolás**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Hálózat**: Virtuális hálózat, Application Gateway, CDN
- **Biztonság**: Key Vault, Application Insights, Log Analytics
- **MI/Gépi tanulás**: Azure MI szolgáltatások, Azure OpenAI, Azure Machine Learning

## Bicep infrastruktúra sablonok

### Alapvető Bicep sablon struktúra
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

Egy teljes azd projekthez ezt a modult egy előfizetés hatókörű `infra/main.bicep`-ból hívjuk meg, amely egy címkézett erőforrás csoportot hoz létre és átadja a hatókört. Illessze a `environmentName`/`location` értékeket a `main.parameters.json`-ben. A `azd-service-name: web` címke társítja az erőforrást a `services.web`; önmagukban tetszőleges kimeneti nevek nem konfigurálnak szolgáltatás felfedezést.

### Haladó Bicep minták

#### Moduláris infrastruktúra
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

#### Feltételes erőforrás létrehozás
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

## 🌐 Terraform használata az azd-vel

A Bicep az azd alapértelmezett, de azd támogatja a **Terraform**-ot is – hasznos, ha a csapata már ezt szabványosította, vagy többfelhős infrastruktúrát kezel. Az azd munkafolyamat (`azd up`, `azd provision`, `azd down`) azonos; csak az infrastruktúra nyelv és a mappa elrendezés változik.

### Azd utasítása a Terraform használatára

Adjon hozzá egy `infra` szakaszt a `azure.yaml`-hoz, amely a Terraform szolgáltatóra mutat:

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

### Terraform mappa elrendezés

A Terraform szolgáltató esetén az `infra/` mappája `.tf` fájlokat használ Bicep helyett:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Egy `main.tf` töredék

Ez csak egy erőforrás csoportot és tervet hoz létre, nem telepíthető szolgáltatást. Meg kell határozni bemeneti változókat, kompatibilis `azurerm` szolgáltatót, a webalkalmazást és annak szolgáltatás címkét/erőforrás név leképezését is.

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

### Hogyan kapcsolódik azd a Terraform kimenetekhez

azd beolvassa a Terraform **kimeneteket** környezeti értékekként. Ez a töredék feltételezi, hogy definiált `azurerm_linux_web_app.web`; a szolgáltatás felfedezéshez még szükséges egy illeszkedő erőforrás név vagy `azd-service-name` címke:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Fontos:** az azd a `azd-env-name` címkét és `AZURE_*` kimeneteket használja az erőforrások környezeti alapon történő nyomon követésére. Mindig címkézze erőforráscsoportját `"azd-env-name" = var.environment_name`-vel, hogy `azd down` megtaláljon és eltávolítson mindent.

### Telepítés Terraformmal

A parancsok pontosan ugyanazok, mint Bicep esetén:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Előfeltétel:** A Terraform telepítve kell, hogy legyen és elérhető az Ön `PATH`-jén. Az azd kezeli a Terraform *munkafolyamatot*, de nem telepíti Ön helyett a Terraformot. Az állapot esetén az azd alapértelmezett helyi állapotot használ; csapatok esetén állítson be távoli backendet (például Azure Storage backendet) a `provider.tf`-ben.

Teljes, futtatható Terraform alapú kiindulópontokért böngéssze az [Awesome AZD galériát](https://azure.github.io/awesome-azd/) és szűrjön Terraformra, vagy tekintse meg a hivatalos [azd Terraform dokumentációt](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Egyéb infrastruktúra eszközök

A Pulumi nem beépített azd 1.37.2 biztosítási szolgáltató. Csak az `infra.provider: pulumi` beállítása nem hoz létre működő integrációt, és a `azd env new` nem hoz létre/kiválaszt automatikusan Pulumi stack-et. Ha más IaC eszközt használ, kövesse az igazolt szolgáltató kiegészítő dokumentációját vagy kezelje annak életciklusát saját munkafolyamatában. Ez a tanfolyam nem biztosít vagy hitelesít Pulumi szolgáltatót.

## 🎯 Szolgáltató környezet kiválasztása

A `host` mező a `azure.yaml`-ben dönti el, hol fut a kódja. Az azd több gazdagépet támogat – a megfelelő kiválasztása fontosabb, mint az infrastruktúra nyelve. Itt egy kezdőknek szóló összehasonlítás:

| `host` érték | Legalkalmasabb | Miért |
|--------------|----------|-----|
| `appservice` | Hagyományos webalkalmazások és API-k | Egyszerűbb PaaS; nem szükséges konténer |
| `staticwebapp` | Front-end SPA-k (React, Vue, Angular) | Globális CDN + ingyenes SSL, beépített API támogatás |
| `function` | Eseményvezérelt és szerver nélküli munkafolyamatok | Scale-to-zero, fizetés futtatásonként |
| `containerapp` | Konténerizált mikroszolgáltatások | Szerver nélküli konténerek, scale-to-zero, beépített belépés |
| `aks` | Összetett orchestrációs igények | Teljes Kubernetes irányítás, ha tényleg szükséges |
| `springapp` | Meglévő Azure Spring Apps telepítések | Elavult célpont; szolgáltatás 2028. március 31-én megszűnik és zárt új ügyfelek előtt |

### Mikor használjuk az AKS-t

**Azure Kubernetes Service (`host: aks`)** megadja a Kubernetes teljes erejét – egyedi kontrollerek, szolgáltatás hálózatok, összetett hálózat és finomhangolt ütemezés. Ez az erő nagy működtetési terhet is jelent: Ön kezeli a node poolokat, frissítéseket és a klaszter hálózatot.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Kezdje egyszerűbben, ha tud.** A legtöbb mikroszolgáltatáshoz a **Container Apps** biztosít konténereket, automatikus skálázást és scale-to-zero funkciót klaszterkezelés nélkül. AKS-t csak akkor válasszon, ha Kubernetes-specifikus funkciókra van szüksége.

### Mikor használjuk az Azure Spring Apps-et

**Azure Spring Apps (`host: springapp`)** egy menedzselt futtatókörnyezet, amely kifejezetten a Spring Boot számára készült. Kezeli a szolgáltatás felfedezést, konfigurációs szervert és a blue-green telepítést, így a Java csapatoknak nem kell saját infrastruktúrát működtetniük.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Ne válassza az Azure Spring Apps-et új kezdő projekthez: zárt az új ügyfelek előtt és [2028. március 31-én megszűnik](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Előnyben részesítendők a támogatott alternatívák, mint a Container Apps, és tervezze meg a meglévő telepítések migrációját.

## 🗃️ Adatbázis biztosítás

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
**Töredék előfeltételei:** deklarálja `@secure() param databasePassword string` és használjon erős megadott értéket. Válassza a nyilvános hozzáférést **vagy** integrálja az alább delegált alhálózat/privát DNS-t; a két töredék nem csatlakozik automatikusan egymáshoz.

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

A `0.0.0.0` szabály engedélyezi az Azure szolgáltatások kapcsolatait az előfizetésen túl. Ez nem privát hálózat; valós munkaterhelésekhez korlátozott hálózati terv ajánlott.

## 🔒 Biztonság és titkok kezelése

### Key Vault integráció
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

### Kezelt identitás konfiguráció
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

Rendszer-hozta identitás esetén ne állítsa a `AZURE_CLIENT_ID`-t a főazonosítóra. Felhasználó-hozta identitás esetén annak **ügyfél azonosítóját** kell használni, nem a tárgy/főazonosítót. A Key Vault hivatkozás is igényli az alkalmazás identitásának kulcs tároló szerepkör hozzárendelését és hálózati hozzáférést.

## 🌍 Hálózat és kapcsolódás

### Virtuális hálózat konfiguráció
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

### Application Gateway SSL-lel
**Hiányos architektúra töredék, nem telepíthető átjáró:** adjon hozzá dedikált `gateway-subnet`-t a VNet-hez, backend medencékkel, HTTP beállításokkal, hallgatókkal, prioritásos útvonal szabályokkal és TLS tanúsítvánnyal (vagy engedélyezett Key Vault hivatkozással). Csak a 443-as port megnyitása nem konfigurál HTTPS-t.

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

## 📊 Monitorozás és megfigyelhetőség

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

### Egyéni metrikák és riasztások
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

## 🔧 Környezetspecifikus konfigurációk

### Paraméter fájlok különböző környezetekhez
Az alábbi két fájl **alternatív paraméter-fájl példák**. Az azd nem választja automatikusan a `main.parameters.dev.json` vagy `main.parameters.prod.json`-t a környezet neve alapján. Használja a tényleges `main.parameters.json`-et környezeti helyettesítésekkel (például `${APP_SERVICE_SKU=B1}`), és deklarálja/fogyassza el minden paramétert a Bicep-ben.

Példa tartalom a `infra/main.parameters.dev.json`-ra:

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

Példa tartalom a `infra/main.parameters.prod.json`-ra:

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

### Feltételes erőforrás biztosítás
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

## 🚀 Haladó biztosítási minták

### Több régiós telepítés
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

### Infrastruktúra tesztelés
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Az infrastruktúra biztosítása nem telepíti alkalmazáskódját. Alkalmazásellenőrzéseket csak `azd deploy`/`azd up` után futtasson, és `/health` használatával csak akkor, ha az app implementálja. Az ARM telepítési szkriptek Azure erőforrásokat hoznak létre, és további identitást, támogatott futtatókörnyezet verziókat és engedélyeket igényelnek; nem helyi egységtesztek.

## 🧪 Infrastruktúra előnézete és érvényesítése (ÚJ)

### Infrastruktúra változások előnézete telepítés előtt

A `azd provision --preview` funkció lehetővé teszi a **szimulált infrastruktúra biztosítást** az erőforrások tényleges telepítése előtt. Hasonló a `terraform plan` vagy `bicep what-if` szelleméhez, egy **szárazfutás nézetet** adva az Azure környezetén esedékes változásokról.

#### 🛠️ Mit csinál
- **Elemzi IaC sablonjait** (Bicep vagy Terraform)
- **Megjeleníti az erőforrás változások előnézetét**: hozzáadások, törlések, frissítések
- **Nem alkalmazza a szolgáltató által javasolt infrastruktúra változásokat** — ellenőrizze projekthorogoltásokat először; a szkriptek mellékhatásokat okozhatnak és az előnézethez továbbra is szükséges az Azure engedély

#### Használati esetek
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Ez a parancs segít Önnek:
- **Érvényesíteni infrastruktúra változásokat** mielőtt erőforrásokat fogad el
- **Korán elcsípni hibás konfigurációkat** a fejlesztési ciklusban
- **Biztonságosan együttműködni** csapat környezetben
- **Biztosítani a legkisebb jogosultságú telepítést** meglepetések nélkül

Különösen hasznos, ha:
- Összetett többszolgáltatásos környezettel dolgozik
- Változtatásokat hajt végre éles infrastruktúrán
- Sablon módosításokat érvényesít PR jóváhagyás előtt
- Új csapattagokat képez infrastruktúra mintákra

### Példa előnézeti kimenet
A pontos előnézeti kimenet szolgáltatónként és projekt struktúránként változik, de az eredménynek világosan azonosítania kell a javasolt változásokat, mielőtt bármi alkalmazásra kerülne.

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

## 🔄 Erőforrás frissítések és migrációk

### Biztonságos erőforrás frissítések
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

### Adatbázis migrációk
**Hiányos telepítési szkript minta:** szükséges egy felhasználó-hozott identitás konfigurálása ahol kell, támogatott Azure CLI futtatókörnyezet, elérhető migrációs eszközök, megadott migrációs könyvtár/konfiguráció és adatbázis kapcsolat. Nem futtatható csak az erőforrás sablonba illesztésével.

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

## 🎯 Jó gyakorlatok

### 1. Erőforrás elnevezési konvenciók
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Címkézési stratégia
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

### 3. Paraméter érvényesítés
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

### 4. Kimenetek rendszerezése
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

## Következő lépések

- [Előtelepítés tervezés](../chapter-06-pre-deployment/capacity-planning.md) - Erőforrás elérhetőség érvényesítése
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md) - Infrastruktúra hibák hibaelhárítása
- [Hibakeresési útmutató](../chapter-07-troubleshooting/debugging.md) - Problémák feltárása a felügyeletnél
- [SKU kiválasztás](../chapter-06-pre-deployment/sku-selection.md) - Megfelelő szolgáltatási szintek kiválasztása

## További források

- [Azure Bicep dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager sablonok](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Jól-Architektúrált Keretrendszer](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigáció**
- **Előző lecke**: [Telepítési útmutató](deployment-guide.md)
- **Következő lecke**: [Kapasitástervezés](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->