# Microsoft Foundry এবং AZD-এর ইন্টিগ্রেশন

**Chapter Navigation:**
- **📚 Course Home**: [AZD শুরুদের জন্য](../../README.md)
- **📖 Current Chapter**: অধ্যায় ২ - এআই-প্রথম উন্নয়ন
- **⬅️ Previous Chapter**: [অধ্যায় ১: আপনার প্রথম প্রজেক্ট](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI মডেল স্থাপন](ai-model-deployment.md)
- **🚀 Next Chapter**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

## ওভারভিউ

এই নির্দেশিকা Microsoft Foundry সার্ভিসগুলোকে Azure Developer CLI (AZD) এর সাথে কিভাবে ইন্টিগ্রেট করে তা প্রদর্শন করে, যা এআই অ্যাপ্লিকেশন ডিপ্লয়মেন্টকে সহজ ও কার্যকর করে। Microsoft Foundry এআই অ্যাপ্লিকেশন তৈরি, ডিপ্লয় এবং পরিচালনার জন্য একটি সমন্বিত প্ল্যাটফর্ম প্রদান করে, যেখানে AZD ইনফ্রাস্ট্রাকচার এবং ডিপ্লয়মেন্ট প্রক্রিয়াকে সরল করে।

## Microsoft Foundry কী?

Microsoft Foundry হল Microsoft-এর একটি একত্রীকৃত এআই ডেভেলপমেন্ট প্ল্যাটফর্ম যা অন্তর্ভুক্ত করে:

- **মডেল ক্যাটালগ**: উন্নতমানের AI মডেলগুলোতে অ্যাক্সেস
- **প্রম্পট ফ্লো**: এআই ওয়ার্কফ্লোর জন্য ভিজ্যুয়াল ডিজাইনার
- **AI Foundry পোর্টাল**: এআই অ্যাপ্লিকেশনের জন্য একত্রীকৃত ডেভেলপমেন্ট পরিবেশ
- **ডিপ্লয়মেন্ট অপশন**: একাধিক হোস্টিং ও স্কেলিং অপশন
- **নিরাপত্তা ও সুরক্ষা**: অন্তর্নির্মিত রেস্পনসিবল এআই ফিচারসমূহ

## AZD + Microsoft Foundry: একসাথে আরও ভালো

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | ম্যানুয়াল পোর্টাল ডিপ্লয়মেন্ট | স্বয়ংক্রিয়, পুনরাবৃত্তিযোগ্য ডিপ্লয়মেন্ট |
| **Infrastructure** | ক্লিক-থ্রু প্রোভিশনিং | Infrastructure as Code (Bicep) |
| **Environment Management** | একক পরিবেশ ফোকাস | বহু-পরিবেশ (dev/staging/prod) |
| **CI/CD Integration** | সীমিত | নেটিভ GitHub Actions সাপোর্ট |
| **Cost Management** | মৌলিক মনিটরিং | পরিবেশ-নির্দিষ্ট খরচ অপটিমাইজেশন |

## প্রয়োজনীয়তা

- উপযুক্ত অনুমতির সম্বলিত Azure সাবস্ক্রিপশন
- Azure Developer CLI ইনস্টল করা
- Azure OpenAI সার্ভিসে অ্যাক্সেস
- Microsoft Foundry সম্পর্কে মৌলিক পরিচিতি

## কোর ইন্টিগ্রেশন প্যাটার্নসমূহ

### প্যাটার্ন 1: Azure OpenAI ইন্টিগ্রেশন

**ব্যবহার কেস**: Azure OpenAI মডেল ব্যবহার করে চ্যাট অ্যাপ্লিকেশন ডিপ্লয় করা

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

### প্যাটার্ন 2: AI Search + RAG ইন্টিগ্রেশন

**ব্যবহার কেস**: রিট্রিভাল-অগমেন্টেড জেনারেশন (RAG) অ্যাপ্লিকেশন ডিপ্লয় করা

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

### প্যাটার্ন 3: ডকুমেন্ট ইন্টেলিজেন্স ইন্টিগ্রেশন

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

### পরিবেশ ভেরিয়েবল সেটআপ

