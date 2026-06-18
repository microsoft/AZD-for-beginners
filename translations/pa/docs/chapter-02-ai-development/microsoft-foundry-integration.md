# Microsoft Foundry ਅਤੇ AZD ਇੰਟਿਗ੍ਰੇਸ਼ਨ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 1: ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../chapter-01-foundation/first-project.md)
- **➡️ ਅਗਲਾ**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਕੰਫਿਗਰੇਸ਼ਨ](../chapter-03-configuration/configuration.md)

## ਸਾਰ

ਇਹ ਗਾਇਡ ਦਿਖਾਉਂਦੀ ਹੈ ਕਿ Microsoft Foundry ਸੇਵਾਵਾਂ ਨੂੰ Azure Developer CLI (AZD) ਨਾਲ ਕਿਵੇਂ ਇੰਟਿਗਰੇਟ ਕੀਤਾ ਜਾਵੇ ਤਾਂ ਜੋ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਤੈਨਾਤ ਸੁਗਮ ਹੋ ਜਾਵੇ। Microsoft Foundry AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਬਣਾਉਣ, ਤੈਨਾਤ ਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਲਈ ਇੱਕ ਵਿਆਪਕ ਪਲੇਟਫ਼ਾਰਮ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ, ਜਦਕਿ AZD ਇਸਤੋਂ ਇੰਫਰਾਸਟਰੱਕਚਰ ਅਤੇ ਤੈਨਾਤ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸਰਲ ਬਣਾਉਂਦਾ ਹੈ।

## Microsoft Foundry ਕੀ ਹੈ?

Microsoft Foundry Microsoft ਦਾ ਇੱਕ ਇਕਜੁਟ ਪਲੇਟਫਾਰਮ ਹੈ AI ਵਿਕਾਸ ਲਈ ਜਿਸ ਵਿੱਚ ਸ਼ਾਮِل ਹੈ:

- **Model Catalog**: ਅਧੁਨਿਕ AI ਮਾਡਲਾਂ ਤੱਕ ਪਹੁੰਚ
- **Prompt Flow**: AI ਵਰਕਫਲੋਜ਼ ਲਈ ਵਿਜ਼ੂਅਲ ਡਿਜ਼ਾਇਨਰ
- **Microsoft Foundry Portal**: AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਇੰਟੀਗਰੇਟਿਡ ਡਿਵੈਲਪਮੈਂਟ ਮਾਹੌਲ
- **Deployment Options**: ਕਈ ਹੋਸਟਿੰਗ ਅਤੇ ਸਕੇਲਿੰਗ ਵਿਕਲਪ
- **Safety and Security**: ਨਿਰਮਿਤ ਜ਼ਿੰਮੇਵਾਰ AI ਫੀਚਰ

## AZD + Microsoft Foundry: ਇਕਠੇ ਹੋ ਕੇ ਬਿਹਤਰ

| ਵਿਸ਼ੇਸ਼ਤਾ | Microsoft Foundry | AZD ਇੰਟੇਗ੍ਰੇਸ਼ਨ ਲਾਭ |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## ਜਰੂਰੀ ਸ਼ਰਤਾਂ

- Azure subscription ਿਸਹਿ ਅਨੁਕੂਲ ਅਨੁਮਤੀਆਂ ਵਾਲੀ
- Azure Developer CLI ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- Microsoft Foundry Models ਸੇਵਾਵਾਂ ਤੱਕ ਪਹੁੰਚ
- Microsoft Foundry ਨਾਲ ਬੁਨਿਆਦੀ ਜਾਣ-ਪਛਾਣ

> **Current AZD baseline:** ਇਹ ਉਦਾਹਰਣ `azd` `1.23.12` ਦੇ ਖਿਲਾਫ ਸਮੀਖਿਆ ਕੀਤੇ ਗਏ ਸਨ। AI ਏਜੈਂਟ ਵਰਕਫਲੋ ਲਈ, ਕ੍ਰਿਪਾ ਕਰਕੇ ਮੌਜੂਦਾ ਪ੍ਰੀਵਿਊ ਐਕਸਟੈਨਸ਼ਨ ਰਿਲੀਜ਼ ਦੀ ਵਰਤੋਂ ਕਰੋ ਅਤੇ ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਆਪਣੇ ਇੰਸਟਾਲਡ ਵਰਜਨ ਦੀ ਜਾਂਚ ਕਰੋ।

## ਮੁੱਖ ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਪੈਟਰਨ

### ਪੈਟਰਨ 1: Microsoft Foundry Models ਇੰਟਿਗ੍ਰੇਸ਼ਨ

