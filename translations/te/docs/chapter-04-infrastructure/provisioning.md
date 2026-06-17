# AZD తో Azure వనరుల Provisioning

**Chapter Navigation:**
- **📚 Course Home**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 Current Chapter**: అధ్యాయం 4 - ఇన్ఫ్రాస్ట్రక్చర్‌ను కోడ్ రూపంలో & డిప్లాయ్‌మెంట్
- **⬅️ Previous**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **➡️ Next Chapter**: [అధ్యాయం 5: బహు-ఏజెంట్ AI పరిష్కారాలు](../../examples/retail-scenario.md)
- **🔧 Related**: [అధ్యాయం 6: ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ](../chapter-06-pre-deployment/capacity-planning.md)

## పరిచయం

ఈ విస్తృత గైడ్ Azure Developer CLI ఉపయోగించి Azure వనరులను provision మరియు నిర్వహించుకోవడానికి అవసరమైన అన్ని విషయాలను కవర్ చేస్తుంది. Bicep, ARM టెంప్లేట్లు, Terraform, మరియు Pulumi ఉపయోగించి ప్రాథమిక వనరు సృష్టి నుండి అధునాతన ఎంటర్ప్రైజ్-శ్రేణి ఇన్ఫ్రాస్ట్రక్చర్ ఆర్కిటెక్చర్‌ల వరకు Infrastructure as Code (IaC) నమూనాలను అమలు చేయటాన్ని నేర్చుకోండి.

## నేర్చుకోవాల్సిన లక్ష్యాలు

By completing this guide, you will:
- Infrastructure as Code సిద్ధాంతాలు మరియు Azure వనరు provisioning లో ప్రావీణ్యం సాధించండి
- Azure Developer CLI మద్దతు ఇచ్చే అనేక IaC ప్రొవైడర్లను అర్థం చేసుకోండి
- సాధారణ అనువర్తన ఆర్కిటెక్చర్‌ల కోసం Bicep టెంప్లేట్లు డిజైన్ మరియు అమలు చేయండి
- వనరు పరామితులు, వేరియబుల్స్, మరియు వాతావరణ-నిర్దిష్ట సెట్టింగులను కాన్ఫిగర్ చేయండి
- నెట్వర్కింగ్ మరియు భద్రత సహా అధునాతన ఇన్ఫ్రాస్ట్రక్చర్ నమూనాలను అమలు చేయండి
- వనరు లైఫ్‌సైకిల్, నవీకరణలు, మరియు ఆధారపడే అంశాల పరిష్కారాన్ని నిర్వహించండి

## నేర్చిన ఫలితాలు

Upon completion, you will be able to:
- Bicep మరియు ARM టెంప్లేట్లను ఉపయోగించి Azure ఇన్ఫ్రాస్ట్రక్చర్‌ను డిజైన్ చేసి provision చేయగలరు
- సరైన వనరు ఆధారితులతో సంక్లిష్ట బహు-సేవా ఆర్కిటెక్చర్లను కాన్ఫిగర్ చేయగలరు
- బహుళ వాతావరణాలు మరియు కాన్ఫిగరేషన్‌ల కోసం పరామితీకరించిన టెంప్లేట్లను అమలు చేయగలరు
- ఇన్ఫ్రాస్ట్రక్చర్ provisioning సమస్యలనుTroubleshoot చేసి డిప్లాయ్‌మెంట్ విఫలతలను పరిష్కరించగలరు
- ఇన్ఫ్రాస్ట్రక్చర్ డిజైన్‌లో Azure Well-Architected Framework సిద్ధాంతాలను వర్తింపజెయ్యగలరు
- ఇన్ఫ్రాస్ట్రక్చర్ నవీకరణలను నిర్వహించి ఇన్ఫ్రాస్ట్రక్చర్ వెర్షనింగ్ వ్యూహాలను అమలు చేయగలరు

## ఇన్ఫ్రాస్ట్రక్చర్ Provisioning అవలోకనం

Azure Developer CLI అనేక Infrastructure as Code (IaC) ప్రొవైడర్లను మద్దతు ఇస్తుంది:
- **Bicep** (సిఫార్సు చేయబడింది) - Azure యొక్క డొమైన్-స్పెసిఫిక్ భాష
- **ARM Templates** - JSON-ఆధారిత Azure Resource Manager టెంప్లేట్లు
- **Terraform** - బహు-క్లౌడ్ ఇన్ఫ్రాస్ట్రక్చర్ సాధనం
- **Pulumi** - ప్రోగ్రామింగ్ భాషలతో ఆధునిక ఇన్ఫ్రాస్ట్రక్చర్-అస్-కోడ్

