# Microsoft Foundry ಮತ್ತು AZD ಸಂಯೋಜನೆ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 1: ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದಿನದು**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

## ಅವಲೋಕನ

ಈ ಗೈಡ್ Microsoft Foundry ಸೇವೆಗಳನ್ನು Azure Developer CLI (AZD) ಜೊತೆಗೆ ಸಂಯೋಜಿಸುವುದನ್ನು ಸೂಚಿಸುತ್ತದೆ, ಇದರಿಂದ AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗಳು ಸರಳ ಮತ್ತು ಸುಗಮವಾಗುತ್ತವೆ. Microsoft Foundry AI ಅಪ್ಲಿಕೇಶನ್ಗಳನ್ನು ನಿರ್ಮಿಸಲು, ನಿಯೋಜಿಸಲು ಮತ್ತು ನಿರ್ವಹಿಸಲು ಸಮಗ್ರ ವೇದಿಕೆಯನ್ನು ಒದಗಿಸುತ್ತದೆ, ಮತ್ತು AZD ಮೂಲಭೂತ ವಸತಿಗಳನ್ನು ಮತ್ತು ನಿಯೋಜನಾ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಸರಳಗೊಳಿಸುತ್ತದೆ.

## Microsoft Foundry ಎಂದರೇನು?

Microsoft Foundry ಎನ್ನುವುದು AI ಅಭಿವೃದ್ಧಿಗಾಗಿ ಮೈಕ್ರೋಸಾಫ್ಟ್‌ನ ಏಕೀಕೃತ ವೇದಿಕೆಯಾಗಿದೆ, ಇದು ಒಳಗೊಂಡಿದೆ:

- **Model Catalog**: ಅತಿ ಆಧುನಿಕ AI ಮಾದರಿಗಳಿಗೆ ಪ್ರವೇಶ
- **Prompt Flow**: AI ವರ್ಕ್‌ಫ್ಲೋಗಳಿಗಾಗಿ ದೃಶ್ಯ ವಿನ್ಯಾಸಕ
- **AI Foundry Portal**: AI ಅಪ್ಲಿಕೇಶನ್ಗಳಿಗೆ ಏಕೀಕೃತ ಅಭಿವೃದ್ಧಿ ವಾತಾವರಣ
- **Deployment Options**: ಬಹು ಹೋಸ್ಟಿಂಗ್ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಆಯ್ಕೆಗಳು
- **Safety and Security**: ಒಳಗೇರಿಸಿದ ಹೊಣೆವರ ನಡವಳಿ ಮತ್ತು ಭದ್ರತಾ ವೈಶಿಷ್ಟ್ಯಗಳು

## AZD + Microsoft Foundry: ಒಟ್ಟಿಗೆ ಉತ್ತಮ

| ವೈಶಿಷ್ಟ್ಯ | Microsoft Foundry | AZD ಸಂಯೋಜನೆಯ ಲಾಭ |
|---------|-----------------|------------------------|
| **Model Deployment** | ಹಸ್ತಚಾಲಿತ ಪೋರ್ಟಲ್ ನಿಯೋಜನೆ | ಸ್ವಯಂಚಾಲಿತ, ಮರುತೊರೆಯಬಹುದಾದ ನಿಯೋಜನೆಗಳು |
| **Infrastructure** | ಕ್ಲಿಕ್-ತ್ರೂ ಪ್ರೊವಿಜನಿಂಗ್ | Infrastructure as Code (Bicep) |
| **Environment Management** | ಏಕ ಪರಿಸರ ಗಮನ | ಬಹು-ಪರಿಸರ (dev/staging/prod) |
| **CI/CD Integration** | ಮಿತವಾಗಿದ್ದಿದೆ | ಸ್ವರೂಪ GitHub Actions ಬೆಂಬಲ |
| **Cost Management** | ಮೂಲಭೂತ ಮಾನಿಟರಿಂಗ್ | ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ವೆಚ್ಚ tốiಮೀಕರಣ |

## ಆವಶ್ಯಕತೆಗಳು