**প্রোডাকশন কনফিগারেশন:**
```bash
# কোর কৃত্রিম বুদ্ধিমত্তা সেবা
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# মডেলের কনফিগারেশন
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# কর্মক্ষমতা সেটিংস
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ডেভেলপমেন্ট কনফিগারেশন:**
```bash
# উন্নয়নের জন্য খরচ-সাশ্রয়ী সেটিংস
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # বিনামূল্য স্তর
```

### Key Vault দিয়ে নিরাপদ কনফিগারেশন

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
# একটি কমান্ডে সবকিছু ডিপ্লয় করুন
azd up

# অথবা ধাপে ধাপে ডিপ্লয় করুন
azd provision  # শুধুমাত্র অবকাঠামো
azd deploy     # শুধুমাত্র অ্যাপ্লিকেশন
```

### পরিবেশ-নির্দিষ্ট ডিপ্লয়মেন্ট

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

## মনিটরিং এবং পর্যবেক্ষণ

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

### খরচ পর্যবেক্ষণ

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

## সাধারণ সমস্যার সমাধান

### সমস্যা 1: OpenAI কোটা অতিক্রম

**লক্ষণসমূহ:**
- কোটা ত্রুটির কারণে ডিপ্লয়মেন্ট ব্যর্থ হয়
- অ্যাপ্লিকেশন লগে 429 ত্রুটি

**সমাধানসমূহ:**
```bash
# বর্তমান কোটার ব্যবহার পরীক্ষা করুন
az cognitiveservices usage list --location eastus

# অন্য অঞ্চল চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up

# অস্থায়ীভাবে ক্ষমতা হ্রাস করুন
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### সমস্যা 2: প্রমাণীকরণ ব্যর্থতা

**লক্ষণসমূহ:**
- AI সার্ভিস কল করার সময় 401/403 ত্রুটি
- "Access denied" বার্তা

**সমাধানসমূহ:**
```bash
# রোল বরাদ্দ যাচাই করুন
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ম্যানেজড আইডেন্টিটির কনফিগারেশন পরীক্ষা করুন
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault অ্যাক্সেস যাচাই করুন
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### সমস্যা 3: মডেল ডিপ্লয়মেন্ট সমস্যা

**লক্ষণসমূহ:**
- ডিপ্লয়মেন্টে মডেলগুলো উপলব্ধ নয়
- নির্দিষ্ট মডেল ভার্সন ব্যর্থ হচ্ছে

**সমাধানসমূহ:**
```bash
# অঞ্চল অনুযায়ী উপলব্ধ মডেলগুলির তালিকা
az cognitiveservices model list --location eastus

# bicep টেমপ্লেটে মডেল সংস্করণ আপডেট করুন
# মডেলের সক্ষমতা সম্পর্কিত প্রয়োজনীয়তা পরীক্ষা করুন
```

## উদাহরণ টেমপ্লেট

### বেসিক চ্যাট অ্যাপ্লিকেশন

**রিপোজিটরি**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**সার্ভিসসমূহ**: Azure OpenAI + Cognitive Search + App Service

**দ্রুত শুরু**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ডকুমেন্ট প্রসেসিং পাইপলাইন

**রিপোজিটরি**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**সার্ভিসসমূহ**: Document Intelligence + Storage + Functions

**দ্রুত শুরু**:
```bash
azd init --template ai-document-processing
azd up
```

### এন্টারপ্রাইজ চ্যাট সহ RAG

**রিপোজিটরি**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**সার্ভিসসমূহ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**দ্রুত শুরু**:
```bash
azd init --template contoso-chat
azd up
```

## পরবর্তী ধাপসমূহ

