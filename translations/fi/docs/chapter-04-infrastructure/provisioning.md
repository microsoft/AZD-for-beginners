# Azure-resurssien käyttöönotto AZD:llä

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 4 - Infrastructure as Code & Deployment
- **⬅️ Edellinen**: [Deployment Guide](deployment-guide.md)
- **➡️ Seuraava luku**: [Luku 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Liittyvät**: [Luku 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## Johdanto

Tämä opas käsittelee Azure-resurssien käyttöönottoa ja hallintaa Azure Developer CLI:llä, jossa on sisäänrakennetut Bicep- ja Terraform-toimittajat.

> Tarkistettu `azd 1.37.2` (marraskuu 2026). Ellei toisin mainita, Bicep-, Terraform- ja skriptiesimerkit ovat **havainnollistavia katkelmia**, eivät täydellisiä malleja. Yhdistä ne projektiin, joka tarjoaa viitatut parametrit, moduulit, identiteetit, verkot ja sovelluskoodin. Azuren käyttöönottoa ei suoritettu tässä tarkastelussa.

## Oppimistavoitteet

Tämän oppaan suorittamalla sinä:
- Hallitset Infrastructure as Code -periaatteet ja Azure-resurssien käyttöönoton
- Ymmärrät useita Azure Developer CLI:n tukemia IaC-toimittajia
- Suunnittelet ja toteutat Bicep-malleja yleisiin sovellusarkkitehtuureihin
- Määrität resurssien parametrit, muuttujat ja ympäristökohtaiset asetukset
- Toteutat kehittyneitä infrastruktuurimalleja, mukaan lukien verkotus ja turvallisuus
- Hallitset resurssien elinkaaren, päivitykset ja riippuvuuksien ratkaisut

## Oppimistulokset

Suoritettuasi tämän osaat:
- Suunnitella ja ottaa käyttöön Azure-infrastruktuuri Bicep- ja ARM-mallien avulla
- Määrittää monimutkaisia monipalveluarkkitehtuureja oikeilla resurssiriippuvuuksilla
- Käyttää parametrisoituja malleja useille ympäristöille ja kokoonpanoille
- Selvittää infrastruktuurin käyttöönoton ongelmia ja ratkaista käyttöönoton epäonnistumisia
- Soveltaa Azure Well-Architected Framework -periaatteita infrastruktuurin suunnittelussa
- Hallita infrastruktuurin päivityksiä ja käyttää versiointistrategioita

## Infrastruktuurin käyttöönoton yleiskuva

Azure Developer CLI tukee useita Infrastructure as Code (IaC) -toimittajia:
- **Bicep** (suositeltu) - Azuren domain-kohtainen kieli
- **ARM Templates** - Bicep kääntyy ARM:iin; raakaa ARM JSON:ia ei ole erillisenä sisäänrakennettuna `infra.provider`-toimittajana
- **Terraform** - Monipilvi-infrastruktuurityökalu
- **Laajennustoimittajat** - Vaativat erikseen asennetun toimittajan laajennuksen ja sen dokumentoidun määrityksen; älä oleta, että mitään toimittajamerkkijonoa tuetaan

## Azure-resurssien ymmärtäminen

### Resurssien hierarkia
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Yleiset Azuren palvelut sovelluksille
- **Suorituskyky**: App Service, Container Apps, Functions, Virtuaalikoneet
- **Tallennus**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Verkostointi**: Virtuaaliverkko, Application Gateway, CDN
- **Turvallisuus**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep-infrastruktuurimallit

### Perusrakenne Bicep-mallissa
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

Täydellisessä azd-projektissa kutsu tätä moduulia tilauksen laajuisesta `infra/main.bicep`, joka luo tagatun resurssiryhmän ja välittää sen laajuuden. Vastaa `environmentName`/`location`-kohtia `main.parameters.json`:ssa. `azd-service-name: web`-tageilla liitetään resurssi `services.web`:ään; satunnaiset ulostulon nimet eivät yksin määritä palvelun löytämistä.

### Kehittyneet Bicep-mallit

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

#### Ehdollinen resurssin luonti
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

## 🌐 Terraformin käyttö azd:llä

Bicep on azd:n oletus, mutta azd tukee myös **Terraformia**—kätevä jos tiimisi jo käyttää sitä tai hallitset monipilvi-infrastruktuuria. azd:n työvirta (`azd up`, `azd provision`, `azd down`) on identtinen; vain infrastruktuurin kieli ja kansiorakenne muuttuvat.

### Miten kertoa azd:lle, että käytät Terraformia

Lisää `infra`-osio `azure.yaml`:lle osoittaen Terraform-toimittajaan:

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

### Terraformin kansiorakenne

Terraform-toimittajan kanssa `infra/`-kansiosi käyttää `.tf`-tiedostoja Bicepin sijaan:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### `main.tf`-katkelma

Tämä luo vain resurssiryhmän ja suunnitelman, ei käyttöön otettavaa palvelua. Sinun on myös määriteltävä syöteparametrit, yhteensopiva `azurerm` -toimittaja, web-sovellus ja sen palvelutagi/resurssin nimi -kartoitus.

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

### Miten azd yhdistää Terraformin ulostuloihin

azd lukee Terraformin **ulostulot** ympäristöarvoiksi. Tämä katkelma olettaa määrittelet `azurerm_linux_web_app.web`; palvelun löytäminen vaatii kuitenkin vastaavan resurssin nimen tai `azd-service-name`-tagin:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Tärkeää:** azd käyttää `azd-env-name`-tagia ja `AZURE_*`-ulostuloja jäljitelläkseen resursseja ympäristöittäin. Merkitse aina resurssiryhmäsi `"azd-env-name" = var.environment_name`:llä, jotta `azd down` voi löytää ja poistaa kaikki.

### Käyttöönotto Terraformilla

Komennot ovat täsmälleen samat kuin Bicepillä:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Esivaatimus:** Terraform on asennettu ja käytettävissäsi `PATH`. azd hallinnoi Terraformin *työvirtaa* mutta ei asenna Terraformia puolestasi. Tilanhallintaan azd käyttää oletusarvoisesti paikallista tilaa; tiimeille suosittelemme kauko-taustajärjestelmää (esim. Azure Storage backend) `provider.tf`:ssa.

Täydellisiä, ajettavia Terraform-pohjaisia aloitusprojekteja löydät selaamalla [Awesome AZD gallery](https://azure.github.io/awesome-azd/) ja suodattamalla Terraformin mukaan, tai katso virallinen [azd Terraform-dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Muita infrastruktuurityökaluja

Pulumi ei ole sisäänrakennettu azd 1.37.2 -toimittaja. Pelkän `infra.provider: pulumi` asettaminen ei luo toimivaa integraatiota, eikä `azd env new` automaattisesti luo/valitse Pulumi-stackia. Jos käytät muuta IaC-työkalua, toimi varmennetun toimittajan laajennuksen dokumentaation mukaan tai hallitse elinkaarta omassa työvirrassasi. Tämä kurssi ei tarjoa eikä vahvista Pulumi-toimittajaa.

## 🎯 Palvelimen valinta

`host`-kenttä `azure.yaml` päättää, missä koodisi suoritetaan. azd tukee useita palvelimia—oikean valinta on tärkeämpää kuin infrastruktuurin kieli. Tässä aloittelijaystävällinen vertailu:

| `host` arvo | Paras käyttötarkoitus | Miksi |
|--------------|----------|-----|
| `appservice` | Perinteiset web-sovellukset ja API:t | Yksinkertaisin PaaS; ei vaadi konteja |
| `staticwebapp` | Etupään SPA:t (React, Vue, Angular) | Globaali CDN + ilmainen SSL, sisäänrakennettu API-tuki |
| `function` | Tapahtumapohjaiset ja serverless-kuormat | Skaalaa nollaan, maksa käytön mukaan |
| `containerapp` | Kontitettuihin mikropalveluihin | Serverless-kontit, skaalautuu nollaan, sisäänrakennettu ingressointi |
| `aks` | Monimutkaiseen orkestrointiin | Täysi Kubernetes-kontrolli tarpeen mukaan |
| `springapp` | Olemassaolevat Azure Spring Apps -käyttöönotot | Perinteinen kohde; palvelu poistuu käytöstä 31. maaliskuuta 2028 eikä ota uusia asiakkaita |

### Milloin valita AKS

**Azure Kubernetes Service (`host: aks`)** antaa täydet Kubernetesin voimat—mukautetut kontrollerit, palveluverkot, monimutkainen verkotus ja hienojakoinen ajoitus. Tämä valta tuo mukanaan operatiivisia hallintatehtäviä: hallitset solmualueita, päivityksiä ja klusterin verkotusta.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Aloita yksinkertaisemmin, jos mahdollista.** Suurimmalle osalle mikropalveluista **Container Apps** tarjoaa kontit, automaattisen skaalauksen ja skaalauksen nollaan ilman klusterinhallintaa. Valitse AKS vain, kun tarvitset Kubernetes-spesifisiä ominaisuuksia.

### Milloin käyttää Azure Spring Appsia

**Azure Spring Apps (`host: springapp`)** on hallittu ajonaikainen ympäristö, joka on suunniteltu Spring Bootille. Se hoitaa palvelun löytämisen, konfiguraatiopalvelimen ja blue-green käyttöönoton, jotta Java-tiimit eivät tarvitse omaa infrastruktuuria.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Älä valitse Azure Spring Appsia uudelle aloittelijaprojektille: se on suljettu uusilta asiakkailta ja [poistuu käytöstä 31. maaliskuuta 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Suosi tuettuja vaihtoehtoja kuten Container Apps ja suunnittele siirtymät olemassaoleville käyttöönotolle.

## 🗃️ Tietokantapalvelut

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
**Katkelman edellytykset:** määrittele `@secure() param databasePassword string` ja käytä vahvaa toimitettua arvoa. Valitse julkinen pääsy **tai** integroi allokoitu aliverkko/yksityinen DNS alla; kaksi katkelmaa eivät yhdisty automaattisesti.

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

`0.0.0.0`-sääntö sallii yhteydet Azure-palveluista oman tilauksesi ulkopuolelle. Tämä ei ole yksityisverkko; oikeille kuormituksille suositellaan rajoitettua verkkosuunnittelua.

## 🔒 Turvallisuus ja salaisuuksien hallinta

### Key Vault -integrointi
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
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

Järjestelmän luomalle identiteetille älä aseta `AZURE_CLIENT_ID` sen pääsyoikeus-ID:ksi. Käyttäjän määrittämä identiteetti käyttää **asiakas-ID:tä**, ei objektia/pääsyoikeus-ID:tä. Key Vault -viite tarvitsee myös sovelluksen identiteetin roolimäärityksen vaultissa ja verkkoyhteydet.

## 🌍 Verkkoyhteys ja liitettävyys

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
**Epätäydellinen arkkitehtuurikatkelma, ei käyttöön otettava gateway:** lisää omistettu `gateway-subnet` VNetiin sekä takapoolit, HTTP-asetukset, kuuntelijat, reitityssäännöt prioriteetein ja TLS-varmenne (tai valtuutettu Key Vault -viite). Pelkkä portin 443 avaaminen ei määritä HTTPS:ää.

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

### Räätälöidyt mittarit ja hälytykset
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

## 🔧 Ympäristökohtaiset määritykset

### Parametritiedostot eri ympäristöille
Alla olevat kaksi tiedostoa ovat **vaihtoehtoisia parametritiedostoesimerkkejä**. azd ei valitse automaattisesti `main.parameters.dev.json` tai `main.parameters.prod.json` ympäristön nimen perusteella. Käytä todellista `main.parameters.json` ympäristön korvauksilla (esim. `${APP_SERVICE_SKU=B1}`), ja määrittele/kuluta kaikki parametrit Bicepissä.

Esimerkkisisältöä tiedostolle `infra/main.parameters.dev.json`:

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

Esimerkkisisältöä tiedostolle `infra/main.parameters.prod.json`:

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

### Ehdollinen resurssien käyttöönotto
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

## 🚀 Kehittyneet käyttöönottojen mallit

### Monialueinen käyttöönotto
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
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Infrastruktuurin käyttöönotto ei ota sovelluskoodia käyttöön. Suorita sovelluksen tarkastuksia vasta `azd deploy`/`azd up` suorituksen jälkeen, ja käytä `/health` vain, jos sovelluksesi tukee sitä. ARM-käyttöönottoskriptit luovat Azure-resursseja ja tarvitsevat ylimääräisen identiteetin, tukevat ajonaikaiset versiot ja oikeudet; ne eivät ole paikallisia yksikkötestejä.

## 🧪 Infrastruktuurin ennakkoesikatselu ja validointi (UUDESTAAN)

### Ennakkotarkastele infrastruktuurin muutokset ennen käyttöönottoa

`azd provision --preview`-ominaisuus antaa sinun **simuloida infrastruktuurin käyttöönottoa** ennen resurssien todellista käyttöönottoa. Se on samantapainen kuin `terraform plan` tai `bicep what-if`, ja antaa sinulle **kuivan ajon näkymän** siitä, mitä muutoksia Azure-ympäristöösi tehtäisiin.

#### 🛠️ Mitä se tekee
- **Analysoi IaC-mallejasi** (Bicep tai Terraform)
- **Näyttää ennakkonäkymän resurssimuutoksista**: lisäykset, poistot, päivitykset
- **Ei tee ehdotettuja infrastruktuurimuutoksia** — tarkasta ensin projektin koukut; skripteillä voi olla sivuvaikutuksia ja ennakkotarkastus vaatii silti Azure-oikeudet

#### Käyttötapaukset
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Tämä komento auttaa sinua:
- **Vahvistamaan infrastruktuurimuutokset** ennen resurssien sitomista
- **Havaitsemaan virheelliset määritykset varhaisessa kehitysvaiheessa**
- **Yhteistyössä turvallisesti** tiimiympäristöissä
- **Varmistamaan vähimmän oikeuden periaatteen mukaiset käyttöönotot** ilman yllätyksiä

Se on erityisen hyödyllinen, kun:
- Työskentelet monimutkaisissa monipalveluympäristöissä
- Teet muutoksia tuotantoinfrastruktuuriin
- Vahvistat mallimuutoksia ennen PR-hyväksyntää
- Koulutat uusia tiimin jäseniä infrastruktuurimalleihin

### Esimerkki ennakkoesikatselun lopputuloksesta
Tarkka esikatselutuloste vaihtelee toimittajan ja projektin rakenteen mukaan, mutta tuloksen tulisi selkeästi esittää ehdotetut muutokset ennen niiden soveltamista.

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

## �🔄 Resurssipäivitykset ja migraatiot

### Turvalliset resurssipäivitykset
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

### Tietokantamigraatiot
**Epätäydellinen käyttöönotto-skriptimalli:** vaatii määritellyn käyttäjän hallitseman identiteetin tarvittaessa, tuetun Azure CLI -ajoympäristön, saatavilla olevat migraatiotyökalut, toimitetun migraatiokansion/määrityksen ja tietokantayhteydet. Tätä resurssia yksinään liittämällä ei voi ajaa.

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

## 🎯 Parhaat käytännöt

### 1. Resurssien nimeämiskäytännöt
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Tagien käyttöstrategia
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

### 4. Ulostulojen järjestely
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

- [Esikäteissuunnittelu](../chapter-06-pre-deployment/capacity-planning.md) - Vahvista resurssien saatavuus
- [Yleiset ongelmat](../chapter-07-troubleshooting/common-issues.md) - Selvitä infrastruktuuriongelmat
- [Vianmääritysohje](../chapter-07-troubleshooting/debugging.md) - Vianmääritys provisiointiongelmissa
- [SKU-valinta](../chapter-06-pre-deployment/sku-selection.md) - Valitse sopivat palvelutasot

## Lisäresurssit

- [Azure Bicep -dokumentaatio](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager -mallit](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Siirtyminen**
- **Edellinen oppitunti**: [Deployment Guide](deployment-guide.md)
- **Seuraava oppitunti**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->