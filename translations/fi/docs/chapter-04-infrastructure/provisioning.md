# Azure-resurssien provisiointi AZD:llä

**Chapter Navigation:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 4 - Infrastruktuuri koodina ja käyttöönotto
- **⬅️ Edellinen**: [Käyttöönotto-opas](deployment-guide.md)
- **➡️ Seuraava luku**: [Luku 5: Moniagenttiset tekoälyratkaisut](../../examples/retail-scenario.md)
- **🔧 Aiheeseen liittyvä**: [Luku 6: Ennen käyttöönottoa tehtävä validointi](../chapter-06-pre-deployment/capacity-planning.md)

## Johdanto

Tämä kattava opas käsittelee kaiken, mitä sinun tarvitsee tietää Azure-resurssien provisioinnista ja hallinnasta Azure Developer CLI:n avulla. Opit toteuttamaan Infrastructure as Code (IaC) -malleja perusresurssien luomisesta aina edistyneisiin yritystason infrastruktuuriarkkitehtuureihin Bicepillä, ARM-malleilla, Terraformilla ja Pulumilla.

## Oppimistavoitteet

Kun olet suorittanut tämän oppaan, osaat:
- Hallita Infrastructure as Code -periaatteita ja Azure-resurssien provisiointia
- Ymmärtää useita Azure Developer CLI:n tukemia IaC-toimittajia
- Suunnitella ja toteuttaa Bicep-malleja yleisille sovellusarkkitehtuureille
- Konfiguroida resurssien parametrit, muuttujat ja ympäristökohtaiset asetukset
- Toteuttaa edistyneitä infrastruktuurimalleja, mukaan lukien verkotus ja tietoturva
- Hallita resurssien elinkaarta, päivityksiä ja riippuvuuksien ratkaisemista

## Oppimistulokset

Oppaan suorittamisen jälkeen pystyt:
- Suunnittelemaan ja provisioimaan Azure-infrastruktuuria Bicepillä ja ARM-malleilla
- Konfiguroimaan monimutkaisia monipalveluarkkitehtuureja oikeilla resurssiriippuvuuksilla
- Toteuttamaan parametrisoituja malleja useille ympäristöille ja määrityksille
- Vianetsimään infrastruktuurin provisiointiongelmia ja ratkaisemaan käyttöönottojen epäonnistumisia
- Soveltamaan Azure Well-Architected Framework -periaatteita infrastruktuurin suunnittelussa
- Hallitsemaan infrastruktuuripäivityksiä ja toteuttamaan infrastruktuurin versionhallintastrategioita

## Infrastruktuurin provisioinnin yleiskatsaus

Azure Developer CLI tukee useita Infrastructure as Code (IaC) -toimittajia:
- **Bicep** (suositeltu) - Azuren alakohtainen kieli
- **ARM Templates** - JSON-pohjaiset Azure Resource Manager -mallit
- **Terraform** - Monipilvi-infrastruktuurityökalu
- **Pulumi** - Moderni infrastruktuuri koodina ohjelmointikielillä

## Azure-resurssien ymmärtäminen

### Resurssihierarkia
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Yleiset Azure-palvelut sovelluksille
- **Laskenta**: App Service, Container Apps, Functions, Virtual Machines
- **Tallennus**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Verkko**: Virtual Network, Application Gateway, CDN
- **Suojaus**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep-infrastruktuurimallit

### Perus Bicep-mallin rakenne
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

### Edistyneet Bicep-mallit

#### Modulaarinen infrastruktuuri
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

#### Ehdollinen resurssien luonti
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

## 🌐 Terraformin käyttäminen azd:n kanssa

Bicep on azd:n oletus, mutta azd tukee myös **Terraformia**—hyödyllinen, jos tiimisi käyttää sitä jo tai hallinnoit monipilvi-infrastruktuuria. azd-työnkulku (`azd up`, `azd provision`, `azd down`) on identtinen; ainoastaan infrastruktuurin kieli ja kansiorakenne muuttuvat.

### Määritä azd käyttämään Terraformia

Lisää `infra`-osio `azure.yaml`-tiedostoon osoittamaan Terraform-provideriin:

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

### Terraform-kansion rakenne

Terraform-providerilla `infra/`-kansiosi käyttää `.tf`-tiedostoja Bicepin sijaan:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Minimipohjainen `main.tf`

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

### Kuinka azd yhdistää Terraformin outputs-arvoihin

azd lukee Terraformin **outputs**-arvoja oppiakseen endpoints-osoitteesi ja yhdistääkseen ympäristöarvot takaisin sovellukseesi. Output-nimet ovat tärkeitä—azd etsii tiettyjä nimiä:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Tärkeää:** azd käyttää `azd-env-name`-tunnistetta ja `AZURE_*`-outputteja seuratakseen resursseja ympäristöittäin. Merkitse aina resurssiryhmäsi tunnisteella `"azd-env-name" = var.environment_name` jotta `azd down` voi löytää ja poistaa kaiken.

