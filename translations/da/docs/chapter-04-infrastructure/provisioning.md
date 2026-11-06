# Provisionering af Azure-ressourcer med AZD

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 4 - Infrastruktur som kode & Udrulning
- **⬅️ Forrige**: [Udrulningsguide](deployment-guide.md)
- **➡️ Næste kapitel**: [Kapitel 5: Multi-Agent AI-løsninger](../../examples/retail-scenario.md)
- **🔧 Relateret**: [Kapitel 6: Forud-udrulningsvalidering](../chapter-06-pre-deployment/capacity-planning.md)

## Introduktion

Denne vejledning dækker provisionering og administration af Azure-ressourcer ved hjælp af Azure Developer CLI med dens indbyggede Bicep- og Terraform-udbydere.

> Gennemgået mod `azd 1.37.2` (november 2026). Medmindre andet er angivet, er Bicep-, Terraform- og skripteksempler **illustrative uddrag**, ikke en komplet skabelon. Integrer dem i et projekt, der leverer de refererede parametre, moduler, identiteter, netværk og applikationskode. Azure-provisionering blev ikke udført i denne gennemgang.

## Læringsmål

Når du har fuldført denne vejledning vil du:
- Mestre principper for Infrastruktur som kode og provisionering af Azure-ressourcer
- Forstå flere IaC-udbydere understøttet af Azure Developer CLI
- Designe og implementere Bicep-skabeloner til almindelige applikationsarkitekturer
- Konfigurere ressourceparametre, variabler og miljøspecifikke indstillinger
- Implementere avancerede infrastrukturmønstre inklusive netværk og sikkerhed
- Administrere ressource livscyklus, opdateringer og afhængighedsløsning

## Læringsresultater

Efter afslutning vil du kunne:
- Designe og provisionere Azure-infrastruktur med Bicep- og ARM-skabeloner
- Konfigurere komplekse multi-service arkitekturer med korrekte ressourceafhængigheder
- Implementere parameteriserede skabeloner til flere miljøer og konfigurationer
- Fejlsøge problemer med infrastrukturprovisionering og løse udrulningsfejl
- Anvende Azure Well-Architected Framework-principper på infrastrukturelt design
- Administrere infrastrukturopdateringer og implementere versioneringsstrategier for infrastruktur

## Oversigt over infrastrukturopProvisionering

Azure Developer CLI understøtter flere Infrastruktur som kode (IaC) udbydere:
- **Bicep** (anbefalet) - Azures domænespecifikke sprog
- **ARM Templates** - Bicep kompilerer til ARM; rå ARM JSON er ikke en separat indbygget `infra.provider`
- **Terraform** - Multi-cloud infrastrukturværktøj
- **Udvidelsesudbydere** - Kræver en separat installeret udvidelsesudbyder og dens dokumenterede konfiguration; antag ikke, at nogen udbyderstreng understøttes

## Forstå Azure-ressourcer

### Ressourcehierarki
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Almindelige Azure-tjenester for applikationer
- **Compute**: App Service, Container Apps, Functions, Virtuelle maskiner
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep infrastrukturskabeloner

### Grundlæggende Bicep skabelonstruktur
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

For et komplet azd-projekt kaldes dette modul fra et abonnement-skopet `infra/main.bicep`, der opretter en tagget ressourcegruppe og videresender dens omfang. Match `environmentName`/`location` i `main.parameters.json`. `azd-service-name: web`-tagget associerer ressourcen med `services.web`; tilfældige outputnavne alene konfigurerer ikke serviceopdagelse.

### Avancerede Bicep-mønstre

#### Modular Infrastruktur
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

#### Betinget ressourceoprettelse
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

## 🌐 Brug af Terraform med azd

Bicep er azds standard, men azd understøtter også **Terraform**—nyttigt, hvis dit team allerede standardiserer på det, eller du administrerer multi-cloud infrastruktur. azd-arbejdsgangen (`azd up`, `azd provision`, `azd down`) er identisk; kun infrastruktursproget og mappestrukturen ændres.

### Fortæl azd at bruge Terraform

Tilføj en `infra` sektion til `azure.yaml`, der peger på Terraform-udbyderen:

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

### Terraform-mappestruktur

Med Terraform-udbyderen bruger din `infra/` mappe `.tf` filer i stedet for Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Et `main.tf` uddrag

Dette opretter kun en ressourcegruppe og en plan, ikke en deployerbar service. Du skal også erklære inputvariabler, en kompatibel `azurerm` udbyder, webappen og dens servicetag/ressourcenavn-kortlægning.

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

### Hvordan azd forbinder til dine Terraform-outputs

