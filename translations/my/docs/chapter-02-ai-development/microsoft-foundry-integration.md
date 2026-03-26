# Microsoft Foundry ကို AZD နှင့် ပေါင်းစည်းခြင်း

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: အခန်း ၂ - AI-ပထမ ဖွံ့ဖြိုးရေး
- **⬅️ Previous Chapter**: [အခန်း ၁: သင့် ပထမဆုံး ပရောဂျက်](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI မော်ဒယ် တပ်ဆင်ခြင်း](ai-model-deployment.md)
- **🚀 Next Chapter**: [အခန်း ၃: ဖွဲ့စည်းမှု](../chapter-03-configuration/configuration.md)

## အကြောင်းအကျဉ်း

ဤလမ်းညွှန်သည် Microsoft Foundry ဝန်ဆောင်မှုများကို Azure Developer CLI (AZD) နှင့် ပေါင်းစည်း၍ AI အက်ပလီကေးရှင်းများကို ပိုမိုလွယ်ကူစွာ တပ်ဆင်နိုင်စေရန် ပြသပေးပါသည်။ Microsoft Foundry သည် AI အက်ပလီကေးရှင်းများကို တည်ဆောက်၊ တပ်ဆင် နှင့် စီမံခန့်ခွဲရန် အပြည့်အစုံ ပလက်ဖောင်းကို ပံ့ပိုးပြီး AZD သည် အင်ဖရာစထရပ်ချာနှင့် တပ်ဆင်ခြင်းလုပ်ငန်းစဉ်ကို ရိုးရှင်းစေပါသည်။

## Microsoft Foundry ဆိုတာဘာလဲ?

Microsoft Foundry သည် Microsoft ၏ AI ဖွံ့ဖြိုးရေးအတွက် ညီညွတ်စုပေါင်းထားသည့် ပလက်ဖောင်းဖြစ်ပြီး အောက်ဖော်ပြပါများကို ပါဝင်သည် -

- **Model Catalog**: ခေတ်မီ AI မော်ဒယ်များသို့ ဝင်ရောက်နိုင်မှု
- **Prompt Flow**: AI လုပ်ငန်းစဉ်များအတွက် ဗစ္စူးချုပ် အလှတရား ဒီဇိုင်နာ
- **Microsoft Foundry Portal**: AI အက်ပလီကေးရှင်းများအတွက် ပေါင်းစည်းထားသော ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
- **Deployment Options**: မျိုးစုံသော ဟိုစတင်းနှင့် အရွယ်တင်ခွင့် ရွေးချယ်စရာများ
- **Safety and Security**: တာဝန်ရှိသော AI လုပ်ဆောင်ချက်များကို ထည့်သွင်းထားသည့် လုံခြုံမှုနှင့် ဘေးကင်းရေးအင်္ဂါရပ်များ

## AZD + Microsoft Foundry: ပို၍ ကောင်းမွန်စေခြင်း

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | လက်ခလုတ်ဖြင့် portal မှ တပ်ဆင်ခြင်း | အလိုအလျောက်၊ ထပ်ခါထပ်မှန် ပြန်လည်ဆောင်ရွက်နိုင်သော တပ်ဆင်မှုများ |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | တစ်ခုတည်းသော ပတ်ဝန်းကျင် အာရုံစိုက်မှု | ပတ်ဝန်းကျင်များစုံ (dev/staging/prod) |
| **CI/CD Integration** | ကန့်သတ်ချက်အချို့ရှိသည် | Native GitHub Actions ပံ့ပိုးမှု |
| **Cost Management** | မူလစောင့်ကြည့်ခြင်း | ပတ်ဝန်းကျင်အလိုက် ကုန်ကျစရိတ် အကောင်းဆုံး ချိန်ညှိနိုင်မှု |

## လိုအပ်ချက်များ

- သင့်တွင် သင့်တော်သော ခွင့်ပြုချက်များဖြင့် Azure subscription ရှိရမည်
- Azure Developer CLI ထည့်သွင်းထားရမည်
- Microsoft Foundry Models ဝန်ဆောင်မှုများသို့ ဝင်ရောက်ခွင့်ရှိရမည်
- Microsoft Foundry နှင့် အခြေခံ မှတ်ရမှုများ သိရှိမှု ရှိရမည်

## မူလ ပေါင်းစည်းမှု ပုံစံများ

