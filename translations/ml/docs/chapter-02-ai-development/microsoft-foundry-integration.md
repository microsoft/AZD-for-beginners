# Microsoft Foundry Integration with AZD

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 2 - AI-ഫസ്റ്റ് ഡെവലപ്മെന്റ്
- **⬅️ മുൻ അധ്യായം**: [അധ്യായം 1: നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](../chapter-01-foundation/first-project.md)
- **➡️ അടുത്തത്**: [AI മോഡൽ വിനിയോഗം](ai-model-deployment.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

## അവലോകനം

Microsoft Foundry സേവനങ്ങൾ Azure Developer CLI (AZD) യുമായി ഇന്റഗ്രേറ്റ് ചെയ്ത് AI ആപ്ലിക്കേഷൻ ഡിപ്പ്ലോയ്മെന്റുകൾ എളുപ്പമാക്കുന്നതിനെക്കുറിച്ചുള്ള മാർഗ്ഗదర్శകമാണ് ഇത്. Microsoft Foundry AI ആപ്ലിക്കേഷനുകൾ നിർമ്മിക്കാൻ, വിനിയോഗിക്കാൻ, നിയന്ത്രിക്കാൻ സമഗ്രമായ പ്ലാറ്റ്ഫോം നൽകുന്നു, AZD ഇൻഫ്രാസ്ട്രക്ചറിലും ഡിപ്പ്ലോയ്മെന്റ് പ്രക്രിയയിലും ലളിതത്വം വാഗ്ദാനം ചെയ്യുന്നു.

## Microsoft Foundry എന്നത് എന്താണ്?

Microsoft Foundry Microsoft-ന്റെ ഏകീകൃത AI ഡെവലപ്മെന്റ് പ്ലാറ്റ്ഫോമാണ്, ഇതിൽ ഉൾപ്പെടുന്നു:

- **മോഡൽ കാറ്റലോഗ്**: ആധുനിക AI മോഡലുകളിലേക്കുള്ള പ്രവേശനം
- **പ്രോംപ്റ്റ് ഫ്ലോ**: AI പ്രവാഹങ്ങൾക്കുള്ള ദൃശ്യ ഡിസൈനർ
- **Microsoft Foundry പോർട്ടൽ**: AI ആപ്ലിക്കേഷൻസിനുള്ള സംയോജിത ഡെവലപ്മെന്റ് പരിസ്ഥിതി
- **ഡിപ്പ്ലോയ്മെന്റ് ഓപ്ഷനുകൾ**: നിരവധി ഹോസ്റ്റിംഗും സ്കെയ്ലിംഗും ഓപ്ഷനുകൾ
- **സുരക്ഷയും സുരക്ഷിതത്വവും**: നിർബന്ധിത ഉത്തരവാദിയായ AI ഫീച്ചറുകൾ ഉൾകൊള്ളുന്നു

## AZD + Microsoft Foundry: ചേർന്ന് മികച്ചത്

| സവിശേഷത | Microsoft Foundry | AZD ഇന്റഗ്രേഷൻ ഗുണങ്ങൾ |
|---------|-----------------|------------------------|
| **മോഡൽ ഡിപ്പ്ലോയ്മെന്റ്** | മാനുവൽ പോർട്ടൽ ഡിപ്പ്ലോയ്മെന്റ് | ഓട്ടോമേറ്റഡ്, ആവർത്തനീയമായ ഡിപ്പ്ലോയ്മെന്റുകൾ |
| **ഇൻഫ്രാസ്ട്രക്ചര്** | ക്ലിക്ക്-ത്രൂ പ്രൊവിഷനിംഗ് | ഇൻഫ്രാസ്ട്രക്ചർ ആസ് കോഡ് (ബി‌സെപ്) |
| **പരിസ്ഥിതി മാനേജ്മെന്റ്** | ഏക പരിസ്ഥിതി കേന്ദ്രീകരണം | മൾട്ടി-പരിസ്ഥിതി (ഡെവ്/സ്റ്റേജിംഗ്/പ്രോഡ്) |
| **CI/CD ഇന്റഗ്രേഷൻ** | പരിമിതമായ | നേറ്റീവ് GitHub അക്ക്ഷനുകൾ പിന്തുണ |
| **ചെലവ് മാനേജ്മെന്റ്** | അടിസ്ഥാന മാനിറ്ററിംഗ് | പരിസ്ഥിത spécifique ചെലവ് 최적화 |

## മുൻ‌പ്രാപ്തികൾ

- അനുയോജ്യമായ അവകാശങ്ങളോടുള്ള Azure സബ്‌സ്‌ക്രിപ്ഷൻ
- Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്ത്
- Microsoft Foundry മോഡൽസ്സ് സേവനങ്ങളിലേക്ക് ആക്സസ്
- Microsoft Foundry-യുമായി അടിസ്ഥാന പരിചയം

## പ്രധാന ഇന്റഗ്രേഷൻ പാറ്റേണുകൾ

### പാറ്റേൺ 1: Microsoft Foundry മോഡലുകൾ ഇന്റഗ്രേഷൻ

**ഉപയോഗം**: Microsoft Foundry മോഡൽസുമായുള്ള ചാറ്റ് ആപ്ലിക്കേഷനുകൾ ഡിപ്പ്ലോയ് ചെയ്യുക

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

**ഇൻഫ്രാസ്ട്രക്ചർ (main.bicep):**
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

### പാറ്റേൺ 2: AI തിരയൽ + RAG ഇന്റഗ്രേഷൻ

**ഉപയോഗം**: റിട്രീവൽ-ഓഗ്മെന്റഡ് ജനറേഷൻ (RAG) ആപ്ലിക്കേഷനുകൾ ഡിപ്പ്ലോയ് ചെയ്യുക

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

### പാറ്റേൺ 3: ഡോക്യുമെന്റ് ഇന്റലിജൻസ് ഇന്റഗ്രേഷൻ

**ഉപయోగം**: ഡോക്യുമെന്റ് പ്രോസസ്സ് ചെയ്യലുകളും വിശകലന പ്രവാഹങ്ങളും

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

## 🔧 കോൺഫിഗറേഷൻ പാറ്റേണുകൾ

### എൻവയ്റൺമെന്റ് വേറിയബിളുകൾ സജ്ജീകരണം

**പ്രൊഡക്ഷൻ കോൺഫിഗറേഷൻ:**
```bash
# കോർ എഐ സേവനങ്ങൾ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# മോഡൽ കോൺഫിഗറേഷനുകൾ
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# പ്രകടന ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ഡെവലപ്പ്മെന്റ് കോൺഫിഗറേഷൻ:**
```bash
# വികസനത്തിനുള്ള ചെലവ്-പരിഗണിച്ച സജ്ജീകരണങ്ങൾ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # സൗജന്യ തലയം
```

### കീ വാൾട്ടിനോടുകൂടെ സുരക്ഷിത കോൺഫിഗറേഷൻ

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

## ഡിപ്പ്ലോയ്മെന്റ് പ്രവാഹങ്ങൾ

### Foundry-സംബന്ധിച്ച AZD എക്‌സ്റ്റൻഷനുകൾ

AZD Microsoft Foundry സേവനങ്ങളുമായി പ്രവർത്തിക്കാനായി AI-സ്പെസിഫിക് കഴിവുകൾ ചേർക്കുന്ന എക്‌സ്റ്റൻഷനുകൾ നൽകുന്നു:

```bash
# ഫൗണ്ട്രി ഏജന്റ്സ് എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.agents

# ഫൈൻ-ട്യൂണിംഗ് എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.finetune

# കസ്റ്റം മോഡൽസ് എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.models

# ഇൻസ്റ്റാൾ ചെയ്‌ത എക്സ്റ്റൻഷനുകൾ പട്ടികപ്പെടുത്തുക
azd extension list
```

### `azd ai` ഉപയോഗിച്ച് ഏജന്റ്-ഫസ്റ്റ് ഡിപ്പ്ലോയ്മെന്റ്

ഏജന്റ് മാനിഫസ്റ്റ് ഉണ്ടെങ്കിൽ, Foundry Agent Service-ക്കായി വയർ ചെയ്ത പ്രോജക്ട് സ്കാഫോൾഡുചെയ്യാൻ `azd ai agent init` ഉപയോഗിക്കുക:

```bash
# ഏജന്റ് മാനിഫെസ്റ്റിൽ നിന്നു പ്രാരംഭീകരിക്കുക
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# അസ്യൂറിൽ വിന്യസിക്കുക
azd up
```

പൂർണ്ണ കമാൻഡ് റഫറൻസ്, ഫ്ലാഗുകൾ അറിയാൻ [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) കാണുക.

### സിംഗിൾ കമാൻഡ് ഡിപ്പ്ലോയ്മെന്റ്

```bash
# ഒരു കമാൻഡിൽ എല്ലാം വിന്യസിക്കൂ
azd up

# അല്ലെങ്കിൽ ക്രമാനുസൃതമായി വിന്യസിക്കുക
azd provision  # инф്രാസ്ട്രക്ചർ മാത്രം
azd deploy     # അപ്ലിക്കേഷൻ മാത്രം
```

### പാരിസ്ഥിതിക-നിർദ്ദിഷ്ട ഡിപ്പ്ലോയ്മെന്റുകൾ

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

## മോണിറ്ററിംഗ് און ഷെരവേച്ചിലിറ്റി

### ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇന്റഗ്രേഷൻ

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

## 🔐 സുരക്ഷിതമായ മികച്ച അനുഭവങ്ങൾ

### മാനേജ്ഡ് ഐഡന്റിറ്റി കോൺഫിഗറേഷൻ

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

### നെറ്റ്‌വർക്ക് സുരക്ഷ

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

## നിർവ്വഹണപ്രവർത്തനം മെച്ചപ്പെടുത്തൽ

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

### ഓട്ടോ-സ്കെയ്ലിംഗ് കോൺഫിഗറേഷൻ

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

## സാധാരണ പ്രശ്‌നങ്ങൾ പരിഹരിക്കൽ

### പ്രശ്‌നം 1: OpenAI ക്വോട്ടാ മിച്ചം

**ലക്ഷണങ്ങൾ:**
- ക്വോട്ടാ പിഴവുകളോടെ ഡിപ്പ്ലോയ്മെന്റ് വിഫലമാകുന്നു
- പ്രയോഗ ലോഗുകളിൽ 429 പിഴവുകൾ

**പിടിവുകൾ:**
```bash
# നിലവിലെ കൊറ്റാ ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list --location eastus

# വ്യത്യസ്ത പ്രദേശം പരീക്ഷിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താൽക്കാലികമായി ശേഷി കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### പ്രശ്‌നം 2: ഓറെതിരിച്ചറിയൽ പരാജയങ്ങൾ

**ലക്ഷണങ്ങൾ:**
- AI സേവനങ്ങൾ വിളിക്കുമ്പോൾ 401/403 പിഴവുകൾ
- "ആക്സസ് നിഷേധിച്ചു" സന്ദേശങ്ങൾ

**പിടിവുകൾ:**
```bash
# റോൾ നിയുക്തികൾ പരിശോധിക്കുക
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# മാനേജ്‍ഡ് ഐഡന്റിറ്റി ക്രമീകരണം പരിശോധിക്കുക
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# കീ വോൾട്ട് എത്ത الوصول് പരിശോധന നടപ്പാക്കുക
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### പ്രശ്‌നം 3: മോഡൽ ഡിപ്പ്ലോയ്മെന്റ് പിഴവുകൾ

**ലക്ഷണങ്ങൾ:**
- ഡിപ്പ്ലോയ്മെന്റിൽ മോഡലുകൾ ലഭ്യമല്ല
- പ്രത്യേക മോഡൽ വേർഷനുകൾ പരാജയപ്പെടുന്നു

**പിടിവുകൾ:**
```bash
# പ്രദേശം പ്രകാരം ലഭ്യമായ മോഡലുകൾ പട്ടികപ്പെടുത്തുക
az cognitiveservices model list --location eastus

# ബൈസിപ്പ് ടെംപ്ലേറ്റിൽ മോഡൽ പതിപ്പ് പുതുക്കുക
# മോഡൽ ശേഷി ആവശ്യകതകൾ പരിശോധിക്കുക
```

## ഉദാഹരണ ടെംപ്ലേറ്റുകൾ

### RAG ചാറ്റ് ആപ്ലിക്കേഷൻ (Python)

**റിപ്പോസിറ്ററി**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**സേവനങ്ങൾ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**വിവരണം**: ഏറ്റവും പ്രചാരം ഉള്ള Azure AI സാംപിൾ — നിങ്ങളുടെ സ്വന്തം ഡോക്യുമെന്റുകളിലെ ചോദിച്ചുവരുന്ന ചോദ്യങ്ങൾക്ക് ഉത്തരം നൽകുന്ന പ്രൊഡക്ഷൻ-റെഡിയായ RAG ചാറ്റ് ആപ്പ്. ചാറ്റിനായി GPT-4.1-mini, എംബെഡ്ഡിംഗിന് text-embedding-ada-002, റിട്രീവൽക്ക് Azure AI Search ഉപയോഗിക്കുന്നു. മൾട്ടിമോഡൽ ഡോക്യുമെന്റുകൾ, ശബ്ദ ഇൻപുട്ട്/ഔട്ട്പുട്ട്, Microsoft Entra ഓറതിരിച്ചറിയൽ,	Application Insights ട്രേസിങ്ങ് എന്നിവ പിന്തുണയ്ക്കുന്നു.

**ദ്രുത ആരംഭം**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG ചാറ്റ് ആപ്ലിക്കേഷൻ (.NET)

**റിപ്പോസിറ്ററി**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**സേവനങ്ങൾ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**വിവരണം**: Python RAG ചാറ്റ് സാംപിളിന്റെ .NET/C# തുല്യമായ പതിപ്പ്. ASP.NET Core Minimal API, Blazor WebAssembly ഫ്രണ്ട്‌എൻഡ് എന്നിവ ഉപയോഗിച്ച് നിർമ്മിച്ചത്. വോയിസ് ചാറ്റ്, GPT-4o-mini ദൃശ്യ പിന്തുണ, .NET MAUI Blazor ഹൈബ്രിഡ് ഡെസ്ക്ടോപ്പ്/മൊബൈൽ ക്ലയന്റ് ഇതിൽ ഉൾപ്പെടുന്നു.

**ദ്രുത ആരംഭം**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG ചാറ്റ് ആപ്ലിക്കേഷൻ (Java)

**റിപ്പോസിറ്ററി**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**സേവനങ്ങൾ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**വിവരണം**: Java പതിപ്പ് Langchain4J ഉപയോഗിച്ചുള്ള AI ഓർക്കസ്ട്രേഷൻ. മൈക്രോസർവീസ് ഇവന്റ്-ഡ്രിവൻ ആർക്കിടെക്ചർ, നിരവധി തിരച്ചിൽ തന്ത്രങ്ങൾ (ടെക്സ്റ്റ്, വക്ടർ, ഹൈബ്രിഡ്), Azure Document Intelligence ഉപയോഗിച്ചുള്ള ഡോക്യുമെന്റ് അപ്‌ലോഡ്, Azure Container Apps അല്ലെങ്കിൽ Azure Kubernetes Service-ൽ ഡിപ്പ്ലോയ്മെന്റ് എന്നിവ പിന്തുണയ്ക്കുന്നു.

**ദ്രുത ആരംഭം**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### എന്റർപ്രൈസ് റീട്ടെയിൽ കോപൈലറ്റ് Azure AI Foundry ഉപയോഗിച്ച്

**റിപ്പോസിറ്ററി**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**സേവനങ്ങൾ**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**വിവരണം**: Azure AI Foundry ഉം Prompty ഉം ഉപയോഗിച്ചുള്ള സമഗ്ര റീട്ടെയിൽ RAG കോപൈലറ്റ്. Contoso ഔട്ട്ഡോർ റീട്ടെയിൽർ ചാറ്റ്ബോട്ട്, പ്രോഡകറ്റ് കാറ്റലോഗിനും കസ്റ്റമർ ഓർഡർ ഡേറ്റയ്ക്കും അടിസ്ഥാനമാക്കി ഉത്തരങ്ങൾ നൽകുന്നു. GenAIOps പ്രവാഹം — Prompty ഉപയോഗിച്ച് പ്രോട്ടോട്ടൈപ്പ്, AI-സഹായമുള്ള വിലയിരുത്തലുകൾ, AZD വഴി Container Apps-ലേക്ക് ഡിപ്പ്ലോയ്മെന്റ്‌സ്.

**ദ്രുത ആരംഭം**:
```bash
azd init --template contoso-chat
azd up
```

### ക്രിയേറ്റീവ് എഴുത്ത് മൾട്ടി-ഏജന്റ് ആപ്ലിക്കേഷൻ

**റിപ്പോസിറ്ററി**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**സേവനങ്ങൾ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**വിവരണം**: Prompty സഹായത്തോടെ AI ഏജന്റ് ഓർക്കസ്ട്രേഷനുമായി മൾട്ടി-ഏജന്റ് സാംപിൾ. റിസർച് ഏജന്റ് (Bing Grounding, Azure AI Agent Service), പ്രോഡക്റ്റ് ഏജന്റ് (Azure AI Search), റൈറ്റർ ഏജന്റ്, എഡിറ്റർ ഏജന്റ് എന്നിവ ചേർന്ന് നന്നായി ഗവേഷണ ലേഖനങ്ങൾ സൃഷ്ടിക്കുന്നു. GitHub Actions-ൽ CI/CD ഉൾപ്പെടുന്നു.

**ദ്രുത ആരംഭം**:
```bash
azd init --template contoso-creative-writer
azd up
```

### സെർവർലെസ് RAG ചാറ്റ് (JavaScript/TypeScript)

**റിപ്പോസിറ്ററി**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**സേവനങ്ങൾ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB ഫോർ NoSQL + LangChain.js

**വിവരണം**: LangChain.js ഉപയോഗിച്ചുള്ള പൂർണ്ണ സെർവർലെസ് RAG ചാറ്റ്‌ബോട്ട്, API ക്ക് Azure Functions, ഹോസ്റ്റിംഗിനായി Azure Static Web Apps. Azure Cosmos DB വക്ടർ സ്റ്റോർ, ചാറ്റ് ഹിസ്റ്ററി ഡാറ്റാബേസായി ഉപയോഗിക്കുന്നു. ഫ്രീ ടെസ്റ്റിങ്ങിനായി Ollama ഉപയോഗിച്ചുള്ള ലോക്കൽ ഡെവലപ്പ്മെന്റ് പിന്തുണ.

**ദ്രുത ആരംഭം**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**റിപ്പോസിറ്ററി**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**സേവനങ്ങൾ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**വിവരണം**: എന്റർപ്രൈസ് ഗ്രേഡ് RAG സൊലൂഷൻ ആക്സിലറേറ്റർ, ഡോക്യുമെന്റ് അപ്‌ലോഡ്/മാനേജ്മെന്റിനുള്ള അഡ്മിൻ പോർട്ടൽ, നിരവധി ഓർക്കസ്ട്രേറ്റർ ഓപ്ഷനുകൾ (Semantic Kernel, LangChain, Prompt Flow), സ്പീച്ച്-ടു-ടെക്സ്റ്റ്, Microsoft Teams ഇന്റഗ്രേഷൻ, PostgreSQL അല്ലെങ്കിൽ Cosmos DB ഡ്രൈവ് ചെയ്തു പ്രവർത്തിക്കും. പ്രൊഡക്ഷൻ RAG സീനാർത്ഥുകൾക്കുള്ള കസ്റ്റമൈസബിൾ ആരംഭബിന്ദു.

**ദ്രുത ആരംഭം**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ട്രാവൽ ഏജന്റുകൾ — മൾട്ടി-ഏജന്റ് MCP ഓർക്കസ്ട്രേഷൻ

**റിപ്പോസിറ്ററി**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**സേവനങ്ങൾ**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP സെർവറുകൾ (.NET, Python, Java, TypeScript)

**വിവരണം**: ത്രി-ഫ്രെയിംവർക്കുകൾ (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework) ഉപയോഗിച്ചുള്ള മൾട്ടി-ഏജന്റ് AI ഓർക്കസ്ട്രേഷൻ പ്രാസംഗികമായ ആപ്ലിക്കേഷൻ. നാലു ഭാഷകളിലും MCP (Model Context Protocol) സെർവറുകൾ സെർവർലെസ് Azure Container Apps ആയി ഡിപ്ലോയ്മെന്റ് ചെയ്യപ്പെടുന്നു, OpenTelemetry മോണിറ്ററിംഗ് ഉൾപ്പെടുന്നു.

**ദ്രുത ആരംഭം**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI സ്റ്റാർട്ടർ

**റിപ്പോസിറ്ററി**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**സേവനങ്ങൾ**: Azure AI സേവനങ്ങൾ + Azure OpenAI

**വിവരണം**: Azure AI ഇൻഫ്രാസ്ട്രക്ചർ പ്രോവിഷൻ ചെയ്യുന്നതിനായി ക്രമീകരിച്ച മെഷീൻ ലേണിങ് മോഡലുകളുമായി ചെറിയ ബിസെപ് ടെംപ്ലേറ്റ്. പെരുമാറ്റ	stack ഇല്ലാതെ Azure AI ഇൻഫ്രാസ്ട്രക്ചർ മാത്രമാവശ്യമുള്ളപ്പോൾ ഹൃദയഭാഗമായ ആരംഭം.

**ദ്രുത ആരംഭം**:
```bash
azd init --template azd-ai-starter
azd up
```

> **കൂടുതൽ ടെംപ്ലേറ്റുകൾ കാണുക**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) സന്ദർശിച്ച് 80+ AI-സ്വതന്ത്ര AZD ടെംപ്ലേറ്റുകൾ വിവിധ ഭാഷകളും സീനാർയാറുകളും.

## അടുത്താകേണ്ട ചുവടുകൾ

1. **ഉദാഹരണങ്ങൾ പരീക്ഷിക്കുക**: നിങ്ങളുടെ ഉപയോഗത്തിന് അനുയോജ്യമായ പ്രീ-ബിൽട്ട് ടെംപ്ലേറ്റ് എന്നിവ തുടങ്ങി കാണുക
2. **നിങ്ങളുടെ ആവശ്യങ്ങൾക്ക് അനുസരിച്ച് കസ്റ്റമൈസ് ചെയ്യുക**: ഇൻഫ്രാസ്ട്രക്ചറും ആപ്ലിക്കേഷൻ കോഡും മാറ്റങ്ങൾ വരുത്തുക
3. **മോണിറ്ററിംഗ് ചേർക്കുക**: സമഗ്രമായ നിരീക്ഷണ സംവിധാനങ്ങൾ നടപ്പിൽ വയ്ക്കുക
4. **ചെലവ് പരിഷ్కരിക്കുക**: ബജറ്റിനനുസരിച്ച് കോൺഫിഗറേഷൻ മെച്ചപ്പെടുത്തുക
5. **ഡിപ്പ്ലോയ്മെന്റ് സുരക്ഷിതമാക്കുക**: എന്റർപ്രൈസ് സുരക്ഷാ മാതൃകകൾ നടപ്പിൽ വയ്ക്കുക
6. **പ്രൊഡക്ഷണിലേക്കു സ്കെയിൽ ചെയ്യുക**: മൾട്ടി-റിയൺ, ഹൈ-അവൈലബിലിറ്റി ഫീച്ചറുകൾ ചേർക്കുക

## 🎯 കൈയിൽ-കഴിവ് അഭ്യാസങ്ങൾ

### അഭ്യസനം 1: Microsoft Foundry മോഡൽസ്സ് ചാറ്റ് ആപ്പ് ഡിപ്പ്ലോയ് ചെയ്യുക (30 മിനിറ്റ്)
**ലക്ഷ്യം**: ഉത്പന്നത്തിന് തക്ക AI ചാറ്റ് ആപ്പ് വിനിയോഗിക്കുകയും പരീക്ഷിക്കുകയും ചെയ്യുക

```bash
# ടെം‌പ്ലേറ്റ് ആരംഭിക്കുക
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# പരിസ്ഥിതി വ്യത്യാസങ്ങൾ സജ്ജമാക്കുക
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# വിന്യസിക്കുക
azd up

# അപേക്ഷ പരിശോധിക്കുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# എഐ പ്രവർത്തനങ്ങൾ നിരീക്ഷിക്കുക
azd monitor

# ശുചീകരിക്കുക
azd down --force --purge
```

**വിജയത്തിന്റെ മാനദണ്ഡങ്ങൾ:**
- [ ] ക്വോട്ടാ പിഴവുകൾ കൂടാതെ ഡിപ്പ്ലോയ്മെന്റ് പൂര്‍ത്തിയാകുക
- [ ] ബ്രൗസറിൽ നിന്ന് ചാറ്റ് ഇന്റർഫേസ് ലഭ്യമാകണം
- [ ] ചോദ്യങ്ങൾ ചോദിച്ച് AI-സഹായം ലഭ്യമാക്കണം
- [ ] Application Insights ടെലിമെട്രി ഡാറ്റ കാണിക്കുകയും ചെയ്യുക
- [ ] വിജയകരമായി റിസോഴ്സുകൾ ശേഖരണം നീക്കം ചെയ്യുക

**പ്രവാഹച്ചെലവ്**: $5-10 ഏകദേശം 30 മിനിറ്റിന്റെ പരീക്ഷണത്തിനായി

### അഭ്യസനം 2: മൾട്ടി-മോഡൽ ഡിപ്പ്ലോയ്മെന്റ് കോൺഫിഗർ ചെയ്യുക (45 മിനിറ്റ്)
**ലക്ഷ്യം**: വ്യത്യസ്ത കോൺഫിഗറേഷനുകളോടെ നിരവധി AI മോഡലുകൾ ഡിപ്പ്ലോയ് ചെയ്യുക

```bash
# കസ്റ്റം ബൈസപ് കോൺഫിഗറേഷൻ സൃഷ്‌ടിക്കുക
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

# വിന്യസിപ്പിച്ച് പരിശോദിക്കുക
azd provision
azd show
```

**വിജയത്തിന്റെ മാനദണ്ഡങ്ങൾ:**
- [ ] ബഹുമുഖ മോഡലുകൾ വിജയകരമായി വിനിയോഗിക്കുക
- [ ] വ്യത്യസ്ത ശേഷി ക്രമീകരണങ്ങൾ പ്രയോഗിക്കുക
- [ ] API വഴി മോഡലുകൾ ആക്സസ് ചെയ്യാം
- [ ] ആപ്ലിക്കേഷൻ രണ്ട് മോഡളുകളും വിളിക്കാനാകണം

### അഭ്യസനം 3: ചെലവ് മോണിറ്ററിംഗ് നടപ്പാക്കുക (20 മിനിറ്റ്)
**ലക്ഷ്യം**: ബഡ്ജറ്റ് അലർട്ടുകളും ചെലവ് പിന്തുടർച്ചയും സ്ഥാപിക്കുക

```bash
# ബൈസിപ്പിൽ ബജറ്റ് അലർട്ട് ചേർക്കുക
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

# ബജറ്റ് അലർട്ട് പ്ലീസ് ചെയ്യുക
azd provision

# നിലവിലുള്ള ചെലവുകൾ പരിശോധിക്കുക
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**വിജയത്തിന്റെ മാനദണ്ഡങ്ങൾ:**
- [ ] Azure-യിൽ ബഡ്ജറ്റ് അലർട്ട് സൃഷ്ടിക്കുക
- [ ] ഇമെയിൽ അറിയിപ്പുകൾ ക്രമീകരിക്കുക
- [ ] Azure പോർട്ടലിൽ ചെലവ് ഡാറ്റ കാണാൻ കഴിയും
- [ ] ബഡ്ജറ്റ് പരിധികൾ ശരിയായി ക്രമീകരിച്ചിരിക്കുന്നു

## 💡 പൊതുവായി ചോദിക്കപ്പെടുന്ന ചോദ്യങ്ങൾ

<details>
<summary><strong>ഡെവലപ്മെന്റ് സമയത്ത് Microsoft Foundry മോഡൽസ്സ് ചെലവ് കുറയ്ക്കാൻ എങ്ങനെ?</strong></summary>

1. **ഫ്രീ ടിയർ ഉപയോഗിക്കുക**: Microsoft Foundry Models പ്രതിമാസം 50,000 ടോക്കൺ സൗജന്യം നൽകുന്നു
2. **ശേഷി കുറയ്ക്കുക**: ഡെവിനായി ശേഷി 30+ നുള്ള പകരം 10 TPM ആയിരിക്കുക
3. **azd down ഉപയോഗിക്കുക**: സജീവമായി വികസിപ്പിക്കാതിരിക്കുമ്പോൾ റിസോഴ്‌സുകൾ ഡിഅലോക്കേറ്റ് ചെയ്യുക
4. **പ്രതികരണങ്ങൾ കാഷ് ചെയ്യുക**: ആവർത്തിക്കുന്ന ക്വെറിയുകൾക്കായി Redis കാഷ് നടപ്പിലാക്കുക
5. **പ്രോംപ്റ്റ് എൻജിനീയറിംഗ് ഉപയോഗിക്കുക**: ഫലപ്രദമായ പ്രോംപ്റ്റുകൾ ഉപയോഗിച്ച് ടോക്കൺ ഉപയോഗം കുറക്കുക

```bash
# വികസന കോൺഫിഗറേഷൻ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry മോഡലുകളും OpenAI API യും തമ്മിലുള്ള വ്യത്യാസം എന്താണ്?</strong></summary>

**Microsoft Foundry Models**:
- എന്റർപ്രൈസ്സ് സുരക്ഷയും അനുസരണം
- പ്രൈവറ്റ് നെറ്റ്‌വർക്ക് ഇന്റഗ്രേഷൻ
- SLA ഉറപ്പുകൾ
- മാനേജഡ് ഐഡന്റിറ്റി ഓറതിരിച്ചറിയൽ
- ഉയർന്ന ക്വോട്ടകൾ ലഭ്യമാണ്

**OpenAI API**:
- പുതിയ മോഡലുകളിലേക്ക് വേഗം ലഭിക്കും
- ലളിതമായ സജ്ജീകരണം
- പ്രവേശനം കുറഞ്ഞ തടസ്സം
- പബ്ലിക് ഇന്റർനെറ്റ് മാത്രം

പ്രൊഡക്ഷൻ ആപ്പുകൾക്കായി **Microsoft Foundry Models ഉപദേശിക്കുന്നു**.
</details>

<details>
<summary><strong>Microsoft Foundry Models ക്വോട്ടാ ലംഘന പിഴവുകൾ എങ്ങനെ കൈകാര്യം ചെയ്യാം?</strong></summary>

```bash
# നിലവിലെ കൊറ്റ പരിശോധിക്കുക
az cognitiveservices usage list --location eastus2

# വ്യത്യസ്ത റീജിയൻ ശ്രമിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താൽക്കാലികമായി ശേഷി കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# കൊറ്റ വർധനവിന് അഭ്യർത്ഥിക്കുക
# Azure പോർട്ടലിലേക്ക് പോവുക > കുറുക്കുകൾ > വർധനവിന് അഭ്യർത്ഥിക്കുക
```
</details>

<details>
<summary><strong>Microsoft Foundry Models-നൊപ്പം തന്നെ എന്റെ സ്വന്തം ഡാറ്റ ഉപയോഗിക്കാമോ?</strong></summary>

അതെ! RAG (Retrieval Augmented Generation) සඳහා **Azure AI Search** ഉപയോഗിക്കുക:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ടെംപ്ലേറ്റ് കാണുക.
</details>

<details>
<summary><strong>AI മോഡൽ എൻഡ്‌പോയൻ്റുകൾ എങ്ങനെ സുരക്ഷിതമാക്കാം?</strong></summary>

**മികച്ച പ്രായോഗങ്ങൾ**:
1. മാനേജ്ഡ് ഐഡന്റിറ്റി ഉപയോഗിക്കുക (API കീകൾ ഒഴിവാക്കുക)
2. പ്രൈവറ്റ് എൻഡ്‌പോയിൻറുകൾ സജീവമാക്കുക
3. നെറ്റ്‌വർക്ക് സെക്യൂരിറ്റി ഗ്രൂപുകൾ ക്രമീകരിക്കുക
4. റേറ്റ് ലിമിറ്റേഷൻ നടപ്പാക്കുക
5. രഹസ്യങ്ങൾക്കായി Azure കീ വോൾട്ട് ഉപയോഗിക്കുക

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

## സമൂഹവും പിന്തുണയും

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [അധികൃത ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh-ലെ Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - `npx skills add microsoft/github-copilot-for-azure` ഉപയോഗിച്ച് നിങ്ങളുടെ എഡിറ്ററിൽ Azure + Foundry ഏജന്റ് സവിശേഷതകൾ ഇൻസ്റ്റാൾ ചെയ്യുക

---

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 2 - AI-ഫസ്റ്റ് ഡവലപ്പ്മെന്റ്
- **⬅️ മുൻവത്തുള്ള അദ്ധ്യായം**: [അദ്ധ്യായം 1: നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](../chapter-01-foundation/first-project.md)
- **➡️ അടുത്തത്**: [AI മോഡൽ ഡിപ്ലോയ്മെന്റ്](ai-model-deployment.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

**സഹായം വേണോ?** ഞങ്ങളുടെ സമൂഹ ചർച്ചകളിൽ പങ്കെടുക്കൂ അല്ലെങ്കിൽ റെപ്പോസിറ്ററിയിൽ ഒരു ഇഷ്യൂ തുറക്കൂ. Azure AI + AZD സമൂഹം നിങ്ങളുടെ വിജയത്തിന് ഇവിടെ ഉണ്ടാകുന്നു!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അസ्वीകാരം**:  
ഈ പ്രമാണം AI തർജ്ജമാസേവയായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് തർജ്ജമ ചെയ്തതാണ്. നാം കൃത്യതയ്ക്ക് ശ്രമിച്ചിരുന്നെങ്കിലും, ഓട്ടോമാറ്റിക് തർജ്ജമകൾക്കുൾപെടെയുള്ള പിഴവുകൾ അല്ലെങ്കിൽ അസാദ്ധ്യതകൾ ഉണ്ടാകാമെന്ന് ദയവായി ശ്രദ്ധിക്കുക. മാതൃഭാഷയിലെ ആദിധോരം പ്രമാണം അംഗീകൃത സ്രോതസ്സ് എന്ന നിലയിൽ പരിഗണിക്കപ്പെടണം. അത്യാവശ്യ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മാനവ തർജ്ജമ ശുപാർശ ചെയ്യുന്നു. ഈ തർജ്ജമ ഉപയോഗിക്കുന്നതിൽ നിന്നുള്ള തെറ്റിദ്ധാരണകൾക്കോ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കോ ബാധ്യത ഉണ്ടായിരിക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->