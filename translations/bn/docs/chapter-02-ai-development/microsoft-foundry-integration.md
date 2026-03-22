# Microsoft Foundry এবং AZD একত্রীকরণ

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 2 - AI-প্রথম উন্নয়ন
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় 1: আপনার প্রথম প্রকল্প](../chapter-01-foundation/first-project.md)
- **➡️ পরবর্তী**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় 3: কনফিগারেশন](../chapter-03-configuration/configuration.md)

## সারসংক্ষেপ

এই নির্দেশিকাটি দেখায় কীভাবে Microsoft Foundry সেবাগুলিকে Azure Developer CLI (AZD) এর সাথে ইন্টিগ্রেট করে AI অ্যাপ্লিকেশনগুলির সহজ স্থাপনা করা যায়। Microsoft Foundry AI অ্যাপ্লিকেশন নির্মাণ, স্থাপন এবং পরিচালনার জন্য একটি বিস্তৃত প্ল্যাটফর্ম প্রদান করে, আর AZD ইনফ্রাস্ট্রাকচার এবং ডেপ্লয়মেন্ট প্রক্রিয়াকে সরল করে।

## Microsoft Foundry কী?

Microsoft Foundry হল Microsoft-এর এককীকৃত AI উন্নয়ন প্ল্যাটফর্ম, যা অন্তর্ভুক্ত করে:

- **Model Catalog**: শীর্ষস্থানীয় AI মডেলগুলিতে অ্যাক্সেস
- **Prompt Flow**: AI ওয়ার্কফ্লো-এর জন্য ভিজ্যুয়াল ডিজাইনার
- **Microsoft Foundry Portal**: AI অ্যাপ্লিকেশনের জন্য ইন্টিগ্রেটেড ডেভেলপমেন্ট পরিবেশ
- **Deployment Options**: বিভিন্ন হোস্টিং এবং স্কেলিং অপশন
- **Safety and Security**: অন্তর্নির্মিত দায়িত্বশীল AI ফিচারসমূহ

## AZD + Microsoft Foundry: একসাথে আরও ভালো

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | ম্যানুয়াল পোর্টাল ডেপ্লয়মেন্ট | অটোমেটেড, পুনরাবৃত্তিযোগ্য ডেপ্লয়মেন্ট |
| **Infrastructure** | ক্লিক-থ্রু প্রোভিশনিং | Infrastructure as Code (Bicep) |
| **Environment Management** | একক পরিবেশ ফোকাস | মাল্টি-পরিবেশ (dev/staging/prod) |
| **CI/CD Integration** | সীমিত | নেটিভ GitHub Actions সাপোর্ট |
| **Cost Management** | মৌলিক মনিটরিং | পরিবেশ-নির্দিষ্ট খরচ অপ্টিমাইজেশন |

## পূর্বশর্ত

- উপযুক্ত অনুমতিসহ Azure সাবস্ক্রিপশন
- Azure Developer CLI ইনস্টল করা আছে
- Microsoft Foundry Models সেবায় অ্যাক্সেস
- Microsoft Foundry-এর মৌলিক পরিচিতি

## মূল ইন্টিগ্রেশন প্যাটার্নসমূহ

### প্যাটার্ন 1: Microsoft Foundry Models ইন্টিগ্রেশন

**ব্যবহার কেস**: Microsoft Foundry Models মডেল ব্যবহার করে চ্যাট অ্যাপ্লিকেশন স্থাপন করা

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

### প্যাটার্ন 2: AI Search + RAG ইন্টিগ্রেশন

**ব্যবহার কেস**: রিট্রিভাল-অগমেন্টেড জেনারেশন (RAG) অ্যাপ্লিকেশন স্থাপন করা

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

### প্যাটার্ন 3: Document Intelligence ইন্টিগ্রেশন

**ব্যবহার কেস**: ডকুমেন্ট প্রসেসিং এবং বিশ্লেষণ ওয়ার্কফ্লো

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

## 🔧 কনফিগারেশন প্যাটার্নসমূহ

