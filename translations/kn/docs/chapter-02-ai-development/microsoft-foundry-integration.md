# Microsoft Foundry ಮತ್ತು AZD ಸಮೀಕರಣ

**ಅಧ್ಯಾಯ ನಾವಿಗೇಷನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಪ್ರಥಮ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 1: ನಿಮ್ಮ ಮೊದಲ ಪ್ರೋಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದಿನ**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

## ಅವಲೋಕನ

ಈ ಮಾರ್ಗದರ್ಶನವು Microsoft Foundry ಸೇವೆಗಳನ್ನು Azure Developer CLI (AZD) ಜೊತೆಗೆ ಸ್ಮೂತ್ AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗಾಗಿ ಹೇಗೆ ಸಮೀಕರಿಸಲು ತೋರಿಸುತ್ತದೆ. Microsoft Foundry AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಲು, ನಿಯೋಜಿಸಲು ಮತ್ತು ನಿರ್ವಹಿಸಲು ಸಮಗ್ರ ವೇದಿಕೆಯನ್ನು ಒದಗಿಸುತ್ತದೆ, ಮತ್ತು AZD ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ನಿಯೋಜನೆ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಸರಳಗೊಳಿಸುತ್ತದೆ.

## Microsoft Foundry ಎಂದರೆ ಏನು?

Microsoft Foundry Microsoft ನ ಏಐ ಅಭಿವೃದ್ಧಿಗಾಗಿ ಏಕೀಕೃತ ವೇದಿಕೆ ಇದಾಗಿದ್ದು ಇದರಲ್ಲಿ ಒಳಗೊಂಡಿವೆ:

- **ಮಾದರಿ ಕ್ಯಾಟಲಾಗ್**: ಅತ್ಯಾಧುನಿಕ AI ಮಾದರಿಗಳ ಪ್ರವೇಶ
- **ಪ್ರಾಂಪ್ಟ್ ಫ್ಲೋ**: AI ವರ್ಕ್ಫ್ಲೋಗಳಿಗಾಗಿ ದೃಶ್ಯ ವಿನ್ಯಾಸಕ
- **Microsoft Foundry Portal**: AI ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ ಏಕೀಕೃತ ಅಭಿವೃದ್ಧಿ ವಾತಾವರಣ
- **ನಿಯೋಜನೆ ಆಯ್ಕೆಗಳು**: ಹಲವು ಹೋಸ್ಟಿಂಗ್ ಮತ್ತು ಸ್ಕೇಲಿಂಗ್ ಆಯ್ಕೆಗಳು
- **ಭದ್ರತೆ ಮತ್ತು ಸುರಕ್ಷತೆ**: ನಿರ್ಮಿತ ಜವಾಬ್ದಾರಿಯುತ AI ವೈಶಿಷ್ಟ್ಯಗಳು

## AZD + Microsoft Foundry: ಒಟ್ಟಾಗಿ ಉತ್ತಮ

| ವೈಶಿಷ್ಟ್ಯ | Microsoft Foundry | AZD ಒಕ್ಕೂಟದ ಪ್ರಯೋಜನ |
|---------|-----------------|------------------------|
| **ಮಾದರಿ ನಿಯೋಜನೆ** | ಮ್ಯಾನುಯಲ್ ಪೋರ್ಟಲ್ ನಿಯೋಜನೆ | ಸ್ವಯಂಚಾಲಿತ, ಪುನರಾವರ್ತಿಸಲು ಸಾಧ್ಯವಿರುವ ನಿಯೋಜನೆಗಳು |
| **ಮೂಲಸೌಕರ್ಯ** | ಕ್ಲಿಕ್ ಮೂಲಕ ಪ್ರೊವಿಷನಿಂಗ್ | ಕೋಡ್ ಆಧಾರಿತ ಮೂಲಸೌಕರ್ಯ (Bicep) |
| **ಪರಿಸರ ನಿರ್ವಹಣೆ** | ಒಂದು ಪರಿಸರಕ್ಕೆ ಕೇಂದ್ರೀಕೃತ | ಬಹು-ಪರಿಸರ (dev/staging/prod) |
| **CI/CD ಇಂಟಿಗ್ರೇಷನ್** | ಮಿತವಾಗಿ | ಸಹಜ GitHub Actions ಬೆಂಬಲ |
| **ವೆಚ್ಚ ನಿರ್ವಹಣೆ** | ಮೂಲ ಕ್ಷೇಮ ನೋಟವibration | ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ವೆಚ್ಚ tốiಮೈಸೇಶನ್ |

## ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

- ಸರಿಯಾದ ಅನುಮತಿಗಳೊಂದಿಗೆ Azure subscription
- Azure Developer CLI ಇನ್ಸ್ಟಲ್ಡ್ ಆಗಿರಬೇಕು
- Microsoft Foundry Models ಸೇವೆಗಳಿಗೆ ಪ್ರವೇಶ
- Microsoft Foundry ಬಗ್ಗೆ ಮೂಲ ಪರಿಚಯ

