# Provisionering av Azure-resurser med AZD

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 4 - Infrastruktur som kod & distribution
- **⬅️ Föregående**: [Deploymentsguide](deployment-guide.md)
- **➡️ Nästa kapitel**: [Kapitel 5: Multi-Agent AI-lösningar](../../examples/retail-scenario.md)
- **🔧 Relaterat**: [Kapitel 6: Validering före distribution](../chapter-06-pre-deployment/capacity-planning.md)

## Introduktion

Denna guide täcker provisionering och hantering av Azure-resurser med Azure Developer CLI och dess inbyggda Bicep- och Terraform-leverantörer.

> Granskad mot `azd 1.37.2` (november 2026). Om inget annat anges är Bicep-, Terraform- och skriptexempel **illustrativa fragment**, inte kompletta mallar. Slå ihop dem i ett projekt som tillhandahåller refererade parametrar, moduler, identiteter, nätverk och applikationskod. Azure-provisionering utfördes inte vid denna granskning.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Behärska principer för Infrastruktur som kod och Azure-provisionering
- Förstå flera IaC-leverantörer som stöds av Azure Developer CLI
- Designa och implementera Bicep-mallar för vanliga applikationsarkitekturer
- Konfigurera resursparametrar, variabler och miljöspecifika inställningar
- Implementera avancerade infrastrukturmönster inklusive nätverk och säkerhet
- Hantera resurslivscykel, uppdateringar och beroendehantering

## Läranderesultat

Efter slutförande kommer du att kunna:
- Designa och provisionera Azure-infrastruktur med Bicep- och ARM-mallar
- Konfigurera komplexa fler-tjänstarkitekturer med korrekta resursberoenden
- Implementera parameteriserade mallar för flera miljöer och konfigurationer
- Felsöka infrastruktursproblem och åtgärda distributionsfel
- Tillämpa Azure Well-Architected Framework-principer för infrastruktursdesign
- Hantera infrastrukturoppdateringar och implementera versioneringsstrategier för infrastruktur

## Översikt över Infrastrukturprovisionering

Azure Developer CLI stöder flera Infrastruktur som kod (IaC) leverantörer:
- **Bicep** (rekommenderat) - Azures domänspecifika språk
- **ARM Templates** - Bicep kompilerar till ARM; rå ARM JSON är ingen separat inbyggd `infra.provider`
- **Terraform** - Multi-cloud infrastrukturverktyg
- **Tilläggsleverantörer** - Kräver separat installerad leverantörstillägg och dess dokumenterade konfiguration; anta inte att någon leverantörssträng stöds

## Förståelse av Azure-resurser

### Resurshierarki
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Vanliga Azure-tjänster för applikationer
- **Compute**: App Service, Container Apps, Functions, Virtuella maskiner
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtuellt nätverk, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep Infrastrukturmallar

### Grundläggande Bicep-mallstruktur
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

För ett komplett azd-projekt, anropa denna modul från en prenumerationsomfattande `infra/main.bicep` som skapar en taggad resursgrupp och överför dess omfång. Matcha `environmentName`/`location` i `main.parameters.json`. Taggen `azd-service-name: web` associerar resursen med `services.web`; godtyckliga utdata-namn konfigurerar inte tjänsteupptäckt ensamma.

### Avancerade Bicep-mönster

#### Modulär infrastruktur
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

#### Villkorlig skapelse av resurser
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

## 🌐 Använda Terraform med azd

Bicep är azd:s standard, men azd stöder också **Terraform**—nyttigt om ditt team redan standardiserar på det eller du hanterar multi-cloud infrastruktur. azd-arbetsflödet (`azd up`, `azd provision`, `azd down`) är identiskt; bara infrastrukturspråk och mappstruktur ändras.

### Säg till azd att använda Terraform

Lägg till en `infra`-sektion i `azure.yaml` som pekar på Terraform-leverantören:

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

### Terraform mappstruktur

Med Terraform-leverantören använder din `infra/`-mapp `.tf`-filer istället för Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Ett `main.tf` fragment

Detta skapar endast en resursgrupp och plan, inte en distribuerbar tjänst. Du måste också deklarera indata-variabler, en kompatibel `azurerm` leverantör, webbappen och dess tjänsttagg/resursnamnskarta.

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

### Hur azd ansluter till dina Terraform-utdata

