# Microsoft Foundry ਦਾ AZD ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਚੈਪਟਰ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਹਿਲਾ ਅਧਿਆਇ**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ ਅਗਲਾ**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## ਸਾਰ

ਇਹ ਗਾਈਡ ਦਿਖਾਉਂਦੀ ਹੈ ਕਿ Microsoft Foundry ਸੇਵਾਵਾਂ ਨੂੰ Azure Developer CLI (AZD) ਨਾਲ ਕਿਵੇਂ ਜੋੜਿਆ ਜਾ ਸਕਦਾ ਹੈ ਤਾਂ ਜੋ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਸੁਗਮ ਹੋ ਜਾਵੇ। Microsoft Foundry AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਬਣਾਉਣ, ਡਿਪਲੋਇ ਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਲਈ ਇੱਕ ਵਿਆਪਕ ਪਲੇਟਫਾਰਮ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ, ਜਦਕਿ AZD ਇਨਫ੍ਰਾਸਟਰਕਚਰ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸਰਲ ਬਨਾਉਂਦਾ ਹੈ।

## Microsoft Foundry ਕੀ ਹੈ?

Microsoft Foundry ਮਾਈਕਰੋਸਾਫਟ ਦਾ ਇਕ ਏਕਕ੍ਰਿਤ ਪਲੇਟਫਾਰਮ ਹੈ ਜੋ AI ਵਿਕਾਸ ਲਈ ਇਹ ਸ਼ਾਮਲ ਕਰਦਾ ਹੈ:

- **Model Catalog**: state-of-the-art AI ਮਾਡਲਾਂ ਤੱਕ ਪਹੁੰਚ
- **Prompt Flow**: AI ਵਰਕਫਲੋਜ਼ ਲਈ ਵਿਜ਼ੂਅਲ ਡਿਜ਼ਾਈਨਰ
- **AI Foundry Portal**: AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਇੰਟੀਗ੍ਰੇਟਿਡ ਡਿਵੈਲਪਮੈਂਟ ਮਾਹੌਲ
- **Deployment Options**: ਬਹੁਤ ਸਾਰੇ ਹੋਸਟਿੰਗ ਅਤੇ ਸਕੇਲਿੰਗ ਵਿਕਲਪ
- **Safety and Security**: ਨਿਰਧਾਰਿਤ ਜ਼ਿੰਮੇਵਾਰ AI ਫੀਚਰਾਂ ਨਾਲ

## AZD + Microsoft Foundry: ਇਕੱਠੇ ਹੋ ਕੇ ਬਿਹਤਰ

| ਫੀਚਰ | Microsoft Foundry | AZD ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਦੇ ਫਾਇਦੇ |
|---------|-----------------|------------------------|
| **ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ** | ਮੈਨੂਅਲ ਪੋਰਟਲ ਡਿਪਲੋਇਮੈਂਟ | ਸੁਚਾਲਿਤ, ਦੁਹਰਾਏ ਜਾ ਸਕਣ ਵਾਲੇ ਡਿਪਲੋਇਮੈਂਟ |
| **ਇੰਫ੍ਰਾਸਟਰਕਚਰ** | ਕਲਿੱਕ-ਥਰੂ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ | ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਐਜ਼ ਕੋਡ (Bicep) |
| **ਮਾਹੌਲ ਪ੍ਰਬੰਧਨ** | ਇਕ ਮਾਹੌਲ ਤੇ ਕੇਂਦਰਿਤ | ਬਹੁ-ਮਾਹੌਲ (dev/staging/prod) |
| **CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ** | ਸੀਮਤ | ਨੈਟਿਵ GitHub Actions ਸਹਾਇਤਾ |
| **ਲਾਗਤ ਪ੍ਰਬੰਧਨ** | ਬੁਨਿਆਦੀ ਮਾਨੀਟਰਿੰਗ | ਮਾਹੌਲ-ਖਾਸ ਲਾਗਤ ਓਪਟੀਮਾਈਜੇਸ਼ਨ |

## ਜ਼ਰੂਰੀ ਸ਼ਰਤਾਂ

- Azure subscription ਨਾਲ ਢੁੱਕਵਾਂ ਅਨੁਮਤੀ
- Azure Developer CLI ਇੰਸਟਾਲਡ
- Azure OpenAI ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ
- Microsoft Foundry ਨਾਲ ਮੁਢਲੀ ਜਾਣ-ਪਛਾਣ

