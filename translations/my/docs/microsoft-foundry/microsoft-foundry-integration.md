# Microsoft Foundry ကို AZD နှင့် ပေါင်းစည်းခြင်း

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-First Development
- **⬅️ အရင်အခန်း**: [အခန်း ၁: သင့်ရဲ့ ပထမဆုံး Project](../getting-started/first-project.md)
- **➡️ နောက်တစ်ခု**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 နောက်အခန်း**: [အခန်း ၃: Configuration](../getting-started/configuration.md)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်မှာ Microsoft Foundry ဝန်ဆောင်မှုများကို Azure Developer CLI (AZD) နှင့် ပေါင်းစည်းပြီး AI အပလီကေးရှင်းများကို အလွယ်တကူ တင်သွင်းနိုင်ရန် ပြသထားပါတယ်။ Microsoft Foundry သည် AI အပလီကေးရှင်းများကို တည်ဆောက်ခြင်း၊ တင်သွင်းခြင်းနှင့် စီမံခန့်ခွဲခြင်းအတွက် အပြည့်အစုံသော ပလက်ဖောင်းကို ပေးစွမ်းပြီး AZD သည် အခြေခံအဆောက်အအုံနှင့် တင်သွင်းမှုလုပ်ငန်းစဉ်ကို လွယ်ကူစေသည်။

## Microsoft Foundry ဆိုတာဘာလဲ?

Microsoft Foundry သည် AI တိုးတက်မှုအတွက် Microsoft ရဲ့ ပေါင်းစည်းထားသော ပလက်ဖောင်းဖြစ်ပြီး အောက်ပါအရာများပါဝင်သည်-

- **Model Catalog**: အဆင့်မြင့် AI မော်ဒယ်များကို ရယူနိုင်ခြင်း
- **Prompt Flow**: AI လုပ်ငန်းစဉ်များအတွက် Visual Designer
- **AI Foundry Portal**: AI အပလီကေးရှင်းများအတွက် ပေါင်းစည်းထားသော ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်
- **Deployment Options**: Hosting နှင့် Scaling အမျိုးမျိုး
- **Safety and Security**: တာဝန်ရှိသော AI အင်္ဂါရပ်များပါဝင်သည်

## AZD + Microsoft Foundry: ပေါင်းစည်းမှု၏ အကျိုးကျေးဇူး

| အင်္ဂါရပ် | Microsoft Foundry | AZD ပေါင်းစည်းမှု၏ အကျိုးကျေးဇူး |
|---------|-----------------|------------------------|
| **Model Deployment** | Portal မှ Manual Deployment | Automated, Repeatable Deployment |
| **Infrastructure** | Click-through Provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single Environment Focus | Multi-environment (Dev/Staging/Prod) |
| **CI/CD Integration** | အကန့်အသတ်ရှိ | GitHub Actions ကို သဘာဝအတိုင်း ပံ့ပိုးမှု |
| **Cost Management** | အခြေခံ Monitoring | Environment-specific Cost Optimization |

## လိုအပ်ချက်များ

- Azure subscription (လိုအပ်သော ခွင့်ပြုချက်များပါရှိ)
- Azure Developer CLI ကို Install လုပ်ထား
- Azure OpenAI ဝန်ဆောင်မှုများကို အသုံးပြုနိုင်
- Microsoft Foundry အခြေခံကို နားလည်ထား

## အဓိက ပေါင်းစည်းမှု Pattern များ

### Pattern 1: Azure OpenAI Integration

**အသုံးပြုမှု**: Azure OpenAI မော်ဒယ်များနှင့် Chat Application များကို Deploy လုပ်ခြင်း

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

### Pattern 2: AI Search + RAG Integration

**အသုံးပြုမှု**: Retrieval-Augmented Generation (RAG) Application များကို Deploy လုပ်ခြင်း

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

**အသုံးပြုမှု**: Document ကို အလုပ်လုပ်စဉ်များနှင့် Analysis Workflow များ

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

## 🔧 Configuration Pattern များ

### Environment Variables Setup

