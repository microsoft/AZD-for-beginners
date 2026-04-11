# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

មគ្គុទេសក៍នេះបង្ហាញពីវិធីសាស្រ្តរួមបញ្ចូលសេវាកម្ម Microsoft Foundry ជាមួយ Azure Developer CLI (AZD) សម្រាប់ការដាក់បញ្ចូលកម្មវិធី AI យ៉ាងរលូន។ Microsoft Foundry ផ្ដល់ឱ្យនូវវេទិកាគ្រប់គ្រងសម្រាប់សង់ បញ្ចូល និងគ្រប់គ្រងកម្មវិធី AI ខណៈដែល AZD ធ្វើឲ្យដំណើរការរចនាសម្ព័ន្ធ និងការដាក់បញ្ចូលក្លាយរលូន។

## What is Microsoft Foundry?

Microsoft Foundry គឺជាវេទិកាមួយរួមបញ្ចូលរបស់ Microsoft សម្រាប់ការអភិវឌ្ឍ AI ដែលរួមបញ្ចូល៖

- **Model Catalog**: ចូលប្រើគំរូ AI ដំណើរការថ្មីៗ
- **Prompt Flow**: គំរូរចនាវិចិត្រសម្រាប់ផ្លូវការងារសម្រាប់ AI
- **Microsoft Foundry Portal**: បរិស្ថានអភិវឌ្ឍន៍រួមសម្រាប់កម្មវិធី AI
- **Deployment Options**: ជម្រើសបម្រុងទុក និងកម្រិតដំណើរការ ភាពពេញមួយ
- **Safety and Security**: លក្ខណៈ AI ទទួលខុសត្រូវបង្កើតរួច

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | ការដាក់បញ្ចូលតាមផ្តុំបណ្តាញដៃ | ការដាក់បញ្ចូលដោយស្វ័យប្រវត្តិ និងអាចធ្វើឡើងម្តងទៀតបាន |
| **Infrastructure** | ការផ្ដល់ជូនតាមការចុចតែម្ដង | វិស្វកម្មជា Code (Bicep) |
| **Environment Management** | ផ្តោតទៅលើបរិយាកាសតែមួយ | ច្រើនបរិយាកាស (dev/staging/prod) |
| **CI/CD Integration** | មានកំណត់ | គាំទ្រប្រព័ន្ធ GitHub Actions ដើម |
| **Cost Management** | ត្រួតពិនិត្យមូលដ្ឋាន | អត្រាចំណាយទៅតាមបរិយាកាសជាក់លាក់ |

## Prerequisites

- មិនចាំបាច់មានការជាវ Azure ដែលមានសិទ្ធិគ្រប់គ្រងគ្រប់គ្រាន់
- ចូលដំណើរការជាមួយ Azure Developer CLI ត្រូវបានដំឡើង
- ចូលប្រើសេវាកម្ម Microsoft Foundry Models
- មានការបទពិសោធន៍មូលដ្ឋានជាមួយ Microsoft Foundry

> **កំណត់បន្ទាត់សំខាន់ AZD បច្ចុប្បន្ន:** ឧទាហរណ៍ទាំងនេះបានពិនិត្យពី `azd` `1.23.12`។ សម្រាប់ដំណើរការភ្នាក់ងារ AI សូមប្រើការបន្ថែមមើលជាមុនបច្ចុប្បន្ន ហើយពិនិត្យកំណែដែលបានដំឡើងមុនចាប់ផ្ដើម។

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: ដាក់បញ្ចូលកម្មវិធីជជែកជាមួយគំរូ Microsoft Foundry Models

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

**Infrastructure (main.bicep):**
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

### Pattern 2: AI Search + RAG Integration

**Use Case**: ដាក់បញ្ចូលកម្មវិធីបង្កើតដោយការស្វែងរកបន្ថែម (RAG)

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

### Pattern 3: Document Intelligence Integration

**Use Case**: ដំណើរការពិភាក្សានិងវិភាគឯកសារ

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

## 🔧 Configuration Patterns

### Environment Variables Setup