## ਮੁੱਖ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: Azure OpenAI ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਉਪਯੋਗ ਕੇਸ**: Azure OpenAI ਮਾਡਲਾਂ ਨਾਲ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ

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

### ਪੈਟਰਨ 2: AI Search + RAG ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਉਪਯੋਗ ਕੇਸ**: retrieval-augmented generation (RAG) ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ

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

### ਪੈਟਰਨ 3: Document Intelligence ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਉਪਯੋਗ ਕੇਸ**: ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਵਰਕਫਲੋਜ਼

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

## 🔧 ਕਨਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨ

### ਮਾਹੌਲ ਵੈਰੀਏਬਲ ਸੈਟਅਪ

**ਉਤਪਾਦਨ ਕਨਫਿਗਰੇਸ਼ਨ:**
```bash
# ਮੁੱਖ ਏ.ਆਈ. ਸੇਵਾਵਾਂ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ਮਾਡਲ ਸੰਰਚਨਾਵਾਂ
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# ਪ੍ਰਦਰਸ਼ਨ ਸੈਟਿੰਗਾਂ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ਡਿਵੈਲਪਮੈਂਟ ਕਨਫਿਗਰੇਸ਼ਨ:**
```bash
# ਵਿਕਾਸ ਲਈ ਲਾਗਤ-ਅਨੁਕੂਲ ਸੈਟਿੰਗਾਂ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ਮੁਫਤ ਪੱਧਰ
```

### Key Vault ਨਾਲ ਸੁਰੱਖਿਅਤ ਕਨਫਿਗਰੇਸ਼ਨ

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

## ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ

### ਇਕ-ਕਮਾਂਡ ਡਿਪਲੋਇਮੈਂਟ

```bash
# ਇੱਕ ਕਮਾਂਡ ਨਾਲ ਸਭ ਕੁਝ ਡਿਪਲੋਏ ਕਰੋ
azd up

# ਜਾਂ ਕ੍ਰਮਿਕ ਤੌਰ ਤੇ ਡਿਪਲੋਏ ਕਰੋ
azd provision  # ਕੇਵਲ ਬੁਨਿਆਦੀ ਢਾਂਚਾ
azd deploy     # ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ
```

### ਮਾਹੌਲ-ਵਿਸ਼ੇਸ਼ ਡਿਪਲੋਇਮੈਂਟ

```bash
# ਵਿਕਾਸ ਵਾਤਾਵਰਣ
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਅਬਜ਼ਰਵੇਬਿਲਿਟੀ

### Application Insights ਇੰਟੀਗ੍ਰੇਸ਼ਨ

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

### ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ

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

## 🔐 ਸੁਰੱਖਿਆ ਦੀਆਂ ਸ੍ਰੇਸ਼ਠ ਪ੍ਰਥਾਵਾਂ

### Managed Identity ਕਨਫਿਗਰੇਸ਼ਨ

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

### ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ

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

## ਪ੍ਰਦਰਸ਼ਨ ਅਪਟੀਮਾਈਜੇਸ਼ਨ

### ਕੇਸ਼ਿੰਗ ਰਣਨੀਤੀਆਂ

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

### ਆਟੋ-ਸਕੇਲਿੰਗ ਕਨਫਿਗਰੇਸ਼ਨ

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

## ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੇ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ

### ਮਸਲਾ 1: OpenAI ਕੋਟਾ ਤੋ ਵੱਧ

**ਲੱਛਣ:**
- ਡਿਪਲੋਇਮੈਂਟ quota ਗਲਤੀਆਂ ਨਾਲ ਫੇਲ ਹੁੰਦਾ ਹੈ
- ਐਪ ਲਾਗਜ਼ ਵਿੱਚ 429 ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# ਮੌਜੂਦਾ ਕੋਟਾ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices usage list --location eastus

# ਹੋਰ ਖੇਤਰ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION westus2
azd up

# ਅਸਥਾਈ ਤੌਰ ਤੇ ਸਮਰੱਥਾ ਘਟਾਓ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ਮਸਲਾ 2: ਪ੍ਰਮਾਣਿਕਤਾ ਨਾਕਾਮੀਆਂ

**ਲੱਛਣ:**
- AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਨ ਤੇ 401/403 ਗਲਤੀਆਂ
- "Access denied" ਸੁਨੇਹੇ

