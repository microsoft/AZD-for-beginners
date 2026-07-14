# മൈക്രോസോഫ്ട് ഫൗണ്ട്രി ഇന്റഗ്രേഷൻ AZD-വുമായി

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 2 - AI-ഫസ്റ്റ് ഡിവെലപ്മെന്റ്
- **⬅️ മുമ്പത്തെ അധ്യായം**: [അധ്യായം 1: നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](../chapter-01-foundation/first-project.md)
- **➡️ അടുത്തത്**: [AI മോഡൽ ഡിപ്ലോയ്മെന്റ്](ai-model-deployment.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

## അവലോകനം

ഈ ഗൈഡ് മൈക്രോസോഫ്ട് ഫൗണ്ട്രി സേവനങ്ങളെ അസ്യൂർ ഡെവലപ്പർ CLI (AZD) తో ഇന്റഗ്രേറ്റ് ചെയ്യുന്നതിന്റെയും എളുപ്പമുള്ള AI അപ്ലിക്കേഷൻ ഡിപ്ലോയ്മെന്റിന്റെയും വിധി കാണിക്കുന്നു. മൈക്രോസോഫ്ട് ഫൗണ്ട്രി AI അപ്ലിക്കേഷനുകള്‍ നിർമ്മിക്കാന്‍, ഡിപ്ലോയ് ചെയ്യാന്‍, മാനേജ് ചെയ്യാനായി സമഗ്രമായ പ്ലാറ്റ്ഫോം നല്‍കുന്നു, അതേസമയം AZD സംയോജിതമായ ഇൻഫ്രാസ്ട്രക്ചറും ഡിപ്ലോയ്മെന്റ് പ്രക്രിയയും ലളിതമാക്കുന്നു.

## മൈക്രോസോഫ്ട് ഫൗണ്ട്രി എന്നത് എന്ത്?

മൈക്രോസോഫ്ട് ഫൗണ്ട്രി AI ഡെവലപ്പ്മെന്റിനുള്ള മൈക്രോസോഫ്ടിന്റെ ഏകീകൃത പ്ലാറ്റ്ഫോം ആണ്, അതിൽ ഉൾപ്പെടുന്നത്:

- **മോഡൽ കാറ്റലോഗ്**: ആധുനിക AI മോഡലുകളിലേക്ക് ആക്സസ്
- **പ്രോംപ്റ്റ് ഫ്ലോ**: AI വർക്ക്ഫ്‌ളോകൾക്ക് വിസ്വൽ ഡിസൈനർ
- **മൈക്രോസോഫ്ട് ഫൗണ്ട്രി പോർട്ടൽ**: AI അപ്ലിക്കേഷനുകള്ക്കായുള്ള സംയോജിത ഡെവലപ്പ്മെന്റ് പരിസരം
- **ഡിപ്ലോയ്മെന്റ് ഓപ്ഷനുകൾ**: നിരവധി ഹോസ്റ്റിംഗ്‌, സ്കെയിലിംഗ് ഓപ്ഷനുകൾ
- **സുരക്ഷയും സുരക്ഷിതത്വവും**: ഇൻബിൽട്ട് ഉത്തരവാദിത്ത AI സവിശേഷതകൾ

## AZD + മൈക്രോസോഫ്ട് ഫൗണ്ട്രി: ചേർന്ന് മികച്ചത്

| സവിശേഷത | മൈക്രോസോഫ്ട് ഫൗണ്ട്രി | AZD ഇന്റഗ്രേഷൻ പ്രയോജനം |
|---------|-----------------|------------------------|
| **മോഡൽ ഡിപ്ലോയ്മെന്റ്** | മാനുവൽ പോർട്ടൽ ഡിപ്ലോയ്മെന്റ് | ഓട്ടോമേറ്റഡ്, ആവർത്തനയോഗ്യമായ ഡിപ്ലോയ്മെന്റുകൾ |
| **ഇൻഫ്രാസ്ട്രക്ചർ** | ക്ലിക്ക്-തുരുത്ത് പ്രൊവിഷനിംഗ് | ഇൻഫ്രാസ്ട്രക്ചർ ആസ് കോഡ് (ബൈസിപ്പി) |
| **പരിസ്ഥിതി മാനേജ്മെന്റ്** | ഒറ്റ പരിസ്ഥിതി കേന്ദ്രീകരണം | ബഹു-പരിസ്ഥിതി (ഡെവ്/സ്റ്റേജിംഗ്/പ്രോഡ്) |
| **CI/CD ഇൻറഗ്രേഷൻ** | പരിമിതമായ സപ്പോർട്ട് | ജന്മജGitHub ആക്ഷനുകളുടെ സപ്പോർട്ട് |
| **ചെലവ് മാനേജ്മെന്റ്** | അടിസ്ഥാന മോണിറ്ററിംഗ് | പരിസ്ഥിതി-സവിശേഷ ചെലവ് ഒപ്റ്റിമൈസേഷൻ |

## മുന്‍കൂര്‍ ആവശ്യങ്ങള്‍

- യോജിച്ച അനുമതികളോടു ഉള്ള അസ്യൂർ സബ്‌സ്‌ക്രിപ്ഷൻ
- അസ്യൂർ ഡെവലപ്പർ CLI ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ട്
- മൈക്രോസോഫ്ട് ഫൗണ്ട്രി മോഡൽ സർവീസുകളിലേക്ക് ആക്സസ്
- മൈക്രോസോഫ്ട് ഫൗണ്ട്രി അടിസ്ഥാന പരിചയം

> **ഇപ്പോൾ നിലവിലിരിക്കുന്ന AZD പതിപ്പ്:** ഈ ഉദാഹരണങ്ങൾ `azd` `1.27.1` പതിപ്പോട് താരതമ്യപ്പെടുത്തി പരിശോധിച്ചു. AI ഏജന്റ് വർക്ക്ഫ്‌ളോകിനായി, നിലവിലുള്ള പ്രിവ്യൂ എക്സ്റ്റെൻഷൻ റിലീസ് ഉപയോഗിച്ച് നിങ്ങളുടെ ഇൻസ്റ്റാൾ ചെയ്ത പതിപ്പ് പരിശോധിക്കൂ.

## കോർ ഇന്റഗ്രേഷൻ അനുഭവങ്ങൾ

### അനുഭവം 1: മൈക്രോസോഫ്ട് ഫൗണ്ട്രി മോഡലുകൾ ഇന്റഗ്രേഷൻ

**ഉപയോഗകേസ്**: മൈക്രോസോഫ്ട് ഫൗണ്ട്രി മോഡലുകൾ ഉപയോഗിച്ച് ചാറ്റ് അപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ് ചെയ്യുക

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

### അനുഭവം 2: AI തിരച്ചിൽ + RAG ഇന്റഗ്രേഷൻ

**ഉപയോഗകേസ്**: റിട്രീവൽ ഓഗ്മെന്റഡ് ജനറേഷൻ (RAG) അപ്ലിക്കേഷനുകൾ ഡിപ്ലോയ് ചെയ്യുക

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

### അനുഭവം 3: ഡോക്യുമെന്റ് ഇന്റലിജൻസ് ഇന്റഗ്രേഷൻ

**ഉപയോഗകേസ്**: ഡോക്യുമെന്റ് പ്രോസസ്സിംഗ്, വിശകലന പ്രവർത്തനങ്ങൾ

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

## 🔧 കൺഫിഗറേഷൻ അനുഭവങ്ങൾ

### പരിസ്ഥിതി വെരിയബിളുകൾ സജ്ജമാക്കൽ

**പ്രൊഡക്ഷൻ കോൺഫിഗറേഷൻ:**
```bash
# കോർ എ.ഐ. സേവനങ്ങൾ
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

**ഡെവലപ്മെന്റ് കോൺഫിഗറേഷൻ:**
```bash
# വികസനത്തിനുള്ള ചെലവ് പരിഗണിച്ച ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # സൗജന്യ തരം
```

### കി വാൾട്ട് ഉപയോഗിച്ച് സുരക്ഷിത കോൺഫിഗറേഷൻ

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

## ഡിപ്ലോയ്മെന്റ് വർക്ക്ഫ്‌ളോകൾ

### ഫൗണ്ട്രിക്ക് AZD എക്സ്റ്റൻഷനുകൾ

മൈക്രോസോഫ്ട് ഫൗണ്ട്രി സേവനങ്ങൾക്കായി AI-വിശേഷതകൾ ചേർക്കുന്ന AZD എക്സ്റ്റൻഷനുകൾ ലഭ്യമാണ്:

```bash
# Foundry ഏജൻറുകൾക്ക് എക്സ്റ്റെൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.agents

# ഫൈൻ-ട്യൂണിംഗ് എക്സ്റ്റെൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.finetune

# കസ്റ്റം മോഡലുകൾക്ക് എക്സ്റ്റെൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.models

# ഇൻസ്റ്റാൾ ചെയ്ത എക്സ്റ്റെൻഷനുകളുടെ പട്ടിക കാണുക
azd extension list --installed

# നിലവിൽ ഇൻസ്റ്റാൾ ചെയ്ത ഏജൻറ് എക്സ്റ്റെൻഷൻ വേർഷൻ പരിശോധിക്കുക
azd extension show azure.ai.agents
```

AI എക്സ്റ്റൻഷനുകൾ ഇപ്പോഴും പ്രിവ്യൂയിൽ വേഗത്തിൽ മുന്നേറുകയാണ്. ഒരു കമാൻഡ് ഇവിടെ കാണിച്ച രീതിയിൽ പ്രവർത്തിക്കാത്ത പക്ഷം, പ്രശ്നപരിഹാരത്തിന് മുൻപ് ആവശ്യമായ എക്സ്റ്റൻഷൻ അപ്ഗ്രേഡ് ചെയ്യുക.

### `azd ai` ഉപയോഗിച്ച് ഏജന്റ്-ഫസ്റ്റ് ഡിപ്ലോയ്മെന്റ്

നിങ്ങൾക്ക് ഏജന്റ് മാനിഫെസ്റ്റ് ഉണ്ടെങ്കിൽ, `azd ai agent init` ഉപയോഗിച്ച് ഫൗണ്ട്രി ഏജന്റ് സർവീസുമായി ബന്ധം പുലർത്തുന്ന പ്രോജക്ട് സ്കാഫോൾഡ് ചെയ്യുക:

```bash
# ഒരു ഏജന്റ് മാനിഫെസ്റ്റിൽ നിന്ന് ആരംഭിക്കുക
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# അസ്യൂറിൽ വിന്യസിക്കുക
azd up
```

`azure.ai.agents`-ന്റെ പുതിയ പ്രിവ്യൂ റിലീസുകൾ `azd ai agent init` ടേംപ്ലേറ്റ്-അടിസ്ഥാന ഇൻഷ്യലൈസേഷൻ പിന്തുണ കൂടി ചേർത്തിട്ടുണ്ട്. പുതിയ ഏജന്റ് സാമ്പിളുകൾ പിന്തുടരുകയാണെങ്കിൽ, നിങ്ങളുടെ ഇൻസ്റ്റാൾ ചെയ്ത പതിപ്പിലെ കൃത്യമായ ഫ്‌ളാഗുകൾ പരിശോധിക്കുക.

മുഴുവൻ കമാൻഡ് റഫറൻസ് ‌മെത്തും ഫ്‌ളാഗുകളോടും കൂടി [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) കാണുക.

### ഏക കമാൻഡ് ഡിപ്ലോയ്മെന്റ്

```bash
# ഒരൊറ്റ കമാൻഡിൽ എല്ലാം വിന്യസിക്കുക
azd up

# അല്ലെങ്കിൽ ക്രമാനുക്രമമനുസരിച്ച് വിന്യസിക്കുക
azd provision  # ഇൻഫ്രാസ്ട്രക്ചർ മാത്രം
azd deploy     # ആപ്ലിക്കേഷൻ മാത്രം

# azd 1.23.11+ൽ ദൈർഘ്യമേറിയ പ്രവർത്തനക്ഷമമായ AI ആപ്പ് വിന്യസിക്കലുകൾക്കായി
azd deploy --timeout 1800
```

### പരിസ്ഥിതിസ്വഭാവം അടിസ്ഥാനമാക്കി ഡിപ്ലോയ്മെന്റുകൾ

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

## മോണിറ്ററിംഗ് ആന്റ് ഒബ്സർവബിലിറ്റി

### അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ് ഇന്റഗ്രേഷൻ

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

## 🔐 സുരക്ഷ മികച്ച രീതികൾ

### മാനേജ്ഡ് ഐഡൻറ്റിറ്റി കോൺഫിഗറേഷൻ

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

## പ്രകടന മെച്ചപ്പെടുത്തൽ

### കാഷിംഗ് നയങ്ങൾ

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

## സാധാരണ പ്രശ്നങ്ങൾ പരിഹരിക്കൽ

### പ്രശ്നം 1: OpenAI ക്വോട്ട അലംഘിച്ചു

**രോഗലക്ഷണങ്ങൾ:**
- ക്വോട്ട പിശകുകൾ കാരണം ഡിപ്ലോയ്മെന്റ് തകരുന്നു
- ആപ്ലിക്കേഷൻ ലോക്കുകളിൽ 429 പിശകുകൾ

**പരിഹാരങ്ങൾ:**
```bash
# നിലവിലെ ക്വോട്ട ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list --location eastus

# വ്യത്യസ്തങ്ങളായ പ്രദേശം ശ്രമിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താൽക്കാലികമായി ശേഷി കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### പ്രശ്നം 2: പ്രാമാണീകരണ പരാജയങ്ങൾ

**രോഗലക്ഷണങ്ങൾ:**
- AI സേവനങ്ങൾ വിളിക്കുമ്പോൾ 401/403 പിശകുകൾ
- "ആക്സസ് നിരാകരിച്ചു" എന്ന സന്ദേശങ്ങൾ

**പരിഹാരങ്ങൾ:**
```bash
# പദവി നിയവാരണം പരിശോധിക്കുക
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# മാനേജുചെയ്‌ത ഐഡന്റിറ്റി കോൺഫിഗറേഷൻ പരിശോധിക്കുക
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# കീ വാൾട്ട് ആക്‌സസ് സത്യാപിക്കുക
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### പ്രശ്നം 3: മോഡൽ ഡിപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ

**രോഗലക്ഷണങ്ങൾ:**
- മോഡലുകൾ ഡിപ്ലോയ്മെന്റിൽ ലഭ്യമല്ല
- ഒരു പ്രത്യേക മോഡൽ പതിപ്പിൽ പരാജയം

**പരിഹാരങ്ങൾ:**
```bash
# മേഖലാനുസരിച്ച് ലഭ്യമായ മോഡലുകൾ പട്ടികപ്പെടുത്തുക
az cognitiveservices model list --location eastus

# ബൈസെപ് ടെംപ്ലേറ്റിൽ മോഡൽ പതിപ്പ് അപ്ഡേറ്റ് ചെയ്യുക
# മോഡൽ ശേഷി ആവശ്യകതകൾ പരിശോധിക്കുക
```

## ഉദാഹരണ ടെംപ്ലേറ്റുകൾ

### RAG ചാറ്റ് അപ്ലിക്കേഷൻ (Python)

**റിപ്പോസിറ്ററി**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**സേവനങ്ങൾ**: അസ്യൂർ ഓപ്പൺAI + അസ്യൂർ AI സെർച്ച + അസ്യൂർ കണ്ടെയ്‌നർ ആപ്പുകൾ + അസ്യൂർ ബ്ലോബ് സ്റ്റോറേജ്

**വിവരണം**: ഏറ്റവും ജനപ്രിയമായ അസ്യൂർ AI സാമ്പിൾ — നിങ്ങളുടെ സ്വന്തം ഡോക്യുമെന്റുകളിൽ നിന്ന് ചോദ്യങ്ങൾ ചോദിക്കാൻ അനുവദിക്കുന്ന എല്ലാ ട്രെയിൻ ചെയ്ത RAG ചാറ്റ് ആപ്പ്. GPT-4.1-മിനി ഉപയോഗിച്ച് ചാറ്റ്, ടെക്സ്റ്റ്-എംബഡ്ഡിംഗ്-3-ലാർജ് ഉപയോഗിച്ച് ഇംബഡ്ഡിംഗ്, അസ്യൂർ AI സെർച്ച റിട്ട്രീവലിനായി. മൾടിമോഡൽ ഡോക്യുമെന്റുകൾക്ക് പിന്തുണ, സ്വരം ഇൻപുട്ടും ഔട്ട്പുട്ടും, മൈക്രോസോഫ്ട് എൻട്രാ പ്രാമാണീകരണം, അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ് ട്രേസിങ്ങ് എന്നിവ ഉൾപ്പെടുന്നു.

**ക്ഷിപ്ര ആരംഭം**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG ചാറ്റ് അപ്ലിക്കേഷൻ (.NET)

**റിപ്പോസിറ്ററി**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**സേവനങ്ങൾ**: അസ്യൂർ ഓപ്പൺAI + അസ്യൂർ AI സെർച്ച + അസ്യൂർ കണ്ടെയ്‌നർ ആപ്പുകൾ + സെമാന്റിക് കർണൽ

**വിവരണം**: Python RAG ചാറ്റ് സാമ്പിളിന്റെ .NET/C# പതിപ്പ്. ASP.NET കോർ മിനിമൽ API, ബ്ലേസർ വെബ് അസംബ്ലി ഫ്രണ്ടൻഡ് ഉപയോഗിച്ച് നിർമ്മിച്ചത്. വോയ്സ് ചാറ്റ്, GPT-4o-മിനി വിഷൻ സപ്പോർട്ട്, .NET MAUI ബ്ലേസർ ഹൈബ്രിഡ് ഡെസ്ക്ടോപ്പ്/മൊബൈൽ ക്ലയന്റ് ഉള്‍പ്പെടുന്നു.

**ക്ഷിപ്ര ആരംഭം**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG ചാറ്റ് അപ്ലിക്കേഷൻ (ജാവ)

**റിപ്പോസിറ്ററി**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**സേവനങ്ങൾ**: അസ്യൂർ ഓപ്പൺAI + അസ്യൂർ AI സെർച്ച + അസ്യൂർ കണ്ടെയ്‌നർ ആപ്പുകൾ / AKS + ലാംഗ്‌ചെയ്ൻ4J + അസ്യൂർ കോസ്മോസ് DB

**വിവരണം**: ജാവ പതിപ്പിലുള്ള RAG ചാറ്റ് സാമ്പിൾ Langchain4J ഉപയോഗിച്ച് AI ഓർക്കസ്ട്രേഷനും. മൈക്രോസർവീസ് ഇവന്റ്-ഡ്രിവൻ ആർക്കിടെക്ചർ, വിവിധ സെർച്ചിംഗ് നയങ്ങൾ (ടെക്സ്റ്റ്, വെക്റ്റർ, ഹൈബ്രിഡ്), ഡോക്യുമെന്റ് അപ്‌ലോഡ് മൈക്രോസോഫ്ട് ഡോക്യുമെന്റ് ഇന്റലിജൻസോടെ, അസ്യൂർ കണ്ടെയ്‌നർ ആപ്പുകളിലോ അസ്യൂർ കുബർനേട്ടിസ് സേവനത്തിൽ ഡിപ്ലോയ്മെന്റിനും പിന്തുണ.

**ക്ഷിപ്ര ആരംഭം**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### മൈക്രോസോഫ്ട് ഫൗണ്ട്രി ഉപയോഗിച്ച് എന്റർപ്രൈസ് റീറ്റെയിൽ കോപൈലറ്റ്

**റിപ്പോസിറ്ററി**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**സേവനങ്ങൾ**: അസ്യൂർ ഓപ്പൺAI + മൈക്രോസോഫ്ട് ഫൗണ്ട്രി + പ്രോംപ്റ്റി + അസ്യൂർ AI സെർച്ച + അസ്യൂർ കണ്ടെയ്‌നർ ആപ്പുകൾ + അസ്യൂർ കോസ്മോസ് DB

**വിവരണം**: മൈക്രോസോഫ്ട് ഫൗണ്ട്രിയുമായി കോപൈലറ്റായുള്ള റീറ്റെയിൽ RAG. ഒരു Contoso ഔട്ട്‌డോർ റീറ്റെയിൽ ചാറ്റ് ബോട്ട്, ഉൽപ്പന്ന കാറ്റലോഗും ഉപഭോക്തൃ ഓർഡർ ഡേറ്റയിലുമാണ് മറുപടികൾ ആസ്പദമാക്കുന്നത്. GenAIOps പൂർണ്ണ വർക്‌ഫ്ലോ ഡെമോ ചെയ്യുന്നു — പ്രോട്ടോട്ടൈപ്പ് പ്രോംപ്റ്റി ഉപയോഗിച്ച്, AI-സഹായ evaluators-ൽ വിലയിരുത്തി, AZD മുഖേന കണ്ടെയ്‌നർ ആപ്പുകളിൽ ഡിപ്ലോയ് ചെയ്യുന്നു.

**ക്ഷിപ്ര ആരംഭം**:
```bash
azd init --template contoso-chat
azd up
```

### സ്രഷ്ടിപ്പാട്രութիւն മള്‍ടി-ഏജന്റ് അപ്ലിക്കേഷൻ

**റിപ്പോസിറ്ററി**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**സേവനങ്ങൾ**: അസ്യൂർ ഓപ്പൺAI + അസ്യൂർ AI ഏജന്റ് സർവീസ് + ബിംഗ് ഗ്രൗണ്ടിംഗ് + അസ്യൂർ AI സെർച്ച + അസ്യൂർ കണ്ടെയ്‌നർ ആപ്പുകൾ

**വിവരണം**: പ്രൊംപ്റ്റി ഉപയോഗിച്ച് AI ഏജന്റ് ഓർക്കസ്ട്രേഷൻ കാണിക്കുന്ന മൾട്ടി-ഏജന്റ് സാമ്പിൾ. റിസർച്ച് ഏജന്റ് (ബിംഗ് ഗ്രൗണ്ടിംഗ് ഇൻ അസ്യൂർ AI ഏജന്റ് സർവീസ്), ഉൽപ്പന്ന ഏജന്റ് (അസ്യൂർ AI സെർച്ച), എഴുത്തുകാരൻ ഏജന്റ്, എഡിറ്റർ ഏജന്റ് എന്നിവ ചേർന്ന് നന്നായി ഗവേഷണം ചെയ്ത ലേഖനങ്ങൾ സമ്മാനിക്കുന്നു. GitHub ആക്ഷനുകളിൽ CI/CD ഉൾപ്പെടുന്നു.

**ക്ഷിപ്ര ആരംഭം**:
```bash
azd init --template contoso-creative-writer
azd up
```

### സർവർലെസ് RAG ചാറ്റ് (ജാവാസ്‌ക്രിപ്റ്റ്/ടൈപ്പ്സ്ക്രിപ്റ്റ്)

**റിപ്പോസിറ്ററി**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**സേവനങ്ങൾ**: അസ്യൂർ ഓപ്പൺAI + അസ്യൂർ ഫങ്ഷൻസ് + അസ്യൂർ സ്റ്റാറ്റിക് വെബ് ആപ്പുകൾ + അസ്യൂർ കോസ്മോസ് DB ഫോർ നോഎസ്‌ക്യുവൽ + ലാംഗ്‌ചെയ്ൻ.js

**വിവരണം**: APIയ്ക്കായി അസ്യൂർ ഫങ്ഷൻസ് ഉപയോഗിച്ച്, ഹോസ്റ്റിംഗിനായി അസ്യൂർ സ്റ്റാറ്റിക് വെബ് ആപ്പുകൾ ഉപയോഗിച്ചുള്ള പൂർണ്ണ സർവർലെസ് RAG ചാറ്റ് ബോട്ട്. അസ്യൂർ കോസ്മോസ് DB വെക്റ്റർ സ്റ്റോറിനും ചാറ്റ് ചരിത്ര ഡാറ്റാബേസിനും. ഒളാമ ഉപയോഗിച്ച് ലോക്കൽ ഡെവലപ്മെന്റിന്റെ പോഷൺ.

**ക്ഷിപ്ര ആരംഭം**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### നിങ്ങളുടെ ഡാറ്റയോടുള്ള ചാറ്റ് സൊല്യൂഷൻ ആക്സിലറേറ്റർ

**റിപ്പോസിറ്ററി**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**സേവനങ്ങൾ**: അസ്യൂർ ഓപ്പൺAI + അസ്യൂർ AI സെർച്ച + അസ്യൂർ ആപ്പ് സർവീസ് + അസ്യൂർ ഡോക്യുമെന്റ് ഇന്റലിജൻസ് + അസ്യൂർ ഫങ്ഷൻസ് + അസ്യൂർ കോസ്മോസ് DB / പോസ്റ്റ്ഗ്രെഎസ്‌ക്യൂഎൽ

**വിവരണം**: അഡ്മിൻ പോർട്ടലിലൂടെ ഡോക്യുമെന്റ് അപ്‌ലോഡ്/മാനേജ്‌മെന്റ്, ബഹുസംഖ്യ ഓർക്കസ്ട്രേറ്റർ ഓപ്ഷനുകൾ (സെമാന്റിക് കർണൽ, ലാംഗ്‌ചെയ്ൻ, പ്രോംപ്റ്റ് ഫ്ലോ), സ്പീച്ച്-ടു-ടെക്സ്റ്റ്, മൈക്രോസോഫ്ട് ടീംസ് ഇന്റഗ്രേഷൻ, പോസ്റ്റ്ഗ്രെഎസ്‌ക്യൂഎൽ/കോസ്മോസ് DB ബാക്ക്എൻഡ് എന്നിവയോടുള്ള എന്റർപ്രൈസ്-തരം RAG സൊല്യൂഷൻ ആക്സിലറേറ്റർ. പ്രൊഡക്ഷൻ RAG അവസരങ്ങൾക്ക് അനുയോജ്യമായ ഇഷ്‌ടാനുസൃതതാ തുടക്കം.

**ക്ഷിപ്ര ആരംഭം**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ട്രാവൽ ഏജന്റ്സ് — മൾട്ടി-ഏജന്റ് MCP ഓർക്കസ്ട്രേഷൻ

**റിപ്പോസിറ്ററി**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**സേവനങ്ങൾ**: അസ്യൂർ ഓപ്പൺAI + മൈക്രോസോഫ്ട് ഫൗണ്ട്രി + അസ്യൂർ കണ്ടെയ്‌നർ ആപ്പുകൾ + MCP സെർവറുകൾ (.NET, Python, ജാവ, ടൈപ്പ്സ്ക്രിപ്റ്റ്)

**വിവരണം**: മൂന്ന് ഫ്രെയിംവർക്കുകളും (LangChain.js, LlamaIndex.TS, മൈക്രോസോഫ്ട് ഏജന്റ് ഫ്രെയിംവർക്ക്) ഉപയോഗിച്ചുള്ള മൾട്ടി-ഏജന്റ് AI ഓർക്കസ്ട്രേഷൻ റഫറൻസ് അപ്ലിക്കേഷൻ. നാലു ഭാഷകളിലുള്ള MCP (മോഡൽ കണ്ടെക്സ്റ്റ് പ്രോട്ടോകോൾ) സെർവറുകൾ ഓപ്പൺടെലിമെട്രി മോണിറ്ററിംഗുമായി അസ്യൂർ കണ്ടെയ്‌നർ ആപ്പുകളായി ഡിപ്ലോയ് ചെയ്യുന്നു.

**ക്ഷിപ്ര ആരംഭം**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### അസ്യൂർ AI സ്റ്റാർട്ടർ

**റിപ്പോസിറ്ററി**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**സേവനങ്ങൾ**: അസ്യൂർ AI സേവനങ്ങൾ + അസ്യൂർ ഓപ്പൺAI

**വിവരണം**: കോൺഫിഗർ ചെയ്ത മെഷീൻ ലേണിംഗ് മോഡലുകളുമായി അസ്യൂർ AI സേവനങ്ങൾ ഡിപ്ലോയു ചെയുന്ന മിനിമൽ ബൈസിപ്പി ടെംപ്ലേറ്റ്. പൂർണ്ണ അപ്ലിക്കേഷൻ സ്റ്റാക്ക് ആവശ്യമില്ലാതെ അസ്യൂർ AI ഇൻഫ്രാസ്ട്രക്ചർ മാത്രമേ ഡിപ്ലോയുചെയ്യേണ്ടത് ആയാൽ ലഘുഭാരമുള്ള തുടക്കം.

**ക്ഷിപ്ര ആരംഭം**:
```bash
azd init --template azd-ai-starter
azd up
```

> **കൂടുതൽ ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) സന്ദർശിച്ച് 80-ലധികം AI-വിശിഷ്ട AZD ടെംപ്ലേറ്റുകൾ ഭാഷകളും സീനാരിയോകളും കാണുക.

## അടുത്ത ചതി

1. **ഉദാഹരണങ്ങൾ ശ്രമിക്കുക**: നിങ്ങളുടെ ഉപയോഗകേസിനനുസരിച്ച് മുൻകൂട്ടി നിർമിച്ച ടെംപ്ലേറ്റ് തിരഞ്ഞെടുക്കുക
2. **നിങ്ങളുടെ ആവശ്യങ്ങൾക്കായി ഇനം മാറ്റം വരുത്തുക**: ഇൻഫ്രാസ്ട്രക്ചറും അപ്ലിക്കേഷൻ കോഡും മാറ്റാം
3. **മോണിറ്ററിംഗ് ചേർക്കുക**: സമഗ്രമായ നിരീക്ഷണ സംവിധാനങ്ങൾ നടപ്പാക്കുക
4. **ചെലവ് ഒപ്റ്റിമൈസ് ചെയ്യുക**: ബജറ്റിന് അനുയോജ്യമായി കോൺഫിഗറേഷനുകൾ മെച്ചപ്പെടുത്തുക
5. **ഡിപ്ലോയ്മെന്റിന്റെ സുരക്ഷ ഉറപ്പാക്കുക**: എന്റർപ്രൈസ് സുരക്ഷാ രീതികൾ നടപ്പാക്കുക
6. **പ്രൊഡക്ഷൻ സ്ട്രോച്ച് ചെയ്യുക**: ബഹു-റീജിയനും ഉയർന്ന ലഭ്യത സവിശേഷതകളും ചേർക്കുക

## 🎯 കൈകൊണ്ട് ചെയ്യാനുള്ള അഭ്യാസങ്ങൾ

### അഭ്യാസം 1: മൈക്രോസോഫ്ട് ഫൗണ്ട്രി മോഡൽ ചാറ്റ് ആപ്പ് ഡിപ്ലോയ് ചെയ്യുക (30 മിനിറ്റ്)
**ലക്ഷ്യം**: പ്രൊഡക്ഷൻ റെഡിയായ AI ചാറ്റ് അപ്ലിക്കേഷൻ ഡിപ്ലോയ് ചെയ്ത് പരീക്ഷിക്കുക

```bash
# ടെംപ്ലേറ്റ് ആരംഭിക്കുക
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# പരിസ്ഥിതി വ്യത്യസ്ഥങ്ങൾ ക്രമീകരിക്കുക
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# വിന്യസിപ്പിക്കുക
azd up

# അപ്ലിക്കേഷൻ പരീക്ഷിക്കുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI പ്രവർത്തനങ്ങൾ നിരീക്ഷിക്കുക
azd monitor

# ശുചീകരിക്കുക
azd down --force --purge
```

**വിജய் മാനദണ്ഡങ്ങൾ:**
- [ ] ക്വോട്ട പിശകുകൾ ഇല്ലാതെ ഡിപ്ലോയ്മെന്റ് പൂർത്തിയാക്കുക
- [ ] ബ്രൗസറിൽ നിന്ന് ചാറ്റ് ഇന്റർഫേസ് ആക്സസ് ചെയ്യാൻ സാധിക്കുക
- [ ] ചോദ്യങ്ങൾ ചോദിച്ച് AI-ചാലിത മറുപടികൾ നേടുക
- [ ] അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ് ടെലിമെട്രി ഡാറ്റ കാണിക്കുക
- [ ] വിജയകരമായി റിസോഴ്സുകൾ ശുദ്ധമാക്കുക

**എസ്റ്റിമേറ്റഡ് ചെലവ്**: 30 മിനിറ്റിനായി $5-10

### അഭ്യാസം 2: മൾട്ടി-മോഡൽ ഡിപ്ലോയ്മെന്റ് കോൺഫിഗർ ചെയ്യുക (45 മിനിറ്റ്)
**ലക്ഷ്യം**: വ്യത്യസ്ത കോൺഫിഗറേഷനുകളുള്ള നിരവധി AI മോഡലുകൾ ഡിപ്ലോയ് ചെയ്യുക

```bash
# കസ്റ്റം ബിസെപ് കോൺഫിഗറേഷൻ സൃഷ്ടിക്കുക
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

# വിന്യസിച്ച് സ്ഥിരീകരിക്കുക
azd provision
azd show
```

**വിജയ് മാനദണ്ഡങ്ങൾ:**
- [ ] നിരവധി മോഡലുകൾ വിജയകരമായി ഡിപ്ലോയ് ചെയ്തിട്ടുണ്ട്
- [ ] വ്യത്യസ്ത ശേഷി ക്രമീകരണങ്ങൾ പ്രാവർത്തികമാക്കുന്നു
- [ ] മോഡലുകൾ API വഴി ആക്സസ്സ് ചെയ്യാവുന്നതാണ്
- [ ] ആപ്ലിക്കേഷനിൽ നിന്ന് രണ്ട് മോഡലുകളും വിളിക്കാവുന്നതാണ്

### അഭ്യാസം 3: ചെലവ് മോണിറ്ററിംഗ് നടപ്പാക്കുക (20 മിനിറ്റ്)
**ലക്ഷ്യം**: ബഡ്ജറ്റ് അലർട്ടുകളും ചെലവ് ട്രാക്കിംഗും സജ്ജമാക്കുക

```bash
# ബൈസെപ്പിൽ ബജറ്റ് അലേർട്ട് ചേർക്കുക
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

# ബജറ്റ് അലേർട്ട് വിന്യാസീകരിക്കുക
azd provision

# നിലവിലെ ചെലവുകൾ പരിശോധിക്കുക
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**വിജയ് മാനദണ്ഡങ്ങൾ:**
- [ ] അസ്യൂറിൽ ബഡ്ജറ്റ് അലർട്ട് സൃഷ്ടിച്ചു
- [ ] ഇമെയിൽ നോട്ടിഫിക്കേഷനുകൾ കോൺഫിഗർ ചെയ്തു
- [ ] അസ്യൂർ പോർട്ടലിൽ ചെലവ് ഡാറ്റ കാണാൻ കഴിയും
- [ ] ബഡ്ജറ്റ് പരിധികൾ ശരിയായി ക്രമീകരിച്ചു

## 💡 പതിവ് ചോദിക്കുന്ന ചോദ്യങ്ങൾ

<details>
<summary><strong>ഡെവലപ്മെന്റ് സമയത്ത് മൈക്രോസോഫ്ട് ഫൗണ്ട്രി മോഡൽ ചെലവ് എങ്ങനെ കുറയ്ക്കാം?</strong></summary>

1. **ഫ്രീ ടിയർ ഉപയോഗിക്കുക**: മൈക്രോസോഫ്ട് ഫൗണ്ട്രി മോഡലുകൾക്ക് മാസം 50,000 ടോക്കൺസിന്റെ സൗജന്യ പരിധി ഉണ്ട്
2. **ശേഷി കുറയ്ക്കുക**: ഡെവയിനായി ശേഷി 30+മല്ല 10 TPM ആയി ക്രമീകരിക്കുക
3. **azd down ഉപയോഗിക്കുക**: സജീവമായി ഡെവലപ് ചെയ്യാത്തപ്പോള്‍ റിസോഴ്‌സുകൾ ഡിആലോക്കേറ്റ് ചെയ്യുക
4. **റിസ്‌ക/cache വീണ്ടെടുക്കല്**: ആവർത്തിക്കുന്ന ക്വെരികൾക്ക് റെഡിസ് കാഷെ നടപ്പിലാക്കുക
5. **പ്രോംപ്റ്റ് എഞ്ചിനീയറിംഗ് ഉപയോഗിക്കുക**: കാര്യക്ഷമമായ പ്രോംപ്റ്റുകള്‍ ഉപയോഗിച്ച് ടോക്കൺ ഉപയോഗം കുറയ്ക്കുക


```bash
# വികസന ഘടക ക്രമീകരണം
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry മോഡലുകളും OpenAI API യും തമ്മിലുള്ള വ്യത്യാസം എന്താണ്?</strong></summary>

**Microsoft Foundry മോഡലുകൾ**:
- എന്റർപ്രൈസ് സുരക്ഷയും പാലനവും
- സ്വകാര്യ നെറ്റ്‌വർക്ക് ഇന്റഗ്രേഷൻ
- SLA ഉറപ്പുകൾ
- മാനേജുചെയ്ത ഐഡന്റിറ്റി.authentication
- ഉയർന്ന കോട്ടകൾ ലഭ്യമാണ്

**OpenAI API**:
- പുതിയ മോഡലുകളിലേക്ക് വേഗത്തിലുള്ള പ്രവേശനം
- എളുപ്പമുള്ള ക്രമീകരണം
- പ്രവേശനത്തിന് കുറഞ്ഞ തടസം
- പബ്ലിക് ഇന്റർനെറ്റ് മാത്രമേ

പ്രൊഡക്ഷൻ ആപ്പുകള үшін, **Microsoft Foundry മോഡലുകൾ ശുപാർശ ചെയ്യപ്പെട്ടതാണ്**.
</details>

<details>
<summary><strong>Microsoft Foundry മോഡലുകളുടെ കോട്ട പരമാവധി കഴിഞ്ഞ പിഴവുകൾ ഞാൻ എങ്ങനെ കൈകാര്യം ചെയ്യാം?</strong></summary>

```bash
# നിലവിലെ ക്വോട്ട പരിശോധിക്കുക
az cognitiveservices usage list --location eastus2

# വേറൊരു മേഖല പരീക്ഷിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താത്കാലികമായി ശേഷി കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ക്വോട്ട വർധനവിന് അപേക്ഷിക്കുക
# ആസ്വര്‍ പോര്‍ട്ടലിലേക്ക് മംഗളാം ഗുഡ് &gt; ക്വോട്ട &gt; വർധനവിന് അപേക്ഷിക്കുക
```
</details>

<details>
<summary><strong>Microsoft Foundry മോഡലുകളുമായ് എന്റെ സ്വന്തം ഡേറ്റ ഉപയോഗിക്കാമോ?</strong></summary>

അതെ! RAG (Retrieval Augmented Generation) നു **Azure AI Search** ഉപയോഗിക്കുക:

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
<summary><strong>AI മോഡൽ എൻഡ്‌പോയിന്റുകൾ എങ്ങനെ സുരക്ഷിതമാക്കാം?</strong></summary>

**മികച്ച പ്രാക്ടിസുകൾ**:
1. മാനേജുചെയ്ത ഐഡന്റിറ്റി (API കീകൾ ഇല്ലാതെ)
2. സ്വകാര്യ എൻഡ്‌പോയിന്റുകൾ സജ്ജമാക്കുക
3. നെറ്റ്‌വർക്ക് സുരക്ഷാ ഗ്രൂപ്പുകൾ ക്രമീകരിക്കുക
4. നിരക്കു നിയന്ത്രണം നടപ്പിലാക്കുക
5. രഹസ്യങ്ങൾക്ക് Azure കീ വാൾട്ട് ഉപയോഗിക്കുക

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

## സമൂഹവും സഹായവും

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [പ്രശ്നങ്ങളും ചര്‍ച്ചകളും](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [അധികൃത ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh ൽ Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - നിങ്ങളുടെ എഡിറ്ററിൽ `npx skills add microsoft/github-copilot-for-azure` ഉപയോഗിച്ച് Azure + Foundry ഏജന്റ് സ്‌കിൽകൾ ഇൻസ്റ്റാൾ ചെയ്യുക

---

**അധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: Chapter 2 - AI-First Development
- **⬅️ മുമ്പത്തെ അധ്യായം**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ അടുത്തത്**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 അടുത്ത അധ്യായം**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**സഹായം വേണോ?** നമ്മുടെ കമ്മ്യൂണിറ്റി ചര്‍ച്ചകളിൽ ചേർത്ത് അല്ലെങ്കിൽ റിപ്പോസിറ്ററിയിൽ ഒരു ഈഷ്യു തുറക്കുക. Azure AI + AZD സമൂഹം നിങ്ങളുടെ വിജയത്തിന് സഹായിക്കാൻ ഇവിടെ ഉണ്ട്!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->