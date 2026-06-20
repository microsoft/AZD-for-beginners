# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

ഈ ഗൈഡ് മൈക്രോസോഫ്‌റ്റ് ഫൗണ്ട്രി സേവനങ്ങളെ അളവുള്ള എഐ അപ്ലിക്കേഷൻ വിന്യാസങ്ങൾക്ക് വേണ്ടി ആസ്യൂർ ഡെവലപ്പർ CLI (AZD) ഉപയോഗിച്ച് എങ്ങനെ സംയോജിപ്പിക്കാമെന്ന് കാണിക്കുന്നു. മൈക്രോസോഫ്‌റ്റ് ഫൗണ്ട്രി എഐ അപ്ലിക്കേഷനുകൾ നിർമ്മിക്കുക, വിന്യാസം നടത്തുക, മാനേജ് ചെയ്യുക എന്നിവക്ക് സമഗ്രമായ പ്ലാറ്റ്‌ഫോം നൽകുന്നു, AZD അതിന്റെ ഇന് ഫ്രാസ്ട്രക്ചറും വിന്യാസ പ്രക്രിയയും എളുപ്പമാക്കുന്നു.

## What is Microsoft Foundry?

Microsoft Foundry മൈക്രോസോഫ്‌റ്റിന്റെ ഏകീകൃത എഐ വികസന പ്ലാറ്റ്‌ഫോമാണ്, കൂടാതെ ഇതില് ഉൾപ്പെടുന്നു:

- **Model Catalog**: ആധുനിക എഐ മോഡലുകളിലേക്ക് ആക്‌സസ്
- **Prompt Flow**: എഐ വർക്രോൾകളുടെ ദൃശ്യ ഡിസൈനർ
- **Microsoft Foundry Portal**: എഐ അപ്ലിക്കേഷനുകൾക്കുള്ള സംയോജിത വികസന പരിസരം
- **Deployment Options**: ബഹുഭൂരിധി ഹോസ്റ്റിംഗ്, സ്കെയിലിംഗ് ഓപ്ഷനുകൾ
- **Safety and Security**: ഉൾകഴിപ്പിച്ച ഉത്തരവാദിത്വമുള്ള എഐ ഫീച്ചറുകൾ

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | മാനുവൽ പോർട്ടൽ വിന്യാസം | സ്വയം പുനരാവർത്തനീയമായ വിന്യാസങ്ങൾ |
| **Infrastructure** | ക്ലിക്-ത്രൂ പ്രൊവിഷനിംഗ് | Infrastructure as Code (Bicep) |
| **Environment Management** | ഏക പരിതസ്ഥിതി കേന്ദ്രീകൃതം | ബഹു-പരിതസ്ഥിതികൾ (ഡെവ്/സ്റ്റേജിംഗ്/പ്രൊഡ്) |
| **CI/CD Integration** | പരിധിയുള്ളത് | സ്വജാതി GitHub Actions പിന്തുണ |
| **Cost Management** | അടിസ്ഥാന നിരീക്ഷണം | പരിതസ്ഥിതി-പ്രത്യേക ചെലവ് tốiമീകരണം |

## Prerequisites

- അനുയോജ്യമായ അനുമതികളുള്ള ആസ്യൂർ സബ്‌സ്‌ക്രിപ്ഷൻ
- Azure Developer CLI ഇൻസ്റ്റാൾ ചെയ്തിട്ടുണ്ടായിരിക്കുക
- Microsoft Foundry Models സേവനങ്ങളിൽ ആക്‌സസ്
- Microsoft Foundry-നോടു അടിസ്ഥാനപരമായ പരിചയം

> **Current AZD baseline:** ഈ ഉദാഹരണങ്ങൾ `azd` `1.23.12` ഓടെയാണ് പരിശീലം നടത്തിയത്. എഐ ഏജന്റ് വർക്രോൾക്ക് നിലവിലെ പ്രിവ്യൂ എക്സ്റ്റൻഷൻ റിലീസ് ഉപയോഗിക്കുകയും നിങ്ങളുടെ ഇൻസ്റ്റാൾ ചെയ്ത പതിപ്പ് പരിശോധിക്കുകയും ചെയ്യുക.

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: Microsoft Foundry Models മോഡലുകളുമായി ചാറ്റ് അപ്ലിക്കേഷനുകൾ വിന്യാസം ചെയ്യുക

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

