# Microsoft Foundry ಮತ್ತು AZD ಏಕೀಕರಣ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮುಖಪುಟ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 1: ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದಿನದು**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

## ಅವಲೋಕನ

ಈ ಮಾರ್ಗದರ್ಶಿಕೆ Microsoft Foundry ಸೆವೆಗಳನ್ನು Azure Developer CLI (AZD) ಜೊತೆಗೆ ಏಕೀಕರಿಸುವ ಮೂಲಕ ಸುಗಮಗೊಂಡ AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ ಹೇಗೆ ಸಾಧಿಸಬಹುದು ಎಂಬುದನ್ನು ತೋರಿಸುತ್ತದೆ. Microsoft Foundry AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸುವುದು, ನಿಯೋಜಿಸುವುದು ಮತ್ತು ನಿರ್ವಹಿಸುವುದಕ್ಕಾಗಿ ಸಮಗ್ರ ವೇದಿಕೆಯನ್ನು ಒದಗಿಸುತ್ತದೆ, ಇ بينما AZD ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ನಿಯೋಜನೆ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಸರಳಗೊಳಿಸುತ್ತದೆ.

## Microsoft Foundry ಎಂದರೆ ಏನು?

Microsoft Foundry Microsoft ನ ಏಕೀಕೃತ AI ಅಭಿವೃದ್ಧಿ ವೇದಿಕೆಯಾಗಿದೆ, ಇದರಲ್ಲಿ ಹೀಗಿವೆ:

- **ಮಾದರಿ ಕ್ಯಾಟಲಾಗ್**: ಅತ್ಯಾಧುನಿಕ AI ಮಾದರಿಗಳಿಗೆ ಪ್ರವೇಶ
- **Prompt Flow**: AI ವರ್ಕ್‌ಫ್ಲೋಗಳಿಗಾಗಿ ದೃಶ್ಯ ವಿನ್ಯಾಸಕ
- **Microsoft Foundry ಪೋರ್ಟಲ್**: AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ ಸಮಗ್ರ ಅಭಿವೃದ್ಧಿ ವಾತಾವರಣ
- **ನಿಯೋಜನೆ ಆಯ್ಕೆಗಳು**: ಅನೇಕ ಹೋಸ್ಟಿಂಗ್ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಆಯ್ಕೆಗಳು
- **ಸುರಕ್ಷತೆ ಮತ್ತು ಭದ್ರತೆ**: ಒಳಗೊಂಡಿರುವ ಜವಾಬ್ದಾರಿಯುತ AI ವೈಶಿಷ್ಟ್ಯಗಳು

## AZD + Microsoft Foundry: ಒಟ್ಟಾಗಿ ಉತ್ತಮ

| ವೈಶಿಷ್ಟ್ಯ | Microsoft Foundry | AZD ಏಕೀಕರಣದ ಪ್ರಯೋಜನ |
|---------|-----------------|------------------------|
| **ಮಾದರಿ ನಿಯೋಜನೆ** | ಕೈಯಿಂದ ಪೋರ್ಟಲ್ ಮೂಲಕ ನಿಯೋಜನೆ | ಸ್ವಯಂಚಾಲಿತ, ಪುನರಾವೃತ್ತಿ ಆಗುವ ನಿಯೋಜನೆಗಳು |
| **ಅಧಾರಭೂತ ವ್ಯವಸ್ಥೆ** | ಕ್ಲಿಕ್-ಥ್ರೂ ಪ್ರೊವಿಜನಿಂಗ್ | ಕೋಡ್ ಆಗಿ ಮೂಲಸೌಕರ್ಯ (Bicep) |
| **ಪರಿಸರ ನಿರ್ವಹಣೆ** | ಒಂದು ವಾತಾವರಣಕ್ಕೆ ಕೇಂದ್ರಿತ | ಬಹು-ವಾತಾವರಣ (dev/staging/prod) |
| **CI/CD ಏಕೀಕರಣ** | ಸೀಮಿತ | ಸ್ಥಳೀಯ GitHub Actions ಬೆಂಬಲ |
| **ಖರ್ಚು ನಿರ್ವಹಣೆ** | ಮೂಲಭೂತ ಮോണಿಟರಿಂಗ್ | ವಾತಾವರಣ-ನಿರ್ದಿಷ್ಟ ಖರ್ಚು ಅನುಕೂಲತೆ |

## ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

