<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-18T13:18:53+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "my"
}
-->
# Azure AI Foundry ကို AZD နှင့် ပေါင်းစည်းခြင်း

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD သင်ခန်းစာ များအတွက်](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-First Development
- **⬅️ ယခင်အခန်း**: [အခန်း ၁: သင့်ရဲ့ ပထမဆုံး Project](../getting-started/first-project.md)
- **➡️ နောက်တစ်ခု**: [AI မော်ဒယ် တင်သွင်းခြင်း](ai-model-deployment.md)
- **🚀 နောက်အခန်း**: [အခန်း ၃: Configuration](../getting-started/configuration.md)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်စာအုပ်က Azure AI Foundry ဝန်ဆောင်မှုများကို Azure Developer CLI (AZD) နှင့် ပေါင်းစည်းပြီး AI အက်ပ်လီကေးရှင်းများကို လွယ်ကူစွာ တင်သွင်းနိုင်ရန် ပြသထားပါတယ်။ Azure AI Foundry သည် AI အက်ပ်များကို တည်ဆောက်ခြင်း၊ တင်သွင်းခြင်းနှင့် စီမံခန့်ခွဲခြင်းအတွက် စုံလင်သော ပလက်ဖောင်းဖြစ်ပြီး AZD သည် အခြေခံဖွံ့ဖြိုးမှုနှင့် တင်သွင်းမှု လုပ်ငန်းစဉ်များကို ရိုးရှင်းစေပါတယ်။

## Azure AI Foundry ဆိုတာဘာလဲ?

Azure AI Foundry သည် Microsoft ရဲ့ AI ဖွံ့ဖြိုးမှုအတွက် စုံလင်သော ပလက်ဖောင်းဖြစ်ပြီး အောက်ပါအရာများပါဝင်သည် -

- **Model Catalog**: နောက်ဆုံးပေါ် AI မော်ဒယ်များကို ရယူနိုင်ခြင်း
- **Prompt Flow**: AI လုပ်ငန်းစဉ်များအတွက် ဗစ်ရှွယ် ဒီဇိုင်နာ
- **AI Foundry Portal**: AI အက်ပ်များအတွက် ပေါင်းစည်းထားသော ဖွံ့ဖြိုးရေး ပလက်ဖောင်း
- **Deployment Options**: Hosting နှင့် Scaling အတွက် အမျိုးမျိုးသော ရွေးချယ်မှုများ
- **Safety and Security**: တာဝန်ရှိသော AI အင်္ဂါရပ်များ ပါဝင်ခြင်း

## AZD + Azure AI Foundry: ပေါင်းစည်းမှု၏ အကျိုးကျေးဇူး

| အင်္ဂါရပ် | Azure AI Foundry | AZD ပေါင်းစည်းမှု၏ အကျိုးကျေးဇူး |
|---------|-----------------|------------------------|
| **မော်ဒယ် တင်သွင်းခြင်း** | Portal မှ လက်ဖြင့် တင်သွင်းခြင်း | အလိုအလျောက်၊ ထပ်မံအသုံးပြုနိုင်သော တင်သွင်းမှု |
| **အခြေခံဖွံ့ဖြိုးမှု** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု** | တစ်ခုတည်းသော ပတ်ဝန်းကျင် | Multi-environment (dev/staging/prod) |
| **CI/CD ပေါင်းစည်းမှု** | ကန့်သတ်ထား | GitHub Actions ပေါင်းစည်းမှု |
| **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု** | အခြေခံ မော်နီတာ | ပတ်ဝန်းကျင်အလိုက် ကုန်ကျစရိတ် အထူးပြုမှု |

## လိုအပ်ချက်များ

- လိုအပ်သော ခွင့်ပြုချက်များပါဝင်သော Azure subscription
- Azure Developer CLI တပ်ဆင်ပြီးဖြစ်ရမည်
- Azure OpenAI ဝန်ဆောင်မှုများကို အသုံးပြုခွင့်ရရှိထားရမည်
- Azure AI Foundry အခြေခံ အသိအမှတ်ပြုမှု

## အဓိက ပေါင်းစည်းမှု ပုံစံများ

### ပုံစံ ၁: Azure OpenAI ပေါင်းစည်းမှု

**အသုံးပြုမှု**: Azure OpenAI မော်ဒယ်များဖြင့် Chat အက်ပ်များ တင်သွင်းခြင်း

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

**အခြေခံဖွဲ့စည်းမှု (main.bicep):**
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

### ပုံစံ ၂: AI Search + RAG ပေါင်းစည်းမှု

**အသုံးပြုမှု**: Retrieval-Augmented Generation (RAG) အက်ပ်များ တင်သွင်းခြင်း

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

### ပုံစံ ၃: Document Intelligence ပေါင်းစည်းမှု

**အသုံးပြုမှု**: စာရွက်စာတမ်းများကို စီစစ်ခြင်းနှင့် ခွဲခြမ်းစိတ်ဖြာခြင်း လုပ်ငန်းစဉ်များ

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

## 🔧 Configuration ပုံစံများ

### Environment Variables သတ်မှတ်ခြင်း

**Production Configuration:**
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

**Development Configuration:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Key Vault ဖြင့် လုံခြုံမှုရှိသော Configuration

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

## တင်သွင်းမှု လုပ်ငန်းစဉ်များ

### Single Command Deployment

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### ပတ်ဝန်းကျင်အလိုက် တင်သွင်းမှုများ

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

## မော်နီတာနှင့် ကြည့်ရှုနိုင်မှု

### Application Insights ပေါင်းစည်းမှု

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

### ကုန်ကျစရိတ် မော်နီတာ

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

## 🔐 လုံခြုံရေး အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ

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

## စွမ်းဆောင်ရည် တိုးတက်မှု

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

## ရှင်းလင်းရန် အခက်အခဲများ

### အခက်အခဲ ၁: OpenAI Quota ကျော်လွန်မှု

**လက္ခဏာများ:**
- Quota အမှားများကြောင့် တင်သွင်းမှု မအောင်မြင်ခြင်း
- Application logs တွင် 429 အမှားများ

**ဖြေရှင်းနည်းများ:**
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

### အခက်အခဲ ၂: Authentication မအောင်မြင်မှု

**လက္ခဏာများ:**
- AI ဝန်ဆောင်မှုများကို ခေါ်ဆိုရာတွင် 401/403 အမှားများ
- "Access denied" စာတိုများ

**ဖြေရှင်းနည်းများ:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### အခက်အခဲ ၃: မော်ဒယ် တင်သွင်းမှု အခက်အခဲများ

**လက္ခဏာများ:**
- တင်သွင်းမှုတွင် မော်ဒယ်များ မရရှိခြင်း
- အထူးသတ်မှတ်ထားသော မော်ဒယ် ဗားရှင်းများ မအောင်မြင်ခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## နမူနာ Template များ

### အခြေခံ Chat အက်ပ်

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Cognitive Search + App Service

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### စာရွက်စာတမ်း လုပ်ငန်းစဉ် ပိုက်လိုင်း

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**ဝန်ဆောင်မှုများ**: Document Intelligence + Storage + Functions

**Quick Start**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG ဖြင့် စီးပွားရေး Chat

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

## နောက်တစ်ဆင့်

1. **နမူနာများကို စမ်းသပ်ပါ**: သင့်အသုံးပြုမှုအတွက် ကိုက်ညီသော Template တစ်ခုကို စတင်ပါ
2. **သင့်လိုအပ်ချက်အတွက် ပြင်ဆင်ပါ**: အခြေခံဖွဲ့စည်းမှုနှင့် အက်ပ်ကုဒ်ကို ပြင်ဆင်ပါ
3. **မော်နီတာ ထည့်သွင်းပါ**: ကြည့်ရှုနိုင်မှုကို ပြည့်စုံစွာ အကောင်အထည်ဖော်ပါ
4. **ကုန်ကျစရိတ် အထူးပြုပါ**: သင့်ဘတ်ဂျက်အတွက် ဖွဲ့စည်းမှုများကို ပြင်ဆင်ပါ
5. **သင့်တင်သွင်းမှုကို လုံခြုံစေပါ**: စီးပွားရေး လုံခြုံရေး ပုံစံများကို အကောင်အထည်ဖော်ပါ
6. **ထုတ်လုပ်မှုအဆင့်သို့ တိုးတက်ပါ**: Multi-region နှင့် High-availability အင်္ဂါရပ်များ ထည့်သွင်းပါ

## အသိုင်းအဝိုင်းနှင့် အထောက်အပံ့

- **Azure AI Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD သင်ခန်းစာ များအတွက်](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-First Development
- **⬅️ ယခင်အခန်း**: [အခန်း ၁: သင့်ရဲ့ ပထမဆုံး Project](../getting-started/first-project.md)
- **➡️ နောက်တစ်ခု**: [AI မော်ဒယ် တင်သွင်းခြင်း](ai-model-deployment.md)
- **🚀 နောက်အခန်း**: [အခန်း ၃: Configuration](../getting-started/configuration.md)

**အကူအညီလိုအပ်ပါသလား?** အသိုင်းအဝိုင်းဆွေးနွေးမှုများတွင် ပါဝင်ပါ သို့မဟုတ် Repository တွင် Issue တစ်ခု ဖွင့်ပါ။ Azure AI + AZD အသိုင်းအဝိုင်းသည် သင့်အောင်မြင်မှုအတွက် အကူအညီပေးရန် ရှိနေပါသည်!

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် ရှုယူသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။