### ပုံစံ 1: Microsoft Foundry Models ပေါင်းစည်းမှု

**Use Case**: Microsoft Foundry Models မော်ဒယ်များဖြင့် chat အက်ပလီကေးရှင်းများ တပ်ဆင်ခြင်း

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

**အင်ဖရာစထရပ်ချာ (main.bicep):**
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

### ပုံစံ 2: AI Search + RAG ပေါင်းစည်းမှု

**Use Case**: retrieval-augmented generation (RAG) အက်ပလီကေးရှင်းများ တပ်ဆင်ခြင်း

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

### ပုံစံ 3: Document Intelligence ပေါင်းစည်းမှု

**Use Case**: စာရွက်စာတမ်း ချိန်ခွင့်လုပ်ငန်းစဉ်များနှင့် ခွဲခြမ်းစိတ်ဖြာခြင်း

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

## 🔧 ဖွဲ့စည်းမှုပုံစံများ

### ပတ်ဝန်းကျင် အပြောင်းအလဲ အချက်များ သတ်မှတ်ခြင်း

**ထုတ်လုပ်ရေး ဖွဲ့စည်းမှု:**
```bash
# အဓိက AI ဝန်ဆောင်မှုများ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# မော်ဒယ် ပြင်ဆင်ချက်များ
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# စွမ်းဆောင်ရည် ချိန်ညှိချက်များ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ဖွံ့ဖြိုးရေး ဖွဲ့စည်းမှု:**
```bash
# ဖွံ့ဖြိုးရေးအတွက် ကုန်ကျစရိတ် ထိရောက်စွာ ညှိထားသော ဆက်တင်များ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # အခမဲ့ အဆင့်
```

### Key Vault ဖြင့် လုံခြုံစိတ်ချစွာ ဖွဲ့စည်းခြင်း

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

## တပ်ဆင်မှု လုပ်ငန်းစဉ်များ

### Foundry အတွက် AZD တိုးချဲ့မှုများ

AZD သည် Microsoft Foundry ဝန်ဆောင်မှုများနှင့် အလုပ်လုပ်ရန် AI-သက်ဆိုင်သော အင်္ဂါရပ်များကို ထည့်သွင်းပေးသည့် တိုးချဲ့မှုများကို ပံ့ပိုးပေးပါသည်။

```bash
# Foundry agents တိုးချဲ့မှုကို ထည့်သွင်းပါ
azd extension install azure.ai.agents

# fine-tuning တိုးချဲ့မှုကို ထည့်သွင်းပါ
azd extension install azure.ai.finetune

# custom models တိုးချဲ့မှုကို ထည့်သွင်းပါ
azd extension install azure.ai.models

# ထည့်သွင်းထားသော တိုးချဲ့မှုများကို စာရင်းပြပါ
azd extension list
```

### Agent-First တပ်ဆင်မှု `azd ai` ဖြင့်

agent manifest ရှိပါက၊ `azd ai agent init` ကို အသုံးပြုပြီး Foundry Agent Service နှင့် ချိတ်ဆက်ထားသော project ကို scaffold လုပ်ပါ။

```bash
# အေဂျင့် manifest မှ အစပြုရန်
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure သို့ ဖြန့်ချိရန်
azd up
```

အပြည့်အစုံသော အမိန့် ရှင်းလင်းချက်များနှင့် flag များအတွက် [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ကို ကြည့်ပါ။

### တစ်ချက်တည်း အမိန့် ဖြင့် တပ်ဆင်ခြင်း

```bash
# တစ်ချက်တည်းအမိန့်ဖြင့် အားလုံးကို တင်ပို့ပါ
azd up

# သို့မဟုတ် အဆင့်လိုက် တင်ပို့ပါ
azd provision  # အောက်ခံ အဆောက်အအုံသာ
azd deploy     # အက်ပလီကေးရှင်းသာ
```

### ပတ်ဝန်းကျင်-အထူး ရည်ညွှန်းသော တပ်ဆင်မှုများ

```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ထုတ်လုပ်မှု ပတ်ဝန်းကျင်
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## စောင့်ထိန်းခြင်းနှင့် ကြည့်ရှုနိုင်မှု

### Application Insights ပေါင်းစည်းခြင်း

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

### ကုန်ကျစရိတ် စောင့်ကြည့်ခြင်း

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

## 🔐 လုံခြုံရေး အကောင်းဆုံး လုပ်နည်းများ