## Azure వనరులను అర్థం చేసుకోవడం

### Resource Hierarchy
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### అనువర్తనాల కోసం సాధారణ Azure సేవలు
- **Compute**: App Service, Container Apps, Functions, Virtual Machines
- **Storage**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **Networking**: Virtual Network, Application Gateway, CDN
- **Security**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: Azure AI Services, Azure OpenAI, Azure Machine Learning

## Bicep ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు

### ప్రాథమిక Bicep టెంప్లేట్ నిర్మాణం
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

### అధునాతన Bicep నమూనాలు

#### మాడ్యులర్ ఇన్ఫ్రాస్ట్రక్చర్
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

#### షరతు ఆధారంగా వనరు సృష్టి
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

## 🌐 azd తో Terraform ఉపయోగించడం

Bicep azd యొక్క డిఫాల్ట్ కాగా, azd కూడా **Terraform** ను మద్దతు ఇస్తుంది—మీ టీమ్ ఇప్పటికే దీని మీద స్టాండర్డైజ్ చేసుకున్నట్లయితే లేదా మీరు బహు-క్లౌడ్ ఇన్ఫ్రాస్ట్రక్చర్‌ను నిర్వహిస్తుంటే ఇది ఉపయోగకరం. azd వర్క్‌ఫ్లో (`azd up`, `azd provision`, `azd down`) అదే ఉంటుంది; కేవలం ఇన్ఫ్రాస్ట్రక్చర్ భాష మరియు ఫోల్డర్ లేఅవుట్ మాత్రమే మారతాయి.

### azd కు Terraform ఉపయోగించమని చెప్పండి

Add an `infra` section to `azure.yaml` pointing at the Terraform provider:

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

### Terraform ఫోల్డర్ లేఅవుట్

With the Terraform provider, your `infra/` folder uses `.tf` files instead of Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### కనీస `main.tf`

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

### azd మీ Terraform అవుట్‌పుట్‌లతో ఎలా కనెక్ట్ అవుతుంది

azd reads Terraform **outputs** to learn your endpoints and to wire environment values back into your app. The output names matter—azd looks for specific ones:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **ప్రాముఖ్యత:** azd ప్రతి వాతావరణానికి వనరులను ట్రాక్ చేయడానికి `azd-env-name` ట్యాగ్ మరియు `AZURE_*` అవుట్‌పుట్‌లను ఉపయోగిస్తుంది. Always tag your resource group with `"azd-env-name" = var.environment_name` so `azd down` can find and remove everything.

### Terraform తో డిప్లాయ్ చేయండి

