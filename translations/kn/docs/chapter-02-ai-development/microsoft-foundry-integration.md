# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 کورس بداية**: [AZD For Beginners](../../README.md)
- **📖 ಪಾಲಿನ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-First Development
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 1: ನಿಮ್ಮ ಮೊದಲು ಪ್ರಾಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದಿನ**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

## ಓವರ್‌ವಿವ್

ಈ ಮಾರ್ಗದರ್ಶಿಯಲ್ಲಿ Microsoft Foundry ಸೇವೆಗಳನ್ನು Azure Developer CLI (AZD) ಜೊತೆಗೆ ಏನು ರೀತಿಯಲ್ಲಿ ಹಾಕಿಕೊಳ್ಳುವುದು ಮತ್ತು AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳ ನಿಯೋಜನೆಯನ್ನು ಸುಗಮಗೊಳಿಸುವುದು ಹೇಗೆ ಎಂಬುದನ್ನು ತೋರಿಸಲಾಗುತ್ತದೆ. Microsoft Foundry ಒಂದು ಸಮಗ್ರ ವೇದಿಕೆ ಆಗಿದ್ದು AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಲು, ನಿಯೋಜಿಸಲು ಮತ್ತು ನಿರ್ವಹಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ, ಹಾಗೆಯೇ AZD ಸ್ಥಾಪನೆಯ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಸರಳಗೊಳಿಸುತ್ತದೆ.

## Microsoft Foundry ಎಂದರೆ ಏನು?

Microsoft Foundry Microsoft ನ ಏಕೀಕೃತ ವೇದಿಕೆ ಆಗಿದ್ದು AI ಆವಿರ್ಭಾವಕ್ಕಾಗಿ ಇದು:

- **ಮಾದರಿ קטಲॉग**: ಅತಿ ಮುಂದಿನ AI ಮಾದರಿಗಳಿಗೆ ಪದಚಾರ
- **ಪ್ರಾಂಪ್ಟ್ ಫ್ಲೋ**: AI ವರ್ಕ್‌ಫ್ಲೋಗಳ ದೃಶ್ಯ ವಿನ್ಯಾಸಕ
- **Microsoft Foundry ಪೋರ್ಸಲ್**: AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳ ಸಂಯುಕ್ತ ವಿಕಸನ ವಾತಾವರಣ
- **ನಿಯೋಜನೆ ಆಯ್ಕೆಮಾಡುಗಳು**: ಹಲವಾರು ಆತಿಥ್ಯ ಮತ್ತು ವಿಸ್ತಾರ ಆಯ್ಕೆಗಳು
- **ಸುರಕ್ಷತೆ ಮತ್ತು ನೈತಿಕತೆ**: ನೈತಿಕ AI ಲಕ್ಷಣಗಳನ್ನು ಒಳಗೊಂಡಿದೆ

## AZD + Microsoft Foundry: ಒಟ್ಟಿಗೆ ಉತ್ತಮ

| ವೈಶಿಷ್ಟ್ಯ | Microsoft Foundry | AZD ಸಂಯೋಜನೆಯ ಲಾಭ |
|---------|-----------------|------------------------|
| **ಮಾದರಿ ನಿಯೋಜನೆ** | ಕೈಯಿಂದ ಪೋಲ್ಟಲು ನಿಯೋಜನೆ | ಸ್ವಯಂಚಾಲಿತ, ಪುನರಾವರ್ತನೀಯ ನಿಯೋಜನೆಗಳು |
| **ಸಂರಚನೆ** | ಕ್ಲಿಕ್ ಮೂಲಕ ಪ್ರೊವಿಜನಿಂಗ್ | Bicep ಆಧಾರಿತ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಕೋಡ್ |
| **ಪರಿಸರ ನಿರ್ವಹಣೆ** | ಒಂದೇ ಪರಿಸರಕ್ಕೆ ಕನಸ್ | ಬಹು-ಪರಿಸರ (ಡಿವ್/ಸ್ಟೇಜಿಂಗ್/ಪ್ರೋಡ್) |
| **CI/CD ಸಂಯೋಜನೆ** | ಸೀಮಿತ | ಮೂಲ GitHub Actions ಬೆಂಬಲ |
| **ಖರ್ಚಿನ ನಿರ್ವಹಣೆ** | ಮೂಲಮಟ್ಟದ ನಿಗಾದಾರಿ | ಪರಿಸರ-ವಿಶಿಷ್ಟ ವೆಚ್ಚದ ಅನ್ವಯತೆ |

## ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

- ಸೂಕ್ತ ಅನುಮತಿಗಳೊಂದಿಗೆ Azure ಸಬ್‌ಸ್ಕ್ರಿಪ್ಷನ್
- Azure Developer CLI ಸ್ಥಾಪಿತವಾಗಿದೆ
- Microsoft Foundry Models ಸೇವೆಗಳಿಗೆ ಪ್ರವೇಶ
- Microsoft Foundry ಬಗ್ಗೆ ಮೂಲಭೂತ ಪರಿಚಯ