**ਉਪਯੋਗ ਮਾਮਲਾ**: Microsoft Foundry Models ਮਾਡਲਾਂ ਨਾਲ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਤੈਨਾਤ

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

### ਪੈਟਰਨ 2: AI Search + RAG ਇੰਟਿਗ੍ਰੇਸ਼ਨ

**ਉਪਯੋਗ ਮਾਮਲਾ**: retrieval-augmented generation (RAG) ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਤੈਨਾਤ

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

### ਪੈਟਰਨ 3: Document Intelligence ਇੰਟਿਗ੍ਰੇਸ਼ਨ

**ਉਪਯੋਗ ਮਾਮਲਾ**: ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਵਰਕਫਲੋਜ਼

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

## 🔧 ਕੰਫਿਗਰੇਸ਼ਨ ਪੈਟਰਨ

### ਵਾਤਾਵਰਨ ਵੈਰੀਏਬਲਸ ਸੈਟਅਪ

**ਪ੍ਰੋਡਕਸ਼ਨ ਸੰਰਚਨਾ:**
```bash
# ਮੁੱਖ AI ਸੇਵਾਵਾਂ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ਮਾਡਲ ਸੰਰਚਨਾਵਾਂ
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# ਪ੍ਰਦਰਸ਼ਨ ਸੈਟਿੰਗਾਂ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ਡਿਵੈਲਪਮੈਂਟ ਸੰਰਚਨਾ:**
```bash
# ਡਿਵੈਲਪਮੈਂਟ ਲਈ ਲਾਗਤ-ਅਨੁਕੂਲ ਸੈਟਿੰਗਾਂ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ਮੁਫਤ ਪੱਧਰ
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

## ਤੈਨਾਤ ਵਰਕਫਲੋਜ਼

### Foundry ਲਈ AZD ਐਕਸਟੈਨਸ਼ਨ

AZD ਐਕਸਟੈਨਸ਼ਨ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ ਜੋ Microsoft Foundry ਸੇਵਾਵਾਂ ਨਾਲ ਕੰਮ ਕਰਨ ਲਈ AI-ਨਿਰਧਾਰਤ ਸਮਰੱਥਾਵਾਂ ਸ਼ਾਮਿਲ ਕਰਦੇ ਹਨ:

```bash
# ਫਾਊਂਡਰੀ ਏਜੰਟਸ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.agents

# ਫਾਈਨ-ਟਿਊਨਿੰਗ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.finetune

# ਕਸਟਮ ਮਾਡਲਾਂ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.models

# ਇੰਸਟਾਲ ਕੀਤੀਆਂ ਐਕਸਟੈਂਸ਼ਨਾਂ ਦੀ ਸੂਚੀ ਦਿਖਾਓ
azd extension list --installed

# ਮੌਜੂਦਾ ਇੰਸਟਾਲ ਕੀਤੀ ਗਈ ਏਜੰਟ ਐਕਸਟੈਂਸ਼ਨ ਦਾ ਵਰਜਨ ਜਾਂਚੋ
azd extension show azure.ai.agents
```

AI ਐਕਸਟੈਨਸ਼ਨ ਅਜੇ ਵੀ ਪ੍ਰੀਵਿਊ ਵਿੱਚ ਤੇਜ਼ੀ ਨਾਲ ਵਿਕਸਿਤ ਹੋ ਰਹੇ ਹਨ। ਜੇ ਕੋਈ ਕਮਾਂਡ ਇੱਥੇ ਦਿੱਤੇ ਗਿਆ ਵਰਤਾਰਿਆਂ ਤੋਂ ਵੱਖਰੀ ਤਰ੍ਹਾਂ ਵਰਤਦੀ ਹੈ, ਤਾਂ ਪਰਯੋਜਨਾ ਦੇ ਅੰਦਰ ਜਾਓਣ ਤੋਂ ਪਹਿਲਾਂ ਸੰਬੰਧਤ ਐਕਸਟੈਨਸ਼ਨ ਨੂੰ ਅਪਗਰੇਡ ਕਰੋ।

### `azd ai` ਨਾਲ Agent-First ਤੈਨਾਤ

ਜੇ ਤੁਹਾਡੇ ਕੋਲ agent manifest ਹੈ, ਤਾਂ `azd ai agent init` ਵਰਤੋਂ ਕਰਨ ਨਾਲ Foundry Agent Service ਨਾਲ ਜੁੜਿਆ ਇੱਕ ਪ੍ਰੋਜੈਕਟ scaffold ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ:

