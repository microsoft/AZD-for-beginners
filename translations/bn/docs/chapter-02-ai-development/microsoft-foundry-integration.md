# Microsoft Foundry এর AZD এর সাথে ইন্টিগ্রেশন

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-প্রথম উন্নয়ন
- **⬅️ আগের অধ্যায়**: [অধ্যায় ১: আপনার প্রথম প্রকল্প](../chapter-01-foundation/first-project.md)
- **➡️ পরবর্তী**: [AI মডেল ডেপ্লয়মেন্ট](ai-model-deployment.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

## সারাংশ

এই গাইডটি মাইক্রোসফট ফাউন্ড্রি সার্ভিসগুলোকে আজুর ডেভেলপার CLI (AZD) এর সাথে ইন্টিগ্রেট করে AI অ্যাপ্লিকেশন ডেপ্লয়মেন্টকে সহজ করতে দেখায়। মাইক্রোসফট ফাউন্ড্রি AI অ্যাপ্লিকেশন তৈরি, ডেপ্লয় ও ম্যানেজ করার জন্য একটি সমন্বিত প্ল্যাটফর্ম সরবরাহ করে, আর AZD ইনফ্রাস্ট্রাকচার ও ডেপ্লয়মেন্ট প্রক্রিয়াকে সহজ করে।

## মাইক্রোসফট ফাউন্ড্রি কি?

মাইক্রোসফট ফাউন্ড্রি হলো মাইক্রোসফটের AI উন্নয়নের জন্য একক প্ল্যাটফর্ম যা অন্তর্ভুক্ত:

- **মডেল ক্যাটালগ**: অত্যাধুনিক AI মডেলগুলোর অ্যাক্সেস
- **প্রম্পট ফ্লো**: AI ওয়ার্কফ্লোর জন্য ভিজ্যুয়াল ডিজাইনার
- **মাইক্রোসফট ফাউন্ড্রি পোর্টাল**: AI অ্যাপ্লিকেশনের জন্য ইন্টিগ্রেটেড ডেভেলপমেন্ট এনভায়রনমেন্ট
- **ডেপ্লয়মেন্ট অপশনস**: একাধিক হোস্টিং ও স্কেলিং বিকল্প
- **সেফটি ও সিকিউরিটি**: বিল্ট-ইন রেসপনসিবল AI ফিচার

## AZD + মাইক্রোসফট ফাউন্ড্রি: একত্রে উন্নত

| ফিচার | মাইক্রোসফট ফাউন্ড্রি | AZD ইন্টিগ্রেশন সুবিধা |
|---------|-----------------|------------------------|
| **মডেল ডেপ্লয়মেন্ট** | ম্যানুয়াল পোর্টাল ডেপ্লয়মেন্ট | স্বয়ংক্রিয়, পুনরাবৃত্ত ডেপ্লয়মেন্ট |
| **ইনফ্রাস্ট্রাকচার** | ক্লিক-থ্রু প্রোভিশনিং | ইনফ্রাস্ট্রাকচার অ্যাজ কোড (বিসেপ) |
| **পরিবেশ ব্যবস্থাপনা** | একক পরিবেশ ফোকাস | মাল্টি-পরিবেশ (ডেভ/স্টেজিং/প্রোড) |
| **CI/CD ইন্টিগ্রেশন** | সীমিত | নেটিভ GitHub Actions সাপোর্ট |
| **কস্ট ম্যানেজমেন্ট** | বেসিক মনিটরিং | পরিবেশ নির্দিষ্ট খরচ অপ্টিমাইজেশন |

## প্রয়োজনীয় শর্তসমূহ

- উপযুক্ত অনুমতি সহ আজুর সাবস্ক্রিপশন
- আজুর ডেভেলপার CLI ইনস্টল করা
- মাইক্রোসফট ফাউন্ডরি মডেলস সার্ভিসেস অ্যাক্সেস
- মাইক্রোসফট ফাউন্ড্রি সম্পর্কে প্রাথমিক জ্ঞান

> **বর্তমান AZD বেসলাইন:** এই উদাহরণগুলো `azd` `1.27.1` এর বিরুদ্ধে পর্যালোচনা করা হয়েছে। AI এজেন্ট ওয়ার্কফ্লোর জন্য, বর্তমান প্রিভিউ এক্সটেনশন রিলিজ ব্যবহার করুন এবং শুরু করার আগে ইনস্টল করা ভার্সন চেক করুন।

## মূল ইন্টিগ্রেশন প্যাটার্নসমূহ

### প্যাটার্ন ১: মাইক্রোসফট ফাউন্ড্রি মডেলস ইন্টিগ্রেশন

**ব্যবহার ক্ষেত্র**: মাইক্রোসফট ফাউন্ড্রি মডেলস মডেলস দিয়ে চ্যাট অ্যাপ্লিকেশন ডেপ্লয় করা

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

**ব্যবহার ক্ষেত্র**: রিট্রিভাল-অগমেন্টেড জেনারেশন (RAG) অ্যাপ্লিকেশন ডেপ্লয় করা

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

### পরিবেশ ভেরিয়েবল সেটআপ

**প্রোডাকশন কনফিগারেশন:**
```bash
# কোর এআই পরিষেবা
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# মডেল কনফিগারেশন
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# কর্মদক্ষতা সেটিংস
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ডেভেলপমেন্ট কনফিগারেশন:**
```bash
# উন্নয়নের জন্য খরচ-অপটিমাইজ্ড সেটিংস
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # বিনামূল্যের স্তর
```

### কী ভল্ট দিয়ে সুরক্ষিত কনফিগারেশন

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

## ডেপ্লয়মেন্ট ওয়ার্কফ্লোগুলো

### ফাউন্ড্রির জন্য AZD এক্সটেনশনস

AZD এক্সটেনশনস প্রদান করে যা মাইক্রোসফট ফাউন্ড্রি সার্ভিসেসের জন্য AI-স্পেসিফিক ক্যাপাবিলিটিজ যোগ করে:

```bash
# ফাউন্ড্রি এজেন্টস এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.agents

# ফাইন-টিউনিং এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.finetune

# কাস্টম মডেলস এক্সটেনশন ইনস্টল করুন
azd extension install azure.ai.models

# ইনস্টল করা এক্সটেনশনসমূহের তালিকা দেখুন
azd extension list --installed

# বর্তমানে ইনস্টল করা এজেন্ট এক্সটেনশন ভার্সন পরীক্ষা করুন
azd extension show azure.ai.agents
```

AI এক্সটেনশনস এখনো দ্রুতগতিতে প্রিভিউতে চলছে। কোন কমান্ড এখানে দেখানো থেকে ভিন্ন আচরণ করলে, সংশ্লিষ্ট এক্সটেনশন আপগ্রেড করে প্রকল্প নিজেই সমস্যাটি চেক করুন।

### `azd ai` দিয়ে এজেন্ট-প্রথম ডেপ্লয়মেন্ট

যদি আপনার কাছে এজেন্ট ম্যানিফেস্ট থাকে, `azd ai agent init` ব্যবহার করুন Foundry Agent Service এর সাথে যুক্ত একটি প্রকল্প স্ক্যাফোল্ড করতে:

```bash
# একটি এজেন্ট ম্যানিফেস্ট থেকে ইনিশিয়ালাইজ করুন
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure এ ডিপ্লয় করুন
azd up
```

`azure.ai.agents` এর সাম্প্রতিক প্রিভিউ রিলিজে টেমপ্লেট-বেসড ইনারিশিয়ালাইজেশন সমর্থন যোগ হয়েছে `azd ai agent init` এর জন্য। আপনি যদি নতুন এজেন্ট স্যাম্পল অনুসরণ করেন, ইনস্টল করা ভার্সনের এক্সটেনশন সাহায্য চেক করুন নির্দিষ্ট ফ্ল্যাগগুলোর জন্য।

সম্পূর্ণ কমান্ড রেফারেন্স ও ফ্ল্যাগের জন্য দেখুন [AZD AI CLI কমান্ডসমূহ](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)।

### সিঙ্গেল কমান্ড ডেপ্লয়মেন্ট

```bash
# সবকিছু এক কমান্ডে ডেপ্লয় করুন
azd up

# অথবা ক্রমান্বয়ে ডেপ্লয় করুন
azd provision  # শুধুমাত্র অবকাঠামো
azd deploy     # শুধুমাত্র অ্যাপ্লিকেশন

# azd 1.23.11+ এ দীর্ঘমেয়াদী চালিত AI অ্যাপ ডেপ্লয়মেন্টের জন্য
azd deploy --timeout 1800
```

### পরিবেশ-নির্দিষ্ট ডেপ্লয়মেন্টস

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

## মনিটরিং ও অবজারভেবিলিটি

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

## 🔐 সুরক্ষা সেরা অনুশীলনসমূহ

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

## কর্মক্ষমতা অপ্টিমাইজেশন

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

## সাধারণ সমস্যাগুলোর সমস্যা সমাধান

### সমস্যা ১: OpenAI কোটা ছাড়িয়ে গেছে

**লক্ষণসমূহ:**
- ডেপ্লয়মেন্ট কোটা এরর সহ ব্যর্থ হয়
- অ্যাপ্লিকেশন লগে ৪২৯ এরর দেখা যায়

**সমাধানসমূহ:**
```bash
# বর্তমান কোটা ব্যবহার পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# ভিন্ন অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up

# অস্থায়ীভাবে ক্ষমতা কমান
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### সমস্যা ২: অথেন্টিকেশন ব্যর্থতা

**লক্ষণসমূহ:**
- AI সার্ভিস কল করার সময় ৪০১/৪০৩ এরর
- "অ্যাক্সেস নিষিদ্ধ" মেসেজ পাওয়া যায়

**সমাধানসমূহ:**
```bash
# ভূমিকা নিয়োগ যাচাই করুন
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# পরিচালিত পরিচয় কনফিগারেশন পরীক্ষা করুন
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# কী ভল্ট অ্যাক্সেস যাচাই করুন
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### সমস্যা ৩: মডেল ডেপ্লয়মেন্ট সমস্যা

**লক্ষণসমূহ:**
- ডেপ্লয়মেন্টে মডেল পাওয়া যায় না
- নির্দিষ্ট মডেল সংস্করণ ব্যর্থ হচ্ছে

**সমাধানসমূহ:**
```bash
# অঞ্চল অনুযায়ী উপলব্ধ মডেলগুলি তালিকাভুক্ত করুন
az cognitiveservices model list --location eastus

# বাইসেপ টেম্পলেটে মডেল সংস্করণ আপডেট করুন
# মডেলের ক্ষমতার প্রয়োজনীয়তা পরীক্ষা করুন
```

## উদাহরণ টেমপ্লেটসমূহ

### RAG চ্যাট অ্যাপ্লিকেশন (পাইথন)

**রিপোজিটরি**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**সার্ভিসেস**: আজুর ওপেনএআই + আজুর AI সার্চ + আজুর কন্টেইনার অ্যাপস + আজুর ব্লব স্টোরেজ

**বর্ণনা**: সবচেয়ে জনপ্রিয় আজুর AI স্যাম্পল — একটি প্রোডাকশন-রেডি RAG চ্যাট অ্যাপ যা আপনাকে নিজের ডকুমেন্টের ওপর প্রশ্ন করার সুযোগ দেয়। GPT-4.1-mini চ্যাটের জন্য, text-embedding-3-large এম্বেডিংয়ের জন্য এবং আজুর AI সার্চ রিট্রিভালের জন্য ব্যবহার করে। মাল্টিমোডাল ডকুমেন্টস, স্পিচ ইনপুট/আউটপুট, মাইক্রোসফট এন্ট্রা অথেন্টিকেশন, ও অ্যাপ্লিকেশন ইনসাইটস ট্রেসিং সাপোর্ট করে।

**দ্রুত শুরু:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG চ্যাট অ্যাপ্লিকেশন (.NET)

**রিপোজিটরি**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**সার্ভিসেস**: আজুর ওপেনএআই + আজুর AI সার্চ + আজুর কন্টেইনার অ্যাপস + সেমান্টিক কার্নেল

**বর্ণনা**: পাইথনের RAG চ্যাট স্যাম্পলের .NET/C# সমতুল্য। ASP.NET Core মিনিমাল API ও ব্লেজর ওয়েবঅ্যাসেম্বলি ফ্রন্টএন্ড দিয়ে নির্মিত। ভয়েস চ্যাট, GPT-4o-mini ভিশন সাপোর্ট, এবং একটি কম্প্যানিয়ন .NET MAUI ব্লেজর হাইব্রিড ডেস্কটপ/মোবাইল ক্লায়েন্ট অন্তর্ভুক্ত।

**দ্রুত শুরু:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG চ্যাট অ্যাপ্লিকেশন (জাভা)

**রিপোজিটরি**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**সার্ভিসেস**: আজুর ওপেনএআই + আজুর AI সার্চ + আজুর কন্টেইনার অ্যাপস / AKS + Langchain4J + আজুর কসমস ডিবি

**বর্ণনা**: Langchain4J দিয়ে AI অর্কেস্ট্রেশনের জন্য জাভা ভার্সনের RAG চ্যাট স্যাম্পল। মাইক্রোসার্ভিস ইভেন্ট-চালিত আর্কিটেকচার, একাধিক সার্চ কৌশল (টেক্সট, ভেক্টর, হাইব্রিড), আজুর ডকুমেন্ট ইন্টেলিজেন্স দিয়ে ডকুমেন্ট আপলোড, এবং আজুর কন্টেইনার অ্যাপস অথবা আজুর কুবেরনেটিস সার্ভিসে ডেপ্লয়মেন্ট সাপোর্ট করে।

**দ্রুত শুরু:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### মাইক্রোসফট ফাউন্ড্রি সহ এন্টারপ্রাইজ রিটেইল কপিলট

**রিপোজিটরি**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**সার্ভিসেস**: আজুর ওপেনএআই + মাইক্রোসফট ফাউন্ড্রি + প্রম্পটি + আজুর AI সার্চ + আজুর কন্টেইনার অ্যাপস + আজুর কসমস ডিবি

**বর্ণনা**: মাইক্রোসফট ফাউন্ড্রি ও প্রম্পটি ব্যবহার করে সম্পূর্ণ রিটেইল RAG কপিলট। একটি কন্টসো আউটডোর রিটেইলারের চ্যাটবট যা প্রোডাক্ট ক্যাটালগ ও গ্রাহক অর্ডার ডেটার ভিত্তিতে উত্তর দেয়। পূর্ণ GenAIOps ওয়ার্কফ্লো প্রদর্শন করে — প্রম্পটি দিয়ে প্রোটোটাইপ, AI-সহায়ক ইভ্যালুয়েটর দিয়ে মূল্যায়ন, এবং AZD এর মাধ্যমে কন্টেইনার অ্যাপে ডেপ্লয়।

**দ্রুত শুরু:**
```bash
azd init --template contoso-chat
azd up
```

### ক্রিয়েটিভ রাইটিং মাল্টি-এজেন্ট অ্যাপ্লিকেশন

**রিপোজিটরি**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**সার্ভিসেস**: আজুর ওপেনএআই + আজুর AI এজেন্ট সার্ভিস + বিং গ্রাউন্ডিং + আজুর AI সার্চ + আজুর কন্টেইনার অ্যাপস

**বর্ণনা**: প্রম্পটি ব্যবহার করে মাল্টি-এজেন্ট AI এজেন্ট অর্কেস্ট্রেশন প্রদর্শন। রিসার্চ এজেন্ট (বিং গ্রাউন্ডিং ইন আজুর AI এজেন্ট সার্ভিস), প্রোডাক্ট এজেন্ট (আজুর AI সার্চ), লেখক এজেন্ট, ও এডিটর এজেন্ট সহযোগিতায় ভালভাবে গবেষণা করা নিবন্ধ তৈরি করে। গিটহাব অ্যাকশনে ইভ্যালুয়েশনসহ CI/CD অন্তর্ভুক্ত।

**দ্রুত শুরু:**
```bash
azd init --template contoso-creative-writer
azd up
```

### সার্ভারলেস RAG চ্যাট (জাভাস্ক্রিপ্ট/টাইপস্ক্রিপ্ট)

**রিপোজিটরি**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**সার্ভিসেস**: আজুর ওপেনএআই + আজুর ফাংশনস + আজুর স্ট্যাটিক ওয়েব অ্যাপস + আজুর কসমস ডিবি ফর NoSQL + LangChain.js

**বর্ণনা**: LangChain.js সহ সম্পূর্ণ সার্ভারলেস RAG চ্যাটবট আজুর ফাংশনস API ও আজুর স্ট্যাটিক ওয়েব অ্যাপস হোস্টিং জন্য ব্যবহার করে। আজুর কসমস ডিবি ভেক্টর স্টোর ও চ্যাট ইতিহাস ডাটাবেস উভয় হিসেবেই ব্যবহৃত। লোকাল ডেভেলপমেন্ট সাপোর্ট করে Ollama দিয়ে শূন্য খরচে টেস্টিং।

**দ্রুত শুরু:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### ডেটা নিয়ে চ্যাট সমাধান এক্সেলোরেটর

**রিপোজিটরি**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**সার্ভিসেস**: আজুর ওপেনএআই + আজুর AI সার্চ + আজুর অ্যাপ সার্ভিস + আজুর ডকুমেন্ট ইন্টেলিজেন্স + আজুর ফাংশনস + আজুর কসমস ডিবি / পোস্টগ্রে এসকিউএল

**বর্ণনা**: এন্টারপ্রাইজ-গ্রেড RAG সমাধান এক্সেলোরেটর অ্যাডমিন পোর্টাল, ডকুমেন্ট আপলোড/ম্যানেজমেন্ট, একাধিক অর্কেস্ট্রেটর বিকল্প (সেমান্টিক কার্নেল, ল্যাংচেইন, প্রম্পট ফ্লো), স্পিচ-টু-টেক্সট, মাইক্রোসফট টিমস ইন্টিগ্রেশন এবং পোস্টগ্রে এসকিউএল অথবা কসমস ডিবি ব্যাকেন্ডের অপশন সহ। প্রোডাকশন RAG দৃশ্যে কাস্টমাইজেবল শুরু পয়েন্ট হিসেবে ডিজাইন করা।

**দ্রুত শুরু:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ট্রাভেল এজেন্টস — মাল্টি-এজেন্ট MCP অর্কেস্ট্রেশন

**রিপোজিটরি**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**সার্ভিসেস**: আজুর ওপেনএআই + মাইক্রোসফট ফাউন্ড্রি + আজুর কন্টেইনার অ্যাপস + MCP সার্ভার (.NET, পাইথন, জাভা, টাইপস্ক্রিপ্ট)

**বর্ণনা**: তিনটি ফ্রেমওয়ার্ক (LangChain.js, LlamaIndex.TS, এবং মাইক্রোসফট এজেন্ট ফ্রেমওয়ার্ক) ব্যবহার করে মাল্টি-এজেন্ট AI অর্কেস্ট্রেশনের জন্য রেফারেন্স অ্যাপ্লিকেশন। চারটি ভাষায় MCP (মডেল কনটেক্সট প্রোটোকল) সার্ভার রয়েছে যা সার্ভারলেস আজুর কন্টেইনার অ্যাপে ডেপ্লয় এবং OpenTelemetry মনিটরিং করে।

**দ্রুত শুরু:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### আজুর AI স্টার্টার

**রিপোজিটরি**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**সার্ভিসেস**: আজুর AI সার্ভিসেস + আজুর ওপেনএআই

**বর্ণনা**: একটি মিমিনাল বিসেপ টেমপ্লেট যা আজুর AI সার্ভিসেস সহ কনফিগারড মেশিন লার্নিং মডেলস ডেপ্লয় করে। যখন আপনি শুধু আজুর AI ইনফ্রাস্ট্রাকচার প্রভিশন করতে চান, পুরো অ্যাপ্লিকেশন স্ট্যাক ছাড়াই তখন হালকা শুরু পয়েন্ট।

**দ্রুত শুরু:**
```bash
azd init --template azd-ai-starter
azd up
```

> **আরও টেমপ্লেট ব্রাউজ করুন**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) এ ৮০+ AI-স্পেসিফিক AZD টেমপ্লেট বিভিন্ন ভাষা ও দৃশ্যের জন্য ভিজিট করুন।

## পরবর্তী ধাপসমূহ

১. **উদাহরণগুলো চেষ্টা করুন**: আপনার ব্যবহারের ক্ষেত্রে মিলানো প্রি-বিল্ট টেমপ্লেট দিয়ে শুরু করুন
২. **আপনার প্রয়োজন অনুযায়ী কাস্টমাইজ করুন**: ইনফ্রাস্ট্রাকচার ও অ্যাপ্লিকেশন কোড পরিবর্তন করুন
৩. **মনিটরিং যোগ করুন**: ব্যাপক অবজারভেবিলিটি বাস্তবায়ন করুন
৪. **খরচ অপ্টিমাইজ করুন**: আপনার বাজেটের জন্য কনফিগারেশন ফাইন-টিউন করুন
৫. **আপনার ডেপ্লয়মেন্ট সুরক্ষিত করুন**: এন্টারপ্রাইজ সিকিউরিটি প্যাটার্নসমূহ বাস্তবায়ন করুন
৬. **প্রোডাকশনে স্কেল করুন**: মাল্টি-রিজিয়ন এবং উচ্চ-অ্যাভেইলেবিলিটি ফিচার যোগ করুন

## 🎯 হাতে-কলমে অনুশীলন

### অনুশীলন ১: মাইক্রোসফট ফাউন্ড্রি মডেলস চ্যাট অ্যাপ ডেপ্লয় করুন (৩০ মিনিট)
**লক্ষ্য**: একটি প্রোডাকশন-রেডি AI চ্যাট অ্যাপ্লিকেশন ডেপ্লয় ও পরীক্ষা করা

```bash
# টেমপ্লেট শুরু করুন
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# পরিবেশ চলকগুলি সেট করুন
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# মোতায়েন করুন
azd up

# অ্যাপ্লিকেশনটি পরীক্ষা করুন
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI অপারেশনগুলি নজরদারি করুন
azd monitor

# পরিস্কার করুন
azd down --force --purge
```

**সাফল্যের মানদণ্ড:**
- [ ] কোটা এরর ছাড়া ডেপ্লয়মেন্ট সম্পন্ন হয়েছে
- [ ] ব্রাউজারে চ্যাট ইন্টারফেস অ্যাক্সেস করা যায়
- [ ] প্রশ্ন করতে পারেন এবং AI-চালিত উত্তর পান
- [ ] অ্যাপ্লিকেশন ইনসাইটস টেলিমেট্রি ডেটা দেখায়
- [ ] সফলভাবে রিসোর্স ক্লিন আপ হয়েছে

**আনুমানিক খরচ**: ৩০ মিনিট পরীক্ষার জন্য ৫-১০ ডলার

### অনুশীলন ২: মাল্টি-মডেল ডেপ্লয়মেন্ট কনফিগার করুন (৪৫ মিনিট)
**লক্ষ্য**: ভিন্ন কনফিগারেশন সহ একাধিক AI মডেল ডেপ্লয় করা

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

**সাফল্যের মানদণ্ড:**
- [ ] একাধিক মডেল সফলভাবে ডেপ্লয় হয়েছে
- [ ] বিভিন্ন ক্যাপাসিটি সেটিংস প্রয়োগ করা হয়েছে
- [ ] API মাধ্যমে মডেলগুলো অ্যাক্সেসযোগ্য
- [ ] অ্যাপ্লিকেশন থেকে উভয় মডেল কল করা যায়

### অনুশীলন ৩: খরচ মনিটরিং বাস্তবায়ন (২০ মিনিট)
**লক্ষ্য**: বাজেট সতর্কতা ও খরচ ট্র্যাকিং সেটআপ করা

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

# বাজেট এলার্ট প্রয়োগ করুন
azd provision

# বর্তমান খরচ পরীক্ষা করুন
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**সাফল্যের মানদণ্ড:**
- [ ] আজুরে বাজেট সতর্কতা তৈরি হয়েছে
- [ ] ইমেইল বিজ্ঞপ্তি কনফিগার করা হয়েছে
- [ ] আজুর পোর্টালে খরচ তথ্য দেখা যায়
- [ ] বাজেট সীমা সঠিকভাবে সেট করা হয়েছে

## 💡 প্রায়শই জিজ্ঞাসিত প্রশ্নাবলী

<details>
<summary><strong>উন্নয়নের সময় মাইক্রোসফট ফাউন্ড্রি মডেলসের খরচ কীভাবে কমাব?</strong></summary>

১. **ফ্রি টিয়ার ব্যবহার করুন**: মাইক্রোসফট ফাউন্ড্রি মডেলস মাসে ৫০,০০০ টোকেন ফ্রি অফার করে
২. **ক্যাপাসিটি কমান**: ডেভেলপমেন্টের জন্য ৩০+ এর পরিবর্তে ১০ TPM সেট করুন
৩. **azd down ব্যবহার করুন**: সক্রিয় ডেভেলপমেন্ট না থাকলে রিসোর্স আনডেলোকেট করুন
৪. **রেসপন্স ক্যাশ করুন**: পুনরাবৃত্ত প্রশ্নের জন্য Redis ক্যাশ ব্যবহার করুন
৫. **প্রম্পট ইঞ্জিনিয়ারিং ব্যবহার করুন**: দক্ষ প্রম্পট দিয়ে টোকেন ব্যবহার কমান


```bash
# উন্নয়ন কনফিগারেশন
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry মডেল এবং OpenAI API এর মধ্যে পার্থক্য কি?</strong></summary>

**Microsoft Foundry মডেল**:
- এন্টারপ্রাইজ নিরাপত্তা এবং সম্মতি
- প্রাইভেট নেটওয়ার্ক ইন্টিগ্রেশন
- SLA গ্যারান্টি
- ম্যানেজড আইডেন্টিটি অথেন্টিকেশন
- উচ্চতর কোটা উপলব্ধ

**OpenAI API**:
- নতুন মডেলে দ্রুত প্রবেশাধিকার
- সহজতর সেটআপ
- প্রবেশের নিম্ন বাধা
- শুধুমাত্র পাবলিক ইন্টারনেট

প্রোডাকশন অ্যাপের জন্য, **Microsoft Foundry মডেল সুপারিশ করা হয়**।
</details>

<details>
<summary><strong>Microsoft Foundry মডেল কোটা অতিক্রম ত্রুটি কিভাবে হ্যান্ডেল করব?</strong></summary>

```bash
# বর্তমান কোটা পরীক্ষা করুন
az cognitiveservices usage list --location eastus2

# ভিন্ন অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up

# সাময়িকভাবে ক্ষমতা কমান
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# কোটা বাড়ানোর জন্য অনুরোধ করুন
# Azure পোর্টাল > কোটা > বৃদ্ধি অনুরোধে যান
```
</details>

<details>
<summary><strong>Microsoft Foundry মডেলের সাথে আমি কি আমার নিজস্ব ডেটা ব্যবহার করতে পারি?</strong></summary>

হ্যাঁ! RAG (রিট্রিভাল অগমেন্টেড জেনারেশন) এর জন্য **Azure AI Search** ব্যবহার করুন:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) টেমপ্লেট দেখুন।
</details>