**Production Configuration:**
```bash
# အဓိက AI ဝန်ဆောင်မှုများ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# မော်ဒယ်ဖွဲ့စည်းမှုများ
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# စွမ်းဆောင်ရည်ဆက်တင်များ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# ဖွံ့ဖြိုးတိုးတက်မှုအတွက်ကုန်ကျစရိတ်ကိုအကောင်းဆုံးချိန်ညှိထားသောအပြင်အဆင်များ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # အခမဲ့အဆင့်
```

### Key Vault ဖြင့် လုံခြုံ Configuration

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

### Single Command Deployment

```bash
# တစ်ချက်တည်းနဲ့ အားလုံးကို Deploy လုပ်ပါ
azd up

# ဒါမှမဟုတ် တဖြည်းဖြည်း Deploy လုပ်ပါ
azd provision  # Infrastructure ပဲ
azd deploy     # Application ပဲ
```

### Environment-Specific Deployment များ

```bash
# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ထုတ်လုပ်မှုပတ်ဝန်းကျင်
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoring နှင့် Observability

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

## 🔐 လုံခြုံရေးအကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ

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

## အခက်အခဲများကို ဖြေရှင်းခြင်း

### အခက်အခဲ ၁: OpenAI Quota ကျော်လွန်မှု

**လက္ခဏာများ:**
- Deployment မအောင်မြင်ခြင်း
- Application Logs တွင် 429 Error များ

**ဖြေရှင်းနည်းများ:**
```bash
# လက်ရှိကိုတာအသုံးပြုမှုကိုစစ်ဆေးပါ
az cognitiveservices usage list --location eastus

# တစ်ခြားဒေသကိုကြိုးစားပါ
azd env set AZURE_LOCATION westus2
azd up

# အချိန်ပိုင်းစွမ်းရည်ကိုလျှော့ချပါ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### အခက်အခဲ ၂: Authentication Failures

**လက္ခဏာများ:**
- AI ဝန်ဆောင်မှုများကို ခေါ်ဆိုရာတွင် 401/403 Error များ
- "Access Denied" စာများ

**ဖြေရှင်းနည်းများ:**
```bash
# အခန်းကဏ္ဍပေးအပ်မှုများကိုအတည်ပြုပါ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# စီမံခန့်ခွဲထားသောအတိအကျကိုစစ်ဆေးပါ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault ဝင်ရောက်ခွင့်ကိုအတည်ပြုပါ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### အခက်အခဲ ၃: Model Deployment အခက်အခဲများ

**လက္ခဏာများ:**
- Deployment တွင် မော်ဒယ်များ မရရှိခြင်း
- မော်ဒယ် Version အချို့ မအောင်မြင်ခြင်း

**ဖြေရှင်းနည်းများ:**
```bash
# ရှိရှိသောမော်ဒယ်များကိုဒေသအလိုက်စာရင်းပြုလုပ်ပါ
az cognitiveservices model list --location eastus

# bicep template တွင်မော်ဒယ်ဗားရှင်းကိုအပ်ဒိတ်လုပ်ပါ
# မော်ဒယ်စွမ်းရည်လိုအပ်ချက်များကိုစစ်ဆေးပါ
```

## Template များ၏ နမူနာ

### အခြေခံ Chat Application

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Cognitive Search + App Service

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Document Processing Pipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Services**: Document Intelligence + Storage + Functions

**Quick Start**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise Chat with RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

## နောက်တစ်ဆင့်များ

1. **နမူနာများကို စမ်းသပ်ပါ**: သင့် Use Case နှင့် ကိုက်ညီသော Template ကို စတင်ပါ
2. **သင့်လိုအပ်ချက်များအတွက် Customize လုပ်ပါ**: Infrastructure နှင့် Application Code ကို ပြင်ဆင်ပါ
3. **Monitoring ထည့်သွင်းပါ**: Observability ကို အပြည့်အဝ အကောင်အထည်ဖော်ပါ
4. **ကုန်ကျစရိတ်များကို Optimize လုပ်ပါ**: သင့် Budget အတွက် Configuration များကို ပြင်ဆင်ပါ
5. **Deployment ကို လုံခြုံစေပါ**: Enterprise Security Pattern များကို အသုံးပြုပါ
6. **Production အဆင့်သို့ Scale လုပ်ပါ**: Multi-region နှင့် High-availability အင်္ဂါရပ်များ ထည့်သွင်းပါ

## 🎯 လက်တွေ့ လေ့ကျင့်မှုများ

### လေ့ကျင့်မှု ၁: Azure OpenAI Chat App ကို Deploy လုပ်ပါ (၃၀ မိနစ်)
**ရည်ရွယ်ချက်**: Production-ready AI Chat Application ကို Deploy လုပ်ပြီး စမ်းသပ်ပါ

```bash
# အခြေခံပုံစံကို စတင်ပါ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ပတ်ဝန်းကျင်အပြောင်းအလဲများကို သတ်မှတ်ပါ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# တင်သွင်းပါ
azd up