> **ಪ್ರಸ್ತುತ AZD ಆಧಾರರೇಖೆ:** ಈ ಉದಾಹರಣೆಗಳನ್ನು `azd` `1.23.12` ವಿರುದ್ಧ ಪರಿಶೀಲಿಸಲಾಯಿತು. AI ಏಜೆಂಟ್ ವರ್ಕ್ಫ್ಲೋಗೆ, ಪ್ರಾರಂಭಿಸುವ ಮೊದಲು ಪ್ರಿವ್ಯೂ ಎಕ್ಸ್ಟೆನ್ಶನ್‌ನ ಪ್ರಸ್ತುತ ಬಿಡುಗಡೆ ಬಳಸಿ ಮತ್ತು ನಿಮ್ಮ ಇನ್ಸ್ಟಾಲ್ಡ್ ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ.

## ಮುಖ್ಯ ಸಮೀಕರಣ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: Microsoft Foundry Models ಸಮೀಕರಣ

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

### ಮಾದರಿ 2: AI Search + RAG ಸಮೀಕರಣ

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

### ಮಾದರಿ 3: Document Intelligence ಸಮೀಕರಣ

**ಬಳಕೆದಾರ ಪ್ರಕರಣ**: ದಸ್ತಾವೇಜು ಪ್ರಕ್ರಿಯೆ ಮತ್ತು ವಿಶ್ಲೇಷಣೆ ವರ್ಕ್‌ಫ್ಲೋಗಳು

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

### ಪರಿಸರ ಚರಗಳ ಸೆಟ್‌ಅಪ್

**ಉತ್ಪಾದನಾ ಸಂರಚನೆ:**
```bash
# ಮುಖ್ಯ ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆ ಸೇವೆಗಳು
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ಮಾದರಿ ಸಂರಚನೆಗಳು
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# ಕಾರ್ಯಕ್ಷಮತೆ ಹೊಂದಿಕೆಗಳು
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ವಿಕಾಸ ಸಂರಚನೆ:**
```bash
# ವಿಕಾಸಕ್ಕಾಗಿ ವೆಚ್ಚ-ಅನೂಕೂಲಿತ ಹೊಂದಾಣಿಕೆಗಳು
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ಉಚಿತ ಮಟ್ಟ
```

### Key Vault ಮೂಲಕ ಸುರಕ್ಷಿತ ಸಂರಚನೆ

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

## ನಿಯೋಜನೆ કાર્યಪ್ರವಾಹಗಳು

### Foundryಗಾಗಿ AZD ವಿಸ್ತರಣೆಗಳು

AZD Microsoft Foundry ಸೇವೆಗಳಿಗೆ ಕೆಲಸ ಮಾಡುವ AI-ನಿರ್ದಿಷ್ಟ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಸೇರಿಸುವ ವಿಸ್ತರಣೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ:

```bash
# Foundry ಏಜೆಂಟ್‌ಗಳ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.agents

# ಸೂಕ್ಷ್ಮ ಹೊಂದಾಣಿಕೆ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.finetune

# ಕಸ್ಟಮ್ ಮಾದರಿಗಳ ವಿಸ್ತರಣೆಯನ್ನು ಸ್ಥಾಪಿಸಿ
azd extension install azure.ai.models

# ಸ್ಥಾಪಿಸಲಾದ ವಿಸ್ತರಣೆಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
azd extension list --installed