**ਹੱਲ:**
```bash
# ਰੋਲ ਐਸਾਈਨਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਦੀ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ਕੀ ਵੌਲਟ ਪਹੁੰਚ ਦੀ ਜਾਂਚ ਕਰੋ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ਮਸਲਾ 3: ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ

**ਲੱਛਣ:**
- ਡਿਪਲੋਇਮੈਂਟ ਵਿੱਚ ਮਾਡਲ ਉਪਲੱਬਧ ਨਹੀਂ
- ਖਾਸ ਮਾਡਲ ਵਰਜਨ ਫੇਲ ਹੋ ਰਹੇ ਹਨ

**ਹੱਲ:**
```bash
# ਖੇਤਰ ਅਨੁਸਾਰ ਉਪਲਬਧ ਮਾਡਲਾਂ ਦੀ ਸੂਚੀ
az cognitiveservices model list --location eastus

# Bicep ਟੈਮਪਲੇਟ ਵਿੱਚ ਮਾਡਲ ਦਾ ਵਰਜਨ ਅਪਡੇਟ ਕਰੋ
# ਮਾਡਲ ਦੀ ਸਮਰੱਥਾ ਦੀਆਂ ਲੋੜਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
```

## ਉਦਾਹਰਨ ਟੇਮਪਲੇਟ

### ਬੇਸਿਕ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ

**ਰਿਪੋਜ਼ਟਰੀ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Cognitive Search + App Service

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ ਪਾਈਪਲਾਈਨ

**ਰਿਪੋਜ਼ਟਰੀ**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**ਸੇਵਾਵਾਂ**: Document Intelligence + Storage + Functions

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

1. **ਉਦਾਹਰਨਾਂ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ**: ਇੱਕ ਪ੍ਰੀ-ਬਿਲਟ ਟੇਮਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ ਜੋ ਤੁਹਾਡੇ ਉਪਯੋਗ ਕੇਸ ਨਾਲ ਮੇਲ ਖਾਂਦਾ ਹੈ
2. **ਆਪਣੀਆਂ ਜ਼ਰੂਰਤਾਂ ਲਈ ਕਸਟਮਾਈਜ਼ ਕਰੋ**: ਇਨਫ੍ਰਾਸਟਰਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਵਿੱਚ ਸੋਧ ਕਰੋ
3. **ਮਾਨੀਟਰਿੰਗ ਜੋੜੋ**: ਵਿਸਤ੍ਰਿਤ ਅਬਜ਼ਰਵੇਬਿਲਿਟੀ ਲਾਗੂ ਕਰੋ
4. **ਲਾਗਤਾਂ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ**: ਆਪਣੇ ਬਜਟ ਲਈ ਸੰਰਚਨਾਵਾਂ ਨੂੰ ਸੁਧਾਰੋ
5. **ਆਪਣੀ ਡਿਪਲੋਇਮੈਂਟ ਸੁਰੱਖਿਅਤ ਕਰੋ**: ਐਨਟਰਪ੍ਰਾਈਜ਼ ਸੁਰੱਖਿਆ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
6. **ਉਤਪਾਦਨ ਤੱਕ ਸਕੇਲ ਕਰੋ**: ਬਹੁ-ਰੀਜਨ ਅਤੇ ਹਾਈ-ਅਵੇਲੇਬਿਲਿਟੀ ਫੀਚਰ ਜੋੜੋ

## 🎯 ਹੈਂਡਸ-ਆਨ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: Azure OpenAI ਚੈਟ ਐਪ ਡਿਪਲੋਇ ਕਰੋ (30 ਮਿੰਟ)
**ਲਕੜੀ**: ਡਿਪਲੋਇ ਅਤੇ ਟੈਸਟ ਕਰੋ ਇਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਰੇਡੀ AI ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ

```bash
# ਟੈਮਪਲੇਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ਤਾਇਨਾਤ ਕਰੋ
azd up

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ਏਆਈ ਓਪਰੇਸ਼ਨਾਂ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor

# ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ:**
- [ ] ਡਿਪਲੋਇਮੈਂਟ ਬਿਨਾਂ quota ਗਲਤੀਆਂ ਦੇ ਪੂਰਾ ਹੋਵੇ
- [ ] ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਚੈਟ ਇੰਟਰਫੇਸ ਨੂੰ ਪਹੁੰਚ ਹੋਵੇ
- [ ] ਸਵਾਲ ਪੁੱਛ ਸਕੋ ਅਤੇ AI-ਚਲਿਤ ਜਵਾਬ ਪ੍ਰਾਪਤ ਕਰੋ
- [ ] Application Insights ਟੈਲੀਮੇਟਰੀ ਡਾਟਾ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] ਸਰੋਤਾਂ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ ਕੀਤਾ ਗਿਆ