# အက်ပလီကေးရှင်းကို စမ်းသပ်ပါ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI လုပ်ဆောင်မှုများကို စောင့်ကြည့်ပါ
azd monitor

# ရှင်းလင်းပါ
azd down --force --purge
```

**အောင်မြင်မှုအချက်များ:**
- [ ] Deployment အောင်မြင်စွာ ပြီးမြောက်
- [ ] Browser တွင် Chat Interface ကို ဝင်ရောက်နိုင်
- [ ] မေးခွန်းများ မေးပြီး AI-powered အဖြေများ ရရှိ
- [ ] Application Insights တွင် Telemetry Data တွေ့ရှိ
- [ ] Resources များကို အောင်မြင်စွာ ရှင်းလင်း

**ခန့်မှန်းကုန်ကျစရိတ်**: စမ်းသပ်မှု ၃၀ မိနစ်အတွက် $5-10

### လေ့ကျင့်မှု ၂: Multi-Model Deployment ကို Configure လုပ်ပါ (၄၅ မိနစ်)
**ရည်ရွယ်ချက်**: မော်ဒယ်များ အမျိုးမျိုးကို ကွဲပြားသော Configuration များဖြင့် Deploy လုပ်ပါ

```bash
# အထူး Bicep configuration ဖန်တီးပါ
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

# တင်သွင်းပြီး အတည်ပြုပါ
azd provision
azd show
```

**အောင်မြင်မှုအချက်များ:**
- [ ] မော်ဒယ်များ အောင်မြင်စွာ Deploy လုပ်ပြီး
- [ ] ကွဲပြားသော Capacity Setting များကို အသုံးပြု
- [ ] API မှတဆင့် မော်ဒယ်များကို ဝင်ရောက်နိုင်
- [ ] Application မှ မော်ဒယ်နှစ်ခုလုံးကို ခေါ်နိုင်

### လေ့ကျင့်မှု ၃: Cost Monitoring ကို အကောင်အထည်ဖော်ပါ (၂၀ မိနစ်)
**ရည်ရွယ်ချက်**: Budget Alert နှင့် Cost Tracking ကို စနစ်တကျ ပြုလုပ်ပါ

```bash
# Bicep တွင် ဘတ်ဂျက်အချက်ပေးချက် ထည့်ပါ
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

# ဘတ်ဂျက်အချက်ပေးချက် တင်ဆောင်ပါ
azd provision

# လက်ရှိကုန်ကျစရိတ်ကို စစ်ဆေးပါ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**အောင်မြင်မှုအချက်များ:**
- [ ] Azure တွင် Budget Alert တစ်ခု ဖန်တီးပြီး
- [ ] Email Notification များကို Configure လုပ်ပြီး
- [ ] Azure Portal တွင် Cost Data ကို ကြည့်နိုင်
- [ ] Budget Threshold များကို သင့်တော်စွာ သတ်မှတ်

## 💡 မကြာခဏ မေးလေ့ရှိသော မေးခွန်းများ

<details>
<summary><strong>Development အတွင်း Azure OpenAI ကုန်ကျစရိတ်ကို ဘယ်လို လျှော့ချမလဲ?</strong></summary>