- ಸೂಕ್ತ ಅನುಮತಿಗಳೊಂದಿಗೆ Azure ಸಬ್ಸ್ಕ್ರಿಪ್ಷನ್
- Azure Developer CLI ಸ್ಥಾಪಿಸಲಾಗಿದೆ
- Microsoft Foundry Models ಸೇವೆಗಳಿಗೆ ಪ್ರವೇಶ
- Microsoft Foundry ಬಗ್ಗೆ ಮೂಲ ಪರಿಚಯ

## ಕೋರ್ ಏಕೀಕರಣ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: Microsoft Foundry Models ಏಕೀಕರಣ

**ಬಳಕೆದಾರ ಪ್ರಕರಣ**: Microsoft Foundry Models ಮಾದರಿಗಳೊಂದಿಗೆ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿ

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

**ಮೂಲಸೌಕರ್ಯ (main.bicep):**
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

### ಮಾದರಿ 2: AI Search + RAG ಏಕೀಕರಣ

**ಬಳಕೆದಾರ ಪ್ರಕರಣ**: retrieval-augmented generation (RAG) ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿ

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

### ಮಾದರಿ 3: ಡಾಕ್ಯುಮೆಂಟ್ ಇಂಟೆಲಿಜೆನ್ಸ್ ಏಕೀಕರಣ

**ಬಳಕೆದಾರ ಪ್ರಕರಣ**: ಡಾಕ್ಯುಮೆಂಟ್ ಪ್ರೊಸೆಸಿಂಗ್ ಮತ್ತು ವಿಶ್ಲೇಷಣಾ ವರ್ಕ್‌ಫ್ಲೋಗಳು

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

### ವಾತಾವರಣ ಚರಗಳ ಸೆಟ್ಟಿಂಗ್

**ಉತ್ಪಾದನಾ ಸಂರಚನೆ:**
```bash
# ಮೂಲ ಎಐ ಸೇವೆಗಳು
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ಮಾದರಿ ಸಂರಚನೆಗಳು
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# ಕಾರ್ಯಕ್ಷಮತಾ ಹೊಂದಾಣಿಕೆಗಳು
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ವಿಕಾಸ ಸಂರಚನೆ:**
```bash
# ವಿಕಾಸಕ್ಕಾಗಿ ವೆಚ್ಚ-ಅನೂಕೂಲಿತ ಸೆಟ್ಟಿಂಗ್ಗಳು
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ಉಚಿತ ಮಟ್ಟ
```

### Key Vault ಬಳಸಿ ಸುರಕ್ಷಿತ ಸಂರಚನೆ

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

## ನಿಯೋಜನಾ ವರ್ಕ್ಫ್ಲೋಗಳು

### Foundry ಗಾಗಿ AZD ವಿಸ್ತಾರಗಳು

AZD Microsoft Foundry ಸೇವೆಗಳೊಂದಿಗೆ ಕೆಲಸ ಮಾಡಲು AI-ವಿಶೇಷ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಸೇರಿಸುವ ವಿಸ್ತಾರಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ:

```bash
# Foundry ಏಜೆಂಟ್‌ಗಳ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.agents

# ಫೈನ್-ಟ್ಯೂನಿಂಗ್ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.finetune

# ಕಸ್ಟಮ್ ಮಾದರಿಗಳ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.models

# ಸ್ಥಾಪಿಸಲಾದ ವಿಸ್ತರಣೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd extension list
```

### `azd ai`ೊಂದಿಗೆ ಏಜೆಂಟ್-ಪ್ರಥಮ ನಿಯೋಜನೆ

ನಿಮಗೆ ಏಜೆಂಟ್ ಮಿನಿಫೆಸ್ಟ್ ಇದ್ದರೆ, Foundry Agent Service ಗೆ ತಂತಿಗಳನ್ನು ಸಂಪರ್ಕಿಸಿದ ಪ್ರಾಜೆಕ್ಟ್ scaffold ಮಾಡಲು `azd ai agent init` ಅನ್ನು ಬಳಸಿ:

```bash
# ಏಜೆಂಟ್ ಮ್ಯಾನಿಫೆಸ್ಟ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure ಗೆ ನಿಯೋಜಿಸಿ
azd up
```

ಪೂರ್ಣ ಆಜ್ಞಾ ಉಲ್ಲೇಖ ಮತ್ತು ಫ್ಲಾಗ್‌ಗಳಿಗಾಗಿ [AZD AI CLI ಆಜ್ಞೆಗಳು](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ನೋಡಿ.

### ಏಕ ಆಜ್ಞೆ ನಿಯೋಜನೆ

```bash
# ಒಂದು ಆದೇಶದಿಂದ ಎಲ್ಲವನ್ನೂ ನಿಯೋಜಿಸಿ
azd up

