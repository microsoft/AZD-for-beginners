# Provisioning Azure Resources with AZD

**Chapter Navigation:**
- **📚 Home del corso**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 4 - Infrastruttura come Codice e Distribuzione
- **⬅️ Precedente**: [Guida alla distribuzione](deployment-guide.md)
- **➡️ Capitolo successivo**: [Capitolo 5: Soluzioni AI multi-agente](../../examples/retail-scenario.md)
- **🔧 Correlato**: [Capitolo 6: Validazione pre-distribuzione](../chapter-06-pre-deployment/capacity-planning.md)

## Introduzione

Questa guida completa copre tutto ciò che devi sapere sul provisioning e la gestione delle risorse Azure usando Azure Developer CLI. Impara a implementare pattern di Infrastructure as Code (IaC) dalla creazione di risorse di base ad architetture infrastrutturali avanzate di livello enterprise usando Bicep, ARM templates, Terraform e Pulumi.

## Obiettivi di apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare i principi dell'Infrastructure as Code e il provisioning delle risorse Azure
- Comprendere i vari provider IaC supportati da Azure Developer CLI
- Progettare e implementare template Bicep per architetture applicative comuni
- Configurare parametri delle risorse, variabili e impostazioni specifiche per ambiente
- Implementare pattern infrastrutturali avanzati, inclusi networking e sicurezza
- Gestire il ciclo di vita delle risorse, aggiornamenti e risoluzione delle dipendenze

## Risultati di apprendimento

Al termine, sarai in grado di:
- Progettare e fornire infrastruttura Azure usando Bicep e ARM templates
- Configurare architetture complesse multi-servizio con dipendenze di risorse appropriate
- Implementare template parametrizzati per più ambienti e configurazioni
- Risolvere problemi di provisioning dell'infrastruttura e correggere fallimenti di distribuzione
- Applicare i principi dell'Azure Well-Architected Framework al design dell'infrastruttura
- Gestire aggiornamenti dell'infrastruttura e implementare strategie di versioning dell'infrastruttura

## Panoramica del provisioning dell'infrastruttura

Azure Developer CLI supporta più provider di Infrastructure as Code (IaC):
- **Bicep** (consigliato) - Linguaggio specifico di dominio di Azure
- **ARM Templates** - Template JSON di Azure Resource Manager
- **Terraform** - Strumento di infrastruttura multi-cloud
- **Pulumi** - Infrastructure as code moderno con linguaggi di programmazione

## Comprendere le risorse Azure

### Gerarchia delle risorse
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Servizi Azure comuni per le applicazioni
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Sicurezza**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Template di infrastruttura Bicep

### Struttura base di un template Bicep
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

### Pattern Bicep avanzati

#### Infrastruttura modulare
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

#### Creazione condizionale delle risorse
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

## 🌐 Usare Terraform con azd

Bicep è il default di azd, ma azd supporta anche **Terraform**—utile se il tuo team già lo standardizza o gestisci infrastruttura multi-cloud. Il workflow di azd (`azd up`, `azd provision`, `azd down`) è identico; cambia solo il linguaggio di infrastruttura e la struttura delle cartelle.

### Dire a azd di usare Terraform

Aggiungi una sezione `infra` in `azure.yaml` che punti al provider Terraform:

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

### Layout della cartella Terraform

Con il provider Terraform, la tua cartella `infra/` usa file `.tf` invece di Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Un `main.tf` minimale

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

### Come azd si collega agli output di Terraform

azd legge gli **outputs** di Terraform per conoscere i tuoi endpoint e per re-inserire i valori di ambiente nella tua app. I nomi degli output sono importanti—azd cerca nomi specifici:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Importante:** azd usa il tag `azd-env-name` e gli output `AZURE_*` per tracciare le risorse per ambiente. Etichetta sempre il tuo gruppo di risorse con `"azd-env-name" = var.environment_name` così `azd down` può trovare e rimuovere tutto.

### Distribuire con Terraform