> **ಪ್ರಸ್ತುತ AZD ಬೇಸ್ಲೈನ್:** ಈ ಉದಾಹರಣೆಗಳನ್ನು `azd` `1.23.12` ಗೆ ಹೋಲಿಸಿ ಪರಿಶೀಲಿಸಲಾಗಿದೆ. AI ಏಜೆಂಟ್ ವರ್ಕ್‌ಫ್ಲೋಗಾಗಿ, ಪ್ರಸ್ತುತ ಪ್ರಿವ್ಯೂ ಎಕ್ಸ್ಟೆನ್ಷನ್ ಬಿಡುಗಡೆ ಬಳಸಿ ಮತ್ತು ನೀವು ಪ್ರಾರಂಭಿಸುವ ಮುನ್ನ ನಿಮ್ಮ ಸ್ಥಾಪಿತ ಆವೃತ್ತಿ ಪರಿಶೀಲಿಸಿ.

## ಕೋರ ಇಂಟಿಗ್ರೇಶನ್ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: Microsoft Foundry Models ಸಚರಿಕೆ

**ಬಳಕೆ ಪ್ರಕರಣ**: Microsoft Foundry Models ಮಾದರಿಗಳನ್ನು ಬಳಸಿ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸಿ

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

**ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ (main.bicep):**
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

### ಮಾದರಿ 2: AI ಶೋಧ ಮತ್ತು RAG ಸಂಯೋಜನೆ

**ಬಳಕೆ ಪ್ರಕರಣ**: ರಿಟ್ರಿವಲ್-ಆಗ್ಮೆಂಟೆಡ್ ಜನರೇಶನ್ (RAG) ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ

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

**ಬಳಕೆ ಪ್ರಕರಣ**: ಡಾಕ್ಯುಮೆಂಟ್ ಪ್ರಕ್ರಿಯೆ ಮತ್ತು ವಿಶ್ಲೇಷಣೆ ವರ್ಕ್‌ಫ್ಲೋಗಳು

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

### ಪರಿಸರ ವ್ಯತ್ಯಯಗಳ ಸೆಟಪ್

**ಉತ್ಪಾದನಾ ಸಂರಚನೆ:**
```bash
# ಕೋರ್ ಏಐ ಸೇವೆಗಳು
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ಮಾದರಿ ಸಂರಚನೆಗಳು
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# ಕಾರ್ಯಕ್ಷಮತೆಗೆ ಸಂಬಂಧಿಸಿದ ಸೆಟ್ಟಿಂಗ್ಸ್
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ವಿಕಸನ ಸಂರಚನೆ:**
```bash
# ಅಭಿವೃದ್ಧಿಗಾಗಿ ವೆಚ್ಚವನ್ನು ಇಳಿಸುವ ಸೆಟ್ಟಿಂಗ್ಸ್
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ಉಚಿತ ತಾಳಿ
```

### ಸಿಕ್ಯೂರ್ ಕೀ ವಾಲ್ಟ್ ಸಂರಚನೆ

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

## ನಿಯೋಜನೆ ವರ್ಕ್‌ಫ್ಲೋಗಳು

### Foundry ಗೆ AZD ಎಕ್ಸ್ಟೆನ್ಷನ್ಗಳು

Microsoft Foundry ಸೇವೆಗಳೊಂದಿಗೆ ಕೆಲಸ ಮಾಡುವ AI-ಸ್ಪೆಸಿಫಿಕ್ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಸೇರಿಸುವ ಎಕ್ಸ್ಟಂಶನ್ಗಳನ್ನು AZD ಒದಗಿಸುತ್ತದೆ:

```bash
# ಫೌಂಡ್ರಿ ಏಜೆಂಟ್ಸ್ ವಿಸ್ತರಣೆ ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.agents

# ಸೂಕ್ಷ್ಮ-ಟ್ಯೂನಿಂಗ್ ವಿಸ್ತರಣೆ ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.finetune

# ಕಸ್ಟಮ್ ಮಾದರಿಗಳ ವಿಸ್ತರಣೆ ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.models

# ಸ್ಥಾಪಿಸಲಾದ ವಿಸ್ತರಣೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd extension list --installed