<details>
<summary><strong>আমি কীভাবে AI মডেল এন্ডপয়েন্ট সুরক্ষিত করব?</strong></summary>

**সেরা অনুশীলনসমূহ**:
1. Managed Identity ব্যবহার করুন (কোন API কী নয়)
2. প্রাইভেট এন্ডপয়েন্ট সক্রিয় করুন
3. নেটওয়ার্ক সিকিউরিটি গ্রুপ কনফিগার করুন
4. রেট লিমিটিং বাস্তবায়ন করুন
5. গোপনীয়তার জন্য Azure Key Vault ব্যবহার করুন

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

## কমিউনিটি এবং সাহায্য

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [অফিসিয়াল ডকুমেন্টেশন](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - আপনার সম্পাদকএ Azure + Foundry এজেন্ট স্কিল ইনস্টল করুন `npx skills add microsoft/github-copilot-for-azure` দিয়ে

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনারস](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - AI-ফার্স্ট ডেভেলপমেন্ট
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় ১: আপনার প্রথম প্রকল্প](../chapter-01-foundation/first-project.md)
- **➡️ পরবর্তী**: [AI মডেল ডিপ্লয়মেন্ট](ai-model-deployment.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

**সাহায্য দরকার?** আমাদের কমিউনিটি আলোচনায় যোগ দিন অথবা রিপোজিটরিতে একটি ইস্যু খুলুন। Azure AI + AZD কমিউনিটি আপনাকে সফল হতে সাহায্য করার জন্য এখানে রয়েছে!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->