- ಸಂಬಂಧಿಸಿದ ಅನುಮತಿಗಳೊಂದಿಗೆ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್
- Azure Developer CLI ಅನ್ನು ಸ್ಥಾಪಿಸಿರುವುದು
- Azure OpenAI ಸೇವೆಗಳ ಪ್ರವೇಶ
- Microsoft Foundry ಬಗ್ಗೆ ಮೂಲ ಪರಿಚಯ

## ಮೂಲ ಸಂಯೋಜನೆ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: Azure OpenAI ಸಂಯೋಜನೆ

**ಬಳಕೆಯ ಪ್ರಕರಣ**: Azure OpenAI ಮಾದರಿಗಳೊಂದಿಗೆ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿ

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

**ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ (main.bicep):**
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

### ಮಾದರಿ 2: AI Search + RAG ಸಂಯೋಜನೆ

**ಬಳಕೆಯ ಪ್ರಕರಣ**: ರಿಟ್ರಿವಲ್-ಆಗ್ಮೆಂಟೆಡ್ ಜನರೇಷನ್ (RAG) ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವುದು

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

### ಮಾದರಿ 3: ಡಾಕ್ಯುಮೆಂಟ್ ಇಂಟೆಲಿಜೆನ್ಸ್ ಸಂಯೋಜನೆ

**ಬಳಕೆಯ ಪ್ರಕರಣ**: ದಸ್ತಾವೇಜು ಪ್ರಕ್ರಿಯೆ ಮತ್ತು ವಿಶ್ಲೇಷణ ವರ್ಕ್‌ಫ್ಲೋಗಳು

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

## 🔧 ಸಂರಚನಾ ಮಾದರಿಗಳು

### ಪರಿಸರ ಚರಗಳ ವ್ಯವಸ್ಥೆ

**ಉತ್ಪಾದನೆ ಸಂರಚನೆ:**
```bash
# ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆಯ ಮೂಲ ಸೇವೆಗಳು
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ಮಾದರಿ ಸಂರಚನೆಗಳು
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# ಕಾರ್ಯಕ್ಷಮತೆ ಸಂರಚನೆಗಳು
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ಡೆವಲಪ್‌ಮೆಂಟ್ ಸಂರಚನೆ:**
```bash
# ಅಭಿವೃದ್ಧಿಗಾಗಿ ವೆಚ್ಚ-ಅನುಕೂಲಿತ ಸೆಟ್ಟಿಂಗ್ಗಳು
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ಉಚಿತ ಶ್ರೇಣಿ
```

### Key Vault ಸಹಿತ ಸುರಕ್ಷಿತ ಸಂರಚನೆ

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

## ನಿಯೋಜನೆ ಕೆಲಸಪ್ರವಾಹಗಳು

### ಏಕ ಆಜ್ಞೆ ನಿಯೋಜನೆ

```bash
# ಒಂದು ಕಮಾಂಡ್‌ನೊಂದಿಗೆ ಎಲ್ಲವನ್ನೂ ನಿಯೋಜಿಸಿ
azd up

# ಅಥವಾ ಕ್ರಮೇಣವಾಗಿ ನಿಯೋಜಿಸಿ
azd provision  # ಮೂಲಸೌಕರ್ಯ ಮಾತ್ರ
azd deploy     # ಅನ್ವಯಿಕೆ ಮಾತ್ರ
```

### ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ನಿಯೋಜನೆಗಳು

```bash
# ಅಭಿವೃದ್ದಿ ಪರಿಸರ
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ಉತ್ಪಾದನಾ ಪರಿಸರ
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ವೀಕ್ಷಣೀಯತೆ

### Application Insights ಸಂಯೋಜನೆ

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

### ವೆಚ್ಚ ನಿಗಾವಹಣೆ

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

## 🔐 ಭದ್ರತೆ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### Managed Identity ಸಂರಚನೆ

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

### ಜಾಲಭದ್ರತೆ

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

## ಕಾರ್ಯಕ್ಷಮತೆ ಮೇಲುಗೈ

### ಕ್ಯಾಶೆ ತಂತ್ರಗಳು

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

### ಸ್ವಯಂ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚನೆ

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

## ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ಪರಿಹಾರ