### Environment Variables Setup

**প্রোডাকশন কনফিগারেশন:**
```bash
# কোর এআই পরিষেবাগুলি
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# মডেল কনফিগারেশনসমূহ
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# পারফরম্যান্স সেটিংস
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ডেভেলপমেন্ট কনফিগারেশন:**
```bash
# উন্নয়নের জন্য খরচ-অনুকূল সেটিংস
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # বিনামূল্যের স্তর
```

### Key Vault দিয়ে নিরাপদ কনফিগারেশন

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

## ডেপ্লয়মেন্ট ওয়ার্কফ্লো

### Foundry-এর জন্য AZD এক্সটেনশনগুলি

AZD এক্সটেনশন প্রদান করে যা Microsoft Foundry সেবার সাথে কাজ করার জন্য AI-নির্দিষ্ট ক্ষমতা যোগ করে:

```bash
# Foundry agents এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.agents

# ফাইন-টিউনিং এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.finetune

# কাস্টম মডেলস এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.models

# ইনস্টল করা এক্সটেনশনগুলো তালিকাভুক্ত করুন
azd extension list
```

### Agent-First ডেপ্লয়মেন্ট `azd ai` দিয়ে

আপনার কাছে যদি একটি এজেন্ট ম্যানিফেস্ট থাকে, তাহলে Foundry Agent Service-এ সংযুক্ত একটি প্রজেক্ট scaffold করতে `azd ai agent init` ব্যবহার করুন:

```bash
# এজেন্ট ম্যানিফেস্ট থেকে ইনিশিয়ালাইজ করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure-এ স্থাপন করুন
azd up
```

পূর্ণ কমান্ড রেফারেন্স এবং ফ্ল্যাগগুলির জন্য দেখুন [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)।

### একক কমান্ড ডেপ্লয়মেন্ট

```bash
# একটি কমান্ডে সবকিছু স্থাপন করুন
azd up

# অথবা ধাপে ধাপে স্থাপন করুন
azd provision  # শুধু অবকাঠামো
azd deploy     # শুধু অ্যাপ্লিকেশন
```

### পরিবেশ-নির্দিষ্ট ডেপ্লয়মেন্ট

```bash
# উন্নয়ন পরিবেশ
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# উৎপাদন পরিবেশ
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## মনিটরিং এবং পর্যবেক্ষণযোগ্যতা

### Application Insights ইন্টিগ্রেশন

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

### খরচ মনিটরিং

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

## 🔐 নিরাপত্তা সেরা অনুশীলনসমূহ

### Managed Identity কনফিগারেশন

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

### নেটওয়ার্ক সিকিউরিটি

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

### ক্যাশিং কৌশল

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

## সাধারণ সমস্যা সমাধান

### সমস্যা ১: OpenAI কোটা অতিক্রম করেছে

**লক্ষণ:**
- ডেপ্লয়মেন্ট কোটা ত্রুটির সাথে ব্যর্থ হয়
- অ্যাপ্লিকেশন লগে 429 ত্রুটি দেখা যায়

**সমাধানসমূহ:**
```bash
# বর্তমান কোটার ব্যবহার পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# ভিন্ন অঞ্চলে চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up

# অস্থায়ীভাবে ধারণক্ষমতা কমান
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### সমস্যা ২: প্রমাণীকরণ ব্যর্থতা

**লক্ষণ:**
- AI সেবাগুলো কল করার সময় 401/403 ত্রুটি
- "Access denied" বার্তা দেখা দেয়

**সমাধানসমূহ:**
```bash
# রোল অ্যাসাইনমেন্ট যাচাই করুন
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ম্যানেজড আইডেন্টিটি কনফিগারেশন যাচাই করুন
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# কী ভল্ট অ্যাক্সেস যাচাই করুন
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### সমস্যা ৩: মডেল ডিপ্লয়মেন্ট সমস্যা

**লক্ষণ:**
- ডেপ্লয়মেন্টে মডেলগুলি উপলব্ধ নয়
- নির্দিষ্ট মডেল ভার্সনগুলো ব্যর্থ হচ্ছে

