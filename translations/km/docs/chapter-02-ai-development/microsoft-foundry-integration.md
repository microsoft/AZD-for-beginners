# ការរួមបញ្ចូល Microsoft Foundry ជាមួយ AZD

**ការរុករកជំពូក៖**
- **📚 ផ្ទៃដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍ AI ជាដើម
- **⬅️ ជំពូកមុន**: [ជំពូក 1: គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**: [ភ្នាក់ងារប្រព័ន្ធ AI](agents.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

## សេចក្ដីផ្ដើម

ទិសដៅនេះបង្ហាញពីវិធីរួមបញ្ចូលសេវាកម្ម Microsoft Foundry ជាមួយ Azure Developer CLI (AZD) សម្រាប់ការចាក់ផ្សាយកម្មវិធី AI យ៉ាងងាយស្រួល។ Microsoft Foundry ផ្តល់ជាវេទិកាផ្ដល់សេវាសម្រាប់សាងសង់ ចាក់ផ្សាយ និងគ្រប់គ្រងកម្មវិធី AI ខណៈពេល AZD ងាយស្រួលដល់ដំណើរការជួសជុលហេដ្ឋារចនាសម្ព័ន្ធ និងការចាក់ផ្សាយ។

## Microsoft Foundry ជាអ្វី?

Microsoft Foundry ជាវេទិកាដែលរួមបញ្ចូលរបស់ Microsoft សម្រាប់ការអភិវឌ្ឍន៍ AI ដែលរួមមាន៖

- **បណ្ដាញម៉ូដែល (Model Catalog)**: ចូលដំណើរការម៉ូដែល AI ថ្មីៗ
- **Prompt Flow**: អ្នករចនាតម្រៀបបែបបទចែកចាយ AI បានមើលឃើញ
- **Microsoft Foundry Portal**: បរិយាកាសអភិវឌ្ឍន៍សម្រាប់កម្មវិធី AI
- **ជម្រើសចាក់ផ្សាយ**: ជម្រើសបង្ហាញពហុ និងកម្រិតជ្រៅ
- **សុវត្ថិភាព និងសន្តិសុខ**: លក្ខណៈ AI មានកាតព្វកិច្ចរួមបញ្ចូល

## AZD + Microsoft Foundry៖ ល្អជាមួយគ្នា

| លក្ខណៈ | Microsoft Foundry | ប្រាក់ចំណេញពីការរួមបញ្ចូល AZD |
|---------|-----------------|------------------------|
| **ការចាក់ផ្សាយម៉ូដែល** | ចាក់ផ្សាយដៃ មេផសុំនៅក្នុងកំពូល | ចាក់ផ្សាយវារីករាយ ស្វ័យប្រវត្តិ និងអាចធ្វើម្តងទៀតបាន |
| **ហេដ្ឋារចនាសម្ព័ន្ធ** | ការផ្ដល់ដោយចុចតែមួយ | ហេដ្ឋារចនាសម្ព័ន្ធជារូបមន្ត (Bicep) |
| **ការគ្រប់គ្រងបរិយាកាស** | ផ្ដោតលើបរិយាកាសតែមួយ | បរិយាកាសច្រើន (អភិវឌ្ឍ / សាកល្បង / ផលិត) |
| **ការរួមបញ្ចូល CI/CD** | មានកំណត់ | គាំទ្រដល់កម្មវិធី GitHub Actions ដើម |
| **ការគ្រប់គ្រងថ្លៃដើម** | ត្រួតពិនិត្យមូលដ្ឋាន | បង្កើនប្រសិទ្ធភាពថ្លៃសម្រាប់បរិយាកាសជាក់លាក់ |

## លក្ខខណ្ឌមុន

- មានជាវ Azure ជាមួយសិទ្ធិបណ្ដោះអាសន្នពេញលេញ
- មាន Azure Developer CLI តំឡើងរួច
- ចូលដំណើរការទៅកម្មសិទ្ធិ Microsoft Foundry Models
- មានជំនាញមូលដ្ឋានចំពោះ Microsoft Foundry

> **ពិនិត្យចេញផ្សាយ (2026-11-04):** ទិសដៅ AI CLI ត្រូវបានបញ្ជាក់ប្រកបដោយភាពត្រឹមត្រូវទៅនឹង `azd` `1.37.2`, ភ្នាក់ងារ `1.0.0-beta.23`, និងឯកសារ/ប្រភពប្រឡង `1.0.0-beta.2`។ ប្រើ `azd >= 1.37.0` សម្រាប់ការប្រតិបត្តិការរួម។ មើល [ការផ្លាស់ប្តូរ និងជួសជុលចេញផ្សាយ](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); ការពិនិត្យនេះមិនធានាថាគំរូនីមួយៗឬឧទាហរណ៍ SDK ទាំងអស់ត្រូវបានផ្ទៀងផ្ទាត់ក្នុងការចាក់ផ្សាយពិតប្រាកដទេ។

## រចនាបថរួមបញ្ចូលស្នូល

**ដែនកំណត់នៃឧទាហរណ៍៖** Bicep ខាងក្រោមមានផ្នែករចនាសំណង់ធ្វើឲ្យមើលឃើញ ដោយមិនមែនជាគំរូពេញលេញបញ្ចូលបានជាដំណោះស្រាយទេ។ គំរូដែលរួមបញ្ចូលត្រូវតែកំណត់ឈ្មោះ, `location`, អធិប្បាយធនធាន​ដែល​យោង, អត្តសញ្ញាណ, ผลลัพธ์และការបង្ហោះកម្មវិធី។ ប្រើគំរូភ្ជាប់សម្រាប់ចំណុចចាប់ផ្តើមដែលអាចរត់បាន។ ឧទាហរណ៍ Bash ត្រូវការចូលសំងាត់ Azure CLI ផ្សេងពី `azd auth login`។

### រចនាបថ 1: រួមបញ្ចូលម៉ូដែល Microsoft Foundry

**ករណីប្រើប្រាស់**: ចាក់ផ្សាយកម្មវិធីជជែកជាមួយម៉ូដែល Azure OpenAI ក្នុង Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**ហេដ្ឋារចនាសម្ព័ន្ធ (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

អ្នកហៅត្រូវការអត្តសញ្ញាណគ្រប់គ្រងភ្ជាប់ និង `Cognitive Services OpenAI User` នៅជំហានគណនី; ការ បិទកូនសោមិនផ្តល់សិទ្ធិ។ សូមពិនិត្យភាពអាចប្រើបាននៃតំបន់/ម៉ូដែល/SKU និងកម្រិតជាមុនមុនចាក់ផ្សាយ។

### រចនាបថ 2: រួមបញ្ចូល ស្វែងរក AI + RAG

**ករណីប្រើប្រាស់**: ចាក់ផ្សាយកម្មវិធីបង្កើតឯកសារជាមួយបច្ចេកវិទ្យា retrieval-augmented generation (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

មិនមានធនធាន `Microsoft.Search/searchServices/dataConnections` ARM សម្រាប់ការរួមបញ្ចូលនេះទេ។ កំណត់តុល្យភាព Search, ប្រភពទិន្នន័យ, indexer/skillset ឬ vectorizer តាមរយៈ API ដង់ទិន្នន័យ Search ដែលគាំទ្រ។ ប្រសិនបើ Search ហៅម៉ូដែល embedding សូមបើកប្រើអត្តសញ្ញាណគ្រប់គ្រងរបស់វា ប្ដូរភារកិច្ចម៉ូដែល និងកំណត់ embedding skill/vectorizer។ មើល [vectorization រួមបញ្ចូល](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization)។

### រចនាបថ 3: រួមបញ្ចូល Document Intelligence

**ករណីប្រើប្រាស់**: សកម្មភាពដំណើរការនិងវិភាគឯកសារ

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 រចនាបថកំណត់រចនាសម្ព័ន្ធ

### ការកំណត់អថេរបរិយាកាស

លើកលែងតែការកំណត់ AZD ដែលបានបញ្ជាក់ឯកសារ ដូចជា `AZURE_LOCATION` ពួកវាជា **ឈ្មោះបញ្ចូលបែបបទប្តូរផ្ទាល់ខ្លួន**។ ពួកវាមិនមានផលប៉ះពាល់ទេ លុះត្រាតែបែបបទ/កម្មវិធីប្រើវាតាមរយៈប៉ារ៉ាម៉ែត្រ និងការចម្លងបរិស្ថានម៉ាស៊ីនភ្ញៀវ។ សម្រាប់ `azure-search-openai-demo` សូមប្រើប្រាស់ឈ្មោះពិតរបស់វាដូចជា `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` និង `AZURE_SEARCH_SERVICE_SKU` ជំនួស។ សមត្ថភាពម៉ូដែលមិនមែនជាប្រភេទ SKU នៃគណនីទេ។

**ការកំណត់ផលិតកម្ម៖**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ការកំណត់អភិវឌ្ឍន៍៖**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### ការកំណត់សុវត្ថិភាពជាមួយ Key Vault

បន្ថែមជម្រើសប្រើប្រាស់ Entra ID ដែលពុំមានការផ្ទៀងផ្ទាត់សោជាមួយតំបន់តំបន់។ អ្វីមានដូចខាងក្រោមគឺជា **ជម្រើសផ្ទៀងផ្ទាល់សោបុរាណ** សម្រាប់កម្មវិធី ដែលតម្រូវសោ: វាតម្រូវឲ្យមានគណនីដែលបានបើកការផ្ទៀងផ្ទាត់សោ វិញ, ភាពតំណាងកម្មវិធីភ្ជាប់ទៅកាន់ម៉ាស៊ីនភ្ជាប់របស់វា, ហើយមានការចូលប្រើ/បណ្ដាញ Key Vault ដែលបានដំណើរការ។ កុំបញ្ចូលការទាញយកសោជាមួយ `disableLocalAuth: true` ហើយរំពឹងថាការហៅតាមសោនឹងដំណើរការ។

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## សំណុំការងារដំណើរការ

### វិស្ជាសម្ព័ន្ធ AZD សម្រាប់ Foundry

AZD ផ្តល់នូវវិស្ជាសម្ព័ន្ធដែលបន្ថែមសមត្ថភាព AI ជាក់លាក់សម្រាប់ធ្វើការជាមួយសេវាកម្ម Microsoft Foundry:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

វិស្ជាសម្ព័ន្ធ AI ទាំងនេះនៅតែផ្លាស់ប្តូរយ៉ាងលឿននៅក្នុងការមើលជាមុន។ ប្រសិនបើពាក្យបញ្ជាមួយនៅខុសពីការបង្ហាញនៅទីនេះ សូមធ្វើការរីកចម្រើនវិស្ជាសម្ព័ន្ធដែលពាក់ព័ន្ធមុនពេលដោះស្រាយបញ្ហាតំបន់គម្រោង។

### ការដាក់ឱ្យដំណើរការជាមួយអេហ្សង់ `azd ai` ជាជំហៀងដំបូង

ប្រើប្រាស់ `azd ai agent init` យ៉ាងអន្តរកម្ម ឬយកគំរូគម្រោងអេហ្សង់ `azure.yaml` បច្ចុប្បន្នដែលភ្ជាប់ទៅសេវាកម្ម Foundry Agent:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` ជំនួសសម្រាប់ការចុះអក្សរដែលបានបោះបង់ `--manifest`/`-m`; បញ្ជីបុរាណ និងការកំណត់អេហ្សង់ក្នុងបរិបទនៅតែត្រូវការដំណើរការផ្លាស់ប្តូរ។ ប្រើ `azd ai eval` ពិនិត្យអេហ្សង់ពី `azure.ai.evaluations` មិនមែនការ​បញ្ចប់វិធីសាស្រ្តបុរាណដែលបានយកចេញទេ។ មើល [ការផ្លាស់ប្តូរវិធីសាស្រ្តវាយតម្លៃ](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) សម្រាប់ការតំឡើង, ការអនុវត្ត និងលទ្ធផល។

មើល [ពាក្យបញ្ជា AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) សម្រាប់គោលការណ៍ពាក្យបញ្ជាក្នុងពេញលេញ និងទង់ដែលអាចប្រើបាន។

### ការដាក់ឱ្យដំណើរការដោយពាក្យបញ្ជាមួយកន្លែង

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### ការដាក់ឱ្យដំណើរការតាមបរិយាកាសជាក់លាក់

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ការត្រួតពិនិត្យនិងចំណេះដឹងអំពីប្រព័ន្ធ

### ការរួមបញ្ចូល Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

នេះធ្វើការបង្កើតធនធាន Insights មួយ មិនមែនគឺជាការតម្លើងឧបករណ៍តែប៉ុណ្ណោះទេ។ ពេលកម្មវិធីរបស់អ្នកបញ្ចេញ​ span ហៅម៉ូឌែលក្រៅចេញ, ប្រើការសាកសួរដែលបានបង្ហាញនៅក្នុង Application Insights Logs (កែសម្រួលតម្រងទៅឈ្មោះ span ជាក់លាក់របស់អ្នក):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### ការត្រួតពិនិត្យថ្លៃគិតថ្លៃ

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

ប្រើអ្នកទទួលពិត និងបញ្ជាក់អាជ្ញាបណ្ណតំបន់វិភាគ។ បន្ទប់ថវិកាផ្ញើការជូនដំណឹង; វាមិនមែនជាការកំណត់ប្រាក់ចំណាយឡើយ។

## 🔐 គន្លឹះសុវត្ថិភាព​ល្អបំផុត

### ការកំណត់ Managed Identity

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### សុវត្ថិភាពបណ្តាញ

ផ្នែកចុងក្រោយនៃ endpoint នេះត្រូវការតំបន់ DNS ផ្ទាល់ខ្លួន/ក្រុម តំណភ្ជាប់ VNet ការតភ្ជាប់កម្មវិធីទៅ VNet ហើយនឹងមានគោលនយោបាយច្បាស់លាស់សម្រាប់ការចូលប្រើសាធារណៈ។ បង្កើត endpoint ផ្ទាល់ខ្លួនតែមួយមិនបង្ហាញថាបិទការចូលប្រើសាធារណៈឡើយ។

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## ការបង្កើនសមត្ថភាព

### មុខងារចងចាំ

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache សម្រាប់ Redis ជាកម្រិត Basic/Standard/Premium កំពុង​នៅលើ [ផ្លូវចូលចិត្ត](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); ប្រើ Azure Managed Redis សម្រាប់ការដាក់ឱ្យដំណើរការថ្មី និងអនុវត្តគំរូ/ការផ្ទៀងផ្ទាត់បច្ចុប្បន្នរបស់វា។ កំណត់វាលចងចាំ AI តាមការ​អនុញ្ញាតគ្នា ម៉ូឌែល/ការណែនាំ និងកំណែ​ព័ត៌មាន ជាមួយនឹងការបញ្ចប់; កុំចែករំលែកចម្លើយឯកជនដោយប្រើអត្ថបទសំណួរតែម្ដង។

### ការកំណត់ការពង្រីកស្វ័យប្រវត្តិ

**ធនធាន​ផ្នែកមួយ:** បញ្ចូលការកំណត់ scale/ingress ទាំងនេះទៅក្នុង Container App ពេញលេញជាមួយបរិយាកាសគ្រប់គ្រង រូបភាពម៉ាស៊ីន ហើយមានកំណត់ធនធាន។ ចំនួនចម្លង (replicas) ដែលច្រើនមិនបង្កើនគណនាប្រភេទម៉ូឌែលឡើយ។

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## ដោះស្រាយបញ្ហាទូទៅ

### បញ្ហា 1៖ កំណត់ OpenAI quota លើស

**រោគសញ្ញា:**
- ការដាក់ឱ្យដំណើរការបរាជ័យដោយមានកំហុស quota
- កំហុស 429 នៅក្នុងកំណត់ហេតុកម្មវិធី

**ដំណោះស្រាយ:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

អថេរ capacity ខាងលើអនុវត្តតែចំពោះគំរូផ្ទាល់ខ្លួនដែលភ្ជាប់ទៅការប្រើប្រាស់វា។ សម្រាប់គំរូ RAG ត្រូវប្រើ `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`។ កុំផ្លាស់ប្តូរ `AZURE_LOCATION` ដើម្បីផ្លាស់ទីធនធានគ្រប់យ៉ាងទទួលបាន; បង្កើតបរិយាកាសថ្មីសម្រាប់តំបន់ថ្មី ហើយមានផែនការ ផ្លាស់ទី/សម្អាត។

### បញ្ហា 2៖ ការផ្ទៀងផ្ទាត់បរាជ័យ

**រោគសញ្ញា:**
- កំហុស 401/403 ពេលហៅសេវាកម្ម AI
- សារបង្ហាញ "Access denied"

**ដំណោះស្រាយ:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### បញ្ហា 3៖ បញ្ហាក្នុងការដាក់ម៉ូឌែល

**រោគសញ្ញា:**
- ម៉ូឌែលមិនអាចរកឃើញក្នុងការដាក់ឱ្យដំណើរការ
- កំណែម៉ូឌែលជាក់លាក់បរាជ័យ

**ដំណោះស្រាយ:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## គំរូគម្រោងឧទាហរណ៍

ទាំងនេះជា​ជម្រើស​ជំនួស មិនមែនជា​ពាក្យបញ្ជាដោយលំដាប់​ត្រូវ​ធ្វើ​។ ចាប់ផ្ដើមនីមួយៗនៅថតទទេឯករាជ្យ។ តំបន់បញ្ជូនព័ត៌មាន `.` អនុញ្ញាតឲ្យ​បង្កើត​ initialization នៅថតបច្ចុប្បន្នរបស់អ្នក; មិនដូចនេះ AZD បច្ចុប្បន្នអាចបង្កើតថតឈ្មោះគំរូកូនដោយមិនផ្លាស់ប្តូរតំបន់បច្ចុប្បន្ន។

### កម្មវិធីជជែក RAG (Python)

**ឃ្លាំង**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ពិពណ៌នា**: កម្មវិធីជជែក RAG ឧទាហរណ៍ សម្រាប់សំណួរលើឯកសាររបស់អ្នក ជាមួយការទាញយកពី Azure AI Search។ ពិនិត្យម៉ូឌែលគាំទ្របច្ចុប្បន្ន លក្ខណៈជម្រើស, ដឹកនាំថ្លៃ និងការពង្រឹងសម្រាប់ផលិតកម្មមុនប្រើប្រាស់; ការដាក់ឱ្យដំណើរការគំរូមិនបានបង្កើតកម្មវិធីប្រើការបានគ្មានកំណត់លក្ខណៈនៅផលិតកម្មទេ។

**ចាប់ផ្ដើមយ៉ាងឆាប់រហ័ស**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### កម្មវិធីជជែក RAG (.NET)

**ឃ្លាំង**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ពិពណ៌នា**: ជំនួស .NET/C# នៃគំរូជជែក RAG Python។ បានកសាងជាមួយ ASP.NET Core Minimal API និង Blazor WebAssembly ផ្នែកមុខ។ រួមបញ្ចូលជជែកសូរ, គាំទ្រពី GPT-4o-mini vision, និងអតិថិជន .NET MAUI Blazor Hybrid សម្រាប់ជិត/ចល័ត។

**ចាប់ផ្ដើមយ៉ាងឆាប់រហ័ស**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### កម្មវិធីជជែក RAG (Java)

**ឃ្លាំង**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ពិពណ៌នា**: ម៉ូឌែល Java នៃគំរូជជែក RAG ប្រើ Langchain4J សម្រាប់ការគ្រប់គ្រង AI។ គាំទ្រការបង្កើត microservice បណ្ដាញព្រឹត្តិការណ៍ជាលំដាប់ជាច្រើន, គន្លងស្វែងរកច្រើន (អត្ថបទ, វ៉ិចទ័រ, លាយបញ្ចូល), ការផ្ទុកឯកសារជាមួយ Azure Document Intelligence, និងការដាក់នៅលើ Azure Container Apps ឬ Azure Kubernetes Service។

**ចាប់ផ្ដើមយ៉ាងឆាប់រហ័ស**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### អ្នកជួយលក់រាយសហគ្រាសជាមួយ Microsoft Foundry

**ឃ្លាំង**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**សេវាកម្ម**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ពិពណ៌នា**: អ្នកជួយលក់រាយ RAG សរុបពីការសរសេរ Microsoft Foundry និង Prompty។ ជាកម្មវិធីជជែករបស់ Contoso Outdoor ដែលយកចម្លើយយោងពីកាតាឡុកផលិតផល និងទិន្នន័យការបញ្ជាទិញរបស់អតិថិជន។ បង្ហាញដំណើរការ GenAIOps ពេញលេញ — បង្កើតនៅ Prompty, វាយតម្លៃជាមួយអ្នកប្រើ AI, ហើយដាក់ឱ្យដំណើរការ តាម AZD ទៅ Container Apps។

**ចាប់ផ្ដើមយ៉ាងឆាប់រហ័ស**:
```bash
azd init --template contoso-chat .
azd up
```

### កម្មវិធីអ្នកនិពន្ធច្នៃប្រឌិត Multi-Agent

**ឃ្លាំង**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**សេវាកម្ម**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**ពិពណ៌នា**: គំរូ multi-agent បង្ហាញការគ្រប់គ្រងអេហ្សង់ AI ជាមួយ Prompty។ ប្រើអេហ្សង់ស្រាវជ្រាវ (Bing Grounding នៅក្នុង Azure AI Agent Service), អេហ្សង់ផលិតផល (Azure AI Search), អេហ្សង់អ្នកនិពន្ធ និងអេហ្សង់អ្នកកែសម្រួល ដើម្បីផលិតអត្ថបទស្រាវជ្រាវយ៉ាងល្អជាមួយ។ រួមមាន CI/CD ជាមួយការវាយតម្លៃក្នុង GitHub Actions។

**ចាប់ផ្ដើមយ៉ាងឆាប់រហ័ស**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### ជជែក RAG Serverless (JavaScript/TypeScript)

**ឃ្លាំង**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**សេវាកម្ម**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB សម្រាប់ NoSQL + LangChain.js

**ពិពណ៌នា**: ជជែក RAG ស្វ័យប្រវត្តិសព្វថ្ងៃជាមួយ LangChain.js ជាមួយ Azure Functions សម្រាប់ API និង Azure Static Web Apps សម្រាប់អ្នកផ្ទុក។ ប្រើ Azure Cosmos DB ជាទាំងស្តុកវ៉ិចទ័រ និង​ឃ្លាំងប្រវត្តិជជែក។ គាំទ្រការអភិវឌ្ឍន៍ក្នុងស្រុកដោយ Ollama សម្រាប់ការតេស្តដោយឥតគិតថ្លៃ។

**ចាប់ផ្ដើមយ៉ាងឆាប់រហ័ស**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### ជជែកជាមួយវីធីដំណោះស្រាយទិន្នន័យរបស់អ្នក Solution Accelerator

**ឃ្លាំង**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**សេវាកម្ម**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search ជាមួយ Cosmos DB ឬ PostgreSQL ជាមួយ pgvector

**ពិពណ៌នា**: ជជែកផ្អែកលើឯកសារដោយមានការដកស្រង់យោង។ គំរូបច្ចុប្បន្នផ្តល់ជូន frontend React, backend FastAPI, និងកម្មករទាញយក Functions នៅលើ Container Apps; ជម្រើស orchestration មាន Agent Framework និង LangGraph។ ជម្រើសឃ្លាំង/ការទាញយកត្រូវរើសនៅពេលដាក់ឱ្យដំណើរការ។ វាជាចំណុចចាប់ផ្ដើម មិនមែនប្រព័ន្ធផលិតកម្ម turnkey; កុំគិតថាគំរូ App Service បុរាណ، Semantic Kernel ឬ Prompt Flow គឺជាលំនាំដែលកំពុងប្រើប្រាស់បច្ចុប្បន្ន។

**ចាប់ផ្ដើមយ៉ាងឆាប់រហ័ស**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### អ្នកដំណើរធម្មតា AI — Multi-Agent MCP Orchestration

**ឃ្លាំង**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**សេវាកម្ម**៖ Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**សេចក្តីរាយការណ៍**៖ កម្មវិធីយោងសម្រាប់ការរៀបចំអាជីវកម្ម AI ពហុភ្នាក់ងារជាមួយប្លង់បី (LangChain.js, LlamaIndex.TS, និង Microsoft Agent Framework)។ មានកម្មវិធី MCP (Model Context Protocol) សរសេរជាភាសាចំនួនបួន ដែលបានប្រើជាអ្វីដែលគ្មានម៉ាស៊ីនបម្រើនៅលើ Azure Container Apps មានការត្រួតពិនិត្យ OpenTelemetry។

**ចាប់ផ្តើមយ៉ាងរហ័ស**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **រកមើលទំរង់បន្ថែមទៀត**៖ ចូលទៅកាន់ [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) សម្រាប់ទំរង់ដែលមានស្រាប់នៅក្នុងភាសា និងសេណារីយ៉ូផ្សេងៗ។ ឧទាហរណ៍ដែលភ្ជាប់នេះគឺជាបណ្ណាល័យខាងក្រៅ មិនមែនឧទាហរណ៍ក្នុងមូលដ្ឋានដែលផ្តល់ដោយវគ្គសិក្សានេះទេ; សូមពិនិត្យមើលលក្ខខណ្ឌនានា និងការណែនាំសម្រាប់ផលិតកម្មមុនសម្រាប់ការបង្ហោះ។

## ជំហ៊ានបន្ទាប់

1. **សាកល្បងឧទាហរណ៍**៖ ចាប់ផ្តើមជាមួយទំរង់ដែលបានបង្កើតជាមុនដែលសមរម្យចំពោះករណីការប្រើប្រាស់របស់អ្នក
2. **កែប្រែសម្រាប់តម្រូវការអ្នក**៖ ផ្លាស់ប្តូរឧបករណ៍ហត្ថបញ្ជានិងកូដកម្មវិធី
3. **បន្ថែមការត្រួតពិនិត្យ**៖ អនុវត្តភាពទស្សន៍ទាយទាំងមូល
4. **បង្កើនប្រសិទ្ធិភាពការចំណាយ**៖ គ្រប់គ្រងការកំណត់សម្រាប់ថវិកាអ្នក
5. **ធានាសុវត្ថិភាពការបង្ហោះរបស់អ្នក**៖ អនុវត្តគំរូសុវត្ថិភាពសម្រាប់សហគ្រាស
6. **ពង្រីកដល់ផលិតកម្ម**៖ បន្ថែមមុខងារ​ច្រើនតំបន់ និងការត្រៀមខ្ពស់

## 🎯 ការហ្វឹកហាត់អនុវត្ត

### ការហ្វឹកហាត់ 1៖ បង្ហោះកម្មវិធី Microsoft Foundry Models Chat (30 នាទី)
**គោលដៅ**៖ បង្ហោះនិងសាកល្បងកម្មវិធីជជែក AI ឧទាហរណ៍

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**តម្រូវការជោគជ័យ៖**
- [ ] ការបង្ហោះបញ្ចប់ដោយគ្មានកំហុសចំនួនកូតា
- [ ] អាចចូលប្រើផ្ទាំងជជែកនៅក្នុងកម្មវិធីរុករក
- [ ] អាចសួរបញ្ហានិងទទួលបានចម្លើយបើកដោយ AI
- [ ] Application Insights បង្ហាញទិន្នន័យតេឡិមេត្រី
- [ ] បានសម្អាតធនធានបានជោគជ័យ

**ថ្លៃដើម**៖ ពិនិត្យមើលមគ្គុទេសក៍ថ្លៃដើម និង SKU ដែលបានជ្រើសរើសរបស់គំរូមុនបង្ហោះ។ ការបង់ប្រាក់បន្តរហូតដល់ធនធានត្រូវបានលុបចោល; គ្មានការប៉ាន់ប្រមាណពេល 30 នាទីជាក់លាក់ចំពោះរាល់ការកំណត់ទេ។

### ការហ្វឹកហាត់ 2៖ កំណត់តម្លៃបង្ហោះម៉ូដែលច្រើន (45 នាទី)
**គោលដៅ**៖ បង្ហោះម៉ូដែល AI ច្រើនជាមួយការកំណត់ផ្សេងៗ

**ចំណុចចាប់ផ្តើម**៖ ឧបករណ៍ Azure OpenAI ដែលមានស្រាប់និងម៉ូឌុល resource-group AZD ដែលអាចហៅឯកសារនេះ។ បង្កើត `infra/ai-models.bicep` ដោយមានមាតិកាដូចខាងក្រោមប្រើកម្មវិធីកែសម្រួលអ្នក។ វាមិនត្រូវបានបង្ហោះដោយស្វ័យប្រវត្តិទេដោយសារតែវាគឺនៅក្រោម `infra/`។

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

ពីម៉ូឌុលមានសិទ្ធិក្នុងក្រុមធនធានដែលជាម្ចាស់គណនី បន្ថែមបញ្ជាការហៅម៉ូឌុលមួយ (ផ្លាស់ប្តូរឈ្មោះរូបសញ្ញាទៅគណនីពិតរបស់អ្នក)៖

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

កុំប្រកាសការបង្ហោះដូចគ្នា​នៅក្នុងម៉ូឌុលទាំងពីរ។ ប្រសិនបើចំណុចចូល AZD គឺមានកម្រិតស៊ីមសឺបស្គ្រីបសិន សូមហៅវាពីម៉ូឌុលកូន resource-group និងកែផ្លូវរួមសមស្រប។ សង់ម៉ូឌុលនោះជាមួយ `az bicep build --file <path-to-containing-module>` មុនហើយ:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**តម្រូវការជោគជ័យ៖**
- [ ] ម៉ូដែលជាច្រើនបានបង្ហោះជោគជ័យ
- [ ] ការកំណត់សមត្ថភាពខុសៗគ្នាត្រូវបានអនុវត្ត
- [ ] មានការចូលប្រើម៉ូដែលតាមរយៈ API
- [ ] អាចហៅម៉ូដែលទាំងពីរពីកម្មវិធី

### ការហ្វឹកហាត់ 3៖ អនុវត្តការត្រួតពិនិត្យថ្លៃ (20 នាទី)
**គោលដៅ**៖ កំណត់ការជូនដំណឹងថវិកានិងតាមដានការចំណាយ

**ចំណុចចាប់ផ្តើម**៖ គំរូថវិកានៅលើ និងម៉ូឌុលហត្ថបញ្ជាផ្នែក resource-group។ បន្ថែមធនធាននេះដោយប្រើកម្មវិធីកែសម្រួល; ផ្ញើ `budgetStartDate` ពីការកំណត់ប៉ារ៉ាម៉ែត្រ (កុំផ្ទេរប៉ារ៉ាម៉ែត្រដដែលប្រសិនបើបានប្រកាសរួច)។ ជំនួសអ្នកទទួល និងផ្ទៀងផ្ទាត់ថាអ្នកមានសិទិ្ធសរសេរថវិកា។

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

ផ្លូវកន្សោម៖ ចម្លើយមាន `amount: 200`, គន្លងទាំងពីរ និងអ្នកទទួលរបស់អ្នក។ ពិនិត្យ Cost Management នៅក្នុងផតថលសម្រាប់ការចំណាយពិត; ទិន្នន័យចំណាយមានការពន្យារពេល ហើយការជូនដំណឹងមិនចាំបាច់ត្រូវដំណើរការនៅពេលហាត់ប្រាណខ្លី។

**តម្រូវការជោគជ័យ៖**
- [ ] បានបង្កើតការជូនដំណឹងថវិកាដែល Azure
- [ ] ការជូនដំណឹងអ៊ីមែលបានកំណត់រួច
- [ ] អាចមើលទិន្នន័យការចំណាយនៅ Azure Portal
- [ ] កំណត់គន្លងថវិកាឲ្យសមរម្យ

## 💡 សំណួរញឹកញាប់

<details>
<summary><strong>តើយ៉ាងដូចម្តេចខ្ញុំអាចកាត់បន្ថយថ្លៃ Microsoft Foundry Models ក្នុងระหว่างการអភិវឌ្ឍ?</strong></summary>

1. **ពិនិត្យតម្លៃ**៖ គ្មានការអនុញ្ញាតឥតគិតថ្លៃ 50,000 តូខិនក្នុងមួយខែសម្រាប់ម៉ូដែល Azure OpenAI ទេ
2. **កំណត់ទំហំសមរម្យ**៖ សមត្ថភាព `10` ជាធម្មតាចំណេញបាន់ 10,000 TPM សម្រាប់ម៉ូដែលអក្សរតែប៉ុណ្ណោះ មិនមែន 10 TPM ។ ការកាត់បន្ថយកម្រិតនេះមិនបន្ថយតម្លៃក្នុងមួយតូខិនទេ
3. **ប្រើ azd down**៖ លុបធនធានដែលអាចទុកចោលបាននៅពេលមិនកំពុងអភិវឌ្ឍ (នេះមិនមែនការបញ្ឈប់ជាបណ្តោះអាសន្ន)
4. **ផ្ទុកតម្លៃឡើងវិញ**៖ អនុវត្ត Redis cache សម្រាប់សំណួរដដែលកើតឡើងជាប់ៗគ្នា
5. **ប្រើបច្ចេកទេស Prompt Engineering**៖ កាត់បន្ថយការប្រើប្រាស់តូខិនជាមួយ prompt មានប្រសិទ្ធភាព

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>តើ Microsoft Foundry Models និង OpenAI API មានភាពខុសគ្នាយ៉ាងដូចម្តេច?</strong></summary>

**Microsoft Foundry Models**:
- សុវត្ថិភាពសហគ្រាស និងការអនុវត្តន៍តាមផ្លូវច្បាប់
- ការបញ្ចូលបណ្ដាញឯកជន
- ការធានា SLA
- ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណដោយគ្រប់គ្រង
- មានកម្រិតសមត្ថភាពខ្ពស់

**OpenAI API**៖ ជាអ្នកផ្គត់ផ្គង់/ API ផ្សេងដែលមានម៉ូដែល ផ្នែកថ្លៃកាត់ សុវត្ថភាព និងឧបករណ៍តភ្ជាប់សហគ្រាសផ្ទាល់ខ្លួន។ ប្រៀបធៀបភាពឧបត្ថម្ភបច្ចុប្បន្នជាងសន្និធិថាវាជាជំហានបណ្តាញសាធារណៈដល់តែម៉ូដែលមានជាប់នាពេលដំបូង។

ជ្រើសរើសដោយផ្អែកលើតម្រូវការអង្គការរបស់អ្នក; ឧទាហរណ៍ managed identity និង private-link របស់ Azure ក្នុងវគ្គនេះមានសម្រាប់សេវាកម្មរៀបចំដោយ Azure តែប៉ុណ្ណោះ មិនមែនរួមបញ្ចូលម៉ូដែលនិងអ្នកផ្គត់ផ្គង់ទាំងអស់នៅក្នុងបញ្ជី Foundry ទេ។
</details>

<details>
<summary><strong>តើខ្ញុំគួរធ្វើដូចម្តេចបើមានកំហុសកូតាច្រើនលើ Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>តើខ្ញុំអាចប្រើទិន្នន័យផ្ទាល់ខ្លួនជាមួយ Microsoft Foundry Models បានទេ?</strong></summary>

បាទ/ចាស! ប្រើ **Azure AI Search** សម្រាប់ RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

មើលទំរង់ [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)។
</details>

<details>
<summary><strong>តើខ្ញុំធ្វើដូចម្តេចដើម្បីធានាសុវត្ថិភាពចំណុចចូលម៉ូដែល AI?</strong></summary>

**អនុវត្តន៍ល្អបំផុត**៖
1. ប្រើ Managed Identity (គ្មានកូនសោ API)
2. បើក Private Endpoints
3. កំណត់ក្រុមសុវត្ថិភាពបណ្ដាញ
4. អនុវត្តការកំណត់អត្រា
5. ប្រើ Azure Key Vault សម្រាប់រឿងរជាប់សម្ងាត់

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## សហគមន៍ និងគាំទ្រ

- **Microsoft Foundry Discord**៖ [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**៖ [បញ្ហា និងការពិភាក្សា](https://github.com/Azure/azure-dev)
- **Microsoft Learn**៖ [ឯកសារផ្លូវការជាក់ស្តែង](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**៖ [ជំនាញ Microsoft Foundry នៅ skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ដំឡើងជំនាញ Azure + Foundry នៅកម្មវិធីកែសំរួលរបស់អ្នក ជាមួយ `npx skills add microsoft/github-copilot-for-azure`

---

**ការរុករកជំពូក៖**
- **📚 ទំព័រដើមវគ្គ**៖ [AZD For Beginners](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**៖ ជំពូក 2 - ការអភិវឌ្ឍ AI ជាដំបូង
- **⬅️ ជំពូកមុន**៖ [ជំពូក 1៖ គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**៖ [AI Agents](agents.md)
- **🚀 ជំពូកបន្ទាប់**៖ [ជំពូក 3៖ ការកំណត់តម្លៃ](../chapter-03-configuration/configuration.md)

**ត្រូវការជំនួយ?** ចូលរួមពិភាក្សាសហគមន៍ ឬបើកបញ្ហានៅក្នុងបណ្ណាល័យ។ សហគមន៍ Azure AI + AZD ស្ថិតនៅទីនេះដើម្បីជួយអ្នកនៅកន្លែងយ៉ាងជោគជ័យ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->