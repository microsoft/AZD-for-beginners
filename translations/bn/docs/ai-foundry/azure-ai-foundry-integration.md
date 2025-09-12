<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T19:28:36+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "bn"
}
-->
# Azure AI Foundry Integration with AZD

**পূর্ববর্তী:** [প্রথম প্রকল্প](../getting-started/first-project.md) | **পরবর্তী:** [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)

## সংক্ষিপ্ত বিবরণ

এই গাইডটি দেখায় কীভাবে Azure AI Foundry পরিষেবাগুলিকে Azure Developer CLI (AZD)-এর সাথে সংযুক্ত করা যায়, যাতে AI অ্যাপ্লিকেশন ডিপ্লয়মেন্ট আরও সহজ হয়। Azure AI Foundry একটি পূর্ণাঙ্গ প্ল্যাটফর্ম প্রদান করে AI অ্যাপ্লিকেশন তৈরি, ডিপ্লয় এবং পরিচালনার জন্য, যেখানে AZD অবকাঠামো এবং ডিপ্লয়মেন্ট প্রক্রিয়াকে সহজ করে।

## Azure AI Foundry কী?

Azure AI Foundry হলো মাইক্রোসফটের একটি একীভূত প্ল্যাটফর্ম যা AI ডেভেলপমেন্টের জন্য নিম্নলিখিত সুবিধাগুলি প্রদান করে:

- **মডেল ক্যাটালগ**: অত্যাধুনিক AI মডেলের অ্যাক্সেস
- **প্রম্পট ফ্লো**: AI ওয়ার্কফ্লো ডিজাইনের জন্য ভিজ্যুয়াল ডিজাইনার
- **AI Foundry পোর্টাল**: AI অ্যাপ্লিকেশনের জন্য ইন্টিগ্রেটেড ডেভেলপমেন্ট এনভায়রনমেন্ট
- **ডিপ্লয়মেন্ট অপশন**: একাধিক হোস্টিং এবং স্কেলিং অপশন
- **নিরাপত্তা এবং সুরক্ষা**: বিল্ট-ইন রেসপন্সিবল AI ফিচার

## AZD + Azure AI Foundry: একসাথে আরও ভালো

| ফিচার | Azure AI Foundry | AZD ইন্টিগ্রেশন সুবিধা |
|-------|------------------|-----------------------|
| **মডেল ডিপ্লয়মেন্ট** | ম্যানুয়াল পোর্টাল ডিপ্লয়মেন্ট | স্বয়ংক্রিয়, পুনরাবৃত্তি ডিপ্লয়মেন্ট |
| **ইনফ্রাস্ট্রাকচার** | ক্লিক-থ্রু প্রভিশনিং | কোড হিসেবে অবকাঠামো (Bicep) |
| **এনভায়রনমেন্ট ম্যানেজমেন্ট** | একক এনভায়রনমেন্ট ফোকাস | একাধিক এনভায়রনমেন্ট (ডেভ/স্টেজিং/প্রোড) |
| **CI/CD ইন্টিগ্রেশন** | সীমিত | নেটিভ GitHub Actions সাপোর্ট |
| **কস্ট ম্যানেজমেন্ট** | বেসিক মনিটরিং | এনভায়রনমেন্ট-নির্দিষ্ট কস্ট অপ্টিমাইজেশন |

## প্রয়োজনীয়তা

- যথাযথ অনুমতি সহ Azure সাবস্ক্রিপশন
- Azure Developer CLI ইনস্টল করা
- Azure OpenAI পরিষেবাগুলিতে অ্যাক্সেস
- Azure AI Foundry সম্পর্কে প্রাথমিক ধারণা

## মূল ইন্টিগ্রেশন প্যাটার্ন

### প্যাটার্ন ১: Azure OpenAI ইন্টিগ্রেশন

**ব্যবহার ক্ষেত্র**: Azure OpenAI মডেল ব্যবহার করে চ্যাট অ্যাপ্লিকেশন ডিপ্লয় করা

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