The commands are exactly the same as Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd అంతర్గతంగా 'terraform plan' ను అమలు చేస్తుంది
azd up                    # సర్వీసుల ఏర్పాటు + అమలు
azd down --force          # Terraform నిర్వహించే వనరులను నాశనం చేస్తుంది
```

> **అవసరమైన షరతు:** Terraform must be installed and on your `PATH`. azd manages the Terraform *workflow* but does not install Terraform for you. For state, azd defaults to local state; for teams, configure a remote backend (for example, an Azure Storage backend) in `provider.tf`.

For complete, runnable Terraform-based starters, browse the [Awesome AZD gallery](https://azure.github.io/awesome-azd/) and filter for Terraform, or see the official [azd Terraform documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 azd తో Pulumi ఉపయోగించడం

If your team writes infrastructure in a general-purpose language (TypeScript, Python, Go, or C#) rather than a DSL, azd also supports **Pulumi**. As with Terraform, the `azd up` / `azd provision` / `azd down` workflow is unchanged—only the infrastructure tooling and folder layout differ.

### azd కు Pulumi ఉపయోగించమని చెప్పండి

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

### Pulumi ఫోల్డర్ లేఅవుట్

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### కనీస `index.ts`

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// azd వాటిని ట్రాక్ చేసి క్లీనప్ చేయడానికి ప్రతి వనరును ట్యాగ్ చేయండి
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd ఈ అవుట్‌పుట్‌లను మీ పర్యావరణంలోకి తిరిగి చదివి లోడ్ చేస్తుంది
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### స్టాక్స్ azd వాతావరణాలతో మ్యాప్ అవుతాయి

Pulumi organizes deployments into **stacks**, and azd maps each azd environment to a Pulumi stack of the same name. When you run `azd env new staging`, azd selects (or creates) the `staging` Pulumi stack. The same `azd-env-name` tagging and `AZURE_*` output rules apply, so `azd down` can find and remove everything.

### Pulumi తో డిప్లాయ్ చేయండి

```bash
azd auth login
azd env new dev
azd provision --preview   # azd అంతర్గతంగా 'pulumi preview' ని నడపుతుంది
azd up                    # సాధనాల ఏర్పాటు + అమలు
azd down --force          # 'pulumi destroy' ని నడపుతుంది
```

> **అవసరమైన షరతు:** Pulumi must be installed and on your `PATH`, and you'll need a state backend (Pulumi Cloud or a self-managed backend such as Azure Blob Storage). azd manages the Pulumi *workflow*, not the install. See the official [azd Pulumi documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 మీ సేవకు హోస్ట్ ఎంచుకోవడం

The `host` field in `azure.yaml` decides where your code runs. azd supports several hosts—picking the right one matters more than the infrastructure language. Here's a beginner-friendly comparison:

| `host` value | ఉత్తమం కోసం | ఎందుకు |
|--------------|----------|-----|
| `appservice` | సాంప్రదాయ వెబ్ యాప్స్ మరియు APIs | సరళమైన PaaS; కంటైనర్లు అవసరం కాదు |
| `staticwebapp` | ఫ్రంట్-ఎండ్ SPAs (React, Vue, Angular) | గ్లోబల్ CDN + ఉచిత SSL, బిల్ట్-ఇన్ API మద్దతు |
| `function` | ఈవెంట్-చాలిత మరియు సర్వర్‌లెస్ వర్క్‌లోడ్స్ | స్కేల్-టు-జీరో, అమలు ప్రకారం చెల్లింపు |
| `containerapp` | కంటైనరైజ్డ్ మైక్రోసర్వీసులకు | సర్వర్‌లెస్ కంటైనర్లు, స్కేల్-టు-జీరో, బిల్ట్-ఇన్ ఇన్‌గ్రెస్స్ |
| `aks` | సంక్లిష్ట ఆర్కెస్ట్రేషన్ అవసరాలకు | మీకు నిజంగా అవసరం ఉన్నప్పుడు పూర్తి Kubernetes నియంత్రణ |
| `springapp` | Java Spring Boot యాప్స్ | Spring కోసం ట్యూన్ చేయబడిన మేనేజ్‌డ్ Azure Spring Apps రన్‌టైమ్ |

### AKS ను ఎప్పుడు ఎంపిక చేయాలి

**Azure Kubernetes Service (`host: aks`)** మీకు Kubernetes యొక్క పూర్తి శక్తిని ఇస్తుంది—కస్టమ్ కంట్రోలర్లు, సర్వీస్ మెష్‌లు, సంక్లిష్ట నెట్వర్కింగ్, మరియు బాగా విడి షెడ్యూలింగ్. ఆ శక్తికి నిర్వహణ భారమో అది కూడా ఉంటుంది: మీరు నోడ్ పూల్స్, అప్‌గ్రేడ్‌లు, మరియు క్లస్టర్ నెట్వర్కింగ్‌ను నిర్వహించాలి.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **లభిస్తే సులభంగా ప్రారంభించండి.** చాలా మైక్రోసర్వీసుల కోసం, **Container Apps** మీకు కంటైనర్లు, ఆటోస్కేలింగ్, మరియు స్కేల్-టు-జీరో ను క్లస్టర్ నిర్వహణ లేకుండా ఇస్తుంది. Kubernetes-స్పెసిఫిక్ ఫీచర్లకు మాత్రమే AKS ఎంచుకోండి.

### Azure Spring Apps ఎప్పుడు ఉపయోగించాలి

**Azure Spring Apps (`host: springapp`)** Spring Boot కోసం ప్రత్యేకంగా రూపొందించిన మేనేజ్‌డ్ రన్‌టైమ్. ఇది సర్వీస్ డిస్కవరీ, కాన్ఫిగ్ సర్వర్, మరియు బ్లూ-గ్రీన్ డిప్లాయ్‌మెంట్‌ను నిర్వహిస్తుంది, అందువల్ల Java టీమ్లు తమ స్వంత ఇన్ఫ్రాస్ట్రక్చర్ నడపవద్దనే ఉద్దేశు.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> Use `springapp` when you have existing Spring Boot apps and want a runtime tuned for them. For new containerized Java apps without Spring-specific needs, `containerapp` is often the simpler choice.

## 🗃️ డేటాబేస్ Provisioning

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

## 🔒 భద్రత మరియు రహస్యాల నిర్వహణ

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

## 🌍 నెట్వర్కింగ్ మరియు కనెక్టివిటీ

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

## 📊 మానిటరింగ్ మరియు పరిశీలన

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

## 🔧 వాతావరణ-నిర్దిష్ట కాన్ఫిగరేషన్లు

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

## 🚀 అధునాతన Provisioning నమూనాలు

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

## 🧪 ఇన్ఫ్రాస్ట్రక్చర్ ప్రీవ్యూకు & ధృవీకరణ (NEW)

### డిప్లాయ్‌మెంట్ ముందు ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ప్రివ్యూ చేసుకోండి

The `azd provision --preview` feature lets you **simulate infrastructure provisioning** before actually deploying resources. It's similar in spirit to `terraform plan` or `bicep what-if`, giving you a **dry-run view** of what changes would be made to your Azure environment.

#### 🛠️ ఇది ఏమి చేస్తుంది
- **మీ IaC టెంప్లేట్లను విశ్లేషిస్తుంది** (Bicep లేదా Terraform)
- **వనరు మార్పులకి ప్రివ్యూ చూపుతుంది**: జోడింపులు, తొలగింపులు, నవీకరణలు
- **మార్పులను వర్తింపజేయదు** — ఇది రీడ్-ఒన్లీ మరియు నడపడానికి సురక్షితం

#### ఉపయోగ కేసులు
```bash
# డిప్లాయ్‌మెంట్‌కు ముందు ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ముందుగా చూడండి
azd provision --preview