# ಪ್ರಸ್ತುತ ಸ್ಥಾಪಿಸಿರುವ ಏಜೆಂಟ್ ವಿಸ್ತರಣೆಯ ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd extension show azure.ai.agents
```

AI ವಿಸ್ತರಣೆಗಳು ಇನ್ನೂ ಪ್ರಿವ್ಯೂದಲ್ಲಿ ವೇಗವಾಗಿ ಮುಂದುವರಿಸುತ್ತಿವೆ. ಇಲ್ಲಿ ತೋರಿದಂತೆ ಕಮಾಂಡ್ ಬೇರೆಯಾಗಿ ವರ್ತಿಸುತ್ತದೆ ಎನಿಸಿದ್ರೆ, ಪ್ರಾಜೆಕ್ಟ್ ಸಮಸ್ಯೆಯನ್ನು ಜೊತೆಗೆ ತಿದ್ದುಪಡಿ ಮಾಡುವ ಮೊದಲು ಸಂಬಂಧಿತ ವಿಸ್ತಾರವನ್ನು ಅಪ್ಗ್ರೇಡ್ ಮಾಡಿ.

### `azd ai` ಯೊಂದಿಗೆ ಏಜೆಂಟ್-ಪ್ರಥಮ ನಿಯೋಜನೆ

ನಿಮ್ಮ ಬಳಿ ಏಜೆಂಟ್ ಮ್ಯಾನಿಫೆಸ್ಟ್ ಇದ್ದರೆ, Foundry Agent Service ಗೆ ವೈರ್ಡ್ ಮಾಡಲಾದ ಪ್ರಾಜೆಕ್ಟ್ scaffold ಮಾಡುವಂತೆ `azd ai agent init` ಬಳಸಿ:

```bash
# ಏಜೆಂಟ್ ಮ್ಯಾನಿಫೆಸ್ಟ್‌ನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure ಗೆ ನಿಯೋಜಿಸಿ
azd up
```

ಇತ್ತೀಚಿನ ಪ್ರಿವ್ಯೂ ಬಿಡುಗಡೆಗಳು `azure.ai.agents` ಕೂಡ `azd ai agent init`ಿಗಾಗಿ ಟೆಂಪ್ಲೇಟ್ ಆಧಾರಿತ ಇನಿಷಿಯಲೈಸೇಶನ್ ಬೆಂಬಲವನ್ನು ಸೇರಿಸಿವೆ. ನೀವು ಯಾವುದೇ ಹೊಸ ಏಜೆಂಟ್ ಉದಾಹರಣೆಗಳನ್ನು ಅನುಸರಿಸುತ್ತಿದ್ದರೆ, ನಿಮ್ಮ ಇನ್ಸ್ಟಾಲ್ಡ್ ಆವೃತ್ತಿಯಲ್ಲಿ ಲಭ್ಯವಿರುವ ಸರಿಯಾದ ಫ್ಲಾಗ್ಗಳಿಗಾಗಿ ವಿಸ್ತರಣೆ ಸಹಾಯವನ್ನು ಪರಿಶೀಲಿಸಿ.

ಪೂರ್ಣ ಕಮಾಂಡ್ ಉಲ್ಲೇಖ ಮತ್ತು ಫ್ಲಾಗ್ಗಳಿಗಾಗಿ [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ನೋಡಿ.

### ಸಿಂಗಲ್ ಕಮಾಂಡ್ ನಿಯೋಜನೆ

```bash
# ಒಂದು കಮಾಂಡ್‌ನೊಂದಿಗೆ ಎಲ್ಲವನ್ನೂ ಸ್ಥಾಪಿಸಿ
azd up

# ಅಥವಾ ಹಂತ ಹಂತವಾಗಿ ಸ್ಥಾಪಿಸಿ
azd provision  # ಮೂಲಸೌಕರ್ಯ ಮಾತ್ರ
azd deploy     # ಅನ್ವಯಿಕೆ ಮಾತ್ರ

# azd 1.23.11+ ನಲ್ಲಿ ದೀರ್ಘಕಾಲ ಚಾಲನೆಯಲ್ಲಿರುವ AI ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗಳಿಗಾಗಿ
azd deploy --timeout 1800
```

### ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ನಿಯೋಜನೆಗಳು

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

## ಮೇಲ್ವಿಚಾರಣೆ ಮತ್ತು ಅವಲೋಕನ

### Application Insights ಸಮೀಕರಣ

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

### ವೆಚ್ಚ ಮೇಲ್ವಿಚಾರಣೆ

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

## 🔐 ಭದ್ರತಾ ಶ್ರೇಷ್ಠ ಅಭ್ಯಾಸಗಳು

### ನಿರ್ವಹಿತ ಗುರುತು ಸಂರಚನೆ

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

## ಕಾರ್ಯಕ್ಷಮತೆ ಕ್ರಮ

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

### ಸ್ವಯಂಚಾಲಿತ-ಸ್ಕೇಲಿಂಗ್ ಸಂರಚನೆ

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

## ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳ ತಡೆಗುರುತು

### ಸಮಸ್ಯೆ 1: OpenAI ಕ್ವಾಟಾ ಮೀರಿದೆ

**ಲಕ್ಷಣಗಳು:**
- ಕ್ವಾಟಾ ದೋಷಗಳೊಂದಿಗೆ ನಿಯೋಜನೆ ವಿಫಲವಾಗುತ್ತದೆ
- ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳಲ್ಲಿ 429 ದೋಷಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರಸ್ತುತ ಕ್ವೋಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus

# ಬೇರೊಂದು ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ಸಾಮರ್ಥ್ಯವನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಕಡಿಮೆ ಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ಸಮಸ್ಯೆ 2: ಪ್ರಮಾಣೀಕರಣ ವಿಫಲತೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- AI ಸೇವೆಗಳನ್ನು ಕರೆಯುವಾಗ 401/403 ದೋಷಗಳು
- "Access denied" ಸಂದೇಶಗಳು

**ಪರಿಹಾರಗಳು:**
```bash
# ಭೂಮಿಕಾ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ನಿರ್ವಹಿತ ಗುರುತು ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault ಪ್ರವೇಶವನ್ನು ಪರಿಶೀಲಿಸಿ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ಸಮಸ್ಯೆ 3: ಮಾದರಿ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆಯಲ್ಲಿ ಮಾದರಿಗಳು ಲಭ್ಯವಿಲ್ಲ
- ನಿರ್ದಿಷ್ಟ ಮಾದರಿ ಆವೃತ್ತಿಗಳು ವಿಫಲವಾಗುವುದು

