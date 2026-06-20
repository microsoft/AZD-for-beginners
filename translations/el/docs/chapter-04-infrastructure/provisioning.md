# Provisioning Azure Resources with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **➡️ Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)
- **🔧 Related**: [Chapter 6: Pre-Deployment Validation](../chapter-06-pre-deployment/capacity-planning.md)

## Introduction

Αυτός ο ολοκληρωμένος οδηγός καλύπτει ό,τι χρειάζεστε για την προμήθεια και διαχείριση πόρων Azure χρησιμοποιώντας το Azure Developer CLI. Μάθετε να εφαρμόζετε πρότυπα Infrastructure as Code (IaC) από τη βασική δημιουργία πόρων έως προηγμένες αρχιτεκτονικές υποδομής επιπέδου επιχείρησης χρησιμοποιώντας Bicep, ARM templates, Terraform και Pulumi.

## Learning Goals

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Κυριαρχήσετε τις αρχές του Infrastructure as Code και την προμήθεια πόρων στο Azure
- Κατανοήσετε τους πολλαπλούς παρόχους IaC που υποστηρίζονται από το Azure Developer CLI
- Σχεδιάσετε και υλοποιήσετε Bicep templates για συνηθισμένες αρχιτεκτονικές εφαρμογών
- Διαμορφώσετε παραμέτρους πόρων, μεταβλητές και ρυθμίσεις ανάλογα με το περιβάλλον
- Εφαρμόσετε προχωρημένα πρότυπα υποδομής συμπεριλαμβανομένων δικτύωσης και ασφάλειας
- Διαχειριστείτε τον κύκλο ζωής των πόρων, ενημερώσεις και επίλυση εξαρτήσεων

## Learning Outcomes

Μετά την ολοκλήρωση, θα μπορείτε να:
- Σχεδιάζετε και να προμηθεύετε υποδομή Azure χρησιμοποιώντας Bicep και ARM templates
- Διαμορφώνετε πολύπλοκες αρχιτεκτονικές πολλαπλών υπηρεσιών με σωστές εξαρτήσεις πόρων
- Εφαρμόζετε παραμετροποιημένα templates για πολλαπλά περιβάλλοντα και διαμορφώσεις
- Αντιμετωπίζετε προβλήματα προμήθειας υποδομής και να επιλύετε αποτυχίες ανάπτυξης
- Εφαρμόζετε τις αρχές του Azure Well-Architected Framework στο σχεδιασμό υποδομής
- Διαχειρίζεστε ενημερώσεις υποδομής και να εφαρμόζετε στρατηγικές versioning της υποδομής

## Infrastructure Provisioning Overview

Azure Developer CLI υποστηρίζει πολλαπλούς παρόχους Infrastructure as Code (IaC):
- **Bicep** (συνιστάται) - Η domain-specific γλώσσα της Azure
- **ARM Templates** - JSON-based Azure Resource Manager templates
- **Terraform** - Εργαλείο υποδομής πολλαπλού cloud
- **Pulumi** - Σύγχρονο infrastructure as code με γλώσσες προγραμματισμού

## Understanding Azure Resources

### Resource Hierarchy
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### Common Azure Services for Applications
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep Infrastructure Templates

### Basic Bicep Template Structure
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

### Advanced Bicep Patterns

#### Modular Infrastructure
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

#### Conditional Resource Creation
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

## 🌐 Using Terraform with azd

Το Bicep είναι το προεπιλεγμένο για azd, αλλά το azd υποστηρίζει επίσης **Terraform**—χρήσιμο αν η ομάδα σας ήδη το χρησιμοποιεί ή διαχειρίζεστε υποδομή πολλαπλού cloud. Το workflow του azd (`azd up`, `azd provision`, `azd down`) είναι ίδιο· αλλάζει μόνο η γλώσσα υποδομής και η δομή φακέλων.

### Tell azd to use Terraform

Προσθέστε ένα τμήμα `infra` στο `azure.yaml` που δείχνει στον provider Terraform:

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

### Terraform folder layout

Με τον provider Terraform, ο φάκελος `infra/` σας χρησιμοποιεί αρχεία `.tf` αντί για Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### A minimal `main.tf`

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

### How azd connects to your Terraform outputs

Το azd διαβάζει τα Terraform **outputs** για να μάθει τα endpoints σας και να συνδέσει τιμές περιβάλλοντος πίσω στην εφαρμογή σας. Τα ονόματα των outputs έχουν σημασία—το azd ψάχνει συγκεκριμένα:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **Σημαντικό:** το azd χρησιμοποιεί το tag `azd-env-name` και τα `AZURE_*` outputs για να παρακολουθεί πόρους ανά περιβάλλον. Πάντα κάντε tag το resource group σας με `"azd-env-name" = var.environment_name` ώστε το `azd down` να μπορεί να βρει και να αφαιρέσει τα πάντα.