# ಪ್ರಸ್ತುತ ಸ್ಥಾಪಿತ ಏಜೆಂಟ್ ವಿಸ್ತರಣೆಯ ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd extension show azure.ai.agents
```

AI ಎಕ್ಸ್ಟೆನ್ಷನ್ಗಳು ಇನ್ನೂ ತ್ವರಿತವಾಗಿ ಪ್ರಿವ್ಯೂನಲ್ಲಿ ಮುಂದುವರಿಯುತ್ತಿವೆ. ಯಾವುದೇ ಆಜ್ಞೆ ಇಲ್ಲಿ ತೋರಿಸಿದುದಕ್ಕಿಂತ ಭಿನ್ನವಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸದಿದ್ದರೆ, ಯೋಜನೆಯನ್ನು ತೊಳೆಯುವ ಮೊದಲು ಸಂಬಂಧಿತ ಎಕ್ಸ್ಟೆನ್ಷನ್ ಅನ್ನು ಅಪ್‌ಗ್ರೇಡ್ ಮಾಡಿ.

### `azd ai` ಬಳಸಿ ಏಜೆಂಟ್-ಪೂರ್ವ ನಿಯೋಜನೆ

ನಿಮ್ಮ ಬಳಿ ಏಜೆಂಟ್ ಮ್ಯಾನಿಫೆಸ್ಟ್ ಇದ್ದರೆ, `azd ai agent init` ಅನ್ನು ಬಳಸಿಕೊಂಡು Foundry Agent Service ಗೆ ಸಂಪರ್ಕಿಸಿರುವ ಪ್ರಾಜೆಕ್ಟ್ ಅನ್ನು ಸ್ಕೆಫೋಲ್ಡ್ ಮಾಡು:

```bash
# ಒಂದು ಏಜೆಂಟ್ ಮ್ಯಾನಿಫೆಸ್ಟ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ಆಜುರಿಗೆ ನಿಯೋಜಿಸಿ
azd up
```

ಇತ್ತೀಚಿನ `azure.ai.agents` ಪ್ರಿವ್ಯೂ ಬಿಡುಗಡೆಗಳು `azd ai agent init` ಗೆ ಟೆಂಪ್ಲೇಟು-ಆಧಾರಿತ ಆರಂಭಿಕ ಬೆಂಬಲವನ್ನು ಸೇರಿಸಿದ್ದಾರೆ. ನೀವು ಹೊಸ ಏಜೆಂಟ್ ಉದಾಹರಣೆಗಳನ್ನು ಅನುಸರಿಸುತ್ತಿದ್ದರೆ, ನಿಮ್ಮ ಸ್ಥಾಪಿತ ಆವೃತ್ತಿಯಲ್ಲಿನ ಇಕ್ಕಟ್ಟುಗಳಿಗಾಗಿ ಎಕ್ಸ್ಟೆನ್ಷನ್ ಸಹಾಯವನ್ನು ಪರಿಶೀಲಿಸಿ.

ಪೂರ್ಣ ಆಜ್ಞಾ ಉಲ್ಲೇಖ ಮತ್ತು ಒತ್ತೊಡಕುಗಳಿಗಾಗಿ [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ನೋಡಿ.

### ಏಕ ಆಜ್ಞೆ ನಿಯೋಜನೆ

```bash
# ಒಂದು ಆದೇಶದಿಂದ ಎಲ್ಲವನ್ನು ನಿಯೋಜಿಸಿ
azd up

# ಅಥವಾ ಹಂತ ಹಂತವಾಗಿ ನಿಯೋಜಿಸಿ
azd provision  # ಕೇವಲ ಮೂಲಸೌಕರ್ಯ
azd deploy     # ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್

# azd 1.23.11+ ನಲ್ಲಿ ದೀರ್ಘಾವಧಿ AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗಳಿಗಾಗಿ
azd deploy --timeout 1800
```

### ಪರಿಸರ-ನಿರ್ಧಿಷ್ಟ ನಿಯೋಜನೆಗಳು

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

## ಮನಿಟರಿಂಗ್ ಮತ್ತು ದೃಷ್ಟಿಗೋಚರಿ

### ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಜನರೇಶನ್

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

### ವೆಚ್ಚ ಬಿಪರ್ಯಾಯ

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

### ಮ್ಯಾನೇಜ್ಡ್ ಐಡೆಂಟಿಟಿ ಸಂರಚನೆ

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

## ಪ್ರದರ್ಶನ ಶಿಎಸ್ತಿದ್ದೆствен

### ಕ್ಯಾಶಿಂಗ್ ತಂತ್ರಗಳು

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

### ಸಮಸ್ಯೆ 1: OpenAI ಕೋಟ್ ಪೂರೈಸಿದೆ

**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆ ಕೋಟ್ ದೋಷಗಳೊಂದಿಗೆ ವೈಫಲ್ಯ
- ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳಲ್ಲಿ 429 ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರಸ್ತುತ ಕ್ವೋಟಾ ಬಳಕೆ ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus

# ವಿಭಿನ್ನ ಭಾಗವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ಸಾಮರ್ಥ್ಯವನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಕಡಿಮೆ ಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ಸಮಸ್ಯೆ 2: ಪ್ರಾಮಾಣೀಕರಣ ವಿಫಲತೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- AI ಸೇವೆಗಳಿಗೆ ಕರೆ ಮಾಡಿದಾಗ 401/403 ದೋಷಗಳು
- "ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ" ಸಂದೇಶಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ನಿರ್ವಹಿತ ಗುರುತಿನ ರೂಪರೇಖೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ಕೀ ವಾಲ್ಟ್ ಪ್ರವೇಶವನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ಸಮಸ್ಯೆ 3: ಮಾದರಿ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆಯಲ್ಲಿ ಮಾದರಿಗಳು ಲಭ್ಯವಿಲ್ಲ
- ನಿರ್ದಿಷ್ಟ ಮಾದರಿ ಆವೃತ್ತಿಗಳು ವಿಫಲವಾಗುತ್ತಿವೆ

**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರದ್ದೇಶದ ಪ್ರಕಾರ ಲಭ್ಯವಿರುವ ಮಾದರಿಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡುವುದು
az cognitiveservices model list --location eastus

# ಬೈಸೆಪ್ ಟೆಂಪ್ಲೇಟ್‌ನಲ್ಲಿ ಮಾದರಿ ಆವೃತ್ತಿಯನ್ನು ನವೀಕರಿಸಿ
# ಮಾದರಿ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
```