**Use Case**: Retrieval-Augmented Generation (RAG) അപ്ലിക്കേഷനുകൾ വിന്യാസം ചെയ്യുക

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

**Use Case**: രേഖാ പ്രോസസ്സിംഗ്, വിശകലന വർക്രോൾകൾ

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

## 🔧 Configuration Patterns

### Environment Variables Setup

**Production Configuration:**
```bash
# കോർ എഐ സേവനങ്ങൾ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# മോഡൽ കോൺഫിഗറേഷനുകൾ
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# പ്രവർത്തന ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# വികസനത്തിനായുള്ള ചെലവ്-ആദയമായ ക്രമീകരണങ്ങൾ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # സൗജന്യ ടിയർ
```

### Secure Configuration with Key Vault

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

### AZD Extensions for Foundry

AZD മൈക്രോസോഫ്‌റ്റ് ഫൗണ്ട്രി സേവനങ്ങളുമായി പ്രവർത്തിക്കുന്ന എഐ-നിഷ്ഠമായ കഴിവുകൾ ചേർക്കുന്ന എക്സ്റ്റൻഷനുകൾ നൽകുന്നു:

```bash
# ഫൗൻഡ്രി ഏജന്റ്സ് എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.agents

# ഫൈൻ-ട്യൂണിംഗ് എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.finetune

# കസ്റ്റം മോഡലുകൾ എക്സ്റ്റൻഷൻ ഇൻസ്റ്റാൾ ചെയ്യുക
azd extension install azure.ai.models

# ഇൻസ്റ്റാൾ ചെയ്ത എക്സ്റ്റൻഷനുകൾ പട്ടികയാക്കുക
azd extension list --installed

# ഇപ്പോൾ ഇൻസ്റ്റാൾ ചെയ്ത ഏജന്റ് എക്സ്റ്റൻഷന്റെ വേർഷൻ പരിശോധിക്കുക
azd extension show azure.ai.agents
```

എഐ എക്സ്റ്റൻഷനുകൾ ഇപ്പോഴും പ്രിവ്യൂയിൽ വേഗത്തിൽ വളരുകയാണു്. ഒരു കമാൻഡ് ഇവിടെ കാണിക്കുന്ന തരത്തിൽ പ്രവർത്തിക്കാതിരിക്കാൻ സാധ്യതയുണ്ടെങ്കിൽ, പ്രോജക്ട് പ്രശ്നപരിഹാരത്തിന് മുൻപ് ബന്ധപ്പെട്ട എക്സ്റ്റെൻഷൻ അപ്ഗ്രേഡ് ചെയ്യുക.

### Agent-First Deployment with `azd ai`

നിങ്ങൾക്കൊരു ഏജന്റ് മാനിഫെസ്റ്റ് ഉണ്ടെങ്കിൽ, Foundry Agent Service-നോട് ബന്ധിപ്പിച്ച് പ്രോജക്ട് സ്കാഫോൾഡ് ചെയ്യാൻ `azd ai agent init` ഉപയോഗിക്കുക:

```bash
# എജന്റ് മാനിഫെസ്റ്റ് മുതൽ ആരംഭിക്കുക
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# അസ്യൂറിലേക്ക് വിന്യസിക്കുക
azd up
```

`azure.ai.agents`-ന്റെ ഏറ്റവും പുതിയ പ്രിവ്യു റിലീസുകളിൽ `azd ai agent init` ന്റെ ടെംപ്ലേറ്റ് അടിസ്ഥാനമാക്കിയുള്ള ഇൻഷ്യലൈസേഷൻ പിന്തുണ കൂടി ചേർക്കപ്പെട്ടിട്ടുണ്ട്. നിങ്ങൾ പുതിയ ഏജന്റ് സാമ്പിളുകൾ അനുസരിക്കുന്നു എങ്കിൽ, ഇൻസ്റ്റാൾ ചെയ്ത പതിപ്പിലെ കൃത്യമായ ഫ്ലാഗുകൾ പരിശോധിക്കുന്നതിന് എക്സ്റ്റൻഷൻ സഹായം കാണുക.

