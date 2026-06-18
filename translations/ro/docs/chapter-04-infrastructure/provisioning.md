# Provisionarea resurselor Azure cu AZD

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca Cod & Implementare
- **⬅️ Anterior**: [Ghid de Implementare](deployment-guide.md)
- **➡️ Capitol următor**: [Capitolul 5: Soluții AI Multi-Agent](../../examples/retail-scenario.md)
- **🔧 Related**: [Capitolul 6: Validare Pre-Implementare](../chapter-06-pre-deployment/capacity-planning.md)

## Introducere

Acest ghid complet acoperă tot ce trebuie să știi despre provisioning-ul și gestionarea resurselor Azure folosind Azure Developer CLI. Învață să implementezi modele de Infrastructură ca Cod (IaC) de la crearea de bază a resurselor până la arhitecturi avansate de infrastructură de nivel enterprise folosind Bicep, șabloane ARM, Terraform și Pulumi.

## Obiective de învățare

Finalizând acest ghid, vei:
- Stăpâni principiile Infrastructurii ca Cod și provisioning-ul resurselor Azure
- Înțelege mai mulți furnizori IaC suportați de Azure Developer CLI
- Proiecta și implementa șabloane Bicep pentru arhitecturi comune de aplicații
- Configura parametri de resurse, variabile și setări specifice mediului
- Implementa modele avansate de infrastructură incluzând rețelistică și securitate
- Gestiona ciclul de viață al resurselor, actualizări și rezolvarea dependențelor

## Rezultate de învățare

La final, vei putea să:
- Proiectezi și să provisionezi infrastructură Azure folosind Bicep și șabloane ARM
- Configurezi arhitecturi multi-serviciu complexe cu dependențe corecte între resurse
- Implementezi șabloane parametrizate pentru multiple medii și configurații
- Depanezi problemele de provisioning al infrastructurii și să rezolvi eșecurile de implementare
- Aplici principiile Azure Well-Architected Framework în designul infrastructurii
- Gestionezi actualizările infrastructurii și implementezi strategii de versionare a infrastructurii

## Prezentare generală a provisioning-ului infrastructurii

Azure Developer CLI suportă mai mulți furnizori Infrastructure as Code (IaC):
- **Bicep** (recomandat) - limbaj specific domeniului Azure
- **Șabloane ARM** - șabloane Azure Resource Manager bazate pe JSON
- **Terraform** - unelte multi-cloud pentru infrastructură
- **Pulumi** - infrastructură modernă ca și cod cu limbaje de programare

## Înțelegerea resurselor Azure

### Ierarhia resurselor
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Servicii Azure comune pentru aplicații
- **Calcul**: App Service, Container Apps, Functions, Mașini Virtuale
- **Stocare**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Rețelistică**: Virtual Network, Application Gateway, CDN
- **Securitate**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Servicii Azure AI, Azure OpenAI, Azure Machine Learning

## Șabloane de infrastructură Bicep

### Structura de bază a unui șablon Bicep
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

#### Crearea condiționată a resurselor
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

Bicep este implicit pentru azd, dar azd suportă și **Terraform**—util dacă echipa ta deja îl folosește sau gestionezi infrastructură multi-cloud. Fluxul de lucru azd (`azd up`, `azd provision`, `azd down`) este identic; doar limbajul infrastructurii și structura folderului se schimbă.

### Specifică azd să folosească Terraform

Adaugă o secțiune `infra` în `azure.yaml` care indică către furnizorul Terraform:

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

### Structura folderului Terraform

Cu furnizorul Terraform, folderul tău `infra/` folosește fișiere `.tf` în loc de Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### Un `main.tf` minimal

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

### Cum se conectează azd la output-urile Terraform

azd citește **output-urile** Terraform pentru a descoperi endpoint-urile tale și pentru a conecta valorile de mediu înapoi în aplicație. Numele output-urilor sunt importante — azd caută unele specifice:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Important:** azd folosește eticheta `azd-env-name` și output-urile `AZURE_*` pentru a urmări resursele pe mediu. Etichetează întotdeauna grupul tău de resurse cu `"azd-env-name" = var.environment_name` astfel încât `azd down` să poată găsi și șterge tot.