I comandi sono esattamente gli stessi di Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd esegue 'terraform plan' sotto il cofano
azd up                    # provisionare + distribuire
azd down --force          # distrugge le risorse gestite da Terraform
```

> **Prerequisito:** Terraform deve essere installato e presente nel tuo `PATH`. azd gestisce il *workflow* di Terraform ma non installa Terraform per te. Per lo stato, azd usa per default lo stato locale; per i team, configura un backend remoto (per esempio, un backend Azure Storage) in `provider.tf`.

Per starter completi e eseguibili basati su Terraform, esplora la [Awesome AZD gallery](https://azure.github.io/awesome-azd/) filtrando per Terraform, oppure vedi la documentazione ufficiale [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Usare Pulumi con azd

Se il tuo team scrive infrastruttura in un linguaggio general-purpose (TypeScript, Python, Go o C#) invece di un DSL, azd supporta anche **Pulumi**. Come per Terraform, il workflow `azd up` / `azd provision` / `azd down` rimane invariato—cambiano solo gli strumenti di infrastruttura e la struttura delle cartelle.

### Dire a azd di usare Pulumi

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

### Layout della cartella Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Un `index.ts` minimale

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Etichetta ogni risorsa in modo che azd possa tracciarle e rimuoverle
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd legge questi output e li importa nel tuo ambiente
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Gli stack mappano agli ambienti azd

Pulumi organizza le distribuzioni in **stack**, e azd mappa ogni ambiente azd a uno stack Pulumi con lo stesso nome. Quando esegui `azd env new staging`, azd seleziona (o crea) lo stack Pulumi `staging`. Si applicano le stesse regole di tagging `azd-env-name` e degli output `AZURE_*`, così `azd down` può trovare e rimuovere tutto.

### Distribuire con Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd esegue 'pulumi preview' sotto il cofano
azd up                    # provisioning + distribuzione
azd down --force          # esegue 'pulumi destroy'
```

> **Prerequisito:** Pulumi deve essere installato e presente nel tuo `PATH`, e avrai bisogno di un backend di stato (Pulumi Cloud o un backend self-managed come Azure Blob Storage). azd gestisce il *workflow* di Pulumi, non l'installazione. Vedi la documentazione ufficiale [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Scegliere un host per il tuo servizio

Il campo `host` in `azure.yaml` decide dove viene eseguito il tuo codice. azd supporta diversi host—scegliere quello giusto è più importante del linguaggio di infrastruttura. Ecco un confronto pensato per principianti:

| `host` value | Ideale per | Perché |
|--------------|----------|-----|
| `appservice` | Applicazioni web tradizionali e API | PaaS più semplice; nessun container richiesto |
| `staticwebapp` | SPA front-end (React, Vue, Angular) | CDN globale + SSL gratuito, supporto API integrato |
| `function` | Carichi event-driven e serverless | Scalabilità a zero, pagamento per esecuzione |
| `containerapp` | Microservizi containerizzati | Container serverless, scalabilità a zero, ingress integrato |
| `aks` | Esigenze di orchestrazione complesse | Controllo completo di Kubernetes quando è davvero necessario |
| `springapp` | App Java Spring Boot | Runtime gestito Azure Spring Apps ottimizzato per Spring |

### Quando optare per AKS

**Azure Kubernetes Service (`host: aks`)** ti dà tutta la potenza di Kubernetes—controller personalizzati, service mesh, networking complesso e scheduling granulare. Questa potenza comporta un overhead operativo: gestisci pool di nodi, aggiornamenti e networking del cluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Inizia più semplice se puoi.** Per la maggior parte dei microservizi, **Container Apps** ti offre container, autoscaling e scale-to-zero senza gestire un cluster. Scegli AKS solo quando hai bisogno di funzionalità specifiche di Kubernetes.

### Quando usare Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** è un runtime gestito progettato per Spring Boot. Gestisce service discovery, config server e deployment blue-green in modo che i team Java non debbano gestire la propria infrastruttura.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Usa `springapp` quando hai applicazioni Spring Boot esistenti e desideri un runtime ottimizzato per esse. Per nuove app Java containerizzate senza esigenze specifiche di Spring, `containerapp` è spesso la scelta più semplice.

