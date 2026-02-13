# Microsoft Foundry-ഉം AZD-ഉം സംയോജനം

**ചാപ്റ്റർ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD ആരംഭിക്കുന്നവർക്ക്](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: ചാപ്റ്റർ 2 - AI-പ്രഥമ വികസനം
- **⬅️ മുന്‍ അധ്യായം**: [ചാപ്റ്റർ 1: നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](../chapter-01-foundation/first-project.md)
- **➡️ അടുത്തത്**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 അടുത്ത അധ്യായം**: [ചാപ്റ്റർ 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

## അവലോകനം

ഈ ഗൈഡ് Microsoft Foundry സേവനങ്ങളെ Azure Developer CLI (AZD) ഉപയോഗിച്ച് എളുപ്പത്തിലുള്ള AI ആപ്ലിക്കേഷൻ വിന്യാസങ്ങൾക്ക് എങ്ങനെ സംയോജിപ്പിക്കാമെന്ന് 보여ിക്കുന്നു. Microsoft Foundry AI ആപ്ലിക്കേഷനുകൾ നിർമ്മിക്കുന്നതും വിന്യസിക്കുന്നതും മാനേജുചെയ്യുന്നതും සඳහා സമഗ്രമായ പ്ലാറ്റ്‌ഫോം നൽകുന്നു, AZD ഇൻഫ്രാസ്‌ട്രക്ചർ ಮತ್ತು വിന്യാസ പ്രക്രിയയെ ലളിതമാക്കുന്നു.

## Microsoft Foundry എന്താണ്?

Microsoft Foundry Microsoft-യുടെ ഏകീകൃത AI വികസന പ്ലാറ്റ്ഫോമാണ്, ഇതിൽ ഉൾപ്പെടുന്നു:

- **Model Catalog**: അവധിയുള്ള ആറുത്ത് AI മോഡലുകളിലേക്ക് ആക്സസ്
- **Prompt Flow**: AI വർക്ക്ഫ്ളോകുകൾക്കുള്ള ദൃശ്യ ഡിസൈനർ
- **AI Foundry Portal**: AI ആപ്പുകൾക്കായുള്ള ഏകീകൃത ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി
- **Deployment Options**: ഹോസ്റ്റിംഗ് և സ്കേലിങ്ങിനുള്ള പലതരം ഓപ്ഷനുകൾ
- **Safety and Security**: നിർവഹണ ഉത്തരവാദിത്വമുള്ള AI ഫീച്ചറുകൾ ഉൾപ്പെടുത്തിയിട്ടുണ്ട്

## AZD + Microsoft Foundry: ചേർന്നാൽ കൂടുതൽ ഫലപ്രദം

| സവിശേഷത | Microsoft Foundry | AZD സംയോജനലാഭം |
|---------|-----------------|------------------------|
| **Model Deployment** | പോർട്ടലിലൂടെ മാനുവൽ വിന്യാസം | ഓട്ടോമേറ്റഡ്, ആവർത്തനത്തിനായുള്ള വിന്യാസങ്ങൾ |
| **Infrastructure** | ക്ലിക്ക്-തുടർന്ന് പ്രൊവിജനിങ് | Infrastructure as Code (Bicep) |
| **Environment Management** | സിംഗിൾ എൻവയോൺമെന്റ് ഫൊക്കസ് | ബഹു-എൻവയോൺമെന്റ് (dev/staging/prod) |
| **CI/CD Integration** | പരിമിതം | നേറ്റീവ് GitHub Actions പിന്തുണ |
| **Cost Management** | അടിസ്ഥാന മോണിറ്ററിംഗ് | എൻവയോൺമെന്റ്-നിർദിഷ്ട ചെലവ് താനുകൂല്യപ്പെടുത്തൽ |

## മുൻനിബന്ധനകൾ

- അനുയോജ്യമായ അവകാശങ്ങളുള്ള Azure subscription
- Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്തിട്ടുള്ളത്
- Azure OpenAI സേവനങ്ങളിലേക്കുള്ള ആക്സസ്
- Microsoft Foundry-നെക്കുറിച്ചുള്ള അടിസ്ഥാന പരിചയം

## കോർ ഇന്റഗ്രേഷൻ മാതൃകകൾ

### മാതൃക 1: Azure OpenAI സംയോജനം

**ഉപയോഗകേസ്**: Azure OpenAI മോഡലുകൾ ഉപയോഗിച്ച് ചാറ്റ് ആപ്ലിക്കേഷനുകൾ വിന്യസിക്കുക

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

### മാതൃക 2: AI Search + RAG സംയോജനം

**ഉപയോഗകേസ്**: Retrieval-Augmented Generation (RAG) ആപ്ലിക്കേഷനുകൾ വിന്യാസിക്കുക

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

### മാതൃക 3: ഡോക്യുമെന്റ് ഇന്റലിജൻസ് സംയോജനം

**ഉപയോഗകേസ്**: ഡോക്യുമെന്റ് പ്രോസസിംഗ് և വിശകലന വർക്ക്ഫ്ലോകുകൾ

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

## 🔧 കോൺഫിഗറേഷൻ മാതൃകകൾ

### എൻവയോൺമെന്റ് വെറിയബിളുകൾ സജ്ജമാക്കൽ

**പ്രൊഡക്ഷൻ കോൺഫിഗറേഷൻ:**
```bash
# പ്രധാന എഐ സേവനങ്ങൾ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# മോഡൽ ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# പ്രകടന ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ഡെവലപ്‌മെന്റ് കോൺഫിഗറേഷൻ:**
```bash
# വികസനത്തിനായി ചെലവ്-സൗഹൃദമായ ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # സൗജന്യ തരം
```

### Key Vault ഉപയോഗിച്ച് സുരക്ഷിത കോൺഫിഗറേഷൻ

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

## വിന്യാസ വർക്ക്‌ഫ്ലോകുകൾ

### ഒറ്റ കമാൻഡ് വിന്യാസം

```bash
# ഒറ്റ കമാൻഡിലൂടെ എല്ലാം ഡിപ്പ്ലോയ് ചെയ്യുക
azd up

# അല്ലെങ്കിൽ ഘട്ടംഘട്ടമായി ഡിപ്പ്ലോയ് ചെയ്യുക
azd provision  # ഇൻഫ്രാസ്ട്രക്ചർ മാത്രം
azd deploy     # അപ്ലിക്കേഷൻ മാത്രം
```

### എൻവയോൺമെന്റ്-നിർദിഷ്ട വിന്യാസങ്ങൾ

```bash
# വികസന പരിസ്ഥിതി
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ഉത്പാദന പരിസ്ഥിതി
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## മോണിറ്ററിംഗ് અને ഓബ്സർവബിലിറ്റി

### Application Insights സംയോജനം

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

### ചെലവ് മോണിറ്ററിംഗ്

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

## 🔐 സുരക്ഷ ഉറപ്പാക്കാനുള്ള മികച്ച പ്രാക്ടീസുകൾ

### Managed Identity കോൺഫിഗറേഷൻ

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

### നെറ്റ്‌വർക്കുൾ സുരക്ഷ

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

## പ്രകടന ആപ്റ്റിമൈസേഷൻ

### കാഷിംഗ് തന്ത്രങ്ങൾ

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

### സ്വയമർച്ചിത സ്കെയ്‌ലിംഗ് കോൺഫിഗറേഷൻ

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

## സാധാരണ പ്രശ്നപരിഹാരങ്ങൾ

### പ്രശ്നം 1: OpenAI ക്വോട്ടാ മീതെ പോയി

**ലക്ഷണങ്ങൾ:**
-部署്ചകൻ ക്വോട്ടാ എററുകളോടെ പരാജയപ്പെടുന്നു
- ആപ്ലിക്കേഷൻ ലോഗുകളിൽ 429 എററുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# നിലവിലെ ക്വോട്ട ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list --location eastus

# വ്യത്യസ്ത പ്രദേശം പരീക്ഷിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താൽക്കാലികമായി ശേഷി കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### പ്രശ്നം 2:(Authentication) അഥവാ പ്രാമാണീകരണ പരാജയങ്ങൾ

**ലക്ഷണങ്ങൾ:**
- AI സേവനങ്ങളെ വിളിക്കുമ്പോൾ 401/403 എററുകൾ
- "Access denied" സന്ദേശങ്ങൾ

**പരിഹാരങ്ങൾ:**
```bash
# റോൾ നിയോഗങ്ങൾ പരിശോധിക്കുക
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# മാനേജ് ചെയ്ത ഐഡന്റിറ്റി ക്രമീകരണം പരിശോധിക്കുക
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# കീ വോൾട്ട് ആക്സസ് പരിശോധിക്കുക
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### പ്രശ്നം 3: മോഡൽ വിന്യാസ പ്രശ്നങ്ങൾ

**ലക്ഷണങ്ങൾ:**
- മോഡലുകൾ വിന്യസത്തിൽ ലഭ്യമാകുന്നില്ല
- പ്രത്യേക മോഡൽ വേർഷനുകൾ പരാജയപ്പെടുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# പ്രദേശം അനുസരിച്ച് ലഭ്യമായ മോഡലുകളുടെ പട്ടിക
az cognitiveservices model list --location eastus

# bicep ടെംപ്ലേറ്റിൽ മോഡൽ പതിപ്പ് പുതുക്കുക
# മോഡലിന്റെ ശേഷി ആവശ്യകതകൾ പരിശോധിക്കുക
```

## ഉദാഹരണ ടൺപ്ലേറ്റുകൾ

### അടിസ്ഥാന ചാറ്റ് ആപ്ലിക്കേഷൻ

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**സേവനങ്ങൾ**: Azure OpenAI + Cognitive Search + App Service

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ഡോക്യുമെന്റ് പ്രോസസ്സിംഗ് പൈപ്പ്‌ലൈൻ

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**സേവനങ്ങൾ**: Document Intelligence + Storage + Functions

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template ai-document-processing
azd up
```

### എന്റർപ്രൈസ് ചാറ്റ് (RAG ഉപയോഗിച്ച്)

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**സേവനങ്ങൾ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template contoso-chat
azd up
```

## അടുത്ത് ചെയ്യേണ്ടത്

1. **ഉദാഹരണങ്ങൾ പരീക്ഷിക്കുക**: നിങ്ങളുടെ ഉപയോഗാന്തരത്തോട് പൊരുത്തപ്പെടുന്ന പ്രീ-ബിൽറ്റ് ടെംപ്ലേറ്റ് ഉപയോഗ başlay ചെയ്യുക
2. **താങ്കളുടെ ആവശ്യാനുസരണം ഇരു**: ഇൻഫ്രാസ്ട്രക്ചറും ആപ്ലിക്കേഷൻ കോഡും തിരുത്തുക
3. **മോണിറ്ററിംഗ് ചേർക്കുക**: സമഗ്രമായ ഓബ്സർവബിലിറ്റി നടപ്പാക്കുക
4. **ചെലവ് പരിമിതപ്പെടുത്തുക**: നിങ്ങളുടെ ബഡ്ജറ്റിനായി കോൺഫിഗറേഷനുകൾ മസിച്ചു മെച്ചപ്പെടുത്തുക
5. **വിന്യാസം സുരക്ഷിതമാക്കുക**: എന്റർപ്രൈസ് സുരക്ഷ മാതൃകകൾ നടപ്പാക്കുക
6. **പ്രൊഡക്ഷൻ കേന്ദ്രീകരിക്കുക**: ബഹു-റീജിയൻ և ഉയർന്ന ലഭ്യതാ ഫീച്ചറുകൾ ചേർക്കുക

## 🎯 ഹാൻഡ്സ്-ഓൺ വ്യായാമങ്ങൾ

### വ്യായാമം 1: Azure OpenAI ചാറ്റ് ആപ്പ് വിന്യാസം (30 മിനിറ്റ്)
**ലക്ഷ്യം**: പ്രൊഡക്ഷൻ-സജ്ജമായ AI ചാറ്റ് ആപ്പ് വിന്യസിച്ച് പരീക്ഷിക്കുക

```bash
# ടെംപ്ലേറ്റ് ആരംഭിക്കുക
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# പരിസ്ഥിതി വേരിയബിളുകൾ ക്രമീകരിക്കുക
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ഡിപ്ലോയ് ചെയ്യുക
azd up

# അപ്ലിക്കേഷൻ പരീക്ഷിക്കുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# എഐ പ്രവർത്തനങ്ങൾ നിരീക്ഷിക്കുക
azd monitor

# ശുചീകരിക്കുക
azd down --force --purge
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] വിന്യാസം ക്വോട്ടാ എററുകൾ കൂടാതെ പൂർത്തിയാകണം
- [ ] ബ്രൌസറിൽ ചാറ്റ് ഇന്റർഫേസ് ആക്സസ് ചെയ്യാം
- [ ] ചോദ്യങ്ങൾ ചോദിച്ച് AI-ചാലക പ്രതികരണങ്ങൾ ലഭിക്കാം
- [ ] Application Insights ടെലിമെട്രി ഡാറ്റ കാണിക്കുന്നു
- [ ] റിസോഴ്സ് കളെ വിജയകരമായി നീക്കംചെയ്തതായി സ്ഥിരീകരിച്ചു

**അനുമാന ചെലവ്**: 30 മിനിറ്റിന്റെ ടെസ്റ്റിംഗിന് $5-10

### വ്യായാമം 2: മൾട്ടി-മോഡൽ വിന്യാസം കോൺഫിഗർ ചെയ്യുക (45 മിനിറ്റ്)
**ലക്ഷ്യം**: വ്യത്യസ്ത കോൺഫിഗറേഷനുകളോടെ ഒക്കെ മോഡലുകൾ വിന്യസിക്കുക

```bash
# കസ്റ്റം Bicep ക്രമീകരണം സൃഷ്ടിക്കുക
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

# ഡിപ്ലോയ് ചെയ്ത് സ്ഥിരീകരിക്കുക
azd provision
azd show
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] പല മോഡലുകളും വിജയകരമായി വിന്യസിച്ചു
- [ ] വ്യത്യസ്ത ശേഷി ക്രമീകരണങ്ങൾ പ്രയോഗിച്ചു
- [ ] മോഡലുകൾ API മുഖാന്തിരം ആക്സസ്ബിളാണ്
- [ ] ആപ്ലിക്കേഷൻ നിന്ന് രണ്ട് മോഡലുകളെയും വിളിക്കാൻ കഴിയണം

### വ്യായാമം 3: ചെലവ് മോണിറ്ററിംഗ് നടപ്പാക്കുക (20 മിനിറ്റ്)
**ലക്ഷ്യം**: ബഡ്ജറ്റ് അലർട്ടുകൾ և ചെലവ് ട്രാക്കിംഗ് സജ്ജമാക്കുക

```bash
# Bicep-ൽ ബജറ്റ് അലർട്ട് ചേർക്കുക
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

# ബജറ്റ് അലർട്ട് വിന്യസിക്കുക
azd provision

# നിലവിലെ ചെലവുകൾ പരിശോധിക്കുക
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] Azure-ൽ ബഡ്ജറ്റ് അലർട്ട് സൃഷ്ടിച്ചു
- [ ] ഇമെയിൽ നോട്ടിഫിക്കേഷനുകൾ കോൺഫിഗർ ചെയ്തു
- [ ] Azure പോർട്ടലിൽ ചെലവുചെലവുകൾ കാണാൻ കഴിയും
- [ ] ബഡ്ജറ്റ് പരിധികൾ അനുയോജ്യമായി സജ്ജമാക്കി

## 💡 അധികമായി ചോദിക്കപ്പെടുന്ന ചോദ്യങ്ങൾ

<details>
<summary><strong>ഡെവലപ്‍മെന്റിനിടെ Azure OpenAI ചെലവ് കുറയ്ക്കാൻ എങ്ങനെ?</strong></summary>

1. **ഫ്രീ ടയർ ഉപയോഗിക്കുക**: Azure OpenAI മാസംവെച്ച് 50,000 tokens സൗജന്യമായി നൽകുന്നു
2. **ശേഷി കുറക്കുക**: ഡെവിനായി ശേഷി 30+ ന്റെ പകരം 10 TPM ആയി സജ്ജമാക്കുക
3. **azd down ഉപയോഗിക്കുക**: സജീവമായി ഡെവലപ് ചെയ്യാത്തപ്പോൾ റിസോഴ്സുകൾ ഡീഅലോക്കേറ്റ് ചെയ്യുക
4. **പ്രതികരണങ്ങൾ കാഷ് ചെയ്യുക**: ആവർത്തിച്ച് വരുന്ന ക്വെറിയുകൾക്കായി Redis cache നടപ്പാക്കി
5. **Prompt Engineering ഉപയോഗിക്കുക**: ഫലപ്രദമായ പ്രോംപ്റ്റുകളാൽ ടോക്കൺ ഉപയോഗം കുറയ്ക്കുക

```bash
# വികസന ക്രമീകരണം
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI-നും OpenAI API-നും ഇടയിലെ വ്യത്യാസം എന്താണ്?</strong></summary>

**Azure OpenAI**:
- എന്റർപ്രൈസ് സുരക്ഷയും കംപ്ലയൻസ്
- പ്രൈവറ്റ് നെറ്റ്‌വർക്ക് ഇന്റഗ്രേഷൻ
- SLA ഉറപ്പുകൾ
- Managed identity-based പ്രാമാണീകരണം
- കൂടുതൽ ഉയർന്ന ക്വോട്ടകൾ ലഭ്യമാണ്

**OpenAI API**:
- പുതിയ മോഡലുകൾക്ക് വേഗത്തിൽ ആക്‌സസ്
- ലളിതമായ സെറ്റപ്പ്
- പ്രവേശനത്തിന് കുറഞ്ഞ തടസ്സം
- പൊതുഇന്റർനെറ്റ് മാത്രമേ പിന്തുണയ്ക്കൂ

പ്രൊഡക്ഷൻ ആപ്പുകൾക്കായി, **Azure OpenAI ശുപാർശ ചെയ്യപ്പെടുന്നു**.
</details>

<details>
<summary><strong>Azure OpenAI ക്വോട്ടാ മീതെ പോയ എററുകൾ എങ്ങനെ കൈകാര്യം ചെയ്യാം?</strong></summary>

```bash
# നിലവിലെ ക്വോട്ട് പരിശോധിക്കുക
az cognitiveservices usage list --location eastus2

# വ്യത്യസ്ത റീജിയൻ പരീക്ഷിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താൽക്കാലികമായി ശേഷി കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ക്വോട്ട് വർദ്ധനവിനായി അഭ്യർത്ഥിക്കുക
# Azure പോർട്ടലിലേക്ക് പോകുക > ക്വോട്ടുകൾ > വർദ്ധനവിന് അപേക്ഷിക്കുക
```
</details>

<details>
<summary><strong>എനിക്ക് എന്റെ സ്വന്തം ഡാറ്റ Azure OpenAI-യിൽ ഉപയോഗിക്കാമോ?</strong></summary>

അതെ! RAG (Retrieval Augmented Generation) വേണ്ടി **Azure AI Search** ഉപയോഗിക്കുക:

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
<summary><strong>AI മോഡൽ എന്റ്പൊയിൻറ്റുകൾ എങ്ങനെ സുരക്ഷിതമാക്കാം?</strong></summary>

**മെച്ചപ്പെട്ട പ്രാക്ടീസുകൾ**:
1. Managed Identity ഉപയോഗിക്കുക (API കീകൾ ഇല്ലാതെ)
2. Private Endpoints സജീവമാക്കുക
3. നെറ്റ്‌വർക്ക്ന സെക്യൂരിറ്റി ഗ്രൂപ്പുകൾ കോൺഫിഗർ ചെയ്യുക
4. റേറ്റ് ലിമിറ്റിംഗ് നടപ്പാക്കുക
5. രഹസ്യങ്ങൾക്കായി Azure Key Vault ഉപയോഗിക്കുക

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

## കമ്മ്യൂണിറ്റി ആൻഡ് പിന്തുണ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**ചാപ്റ്റർ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് هോം**: [AZD ആരംഭിക്കുന്നവർക്ക്](../../README.md)
- **📖 നിലവിലുള്ള അധ്യായം**: ചാപ്റ്റർ 2 - AI-പ്രഥമ വികസനം
- **⬅️ മുന്‍ അധ്യായം**: [ചാപ്റ്റർ 1: നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](../chapter-01-foundation/first-project.md)
- **➡️ അടുത്തത്**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 അടുത്ത അധ്യായം**: [ചാപ്റ്റർ 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

**സഹായം വേണോ?** community discussions-ൽ ചേക്കേറുക അല്ലെങ്കിൽ repository-യിൽ ഒരു issue തുറക്കുക. Azure AI + AZD കമ്മ്യൂണിറ്റി നിങ്ങളെ വിജയിപ്പിക്കാൻ ഇവിടെ ഉണ്ട്!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്ക്ലെയിമർ:
ഈ പ്രമാണം AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, യാന്ത്രികമായി നിർവഹിച്ച വിവർത്തനങ്ങളിൽ പിഴവുകളോ അസൂയങ്ങളോ ഉണ്ടായേക്കാമെന്നതിൽ ദയവായി ശ്രദ്ധിക്കുക. മാതൃഭാഷയിൽ ഉള്ള മൂല പ്രമാണം പ്രാമാണികമായ ഉറവിടമായി കണക്കാക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശിക്കുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ചതിലൂടെ ഉണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണകളും തെറ്റായ വ്യാഖ്യാനങ്ങളും സംബന്ധിച്ച് ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->