# ಅಥವಾ ಹಂತ ಹಂತವಾಗಿ ನಿಯೋಜಿಸಿ
azd provision  # ಕೇವಲ ಮೂಲಸೌಕರ್ಯ
azd deploy     # ಕೇವಲ ಅನ್ವಯಿಕೆ
```

### ವಾತಾವರಣ-ನಿರ್ದಿಷ್ಟ ನಿಯೋಜನೆಗಳು

```bash
# ಅಭಿವೃದ್ಧಿ ಪರಿಸರ
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

## ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಗಮನಾರ್ಹತೆ

### Application Insights ಏಕೀಕರಣ

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

### ಖರ್ಚು ಮೇಲ್ವಿಚಾರಣೆ

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

## 🔐 ಭದ್ರತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### ನಿರ್ವಹಿತ ಗುರುತಿನ ಸಂರಚನೆ

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

### ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತೆ

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

## ಕಾರ್ಯಕ್ಷಮತೆಯ ಆಪ್ಟಿಮೈಜೇಶನ್

### ಕಾಶೆ ನೀತಿಗಳು

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

### ಆಟೋ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚನೆ

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

## ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ನಿದಾನ

### ಸಮಸ್ಯೆ 1: OpenAI ಕ್ವೋಟಾ ಜಾಸ್ತಿವಾಗಿದೆ

**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆ ಕ್ವೋಟಾ ದೋಷಗಳೊಂದಿಗೆ ವಿಫಲವಾಗುತ್ತದೆ
- ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳಲ್ಲಿ 429 ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರಸ್ತುತ к್ವೋಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus

# ಬೇರೊಂದು ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ತಾತ್ಕಾಲಿಕವಾಗಿ ಸಾಮರ್ಥ್ಯವನ್ನು ಕಡಿಮೆ ಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ಸಮಸ್ಯೆ 2: ಪ್ರಾಮಾಣೀಕರಣ ವಿಫಲತೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- AI ಸೇವೆಗಳನ್ನು ಕರೆಸುವಾಗ 401/403 ದೋಷಗಳು
- "ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ" ಸಂದೇಶಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# ಭೂಮಿಕೆ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ಕೀ ವಾಲ್ಟ್ ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ಸಮಸ್ಯೆ 3: ಮಾದರಿ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆಯಲ್ಲಿ ಮಾದರಿಗಳು ಲಭ್ಯವಿಲ್ಲ
- ನಿರ್ದಿಷ್ಟ ಮಾದರಿ ಆವೃತ್ತಿಗಳು ವಿಫಲವಾಗುತ್ತಿವೆ

**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರದೇಶಾನುಸಾರ ಲಭ್ಯವಿರುವ ಮಾದರಿಗಳ ಪಟ್ಟಿ
az cognitiveservices model list --location eastus

