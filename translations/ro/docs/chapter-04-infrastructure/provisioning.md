# Provisionarea resurselor Azure cu AZD

**Navigare capitol:**
- **📚 Acasă curs**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca și cod & implementare
- **⬅️ Anterior**: [Ghid de implementare](deployment-guide.md)
- **➡️ Capitolul următor**: [Capitolul 5: Soluții AI multi-agent](../../examples/retail-scenario.md)
- **🔧 Relaționat**: [Capitolul 6: Validare pre-implementare](../chapter-06-pre-deployment/capacity-planning.md)

## Introducere

Acest ghid acoperă provisionarea și gestionarea resurselor Azure folosind Azure Developer CLI cu furnizorii săi integrați Bicep și Terraform.

> Revizuit conform `azd 1.37.2` (noiembrie 2026). Dacă nu se precizează altfel, exemplele Bicep, Terraform și de script sunt **fragmente ilustrative**, nu un șablon complet. Combină-le într-un proiect care furnizează parametrii, modulele, identitățile, rețeaua și codul aplicației referite. Provisionarea Azure nu a fost executată în această recenzie.

## Obiective de învățare

Parcurgând acest ghid, vei:
- Stăpâni principiile Infrastructure as Code și provisionarea resurselor Azure
- Înțelege mai mulți furnizori IaC susținuți de Azure Developer CLI
- Proiecta și implementa șabloane Bicep pentru arhitecturi comune de aplicații
- Configura parametrii de resurse, variabile și setări specifice mediului
- Implementa modele avansate de infrastructură inclusiv rețelistică și securitate
- Gestiona ciclul de viață al resurselor, actualizări și rezolvarea dependențelor

## Rezultate ale învățării

La finalizare, vei putea:
- Proiecta și provisiona infrastructură Azure folosind șabloane Bicep și ARM
- Configura arhitecturi complexe multi-serviciu cu dependențe corecte de resurse
- Implementa șabloane parametrizate pentru mai multe medii și configurații
- Depana probleme de provisionare și rezolva eșecuri de implementare
- Aplica principiile Azure Well-Architected Framework la proiectarea infrastructurii
- Gestionează actualizările infrastructurii și implementează strategii de versionare a infrastructurii

## Prezentare generală a provisionării infrastructurii

Azure Developer CLI suportă mai mulți furnizori Infrastructure as Code (IaC):
- **Bicep** (recomandat) - limbaj specific domeniului Azure
- **ARM Templates** - Bicep compilează către ARM; JSON ARM brut nu este un `infra.provider` separat încorporat
- **Terraform** - Instrument de infrastructură multi-cloud
- **Furnizori extensii** - Necesită instalarea separată a extensiei provider și configurarea documentată; nu presupuneți că orice șir de provider este suportat

## Înțelegerea resurselor Azure

### Ierarhia resurselor
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Servicii Azure comune pentru aplicații
- **Computare**: App Service, Container Apps, Functions, Mașini Virtuale
- **Stocare**: Cont de stocare, Cosmos DB, SQL Database, PostgreSQL
- **Rețelistică**: Rețea Virtuală, Application Gateway, CDN
- **Securitate**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Servicii Azure AI, Azure OpenAI, Azure Machine Learning

## Șabloane de infrastructură Bicep

### Structura de bază a unui șablon Bicep
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

Pentru un proiect azd complet, apelează acest modul dintr-un `infra/main.bicep` cu scara la nivelul abonamentului care creează un grup de resurse etichetat și îi transmite această scală. Potrivește `environmentName`/`location` în `main.parameters.json`. Eticheta `azd-service-name: web` asociază resursa cu `services.web`; doar denumirile arbitrare de ieșire nu configurează descoperirea serviciului.

### Modele avansate Bicep

#### Infrastructură modulară
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

#### Crearea condițională de resurse
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

## 🌐 Utilizarea Terraform cu azd

Bicep este implicit pentru azd, dar azd suportă și **Terraform**—util dacă echipa ta standardizează deja pe acesta sau gestionezi infrastructură multi-cloud. Fluxul de lucru azd (`azd up`, `azd provision`, `azd down`) este identic; se schimbă doar limbajul pentru infrastructură și structura dosarelor.

### Spune azd să folosească Terraform

Adaugă o secțiune `infra` în `azure.yaml` indicând spre furnizorul Terraform:

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

### Structura dosarului Terraform

Cu furnizorul Terraform, dosarul tău `infra/` folosește fișiere `.tf` în loc de Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Un fragment `main.tf`

Aceasta creează doar un grup de resurse și un plan, nu un serviciu implementabil. Trebuie să declari și variabile de intrare, un furnizor `azurerm` compatibil, aplicația web și maparea tagului/numele resursei serviciului.

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