**Production Configuration:**
```bash
# សេវាកម្ម AI មូលដ្ឋាន
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ការកំណត់រចនាសម្ព័ន្ធម៉ូដែល
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# ការកំណត់កម្រិតបង្ហាញមុខងារ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# ការកំណត់អត្រាចំណាយអប្បបរមាសម្រាប់ការអភិវឌ្ឍន៍
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ជាន់ឥតគិតថ្លៃ
```

### Secure Configuration with Key Vault

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

## Deployment Workflows

### AZD Extensions for Foundry

AZD ផ្ដល់ជំនួយបន្ថែម ដែលបន្ថែមលក្ខណៈ AI សម្រាប់ការងារជាមួយសេវាកម្ម Microsoft Foundry៖

```bash
# តំឡើងការពង្រីកភ្នាក់ងារផាន់ដរី
azd extension install azure.ai.agents

# តំឡើងការពង្រីកសម្រាប់ធ្វើឱ្យប្រសើរឡើង
azd extension install azure.ai.finetune

# តំឡើងការពង្រីកម៉ូដែលផ្ទាល់ខ្លួន
azd extension install azure.ai.models

# បញ្ជីការពង្រីកដែលបានតំឡើង
azd extension list --installed

# ស៊ើបអង្កេតកំណែការពង្រីកភ្នាក់ងារដែលបានតំឡើងបច្ចុប្បន្ន
azd extension show azure.ai.agents
```

កម្មវិធីបន្ថែម AI នៅក្នុងវគ្គមើលជាមុននៅតែមានការផ្លាស់ប្តូរយ៉ាងឆាប់រហ័ស។ ប្រសិនបើពាក្យបញ្ជាធ្វើការប្រតិបត្តិផ្សេងពីនេះ សូមធ្វើការ៕បន្ទាន់កំណែបន្ថែមមុនពេលដោះស្រាយបញ្ហាគម្រោងដោយផ្ទាល់។

### Agent-First Deployment with `azd ai`

បើអ្នកមានបញ្ជីភ្នាក់ងារ សូមប្រើ `azd ai agent init` ដើម្បីបង្កើតគម្រោងភ្ជាប់ទៅកាន់សេវាកម្មភ្នាក់ងារ Foundry៖

```bash
# ចាប់ផ្តើមពីរបាយការណ៍ភ្នាក់ងារ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ដាក់បញ្ចូលទៅ Azure
azd up
```

ការបើកចេញមើលជាមុននូវ `azure.ai.agents` ក៏បានបន្ថែមការគាំទ្រការចាប់ផ្តើមដោយគំរូសម្រាប់ `azd ai agent init`។ បើអ្នកកំពុងអនុវត្តន៍ឧទាហរណ៍ភ្នាក់ងារថ្មីៗ សូមពិនិត្យជំនួយបន្ថែមសម្រាប់ប៊្លុកពាក្យបញ្ជាដែលមាននៅក្នុងកំណែក្នុងម៉ាស៊ីនរបស់អ្នក។

មើល [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) សម្រាប់យោងពាក្យបញ្ជា និងប៊្លុកពាក្យបញ្ជាពេញលេញ។

### Single Command Deployment

```bash
# ដាក់ឲ្យដំណើរការទាំងអស់ជាមួយពាក្យបញ្ជាមួយ
azd up

# ឬដាក់ឲ្យដំណើរការជាបន្តបន្ទាប់
azd provision  # គ្រឹះសម្ព័ន្ធតែប៉ុណ្ណោះ
azd deploy     # កម្មវិធីតែប៉ុណ្ណោះ

# សម្រាប់ការដាក់ឲ្យដំណើរការនូវកម្មវិធី AI រយៈពេលយូរនៅក្នុង azd 1.23.11+
azd deploy --timeout 1800
```

### Environment-Specific Deployments

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

## Monitoring and Observability

### Application Insights Integration

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

### Cost Monitoring

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

## 🔐 Security Best Practices

### Managed Identity Configuration

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

### Network Security

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

## Performance Optimization

### Caching Strategies

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

### Auto-scaling Configuration

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Exceeded