azd læser Terraform **outputs** ind i miljøværdier. Dette uddrag antager, at du har defineret `azurerm_linux_web_app.web`; serviceopdagelse kræver stadig et matchende ressourcenavn eller `azd-service-name`-tag:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Vigtigt:** azd bruger `azd-env-name` tagget og `AZURE_*` outputs til at spore ressourcer pr. miljø. Tag altid din ressourcegruppe med `"azd-env-name" = var.environment_name`, så `azd down` kan finde og fjerne alt.

### Udrul med Terraform

Kommandoerne er præcis de samme som for Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Forudsætning:** Terraform skal være installeret og på din `PATH`. azd styrer Terraform *arbejdsgangen*, men installerer ikke Terraform for dig. For state bruger azd som standard lokal state; for teams, konfigurer en remote backend (for eksempel en Azure Storage backend) i `provider.tf`.

For komplette, kørbare Terraform-baserede starters, se [Awesome AZD gallery](https://azure.github.io/awesome-azd/) og filtrer efter Terraform, eller se den officielle [azd Terraform-dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Andre infrastrukturværktøjer

Pulumi er ikke en indbygget azd 1.37.2 provisioneringsudbyder. At sætte `infra.provider: pulumi` alene etablerer ikke en fungerende integration, og `azd env new` opretter eller vælger ikke automatisk en Pulumi stack. Hvis du bruger et andet IaC-værktøj, følg dokumentationen for en verificeret udvidelsesudbyder eller administrer dens livscyklus eksplicit i din egen arbejdsgang. Dette kursus leverer ikke en Pulumi-udbyder og validerer den ikke.

## 🎯 Valg af hosting for din service

Feltet `host` i `azure.yaml` bestemmer, hvor din kode køres. azd understøtter flere hostingmuligheder—valget af den rette er vigtigere end infrastruktursproget. Her er en begynder-venlig sammenligning:

| `host` værdi | Bedst til | Hvorfor |
|--------------|----------|-----|
| `appservice` | Traditionelle webapps og API'er | Simpleste PaaS; behøver ikke containere |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | Global CDN + gratis SSL, indbygget API support |
| `function` | Begivenhedsdrevne og serverløse arbejdsbyrder | Skaler til nul, betal-per-kørsel |
| `containerapp` | Containeriserede mikrotjenester | Serverløse containere, skaler til nul, indbygget ingress |
| `aks` | Komplekse orkestreringsbehov | Fuld Kubernetes-kontrol, når du virkelig har brug for det |
| `springapp` | Eksisterende Azure Spring Apps udrulninger | Legacy mål; service udfases 31. marts 2028 og er lukket for nye kunder |

### Hvornår skal man vælge AKS

**Azure Kubernetes Service (`host: aks`)** giver dig hele kraften af Kubernetes—tilpassede controllere, servicemeshes, kompleks netværk og finmasket planlægning. Denne kraft medfører operationel overhead: du skal administrere node pools, opgraderinger og klyngenetværk.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Start enklere, hvis du kan.** For de fleste mikrotjenester giver **Container Apps** dig containere, autoskalering og skalering til nul uden at administrere en klynge. Vælg AKS kun, når du behøver Kubernetes-specifikke funktioner.

### Hvornår skal man anvende Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** er en administreret runtime specielt designet til Spring Boot. Den håndterer serviceopdagelse, config server og blå-grøn udrulning, så Java-teams ikke skal køre deres egen infrastruktur.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Vælg ikke Azure Spring Apps til et nyt begynderprojekt: det er lukket for nye kunder og [udgår 31. marts 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Foretræk understøttede alternativer som Container Apps og planlæg migration for eksisterende udrulninger.

## 🗃️ Databaseprovisionering

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
**Forudsætninger for uddrag:** erklær `@secure() param databasePassword string` og brug en stærk leveret værdi. Vælg offentlig adgang **eller** integrer den delegerede subnet/private DNS nedenfor; de to uddrag forbinder sig ikke automatisk.

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

`0.0.0.0` reglen tillader forbindelser fra Azure-tjenester ud over dit eget abonnement. Det er ikke privat netværk; foretræk et restriktivt netværksdesign til rigtige arbejdsbyrder.

## 🔒 Sikkerhed og hemmelighedshåndtering

### Key Vault-integration
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

### Konfiguration af administreret identitet
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

For en systemtildelt identitet, sæt ikke `AZURE_CLIENT_ID` til dens principal-id. En bruger-tildelt identitet bruger sit **client ID**, ikke sit objekt/principal-id. Key Vault-referencen kræver også app-identitetens vault rolle-tildeling og netværksadgang.

## 🌍 Netværk og tilslutning

### Virtuel netværkskonfiguration
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
**Ufuldstændigt arkitekturuuddrag, ikke en deployerbar gateway:** tilføj en dedikeret `gateway-subnet` til VNet sammen med backend-pools, HTTP-indstillinger, lyttere, ruteregler med prioriteter og et TLS-certifikat (eller autoriseret Key Vault-reference). At åbne port 443 alene konfigurerer ikke HTTPS.

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

## 📊 Overvågning og observerbarhed

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

### Tilpassede metrikker og alarmer
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

## 🔧 Miljøspecifikke konfigurationer

### Parameterfiler til forskellige miljøer
De to filer nedenfor er **alternative parameterfil-eksempler**. azd vælger ikke automatisk `main.parameters.dev.json` eller `main.parameters.prod.json` efter miljønavn. Brug den faktiske `main.parameters.json` med miljøsubstitutioner (for eksempel `${APP_SERVICE_SKU=B1}`), og erklær/brug hver parameter i Bicep.

Eksempelindhold for `infra/main.parameters.dev.json`:

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

Eksempelindhold for `infra/main.parameters.prod.json`:

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

### Betinget ressourceprovisionering
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

## 🚀 Avancerede provisioning-mønstre

### Multi-region udrulning
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

### Infrastrukturtest
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Provisionering af infrastruktur udruller ikke din applikationskode. Kør applikationskontroller kun efter `azd deploy`/`azd up`, og brug `/health` kun, hvis din app implementerer det. ARM-udrulningsscripts opretter Azure-ressourcer og kræver yderligere identitet, understøttede runtime-versioner og tilladelser; de er ikke lokale enhedstest.

## 🧪 Infrastrukturforhåndsvisning og validering (NYT)

### Forhåndsvis infrastruktuændringer før udrulning

Funktionen `azd provision --preview` giver dig mulighed for at **simulere infrastrukturlægning** før du rent faktisk udruller ressourcer. Det er i ånd lig med `terraform plan` eller `bicep what-if` og giver dig et **dry-run overblik** over, hvilke ændringer der ville blive foretaget i dit Azure-miljø.

#### 🛠️ Hvad den gør
- **Analyserer dine IaC-skabeloner** (Bicep eller Terraform)
- **Viser en forhåndsvisning af ressourceændringer**: tilføjelser, sletninger, opdateringer
- **Anvender ikke leverandørens foreslåede infrastrukturaændringer** — gennemgå først projektets hooks; scripts kan have bivirkninger, og forhåndsvisning kræver stadig Azure-tilladelser

#### Brugsområder
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Denne kommando hjælper dig med at:
- **Validere infrastruktursændringer** før ressourcer bindes
- **Fange fejlkonfigurationer tidligt** i udviklingscyklussen
- **Samarbejde sikkert** i teammiljøer
- **Sikre mindst privilege-udrulninger** uden overraskelser

Den er særlig nyttig når:
- Du arbejder med komplekse multi-service miljøer
- Du laver ændringer til produktionsinfrastruktur
- Du validerer skabelonændringer før PR-godkendelse
- Du træner nye teammedlemmer i infrastrukturmønstre

### Eksempel på forhåndsvisningsoutput
Det eksakte output til forhåndsvisning varierer med udbyder og projektstruktur, men resultatet bør klart identificere foreslåede ændringer, før noget anvendes.

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

## �🔄 Ressourceopdateringer og migrationer

### Sikker ressourceopdatering
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

### Databasemigrationer
**Ufuldstændigt udrulningsscriptmønster:** kræver en konfigureret bruger-tildelt identitet, hvor nødvendigt, understøttet Azure CLI runtime, tilgængelige migrationsværktøjer, en leveret migrationsmappe/-konfiguration og databaseforbindelse. Det kan ikke eksekveres alene ved at indsætte denne ressource i en skabelon.

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

## 🎯 Bedste praksis

### 1. Ressourcenavngivningskonventioner
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Tagging-strategi
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

### 4. Outputorganisation
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

## Næste trin

- [Planlægning før udrulning](../chapter-06-pre-deployment/capacity-planning.md) - Valider ressource-tilgængelighed
- [Almindelige problemer](../chapter-07-troubleshooting/common-issues.md) - Fejlsøg infrastrukturel problemer
- [Fejlfindingvejledning](../chapter-07-troubleshooting/debugging.md) - Fejlretning af provisioningproblemer
- [SKU-udvælgelse](../chapter-06-pre-deployment/sku-selection.md) - Vælg passende servicelag

## Yderligere ressourcer

- [Azure Bicep-dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager-skabeloner](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Foregående Lektion**: [Deploymentsvejledning](deployment-guide.md)
- **Næste Lektion**: [Kapacitetsplanlægning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->