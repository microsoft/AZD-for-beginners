# Azure-erőforrások biztosítása az AZD-vel

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 4. fejezet – Infrastruktúra kódként és telepítés
- **⬅️ Előző**: [Telepítési útmutató](deployment-guide.md)
- **➡️ Következő fejezet**: [5. fejezet: Több ügynökös AI megoldások](../../examples/retail-scenario.md)
- **🔧 Kapcsolódó**: [6. fejezet: Előtelepítési ellenőrzés](../chapter-06-pre-deployment/capacity-planning.md)

## Bevezetés

Ez az átfogó útmutató mindent lefed, amit tudnia kell az Azure-erőforrások Azure Developer CLI segítségével történő biztosításáról és kezeléséről. Tanulja meg az Infrastruktúra kódként (IaC) mintáit megvalósítani az egyszerű erőforrás-létrehozástól a fejlett vállalati szintű infrastruktúra-architektúrákig Bicep, ARM sablonok, Terraform és Pulumi használatával.

## Tanulási célok

Az útmutató végrehajtásával Ön:
- Mesteri szintre emeli az Infrastruktúra kódként elveit és az Azure-erőforrások biztosítását
- Megérti az Azure Developer CLI által támogatott többféle IaC szolgáltatót
- Megtervezi és megvalósítja a Bicep sablonokat gyakori alkalmazásarchitektúrákhoz
- Konfigurálja az erőforrás paramétereit, változóit és környezet-specifikus beállításait
- Kivitelez fejlett infrastruktúra mintákat beleértve hálózatkezelést és biztonságot
- Kezeli az erőforrás élettartamát, frissítéseit és a függőségek rendezését

## Tanulási eredmények

Az útmutató elvégzése után képes lesz:
- Azure infrastruktúra tervezésére és biztosítására Bicep és ARM sablonokkal
- Összetett többszolgáltatásos architektúrák konfigurálására megfelelő erőforrás-függőségekkel
- Paraméterezett sablonok megvalósítására több környezethez és konfigurációhoz
- Infrastrukturális biztosítási problémák hibakeresésére és telepítési hibák megoldására
- Az Azure jól megtervezett keretrendszerének alkalmazására az infrastruktúra tervezésében
- Infrastrukturális frissítések kezelésére és infrastruktúra verziózásának megvalósítására

## Az infrastruktúra biztosításának áttekintése

Az Azure Developer CLI több Infrastruktúra kódként (IaC) szolgáltatót támogat:
- **Bicep** (ajánlott) – az Azure domain-specifikus nyelve
- **ARM sablonok** – JSON alapú Azure Resource Manager sablonok
- **Terraform** – multi-cloud infrastruktúra eszköz
- **Pulumi** – modern infrastruktúra kódként programozási nyelvekkel

## Az Azure-erőforrások megértése

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
- **AI/ML**: Azure AI szolgáltatások, Azure OpenAI, Azure Machine Learning

## Bicep infrastruktúra sablonok

### Alapvető Bicep sablon szerkezet
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

### Fejlett Bicep minták

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

A Bicep az azd alapértelmezettje, de az azd támogatja a **Terraformot** is – hasznos, ha a csapata már erre standardizált, vagy multi-cloud infrastruktúrát kezel. Az azd munkafolyamata (`azd up`, `azd provision`, `azd down`) azonos; csak az infrastruktúra nyelve és a mappaszerkezet változik.

### Azd utasítása Terraform használatára

Adjon hozzá egy `infra` szakaszt az `azure.yaml`-hoz, amely a Terraform szolgáltatóra mutat:

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

### Terraform mappaszerkezet

A Terraform szolgáltatóval az `infra/` mappa `.tf` fájlokat használ Bicep helyett:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Egy minimális `main.tf`

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

### Hogyan kapcsolódik az azd a Terraform kimenetekhez

Az azd olvassa a Terraform **kimeneteket** annak érdekében, hogy megismerje az végpontokat és visszakösse a környezeti értékeket az alkalmazáshoz. A kimenet nevei számítanak – az azd specifikusakat keres:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Fontos:** az azd használja az `azd-env-name` címkét és az `AZURE_*` kimeneteket a környezetenkénti erőforrások nyomon követésére. Mindig címkézze az erőforráscsoportot `"azd-env-name" = var.environment_name` értékkel, hogy az `azd down` megtalálhassa és törölhesse az összeset.

### Telepítés Terraformmal