**Symptoms:**
- ការដាក់បញ្ចូលបរាជ័យដោយមានកំហុសកំណត់ក្រុមនៃទិន្នន័យ
- កំហុស 429 ក្នុងកំណត់ហេតុកម្មវិធី

**Solutions:**
```bash
# ពិនិត្យការប្រើប្រាស់គូតាគ្រប់ខែបច្ចុប្បន្ន
az cognitiveservices usage list --location eastus

# ព្យាយាមតំបន់ផ្សេងទៀត
azd env set AZURE_LOCATION westus2
azd up

# បន្ថយសមត្ថភាពបណ្តោះអាសន្ន
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- កំហុស 401/403 នៅពេលហៅសេវាកម្ម AI
- សារជាប្រភេទ "Access denied"

**Solutions:**
```bash
# ពិនិត្យការបែងចែកតួនាទី
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ពិនិត្យការកំណត់រចនាសម្ព័ន្ធអត្តសញ្ញាណដែលគ្រប់គ្រង
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ផ្ទៀងផ្ទាត់ការចូលប្រើកូនសោវ៉ុល​ត
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- គំរូមិនអាចប្រើបានក្នុងការដាក់បញ្ចូល
- កំណែគំរូជាក់លាក់បរាជ័យ

**Solutions:**
```bash
# បញ្ជីម៉ូឌែលដែលមានតាមតំបន់
az cognitiveservices model list --location eastus

# កែប្រែព្រឹត្តិការណ៍ម៉ូឌែលក្នុងព័ទ្ឋប័ណ្ណ bicep
# ពិនិត្យតម្រូវការម៉ូឌែលនៅលើសមត្ថភាព
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: ឧទាហរណ៍ Azure AI ដែលពេញនិយមបំផុត — កម្មវិធីជជែក RAG ដែលរួចជាស្រេចឲ្យអ្នកអាចស្នើសំណួរនៅលើឯកសាររបស់អ្នកបាន។ ប្រើ GPT-4.1-mini សម្រាប់ជជែក, text-embedding-3-large សម្រាប់បង្កើត embeddings និង Azure AI Search សម្រាប់ការស្វែងរក។ គាំទ្រឯកសារតម្រុយមុខ, ព័ត៌មានសំឡេងចូល/ចេញ, Microsoft Entra authentication និង Application Insights មានកំណត់តាមដាន។

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: ជំនួស .NET/C# នៃឧទាហរណ៍ជជែក RAG Python។ ត្រូវបានកសាងជាមួយ ASP.NET Core Minimal API និង Blazor WebAssembly frontend។ រួមមានជជែកសំឡេង, អំពិល GPT-4o-mini vision និងកម្មវិធី .NET MAUI Blazor Hybrid សម្រាប់ថាស/ទូរស័ព្ទ។

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: កំណែ Java នៃឧទាហរណ៍ជជែក RAG ដែលប្រើ Langchain4J សម្រាប់ការត្រួតត្រា AI។ គាំទ្រវិសិដ្ឋាន microservice អ្នកនឹងការប្រើប្រាស់ច្រើនសម្រាប់ការស្វែងរក (អត្ថបទ, វ៉ិចទ័រ, បរិមាណលាយ) ដែលមានuploadឯកសារជាមួយ Azure Document Intelligence និងដាក់បញ្ចូលនៅលើ Azure Container Apps ឬ Azure Kubernetes Service។

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: កម្មវិធី retail RAG copilot ពេញលេញ ប្រើ Azure AI Foundry និង Prompty។ ជា chatbot សម្រាប់ Contoso Outdoor retailer ដែលផ្អែកលើបញ្ជីផលិតផល និងទិន្នន័យកម្មង់ប្រើបញ្ចប់។ បង្ហាញដំណើរការ GenAIOps ពេញលេញ — ប្រើ Prompty សម្រាប់ទម្រង់គំរូ, វាយតម្លៃជាមួយ AI-supported evaluators និងដាក់បញ្ចូលតាម AZD ទៅ Container Apps។

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: ឧទាហរណ៍ multi-agent បង្ហាញការត្រួតត្រាភ្នាក់ងារ AI ជាមួយ Prompty។ ប្រើភ្នាក់ងារស្រាវជ្រាវ (Bing Grounding នៅក្នុង Azure AI Agent Service), ភ្នាក់ងារផលិតផល (Azure AI Search), ភ្នាក់ងារអ្នកនិពន្ធ និងភ្នាក់ងារកែសម្រួល ដើម្បីផលិតអត្ថបទដែលបានស្រាវជ្រាវយ៉ាងល្អជាមួយគ្នា។ រួមមាន CI/CD ជាមួយវាយតម្លៃនៅក្នុង GitHub Actions។

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: វិធីសាស្រ្ត serverless ទាំងស្រុង សម្រាប់ជជែក RAG ប្រើ LangChain.js ជាមួយ Azure Functions សម្រាប់ API និង Azure Static Web Apps សម្រាប់ផ្ទុក។ ប្រើ Azure Cosmos DB ជាទាំងគ្រប់ទីកន្លែងសម្រាប់តម្កល់វ៉ិចទ័រ និងប្រវត្ដិជជែក។ គាំទ្រការអភិវឌ្ឍនៅក្នុងតំបន់ជាមួយ Ollama សម្រាប់ការប្រឡងឥតគិតថ្លៃ។

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: ជំនួយដំណោះស្រាយ RAG នៅកម្រិតស្ថាប័នជាមួយទ្វារគ្រប់គ្រងសម្រាប់បញ្ចូល/គ្រប់គ្រងឯកសារ, ជំនួយអ្នកចាត់ការ ច្រើនជម្រើសការត្រួតពិនិត្យ (Semantic Kernel, LangChain, Prompt Flow), ការបម្លែងសូវច->អត្ថបទ, សមាសភាព Microsoft Teams, និងជម្រើសប្រើ PostgreSQL ឬ Cosmos DB ជាប្រាក់បន្ទាន់។ រចនាឡើងជាចំណុចចាប់ផ្ដើមដែលអាចកែប្រែក្នុងការបង្ហោះបញ្ចូល RAG។

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: កម្មវិធីយោងសម្រាប់ multi-agent AI orchestration ប្រើបណ្ណាល័យបី (LangChain.js, LlamaIndex.TS, និង Microsoft Agent Framework)។ មាន MCP (Model Context Protocol) servers ជាមួយភាសាចំនួនបួន ដាក់បញ្ចូលជារូប serverless តាម Azure Container Apps និងជាប់ត្រួតពិនិត្យដោយ OpenTelemetry។

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: គំរូ Bicep តូច​សម្រាប់ដាក់បញ្ចូលសេវាកម្ម Azure AI ជាមួយគំរូម៉ាស៊ីនរៀនបានកំណត់រួច។ ជាចំណុចចាប់ផ្ដើមស្រាល ដែលអ្នកត្រូវការផ្ដល់ឲ្យគ្រប់គ្រងដំណើរការសេវាកម្ម Azure AI ប៉ុណ្ណោះ​ ដោយមិនចាំបាច់មាន Stack ពេញទៅ។

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: ទស្សនាកាន់តែច្រើននូវ [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) សម្រាប់គំរូ AZD AI ជាច្រើនជាច្រើនជាតួភាសានិងសេចក្ដីអភិវឌ្ឍប្លង់ផ្សេងៗ។

## Next Steps

1. **Try the Examples**: ចាប់ផ្ដើមជាមួយគំរូរៀបចំរួចដែលសមរម្យនឹងករណីប្រើរបស់អ្នក
2. **Customize for Your Needs**: កែប្រែ រចនាសម្ព័ន្ធ និងកូដកម្មវិធី
3. **Add Monitoring**: អនុវត្តការត្រួតពិនិត្យគ្រប់គ្រាន់
4. **Optimize Costs**: ផ្លាស់ប្ដូរតំរូវការកំណត់សម្រាប់ថវិកាអ្នក
5. **Secure Your Deployment**: អនុវត្តលំនាំប្រព័ន្ធសន្តិសុខអាជីវកម្ម
6. **Scale to Production**: បន្ថែមលក្ខណៈមេដឹកនាំពហុតំបន់ និងភាពអាចប្រើបានខ្ពស់

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: ដាក់បញ្ចូល និងសាកល្បងកម្មវិធីជជែក AI ដែលរួចជាស្រេចសម្រាប់ផលិតកម្ម

```bash
# ចាប់ផ្តើម​ផ្ទាំង​នំ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# កំណត់អថេរបរិស្ថាន
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ធ្វើការបញ្ចូល
azd up

