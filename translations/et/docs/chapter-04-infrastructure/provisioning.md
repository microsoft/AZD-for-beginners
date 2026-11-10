# Azure'i ressursside ettevalmistamine AZD-ga

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 4 - Infrastruktuur koodina & juurutamine
- **⬅️ Eelmine**: [Juurutamise juhend](deployment-guide.md)
- **➡️ Järgmine peatükk**: [Peatükk 5: Mitme agenti AI lahendused](../../examples/retail-scenario.md)
- **🔧 Seotud**: [Peatükk 6: Eeljuurutuse valideerimine](../chapter-06-pre-deployment/capacity-planning.md)

## Sissejuhatus

Käesolev juhend käsitleb Azure'i ressursside ettevalmistamist ja haldamist kasutades Azure Developer CLI-d koos selle sisseehitatud Bicep ja Terraform pakkujatega.

> Kontrollitud vastavalt `azd 1.37.2` (november 2026). Kui ei ole teisiti märgitud, on Bicep-, Terraform- ja skriptinäited **illustreerivad fragmendid**, mitte täielik mall. Ühenda need projekti, mis pakub viidatud parameetreid, mooduleid, identiteete, võrgustikku ja rakenduse koodi. Azure'i ettevalmistamine ei toimunud selle ülevaate käigus.

## Õpieesmärgid

Käesoleva juhendi lõpetamisega:
- Saad valda Infrastruktuuri koodina põhimõtteid ja Azure'i ressursside ettevalmistamist
- Mõistad mitmeid IaC pakkujaid, mida toetab Azure Developer CLI
- Kujundad ja rakendad Bicep malle tavapäraste rakendusarhitektuuride jaoks
- Konfigureerid ressursi parameetreid, muutujaid ja keskkondlikke seadeid
- Rakendad täiustatud infrastruktuuri mustreid, sh võrgustikud ja turvalisus
- Halad ressursi elutsüklit, uuendusi ja sõltuvuste lahendamist

## Õpitulemused

Pärast juhendi lõpetamist suudad:
- Kujundada ja ette valmistada Azure infrastruktuuri kasutades Bicep ja ARM malle
- Konfigureerida keerukaid mitmeteenuseid arhitektuure koos sobivate ressursside sõltuvustega
- Rakendada parameetriseeritud malle mitmes keskkonnas ja konfiguratsioonis
- Lahendada infrastruktuuri ettevalmistamise probleeme ja juurutamise tõrkeid
- Rakendada Azure hästi kujundatud raamistikupõhimõtteid infrastruktuuri disainis
- Hallata infrastruktuuri uuendusi ja rakendada infrastruktuuri versioonihaldusstrateegiaid

## Infrastruktuuri ettevalmistamise ülevaade

Azure Developer CLI toetab mitut Infrastruktuur kui Kood (IaC) pakkujat:
- **Bicep** (soovitatav) - Azure'i domeenispetsiifiline keel
- **ARM mallid** - Bicep kompileerib ARM-iks; puhast ARM JSON-i ei ole eraldi sisseehitatud `infra.provider`
- **Terraform** - Mitme pilve infrastruktuuri tööriist
- **Laienduse pakkujad** - Vajavad eraldi paigaldatud pakkuja laiendust ja selle dokumenteeritud konfiguratsiooni; ära eelda, et mõni pakkuja string oleks toetatud

## Azure ressursside mõistmine

### Ressursside hierarhia
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Rakenduste jaoks levinud Azure teenused
- **Arvutus**: App Service, Container Apps, Functions, Virtuaalmasinad
- **Salvestus**: Salvestuskonto, Cosmos DB, SQL andmebaas, PostgreSQL
- **Võrgustik**: Virtuaalne võrk, Rakenduse värav, CDN
- **Turvalisus**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI teenused, Azure OpenAI, Azure Machine Learning

## Bicep infrastruktuuri mallid

### Bicep malli põhiline struktuur
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

