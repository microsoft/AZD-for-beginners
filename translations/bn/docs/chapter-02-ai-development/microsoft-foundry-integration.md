# Microsoft Foundry ইন্টিগ্রেশন উইথ AZD

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার ২ - AI-ফার্স্ট ডেভেলপমেন্ট
- **⬅️ পূর্ববর্তী চ্যাপ্টার**: [চ্যাপ্টার ১: আপনার প্রথম প্রকল্প](../chapter-01-foundation/first-project.md)
- **➡️ পরবর্তী**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [চ্যাপ্টার ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

## অবলোকন

এই গাইডটি দেখায় কিভাবে Microsoft Foundry সার্ভিসসমূহকে Azure Developer CLI (AZD) এর সাথে ইন্টিগ্রেট করে AI অ্যাপ্লিকেশন ডিপ্লয়মেন্টকে সহজ করা যায়। Microsoft Foundry AI অ্যাপ্লিকেশন গঠনের, ডিপ্লয়মেন্ট এবং ম্যানেজমেন্টের জন্য একটি সমন্বিত প্ল্যাটফর্ম প্রদান করে, আর AZD অবকাঠামো ও ডিপ্লয়মেন্ট প্রক্রিয়াকে সরল করে।

## Microsoft Foundry কী?

Microsoft Foundry হল Microsoft-এর AI ডেভেলপমেন্টের জন্য একক প্ল্যাটফর্ম যা অন্তর্ভুক্ত:

- **মডেল ক্যাটালগ**: সর্বাধুনিক AI মডেলে অ্যাক্সেস
- **Prompt Flow**: AI ওয়ার্কফ্লোর জন্য ভিজ্যুয়াল ডিজাইনার
- **Microsoft Foundry পোর্টাল**: AI অ্যাপ্লিকেশনের জন্য সমন্বিত ডেভেলপমেন্ট পরিবেশ
- **ডিপ্লয়মেন্ট অপশনসমূহ**: একাধিক হোস্টিং ও স্কেলিং অপশন
- **নিরাপত্তা ও সুরক্ষা**: অন্তর্নির্মিত দায়িত্বশীল AI ফিচারসমূহ

## AZD + Microsoft Foundry: একসাথে উন্নত

| বৈশিষ্ট্য | Microsoft Foundry | AZD ইন্টিগ্রেশন সুবিধা |
|---------|-----------------|------------------------|
| **মডেল ডিপ্লয়মেন্ট** | ম্যানুয়াল পোর্টাল ডিপ্লয়মেন্ট | স্বয়ংক্রিয়, পুনরাবৃত্তি যোগ্য ডিপ্লয়মেন্ট |
| **ইনফ্রাস্ট্রাকচার** | ক্লিক-থ্রু প্রোভিশনিং | পরিকাঠামো কোড হিসেবে (Bicep) |
| **এনভায়রনমেন্ট ম্যানেজমেন্ট** | একক এনভায়রনমেন্ট ফোকাস | বহুমাত্রিক এনভায়রনমেন্ট (ডেভ/স্টেজিং/প্রোড) |
| **CI/CD ইন্টিগ্রেশন** | সীমিত | নেটিভ গিটহাব অ্যাকশনস সাপোর্ট |
| **খরচ ব্যবস্থাপনা** | মৌলিক পর্যবেক্ষণ | এনভায়রনমেন্ট-নির্দিষ্ট খরচ অপ্টিমাইজেশন |

## পূর্বশর্তসমূহ

- যথাযথ অনুমোদনসহ Azure সাবস্ক্রিপশন
- Azure Developer CLI ইনস্টল করা
- Microsoft Foundry মডেল সার্ভিসসমূহে অ্যাক্সেস
- Microsoft Foundry সম্পর্কে মৌলিক জ্ঞান

> **বর্তমান AZD বেসলাইন:** এই উদাহরণসমূহ `azd` `1.23.12` এর বিপরীতে পর্যালোচনা করা হয়েছে। AI এজেন্ট ওয়ার্কফ্লোর জন্য, বর্তমান প্রিভিউ এক্সটেনশন রিলিজ ব্যবহার করুন এবং আপনার ইনস্টল সংস্করণটি শুরু করার আগে যাচাই করুন।

## মূল ইন্টিগ্রেশন প্যাটার্নসমূহ

### প্যাটার্ন ১: Microsoft Foundry মডেল ইন্টিগ্রেশন

**ব্যবহার ক্ষেত্র**: Microsoft Foundry মডেল ব্যবহার করে চ্যাট অ্যাপ্লিকেশন ডিপ্লয় করুন

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

### প্যাটার্ন ২: AI সার্চ + RAG ইন্টিগ্রেশন

**ব্যবহার ক্ষেত্র**: রিট্রিভাল-অগমেন্টেড জেনারেশন (RAG) অ্যাপ্লিকেশন ডিপ্লয়মেন্ট

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

**ব্যবহার ক্ষেত্র**: ডকুমেন্ট প্রসেসিং ও বিশ্লেষণ ওয়ার্কফ্লো

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

### এনভায়রনমেন্ট ভেরিয়েবল সেটআপ

**প্রোডাকশন কনফিগারেশন:**
```bash
# মূল এআই পরিষেবাগুলি
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# মডেল কনফিগারেশনগুলি
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# কর্মক্ষমতা সেটিংস
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ডেভেলপমেন্ট কনফিগারেশন:**
```bash
# উন্নয়নের জন্য খরচ-সাশ্রয়ী সেটিংস
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ফ্রি টিয়ার
```

### কী ভল্টের মাধ্যমে সুরক্ষিত কনফিগারেশন

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

### Foundry এর জন্য AZD এক্সটেনশনসমূহ

AZD পাওয়ার এক্সটেনশনসমূহ, যা Microsoft Foundry সার্ভিসগুলোর সাথে কাজ করার জন্য AI-নির্দিষ্ট সক্ষমতা যুক্ত করে:

```bash
# Foundry এজেন্ট এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.agents

# ফাইন-টিউনিং এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.finetune

# কাস্টম মডেল এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.models

# ইনস্টল করা এক্সটেনশনসমূহ তালিকা করুন
azd extension list --installed

# বর্তমানে ইনস্টলকৃত এজেন্ট এক্সটেনশন সংস্করণ পরীক্ষা করুন
azd extension show azure.ai.agents
```

AI এক্সটেনশনসমূহ প্রিভিউতে দ্রুত পরিবর্তিত হচ্ছে। যদি কোন কমান্ড এখানে প্রদর্শিত থেকে আলাদা আচরণ করে, তাহলে প্রোজেক্ট নিজেই ট্রাবলশুট করার আগে প্রাসঙ্গিক এক্সটেনশন আপগ্রেড করুন।

### `azd ai` দিয়ে এজেন্ট-ফার্স্ট ডিপ্লয়মেন্ট

যদি আপনার কাছে এজেন্ট ম্যানিফেস্ট থাকে, `azd ai agent init` ব্যবহার করে Foundry Agent সার্ভিসের সাথে যুক্ত একটি প্রোজেক্ট স্ক্যাফোল্ড করুন:

```bash
# একটি এজেন্ট ম্যানিফেস্ট থেকে ইনিশিয়ালাইজ করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure এ মোতায়েন করুন
azd up
```

সাম্প্রতিক প্রিভিউ রিলিজ `azure.ai.agents` `azd ai agent init` এর জন্য টেমপ্লেট-ভিত্তিক ইনিশিয়ালাইজেশন সাপোর্ট যোগ করেছে। আপনি যদি নতুন এজেন্ট স্যাম্পল ব্যবহার করেন, ইনস্টল করা সংস্করণের মধ্যে উপলব্ধ সঠিক ফ্ল্যাগগুলো চেক করুন।

সম্পূর্ণ কমান্ড রেফারেন্স ও ফ্ল্যাগের জন্য দেখুন [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)।

### একক কমান্ড ডিপ্লয়মেন্ট

```bash
# একটি কমান্ড দিয়ে সবকিছু ডিপ্লয় করুন
azd up

# অথবা ধাপে ধাপে ডিপ্লয় করুন
azd provision  # কেবল অবকাঠামো
azd deploy     # কেবল অ্যাপ্লিকেশন

# azd 1.23.11+ এ দীর্ঘমেয়াদী AI অ্যাপ ডিপ্লয়মেন্টের জন্য
azd deploy --timeout 1800
```

### এনভায়রনমেন্ট-নির্দিষ্ট ডিপ্লয়মেন্ট

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

## 🔐 সুরক্ষার সেরা অনুশীলনসমূহ

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

## কর্মদক্ষতা অপ্টিমাইজেশন

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

### স্বয়ংক্রিয় স্কেলিং কনফিগারেশন

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

**লক্ষণসমূহ:**
- কোটা ত্রুটির কারণে ডিপ্লয়মেন্ট ব্যর্থ হয়
- অ্যাপ্লিকেশন লগে 429 ত্রুটি

**সমাধানসমূহ:**
```bash
# বর্তমান কোটা ব্যবহারের পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# ভিন্ন অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up

# সাময়িকভাবে ক্ষমতা হ্রাস করুন
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### সমস্যা ২: প্রমাণীকরণ ব্যর্থতা

**লক্ষণসমূহ:**
- AI সার্ভিস কল করার সময় 401/403 ত্রুটি
- "অ্যাক্সেস অস্বীকৃত" মেসেজ

**সমাধানসমূহ:**
```bash
# ভূমিকা বরাদ্দ যাচাই করুন
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# পরিচালিত পরিচয়ের কনফিগারেশন পরীক্ষা করুন
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# কী ভল্ট অ্যাক্সেস যাচাই করুন
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### সমস্যা ৩: মডেল ডিপ্লয়মেন্ট সমস্যা

**লক্ষণসমূহ:**
- মডেল ডিপ্লয়মেন্টে উপলব্ধ নয়
- নির্দিষ্ট মডেল সংস্করণ ব্যর্থ হয়

**সমাধানসমূহ:**
```bash
# অঞ্চল অনুযায়ী উপলব্ধ মডেল সমূহ তালিকাভুক্ত করুন
az cognitiveservices model list --location eastus

# বাইসেপ টেমপ্লেটে মডেল সংস্করণ আপডেট করুন
# মডেলের ধারণক্ষমতা চাহিদা পরীক্ষা করুন
```

## উদাহরণ টেমপ্লেটসমূহ

### RAG চ্যাট অ্যাপ্লিকেশন (Python)

**রিপোজিটরি**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**বর্ণনা**: সবচেয়ে জনপ্রিয় Azure AI স্যাম্পল — একটি প্রোডাকশন-রেডি RAG চ্যাট অ্যাপ যা আপনাকে নিজের ডকুমেন্ট নিয়ে প্রশ্ন করতে দেয়। GPT-4.1-mini চ্যাটের জন্য, text-embedding-3-large এমবেডিং-এর জন্য এবং Azure AI Search রিট্রিভালের জন্য ব্যবহার করে। মাল্টিমোডাল ডকুমেন্ট, স্পিচ ইনপুট/আউটপুট, Microsoft Entra প্রমাণীকরণ এবং অ্যাপ্লিকেশন ইনসাইটস ট্রেসিং সাপোর্ট করে।

**দ্রুত শুরু:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG চ্যাট অ্যাপ্লিকেশন (.NET)

**রিপোজিটরি**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**বর্ণনা**: পাইটন RAG চ্যাট স্যাম্পলের .NET/C# সংস্করণ। ASP.NET Core Minimal API এবং Blazor WebAssembly ফ্রন্টেন্ডসহ নির্মিত। ভয়েস চ্যাট, GPT-4o-mini ভিশন সাপোর্ট, এবং একটি কম্পেনিয়ন .NET MAUI Blazor হাইব্রিড ডেস্কটপ/মোবাইল ক্লায়েন্ট অন্তর্ভুক্ত।

**দ্রুত শুরু:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG চ্যাট অ্যাপ্লিকেশন (Java)

**রিপোজিটরি**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**বর্ণনা**: Java সংস্করণ RAG চ্যাট স্যাম্পল যা Langchain4J ব্যবহার করে AI অর্কেস্ট্রেশনের জন্য। মাইক্রোসার্ভিস ইভেন্ট-চালিত আর্কিটেকচার, একাধিক সার্চ কৌশল (টেক্সট, ভেক্টর, হাইব্রিড), Azure Document Intelligence সহ ডকুমেন্ট আপলোড, এবং Azure Container Apps অথবা Azure Kubernetes Service এ ডিপ্লয়মেন্ট সাপোর্ট করে।

**দ্রুত শুরু:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### এন্টারপ্রাইজ রিটেইল কপিলট উইথ Azure AI Foundry

**রিপোজিটরি**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**বর্ণনা**: Azure AI Foundry এবং Prompty ব্যবহার করে এন্ড-টু-এন্ড রিটেইল RAG কপিলট। একটি Contoso আউটডোর রিটেইলার চ্যাটবট, যা পণ্য ক্যাটালগ এবং গ্রাহক অর্ডার ডেটার ভিত্তিতে উত্তর প্রদান করে। পুরো GenAIOps ওয়ার্কফ্লো প্রদর্শন করে — Prompty দিয়ে প্রোটোটাইপ, AI-সহায়ক ইভ্যালুয়েটরের মাধ্যমে মূল্যায়ন, এবং AZD দিয়ে Container Apps এ ডিপ্লয়মেন্ট।

**দ্রুত শুরু:**
```bash
azd init --template contoso-chat
azd up
```

### ক্রিয়েটিভ রাইটিং মাল্টি-এজেন্ট অ্যাপ্লিকেশন

**রিপোজিটরি**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**বর্ণনা**: মাল্টি-এজেন্ট স্যাম্পল যা AI এজেন্ট অর্কেস্ট্রেশন প্রদর্শন করে Prompty সহ। একটি গবেষণা এজেন্ট (Bing Grounding in Azure AI Agent Service), একটি প্রোডাক্ট এজেন্ট (Azure AI Search), একটি রাইটার এজেন্ট, এবং একটি এডিটর এজেন্ট একত্রে গবেষণাভিত্তিক প্রবন্ধ প্রস্তুত করে। গিটহাব অ্যাকশনে মূল্যায়নসহ CI/CD অন্তর্ভুক্ত।

**দ্রুত শুরু:**
```bash
azd init --template contoso-creative-writer
azd up
```

### সার্ভারলেস RAG চ্যাট (JavaScript/TypeScript)

**রিপোজিটরি**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**সার্ভিসসমূহ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**বর্ণনা**: LangChain.js ব্যবহার করে সম্পূর্ণ সার্ভারলেস RAG চ্যাটবট, যেখানে API জন্য Azure Functions এবং হোস্টিংয়ের জন্য Azure Static Web Apps। Azure Cosmos DB ভেক্টর স্টোর এবং চ্যাট ইতিহাস ডাটাবেজ হিসেবে ব্যবহার। লোকাল ডেভেলপমেন্টে শূন্য খরচে টেস্টিংয়ের জন্য Ollama সাপোর্ট করে।

**দ্রুত শুরু:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data সলিউশন অ্যাক্সেলরেটর

**রিপোজিটরি**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**বর্ণনা**: এন্টারপ্রাইজ-গ্রেড RAG সলিউশন অ্যাক্সেলরেটর, ডকুমেন্ট আপলোড/ম্যানেজমেন্টের জন্য অ্যাডমিন পোর্টাল, একাধিক অর্কেস্ট্রেটর অপশন (Semantic Kernel, LangChain, Prompt Flow), স্পিচ-টু-টেক্সট, Microsoft Teams ইন্টিগ্রেশন এবং PostgreSQL বা Cosmos DB ব্যাকএন্ড বিকল্প। প্রোডাকশন RAG দৃশ্যপটের জন্য একটি কাস্টমাইজযোগ্য আরম্ভ বিন্দু হিসেবে ডিজাইন করা।

**দ্রুত শুরু:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ট্রাভেল এজেন্টস — মাল্টি-এজেন্ট MCP অর্কেস্ট্রেশন

**রিপোজিটরি**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**সার্ভিসসমূহ**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP সার্ভারসমূহ (.NET, Python, Java, TypeScript)

**বর্ণনা**: তিনটি ফ্রেমওয়ার্ক (LangChain.js, LlamaIndex.TS, এবং Microsoft Agent Framework) ব্যবহার করে মাল্টি-এজেন্ট AI অর্কেস্ট্রেশনের জন্য রেফারেন্স অ্যাপ্লিকেশন। MCP (Model Context Protocol) সার্ভার চারটি ভাষায় সার্ভারলেস Azure Container Apps হিসেবে ডিপ্লয়, ওপেনটেলিমেট্রি মনিটরিংসহ।

**দ্রুত শুরু:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI স্টার্টার

**রিপোজিটরি**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**সার্ভিসসমূহ**: Azure AI সার্ভিস + Azure OpenAI

**বর্ণনা**: একটি মিমিনাল Bicep টেমপ্লেট যা কনফিগারড মেশিন লার্নিং মডেলসহ Azure AI সার্ভিস ডিপ্লয় করে। যখন শুধুমাত্র Azure AI অবকাঠামো প্রোভিশন প্রয়োজন এবং সম্পূর্ণ অ্যাপ্লিকেশন স্ট্যাক নয় তখন একটি হালকা ওজনের স্টার্টিং পয়েন্ট।

**দ্রুত শুরু:**
```bash
azd init --template azd-ai-starter
azd up
```

> **আরও টেমপ্লেট ব্রাউজ করুন**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) দেখুন, যেখান থেকে ভাষা ও দৃশ্যপট অনুসারে ৮০+ AI-নির্দিষ্ট AZD টেমপ্লেট পাওয়া যাবে।

## পরবর্তী ধাপসমূহ

1. **উদাহরণগুলো চেষ্টা করুন**: আপনার ব্যবহার ক্ষেত্রের সাথে মেলে এমন প্রি-বিল্ট টেমপ্লেট দিয়ে শুরু করুন
2. **আপনার চাহিদা অনুযায়ী কাস্টমাইজ করুন**: অবকাঠামো এবং অ্যাপ্লিকেশন কোড পরিবর্তন করুন
3. **মনিটরিং যুক্ত করুন**: ব্যাপক পর্যবেক্ষণ বাস্তবায়ন করুন
4. **ব্যয় অপ্টিমাইজ করুন**: আপনার বাজেট অনুসারে কনফিগারেশন সমন্বয় করুন
5. **আপনার ডিপ্লয়মেন্ট সুরক্ষিত করুন**: এন্টারপ্রাইজ সিকিউরিটি প্যাটার্ন প্রয়োগ করুন
6. **প্রোডাকশনে স্কেল করুন**: মাল্টি-রিজিওন এবং উচ্চ-অ্যাভেলিবিলিটি ফিচার যোগ করুন

## 🎯 হাতে কলমে অনুশীলন

### অনুশীলন ১: Microsoft Foundry মডেলস চ্যাট অ্যাপ ডিপ্লয় (৩০ মিনিট)
**লক্ষ্য**: প্রোডাকশন-রেডি AI চ্যাট অ্যাপ্লিকেশন ডিপ্লয় এবং পরীক্ষা করা

```bash
# টেমপ্লেট শুরু করুন
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# পরিবেশ ভেরিয়েবল সেট করুন
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# মোতায়েন করুন
azd up

# অ্যাপ্লিকেশন পরীক্ষা করুন
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI অপারেশনগুলি পর্যবেক্ষণ করুন
azd monitor

# পরিচ্ছন্ন করুন
azd down --force --purge
```

**সফলতার মানদণ্ড:**
- [ ] কোটা ত্রুটিবিহীন ডিপ্লয়মেন্ট সম্পন্ন
- [ ] ব্রাউজারে চ্যাট ইন্টারফেস অ্যাক্সেসযোগ্য
- [ ] প্রশ্ন করতে এবং AI-চালিত উত্তর পেতে সক্ষম
- [ ] অ্যাপ্লিকেশন ইনসাইটস টেলিমেট্রি ডেটা প্রদর্শন করে
- [ ] সফলভাবে রিসোর্সগুলো পরিষ্কার করা হয়েছে

**আক্রান্ত খরচ অনুমান**: ৩০ মিনিট পরীক্ষার জন্য $৫-১০

### অনুশীলন ২: মাল্টি-মডেল ডিপ্লয়মেন্ট কনফিগার করা (৪৫ মিনিট)
**লক্ষ্য**: বিভিন্ন কনফিগারেশন সহ একাধিক AI মডেল ডিপ্লয় করা

```bash
# কাস্টম বিসেপ কনফিগারেশন তৈরি করুন
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

# ডিপ্লয় এবং যাচাই করুন
azd provision
azd show
```

**সফলতার মানদণ্ড:**
- [ ] একাধিক মডেল সফলভাবে ডিপ্লয় হয়েছে
- [ ] বিভিন্ন ক্ষমতা সেটিংস প্রয়োগ করা হয়েছে
- [ ] মডেলগুলোর API এর মাধ্যমে অ্যাক্সেস আছে
- [ ] অ্যাপ্লিকেশন থেকে দুই মডেলেই কল করা যায়

### অনুশীলন ৩: খরচ মনিটরিং বাস্তবায়ন (২০ মিনিট)
**লক্ষ্য**: বাজেট এলার্ট এবং খরচ ট্র্যাকিং সেটআপ করা

```bash
# বাজেট এলার্ট Bicep এ যোগ করুন
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

# বাজেট এলার্ট মোতায়েন করুন
azd provision

# বর্তমান খরচ পরীক্ষা করুন
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**সফলতার মানদণ্ড:**
- [ ] Azure-এ বাজেট এলার্ট তৈরি করা হয়েছে
- [ ] ইমেল নোটিফিকেশনের কনফিগারেশন সম্পন্ন
- [ ] Azure পোর্টালে খরচের ডেটা দেখা যায়
- [ ] বাজেট থ্রেশহোল্ড যথাযথভাবে নির্ধারিত

## 💡 প্রায়শই জিজ্ঞাসিত প্রশ্নসমূহ

<details>
<summary><strong>আমি কিভাবে উন্নয়নকালে Microsoft Foundry মডেলগুলোর খরচ কমাবো?</strong></summary>

1. **ফ্রি টিয়ার ব্যবহার করুন**: Microsoft Foundry মডেল প্রতি মাসে ৫০,০০০ টোকেন ফ্রি দেয়
2. **ক্ষমতা কমান**: ডেভেলপমেন্টের জন্য ৩০+ এর বদলে ১০ TPM সেট করুন
3. **azd down ব্যবহার করুন**: সক্রিয় ডেভেলপমেন্ট না করার সময়ে রিসোর্স ডিলোকেট করুন
4. **রেসপন্স ক্যাশ করুন**: পুনরাবৃত্ত প্রশ্নের জন্য Redis ক্যাশ ইমপ্লিমেন্ট করুন
5. **Prompt Engineering ব্যবহার করুন**: দক্ষ প্রম্পট দিয়ে টোকেন ব্যবহার কমান
```bash
# উন্নয়ন কনফিগারেশন
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models এবং OpenAI API এর মধ্যে পার্থক্য কী?</strong></summary>

**Microsoft Foundry Models**:
- এন্টারপ্রাইজ নিরাপত্তা এবং সম্মতি
- প্রাইভেট নেটওয়ার্ক ইন্টিগ্রেশন
- SLA গ্যারান্টি
- ম্যানেজড আইডেন্টিটি অথেনটিকেশন
- উচ্চতর কোটা উপলব্ধ

**OpenAI API**:
- নতুন মডেলগুলিতে দ্রুত প্রবেশাধিকার
- সহজ সেটআপ
- কম প্রবেশের বাধা
- শুধুমাত্র পাবলিক ইন্টারনেট

উৎপাদন অ্যাপসের জন্য, **Microsoft Foundry Models সুপারিশ করা হয়**।
</details>

<details>
<summary><strong>Microsoft Foundry Models কোটা অতিক্রম সংক্রান্ত ত্রুটিগুলো কিভাবে মোকাবেলা করব?</strong></summary>

```bash
# বর্তমান কোটা চেক করুন
az cognitiveservices usage list --location eastus2

# ভিন্ন অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up

# অস্থায়ীভাবে ক্ষমতা কমান
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# কোটা বৃদ্ধির অনুরোধ করুন
# Azure পোর্টালে যান > কোটাসমূহ > বৃদ্ধির অনুরোধ করুন
```
</details>

<details>
<summary><strong>Microsoft Foundry Models এর সাথে আমি কি নিজের ডেটা ব্যবহার করতে পারি?</strong></summary>

হ্যাঁ! RAG (Retrieval Augmented Generation) এর জন্য **Azure AI Search** ব্যবহার করুন:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) টেমপ্লেটটি দেখুন।
</details>

<details>
<summary><strong>আমি কিভাবে AI মডেল এন্ডপয়েন্টগুলোকে সুরক্ষিত করব?</strong></summary>

**সেরা অনুশীলনসমূহ**:
1. Managed Identity ব্যবহার করুন (কোন API কী নয়)
2. প্রাইভেট এন্ডপয়েন্ট সক্ষম করুন
3. নেটওয়ার্ক সিকিউরিটি গ্রুপ কনফিগার করুন
4. রেট লিমিটিং বাস্তবায়ন করুন
5. সিক্রেটসের জন্য Azure Key Vault ব্যবহার করুন

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

## কমিউনিটি এবং সহায়তা

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [মুদ্দা এবং আলোচনাসমূহ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [সরকারি ডকুমেন্টেশন](https://learn.microsoft.com/azure/ai-studio/)
- **এজেন্ট স্কিলস**: [skills.sh এ Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - আপনার এডিটরে Azure + Foundry এজেন্ট স্কিল ইন্সটল করতে `npx skills add microsoft/github-copilot-for-azure` ব্যবহার করুন

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-প্রথম উন্নয়ন
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় ১: আপনার প্রথম প্রকল্প](../chapter-01-foundation/first-project.md)
- **➡️ পরবর্তী**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

**সাহায্য দরকার?** আমাদের কমিউনিটি আলোচনায় যোগ দিন বা রিপোজিটরিতে একটি ইস্যু খুলুন। Azure AI + AZD কমিউনিটি আপনার সফলতা নিশ্চিত করতে এখানে আছে!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। আমরা যথাসাধ্য সঠিকতার চেষ্টা করি, তবে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে যা আপনাকে অবগত থাকতে হবে। মূল নথিটিকে তার নিজস্ব ভাষায়ই কর্তৃত্ব বিশিষ্ট উৎস বলে বিবেচনা করা উচিত। প্রয়োজনীয় তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করা উত্তম। এই অনুবাদের ব্যবহার থেকে সৃষ্ট কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->