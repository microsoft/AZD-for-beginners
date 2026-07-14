# ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಇಂಟಿಗ್ರೇಷನ್ ಎಜಿಡಿ ಜೊತೆ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆರಂಭಿಕರಿಗೆ ಎಜಿಡಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - ಎಐ-ಫಸ್ಟ್ ಡೆವಲಪ್ಮೆಂಟ್
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 1: ನಿಮ್ಮ ಮೊದಲ ಯೋಜನೆ](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದೆ**: [ಎಐ ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

## ಅವಲೋಕನ

ಈ ಮಾರ್ಗದರ್ಶಿ ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಸೆಂಕೆಗಳು ಎಜ್ಯುರ್ ಡೆವಲಪರ್ ಸಿಎಲ್‌ಐ (AZD) ಜತೆ ಹೇಗೆ ಏಕತಾಡಿಸಲು ಮತ್ತು ಎಐ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗಳನ್ನು ಸರಳಗೊಳಿಸಲು ತೋರಿಸುತ್ತದೆ. ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಎಐ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸುವುದು, ನಿಯೋಜಿಸುವುದು ಮತ್ತು ನಿರ್ವಹಿಸುವುದಕ್ಕೆ ಸಮಗ್ರ ವೇದಿಕೆಯನ್ನೂ ಒದಗಿಸುತ್ತದೆ, ಆದಾಗ್ಯೂ AZD ಮೂಲಭೂತ ವ್ಯವಸ್ಥೆ ಮತ್ತು ನಿಯೋಜನೆ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಸರಳಗೊಳಿಸುತ್ತದೆ.

## ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಎಂದರೇನು?

ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಎಐ ಅಭಿವೃದ್ಧಿಗೆ ಇರುವ ಮೈಕ್ರೋಸಾಫ್ಟ್‌ನ ಏಕೀಕೃತ ವೇದಿಕೆಯಾಗಿದೆ, ಇದರಲ್ಲಿ ವಿವರಗಳು ಇವೆ:

- **ಮಾದರಿ ಕ್ಯಾಲೋಗ್**: ಅತ್ಯಾಧುನಿಕ ಎಐ ಮಾದರಿಗಳ ಪ್ರವೇಶ
- **ಪ್ರಾಂಪ್ಟ್ ಫ್ಲೋ**: ಎಐ ಕಾರ್ಯಪ್ರವಾಹಗಳ ದೃಶ್ಯ ವಿನ್ಯಾಸಕ
- **ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಪೋರ್ಟಲ್**: ಏಕೀಕೃತ ಅಭಿವೃದ್ಧಿ ಪರಿಸರ ಎಐ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ
- **ನಿಯೋಜನೆ ಆಯ್ಕೆಗಳು**: ಬಹುತೆಕ ಹೋಸ್ಟಿಂಗ್ ಮತ್ತು масштаб ಆಯ್ಕೆಗಳು
- **ಭದ್ರತೆ ಮತ್ತು ಸುರಕ್ಷತೆ**: ಒಳ ನಾಟಿ ಜವಾಬ್ದಾರಿ ಎಐ ವೈಶಿಷ್ಟ್ಯಗಳು

## AZD + ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ: ಒಟ್ಟಿಗೆ ಉತ್ತಮ

| ವೈಶಿಷ್ಟ್ಯ | ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ | AZD ಏಕತಾಡಿಸುವ ಲಾಭ |
|---------|-----------------|------------------------|
| **ಮಾದರಿ ನಿಯೋಜನೆ** | ಕೈಯಿಂದ ಪೋರ್ಟಲ್ ನಿಯೋಜನೆ | ಸ್ವಯಂಚಾಲಿತ, ಪುನರಾವರ್ತನೆ ನಿಯೋಜನೆಗಳು |
| **ಮೂಲಭೂತ ವ್ಯವಸ್ಥೆ** | ಕ್ಲಿಕ್-ತ್ರೂ ಪ್ರೊವಿಷನಿಂಗ್ | ಮೂಲಭೂತ ವ್ಯವಸ್ಥೆ ಎಂಬ ಕೋಡ್ (ಬೈಸಪ್) |
| **ಪರಿಸರ ನಿರ್ವಹಣೆ** | ಏಕ ಪರಿಸರ ತೀರ್ಮಾನ | ಬಹು-ಪರಿಸರ (ಡೆವ್/ಸ್ಟೇಜಿಂಗ್/ಪ್ರೊಡ್) |
| **ಸಿ.ಐ./ಸಿ.ಡಿ ಏಕತೆ** | ಸೀಮಿತ | ನಿವಾಸಿ GitHub ಕ್ರಿಯೆಗಳ ಬೆಂಬಲ |
| **ವೆಚ್ಚ ನಿರ್ವಹಣೆ** | ಮೂಲಮಟ್ಟದ ಮಾನಿಟರಿಂಗ್ | ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ವೆಚ್ಚ ವ್ಯವಹಾರಿಕೆಯು |

## ಪೂರ್ವಾಪೇಕ್ಷೆಗಳು

- ಸೂಕ್ತ ಅನುಮತಿಗಳೊಂದಿಗೆ ಎಜ್ಯುರ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್
- ಎಜ್ಯುರ್ ಡೆವಲಪರ್ CLI ಸ್ಥಾಪಿತವಾಗಿದೆ
- ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಮಾದರಿ ಸೇವೆಗಳಿಗೆ ಪ್ರವೇಶ
- ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಬಗ್ಗೆ ಮೂಲ ಪರಿಚಯ

> **ಪ್ರಸ್ತುತ AZD ಆಧಾರ:** ಈ ಉದಾಹರಣೆಗಳನ್ನು `azd` `1.27.1` ವಿರುದ್ಧ ಪರಿಶೀಲಿಸಲಾಗಿದೆ. AI ಏಜೆಂಟ್ ಕಾರ್ಯಪ್ರವಾಹಕ್ಕಾಗಿ, ಪ್ರಸ್ತುತ ಪೂರ್ವವೀಕ್ಷಣೆ ವಿಸ್ತರಣೆ ಬಿಡುಗಡೆ ಬಳಸಿ ಮತ್ತು ನೀವು ಪ್ರಾರಂಭಿಸುವ ಮೊದಲು ನಿಮ್ಮ ಸ್ಥಾಪಿತ ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ.

## ಮೂಲ ಏಕತಾಡಿಸುವ ಮಾದರಿಗಳು

### ಮಾದರಿ 1: ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಮಾದರಿ ಏಕತಾಡಿಸುವಿಕೆ

**ಬಳಕೆಯು**: ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಮಾದರಿಗಳೊಂದಿಗೆ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವುದು

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

**ಮೂಲಭೂತ ವ್ಯವಸ್ಥೆ (main.bicep):**
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

### ಮಾದರಿ 2: ಎಐ ಶೋಧ + RAG ಏಕತಾಡಿಸುವಿಕೆ

**ಬಳಕೆಯು**: ರಿಟ್ರಿವಲ್-ಆಗ್ಮೆಂಟೆಡ್ ಜನರೇಶನ್ (RAG) ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವುದು

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

### ಮಾದರಿ 3: ಡಾಕ್ಯುಮೆಂಟ್ ಇಂಟೆಲಿಜೆನ್ಸ್ ಏಕತಾಡಿಸುವಿಕೆ

**ಬಳಕೆಯು**: ಡಾಕ್ಯುಮೆಂಟ್ ಪ್ರೊಸೆಸಿಂಗ್ ಮತ್ತು ವಿಶ್ಲೇಷಣೆ ಕಾರ್ಯಪ್ರವಾಹಗಳು

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

### ಪರಿಸರ ವ್ಯತ್ಯಾಸಗಳ ಸ್ಥಾಪನೆ

**ಉತ್ಪಾದನಾ ಸಂರಚನೆ:**
```bash
# ಕೋರ್ AI ಸೇವೆಗಳು
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ಮಾದರಿ ರೂಪರೇಖೆಗಳು
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# ಕಾರ್ಯಕ್ಷಮತಾ ಸೆಟ್ಟಿಂಗ್ಗಳು
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ವಿಕಾಸ ಸಂರಚನೆ:**
```bash
# ಅಭಿವೃದ್ಧಿಗಾಗಿ ವೆಚ್ಚ-ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿದ ಸೆಟ್ಟಿಂಗ್ಸ್
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ಉಚಿತಸ್ತರ
```

### ಕೀ ವಾಲ್ಟ್ ಸಹಿತ ಸುರಕ್ಷಿತ ಸಂರಚನೆ

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

## ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳು

### ಫೌಂಡ್ರಿ ನಿಬ್ಬರಿ ಹೆಚ್ಚಳಗಳು AZDಗೆ

ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಸೆಂಕೆಗಳು ಜೊತೆ ಕೆಲಸ ಮಾಡಲು ಎಐ-ನಿರ್ದಿಷ್ಟ ಸಾಮರ್ಥ್ಯಗಳನ್ನು ಸೇರ್ಪಡೆಗೊಳಿಸುವ ನಿಬ್ಬರಿಗಳು AZD ಒದಗಿಸುತ್ತದೆ:

```bash
# ಫೌಂಡ್ರಿ ಏಜೆಂಟ್ಸ್ ಎಕ್ಸ್ಟೆನ್ಷನ್ ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ
azd extension install azure.ai.agents

# ಫೈನ್-ಟ್ಯೂನಿಂಗ್ ಎಕ್ಸ್ಟೆನ್ಷನ್ ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ
azd extension install azure.ai.finetune

# ಕಸ್ಟಮ್ ಮಾದರಿಗಳು ಎಕ್ಸ್ಟೆನ್ಷನ್ ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿ
azd extension install azure.ai.models

# ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಿದ ಎಕ್ಸ್ಟೆನ್ಷನೆಗಳ ಪಟ್ಟಿಯನ್ನು ತೋರಿಸಿ
azd extension list --installed

# ಪ್ರಸ್ತುತ ಇನ್‌ಸ್ಟಾಲ್ ಮಾಡಲಾದ ಏಜೆಂಟ್ ಎಕ್ಸ್ಟೆನ್ಷನ್ ಆವೃತ್ತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd extension show azure.ai.agents
```

ಎಐ ನಿಬ್ಬರಿಗಳು ಪದ್ಧತಿಯ ಪ್ರಾಥಮಿಕ ಸಮೀಕ್ಷೆಯಲ್ಲಿ ಇನ್ನೂ ವೇಗವಾಗಿ ಬದಲಾಗುತ್ತಿವೆ. ಘಟಕವು ಇಲ್ಲಿ ತೋರಿಸಿದಂತೆ ವಿಭಿನ್ನವಾಗಿ ನಡೆದುಕೊಂಡರೆ, ಪ್ರಾಜೆಕ್ಟ್‌ಗೆ ತೊಂದರೆ ನಿವಾರಣೆಗೆ ಮೊದಲು ಸಂಬಂಧಿತ ವಿಸ್ತರಣೆಗಳನ್ನು ನವೀಕರಿಸಿ.

### `azd ai` ಜೊತೆ ಏಜೆಂಟ್-ಫಸ್ಟ್ ನಿಯೋಜನೆ

ನಿಮ್ಮ ಬಳಿ ಏಜೆಂಟ್ ಮ್ಯಾನಿಫೆಸ್ಟ್ ಇದ್ದರೆ, `azd ai agent init` ಬಳಸಿ ಫೌಂಡ್ರಿ ಏಜೆಂಟ್ ಸೇವೆಗೆ ಸಂಪರ್ಕ ಹೊಂದಿದ ಪ್ರಾಜೆಕ್ಟ್ ರಚಿಸಿ:

```bash
# ಏಜೆಂಟ್ ಮಾನಿಫೆಸ್ಟ್‍ನಿಂದ ಪ್ರಾರಂಭಿಸಿ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ಆಜೂರ್‍ಗೆ ನಿಯೋಜಿಸಿ
azd up
```

`azure.ai.agents` ಇತ್ತೀಚಿನ ಪೂರ್ವವೀಕ್ಷಣೆ ಬಿಡುಗಡೆಗಳು `azd ai agent init` ಗಾಗಿ ಟೆಂಪ್ಲೇಟ್ ಆಧಾರಿತ ಪ್ರಾರಂಭ ಬೆಂಬಲವನ್ನು ಸೇರಿಸಿವೆ. ನೀವು ಹೊಸ ಏಜೆಂಟ್ ಮಾದರಿಗಳನ್ನು ಅನುಸರಿಸುತ್ತಿದ್ದರೆ, ನಿಮ್ಮ ಸ್ಥಾಪಿತ ಆವೃತ್ತಿಯಲ್ಲಿರುವ ನಿಖರ ಫ್ಲಾಗ್ಗಳನ್ನು ವಿಸ್ತರಣೆ ಸಹಾಯದಿಂದ ಪರಿಶೀಲಿಸಿ.

[AZD AI CLI ಆಜ್ಞೆಗಳು](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ಸಂಪೂರ್ಣ ಆಜ್ಞೆ ಸೂಚನೆಗಳಿಗಾಗಿ ನೋಡಿ.

### ಏಕ ಆಜ್ಞೆಯ ನಿಯೋಜನೆ

```bash
# ಎಲ್ಲವನ್ನೂ ಒಂದು ಆಜ್ಞೆಯಿಂದ ನಿಯೋಜಿಸಿ
azd up

# ಅಥವಾ ಕ್ರಮವಾಗಿ ನಿಯೋಜಿಸಿ
azd provision  # ಮೂಲಸೌಕರ್ಯ ಮಾತ್ರ
azd deploy     # ಅಪ್ಲಿಕೇಶನ್ ಮಾತ್ರ

# azd 1.23.11+ ಯಲ್ಲಿನ ದೀರ್ಘಕಾಲಿಕ AI ಅಪ्लಿಕೇಶನ್ ನಿಯೋಜನೆಗಳಿಗೆ
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

## ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಗಮನಾರ್ಹತೆ

### ಅಪ್ಲಿಕೇಶನ್ ಇನ್‌ಸೈಟ್ಸ್ ಏಕತಾಡಿಸುವಿಕೆ

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

### ವೆಚ್ಚ ಮಾನಿಟರಿಂಗ್

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

## 🔐 ಸುರಕ್ಷತಾ ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

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

### ನೆಟ್‌ವರ್ಕ್ ಸುರಕ್ಷತೆ

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

## ಕಾರ್ಯಕ್ಷಮತೆ ಸುಧಾರಣೆ

### ಕ್ಯಾಸಿಂಗ್ ತಂತ್ರಗಳು

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

### ಸ್ವಯಂ-ಮಾಪನ ಸಂರಚನೆ

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

### ಸಮಸ್ಯೆ 1: ಓಪನ್‌ಎಐ ಕೋಟಾ ಮೀರಿದೆ

**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆ ಕೋಟಾ ದೋಷಗಳೊಂದಿಗೆ ವಿಫಲವಾಗುತ್ತದೆ
- ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳಲ್ಲಿ 429 ದೋಷಗಳು

**ಗಮನಿಕಗಳು:**
```bash
# ಪ್ರಸ್ತುತ ಕ್ವೋಟಾ ಬಳಕೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus

# ವಿಭಿನ್ನ ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ಸಾಂಕ್ರಾಮಿಕವಾಗಿ ಸಾಮರ್ಥ್ಯವನ್ನು ಕಡಿಮೆ ಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ಸಮಸ್ಯೆ 2: ಪ್ರಮಾಣೀಕರಣ ವಿಫಲತೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- AI ಸೇವೆಗಳನ್ನು ಕರೆಸುವಾಗ 401/403 ದೋಷಗಳು
- "ಪ್ರವೇಶ ನಿರಾಕರಿಸಲಾಗಿದೆ" ಸಂದೇಶಗಳು

**ಗಮನಿಕಗಳು:**
```bash
# ಪಾತ್ರ ನಿಯೋಜನೆಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ಕೀ ವಾಲ್ಟ್ ಪ್ರವೇಶವನ್ನು ಮಾನ್ಯ ಮಾಡಿ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ಸಮಸ್ಯೆ 3: ಮಾದರಿ ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳು

**ಲಕ್ಷಣಗಳು:**
- ನಿಯೋಜನೆಗೆ ಮಾದರಿಗಳು ಲಭ್ಯವಿಲ್ಲ
- ನಿರ್ದಿಷ್ಟ ಮಾದರಿ ಆವೃತ್ತಿಗಳು ವಿಫಲವಾಗುತ್ತಿವೆ

**ಗಮನಿಕಗಳು:**
```bash
# ಪ್ರದೇಶದ ಆಧಾರದ ಮೇಲೆ ಲಭ್ಯವಿರುವ ಮಾದರಿಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ
az cognitiveservices model list --location eastus

# ಬೈಸೆಪ ರಚನೆಯಲ್ಲಿ ಮಾದರಿ ಆವೃತ್ತಿಯನ್ನು ನವೀಕರಿಸಿ
# ಮಾದರಿ ಸಾಮರ್ಥ್ಯದ ಅಗತ್ಯಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
```

## ಉದಾಹರಣೆ ಟೆಂಪ್ಲೇಟುಗಳು

### RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ (Python)

**Repositories**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**ವಿವರಣೆ**: ಅತ್ಯಂತ ಜನಪ್ರಿಯ ಏಜ್ಯುರ್ ಎಐ ಮಾದರಿ — ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್, ಇದು ನಿಮ್ಮ ಸ್ವಂತ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳ ಮೇಲೆ ಪ್ರಶ್ನೆಗಳನ್ನೂ ಕೇಳಲು ಅನುಮತಿಸುತ್ತದೆ. ಚಾಟ್‌ಗಾಗಿ GPT-4.1-mini, ಎಂಬರ್‌ಡಿಂಗ್‌ಗಳಿಗಾಗಿ text-embedding-3-large ಮತ್ತು ರಿಟ್ರೀವಲ್‌ಗಾಗಿ Azure AI Search ಬಳಕೆ ಮಾಡುತ್ತದೆ. ಬಹುಮಾಧ್ಯಮ ಡಾಕ್ಯುಮೆಂಟ್‌ಗಳು, ಮಾತಿನ ಇನ್ಪುಟ್/ಔಟ್‌ಪುಟ್, ಮೈಕ್ರೋಸಾಫ್ಟ್ ಎಂಟ್ರಾ ಪ್ರಮಾಣೀಕರಣ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಟ್ರೇಸಿಂಗ್‌ಗೆ ಬೆಂಬಲ ನೀಡುತ್ತದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ (.NET)

**Repositories**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**ವಿವರಣೆ**: Python RAG ಚಾಟ್ ಮಾದರಿಯ .NET/C# ಸಮಾನ. ASP.NET ಕೋರ್ ಮಿನಿಮಲ್ API ಮತ್ತು Blazor WebAssembly ಫ್ರಂಟ್‌ಎಂಡ್ ಬಳಸಿ ನಿರ್ಮಿಸಲಾಗಿದೆ. ವಾಯ್ಸ್ ಚಾಟ್, GPT-4o-mini ದೃಷ್ಟಿ ಬೆಂಬಲ ಮತ್ತು ಜೊತೆಯಾಗಿ .NET MAUI Blazor ಹೈಬ್ರಿಡ್ ಡೆಸ್ಕ್‌ಟಾಪ್/ಮೊಬೈಲ್ ಕ್ಲಯಿಂಟ್ ಸೇರಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ (Java)

**Repositories**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**ವಿವರಣೆ**: Langchain4J ಬಳಸಿಕೊಂಡು ಎಐ ಸಂಯೋಜನೆಗಾಗಿ ಜಾವಾ ಆವೃತ್ತಿ RAG ಚಾಟ್ ಮಾದರಿ. ಮೈಕ್ರೋಸರ್ವಿಸ್ ಈವೆಂಟ್-ಚಾಲಿತ ವಾಸ್ತುಶಿಲ್ಪ, ಬಹುಶಃ ಶೋಧ ತಂತ್ರಗಳು (ಪಠ್ಯ, ವెక్టర్, ಸಂಯುಕ್ತ), ಡಾಕ್ಯುಮೆಂಟ್ ಅಪ್‌ಲೋಡ್ Azure ಡಾಕ್ಯುಮೆಂಟ್ ಇಂಟೆಲಿಜೆನ್ಸ್ ಸಹಿತ, ಮತ್ತು ನಿಯೋಜನೆ Azure ಕಂಟೇನರ್ ಅಪ್ಸ್ ಅಥವಾ Azure ಕುಬರ್‌ನೆಟಿಸ್ ಸೇವೆ ಮೇಲೆ ಮಾಡೋದು.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### ಉದ್ಯಮ ರೀಟೈಲ್ ಸಹಚರ ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಜೊತೆ

**Repositories**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ಸೇವೆಗಳು**: Azure OpenAI + ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**ವಿವರಣೆ**: ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಮತ್ತು Prompty ಬಳಸಿ ಸಲ್ಲಿಸಲಾದ ಅಂತ್ಯ-ಸಮಕದ ರೀಟೈಲ್ RAG ಸಹಚರ. ಒಂದು Contoso ಬಾಹ್ಯ ಪ್ರದೇಶ ರೀಟೈಲರ್ ಚಾಟ್‌ಬಾಟ್, ಇದು ಉತ್ಪನ್ನ ಕ್ಯಾಟಲೋಗ್ ಮತ್ತು ಗ್ರಾಹಕ ಆದೇಶ ಡೇಟಾದಲ್ಲಿ ಉತ್ತರಗಳನ್ನು ಆಧಾರಿತವಾಗಿಸುತ್ತದೆ. ಸಂಪೂರ್ಣ GenAIOps ಕಾರ್ಯಪದ್ಧತಿಯನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ - Prompty ಸಹಿತ ಪ್ರೋಟೋಟೈಪ್, ಎಐ ಸಹಾಯಿತ ಮೌಲ್ಯಮಾಪನಗಳೊಂದಿಗೆ ಮೌಲ್ಯಮಾಪನ, ಮತ್ತು AZD ಮೂಲಕ ಕಂಟೇನರ್ ಅಪ್ಸ್‌ಗೆ ನಿಯೋಜನೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template contoso-chat
azd up
```

### ಸೃಜನಾತ್ಮಕ लेखನ ಬಹು-ಏಜೆಂಟ್ ಅಪ್ಲಿಕೇಶನ್

**Repositories**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI ಏಜೆಂಟ್ ಸೇವೆ + Bing ಗ್ರೌಂಡಿಂಗ್ + Azure AI Search + Azure Container Apps

**ವಿವರಣೆ**: Prompty ಬಳಸಿ ಎಐ ಏಜೆಂಟ್ ಸಂಯೋಜನೆ ಪ್ರದರ್ಶಿಸುವ ಬಹುಏಜೆಂಟ್ ಮಾದರಿ. ಸಂಶೋಧನೆ ಏಜೆಂಟ್ (Bing ಗ್ರೌಂಡಿಂಗ್ Azure AI ಏಜೆಂಟ್ ಸೇವೆಯಲ್ಲಿ), ಉತ್ಪನ್ನ ಏಜೆಂಟ್ (Azure AI Search), ಲೇಖಕ ಏಜೆಂಟ್ ಮತ್ತು ಸಂಪಾದಕ ಏಜೆಂಟ್ ಸೇರಿ ಸಹಕಾರಿಯಾಗಿ ಉತ್ತಮ ಸಂಶೋಧಿತ ಲೇಖನಗಳನ್ನು ಸೃಷ್ಟಿಸುತ್ತದೆ. GitHub ಕ್ರಿಯೆಗಳಲ್ಲಿ ಮೌಲ್ಯಮಾಪನದೊಂದಿಗೆ ಸಿಐ/ಸಿ.ಡಿ ಸೇರಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template contoso-creative-writer
azd up
```

### ಸರ್ವರ್‌ಲೆಸ್ RAG ಚಾಟ್ (JavaScript/TypeScript)

**Repositories**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**ವಿವರಣೆ**: LangChain.js ಉಪಯೋಗಿಸಿ ಸಂಪೂರ್ಣ ಸರ್ವರ್‌ಲೆಸ್ಸ್ RAG ಚಾಟ್‌ಬಾಟ್, APIಗಾಗಿ Azure Functions ಮತ್ತು ಹೋಸ್ಟಿಂಗ್ಗಾಗಿ Azure Static Web Apps ಬಳಕೆ ಮಾಡುತ್ತದೆ. Azure Cosmos DB ಅನ್ನು ವેક્ટರ್ ಸ್ಟೋರ್ ಮತ್ತು ಚಾಟ್ ಇತಿಹಾಸ ಡೇಟಾಬೇಸ್ ಎರಡೂ ಆಗಿ ಬಳಕೆ ಮಾಡುತ್ತದೆ. ಹಲವಾರು ಸಂದರ್ಭಗಳಿಗಾಗಿ ಶೂನ್ಯ ವೆಚ್ಚದ ಪರೀಕ್ಷೆಗೆ local developmentಗೆ Ollama ಬೆಂಬಲಿಸುತ್ತದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### ನಿಮ್ಮ ಡೇಟಾ ಜೊತೆಗೆ ಚಾಟ್ ಯೋಜನೆ ವೇಗವರ್ಧಕ

**Repositories**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**ಸೇವೆಗಳು**: Azure OpenAI + Azure AI Search + Azure App Service + Azure ಡಾಕ್ಯುಮೆಂಟ್ ಇಂಟೆಲಿಜೆನ್ಸ್ + Azure Functions + Azure Cosmos DB / PostgreSQL

**ವಿವರಣೆ**: ಡಾಕ್ಯುಮೆಂಟ್ ಅಪ್ಲೋಡ್/ನಿರ್ವಹಣೆಗಾಗಿ ಆಡ್ಮಿನ್ ಪೋರ್ಟಲಿನೊಂದಿಗೆ ಎಂಟರ್ಪ್ರೈಸ್-ಗ್ರೇಡ್ RAG ಪರಿಹಾರ ವೇगವರ್ಧಕ. ಹಲವು ಸಂಯೋಜಕ ಆಯ್ಕೆಗಳು (ಸೆಮ್ಯಾಂಟಿಕ್ ಕರ್ಣೆಲ್, ಲಾಂಗ್‌ಚೈನ್, ಪ್ರಾಂಪ್ಟ್ ಫ್ಲೋ), ಮಾತು-ಪಠ್ಯ, ಮೈಕ್ರೋಸಾಫ್ಟ್ ಟೀಮ್‌ಗಳ ಏಕತೆ ಮತ್ತು PostgreSQL ಅಥವಾ Cosmos DB ಬೆಕ್‌ಎಂಡ್ ಆಯ್ಕೆ. ಉತ್ಪಾದನಾ RAG ಸಂದರ್ಭಗಳಿಗೆ ಕাস্টಮೈಸ್ ಮಾಡಲು ವಿನ್ಯಾಸಗೊಳ್ಳಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### ಎಐ ಪ್ರಯಾಣ ಏಜೆಂಟ್‌ಗಳು — ಬಹು-ಏಜೆಂಟ್ MCP ಸಂಯೋಜನೆ

**Repositories**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**ಸೇವೆಗಳು**: Azure OpenAI + ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ + Azure Container Apps + MCP ಸರ್ವರ್‌ಗಳು (.NET, Python, Java, TypeScript)

**ವಿವರಣೆ**: ಮೂರು ಫ್ರೇಮ್ವರ್ಕ್‌ಗಳು (LangChain.js, LlamaIndex.TS, ಮತ್ತು ಮೈಕ್ರೋಸಾಫ್ಟ್ ಏಜೆಂಟ್ ಫ್ರೇಮ್ವರ್ಕ್) ಬಳಸಿಕೊಂಡು ಬಹು-ಏಜೆಂಟ್ ಎಐ ಸಂಯೋಜನೆಗಾಗಿ ಉಲ್ಲೇಖ ಅಪ್ಲಿಕೇಶನ್. ನಾಲ್ಕು ಭಾಷೆಗಳ MCP (ಮಾದರಿ ಸಾಂದರ್ಭ ಪ್ರೋಟೋಕಾಲ್) ಸರ್ವರ್‍ಗಳನ್ನು ಸರ್ವರ್‌ಲೆಸ್ ಎಜ್ಯುರ್ ಕಂಟೇನರ್ ಅಪ್ಸ್ ರೂಪದಲ್ಲಿ ನಿಯೋಜಿಸಿದ್ದು ಅದರ OpenTelemetry ಮಾನಿಟರಿಂಗ್ ಒಳಗೊಂಡಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### ಏಜ್ಯುರ್ ಎಐ ಪ್ರಾರಂಭಿಕ

**Repositories**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**ಸೇವೆಗಳು**: Azure AI ಸೇವೆಗಳು + Azure OpenAI

**ವಿವರಣೆ**: ಕಾನ್ಫಿಗರ್ ಮಾಡಲಾದ ಮೆಷಿನ್ ಲರ್ನಿಂಗ್ ಮಾದರಿಗಳೊಂದಿಗೆ Azure AI ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸುವ ಕನಿಷ್ಠ ಬೈಸಪ್ ಟೆಂಪ್ಲೇಟ್. ನೀವು ಪೂರ್ಣ ಅಪ್ಲಿಕೇಶನ್ ಸ್ಟ್ಯಾಕ್ ಇಲ್ಲದೆ Azure AI ಮೂಲಭೂತ ವ್ಯವಸ್ಥೆಯನ್ನು ಮಾತ್ರ ಬೇಕಾದಾಗ ಬೆಳವಣಿಗೆ ಪ್ರಾರಂಭಿಸುವ ಹಗುರವಾದ ಅಂಕಿತಬಿಂದುವಾಗಿದೆ.

**ತ್ವರಿತ ಪ್ರಾರಂಭ**:
```bash
azd init --template azd-ai-starter
azd up
```

> **ಹೆಚ್ಚು ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ**: 80+ ಎಐ-ನಿರ್ದಿಷ್ಟ AZD ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ವಿವಿಧ ಭಾಷೆಗಳು ಮತ್ತು ಸಂದರ್ಭಗಳಿಗೆ ಭೇಟಿ ನೀಡಿ [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai).

## ಮುಂದಿನ ಹಂತಗಳು

1. **ಉದಾಹರಣೆಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ**: ನಿಮ್ಮ ಬಳಕೆಗೆ ಹೊಂದಿಕೆಯಾಗುವ ಪೂರ್ವ-ನಿರ್ಮಿತ ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ
2. **ನಿಮ್ಮ ಅಗತ್ಯಗಳಿಗೆ ಕಸ್ಟಮೈಸ್ ಮಾಡಿ**: ಮೂಲಭೂತ ವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಬದಲಾಯಿಸಿ
3. **ಮಾನಿಟರಿಂಗ್ ಸೇರಿಸಿ**: ಸಮಗ್ರ ಪರಿಶೀಲನಾತ್ಮಕತೆ ಅನುಷ್ಠಾನ ಮಾಡಿ
4. **ವೆಚ್ಚಗಳನ್ನು ಉತ್ತಮಗೊಳಿಸಿ**: ನಿಮ್ಮ ಬಜೆಟ್‌ಗೆ ಅನುಗುಣವಾಗಿ ಸಂರಚನೆಗಳನ್ನು ಸೂಕ್ತಗೊಳಿಸಿ
5. **ನಿಮ್ಮ ನಿಯೋಜನೆಯನ್ನು ಸುರಕ್ಷಿತಗೊಳಿಸಿ**: ಎಂಟರ್ಪ್ರೈಸ್ ಸುರಕ್ಷತಾ ಮಾದರಿಗಳನ್ನು ಅನುಷ್ಠಾನ ಮಾಡಿ
6. **ಉತ್ಪಾದನೆಗೆ ಪ್ರಮಾಣೀಕರಿಸಿ**: ಬಹು-ಪ್ರಾಂತ್ಯ ಮತ್ತು ಉತ್ತಮ-ಲಭ್ಯತೆ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸೇರಿಸಿ

## 🎯 ಪ್ರಾಯೋಗಿಕ ಅಭ್ಯಾಸಗಳು

### ಅಭ್ಯಾಸ 1: ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಮಾದರಿ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ (30 ನಿಮಿಷ)
**ಲಕ್ಷ್ಯ**: ಉತ್ಪಾದನೆಗೆ ಸಿದ್ಧ ಎಐ ಚಾಟ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸು

```bash
# ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಾರಂಭಿಸು
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ಪರಿಸರಚರಗಳನ್ನು ಹೊಂದಿಸಿ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ಅನುಷ್ಠಾನಗೊಳ್ಳಿಸಿ
azd up

# ಅಪ್ಲಿಕೇಶನ್ ಪರೀಕ್ಷಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI ಕಾರ್ಯಚಟುವಟಿಕೆಗಳನ್ನು ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor

# ಶುದ್ಧೀಕರಿಸು
azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ನಿಯೋಜನೆ ಕೋಟಾ ದೋಷಗಳಿಲ್ಲದೆ ಮುಗಿಯಬೇಕು
- [ ] ಬ್ರೌಸರ್‌ನಲ್ಲಿನ ಚಾಟ್ ಇಂಟರ್ಫೇಸಿಗೆ ಪ್ರವೇಶಿಸಬಹುದು
- [ ] ಪ್ರಶ್ನೆಗಳನ್ನು ಕೇಳಿ ಮತ್ತು ಎಐ ಚಾಲಿತ ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ಪಡೆಯಬಹುದು
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಇನ್‌ಸೈಟ್ಸ್ ಟೆಲಿಮೆಟ್ರಿ ಡೇಟಾವನ್ನು ತೋರಿಸುತ್ತದೆ
- [ ] ಸಂಪನ್ಮೂಲಗಳನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಶುದ್ಧಪಡಿಸಲಾಗಿದೆ

**ಅಂದಾಜು ವೆಚ್ಚ**: 30 ನಿಮಿಷದ ಪರೀಕ್ಷೆಗೆ $5-10

### ಅಭ್ಯಾಸ 2: ಬಹು-ಮಾದರಿ ನಿಯೋಜನೆ ಸಂರಚನೆ (45 ನಿಮಿಷ)
**ಲಕ್ಷ್ಯ**: ವಿಭಿನ್ನ ಸಂರಚನೆಗಳೊಂದಿಗೆ ಹಲವು ಎಐ ಮಾದರಿಗಳನ್ನು ನಿಯೋಜಿಸಿ

```bash
# ಕಸ್ಟಮ್ ಬೈಸೆಪ್ ಸಂರಚನೆ ಸೃಷ್ಟಿಸಿ
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
- [ ] ಹಲವು ಮಾದರಿಗಳು ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] ವಿಭಿನ್ನ ಸಾಮರ್ಥ್ಯ ಹೊಂದಾಣಿಕೆಗಳು ಅನ್ವಯಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] ಮಾದರಿಗಳು API ಮೂಲಕ ಲಭ್ಯವಿವೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ಇಬ್ಬರೂ ಮಾದರಿಗಳನ್ನು ಕರೆಸಬಹುದು