### ಸಮಸ್ಯೆ 1: OpenAI ಕೊಟಾ ಮೀರಿದೆ

**ಲಕ್ಷಣಗಳು:**
- ಕೊಟಾ ದೋಷಗಳೊಂದಿಗೆ ನಿಯೋಜನೆ ವಿಫಲವಾಗುತ್ತದೆ
- ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳಲ್ಲಿ 429 ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರಸ್ತುತ ಕ್ವೋಟಾ ಬಳಕೆ ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus

# ಬೇರೆ ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ತಾತ್ಕಾಲಿಕವಾಗಿ ಸಾಮರ್ಥ್ಯವನ್ನು ಕಡಿಮೆ ಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ಸಮಸ್ಯೆ 2: ಪ್ರಮಾನೀಕರಣ ವಿಫಲತೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- AI ಸೇವೆಗಳನ್ನು ಕರೆದಾಗ 401/403 ದೋಷಗಳು
- "Access denied" ಸಂದೇಶಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# ಭೂಮಿಕಾ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ನಿರ್ವಹಿತ ಗುರುತಿನ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ಕೀ ವಾಲ್ಟ್ ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ಸಮಸ್ಯೆ 3: ಮಾದರಿ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆಯಲ್ಲಿ ಮಾದರಿಗಳು ಲಭ್ಯವಿಲ್ಲ
- ನಿರ್ದಿಷ್ಟ ಮಾದರಿ ಸಂಸ್ಕರಣಾ ಆವೃತ್ತಿಗಳು ವಿಫಲವಾಗುತ್ತವೆ

**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರದೇಶಾನುಸಾರ ಲಭ್ಯವಿರುವ ಮಾದರಿಗಳ ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices model list --location eastus

# bicep ಟೆಂಪ್ಲೇಟ್‌ನಲ್ಲಿ ಮಾದರಿಯ ಆವೃತ್ತಿಯನ್ನು ನವೀಕರಿಸಿ
# ಮಾದರಿಯ ಸಾಮರ್ಥ್ಯದ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
```

## ಉದಾಹರಣೆಯ ಟೆಂಪ್ಲೇಟುಗಳು

### ಮೂಲ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್

**ರಿಪೊಸಿಟರಿ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ಸೇವೆಗಳು**: Azure OpenAI + Cognitive Search + App Service

**ಶೀಘ್ರ ಪ್ರಾರಂಭ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### ದಸ್ತಾವೇಜು ಪ್ರോസೆಸಿಂಗ್ ಪೈಪ್‌ಲೈನ್

**ರಿಪೊಸಿಟರಿ**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**ಸೇವೆಗಳು**: Document Intelligence + Storage + Functions

**ಶೀಘ್ರ ಪ್ರಾರಂಭ**:
```bash
azd init --template ai-document-processing
azd up
```

### ಎಂಟರ್‌ಪ್ರೈಸ್ ಚಾಟ್‌ (RAG)

**ರಿಪೊಸಿಟರಿ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ಸೇವೆಗಳು**: Azure OpenAI + Search + Container Apps + Cosmos DB

**ಶೀಘ್ರ ಪ್ರಾರಂಭ**:
```bash
azd init --template contoso-chat
azd up
```

## ಮುಂದಿನ ಹಂತಗಳು

1. **ಉದಾಹರಣೆಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ**: ನಿಮ್ಮ ಬಳಕೆಯ ಪ್ರಕರಣಕ್ಕೆ ಹೊಂದುವ ಮುಂಚೆಯಾಗಿ ರಚಿಸಿದ ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
2. **ನಿಮ್ಮ ಅಗತ್ಯಗಳಿಗೆ ಕಸ್ಟಮೈಜ್ ಮಾಡಿ**: ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಕೋಡನ್ನು ಬದಲಿಸಿ
3. **ಮಾನಿಟರಿಂಗ್ ಸೇರಿಸಿ**: ಸವಿಸ್ತಾರ ವೀಕ್ಷಣೀಯತೆಯನ್ನು ಜಾರಿಗೆ ತಂದುಕೊಳ್ಳಿ
4. **ವೆಚ್ಚ tốiಮೀಕರಿಸಿ**: ನಿಮ್ಮ ಬಜೆಟ್‌ಗೆ uyğunವಾಗಿ ಸಂರಚನೆಗಳನ್ನು ತಿದ್ದುಮಾಡಿ
5. **ನಿಮ್ಮ ನಿಯೋಜನೆಯನ್ನು ಸುರಕ್ಷಿತಗೊಳಿಸಿ**: ಎಂಟರ್‌ಪ್ರೈಸ್ ಭದ್ರತಾ ಮಾದರಿಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದು
6. **ಉತ್ಪಾದನಕ್ಕೆ ಸ್ಕೇಲ್ ಮಾಡಿ**: ಬಹು-ಪ್ರாந்தಿ ಮತ್ತು ಉದ್ದಿಮೆ-ಸುಲಭತೆ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸೇರಿಸಿ

## 🎯 ಪ್ರಾಯೋಗಿಕ ಅಭ್ಯಾಸಗಳು

### ವ್ಯಾಯಾಮ 1: Azure OpenAI ಚಾಟ್ ಅಪ್ ನಿಯೋಜನೆ (30 ನಿಮಿಷಗಳು)
**ಲಕ್ಷ್ಯ**: ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧವಾದ AI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸಿ

```bash
# ಟೆಂಪ್ಲೇಟನ್ನು ಆರಂಭಿಸಿ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ವಾತಾವರಣ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ತೈನಾತಿ ಮಾಡಿ
azd up

