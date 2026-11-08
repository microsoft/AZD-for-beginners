# Provisioning delle Risorse Azure con AZD

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 4 - Infrastructure as Code & Deploy
- **⬅️ Precedente**: [Guida al Deployment](deployment-guide.md)
- **➡️ Capitolo Successivo**: [Capitolo 5: Soluzioni AI Multi-Agente](../../examples/retail-scenario.md)
- **🔧 Correlati**: [Capitolo 6: Validazione Pre-Deployment](../chapter-06-pre-deployment/capacity-planning.md)

## Introduzione

Questa guida tratta il provisioning e la gestione delle risorse Azure usando Azure Developer CLI con i suoi provider Bicep e Terraform integrati.

> Revisionato rispetto a `azd 1.37.2` (Novembre 2026). Salvo diversa indicazione, gli esempi di Bicep, Terraform e script sono **frammenti illustrativi**, non un modello completo. Integrali in un progetto che fornisca i parametri, moduli, identità, rete e codice applicativo referenziati. Il provisioning Azure non è stato eseguito in questa revisione.

## Obiettivi di Apprendimento

Completando questa guida, sarai in grado di:
- Padroneggiare i principi di Infrastructure as Code e il provisioning delle risorse Azure
- Comprendere i molteplici provider IaC supportati da Azure Developer CLI
- Progettare e implementare template Bicep per architetture applicative comuni
- Configurare parametri di risorse, variabili e impostazioni specifiche per ambiente
- Implementare pattern avanzati di infrastruttura, inclusi networking e sicurezza
- Gestire il ciclo di vita delle risorse, aggiornamenti e risoluzione delle dipendenze

## Risultati di Apprendimento

Al termine, sarai in grado di:
- Progettare e fornire infrastruttura Azure usando template Bicep e ARM
- Configurare architetture multi-servizio complesse con dipendenze corrette tra risorse
- Implementare template parametrizzati per più ambienti e configurazioni
- Risolvere problemi di provisioning infrastrutturale e fallimenti di deploy
- Applicare i principi Azure Well-Architected Framework al design dell'infrastruttura
- Gestire aggiornamenti infrastrutturali e implementare strategie di versioning dell'infrastruttura

## Panoramica del Provisioning Infrastrutturale

Azure Developer CLI supporta diversi provider Infrastructure as Code (IaC):
- **Bicep** (consigliato) - linguaggio specifico Azure
- **Template ARM** - Bicep compila in ARM; il JSON ARM grezzo non è un `infra.provider` integrato separato
- **Terraform** - strumento multi-cloud per infrastruttura
- **Provider estensioni** - richiedono un'estensione provider installata separatamente e configurazione documentata; non dare per scontato che qualsiasi stringa provider sia supportata

## Comprendere le Risorse Azure

### Gerarchia delle Risorse
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Servizi Azure Comuni per Applicazioni
- **Compute**: App Service, Container Apps, Functions, Macchine Virtuali
- **Archiviazione**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Rete Virtuale, Application Gateway, CDN
- **Sicurezza**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Template di Infrastruttura Bicep

### Struttura Base di un Template Bicep
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

Per un progetto azd completo, chiama questo modulo da un `infra/main.bicep` con ambito su sottoscrizione che crea un gruppo di risorse taggato e passa il suo ambito. Abbina `environmentName`/`location` in `main.parameters.json`. Il tag `azd-service-name: web` associa la risorsa a `services.web`; nomi output arbitrari da soli non configurano il service discovery.

### Pattern Avanzati Bicep

#### Infrastruttura Modulare
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

#### Creazione Condizionale di Risorse
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

Bicep è il default di azd, ma azd supporta anche **Terraform**—utile se il tuo team lo usa già o gestisci infrastruttura multi-cloud. Il workflow azd (`azd up`, `azd provision`, `azd down`) è identico; cambia solo il linguaggio infrastrutturale e la disposizione delle cartelle.

### Indicare ad azd di usare Terraform

Aggiungi una sezione `infra` in `azure.yaml` puntando al provider Terraform:

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

### Struttura cartelle Terraform

Con il provider Terraform, la cartella `infra/` usa file `.tf` invece di Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Un frammento `main.tf`

Questo crea solo un gruppo di risorse e un piano, non un servizio distribuibile. Devi anche dichiarare variabili di input, un provider `azurerm` compatibile, la web app e la sua mappatura tag/nome risorsa del servizio.

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

### Come azd si connette ai tuoi output Terraform