### Implementare cu Terraform

Comenzile sunt exact aceleași ca pentru Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd rulează 'terraform plan' în fundal
azd up                    # provisionare + implementare
azd down --force          # distruge resursele gestionate de Terraform
```

> **Precondiție:** Terraform trebuie instalat și să fie în `PATH`. azd gestionează fluxul Terraform dar nu îl instalează pentru tine. Pentru starea infrastructurii, azd folosește starea locală implicit; pentru echipe, configurează un backend remote (de exemplu, un backend Azure Storage) în `provider.tf`.

Pentru startere complete și rulabile bazate pe Terraform, parcurge galeria [Awesome AZD](https://azure.github.io/awesome-azd/) și filtrează pentru Terraform sau vezi documentația oficială [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Utilizarea Pulumi cu azd

Dacă echipa ta scrie infrastructura într-un limbaj general-purpose (TypeScript, Python, Go sau C#) în loc de un DSL, azd suportă de asemenea **Pulumi**. La fel ca la Terraform, fluxul de lucru `azd up` / `azd provision` / `azd down` rămâne neschimbat—diferența este doar în instrumentele infrastructurii și structura folderului.

### Specifică azd să folosească Pulumi

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

### Structura folderului Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### Un `index.ts` minimal

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Marchează fiecare resursă pentru ca azd să le poată urmări și curăța
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd citește aceste ieșiri înapoi în mediul tău
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stack-urile se map-ează pe mediile azd

Pulumi organizează implementările în **stack-uri**, iar azd asociază fiecare mediu azd cu un stack Pulumi cu același nume. Când rulezi `azd env new staging`, azd selectează (sau creează) stack-ul Pulumi `staging`. Se aplică aceleași reguli pentru etichetarea cu `azd-env-name` și output-urile `AZURE_*` pentru ca `azd down` să poată găsi și elimina toate resursele.

### Implementare cu Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd rulează 'pulumi preview' în fundal
azd up                    # aprovizionare + implementare
azd down --force          # rulează 'pulumi destroy'
```

