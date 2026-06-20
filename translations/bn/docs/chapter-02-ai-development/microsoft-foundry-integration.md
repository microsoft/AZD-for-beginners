# Microsoft Foundry এবং AZD-র সঙ্গে ইন্টিগ্রেশন

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 2 - AI-First Development
- **⬅️ আগের অধ্যায়**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ পরবর্তী**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 পরবর্তী অধ্যায়**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## ওভারভিউ

এই গাইডটি দেখায় কীভাবে Microsoft Foundry সার্ভিসগুলোকে Azure Developer CLI (AZD) এর সাথে ইন্টিগ্রেট করে AI অ্যাপ্লিকেশনগুলি সহজে ডিপ্লয় করা যায়। Microsoft Foundry AI অ্যাপ্লিকেশন তৈরির, ডিপ্লয় করার এবং ম্যানেজ করার জন্য একটি সমন্বিত প্ল্যাটফর্ম সরবরাহ করে, এবং AZD ইন্সট্রাকচার এবং ডিপ্লয়মেন্ট প্রক্রিয়াকে সরল করে।

## Microsoft Foundry কি?

Microsoft Foundry হলো Microsoft-এর একীভূত AI উন্নয়ন প্ল্যাটফর্ম যা অন্তর্ভুক্ত করে:

- **Model Catalog**: অত্যাধুনিক AI মডেলগুলিতে প্রবেশাধিকার
- **Prompt Flow**: AI ওয়ার্কফ্লোর জন্য ভিজ্যুয়াল ডিজাইনার
- **Microsoft Foundry Portal**: AI অ্যাপ্লিকেশনের জন্য একীভূত ডেভেলপমেন্ট পরিবেশ
- **Deployment Options**: একাধিক হোস্টিং এবং স্কেলিং বিকল্প
- **Safety and Security**: বিল্ট-ইন রেসপন্সিবল AI বৈশিষ্ট্যসমূহ

## AZD + Microsoft Foundry: একসাথে আরও ভালো

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | ম্যানুয়াল পোর্টাল ডিপ্লয়মেন্ট | স্বয়ংক্রিয়, পুনরাবৃত্তি যোগ্য ডিপ্লয়মেন্ট |
| **Infrastructure** | ক্লিক-থ্রু প্রোভিশনিং | Infrastructure as Code (Bicep) |
| **Environment Management** | একক পরিবেশ ফোকাস | বহু-পরিবেশ (dev/staging/prod) |
| **CI/CD Integration** | সীমিত | নেটিভ GitHub Actions সাপোর্ট |
| **Cost Management** | বেসিক মনিটরিং | পরিবেশ-নির্দিষ্ট খরচ অপ্টিমাইজেশন |

## প্রয়োজনীয়তা

- উপযুক্ত অনুমতি সহ Azure সাবস্ক্রিপশন
- Azure Developer CLI ইনস্টল করা আছে
- Microsoft Foundry Models সার্ভিসগুলিতে অ্যাক্সেস
- Microsoft Foundry সম্পর্কে মৌলিক পরিচিতি

> **বর্তমান AZD বেসলাইন:** এই উদাহরণগুলো `azd` `1.23.12`-এর বিরুদ্ধে পর্যালোচনা করা হয়েছে। AI এজেন্ট ওয়ার্কফ্লো-এর জন্য, বর্তমান প্রিভিউ এক্সটেনশন রিলিজ ব্যবহার করুন এবং শুরু করার আগে আপনার ইনস্টল করা সংস্করণ চেক করুন।

## মূল ইন্টিগ্রেশন প্যাটার্ন

### প্যাটার্ন ১: Microsoft Foundry Models ইন্টিগ্রেশন

**ব্যবহার ক্ষেত্র**: Microsoft Foundry Models ব্যবহার করে চ্যাট অ্যাপ্লিকেশন ডিপ্লয় করা

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

### প্যাটার্ন ২: AI Search + RAG ইন্টিগ্রেশন

**ব্যবহার ক্ষেত্র**: রিট্রিভাল-অগুমেন্টেড জেনারেশন (RAG) অ্যাপ্লিকেশন ডিপ্লয় করা

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