# ಅನ್ವಯಿಕೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ಎಐ ಕಾರ್ಯಾಚರಣೆಗಳನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor

# ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ನಿಯೋಜನೆ ಕೊಟಾ ದೋಷಗಳಿಲ್ಲದೆ ಪೂರ್ಣಗೊಳ್ಳುತ್ತದೆ
- [ ] ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಚಾಟ್ ಇಂಟರ್ಫೇಸ್ ಪ್ರವೇಶಿಸಬಹುದು
- [ ] ಪ್ರಶ್ನೆಗಳನ್ನು ಕೇಳಿ AI-ಚಾಲಿತ ಉತ್ತರಗಳನ್ನು ಪಡೆದುಕೊಳ್ಳಬಹುದು
- [ ] Application Insights ನಲ್ಲಿ ಟೆಲೆಮೆಟ್ರಿ ಡೇಟಾ ಕಾಣಿಸುತ್ತದೆ
- [ ] ಸಂಪನ್ಮೂಲಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಕ್ಲೀನ್ ಅಪ್ ಮಾಡಲಾಗಿದೆ

**ಅಂದಾಜು ವೆಚ್ಚ**: $5-10 30 ನಿಮಿಷಗಳ ಪರೀಕ್ಷೆಗೆ

### ವ್ಯಾಯಾಮ 2: ಬಹು-ಮಾದರಿ ನಿಯೋಜನೆ ಸಂರಚನೆ (45 ನಿಮಿಷಗಳು)
**ಲಕ್ಷ್ಯ**: ವಿಭಿನ್ನ ಸಂರಚನೆಗಳೊಂದಿಗೆ ಹಲವು AI ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸು

```bash
# ಕಸ್ಟಮ್ Bicep ಸಂರಚನೆ ರಚಿಸಿ
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

# ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರಿಶೀಲಿಸಿ
azd provision
azd show
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ಬಹು ಮಾದರಿಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] ವಿಭಿನ್ನ ಸಾಮರ್ಥ್ಯ ಸೆಟ್ಟಿಂಗ್ಗಳು ಅನ್ವಯಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] ಮಾದರಿಗಳನ್ನು API ಮೂಲಕ ಪ್ರವೇಶಿಸಬಹುದು
- [ ] ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಎರಡೂ ಮಾದರಿಗಳನ್ನು ಕರೆಮಾಡಬಹುದು

### ವ್ಯಾಯಾಮ 3: ವೆಚ್ಚ ನಿಗಾವಹಣೆ ಜಾರಿಗೆ ತರುವುದು (20 ನಿಮಿಷಗಳು)
**ಲಕ್ಷ್ಯ**: ಬಜೆಟ್ ಅಲರ್ಟ್‌ಗಳು ಮತ್ತು ವೆಚ್ಚ ಟ್ರ್ಯಾಕಿಂಗ್‌ನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡಿ

```bash
# Bicep ಗೆ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಯನ್ನು ಸೇರಿಸಿ
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

# ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd provision

# ಪ್ರಸ್ತುತ ವೆಚ್ಚಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] Azure ನಲ್ಲಿ ಬಜೆಟ್ ಅಲರ್ಟ್ ರಚಿಸಲಾಗಿದೆ
- [ ] ಇಮೇಲ್ ನೋಟಿಫಿಕೇಶನ್ ಕಾನ್ಫಿಗರ್ ಆಗಿದೆ
- [ ] Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ವೆಚ್ಚ ಡೇಟಾವನ್ನು ವೀಕ್ಷಿಸಬಹುದು
- [ ] ಬಜೆಟ್ ಥ್ರೆಷ್‌ಹೋಲ್ಡುಗಳನ್ನು ಸರಿಯಾಗಿಯೇ ಸೆಟ್ ಮಾಡಲಾಗಿದೆ

## 💡 ಸಾಮಾನ್ಯವಾಗಿ ಕೇಳಲಾಗುವ ಪ್ರಶ್ನೆಗಳು

<details>
<summary><strong>ವಿಕasachನ ಸಂದರ್ಭದಲ್ಲಿ Azure OpenAI ವೆಚ್ಚವನ್ನು ಹೇಗೆ ಕಡಿಮೆ ಮಾಡಬಹುದು?</strong></summary>

1. **ಫ್ರೀ ಟಿಯರ್ ಬಳಸಿ**: Azure OpenAI ತಿಂಗಳಿಗೆ 50,000 ಟೋಕನ್ ಉಚಿತವಾಗಿ ನೀಡುತ್ತದೆ
2. **ಸಾಮರ್ಥ್ಯವನ್ನು ಕಡಿಮೆ ಮಾಡಿ**: dev ಗಾಗಿ ಸಾಮರ್ಥ್ಯವನ್ನು 30+ ಬದಲು 10 TPM ಗೆ ಸೆಟ್ ಮಾಡಿ
3. **azd down ಬಳಸಿ**: ಸಕ್ರಿಯವಾಗಿ ಅಭಿವೃದ್ಧಿ ಮಾಡುತ್ತಿರದಾಗ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಡೀಯಾಲೋಕೇಟ್ ಮಾಡಿ
4. **ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ಕ್ಯಾಶ್ ಮಾಡಿ**: ಪುನರಾವರ್ತಿತ ಪ್ರಶ್ನೆಗಳಿಗಾಗಿ Redis ಕ್ಯಾಶ್ ಜಾರಿಗೆ ತರುವುದು
5. **ಪ್ರಾಂಪ್ಟ್ ಎಂಜಿನಿಯರಿಂಗ್ ಬಳಸಿಸಿ**: ಪರಿಣಾಮಕಾರಿಯಾದ ಪ್ರಾಂಪ್ಟ್‌ಗಳಿಂದ ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಕಡಿಮೆ ಮಾಡಿ