**ಪರಿಹಾರಗಳು:**
```bash
# ಪ್ರದೇಶಗಳ ಮೂಲಕ ಲಭ್ಯವಿರುವ ಮಾದರಿಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices model list --location eastus

# bicep ಟೆಂಪ್ಲೇಟಿನಲ್ಲಿ ಮಾದರಿ ಆವೃತ್ತಿಯನ್ನು ನವೀಕರಿಸಿ
# ಮಾದರಿಯ ಸಾಮರ್ಥ್ಯ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
```

## ಉದಾಹರಣೆ ಟೆಂಪ್ಲೇಟುಗಳು

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: ಅತ್ಯಂತ ಜನಪ್ರಿಯ Azure AI ಮಾದರಿ — ನಿಮ್ಮ ಸ್ವಂತ ದಾಖಲೆಗಳ ಮೇಲೆ ಪ್ರಶ್ನೆ ಕೇಳಲು ಅನುಮತಿಸುವ ಉತ್ಪಾದನಾ-ಸಿದ್ಧ RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್. ಚಾಟ್‌ಗೆ GPT-4.1-mini ಬಳಸಿ, embeddings ಗಾಗಿ text-embedding-3-large ಬಳಸುತ್ತದೆ, ಮತ್ತು ಪ್ರಾಪ್ತಿಗೆ Azure AI Search ಬಳಸುತ್ತದೆ. ಬಹುಮೋಧಲದ ದಾಖಲೆಗಳು, ಧ್ವನಿ ಇನ್ಪುಟ್/ಔಟ್‌ಪುಟ್, Microsoft Entra ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು Application Insights ಟ್ರೇಸಿಂಗ್‌ನ್ನು ಬೆಂಬಲಿಸುತ್ತದೆ.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG ಚಾಟ್ ಮಾದರಿಯ .NET/C# ಸಮಾನಾದೃಶ್ಯ. ASP.NET Core Minimal API ಮತ್ತು Blazor WebAssembly ಫ್ರಂಟ್‌ಎಂಡ್‌ನೊಂದಿಗೆ ನಿರ್ಮಿಸಲಾಗಿದೆ. ವಾಯ್ಸ್ ಚಾಟ್, GPT-4o-mini vision ಬೆಂಬಲ ಮತ್ತು ಸಹಾಯಕ .NET MAUI Blazor ಹೈಬ್ರಿಡ್ ಡೆಸ್ಕ್‌ಟಾಪ್/ಮೊಬೈಲ್ ಕ್ಲೈಯೆಂಟ್ ಒಳಗೊಂಡಿದೆ.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Langchain4J ಬಳಸಿ AI ಒರ್ಖೆಸ್ಟ್ರೇಶನ್‌ಗಾಗಿ Java ಆವೃತ್ತಿಯ RAG ಚಾಟ್ ಮಾದರಿ. ಮೈಕ್ರೋಸರ್ವಿಸ್ ಈವೆಂಟ್-ಚಾಲಿತ ಆರ್ಕಿಟೆಕ್ಟ್, ಹಲವು ಶೋಧನ ತಂತ್ರಗಳು (ಟೆಕ್ಸ್ಟ್, ವೆಕ್ಟರ್, ಹೈಬ್ರಿಡ್), Azure Document Intelligence ಮೂಲಕ ದಸ್ತಾವೇಜು ಅಪ್ಲೋಡ್ ಮತ್ತು Azure Container Apps ಅಥವಾ Azure Kubernetes Service ಮೇಲೆ ನಿಯೋಜನೆಗೆ ಬೆಂಬಲ löytyy.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Microsoft Foundry ಮತ್ತು Prompty ಬಳಸಿಕೊಂಡು ಎಂಡ್-ಟು-ಎಂಡ್ ರಿಟೇಲ್ RAG ಕೋಪೈಲಟ್. Contoso Outdoor ರಿಟೇಲರ್ ಚಾಟ್‌ಬಾಟ್ ಇದು, ಉತ್ಪನ್ನ ಕ್ಯಾಟಲॉग ಮತ್ತು ಗ್ರಾಹಕ ಆರ್ಡರ್ ಡೇಟಾದಲ್ಲಿ ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ನೆಲೆಗೊಳಿಸುತ್ತದೆ. ಸಂಪೂರ್ಣ GenAIOps ವರ್ಕ್‌ಫ್ಲೋವನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ — Prompty ನೊಂದಿಗೆ ಪ್ರೋಟೋಟೈಪ್ ಮಾಡಿ, AI-ಸಹಾಯಿತ ಮೌಲ್ಯಮಾಪನಕಾರರೊಂದಿಗೆ ಮೌಲ್ಯಮಾಪನೆ ಮಾಡಿ, ಮತ್ತು AZD ಮುಖೇನ Container Apps ಗೆ ನಿಯೋಜಿಸಿ.

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Prompty ಜೊತೆಗೆ AI ಏಜೆಂಟ್ ಒರ್ಖೆಸ್ಟ್ರೇಶನ್ ತೋರಿಸುವ ಬಹು-ಏಜೆಂಟ್ ಮಾದರಿ. ಸಂಶೋಧನಾ ಏಜೆಂಟ್ (Bing Grounding in Azure AI Agent Service), ಉತ್ಪನ್ನ ಏಜೆಂಟ್ (Azure AI Search), ಬರವಣಿಗೆ ಏಜೆಂಟ್ ಮತ್ತು ಸಂಪಾದಕ ಏಜೆಂಟ್ ಸೇರಿ ಸಮಗ್ರವಾಗಿ ಉತ್ತಮ ಸಂಶೋಧಿತ ಲೇಖನಗಳನ್ನು ಉತ್ಪಾದಿಸಲು ಸಹಕರಿಸುತ್ತವೆ. GitHub Actions ನಲ್ಲಿ ಮೌಲ್ಯಮಾಪನದೊಂದಿಗೆ CI/CD ಅನ್ನು ಒಳಗೊಂಡಿದೆ.

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: LangChain.js ಬಳಸಿ ಸಂಪೂರ್ಣ ಸರ್ವರ್‌ಲೆಸ್ಸ್ RAG ಚಾಟ್‌ಬಾಟ್; API ಗೆ Azure Functions ಮತ್ತು ಹೋಸ್ಟಿಂಗ್‌ಗಾಗಿ Azure Static Web Apps ಬಳಸುತ್ತದೆ. ವೆಕ್ಟರ್ ಸ್ಟೋರ್ ಮತ್ತು ಚಾಟ್ ಇತಿಹಾಸ ಡೇಟಾಬೇಸ್ ಎರಡಕ್ಕೂ Azure Cosmos DB ಅನ್ನು ಬಳಸುತ್ತದೆ. ಜಿರೋ-ವೆಚ್ಚದ ಪರೀಕ್ಷೆಗೆ ಸ್ಥಳೀಯ ವಿಕಸನವನ್ನು Ollama ಮೂಲಕ ಬೆಂಬಲಿಸುತ್ತದೆ.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: ಆಡಳಿತ ಪೋರ್ಟಲ್ನೊಂದಿಗೆ ಎಂಟರ್‌ಪ್ರೈ즈-ಗ್ರೇಡ್ RAG ಪರಿಹಾರವೆನ್ನುವಂತೆ ವಿನ್ಯಾಸಗೊಳಿಸಲಾಗಿದೆ — ದಸ್ತಾವೇಜು ಅಪ್ಲೋಡ್/ನಿರ್ವಹಣೆಗೆ, Semantic Kernel, LangChain, Prompt Flow ರೀತಿ ಹಲವಾರು ಒರ್ಕೆಸ್ಟ್ರೇಟರ್ ಆಯ್ಕೆಗಳಿಗಾಗಿ, ಧ್ವನಿ-ಟು-ಪ್ರಕ್ರಿಯೆ, Microsoft Teams ಎಂಟಿಗ್ರೇಷನ್ ಮತ್ತು PostgreSQL ಅಥವಾ Cosmos DB ಬ್ಯಾಕೆಂಡ್ ಆಯ್ಕೆ. ಉತ್ಪಾದನಾ RAG ದೃಶ್ಯಗಳಿಗೆ ಕಸ್ಟಮೈಸ್ ಆಗಬಹುದಾದ ಪ್ರಾರಂಭಬಿಂದುವಾಗಿ ರೂಪಿಸಲಾಗಿದೆ.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: ಮೂರು ಫ್ರೇಮ್ವರ್ಕ್‌ಗಳು (LangChain.js, LlamaIndex.TS, ಮತ್ತು Microsoft Agent Framework) ಬಳಸಿ ಬಹು-ಏಜೆಂಟ್ AI ಒರ್ಕೆಸ್ಟ್ರೇಶನ್ ಗಾಗಿ ರೆಫರೆನ್ಸ್ ಅಪ್ಲಿಕೇಶನ್. ನಾಲ್ಕು ಭಾಷೆಗಳ MCP (Model Context Protocol) ಸರ್ವರ್‌ಗಳನ್ನು ಸರ್ವರ್‌ಲೆಸ್ Azure Container Apps ಆಗಿ ನಿಯೋಜಿಸಿ OpenTelemetry ಮೇಲ್ವಿಚಾರಣೆಯನ್ನು ಒಳಗೊಂಡಿದೆ.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Azure AI ಸೇವೆಗಳನ್ನು ಕನ್ಫಿಗರ್ ಮಾಡಿದ ಮೆಷಿನ್ ಲರ್ನಿಂಗ್ ಮಾದರಿಗಳೊಂದಿಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಸೂಕ್ಷ್ಮ Bicep ಟೆಂಪ್ಲೇಟ್. ಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ಸ್ಟ್ಯಾಕ್ ಇರದಿರುವಾಗ ಮಾತ್ರ Azure AI ಮೂಲಸೌಕರ್ಯವನ್ನು ಪ್ರೊವಿಷನ್ ಮಾಡಲು લೈಟ್‌ವೇಟ್ ಪ್ರಾರಂಭಬಿಂದುವಾಗಿದೆ.

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **ಹೆಚ್ಚು ಟೆಂಪ್ಲೇಟ್‌ಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ**: 80+ AI-ನಿರ್ದಿಷ್ಟ AZD ಟೆಂಪ್ಲೇಟ್‌ಗಳಿಗಾಗಿ [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ಅನ್ನು ಭೇಟಿ ಮಾಡಿ.

## ಮುಂದಿನ ಹಂತಗಳು

1. **ಉದಾಹರಣೆಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ**: ನಿಮ್ಮ ಬಳಕೆದಾರ ಪ್ರಕರಣಕ್ಕೆ ಹೊಂದಿಕೊಂಡ заранее-ನಿರ್ಮಿತ ಟೆಂಪ್ಲೇಟ್ ಆಯ್ಕೆಮಾಡಿ
2. **ನಿಮ್ಮ ಅಗತ್ಯಕ್ಕಾಗಿ ಕಸ್ಟಮೈಸ್ ಮಾಡಿ**: ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ತಿದ್ದುಪಡಿ ಮಾಡಿ
3. **ಮೀಟರ್ ಸೇರಿಸಿ**: ಸಮಗ್ರ ಅವಲೋಕನವನ್ನು ಅನುಷ್ಠಾನ ಮಾಡಿ
4. **ವೆಚ್ಚಗಳನ್ನು tốiಮೈಸೆ ಮಾಡಿ**: ನಿಮ್ಮ ಬಜೆಟ್‌ಗೆ ಸೂಕ್ತವಾಗಿ ಸಂರಚನೆಗಳನ್ನು ಸುಧಾರಿಸಿ
5. **ನಿಯೋಜನೆಯನ್ನು ಸುರಕ್ಷಿತಗೊಳಿಸಿ**: ಎಂಟರ್‌ಪ್ರೈಸ್ ಭದ್ರತಾ ಪ್ಯಾಟರ್ನ್‌ಗಳನ್ನು ಅನುಸರಿಸಿ
6. **ಉತ್ಪಾದನೆಗೆ ಸ್ಕೇಲ್ ಮಾಡಿ**: ಬಹು- ಪ್ರದೇಶ ಮತ್ತು ಉನ್ನತ ಲಭ್ಯತೆ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸೇರಿಸಿ

## 🎯 ಪ್ರಾಯೋಗಿಕ ಅಭ್ಯಾಸಗಳು

### ಅಭ್ಯಾಸ 1: Microsoft Foundry Models ಚಾಟ್ ಅಪ್ ನಿಯೋಜನೆ (30 ನಿಮಿಷ)
**ಉದ್ದೇಶ**: ಉತ್ಪಾದನಾ-ಸಿದ್ಧ AI ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರೀಕ್ಷೆ ಮಾಡಿ

```bash
# ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸಿ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ಪರಿಸರ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ಅಳವಡಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ಕೃತಕ ಬುದ್ಧಿಮತ್ತೆಯ ಕಾರ್ಯಾಚರಣೆಗಳನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor

# ಶುದ್ಧೀಕರಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಕ್ವಾಟಾ ದೋಷಗಳಿಲ್ಲದೆ ನಿಯೋಜನೆ ಪೂರ್ಣವಾಗುತ್ತದೆ
- [ ] ಬ್ರೌಸರ್‌ನಲ್ಲಿ ಚಾಟ್ ಇಂಟರ್‌ಫೇಸ್‌ಗೆ ಪ್ರವೇಶ ಮಾಡಬಹುದು
- [ ] ಪ್ರಶ್ನೆಗಳು ಕೇಳಿ AI ಚಾಲಿತ ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ಪಡೆಯಬಹುದು
- [ ] Application Insights ಟೆಲಿಮೆಟ್ರಿ ಡೇಟಾವನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] ಸಂಪನ್ಮೂಲಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಅಳಿಸಲಾಗಿದೆ

**ಅಂದಾಜು ವೆಚ್ಚ**: $5-10 30 ನಿಮಿಷದ ಪರೀಕ್ಷೆಗೆ

### ಅಭ್ಯಾಸ 2: ಮಲ್ಟಿ-ಮಾದರಿ ನಿಯೋಜನೆ ಸಂರಚನೆ (45 ನಿಮಿಷ)
**ಉದ್ದೇಶ**: ವಿವಿಧ ಕಾನ್ಫಿಗರೇಷನ್‌ಗಳೊಂದಿಗೆ ಹಲವಾರು AI ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸಿ

```bash
# ಕಸ್ಟಮ್ Bicep ಸಂರಚನೆ ರಚಿಸಿ
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

# ಸ್ಥಾಪಿಸಿ ಮತ್ತು ಪರಿಶೀಲಿಸಿ
azd provision
azd show
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಹಲವಾರು ಮಾದರಿಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] ವಿಭಿನ್ನ ಸಾಮರ್ಥ್ಯ ಸೆಟ್ಟಿಂಗ್‌ಗಳು ಅನ್ವಯಿಸಲಾಗಿದೆ
- [ ] ಮಾದರಿಗಳು API ಮೂಲಕ ಪ್ರಾಪ್ತವಾಗುತ್ತವೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಇಬ್ಬರೂ ಮಾದರಿಗಳನ್ನು ಕರೆಯಬಹುದು