### Cum se conectează azd la ieșirile Terraform

azd citește **ieșirile** Terraform ca valori de mediu. Acest fragment presupune că ai definit `azurerm_linux_web_app.web`; descoperirea serviciilor necesită în continuare un nume de resursă care să se potrivească sau o etichetă `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **Important:** azd folosește eticheta `azd-env-name` și ieșirile `AZURE_*` pentru a urmări resursele pe medii. Etichetează întotdeauna grupul de resurse cu `"azd-env-name" = var.environment_name` ca `azd down` să poată găsi și elimina tot.

### Implementare cu Terraform

Comenzile sunt exact aceleași ca pentru Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **Precondiție:** Terraform trebuie să fie instalat și în `PATH`. azd gestionează *fluxul* Terraform, dar nu îl instalează pentru tine. Pentru stare, azd utilizează implicit starea locală; pentru echipe, configurează un backend remote (de exemplu, backend Azure Storage) în `provider.tf`.

Pentru startere Terraform complete, rulabile, navighează în [galeria Awesome AZD](https://azure.github.io/awesome-azd/) și filtrează pentru Terraform, sau vezi documentația oficială [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Alte instrumente de infrastructură

Pulumi nu este un furnizor încorporat în azd 1.37.2. Setarea `infra.provider: pulumi` singură nu stabilește o integrare funcțională, iar `azd env new` nu creează/selectează automat un stack Pulumi. Dacă folosești alt instrument IaC, urmărește documentația unei extensii verificate sau gestionează ciclul său de viață explicit în propriul flux de lucru. Acest curs nu furnizează și nici nu validează un provider Pulumi.

## 🎯 Alegerea unui gazdă pentru serviciul tău

Câmpul `host` din `azure.yaml` decide unde rulează codul tău. azd suportă mai mulți gazde—alegerea corectă contează mai mult decât limbajul infrastructurii. Iată o comparație prietenoasă pentru începători:

| Valoare `host` | Potrivit pentru | De ce |
|--------------|----------|-----|
| `appservice` | Aplicații web tradiționale și API-uri | PaaS cel mai simplu; nu sunt necesare containere |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | CDN global + SSL gratuit, suport API integrat |
| `function` | Lucrări event-driven și serverless | Scalare-la-zero, plătești după execuție |
| `containerapp` | Microservicii containerizate | Containere serverless, scalare-la-zero, ingress integrat |
| `aks` | Nevoi complexe de orchestrare | Control Kubernetes complet când ai nevoie cu adevărat |
| `springapp` | Implementări existente Azure Spring Apps | Țintă veche; serviciul se retrage pe 31 martie 2028 și este închis pentru clienți noi |

### Când să alegi AKS

**Azure Kubernetes Service (`host: aks`)** îți oferă puterea completă a Kubernetes—controlere personalizate, mesh-uri de servicii, rețelistică complexă și programare detaliată. Această putere vine cu costuri operaționale: tu gestionezi pool-uri de noduri, upgrade-uri și rețeaua clusterului.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Pornește mai simplu dacă poți.** Pentru majoritatea microserviciilor, **Container Apps** îți oferă containere, autoscalare și scalare-la-zero fără să gestionezi un cluster. Alege AKS doar când ai nevoie de funcționalități specifice Kubernetes.

### Când să folosești Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** este un runtime gestionat construit pentru Spring Boot. Gestionează descoperirea serviciului, serverul de configurare, și implementarea blue-green astfel încât echipele Java să nu gestioneze infrastructura.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Nu selecta Azure Spring Apps pentru un proiect nou de începător: este închis pentru clienți noi și [se retrage la 31 martie 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). Preferă alternative susținute precum Container Apps și planifică migrarea pentru implementările existente.

## 🗃️ Provisionarea bazelor de date

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
**Precondiții fragment:** declară `@secure() param databasePassword string` și folosește o valoare puternică furnizată. Alege acces public **sau** integrează subnetul delegat/DNS privat de mai jos; cele două fragmente nu se conectează automat.

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

Regula `0.0.0.0` permite conexiuni din serviciile Azure dincolo de abonamentul tău. Nu reprezintă o rețea privată; preferă un design de rețea restricționat pentru sarcini reale.

## 🔒 Securitate și gestionarea secretelor

### Integrarea Key Vault
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

### Configurarea identității gestionate
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

Pentru o identitate atribuită sistemului, nu seta `AZURE_CLIENT_ID` la ID-ul său principal. O identitate atribuită utilizatorului folosește **client ID**, nu obiectul/ID-ul principal. Referința Key Vault are nevoie și de atribuirea rolului de depozit pentru identitatea aplicației și accesul în rețea.

## 🌍 Rețelistică și conectivitate

### Configurarea rețelei virtuale
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

### Application Gateway cu SSL
**Fragment arhitectural incomplet, nu un gateway implementabil:** adaugă un `gateway-subnet` dedicat la VNet plus pool-urile backend, setările HTTP, ascultătorii, regulile de rutare cu priorități și un certificat TLS (sau referință autorizată Key Vault). Simplul deschiderii a portului 443 nu configurează HTTPS.

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

## 📊 Monitorizare și observabilitate

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

### Metrice și alerte personalizate
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

## 🔧 Configurații specifice mediului

### Fișiere de parametri pentru medii diferite
Cele două fișiere de mai jos sunt **exemple alternative de fișiere de parametri**. azd nu selectează automat `main.parameters.dev.json` sau `main.parameters.prod.json` după numele mediului. Folosește `main.parameters.json` cu substituiri de mediu (de exemplu `${APP_SERVICE_SKU=B1}`) și declară/consumă fiecare parametru în Bicep.

Conținut exemplu pentru `infra/main.parameters.dev.json`:

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

Conținut exemplu pentru `infra/main.parameters.prod.json`:

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

### Provisionare condițională de resurse
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

## 🚀 Modele avansate de provisionare

### Implementare multi-regiune
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

### Testarea infrastructurii
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

Provisionarea infrastructurii nu implementează codul aplicației tale. Execută controale aplicației doar după `azd deploy`/`azd up`, și folosește `/health` doar dacă aplicația ta îl implementează. Scripturile de implementare ARM creează resurse Azure și necesită identitate suplimentară, versiuni runtime suportate și permisiuni; ele nu sunt teste locale unitare.

## 🧪 Previziune și validare a infrastructurii (NOI)

### Previzionează schimbările de infrastructură înainte de implementare

Funcția `azd provision --preview` îți permite să **simulezi provisionarea infrastructurii** înainte de a implementa resursele efectiv. Este similară cu `terraform plan` sau `bicep what-if`, oferindu-ți o **previziune detaliată** a modificărilor ce s-ar face în mediul tău Azure.

#### 🛠️ Ce face
- **Analizează șabloanele tale IaC** (Bicep sau Terraform)
- **Arată o previziune a modificărilor de resurse**: adăugiri, ștergeri, actualizări
- **Nu aplică modificările propuse de provider** — inspectează mai întâi hook-urile proiectului; scripturile pot avea efecte secundare și previziunea încă necesită permisiuni Azure

#### Cazuri de utilizare
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

Această comandă te ajută să:
- **Validezi modificările infrastructurii** înainte de a aproba resurse
- **Depistezi configurări greșite devreme** în ciclul de dezvoltare
- **Colaborezi în siguranță** în medii de echipă
- **Asiguri implementări cu cele mai mici privilegii** fără surprize

Este mai ales utilă când:
- Lucrezi cu medii complexe multi-serviciu
- Faci modificări infrastructurii în producție
- Verifici modificări de șablon înainte de aprobarea PR-ului
- Oferi instruire membrilor noi ai echipei pe modele de infrastructură

### Exemplu de ieșire previzionată
Ieșirea exactă a previziunii variază în funcție de provider și structura proiectului, dar rezultatul trebuie să identifice clar modificările propuse înainte de a se aplica ceva.

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

## 🔄 Actualizări și migrații de resurse

### Actualizări sigure ale resurselor
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

### Migrații de baze de date
**Model script de implementare incomplet:** necesită o identitate atribuită utilizatorului configurată unde este nevoie, runtime Azure CLI suportat, unelte de migrare disponibile, un director/configurație de migrare furnizată și conectivitate la baza de date. Nu este executabil doar prin inserarea acestei resurse într-un șablon.

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

## 🎯 Cele mai bune practici

### 1. Convenții de denumire a resurselor
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. Strategie de etichetare
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

### 3. Validarea parametrilor
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

### 4. Organizarea rezultatelor
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

## Pașii următori

- [Planificare pre-implementare](../chapter-06-pre-deployment/capacity-planning.md) - Validează disponibilitatea resurselor
- [Probleme comune](../chapter-07-troubleshooting/common-issues.md) - Depanează probleme de infrastructură
- [Ghid de depanare](../chapter-07-troubleshooting/debugging.md) - Depanarea problemelor de aprovizionare
- [Selecția SKU](../chapter-06-pre-deployment/sku-selection.md) - Alegerea nivelurilor de servicii potrivite

## Resurse suplimentare

- [Documentația Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Șabloane Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Centrul de arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Cadrul bine arhitecturat Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigare**
- **Lecția Anterioară**: [Ghid de implementare](deployment-guide.md)
- **Lecția Următoare**: [Planificarea capacității](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->