# សាកល្បងកម្មវិធី
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# តាមដានប្រតិបត្តិការបញ្ញាសិប្បនិម្មិត
azd monitor

# សម្អាត
azd down --force --purge
```

**Success Criteria:**
- [ ] ការដាក់បញ្ចូលបញ្ចប់ដោយគ្មានកំហុសកំណត់ក្រុម
- [ ] អាចចូលប្រើផ្ទាំងជជែកក្នុងកម្មវិធីរុករក
- [ ] អាចសួរសំណួរនិងទទួលបានចម្លើយដោយ AI
- [ ] Application Insights បង្ហាញទិន្នន័យត្រួតពិនិត្យ
- [ ] ជោគជ័យក្នុងការប្រុងប្រយ័ត្នធនធាន

**Estimated Cost**: $5-10 សម្រាប់ 30 នាទីនៃការប្រឡង

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: ដាក់បញ្ចូលគំរូ AI ជាច្រើនដោយមានការកំណត់ខុសគ្នា

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

# ដាក់ពង្រីក និងផ្ទៀងផ្ទាត់
azd provision
azd show
```

**Success Criteria:**
- [ ] គំរូជាច្រើនបានដាក់បញ្ចូលដោយជោគជ័យ
- [ ] ការកំណត់សមត្ថភាពខុសគ្នាត្រូវអនុវត្ត
- [ ] គំរូអាចចូលប្រើតាម API
- [ ] អាចហៅគំរូទាំងពីរពីកម្មវិធី

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: កំណត់ការជូនដំណឹងថវិកា និងតាមដានចំណាយ

