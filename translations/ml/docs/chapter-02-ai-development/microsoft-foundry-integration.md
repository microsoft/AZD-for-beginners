# Microsoft Foundry Integration with AZD

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 2 - AI-ഫസ്റ്റ് ഡെവലപ്പ്മെന്റ്
- **⬅️ മുൻപ്**: [അധ്യായം 1: നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](../chapter-01-foundation/first-project.md)
- **➡️ അടുത്തത്**: [AI മോഡൽ ഡിപ്ലോയ്മെന്റ്](ai-model-deployment.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

## അവലോകനം

AI ആപ്ലിക്കേഷൻ ഡിപ്ലോയ്മെന്റുകൾ സുഗമമാക്കുന്നതിനായി Microsoft Foundry സർവീസുകൾ Azure Developer CLI (AZD) ഉപയോഗിച്ച് എങ്ങിനെ സംയോജിപ്പിക്കാമെന്നും ഈ ഗൈഡ് പ്രദർശിപ്പിക്കുന്നു. Microsoft Foundry AI ആപ്ലിക്കേഷൻ നിർമ്മാണത്തിനും ഡിപ്ലോയ്മെന്റിനും മാനേജ്മെന്റിനും സുവ്യവസ്ഥാപിത പ്ലാറ്റ്ഫോം നൽകുന്നു, AZD ഇൻഫ്രാസ്ട്രക്ചർ, ഡിപ്ലോയ്മെന്റ് പ്രക്രിയയെ ലളിതമാക്കുന്നു.

## Microsoft Foundry എന്താണ്?

Microsoft Foundry Microsoft-ന്റെ ഏകീകൃത AI ഡെവലപ്പ്മെന്റ് പ്ലാറ്റ്‌ഫോമാണ്, ഇതിലൂടെ ലഭ്യമാണ്:

- **മോഡൽ കാറ്റലോഗ്**: ഏറ്റവും സമകാലിക AI മോഡലുകളിൽ പ്രവേശനം
- **പ്രംപ്റ്റ് ഫ്ലോ**: AI പ്രവൃത്തികൾക്ക് ദൃശ്യ ഡിസൈനറായാണ്
- **Microsoft Foundry പോർട്ടൽ**: AI ആപ്ലിക്കേഷനുകൾക്കുള്ള ഇന്റഗ്രേറ്റഡ് ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി
- **ഡിപ്ലോയ്മെന്റ് ഓപ്ഷനുകൾ**: വിവിധ ഹോസ്റ്റിംഗ്, സ്കെയിലിംഗ് ഓപ്ഷനുകൾ
- **സുരക്ഷയും സുരക്ഷിതത്വവും**: സമഗ്രമായ ഉത്തരവാദിത്തമുള്ള AI സവിശേഷതകൾ

## AZD + Microsoft Foundry: ഒരുമിച്ച് മികച്ചത്

| സവിശേഷത | Microsoft Foundry | AZD സംയോജനം നൽകുന്ന ലാഭം |
|---------|-----------------|------------------------|
| **മോഡൽ ഡിപ്ലോയ്മെന്റ്** | മാനുവൽ പോർട്ടൽ ഡിപ്ലോയ്മെന്റ് | ഓട്ടോമേറ്റഡ്, ആവർത്തിക്കാവുന്ന ഡിപ്ലോയ്മെന്റുകൾ |
| **ഇൻഫ്രാസ്ട്രക്ചർ** | ക്ലിക്ക്-ത്രൂ പ്രൊവിഷണിംഗ് | കോഡ് ആകാക ഇൻഫ്രാസ്ട്രക്ചർ (Bicep) |
| **പരിസ്ഥിതി മാനേജ്മെന്റ്** | ഏകോപിത പരിസ്ഥിതി ശ്രദ്ധ | മൾട്ടി-പരിസ്ഥിതി (ഡെവ്/സ്റ്റേജിംഗ്/പ്രോഡ്) |
| **CI/CD സംയോജനം** | പാരിമിതിയുള്ളത് | നേറ്റീവ് GitHub ആക്ഷൻസ് പിന്തുണ |
| **ചെലവു മാനേജ്മെന്റ്** | അടിസ്ഥാന മോണിറ്ററിംഗ് | പരിസ്ഥിതിഗത ചെലവ് മെച്ചപ്പെടുത്തൽ |

## മുൻകൂട്ടി ആവശ്യങ്ങള്‍

- അനുയോജ്യമായ അനുവാദങ്ങളോടു കൂടിയ Azure സബ്സ്ക്രിപ്ഷൻ
- Azure Developer CLI ഇൻസ്റ്റോൾ ചെയ്തു having
- Microsoft Foundry മോഡൽ സർവീസുകളിൽ പ്രവേശനം
- Microsoft Foundry അടിസ്ഥാന പരിചയം

> **നിലവിലെ AZD അടിസ്ഥാന വേർഷൻ:** ഈ ഉദാഹരണങ്ങൾ `azd` `1.23.12` നെതിരെ പരിശോധിച്ചിട്ടുണ്ട്. AI ഏജന്റ് വർക്‌ഫ്ലോയ്ക്കായി നിലവിലെ പ്രിവ്യൂ എക്സ്റ്റൻഷൻ റിലീസ് ഉപയോഗിച്ച് നിങ്ങളുടെ ഇൻസ്റ്റാളുചെയ്‌തിരിക്കുന്ന പതിപ്പ് പരിശോധിക്കുക.

## കോർ ഇൻറഗ്രേഷൻ ഉറയിലുകൾ

### Pattern 1: Microsoft Foundry Models Integration

**ഉപയോഗ കാര്യം**: Microsoft Foundry Models മോഡലുകൾ ഉപയോഗിച്ച് ചാറ്റ് ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ് ചെയ്യുക

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

### Pattern 2: AI Search + RAG Integration

**ഉപയോഗ കാര്യം**: Retrieval-Augmented Generation (RAG) ആപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ് ചെയ്യുക

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

### Pattern 3: ഡോക്യുമെന്റ് ഇന്റലിജൻസ് ഇൻറഗ്രേഷൻ

**ഉപയോഗ കാര്യം**: ഡോക്യുമെന്റ് പ്രോസസ്സിംഗ്, വിശകലന പ്രവൃത്തികൾ

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

## 🔧 കോൺഫിഗറേഷൻ ഉറയിലുകൾ

### പരിസ്ഥിതി വേരബിൾസിന്റെ ക്രമീകരണം

**പ്രൊഡക്ഷൻ കോൺഫിഗറേഷൻ:**
```bash
# മുക്യമേഖല AI സേവനങ്ങൾ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# മോഡൽ ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# പ്രകടന ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ഡെവലപ്പ്മെന്റ് കോൺഫിഗറേഷൻ:**
```bash
# വികസനത്തിനുള്ള ചെലവു-പ്രതിരോധിത ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # സൗജന്യ തരം
```

### കീ വോൾട്ട് ഉപയോഗിച്ചുള്ള സുരക്ഷിത കോൺഫിഗറേഷൻ

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

## ഡിപ്ലോയ്മെന്റ് വർക്‌ഫ്ലോകൾ

### Foundry-ക്കായുള്ള AZD എക്‍സ്റ്റൻഷൻകൾ

Microsoft Foundry സർവീസുകളുമായി AI ആവശ്യകതകൾക്കായി AZD പ്രത്യേക എക്‍സ്റ്റൻഷനുകൾ നൽകുന്നു:

```bash
# ഫൗണ്ടറി ഏജന്റ്സ് എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.agents

# ഫൈൻ-ട്യൂണിംഗ് എക്സ്‌റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.finetune

# കസ്റ്റം മോഡലുകൾ എക്സ്‌റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.models

# ഇൻസ്റ്റാൾ ചെയ്ത എക്സ്റ്റൻഷനുകൾ പട്ടികപ്പെടുത്തുക
azd extension list --installed

# നിലവിൽ ഇൻസ്റ്റാൾ ചെയ്ത ഏജന്റ് എക്സ്റ്റൻഷൻ പതിപ്പ് പരിശോധിക്കുക
azd extension show azure.ai.agents
```

AI എക്‍സ്റ്റൻഷനുകൾ ഇപ്പോഴും പ്രവ്യൂയിൽ വേഗത്തിൽ വികസിക്കുന്നു. ഒരു കമാൻഡ് ഇവിടെ കാണിക്കുന്നതിൽ നിന്നും വ്യത്യസ്തമായി പ്രവർത്തിക്കുന്നുവെങ്കിൽ, ബന്ധപ്പെട്ട എക്‍സ്റ്റൻഷൻ അപ്ഗ്രേഡ് ചെയ്ത് പ്രശ്നപരിഹാരം തുടങ്ങി.

### `azd ai` ഉപയോഗിച്ച് ഏജന്റ്-ഫസ്റ്റ് ഡിപ്ലോയ്മെന്റ്

നിങ്ങൾക്ക് ഏജന്റ് മാനിഫസ്റ്റ് ഉണ്ടെങ്കിൽ, Foundry Agent സർവീസുമായി ബന്ധിപ്പിച്ച പ്രോജക്ട് സ്ഫോടനത്തിന് `azd ai agent init` ഉപയോഗിക്കുക:

```bash
# ഒരു ഏജന്റ് മാനിഫെസ്റ്റിൽ നിന്ന് ആരംഭിക്കുക
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ആസ്യൂർക്ക് വിന്യസിക്കുക
azd up
```

`azure.ai.agents` പുതിയ പതിപ്പുകൾ `azd ai agent init` ന് ടെംപ്ലേറ്റ് അടിസ്ഥാനമുള്ള ഇൻഷ്യലൈസേഷൻ പിന്തുണയും ചേർത്തിട്ടുണ്ട്. പുതിയ ഏജന്റ് സാമ്പിളുകൾ പിന്തുടരുമ്പോൾ, ഇൻസ്റ്റാൾ ചെയ്ത പതിപ്പിലെ ലഭ്യമായ കമാൻഡ് ഫ്ലാഗുകൾ എക്‍സ്റ്റൻഷൻ സഹായത്തിൽ പരിശോധിക്കുക.

പൂർണ്ണ കമാൻഡ് റഫറൻസ്, ഫ്ലാഗുകൾ എന്നിവയ്ക്ക് [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) കാണുക.

### സിംഗിൾ കമാൻഡ് ഡിപ്ലോയ്മെന്റ്

```bash
# ഒറ്റ കമാൻഡിൽ എല്ലാം വിന്യാസം ചെയ്യുക
azd up

# അല്ലെങ്കിൽ ക്രമഗതമായി വിന്യാസം ചെയ്യുക
azd provision  # അടിസ്ഥാനസൗകര്യങ്ങൾ മാത്രമേ
azd deploy     # അപ്ലിക്കേഷൻ മാത്രമേ

# azd 1.23.11+ ൽ ദൈർഘ്യമേറിയ AI ആപ്പ് വിന്യാസങ്ങൾക്കായി
azd deploy --timeout 1800
```

### പരിസ്ഥിതി സ്പെസിഫിക് ഡിപ്ലോയ്മെന്റുകൾ

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

## മോണിറ്ററിംഗ്, ഒബ്സർവബിലിറ്റി

### ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇൻറഗ്രേഷൻ

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

### ചെലവ് നിരീക്ഷണം

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

## 🔐 സുരക്ഷാ മികച്ച ആരാധനകളും

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

### നെറ്റ്‌വർക്ക്സ് സുരക്ഷ

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

### ഓട്ടോ-സ്കെയിലിംഗ് കോൺഫിഗറേഷൻ

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

## സാധാരണ പ്രശ്ന പരിഹാരങ്ങൾ

### പ്രശ്നം 1: OpenAI ക്വോട്ടാ മ vượtയം

**ലക്ഷണങ്ങൾ:**
- ക്വോട്ടാ പിശകുകളോടെ ഡിപ്ലോയ്മെന്റ് പരാജയപ്പെടുന്നു
- ആപ്ലിക്കേഷൻ ലോഗുകളിൽ 429 പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# നിലവിലെ ക്വോട്ട ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list --location eastus

# വ്യത്യസ്ത പ്രദേശം പരീക്ഷിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താൽക്കാലികമായി ശേഷിയു് കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### പ്രശ്നം 2: ഓതന്റിക്കേഷൻ പരാജയങ്ങൾ

**ലക്ഷണങ്ങൾ:**
- AI സർവീസുകൾ വിളിക്കുമ്പോൾ 401/403 പിശകുകൾ
- "പ്രവേശനം നിരോധിക്കപ്പെട്ടു" മെസ്സേജുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# റോളുകൾ ആവര്‍ത്തിച്ച് പരിശോധിക്കുക
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# മാനേജുചെയ്ത ഐഡന്റിറ്റി ക്രമീകരണം പരിശോധിക്കുക
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# കീ വോൾട്ട് ആക്‌സസ് സാധുവാക്കുക
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### പ്രശ്നം 3: മോഡൽ ഡിപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ

**ലക്ഷണങ്ങൾ:**
- മോഡലുകൾ ഡിപ്ലോയ്മെന്റിൽ ലഭ്യമല്ല
- നിശ്ചിത മോഡൽ പതിപ്പുകൾ പരാജയപ്പെടുന്നു

**പരിഹാരങ്ങൾ:**
```bash
# പ്രദേശം അടിസ്ഥാനമാക്കി ലഭ്യമായ മാതൃകകള്‍ പട്ടികപ്പെടുത്തുക
az cognitiveservices model list --location eastus

# ബൈസെപ് ടെംപ്ലേറ്റിൽ മാതൃക പതിപ്പ് അപ്ഡേറ്റ് ചെയ്യുക
# മാതൃകയുടെ ശേഷി ആവശ്യമുകൾ പരിശോധിക്കുക
```

## ഉദാഹരണ ടെംപ്ലറ്റുകൾ

### RAG ചാറ്റ് ആപ്ലിക്കേഷൻ (Python)

**റിപ്പോസിറ്ററി**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**സെർവീസുകൾ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**വിവരണം**: ഏറ്റവും പ്രസിദ്ധമായ Azure AI സാമ്പിൾ — പ്രൊഡക്ഷൻ റെഡി RAG ചാറ്റ് ആപ്പ്, നിങ്ങളുടെ സ്വന്തം ഡോക്യുമെന്റുകൾക്ക് മേൽ ചോദ്യങ്ങൾ ചോദിക്കാം. ചാട്ടിലായി GPT-4.1-mini, എമ്പെഡിങ്ങുകൾക്കായി text-embedding-3-large, തിരിച്ചെടുക്കൽക്ക് Azure AI Search ഉപയോഗിക്കുന്നു. മൾട്ടിമോഡൽ ഡോക്യുമെന്റുകൾ, സ്പീച്ച് ഇൻപുട്ട്/ഔട്ട്പുട്ട്, Microsoft Entra ഓതന്റിക്കേഷൻ, Application Insights ട്രേസിംഗ് പിന്തുണക്കുന്നു.

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG ചാറ്റ് ആപ്ലിക്കേഷൻ (.NET)

**റിപ്പോസിറ്ററി**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**സെർവീസുകൾ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**വിവരണം**: Python RAG ചാറ്റ് സാമ്പിളിന്റെ .NET/C# സമാനപ്രതിഫലം. ASP.NET Core Minimal API, Blazor WebAssembly ഫ്രണ്ട്‌എന്റ് ഉപയോഗിച്ചുള്ള നിർമ്മാണം. വോയ്സ് ചാറ്റ്, GPT-4o-mini കണ്ണ് പിന്തുണ, കൂടാതെ ഒരു .NET MAUI Blazor ഹൈബ്രിഡ് ഡെസ്‌ക്ക്ടോപ്പ്/മൊബൈൽ ക്ലയന്റ് ഉൾപ്പെടുന്നു.

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG ചാറ്റ് ആപ്ലിക്കേഷൻ (Java)

**റിപ്പോസിറ്ററി**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**സെർവീസുകൾ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**വിവരണം**: Langchain4J ഉപയോഗിച്ചുള്ള ജാവ RAG ചാറ്റ് സാമ്പിൾ. മൈക്രോസർവിസ് ഇവന്റ്-ഡ്രിവൻ ആർക്കിടെക്ചർ, വിവിധ തിരയൽ തന്ത്രങ്ങൾ (ടെക്സ്റ്റ്, വെക്റ്റർ, ഹൈബ്രിഡ്), ഡോക്യുമെന്റ് അപ്ലോഡ് Azure Document Intelligence-യോടെ, ഡിപ്ലോയ്മെന്റ് Azure Container Apps അല്ലെങ്കിൽ Azure Kubernetes Service-ൽ.

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Azure AI Foundry-യുമായി എന്റർപ്രൈസ് റീട്ടെയിൽ കോപിലট

**റിപ്പോസിറ്ററി**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**സെർവീസുകൾ**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**വിവരണം**: Azure AI Foundry, Prompty ഉപയോഗിച്ചുള്ള എന്റർപ്രൈസ് റീട്ടെയിൽ RAG കോപിലറ്റ്. Contoso ഒട്ത്ഗ്ര өзүറർക്കുള്ള ചാറ്റ്‌ബോട്ട് ഉപഭോക്തൃ ഓർഡർ ഡാറ്റയും ഉൽപ്പന്ന കാറ്റലോഗും ആസ്പദമാക്കുന്നു. മുഴുവൻ GenAIOps വർക്‌ഫ്ലോയുടെ ഉദാഹരണം — Prompty-യുമായി പ്രോട്ടോটাইപ്പ്, AI സഹായമുള്ള എവലുവേറ്ററുകളുടെ മൂല്യനിർണ്ണയം, AZD വഴി Container Apps-ലേക്ക് ഡിപ്ലോയ്മെന്റ്.

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template contoso-chat
azd up
```

### സൃഷ്ടിമാന എഴുത്ത് മൾട്ടി-ഏജന്റ് ആപ്ലിക്കേഷൻ

**റിപ്പോസിറ്ററി**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**സെർവീസുകൾ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**വിവരണം**: Prompty-യുമായി AI ഏജന്റ് കോർഡിനേഷൻ‍ കാണിക്കുന്ന മൾട്ടി-ഏജന്റ് സാമ്പിൾ. റിസർച്ച്എജന്റ് (Bing Grounding in Azure AI Agent Service), ഒരു പ്രൊഡക്ട് ഏജന്റ് (Azure AI Search), ഒരു റൈറ്റർ ഏജന്റ്, ഒരു എഡിറ്റർ ഏജന്റ് കൂട്ടുചേർന്നു നന്നായി ഗവേഷണ-lnd ലേഖനങ്ങൾ ഒരുക്കുന്നു. GitHub Actions-ലിൽ അവലോകനം ഉൾപ്പെടുന്ന CI/CD.

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template contoso-creative-writer
azd up
```

### സർവർലെസ് RAG ചാറ്റ് (JavaScript/TypeScript)

**റിപ്പോസിറ്ററി**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**സെർവീസുകൾ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**വിവരണം**: LangChain.js ഉപയോഗിച്ചുള്ള പൂർണ്ണമായ സർവർലെസ് RAG ചാറ്റ്ബോട്ട്, APIക്ക് Azure Functions, ഹോസ്റ്റിംഗിന് Azure Static Web Apps. Azure Cosmos DB വെക്റ്റർ സ്റ്റോർ, ചാറ്റ് ചരിത്ര ഡേറ്റാബേസ് ആയി ഉപയോഗിക്കുന്നു. ഒരുപാടു നിക്ഷേപമില്ലാത്ത ടെസ്റ്റിംഗിനായി ലോക്കൽ ഡെവലപ്പ്മെന്റിനായി Ollama പിന്തുണ.

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Your Data ചാറ്റ് സൊല്യൂഷൻ ആക്സിലിറേറ്റർ

**റിപ്പോസിറ്ററി**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**സെർവീസുകൾ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**വിവരണം**: ഡോക്യുമെന്റ് അപ്‌ലോഡ്/മെനേജ്‌മെന്റിനുള്ള അഡ്മിൻ പോർട്ടൽ, സമാന്റിക് കർണൽ, ലാംഗ്ചെയ്ൻ, പ്രംപ്റ്റ് ഫ്ലോ പോലുള്ള ബഹുദിശയ ഓർക്കസ്ട്രേറ്റർ ഓപ്ഷനുകൾ, വോയ്സ്-ടു-ടെക്സ്‌റ്റ്, Microsoft Teams ഇന്റഗ്രേഷൻ, PostgreSQL അല്ലെങ്കിൽ Cosmos DB ബാക്ക്എൻഡ് എന്നിവയുള്ള എന്റർപ്രൈസ് ഗ്രേഡ് RAG സൊല്യൂഷൻ ആക്സിലിറേറ്റർ. പ്രൊഡക്ഷൻ RAG ഉപയോഗത്തിനുള്ള ഇഷ്ടാനുസൃത പ്രാരംഭ ബിന്ദു.

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ട്രാവൽ ഏജന്റ്സ് — മൾട്ടി-ഏജന്റ് MCP ഓർക്കസ്ട്രേഷൻ

**റിപ്പോസിറ്ററി**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**സെർവീസുകൾ**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**വിവരണം**: LangChain.js, LlamaIndex.TS, Microsoft Agent Framework എന്നീ മൂന്ന് ഫ്രെയിംവർകുകൾ ഉപയോഗിക്കുന്ന മൾടി-ഏജന്റ് AI ഓർക്കസ്ട്രേഷൻ റഫറൻസ് ആപ്ലിക്കേഷൻ. നാല് ഭാഷകളിൽ MCP (Model Context Protocol) സർവറുകൾ സർവർലെസ് Azure Container Apps ആയി ഡിപ്ലോയ് ചെയ്തിരിക്കുന്നു, OpenTelemetry മോണിറ്ററിംഗ് സവിശേഷതയുമായ്.

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI സ്റ്റാർട്ടർ

**റിപ്പോസിറ്ററി**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**സെർവീസുകൾ**: Azure AI Services + Azure OpenAI

**വിവരണം**: മെഷീൻ ലേണിംഗ് മോഡലുകൾ കോൺഫിഗർ ചെയ്ത Azure AI സർവീസുകൾ ഡിപ്ലോയ് ചെയ്യുന്ന മിനിമൽ Bicep ടെംപ്ലേറ്റ്. പൂർണ്ണ ആപ്ലിക്കേഷൻ സ്റ്റാക്കില്ലാതെ വെറും Azure AI ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷണിംഗിന് ലഘു തുടക്കക്കാരൻ.

**ക്വിക്ക് സ്റ്റാർട്ട്**:
```bash
azd init --template azd-ai-starter
azd up
```

> **കൂടുതൽ ടെംപ്ലറ്റുകൾ കണ്ടു നോക്കൂ**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) സന്ദർശിച്ച് 80+ AI-സവിശേഷ AZD ടെംപ്ലറ്റുകൾ വിവിധ ഭാഷകളിലും പ്രയോഗങ്ങളിലും ലഭ്യമാണ്.

## അടുത്ത ഘട്ടങ്ങൾ

1. **ഉദാഹരണങ്ങൾ ശ്രമിക്കുക**: നിങ്ങളുടെ ഉപയോഗത്തിനനുസരിച്ച് പ്രീബിൽറ്റ് ടെംപ്ലേറ്റ് നിന്നും തുടങ്ങുക
2. **താങ്കളുടെ ആവശ്യങ്ങൾക്ക് അനുയോജ്യമായി ഇഷ്‌ടാനുസൃതമാക്കുക**: ഇൻഫ്രാസ്ട്രക്ചർ, ആപ്ലിക്കേഷൻ കോഡ് മാറ്റുക
3. **മോണിറ്ററിംഗ് ചേർക്കുക**: സമഗ്രമായ ഒബ്സർവബിലിറ്റി നടപ്പിലാക്കുക
4. **ചെലവ് ആപ്റ്റിമൈസേഷൻ**: നിങ്ങളുടെ ബഡ്ജറ്റിനനുസരിച്ച് കോൺഫിഗറേഷനുകൾ മെച്ചപ്പെടുത്തുക
5. **ഡിപ്ലോയ്മെന്റ് സുരക്ഷിതമാക്കുക**: എന്റർപ്രൈസ് സുരക്ഷാ(patterns) നടപ്പിലാക്കുക
6. **പ്രൊഡക്ഷൻ ആയി സ്കെയിൽ ചെയ്യുക**: മൾട്ടിളി-റീജിയൻ, ഹൈ-അവെയിലബിലിറ്റി സവിശേഷതകൾ ചേർക്കുക

## 🎯 ഹാൻഡ്സ് ഓൺ എക്സറ്സൈസുകൾ

### എക്സറ്സൈസ് 1: Microsoft Foundry Models ചാറ്റ് ആപ്പ് ഡിപ്ലോയ്മെന്റ് (30 മിനിറ്റ്)
**ലക്ഷ്യം**: പ്രൊഡക്ഷൻ റെഡി AI ചാറ്റ് ആപ്പ് ഡിപ്ലോയ്മെന്റും പരീക്ഷണവും

```bash
# ടെംപ്ലേറ്റ് ആരംഭിക്കുക
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# പരിസ്ഥിതി വേരിയബിളുകൾ സജ്ജമാക്കുക
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# വിന്യസിക്കുക
azd up

# ആപ്ലിക്കേഷൻ ടെസ്റ്റ് ചെയ്യുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI പ്രവർത്തനങ്ങൾ നിരീക്ഷിക്കുക
azd monitor

# ക്ലീൻ അപ്പ് ചെയ്യുക
azd down --force --purge
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] ക്വോട്ടാ പിശകുകൾ ഇല്ലാതെ ഡിപ്ലോയ്മെന്റ് പൂർത്തിയായി
- [ ] ബ്രൗസറിൽ ചാറ്റ് ഇന്റർഫേസ് പ്രാപ്യമാകുന്നു
- [ ] ചോദ്യങ്ങൾ ചോദിക്കാനും AI ഉത്തരം ലഭിക്കാനും കഴിയും
- [ ] Application Insights ഡാറ്റ കാണിക്കുന്നു
- [ ] സ്രോതസുകൾ വിജയകരമായി ക്ലീൻ അപ് ചെയ്തിട്ടുണ്ട്