### ಅಭ್ಯಾಸ 3: ವೆಚ್ಚ ಮಾನಿಟರಿಂಗ್ ಅನುಷ್ಠಾನ (20 ನಿಮಿಷ)
**ಲಕ್ಷ್ಯ**: ಬಜೆಟ್ ಎಚ್ಚರಿಕೆಗಳು ಮತ್ತು ವೆಚ್ಚ ವರದಿಗಳನ್ನು ಸ್ಥಾಪಿಸಿ

```bash
# ಬೈಸೆಪ್ಗೆ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆ ಸೇರಿಸಿ
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

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಎಜ್ಯುರ್‌ನಲ್ಲಿ ಬಜೆಟ್ ಎಚ್ಚರಿಕೆ ಸೃಷ್ಟಿಸಲಾಗಿದೆ
- [ ] ಇಮೇಲ್ ತಿಳಿವುಗಳಿರುವುವು
- [ ] ಎಜ್ಯುರ್ ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ವೆಚ್ಚ ಡೇಟಾವನ್ನು ವೀಕ್ಷಿಸಬಹುದು
- [ ] ಬಜೆಟ್ ಮಿತಿಗಳು ಸಮರ್ಪಕವಾಗಿ ನಿಗದಿಪಡಿಸಲಾಗಿದೆ

## 💡 ಅತಿ ಹೆಚ್ಚಾಗಿ ಕೇಳುವ ಪ್ರಶ್ನೆಗಳು

<details>
<summary><strong>ಡೆವಲಪ್ಮೆಂಟ್ ಸಮಯದಲ್ಲಿ ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಮಾದರಿಗಳ ವೆಚ್ಚವನ್ನು ನಾನು ಹೇಗೆ ಕಡಿಮೆ ಮಾಡಬಹುದು?</strong></summary>

1. **ಮುಕ್ತ ದರ್ಜೆಯನ್ನು ಬಳಸಿ**: ಮೈಕ್ರೋಸಾಫ್ಟ್ ಫೌಂಡ್ರಿ ಮಾದರಿಗಳು ತಿಂಗಳಿಗೆ 50,000 ಟೋಕನ್ ಉಚಿತವಾಗಿ ಒದಗಿಸುತ್ತದೆ
2. **ಸಾಮರ್ಥ್ಯವನ್ನು ಕಡಿಮೆ ಮಾಡಿ**: ಅಭಿವೃದ್ಧಿಗಾಗಿ ಸಾಮರ್ಥ್ಯವನ್ನು 30+ ಬದಲು 10 TPMಗೆ ಸೆಟ್ ಮಾಡಿ
3. **azd down ನ್ನು ಬಳಸಿ**: ಸಕ್ರಿಯವಾಗಿ ಅಭಿವೃದ್ಧಿ ಮಾಡದೇ ಇದ್ದಾಗ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಬಿಡುಗಡೆಮಾಡಿ
4. **ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ಕ್ಯಾಶ್ ಮಾಡಿ**: ಪುನರಾವೃತ್ತಿ ಪ್ರಶ್ನೆಗಳಿಗಾಗಿ Redis ಕ್ಯಾಶ್ ಅನುಷ್ಠಾನ ಮಾಡಿ
5. **ಪ್ರಾಂಪ್ಟ್ ಎಂಜಿನಿಯರಿಂಗ್ ಬಳಸಿ**: ಶಕ್ತಿಶಾಲಿಯಾದ ಪ್ರಾಂಪ್ಟ್‌ಗಳ ಮೂಲಕ ಟೋಕನ್ ಬಳಕೆಯನ್ನು ಕಡಿಮೆ ಮಾಡಿ


```bash
# ಅಭಿವೃದ್ಧಿ ಸಂರಚನೆ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry ಮోడಲ್ಗಳು ಮತ್ತು OpenAI API ನಡುವಿನ ವ್ಯತ್ಯಾಸವೇನು?</strong></summary>