> **Precondiție:** Pulumi trebuie instalat și să fie în `PATH`, iar tu ai nevoie de un backend pentru stare (Pulumi Cloud sau un backend autogestionat precum Azure Blob Storage). azd gestionează fluxul Pulumi, nu instalarea acestuia. Vezi documentația oficială [azd Pulumi](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Alegerea unui host pentru serviciul tău

Câmpul `host` din `azure.yaml` decide unde rulează codul tău. azd suportă mai mulți hosturi—alegerea corectă este mai importantă decât limbajul infrastructurii. Iată o comparație prietenoasă pentru începători:

| Valoare `host` | Ideal pentru | De ce |
|----------------|--------------|-------|
| `appservice` | Aplicații web și API-uri tradiționale | Cel mai simplu PaaS; nu sunt necesare containere |
| `staticwebapp` | SPA-uri front-end (React, Vue, Angular) | CDN global + SSL gratuit, suport API încorporat |
| `function` | Workload-uri event-driven și serverless | Scalare la zero, plată per execuție |
| `containerapp` | Microservicii containerizate | Containere serverless, scalare la zero, ingress integrat |
| `aks` | Necesită orchestrare complexă | Control complet Kubernetes când chiar ai nevoie |
| `springapp` | Aplicații Java Spring Boot | Runtime Azure Spring Apps gestionat și optimizat pentru Spring |

### Când să alegi AKS

**Azure Kubernetes Service (`host: aks`)** îți oferă puterea completă a Kubernetes — controlere personalizate, mesh-uri de servicii, rețelistică complexă și scheduling granulat. Această putere vine cu o complexitate operațională: administrezi pool-uri de noduri, upgrade-uri și rețelistica cluster-ului.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Începe mai simplu dacă poți.** Pentru majoritatea microserviciilor, **Container Apps** oferă containere, scalare automată și scalare la zero fără să administrezi un cluster. Alege AKS doar când ai nevoie de caracteristici specifice Kubernetes.

### Când să folosești Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** este un runtime gestionat, construit special pentru Spring Boot. Gestionază service discovery, config server și implementare blue-green astfel încât echipele Java nu trebuie să administreze singure infrastructura.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Folosește `springapp` când ai aplicații Spring Boot existente și dorești un runtime optimizat pentru ele. Pentru aplicații Java containerizate noi fără nevoi specifice Spring, `containerapp` este de obicei alegerea mai simplă.

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

### Configurarea Managed Identity
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

## 🌍 Rețelistică și conectivitate

### Configurarea Virtual Network
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

### Metrici personalizate și alerte
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

## 🔧 Configurații specifice mediului

### Fișiere de parametri pentru medii diferite
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

### Provisionarea condițională a resurselor
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

## 🚀 Modele avansate de provisioning

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

## 🧪 Previziunea și validarea infrastructurii (NOU)

### Previzionează modificările infrastructurii înainte de implementare

Funcția `azd provision --preview` îți permite să **simulezi provisioning-ul infrastructurii** înainte să implementezi efectiv resursele. Este similară cu `terraform plan` sau `bicep what-if`, oferindu-ți o **vizualizare de tip dry-run** a modificărilor care ar fi aplicate în mediul tău Azure.

#### 🛠️ Ce face
- **Analizează șabloanele tale IaC** (Bicep sau Terraform)
- **Afișează un preview al modificărilor resurselor**: adăugări, ștergeri, actualizări
- **Nu aplică modificările** — este doar citire și sigur de rulat

#### Cazuri de utilizare
```bash
# Previzualizează modificările infrastructurii înainte de implementare
azd provision --preview

# Previzualizare pentru un mediu specific
azd provision --preview -e production
```

Această comandă te ajută să:
- **Validezi modificările infrastructurii** înainte de a angaja resurse
- **Depistezi configurări greșite devreme** în ciclul de dezvoltare
- **Colaborezi în siguranță** în echipe
- **Asiguri implementări cu privilegii minime** fără surprize

Este utilă mai ales când:
- Lucrezi cu medii complexe multi-serviciu
- Faci modificări în infrastructura de producție
- Validezi modificările șabloanelor înainte de aprobare PR
- Instrui membri noi ai echipei în modele de infrastructură

### Exemplu de ieșire la previziune

Ieșirea exactă variază în funcție de furnizor și structură de proiect, dar rezultatul trebuie să identifice clar schimbările propuse înainte de aplicare.

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

## �🔄 Actualizări și migrații ale resurselor

### Actualizări sigure ale resurselor
```bash
# Previzualizați mai întâi modificările infrastructurii (RECOMANDAT)
azd provision --preview

# Aplicați modificările după confirmarea previzualizării
azd provision --confirm-with-no-prompt

# Pentru revenire, folosiți Git pentru a anula modificările infrastructurii:
git revert HEAD  # Anulați ultimul commit al infrastructurii
azd provision    # Aplicați starea anterioară a infrastructurii
```

### Migrații de bază de date
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

## 🎯 Cele mai bune practici

### 1. Convenții de numire a resurselor
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Strategie de etichetare
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

### 4. Organizarea output-urilor
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

- [Planificarea pre-implementare](../chapter-06-pre-deployment/capacity-planning.md) - Validarea disponibilității resurselor
- [Probleme frecvente](../chapter-07-troubleshooting/common-issues.md) - Depanarea problemelor de infrastructură
- [Ghid de depanare](../chapter-07-troubleshooting/debugging.md) - Diagnosticare probleme de provisioning
- [Selecția SKU](../chapter-06-pre-deployment/sku-selection.md) - Alegerea nivelurilor adecvate pentru serviciu

## Resurse suplimentare

- [Documentația Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Șabloane Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigare**
- **Lecția anterioară**: [Ghid de implementare](deployment-guide.md)
- **Lecția următoare**: [Planificare Capacitate](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->