### ಅಭ್ಯಾಸ 3: ವೆಚ್ಚ ಮೇಲ್ವಿಚಾರಣೆ ಜಾರಿಗೆ (20 ನಿಮಿಷ)
**ಉದ್ದೇಶ**: ಬಜೆಟ್ ಅಲರ್ಟ್‌ಗಳು ಮತ್ತು ವೆಚ್ಚ ಟ್ರ್ಯಾಕಿಂಗ್ ಸ್ಥಾಪಿಸಿ

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

# ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಯನ್ನು ಅಳವಡಿಸಿ
azd provision

# ಪ್ರಸ್ತುತ ವೆಚ್ಚಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] Azure ನಲ್ಲಿ ಬಜೆಟ್ ಅಲರ್ಟ್ ರಚಿಸಲಾಗಿದೆ
- [ ] ಇಮೇಲ್ ಸೂಚನೆಗಳು ಕಾಂಫಿಗರ್ ಮಾಡಲಾಗಿದೆ
- [ ] Azure ಪೋೕರ್ಟಲ್‌ನಲ್ಲಿ ವೆಚ್ಚದ ಡೇಟಾವನ್ನು ವೀಕ್ಷಿಸಬಹುದು
- [ ] ಬಜೆಟ್ ಗಡಿ ರೇಖೆಗಳು ಸರಿಯಾಗಿ ಸೆಟ್ ಮಾಡಿರುವುದಾಗಿದೆ