### Ota käyttöön Terraformilla

Komennot ovat täsmälleen samat kuin Bicepillä:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd suorittaa 'terraform plan' taustalla
azd up                    # provisiointi + käyttöönotto
azd down --force          # tuhoaa Terraformin hallinnoimat resurssit
```

> **Esivaatimus:** Terraform on asennettava ja sen on oltava `PATH`-ympäristöpolullasi. azd hallinnoi Terraformin *työnkulkua*, mutta ei asenna Terraformia puolestasi. Tilatietoja varten azd käyttää oletuksena paikallista stateä; tiimeille määritä etäbackend (esimerkiksi Azure Storage -backend) `provider.tf`-tiedostossa.

Täydellisiä, ajettavia Terraform-pohjaisia startereita löytyy selaamalla [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ja suodattamalla Terraformille, tai katso virallinen [azd Terraform -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Pulumin käyttäminen azd:n kanssa

Jos tiimisi kirjoittaa infrastruktuurin yleiskäyttöisellä kielellä (TypeScript, Python, Go tai C#) DSL:n sijaan, azd tukee myös **Pulumia**. Kuten Terraformin kanssa, `azd up` / `azd provision` / `azd down` -työnkulku on muuttumaton—ainoastaan infrastruktuurityökalut ja kansiorakenne eroavat.

### Määritä azd käyttämään Pulumia

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

### Pulumi-kansion rakenne

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Minimipohjainen `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Lisää tunniste jokaiseen resurssiin, jotta azd voi seurata niitä ja siivota ne
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd lukee nämä tulosteet takaisin ympäristöösi
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stackit vastaavat azd-ympäristöjä

Pulumi järjestää käyttöönotot **stackeihin**, ja azd kartoittaa jokaisen azd-ympäristön samaa nimeä kantavaan Pulumi-stackiin. Kun ajat `azd env new staging`, azd valitsee (tai luo) `staging`-nimisen Pulumi-stackin. Sama `azd-env-name`-tägäys ja `AZURE_*`-output-säännöt pätevät, jotta `azd down` voi löytää ja poistaa kaiken.

### Ota käyttöön Pulumilla

```bash
azd auth login
azd env new dev
azd provision --preview   # azd suorittaa taustalla komennon 'pulumi preview'
azd up                    # provisiointi + käyttöönotto
azd down --force          # suorittaa komennon 'pulumi destroy'
```