**Microsoft Foundry Models**:
- ಸಂಸ್ಥೆಯ ಭದ್ರತೆ ಮತ್ತು ಪಾಲನೆ
- ಖಾಸಗಿ ನೆಟ್ವರ್ಕ್ ಏಕೀಕರಣ
- SLA ಭರವಸೆಗಳು
- ನಿರ್ವಹಿಸಲಾಗುವ ಐಡೆಂಟಿಟಿ ಮೌಲ್ಯಮಾಪನ
- ಹೆಚ್ಚು ಕೋಟ್‌ಗಳು ಲಭ್ಯವಿವೆ

**OpenAI API**:
- ಹೊಸ ಮಾದರಿಗಳಿಗೆ ವೇಗವಾಗಿ ಪ್ರವೇಶ
- ಸರಳವಾದ ಸೆಟಪ್
- ಪ್ರವೇಶಾತಿಗೆ ಕಡಿಮೆ ಅಡ್ಡಿ
- ಸಾರ್ವಜನಿಕ ಇಂಟರ್ನೆಟ್ ಮಾತ್ರವಲ್ಲದೆ

ತಯಾರಾತ್ಮಕ ಅಪ್ಲಿಕೇಶನ್‌ಗಳಿಗೆ, **Microsoft Foundry Models ಅನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ**.
</details>