പൂർണ്ണ കമാൻഡ് റഫറൻസ്, ഫ്ലാഗുകൾ എന്നിവയ്ക്കായി [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) കാണുക.

### Single Command Deployment

```bash
# ഒരു കമാൻഡ് ഉപയോഗിച്ച് എല്ലാം ഡിപ്ലോയ് ചെയ്യുക
azd up

# അല്ലെങ്കിൽ പടിപടമായി ഡിപ്ലോയ് ചെയ്യുക
azd provision  # മാത്രം ഇൻഫ്രാസ്ട്രക്ചർ
azd deploy     # മാത്രം അപ്ലിക്കേഷൻ

# azd 1.23.11+ ലെ ദീർഘകാല പ്രവർത്തിക്കുന്ന AI അപ്ലിക്കേഷൻ ഡിപ്ലോയ്മെന്റുകൾക്ക്
azd deploy --timeout 1800
```

### Environment-Specific Deployments

```bash
# വികസന പരിസരം
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ഉത്പാദന പരിസരം
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoring and Observability

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

## 🔐 Security Best Practices

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Exceeded

**Symptoms:**
- വിന്യാസം ക്വോട്ടാ പ്രശ്നങ്ങളാൽ പരാജയപ്പെടുന്നു
- ആപ്ലിക്കേഷൻ ലൊഗുകളിൽ 429 പിശകുകൾ

**Solutions:**
```bash
# നിലവിലെ കൊറ്റ ഉപയോഗം പരിശോധിക്കുക
az cognitiveservices usage list --location eastus

# വ്യത്യസ്ത മേഖല ശ്രമിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താൽക്കാലികമായി ശേഷി കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- എഐ സേവനങ്ങളുമായി ബന്ധപ്പെടുമ്പോൾ 401/403 പിശകുകൾ
- "Access denied" സന്ദേശങ്ങൾ

**Solutions:**
```bash
# റോളു നിയോഗങ്ങൾ സ്ഥിരീകരിക്കുക
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# മാനേജുചെയ്ത ഐഡന്റിറ്റി കോൺഫിഗറേഷൻ പരിശോധിക്കുക
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# കീ വോൾട്ട് ആക്‌സസ് പരിശോധിക്കുക
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- മോഡലുകൾ വിന്യാസത്തിൽ ലഭ്യമല്ല
- പ്രത്യേക മോഡൽ പതിപ്പുകൾ പരാജയപ്പെടുന്നു

**Solutions:**
```bash
# മേഖലയിലുള്ള ലഭ്യമായ മോഡലുകളുടെ പട്ടിക
az cognitiveservices model list --location eastus