```bash
# ಅಭಿವೃದ್ಧಿ ಸಂರಚನೆ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI ಮತ್ತು OpenAI API ನಡುವಿನ ವ್ಯತ್ಯಾಸ ಏನು?</strong></summary>

**Azure OpenAI**:
- ಎಂಟರ್‌ಪ್ರೈಸ್ ಭದ್ರತೆ ಮತ್ತು ಸಂರಕ್ಷಣಾ ಅನುಸರಣಾ ನೀತಿಗಳು
- ಖಾಸಗಿ ನೆಟ್‌ವರ್ಕ್ ಏಕೀಕರಣ
- SLA ಖಾತರಿಗಳು
- Managed identity ಪ್ರಮಾನೀಕರಣ
- ಹೆಚ್ಚಿನ ಕೊಟಾಗಳು ಲಭ್ಯ

**OpenAI API**:
- ಹೊಸ ಮಾದರಿಗಳಿಗೆ ವೇಗವಾಗಿ ಪ್ರವೇಶ
- ಸರಳ ಸೆಟ್ ಅಪ್
- ಕಡಿಮೆ ಪ್ರವೇಶದ ಅಡ್ಡಿ
- ಸಾರ್ವಜನಿಕ ಇಂಟರ್ನೆಟ್ ಮಾತ್ರ

ಉತ್ಪಾದನಾ ಅಪ್ಲಿಕೇಶನ್ಗಳಿಗಾಗಿ, **Azure OpenAI ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ**.
</details>

<details>
<summary><strong>Azure OpenAI ಕೊಟಾ ಮೀರಿದ ದೋಷಗಳನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸಲಿ?</strong></summary>

```bash
# ಪ್ರಸ್ತುತ ಕ್ವೋಟಾ ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus2

# ಬೇರೆ ಪ್ರದೇಶದಲ್ಲಿ ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ಸಂದರ್ಭಿಕವಾಗಿ ಸಾಮರ್ಥ್ಯವನ್ನು ಕಡಿಮೆ ಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ಕ್ವೋಟಾ ಹೆಚ್ಚಿಸಲು ವಿನಂತಿ ಮಾಡಿ
# Azure ಪೋರ್ಟಲ್‌ಗೆ ಹೋಗಿ > ಕ್ವೋಟಾಗಳು > ಹೆಚ್ಚಿಸುವಿಕೆ ವಿನಂತಿ
```
</details>

<details>
<summary><strong>ನಾನು ನನ್ನ ಸ್ವಂತ ಡೇಟಾವನ್ನು Azure OpenAI ಜೊತೆ ಬಳಸಬಹುದೇ?</strong></summary>

ಹೌದು! RAG (Retrieval Augmented Generation) ಗಾಗಿ **Azure AI Search** ಬಳಸಿ:

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
<summary><strong>AI ಮಾದರಿ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ನಾನು ಹೇಗೆ ಸುರಕ್ಷಿತಗೊಳಿಸಬಹುದು?</strong></summary>

**ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು**:
1. Managed Identity ಬಳಸಿರಿ (API ಕೀಗಳನ್ನು ಬಳಸಬೇಡಿ)
2. ಖಾಸಗಿ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
3. ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತಾ ಗುಂಪುಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
4. ದರ-ಮಿತಿ (rate limiting) ಅನುಷ್ಟಾನ ಮಾಡಿ
5. ರಹಸ್ಯಗಳಿಗಾಗಿ Azure Key Vault ಬಳಸಿ

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

## ಸಮುದಾಯ ಮತ್ತು ಬೆಂಬಲ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 1: ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದಿನದು**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

**ಸಹಾಯ ಬೇಕೆ?** ನಮ್ಮ ಸಮುದಾಯ ಚರ್ಚೆಗಳಲ್ಲಿ ಸೇರಿ ಅಥವಾ ರಿಪೊಸಿಟರಿಯಲ್ಲಿ ಇಶ್ಯೂ ತೆರೆಯಿರಿ. Azure AI + AZD ಸಮುದಾಯ ನಿಮ್ಮ ಯಶಸ್ಸಿಗೆ ಸಹಾಯ ಮಾಡಲು ಇಲ್ಲಿದೆ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ನಿರಾಕರಣೆ:
ಈ ದಾಖಲೆನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸುತ್ತೇವೆ ಆದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ — ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪು ಅರ್ಥಾಗ್ರಹಣಗಳು ಇರಬಹುದಾಗಿದೆ. ಮೂಲ ದಾಖಲೆ ಅದರ ಮಾತೃಭಾಷೆಯಲ್ಲಿ ಅಧಿಕಾರಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮುಖ್ಯ ಅಥವಾ ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಂಜস্যತೆಗಳು ಅಥವಾ ತಪ್ಪು ಅರ್ಥಗೊಳ್ಳುವುದಕ್ಕಾಗಿ ನಾವು ಜವಾಬ್ದಾರಿಯಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->