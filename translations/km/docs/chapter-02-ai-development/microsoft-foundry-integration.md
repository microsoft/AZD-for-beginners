# ការ​សម្របសម្រួល Microsoft Foundry ជាមួយ AZD

**ការរុករកជំពូក:**
- **📚 ទំព័រដើមវគ្គ**: [AZD For Beginners](../../README.md)
- **📖 ជំពូក បច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍដោយ AI ជាអាទិភាព
- **⬅️ ជំពូកមុន**: [ជំពូក 1: គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**: [ការបញ្ចូលម៉ូឌែល AI](ai-model-deployment.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

## ទិដ្ឋភាពទូទៅ

មគ្គុទេសក៍នេះបង្ហាញពីរបៀបសម្របសម្រួលសេវាកម្ម Microsoft Foundry ជាមួយ Azure Developer CLI (AZD) ដើម្បីធ្វើឲ្យការចែកចាយកម្មវិធី AI មានភាពរលូន។ Microsoft Foundry ផ្តល់ឲ្យឆន្ទៈវេទិកាសព្វវិភាគសម្រាប់ការបង្កើត ការ​ចែកចាយ និងការគ្រប់គ្រងកម្មវិធី AI ខណៈដែល AZD ធ្វើឲ្យដំណើរការ​ហេដ្ឋារចនាសម្ព័ន្ធ​និងការចែកចាយកាន់តែងាយស្រួល។

## Microsoft Foundry ជាអ្វី?

Microsoft Foundry គឺជាវេទិកាដ៏តែមួយរបស់ Microsoft សម្រាប់ការអភិវឌ្ឍ AI ដែលរួមមាន៖

- **បណ្ណាល័យម៉ូឌែល (Model Catalog)**: គ្រប់គ្រងការចូលប្រើម៉ូឌែល AI ទំនើប
- **Prompt Flow**: ឧបករណ៍រចនាដែលមើលឃើញសម្រាប់លំហាត់ការ AI
- **Microsoft Foundry Portal**: សេវាកម្មបរិយាកាសអភិវឌ្ឍន៍ដែលរួមបញ្ចូលសម្រាប់កម្មវិធី AI
- **ជម្រើសចែកចាយ (Deployment Options)**: ជម្រើសផ្ទុកនិងការលាស់ឡើងជាច្រើន
- **សុវត្ថិភាពនិងការពារ (Safety and Security)**: លក្ខណៈសមមូលនៃការទទួលខុសត្រូវ AI គ្រប់គ្រងក្នុងស្ថានភាព

## AZD + Microsoft Foundry៖ ធ្វើការរួមគ្នាយ៉ាងល្អ

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | ចែកចាយតាមផอร์តាល់​ដោយដៃ | ចែកចាយដោយស្វ័យប្រវត្តិ អាចធ្វើឡើងម្ដងហើយប្រើឡើងវិញ |
| **Infrastructure** | ការផ្ដល់ធនធានតាមការចុចតែម្តង | ហេដ្ឋារចនាសម្ព័ន្ធជា Code (Bicep) |
| **Environment Management** | ផ្ដោតលើបរិស្ថានតែមួយ | មុខងារពហុបរិស្ថាន (dev/staging/prod) |
| **CI/CD Integration** | មានកម្រិតកំណត់ | គាំទ្រដោយចម្អិន GitHub Actions ដើម |
| **Cost Management** | ការត្រួតពិនិត្យមូលដ្ឋាន | អុបទីម៉ាច្បាស់លាស់សម្រាប់ចំណាយតាមបរិយាកាស |

## តម្រូវការពីមុន

- សុពលភាពជាវ Azure ដែលមានសិទ្ធិសមរម្យ
- Azure Developer CLI បានតម្លើងរួច
- សមត្ថភាពចូលដំណើរការ Microsoft Foundry Models services
- ការស្គាល់មូលដ្ឋានពី Microsoft Foundry

> **មូលដ្ឋាន AZD បច្ចុប្បន្ន:** ឧទាហរណ៍ទាំងនេះត្រូវបានពិនិត្យប្រឆាំង `azd` `1.23.12`។ សម្រាប់ដំណើរការ AI agent សូមប្រើបញ្ចេញពេញមុខ preview extension ដែលទាន់សម័យ និងពិនិត្យកំណែដែលបានដំឡើងមុនពេលចាប់ផ្តើម។

## លំនាំសំខាន់សម្រាប់ការរួមបញ្ចូល

### លំនាំ 1: ការរួមបញ្ចូល Microsoft Foundry Models

**ករណីប្រើប្រាស់**: ចែកចាយកម្មវិធីជជែកជាមួយម៉ូឌែល Microsoft Foundry Models

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
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
    disableLocalAuth: false
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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### លំនាំ 2: AI Search + RAG Integration

**ករណីប្រើប្រាស់**: ចែកចាយកម្មវិធី RAG (retrieval-augmented generation)

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

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### លំនាំ 3: ការរួមបញ្ចូល Document Intelligence

**ករណីប្រើប្រាស់**: ដំណើរការប្រតិបត្ដិការនិងវិភាគឯកសារ

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

## 🔧 លំនាំកំណត់រចនាសម្ព័ន្ធ

### ការកំណត់អថេរបរិស្ថាន

**ការកំណត់សម្រាប់ការផលិត:**
```bash
# សេវាកម្ម AI មូលដ្ឋាន
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ការកំណត់រចនាសម្ព័ន្ធម៉ូដែល
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# ការកំណត់សមត្ថភាព
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ការកំណត់សម្រាប់ការអភិវឌ្ឍ:**
```bash
# ការកំណត់តម្រឹមចំណាយសម្រាប់ការអភិវឌ្ឍន៍
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # កម្រិតឥតគិតថ្លៃ
```

### ការកំណត់សុវត្ថិភាពជាមួយ Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
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

## ដំណើរការចែកចាយ

### ផ្នែកបន្ថែម AZD សម្រាប់ Foundry

AZD ផ្តល់ផ្នែកបន្ថែមដែលបន្ថែមសមត្ថភាពជាក់លាក់សម្រាប់ AI ដើម្បីប្រើប្រាស់សេវាកម្ម Microsoft Foundry៖

```bash
# ដំឡើងផ្នែកបន្ថែម Foundry agents
azd extension install azure.ai.agents

# ដំឡើងផ្នែកបន្ថែមសម្រាប់ fine-tuning
azd extension install azure.ai.finetune

# ដំឡើងផ្នែកបន្ថែមសម្រាប់ម៉ូឌែលផ្ទាល់ខ្លួន
azd extension install azure.ai.models

# បញ្ជីផ្នែកបន្ថែមដែលបានដំឡើង
azd extension list --installed

# ពិនិត្យកំណែបច្ចុប្បន្ននៃផ្នែកបន្ថែមភ្នាក់ងារដែលបានដំឡើង
azd extension show azure.ai.agents
```

ផ្នែកបន្ថែម AI ទាំងនេះនៅក្នុងដំណាក់កាល preview ដែលកំពុងអភិវឌ្ឍយ៉ាងលឿន។ ប្រសិនបើពាក្យបញ្ជាមួយមានឆន្ទៈខុសពីដែលបង្ហាញ នៅទៅមុខ សូមធ្វើការ​ធ្វើឱ្យផ្នែកបន្ថែមទាន់សម័យមុនពេលដោះស្រាយបញ្ហាពួកគម្រោង។

### ការចែកចាយផ្ដើមដោយ Agent ជាមួយ `azd ai`

បើអ្នកមាន agent manifest សូមប្រើ `azd ai agent init` ដើម្បីបង្កើតស៊េរីនៃគម្រោងដែលភ្ជាប់ទៅ Foundry Agent Service:

```bash
# ចាប់ផ្តើមពីឯកសារ manifest របស់ភ្នាក់ងារ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ដាក់ចេញទៅ Azure
azd up
```

កំណែ preview សម្គាល់នៃ `azure.ai.agents` បានបន្ថែមការគាំទ្រដល់ការចាប់ផ្តើមបុព្វបទដោយគំរូសម្រាប់ `azd ai agent init`។ ប្រសិនបើអ្នកកំពុងអនុវត្តឧទាហរណ៍ agent ថ្មីៗ សូមពិនិត្យជំនួយផ្នែកបន្ថែមសម្រាប់ប៉ារ៉ាម៉ែត្រ​ដែលមាន​ក្នុងកំណែដែលបានដំឡើង។

មើល [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) សម្រាប់បញ្ជីពាក្យបញ្ជា និងប៉ារ៉ាម៉ែត្រពេញលេញ។

### ការចែកចាយដោយពាក្យបញ្ជាដែមួយ

```bash
# ដាក់ចេញ​អ្វីគ្រប់យ៉ាង​ដោយ​ពាក្យបញ្ជា​មួយ
azd up

# ឬ​ដាក់ចេញ​យ៉ាង​ជំហានៗ
azd provision  # សម្រាប់​រចនាសម្ព័ន្ធ​តែ​ប៉ុណ្ណោះ
azd deploy     # សម្រាប់​កម្មវិធី​តែ​ប៉ុណ្ណោះ

# សម្រាប់​ការដាក់ចេញ​កម្មវិធី AI រយៈពេលវែង​ក្នុង azd 1.23.11+
azd deploy --timeout 1800
```

### ការចែកចាយតាមបរិយាកាសជាក់លាក់

```bash
# បរិស្ថានអភិវឌ្ឍន៍
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# បរិស្ថានផលិត
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ការត្រួតពិនិត្យ និងការអាចមើលឃើញ

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
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### ការត្រួតពិនិត្យចំណាយ

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## 🔐 អនុវត្តិល្អបំផុតសម្រាប់សុវត្ថិភាព

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

### យុទ្ធសាស្ត្រ Caching

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
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

### ការកំណត់ Auto-scaling

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

## ដោះស្រាយបញ្ហារួម

### បញ្ហា 1: កម្រិតកូត OpenAI លើស

**រាងអាការៈ:**
- ការចែកចាយបរាជ័យដោយកំហុសកម្រិត
- កំហុស 429 នៅក្នុងកត្ថត្រកម្មវិធី

**ដំណោះស្រាយ:**
```bash
# ពិនិត្យការប្រើប្រាស់កូតាបច្ចុប្បន្ន
az cognitiveservices usage list --location eastus

# សាកល្បងតំបន់ផ្សេងទៀត
azd env set AZURE_LOCATION westus2
azd up

# កាត់បន្ថយសមត្ថភាពបណ្តោះអាសន្ន
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### បញ្ហា 2: បញ្ហា​ចូលដំណើរការ(Authentication) ខុស

**រាងអាការៈ:**
- កំហុស 401/403 ពេលហៅសេវា AI
- សារបង្ហាញ "Access denied"

**ដំណោះស្រាយ:**
```bash
# ផ្ទៀងផ្ទាត់ការចាត់តាំងតួនាទី
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ពិនិត្យការកំណត់អត្តសញ្ញាណដែលគ្រប់គ្រង
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ផ្ទៀងផ្ទាត់ការចូលប្រើ Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### បញ្ហា 3: បញ្ហាការចែកចាយម៉ូឌែល

**រាងអាការៈ:**
- ម៉ូឌែលមិនមានសម្រាប់ចែកចាយ
- កំណែម៉ូឌែលជាក់លាក់បរាជ័យ

**ដំណោះស្រាយ:**
```bash
# រាយបញ្ជីម៉ូឌែលដែលមានតាមតំបន់
az cognitiveservices model list --location eastus

# ធ្វើបច្ចុប្បន្នភាពកំណែម៉ូឌែលនៅក្នុងទំព័រគំរូ bicep
# ពិនិត្យតម្រូវការសមត្ថភាពរបស់ម៉ូឌែល
```

## គំរូទំព័រ

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ពណ៌នា**: ឧទាហរណ៍ Azure AI ដែលពេញនិយមបំផុត — កម្មវិធីជជែក RAG ដែលអាចប្រើក្នុងបរិការណ៍ផលិតកម្ម ដើម្បីឲ្យអ្នកសួរព័ត៌មានពីឯកសាររបស់អ្នកឯង។ ប្រើ GPT-4.1-mini សម្រាប់ជជែក, text-embedding-3-large សម្រាប់ embeddings, និង Azure AI Search សម្រាប់ការទាញយក។ គាំទ្រចំពោះឯកសារម៉ុលទីមូដាល, ការបញ្ចូល/បញ្ចេញសំឡេង, ការផ្ទៀងផ្ទាត់ Microsoft Entra, និងការស្ដាប់ពត៌មានដោយ Application Insights។

**ចាប់ផ្តើមយ៉ាងឆាប់:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ពណ៌នា**: ក្បួន .NET/C# សម្រាប់ឧទាហរណ៍ RAG chat របស់ Python។ បង្កើតជាមួយ ASP.NET Core Minimal API និង frontend Blazor WebAssembly។ រួមមានការជជែកតាមសម្លេង, គាំទ្រ GPT-4o-mini vision, និងកម្មវិធីដៃគូ .NET MAUI Blazor Hybrid សម្រាប់ ডেস্কតុ/ទូរស័ព្ទ។

**ចាប់ផ្តើមយ៉ាងឆាប់:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ពណ៌នា**: ជាជម្លោះ Java នៃឧទាហរណ៍ RAG chat ដែលប្រើ Langchain4J សម្រាប់ការសម្របសម្រួល AI។ គាំទ្រឧត្តមកម្មសំណូមព្រាង microservice, វិធីសាស្ត្រស្វែងរកច្រើន (អក្សរ, វ៉ិចថ័រ, ការភ្លេប), ការដាក់ឯកសារជាមួយ Azure Document Intelligence, និងចែកចាយលើ Azure Container Apps ឬ Azure Kubernetes Service។

**ចាប់ផ្តើមយ៉ាងឆាប់:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ពណ៌នា**: កម្មវិធី RAG copilot សម្រាប់ត្រលប់ជួញដូរ ដែលប្រើ Microsoft Foundry និង Prompty។ chatbot របស់ Contoso Outdoor ដែលផ្តោតលើការទូលទានចម្លើយដោយយោងទៅលើកាតាឡុកផលិតផល និងទិន្នន័យការកម្មង់របស់អតិថិជន។ បង្ហាញដំណើរការ GenAIOps សរុប — សាកល្បងជាមួយ Prompty, ប៉ាន់ប្រមាណជាមួយកម្មវិធីជំនួយ AI, និងចែកចាយឆ្គាំឆ្គងតាម AZD ទៅ Container Apps។

**ចាប់ផ្តើមយ៉ាងឆាប់:**
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**ពណ៌នា**: ឧទាហរណ៍ multi-agent ដែលបង្ហាញពីការសម្របសម្រួល agent ជាមួយ Prompty។ ប្រើ research agent (Bing Grounding ក្នុង Azure AI Agent Service), product agent (Azure AI Search), writer agent, និង editor agent ដើម្បីសហការបង្កើតអត្ថបទដែលមានការស្រាវជ្រាវល្អ។ រួមមាន CI/CD និងការវាយតម្លៃក្នុង GitHub Actions។

**ចាប់ផ្តើមយ៉ាងឆាប់:**
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**ពណ៌នា**: RAG chatbot ដែលមិនមានម៉ាស៊ីនបម្រើជាផ្នែកផ្ទាល់ (fully serverless) ប្រើ LangChain.js ជាមួយ Azure Functions សម្រាប់ API និង Azure Static Web Apps សម្រាប់ផ្តល់សេវា។ ប្រើ Azure Cosmos DB ជាទាំងស្តុកវ៉ិចទ័រ និងមូលដ្ឋានទិន្នន័យប្រវត្តិជជែក។ គាំទ្រការអភិវឌ្ឍនៅក្នុងដំបូងជាមួយ Ollama សម្រាប់ធ្វើតេស្តដោយគ្មានចំណាយ។

**ចាប់ផ្តើមយ៉ាងឆាប់:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**ពណ៌នា**: ផ្នែកជំនួយដំណោះស្រាយ RAG សម្រាប់សកម្មភាពស្ថាបនាអាជីវកម្ម មានផ្នែកគ្រប់គ្រងឯកសារសម្រាប់ឡូដ/គ្រប់គ្រង, ជម្រើស orchestrator ច្រើន (Semantic Kernel, LangChain, Prompt Flow), ការបំលែងសំឡេងទៅអក្សរ, សមាសភាព Microsoft Teams, និងជម្រើសប្រើប្រាស់ PostgreSQL ឬ Cosmos DB ជា backend។ រចនាឡើងជាវិធានដើមដែលអាចកែប្រែសម្រាប់ករណីផលិតកម្មRAG។

**ចាប់ផ្តើមយ៉ាងឆាប់:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**ពណ៌នា**: កម្មវិធីយោងសម្រាប់ការសម្របសម្រួល agent ពហុកម្មវិធីដោយប្រើប្បញ្ញត្តិបី (LangChain.js, LlamaIndex.TS, និង Microsoft Agent Framework)। មាន MCP (Model Context Protocol) servers ពីបួនភាសា ដែលចែកចាយជាផ្នែក serverless នៅលើ Azure Container Apps ជាមួយការត្រួតពិនិត្យ OpenTelemetry។

**ចាប់ផ្តើមយ៉ាងឆាប់:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**ពណ៌នា**: គំរូ Bicep តូចៗដែលចែកចាយសេវាកម្ម Azure AI ជាមួយម៉ូឌែល machine learning បានកំណត់រួច។ ជាចំណុចចាប់ផ្តើមស្រាលសម្រាប់ពេលដែលអ្នកត្រូវការជូនដល់គឺហេដ្ឋារចនាសម្ព័ន្ធ Azure AI ដោយគ្មានស្ទុះសម្រាប់ស្តេចកម្មវិធីពេញលេញ។

**ចាប់ផ្តើមយ៉ាងឆាប់:**
```bash
azd init --template azd-ai-starter
azd up
```

> **រកមើលគំរូបន្ថែម**: เยี่ยមទស្សនា [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) សម្រាប់គំរូ AZD ជាក់លាក់សម្រាប់ AI ជាង 80+ ទៅតាមភាសានិងសេណារីយ៉ូ។

## ជំហានបន្ទាប់

1. **សាកល្បងឧទាហរណ៍**: ចាប់ផ្តើមជាមួយគំរូដែលបានបង្កើតមករួចដែលស្ថិតក្នុងករណីប្រើប្រាស់របស់អ្នក
2. **ប្តូរតាមតម្រូវការ**: កែប្រែហេដ្ឋារចនាសម្ព័ន្ធ និងកូដកម្មវិធី
3. **បន្ថែមការត្រួតពិនិត្យ**: អនុវត្តការមើលឃើញជាផ្នែកទូលំទូលាយ
4. **បង្កើនការអុបទីម៉ីសេនចំណាយ**: កែតម្រូវការកំណត់សម្រាប់ថវិកា​របស់អ្នក
5. **ធានាសុវត្ថិភាពការចែកចាយ**: អនុវត្តលំនាំសុវត្ថិភាពសម្រាប់សហគ្រាស
6. **ពង្រីកទៅផលិតកម្ម**: បន្ថែមតំបន់ច្រើន និងលក្ខណៈភាពខ្ពស់សម្រាប់មានភាពធន់ទ្រាំ

## 🎯 លំហាត់អនុវត្តដោយដៃ

### លំហាត់ 1: ចែកចាយកម្មវិធីជជែក Microsoft Foundry Models (30 នាទី)
**គោលដៅ**: ចែកចាយនិងសាកល្បងកម្មវិធីជជែក AI ដែលរួចជាស្រេចសម្រាប់ផលិតកម្ម

```bash
# ចាប់ផ្តើមគំរូ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# កំណត់អថេរបរិស្ថាន
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# បង្ហោះ
azd up

# សាកល្បងកម្មវិធី
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# តាមដានប្រតិបត្តិការ AI
azd monitor

# សម្អាត
azd down --force --purge
```

**លទ្ធផលជោគជ័យ:**
- [ ] ការចែកចាយបានសម្រេចដោយគ្មានកំហុសកម្រិត
- [ ] អាចចូលប្រើផ្ទាំងជជែកក្នុងកម្មវិធីរុករក
- [ ] អាចសួរបញ្ហានិងទទួលបានចម្លើយពី AI
- [ ] Application Insights បង្ហាញទិន្នន័យ telemetry
- [ ] បានសម្អាតធនធានដោយជោគជ័យ

**ថ្លៃសមាមាត្រ**: $5-10 សម្រាប់ 30 នាទីនៃការធ្វើតេស្ត

### លំហាត់ 2: កំណត់ចែកចាយម៉ូឌែលច្រើន (45 នាទី)
**គោលដៅ**: ចែកចាយម៉ូឌែល AI ច្រើនជាមួយកំណត់រចនាសម្ព័ន្ធផ្សេងៗ

```bash
# បង្កើតការកំណត់ Bicep ផ្ទាល់ខ្លួន
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
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
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# ដាក់ប្រើ និង ផ្ទៀងផ្ទាត់
azd provision
azd show
```

**លទ្ធផលជោគជ័យ:**
- [ ] ម៉ូឌែលច្រើនបានចែកចាយដោយជោគជ័យ
- [ ] ការកំណត់សមត្ថភាពខុសគ្នាត្រូវបានអនុវត្ត
- [ ] ម៉ូឌែលអាចចូលប្រើបានតាម API
- [ ] អាចហៅម៉ូឌែលទាំងពីរពីកម្មវិធីបាន

### លំហាត់ 3: អនុវត្តការត្រួតពិនិត្យចំណាយ (20 នាទី)
**គោលដៅ**: កំណត់ការជូនដំណឹងថវិកា និងតាមដានចំណាយ

```bash
# បន្ថែមការជូនដំណឹងអំពីថវិកាទៅកាន់ Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
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
EOF

# ដាក់ប្រើការជូនដំណឹងអំពីថវិកា
azd provision

# ពិនិត្យចំណាយបច្ចុប្បន្ន
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**លទ្ធផលជោគជ័យ:**
- [ ] បានបង្កើតការជូនដំណឹងថវិកានៅ Azure
- [ ] ការជូនដំណឹងអ៊ីម៉ែលបានកំណត់
- [ ] អាចមើលទិន្នន័យចំណាយនៅក្នុង Azure Portal
- [ ] កំណត់កម្រាមថវិកាឲ្យសមរម្យ

## 💡 សំណួរដែលសួរញឹកញាប់

<details>
<summary><strong>តើធ្វើដូចម្តេចដើម្បីកាត់បន្ថយចំណាយ Microsoft Foundry Models នៅពេលអភិវឌ្ឍ?</strong></summary>

1. **ប្រើ Free Tier**: Microsoft Foundry Models ផ្ដល់ 50,000 tokens/ខែឥតគិតថ្លៃ
2. **កាត់បន្ថយសមត្ថភាព**: កំណត់សមត្ថភាពទៅ 10 TPM ជំនួស 30+ សម្រាប់ការអភិវឌ្ឍ
3. **ប្រើ azd down**: លុបចេញធនធានពេលដែលមិនកំពុងអភិវឌ្ឍ
4. **រក្សាកាសេវចម្លើយ**: អនុវត្ត Redis cache សម្រាប់ការស្នើបញ្ចួនដែលធ្វើឡើងគ្នាប្រហែល
5. **ប្រើ Prompt Engineering**: កាត់បន្ថយការប្រើ tokens ដោយប្រើ prompt ដែលមានប្រសិទ្ធភាព

</details>
```bash
# ការកំណត់រចនាសម្ព័ន្ធសម្រាប់អភិវឌ្ឍន៍
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>ខុសគ្នាអ្វីទៅ​រវាង Microsoft Foundry Models និង OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- សុវត្ថិភាព និងការអនុលោមសម្រាប់ស្ថាប័ន
- រួមបញ្ចូលបណ្តាញឯកជន
- ការធានា SLA
- ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ (Managed Identity)
- មានកូត៉ាប្រើប្រាស់ខ្ពស់ជាង

**OpenAI API**:
- ចូលដំណើរការម៉ូដែលថ្មីបានឆាប់រហ័ស
- ការតម្លើងងាយស្រួលជាង
- ឧបសគ្គចូលរួមទាបជាង
- មានតែនៅលើអ៊ីនធឺរណេតសាធារណៈតែប៉ុណ្ណោះ

សម្រាប់កម្មវិធីផលិត, **យើងផ្តល់អនុសាសន៍ប្រើ Microsoft Foundry Models**។
</details>

<details>
<summary><strong>តើខ្ញុំដោះស្រាយកំហុស quota លើ Microsoft Foundry Models ដោយរបៀបណា?</strong></summary>

```bash
# ពិនិត្យកម្រិតកំណត់បច្ចុប្បន្ន
az cognitiveservices usage list --location eastus2

# សាកល្បងតំបន់ផ្សេងទៀត
azd env set AZURE_LOCATION westus2
azd up

# កាត់បន្ថយសមត្ថភាពជាបណ្តោះអាសន្ន
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ស្នើសុំបង្កើនកម្រិតកំណត់
# ចូលទៅកាន់ Azure Portal > កម្រិតកំណត់ > ស្នើសុំបង្កើន
```
</details>

<details>
<summary><strong>តើខ្ញុំអាចប្រើទិន្នន័យផ្ទាល់ខ្លួនជាមួយ Microsoft Foundry Models បានទេ?</strong></summary>

បាន! ប្រើ **Azure AI Search** សម្រាប់ RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

មើលទំរង់ [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)។
</details>

<details>
<summary><strong>តើធ្វើដូចម្តេចដើម្បីធានាសុវត្ថិភាពចុងបញ្ចប់ម៉ូឌែល AI?</strong></summary>

**វិធីសាស្រ្តដ៏ល្អបំផុត**:
1. ប្រើ Managed Identity (មិនប្រើកូនសោ API)
2. បើក Private Endpoints
3. កំណត់ក្រុមសុវត្ថិភាពបណ្តាញ
4. អនុវត្តការកំណត់អត្រា
5. ប្រើ Azure Key Vault សម្រាប់សម្ងាត់

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

## សហគមន៍ និងការគាំទ្រ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [បញ្ហា និងការពិភាក្សា](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ឯកសារផ្លូវការ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [ជំនាញ Microsoft Foundry នៅលើ skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ដំឡើងជំនាញ Azure + Foundry agent ក្នុងកម្មវិធីកែសម្រួលរបស់អ្នក ដោយប្រើ `npx skills add microsoft/github-copilot-for-azure`

---

**ការរុករកជំពូក:**
- **📚 ទំព័រមេវគ្គ**: [AZD For Beginners](../../README.md)
- **📖 ជំពូក​បច្ចុប្បន្ន**: ជំពូកទី 2 - ការអភិវឌ្ឍន៍ផ្តោតលើ AI
- **⬅️ ជំពូកមុន**: [ជំពូកទី 1: គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**: [ការដាក់ដំណើរការម៉ូឌែល AI](ai-model-deployment.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូកទី 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

**ត្រូវការជំនួយ?** ចូលរួមក្នុងការពិភាក្សារបស់សហគមន៍ ឬបើកបញ្ហា (issue) ក្នុងឃ្លាំងកូដ។ សហគមន៍ Azure AI + AZD ស្ថិតនៅទីនេះដើម្បីជួយឱ្យអ្នកទទួលបានជោគជ័យ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->