```bash
# ਏਜੈਂਟ ਮੈਨਿਫੈਸਟ ਤੋਂ ਆਰੰਭ ਕਰੋ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ਅਜ਼ੂਰ ਉੱਤੇ ਤੈਨਾਤ ਕਰੋ
azd up
```

ਹਾਲੀਆ ਪ੍ਰੀਵਿਊ ਰਿਲੀਜ਼ਾਂ `azure.ai.agents` ਨੇ ਵੀ ਟੈmplੇਟ-ਆਧਾਰਤ ਇਨਿਸ਼ੀਅਲਾਈਜ਼ੇਸ਼ਨ ਸਹਾਇਤਾ ਜੋੜੀ ਹੈ `azd ai agent init` ਲਈ। ਜੇ ਤੁਸੀਂ ਨਵੇਂ ਏਜੈਂਟ ਨਮੂਨਿਆਂ ਦੀ ਪਾਲਣਾ ਕਰ ਰਹੇ ਹੋ, ਤਾਂ ਆਪਣੇ ਇੰਸਟਾਲਡ ਵਰਜਨ ਵਿੱਚ ਉਪਲਬਧ ਸਹੀ ਫਲੈਗਾਂ ਲਈ ਐਕਸਟੈਨਸ਼ਨ ਸਹਾਇਤਾ ਦੀ ਜਾਂਚ ਕਰੋ।

ਪੂਰੇ ਕਮਾਂਡ ਰਿਫਰੈਂਸ ਅਤੇ ਫਲੈਗਾਂ ਲਈ ਦੇਖੋ [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)।

### ਇਕ-ਕਮਾਂਡ ਤੈਨਾਤ

```bash
# ਇਕ ਕਮਾਂਡ ਨਾਲ ਸਭ ਕੁਝ ਤੈਨਾਤ ਕਰੋ
azd up

# ਜਾਂ ਧੀਰੇ-ਧੀਰੇ ਤੈਨਾਤ ਕਰੋ
azd provision  # ਕੇਵਲ ਢਾਂਚਾ
azd deploy     # ਕੇਵਲ ਐਪਲੀਕੇਸ਼ਨ

# azd 1.23.11+ ਵਿੱਚ ਲੰਬੇ ਸਮੇਂ ਚੱਲਣ ਵਾਲੀਆਂ AI ਐਪ ਤੈਨਾਤਾਂ ਲਈ
azd deploy --timeout 1800
```

### ਵਾਤਾਵਰਨ-ਵਿਸ਼ੇਸ਼ ਤੈਨਾਤ

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

## ਨਿਗਰਾਨੀ ਅਤੇ ਪੜਚੋਲ

### Application Insights ਇੰਟਿਗ੍ਰੇਸ਼ਨ

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

### ਖਰਚ ਨਿਗਰਾਨੀ

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

## 🔐 ਸੁਰੱਖਿਆ ਲਈ ਸਰਵੋਤਮ ਅਭਿਆਸ

### Managed Identity ਸੰਰਚਨਾ

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

## ਕਾਰਗੁਜ਼ਾਰੀ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

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

## ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ

### ਮਸਲਾ 1: OpenAI ਕੋਟਾ ਪਾਰ ਹੋ ਗਿਆ

**ਲੱਛਣ:**
- ਤੈਨਾਤ quota ਐਰਰਾਂ ਨਾਲ ਫੇਲ ਹੋ ਜਾਂਦੀ ਹੈ
- ਐਪਲੀਕੇਸ਼ਨ ਲੌਗਾਂ ਵਿੱਚ 429 ਐਰਰ

**ਹੱਲ:**
```bash
# ਮੌਜੂਦਾ ਕੋਟਾ ਵਰਤੋਂ ਦੀ ਜਾਂਚ ਕਰੋ
az cognitiveservices usage list --location eastus

# ਕਿਸੇ ਹੋਰ ਖੇਤਰ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION westus2
azd up

# ਅਸਥਾਈ ਤੌਰ 'ਤੇ ਸਮਰੱਥਾ ਘਟਾਓ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ਮਸਲਾ 2: ਪ੍ਰਮਾਣਿਕਤਾ ਅਸਫਲਤਾਵਾਂ

**ਲੱਛਣ:**
- AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਦੇ ਸਮੇਂ 401/403 ਐਰਰ
- "Access denied" ਸੁਨੇਹੇ

**ਹੱਲ:**
```bash
# ਰੋਲ ਅਸਾਈਨਮੈਂਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ਕੀ ਵੌਲਟ ਪਹੁੰਚ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ਮਸਲਾ 3: ਮਾਡਲ ਤੈਨਾਤ ਸਮੱਸਿਆਵਾਂ