Täieliku azd projekti jaoks kutsu see moodul tellimustasandil asuvast `infra/main.bicep`, mis loob sildistatud ressursigrupi ja edastab selle ulatuse. Sobita `environmentName`/`location` `main.parameters.json` sees. `azd-service-name: web` silt seob ressursi `services.web`; meelevaldsete väljundinimedega üksinda ei konfigureerita teenuse avastamist.

### Täiustatud Bicep mustrid

#### Moodulipõhine infrastruktuur
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

#### Tingimuslik ressursi loomine
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

## 🌐 Terraformi kasutamine azd-ga

Bicep on azd vaikimisi, kuid azd toetab ka **Terraformi** – kasulik, kui sinu meeskond juba standardiseerib selle peale või haldad mitmepilve infrastruktuuri. azd töövoog (`azd up`, `azd provision`, `azd down`) on identsed; muutub ainult infrastruktuuri keel ja kaustastruktuur.

### Ütle azd-le, et kasutaks Terraformi

Lisa `infra` sektsioon `azure.yaml`, mis osutab Terraformi pakkujale:

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

### Terraformi kaustastruktuur

Terraformi pakkujaga kasutab sinu `infra/` kaust `.tf` faile Bicepi asemel:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### `main.tf` fragment

See loob ainult ressursigrupi ja plaani, mitte juurutatavat teenust. Sa pead ka deklariseerima sisendimuutujad, sobiva `azurerm` pakkuja, veebirakenduse ja selle teenuse silti/ressursi nime kaardi.

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

### Kuidas azd ühendub su Terraform väljunditega

azd loeb Terraformi **väljundid** keskkonnamuutujatesse. See fragment eeldab, et oled määratlenud `azurerm_linux_web_app.web`; teenuse avastamiseks on endiselt vaja sobivat ressursinime või `azd-service-name` silti:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Tähtis:** azd kasutab `azd-env-name` silti ja `AZURE_*` väljundeid, et jälgida ressursse iga keskkonna kohta. Alati märgista oma ressursigrupp `"azd-env-name" = var.environment_name` abil, et `azd down` leiaks ja eemaldaks kõik.

### Juuruta Terraformiga

Käsklused on täpselt samad mis Bicepiga:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Eeldus:** Terraform peab olema installitud ja sinu `PATH` sees. azd haldab Terraformi *töövoogu*, kuid ei paigalda seda sinu eest. Oleku jaoks kasutab azd vaikimisi kohalikku olekut; meeskondade jaoks seadista kauge tagapõhi (näiteks Azure Storage tagapõhi) `provider.tf`.