**ഏത് ചെലവ്**: 30 മിനിറ്റിനുദ്ദേശിച്ച് $5-10

### എക്സറ്സൈസ് 2: മൾട്ടി-മോഡൽ ഡിപ്ലോയ്മെന്റ് കോൺഫിഗറേഷൻ (45 മിനിറ്റ്)
**ലക്ഷ്യം**: വ്യത്യസ്ത കോൺഫിഗറേഷനുകളുമായുള്ള ബഹുമോദല ഡിപ്ലോയ്മെന്റ്

```bash
# കസ്റ്റം ബൈസേപ്പ് ക്രമീകരണം സൃഷ്‌ടിക്കുക
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

# വിന്യസിക്കുകയും പരിശോധിക്കുകയും ചെയ്യുക
azd provision
azd show
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] വിവിധ മോഡലുകൾ വിജയകരമായി ഡിപ്ലോയ്മെന്റ് ചെയ്തു
- [ ] വ്യത്യസ്ത ശേഷി ക്രമീകരണങ്ങൾ പ്രയോഗിച്ചു
- [ ] API മുഖേന മോഡലുകൾ ലഭ്യമാണ്
- [ ] ആപ്ലിക്കേഷൻ രണ്ട് മോഡലുകൾക്കും വിളിക്കാൻ കഴിയും

### എക്സറ്സൈസ് 3: ചെലവ് മോണിറ്ററിംഗ് നടപ്പാക്കുക (20 മിനിറ്റ്)
**ലക്ഷ്യം**: ബഡ്ജറ്റ് അലർട്ട്, ചെലവ് ട്രാക്കിംഗ് ക്രമീകരിക്കുക

```bash
# ബൈസെപ്പിലേക്ക് ബഡ്ജറ്റ് એલર્ટ ചേർക്കുക
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