# ബൈസെപ് ടെംപ്ലേറ്റിലെ മോഡൽ പതിപ്പ് അപ്ഡേറ്റ് ചെയ്യുക
# മോഡൽ ശേഷിയുമായി ബന്ധപ്പെട്ട ആവശ്യങ്ങൾ പരിശോധിക്കുക
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: ഏറ്റവും ജനപ്രിയമായ Azure AI സാമ്പിൾ — ഒറ്റവട്ടത്തിൽ ധാരാളം രേഖകളിൽ നിന്ന് നിങ്ങൾ ചോദ്യംചെയ്യാവുന്ന ഉൽപ്പന്നമായ RAG ചാറ്റ് ആപ്പ്. ചാറ്റിനായി GPT-4.1-mini, എम्बെഡ്ഡിംഗിനായി text-embedding-3-large, റಿಟ്രീവലിനായി Azure AI Search ഉപയോഗിക്കുന്നു. മൾട്ടിമോഡൽ രേഖകൾ, വാചകം ഇൻപുട്ട്/ഔട്ട്പുട്ട്, Microsoft Entra സാത്ഥീകരണം, Application Insights ട്രേസിംഗ് എന്നിവക്ക് പിന്തുണ.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG ചാറ്റിന്റെ .NET/C# തുല്യ പ്രതി. ASP.NET Core Minimal API, Blazor WebAssembly ഫ്രണ്ട്എൻഡ് അടങ്ങിയതാണ്. വോയ്‌സ് ചാറ്റ്, GPT-4o-mini വീക്ഷണ പിന്തുണ, .NET MAUI Blazor ഹൈബ്രിഡ് ഡെസ്ക്ടോപ്പ്/മൊബൈൽ ക്ലയന്റ് എന്നിവ ഉൾപ്പെടുന്നു.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Langchain4J ഉപയോഗിച്ച് ജാവയിൽ RAG ചാറ്റ് സാമ്പിൾ. മൈക്രോസർവീസ് ഇവന്റ്-ഡ്രിവൻ معماری, പല തിരച്ചിൽ തന്ത്രങ്ങൾ (ടെക്സ്റ്റ്, വെക്ടർ, ഹൈബ്രിഡ്), രേഖാ അപ്‌ലോഡ് Azure Document Intelligence ഉപയോഗിച്ച്, Azure Container Apps അല്ലെങ്കിൽ Azure Kubernetes Service-ൽ വിന്യാസം ചെയ്യുന്നു.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Microsoft Foundry, Prompty എന്നിവയുടെ സഹായത്തോടെയുള്ള റീടെയിൽ RAG കോപൈലറ്റ്. ഒരു Contoso ഔട്ട്‌ഡോർ റീട്ടെയിൽ ചാറ്റ്ബോട്ട്, ഉൽപ്പന്ന കാറ്റലോഗ്, ഉപഭോക്തൃ ഓർഡർ ഡാറ്റ എന്നിവയിൽ ആധാരമാക്കി. GenAIOps പൂർണ്ണ വർക്രോൾ കാണിക്കുന്നു — Prompty-യുമായി പ്രോട്ടോടെപ്പ്, എഐ സഹായത്തോടെ വിലയിരുത്തൽ, AZD വഴി Container Apps-ൽ വിന്യാസം.

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Prompty-നെ ഉപയോഗിച്ച് എഐ ഏജന്റ് ഓർക്കസ്ട്രേഷനുമായി മൾട്ടി ഏജന്റ് സാമ്പിൾ. റിസർച്ച്സ് ഏജന്റ് (Bing Grounding in Azure AI Agent Service), ഉൽപ്പന്ന ഏജന്റ് (Azure AI Search), എഴുത്തുകാരൻ ഏജന്റ്, എഡിറ്റർ ഏജന്റ് എന്നിവ ചേർന്ന് ഉൽപ്പന്നമായി നല്ല ഗവേഷിത ലേഖനങ്ങൾ സൃഷ്ടിക്കുന്നു. GitHub Actions-ലും CI/CD ഉൾപ്പെടുന്നു.

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: LangChain.js ഉപയോഗിച്ച് പൂര്‍ണ്ണമായ സെർവർലെസ്സ് RAG ചാറ്റ്. API-ക്ക് Azure Functions, ഹോസ്റ്റിംഗിന് Azure Static Web Apps. Azure Cosmos DB വെക്ടർ സ്റ്റോറിനും ചാറ്റ് ചരിത്രത്തിനും ഉപയോഗിക്കുന്നു. കുറഞ്ഞ ചെലവിൽ ഒളാമ ഉപയോഗിച്ച് പ്രാദേശിക വികസനം പിന്തുണയ്ക്കുന്നു.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: എന്റർപ്രൈസ് നിലവാരമുള്ള RAG പരിഹാരം ആക്സിലറേറ്റർ, അഡ്മിൻ പോർട്ടൽ രേഖാ അപ്‌ലോഡിംഗിനും മാനേജ്മെന്റിനും, ബഹു ഓർക്കസ്ട്രേറ്റർ ഓപ്ഷനുകൾ (Semantic Kernel, LangChain, Prompt Flow), സ്പീച്ച്-ടു-ടെക്സ്റ്റ്, Microsoft Teams സംയോജനം, PostgreSQL അല്ലെങ്കിൽ Cosmos DB ബാക്ക്എൻഡ് എന്നിവയും ഉണ്ട്. നിർമാണത്തിനായുള്ള ഇഷ്‌ടാനുസൃത ആരംഭ വഴിയെന്ന നിലയിൽ രൂപകൽപ്പന ചെയ്യപ്പെട്ടത്.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: മൂന്ന് ഫ്രെയിംവർക്ക്‌സ് (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework) ഉപയോഗിച്ച് മൾട്ടി-ഏജന്റ് എഐ ഓർക്കസ്ട്രേഷനിന് റഫറൻസ് അപ്ലിക്കേഷൻ. നാല് ഭാഷകളിൽ MCP (Model Context Protocol) സെർവറുകൾ serverless Azure Container Apps ആയി വിന്യസിച്ചിട്ടുണ്ട്, OpenTelemetry നിരീക്ഷണത്തോടുകൂടി.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: കമ്പനി നിർദ്ദേശിച്ച മെഷീൻ ലേണിംഗ് മോഡലുകളുമായി Azure AI സേവനങ്ങൾ വിന്യാസം ചെയ്യാൻ ലഘുവായ Bicep ടെംപ്ലേറ്റ്. പൂർണ്ണ അപ്ലിക്കേഷൻ സ്റ്റാക്ക് ആവശ്യമില്ലാതെ Azure AI ഉടൻ ലഭ്യമാക്കാൻ.

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: 80-ലധികം ഭാഷകളും സീനാരിയോകളുമായി ബന്ധപ്പെട്ട AI-നിഷ്ഠ AZD ടെംപ്ലേറ്റുകൾ കാണാൻ [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) സന്ദർശിക്കുക.