> **Esivaatimus:** Pulumi on asennettava ja sen on oltava `PATH`-ympäristöpolullasi, ja tarvitset tilatietojen backendin (Pulumi Cloud tai itsehallinnoitu backend kuten Azure Blob Storage). azd hallinnoi Pulumin *työnkulkua*, ei asennusta. Katso virallinen [azd Pulumi -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Palvelun isännän valinta

`host`-kenttä `azure.yaml`-tiedostossa määrittää, missä koodisi suoritetaan. azd tukee useita hosteja—oikean valitseminen on usein tärkeämpää kuin infrastruktuurin kieli. Tässä aloittelijaystävällinen vertailu:

| `host` value | Parhaiten sopii | Miksi |
|--------------|-----------------|-------|
| `appservice` | Perinteiset web-sovellukset ja API:t | Yksinkertaisin PaaS; ei vaadi kontteja |
| `staticwebapp` | Etupään SPA:t (React, Vue, Angular) | Globaali CDN + ilmainen SSL, sisäänrakennettu API-tuki |
| `function` | Tapahtumaperusteiset ja serverless-työkuormat | Skaalaus nollaan, maksu suoritusta kohden |
| `containerapp` | Kontitetut mikropalvelut | Serverless-kontit, skaalaus nollaan, sisäänrakennettu ingress |
| `aks` | Monimutkaiset orkestrointitarpeet | Täysi Kubernetes-hallinta, kun sitä todella tarvitset |
| `springapp` | Java Spring Boot -sovellukset | Hallittu Azure Spring Apps -ajonaikaympäristö, optimoitu Springille |

### Milloin valita AKS

**Azure Kubernetes Service (`host: aks`)** antaa sinulle koko Kubernetesin tehon—mukautetut controllerit, palveluverkostot, monimutkainen verkotus ja hienojakoinen ajoitus. Tämä teho tuo mukanaan operatiivista ylläpitoa: sinun on hallittava node poolit, päivitykset ja klusterin verkotus.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Aloita yksinkertaisemmin, jos voit.** Useimmille mikropalveluille **Container Apps** tarjoaa kontit, automaattisen skaalauksen ja skaalaamisen nollaan ilman, että hallinnoit klusteria. Valitse AKS vain, kun tarvitset Kubernetes-spesifisiä ominaisuuksia.

### Milloin käyttää Azure Spring Appsia

**Azure Spring Apps (`host: springapp`)** on hallittu ajonaikaympäristö, joka on suunniteltu Spring Boot -sovelluksille. Se hoitaa palvelunlöydön, konfiguraatiopalvelimen ja blue-green-käyttöönotot, joten Java-tiimit eivät joudu ylläpitämään omaa infrastruktuuriaan.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Käytä `springapp`-hostia, kun sinulla on olemassa olevia Spring Boot -sovelluksia ja haluat ajonaikaympäristön, joka on viritetty Springille. Uusille kontitetuille Java-sovelluksille ilman Spring-spesifisiä vaatimuksia `containerapp` on usein yksinkertaisempi valinta.

## 🗃️ Tietokantojen provisiointi

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

## 🔒 Turvallisuus ja salaisuuksien hallinta

### Key Vault -integraatio
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

### Hallitun identiteetin määritys
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

## 🌍 Verkkoyhteydet ja yhdistävyys

### Virtuaaliverkon määritys
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

### Application Gateway SSL:llä
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

## 📊 Valvonta ja havaittavuus

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

### Mukautetut mittarit ja hälytykset
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

## 🔧 Ympäristökohtaiset asetukset

### Parametritiedostot eri ympäristöille
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

### Ehdollinen resurssien provisiointi
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

## 🚀 Edistyneet provisiointimallit

### Monialuekäyttöönotto
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

### Infrastruktuurin testaus
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

## 🧪 Infrastruktuurin esikatselu ja validointi (UUSI)

### Esikatsele infrastruktuurimuutoksia ennen käyttöönottoa

`azd provision --preview` -ominaisuus antaa sinun **simuloida infrastruktuurin provisiointia** ennen resurssien todellista käyttöönottoa. Se muistuttaa `terraform plan`- tai `bicep what-if` -komentoja ja tarjoaa **kuivaharjoittelunäkymän** siitä, mitä muutoksia Azure-ympäristössä tehtäisiin.

#### 🛠️ Mitä se tekee
- **Analysoi IaC-mallisi** (Bicep tai Terraform)
- **Näyttää esikatselun resurssimuutoksista**: lisäykset, poistot, päivitykset
- **Ei sovella muutoksia** — se on vain luku -tila ja turvallinen ajaa

#### Käyttötapaukset
```bash
# Esikatsele infrastruktuurin muutoksia ennen käyttöönottoa
azd provision --preview

# Esikatselu tietylle ympäristölle
azd provision --preview -e production
```

Tämä komento auttaa sinua:
- **Validoimaan infrastruktuurimuutokset** ennen resurssien sitovaa käyttöönottoa
- **Havaitsemaan virheelliset määritykset varhaisessa kehitysvaiheessa**
- **Yhteistyössä työskentelemään turvallisesti** tiimiympäristöissä
- **Varmistamaan vähimmän oikeuden periaatteen mukaiset käyttöönotot** ilman yllätyksiä

Se on erityisen hyödyllinen, kun:
- Työskentelet monimutkaisten monipalveluympäristöjen kanssa
- Teet muutoksia tuotantoinfrastruktuuriin
- Validioit mallimuutoksia ennen PR-hyväksyntää
- Koulutat uusia tiimin jäseniä infrastruktuurimalleihin

### Esimerkin esikatselutulos
Esikatselutulokset vaihtelevat toimittajan ja projektirakenteen mukaan, mutta tuloksen pitäisi selkeästi tunnistaa ehdotetut muutokset ennen kuin mitään sovelletaan.

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

## �🔄 Resurssipäivitykset ja migraatiot

### Turvalliset resurssipäivitykset
```bash
# Esikatsele infrastruktuurimuutokset ensin (SUOSITELTAVA)
azd provision --preview

# Ota muutokset käyttöön esikatselun vahvistuksen jälkeen
azd provision --confirm-with-no-prompt

# Palautusta varten käytä Gitiä infrastruktuurimuutosten kumoamiseen:
git revert HEAD  # Palauta viimeisin infrastruktuurimuutos
azd provision    # Ota käyttöön edellinen infrastruktuurin tila
```

### Tietokantamigraatiot
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

## 🎯 Parhaat käytännöt

### 1. Resurssien nimeämiskäytännöt
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tunnisteiden strategia
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

### 3. Parametrien validointi
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

### 4. Tulosteiden järjestely
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

## Seuraavat askeleet

- [Ennen käyttöönottoa suunnittelu](../chapter-06-pre-deployment/capacity-planning.md) - Varmista resurssien saatavuus
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md) - Vianmääritys infrastruktuuriongelmissa
- [Vianetsintäopas](../chapter-07-troubleshooting/debugging.md) - Etsi ja korjaa provisiointiongelmia
- [SKU-valinta](../chapter-06-pre-deployment/sku-selection.md) - Valitse sopivat palvelutasot

## Lisäresurssit

- [Azure Bicep -dokumentaatio](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager -mallit](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure-arkkitehtuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected -kehys](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigointi**
- **Edellinen oppitunti**: [Käyttöönotto-opas](deployment-guide.md)
- **Seuraava oppitunti**: [Kapasiteettisuunnittelu](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->