<details>
<summary><strong>Microsoft Foundry Models ಕೋಟ್ ಮೀರಿ ದೋಷಗಳನ್ನು ನಾನು ಹೇಗೆ ನಿಭಾಯಿಸಬಹುದು?</strong></summary>

```bash
# ಪ್ರಸ್ತುತ ಕೋಟವನ್ನು ಪರಿಶೀಲಿಸಿ
az cognitiveservices usage list --location eastus2

# ಬೇರೆ ಪ್ರದೇಶವನ್ನು ಪ್ರಯತ್ನಿಸಿ
azd env set AZURE_LOCATION westus2
azd up

# ಸಾಮರ್ಥ್ಯವನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಕಡಿಮೆ ಮಾಡಿ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ಕೋಟ ಹೆಚ್ಚಳವನ್ನು ವಿನಂತಿಸಿ
# ಅಜ್ಯೂರ್ ಪೋರ್ಟಲ್ > ಕೋಟಗಳು > ಹೆಚ್ಚಳವನ್ನು ವಿನಂತಿ ಮಾಡಿ
```
</details>

<details>
<summary><strong>Microsoft Foundry Models ಜೊತೆಗೆ ನನ್ನ ಸ್ವಂತ ಡೇಟಾವನ್ನು ಬಳಸಬಹುದೇ?</strong></summary>