Täielike, käivitatavate Terraformi-põhiste algprojektide jaoks sirvi [Awesome AZD galeriid](https://azure.github.io/awesome-azd/) ja filtreeri Terraformi järgi või vaata ametlikku [azd Terraformi dokumentatsiooni](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Muud infrastruktuuritööriistad

Pulumi ei ole sisseehitatud azd 1.37.2 ettevalmistuse pakkuja. Ainult `infra.provider: pulumi` seadmine ei loo töötavat integratsiooni, ja `azd env new` ei loo ega vali automaatselt Pulumi virna. Kui kasutad mõnda muud IaC tööriista, järgi kinnitatud pakkuja laienduse dokumentatsiooni või halda selle elutsüklit oma töövoos selgelt. Käesolev kursus ei paku ega valideeri Pulumi pakkujat.

## 🎯 Teenuse majutuse valik

Välja `host` sees `azure.yaml` otsustab, kus sinu kood jookseb. azd toetab mitut majutuskeskkonda – õige valik on olulisem kui infrastruktuuri keel. Siin on algajasõbralik võrdlus:

| `host` väärtus | Parim jaoks | Miks |
|--------------|-------------|------|
| `appservice` | Traditsioonilised veebirakendused ja APId | Lihtsaim PaaS; konteinerid pole vajalikud |
| `staticwebapp` | Esirea SPA-d (React, Vue, Angular) | Globaalne CDN + tasuta SSL, sisseehitatud API tugi |
| `function` | Sündmusel põhinevad ja serverivabad töömikud | Skaalumine nulli ja tasu käitumise järgi |
| `containerapp` | Konteineriseeritud mikroteenused | Serverivad konteinerid, skaala nulli, sisseehitatud sissetulek |
| `aks` | Keerukad orkestreerimisvajadused | Täielik Kubernetes juhtimine, kui seda päriselt vajad |
| `springapp` | Olemasolevad Azure Spring Apps juurutused | Päritud sihtkoht; teenus lõpetatakse 31. märtsil 2028 ja on uutele klientidele suletud |

### Millal valida AKS

**Azure Kubernetes Service (`host: aks`)** annab sulle Kubernetes'i täisvõimsuse — kohandatud kontrollerid, teenuse meshid, keerukas võrgustik ja detailne ajastamine. See võimsus toob kaasa ka operatiivse koormuse: haldad sõlmede kelli, uuendusi ja klastrivõrgustikku.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Alusta lihtsamalt kui saad.** Enamiku mikroteenuste puhul annab **Container Apps** konteinerid, automaatse skaleerimise ja nulli skaleerimise ilma, et peaksid klastrit haldama. Vali AKS ainult siis, kui vajad Kubernetes-spetsiifilisi funktsioone.

### Millal kasutada Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** on hallatav tööaeg, mis on spetsiaalselt loodud Spring Boot'ile. See haldab teenuse avastamist, konfiguratsiooniserverit ja sinise-rohelise juurutamist, nii et Java meeskonnad ei pea oma infrastruktuuri jooksutama.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Ära vali Azure Spring Appsi uue algajaprojekti jaoks: see on uutele klientidele suletud ja [lõpetatakse 31. märtsil 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Eelista toetatud alternatiive nagu Container Apps ja planeeri migratsiooni olemasolevatele juurutustele.

## 🗃️ Andmebaaside ettevalmistamine

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
**Fragmentide eeltingimused:** deklareeri `@secure() param databasePassword string` ja kasuta tugevat sisendväärtust. Vali avalik juurdepääs **või** integreeri allpool olev volitatud alamvõrk/privaatne DNS; need kaks lõiku ei ühendu automaatselt omavahel.

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

`0.0.0.0` reegel lubab ühendusi Azure teenustest väljaspool sinu tellimust. See ei ole privaatne võrgustik; eelistada tuleks piiratud võrgudisaini päris töökoormuste jaoks.

## 🔒 Turvalisus ja saladuste haldamine

### Key Vaulti integratsioon
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

### Hallatud identiteedi konfigureerimine
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

Süsteemi määratud identiteedi puhul ära sea `AZURE_CLIENT_ID` selle põhi-ID-ks. Kasutaja määratud identiteet kasutab oma **kliendi ID-d**, mitte objekti/põhijuhte. Key Vaulti viide vajab ka rakenduse identiteedi võtmehoidla rolli määramist ja võrgule juurdepääsu.

## 🌍 Võrgustik ja ühenduvus

### Virtuaalvõrgu konfigureerimine
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

### Rakenduse värav SSL-iga
**Täitmata arhitektuuri fragment, mitte juurutatav värav:** lisa pühendatud `gateway-subnet` virtuaalvõrku koos tagapoolsete basseinidega, HTTP seadistuste, kuulajate, marsruutimisreeglite prioriteetidega ja TLS sertifikaadiga (või volitatud Key Vaulti viitega). Ainult pordi 443 avamine ei konfigureeri HTTPS-i.

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

## 📊 Järelevalve ja jälgitavus

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

### Kohandatud mõõdikud ja hoiatused
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

## 🔧 Keskkonnaspetsiifilised konfiguratsioonid

### Parameeterfailid erinevatele keskkondadele
Järgmised kaks faili on **alternatiivsed parameeterfailide näited**. azd ei vali ülesannete järgi automaatselt `main.parameters.dev.json` ega `main.parameters.prod.json`. Kasuta tegelikku `main.parameters.json` koos keskkonna asendustega (nt `${APP_SERVICE_SKU=B1}`) ja deklareeri/kasuuta iga parameetrit Bicepis.

Näidis sisu jaoks `infra/main.parameters.dev.json`:

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

Näidis sisu jaoks `infra/main.parameters.prod.json`:

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

### Tingimuslik ressursi ettevalmistamine
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

## 🚀 Täiustatud ettevalmistuse mustrid

### Mitmeregiooniline juurutus
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

### Infrastruktuuri testimine
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Infrastruktuuri ettevalmistamine ei juuruta sinu rakenduse koodi. Käivita rakenduse testid alles pärast `azd deploy`/`azd up` ja kasuta `/health` ainult, kui sinu rakendus seda toetab. ARM juurutusskriptid loovad Azure ressursid ja nõuavad täiendavat identiteeti, toetatud runtime versioone ja õigusi; need ei ole kohalikud ühikutestid.

## 🧪 Infrastruktuuri eelvaade ja valideerimine (UUS)

### Eelvaata muudatusi enne juurutamist

`azd provision --preview` funktsioon võimaldab sul **simuleerida infrastruktuuri ettevalmistamist** enne tegelike ressursside juurutamist. See on sarnane `terraform plan` või `bicep what-if` vaimule, pakudes sulle **kuiva jooksu eelvaadet** sellest, milliseid muudatusi su Azure keskkonnas tehakse.

#### 🛠️ Mida see teeb
- **Analüüsib sinu IaC malle** (Bicep või Terraform)
- **Näitab ressursside muudatuste eelvaadet**: lisamise, kustutamise, uuendamisega
- **Ei rakenda pakkuja pakutud infrastruktuuri muudatusi** — vaata enne projekti haake; skriptid võivad omada kõrvalmõjusid ja eelvaade vajab ikkagi Azure'i õigusi

#### Kasutusjuhtumid
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

See käsk aitab sul:
- **Valideerida infrastruktuuri muudatusi** enne ressursside pühendumist
- **Tuvastada valekonfiguratsioone varakult** arendustsükli jooksul
- **Töötada turvaliselt meeskondlikes keskkondades**
- **Tagada vähimate õigustega juurutused** ilma üllatusteta

See on eriti kasulik, kui:
- Töötad keerukate mitmeteenuste keskkondadega
- Teed muudatusi tootmise infrastruktuuris
- Valideerid malli muudatusi enne PR kinnitamist
- Koolitad uusi meeskonnaliikmeid infrastruktuuri mustrite osas

### Näidis eelvaate väljund
Täpne eelvaate väljund varieerub pakkuja ja projekti struktuuri järgi, kuid tulemus peaks selgelt näitama kavandatud muudatusi enne, kui midagi rakendatakse.

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

## �🔄 Ressursside uuendused ja migratsioonid

### Turvalised ressursi uuendused
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

### Andmebaasi migratsioonid
**Puudulik juurutusskriptide muster:** vajab konfigureeritud kasutaja määratud identiteeti seal, kus vaja, toetatud Azure CLI runtime'i, saadaval migratsioonitööriistu, antud migratsioonikausta/konfiguratsiooni ja andmebaasi ühenduvust. See ei ole täidetav ainult selle ressursi mallisse kleepimisega.

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

## 🎯 Parimad praktikad

### 1. Ressursside nimetamise konventsioonid
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Sildistamise strateegia
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

### 3. Parameetrite valideerimine
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

### 4. Väljundite organiseerimine
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

## Järgmised sammud

- [Eeljuurutuse planeerimine](../chapter-06-pre-deployment/capacity-planning.md) - Hoolitse ressursside olemasolu eest
- [Levinud probleemid](../chapter-07-troubleshooting/common-issues.md) - Lahenda infrastruktuuri tõrkeid
- [Silumise juhend](../chapter-07-troubleshooting/debugging.md) - tõrkeotsing potentsiaalsetes varustuse probleemides
- [SKU valik](../chapter-06-pre-deployment/sku-selection.md) - vali sobivad teenustasemed

## Täiendavad ressursid

- [Azure Bicep dokumentatsioon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager mallid](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure arhitektuuri keskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hästi arhitektuuri raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigeerimine**
- **Eelmine õppetükk**: [Kohaleviimise juhend](deployment-guide.md)
- **Järgmine õppetükk**: [Mahtude planeerimine](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->