# ബഡ്ജറ്റ് એલર્ટ പ്രയോഗിക്കുക
azd provision

# നിലവിലെ ചെലവുകൾ പരിശോധിക്കുക
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] Azure-ൽ ബഡ്ജറ്റ് അലർട്ട് സൃഷ്ടിച്ചു
- [ ] ഇമെയിൽ അറിയിപ്പുകൾ ക്രമീകരിച്ചു
- [ ] Azure പോർട്ടലിൽ ചെലവ് ഡാറ്റ കാണാനാകും
- [ ] ബഡ്ജറ്റ് പരിധികൾ ശരിയായി സജ്ജീകരിച്ചു

## 💡 പങ്കുവെച്ച ചോദ്യങ്ങൾ

<details>
<summary><strong>ഡെവലപ്പ്മെന്റ് സമയത്ത് Microsoft Foundry Models ചെലവ് എങ്ങനെ കുറക്കാം?</strong></summary>

1. **ഫ്രീ ടിയർ ഉപയോഗിക്കുക**: Microsoft Foundry Models മാസവും 50,000 ടോക്കൺസു ഫ്രീ നൽകി
2. **ശേഷി കുറയ്‌ക്കുക**: ഡെവലപ്പ്മെന്റിന് 30+ ക്കു പകരം 10 TPM ആയി സെറ്റ് ചെയ്യുക
3. **azd down ഉപയോഗിക്കുക**: ഡെവലപ്പ്മെന്റ് നടത്താത്തപ്പോൾ സ്രോതസുകൾ ഡീഅലോക്കേറ്റ് ചെയ്യുക
4. **റെഡിസ് ക്യാഷിങ് ഉപയോഗിക്കുക**: ആവർത്തിക്കുന്ന ക്വറിയുകൾക്ക് Redis ക്യാഷ് നടപ്പിലാക്കുക
5. **പ്രംപ്റ്റ് എഞ്ചിനിയറിംഗ് ഉപയോഗിക്കുക**: കാര്യക്ഷമമായ പ്രംപ്റ്റുകളിലൂടെ ടോക്കൺ ഉപയോഗം കുറയ്‌ക്കുക
```bash
# വികസന ക്രമീകരണം
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models കയും OpenAI API കയും შორის有什么 വ്യത്യാസം?</strong></summary>

**Microsoft Foundry Models**:
- എന്റർപ്രൈസ് സുരക്ഷയും അനുയോജ്യതയും
- സ്വകാര്യ നെറ്റ്‍വർക്കും ഇന്റഗ്രേഷൻ
- SLA ഗ്യാരണ്ടികൾ
- മാനേജ് ചെയ്ത ഐഡന്റിറ്റി ഓ്തന്റികേഷൻ
- ഉയർന്ന ക്വോട്ടകൾ ലഭ്യമാണ്

**OpenAI API**:
- പുതിയ മോഡലുകൾക്ക് വേഗം ആക്‌സസ്
- ലളിതമായ സെറ്റ് അപ്
- കുറഞ്ഞ പ്രവേശന ബധ്ധത
- പൊതുജന ഇന്റർനെറ്റ് മാത്രമേ ഉപയോഗിക്കൂ

പ്രൊഡക്ഷൻ ആപ്പുകൾക്ക്, **Microsoft Foundry Models ഉചിതമാണ്**.
</details>

<details>
<summary><strong>Microsoft Foundry Models ക്ക് ക്വോട്ട മീതെ വരുമ്പോൾ എങ്ങനെ കൈകാര്യം ചെയ്യാം?</strong></summary>

```bash
# നിലവിലെ ക്വോട്ട പരിശോധിക്കുക
az cognitiveservices usage list --location eastus2

