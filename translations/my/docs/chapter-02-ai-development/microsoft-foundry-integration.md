# Microsoft Foundry ကို AZD နှင့် ပေါင်းစည်းခြင်း

**အခန်းလမ်းညွှန်:**
- **📚 သင်တန်း ပင်မစာမျက်နှာ**: [AZD အကြောင်း အခြေခံ](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 2 - AI ပထမဦးဆုံး တိုးတက်မှု
- **⬅️ ယခင် အခန်း**: [အခန်း 1: သင်၏ ပထမဆုံး ပရောဂျက်](../chapter-01-foundation/first-project.md)
- **➡️ နောက်တစ်ခု**: [AI မော်ဒယ် ဖြန့်ချိခြင်း](ai-model-deployment.md)
- **🚀 နောက်ဆုံးအခန်း**: [အခန်း 3: တွဲဖက်သတ်မှတ်မှု](../chapter-03-configuration/configuration.md)

## အနှစ်ချုပ်

ဤလမ်းညွှန်သည် Microsoft Foundry ဝန်ဆောင်မှုများကို Azure Developer CLI (AZD) နှင့် ပေါင်းစည်းပြီး စီးရီးလိုက် AI အက်ပလီကေးရှင်းများ ဖြန့်ချိခြင်းကို ပြသသည်။ Microsoft Foundry သည် AI အက်ပလီကေးရှင်းများ တည်ဆောက်ခြင်း၊ ဖြန့်ချိခြင်းနှင့် စီမံခန့်ခွဲမှုအတွက် ပြည့်စုံသော ပလက်ဖောင်းဖြစ်ပြီး AZD သည် အခြေခံအဆောက်အအုံနှင့် ဖြန့်ချိခြင်းလုပ်ငန်းစဉ်များကို ရိုးရှင်းစေသည်။

## Microsoft Foundry ဆိုတာဘာလဲ?

Microsoft Foundry သည် Microsoft ၏ AI တိုးတက်မှုအတွက် ပေါင်းစည်းထားသည့် ပလက်ဖောင်းဖြစ်ပြီး အောက်ပါအချက်များပါဝင်သည်။

- **မော်ဒယ် စာရင်း**: နောက်ဆုံးပေါ် AI မော်ဒယ်များ အသုံးပြုခွင့်
- **Prompt Flow**: AI လုပ်ငန်းစဉ်များအတွက် မြင်သာသေချာ ဖန်တီးသူ
- **Microsoft Foundry Portal**: AI အက်ပလီကေးရှင်းများအတွက် ပေါင်းစည်းထားသော ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်
- **ဖြန့်ချိခြင်း ရွေးချယ်စရာများ**: ဟိုစတင်ခြင်းနှင့် တိုးချဲ့မှု ရွေးချယ်စရာအမျိုးမျိုး
- **လုံခြုံရေးနှင့် ဖော်ထုတ်မှု**: တာဝန်ယူကုသမှု AI အင်္ဂါရပ်များပါဝင်သည်

## AZD နှင့် Microsoft Foundry: ပေါင်းစည်း၍ ပိုကောင်းစေခြင်း

| လက္ခဏာ | Microsoft Foundry | AZD ပေါင်းစည်းမှု အကျိုးကျေးဇူး |
|---------|-----------------|------------------------|
| **မော်ဒယ် ဖြန့်ချိခြင်း** | လက်ဖြင့် ပေါ်တယ် ဖြန့်ချိခြင်း | အလိုအလျောက်၊ ထပ်မံဖြန့်ချိနိုင်ခြင်း |
| **အခြေခံအဆောက်အအုံ** | ကလစ်ဖြင့် ဝင်ရောက် ဖန်တီးခြင်း | Infrastructure as Code (Bicep) |
| **ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု** | တစ်ခုတည်း ပတ်ဝန်းကျင် အာရုံစိုက်မှု | မျိုးစုံ ပတ်ဝန်းကျင် (dev/staging/prod) |
| **CI/CD ပေါင်းစည်းမှု** | ကန့်သတ်ထားသည် | Native GitHub Actions ကူညီမှု |
| **ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု** | အခြေခံ စောင့်ကြည့်မှု | ပတ်ဝန်းကျင် အလိုက် ကုန်ကျစရိတ် အကောင်းမြင့်စေမှု |

## မျှော်မှန်းချက်များ

- သင့်တော်သော ခွင့်ပြုချက်များပါရှိသည့် Azure subscription
- Azure Developer CLI တပ်ဆင်ပြီး
- Microsoft Foundry Models ဝန်ဆောင်မှုများ အသုံးပြုခွင့်
- Microsoft Foundry ကို အခြေခံ သိရှိမှု

> **လက်ရှိ AZD မူလတန်း:** ဤဥပမာများကို `azd` `1.27.1` မှာ စစ်ဆေးပြီးဖြစ်သည်။ AI agent workflow အတွက်လည်း လက်ရှိ preview extension လွှဲပြောင်းမှုနှင့် သင့်တပ်ဆင်ထားသော ဗားရှင်းကိုစစ်ဆေးပြီး စတင်ပါ။

## အဓိက ပေါင်းစည်းမှု ပုံစံများ

### ပုံစံ 1: Microsoft Foundry Models ပေါင်းစည်းခြင်း

**အသုံးပြုမှု**: Microsoft Foundry Models မော်ဒယ်များ ဖြင့် စကားပြောဆိုအက်ပလီကေးရှင်းများ ထည့်သွင်းခြင်း

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

**အခြေခံအဆောက်အအုံ (main.bicep):**
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

### ပုံစံ 2: AI ရှာဖွေရေး + RAG ပေါင်းစည်းမှု

**အသုံးပြုမှု**: အချက်ယူပြီး ဖန်တီးပုံစံ (RAG) အက်ပလီကေးရှင်းများ ဖြန့်ချိခြင်း

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

### ပုံစံ 3: စာရွက်ပညာရှင် ပေါင်းစည်းမှု

**အသုံးပြုမှု**: စာတမ်းများ ကိုငှားစီစစ်ခြင်း နှင့် စိစစ်မှု လုပ်ငန်းစဉ်များ

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

## 🔧 အတည်ျပု ပုံစံများ

### ပတ်ဝန်းကျင် မတူညီမှုများ ချိန်ညှိခြင်း

**ထုတ်လုပ်မှု ချိန်ညှိချက်:**
```bash
# အဓိက AI ဝန်ဆောင်မှုများ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# မော်ဒယ် ဖွဲ့စည်းမှုများ
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# ထိရောက်မှု ဆက်တင်များ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ဖွံ့ဖြိုးတိုးတက်မှု ချိန်ညှိချက်:**
```bash
# ဖွံ့ဖြိုးတိုးတက်မှုအတွက် ကုန်ကျစရိတ်အရ оптимizasyon ဖြစ်သော သတ်မှတ်ချက်များ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # အခမဲ့ အဆင့်
```

### Key Vault ဖြင့် လုံခြုံမှု ချိန်ညှိခြင်း

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

## ဖြန့်ချိခြင်း လုပ်ငန်းစဉ်များ

### Foundry အတွက် AZD ထွက်ပိုင်းများ

AZD သည် Microsoft Foundry ဝန်ဆောင်မှုများနှင့် အလုပ်လုပ်ရန် AI-သင့် အတွက် ထောက်ပံ့မှုများ ပါဝင်သည့် extensions များပေးသည်။

```bash
# Foundry သည့် အေးဂျင့်များ ဆက်တင်လုပ်ခြင်း
azd extension install azure.ai.agents

# ပြုပြင်မှု သွင်းဆောင်မှု ဆက်တင်လုပ်ခြင်း
azd extension install azure.ai.finetune

# စိတ်ကြိုက် မော်ဒယ်များ ဆက်တင်လုပ်ခြင်း
azd extension install azure.ai.models

# တပ်ဆင်ပြီးသော ဆက်တင်များ စာရင်းပြခြင်း
azd extension list --installed

# လက်ရှိတပ်ဆင်ထားသော အေးဂျင့် ဆက်တင် ဗားရှင်း စိစစ်ခြင်း
azd extension show azure.ai.agents
```

AI extensions များသည် preview အဆင့်တွင် အမြန်တိုးတက်နေဆဲဖြစ်သည်။ အမိန့်တစ်ခုက ဒီနေရာမှာပြသထားသကဲ့သို့မဟုတ်ကွဲပြားသွားပါက သက်ဆိုင်ရာ extension ကို ယခင်မရောက်မီ ဖြစ်စေ upgrade ပြုလုပ်ပါ။

### `azd ai` ဖြင့် agent-ပထမဆုံး ဖြန့်ချိခြင်း

agent manifest ရှိပါက `azd ai agent init` ကိုအသုံးပြု၍ Foundry Agent Service နှင့်ချိတ်ဆက်ထားသည့် ပရောဂျက်တစ်ခု ဖန်တီးပါ။

```bash
# အေးဂျင့် မနီဖက်(စ်) မှ စတင်ပါ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure သို့ တပ်ဆင်ပါ
azd up
```

`azure.ai.agents` ၏ မကြာသေးမီ preview ထွက်ရှိမှုများ၌ `azd ai agent init` အတွက် template-based initialization ထောက်ခံမှုပေါင်းထည့်ထားသည်။ နောက်ဆုံး agent နမူနာများကို လိုက်လိုက်နာ၍ သင့်တပ်ဆင်ထားသော ဗားရှင်း၏ flag များကို extension ကူညီမှုမှ ကြည့်ရှုပါ။

[AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) တွင် အမိန့်တိုက်ဆိုင်ရာလမ်းညွှန်နှင့် flag များကို ကြည့်ရှုနိုင်သည်။

### တစ်ချက်ဖြင့် ဖြန့်ချိခြင်း

```bash
# တစ်ချက် command နဲ့ အားလုံးကို တင်ပါ
azd up

# ဒါမှမဟုတ် တိုးတက်ပြီး တင်ပါ
azd provision  # အောက်ခံအဆောက်အအုံ ပဲ
azd deploy     # အပလီကေးရှင်း ပဲ

# azd 1.23.11+ မှာ ရေရှည် ပတ်လည် AI အပလီကေးရှင်း တင်မှုများအတွက်
azd deploy --timeout 1800
```

### ပတ်ဝန်းကျင်အလိုက် ဖြန့်ချိခြင်းများ

```bash
# ဖွံ့ဖြိုးမှု ပတ်ဝန်းကျင်
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

## စောင့်ကြည့်မှုနှင့် မှတ်တမ်းတင်ရေး

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

### ကုန်ကျစရိတ် စောင့်ကြည့်မှု

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

## 🔐 လုံခြုံရေး အကောင်းမြင့်အခြေအနေများ

### Managed Identity ချိန်ညှိမှု

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

### ကွန်ရက် လုံခြုံရေး

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

## တိုးတက်မှု အကောင်းမြင့်မှု

### Cache စီမံခန့်ခွဲမှုများ

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

### အလိုအလျောက် တိုးချဲ့မှု ချိန်ညှိမှု

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

## ရိုးရှင်းသော ပြဿနာများ ဖြေရှင်းခြင်း

### ပြဿနာ 1: OpenAI ခွင့်ပြုချက်ကျော်လွန်ခြင်း

**လက္ခဏာများ:**
- ဖြန့်ချိမှုကွက်လပ်ခြင်းနှင့် quota အမှားများဖြစ်ပွား
- 429 အမှား မက်ဆေ့ခ််များ ကို အသုံးပြုမှုမှတ်တမ်းများတွင်ရှိ

**ဖြေရှင်းနည်းများ:**
```bash
# လက်ရှိ ရထားသော ဂဏန်း အသုံးပြုမှု စစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# ကွဲပြားသော ဒေသကို စမ်းသပ်ပါ
azd env set AZURE_LOCATION westus2
azd up

# စွမ်းရည်ကို ခေတ္တ လျှော့ချပါ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ပြဿနာ 2: အတည်ပြုချက် မအောင်မြင်ခြင်း

**လက္ခဏာများ:**
- AI ဝန်ဆောင်မှုများချိတ်ဆက်ရာတွင် 401/403 အမှားများ
- "Access denied" စာသားများ

**ဖြေရှင်းနည်းများ:**
```bash
# အခန်းကဏ္ဍ သတ်မှတ်ချက်များကို အတည်ပြုပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# စီမံခန့်ခွဲထားသော ကိုယ့်ကိုယ်တိုင်အရိပ်အမြွက် ဖောက်ထွင်းမှုကို စစ်ဆေးပါ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault ဝင်နိုင်မှုကို မှန်ကန်မှုစစ်ဆေးပါ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ပြဿနာ 3: မော်ဒယ် ဖြန့်ချိမှု ပြဿနာများ

**လက္ခဏာများ:**
- မော်ဒယ်များ ဖြန့်ချိခြင်းအတွင်း မရရှိနိုင်ခြင်း
- တိတိကျကျ မော်ဒယ်ဗားရှင်းများ မအောင်မြင်ခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# တိုင်းဒေသအလိုက် ရနိုင်သော မော်ဒယ်များကို စာရင်းပြုစုပါ
az cognitiveservices model list --location eastus

# bicep အကြမ်းဖျဉ်းတွင် မော်ဒယ် ဗားရှင်းကို ဖော်ပြပါ
# မော်ဒယ် စွမ်းဆောင်ရည် လိုအပ်ချက်များကို စစ်ဆေးပါ
```

## ဥပမာထုတ်လွှင့်သည့်ပုံစံများ

### RAG စကားပြောဆို အက်ပလီကေးရှင်း (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ဖော်ပြချက်**: လူကြိုက်များဆုံး Azure AI နမူနာ - မိမိစာရွက်စာတမ်းများကို မေးခွန်းမေးနိုင်သည့် ထုတ်လုပ်မှုအဆင်သင့် RAG စကားပြောဆို အက်ပလီကေးရှင်း။ GPT-4.1-mini စကားပြောဆိုအတွက်၊ text-embedding-3-large နှင့် အတူ အသုံးပြုသည်။ Azure AI Search နှင့် ကိုက်ညီစွာ ရှာဖွေရေးအတွက် ထောက်ပံ့သည်။ မျိုးစုံစာရွက်စာတမ်းများ၊ အသံထည့်သွင်းခြင်း/ထွက်ရှိခြင်း၊ Microsoft Entra အတည်ပြုချက်နှင့် Application Insights ထောက်လှမ်းမှု ပါဝင်သည်။

**လျင်မြန်စွာ စတင်ရန်**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG စကားပြောဆို အက်ပလီကေးရှင်း (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ဖော်ပြချက်**: Python RAG စကားပြောဆို နမူနာ၏ .NET/C# ချီးမွမ်းမှု။ ASP.NET Core Minimal API နှင့် Blazor WebAssembly frontend အားဖြင့် တည်ဆောက်ထားသည်။ အသံစကားပြောဆို၊ GPT-4o-mini vision ထောက်ပံ့ခြင်းနှင့် .NET MAUI Blazor Hybrid desktop/mobile client ကို ပါဝင်သည်။

**လျင်မြန်စွာ စတင်ရန်**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG စကားပြောဆို အက်ပလီကေးရှင်း (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ဖော်ပြချက်**: Langchain4J ကို အသုံးပြု၍ Java ဗားရှင်း RAG စကားပြောဆို နမူနာ။ microservice event-driven architecture၊ ရှာဖွေရေးနည်းဗျူဟာ အမျိုးမျိုး (စာသား၊ vector၊ သုညအစပ်)၊ Azure Document Intelligence နှင့် စာရွက်တင်ပြမှု၊ Azure Container Apps သို့မဟုတ် Azure Kubernetes Service တွင် ဖြန့်ချိနိုင်ပါသည်။

**လျင်မြန်စွာ စတင်ရန်**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry နှင့် Enterprise Retail Copilot

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ဖော်ပြချက်**: Microsoft Foundry နှင့် Prompty ကို အသုံးပြုသော retail RAG copilot အဆုံးအထိဖြန့်ချိချက်။ Contoso Outdoor retailer chatbot သည် ထုတ်ကုန်စာရင်းနှင့် ဖောက်သည် အမှာစာ ဒေတာများ အခြေတည်၍ ဖြေကြားသည်။ GenAIOps workflow အားလုံးကို ပြသသည် - Prompty ဖြင့် မှုန်းပုံဖန်တီးခြင်း၊ AI ဆဲဆေးမှုအကူအညီဖြင့် သုံးသပ်ခြင်း၊ AZD မွတဆင့် Container Apps သို့ ဖြန့်ချိခြင်း။

**လျင်မြန်စွာ စတင်ရန်**:
```bash
azd init --template contoso-chat
azd up
```

### စိတ်ကူးဖန်တီး Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**ဖော်ပြချက်**: Prompty ဖြင့် AI agent အုပ်ချုပ်မှုကို ပြသသည့် multi-agent နမူနာ။ သုတေသန agent (Bing Grounding in Azure AI Agent Service), ထုတ်ကုန် agent (Azure AI Search), စာရေးသူ agent နှင့် စီစစ်သူ agent တို့သည် သုတေသနပြည့်စုံသော ဆောင်းပါးများကို ပူးပေါင်းဖန်တီးပါသည်။ GitHub Actions တွင် CI/CD ဖြင့် အကဲဖြတ်မှုပါဝင်သည်။

**လျင်မြန်စွာ စတင်ရန်**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**ဖော်ပြချက်**: LangChain.js နှင့် Serverless RAG chatbot ပြည့်စုံစွာ အသုံးပြုသော Azure Functions နှင့် Azure Static Web Apps ဖြင့် API နှင့် ဟိုစတင်မှု ဖော်ဆောင်သည်။ Azure Cosmos DB ကို vector store နှင့် စကားပြောဆို သမိုင်းစာရင်း အေကာင်းအချက် အတွက် အသုံးပြုသည်။ Ollama ဖြင့် ဒေသတွင်း ဖွံ့ဖြိုးတိုးတက်မှုအတွက် စျေးကင်းသည့် စမ်းသပ်မှုကို ထောက်ပံ့သည်။

**လျင်မြန်စွာ စတင်ရန်**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### သင့်ဒေတာနှင့် စကားပြောဆိုဖြေရှင်းချက် မြန်ဆန်စွာ စတင်ခြင်း

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**ဖော်ပြချက်**: စီမံခန့်ခွဲရေး portal ပါရှိသည့် အဖွဲ့အစည်းအသုံးပြု အဆင်ပြေသော RAG ဖြေရှင်းချက် မြန်ဆန်စွာထုတ်လွှင့်ရန် အစကနေ စတင်သည်။ စာရွက်တင်ခြင်း/စီမံခန့်ခွဲမှု၊ orchestrator ရွေးချယ်စရာများ (Semantic Kernel, LangChain, Prompt Flow), အသံမှ စာသားသို့၊ Microsoft Teams ပေါင်းစည်းမှု၊ PostgreSQL သို့မဟုတ် Cosmos DB အထောက်အထား ရွေးချယ်မှု ပါဝင်သည်။ ထုတ်လုပ်မှုပုံစံများအတွက် တပ်ဆင်မှု စတင်အမှတ်အသား။

**လျင်မြန်စွာ စတင်ရန်**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ခရီးသွား အေးဂျင့်များ — Multi-Agent MCP အုပ်ချုပ်မှု

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**ဝန်ဆောင်မှုများ**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**ဖော်ပြချက်**: ဘာသာစကား ၄ မျိုးဖြင့် ဖန်တီးထားသော MCP (Model Context Protocol) ဆာဗာများကို OpenTelemetry စောင့်ကြည့်မှုဖြင့် serverless Azure Container Apps အဖြစ် ဖြန့်ချိပြီး multi-agent AI အုပ်ချုပ်မှုအတွက် နမူနာ အက်ပလီကေးရှင်း။ သုံးခုသော framework များ (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework) အသုံးပြုသည်။

**လျင်မြန်စွာ စတင်ရန်**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**ဝန်ဆောင်မှုများ**: Azure AI Services + Azure OpenAI

**ဖော်ပြချက်**: Azure AI ဝန်ဆောင်မှုများနှင့် စက်မှုသင်ကြားမှု မော်ဒယ်များ ထည့်သွင်းထားသည့် အနည်းငယ်သော Bicep အပုံစံတစ်ခု။ အက်ပလီကေးရှင်း stack ပြည့်စုံ မလိုပါက Azure AI အခြေခံအဆောက်အအုံသာ လိုအပ်သည့် အခါ ချောမွေ့စွာ စတင်ရန်။

**လျင်မြန်စွာ စတင်ရန်**:
```bash
azd init --template azd-ai-starter
azd up
```

> **နမူနာ ပိုများကြည့်ရန်**: ဘာသာစကားများနှင့် ပြုပြင်မှုများအတွက် AI-အထူး AZD နမူနာ ၈၀ ကျော်ကို [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) တွင် လေ့လာနိုင်ပါသည်။

## နောက်တစ်ဆင့်များ

1. **ဥပမာများကို စမ်းသုံးပါ**: သင့်အသုံးအဆောင်ကို ကိုက်ညီသည့် ပုံစံတစ်ခုဖြင့် စမည်
2. **လိုအပ်ချက်အတွက် အသင့်ပြင်ဆင်ပါ**: အခြေခံအဆောက်အအုံနှင့် အက်ပလီကေးရှင်း ကုဒ် ကို ပြင်ဆင်ပါ
3. **စောင့်ကြည့်မှု ထည့်သွင်းပါ**: စုံလင်သော အခြေအနေထိုးခြင်း ပြုလုပ်ပါ
4. **ကုန်ကျစရိတ် တိုးတက်စေပါ**: သင့် ဘတ်ဂျက်အတိုင်း ချိန်ညှိမှုများ ပြုလုပ်ပါ
5. **လုံခြုံရေး သေချာစေပါ**: စက်မှုလုံခြုံရေး ပုံစံများ လက်တွေ့ အသုံးပြုပါ
6. **ထုတ်လုပ်မှုအဆင့်သို့ တိုးချဲ့ပါ**: မျိုးစုံဒေသများနှင့် မြင့်မားသော ရရှိနိုင်မှု အင်္ဂါရပ်များ ဖြည့်စွက်ပါ

## 🎯 လက်တွေ့ လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း 1: Microsoft Foundry Models စကားပြောဆို အက်ပလီကေးရှင်း ဖြန့်ချိခြင်း (၃၀ မိနစ်)
**ရည်ရွယ်ချက်**: ထုတ်လုပ်မှုအဆင့် AI စကားပြောဆို အက်ပလီကေးရှင်းတစ်ခု ဖြန့်ချိပြီး စမ်းသပ်ခြင်း

```bash
# အပြားပုံစံကို စတင်ဖန်တီးသည်
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ပတ်ဝန်းကျင်အဆင့်ချိန်ညှိမှုများ သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ဖြန့်ချိပါ
azd up

# အပလီကေးရှင်းကို စမ်းသပ်ပါ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI လည်ပတ်မှုများကို ကြီးကြပ်ပါ
azd monitor

# ရှင်းလင်းစင်ကြယ်ရေးလုပ်ပါ
azd down --force --purge
```

**အောင်မြင်မှု အချက်အလက်:**
- [ ] quota အမှား မဖြစ်ပွားဘဲ ဖြန့်ချိမှု အောင်မြင်သည်
- [ ] ဘရောက်ဇာတွင် စကားပြောဆို အင်တာဖေ့(စ်) ရရှိနိုင်သည်
- [ ] မေးခွန်းမေး၍ AI အားဖြင့် ဖြေကြားချက် ရည်ရွယ်မှုရရှိသည်
- [ ] Application Insights မှ telemety ဒေတာ ပြသသည်
- [ ] အရင်းအမြစ်များကို အောင်မြင်စွာ ရှင်းလင်းတင်သွင်းသည်

**ခန့်မှန်းကုန်ကျစရိတ်**: စမ်းသပ်ရန် ၃၀ မိနစ်အတွက် $5-10

### လေ့ကျင့်ခန်း 2: မော်ဒယ်များစွာ ဖြန့်ချိခြင်း ပြုပြင်ခြင်း (၄၅ မိနစ်)
**ရည်ရွယ်ချက်**: မတူညီသည့် ပုံစံများနှင့် မော်ဒယ်များစွာ ဖြန့်ချိခြင်း

```bash
# စိတ်ကြိုက် Bicep ဖွဲ့စည်းမှုကို တည်ဆောက်ပါ
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

# တပ်ဆင်ပြီး စစ်ဆေးပါ
azd provision
azd show
```

**အောင်မြင်မှု အချက်အလက်:**
- [ ] မော်ဒယ်များစွာ အောင်မြင်စွာ ဖြန့်ချိပြီး
- [ ] မတူညီသော စွမ်းဆောင်အား ချိန်ညှိမှုများ ပြုလုပ်သည်
- [ ] မော်ဒယ်များကို API ဖြင့် ရယူနိုင်သည်
- [ ] အက်ပလီကေးရှင်းမှ မော်ဒယ်နှစ်မျိုးလုံးကို ခေါ်ယူနိုင်သည်

### လေ့ကျင့်ခန်း 3: ကုန်ကျစရိတ် စောင့်ကြည့်မှု ပြုလုပ်ခြင်း (၂၀ မိနစ်)
**ရည်ရွယ်ချက်**: ဘတ်ဂျက် သတိပေးချက်များနှင့် ကုန်ကျစရိတ် စုံစမ်းခြင်း စီမံခြင်း

```bash
# Bicep တွင် ဘတ်ဂျက်သတိပေးချက် ထည့်ပါ
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

# ဘတ်ဂျက်သတိပေးချက် ထည့်သွင်းပါ
azd provision

# လက်ရှိ စရိတ်များကို စစ်ဆေးပါ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**အောင်မြင်မှု အချက်အလက်:**
- [ ] Azure တွင် ဘတ်ဂျက် သတိပေးချက် ဖန်တီးခြင်း
- [ ] အီးမေးလ် အသိပေးချက်များ စီမံခန့်ခွဲခြင်း
- [ ] Azure Portal မှ ကုန်ကျစရိတ် ဒေတာ ကြည့်ရှုနိုင်ခြင်း
- [ ] ဘတ်ဂျက် ကန့်သတ်ချက်များ အသင့်တော်စွာ သတ်မှတ်ခြင်း

## 💡 မကြာခဏ မေးလေ့ရှိသော မေးခွန်းများ

<details>
<summary><strong>ဖွံ့ဖြိုးတိုးတက်မှုကာလတွင် Microsoft Foundry Models ကုန်ကျစရိတ်ကို မည်သို့ လျော့နည်းစေမည်နည်း?</strong></summary>

1. **အခမဲ့အဆင့် အသုံးပြုပါ**: Microsoft Foundry Models သည် လစဉ် ၅၀,၀၀၀ token အခမဲ့ ပေးသည်
2. **စွမ်းဆောင်ရည် လျော့ပါ**: dev အတွက် 30+ TPM အစား 10 TPM သတ်မှတ်ပါ
3. **azd down ကို အသုံးပြုပါ**: ဖွံ့ဖြိုးမှု မပြုလုပ်သောအချိန်၌ အရင်းအမြစ်များကို ပယ်ဖျက်ပါ
4. **တုံ့ပြန်ချက်များကို ကက်ရှ် လုပ်ပါ**: ထပ်မံမေးခွန်းများအတွက် Redis cache ထည့်သွင်းပါ
5. **Prompt Engineering ကို အသုံးပြုပါ**: ထိရောက်သော prompt များဖြင့် token အသုံးပြုမှု လျော့နည်းစေပါ


```bash
# ဖွံ့ဖြိုးမှုပြင်ဆင်မှုချိန်ညှိချက်
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models နဲ့ OpenAI API တို့ကြားက မည်သည့်ကွာခြားချက်များရှိပါသလဲ?</strong></summary>

**Microsoft Foundry Models**:
- လုပ်ငန်းအဆင့်လုံခြုံရေးနှင့်လိုက်နာမှု
- ပုဂ္ဂလိကကွန်ယက်ပေါင်းစည်းခြင်း
- ၀န်ဆောင်မှုပေးချိန်သေချာချက်များ
- စီမံခန့်ခွဲထားသောအသိအမှတ်ပြုမှု
- ကြီးမားသောပမာဏများရရှိနိုင်ခြင်း

**OpenAI API**:
- မော်ဒယ်အသစ်များသို့ လျင်မြန်စွာဝင်ရောက်နိုင်ခြင်း
- လွယ်ကူသောတပ်ဆင်မှု
- ဝင်ရောက်မှုအတားအဆီးနည်းခြင်း
- အများသုံးအင်တာနက်သာအသုံးပြုနိုင်ခြင်း

ထုတ်လုပ်မှုအတွက်အက်ပ်များအတွက်တော့ **Microsoft Foundry Models ကို အကြံပြုပါသည်**။
</details>

<details>
<summary><strong>Microsoft Foundry Models ၏ quota ကျော်လွန်မှုပျောက်ဆုံမှုများကို မည်သို့ကိုင်တွယ်ရမည်နည်း?</strong></summary>

```bash
# လက်ရှိ ကိုတာ စစ်ဆေးပါ
az cognitiveservices usage list --location eastus2

# မတူညီသော ဒေသ ကြိုးစားကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up

# အားသာချက်ကို ယာယီ လျှော့ချပါ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ကိုတာ တိုးမြှင့်ရန် တောင်းဆိုပါ
# Azure Portal > Quotas > Request increase သို့ သွားပါ
```
</details>

<details>
<summary><strong>Microsoft Foundry Models နှင့် မိမိရဲ့ ကိုယ်ပိုင်ဒေတာကို အသုံးပြုနိုင်ပါသလား?</strong></summary>

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

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ဥပမာကို ကြည့်ပါ။
</details>

<details>
<summary><strong>AI မော်ဒယ် endpoints များကို မည်သို့လုံခြုံစေမည်နည်း?</strong></summary>

**အကောင်းဆုံးအလေ့အကျင့်များ**:
1. Managed Identity ကို အသုံးပြုပါ (API key မလို)
2. ပုဂ္ဂလိက Endpoints ကို ဖွင့်ပါ
3. ကွန်ယက်လုံခြုံရေးအဖွဲ့များကို စီမံပါ
4. အမြန်နှုန်းကန့်သတ်မှုကို အကောင်အထည်ဖော်ပါ
5. ဆက်ဆံချက်များအတွက် Azure Key Vault ကို အသုံးပြုပါ

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

## အသိုင်းအဝိုင်းနှင့် အထောက်အပံ့

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [တရားဝင်စာရွက်စာတမ်းများ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh ပေါ်မှ Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - သင့်အယ်ဒီတာတွင် `npx skills add microsoft/github-copilot-for-azure` ဖြင့် Azure + Foundry agent skill များတပ်ဆင်ပါ

---

**အခန်းသွားပါးဖွင့်စာမျက်နှာ:**
- **📚 မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း 2 - AI-First Development
- **⬅️ မတိုင်မီအခန်း**: [အခန်း 1: သင့်ပထမဆုံးပရောဂျက်](../chapter-01-foundation/first-project.md)
- **➡️ နောက်တစ်ခန်း**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 နောက်တစ်ခန်း**: [အခန်း 3: အသုံးပြုမှု](../chapter-03-configuration/configuration.md)

**ကူညီလိုပါသလား?** ကျွန်ုပ်တို့၏ အသိုင်းအဝိုင်း ဆွေးနွေးပွဲများတွင် ပူးပေါင်းပါ၊ သို့မဟုတ် အဆင့်သတ် မှတ်တမ်းတစ်ခုဖွင့်ပါ။ Azure AI + AZD အသိုင်းအဝိုင်းသည် သင့်အောင်မြင်မှုအတွက် အသင့်ရှိနေပါသည်!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->