1. **উদাহরণগুলো চেষ্টা করুন**: আপনার ব্যবহার কেসের সাথে মিলে এমন একটি প্রি-বিল্ট টেমপ্লেট দিয়ে শুরু করুন
2. **আপনার চাহিদা অনুযায়ী কাস্টমাইজ করুন**: ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন কোড পরিবর্তন করুন
3. **মনিটরিং যোগ করুন**: বিস্তৃত পর্যবেক্ষণ বাস্তবায়ন করুন
4. **খরচ অপ্টিমাইজ করুন**: আপনার বাজেট অনুযায়ী কনফিগারেশন সূক্ষ্ম করুন
5. **আপনার ডিপ্লয়মেন্ট সুরক্ষিত করুন**: এন্টারপ্রাইজ সিকিউরিটি প্যাটার্ন বাস্তবায়ন করুন
6. **প্রোডাকশনে স্কেল করুন**: বহু-রিজিয়ন এবং উচ্চ-উপলব্ধতা ফিচার যোগ করুন

## 🎯 হাতেকলমে অনুশীলন

### অনুশীলন ১: Azure OpenAI চ্যাট অ্যাপ ডিপ্লয় করুন (৩০ মিনিট)
**লক্ষ্য**: একটি প্রোডাকশন-রেডি এআই চ্যাট অ্যাপ্লিকেশন ডিপ্লয় ও পরীক্ষা করা

```bash
# টেমপ্লেট ইনিশিয়ালাইজ করুন
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

# কৃত্রিম বুদ্ধিমত্তার কার্যক্রম পর্যবেক্ষণ করুন
azd monitor

# পরিষ্কার করুন
azd down --force --purge
```

**সফলতার মানদণ্ড:**
- [ ] ডিপ্লয়মেন্ট কোটা ত্রুটি ছাড়াই সম্পন্ন হয়
- [ ] ব্রাউজারে চ্যাট ইন্টারফেস অ্যাক্সেস করা যায়
- [ ] প্রশ্ন করা যায় এবং এআই-চালিত উত্তর পাওয়া যায়
- [ ] Application Insights টেলিমেট্রি ডেটা প্রদর্শন করে
- [ ] রিসোর্সগুলি সফলভাবে পরিষ্কার করা হয়েছে

**আনুমানিক খরচ**: $5-10 ৩০ মিনিটের পরীক্ষার জন্য

### অনুশীলন ২: মাল্টি-মডেল ডিপ্লয়মেন্ট কনফিগার করুন (৪৫ মিনিট)
**লক্ষ্য**: বিভিন্ন কনফিগারেশন সহ একাধিক AI মডেল ডিপ্লয় করা

```bash
# কাস্টম Bicep কনফিগারেশন তৈরি করুন
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

**সফলতার মানদণ্ড:**
- [ ] একাধিক মডেল সফলভাবে ডিপ্লয় হয়েছে
- [ ] ভিন্ন ক্যাপাসিটি সেটিং প্রয়োগ করা হয়েছে
- [ ] মডেলগুলো API মাধ্যমে অ্যাক্সেসযোগ্য
- [ ] অ্যাপ্লিকেশন থেকে উভয় মডেল কল করা যায়

### অনুশীলন ৩: খরচ পর্যবেক্ষণ বাস্তবায়ন (২০ মিনিট)
**লক্ষ্য**: বাজেট এলার্ট এবং খরচ ট্র্যাকিং স্থাপন করা

```bash
# Bicep-এ বাজেট এলার্ট যোগ করুন
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

# বর্তমান খরচ যাচাই করুন
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**সফলতার মানদণ্ড:**
- [ ] Azure-এ বাজেট এলার্ট তৈরি আছে
- [ ] ইমেইল নোটিফিকেশন কনফিগার করা হয়েছে
- [ ] Azure পোর্টালে খরচ ডেটা দেখা যায়
- [ ] বাজেট থ্রেশহোল্ড উপযুক্তভাবে সেট করা হয়েছে

## 💡 প্রায়শই জিজ্ঞাসিত প্রশ্নাবলি

<details>
<summary><strong>কীভাবে আমি ডেভেলপমেন্টের সময় Azure OpenAI খরচ কমাবো?</strong></summary>