A parancsok pontosan megegyeznek a Bicep eseténivel:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd a háttérben lefuttatja a 'terraform plan' parancsot
azd up                    # előkészítés + telepítés
azd down --force          # törli a Terraform által kezelt erőforrásokat
```

> **Előfeltétel:** A Terraform telepítve legyen és elérhető legyen az ön `PATH`-ján. Az azd kezeli a Terraform *munkafolyamatot*, de nem telepíti a Terraformot. Az állapothoz az azd alapértelmezésként helyi állapotot használ; csapatok esetén konfiguráljon távoli backendet (például egy Azure Storage backendet) a `provider.tf`-ben.

Teljes, futtatható Terraform alapú indulókhoz böngéssze az [Awesome AZD galériát](https://azure.github.io/awesome-azd/), és szűrjön Terraformra, vagy tekintse meg a hivatalos [azd Terraform dokumentációt](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Pulumi használata az azd-vel

Ha a csapata általános célú nyelven (TypeScript, Python, Go vagy C#) ír infrastruktúrát a DSL helyett, az azd támogatja a **Pulumi**-t is. Ugyanúgy, mint a Terraformnál, az `azd up` / `azd provision` / `azd down` munkafolyamati sorrend változatlan – csak az infrastruktúra eszköz és a mappaszerkezet tér el.

### Azd utasítása Pulumi használatára

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

### Pulumi mappaszerkezet

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Egy minimális `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Jelölj meg minden erőforrást, hogy az azd nyomon követhesse és eltakaríthassa őket
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd ezeket a kimeneteket visszaolvassa a környezetedbe
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### A stacket az azd környezetekhez rendeli

A Pulumi a telepítéseket **stackekbe** szervezi, és az azd összerendeli az egyes azd környezeteket ugyanilyen nevű Pulumi stackekkel. Amikor az `azd env new staging` parancsot futtatja az azd kiválasztja (vagy létrehozza) a `staging` Pulumi stack-et. Ugyanaz az `azd-env-name` címkézési és `AZURE_*` kimeneti szabályok érvényesek, így az `azd down` megtalálhatja és törölheti az összeset.

### Telepítés Pulumi-val

```bash
azd auth login
azd env new dev
azd provision --preview   # azd futtatja a 'pulumi preview'-t a háttérben
azd up                    # előkészítés + telepítés
azd down --force          # futtatja a 'pulumi destroy'-t
```