1. **Free Tier ကို အသုံးပြုပါ**: Azure OpenAI သည် 50,000 tokens/month အခမဲ့ ပေးသည်
2. **Capacity ကို လျှော့ချပါ**: Development အတွက် 10 TPM သို့မဟုတ် 30+ TPM ကို သတ်မှတ်ပါ
3. **azd down ကို အသုံးပြုပါ**: Active Development မရှိသောအခါ Resources များကို Deallocate လုပ်ပါ
4. **Cache Responses**: Redis Cache ကို အသုံးပြုပြီး မေးခွန်းများကို ထပ်ခါတလဲလဲ မေးရန် ကန့်သတ်ပါ
5. **Prompt Engineering ကို အသုံးပြုပါ**: Token အသုံးပြုမှုကို ထိရောက်စွာ လျှော့ချပါ

```bash
# ဖွံ့ဖြိုးတိုးတက်ရေး configuration
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI နှင့် OpenAI API အကြား ကွာခြားချက်များက ဘာလဲ?</strong></summary>

**Azure OpenAI**:
- လုံခြုံရေးနှင့် စည်းကမ်းလိုက်နာမှု
- Private Network Integration
- SLA အာမခံချက်များ
- Managed Identity Authentication
- Quota များ ပိုမိုရရှိနိုင်

**OpenAI API**:
- မော်ဒယ်အသစ်များကို ပိုမိုလျင်မြန်စွာ ရရှိနိုင်
- Setup လုပ်ရန် ပိုမိုလွယ်ကူ
- Barrier to Entry ပိုမိုနိမ့်
- Public Internet သာ

Production Application များအတွက် **Azure OpenAI ကို အကြံပြုသည်**။
</details>

<details>
<summary><strong>Azure OpenAI Quota ကျော်လွန်မှု Error များကို ဘယ်လို ကိုင်တွယ်မလဲ?</strong></summary>

```bash
# လက်ရှိအပိုင်းအခြားကိုစစ်ဆေးပါ
az cognitiveservices usage list --location eastus2

# တစ်ခြားဒေသကိုစမ်းကြည့်ပါ
azd env set AZURE_LOCATION westus2
azd up

# အချိန်ပိုင်းစွမ်းရည်ကိုလျှော့ချပါ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# အပိုင်းအခြားတိုးမြှင့်မှုကိုတောင်းဆိုပါ
# Azure Portal > Quotas > Request increase သို့သွားပါ
```
</details>

<details>
<summary><strong>Azure OpenAI ကို ကိုယ်ပိုင် Data ဖြင့် အသုံးပြုနိုင်ပါသလား?</strong></summary>

နိုင်ပါတယ်! **Azure AI Search** ကို RAG (Retrieval Augmented Generation) အတွက် အသုံးပြုပါ:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) Template ကို ကြည့်ပါ။
</details>

<details>
<summary><strong>AI Model Endpoint များကို ဘယ်လို လုံခြုံစေမလဲ?</strong></summary>

**အကောင်းဆုံး လုပ်ထုံးလုပ်နည်းများ**:
1. Managed Identity ကို အသုံးပြုပါ (API Key မလိုအပ်)
2. Private Endpoint များ Enable လုပ်ပါ
3. Network Security Group များကို Configure လုပ်ပါ
4. Rate Limiting ကို အကောင်အထည်ဖော်ပါ
5. Azure Key Vault ကို Secrets များအတွက် အသုံးပြုပါ

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

## Community နှင့် Support

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues နှင့် Discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [တရားဝင် Documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**အခန်းအကြောင်းအရာများ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၂ - AI-First Development
- **⬅️ အရင်အခန်း**: [အခန်း ၁: သင့်ရဲ့ ပထမဆုံး Project](../getting-started/first-project.md)
- **➡️ နောက်တစ်ခု**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 နောက်အခန်း**: [အခန်း ၃: Configuration](../getting-started/configuration.md)

**အကူအညီလိုအပ်ပါသလား?** Community Discussions တွင် ပါဝင်ပါ သို့မဟုတ် Repository တွင် Issue တစ်ခု ဖွင့်ပါ။ Azure AI + AZD Community သည် သင့်အောင်မြင်မှုအတွက် အကူအညီပေးရန် ရှိနေပါသည်!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားယူမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->