**ਅੰਦਾਜ਼ੀ ਲਾਗਤ**: $5-10 30 ਮਿੰਟ ਟੈਸਟਿੰਗ ਲਈ

### ਅਭਿਆਸ 2: ਬਹੁ-ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ (45 ਮਿੰਟ)
**ਲਕੜੀ**: ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਨਾਲ ਬਹੁ-ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ ਕਰੋ

```bash
# ਕਸਟਮ Bicep ਸੰਰਚਨਾ ਬਣਾਓ
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

# ਤੈਨਾਤ ਕਰੋ ਅਤੇ ਪੁਸ਼ਟੀ ਕਰੋ
azd provision
azd show
```

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ:**
- [ ] ਕਈ ਮਾਡਲ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੋਇ ਹੋਏ
- [ ] ਵੱਖ-ਵੱਖ capacity ਸੈਟਿੰਗਾਂ ਲਗਾਈਆਂ ਗਈਆਂ
- [ ] ਮਾਡਲ API ਰਾਹੀਂ ਐਕਸੈਸਬਲ ਹਨ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਤੋਂ ਦੋਹਾਂ ਮਾਡਲਾਂ ਨੂੰ ਕਾਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

### ਅਭਿਆਸ 3: ਲਾਗਤ ਮਾਨੀਟਰਿੰਗ ਲਾਗੂ ਕਰੋ (20 ਮਿੰਟ)
**ਲਕੜੀ**: ਬਜਟ ਅਲਰਟ ਅਤੇ ਲਾਗਤ ਟ੍ਰੈਕਿੰਗ ਸੈਟਅਪ ਕਰੋ

```bash
# Bicep ਵਿੱਚ ਬਜਟ ਅਲਰਟ ਸ਼ਾਮਿਲ ਕਰੋ
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

# ਬਜਟ ਅਲਰਟ ਤੈਨਾਤ ਕਰੋ
azd provision

# ਮੌਜੂਦਾ ਖਰਚੇ ਜਾਂਚੋ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**ਕਾਮਯਾਬੀ ਮਾਪਦੰਡ:**
- [ ] Azure ਵਿੱਚ ਬਜਟ ਅਲਰਟ ਬਣਾਇਆ ਗਿਆ
- [ ] ਈਮੇਲ ਸੂਚਨਾਵਾਂ ਕਨਫਿਗਰ ਕੀਤੀਆਂ ਗਈਆਂ
- [ ] Azure Portal ਵਿੱਚ ਲਾਗਤ ਡਾਟਾ ਵੇਖ ਸਕਦੇ ਹੋ
- [ ] ਬਜਟ ਸੀਮਾਵਾਂ ਢੰਗ ਨਾਲ ਸੈੱਟ ਕੀਤੀਆਂ ਗਈਆਂ

## 💡 ਅਕਸਰ ਪੁੱਛੇ ਜਾਂਦੇ ਸਵਾਲ

<details>
<summary><strong>ਮੈਂ ਵਿਕਾਸ ਦੌਰਾਨ Azure OpenAI ਦੀਆਂ ਲਾਗਤਾਂ ਕਿਵੇਂ ਘਟਾ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?</strong></summary>

1. **ਫਰੀ ਟੀਅਰ ਵਰਤੋ**: Azure OpenAI ਮਹੀਨੇ ਦੇ 50,000 ਟੋਕਨ ਮੁਫ਼ਤ ਦਿੰਦਾ ਹੈ
2. **ਕੈਪਾਸਿਟੀ ਘਟਾਓ**: ਡੇਵ ਲਈ 30+ ਦੀ ਥਾਂ 10 TPM ਸੈੱਟ ਕਰੋ
3. **Use azd down**: ਜਦੋਂ ਐਕਟਿਵ ਵਿਕਾਸ ਨਹੀੰ ਕਰ ਰਹੇ ਤਾਂ ਰਿਸੋਰਸ ਡੀਅਲੋਕੇਟ ਕਰੋ
4. **ਜਵਾਬ ਕੈਸ਼ ਕਰੋ**: ਦੁਹਰਾਏ ਜਾਣ ਵਾਲੇ ਪ੍ਰਸ਼ਨਾਂ ਲਈ Redis cache ਲਾਗੂ ਕਰੋ
5. **Prompt Engineering ਵਰਤੋ**: ਪ੍ਰਭਾਵਸ਼ਾਲੀ prompts ਨਾਲ ਟੋਕਨ ਯੂਸੇਜ ਘਟਾਓ

```bash
# ਵਿਕਾਸ ਸੰਰਚਨਾ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI ਅਤੇ OpenAI API ਵਿੱਚ ਕੀ ਫਰਕ ਹੈ?</strong></summary>