azd läser Terraform **utdata** till miljövärden. Detta fragment förutsätter att du har definierat `azurerm_linux_web_app.web`; tjänsteupptäckt kräver fortfarande ett matchande resursnamn eller `azd-service-name`-tagg:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Viktigt:** azd använder `azd-env-name`-taggen och `AZURE_*`-utdata för att spåra resurser per miljö. Tagga alltid din resursgrupp med `"azd-env-name" = var.environment_name` så att `azd down` kan hitta och ta bort allt.

### Distribuera med Terraform

Kommandona är exakt samma som för Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Förutsättning:** Terraform måste vara installerat och finnas på din `PATH`. azd hanterar Terraform *arbetsflöde* men installerar inte Terraform åt dig. För state använder azd standardmässigt lokal state; för team, konfigurera en fjärrbackend (t.ex. Azure Storage backend) i `provider.tf`.

För kompletta, körbara Terraform-baserade starters, bläddra i [Awesome AZD-galleriet](https://azure.github.io/awesome-azd/) och filtrera på Terraform, eller se den officiella [azd Terraform-dokumentationen](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Andra Infrastrukturverktyg

Pulumi är inte en inbyggd azd 1.37.2 provisioneringsleverantör. Att bara sätta `infra.provider: pulumi` skapar inte en fungerande integration, och `azd env new` skapar eller väljer inte automatiskt en Pulumi-stack. Om du använder ett annat IaC-verktyg, följ en verifierad leverantörstilläggs dokumentation eller hantera dess livscykel explicit i ditt eget arbetsflöde. Denna kurs tillhandahåller inte eller validerar en Pulumi-leverantör.

## 🎯 Val av värd för din tjänst

Fältet `host` i `azure.yaml` avgör var din kod körs. azd stödjer flera värdar—att välja rätt är viktigare än infrastrukturspråket. Här är en nybörjarvänlig jämförelse:

| `host` värde | Bäst för | Varför |
|--------------|----------|-----|
| `appservice` | Traditionella webbappar och API:er | Enklast PaaS; inga containerkrav |
| `staticwebapp` | Front-end SPA:er (React, Vue, Angular) | Global CDN + gratis SSL, inbyggt API-stöd |
| `function` | Event-driven och serverlösa arbetsbelastningar | Skala till noll, betalning per körning |
| `containerapp` | Containeriserade mikrotjänster | Serverlösa containers, skala till noll, inbyggd ingress |
| `aks` | Komplex orkestreringsbehov | Full kontroll över Kubernetes när du verkligen behöver det |
| `springapp` | Befintliga distributioner av Azure Spring Apps | Legacy-mål; tjänsten läggs ner 31 mars 2028 och är stängd för nya kunder |

### När man ska använda AKS

**Azure Kubernetes Service (`host: aks`)** ger dig full kraft av Kubernetes—anpassade kontroller, tjänst-meshar, komplex nätverkssättning och finmaskig schemaläggning. Den kraften medför operativ belastning: du hanterar nodpooler, uppgraderingar och klusternätverk.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Börja enklare om du kan.** För de flesta mikrotjänster ger **Container Apps** dig containers, autoskalning och skala-till-noll utan att hantera ett kluster. Välj AKS endast när du behöver Kubernetes-specifika funktioner.

### När man använder Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** är en hanterad runtime specialbyggd för Spring Boot. Den hanterar tjänsteupptäckt, config-server och blue-green deployment så att Java-team inte behöver driva egen infrastruktur.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Välj inte Azure Spring Apps för ett nytt nybörjarprojekt: det är stängt för nya kunder och [läggs ner 31 mars 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Föredra stödda alternativ som Container Apps och planera migrering för befintliga distributioner.

## 🗃️ Databasprovisionering

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
**Fragmentförutsättningar:** deklarera `@secure() param databasePassword string` och använd ett starkt angivet värde. Välj offentlig åtkomst **eller** integrera delegerat subnet/private DNS nedan; dessa två stycken kopplar inte automatiskt ihop sig.

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

Regeln `0.0.0.0` tillåter anslutningar från Azure-tjänster utanför din egen prenumeration. Det är inte privat nätverk; föredra en begränsad nätverksdesign för riktiga arbetsbelastningar.

## 🔒 Säkerhet och Hantering av Hemligheter

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

### Konfiguration av hanterad identitet
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

För en systemtilldelad identitet, sätt inte `AZURE_CLIENT_ID` till dess principal-ID. En användartilldelad identitet använder sin **klient-ID**, inte objekt/principal-ID. Key Vault-referensen behöver även appidentitetens vault-rolltilldelning och nätverksåtkomst.

## 🌍 Nätverk och Anslutning

### Konfiguration av virtuellt nätverk
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
**Ofullständigt arkitekturfragment, ej en distribuerbar gateway:** lägg till ett dedikerat `gateway-subnet` till VNet plus backendpooler, HTTP-inställningar, lyssnare, routningsregler med prioriteringar och ett TLS-certifikat (eller auktoriserad Key Vault-referens). Att bara öppna port 443 konfigurerar inte HTTPS.

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

## 📊 Övervakning och Observerbarhet

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

### Anpassade mätvärden och larm
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

## 🔧 Miljöspecifika konfigurationer

### Parameterfiler för olika miljöer
De två filerna nedan är **alternativa exempel på parameterfiler**. azd väljer inte automatiskt `main.parameters.dev.json` eller `main.parameters.prod.json` beroende på miljönamn. Använd den faktiska `main.parameters.json` med miljöersättningar (t.ex. `${APP_SERVICE_SKU=B1}`), och deklarera/ konsumera varje parameter i Bicep.

Exempelinnehåll för `infra/main.parameters.dev.json`:

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

Exempelinnehåll för `infra/main.parameters.prod.json`:

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

### Villkorlig resursprovisionering
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

## 🚀 Avancerade provisioneringsmönster

### Multi-region-distribution
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

### Infrastrukturtestning
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Provisionering av infrastruktur distribuerar inte din applikationskod. Kör applikationskontroller endast efter `azd deploy`/`azd up`, och använd `/health` bara om din app implementerar det. ARM-distributionsskript skapar Azure-resurser och kräver ytterligare identitet, stödda runtime-versioner och behörigheter; de är inte lokala enhetstester.

## 🧪 Förhandsvisning och validering av infrastruktur (NYTT)

### Förhandsgranska infrastrukturändringar före distribution

Funktionen `azd provision --preview` låter dig **simulera infrastrukturprovisionering** innan du faktiskt distribuerar resurser. Det är likt `terraform plan` eller `bicep what-if` och ger dig en **torrkörningsvy** av vilka förändringar som skulle göras i din Azure-miljö.

#### 🛠️ Vad den gör
- **Analyserar dina IaC-mallar** (Bicep eller Terraform)
- **Visar en förhandsvisning av resursförändringar**: tillägg, borttagningar, uppdateringar
- **Tillämpa inte leverantörens föreslagna infrastruktursändringar** — inspektera projekthooks först; skript kan ha sidoeffekter och förhandsvisning kräver fortfarande Azure-behörigheter

#### Användningsfall
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Detta kommando hjälper dig att:
- **Validera infrastruktursändringar** innan resurser förpliktas
- **Upptäcka felkonfigurationer tidigt** i utvecklingscykeln
- **Samarbeta säkert** i teammiljöer
- **Säkra minst-privilegierade distributioner** utan överraskningar

Det är särskilt användbart när:
- Du arbetar med komplexa fler-tjänstmiljöer
- Du gör ändringar i produktionsinfrastruktur
- Du validerar malländringar före PR-godkännande
- Du tränar nya teammedlemmar i infrastrukturmönster

### Exempel på förhandsvisningsutdata
Exakt förhandsvisningsutdata varierar beroende på leverantör och projektstruktur, men resultatet bör tydligt identifiera föreslagna ändringar innan något appliceras.

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

## �🔄 Resursuppdateringar och migreringar

### Säker resursuppdatering
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

### Databas-migreringar
**Ofullständigt distributionsskriptmönster:** kräver konfigurerad användartilldelad identitet där det behövs, stödd Azure CLI-runtime, tillgängliga migreringsverktyg, angiven migreringskatalog/konfiguration och databasanslutning. Det är inte körbart enbart genom att klistra in denna resurs i en mall.

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

## 🎯 Bästa praxis

### 1. Namngivningskonventioner för resurser
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Taggningsstrategi
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

### 4. Organisation av utdata
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

## Nästa steg

- [Planering före distribution](../chapter-06-pre-deployment/capacity-planning.md) - Validera resursillgänglighet
- [Vanliga problem](../chapter-07-troubleshooting/common-issues.md) - Felsök infrastruktursproblem
- [Felsökningsguide](../chapter-07-troubleshooting/debugging.md) - Felsök provisionsproblem
- [SKU-val](../chapter-06-pre-deployment/sku-selection.md) - Välj lämpliga servicelager

## Ytterligare resurser

- [Azure Bicep-dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager-mallar](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Välarkitekturerat Ramverk](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Föregående lektion**: [Implementeringsguide](deployment-guide.md)
- **Nästa lektion**: [Kapacitetsplanering](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->