### প্যাটার্ন ৩: ডকুমেন্ট ইনটেলিজেন্স ইন্টিগ্রেশন

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

## 🔧 কনফিগারেশন প্যাটার্নসমূহ

### পরিবেশ ভেরিয়েবল সেটআপ

**প্রোডাকশন কনফিগারেশন:**
```bash
# কোর এআই পরিষেবা
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# মডেল কনফিগারেশনসমূহ
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# পারফরম্যান্স সেটিংস
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ডেভেলপমেন্ট কনফিগারেশন:**
```bash
# উন্নয়নের জন্য ব্যয়-সাশ্রয়ী সেটিংস
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # বিনামূল্যের স্তর
```

### Key Vault দিয়ে সিকিউর কনফিগারেশন

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

### Foundry-এর জন্য AZD এক্সটেনশনসমূহ

AZD এমন এক্সটেনশন সরবরাহ করে যা Microsoft Foundry সার্ভিসগুলোর সাথে কাজ করার জন্য AI-নির্দিষ্ট ক্ষমতা যোগ করে:

```bash
# Foundry agents এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.agents

# fine-tuning এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.finetune

# কাস্টম মডেল এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.models

# ইনস্টল করা এক্সটেনশনগুলো তালিকাভুক্ত করুন
azd extension list --installed

# বর্তমানে ইনস্টল করা এজেন্ট এক্সটেনশনের সংস্করণ পরীক্ষা করুন
azd extension show azure.ai.agents
```

AI এক্সটেনশনগুলো এখনো প্রিভিউতে দ্রুত পরিবর্তনশীল। যদি কোনো কমান্ড এখানে দেখানো অনুযায়ী আচরণ না করে, প্রকল্প নিজেই ট্রাবলশুট করার আগে সংশ্লিষ্ট এক্সটেনশনটি আপগ্রেড করুন।

### `azd ai` দিয়ে এজেন্ট-ফার্স্ট ডিপ্লয়মেন্ট

যদি আপনার কাছে একটি এজেন্ট ম্যানিফেস্ট থাকে, তাহলে Foundry Agent Service-এ সংযুক্ত একটি প্রজেক্ট স্ক্যাফল্ড করার জন্য `azd ai agent init` ব্যবহার করুন:

```bash
# একটি এজেন্ট ম্যানিফেস্ট থেকে ইনিশিয়ালাইজ করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure-এ স্থাপন করুন
azd up
```

`azure.ai.agents` এর সাম্প্রতিক প্রিভিউ রিলিজগুলো `azd ai agent init`-এর জন্য টেমপ্লেট-বেসড ইনিশিয়ালাইজেশন সাপোর্টও যুক্ত করেছে। আপনি যদি নতুন এজেন্ট স্যাম্পলগুলো অনুসরণ করছেন, আপনার ইনস্টল করা সংস্করণে ঠিক কোন ফ্ল্যাগগুলো উপলব্ধ আছে তা এক্সটেনশন হেল্পে দেখুন।

পূর্ণ কমান্ড রেফারেন্স এবং ফ্ল্যাগগুলির জন্য দেখুন [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)।

### একক কমান্ড ডিপ্লয়মেন্ট

```bash
# একটি কমান্ডেই সবকিছু ডিপ্লয় করুন
azd up

# অথবা ধাপে ধাপে ডিপ্লয় করুন
azd provision  # শুধুমাত্র অবকাঠামো
azd deploy     # শুধুমাত্র অ্যাপ্লিকেশন

# azd 1.23.11+ এ দীর্ঘকাল চলমান AI অ্যাপ ডিপ্লয়মেন্টের জন্য
azd deploy --timeout 1800
```

### পরিবেশ-নির্দিষ্ট ডিপ্লয়মেন্ট

```bash
# উন্নয়ন পরিবেশ
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# প্রোডাকশন পরিবেশ
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## মনিটরিং এবং অবজার্ভেবিলিটি

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

## 🔐 নিরাপত্তা শ্রেষ্ঠ অনুশীলন

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

### নেটওয়ার্ক নিরাপত্তা

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

### ক্যাশিং কৌশলসমূহ

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

### সমস্যা 1: OpenAI কোটা অতিক্রম

