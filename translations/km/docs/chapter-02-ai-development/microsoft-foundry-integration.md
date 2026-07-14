# ការរួមបញ្ចូល Microsoft Foundry ជាមួយ AZD

**ការរុករកជាពិសេសវគ្គ៖**
- **📚 ទំព័រមុខវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍ AI ជាចម្បង
- **⬅️ ជំពូកមុន**: [ជំពូក 1: គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**: [ការដាក់បញ្ចូលគំរូ AI](ai-model-deployment.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនា](../chapter-03-configuration/configuration.md)

## ទិដ្ឋភាពទូទៅ

មគ្គុទ្ទេសក៍នេះបង្ហាញពីរបៀបរួមបញ្ចូលសេវាកម្ម Microsoft Foundry ជាមួយ Azure Developer CLI (AZD) សម្រាប់ការដាក់បញ្ចូលកម្មវិធី AI មានភាពងាយស្រួល។ Microsoft Foundry ផ្តល់នូវវេទិកាគ្របដណ្តប់សម្រាប់ការសាងសង់, ដាក់បញ្ចូល និងគ្រប់គ្រងកម្មវិធី AI ខណៈពេល AZD ធ្វើឲ្យដំណាក់កាលគ្រប់គ្រងម៉ាស៊ីនមេ និងដាក់បញ្ចូលកាន់តែងាយស្រួល។

## Microsoft Foundry គឺជាអ្វី?

Microsoft Foundry គឺជាវេទិកាភ្ជាប់រួមរបស់ Microsoft សម្រាប់ការអភិវឌ្ឍ AI ដែលរួមមាន៖

- **កាតាឡុកគំរូ**: ចូលដំណើរការគំរូ AI ដែលទំនើបបំផុត
- **Prompt Flow**: អ្នករចនាមូលដ្ឋានសម្រាប់ដំណើរការឧបករណ៍ AI
- **Microsoft Foundry Portal**: បរិយាកាសអភិវឌ្ឍបញ្ចូលសម្រាប់កម្មវិធី AI
- **ជម្រើសការដាក់បញ្ចូល**: ជម្រើសផ្ទុក និងពង្រីកជាច្រើន
- **សុវត្ថិភាព និងការពារ**: លក្ខណៈ AI មានការទទួលខុសត្រូវ បញ្ចូលជាមួយ

## AZD + Microsoft Foundry: រួមគ្នាល្អជាង

| លក្ខណៈពិសេស | Microsoft Foundry | ផលប្រយោជន៍រួមបញ្ចូល AZD |
|---------|-----------------|------------------------|
| **ការដាក់បញ្ចូលគំរូ** | ដាក់បញ្ចូលដោយដៃ តាមផ្លូវច្រក | ដាក់បញ្ចូលដោយស្វ័យប្រវត្តិ, អាចធ្វើឡើងជាថ្មី |
| **ហេដ្ឋារចនាសម្ព័ន្ធ** | ការផ្តល់ជូនតាមចុច | ហេដ្ឋារចនាសម្ព័ន្តជា Code (Bicep) |
| **ការគ្រប់គ្រងបរិយាកាស** | ផ្តោតលើបរិយាកាសតែមួយ | បរិយាកាសច្រើន (dev/staging/prod) |
| **រួមបញ្ចូល CI/CD** | កំណត់កម្រិត | គាំទ្រជាដើម GitHub Actions |
| **ការគ្រប់គ្រងថ្លៃបង់** | តាមដានមូលដ្ឋាន | ការបង្វិលថ្លៃបង់តាមបរិយាកាស |

## លក្ខខណ្ឌជាមុន

- មាន Azure subscription ជាមួយសិទ្ធិគ្រប់គ្រាន់
- តំឡើង Azure Developer CLI
- ចូលដំណើរការសេវាកម្ម Microsoft Foundry Models
- មានការយល់ដឹងមូលដ្ឋានពី Microsoft Foundry

> **មូលដ្ឋាន AZD បច្ចុប្បន្ន:** ឧទាហរណ៍ទាំងនេះបានពិនិត្យជាមួយ `azd` `1.27.1`។ សម្រាប់ដំណើរការឧបករណ៍ AI គេប្រើការចេញផ្សាយមុនបច្ចុប្បន្ន ហើយពិនិត្យកំណែដែលបានដំឡើងមុនចាប់ផ្តើម។

## លំនាំរួមបញ្ចូលសំខាន់ៗ

### លំនាំ 1: រួមបញ្ចូល Microsoft Foundry Models

**ករណីប្រើប្រាស់**: ដាក់បញ្ចូលកម្មវិធីជជែកជាមួយគំរូ Microsoft Foundry Models

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

### លំនាំ 2: រួមបញ្ចូល AI ស្វែងរក + RAG

**ករណីប្រើប្រាស់**: ដាក់បញ្ចូលកម្មវិធីផ្សំប្រមូលទិន្នន័យ (RAG)

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

### លំនាំ 3: រួមបញ្ចូលភាពឆ្លាតវៃឯកសារ

**ករណីប្រើប្រាស់**: ដំណើរការ និងវិភាគឯកសារ

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

## 🔧 លំនាំកំណត់រចនា

### ការកំណត់បរិយាកាសប៉ារ៉ាម៉ែត្រ

**កំណត់រចនាសម្រាប់ផលិតកម្ម:**
```bash
# សេវាកម្ម AI មូលដ្ឋាន
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ការកំណត់រចនាសម្ព័ន្ធម៉ូដែល
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# ការកំណត់ប្រសិទ្ធភាព
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**កំណត់រចនាសម្រាប់ការអភិវឌ្ឍ:**
```bash
# ការកំណត់ដែលមានតម្លៃសមរម្យសម្រាប់ការអភិវឌ្ឍន៍
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # កម្រិតឥតគិតថ្លៃ
```

### កំណត់សុវត្ថិភាពជាមួយ Key Vault

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

## ដំណើរការដាក់បញ្ចូល

### ការបន្ថែម AZD សម្រាប់ Foundry

AZD ផ្តល់ជាការបន្ថែមដែលបន្ថែមសមត្ថភាព AI ជាពិសេសសម្រាប់ធ្វើការ​ជាមួយសេវាកម្ម Microsoft Foundry:

```bash
# ដំឡើងផ្នែកបន្ថែមភ្នាក់ងារទីតាំង
azd extension install azure.ai.agents

# ដំឡើងផ្នែកបន្ថែមកំណត់តម្លៃល្អ
azd extension install azure.ai.finetune

# ដំឡើងផ្នែកបន្ថែមម៉ូដែលប្តូរតាមបំណង
azd extension install azure.ai.models

# បញ្ជីផ្នែកបន្ថែមដែលបានដំឡើង
azd extension list --installed

# ពិនិត្យកំណែផ្នែកបន្ថែមភ្នាក់ងារដែលបានដំឡើងបច្ចុប្បន្ន
azd extension show azure.ai.agents
```

ការបន្ថែម AI នៅឡើយតែមានការផ្លាស់ប្តូរយ៉ាងឆាប់រហ័សនៅក្នុងជំហានមើលមុន។ ប្រសិនបើពាក្យបញ្ជា​មានលក្ខណៈខុសប្លែកពីការបង្ហាញទីនេះ សូមធ្វើការអាប់ដេតការបន្ថែមពាក់ព័ន្ធមុនធ្វើបញ្ហានៅគម្រោង។

### ដាក់បញ្ចូលគម្រោងដោយផ្អែកលើតំណាង `azd ai`

ប្រសិនបើអ្នកមាន ម៉ាណីហ្វេស្ទ តំណាង អ្នកប្រើ `azd ai agent init` ដើម្បីបង្កើតគម្រោងដែលភ្ជាប់ជាមួយសេវា Foundry Agent:

```bash
# ចាប់ផ្តើមពីពិពណ៌នារបស់ភ្នាក់ងារ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ផ្ទុកទៅ Azure
azd up
```

ការចេញផ្សាយមុនថ្មីនៃ `azure.ai.agents` ក៏បានបន្ថែមការគាំទ្រការចាប់ផ្តើមបែបគំរូសម្រាប់ `azd ai agent init` ផងដែរ។ ប្រសិនបើអ្នកគោរពតាមឧទាហរណ៍តំណាងថ្មីៗ សូមពិនិត្យជំនួយនៃការបន្ថែមសម្រាប់ទង់ភ្លើងបញ្ជាក់ក្នុងកំណែដែលបានដំឡើង។

មើល [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) សម្រាប់យោងពាក្យបញ្ជារួម និងទង់ភ្លើង។

### ការដាក់បញ្ចូលតែមួយបញ្ជា

```bash
# ផ្ទុកអនុវត្តរបស់អ្នកទាំងអស់ជាមួយពាក្យបញ្ជាមួយ
azd up

# ឬផ្ទុកអនុវត្តជាជំហួបទាំងឡាយ
azd provision  # មានតែហេដ្ឋារចនាសម្ព័ន្ធប៉ុណ្ណោះ
azd deploy     # មានតែកម្មវិធីប៉ុណ្ណោះ

# សម្រាប់ការផ្ទុកអនុវត្តកម្មវិធី AI រយៈពេលវែងនៅក្នុង azd 1.23.11+
azd deploy --timeout 1800
```

### ការដាក់បញ្ចូលតាមបរិយាកាសជាក់លាក់

```bash
# បរិយាកាសអភិវឌ្ឍន៍
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# បរិយាកាសផលិតកម្ម
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ការត្រួតពិនិត្យ និងចងក្រងបរិយាកាស

### រួមបញ្ចូល Application Insights

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

### ការត្រួតពិនិត្យថ្លៃបង់

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

## 🔐 ហេតុការណ៍សុវត្ថិភាពល្អបំផុត

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

### សុវត្ថិភាពបណ្ដាញ

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

## ការបង្កើតប្រសិទ្ធភាព

### យុទ្ធសាស្រ្ត Caching

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

## ការដោះស្រាយបញ្ហាធម្មតា

### បញ្ហា 1: ការចេញពី Quota OpenAI

**រោគសញ្ញា:**
- ការដាក់បញ្ចូលបរាជ័យដោយកំហុស quota
- កំហុស 429 ក្នុងកំណត់ហេតុកម្មវិធី

**ដំណោះស្រាយ:**
```bash
# ពិនិត្យការប្រើប្រាស់គណនីបច្ចុប្បន្ន
az cognitiveservices usage list --location eastus

# ព្យាយាមតំបន់ផ្សេងទៀត
azd env set AZURE_LOCATION westus2
azd up

# កាត់បន្ថយសមត្ថភាពជាបណ្តោះអាសន្ន
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### បញ្ហា 2: ការបរាជ័យ Authentication

**រោគសញ្ញា:**
- កំហុស 401/403 ពេលហៅសេវា AI
- សារជាភាសា "Access denied"

**ដំណោះស្រាយ:**
```bash
# ពិនិត្យការចាត់តាំងតួនាទី
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ពិនិត្យការកំណត់អត្តសញ្ញាណដែលគ្រប់គ្រង
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ផ្ទៀងផ្ទាត់ការចូលប្រើកញ្ចក់កូដ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### បញ្ហា 3: បញ្ហាក្នុងការដាក់បញ្ចូលគំរូ

**រោគសញ្ញា:**
- គំរូមិនមាននៅក្នុងការដាក់បញ្ចូល
- កំណែគំរូជាក់លាក់បរាជ័យ

**ដំណោះស្រាយ:**
```bash
# បញ្ជីម៉ូដែលដែលមានស្រាប់តាមតំបន់
az cognitiveservices model list --location eastus

# បន្ទាន់សម័យកំណែម៉ូដែលនៅក្នុងគំរូ bicep
# ពិនិត្យបញ្ជាក់តម្រូវការរបស់កម្លាំងម៉ូដែល
```

## គំរូទម្រង់

### កម្មវិធីជជែក RAG (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ពិពណ៌នា**: គំរូ Azure AI ដែលពេញនិយមបំផុត — កម្មវិធីជជែក RAG ដែលមានស្រាប់សម្រាប់ផលិតកម្ម ដែលអនុញ្ញាតឲ្យអ្នកសួរប្រសិនបើលើឯកសារផ្ទាល់ខ្លួនអ្នក។ ប្រើ GPT-4.1-mini សម្រាប់ជជែក, text-embedding-3-large សម្រាប់ embeddings, និង Azure AI Search សម្រាប់ការស្វែងរក។ គាំទ្រឯកសារមូលដ្ឋានចម្រុះ, បញ្ចូលសំឡេង/ទទួលសំឡេង, ការផ្ទៀងផ្ទាត់ Microsoft Entra, និងការតាមដាន Application Insights។

**ការចាប់ផ្តើមរហ័ស**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### កម្មវិធីជជែក RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ពិពណ៌នា**: វាច្រើនមានសមត្ថភាពដូចគ្នារវាង .NET/C# និងនៃគំរូ Python RAG chat។ ត្រូវបានសាងសង់ជាមួយ ASP.NET Core Minimal API និង Blazor WebAssembly សម្រាប់ផ្ទៃមុខ។ រួមបញ្ចូលជជែកដោយសំឡេង, គាំទ្រពី GPT-4o-mini vision, និងកម្មវិធីដៃគូ .NET MAUI Blazor Hybrid សម្រាប់កុំព្យូទ័រផ្ទាល់ខ្លួន/ទូរស័ព្ទចល័ត។

**ការចាប់ផ្តើមរហ័ស**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### កម្មវិធីជជែក RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ពិពណ៌នា**: កំណែ Java នៃគំរូជជែក RAG ប្រើ Langchain4J សម្រាប់ការគ្រប់គ្រង AI។ គាំទ្រចំណុចសេវាកម្មធ្វើមុខតំណែងព្រឹត្តិការណ៍, យុទ្ធសាស្ត្រស្វែងរកច្រើន (អក្សរ, វ៉ិចទ័រ, លាយបញ្ចូល), ផ្ទុកឯកសារដោយ Azure Document Intelligence, និងដាក់បញ្ចូលលើ Azure Container Apps ឬ Azure Kubernetes Service។

**ការចាប់ផ្តើមរហ័ស**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### អ្នកជំនួយលក់រាយសហគ្រាសជាមួយ Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**សេវាកម្ម**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ពិពណ៌នា**: Copilot លក់រាយ RAG ទាំងអស់ដោយ Microsoft Foundry និង Prompty។ ពិធីការជជែក Contoso Outdoor ដែលផ្អែកលើទិន្នន័យបញ្ជីផលិតផល និងបញ្ជាទិញរបស់អតិថិជន។ បង្ហាញលំហូរងារជាច្រើន GenAIOps — សាកល្បងជាមួយ Prompty, វាយតម្លៃជាមួយអ្នកវាយតម្លៃជួយ AI, និងដាក់បញ្ចូលតាម AZD ទៅ Container Apps។

**ការចាប់ផ្តើមរហ័ស**:
```bash
azd init --template contoso-chat
azd up
```

### កម្មវិធី Multi-Agent សម្រាប់សរសេរច្នៃប្រឌិត

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**សេវាកម្ម**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**ពិពណ៌នា**: គំរូ multi-agent បង្ហាញការគ្រប់គ្រងអ្នកតំណាង AI ជាមួយ Prompty។ ប្រើគំនិតអ្នកស្រាវជ្រាវ (Bing Grounding នៅ Azure AI Agent Service), អ្នកផលិតផល (Azure AI Search), អ្នកនិពន្ធ, និងអ្នកសរាយអត្ថបទ ដើម្បីបង្កើតអត្ថបទដែលបានស្រាវជ្រាវយ៉ាងល្អ។ រួមមាន CI/CD ជាមួយការវាយតម្លៃនៅ GitHub Actions។

**ការចាប់ផ្តើមរហ័ស**:
```bash
azd init --template contoso-creative-writer
azd up
```

### ជជែក RAG លើបណ្តាញដោយគ្មានម៉ាស៊ីនបម្រើ (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**សេវាកម្ម**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB សម្រាប់ NoSQL + LangChain.js

**ពិពណ៌នា**: ជជែកបឋម RAG ដោយគ្មានម៉ាស៊ីនបម្រើ ប្រើ LangChain.js ជាមួយ Azure Functions សម្រាប់ API និង Azure Static Web Apps សម្រាប់ផ្ទះបាយ។ ប្រើ Azure Cosmos DB ទាំងជាទ្រព្យសម្បត្តិវ៉ិចទ័រ និងដាតាបេសបង្ហាញជជែក។ គាំទ្រការអភិវឌ្ឍក្នុងតំបន់ជាមួយ Ollama សម្រាប់ការធ្វើតេស្តដោយឥតគិតថ្លៃ។

**ការចាប់ផ្តើមរហ័ស**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### អ្នកជំនួយជជែកជាមួយទិន្នន័យរបស់អ្នក Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**សេវាកម្ម**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**ពិពណ៌នា**: អ្នកជំនួយ RAG ដែលមានគម្រោងសម្រាប់សហគ្រាស ជាមួយទំព័រការគ្រប់គ្រងឯកសារ ដំណើរការជល់ជ្រៅជាមួយអ្នកគ្រប់គ្រងជាច្រើន (Semantic Kernel, LangChain, Prompt Flow), សំឡេងទៅអក្សរ, រួមបញ្ចូល Microsoft Teams, និងជម្រើសរើស PostgreSQL ឬ Cosmos DB ជាផ្នែកខ្នង។ រចនាឡើងជា ចាប់ផ្តើមតាមបំណងសម្រាប់សេណារីយ៉ូ RAG ផលិតកម្ម។

**ការចាប់ផ្តើមរហ័ស**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### អ្នកជំនួយដំណើរកម្សាន្ត AI — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**សេវាកម្ម**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**ពិពណ៌នា**: កម្មវិធីយោងសម្រាប់ការចងក្រង AI multi-agent ប្រើប៊្រ៊េមវើកពីរបី (LangChain.js, LlamaIndex.TS, និង Microsoft Agent Framework)។ មានមូលដ្ឋាន MCP (Model Context Protocol) ចំនួនបួនភាសា ដាក់បញ្ចូលជាមួយ Azure Container Apps serverless និងតាមដាន OpenTelemetry។

**ការចាប់ផ្តើមរហ័ស**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**សេវាកម្ម**: Azure AI Services + Azure OpenAI

**ពិពណ៌នា**: គំរូ Bicep តិចតួចដែលដាក់បញ្ចូលសេវាកម្ម Azure AI ដោយមានម៉ូឌែលម្សៅម៉ាស៊ីនដែលបានកំណត់។ ជាចំណុចចាប់ផ្តើមដែលមានទំងន់ស្រាល នៅពេលអ្នកត្រូវការចេញផ្សាយហេដ្ឋារចនាសម្ព័ន្ធ Azure AI ដោយគ្មានសំណុំកម្មវិធីពេញលេញ។

**ការចាប់ផ្តើមរហ័ស**:
```bash
azd init --template azd-ai-starter
azd up
```

> **សូមមើលគំរូបន្ថែម**: ចូលទៅកាន់ [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) សម្រាប់គំរូ AZD អាគុយ AI ជាង ៨០ ក្នុងភាសានិងសេណារីយ៉ូផ្សេងៗ។

## ជំហានបន្ទាប់

1. **សាកល្បងឧទាហរណ៍**: ចាប់ផ្តើមជាមួយគំរូដែលឆ្លើយតបនឹងករណីប្រើប្រាស់របស់អ្នក
2. **ប្ដូរតាមតម្រូវការ**: ប្ដូររៀបចំហេដ្ឋារចនាសម្ព័ន្ធ និងកូដកម្មវិធី
3. **បន្ថែមការត្រួតពិនិត្យ**: អនុវត្តមេធ្វើការយល់ដឹងជាចំបង់
4. **បង្កើនប្រសិទ្ធភាពថ្លៃ**: បង្វិលបង្កើតសម្រាប់ថវិកាមួយ
5. **ការពារការដាក់បញ្ចូលរបស់អ្នក**: អនុវត្តលំនាំសុវត្ថិភាពកម្រិតសហគ្រាស
6. **ពង្រីកទៅផលិតកម្ម**: បន្ថែមលក្ខណៈពហុតំបន់ និងការថែរក្សាឡើងវិញខ្ពស់

## 🎯 ស្ទាត់ជំហ៊ាន

### ស្ទាត់ជំហ៊ាន 1: ដាក់បញ្ចូលកម្មវិធីជជែក Microsoft Foundry Models (30 នាទី)
**គោលបំណង**: ដាក់បញ្ចូល និងសាកល្បងកម្មវិធីជជែក AI រួចរាល់សម្រាប់ផលិតកម្ម

```bash
# ចាប់ផ្តើមពណ៌នាគំរូ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# កំណត់អថេរពិភពគ្រប់គ្រង
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ផ្ទុះផ្សាយ
azd up

# សាកល្បងកម្មវិធី
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ត្រួតពិនិត្យប្រតិបត្តិការចំណេះដឹងប្រព័ន្ធ
azd monitor

# សម្អាត
azd down --force --purge
```

**លទ្ធផលជោគជ័យ:**
- [ ] ដំណើរការដាក់បញ្ចូលបញ្ចប់ដោយគ្មានកំហុស quota
- [ ] អាចចូលប្រើអន្តរប្រព័ន្ធជជែកនៅក្នុងកម្មវិធីរុករក
- [ ] អាចសួរពីម៉ាស៊ីន និងទទួលបានចម្លើយដោយ AI
- [ ] Application Insights បង្ហាញទិន្នន័យតេឡេមែត្រី
- [ ] បានសំអាតធនធានជោគជ័យ

**ថ្លៃប្រហាញអនុរស័យ**: $5-10 សម្រាប់ការសាកល្បង 30 នាទី

### ស្ទាត់ជំហ៊ាន 2: កំណត់រចនារួមគំរូច្រើន (45 នាទី)
**គោលបំណង**: ដាក់បញ្ចូលគំរូ AI ច្រើនជាមួយការកំណត់ខុសៗគ្នា

```bash
# បង្កើតការកំណត់រចនាសម្ព័ន្ធ Bicep ផ្ទាល់ខ្លួន
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

# ចាក់បញ្ចេញ និង ធ្វើការត្រួតពិនិត្យ
azd provision
azd show
```

**លទ្ធផលជោគជ័យ:**
- [ ] គំរូច្រើនដាក់បញ្ចូលបានជោគជ័យ
- [ ] ការកំណត់សមត្ថភាពខុសគ្នាត្រូវបានអនុវត្ត
- [ ] គំរូអាចចូលប្រើបានតាម API
- [ ] អាចហៅគំរូទាំងពីរពីកម្មវិធី

### ស្ទាត់ជំហ៊ាន 3: អនុវត្តការត្រួតពិនិត្យថ្លៃ (20 នាទី)
**គោលបំណង**: បង្កើតសញ្ញាថ្លៃ និងត្រួតពិនិត្យការចំណាយ

```bash
# បន្ថែមការជូនដំណឹងថវិកា​ទៅ Bicep
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

# បញ្ចDeployា​ការ​ជូន​ដំណឹង​ថវិកា
azd provision

# ពិនិត្យ​តម្លៃ​បច្ចុប្បន្ន
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**លទ្ធផលជោគជ័យ:**
- [ ] បង្កើតសញ្ញាថ្លៃនៅក្នុង Azure
- [ ] កំណត់ការជូនដំណឹងតាមអ៊ីមែល
- [ ] អាចមើលទិន្នន័យថ្លៃនៅក្នុង Azure Portal
- [ ] ពង្រីកកម្រិតថ្លៃត្រឹមត្រូវ

## 💡 សំណួរញឹកញាប់

<details>
<summary><strong>តើធ្វើដូចម្តេចដើម្បីកាត់បន្ថយថ្លៃ Microsoft Foundry Models នៅពេលអភិវឌ្ឍ?</strong></summary>

1. **ប្រើជួរឥតគិតថ្លៃ**: Microsoft Foundry Models ផ្ដល់ 50,000 tokens/ខែ ដោយឥតគិតថ្លៃ
2. **កាត់បន្ថយសមត្ថភាព**: កំណត់សមត្ថភាពទៅ 10 TPM ជំនួស 30+ សម្រាប់ dev
3. **ប្រើ azd down**: ចេញពីធនធាននៅពេលមិនកំពុងអភិវឌ្ឍយ៉ាង نشطة
4. **ថត Cache ប្រតិកម្ម**: អនុវត្ត redis cache សម្រាប់សំណួរដដែល
5. **ប្រើបច្ចេកទេស Prompt Engineering**: កាត់បន្ថយការប្រើប្រាស់ token ជាមួយ prompt មានប្រសិទ្ធភាព


```bash
# ការកំណត់រចនាសម្ព័ន្ធការអភិវឌ្ឍន៍
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>អ្វីជាភាពខុសគ្នារវាងម៉ូដែល Microsoft Foundry Models និង OpenAI API?</strong></summary>

**ម៉ូឌែល Microsoft Foundry Models**:
- សន្តិសុខសហគ្រាស និងការអនុលោម
- ការបញ្ចូលបណ្ដាញឯកជន
- ការធានា SLA
- ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណគ្រប់គ្រង
- កំណត់គុណភាពខ្ពស់ជាងនេះទៀតអាចប្រើបាន

**OpenAI API**:
- ការចូលដំណើរការទាន់ចិត្តទៅម៉ូឌែលថ្មីៗ
- ការតំឡើងងាយស្រួល
- ជំហរចុះក្រោមសម្រាប់ការចូលដំណើរការ
- មានតែអ៊ីនធរណែតសាធារណៈប៉ុណ្ណោះ

សម្រាប់កម្មវិធីផលិតកម្ម, **Microsoft Foundry Models ត្រូវបានផ្តល់អនុសាសន៍**។
</details>

<details>
<summary><strong>តើធ្វើដូចម្តេចដើម្បីដោះសោរបញ្ហាការប្រាក់ Microsoft Foundry Models quota exceeded?</strong></summary>

```bash
# ពិនិត្យមើលក្វាដ្រា​បច្ចុប្បន្ន
az cognitiveservices usage list --location eastus2

# សាកល្បងតំបន់ផ្សេងទៀត
azd env set AZURE_LOCATION westus2
azd up

# បន្ថយសមត្ថភាពជាបណ្តោះអាសន្ន
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ស្នើសុំបន្ថែមក្វាដ្រា
# ចូលទៅកាន់វេទិកា Azure > ក្វាដ្រា > ស្នើសុំបន្ថែម
```
</details>

<details>
<summary><strong>តើខ្ញុំអាចប្រើទិន្នន័យផ្ទាល់ខ្លួនជាមួយ Microsoft Foundry Models បានទេ?</strong></summary>

បាទ! ប្រើ **Azure AI Search** សម្រាប់ RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

មើលគំរូ [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)។
</details>

<details>
<summary><strong>តើធ្វើដូចម្តេចដើម្បីសុវត្ថិភាពច្រក AI model endpoints?</strong></summary>

**ការអនុវត្តប្រសើរៗ**:
1. ប្រើ Managed Identity (គ្មានកូនសោ API)
2. បើក Private Endpoints
3. កំណត់ក្រុមសន្តិសុខបណ្តាញ
4. អនុវត្តការតម្រងអត្រា (rate limiting)
5. ប្រើ Azure Key Vault សម្រាប់សារ ර។

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
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ឯកសារផ្លូវការជាផ្លូវការ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [ជំនាញ Microsoft Foundry នៅលើ skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ដំឡើងជំនាញអេជន Azure + Foundry នៅក្នុងកម្មវិធីកែសម្រួលរបស់អ្នកជាមួយ `npx skills add microsoft/github-copilot-for-azure`

---

**ការរុករកជំពូក**:
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍន៍ AI-First
- **⬅️ ជំពូកមុន**: [ជំពូក 1: គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**: [ការដាក់តំឡើងម៉ូឌែល AI](ai-model-deployment.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនា](../chapter-03-configuration/configuration.md)

**ត្រូវការជំនួយ?** ចូលរួមការពិភាក្សាសហគមន៍ ឬបើកបញ្ហានៅក្នុងផ្ទាំងទិន្នន័យ។ សហគមន៍ Azure AI + AZD ស្ថិតនៅទីនេះដើម្បីជួយអ្នកឲ្យជាប់ជោគជ័យ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->