# വേറൊരു മേഖല ശ്രമിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താത്കാലികമായി ശേഷി കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ക്വോട്ട ഉയർത്തൽ അഭ്യര്‍ത്ഥിക്കുക
# ആസ്യൂർ പോർട്ടൽ > ക്വോട്ടകൾ > ഉയർത്തൽ അഭ്യർത്ഥിക്കുക എന്നിലേക്ക് പോകുക
```
</details>

<details>
<summary><strong>Microsoft Foundry Models ൽ എന്റെ സ്വന്തം ഡാറ്റ ഉപയോഗിക്കാമോ?</strong></summary>

അതെ! RAG (Retrieval Augmented Generation) നായി **Azure AI Search** ഉപയോഗിക്കുക:

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
<summary><strong>AI മോഡൽ എൻഡ്‌പോയിന്റുകൾ എങ്ങനെ സുരക്ഷിതമാക്കണം?</strong></summary>

**മികച്ച പ്രക്രിയകൾ**:
1. Managed Identity ഉപയോഗിക്കുക (API കീകൾ ഇല്ലാതെ)
2. Private Endpoints പ്രവർത്തിപ്പിക്കുക
3. നെറ്റ്‍വർക്ക് സുരക്ഷാ ഗ്രൂപ്പുകൾ ക്രമീകരിക്കുക
4. നിരക്ക് നിയന്ത്രണം നടപ്പാക്കുക
5. രഹസ്യങ്ങൾക്ക് Azure Key Vault ഉപയോഗിക്കുക

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

## കമ്മ്യൂണിറ്റി மற்றும் പിന്തുണ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - നിങ്ങളുടെ എഡിറ്ററിൽ Azure + Foundry ഏജന്റ് സ്കിൽസ് ഇൻസ്റ്റാൾ ചെയ്യാൻ `npx skills add microsoft/github-copilot-for-azure` ഉപയോഗിക്കൂ

---

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 ഇപ്പോഴത്തെ അദ്ധ്യായം**: Chapter 2 - AI-First Development
- **⬅️ മുമ്പത്തെ അദ്ധ്യായം**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ അടുത്തത്**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**സഹായം വേണെങ്കിൽ?** നമ്മുടെ കമ്മ്യൂണിറ്റി ചർച്ചകളിൽ ചേരൂ അല്ലെങ്കിൽ റെപ്പോസിറ്ററിയിൽ പ്രശ്നം തുറക്കൂ. Azure AI + AZD കമ്മ്യൂണിറ്റി നിങ്ങളുടെ വിജയത്തിന് സഹായിക്കാൻ ഇവിടെ ഉണ്ട!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**വകുപ്പ്**:  
ഈ പ്രബന്ധം AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണു. നാം കൃത്യതയ്ക്ക് പ്രയത്നിക്കുന്നതായിരുന്ന്കിലും, യന്ത്രം ചെയ്ത വിവർത്തനങ്ങളിൽ പിശകുകൾ അല്ലെങ്കിൽ അശുദ്ധതകൾ ഉണ്ടായിരിക്കാമെന്നും ശ്രദ്ധിക്കുക. മാതൃഭാഷയില്‍ ഉള്ള അസല് ദസ്താവേഖം അധികാരപരമായ ഉറവിടമായി കണക്കാക്കണം. അടിയന്തര വിവരങ്ങൾക്കായി പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനമാണ് ശുപാർശ. ഈ വിവർത്തനം ഉപയോഗിക്കുന്നതിലൂടെ ഉണ്ടായ任何 തെറ്റിദ്ധാരണകൾക്ക് ഞങ്ങൾ жауапവഹിക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->