**লক্ষণসমূহ:**
- কোটা ত্রুটির কারণে ডিপ্লয়মেন্ট ব্যর্থ হচ্ছে
- অ্যাপ্লিকেশন লগে 429 ত্রুটি

**সমাধানসমূহ:**
```bash
# বর্তমান কোটার ব্যবহার পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# ভিন্ন অঞ্চল ব্যবহার করে দেখুন
azd env set AZURE_LOCATION westus2
azd up

# অস্থায়ীভাবে ক্ষমতা কমান
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### সমস্যা 2: প্রমাণীকরণ ব্যর্থতা

**লক্ষণসমূহ:**
- AI সার্ভিস কল করার সময় 401/403 ত্রুটি
- "Access denied" বার্তা

**সমাধানসমূহ:**
```bash
# ভূমিকা বরাদ্দ যাচাই করুন
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ম্যানেজড আইডেন্টিটি কনফিগারেশন পরীক্ষা করুন
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault অ্যাক্সেস যাচাই করুন
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### সমস্যা 3: মডেল ডিপ্লয়মেন্ট সমস্যা

**লক্ষণসমূহ:**
- ডিপ্লয়মেন্টে মডেল উপলব্ধ নয়
- নির্দিষ্ট মডেল ভার্সন ফেইল হচ্ছে

**সমাধানসমূহ:**
```bash
# অঞ্চলভিত্তিক উপলব্ধ মডেলের তালিকা
az cognitiveservices model list --location eastus

# bicep টেমপ্লেটে মডেলের সংস্করণ আপডেট করুন
# মডেলের ক্ষমতার প্রয়োজনীয়তা পরীক্ষা করুন
```

## উদাহরণ টেমপ্লেটসমূহ

### RAG চ্যাট অ্যাপ্লিকেশন (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**বর্ণনা**: সবচেয়ে জনপ্রিয় Azure AI স্যাম্পল — একটি প্রোডাকশন-রেডি RAG চ্যাট অ্যাপ যা আপনাকে আপনার নিজের ডকুমেন্টগুলোর ওপর প্রশ্ন করতে দেয়। চ্যাটের জন্য GPT-4.1-mini, এমবেডিংস-এর জন্য text-embedding-3-large এবং রিট্রিভালের জন্য Azure AI Search ব্যবহার করে। মাল্টিমোডাল ডকুমেন্ট, স্পিচ ইনপুট/আউটপুট, Microsoft Entra প্রমাণীকরণ, এবং Application Insights ট্রেসিং সাপোর্ট করে।