# నిర్దిష్ట పర్యావరణానికి పూర్వావలోకనం
azd provision --preview -e production
```

This command helps you:
- **వనరు కమిట్ చేయక ముందు ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ధృవీకరించండి**
- **డెవలప్‌మెంట్ చక్రంలో తప్పు కాన్ఫిగరేషన్లను త్వరగానే పట్టుకోండి**
- **టీమ్ వాతావరణాల్లో సురక్షితంగా సహకరించండి**
- **ఆశ్చర్యాలేవీ లేకుండా కనిష్ట హక్కుల డిప్లాయ్‌మెంట్‌ను నిర్ధారించండి**

It's especially useful when:
- సంక్లిష్ట బహు-సేవా వాతావరణాలతో పని చేస్తున్నప్పుడు
- ప్రొడక్షన్ ఇన్ఫ్రాస్ట్రక్చర్‌లో మార్పులు చేస్తున్నప్పుడు
- PR ఆమోదం ముందు టెంప్లేట్ మార్పులను ధృవీకరించేటప్పుడు
- ఇన్ఫ్రాస్ట్రక్చర్ నమూనాలపై కొత్త టీం సభ్యులకు శిక్షణ ఇచ్చేటప్పుడు

### ఉదాహరణ ప్రివ్యూ అవుట్‌పుట్
Exact preview output varies by provider and project structure, but the result should clearly identify proposed changes before anything is applied.

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

## �🔄 వనరు నవీకరణలు మరియు మైగ్రేషన్లు

### Safe Resource Updates
```bash
# ముందుగా ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ప్రీవ్యూ చేయండి (సిఫార్సు చేయబడింది)
azd provision --preview

# ప్రీవ్యూ నిర్ధారణ తర్వాత మార్పులను అమలు చేయండి
azd provision --confirm-with-no-prompt

# Rollback కోసం, Git ఉపయోగించి ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను వెనక్కి తిప్పండి:
git revert HEAD  # చివరి ఇన్ఫ్రాస్ట్రక్చర్ కమిట్‌ను వెనక్కి తిప్పండి
azd provision    # మునుపటి ఇన్ఫ్రాస్ట్రక్చర్ స్థితిని అమలు చేయండి
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

## 🎯 ఉత్తమ పద్ధతులు

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

## తదుపరి దశలు

- [ప్రీ-డిప్లాయ్‌మెంట్ ప్లానింగ్](../chapter-06-pre-deployment/capacity-planning.md) - వనరు అందుబాటును ధృవీకరించండి
- [సాధారణ సమస్యలు](../chapter-07-troubleshooting/common-issues.md) - ఇన్ఫ్రాస్ట్రక్చర్ సమస్యలను ట్రబుల్‌షూట్ చేయండి
- [డీబగింగ్ గైడ్](../chapter-07-troubleshooting/debugging.md) - ప్రావిజనింగ్ సమస్యలను డీబగ్ చేయండి
- [SKU ఎంపిక](../chapter-06-pre-deployment/sku-selection.md) - సరైన సర్వీస్ టియర్‌లను ఎంచుకోండి

## అదనపు వనరులు

- [Azure Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Resource Manager Templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **తర్వాతి పాఠం**: [ప్రీ-డిప్లాయ్‌మెంట్ ప్లానింగ్](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->