### Deploy with Terraform

Οι εντολές είναι ακριβώς οι ίδιες με το Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd εκτελεί 'terraform plan' υπό το καπό
azd up                    # παροχή + ανάπτυξη
azd down --force          # καταστρέφει τους πόρους που διαχειρίζεται το Terraform
```

> **Προαπαιτούμενο:** Το Terraform πρέπει να είναι εγκατεστημένο και στο `PATH` σας. Το azd διαχειρίζεται το Terraform *workflow* αλλά δεν εγκαθιστά το Terraform για εσάς. Για το state, το azd προεπιλέγει το τοπικό state· για ομάδες, διαμορφώστε ένα απομακρυσμένο backend (για παράδειγμα, ένα Azure Storage backend) στο `provider.tf`.

Για πλήρη, εκτελέσιμα starters με βάση το Terraform, περιηγηθείτε στην [Awesome AZD gallery](https://azure.github.io/awesome-azd/) και φιλτράρετε για Terraform, ή δείτε την επίσημη [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 Using Pulumi with azd

Αν η ομάδα σας γράφει υποδομή σε μια γενικής χρήσης γλώσσα (TypeScript, Python, Go, ή C#) αντί για DSL, το azd υποστηρίζει επίσης **Pulumi**. Όπως με το Terraform, το workflow `azd up` / `azd provision` / `azd down` μένει αμετάβλητο—αλλάζουν μόνο τα εργαλεία υποδομής και η διάταξη φακέλων.

### Tell azd to use Pulumi

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

### Pulumi folder layout

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### A minimal `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// Επισημάνετε κάθε πόρο ώστε το azd να μπορεί να τους παρακολουθεί και να τους καθαρίζει
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd διαβάζει αυτές τις εξόδους πίσω στο περιβάλλον σας
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### Stacks map to azd environments

Το Pulumi οργανώνει ανάπτυξεις σε **stacks**, και το azd αντιστοιχίζει κάθε περιβάλλον azd σε ένα Pulumi stack με το ίδιο όνομα. Όταν τρέχετε `azd env new staging`, το azd επιλέγει (ή δημιουργεί) το Pulumi stack `staging`. Οι ίδιες κανόνες tagging `azd-env-name` και τα `AZURE_*` outputs εφαρμόζονται, ώστε το `azd down` να μπορεί να βρει και να αφαιρέσει τα πάντα.

### Deploy with Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd εκτελεί το 'pulumi preview' εσωτερικά
azd up                    # παροχή πόρων + ανάπτυξη
azd down --force          # εκτελεί το 'pulumi destroy'
```

> **Προαπαιτούμενο:** Το Pulumi πρέπει να είναι εγκατεστημένο και στο `PATH` σας, και θα χρειαστείτε ένα state backend (Pulumi Cloud ή ένα self-managed backend όπως το Azure Blob Storage). Το azd διαχειρίζεται το Pulumi *workflow*, όχι την εγκατάσταση. Δείτε την επίσημη [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 Choosing a Host for Your Service

Το πεδίο `host` στο `azure.yaml` αποφασίζει πού εκτελείται ο κώδικάς σας. Το azd υποστηρίζει διάφορους hosts—η σωστή επιλογή έχει μεγαλύτερη σημασία από τη γλώσσα υποδομής. Ακολουθεί μια φιλική προς αρχάριους σύγκριση:

| `host` value | Best for | Why |
|--------------|----------|-----|
| `appservice` | Traditional web apps and APIs | Simplest PaaS; no containers required |
| `staticwebapp` | Front-end SPAs (React, Vue, Angular) | Global CDN + free SSL, built-in API support |
| `function` | Event-driven and serverless workloads | Scale-to-zero, pay-per-execution |
| `containerapp` | Containerized microservices | Serverless containers, scale-to-zero, built-in ingress |
| `aks` | Complex orchestration needs | Full Kubernetes control when you truly need it |
| `springapp` | Java Spring Boot apps | Managed Azure Spring Apps runtime tuned for Spring |

### When to reach for AKS

**Azure Kubernetes Service (`host: aks`)** σας δίνει όλη τη δύναμη του Kubernetes—custom controllers, service meshes, πολύπλοκη δικτύωση και λεπτομερή scheduling. Αυτή η δύναμη συνοδεύεται από λειτουργικό κόστος: διαχειρίζεστε node pools, αναβαθμίσεις και το δίκτυο του cluster.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **Ξεκινήστε απλούστερα αν μπορείτε.** Για τα περισσότερα μικρο-υπηρεσιακά συστήματα, τα **Container Apps** σας δίνουν containers, autoscaling και scale-to-zero χωρίς να διαχειριστείτε cluster. Επιλέξτε AKS μόνο όταν χρειάζεστε λειτουργίες που είναι ειδικές για Kubernetes.

### When to use Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** είναι ένα managed runtime σχεδιασμένο για Spring Boot. Διαχειρίζεται service discovery, config server και blue-green deployment ώστε οι Java ομάδες να μην χρειάζεται να τρέχουν τη δική τους υποδομή.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Χρησιμοποιήστε `springapp` όταν έχετε υπάρχουσες εφαρμογές Spring Boot και θέλετε ένα runtime βελτιστοποιημένο γι’ αυτές. Για νέες containerized Java εφαρμογές χωρίς ανάγκες ειδικές για Spring, το `containerapp` είναι συχνά η απλούστερη επιλογή.

## 🗃️ Database Provisioning

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

## 🔒 Security and Secrets Management

### Key Vault Integration
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

### Managed Identity Configuration
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

## 🌍 Networking and Connectivity

### Virtual Network Configuration
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

### Application Gateway with SSL
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

## 📊 Monitoring and Observability

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

### Custom Metrics and Alerts
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

## 🔧 Environment-Specific Configurations

### Parameter Files for Different Environments
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

### Conditional Resource Provisioning
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

## 🚀 Advanced Provisioning Patterns

### Multi-Region Deployment
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

### Infrastructure Testing
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

## 🧪 Infrastructure Preview & Validation (NEW)

### Preview Infrastructure Changes Before Deployment

Η δυνατότητα `azd provision --preview` σας επιτρέπει να **προσομοιώσετε την προμήθεια υποδομής** πριν την πραγματική ανάπτυξη πόρων. Είναι παρόμοια με το `terraform plan` ή το `bicep what-if`, προσφέροντας μια **dry-run εικόνα** των αλλαγών που θα γίνουν στο περιβάλλον Azure σας.

#### 🛠️ What It Does
- **Αναλύει τα IaC templates σας** (Bicep ή Terraform)
- **Δείχνει προεπισκόπηση των αλλαγών πόρων**: προσθήκες, διαγραφές, ενημερώσεις
- **Δεν εφαρμόζει αλλαγές** — είναι μόνο για ανάγνωση και ασφαλές να τρέξει

#### Use Cases
```bash
# Προεπισκόπηση των αλλαγών στην υποδομή πριν την ανάπτυξη
azd provision --preview

