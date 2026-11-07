# Provisionering av Azure-ressurser med AZD

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 4 - Infrastruktur som kode & Distribusjon
- **⬅️ Forrige**: [Distribusjonsveiledning](deployment-guide.md)
- **➡️ Neste Kapittel**: [Kapittel 5: Multi-Agent AI Løsninger](../../examples/retail-scenario.md)
- **🔧 Relatert**: [Kapittel 6: Forhånds-validering før distribusjon](../chapter-06-pre-deployment/capacity-planning.md)

## Introduksjon

Denne veiledningen dekker provisioning og administrasjon av Azure-ressurser ved bruk av Azure Developer CLI med innebygde Bicep og Terraform leverandører.

> Gjennomgått mot `azd 1.37.2` (November 2026). Med mindre annet er oppgitt, er Bicep, Terraform og skripteksempler **illustrative fragmenter**, ikke en komplett mal. Slå dem sammen i et prosjekt som leverer de refererte parametrene, modulene, identitetene, nettverk og applikasjonskode. Azure-provisioning ble ikke utført i denne gjennomgangen.

## Læringsmål

Ved å fullføre denne veiledningen vil du:
- Mestre prinsippene for Infrastruktur som Kode og Azure-ressursprovisionering
- Forstå flere IaC-leverandører støttet av Azure Developer CLI
- Designe og implementere Bicep-maler for vanlige applikasjonsarkitekturer
- Konfigurere ressursparametere, variabler og miljøspesifikke innstillinger
- Implementere avanserte infrastrukturmønstre inkludert nettverk og sikkerhet
- Håndtere ressurslivssyklus, oppdateringer og avhengighetsløsning

## Læringsresultater

Ved fullføring vil du kunne:
- Designe og provisjonere Azure-infrastruktur ved bruk av Bicep og ARM-maler
- Konfigurere komplekse multi-tjeneste arkitekturer med riktige ressursavhengigheter
- Implementere parameteriserte maler for flere miljøer og konfigurasjoner
- Feilsøke problemer med infrastrukturprovisionering og løse distribusjonsfeil
- Anvende Azure Well-Architected Framework-prinsipper på infrastrukturområdet
- Håndtere infrastruktuoppdateringer og implementere versjoneringsstrategier for infrastruktur

## Oversikt over Infrastrukturprovisionering

Azure Developer CLI støtter flere Infrastructure as Code (IaC) leverandører:
- **Bicep** (anbefalt) - Azures domene-spesifikke språk
- **ARM-maler** - Bicep kompileres til ARM; rå ARM JSON er ikke en separat innebygd `infra.provider`
- **Terraform** - Multi-cloud infrastrukturverktøy
- **Utvidelsesleverandører** - Krever egen installert leverandørutvidelse og dens dokumenterte konfigurasjon; anta ikke at noen leverandørstreng støttes

## Forstå Azure-ressurser

### Ressurshierarki
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Vanlige Azure-tjenester for applikasjoner
- **Compute**: App Service, Container Apps, Functions, Virtuelle Maskiner
- **Lagring**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Nettverk**: Virtuelt Nettverk, Application Gateway, CDN
- **Sikkerhet**: Key Vault, Application Insights, Logganalyse
- **AI/ML**: Azure AI-tjenester, Azure OpenAI, Azure Machine Learning

## Bicep Infrastrukturmaler

### Grunnleggende Bicep-malstruktur
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

For et komplett azd-prosjekt, kall denne modulen fra et abonnement-skalert `infra/main.bicep` som oppretter en tagget ressursgruppe og sender med dens scope. Match `environmentName`/`location` i `main.parameters.json`. `azd-service-name: web`-merket kobler ressursen til `services.web`; vilkårlige output-navn alene konfigurerer ikke tjenesteoppdagelse.

### Avanserte Bicep-mønstre

#### Modulær Infrastruktur
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

#### Betinget Ressursskapning
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

## 🌐 Bruke Terraform med azd

Bicep er standard for azd, men azd støtter også **Terraform**—nyttig hvis teamet ditt allerede standardiserer på det eller du håndterer multi-cloud infrastruktur. azd-arbeidsflyten (`azd up`, `azd provision`, `azd down`) er identisk; bare infrastrukturen språk og mappeoppsett endres.

### Fortell azd å bruke Terraform

Legg til en `infra` seksjon i `azure.yaml` som peker på Terraform-leverandøren:

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

### Terraform mappestruktur

Med Terraform-leverandøren bruker din `infra/` mappe `.tf` filer i stedet for Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Et `main.tf` fragment

Dette oppretter bare en ressursgruppe og plan, ikke en utplasserbar tjeneste. Du må også erklære inputvariabler, en kompatibel `azurerm` leverandør, web-appen og dens tjeneste-tag/ressursnavnkartlegging.

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

### Hvordan azd kobler til dine Terraform-outputs