# bicep ಟೆಂಪ್ಲೇಟಿನಲ್ಲಿ ಮಾದರಿಯ ಆವೃತ್ತಿಯನ್ನು ನವೀಕರಿಸಿ
# ಮಾದರಿಯ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
```

## ಉದಾಹರಣಾ ಮಾದರಿಗಳು

### RAG Chat Application (Python)

**ರೆಪೊಸಿಟರಿ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ವಿವರಣೆ**: ಅತ್ಯಂತ ಪ್ರಸಿದ್ಧ Azure AI ಉದಾಹರಣೆ — ಉತ್ಪಾದನಾ-ಸಿದ್ಧ RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್, ಇದು ನಿಮ್ಮ ಸ್ವಂತ ಡಾಕ್ಯುಮೆಂಟ್ ಮೇಲೆ ಪ್ರಶ್ನೆಗಳನ್ನು ಕೇಳಲು ಅನುಮತಿಸುತ್ತದೆ. ಚಾಟ್‌ಗೆ GPT-4.1-mini ಅನ್ನು ಬಳಸುತ್ತದೆ, ಎಂಬೆಡ್ಡಿಂಗ್‌ಗಳಿಗೆ text-embedding-ada-002 ಅನ್ನು ಬಳಸುತ್ತದೆ, ಮತ್ತು ರಿಟ್ರೀವಲ್‌ಗೆ Azure AI Search ಬಳಸುತ್ತದೆ. ಬಹುಮುಖ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳನ್ನು, ಸ್ಪೀಚ್ ಇನ್ಪುಟ್/ಔಟ್‌ಪುಟ್, Microsoft Entra ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು Application Insights ಟ್ರೇಸಿಂಗ್ ಅನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**ರೆಪೊಸಿಟರಿ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ವಿವರಣೆ**: Python RAG ಚಾಟ್ ಉದಾಹರಣೆಯ .NET/C# ಸಮಾನಾಂಕ. ASP.NET Core Minimal API ಮತ್ತು Blazor WebAssembly ಫ್ರಂಟ್‌ಎಂಡ್ ಬಳಸಿ ನಿರ್ಮಿಸಲಾಗಿದೆ. ವಾಯ್ಸ್ ಚಾಟ್, GPT-4o-mini vision ಬೆಂಬಲ, ಮತ್ತು ಸಂಯುಕ್ತ .NET MAUI Blazor ಹೈಬ್ರಿಡ್ ಡೆಸ್ಕ್‌ಟಾಪ್/ಮೊಬೈಲ್ ಕ್ಲೈಂಟ್ ಅನ್ನು ಒಳಗೊಂಡಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**ರೆಪೊಸಿಟರಿ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ವಿವರಣೆ**: Langchain4J ಬಳಸಿ AI ಸಂಚಾಲನೆಗಾಗಿ Java ಆವೃತ್ತಿಯ RAG ಚಾಟ್ ಉದಾಹರಣೆ. ಮೈಕ್ರೋಸೇವಾ ಇವೆಂಟ್-ಚಾಲಿತ ಆರ್ಕಿಟೆಕ್ಟರ್, ಬಹು-ಶೋಧನಾ ತಂತ್ರಗಳು (ಟೆಕ್ಸ್ಟ್, ವೆಕ್ಟರ್, ಹೈಬ್ರಿಡ್), Azure Document Intelligence ಒಳಗೊಂಡ ಡಾಕ್ಯುಮೆಂಟ್ ಅಪ್‌ಲೋಡ್, ಮತ್ತು either Azure Container Apps ಅಥವಾ Azure Kubernetes Service ಗೆ ನಿಯೋಜನೆಗೆ ಬೆಂಬಲವನ್ನು ಒದಗಿಸುತ್ತದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**ರೆಪೊಸಿಟರಿ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ವಿವರಣೆ**: Azure AI Foundry ಮತ್ತು Prompty ಬಳಸಿ ಎಂಡು-ಟು-ಎಂಡ್ ರಿಟೇಲ್ RAG ಕಾಪಿಲಾಟ್. Contoso Outdoor ಚಿಲ್ಲರೆ ವ್ಯಾಪಾರದ ಚಾಟ್‌ಬಾಟ್ ಇದು ಉತ್ಪನ್ನ ಕ್ಯಾಟಲಾಗ್ ಮತ್ತು ಗ್ರಾಹಕರ ಆರ್ಡರ್ ಡೇಟಾದಲ್ಲಿ ಆಧಾರಿತ ಉತ್ತರಗಳನ್ನು ನೀಡುತ್ತದೆ. ಪೂರ್ಣ GenAIOps ವರ್ಕ್‌ಫ್ಲೋ ಅನ್ನು ತೋರಿಸುತ್ತದೆ — Prompty ಮೂಲಕ ಪ್ರೋಟೋಟೈಪ್ ಮಾಡಿ, AI-ಸಹಾಯಿತ ಮೌಲ್ಯಮಾಪಕಗಳೊಂದಿಗೆ ಮೌಲ್ಯಮಾಪನ ಮಾಡಿ, ಮತ್ತು AZD ಮೂಲಕ Container Apps ಗೆ ನಿಯೋಜಿಸಿ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**ರೆಪೊಸಿಟರಿ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**ವಿವರಣೆ**: Prompty ಜೊತೆಯಲ್ಲಿನ AI ಏಜೆಂಟ್ ಸಂಚಾಲನೆಗೆ ಉದಾಹರಣೆ. ಸಂಶೋಧನಾ ಏಜೆಂಟ್ (Bing Grounding in Azure AI Agent Service), ಉತ್ಪನ್ನ ಏಜೆಂಟ್ (Azure AI Search), ಬರಹಗಾರ ಏಜೆಂಟ್ ಮತ್ತು ಸಂಪಾದಕ ಏಜೆಂಟ್ ನಡುವೆ ಸಂಯೋಜಿತವಾಗಿ ಉತ್ತಮವಾಗಿ ಸಂಶೋಧಿಸಿದ ಲೇಖನಗಳನ್ನು ತಯಾರಿಸುತ್ತದೆ. GitHub Actions ನಲ್ಲಿ ಮೌಲ್ಯಮಾಪನ ಹೊಂದಿರುವ CI/CD ಕೂಡ ಸೇರಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**ರೆಪೊಸಿಟರಿ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**ವಿವರಣೆ**: LangChain.js ಬಳಸಿ ಸಂಪೂರ್ಣ ಸರ್ವರ್‌ಲೆಸ್ RAG ಚಾಟ್‌ಬಾಟ್, API ಗಾಗಿ Azure Functions ಮತ್ತು ಹೋಸ್ಟಿಂಗ್ ಗಾಗಿ Azure Static Web Apps ಬಳಸುತ್ತದೆ. Azure Cosmos DB ಅನ್ನು ವೆಕ್ಟರ್ ಸ್ಟೋರ್ ಮತ್ತು ಚಾಟ್ ಇತಿಹಾಸ ಡೇಟಾಬೇಸ್ ಎರಡಾಗಿ ಬಳಸುತ್ತದೆ. ಶೂನ್ಯ-ಖರ್ಚು ಪರೀಕ್ಷೆಗಾಗಿ ಸ್ಥಳೀಯ ಅಭಿವೃದ್ಧಿಗೆ Ollama ಬೆಂಬಲವನ್ನು ನೀಡುತ್ತದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**ರೆಪೊಸಿಟರಿ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**ವಿವರಣೆ**: ಡಾಕ್ಯುಮೆಂಟ್ ಅಪ್ಲೋಡ್/ನಿರ್ವಹಣೆಗೆ ಆಡಳಿತ ಪೋರ್ಟಲ್ ಹೊಂದಿರುವ ಎಂಟರ್‌ಪ್ರೈಸ್-ಮಟ್ಟದ RAG ಸೊಲ್ಯೂಶನ್ ಆಕ್ಸಿಲೇಟರ್. ಹಲವು ಆರ್ಕೆಸ್ಟ್ರೇಟರ್ ಆಯ್ಕೆಗಳು (Semantic Kernel, LangChain, Prompt Flow), ಸ್ಪೀಚ್-ಟು-ಟೆಕ್ಸ್ಟ್, Microsoft Teams ಯೊಂದಿಗೆ ಏಕೀಕರಣ ಮತ್ತು PostgreSQL ಅಥವಾ Cosmos DB ಬ್ಯಾಕ್‌ಎಂಡ್ ಆಯ್ಕೆಯನ್ನು ಒಳಗೊಂಡಿದೆ. ಉತ್ಪಾದನಾ RAG ಪರಿಸ್ಥಿತಿಗಳಿಗಾಗಿ ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದಾದ ಪ್ರಾರಂಭಿಕ ಬಿಂದುವಾಗಿ ವಿನ್ಯಾಸಗೊಳಿಸಲಾಗಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**ರೆಪೊಸಿಟರಿ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**ವಿವರಣೆ**: ಮೂವರು ಫ್ರೇಮ್‌ವರ್ಕ್‌ಗಳನ್ನು (LangChain.js, LlamaIndex.TS, ಮತ್ತು Microsoft Agent Framework) ಬಳಸಿ ಮಲ್ಟಿ-ಏಜೆಂಟ್ AI ಸಂಚಾಲನೆಗೆ ರೆಫರೆನ್ಸ್ ಅಪ್ಲಿಕೇಶನ್. ನಾಲ್ಕು ಭಾಷೆಗಳಲ್ಲಿ MCP (Model Context Protocol) ಸರ್ವರ್‌ಗಳನ್ನು ಸರ್ವರ್‌ಲೆಸ್ Azure Container Apps ನಲ್ಲಿ ನಿಯೋಜಿಸಿ OpenTelemetry ಮಾನಿಟರಿಂಗ್ ಬಳಸಲಾಗಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**ರೆಪೊಸಿಟರಿ**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**ಸೇವೆಗಳು**: Azure AI Services + Azure OpenAI

**ವಿವರಣೆ**: ಕನಿಷ್ಠ Bicep ಟೆಂಪ್ಲೇಟ್ ಇದು კონ್ಫಿಗರ್ ಮಾಡಿದ ಮೆಷಿನ್ ಲರ್ನಿಂಗ್ ಮಾದರಿಗಳೊಂದಿಗೆ Azure AI ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸುತ್ತದೆ. ಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ಸ್ಟ್ಯಾಕ್ ಇಲ್ಲದೆ ಕೆಳಗಿನ ಮೂಲಸೌಕರ್ಯವನ್ನು ಮಾತ್ರ ಬೇಡುವಾಗ ಕೈಗೆಟುಕುವ ಸುಲಭ ಪ್ರಾರಂಭಿಕ ಬಿಂದುವಾಗಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ:**
```bash
azd init --template azd-ai-starter
azd up
```

> **ಇನ್ನಷ್ಟು ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ**: 80+ ಭಾಷೆ ಮತ್ತು ಸನ್ನಿವೇಶಗಳಲ್ಲಿ AI-ವಿಶೇಷ AZD ಟೆಂಪ್ಲೇಟುಗಳಿಗಾಗಿ [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ಗೆ ಭೇಟಿ ನೀಡಿ.

## ಮುಂದಿನ ಹಂತಗಳು

1. **ಉದಾಹರಣೆಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ**: ನಿಮ್ಮ ಬಳಕೆ ಕೇಸ್‌ಗೆ ಹೊಂದಿಕೆಯಾಗುವ ಪೂರ್ವ-ನಿರ್ಮಿತ ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
2. **ನಿಮ್ಮ ಅಗತ್ಯಗಳಿಗೆ ಕಸ್ಟಮೈಸ್ ಮಾಡಿ**: ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ತಿದ್ದುಪಡಿ ಮಾಡಿ
3. **ಮೋನಿಟರಿಂಗ್ ಸೇರಿಸಿ**: ಸಮಗ್ರ ಅಬ್ಜರ್ವಬಿಲಿಟಿ ಅನುಷ್ಠಾನಗೊಳಿಸಿ
4. **ಖರ್ಚುಗಳನ್ನು ಪರಿಷ್ಕರಿಸಿ**: ನಿಮ್ಮ ಬಜೆಟ್‌ಗೆ ತಕ್ಕಂತೆ ಸಂರಚನೆಗಳನ್ನು ಸುಧಾರಿಸಿ
5. **ನಿಯೋಜನೆಯನ್ನು ಸುರಕ್ಷಿತಗೊಳಿಸಿ**: ಎಂಟರ್‌ಪ್ರೈಸ್ ಭದ್ರತಾ ಮಾದರಿಗಳನ್ನು ಜಾರಿಗೆ ತರುವುದು
6. **ಉತ್ಪಾದನಕ್ಕೆ ವಿಸ್ತರಿಸಿ**: ಬಹು-ಪ್ರಾಂತ ಮತ್ತು ಹೆಚ್ಚಿನ ಲಭ್ಯತೆಗೆ ಫೀಚರ್‌ಗಳನ್ನು ಸೇರಿಸಿ

## 🎯 ಹಸ್ತಚಾಲಿತ ಅಭ್ಯಾಸಗಳು

### ಅಭ್ಯಾಸ 1: Microsoft Foundry Models ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ (30 ನಿಮಿಷ)
**ಗೋಲ್**: ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರೀಕ್ಷೆ ಮಾಡಿ

```bash
# ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ಪರಿಸರ ಚರಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ನಿಯೋಜಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನನ್ನು ಪರೀಕ್ಷಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆ ಕಾರ್ಯಗಳನ್ನು ನಿಗಾ ವಹಿಸಿ
azd monitor

# ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ವ್ಯ ಮಾನದಂಡಗಳು:**
- [ ] ನಿಯೋಜನೆ ಕ್ವೋಟಾ ದೋಷಗಳಿಲ್ಲದೆ ಪೂರ್ಣಗೊಳ್ಳುತ್ತದೆಯೇ
- [ ] ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಚಾಟ್ ಇಂಟರ್‌ಫೇಸ್‌ಗೆ ಪ್ರವೇಶಿಸಬಹುದು
- [ ] ಪ್ರಶ್ನೆಗಳನ್ನು ಕೇಳಿ AI ಚಾಲಿತ ಪ್ರತಿಕ್ರಿಯೆಗಳು ಪಡೆಯಬಹುದು
- [ ] Application Insights ಟೆಲಿಮೆಟ್ರಿ ಡೇಟಾವನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] ಸಂಪನ್ಮೂಲಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ತೆರವುಗೊಳಿಸಲಾಗಿದೆ

**ಅಂದಾಜು ಖರ್ಚು**: 30 ನಿಮಿಷದ ಪರೀಕ್ಷೆಗೆ $5-10

### ಅಭ್ಯಾಸ 2: ಬಹು-ಮಾದರಿ ನಿಯೋಜನೆ ಸಂರಚಿಸುವುದು (45 ನಿಮಿಷ)
**ಗೋಲ್**: ವಿವಿಧ ಸಂರಚನೆಗಳೊಂದಿಗೆ ಅನೇಕ AI ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸಿ

```bash
# ಕಸ್ಟಮ್ Bicep ಸಂರಚನೆಯನ್ನು ರಚಿಸಿ
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

# ಡಿಪ್ಲಾಯ್ ಮಾಡಿ ಮತ್ತು ಪರಿಶೀಲಿಸಿ
azd provision
azd show
```

**ಯಶಸ್ವ್ಯ ಮಾನದಂಡಗಳು:**
- [ ] ಅನೇಕ ಮಾದರಿಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲಾಗಿದೆ
- [ ] ವಿಭಿನ್ನ ಸಾಮರ್ಥ್ಯ ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಅನ್ವಯಿಸಲಾಗಿದೆ
- [ ] ಮಾದರಿಗಳು API ಮೂಲಕ ಲಭ್ಯವಿವೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಎರಡೂ ಮಾದರಿಗಳನ್ನು ಕರೆ ಮಾಡಬಹುದು

### ಅಭ್ಯಾಸ 3: ಖರ್ಚು ಮೇಲ್ವಿಚಾರಣೆ ಅನುಷ್ಠಾನಗೊಳಿಸಿ (20 ನಿಮಿಷ)
**ಗೋಲ್**: ಬಜೆಟ್ ಅಲರ್ಟ್‌ಗಳು ಮತ್ತು ಖರ್ಚು ಟ್ರ್ಯಾಕಿಂಗ್ ಸೇಟ್ ಅಪ್ ಮಾಡಿ

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