### Managed Identity ဖွဲ့စည်းခြင်း

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

### ကွန်ယက် လုံခြုံရေး

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

## စွမ်းဆောင်ချက် မြှင့်တင်ခြင်း

### Cache များ အသုံးပြုနည်းများ

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

### အလိုအလျောက် အရွယ်အစား တိုးချဲ့မှု ဖွဲ့စည်းခြင်း

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

## တွေ့ရနေသော ပြဿနာများ ဖြေရှင်းနည်း

### ပြဿနာ ၁: OpenAI မှ Quota ကျော်လွန်ခြင်း

**လက္ခဏာများ:**
- quota error များနှင့်အတူ တပ်ဆင်မှု မအောင်မြင်ခြင်း
- application logs တွင် 429 error များ တွေ့ရခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# လက်ရှိ ကွိုတာအသုံးပြုမှုကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# အခြားဒေသကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up

# ကာလအနည်းငယ်အတွက် စွမ်းရည်ကို လျှော့ချပါ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ပြဿနာ ၂: အတည်ပြုခြင်း မအောင်မြင်ခြင်း

**လက္ခဏာများ:**
- AI ဝန်ဆောင်မှုများကို ခေါ်ယူရာတွင် 401/403 error များ
- "Access denied" စေသာ မက်ဆေ့ခ်ျများ

**ဖြေရှင်းနည်းများ:**
```bash
# အခန်းကဏ္ဍ တာဝန်ပေးမှုများကို အတည်ပြုပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Managed Identity ဖွဲ့စည်းပုံကို စစ်ဆေးပါ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault ဝင်ရောက်ခွင့်ကို အတည်ပြုပါ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ပြဿနာ ၃: မော်ဒယ် တပ်ဆင်မှု ပြဿနာများ

**လက္ခဏာများ:**
- မော်ဒယ်များ တပ်ဆင်မှုတွင် မရရှိနိုင်ခြင်း
- တိကျသော မော်ဒယ် ဗားရှင်းများ မအောင်မြင်ခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# ဒေသအလိုက် ရရှိနိုင်သည့် မော်ဒယ်များ စာရင်း
az cognitiveservices model list --location eastus

# bicep template ထဲရှိ မော်ဒယ် ဗားရှင်းကို အပ်ဒိတ်လုပ်ပါ
# မော်ဒယ်၏ စွမ်းဆောင်ရည် လိုအပ်ချက်များကို စစ်ဆေးပါ
```

## ဥပမာ တမ်းပလိတ်များ

### RAG Chat Application (Python)

**သိုလှောင်ရာ (Repository)**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ဖော်ပြချက်**: အများပြည်သူရေပန်းစားဆုံး Azure AI နမူနာ — ထုတ်လုပ်နိုင်သော RAG chat အက်ပ်ဖြစ်၍ ကိုယ်ပိုင် စာရွက်စာတမ်းများပေါ်မှာ မေးခွန်းမေးနိုင်သည်။ Chat အတွက် GPT-4.1-mini ကို အသုံးပြုသည်၊ embeddings အတွက် text-embedding-ada-002 ကို အသုံးပြုသည် နှင့် ပြန်လည် ရှာဖွေရန် Azure AI Search ကို အသုံးပြုသည်။ နှစ်မျိုးစုံပုံစံ စာရွက်စာတမ်းများကို ထောက်ပံ့သည်၊ အသံ input/output၊ Microsoft Entra အတည်ပြုခြင်းနှင့် Application Insights tracing ကို ပံ့ပိုးသည်။

**လျင်မြန်စတင်ခြင်း**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**သိုလှောင်ရာ (Repository)**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ဖော်ပြချက်**: Python RAG chat နမူနာ၏ .NET/C# သင်္ကေတ ညီမျိုး။ ASP.NET Core Minimal API နှင့် Blazor WebAssembly frontend ဖြင့် ဆောက်ထားသည်။ အသံ chat၊ GPT-4o-mini vision ထောက်ပံ့မှုနှင့် .NET MAUI Blazor Hybrid desktop/mobile client ပါဝင်သည်။