**ਲੱਛਣ:**
- ਤੈਨਾਤ ਵਿੱਚ ਮਾਡਲ ਉਪਲਬਧ ਨਹੀਂ
- ਖਾਸ ਮਾਡਲ ਵਰਜਨ ਫੇਲ ਹੋ ਰਹੇ ਹਨ

**ਹੱਲ:**
```bash
# ਖੇਤਰਵਾਰ ਉਪਲਬਧ ਮਾਡਲਾਂ ਦੀ ਸੂਚੀ
az cognitiveservices model list --location eastus

# bicep ਟੈਮਪਲੇਟ ਵਿੱਚ ਮਾਡਲ ਵਰਜਨ ਅਪਡੇਟ ਕਰੋ
# ਮਾਡਲ ਦੀ ਸਮਰੱਥਾ ਦੀਆਂ ਲੋੜਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
```

## ਉਦਾਹਰਣ ਟੈਪਲੇਟ

### RAG ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ (Python)

**ਰਿਪੋਜ਼ਟਰੀ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ਵੇਰਵਾ**: ਸਭ ਤੋਂ ਲੋਕਪ੍ਰિય Azure AI ਨਮੂਨਾ — ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ RAG ਚੈਟ ਐਪ ਜੋ ਤੁਹਾਨੂੰ ਆਪਣੇ ਦਸਤਾਵੇਜ਼ਾਂ 'ਤੇ ਸਵਾਲ ਪੁੱਛਣ ਦੀ ਆਗਿਆ ਦਿੰਦਾ ਹੈ। Uses GPT-4.1-mini for chat, text-embedding-3-large for embeddings, and Azure AI Search for retrieval. Multimodal ਦਸਤਾਵੇਜ਼ਾਂ, speech input/output, Microsoft Entra ਪ੍ਰਮਾਣੀਕਰਨ, ਅਤੇ Application Insights ਟ੍ਰੇਸਿੰਗ ਦੀ ਸਮਰਥਾ۔

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG ਚੈਟ ਐਪ (.NET)

**ਰਿਪੋਜ਼ਟਰੀ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ਵੇਰਵਾ**: Python RAG ਚੈਟ ਨਮੂਨੇ ਦਾ .NET/C# ਸਮਕક્ષ। ASP.NET Core Minimal API ਅਤੇ Blazor WebAssembly ਫਰੰਟਐਂਡ ਨਾਲ ਬਣਿਆ। ਵੋਇਸ ਚੈਟ, GPT-4o-mini vision ਸਹਾਇਤਾ, ਅਤੇ ਇਕ ਸਾਥੀ .NET MAUI Blazor Hybrid ਡੈਸਕਟਾਪ/ਮੋਬਾਈਲ ਕਲਾਇੰਟ ਸ਼ਾਮਿਲ ਹੈ।

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG ਚੈਟ ਐਪ (Java)