## Next Steps

1. **Try the Examples**: നിങ്ങളുടെ ഉപയോഗ കേസുമായി പൊരുത്തപ്പെടുന്ന പ്രീ-ബിൽറ്റ് ടെംപ്ലേറ്റ് ഉപയോഗിക്കുക
2. **Customize for Your Needs**: ഇന്‍ഫ്രാസ്ട്രക്ചറും അപ്ലിക്കേഷൻ കോഡും മാറ്റാവുന്നതും മാറ്റുക
3. **Add Monitoring**: സമഗ്ര നിരീക്ഷണ സംവിധാനം നടപ്പിലാക്കുക
4. **Optimize Costs**: നിങ്ങളുടെ ബജറ്റിനായി കോൺഫിഗറേഷൻ മെച്ചപ്പെടുത്തുക
5. **Secure Your Deployment**: എന്റർപ്രൈസ് സുരക്ഷാ മാതൃകകൾ പ്രയോഗിക്കുക
6. **Scale to Production**: ബഹുമണ്ഡലവും ഉയർന്ന ലഭ്യതയും നേടുക

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: പ്രൊഡക്ഷൻ-സജ്ജമായ എഐ ചാറ്റ് അപ്ലിക്കേഷൻ വിന്യാസവും പരീക്ഷണവും

```bash
# ടംപ്ലേറ്റ് ആരംഭിക്കുക
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# പരിസര വ്യത്യാസങ്ങൾ സജ്ജീകരിക്കുക
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# വിന്യാസം നടത്തുക
azd up

# ആപ്ലിക്കേഷൻ ടെസ്റ്റ് ചെയ്യുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI പ്രവർത്തനങ്ങൾ നിരീക്ഷിക്കുക
azd monitor

# ശുദ്ധമാക്കുക
azd down --force --purge
```

**Success Criteria:**
- [ ] ക്വോട്ടാ പിശകുകൾ ഇല്ലാതെ വിന്യാസം പൂർത്തിയാക്കുക
- [ ] ബ്രൗസറിൽ ചാറ്റ് ഇന്റർഫേസ് ആക്‌സസ് ചെയ്യാനാവുക
- [ ] ചോദ്യങ്ങൾ ചോദിച്ച് എഐ പവർഡ് പ്രത്യുത്തരം ലഭിക്കുക
- [ ] Application Insights ടെലിമെട്രി ഡാറ്റ കാണുക
- [ ] വിഭവങ്ങൾ വിജയകരമായി നീക്കം ചെയ്യുക