**လျင်မြန်စတင်ခြင်း**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**သိုလှောင်ရာ (Repository)**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ဖော်ပြချက်**: Langchain4J ကို အသုံးပြု၍ AI ဥပဒေချုပ်စီမံခန့်ခွဲမှုအတွက် Java ဗားရှင်း RAG chat နမူနာ။ မိုက်ခရိုဆာဗစ် အဖြစ် event-driven architecture၊ ရှာဖွေရန် မျိုးစုံနည်းလမ်းများ (text, vector, hybrid) ကို ထောက်ပံ့သည်၊ Azure Document Intelligence ဖြင့် စာရွက်စာတမ်းတင် တင်နိုင်ခြင်းနှင့် Azure Container Apps သို့မဟုတ် Azure Kubernetes Service တွင် တပ်ဆင်နိုင်သည်။

**လျင်မြန်စတင်ခြင်း**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**သိုလှောင်ရာ (Repository)**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ဖော်ပြချက်**: Azure AI Foundry နှင့် Prompty ကို အသုံးပြုသော အပြည့်အစုံ retail RAG copilot။ Contoso Outdoor စတိုးဆိုင်အတွက် chatbot တစ်ခုဖြစ်ကာ ထုတ်ကုန် ကတ်တလော့နှင့် ဖောက်သည် အော်ဒါ ဒေတာများကို အခြေခံ၍ ဖြေကြားချက်များ ဖန်တီးပေးသည်။ GenAIOps အလုပ်လည်ပတ်မှုကို ပြသသည် — Prompty ဖြင့် မူလပုံစံ ပြုလုပ်ခြင်း၊ AI အကူအညီဖြင့် အကဲဖြတ်ခြင်းနှင့် AZD ဖြင့် Container Apps သို့ တပ်ဆင်ခြင်း။

**လျင်မြန်စတင်ခြင်း**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**သိုလှောင်ရာ (Repository)**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**ဖော်ပြချက်**: Prompty ဖြင့် AI agent orchestration ကို ပြသထားသည့် multi-agent နမူနာ။ သုတေသန agent (Bing Grounding in Azure AI Agent Service), ထုတ်ကုန် agent (Azure AI Search), စာရေးသူ agent နှင့် တည်းဖြတ်သူ agent တို့ ပူးပေါင်း၍ သုတေသနကောင်းမွန်ပြီး အချက်အလက်များ တိကျစွာ ပါဝင်သည့် ဆောင်းပါးများ ဖန်တီးပေးသည်။ GitHub Actions တွင် အကဲဖြတ်ချက်ပါသော CI/CD ကိုပါ ပါဝင်သည်။

**လျင်မြန်စတင်ခြင်း**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**သိုလှောင်ရာ (Repository)**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**ဖော်ပြချက်**: LangChain.js ကို အသုံးပြု၍ Azure Functions ဖြင့် API ကို ဆောင်ရွက်သည့် အပြည့်အဝ serverless RAG chatbot။ Azure Static Web Apps သည် Hosting အတွက် အသုံးပြုထားပြီး Azure Cosmos DB ကို vector store နှင့် chat history database အဖြစ် အသုံးပြုထားသည်။ Ollama ဖြင့် local development ကို zero-cost စမ်းသပ်နိုင်စေသည်။

**လျင်မြန်စတင်ခြင်း**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**သိုလှောင်ရာ (Repository)**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**ဖော်ပြချက်**: စာရွက်စာတမ်း တင်သွင်း/စီမံခန့်ခွဲခြင်းအတွက် admin ပို့တယ်ပါရှိသော enterprise-အဆင့် RAG solution accelerator။ Semantic Kernel, LangChain, Prompt Flow စသည့် orchestrator မျိုးစုံ၊ အသံ-to-text, Microsoft Teams ပေါင်းစည်းမှုနှင့် PostgreSQL သို့မဟုတ် Cosmos DB ကို အခြေခံထားနိုင်သည်။ ထုတ်လုပ်ရေး RAG သင်္ကေတများအတွက် စိတ်ကြိုက်စိတ်ချမှုပေးရန် စတင်ရန် အချက်အလက်။

**လျင်မြန်စတင်ခြင်း**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**သိုလှောင်ရာ (Repository)**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**ဖော်ပြချက်**: LangChain.js, LlamaIndex.TS, Microsoft Agent Framework ဆိုသည့် Framework သုံးမျိုးကို အသုံးပြုပြီး multi-agent AI orchestration အတွက် ကိုးကားနမူနာ။ MCP (Model Context Protocol) servers များကို ဘာသာစကားလေးမျိုးဖြင့် serverless Azure Container Apps အဖြစ် တပ်ဆင်ထားပြီး OpenTelemetry monitoring ပါဝင်သည်။