**Azure OpenAI**:
- ਐਨਟਰਪ੍ਰਾਈਜ਼ ਸੁਰੱਖਿਆ ਅਤੇ ਕੰਪਲਾਇੰਸ
- ਪ੍ਰਾਈਵੇਟ ਨੈੱਟਵਰਕ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- SLA ਦੀਆਂ ਗਾਰਂਟੀ
- Managed identity ਪ੍ਰਮਾਣਿਕਤਾ
- ਵੱਡੇ ਕੋਟੇ ਉਪਲਬਧ

**OpenAI API**:
- ਨਵੇਂ ਮਾਡਲਾਂ ਤੱਕ ਤੇਜ਼ ਪਹੁੰਚ
- ਆਸਾਨ ਸੈਟਅਪ
- ਘੱਟ ਰੁਕਾਵਟ
- ਸਿਰਫ ਪਬਲਿਕ ਇੰਟਰਨੈੱਟ

ਉਤਪਾਦਨ ਐਪਸ ਲਈ, **Azure OpenAI ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ**।
</details>

<details>
<summary><strong>Azure OpenAI quota exceeded ਗਲਤੀਆਂ ਨੂੰ ਮੈਂ ਕਿਵੇਂ ਹਲ ਕਰਾਂ?</strong></summary>

```bash
# ਮੌਜੂਦਾ ਕੋਟਾ ਜਾਂਚੋ
az cognitiveservices usage list --location eastus2

# ਹੋਰ ਰੀਜਨ ਅਜ਼ਮਾਓ
azd env set AZURE_LOCATION westus2
azd up

# ਅਸਥਾਈ ਤੌਰ ਤੇ ਸਮਰੱਥਾ ਘਟਾਓ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ਕੋਟਾ ਵਾਧੇ ਦੀ ਬੇਨਤੀ ਕਰੋ
# Azure ਪੋਰਟਲ > ਕੋਟੇ > ਵਾਧੇ ਲਈ ਬੇਨਤੀ ਤੇ ਜਾਓ
```
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ ਆਪਣਾ ਡਾਟਾ Azure OpenAI ਨਾਲ ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?</strong></summary>

ਹਾਂ! RAG (Retrieval Augmented Generation) ਲਈ **Azure AI Search** ਵਰਤੋ:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

ਟੇਮਪਲੇਟ ਵੇਖੋ: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)
</details>

<details>
<summary><strong>ਮੈਂ AI ਮਾਡਲ ਐਂਡਪੌਇੰਟਸ ਨੂੰ ਕਿਵੇਂ ਸੁਰੱਖਿਅਤ ਕਰਾਂ?</strong></summary>

**ਸ੍ਰੇਸ਼ਠ ਅਭਿਆਸ**:
1. Managed Identity ਵਰਤੋਂ (ਕੋਈ API ਕੀਜ਼ ਨਹੀਂ)
2. ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟਸ ਚਾਲੂ ਕਰੋ
3. ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਗਰੂਪ ਕਨਫਿਗਰ ਕਰੋ
4. ਰੇਟ ਲਿਮਿਟਿੰਗ ਲਾਗੂ ਕਰੋ
5. ਰਾਜ਼ਾਂ ਲਈ Azure Key Vault ਵਰਤੋਂ

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

## ਸਮੁਦਾਇ ਅਤੇ ਸਹਾਇਤਾ

- **Microsoft Foundry Discord**: [#Azure ਚੈਨਲ](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ਇਸ਼ੂਜ਼ ਅਤੇ ਚਰਚਾ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ਆਧਿਕਾਰਿਕ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/ai-studio/)

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਚੈਪਟਰ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਹਿਲਾ ਅਧਿਆਇ**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ ਅਗਲਾ**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**ਮਦਦ ਚਾਹੀਦੀ ਹੈ?** ਸਾਡੇ ਸਮੁਦਾਇਕ ਚਰਚਿਆਂ ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ ਜਾਂ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ ਇੱਕ ਇਸ਼ੂ ਖੋਲ੍ਹੋ। Azure AI + AZD ਸਮੁਦਾਇ ਤੁਹਾਡੀ ਸਫਲਤਾ ਵਿੱਚ ਮਦਦ ਲਈ ਇੱਥੇ ਹੈ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰਨਾਮਾ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਉਠਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤ ਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਵਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->