ಹೌದು! RAG (Retrieval Augmented Generation)ಗಾಗಿ **Azure AI Search** ಅನ್ನು ಬಳಸಿ:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ಟೆಂಪ್ಲೇಟ್ ನೋಡಿ.
</details>

<details>
<summary><strong>ನಾನು AI ಮಾದರಿ ಅಂತಿಮಬಿಂದುಗಳನ್ನು ಹೇಗೆ ಭದ್ರಪಡಿಸಬಹುದು?</strong></summary>

**ಶ್ರೇಷ್ಠ ಅಭ್ಯಾಸಗಳು**:
1. ನಿರ್ವಹಿಸಲಾದ ಐಡೆಂಟಿಟಿ ಬಳಸಿ (API ಕೀಗಳು ಬೇಡ)
2. ಖಾಸಗಿ ಅಂತಿಮಬಿಂದುಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
3. ನೆಟ್ವರ್ಕ್ ಭದ್ರತಾ ಗುಂಪುಗಳನ್ನು ಸಂರಚಿಸಿ
4. ದರ ನಿಯಂತ್ರಣವನ್ನು ಜಾರಿಗೆ ತರುವಿರಿ
5. ಗುಪ್ತಚರ ಮಾಹಿತಿಗಾಗಿ Azure ಕೀ ವಾಲ್ಟ್ ಬಳಸಿ

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
- **AZD GitHub**: [ಪ್ರಶ್ನೆಗಳು ಮತ್ತು ಚರ್ಚೆಗಳು](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ಅಧಿಕೃತ ದಸ್ತಾವೇಜು](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh ನ Microsoft Foundry ಮಾರುಕಟ್ಟೆ](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ನಿಮ್ಮ ಸಂಪಾದಕದಲ್ಲಿ `npx skills add microsoft/github-copilot-for-azure` ಬಳಸಿ Azure + Foundry ಏಜೆಂಟ್ ಕೌಶಲ್ಯಗಳನ್ನು ಹೊಂದಿಸಿ

---

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆರ್‌ಡುವಿ ಆರಂಭಿಕರಿಗಾಗಿ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 2 - AI-ಮೊದಲ ಅಭಿವೃದ್ಧಿ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 1: ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **➡️ ಮುಂದಿನದು**: [AI ಮಾದರಿ ನಿಯೋಜನೆ](ai-model-deployment.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)

**ಸಹಾಯ ಬೇಕೆ?** ನಮ್ಮ ಸಮುದಾಯ ಚರ್ಚೆಗಳಲ್ಲಿ ಸೇರಿ ಅಥವಾ ರೆಪೊದಲ್ಲಿ ಸಮಸ್ಯೆಯನ್ನು ತೆಗೆಯಿರಿ. Azure AI + AZD ಸಮುದಾಯ ನಿಮ್ಮ ಯಶಸ್ವಿಗಾಗಿ ಇಲ್ಲಿದೆ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->