**Estimated Cost**: 30 മിനിറ്റ് പരീക്ഷണത്തിന് $5-10

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: വ്യത്യസ്ത കോൺഫിഗറേഷനുകളുള്ള ബഹുഭൂരിപക്ഷ മോഡലുകൾ വിന്യാസം ചെയ്യുക

```bash
# കസ്റ്റം ബൈസപ്പ് കോൺഫിഗറേഷൻ സൃഷ്‌ടിക്കുക
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

**Success Criteria:**
- [ ] വിവിധ മോഡലുകൾ വിജയകരമായി വിന്യാസം ചെയ്യപ്പെട്ടുവെന്ന്
- [ ] വ്യത്യസ്ത ശേഷി ക്രമീകരണങ്ങൾ പ്രയോഗിച്ചത്
- [ ] മോഡലുകൾ API വഴി ആക്‌സസ്ബൾ ആണെന്നും
- [ ] ഇരുവിധം മോഡലുകളും അപ്ലിക്കേഷനിൽ നിന്ന് കോൾ ചെയ്യാനാകുന്നത്

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: ബജറ്റ് അലർട്ട് സജ്ജീകരിക്കൽ, ചെലവ് ട്രാക്കിംഗ്

```bash
# ബൈസിപിൽ ബജറ്റ് അലേർട്ട് ചേർക്കുക
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

# ബജറ്റ് അലേർട്ട് വിന്യസിക്കുക
azd provision

# നിലവിലുള്ള ചെലവുകൾ പരിശോധിക്കുക
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] ആസ്യൂറിൽ ബജറ്റ് അലർട്ട് സൃഷ്ടിച്ചതായി
- [ ] ഇമെയിൽ അറിയിപ്പുകൾ ക്രമീകരിച്ചത്
- [ ] ആസ്യൂർ പോർട്ടലിൽ ചെലവ് ഡാറ്റ കാണാനാകുന്നതായി
- [ ] ബജറ്റ് പരിധികൾ ശരിയായ വിധത്തിൽ സജ്ജീകരിച്ചത്

## 💡 Frequently Asked Questions

<details>
<summary><strong>ഡെവലപ്‌മെന്റ് സമയത്ത് മൈക്രോസോഫ്‌റ്റ് ഫൗണ്ട്രി മോഡലുകളുടെ ചെലവ് എങ്ങനെ കുറയ്ക്കാം?</strong></summary>

1. **ഫ്രീ ടയർ ഉപയോഗിക്കുക**: Microsoft Foundry Models പ്രതിമാസം 50,000 ടോക്കൺസ് ഫ്രീ ആയി നൽകുന്നു
2. **ശേഷി കുറയ്ക്കുക**: ഡെവൽപ്‌മെന്റിനായി 30+ പകരം 10 TPM ക്രമീകരിക്കുക
3. **azd down ഉപയോഗിക്കുക**: സജീവമായ ഡെവലപ്പ്മെന്റ് ഇല്ലായിരിക്കുമ്പോൾ വിഭവങ്ങൾ ഒഴിവാക്കുക
4. **ക്യാഷിംഗ് ഉപയോഗിക്കുക**: ആവർത്തിക്കുന്ന ക്വെറികൾക്ക് Redis ക്യാഷ് എടുത്തുക
5. **Prompt Engineering ഉപയോഗിക്കുക**: ഫലപ്രദമായ പ്രോമ്പ്റ്റുകളിലൂടെ ടോക്കൺ ഉപയോഗം കുറയ്ക്കുക
```bash
# വികസന ഓര്മ設定‌കള്‍
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry മോഡലുകളും OpenAI API യും തമ്മിലുള്ള വ്യത്യാസം എന്താണ്?</strong></summary>

**Microsoft Foundry മോഡലുകൾ**:
- എന്റർപ്രൈസ് സുരക്ഷയും പാലനവും
- പ്രൈവറ്റ് നെറ്റ്‍വർക്ക് ഇന്റഗ്രേഷൻ
- SLA ഉറപ്പുകൾ
- മാനേജുചെയ്‌ത ഐഡന്റിറ്റി ഓതന്റിക്കേഷൻ
- കൂടുതൽ ക്വോട്ടകൾ ലഭ്യമാണ്

**OpenAI API**:
- പുതിയ മോഡലുകളിൽ വേഗത്തിലുള്ള പ്രവേശനം
- ലളിതമായ സെറ്റ് അപ്പ്
- കുറവ് പ്രവേശന തടസം
- പൊതുവായ ഇന്റർനെറ്റ് മാത്രമേ ഉപയോഗിക്കുകയുള്ളൂ

പ്രൊഡക്ഷൻ ആപ്ലിക്കേഷനുകൾക്കായി, **Microsoft Foundry മോഡലുകൾ ശുപാർശ ചെയ്യുന്നു**.
</details>

<details>
<summary><strong>Microsoft Foundry മോഡലുകളുടെ ക്വോട്ട മിച്ചം വെക്കെഴറിനെ എങ്ങനെ håndലുചെയ്യാം?</strong></summary>

```bash
# നിലവിലെ ക്വോട്ട പരിശോധിക്കുക
az cognitiveservices usage list --location eastus2