azd legge gli **output** di Terraform nei valori di ambiente. Questo frammento presuppone che tu abbia definito `azurerm_linux_web_app.web`; il service discovery richiede ancora un nome risorsa corrispondente o tag `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Importante:** azd usa il tag `azd-env-name` e gli output `AZURE_*` per tracciare le risorse per ambiente. Tagga sempre il gruppo di risorse con `"azd-env-name" = var.environment_name` così `azd down` può trovare e rimuovere tutto.

### Distribuire con Terraform

I comandi sono esattamente gli stessi di Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Prerequisito:** Terraform deve essere installato e nel tuo `PATH`. azd gestisce il *workflow* di Terraform ma non lo installa per te. Per lo stato, azd usa per default lo stato locale; per team, configura un backend remoto (per esempio, un backend Azure Storage) in `provider.tf`.

Per starter Terraform completi e eseguibili, esplora la [galleria Awesome AZD](https://azure.github.io/awesome-azd/) e filtra per Terraform, oppure consulta la [documentazione ufficiale azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Altri Strumenti di Infrastruttura

Pulumi non è un provider provisioning integrato in azd 1.37.2. Configurare solo `infra.provider: pulumi` non crea un'integrazione funzionante, e `azd env new` non crea/seleziona automaticamente uno stack Pulumi. Se usi un altro strumento IaC, segui la documentazione di un'estensione provider verificata o gestisci esplicitamente il suo ciclo di vita nel tuo workflow. Questo corso non fornisce né verifica un provider Pulumi.

## 🎯 Scegliere un Host per il Tuo Servizio

Il campo `host` in `azure.yaml` decide dove il tuo codice viene eseguito. azd supporta diversi host—scegliere quello giusto conta più del linguaggio infrastrutturale. Ecco un confronto amichevole per principianti:

| Valore `host` | Ideale per | Perché |
|--------------|----------|-----|
| `appservice` | App web tradizionali e API | PaaS più semplice; non richiede container |
| `staticwebapp` | SPA front-end (React, Vue, Angular) | CDN globale + SSL gratuito, supporto API integrato |
| `function` | Carichi di lavoro event-driven e serverless | Scale-to-zero, pay-per-execution |
| `containerapp` | Microservizi containerizzati | Container serverless, scale-to-zero, ingress integrato |
| `aks` | Esigenze di orchestrazione complesse | Controllo completo Kubernetes quando serve davvero |
| `springapp` | Deployment esistenti Azure Spring Apps | Target legacy; servizio ritirato il 31 marzo 2028 e chiuso a nuovi clienti |

### Quando optare per AKS

**Azure Kubernetes Service (`host: aks`)** ti dà il pieno potere di Kubernetes—controller personalizzati, mesh di servizi, networking complesso e schedulazione fine. Questo potere incide sull'operatività: gestisci pool di nodi, aggiornamenti e networking del cluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Inizia più semplice se puoi.** Per la maggior parte dei microservizi, **Container Apps** offre container, autoscaling e scale-to-zero senza gestire un cluster. Scegli AKS solo quando ti servono funzionalità specifiche Kubernetes.

### Quando usare Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** è un runtime gestito progettato appositamente per Spring Boot. Gestisce service discovery, config server e deployment blue-green così i team Java non gestiscono infrastruttura propria.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Non selezionare Azure Spring Apps per un nuovo progetto per principianti: è chiuso a nuovi clienti e [ritirato il 31 marzo 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Preferisci alternative supportate come Container Apps e pianifica la migrazione per deployment esistenti.

## 🗃️ Provisioning Database

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
**Prerequisiti del frammento:** dichiara `@secure() param databasePassword string` e usa un valore fornito forte. Scegli accesso pubblico **oppure** integra subnet delegata/DNS privato qui sotto; i due spezzoni non si collegano automaticamente.

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

La regola `0.0.0.0` permette connessioni da servizi Azure oltre alla tua sottoscrizione. Non è networking privato; preferisci un design di rete ristretto per carichi reali.

## 🔒 Sicurezza e Gestione Segreti

### Integrazione Key Vault
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

### Configurazione Managed Identity
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

Per identità assegnata dal sistema, non impostare `AZURE_CLIENT_ID` sul suo principal ID. Un'identità assegnata dall'utente usa il suo **client ID**, non il suo object/principal ID. Il riferimento Key Vault necessita anche dell'assegnazione ruolo vault dell'identità app e accesso di rete.

## 🌍 Networking e Connettività

### Configurazione Rete Virtuale
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
**Frammento architetturale incompleto, non un gateway distribuibile:** aggiungi un `gateway-subnet` dedicato alla VNet più backend pool, impostazioni HTTP, listener, regole di routing con priorità e certificato TLS (o riferimento autorizzato Key Vault). Aprire solo la porta 443 non configura HTTPS.

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

## 📊 Monitoraggio e Osservabilità

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

### Metriche personalizzate e Alert
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

## 🔧 Configurazioni Specifiche per Ambiente

### File Parametri per Ambienti Diversi
I due file seguenti sono **esempi alternativi di file parametri**. azd non seleziona automaticamente `main.parameters.dev.json` o `main.parameters.prod.json` per nome ambiente. Usa il vero `main.parameters.json` con sostituzioni ambiente (per esempio `${APP_SERVICE_SKU=B1}`), e dichiara/consuma ogni parametro in Bicep.

Contenuto esempio per `infra/main.parameters.dev.json`:

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

Contenuto esempio per `infra/main.parameters.prod.json`:

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

### Provisioning Condizionale di Risorse
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

## 🚀 Pattern Avanzati di Provisioning

### Distribuzione Multi-Regione
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

### Testing dell'Infrastruttura
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Provisionare l'infrastruttura non distribuisce il codice applicativo. Esegui controlli applicativi solo dopo `azd deploy`/`azd up`, e usa `/health` solo se la tua app lo implementa. Gli script di deploy ARM creano risorse Azure e necessitano di identità aggiuntive, versioni runtime supportate e permessi; non sono test unitari locali.

## 🧪 Anteprima e Validazione dell'Infrastruttura (NOVITÀ)

### Anteprima delle Modifiche Infrastrutturali Prima del Deploy

La funzione `azd provision --preview` permette di **simulare il provisioning infrastrutturale** prima di distribuire effettivamente le risorse. È simile nello spirito a `terraform plan` o `bicep what-if`, offrendo una **vista di prova secca** delle modifiche che verrebbero apportate al tuo ambiente Azure.

#### 🛠️ Cosa Fa
- **Analizza i tuoi template IaC** (Bicep o Terraform)
- **Mostra un'anteprima delle modifiche alle risorse**: aggiunte, eliminazioni, aggiornamenti
- **Non applica le modifiche infrastrutturali proposte dal provider** — ispeziona prima i ganci di progetto; script possono avere effetti collaterali e l'anteprima richiede comunque permessi Azure

#### Casi d'Uso
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Questo comando ti aiuta a:
- **Validare le modifiche infrastrutturali** prima di impegnare risorse
- **Individuare errori di configurazione precocemente** nel ciclo di sviluppo
- **Collaborare in sicurezza** in ambienti di team
- **Garantire deploy con privilegi minimi** senza sorprese

È particolarmente utile quando:
- Si lavora con ambienti complessi multi-servizio
- Si fanno modifiche all'infrastruttura di produzione
- Si validano modifiche ai template prima dell'approvazione PR
- Si formano nuovi membri del team su pattern infrastrutturali

### Esempio di Output Anteprima
L'output esatto dell'anteprima varia per provider e struttura progetto, ma il risultato dovrebbe chiaramente identificare le modifiche proposte prima che qualcosa venga applicato.

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

## 🔄 Aggiornamenti e Migrazioni Risorse

### Aggiornamenti Risorse Sicuri
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

### Migrazioni Database
**Pattern script di deployment incompleto:** richiede identità utente assegnata configurata dove serve, runtime Azure CLI supportato, strumenti di migrazione disponibili, directory/configurazione migrazioni fornita, e connettività database. Non è eseguibile solo incollando questa risorsa in un template.

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

## 🎯 Best Practices

### 1. Convenzioni di Nomenclatura Risorse
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Strategia di Tagging
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

### 3. Validazione Parametri
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

### 4. Organizzazione Outputs
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

## Passi Successivi

- [Pianificazione Pre-Deployment](../chapter-06-pre-deployment/capacity-planning.md) - Validare la disponibilità delle risorse
- [Problemi Comuni](../chapter-07-troubleshooting/common-issues.md) - Risolvere problemi infrastrutturali
- [Guida al Debug](../chapter-07-troubleshooting/debugging.md) - Risoluzione dei problemi di provisioning
- [Selezione SKU](../chapter-06-pre-deployment/sku-selection.md) - Scegliere i livelli di servizio appropriati

## Risorse aggiuntive

- [Documentazione Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Modelli Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Centro di Architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Well-Architected di Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigazione**
- **Lezione precedente**: [Guida al Deployment](deployment-guide.md)
- **Lezione successiva**: [Pianificazione della capacità](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->