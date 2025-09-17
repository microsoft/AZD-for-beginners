<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T20:57:05+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "pa"
}
-->
# AZD ਨਾਲ Azure AI Foundry ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਸ਼ੁਰੂਆਤ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 1: ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../getting-started/first-project.md)
- **➡️ ਅਗਲਾ**: [AI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ](ai-model-deployment.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../getting-started/configuration.md)

## ਝਲਕ

ਇਹ ਗਾਈਡ ਦਿਖਾਉਂਦੀ ਹੈ ਕਿ ਕਿਵੇਂ Azure AI Foundry ਸੇਵਾਵਾਂ ਨੂੰ Azure Developer CLI (AZD) ਨਾਲ ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ ਤਾਂ ਜੋ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਆਸਾਨ ਬਣਾਇਆ ਜਾ ਸਕੇ। Azure AI Foundry ਇੱਕ ਵਿਸਤ੍ਰਿਤ ਪਲੇਟਫਾਰਮ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ ਜੋ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਬਣਾਉਣ, ਡਿਪਲੌਇ ਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਲਈ ਹੈ, ਜਦੋਂ ਕਿ AZD ਢਾਂਚੇ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸਧਾਰਨ ਬਣਾਉਂਦਾ ਹੈ।

## Azure AI Foundry ਕੀ ਹੈ?

Azure AI Foundry ਮਾਈਕਰੋਸੌਫਟ ਦਾ ਇੱਕ ਇਕੱਠਾ ਪਲੇਟਫਾਰਮ ਹੈ ਜੋ AI ਵਿਕਾਸ ਲਈ ਹੈ, ਜਿਸ ਵਿੱਚ ਸ਼ਾਮਲ ਹੈ:

- **ਮਾਡਲ ਕੈਟਾਲੌਗ**: ਅਧੁਨਿਕ AI ਮਾਡਲਾਂ ਤੱਕ ਪਹੁੰਚ
- **ਪ੍ਰੌਮਪਟ ਫਲੋ**: AI ਵਰਕਫਲੋਜ਼ ਲਈ ਵਿਜ਼ੂਅਲ ਡਿਜ਼ਾਈਨਰ
- **AI Foundry ਪੋਰਟਲ**: AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਇਕੱਠਾ ਵਿਕਾਸ ਵਾਤਾਵਰਣ
- **ਡਿਪਲੌਇਮੈਂਟ ਵਿਕਲਪ**: ਹੋਸਟਿੰਗ ਅਤੇ ਸਕੇਲਿੰਗ ਲਈ ਕਈ ਵਿਕਲਪ
- **ਸੁਰੱਖਿਆ ਅਤੇ ਸੁਰੱਖਿਆ**: ਜ਼ਿੰਮੇਵਾਰ AI ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨਾਲ ਬਣਾਇਆ ਗਿਆ

## AZD + Azure AI Foundry: ਇਕੱਠੇ ਬਿਹਤਰ

| ਵਿਸ਼ੇਸ਼ਤਾ | Azure AI Foundry | AZD ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਫਾਇਦਾ |
|---------|-----------------|------------------------|
| **ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ** | ਮੈਨੁਅਲ ਪੋਰਟਲ ਡਿਪਲੌਇਮੈਂਟ | ਆਟੋਮੈਟਿਕ, ਦੁਹਰਾਏ ਜਾ ਸਕਣ ਵਾਲੇ ਡਿਪਲੌਇਮੈਂਟ |
| **ਇੰਫ੍ਰਾਸਟਰਕਚਰ** | ਕਲਿਕ-ਥਰੂ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ | ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਐਜ਼ ਕੋਡ (Bicep) |
| **ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ** | ਸਿਰਫ ਇੱਕ ਵਾਤਾਵਰਣ 'ਤੇ ਧਿਆਨ | ਕਈ ਵਾਤਾਵਰਣ (ਡਿਵ/ਸਟੇਜਿੰਗ/ਪ੍ਰੋਡ) |
| **CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ** | ਸੀਮਿਤ | ਨੈਟਿਵ GitHub Actions ਸਹਾਇਤਾ |
| **ਲਾਗਤ ਪ੍ਰਬੰਧਨ** | ਬੁਨਿਆਦੀ ਨਿਗਰਾਨੀ | ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਲਾਗਤ ਅਨੁਕੂਲਤਾ |