## 💡 ಸಾಮಾನ್ಯವಾಗಿ ಕೇಳಲಾಗುವ ಪ್ರಶ್ನೆಗಳು

<details>
<summary><strong>ವಿಕಸನ ಸಮಯದಲ್ಲಿ Microsoft Foundry Models ವೆಚ್ಚವನ್ನು ಹೇಗೆ ಕಡಿಮೆ ಮಾಡಬಹುದು?</strong></summary>

1. **ಫ್ರೀ ಟಿಯರ್ ಬಳಸಿ**: Microsoft Foundry Models ತಿಂಗಳಿಗೆ 50,000 tokens ಉಚಿತವಾಗಿ ಒದಗಿಸುತ್ತದೆ
2. **ಸಾಮರ್ಥ್ಯ ಕಡಿಮೆ ಮಾಡಿ**: ಡೆವ್‌ಗಾಗಿ 30+ ಬದಲು ಸಾಮರ್ಥ್ಯವನ್ನು 10 TPM ಗೆ ಕಳಮಾಡಿ
3. **azd down ಬಳಸಿ**: ಸಕ್ರಿಯವಾಗಿ ವಿಕಸನದಲ್ಲಿಲ್ಲದಾಗ ಸಂಪನ್ಮೂಲಗಳನ್ನು Deallocate ಮಾಡಿ
4. **ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ಕ್ಯಾಶ್ ಮಾಡಿ**: ಪುನರಾವರ್ತಿತ ಕೇಳಿಕೆಗಳಿಗಾಗಿ Redis ಕ್ಯಾಶ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ
5. **ಪ್ರಾಂಪ್ಟ್ ಎಂಜಿನಿಯರಿಂಗ್ ಬಳಸಿ**: ಪರಿಣಾಮಕಾರಿಯಾದ ಪ್ರಾಂಪ್ಟ್‌ಗಳಿಂದ token ಬಳಕೆಯನ್ನು ಕಡಿಮೆ ಮಾಡಿ