**ਰਿਪੋਜ਼ਟਰੀ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ਵੇਰਵਾ**: Langchain4J ਦੀ ਵਰਤੋਂ ਕਰਦਿਆਂ RAG ਚੈਟ ਨਮੂਨੇ ਦਾ ਜਾਵਾ ਵਰਜਨ। ਮਾਇਕ੍ਰੋਸਰਵਿਸ ਇਵੈਂਟ-ਚਲਿਤ ਆਰਕੀਟੈਕਚਰ, ਕਈ ਖੋਜ ਰਣਨੀਤੀਆਂ (ਟੈਕਸਟ, ਵੇਕਟਰ, ਹੈਬ੍ਰਿਡ), Azure Document Intelligence ਨਾਲ ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ, ਅਤੇ Azure Container Apps ਜਾਂ Azure Kubernetes Service ਉੱਤੇ ਤੈਨਾਤ ਦੀ ਸਮਰਥਾ।

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**ਰਿਪੋਜ਼ਟਰੀ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ਵੇਰਵਾ**: Microsoft Foundry ਅਤੇ Prompty ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਐਂਡ-ਟੂ-ਐਂਡ ਰਿਟੇਲ RAG ਕਾਪਿਲਾਟ। ਇੱਕ Contoso Outdoor ਰਿਟੇਲਰ ਚੈਟਬੋਟ ਜੋ ਉਤਪਾਦ ਕੈਟਲੌਗ ਅਤੇ ਗਾਹਕ ਆਰਡਰ ਡੇਟਾ ਵਿੱਚ ਧਰਤੀਅਨੁਭਵ ਰੱਖਦਾ ਹੈ। ਪੂਰੀ GenAIOps ਵਰਕਫਲੋ ਦਿਖਾਉਂਦਾ ਹੈ — Prompty ਨਾਲ ਪ੍ਰੋਟੋਟਾਈਪ, AI-ਸਹਾਇਤ ਮੁੱਲਾਂਕਨ ਨਾਲ ਮੂਲਾਂਕਨ, ਅਤੇ AZD ਰਾਹੀਂ Container Apps 'ਤੇ ਤੈਨਾਤ।

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**ਰਿਪੋਜ਼ਟਰੀ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**ਵੇਰਵਾ**: Prompty ਨਾਲ AI ਏਜੈਂਟ ਆਰਕਸਟਰੈਸ਼ਨ ਦਿਖਾਉਂਦਾ ਬਹੁ-ਏਜੈਂਟ ਨਮੂਨਾ। ਇੱਕ ਰਿਸਰਚ ਏਜੈਂਟ (Bing Grounding in Azure AI Agent Service), ਇੱਕ ਪ੍ਰੋਡਕਟ ਏਜੈਂਟ (Azure AI Search), ਇੱਕ ਲੇਖਕ ਏਜੈਂਟ, ਅਤੇ ਇੱਕ ਸੰਪਾਦਕ ਏਜੈਂਟ ਵਰਤ ਕੇ ਮਿਲਕੇ ਵਧੀਆ-ਅਨੁਸੰਧਾਨਕ ਲੇਖ ਤਿਆਰ ਕਰਦੇ ਹਨ। GitHub Actions ਵਿੱਚ ਮੁੱਲਾਂਕਨ ਨਾਲ CI/CD ਸ਼ਾਮਿਲ ਹੈ।

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**ਰਿਪੋਜ਼ਟਰੀ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**ਵੇਰਵਾ**: LangChain.js ਦੀ ਵਰਤੋਂ ਕਰਦਿਆਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਰਵਰਲੇਸ RAG ਚੈਟਬੋਟ, API ਲਈ Azure Functions ਅਤੇ ਹੋਸਟਿੰਗ ਲਈ Azure Static Web Apps ਨਾਲ। Azure Cosmos DB ਨੂੰ ਵੇਕਟਰ ਸਟੋਰ ਅਤੇ ਚੈਟ ਹਿਸਟਰੀ ਡੇਟਾਬੇਸ ਦੋਹਾਂ ਵਜੋਂ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ। ਜ਼ੀਰੋ-ਲਾਗਤ ਟੈਸਟਿੰਗ ਲਈ लोकਲ ਵਿਕਾਸ ਨਾਲ Ollama ਦੀ ਸਮਰਥਾ।

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**ਰਿਪੋਜ਼ਟਰੀ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**ਵੇਰਵਾ**: ਐਂਟਰਪ੍ਰਾਈਜ਼-ਗਰੇਡ RAG ਸਾਲਿਊਸ਼ਨ ਐਕਸੀਲੇਰੇਟਰ ਜਿਸ ਵਿੱਚ ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ/ਪ੍ਰਬੰਧਨ ਲਈ ਐਡਮਿਨ ਪੋਰਟਲ, ਕਈ ਔਰਕੈਸਟਰੇਟਰ ਵਿਕਲਪ (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, Microsoft Teams ਇੰਟੀਗ੍ਰੇਸ਼ਨ, ਅਤੇ PostgreSQL ਜਾਂ Cosmos DB ਬੈਕਏਂਡ ਦੀ ਚੋਣ ਸ਼ਾਮਿਲ ਹੈ। ਪ੍ਰੋਡਕਸ਼ਨ RAG ਦ੍ਰਿਸ਼ਾਂ ਲਈ ਅਨੁਕੂਲ ਸ਼ੁਰੂਆਤ ਬਿੰਦੂ ਵਜੋਂ ਡਿਜ਼ਾਇਨ ਕੀਤਾ ਗਿਆ।

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**ਰਿਪੋਜ਼ਟਰੀ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**ਸੇਵਾਵਾਂ**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**ਵੇਰਵਾ**: ਤੀਨ ਫਰੇਮਵਰਕਸ (LangChain.js, LlamaIndex.TS, ਅਤੇ Microsoft Agent Framework) ਦੀ ਵਰਤੋਂ ਕਰਦਿਆਂ ਬਹੁ-ਏਜੈਂਟ AI ਆਰਕਸਟਰੈਸ਼ਨ ਲਈ ਰੈਫਰੈਂਸ ਐਪਲੀਕੇਸ਼ਨ। ਚਾਰ ਭਾਸ਼ਾਵਾਂ ਵਿੱਚ MCP (Model Context Protocol) ਸਰਵਰਾਂ ਨੂੰ ਸਰਵਰਲੇਸ Azure Container Apps ਵਜੋਂ ਤੈਨਾਤ ਕੀਤਾ ਗਿਆ ਹੈ ਅਤੇ OpenTelemetry ਨਿਗਰਾਨੀ ਸ਼ਾਮਿਲ ਹੈ।

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**ਰਿਪੋਜ਼ਟਰੀ**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**ਸੇਵਾਵਾਂ**: Azure AI Services + Azure OpenAI

**ਵੇਰਵਾ**: ਇੱਕ ਨ્યૂਨਤਮ Bicep ਟੈmplੇਟ ਜੋ Azure AI ਸੇਵਾਵਾਂ ਨੂੰ কonਫਿਗਰਡ ਮਸ਼ੀਨ ਲਰਨਿੰਗ ਮਾਡਲਾਂ ਨਾਲ ਤੈਨਾਤ ਕਰਦਾ ਹੈ। ਜਦੋਂ ਤੁਹਾਨੂੰ ਸਿਰਫ਼ Azure AI ਇੰਫਰਾਸਟਰੱਕਚਰ ਦੀ ਲੋੜ ਹੋਵੇ, ਇੱਕ ਹਲਕਾ-ਫੁਲਕਾ ਸ਼ੁਰੂਆਤੀ ਨੁਕਤਾ।

**ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azd-ai-starter
azd up
```

> **ਹੋਰ ਟੈਪਲੇਟ ਵੇਖੋ**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) 'ਤੇ ਜਾਓ ਜਿੱਥੇ 80+ AI-ਵਿਸ਼ੇਸ਼ AZD ਟੈਪਲੇਟ ਭਿੰਨ-ਭਿੰਨ ਭਾਸ਼ਾਵਾਂ ਅਤੇ ਦ੍ਰਿਸ਼ਾਂ ਲਈ ਉਪਲਬਧ ਹਨ।

## ਅਗਲੇ ਕਦਮ

1. **ਉਦਾਹਰਣ ਅਜ਼ਮਾਓ**: ਆਪਣੇ ਉਪਯੋਗ ਮਾਮਲੇ ਨਾਲ ਮੇਲ ਖਾਂਦੇ ਇੱਕ ਪ੍ਰੀ-ਬਿਲਟ ਟੈਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ
2. **ਆਪਣੀਆਂ ਲੋੜਾਂ ਲਈ ਨਿੱਜੀਕਰਨ ਕਰੋ**: ਇਨਫਰਾਸਟਰੱਕਚਰ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਵਿੱਚ ਸੋਧ ਕਰੋ
3. **ਮਾਨੀਟਰਿੰਗ ਜੋੜੋ**: ਚਾਹਿਤ ਨਿਰੀਖਣ ਲਾਗੂ ਕਰੋ
4. **ਖਰਚਾਂ ਨੂੰ ਓਪਟੀਮਾਈਜ਼ ਕਰੋ**: ਆਪਣੇ ਬਜਟ ਲਈ ਸੰਰਚਨਾਵਾਂ ਨੂੰ ਬਿਹਤਰ ਬਣਾਓ
5. **ਤੈਨਾਤ ਨੂੰ ਸੁਰੱਖਿਅਤ ਕਰੋ**: ਐਨਟਰਪ੍ਰਾਈਜ਼ ਸੁਰੱਖਿਆ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
6. **ਪ੍ਰੋਡਕਸ਼ਨ ਤੱਕ ਸਕੇਲ ਕਰੋ**: ਮਲਟੀ-ਰੀਜਨ ਅਤੇ ਉੱਚ-ਉਪਲਬਧਤਾ ਫੀਚਰ ਜੋੜੋ

## 🎯 ਹੈਂਡਸ-ਆਨ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: Microsoft Foundry Models ਚੈਟ ਐਪ ਤੈਨਾਤ ਕਰੋ (30 ਮਿੰਟ)
**ਮਕਸਦ**: ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਅਤੇ ਟੈਸਟ ਕਰੋ

```bash
# ਟੈਮਪਲੇਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ਕ੍ਰਿਤਿਮ ਬੁੱਧੀ ਕਾਰਜਾਂ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor

# ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਤੈਨਾਤ quota ਐਰਰਾਂ ਤੋਂ ਬਿਨਾਂ ਪੂਰਾ ਹੋਵੇ
- [ ] ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਚੈਟ ਇੰਟਰਫੇਸ ਤੱਕ ਪਹੁੰਚ ਹੋਵੇ
- [ ] ਸਵਾਲ ਪੁੱਛੇ ਜਾ ਸਕਣ ਅਤੇ AI-ਸੰਚਾਲਿਤ ਜਵਾਬ ਮਿਲਣ
- [ ] Application Insights ਟੈਲੀਮੇਟਰੀ ਡੇਟਾ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] ਸੰਸਾਧਨਾਂ ਦੀ ਸਫਲਤਾਪੂਰਕ ਸਾਫ਼ਸੁਫ਼ਾਈ ਕੀਤੀ ਗਈ