**လျင်မြန်စတင်ခြင်း**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**သိုလှောင်ရာ (Repository)**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**ဝန်ဆောင်မှုများ**: Azure AI Services + Azure OpenAI

**ဖော်ပြချက်**: Azure AI ဝန်ဆောင်မှုများကို configured machine learning models ဖြင့် တပ်ဆင်ပေးသည့် သေးငယ်သေးငယ် Bicep template တစ်ခု။ အပေါ်လွှာ အက်ပလီကေးရှင်း မလိုအပ်ဘဲ Azure AI အင်ဖရာစထရပ်ချာကိုသာ provisioning လုပ်ချင်သော အစအနとして သက်သာသောစတင်ချက်။

**လျင်မြန်စတင်ခြင်း**:
```bash
azd init --template azd-ai-starter
azd up
```

> **ပိုမိုသော တမ်းပလိတ်များကို ကြည့်ရှုရန်**: 80+ AI-ဆိုင်ရာ AZD တမ်းပလိတ်များကို ဘာသာစကားများနှင့် စိန်ခေါ်မှုများအလိုက် ကြည့်ရှုနိုင်ရန် [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ကို သွားရောက်ကြည့်ပါ။

## နောက်ဆက်တွဲ လမ်းညွှန်များ

1. **ဥပမာများကို စမ်းသပ်ပါ**: သင့်အသုံးအတွက် သင့်လျော်သည့် pre-built template နှင့် စတင်ပါ
2. **သင့်လိုအပ်ချက်အတွက် မိမိလိုက် အပ်ပါ**: အင်ဖရာစထရပ်ချာနှင့် အက်ပလီကေးရှင်း ကုဒ်ကို ပြင်ဆင်ပါ
3. **မော်နိုရ်ထင်း ထားပါ**: အကောင်အထည်ဖော်ရန် ပြည့်စုံသော observability ကို ထည့်သွင်းပါ
4. **ကုန်ကျစရိတ် ညှိနှိုင်းပါ**: သင့်ဘက်ဂျက်အရ ဖော်ပြချက်များကို ညှိနှိုင်းပါ
5. **တပ်ဆင်ချက်ကို လုံခြုံစေပါ**: အဖွဲ့အစည်း လုံခြုံရေး ပုံစံများကို အကောင်အထည်ဖော်ပါ
6. **ထုတ်လုပ်ရေးသို့ ဖျော်ဖြေထားပါ**: များစွာဒေသနှင့် အမြင့်ရရှိနိုင်မှု အင်္ဂါရပ်များ ထည့်ပါ

## 🎯 လက်တွေ့ လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း ၁: Microsoft Foundry Models Chat App တပ်ဆင်ခြင်း (၃၀ မိနစ်)
**ပန်းတိုင်**: ထုတ်လုပ်နိုင်သော AI chat အက်ပလိကေးရှင်း တပ်ဆင်၍ စမ်းသပ်ပါ

```bash
# ပုံစံကို စတင်ပြင်ဆင်သည်
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ပတ်ဝန်းကျင် တန်ဖိုးများကို သတ်မှတ်သည်
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ဖြန့်ချိသည်
azd up

# အပလီကေးရှင်းကို စမ်းသပ်သည်
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI လုပ်ဆောင်ချက်များကို စောင့်ကြည့်သည်
azd monitor

# ရှင်းလင်းသည်
azd down --force --purge
```

**အောင်မြင်မှု သတ်မှတ်ချက်များ:**
- [ ] တပ်ဆင်မှု quota error မရှိဘဲ အပြီးသတ်မည်
- [ ] ဘရောက်ဇာတွင် chat မျက်နှာပြင်ကို ဝင်ရောက်ကြည့်ရှုနိုင်မည်
- [ ] မေးခွန်းမေး၍ AI အားဖြင့် ဖြေကြားချက်ရရှိနိုင်မည်
- [ ] Application Insights တွင် telemetry ဒေတာဖော်ပြမည်
- [ ] အရင်းအမှုများကို အောင်မြင်စွာ ဖျက်ရှင်းထားမည်

**ခန့်မှန်းကုန်ကျစရိတ်**: $5-10 (၃၀ မိနစ် စမ်းသပ်ရန်)

### လေ့ကျင့်ခန်း ၂: မော်ဒယ် မျိုးစုံ တပ်ဆင်ခြင်း ကို သတ်မှတ်ခြင်း (၄၅ မိနစ်)
**ပန်းတိုင်**: မျိုးစုံသော အင်္ဂါရပ်များနှင့် ကွဲပြားသည့် ဖော်ပြချက်များဖြင့် အမော်ဒယ်များ တပ်ဆင်ပါ

```bash
# စိတ်ကြိုက် Bicep ဖွဲ့စည်းချက် တည်ဆောက်ပါ
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

# တပ်ဆင်ပြီး အတည်ပြုပါ
azd provision
azd show
```

**အောင်မြင်မှု သတ်မှတ်ချက်များ:**
- [ ] မော်ဒယ်များစွာကို အောင်မြင်စွာ တပ်ဆင်ထားသည်
- [ ] ကွဲပြားသော capacity ဆက်တင်များ သတ်မှတ်ထားသည်
- [ ] မော်ဒယ်များကို API ဖြင့် ချိတ်ဆက်၍ အသုံးပြုနိုင်သည်
- [ ] အက်ပလီကေးရှင်းမှ မော်ဒယ် နှစ်ခုလုံးကို ခေါ်ယူနိုင်သည်

### လေ့ကျင့်ခန်း ၃: ကုန်ကျစရိတ် စောင့်ကြည့်မှု ကို အကောင်အထည်ဖော်ခြင်း (၂၀ မိနစ်)
**ပန်းတိုင်**: ဘတ်ဂျက် alerts နှင့် ကုန်ကျစရိတ် ချောမွေ့မှု တည်ဆောက်ပါ

```bash
# Bicep ထဲသို့ ဘတ်ဂျက် သတိပေးချက် ထည့်ပါ
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

# ဘတ်ဂျက် သတိပေးချက်ကို တပ်ဆင်ပါ
azd provision

# လက်ရှိ ကုန်ကျစရိတ်များကို စစ်ဆေးပါ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**အောင်မြင်မှု သတ်မှတ်ချက်များ:**
- [ ] Azure တွင် ဘတ်ဂျက် alert တစ်ခု ဖန်တီးထားသည်
- [ ] အီးမေးလ် အသိပေးချက်များ စီစဉ်ထားသည်
- [ ] Azure Portal တွင် ကုန်ကျစရိတ် ဒေတာ ကြည့်ရှုနိုင်သည်
- [ ] ဘတ်ဂျက် အကန့်အသတ်များကို သင့်တော်စွာ သတ်မှတ်ထားသည်

## 💡 မကြာခဏ မေးလေ့ရှိသော မေးခွန်းများ

<details>
<summary><strong>ဖွံ့ဖြိုးရေးအချိန်တွင် Microsoft Foundry Models ၏ ကုန်ကျစရိတ်ကို မည်သို့ လျှော့ချနိုင်မလဲ?</strong></summary>

1. **Free Tier အသုံးပြုပါ**: Microsoft Foundry Models သည် တစ်လလျှင် 50,000 tokens အခမဲ့ ပေးသည်
2. **Capacity လျော့ပါ**: dev အတွက် 30+ ကို မလိုအပ်ပဲ 10 TPM သတ်မှတ်ပါ
3. **azd down ကို အသုံးပြုပါ**: တတ်နိုင်သလောက် ဖွံ့ဖြိုးရေးမလုပ်နေချိန်တွင် resources ကို deallocate လုပ်ပါ
4. **တုံ့ပြန်ချက်များကို Cache ထားပါ**: ထပ်ခါတလဲလဲ မေးခွန်းများအတွက် Redis cache ကို အကောင်အထည်ဖော်ပါ
5. **Prompt Engineering ကို အသုံးပြုပါ**: ထိရောက်သော prompts ဖြင့် token အသုံးလိုခြင်းကို လျော့နည်းစေပါ

```bash
# ဖွံ့ဖြိုးရေး ဆက်တင်
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models နှင့် OpenAI API တို့မှာ မတူကြသော အချက်များ ဘာတွေလဲ?</strong></summary>

**Microsoft Foundry Models**:
- အဖွဲ့အစည်းဆိုင်ရာ လုံခြုံရေးနှင့် အညီအဝေးများ
- ပုဂ္ဂိုလ်ရေးကွန်ယက် ပေါင်းခြင်း
- SLA အာမခံချက်များ
- Managed identity ဖြင့် အတည်ပြုခြင်း
- မြင့်မားသော quota များ ရရှိနိုင်ခြင်း

**OpenAI API**:
- မော်ဒယ်အသစ်များကို လျင်မြန်စွာ ဝင်ရောက်နိုင်ခြင်း
- ရိုးရှင်းသော ဆက်တင်လုပ်ငန်းစဉ်
- ဝင်ရောက်ခွင့်ရလွယ်ခြင်း
- ဆိုရှယ် အင်တာနက်သာ အသုံးပြုနိုင်ခြင်း

ထုတ်လုပ်ရေး အက်ပလီကေးရှင်းများအတွက်၊ **Microsoft Foundry Models ကို အကြံပြုသည်**။
</details>

<details>
<summary><strong>Microsoft Foundry မော်ဒယ်များ၏ ခွင့်အကန့်အသတ် (quota) ကျော်လွန်ခြင်း အမှားများကို မည်သို့ ကိုင်တွယ်မလဲ?</strong></summary>

```bash
# လက်ရှိ ခွင့်အကန့်အသတ်ကို စစ်ဆေးပါ
az cognitiveservices usage list --location eastus2

# တခြား ဒေသကို စမ်းကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up

# ယာယီအဖြစ် စွမ်းရည်ကို လျော့ချပါ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ခွင့်အကန့်အသတ် တိုးမြှင့်ရန် တောင်းဆိုပါ
# Azure Portal > Quotas > Request increase သို့ သွားပါ
```
</details>

<details>
<summary><strong>Microsoft Foundry မော်ဒယ်များနှင့် ကိုယ်ပိုင်ဒေတာကို အသုံးပြုနိုင်ပါသလား?</strong></summary>

ဟုတ်ကဲ့! RAG (Retrieval Augmented Generation) အတွက် **Azure AI Search** ကို အသုံးပြုပါ။

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
<summary><strong>AI မော်ဒယ် endpoint များကို မည်သို့ လုံခြုံစေမည်နည်း?</strong></summary>

**အကောင်းဆုံး ကျင့်သုံးမှုများ**:
1. Managed Identity ကို အသုံးပြုပါ (API keys မလိုပါ)
2. Private Endpoints များကို ဖွင့်ပါ
3. Network security groups များကို ဖွဲ့စည်းပါ
4. Rate limiting ကို အကောင်အထည်ဖော်ပါ
5. လျှို့ဝှက်ချက်များအတွက် Azure Key Vault ကို အသုံးပြုပါ

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

## အသိုင်းအဝိုင်းနှင့် ပံ့ပိုးမှု

- **Microsoft Foundry Discord**: [#Azure ချန်နယ်](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ပြဿနာများနှင့် ဆွေးနွေးချက်များ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [တရားဝင် စာရွက်စာတမ်းများ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh တွင်ရှိသော Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - သင်၏ editor တွင် Azure + Foundry agent skills များကို `npx skills add microsoft/github-copilot-for-azure` ဖြင့် တပ်ဆင်ပါ။

---

**အခန်း လမ်းညွှန်**:
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI-First ဖွံ့ဖြိုးရေး
- **⬅️ ယခင် အခန်း**: [အခန်း 1: သင်၏ ပထမပရောဂျက်](../chapter-01-foundation/first-project.md)
- **➡️ နောက်တစ်ခု**: [AI မော်ဒယ် ဖြန့်ချိခြင်း](ai-model-deployment.md)
- **🚀 နောက် အခန်း**: [အခန်း 3: ဆက်တင်များ](../chapter-03-configuration/configuration.md)

**အကူအညီ လိုပါသလား?** အသိုင်းအဝိုင်း ဆွေးနွေးပွဲများတွင် ပါဝင်ပါ သို့မဟုတ် repository တွင် issue တစ်ခု ဖွင့်ပါ။ Azure AI + AZD အသိုင်းအဝိုင်းသည် သင် အောင်မြင်ရန် ကူညီရန်ရှိပါသည်!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်ရေးအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် မှန်ကန်မှုမရှိသော အချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူလစာတမ်းကို မူလဘာသာဖြင့် အာဏာပိုင် ရင်းမြစ်အဖြစ် သတ်မှတ်ထားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်ထံမှ ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှုကြောင့် ဖြစ်ပေါ်လာသည့် နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်သော အဓိပ္ပာယ်ဖွင့်ဆိုချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->