> **Előfeltétel:** A Pulumi telepítve legyen és elérhető az ön `PATH`-ján, valamint szüksége lesz egy állapot backend-re (Pulumi Cloud vagy egy önállóan kezelt backend, például Azure Blob Storage). Az azd kezeli a Pulumi *munkafolyamatot*, nem a telepítést. Lásd a hivatalos [azd Pulumi dokumentációt](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 A hoszt kiválasztása szolgáltatásához

Az `azure.yaml` fájl `host` mezője határozza meg, hol fut a kódja. Az azd több hosztot támogat – a megfelelő kiválasztása fontosabb az infrastruktúra nyelvénél. Íme egy kezdőbarát összehasonlítás:

| `host` érték | Legjobb | Miért |
|--------------|----------|-------|
| `appservice` | Hagyományos webalkalmazások és API-k | Egyszerű legkevésbé erőforrásigényes PaaS; nem kell konténer |
| `staticwebapp` | Front-end SPA-k (React, Vue, Angular) | Globális CDN + ingyenes SSL, beépített API támogatás |
| `function` | Eseményvezérelt és szerver nélküli munkaterhelések | Automatikusan méretez zero-ra, fizetés futtatás szerint |
| `containerapp` | Konténerizált mikroservízek | Szerver nélküli konténerek, automatikus skálázás, beépített bejövő forgalom |
| `aks` | Összetett orchestration igények | Teljes Kubernetes kontroll valódi szükség esetén |
| `springapp` | Java Spring Boot alkalmazások | Felügyelt Azure Spring Apps futtatókörnyezet Springre hangolva |

### Mikor érdemes AKS-t választani

**Azure Kubernetes Service (`host: aks`)** a Kubernetes teljes erejét adja – testreszabott kontrollerekkel, szolgáltatáshálók, összetett hálózatkezelés, és részletes ütemezés. Ez az erő hatalmas üzemeltetési terhet is jelent: a csomópont medencéket, frissítéseket és klaszterhálózatot Önnek kell kezelnie.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Kezdje egyszerűbbel, ha lehet.** A legtöbb mikroservice esetében a **Container Apps** biztosít konténereket, automatikus skálázást, és skálázást nullára klaszterkezelés nélkül. AKS-t csak akkor válasszon, ha Kubernetes-specifikus funkciókra van szüksége.

### Mikor használjon Azure Spring Apps-t

**Azure Spring Apps (`host: springapp`)** egy menedzselt futtatókörnyezet, amely kifejezetten a Spring Boot számára készült. Kezeli a szolgáltatás-felderítést, konfigurációs szervert, és blue-green telepítést, így a Java csapatoknak nem kell saját infrastruktúrát üzemeltetniük.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Használja a `springapp`-ot meglévő Spring Boot alkalmazásaihoz, ha egy rájuk hangolt futtatókörnyezetet szeretne. Új konténerizált Java alkalmazások esetén, amelyek nem igényelnek Spring-specifikus dolgokat, a `containerapp` gyakran egyszerűbb választás.

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

### Managed Identity konfiguráció
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

## 🌍 Hálózat és kapcsolat

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

## 📊 Figyelés és megfigyelhetőség

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

### Egyedi metrikák és riasztások
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

## 🔧 Környezet-specifikus konfigurációk

### Paraméter fájlok különböző környezetekhez
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

### Feltételes erőforrás biztosítás
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

## 🚀 Fejlett biztosítási minták

### Többszörös régiós telepítés
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

## 🧪 Infrastruktúra előnézet és ellenőrzés (ÚJ)

### Előnézet az infrastruktúra változtatásairól telepítés előtt

Az `azd provision --preview` funkció lehetővé teszi, hogy **szimulálja az infrastruktúra biztosítást** a tényleges erőforrások telepítése előtt. Ez hasonló szellemben működik, mint a `terraform plan` vagy a `bicep what-if`, egy **száraz futású nézetet** ad arról, milyen változtatások történnének az Azure környezetében.

#### 🛠️ Mit csinál
- **Elemzi az IaC sablonokat** (Bicep vagy Terraform)
- **Előnézetet mutat az erőforrás változtatásokról**: hozzáadások, törlések, módosítások
- **Nem hajt végre változtatásokat** – csak olvassa azokat, biztonságosan futtatható

#### Felhasználási esetek
```bash
# Infrastruktúra változtatások előzetes megtekintése telepítés előtt
azd provision --preview

# Előzetes megtekintés adott környezetre
azd provision --preview -e production
```

Ez a parancs segít:
- **Érvényesíteni az infrastruktúra változtatásait** az erőforrások elkötelezése előtt
- **Korán felfedezni hibás konfigurációkat** a fejlesztési folyamatban
- **Biztonságosan együttműködni** csapat környezetekben
- **Biztosítani a legkisebb jogkörű telepítéseket** meglepetések nélkül

Különösen hasznos, ha:
- Komplex többszolgáltatásos környezettel dolgozik
- Változtatásokat hajt végre éles infrastruktúrán
- Érvényesíti a sablon módosításokat PR jóváhagyás előtt
- Új csapattagokat képez infrastruktúra mintákra

### Példa előnézeti kimenet
A pontos előnézeti kimenet szolgáltatótól és projekt struktúrától függ, de az eredménynek egyértelműen azonosítania kell a javasolt változtatásokat mielőtt bármi alkalmazásra kerülne.

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

## 🔄 Erőforrás frissítések és migrációk

### Biztonságos erőforrás frissítések
```bash
# Előnézet készítése az infrastruktúra változásairól először (AJÁNLOTT)
azd provision --preview

# A változtatások alkalmazása az előnézet visszaigazolása után
azd provision --confirm-with-no-prompt

# Visszagörgetéshez használd a Git-et az infrastruktúra változtatások visszavonásához:
git revert HEAD  # Az utolsó infrastruktúra commit visszaállítása
azd provision    # Az előző infrastruktúra állapot alkalmazása
```

### Adatmigrációk
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

## 🎯 Legjobb gyakorlatok

### 1. Erőforrás elnevezési konvenciók
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Címkézési stratégia
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

### 4. Kimeneti szervezés
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

- [Előtelepítési tervezés](../chapter-06-pre-deployment/capacity-planning.md) – Erőforrás elérhetőség érvényesítése
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md) – Infrastrukturális hibák elhárítása
- [Hibakeresési útmutató](../chapter-07-troubleshooting/debugging.md) – Biztosítási problémák hibakeresése
- [SKU kiválasztás](../chapter-06-pre-deployment/sku-selection.md) – Megfelelő szolgáltatási szintek kiválasztása

## További források

- [Azure Bicep dokumentáció](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager sablonok](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architektúra Központ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Jól Megtervezett Keretrendszer](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigáció**
- **Előző lecke**: [Telepítési útmutató](deployment-guide.md)
- **Következő lecke**: [Kapacitástervezés](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->