```bash
# เพิ่มការជូនដំណឹងថវិកា​ទៅកាន់ Bicep
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

# បង្ហាញការជូនដំណឹងថវិកា
azd provision

# ពិនិត្យតម្លៃបច្ចុប្បន្ន
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] បានបង្កើតការជូនដំណឹងថវិកានៅក្នុង Azure
- [ ] ការជូនដំណឹងអ៊ីមែលបានកំណត់
- [ ] អាចមើលទិន្នន័យចំណាយនៅក្នុង Azure Portal
- [ ] កំណត់ដែនកំណត់ថវិកាឲ្យសមរម្យ

## 💡 Frequently Asked Questions

<details>
<summary><strong>តើខ្ញុំត្រូវបន្ថយថ្លៃ Microsoft Foundry Models របៀបណា ខណៈបំពានអភិវឌ្ឍ?</strong></summary>

1. **ប្រើ Free Tier**: Microsoft Foundry Models ផ្ដល់ 50,000 តូកិនក្នុងមួយខែឥតគិតថ្លៃ
2. **បន្ថយសមត្ថភាព**: កំណត់សមត្ថភាពជា 10 TPM ជំនួស 30+ សម្រាប់ dev
3. **ប្រើ azd down**: លុបធនធានពេលមិនបានអភិវឌ្ឍចំពោះ
4. **Cache Responses**: អនុវត្ត Redis cache សម្រាប់ការសួរដដែល
5. **ប្រើ Prompt Engineering**: បន្ថយការប្រើប្រាស់តូកិនជាមួយ prompt ដែលមានប្រសិទ្ធភាព

</details>
```bash
# ការកំណត់រចនាសម្ព័ន្ធអភិវឌ្ឍន៍
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>តើភាពខុសគ្នារវាងម៉ូដែល Microsoft Foundry និង OpenAI API ជាអ្វី?</strong></summary>

**ម៉ូដែល Microsoft Foundry**៖
- សុវត្ថិភាពសហគ្រាស និងការអនុវត្តតាមច្បាប់
- បញ្ចូលបណ្តាញឯកជន
- ការធានា SLA
- អត្តសញ្ញាណគ្រប់គ្រងតាម Managed Identity
- អត្រាកំណត់ខ្ពស់ជាងគេអាចប្រើបាន