## ਪੂਰਵ ਸ਼ਰਤਾਂ

- ਉਚਿਤ ਅਧਿਕਾਰਾਂ ਨਾਲ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ
- AZD ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- Azure OpenAI ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ
- Azure AI Foundry ਦੀ ਬੁਨਿਆਦੀ ਜਾਣਕਾਰੀ

## ਮੁੱਖ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: Azure OpenAI ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਵਰਤੋਂ ਕੇਸ**: Azure OpenAI ਮਾਡਲਾਂ ਨਾਲ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ

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

**ਇੰਫ੍ਰਾਸਟਰਕਚਰ (main.bicep):**
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

### ਪੈਟਰਨ 2: AI ਸਰਚ + RAG ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਵਰਤੋਂ ਕੇਸ**: ਰੀਟਰੀਵਲ-ਆਗਮੈਂਟਡ ਜਨਰੇਸ਼ਨ (RAG) ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ

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

### ਪੈਟਰਨ 3: ਡੌਕਯੂਮੈਂਟ ਇੰਟੈਲੀਜੈਂਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਵਰਤੋਂ ਕੇਸ**: ਡੌਕਯੂਮੈਂਟ ਪ੍ਰੋਸੈਸਿੰਗ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਵਰਕਫਲੋਜ਼

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

## 🔧 ਸੰਰਚਨਾ ਪੈਟਰਨ

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੈਟਅੱਪ

**ਪ੍ਰੋਡਕਸ਼ਨ ਸੰਰਚਨਾ:**
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

**ਡਿਵੈਲਪਮੈਂਟ ਸੰਰਚਨਾ:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Key Vault ਨਾਲ ਸੁਰੱਖਿਅਤ ਸੰਰਚਨਾ

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

## ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼

### ਸਿੰਗਲ ਕਮਾਂਡ ਡਿਪਲੌਇਮੈਂਟ

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਡਿਪਲੌਇਮੈਂਟ

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

## ਨਿਗਰਾਨੀ ਅਤੇ ਦ੍ਰਿਸ਼ਟੀਯੋਗਤਾ

### ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

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

### ਲਾਗਤ ਨਿਗਰਾਨੀ

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

## 🔐 ਸੁਰੱਖਿਆ ਦੇ ਸਰਬੋਤਮ ਅਭਿਆਸ

### ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਸੰਰਚਨਾ

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

### ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ

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

## ਪ੍ਰਦਰਸ਼ਨ ਅਨੁਕੂਲਤਾ

### ਕੈਸ਼ਿੰਗ ਰਣਨੀਤੀਆਂ

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

### ਆਟੋ-ਸਕੇਲਿੰਗ ਸੰਰਚਨਾ

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

## ਆਮ ਸਮੱਸਿਆਵਾਂ ਦਾ ਨਿਵਾਰਨ

### ਸਮੱਸਿਆ 1: OpenAI ਕੋਟਾ ਪਾਰ ਹੋਣਾ

**ਲੱਛਣ:**
- ਡਿਪਲੌਇਮੈਂਟ ਕੋਟਾ ਗਲਤੀਆਂ ਨਾਲ ਫੇਲ੍ਹ ਹੋ ਜਾਂਦਾ ਹੈ
- ਐਪਲੀਕੇਸ਼ਨ ਲੌਗ ਵਿੱਚ 429 ਗਲਤੀਆਂ

**ਹੱਲ:**
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

### ਸਮੱਸਿਆ 2: ਪ੍ਰਮਾਣਿਕਤਾ ਅਸਫਲਤਾ

**ਲੱਛਣ:**
- AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਨ ਵੇਲੇ 401/403 ਗਲਤੀਆਂ
- "ਪਹੁੰਚ ਇਨਕਾਰ ਕੀਤੀ ਗਈ" ਸੁਨੇਹੇ

**ਹੱਲ:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ਸਮੱਸਿਆ 3: ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ

**ਲੱਛਣ:**
- ਡਿਪਲੌਇਮੈਂਟ ਵਿੱਚ ਮਾਡਲ ਉਪਲਬਧ ਨਹੀਂ ਹਨ
- ਖਾਸ ਮਾਡਲ ਵਰਜਨ ਫੇਲ੍ਹ ਹੋ ਰਹੇ ਹਨ

**ਹੱਲ:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## ਉਦਾਹਰਨ ਟੈਂਪਲੇਟ

### ਬੁਨਿਆਦੀ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ

**ਰਿਪੋਜ਼ਟਰੀ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Cognitive Search + App Service

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ਡੌਕਯੂਮੈਂਟ ਪ੍ਰੋਸੈਸਿੰਗ ਪਾਈਪਲਾਈਨ

**ਰਿਪੋਜ਼ਟਰੀ**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**ਸੇਵਾਵਾਂ**: ਡੌਕਯੂਮੈਂਟ ਇੰਟੈਲੀਜੈਂਸ + ਸਟੋਰੇਜ + ਫੰਕਸ਼ਨ

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG ਨਾਲ ਐਨਟਰਪ੍ਰਾਈਜ਼ ਚੈਟ

**ਰਿਪੋਜ਼ਟਰੀ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template contoso-chat
azd up
```

## ਅਗਲੇ ਕਦਮ

1. **ਉਦਾਹਰਨਾਂ ਨੂੰ ਅਜ਼ਮਾਓ**: ਇੱਕ ਪ੍ਰੀ-ਬਿਲਟ ਟੈਂਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਜੋ ਤੁਹਾਡੇ ਵਰਤੋਂ ਕੇਸ ਨਾਲ ਮੇਲ ਖਾਂਦਾ ਹੈ
2. **ਆਪਣੀਆਂ ਜ਼ਰੂਰਤਾਂ ਲਈ ਕਸਟਮਾਈਜ਼ ਕਰੋ**: ਢਾਂਚੇ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਸੋਧੋ
3. **ਨਿਗਰਾਨੀ ਸ਼ਾਮਲ ਕਰੋ**: ਵਿਸ਼ਤ੍ਰਿਤ ਦ੍ਰਿਸ਼ਟੀਯੋਗਤਾ ਲਾਗੂ ਕਰੋ
4. **ਲਾਗਤ ਨੂੰ ਅਨੁਕੂਲ ਬਣਾਓ**: ਆਪਣੇ ਬਜਟ ਲਈ ਸੰਰਚਨਾ ਨੂੰ ਸੁਧਾਰੋ
5. **ਆਪਣੇ ਡਿਪਲੌਇਮੈਂਟ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰੋ**: ਐਨਟਰਪ੍ਰਾਈਜ਼ ਸੁਰੱਖਿਆ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
6. **ਪ੍ਰੋਡਕਸ਼ਨ ਤੱਕ ਸਕੇਲ ਕਰੋ**: ਕਈ ਖੇਤਰਾਂ ਅਤੇ ਉੱਚ ਉਪਲਬਧਤਾ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਸ਼ਾਮਲ ਕਰੋ

## ਕਮਿਊਨਟੀ ਅਤੇ ਸਹਾਇਤਾ

- **Azure AI Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਸ਼ੁਰੂਆਤ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 1: ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../getting-started/first-project.md)
- **➡️ ਅਗਲਾ**: [AI ਮਾਡਲ ਡਿਪਲੌਇਮੈਂਟ](ai-model-deployment.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../getting-started/configuration.md)

**ਮਦਦ ਦੀ ਲੋੜ ਹੈ?** ਸਾਡੀਆਂ ਕਮਿਊਨਟੀ ਚਰਚਾਵਾਂ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ ਜਾਂ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ ਇੱਕ ਸਮੱਸਿਆ ਖੋਲ੍ਹੋ। Azure AI + AZD ਕਮਿਊਨਟੀ ਤੁਹਾਡੀ ਸਫਲਤਾ ਲਈ ਇੱਥੇ ਹੈ!

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਤ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੇ ਪ੍ਰਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।  