azd leser Terraform **outputs** inn i miljøverdier. Dette fragmentet forutsetter at du har definert `azurerm_linux_web_app.web`; tjenesteoppdagelse krever fremdeles et samsvarende ressursnavn eller `azd-service-name`-tag:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Viktig:** azd bruker `azd-env-name`-taggen og `AZURE_*` outputs for å spore ressurser per miljø. Merk alltid ressursgruppen din med `"azd-env-name" = var.environment_name` slik at `azd down` kan finne og fjerne alt.

### Distribuer med Terraform

Kommandoene er nøyaktig de samme som for Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Forutsetning:** Terraform må være installert og på din `PATH`. azd styrer Terraform *arbeidsflyt* men installerer ikke Terraform for deg. For state bruker azd som standard lokal state; for team konfigurer en ekstern backend (for eksempel Azure Storage backend) i `provider.tf`.

For fullstendige, kjørbare Terraform-baserte startere, bla gjennom [Awesome AZD-galleriet](https://azure.github.io/awesome-azd/) og filtrer på Terraform, eller se den offisielle [azd Terraform-dokumentasjonen](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Andre Infrastrukturverktøy

Pulumi er ikke en innebygd azd 1.37.2 provisioning-leverandør. Å sette `infra.provider: pulumi` alene etablerer ikke en fungerende integrasjon, og `azd env new` oppretter/velger ikke automatisk en Pulumi stack. Hvis du bruker et annet IaC-verktøy, følg dokumentasjonen til en verifisert leverandørutvidelse eller håndter livssyklusen eksplisitt i din egen arbeidsflyt. Dette kurset leverer ikke og validerer ikke en Pulumi-leverandør.

## 🎯 Velge en host for tjenesten din

`host`-feltet i `azure.yaml` avgjør hvor koden din kjører. azd støtter flere hosts—å velge riktig er viktigere enn infrastrukturspråket. Her er en nybegynnervennlig sammenligning:

| `host` verdi | Best for | Hvorfor |
|--------------|----------|-----|
| `appservice` | Tradisjonelle webapper og API-er | Enkleste PaaS; ingen containere kreves |
| `staticwebapp` | Front-end SPAer (React, Vue, Angular) | Global CDN + gratis SSL, innebygd API-støtte |
| `function` | Hendelsesdrevne og serverløse arbeidsbelastninger | Skaler til null, betal per utførelse |
| `containerapp` | Containeriserte mikrotjenester | Serverløse containere, skaler til null, innebygd ingress |
| `aks` | Komplekse orkestreringsbehov | Full Kubernetes-kontroll når du virkelig trenger det |
| `springapp` | Eksisterende Azure Spring Apps distribusjoner | Legacy-mål; tjenesten avvikles 31. mars 2028 og er stengt for nye kunder |

### Når nå etter AKS

**Azure Kubernetes Service (`host: aks`)** gir deg full kraft av Kubernetes—egendefinerte controllere, tjenestemesh, kompleks nettverk og finmasket planlegging. Den kraften følger med operasjonell overhead: du håndterer node pools, oppgraderinger og nettverkskluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Start enklere hvis du kan.** For de fleste mikrotjenester gir **Container Apps** deg containere, autoskalering og skaler-til-null uten å håndtere et klynge. Velg AKS bare når du trenger Kubernetes-spesifikke funksjoner.

### Når bruke Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** er et administrert runtime bygget for Spring Boot. Det håndterer tjenesteoppdagelse, konfigurasjonsserver og blå-grønn distribusjon slik at Java-team ikke trenger å drifte egen infrastruktur.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Velg ikke Azure Spring Apps for et nytt nybegynnerprosjekt: det er stengt for nye kunder og [avvikles 31. mars 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Foretrekk støttede alternativer som Container Apps og planlegg migrasjon for eksisterende distribusjoner.

## 🗃️ Databasedistribusjon

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
**Fragment-forutsetninger:** erklær `@secure() param databasePassword string` og bruk en sterk levert verdi. Velg offentlig tilgang **eller** integrer delegert subnett/privat DNS nedenfor; de to snuttene kobler seg ikke automatisk sammen.

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

`0.0.0.0` regelen tillater tilkoblinger fra Azure-tjenester utover ditt eget abonnement. Det er ikke privat nettverk; foretrekk en begrenset nettverksdesign for reelle arbeidsbelastninger.

## 🔒 Sikkerhet og hemmelighetsbehandling

### Key Vault-integrasjon
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

### Administrert identitetskonfigurasjon
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

For en system-tilordnet identitet, sett ikke `AZURE_CLIENT_ID` til dens principal-ID. En bruker-tilordnet identitet bruker sin **client ID**, ikke objekt/principal-ID. Key Vault-referansen trenger også app-identitetens vault rolle-tilordning og nettverkstilgang.

## 🌍 Nettverk og Tilkobling

### Virtuell Nettverkskonfigurasjon
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

### Application Gateway med SSL
**Ufullstendig arkitekturfragment, ikke en utplasserbar gateway:** legg til en dedikert `gateway-subnet` til VNet pluss backend-pooler, HTTP-innstillinger, lyttere, ruteregler med prioriteringer, og et TLS-sertifikat (eller autorisert Key Vault-referanse). Åpning av port 443 alene konfigurerer ikke HTTPS.

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

## 📊 Overvåking og Observerbarhet

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

### Egne metrikk og varsler
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

## 🔧 Miljøspesifikke konfigurasjoner

### Parameterfiler for forskjellige miljøer
De to filene nedenfor er **alternative parameterfil-eksempler**. azd velger ikke automatisk `main.parameters.dev.json` eller `main.parameters.prod.json` etter miljønavn. Bruk den faktiske `main.parameters.json` med miljøsubstitusjoner (f.eks. `${APP_SERVICE_SKU=B1}`), og deklarer/bruk hver parameter i Bicep.

Eksempelinnhold for `infra/main.parameters.dev.json`:

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

Eksempelinnhold for `infra/main.parameters.prod.json`:

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

### Betinget ressursprovisionering
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

## 🚀 Avanserte provisjoneringsmønstre

### Multi-region distribusjon
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

### Infrastrukturtesting
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Provisionering av infrastruktur distribuerer ikke applikasjonskoden din. Kjør applikasjonskontroller kun etter `azd deploy`/`azd up`, og bruk `/health` kun hvis appen din implementerer den. ARM-distribusjonsskript oppretter Azure-ressurser og krever ekstra identitet, støttede runtime-versjoner og tillatelser; de er ikke lokale enhetstester.

## 🧪 Infrastrukturforhåndsvisning & Validering (NY)

### Forhåndsvis infrastruktendringer før distribusjon

Funksjonen `azd provision --preview` lar deg **simulere infrastrukturprovisjonering** før du faktisk distribuerer ressurser. Den er lik i ånd til `terraform plan` eller `bicep what-if`, og gir deg en **tørrkjøringsvisning** av hvilke endringer som ville bli gjort i Azure-miljøet ditt.

#### 🛠️ Hva den gjør
- **Analyserer dine IaC-maler** (Bicep eller Terraform)
- **Viser en forhåndsvisning av ressursendringer**: tillegg, slettinger, oppdateringer
- **Utfører ikke leverandørens foreslåtte infrastrukturendringer** — undersøk prosjektets kroker først; skript kan ha bivirkninger, og forhåndsvisning krever fortsatt Azure-tillatelser

#### Brukstilfeller
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Denne kommandoen hjelper deg med å:
- **Validere infrastrukturendringer** før du godkjenner ressurser
- **Fange opp feilkonfigurasjoner tidlig** i utviklingssyklusen
- **Samarbeide trygt** i teammiljøer
- **Sikre minste privilegium-distribusjoner** uten overraskelser

Det er spesielt nyttig når du:
- Arbeider med komplekse miljøer med flere tjenester
- Gjør endringer i produksjonsinfrastruktur
- Validerer malendringer før PR-godkjenning
- Opplæring av nye teammedlemmer i infrastrukturmønstre

### Eksempel på forhåndsvisning av output
Eksakt forhåndsvisningsoutput varierer etter leverandør og prosjektstruktur, men resultatet skal klart identifisere foreslåtte endringer før noe blir anvendt.

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

## �🔄 Ressursoppdateringer og migrasjoner

### Trygge ressursoppdateringer
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

### Databasemigrasjoner
**Ufullstendig distribusjonsskriptmønster:** krever en konfigurert bruker-tilordnet identitet hvor det er nødvendig, støttet Azure CLI runtime, tilgjengelige migreringsverktøy, en angitt migreringsmappe/-konfigurasjon og databaseforbindelse. Kan ikke kjøres bare ved å lime denne ressursen inn i en mal.

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

## 🎯 Beste praksis

### 1. Ressursnavnekonvensjoner
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Taggingstrategi
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

### 3. Parametervalidering
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

### 4. Utdataorganisering
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

## Neste steg

- [Forhåndsplanlegging](../chapter-06-pre-deployment/capacity-planning.md) - Validere ressurs tilgjengelighet
- [Vanlige problemer](../chapter-07-troubleshooting/common-issues.md) - Feilsøke infrastrukturproblemer
- [Feilsøkingsguide](../chapter-07-troubleshooting/debugging.md) - Feilsøking av provisjoneringsproblemer
- [SKU-valg](../chapter-06-pre-deployment/sku-selection.md) - Velg passende tjenestenivåer

## Ytterligere ressurser

- [Azure Bicep-dokumentasjon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager-maler](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigasjon**
- **Forrige leksjon**: [Distribusjonsguide](deployment-guide.md)
- **Neste leksjon**: [Kapasitetsplanlegging](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->