**OpenAI API**៖
- ចូលដំណើរការម៉ូដែលថ្មីបានយ៉ាងរហ័ស
- ការតំឡើងសាមញ្ញជាង
- ឧបសគ្គចូលរួមមានទាប
- បណ្ដាញអ៊ីនធឺណិតសាធារណៈតែប៉ុណ្ណោះ

សម្រាប់កម្មវិធីផលិតកម្ម **ម៉ូដែល Microsoft Foundry ត្រូវបានផ្តល់អនុសាសន៍**។
</details>

<details>
<summary><strong>តើត្រូវដោះស្រាយកំហុសកំណត់អត្រារបស់ម៉ូដែល Microsoft Foundry យ៉ាងដូចម្តេច?</strong></summary>

```bash
# ពិនិត្យមើលក្រុមហ៊ុនបច្ចុប្បន្ន
az cognitiveservices usage list --location eastus2

# ព្យាយាមតំបន់ផ្សេងទៀត
azd env set AZURE_LOCATION westus2
azd up

# បន្ថយសមត្ថភាពផ្នែកបណ្តោះអាសន្ន
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ស្នើសុំបន្ថែមក្រុមហ៊ុន
# ទៅកាន់ព្រិល Azure > ក្រុមហ៊ុន > ស្នើសុំបន្ថែម
```
</details>

<details>
<summary><strong>តើខ្ញុំអាចប្រើទិន្នន័យរបស់ខ្ញុំជាមួយម៉ូដែល Microsoft Foundry ទេ?</strong></summary>

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

មើលទំព័រ [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)។

</details>

<details>
<summary><strong>តើត្រូវធានាសុវត្ថិភាពច្រកចេញម៉ូដែល AI យ៉ាងដូចម្តេច?</strong></summary>

**របៀបអនុវត្តល្អបំផុត**៖
1. ប្រើ Managed Identity (មិនប្រើកូនសោ API)
2. បើក Private Endpoints
3. កំណត់ក្រុមសុវត្ថិភាពបណ្ដាញ
4. អនុវត្តការកំណត់ល្បឿន
5. ប្រើ Azure Key Vault សម្រាប់ទុកព័ត៌មានសំងាត់

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

- **Microsoft Foundry Discord**: [ប៉ុស្តិ៍ Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [បញ្ហា និងការពិភាក្សា](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ឯកសារផ្លូវការប្រចាំ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [ជំនាញ Microsoft Foundry នៅ skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ដំឡើងជំនាញ Azure + Foundry agent ក្នុងកម្មវិធីកែសម្រួលរបស់អ្នកជាមួយ `npx skills add microsoft/github-copilot-for-azure`

---

**ការរុករកជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**៖ [AZD For Beginners](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**៖ ជំពូក 2 - ការអភិវឌ្ឍ AI ជាចំបង
- **⬅️ ជំពូកមុន**៖ [ជំពូក 1: គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**៖ [ការដាក់បញ្ចូលម៉ូដែល AI](ai-model-deployment.md)
- **🚀 ជំពូកបន្ទាប់**៖ [ជំពូក 3: ការកំណត់រចនា](../chapter-03-configuration/configuration.md)

**ត្រូវការជំនួយ?** ចូលរួមពិភាក្សាជាសហគមន៍ ឬបើកបញ្ហារបស់អ្នកនៅក្នុង repository។ សហគមន៍ Azure AI + AZD គឺនៅទីនេះដើម្បីជួយអ្នកឱ្យជោគជ័យ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈពេលយើងខិតខំប្រឹងប្រែងរកភាពត្រឹមត្រូវ សូមយល់ដឹងថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសារបស់វាត្រូវបានពិចារណាថាជាតំណាលផ្លូវការជាចម្បង។ ចំពោះព័ត៌មានសំខាន់ៗ គួរតែប្រើការបកប្រែដោយអ្នកជំនាញផ្នែកមនុស្ស។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->