## ಉದಾಹರಣೆಯ ಟೆಂಪ್ಲೇಟ್ಗಳು

### RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ (Python)

**ರಿಪೊ:** [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ವಿವರಣೆ**: ಅತ್ಯಂತ ಜನಪ್ರಿಯ Azure AI ನಿದರ್ಶನ — ಪ್ರೊಡಕ್ಷನ್-ಸಿದ್ಧ RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಅದು ನಿಮ್ಮ ಸಂಪಾದಿತ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳ ಮೇಲೆ ಪ್ರಶ್ನೆ ಕೇಳಲು ಅವಕಾಶ ನೀಡುತ್ತದೆ. ಚಾಟ್‌ಗೆ GPT-4.1-mini ಬಳಸುತ್ತದೆ, embeddings ಗಾಗಿ text-embedding-3-large ಮತ್ತು retrieval ಗಾಗಿ Azure AI Search ನ್ನು ಬಳಸುತ್ತದೆ. ಬಹುಮಾದರಿ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳು, ಧ್ವನಿ ಇನ್ಪುಟ್/ಔಟ್‌ಪುಟ್, Microsoft Entra ಪ್ರಮಾಣೀಕರಣ ಹಾಗೂ ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಟ್ರೇಸಿಂಗ್ ಬೆಂಬಲಿಸುತ್ತದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ (.NET)

**ರಿಪೊ:** [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ವಿವರಣೆ**: Python RAG ಚಾಟ್ ಉದಾಹರಣೆಯ .NET/C# ಸಮಾನಾರ್ಥಕ. ASP.NET Core Minimal API ಮತ್ತು Blazor WebAssembly ಮುಂದೆಗಿನ ಹಾದಿಯನ್ನು ಬಳಸಿ ನಿರ್ಮಿಸಲಾಗಿದೆ. ಧ್ವನಿ ಚಾಟ್, GPT-4o-mini ದೃಷ್ಠಿ ಬೆಂಬಲ, ಮತ್ತು ಸಹಾಯಕರ .NET MAUI Blazor Hybrid ಡೆಸ್ಕ್‌ಟಾಪ್/ಮೊಬೈಲ್ ಕ್ಲೈಂಟ್ ಅನ್ನು ಒಳಗೊಂಡಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ (Java)

**ರಿಪೊ:** [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ವಿವರಣೆ**: Langchain4J ಬಳಸಿ AI ಸಂಯೋಜನೆಗೆ ಜಾವಾ ಆವೃತ್ತಿ. ಮೈಕ್ರೋಸರ್ವೀಸ್ ಇವೆಂಟ್-ಚಾಲಿತ ವಾಸ್ತುಶಿಲ್ಪ, ಹಲವಾರು ಶೋಧ ತಂತ್ರಗಳು (ಪಠ್ಯ, ವೆಕ್ಟರ್, ಸಂಯೋಜಿತ), ಡಾಕ್ಯುಮೆಂಟ್ ಅಪ್ಲೋಡ್ ಆಜ್‌ಯುರ್ ಡಾಕ್ಯುಮೆಂಟ್ ಇಂಟೆಲಿಜೆನ್ಸ್ ಮೂಲಕ ಮತ್ತು Azure Container Apps ಅಥವಾ Azure Kubernetes Service ಮೇಲೆ ನಿಯೋಜನೆ ಬೆಂಬಲಿಸುತ್ತದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### ಎಂಟರ್ಪ್ರೈಸ್ ರಿಟೇಲ್ ಕೊಪೈಲಟ್ with Azure AI Foundry

**ರಿಪೊ:** [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ವಿವರಣೆ**: Azure AI Foundry ಮತ್ತು Prompty ಉಪಯೋಗಿಸಿದ ಅಂತಿಮ ರಿಟೇಲ್ RAG ಕೊಪೈಲಟ್. Contoso Outdoor ರಿಟೇಲರ್ ಚಾಟ್‌ಬಾಟ್ ಪ್ರೊಡಕ್ಟ್ ಕ್ಯಾಟಲೋಗ್ ಮತ್ತು ಗ್ರಾಹಕ ಆದೇಶ ಡೇಟಾದಲ್ಲಿ ಉತ್ತರಗಳನ್ನು ನೆಲೆಸುತ್ತದೆ. ಸಂಪೂರ್ಣ GenAIOps ವರ್ಕ್‌ಫ್ಲೋ ಪ್ರದರ್ಶಿಸುತ್ತದೆ — Prompty ನೊಂದಿಗೆ ಪ್ರೋಟೋಟೈಪ್, AI ಸಹಾಯಕರಿಂದ ಮೌಲ್ಯಮಾಪನ, ಮತ್ತು AZD ಮೂಲಕ Container Apps ಗೆ ನಿಯೋಜನೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template contoso-chat
azd up
```

### ಸೃಜನಾತ್ಮಕ ಬರವಣಿಗೆ ಮಲ್ಟಿ ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್

**ರಿಪೊ:** [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**ವಿವರಣೆ**: Prompty ಬಳಸಿಕೊಂಡು AI ಏಜೆಂಟ್ ಸಂಯೋಜನೆ ಪ್ರದರ್ಶಿಸುವ ಮಲ್ಟಿ-ಏಜೆಂಟ್ ಉದಾಹರಣೆ. ಸಂಶೋಧನಾ ಏಜೆಂಟ್ (Bing Grounding in Azure AI Agent Service), ಪ್ರೊಡಕ್ಟ್ ಏಜೆಂಟ್ (Azure AI Search), ಲೇಖಕ ಏಜೆಂಟ್ ಮತ್ತು ಸಂಪಾದಕ ಏಜೆಂಟ್ ಕುಟುಂಬ ಕಟ್ಟಿಕೊಟ್ಟು ಉತ್ತಮ ಸಂಶೋಧಿತ ಲೇಖನಗಳನ್ನು ಉತ್ಪಾದಿಸುವುದು. GitHub Actions ನಲ್ಲಿ ಮೌಲ್ಯಮಾಪನೊಂದಿಗೆ CI/CD ಸೇರಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template contoso-creative-writer
azd up
```

### ಸರ್ವರ್‌ಲೆಸ್ RAG ಚಾಟ್ (JavaScript/TypeScript)

**ರಿಪೊ:** [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**ವಿವರಣೆ**: LangChain.js ಬಳಸಿ ಪೂರಕವಾಗಿ ಸರ್ವರ್‌ಲೆಸ್ RAG ಚಾಟ್‌ಬಾಟ್, API ಗಾಗಿ Azure Functions, ಆತಿಥ್ಯಕ್ಕಾಗಿ Azure Static Web Apps. Azure Cosmos DB ಅನ್ನು ವೆಕ್ಟರ್ ಸ್ಟೋರ್ ಮತ್ತು ಚಾಟ್ ಇತಿಹಾಸ ಡೇಟಾಬೇಸ್ ಎರಡಕ್ಕೂ ಬಳಸುತ್ತದೆ. ಶೂನ್ಯ ವೆಚ್ಚದ ಪರೀಕ್ಷೆಗಾಗಿ ಸ್ಥಳೀಯ ಡೆವಲಪ್ಮೆಂಟ್ ಅನ್ನು Ollama ಸಹಾಯ ಮಾಡುತ್ತದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### ನಿಮ್ಮ ಡೇಟಾ ಜೊತೆ ಚಾಟ್ ಪರಿಹಾರ ಅಕ್ಸಿಲಿರೇಟರ್

**ರಿಪೊ:** [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**ವಿವರಣೆ**: ಆಡ್ಮಿನ್ ಪೋರ್ಸಲ್ ಡಾಕ್ಯುಮೆಂಟ್ ಅಪ್ಲೋಡ್/ನಿರ್ವಹಣೆ, Semantic Kernel, LangChain, Prompt Flow ಮತ್ತು ಧ್ವನಿ-ටಿಸಿ ಬೆಂಬಲ, Microsoft Teams ಸಂಯೋಜನೆ, ಜೊತೆಗೆ PostgreSQL ಅಥವಾ Cosmos DB ಬೃಹತ್. ಪ್ರೊಡಕ್ಷನ್ RAG ದೃಶ್ಯಗಳಿಗೆ ಕಸ್ಟಮೈಸ್ ಮಾಡಬಹುದಾದ ಪ್ರಾರಂಭಿಕ ಬಿಂದು.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ಪ್ರವಾಸ ಏಜೆಂಟ್ಸ್ — ಮಲ್ಟಿ ಏಜೆಂಟ್ MCP ಸಂಯೋಜನೆ

**ರಿಪೊ:** [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP ಸರ್ವರ್ಗಳು (.NET, Python, Java, TypeScript)

**ವಿವರಣೆ**: ಮೂರು ಫ್ರೇಮ್‌ವರ್ಕ್‌ಗಳ (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework) ಮೂಲಕ ಮಲ್ಟಿ ಏಜೆಂಟ್ AI ಸಂಯೋಜನೆಗೆ ಉಲ್ಲೇಖ ಅಪ್ಲಿಕೇಶನ್. MCP (ಮಾದರಿ ಸಂಧರ್ಭ ಪ್ರೋಟೋಕಾಲ್) ಸರ್ವರ್‌ಗಳು ನಾಲ್ಕು ಭಾಷೆಗಳಲ್ಲಿ ಸರ್ವರ್‌ಲೆಸ್ Azure Container Apps ಆಗಿ ನಿಯೋಜನೆಯಾಗಿವೆ, OpenTelemetry ನಿಗಾದಾರಿಕೆಯನ್ನು ಹೊಂದಿವೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI ಸ್ಟಾರ್ಟರ್

**ರಿಪೊ:** [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**ಸೇವೆಗಳು**: Azure AI Services + Azure OpenAI

**ವಿವರಣೆ**: ಸೆಟ್ಟಿಂಗ್ ಮಾಡಲಾದ್ಮಾದರಿ ನಿಯೋಜಿಸುವ, ಸರಳ ಬೈಸಪ್ ಟೆಂಪ್ಲೇಟ್. ಸಂಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ಸ್ಟ್ಯಾಕ್ ಇಲ್ಲದೆ ಕೇವಲ Azure AI ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಬೇಕಾದಾಗ ಉಪಯುಕ್ತ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azd-ai-starter
azd up
```

> **ಹೆಚ್ಚು ಟೆಂಪ್ಲೇಟ್ಗಳಿಗೆ**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ಗೆ ಭೇಟಿ ನೀಡಿ, 80+ AI-ನಿರ್ದಿಷ್ಟ AZD ಟೆಂಪ್ಲೇಟ್ಗಳು ವಿವಿಧ ಭಾಷೆಗಳ ಮತ್ತು ದೃಶ್ಯಗಳಿಗಾಗಿ.

## ಮುಂದಿನ ಹಂತಗಳು

1. **ಉದಾಹರಣೆಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ**: ನಿಮ್ಮ ಬಳಕೆ ಪ್ರಕರಣಕ್ಕೆ ಹೊಂದಿಕೆಯಾಗುವ ಪೂರ್ವನಿರ್ಮಿತ ಟೆಂಪ್ಲೇಟು ಆಯ್ಕೆಮಾಡಿ
2. **ನಿಮ್ಮ ಅಗತ್ಯಕ್ಕಾಗಿ ಆಕಾರಣಿಸಿ**: ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್‌ಗಳನ್ನು ಬದಲಿಸಿ
3. **ನಿಗಾದಾರಿಕೆ ಸೇರಿಸಿ**: ಸಮಗ್ರ ದೃಷ್ಟಿಗೋಚರಿ ಅನುಷ್ಠಾನ ಮಾಡಿ
4. **ವೆಚ್ಚವನ್ನು ಸಮರ್ಪಕಗೊಳಿಸಿ**: ನಿಮ್ಮ ಬಜೆಟ್‌ಗೆ ತಕ್ಕಂತೆ ಸಂರಚನೆಗಳನ್ನು ಪರಿಷ್ಕರಿಸಿ
5. **ನಿಮ್ಮ ನಿಯೋಜನೆಯನ್ನು ಸುರಕ್ಷಿಪ್ಪಿಸಿ**: ಎಂಟರ್ಪ್ರೈಸ್ ಭದ್ರತಾ ಮಾದರಿಗಳನ್ನು ಅನುಸರಿಸಿ
6. **ಪ್ರೊಡಕ್ಷನ್‌ಗೆ ವಿಸ್ತಾರಗೊಳಿಸಿ**: ಬಹು ಪ್ರಾಂತ್ಯ ಮತ್ತು ಹೆಚ್ಚಿನ ಲಭ್ಯತೆ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸೇರಿಸಿ

## 🎯 ಕೈಯಿಂದ ಆಚರಣೆಗಳು

### ಅಭ್ಯಾಸ 1: Microsoft Foundry Models ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ (30 ನಿಮಿಷ)
**ಗೋಲು**: ಪ್ರೊಡಕ್ಷನ್-ಸಿದ್ಧ AI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜಿಸು ಮತ್ತು ಪರೀಕ್ಷಿಸು

```bash
# ಟೆಂಪ್ಲೇಟ್ನ್ನು ಆರಂಭಿಸಿ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ಪರಿಸರ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸೆಟ್ ಮಾಡಿ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ನಿಯೋಜಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI ಕಾರ್ಯಾಚರಣೆಗಳನ್ನು ನಿಗಾ ವಹಿಸಿ
azd monitor

# ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ನಿಯೋಜನೆ ಕೋಟ್ ದೋಷ ಇಲ್ಲದೆ ಪೂರ್ಣಗೊಳ್ಳಬೇಕು
- [ ] ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಚಾಟ್ ಇಂಟರ್‌ಫೇಸ್‌ಗೆ ಪ್ರವೇಶ ಇರಬೇಕು
- [ ] ಪ್ರಶ್ನೆಗಳನ್ನು ಕುಡುವುದು ಮತ್ತು AI ಚಾಲಿತ ಉತ್ತರಗಳನ್ನು ಪಡೆಯುವುದು ಸಾಧ್ಯವಾಗಬೇಕು
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ದೂರಸೂಚನೆ ತೋರಿಸಬೇಕು
- [ ] ಸಂಪನ್ಮೂಲಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಸ್ವಚ್ಛಗೊಳಿಸಲಾಗಿದೆ

**ಅಂದಾಜು ವೆಚ್ಚ:** 30 ನಿಮಿಷಗಳ ಪರೀಕ್ಷೆಗೆ $5-10

### ಅಭ್ಯಾಸ 2: ಬಹು-ಮಾದರಿ ನಿಯೋಜನೆ ಸಂರಚಿಸು (45 ನಿಮಿಷ)
**ಗೋಲು**: ವಿಭಿನ್ನ ಸಂರಚನೆಗಳಿಂದ ಹಲವಾರು AI ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸು

```bash
# ಕಸ್ಟಮ್ ಬೈಸೆಪ್ ಕಾನ್ಫಿಗರೇಶನ್ सिर्जಿಸಿ
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

# ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರಿಶೀಲಿಸಿ
azd provision
azd show
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಹಲವಾರು ಮಾದರಿಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲಾಗಿದೆ
- [ ] ವಿಭಿನ್ನ ಸಾಮರ್ಥ್ಯ ಸೆಟ್ಟಿಂಗ್ಗಳು ಲಾಗುಕೊಂಡಿವೆ
- [ ] API ಮೂಲಕ ಮಾದರಿಗಳಿಗೆ ಪ್ರವೇಶ ಇದೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಎರಡೂ ಮಾದರಿಗಳನ್ನು ಕರೆ ಮಾಡಲು ಸಾಧ್ಯವಾಗಿದೆ

### ಅಭ್ಯಾಸ 3: ವೆಚ್ಚ ನಿಗಾದಾರಿಕೆ ಅನುಷ್ಠಾನ (20 ನಿಮಿಷ)
**ಗೋಲು**: ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳು ಮತ್ತು ವೆಚ್ಚ ಟ್ರ್ಯಾಕಿಂಗ್ ಸ್ಥಾಪಿಸು

```bash
# ಬೈಸೆಪ್‌ಗೆ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆ ಸೇರಿಸಿ
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

# ಬಜೆಟ್ ಎಚ್ಚರಿಕೆ ನಿಯೋಜಿಸಿ
azd provision

# ಪ್ರಸ್ತುತ ವೆಚ್ಚಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] Azure ನಲ್ಲಿ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆ ಸೃಷ್ಟಿಸಲಾಗಿದೆ
- [ ] ಇಮೇಲ್ ಸೂಚನೆಗಳು ಸಂರಚಿಸಲಾಗಿದೆ
- [ ] Azure ಪೋರ್ಸಲ್‌ನಲ್ಲಿ ವೆಚ್ಚದ ಮಾಹಿತಿಯನ್ನು ನೋಡಬಹುದು
- [ ] ಬಜೆಟ್ ಮೀರಿದಷ್ಟು ಸರಿಯಾಗಿ ಹೊಂದಿಸಲಾಗಿದೆ

## 💡 ಪ್ರಶ್ನೆಗಳು ಹಾಗೂ ಉತ್ತರಗಳು

<details>
<summary><strong>ನಾನು ಅಭಿವೃದ್ಧಿ ವೇಳೆ Microsoft Foundry Models ವೆಚ್ಚವನ್ನು ಹೇಗೆ ಕಡಿಮೆ ಮಾಡಬಹುದು?</strong></summary>

1. **ಉಚಿತ ಮಟ್ಟವನ್ನು ಬಳಸಿರಿ**: Microsoft Foundry Models ತಿಂಗಳಿಗೆ 50,000 ಟೋಕನ್ಸ್ ಉಚಿತವಾಗಿ ನೀಡುತ್ತದೆ
2. **ಸಾಮರ್ಥ್ಯವನ್ನು ಕಡಿಮೆ ಮಾಡಿ**: ಡಿವ್ ಬಗೆಗಾಗಿ 30+ ಇಲ್ಲದೆ 10 TPM ಗೆ ಕಡಿಮೆ ಮಾಡಿ
3. **azd down ಬಳಸಿ**: ಸಕ್ರಿಯವಾಗಿ ಅಭಿವೃದ್ಧಿ ಮಾಡುತ್ತಿದ್ದಲ್ಲಿ ಅಲ್ಲದಿದ್ದಾಗ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಡೀಅಲೊಕೆಟ್ ಮಾಡಿ
4. **റేడിസ് ಕ್ಯಾಶ್ ಉಪಯೋಗಿಸಿ**: ಮರುಪರೀಕ್ಷಿತ ಪ್ರಶ್ನೆಗಳಿಗೆ Redis ಕ್ಯಾಶ್ ಸ್ಥಾಪನೆ ಮಾಡಿ
5. **ಪ್ರಾಂಪ್ಟ್ ಎಂಜಿನಿಯರಿಂಗ್**: ಕಡಿಮೆ ಟೋಕನ್ಗಳನ್ನು ಬಳಸುವ ಪರಿಣಾಮಕಾರಿ ಪ್ರಾಂಪ್ಟ್‌ಗಳನ್ನು ಬಳಸಿ
```bash
# ಅಭಿವೃದ್ಧಿ ಸಂರಚನೆ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry ಮಾದರಿಗಳು ಮತ್ತು OpenAI API ನಡುವಿನ ವ್ಯತ್ಯಾಸವೇನು?</strong></summary>

**Microsoft Foundry ಮಾದರಿಗಳು**:
- ಎಂಟರ್ಪ್ರೈಸ್ ಭದ್ರತೆ ಮತ್ತು ಅನುಕೂಲತೆ
- ಖಾಸಗಿ ನೆಟ್‌ವರ್ಕ್ ಏಕೀಕರಣ
- SLA ಖಾತರಿಗಳು
- ನಿರ್ವಹಿತ ಗುರುತನದ ಪ್ರಮಾಣೀಕರಣ
- ಹೆಚ್ಚಿನ ಕೋಟಾಗಳು ಲಭ್ಯ

**OpenAI API**:
- ಹೊಸ ಮಾದರಿಗಳಿಗೆ ವೇಗದ ಪ್ರವೇಶ
- ಸರಳ ಸೆಟಪ್
- ಪ್ರವೇಶಕ್ಕೆ ಕಡಿಮೆ ಅಡ್ಡಿ
- ಕೇವಲ ಸಾರ್ವಜನಿಕ ಇಂಟರ್ನೆಟ್

ಉತ್ಪಾದನೆ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ, **Microsoft Foundry ಮಾದರಿಗಳನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ**.
</details>

<details>
<summary><strong>Microsoft Foundry ಮಾದರಿಗಳ ಕೋಟಾ ಮೀರಿದ ದೋಷಗಳನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸುವುದು?</strong></summary>

```bash
# ಪ್ರಸ್ತುತ ಕೋಟಾ ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus2

# ವಿಭಿನ್ನ ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ಸಾಮರ್ಥ್ಯವನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಕಡಿಮೆಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ಕೋಟಾ ವೃದ್ಧಿಯನ್ನು ವಿನಂತಿಸಿ
# ಅಜ್ಯೂರ್ ಪೋರ್ಚಲ್ > ಕೋಟಾಸ್ > ವೃದ್ದಿಗಾಗಿ ವಿನಂತಿ ಮಾಡಿ
```
</details>

<details>
<summary><strong>ನಾನು ನನ್ನ ಸ್ವಂತ ಡೇಟಾವನ್ನು Microsoft Foundry ಮಾದರಿಗಳೊಂದಿಗೆ ಬಳಸಬಹುದೇ?</strong></summary>

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

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ಟೆಂಪ್ಲೇಟನ್ನು ನೋಡಿ.
</details>

<details>
<summary><strong>ನಾನು AI ಮಾದರಿ ಅಂತಿಮ ಸೂಚನೆಗಳನ್ನು ಹೇಗೆ ಭದ್ರಪಡಿಸಬಹುದು?</strong></summary>

**ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು**:
1. ನಿರ್ವಹಿತ ಗುರುತನ ಬಳಸಿರಿ (API ಕೀ ಇಲ್ಲದೆ)
2. ಖಾಸಗಿ ಅಂತಿಮ ಸೂಚನೆಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
3. ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತಾ ಗುಂಪುಗಳನ್ನು ಸಂರಚಿಸಿ
4. ದರ ನಿಯಂತ್ರಣವನ್ನು ಅಳವಡಿಸಿ
5. ರಹಸ್ಯಗಳಿಗೆ Azure Key Vault ಬಳಸಿ

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
- **AZD GitHub**: [ಸಮಸ್ಯೆಗಳು ಮತ್ತು ಚರ್ಚೆಗಳು](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ಅಧಿಕೃತ ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh ನಲ್ಲಿ Microsoft Foundry ನೈಪುಣ್ಯ](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ನಿಮ್ಮ ಸಂಪಾದಕದಲ್ಲಿ `npx skills add microsoft/github-copilot-for-azure` ಮೂಲಕ Azure + Foundry ಏಜೆಂಟ್ ನೈಪುಣ್ಯಗಳನ್ನು ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ

---

**ಅಧ್ಯಾಯ ನಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಮೊದಲ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 1: ನಿಮ್ಮ ಆರಂಭಿಕ ಪ್ರಾಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದಿನದು**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

**ಸಹಾಯ ಬೇಕೇ?** ನಮ್ಮ ಸಮುದಾಯ ಚರ್ಚೆಗಳಲ್ಲಿಗೆ ಸೇರಿ ಅಥವಾ ರೆಪೋದಲ್ಲಿಒಂದು ಆಸಕ್ತಿಯ ವಿಚಾರವನ್ನು ತೆರೆಯಿರಿ. Azure AI + AZD ಸಮುದಾಯ ನಿಮ್ಮ ಯಶಸ್ಸಿಗೆ ಇಲ್ಲಿ ಸಹಾಯ ಮಾಡಲು ಸಿದ್ದವಾಗಿದೆ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ಪಷ್ಟತೆ**:  
ಈ ದಾಖಲೆ AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪುಗಳು ಇರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ತಿಳಿದುಕೊಳ್ಳಿ. ಮೂಲದಹೆಸರು ಭಾಷೆಯಲ್ಲಿ ಇರುವ ಮೂಲ ದಾಖಲೆ ನಂಬಿಕೆಯಾಗುವ ಮೂಲವಾಗಿರಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ生ನುಸರಣೆಯಲ್ಲದ误解ಗಳು ಅಥವಾ ತಪ್ಪಾಗಿದ್ದಾರ್ಥಗಳಿಗಾಗಿ ನಾವು ಹೊಣೆಗಾರರಾಗಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->