**ಯಶಸ್ವ್ಯ ಮಾನದಂಡಗಳು:**
- [ ] Azure ನಲ್ಲಿ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆ ರಚಿಸಲಾಗಿದೆ
- [ ] ಇಮೇಲ್ ನೋಟಿಫಿಕೇಶನ್‌ಗಳು ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] Azure ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ಖರ್ಚು ಡೇಟಾ ನೋಡುವುದು ಸಾಧ್ಯ
- [ ] ಬಜೆಟ್ ದರ್ಜೆಗಳು ಸೂಕ್ತವಾಗಿ ಸೆಟ್ ಮಾಡಲಾಗಿದೆ

## 💡 ಮರಳಿ ಕೇಳಲ್ಪಡುವ ಪ್ರಶ್ನೆಗಳು

<details>
<summary><strong>ವಿಕಾಸದ ಸಮಯದಲ್ಲಿ Microsoft Foundry Models ಖರ್ಚುಗಳನ್ನು ಹೇಗೆ ಕಡಿಮೆ ಮಾಡಬಹುದು?</strong></summary>

1. **ಮುಕ್ತ ತಹೊಚ್**: Microsoft Foundry Models ತಿಂಗಳಿಗೆ 50,000 ಟೋಕನ್ ಉಚಿತವಾಗಿ ನೀಡುತ್ತದೆ
2. **ಸಾಮರ್ಥ್ಯ ಕಡಿಮೆ ಮಾಡಿ**: ಡೆವ್‌ಗಾಗಿ ಸಾಮರ್ಥ್ಯವನ್ನು 30+ ಬದಲಾಗಿ 10 TPM ಗೆ ಸೆಟ್ ಮಾಡಿ
3. **azd down ಬಳಸಿ**: ಚಟುವಟಿಕೆಯಿಲ್ಲದಾಗ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಡೀಆಲೋಕೆಟ್ ಮಾಡಿ
4. **ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ಕ್ಯಾಸೆ ಮಾಡಿ**: ಪುನರಾವೃತ್ತ ಪ್ರಶ್ನೆಗಳಿಗೆ Redis ಕ್ಯಾಸೆ ಅನುಷ್ಠಾನಗೊಳಿಸಿ
5. **ಪ್ರಾಂಪ್ಟ್ ಇಂಜಿನಿಯರಿಂಗ್ ಬಳಸಿ**: ಪರಿಣಾಮಕಾರಿ ಪ್ರಾಂಪ್ಟ್‌ಗಳ ಮೂಲಕ ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಕಡಿಮೆ ಮಾಡಿ