**সমাধানসমূহ:**
```bash
# অঞ্চল অনুযায়ী উপলব্ধ মডেলসমূহ তালিকা করুন
az cognitiveservices model list --location eastus

# bicep টেমপ্লেটে মডেল সংস্করণ আপডেট করুন
# মডেলের ধারণক্ষমতা সংক্রান্ত প্রয়োজনীয়তা পরীক্ষা করুন
```

## উদাহরণ টেমপ্লেটসমূহ

### RAG চ্যাট অ্যাপ্লিকেশন (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**বর্ণনা**: সবচেয়ে জনপ্রিয় Azure AI নমুনা — একটি প্রোডাকশন-রেডি RAG চ্যাট অ্যাপ যা আপনাকে আপনার নিজস্ব ডকুমেন্টের উপর প্রশ্ন করতে দেয়। চ্যাটের জন্য GPT-4.1-mini, এমবেডিংসের জন্য text-embedding-ada-002, এবং রিট্রিভালের জন্য Azure AI Search ব্যবহার করে। মাল্টিমোডাল ডকুমেন্ট, স্পিচ ইনপুট/আউটপুট, Microsoft Entra প্রমাণীকরণ, এবং Application Insights ট্রেসিং সমর্থন করে।

**দ্রুত শুরু**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG চ্যাট অ্যাপ্লিকেশন (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**বর্ণনা**: Python RAG চ্যাট নমুনার .NET/C# সমতুল্য। ASP.NET Core Minimal API এবং Blazor WebAssembly ফ্রন্টএন্ড দিয়ে নির্মিত। ভয়েস চ্যাট, GPT-4o-mini ভিশন সাপোর্ট, এবং .NET MAUI Blazor Hybrid ডেস্কটপ/মোবাইল ক্লায়েন্ট অন্তর্ভুক্ত।

**দ্রুত শুরু**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG চ্যাট অ্যাপ্লিকেশন (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**বর্ণনা**: Langchain4J ব্যবহার করে AI অর্কেস্ট্রেশনের জন্য Java সংস্করণ। মাইক্রোসার্ভিস ইভেন্ট-চালিত আর্কিটেকচার, একাধিক সার্চ কৌশল (টেক্সট, ভেক্টর, হাইব্রিড), Azure Document Intelligence সহ ডকুমেন্ট আপলোড, এবং Azure Container Apps বা Azure Kubernetes Service-এ ডিপ্লয়মেন্ট সাপোর্ট করে।

**দ্রুত শুরু**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### এন্টারপ্রাইজ রিটেইল কপাইলট উইথ Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**বর্ণনা**: Azure AI Foundry এবং Prompty ব্যবহার করে এন্ড-টু-এন্ড রিটেইল RAG কপাইলট। Contoso Outdoor রিটেইলার চ্যাটবট যা প্রোডাক্ট ক্যাটালগ এবং কাস্টমার অর্ডার ডেটার উপর ভিত্তি করে উত্তর দেয়। পুরো GenAIOps ওয়ার্কফ্লো প্রদর্শন করে — Prompty দিয়ে প্রোটোটাইপ, AI-সহায়ক ইভ্যালুয়েটর দিয়ে মূল্যায়ন, এবং AZD দিয়ে Container Apps-এ ডেপ্লয়।

**দ্রুত শুরু**:
```bash
azd init --template contoso-chat
azd up
```

### ক্রিয়েটিভ রাইটিং মাল্টি-এজেন্ট অ্যাপ্লিকেশন

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**বর্ণনা**: মাল্টি-এজেন্ট নমুনা যা Prompty সহ AI এজেন্ট অর্কেস্ট্রেশন প্রদর্শন করে। একটি রিসার্চ এজেন্ট (Bing Grounding in Azure AI Agent Service), একটি প্রোডাক্ট এজেন্ট (Azure AI Search), একটি রাইটার এজেন্ট, এবং একটি এডিটর এজেন্ট মিলিয়ে সুসমন্বিত গবেষণাভিত্তিক প্রবন্ধ তৈরি করে। GitHub Actions-এ ইভ্যালুয়েশনসহ CI/CD অন্তর্ভুক্ত।

**দ্রুত শুরু**:
```bash
azd init --template contoso-creative-writer
azd up
```

### সার্ভারলেস RAG চ্যাট (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**সার্ভিসসমূহ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**বর্ণনা**: LangChain.js ব্যবহার করে সম্পূর্ণ সার্ভারলেস RAG চ্যাটবট, API-র জন্য Azure Functions এবং হোস্টিংয়ের জন্য Azure Static Web Apps। Azure Cosmos DB কে ভেক্টর স্টোর এবং চ্যাট ইতিহাস ডাটাবেস উভয়ের জন্য ব্যবহার করে। শূন্য খরচ পরীক্ষার জন্য Ollama সহ লোকাল ডেভেলপমেন্ট সাপোর্ট করে।

**দ্রুত শুরু**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**বর্ণনা**: এন্টারপ্রাইজ-গ্রেড RAG সমাধান অ্যাক্সিলারেটর যেখানে অ্যাডমিন পোর্টাল আছে ডকুমেন্ট আপলোড/ম্যানেজমেন্টের জন্য, একাধিক অর্কেস্ট্রেটর অপশন (Semantic Kernel, LangChain, Prompt Flow), স্পিচ-টু-টেক্সট, Microsoft Teams ইন্টিগ্রেশন, এবং PostgreSQL বা Cosmos DB ব্যাকএন্ডের অপশন। প্রোডাকশন RAG সenario-র জন্য কাস্টমাইজযোগ্য আরম্ভবিন্দু হিসেবে ডিজাইন করা হয়েছে।

**দ্রুত শুরু**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ট্র্যাভেল এজেন্টস — মাল্টি-এজেন্ট MCP অর্কেস্ট্রেশন

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**বর্ণনা**: তিনটি ফ্রেমওয়ার্ক (LangChain.js, LlamaIndex.TS, এবং Microsoft Agent Framework) ব্যবহার করে মাল্টি-এজেন্ট AI অর্কেস্ট্রেশনের রেফারেন্স অ্যাপ্লিকেশন। চারটি ভাষায় MCP (Model Context Protocol) সার্ভার সার্ভারলেস Azure Container Apps হিসেবে ডিপ্লয় করা হয় এবং OpenTelemetry মনিটরিং রয়েছে।

**দ্রুত শুরু**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**সার্ভিসসমূহ**: Azure AI Services + Azure OpenAI

**বর্ণনা**: লঘু Bicep টেমপ্লেট যা কনফিগার্ড মেশিন লার্নিং মডেল সহ Azure AI সার্ভিসগুলো ডিপ্লয় করে। পূর্ণ অ্যাপ্লিকেশন স্ট্যাক ছাড়া কেবল Azure AI ইনফ্রাস্ট্রাকচার প্রোভিশন করতে চাইলে একটি হালকা শুরু পয়েন্ট।

**দ্রুত শুরু**:
```bash
azd init --template azd-ai-starter
azd up
```

> **আরো টেমপ্লেট ব্রাউজ করুন**: 80+ AI-নির্দিষ্ট AZD টেমপ্লেট ভাষা ও সিচ্যুয়েশনের জন্য দেখুন [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai)।

## পরবর্তী ধাপসমূহ

1. **উদাহরণগুলো চেষ্টা করুন**: আপনার ব্যবহারের কেস মিলে এমন একটি প্রি-বিল্ট টেমপ্লেট দিয়ে শুরু করুন
2. **আপনার প্রয়োজন অনুযায়ী কাস্টমাইজ করুন**: ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন কোড পরিবর্তন করুন
3. **মনিটরিং যোগ করুন**: বিস্তৃত পর্যবেক্ষণযোগ্যতা বাস্তবায়ন করুন
4. **খরচ অপ্টিমাইজ করুন**: আপনার বাজেট অনুযায়ী কনফিগারেশনগুলিকে সূক্ষ্মায়িত করুন
5. **আপনার ডেপ্লয়মেন্ট সুরক্ষিত করুন**: এন্টারপ্রাইজ সিকিউরিটি প্যাটার্নগুলো বাস্তবায়ন করুন
6. **প্রোডাকশনে স্কেল করুন**: মাল্টি-রিজিয়ন এবং হাই-অ্যাভাইলেবিলিটি ফিচার যোগ করুন

## 🎯 হ্যান্ডস-অন অনুশীলন

### অনুশীলন ১: Microsoft Foundry Models চ্যাট অ্যাপ ডিপ্লয় করুন (৩০ মিনিট)
**লক্ষ্য**: একটি প্রোডাকশন-রেডি AI চ্যাট অ্যাপ্লিকেশন ডিপ্লয় এবং পরীক্ষা করা

```bash
# টেমপ্লেট ইনিশিয়ালাইজ করুন
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# পরিবেশ ভেরিয়েবল সেট করুন
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ডিপ্লয় করুন
azd up

# অ্যাপ্লিকেশন পরীক্ষা করুন
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# এআই অপারেশনগুলো পর্যবেক্ষণ করুন
azd monitor

# পরিষ্কার করুন
azd down --force --purge
```

**সাফল্য মানদণ্ড:**
- [ ] ডেপ্লয়মেন্ট কোটা ত্রুটি ছাড়াই সম্পন্ন হয়
- [ ] ব্রাউজারে চ্যাট ইন্টারফেসে অ্যাক্সেস করতে পারে
- [ ] প্রশ্ন করতে পারে এবং AI-চালিত উত্তর পেতে পারে
- [ ] Application Insights টেলিমেট্রি ডেটা দেখায়
- [ ] সম্পদগুলো সফলভাবে ক্লিনআপ করা হয়েছে

**আনুমানিক খরচ**: $5-10 ৩০ মিনিটের পরীক্ষার জন্য

### অনুশীলন ২: মাল্টি-মডেল ডেপ্লয়মেন্ট কনফিগার করুন (৪৫ মিনিট)
**লক্ষ্য**: বিভিন্ন কনফিগারেশনে একাধিক AI মডেল ডিপ্লয় করা

```bash
# কাস্টম Bicep কনফিগারেশন তৈরি করুন
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
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# ডিপ্লয় করুন এবং যাচাই করুন
azd provision
azd show
```

**সাফল্য মানদণ্ড:**
- [ ] একাধিক মডেল সফলভাবে ডিপ্লয় হয়েছে
- [ ] বিভিন্ন ক্যাপাসিটি সেটিংস প্রয়োগ হয়েছে
- [ ] মডেলগুলো API এর মাধ্যমে অ্যাক্সেসযোগ্য
- [ ] অ্যাপ্লিকেশন থেকে উভয় মডেল কল করা যায়

### অনুশীলন ৩: খরচ মনিটরিং বাস্তবায়ন করুন (২০ মিনিট)
**লক্ষ্য**: বাজেট অ্যালার্ট এবং খরচ ট্র্যাকিং সেটআপ করা

```bash
# Bicep-এ বাজেট সতর্কতা যোগ করুন
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

# বাজেট সতর্কতা ডিপ্লয় করুন
azd provision

# বর্তমান খরচ যাচাই করুন
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**সাফল্য মানদণ্ড:**
- [ ] Azure-এ বাজেট অ্যালার্ট তৈরি হয়েছে
- [ ] ইমেইল নোটিফিকেশন কনফিগার করা হয়েছে
- [ ] Azure পোর্টালে খরচ ডেটা দেখা যায়
- [ ] বাজেট থ্রেশহোল্ডগুলি উপযুক্তভাবে নির্ধারণ করা হয়েছে

## 💡 প্রায়শই জিজ্ঞাসিত প্রশ্ন

<details>
<summary><strong>উন্নয়নের সময় Microsoft Foundry Models-র খরচ কিভাবে কমাবো?</strong></summary>

1. **ফ্রি টিয়ার ব্যবহার করুন**: Microsoft Foundry Models প্রতি মাসে 50,000 টোকেন ফ্রি অফার করে
2. **ক্যাপাসিটি কমান**: ডেভের জন্য 30+ এর পরিবর্তে 10 TPM সেট করুন
3. **azd down ব্যবহার করুন**: সক্রিয়ভাবে ডেভেলপ না করার সময় রিসোর্সগুলো ডিলোকেট করুন
4. **রেসপন্স ক্যাশ করুন**: পুনরাবৃত্তি কুয়েরির জন্য Redis ক্যাশ বাস্তবায়ন করুন
5. **Prompt Engineering ব্যবহার করুন**: দক্ষ প্রম্পটের মাধ্যমে টোকেন ব্যবহার কমান

```bash
# উন্নয়ন কনফিগারেশন
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models এবং OpenAI API-এর মধ্যে পার্থক্য কী?</strong></summary>

**Microsoft Foundry Models**:
- এন্টারপ্রাইজ সিকিউরিটি এবং কমপ্লায়ন্স
- প্রাইভেট নেটওয়ার্ক ইন্টিগ্রেশন
- SLA গ্যারান্টিগুলি
- Managed identity প্রমাণীকরণ
- উচ্চতর কোটা উপলব্ধ

**OpenAI API**:
- নতুন মডেলে দ্রুত অ্যাক্সেস
- সহজ কনফিগারেশন
- প্রবেশের প্রতিরোধ কম
- শুধুমাত্র পাবলিক ইন্টারনেট

প্রোডাকশন অ্যাপগুলোর জন্য, **Microsoft Foundry Models সুপারিশ করা হয়**।
</details>

<details>
<summary><strong>Microsoft Foundry মডেলের কোটা অতিক্রম ত্রুটিগুলি আমি কীভাবে মোকাবিলা করব?</strong></summary>

```bash
# বর্তমান কোটা যাচাই করুন
az cognitiveservices usage list --location eastus2

# ভিন্ন অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up

# ক্ষমতা সাময়িকভাবে কমান
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# কোটা বৃদ্ধি অনুরোধ করুন
# Azure পোর্টালে যান > কোটা > বৃদ্ধি অনুরোধ করুন
```
</details>

<details>
<summary><strong>Microsoft Foundry মডেলের সাথে কি আমি আমার নিজস্ব ডেটা ব্যবহার করতে পারি?</strong></summary>

হ্যাঁ! RAG (Retrieval Augmented Generation)-এর জন্য **Azure AI Search** ব্যবহার করুন:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>কিভাবে আমি AI মডেল এন্ডপয়েন্টগুলো নিরাপদ করব?</strong></summary>

**সেরা অনুশীলন**:
1. Managed Identity ব্যবহার করুন (কোনো API কী ব্যবহার করবেন না)
2. Private Endpoints সক্ষম করুন
3. নেটওয়ার্ক সিকিউরিটি গ্রুপ কনফিগার করুন
4. রেট লিমিটিং প্রয়োগ করুন
5. সিক্রেটগুলোর জন্য Azure Key Vault ব্যবহার করুন

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

## কমিউনিটি এবং সমর্থন

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ইস্যু ও আলোচনা](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [অফিশিয়াল ডকুমেন্টেশন](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - আপনার এডিটরে Azure + Foundry agent skills ইনস্টল করুন `npx skills add microsoft/github-copilot-for-azure` দিয়ে।

---

**অধ্যায় নেভিগেশন:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**সহায়তা দরকার?** আমাদের কমিউনিটি আলোচনায় যোগ দিন অথবা রিপোজিটরিতে একটি ইস্যু খুলুন। Azure AI + AZD কমিউনিটি আপনার সফলতা নিশ্চিত করতে সাহায্য করতে এখানে আছে!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। যদিও আমরা সঠিকতা বজায় রাখার চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিকেই অফিসিয়াল/আধিকারিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে হওয়া কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নয়।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->