**ਅਨੁਮਾਨਤ ਲਾਗਤ**: 30 ਮਿੰਟ ਦੀ ਟੈਸਟਿੰਗ ਲਈ $5-10

### ਅਭਿਆਸ 2: ਮਲਟੀ-ਮਾਡਲ ਤੈਨਾਤ ਸੰਰਚਨਾ ਕਰੋ (45 ਮਿੰਟ)
**ਮਕਸਦ**: ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਨਾਲ ਇਕੱਠੇ ਕਈ AI ਮਾਡਲ ਤੈਨਾਤ ਕਰੋ

```bash
# ਕਸਟਮ Bicep ਸੰਰਚਨਾ ਬਣਾਓ
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

# ਤੈਨਾਤ ਕਰੋ ਅਤੇ ਪੁਸ਼ਟੀ ਕਰੋ
azd provision
azd show
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਕਈ ਮਾਡਲ ਕਾਮਯਾਬੀ ਨਾਲ ਤੈਨਾਤ ਹੋਏ
- [ ] ਵੱਖ-ਵੱਖ ਕੈਪੀਸਿਟੀ ਸੈਟਿੰਗਾਂ ਲਾਗੂ ਕੀਤੀਆਂ ਗਈਆਂ
- [ ] ਮਾਡਲ API ਰਾਹੀਂ ਪਹੁੰਚਯੋਗ ਹਨ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਤੋਂ ਦੋਹਾਂ ਮਾਡਲਾਂ ਨੂੰ ਕਾਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

### ਅਭਿਆਸ 3: ਖਰਚ ਨਿਗਰਾਨੀ ਲਾਗੂ ਕਰੋ (20 ਮਿੰਟ)
**ਮਕਸਦ**: ਬਜਟ ਅਲਰਟ ਅਤੇ ਖਰਚ ਟ੍ਰੈਕਿੰਗ ਸੈਟਅਪ ਕਰੋ

```bash
# Bicep ਵਿੱਚ ਬਜਟ ਅਲਰਟ ਜੋੜੋ
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