**ইনফ্রাস্ট্রাকচার (main.bicep):**
```bicep
// Azure OpenAI Account
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
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### প্যাটার্ন ২: AI সার্চ + RAG ইন্টিগ্রেশন

**ব্যবহার ক্ষেত্র**: রিট্রিভাল-অগমেন্টেড জেনারেশন (RAG) অ্যাপ্লিকেশন ডিপ্লয় করা

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

### প্যাটার্ন ৩: ডকুমেন্ট ইন্টেলিজেন্স ইন্টিগ্রেশন

**ব্যবহার ক্ষেত্র**: ডকুমেন্ট প্রসেসিং এবং বিশ্লেষণ ওয়ার্কফ্লো

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

## 🔧 কনফিগারেশন প্যাটার্ন

### এনভায়রনমেন্ট ভেরিয়েবল সেটআপ

**প্রোডাকশন কনফিগারেশন:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ডেভেলপমেন্ট কনফিগারেশন:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Key Vault দিয়ে সুরক্ষিত কনফিগারেশন

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

## ডিপ্লয়মেন্ট ওয়ার্কফ্লো

### একক কমান্ড ডিপ্লয়মেন্ট

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### এনভায়রনমেন্ট-নির্দিষ্ট ডিপ্লয়মেন্ট

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

## মনিটরিং এবং পর্যবেক্ষণ

### অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন

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

### কস্ট মনিটরিং

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

## 🔐 নিরাপত্তা সেরা অনুশীলন

### ম্যানেজড আইডেন্টিটি কনফিগারেশন

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

### নেটওয়ার্ক সুরক্ষা

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

## পারফরম্যান্স অপ্টিমাইজেশন

### ক্যাশিং স্ট্র্যাটেজি

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

### অটো-স্কেলিং কনফিগারেশন

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

## সাধারণ সমস্যার সমাধান

### সমস্যা ১: OpenAI কোটা অতিক্রম

**লক্ষণ:**
- কোটা ত্রুটির কারণে ডিপ্লয়মেন্ট ব্যর্থ
- অ্যাপ্লিকেশন লগে 429 ত্রুটি

**সমাধান:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### সমস্যা ২: প্রমাণীকরণ ব্যর্থতা

**লক্ষণ:**
- AI পরিষেবাগুলিতে কল করার সময় 401/403 ত্রুটি
- "অ্যাক্সেস ডিনাইড" বার্তা

**সমাধান:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### সমস্যা ৩: মডেল ডিপ্লয়মেন্ট সমস্যা

**লক্ষণ:**
- ডিপ্লয়মেন্টে মডেল উপলব্ধ নয়
- নির্দিষ্ট মডেল সংস্করণ ব্যর্থ

**সমাধান:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## উদাহরণ টেমপ্লেট

### বেসিক চ্যাট অ্যাপ্লিকেশন

**রিপোজিটরি**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**পরিষেবাগুলি**: Azure OpenAI + Cognitive Search + App Service

**দ্রুত শুরু**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ডকুমেন্ট প্রসেসিং পাইপলাইন

**রিপোজিটরি**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**পরিষেবাগুলি**: Document Intelligence + Storage + Functions

**দ্রুত শুরু**:
```bash
azd init --template ai-document-processing
azd up
```

### এন্টারপ্রাইজ চ্যাট RAG সহ

**রিপোজিটরি**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**পরিষেবাগুলি**: Azure OpenAI + Search + Container Apps + Cosmos DB

**দ্রুত শুরু**:
```bash
azd init --template contoso-chat
azd up
```

## পরবর্তী পদক্ষেপ

1. **উদাহরণ চেষ্টা করুন**: আপনার ব্যবহার ক্ষেত্রের সাথে মিলে যাওয়া একটি প্রি-বিল্ট টেমপ্লেট দিয়ে শুরু করুন
2. **আপনার প্রয়োজন অনুযায়ী কাস্টমাইজ করুন**: অবকাঠামো এবং অ্যাপ্লিকেশন কোড পরিবর্তন করুন
3. **মনিটরিং যোগ করুন**: ব্যাপক পর্যবেক্ষণ বাস্তবায়ন করুন
4. **কস্ট অপ্টিমাইজ করুন**: আপনার বাজেটের জন্য কনফিগারেশন সূক্ষ্মভাবে সামঞ্জস্য করুন
5. **আপনার ডিপ্লয়মেন্ট সুরক্ষিত করুন**: এন্টারপ্রাইজ নিরাপত্তা প্যাটার্ন বাস্তবায়ন করুন
6. **প্রোডাকশনে স্কেল করুন**: মাল্টি-রিজিয়ন এবং উচ্চ-উপলব্ধতা বৈশিষ্ট্য যোগ করুন

## কমিউনিটি এবং সাপোর্ট

- **Azure AI Foundry Discord**: [#Azure চ্যানেল](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ইস্যু এবং আলোচনা](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [অফিশিয়াল ডকুমেন্টেশন](https://learn.microsoft.com/azure/ai-studio/)

---

**পূর্ববর্তী:** [প্রথম প্রকল্প](../getting-started/first-project.md) | **পরবর্তী:** [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)

**সাহায্য দরকার?** আমাদের কমিউনিটি আলোচনায় যোগ দিন অথবা রিপোজিটরিতে একটি ইস্যু খুলুন। Azure AI + AZD কমিউনিটি আপনার সফলতার জন্য এখানে রয়েছে!

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসম্ভব সঠিক অনুবাদ প্রদানের চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।