**কুইক স্টার্ট**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG চ্যাট অ্যাপ্লিকেশন (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**বর্ণনা**: Python RAG চ্যাট স্যাম্পলের .NET/C# সমতুল্য। ASP.NET Core Minimal API এবং Blazor WebAssembly ফ্রন্টএন্ড দিয়ে নির্মিত। ভয়েস চ্যাট, GPT-4o-mini ভিশন সাপোর্ট, এবং একটি সহযোগী .NET MAUI Blazor হাইব্রিড ডেস্কটপ/মোবাইল ক্লায়েন্ট অন্তর্ভুক্ত।

**কুইক স্টার্ট**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG চ্যাট অ্যাপ্লিকেশন (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**বর্ণনা**: Langchain4J ব্যবহার করে AI অর্কেসট্রেশনের জন্য Java সংস্করণ। মাইক্রোসার্ভিস ইভেন্ট-ড্রিভেন আর্কিটেকচার, একাধিক সার্চ কৌশল (টেক্সট, ভেক্টর, হাইব্রিড), Azure Document Intelligence দিয়ে ডকুমেন্ট আপলোড, এবং Azure Container Apps বা Azure Kubernetes Service-এ ডিপ্লয়মেন্ট সাপোর্ট করে।

**কুইক স্টার্ট**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**বর্ণনা**: Microsoft Foundry এবং Prompty ব্যবহার করে একটি end-to-end রিটেইল RAG কপাইলট। Contoso Outdoor রিটেইলার চ্যাটবট যা প্রোডাক্ট ক্যাটালগ এবং কাস্টমার অর্ডার ডেটার ভিত্তিতে উত্তর জেনারেট করে। সম্পূর্ণ GenAIOps ওয়ার্কফ্লো প্রদর্শন করে — Prompty দিয়ে প্রোটোটাইপ, AI-সহায়িত ইভ্যালুয়েটর দিয়ে মূল্যায়ন, এবং AZD এর মাধ্যমে Container Apps-এ ডিপ্লয়।

**কুইক স্টার্ট**:
```bash
azd init --template contoso-chat
azd up
```

### ক্রিয়েটিভ রাইটিং মাল্টি-এজেন্ট অ্যাপ্লিকেশন

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**বর্ণনা**: Prompty দিয়ে AI এজেন্ট অর্কেসট্রেশন প্রদর্শনকারী মাল্টি-এজেন্ট স্যাম্পল। একটি রিসার্চ এজেন্ট (Bing Grounding in Azure AI Agent Service), একটি প্রোডাক্ট এজেন্ট (Azure AI Search), একটি লেখক এজেন্ট, এবং একটি সম্পাদক এজেন্ট একযোগে গবেষণাভিত্তিক আর্টিকেল তৈরি করে। GitHub Actions-এ ইভ্যালুয়েশনসহ CI/CD অন্তর্ভুক্ত।

**কুইক স্টার্ট**:
```bash
azd init --template contoso-creative-writer
azd up
```

### সার্ভারলেস RAG চ্যাট (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**বর্ণনা**: LangChain.js ব্যবহার করে সম্পূর্ণ সার্ভারলেস RAG চ্যাটবট, API-র জন্য Azure Functions এবং হোস্টিং-এর জন্য Azure Static Web Apps সহ। ভেক্টর স্টোর এবং চ্যাট হিস্টোরি ডাটাবেস হিসাবে Azure Cosmos DB ব্যবহার করে। জিরো-কস্ট টেস্টিংয়ের জন্য লোকাল ডেভেলপমেন্টে Ollama সাপোর্ট করে।

**কুইক স্টার্ট**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**বর্ণনা**: এন্টারপ্রাইজ-গ্রেড RAG সলিউশন অ্যাক্সিলারেটর যা ডকুমেন্ট আপলোড/ম্যানেজমেন্টের জন্য অ্যাডমিন পোর্টাল, একাধিক অর্কেস্ট্রেটর অপশন (Semantic Kernel, LangChain, Prompt Flow), স্পিচ-টু-টেক্সট, Microsoft Teams ইন্টিগ্রেশন, এবং PostgreSQL বা Cosmos DB ব্যাকেন্ড বেছে নেওয়ার সুবিধা দেয়। প্রোডাকশন RAG পরিস্থিতির জন্য কাস্টমাইজযোগ্য শুরু পয়েন্ট হিসেবে ডিজাইন করা হয়েছে।

**কুইক স্টার্ট**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ট্র্যাভেল এজেন্টস — মাল্টি-এজেন্ট MCP অর্কেসট্রেশন

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**বর্ণনা**: তিনটি ফ্রেমওয়ার্ক (LangChain.js, LlamaIndex.TS, এবং Microsoft Agent Framework) ব্যবহার করে মাল্টি-এজেন্ট AI অর্কেসট্রেশনের রেফারেন্স অ্যাপ্লিকেশন। চারের ভাষায় MCP (Model Context Protocol) সার্ভারগুলো সার্ভারলেস Azure Container Apps হিসেবে ডিপ্লয় করা হয়েছে এবং OpenTelemetry মনিটরিং ফিচার রয়েছে।

**কুইক স্টার্ট**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**বর্ণনা**: একটি মাইনিমাল Bicep টেমপ্লেট যা কনফিগারড মেশিন লার্নিং মডেল সহ Azure AI সার্ভিসগুলো ডিপ্লয় করে। যখন আপনি শুধুমাত্র Azure AI ইনফ্রাস্ট্রাকচার প্রোভিশন করতে চান এবং পুরো অ্যাপ্লিকেশন স্ট্যাকের প্রয়োজন নেই, তখন এটি একটি হালকা শুরু পয়েন্ট।

**কুইক স্টার্ট**:
```bash
azd init --template azd-ai-starter
azd up
```

> **আরও টেমপ্লেট ব্রাউজ করুন**: 80+ AI-নির্দিষ্ট AZD টেমপ্লেট ভাষা ও সিনারিও অনুসারে দেখতে ভিজিট করুন [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai)।

## পরবর্তী ধাপ

1. **উদাহরণগুলো চেষ্টা করুন**: আপনার ব্যবহার ক্ষেত্রে মিলছে এমন প্রি-বিল্ট টেমপ্লেট দিয়ে শুরু করুন
2. **আপনার চাহিদা অনুযায়ী কাস্টমাইজ করুন**: ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন কোড পরিবর্তন করুন
3. **মনিটরিং যোগ করুন**: ব্যাপক অবজার্ভেবিলিটি বাস্তবায়ন করুন
4. **খরচ অপ্টিমাইজ করুন**: আপনার বাজেট অনুযায়ী কনফিগারেশন ফাইন-টিউন করুন
5. **আপনার ডিপ্লয়মেন্ট সিকিউর করুন**: এন্টারপ্রাইজ নিরাপত্তা প্যাটার্ন বাস্তবায়ন করুন
6. **প্রোডাকশনের জন্য স্কেল করুন**: মাল্টি-রিজিওন এবং উচ্চ-উপলভ্যতা বৈশিষ্ট্য যোগ করুন

## 🎯 হ্যান্ডস-অন এক্সারসাইজ

### এক্সারসাইজ 1: Microsoft Foundry Models চ্যাট অ্যাপ ডিপ্লয় (30 মিনিট)
**লক্ষ্য**: একটি প্রোডাকশন-রেডি AI চ্যাট অ্যাপ্লিকেশন ডিপ্লয় ও টেস্ট করা

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

# এআই কার্যক্রম পর্যবেক্ষণ করুন
azd monitor

# পরিষ্কার করুন
azd down --force --purge
```

**সাফল্য ক্রাইটেরিয়া:**
- [ ] ডিপ্লয়মেন্ট কোটা ত্রুটির ছাড়া সম্পন্ন হয়
- [ ] ব্রাউজারে চ্যাট ইন্টারফেসে অ্যাক্সেস করা যায়
- [ ] প্রশ্ন করা যায় এবং AI-চালিত উত্তর পাওয়া যায়
- [ ] Application Insights টেলিমেট্রি ডেটা দেখায়
- [ ] রিসোর্স সফলভাবে ক্লিন আপ করা হয়েছে

**আনুমানিক খরচ**: 30 মিনিট টেস্টিংয়ের জন্য $5-10

### এক্সারসাইজ 2: মাল্টি-মডেল ডিপ্লয়মেন্ট কনফিগার করা (45 মিনিট)
**লক্ষ্য**: বিভিন্ন কনফিগারেশনসহ একাধিক AI মডেল ডিপ্লয় করা

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

# ডিপ্লয় করুন এবং যাচাই করুন
azd provision
azd show
```

**সাফল্য ক্রাইটেরিয়া:**
- [ ] একাধিক মডেল সফলভাবে ডিপ্লয় করা হয়েছে
- [ ] বিভিন্ন ক্যাপাসিটি সেটিং প্রয়োগ করা হয়েছে
- [ ] মডেলগুলো API-র মাধ্যমে অ্যাক্সেসযোগ্য
- [ ] অ্যাপ্লিকেশন থেকে উভয় মডেল কল করা যায়

### এক্সারসাইজ 3: খরচ মনিটরিং বাস্তবায়ন (20 মিনিট)
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

# বাজেট সতর্কতা মোতায়েন করুন
azd provision

# বর্তমান খরচ পরীক্ষা করুন
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**সাফল্য ক্রাইটেরিয়া:**
- [ ] Azure-এ বাজেট অ্যালার্ট তৈরি করা হয়েছে
- [ ] ইমেইল নোটিফিকেশন কনফিগার করা হয়েছে
- [ ] Azure পোর্টালে খরচ ডেটা দেখা যায়
- [ ] বাজেট থ্রেশহোল্ড উপযুক্তভাবে সেট করা হয়েছে

## 💡 প্রায়শই জিজ্ঞাস্য

<details>
<summary><strong>ডেভেলপমেন্ট চলাকালীন Microsoft Foundry Models-এর খরচ কীভাবে কমাবো?</strong></summary>

1. **ফ্রি টিয়ার ব্যবহার করুন**: Microsoft Foundry Models 50,000 টোকেন/মাস ফ্রি অফার করে
2. **ক্যাপাসিটি কমান**: ডেভের জন্য 30+ এর বদলে 10 TPM সেট করুন
3. **azd down ব্যবহার করুন**: সক্রিয়ভাবে ডেভেলপ না করার সময় রিসোর্স ডিলোকেট করুন
4. **রেসপন্স ক্যাশ করুন**: পুনরাবৃত্ত প্রশ্নগুলোর জন্য Redis ক্যাশ ব্যবহার করুন
5. **Prompt Engineering ব্যবহার করুন**: দক্ষ প্রম্পট ব্যবহার করে টোকেন ব্যবহার কমান


```bash
# উন্নয়ন কনফিগারেশন
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models এবং OpenAI API-এর মধ্যে পার্থক্য কী?</strong></summary>

**Microsoft Foundry Models**:
- এন্টারপ্রাইজ নিরাপত্তা এবং কমপ্লায়েন্স
- প্রাইভেট নেটওয়ার্ক একীকরণ
- SLA নিশ্চয়তা
- Managed Identity প্রমাণীকরণ
- উচ্চতর কোটা উপলব্ধ

**OpenAI API**:
- নতুন মডেলগুলিতে দ্রুত অ্যাক্সেস
- সহজ সেটআপ
- প্রবেশের বাধা কম
- শুধুমাত্র পাবলিক ইন্টারনেট

প্রোডাকশন অ্যাপগুলির জন্য, **Microsoft Foundry Models সুপারিশ করা হয়**।
</details>

<details>
<summary><strong>Microsoft Foundry Models-এর কোটা অতিক্রম সংক্রান্ত ত্রুটি কীভাবে পরিচালনা করব?</strong></summary>

```bash
# বর্তমান কোটা পরীক্ষা করুন
az cognitiveservices usage list --location eastus2

# ভিন্ন অঞ্চলে চেষ্টা করে দেখুন
azd env set AZURE_LOCATION westus2
azd up

# অস্থায়ীভাবে ক্ষমতা কমান
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# কোটা বৃদ্ধির অনুরোধ করুন
# Azure Portal > কোটা > বৃদ্ধির অনুরোধ পৃষ্ঠায় যান
```
</details>

<details>
<summary><strong>আমি কি Microsoft Foundry Models-এর সঙ্গে আমার নিজস্ব ডেটা ব্যবহার করতে পারি?</strong></summary>

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

টেমপ্লেটটি দেখুন: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)।
</details>

<details>
<summary><strong>আমি কীভাবে AI মডেল এন্ডপয়েন্টগুলো সুরক্ষিত করব?</strong></summary>

**সেরা অনুশীলনসমূহ**:
1. Managed Identity ব্যবহার করুন (API কী নয়)
2. Private Endpoints সক্রিয় করুন
3. নেটওয়ার্ক সিকিউরিটি গ্রুপ কনফিগার করুন
4. রেট লিমিটিং প্রয়োগ করুন
5. গোপন তথ্য সংরক্ষণের জন্য Azure Key Vault ব্যবহার করুন

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

## Community and Support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ইস্যু এবং আলোচনা](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [অফিশিয়াল ডকুমেন্টেশন](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - আপনার এডিটরে Azure + Foundry agent skills ইনস্টল করতে `npx skills add microsoft/github-copilot-for-azure` ব্যবহার করুন

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: Chapter 2 - AI-First Development
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় 1: আপনার প্রথম প্রকল্প](../chapter-01-foundation/first-project.md)
- **➡️ পরবর্তী**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় 3: কনফিগারেশন](../chapter-03-configuration/configuration.md)

**সহায়তা দরকার?** আমাদের কমিউনিটি আলোচনায় যোগ দিন অথবা রিপোজিটরিতে একটি ইস্যু খুলুন। Azure AI + AZD কমিউনিটি আপনাকে সফল হতে সাহায্য করার জন্য এখানে আছে!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->