# ਮੌਜੂਦਾ ਖਰਚੇ ਦੀ ਜਾਂਚ ਕਰੋ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] Azure ਵਿੱਚ ਬਜਟ ਅਲਰਟ ਬਣਾਇਆ ਗਿਆ
- [ ] ਈਮੇਲ ਸੂਚਨਾਵਾਂ ਸੰਰਚਿਤ ਕੀਤੀਆਂ ਗਈਆਂ
- [ ] Azure ਪੋਰਟਲ ਵਿੱਚ ਖਰਚ ਡੇਟਾ ਵੇਖਿਆ ਜਾ ਸਕਦਾ ਹੈ
- [ ] ਬਜਟ thresholds ਢੰਗ ਨਾਲ ਸੈਟ ਕੀਤੇ ਗਏ

## 💡 ਅਕਸਰ ਪੁੱਛੇ ਜਾਣ ਵਾਲੇ ਸਵਾਲ

<details>
<summary><strong>ਡਿਵੈਲਪਮੈਂਟ ਦੌਰਾਨ Microsoft Foundry Models ਦੇ ਖਰਚਾ ਕਿਵੇਂ ਘਟਾਈਏ?</strong></summary>

1. **ਫ੍ਰੀ ਟਾਇਰ ਵਰਤੋਂ**: Microsoft Foundry Models 50,000 tokens/ਮਹੀਨਾ ਮੁਫਤ ਦਿੰਦਾ ਹੈ
2. **ਕੈਪੀਸਿਟੀ ਘਟਾਓ**: ਡਿਵ ਲਈ 30+ ਦੀ ਥਾਂ 10 TPM ਸੈਟ ਕਰੋ
3. **azd down ਵਰਤੋਂ**: ਜਦ ਤੱਕ ਸਰਗਰਮ ਵਿਕਾਸ ਨਹੀਂ ਕਰ ਰਹੇ, ਸੰਸਾਧਨਾਂ ਨੂੰ ਡੀਅਲੋਕੇਟ ਕਰੋ
4. **ਰੇਸਪਾਂਸਾਂ ਕੈਸ਼ ਕਰੋ**: ਦੁਹਰਾਏ ਜਾਂਦੇ ਪ੍ਰਸ਼ਨਾਂ ਲਈ Redis ਕੈਸ਼ ਲਾਗੂ ਕਰੋ
5. **Prompt Engineering ਵਰਤੋਂ**: ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਪ੍ਰੌਂਪਟਾਂ ਨਾਲ ਟੋਕਨ ਖਪਤ ਘਟਾਓ