</details>
```bash
# ಅಭಿವೃದ್ಧಿ ಸಂರಚನೆ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models ಮತ್ತು OpenAI API ನಡುವಿನ ವ್ಯತ್ಯಾಸ ಏನು?</strong></summary>

**Microsoft Foundry Models**:
- ಎಂಟರ್‌ಪ್ರೈಸ್ ಭದ್ರತೆ ಮತ್ತು ಅನುಪಾಲನೆ
- ಖಾಸಗಿ ನೆಟ್‌ವರ್ಕ್ ಸಂಯೋಜನೆ
- SLA ಭರವಸೆಗಳು
- Managed Identity ಪ್ರಾಮಾಣೀಕರಣ
- ಹೆಚ್ಚಿನ ಕ್ವೋಟাগಳು ಲಭ್ಯ

**OpenAI API**:
- ಹೊಸ ಮಾದರಿಗಳಿಗೆ ವೇಗವಾಗಿ ಪ್ರವೇಶ
- ಸರಳವಾದ ಸೆಟ್‌ಅಪ್
- ಪ್ರವೇಶಕ್ಕೆ ಕಡಿಮೆ ಅಡ್ಡಿ
- ಸಾರ್ವಜನಿಕ ಇಂಟರ್‌ನೆಟ್ ಮಾತ್ರ

ಉತ್ಪಾದನಾ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗಾಗಿ, **Microsoft Foundry Models ಅನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ**.
</details>

<details>
<summary><strong>Microsoft Foundry Models ಕ್ವೋಟಾ ಮೀರಿದ ದೋಷಗಳನ್ನು ನಾನು ಹೇಗೆ ನಿರ್ವಹಿಸಬೇಕೆ?</strong></summary>

```bash
# ಪ್ರಸ್ತುತ ಕ್ವೋಟಾ ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus2