# Προεπισκόπηση για συγκεκριμένο περιβάλλον
azd provision --preview -e production
```

Αυτή η εντολή σας βοηθά να:
- **Επαληθεύετε τις αλλαγές υποδομής** πριν δεσμεύσετε πόρους
- **Εντοπίσετε λάθος ρυθμίσεις νωρίς** στον κύκλο ανάπτυξης
- **Συνεργάζεστε με ασφάλεια** σε περιβάλλοντα ομάδας
- **Εξασφαλίζετε αναπτύξεις με ελάχιστα δικαιώματα** χωρίς εκπλήξεις

Είναι ιδιαίτερα χρήσιμη όταν:
- Εργάζεστε με πολύπλοκα περιβάλλοντα πολλαπλών υπηρεσιών
- Κάνετε αλλαγές σε production υποδομή
- Επαληθεύετε τροποποιήσεις templates πριν από έγκριση PR
- Εκπαιδεύετε νέα μέλη της ομάδας στα πρότυπα υποδομής

### Example Preview Output
Το ακριβές preview output διαφέρει ανά πάροχο και δομή έργου, αλλά το αποτέλεσμα θα πρέπει να ταυτοποιεί σαφώς τις προτεινόμενες αλλαγές πριν εφαρμοστεί οτιδήποτε.

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

## �🔄 Resource Updates and Migrations

### Safe Resource Updates
```bash
# Προεπισκόπηση πρώτα των αλλαγών στην υποδομή (ΣΥΝΙΣΤΑΤΑΙ)
azd provision --preview

# Εφαρμόστε τις αλλαγές μετά την επιβεβαίωση της προεπισκόπησης
azd provision --confirm-with-no-prompt

# Για επαναφορά (rollback), χρησιμοποιήστε το Git για να αναιρέσετε τις αλλαγές στην υποδομή:
git revert HEAD  # Αναίρεση του τελευταίου commit της υποδομής
azd provision    # Εφαρμόστε την προηγούμενη κατάσταση της υποδομής
```

### Database Migrations
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

### 1. Resource Naming Conventions
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. Tagging Strategy
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

### 3. Parameter Validation
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

### 4. Output Organization
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

## Next Steps

- [Pre-deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Επαληθεύστε τη διαθεσιμότητα πόρων
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Επιδιορθώστε προβλήματα υποδομής
- [Debugging Guide](../chapter-07-troubleshooting/debugging.md) - Εντοπίστε σφάλματα προμήθειας
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Επιλέξτε κατάλληλα tiers υπηρεσιών

## Additional Resources

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**Navigation**
- **Previous Lesson**: [Deployment Guide](deployment-guide.md)
- **Next Lesson**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->