</details>
```bash
# ਵਿਕਾਸ ਸੰਰਚਨਾ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models ਅਤੇ OpenAI API ਵਿੱਚ ਕੀ ਫਰਕ ਹੈ?</strong></summary>

**Microsoft Foundry Models**:
- ਐਂਟਰਪ੍ਰਾਈਜ਼ ਸੁਰੱਖਿਆ ਅਤੇ ਕੰਪਲਾਇਂਸ
- ਪ੍ਰਾਈਵੇਟ ਨੈੱਟਵਰਕ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- SLA ਗ্যারੰਟੀ
- Managed identity authentication
- ਉੱਚ ਕੋਟਿਆਂ ਦੀ ਉਪਲਬਧਤਾ

**OpenAI API**:
- ਨਵੀਆਂ ਮਾਡਲਾਂ ਤੱਕ ਤੇਜ਼ ਪਹੁੰਚ
- ਸਾਦਾ ਸੈਟਅਪ
- ਘੱਟ ਪ੍ਰਵੇਸ਼ ਦੀ ਰੋਕ
- ਸਿਰਫ ਪਬਲਿਕ ਇੰਟਰਨੈਟ

ਉਤਪਾਦਨ ਐਪਸ ਲਈ, **Microsoft Foundry Models ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ**।
</details>

<details>
<summary><strong>Microsoft Foundry Models quota exceeded errors ਨੂੰ ਮੈਂ ਕਿਵੇਂ ਸੰਭਾਲਾਂ?</strong></summary>

```bash
# ਮੌਜੂਦਾ ਕੋਟਾ ਜਾਂਚੋ
az cognitiveservices usage list --location eastus2

# ਕਿਸੇ ਹੋਰ ਖੇਤਰ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION westus2
azd up

# ਅਸਥਾਈ ਤੌਰ ਤੇ ਸਮਰੱਥਾ ਘਟਾਓ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ਕੋਟਾ ਵਾਧੇ ਦੀ ਬੇਨਤੀ ਕਰੋ
# Azure ਪੋਰਟਲ > Quotas > Request increase ਤੇ ਜਾਓ
```
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ ਆਪਣੇ ਡਾਟਾ ਨੂੰ Microsoft Foundry Models ਨਾਲ ਵਰਤ ਸਕਦਾ/ਸਕਦੀ ਹਾਂ?</strong></summary>

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

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>ਮੈਂ AI ਮਾਡਲ endpoints ਨੂੰ ਕਿਵੇਂ ਸੁਰੱਖਿਅਤ ਕਰਾਂ?</strong></summary>

**ਸਰਵੋਤਮ ਅਭਿਆਸ**:
1. Managed Identity ਵਰਤੋ (ਕੋਈ API ਕੁੰਜੀਆਂ ਨਹੀਂ)
2. Private Endpoints ਚਾਲੂ ਕਰੋ
3. ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਸਮੂਹਾਂ ਦੀ ਸੰਰਚਨਾ ਕਰੋ
4. ਰੇਟ ਲਿਮਿਟਿੰਗ ਲਾਗੂ ਕਰੋ
5. ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਲਈ Azure Key Vault ਵਰਤੋ

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

## ਕਮਿਉਨਿਟੀ ਅਤੇ ਸਹਾਇਤਾ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Install Azure + Foundry agent skills in your editor with `npx skills add microsoft/github-copilot-for-azure`

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: Chapter 2 - AI-First Development
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ ਅਗਲਾ**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**ਮਦਦ ਚਾਹੀਦੀ ਹੈ?** ਸਾਡੇ ਕਮਿਉਨਿਟੀ ਚਰਚਾਵਾਂ ਵਿੱਚ ਸ਼ਾਮਲ ਹੋਵੋ ਜਾਂ ਰਿਪੋਜ਼ਟਰੀ ਵਿੱਚ ਇੱਕ ਇਸ਼ੂ ਖੋਲ੍ਹੋ। Azure AI + AZD ਕਮਿਉਨਿਟੀ ਤੁਹਾਨੂੰ ਸਫਲ ਹੋਣ ਵਿੱਚ ਮਦਦ ਕਰਨ ਲਈ ਇਥੇ ਹੈ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->