## 🗃️ Provisioning dei database

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

## 🔒 Sicurezza e gestione dei segreti

### Integrazione con Key Vault
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

### Configurazione delle Managed Identity
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

## 🌍 Networking e connettività

### Configurazione della Virtual Network
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

### Application Gateway con SSL
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

## 📊 Monitoraggio e osservabilità

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

### Metriche personalizzate e avvisi
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

## 🔧 Configurazioni specifiche per ambiente

### File di parametri per diversi ambienti
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

### Provisioning condizionale delle risorse
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

## 🚀 Pattern di provisioning avanzati

### Distribuzione multi-regione
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

### Test dell'infrastruttura
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

## 🧪 Anteprima e validazione dell'infrastruttura (NUOVO)

### Anteprima delle modifiche all'infrastruttura prima della distribuzione

La funzionalità `azd provision --preview` ti permette di **simulare il provisioning dell'infrastruttura** prima di distribuire effettivamente le risorse. È simile per spirito a `terraform plan` o `bicep what-if`, offrendo una **visualizzazione in dry-run** di quali cambiamenti verrebbero applicati al tuo ambiente Azure.

#### 🛠️ Cosa fa
- **Analizza i tuoi template IaC** (Bicep o Terraform)
- **Mostra un'anteprima delle modifiche alle risorse**: aggiunte, eliminazioni, aggiornamenti
- **Non applica le modifiche** — è in sola lettura e sicuro da eseguire

#### Casi d'uso
```bash
# Anteprima delle modifiche all'infrastruttura prima della distribuzione
azd provision --preview

# Anteprima per un ambiente specifico
azd provision --preview -e production
```

Questo comando ti aiuta a:
- **Validare le modifiche all'infrastruttura** prima di impegnare risorse
- **Individuare errori di configurazione precocemente** nel ciclo di sviluppo
- **Collaborare in sicurezza** in ambienti di team
- **Assicurare deployment con privilegi minimi** senza sorprese

È particolarmente utile quando:
- Si lavora con ambienti multi-servizio complessi
- Si apportano modifiche all'infrastruttura di produzione
- Si convalidano modifiche ai template prima dell'approvazione di una PR
- Si forma nuovo personale sui pattern infrastrutturali

### Esempio di output di anteprima
L'output di anteprima esatto varia in base al provider e alla struttura del progetto, ma il risultato dovrebbe identificare chiaramente le modifiche proposte prima che qualcosa venga applicato.

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

## �🔄 Aggiornamenti e migrazioni delle risorse

### Aggiornamenti sicuri delle risorse
```bash
# Prima, visualizza in anteprima le modifiche all'infrastruttura (RACCOMANDATO)
azd provision --preview

# Applica le modifiche dopo la conferma dell'anteprima
azd provision --confirm-with-no-prompt

# Per il rollback, usa Git per annullare le modifiche all'infrastruttura:
git revert HEAD  # Annulla l'ultimo commit dell'infrastruttura
azd provision    # Applica lo stato precedente dell'infrastruttura
```

### Migrazioni di database
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

## 🎯 Best Practices

### 1. Convenzioni di naming delle risorse
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Strategia di tagging
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

### 3. Validazione dei parametri
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

### 4. Organizzazione degli output
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

## Prossimi passi

- [Pianificazione pre-distribuzione](../chapter-06-pre-deployment/capacity-planning.md) - Verifica la disponibilità delle risorse
- [Problemi comuni](../chapter-07-troubleshooting/common-issues.md) - Risolvi i problemi dell'infrastruttura
- [Guida al debugging](../chapter-07-troubleshooting/debugging.md) - Esegui il debug dei problemi di provisioning
- [Selezione SKU](../chapter-06-pre-deployment/sku-selection.md) - Scegli i tier di servizio appropriati

## Risorse aggiuntive

- [Documentazione Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigazione**
- **Lezione precedente**: [Guida alla distribuzione](deployment-guide.md)
- **Lezione successiva**: [Pianificazione della capacità](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->