```bash
# ವಿಕಾಸದ ಸಂರಚನೆ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models ಮತ್ತು OpenAI API ನಡುವಿನ ವ್ಯತ್ಯಾಸ ಏನು?</strong></summary>

**Microsoft Foundry Models**:
- ಎಂಟರ್‌ಪ್ರೈಸಿ ಭದ್ರತೆ ಮತ್ತು ಅನುಕೂಲತೆ
- ಖಾಸಗಿ ನೆಟ್‌ವರ್ಕ್ ಏಕೀಕರಣ
- SLA ಗುಣಮಟ್ಟದ ಖಾತರಿ
- ನಿರ್ವಹಿತ ಗುರುತಿನ ಪ್ರಾಮಾಣೀಕರಣ
- ಹೆಚ್ಚಿನ ಕ್ವೋಟಾಗಳು ಲಭ್ಯವಿರಬಹುದು

**OpenAI API**:
- ಹೊಸ ಮಾದರಿಗಳಿಗೆ ವೇಗವಾಗಿ ಪ್ರವೇಶ
- ಸರಳವಾದ ಸೆಟ್‌ಅಪ್
- ಪ್ರವೇಶಕ್ಕೆ ಕಡಿಮೆ ಅಡ್ಡಿಬದಿ
- ಸಾರ್ವಜನಿಕ ಇಂಟರ್ನೆಟ್ ಮಾತ್ರ

ಉತ್ಪಾದನಾ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ, **Microsoft Foundry Models ಅನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ**.
</details>

<details>
<summary><strong>Microsoft Foundry Models ಕ್ವೋಟಾ ಮೀರಿದ ದೋಷಗಳನ್ನು ನಾನು ಹೇಗೆ ನಿರ್ವಹಿಸಬಹುದು?</strong></summary>

```bash
# ಪ್ರಸ್ತುತ ಕ್ವೋಟಾ ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus2

# ಬೇರೊಂದು ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ತಾತ್ಕಾಲಿಕವಾಗಿ ಸಾಮರ್ಥ್ಯವನ್ನು ಕಡಿಮೆ ಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ಕ್ವೋಟಾ ಹೆಚ್ಚಿಸಲು ವಿನಂತಿ ಮಾಡಿ
# Azure ಪೋರ್ಟಲ್ > ಕ್ವೋಟಾಗಳು > ಹೆಚ್ಚಿಸಲು ವಿನಂತಿಗೆ ಹೋಗಿ
```
</details>

<details>
<summary><strong>ನಾನು ನನ್ನದೇ ಡೇಟಾವನ್ನು Microsoft Foundry Models ಜೊತೆಗೆ ಬಳಸಬಹುದೇ?</strong></summary>

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

ಈ [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ಟೆಂಪ್ಲೇಟ್ ನೋಡಿ.
</details>

<details>
<summary><strong>AI ಮಾದರಿ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ನಾನು ಹೇಗೆ ಸುರಕ್ಷಿತಗೊಳಿಸಬಹುದು?</strong></summary>

**ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು**:
1. Managed Identity ಬಳಸಿರಿ (API ಕೀಲಿಗಳು ಇಲ್ಲ)
2. Private Endpoints ಅನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
3. ನೆಟ್‌ವರ್ಕ್ ಸುರಕ್ಷತಾ ಗುಂಪುಗಳನ್ನು ಸಂರಚಿಸಿ
4. ರೇಟ್-ಲಿಮಿಟಿಂಗ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
5. ರಹಸ್ಯಗಳಿಗಾಗಿ Azure Key Vault ಅನ್ನು ಬಳಸಿ

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

- **Microsoft Foundry Discord**: [#Azure ಚಾನೆಲ್](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ಇಶ್ಯೂಗಳು ಮತ್ತು ಚರ್ಚೆಗಳು](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ಅಧಿಕೃತ ದಾಖಲೆ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ನಿಮ್ಮ ಸಂಪಾದಕದಲ್ಲಿ Azure + Foundry agent skills ಅನ್ನು ಸ್ಥಾಪಿಸಲು `npx skills add microsoft/github-copilot-for-azure` ಬಳಸಿ

---

**ಅಧ್ಯಾಯ ದಿಕ್ಕು:**
- **📚 ಕೋರ್ಸ್ ಮುಖ್ಯಪುಟ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದಿನ**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**ಸಹಾಯ ಬೇಕೇ?** ನಮ್ಮ ಸಮುದಾಯ ಚರ್ಚೆಗಳಲ್ಲಿ ಸೇರಿ ಅಥವಾ ರಿಪೊಸಿಟರಿಯಲ್ಲಿ ಒಂದು issue ತೆರೆಯಿರಿ. Azure AI + AZD ಸಮುದಾಯವು ನಿಮ್ಮ ಯಶಸ್ಸಿಗೆ ನೆರವಾಗಲು ಇಲ್ಲಿ ಇದೆ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ಈ ದಾಖಲೆ AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಾಖಲೆ ಅನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವುದರಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗ್ರಹಣೆಗಳು ಅಥವಾ ತಪ್ಪಾದ ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->