1. **ফ্রি টিয়ার ব্যবহার করুন**: Azure OpenAI মাসে 50,000 টোকেন ফ্রি অফার করে
2. **ক্যাপাসিটি কমান**: ডেভের জন্য 30+ এর বদলে 10 TPM সেট করুন
3. **azd down ব্যবহার করুন**: সক্রিয়ভাবে ডেভেলপ না করার সময় রিসোর্স ডিএলোকেট করুন
4. **রেসপন্স ক্যাশ করুন**: পুনরাবৃত্ত প্রশ্নের জন্য Redis ক্যাশ বাস্তবায়ন করুন
5. **প্রম্পট ইঞ্জিনিয়ারিং ব্যবহার করুন**: দক্ষ প্রম্পট দিয়ে টোকেন ব্যবহার কমান

```bash
# উন্নয়ন কনফিগারেশন
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI এবং OpenAI API এর মধ্যে পার্থক্য কী?</strong></summary>

**Azure OpenAI**:
- এন্টারপ্রাইজ সিকিউরিটি এবং কমপ্লায়েন্স
- প্রাইভেট নেটওয়ার্ক ইন্টিগ্রেশন
- SLA গ্যারান্টি
- Managed identity প্রমাণীকরণ
- উচ্চতর কোটা উপলব্ধ

**OpenAI API**:
- নতুন মডেলগুলোর দ্রুত এক্সেস
- সহজ সেটআপ
- প্রবেশের নিম্ন বাধা
- কেবল পাবলিক ইন্টারনেট

প্রোডাকশন অ্যাপগুলোর জন্য, **Azure OpenAI সুপারিশযোগ্য**।
</details>

<details>
<summary><strong>Aure OpenAI কোটা অতিক্রম ত্রুটিগুলো আমি কীভাবে হ্যান্ডল করব?</strong></summary>

```bash
# বর্তমান কোটা পরীক্ষা করুন
az cognitiveservices usage list --location eastus2

# ভিন্ন রিজিয়ন চেষ্টা করুন
azd env set AZURE_LOCATION westus2
azd up

# অস্থায়ীভাবে সক্ষমতা কমান
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# কোটা বৃদ্ধি অনুরোধ করুন
# Azure পোর্টালে যান > কোটা > বৃদ্ধি অনুরোধ করুন
```
</details>

<details>
<summary><strong>Azure OpenAI-তে আমি কি আমার নিজস্ব ডেটা ব্যবহার করতে পারি?</strong></summary>

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

দেখুন [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) টেমপ্লেট।
</details>

<details>
<summary><strong>আমি কীভাবে AI মডেল এন্ডপয়েন্টগুলো সুরক্ষিত করব?</strong></summary>

**সেরা অনুশীলনসমূহ**:
1. Managed Identity ব্যবহার করুন (API কী ছাড়াই)
2. প্রাইভেট এন্ডপয়েন্ট সক্ষম করুন
3. নেটওয়ার্ক সিকিউরিটি গ্রুপ কনফিগার করুন
4. রেট লিমিটিং বাস্তবায়ন করুন
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

## কমিউনিটি এবং সাপোর্ট

- **Microsoft Foundry Discord**: [#Azure চ্যানেল](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ইস্যু এবং আলোচনা](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [আবকারিক ডকুমেন্টেশন](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD শুরুদের জন্য](../../README.md)
- **📖 Current Chapter**: অধ্যায় ২ - এআই-প্রথম উন্নয়ন
- **⬅️ Previous Chapter**: [অধ্যায় ১: আপনার প্রথম প্রজেক্ট](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI মডেল স্থাপন](ai-model-deployment.md)
- **🚀 Next Chapter**: [অধ্যায় ৩: কনফিগারেশন](../chapter-03-configuration/configuration.md)

**সহায়তা প্রয়োজন?** আমাদের কমিউনিটি আলোচনায় যোগ দিন অথবা রিপোজিটরিতে একটি ইস্যু ওপেন করুন। Azure AI + AZD কমিউনিটি আপনাকে সফল হতে সহায়তা করার জন্য এখানে আছে!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকার:
এই নথিটি AI অনুবাদ সেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত করা হয়েছে। আমরা যথাসাধ্য সঠিকতা বজায় রাখার চেষ্টা করি, তবু অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। মূল নথিটিকে তার মাতৃভাষায়ই কর্তৃত্বপূর্ণ উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে উদ্ভূত কোনো ভুল বোঝাবুঝি বা ভ্রান্ত ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->