# വ്യത്യസ്ത പ്രദേശം പരീക്ഷിക്കുക
azd env set AZURE_LOCATION westus2
azd up

# താത്ക്കാലികമായി ശേഷി കുറയ്ക്കുക
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ക്വോട്ട വർദ്ധിപ്പിക്കൽ അഭ്യർത്ഥിക്കുക
# Azure Portal > Quotas > Request increase എന്നിലേക്ക് പോകുക
```
</details>

<details>
<summary><strong>എന്റെ സ്വന്തം ഡാറ്റ Microsoft Foundry മോഡലുകളുമായി ഉപയോഗിക്കാനാവുമോ?</strong></summary>

അതെ! RAG (Retrieval Augmented Generation) നുവേണ്ടി **Azure AI Search** ഉപയോഗിക്കുക:

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
<summary><strong>AI മോഡൽ എൻഡ്പോയിന്റുകൾ എങ്ങനെ സുരക്ഷിതമാക്കാം?</strong></summary>

**മികച്ച പ്രയോഗശീലങ്ങൾ**:
1. മാനേജുചെയ്‌ത ഐഡന്റിറ്റി ഉപയോഗിക്കുക (API കീകൾ ഇല്ലാതെ)
2. പ്രൈവറ്റ് എൻഡ്പോയിന്റുകൾ സജീവമാക്കുക
3. നെറ്റ്വർക്ക് സ Security Groups ക്രമീകരിക്കുക
4. റേറ്റ് ലിമിറ്റിംഗ് നടപ്പിലാക്കുക
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

## കമ്മ്യൂണിറ്റി සහ പിന്തുണ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ഔദ്യോഗിക ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/ai-studio/)
- **എജന്റ് സ്കില്സ്**: [skills.sh ലെ Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - നിങ്ങളുടെ എഡിറ്ററിൽ Azure + Foundry ഏജന്റ് സ്കില്സ് ഇൻസ്റ്റാൾ ചെയ്യാൻ `npx skills add microsoft/github-copilot-for-azure` ഉപയോഗിക്കുക

---

**അദ്ധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 2 - AI-ഫസ്റ്റ് ഡെവലപ്പ്മെന്റ്
- **⬅️ മുൻ അദ്ധ്യായം**: [അദ്ധ്യായം 1: നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](../chapter-01-foundation/first-project.md)
- **➡️ അടുത്തത്**: [AI മോഡൽ ഡിപ്ലോയ്മെന്റ്](ai-model-deployment.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

**സഹായം വേണോ?** ഞങ്ങളുടെ കമ്മ്യൂണിറ്റി ചർച്ചകളിൽ ചേരുക അല്ലെങ്കിൽ റിപോസിറ്ററിയിൽ ഒരു ഇഷ്യൂ തുറക്കുക. Azure AI + AZD കമ്മ്യൂണിറ്റി നിങ്ങൾക്ക് വിജയിക്കാൻ സഹായിക്കാൻ ഇവിടെ ഉണ്ട്!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->