# ವಿಭಿನ್ನ ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ಸಾಮರ್ಥ್ಯವನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಕಡಿಮೆ ಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ಕ್ವೋಟಾ ಹೆಚ್ಚಿಸಲು ವಿನಂತಿಸಿ
# Azure ಪೋರ್ಟಲ್ > ಕ್ವೋಟಾ > ಹೆಚ್ಚಿಸಲು ವಿನಂತಿ
```
</details>

<details>
<summary><strong>Microsoft Foundry Models ಜೊತೆಗೆ ನನ್ನ ಸ್ವಂತ ಡೇಟಾವನ್ನು ನಾನು ಬಳಸಬಹುದೇ?</strong></summary>

ಹೌದು! RAG (Retrieval Augmented Generation) ಗಾಗಿ **Azure AI Search**ನ್ನು ಬಳಸಿ:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

ಈ [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ಟೆಂಪ್ಲೇಟನ್ನು ನೋಡಿ.
</details>

<details>
<summary><strong>AI ಮಾದರಿ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ನಾನು ಹೇಗೆ ಭದ್ರಪಡಿಸಬಹುದು?</strong></summary>

**ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು**:
1. Managed Identity ಬಳಸಿ (API ಕೀಗಳು ಇಲ್ಲದೆ)
2. ಖಾಸಗಿ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
3. ನೆಟ್‌ವರ್ಕ್ ಸೆಕ್ಯುರಿಟಿ ಗ್ರೂಪ್‌ಗಳನ್ನು ಸಂರಚಿಸಿ
4. ರೇಟ್-ಲಿಮಿಟಿಂಗ್ ಅನ್ನು ಜಾರಿಗೆ ತರುವಂತೆ ಮಾಡಿ
5. ರಹಸ್ಯಗಳಿಗಾಗಿ Azure Key Vault ಅನ್ನು ಬಳಸಿರಿ

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
- **AZD GitHub**: [ಇಶ್ಯೂಗಳು ಮತ್ತು ಚರ್ಚೆಗಳು](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ಅಧಿಕೃತ ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ನಿಮ್ಮ ಸಂಪಾದಕದಲ್ಲಿ Azure + Foundry ಏಜೆಂಟ್ ಕೌಶಲ್ಯಗಳನ್ನು ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಲು `npx skills add microsoft/github-copilot-for-azure` ಬಳಸಿ

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: Chapter 2 - AI-First Development
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದಿನ**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**ಸಹಾಯ ಬೇಕೆ?** ನಮ್ಮ ಸಮುದಾಯ ಚರ್ಚೆಗಳಲ್ಲಿ ಸೇರಿ ಅಥವಾ ರೆಪೊಸಿಟರಿಯಲ್ಲಿ ಒಂದು ಇಶ್ಯೂ ತೆರೆಯಿರಿ. Azure AI + AZD ಸಮುದಾಯವು ನಿಮ್ಮ ಯಶಸ್ಸಿಗೆ ಸಹಾಯ ಮಾಡಲು ಇಲ್ಲಿ ಇದೆ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->