# ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਵਿਥ AZD

**ਅੱਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਸਫ਼ਾ**: [ਨਵੀਂ ਸਿਖਰਿਆਂ ਲਈ AZD](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅੱਧਿਆਇ**: ਅੱਧਿਆਇ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਿਛਲਾ ਅੱਧਿਆਇ**: [ਅੱਧਿਆਇ 1: ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../chapter-01-foundation/first-project.md)
- **➡️ ਅੱਗੇ**: [AI ਮਾਡਲ ਦੀ ਤਜ਼ਵੀਜ਼](ai-model-deployment.md)
- **🚀 ਅਗਲਾ ਅੱਧਿਆਇ**: [ਅੱਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

## ਝਲਕ

ਇਹ ਗਾਈਡ ਵੇਖਾਉਂਦੀ ਹੈ ਕਿ ਕਿਸ ਤਰ੍ਹਾਂ ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਸੇਵਾਵਾਂ ਨੂੰ ਅਜ਼ਯੂਰ ਡਿਵੈਲਪਰ CLI (AZD) ਨਾਲ ਜੁੜ ਕੇ ਸੁਗਮ AI ਅਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇਮੈਂਟ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ। ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਇਕ ਵਿਆਪਕ ਪਲੇਟਫਾਰਮ ਹੈ ਜੋ AI ਅਪਲੀਕੇਸ਼ਨਾਂ ਦੇ ਨਿਰਮਾਣ, ਤਜ਼ਵੀਜ਼ ਅਤੇ ਪ੍ਰਬੰਧਨ ਲਈ ਹੈ, ਜਦਕਿ AZD ਢਾਂਚਾਗਤ ਅਤੇ ਤਜ਼ਵੀਜ਼ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਆਸਾਨ ਬਣਾਉਂਦਾ ਹੈ।

## ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਕੀ ਹੈ?

ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਮਾਇਕਰੋਸੌਫਟ ਦਾ ਏਕਟ੍ਰਿਤ ਪਲੇਟਫਾਰਮ ਹੈ ਜੋ AI ਵਿਕਾਸ ਲਈ ਹੈ:

- **ਮਾਡਲ ਕੈਟਾਲੋਗ**: ਅਧੁਨਿਕ AI ਮਾਡਲਾਂ ਦੀ ਪਹੁੰਚ
- **ਪ੍ਰਾਂਪਟ ਫਲੋ**: AI ਵర్కਫਲੋ ਲਈ ਵਿਜ਼ੂਅਲ ਡਿਜ਼ਾਈਨਰ
- **ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਪੋਰਟਲ**: AI ਅਪਲੀਕੇਸ਼ਨਾਂ ਲਈ ਏਕਜੁੱਟ ਵਿਕਾਸੀ ਵਾਤਾਵਰਣ
- **ਤਜ਼ਵੀਜ਼ ਵਿਕਲਪ**: ਕਈ ਹੋਸਟਿੰਗ ਅਤੇ ਸਕੇਲਿੰਗ ਵਿਕਲਪ
- **ਸੁਰੱਖਿਆ ਅਤੇ ਸੁਰੱਖਿਆਤਾ**: ਇਨ-ਬਿਲਟ ਜ਼ਿੰਮੇਵਾਰ AI ਫੀਚਰ

## AZD + ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ: ਇਕਠੇ ਬਿਹਤਰ

| ਵਿਸ਼ੇਸ਼ਤਾ | ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ | AZD ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਦਾ ਫਾਇਦਾ |
|---------|-----------------|------------------------|
| **ਮਾਡਲ ਤਜ਼ਵੀਜ਼** | ਮੈਨੁਅਲ ਪੋਰਟਲ ਤਜ਼ਵੀਜ਼ | ਸੁਚਾਲਿਤ, ਦੁਹਰਾਏ ਜਾ ਸਕਣ ਵਾਲੇ ਤਜ਼ਵੀਜ਼ |
| **ਵਿੱਚ ਢਾਂਚਾ** | ਕਲਿੱਕ-ਥਰੂ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ | ਇਨਫਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ (ਬਾਈਸਪ) |
| **ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ** | ਇਕ ਵਾਤਾਵਰਣ ਤੇ ਧਿਆਨ | ਬਹੁ-ਵਾਤਾਵਰਣ (ਡਿਵ/ਸਟੇਜਿੰਗ/ਪ੍ਰੋਡ) |
| **CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ** | ਸੀਮਿਤ | ਨੈਟਿਵ GitHub ਏਕਸ਼ਨ ਸਹਾਇਤਾ |
| **ਖ਼ਰਚ ਪ੍ਰਬੰਧਨ** | ਬੁਨਿਆਦੀ ਨਿਗਰਾਨੀ | ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਿਤ ਖ਼ਰਚ ਪੁਨਰ-Leved |

## ਲੋੜੀਂਦੇ ਪੂਰਵ-ਸ਼ਰਤਾਂ

- ਅਜਾਇਰ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਜਿਹੜੀ ਵਧੀਆ ਅਧਿਕਾਰਾਂ ਨਾਲ ਹੈ
- ਅਜ਼ਯੂਰ ਡਿਵੈਲਪਰ CLI ਇੰਸਟਾਲ ਕੀਤਾ ਹੋਇਆ
- ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਮਾਡਲ ਸੇਵਾਵਾਂ ਦੀ ਪਹੁੰਚ
- ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਨਾਲ ਮੂਲ ਜਾਣਕਾਰੀ

> **ਮੌਜੂਦਾ AZD ਬੇਸਲਾਈਨ:** ਇਹ ਉਦਾਹਰਣ `azd` `1.27.1` ਦੇ ਖਿਲਾਫ ਸਮੀਖਿਆ ਕੀਤੀ ਗਈ। AI ਏਜੰਟ ਵਾਰਕਫਲੋ ਲਈ, ਮੌਜੂਦਾ ਪ੍ਰੀਵਿਊ ਐਕਸਟੈਂਸ਼ਨ ਰਿਲੀਜ਼ ਦੀ ਵਰਤੋਂ ਕਰੋ ਅਤੇ ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਆਪਣੀ ਇੰਸਟਾਲ ਕੀਤੀ ਸੰਸਕਰਣ ਜਾਂਚੋ।

## ਮੁੱਖ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਮੂਨੇ

### ਨਮੂਨਾ 1: ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਮਾਡਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਵਰਤੋਂ ਦਾ ਕੇਸ**: ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਮਾਡਲ ਦੇ ਨਾਲ ਗੱਲਬਾਤ ਲਈ ਅਪਲੀਕੇਸ਼ਨ ਤਜ਼ਵੀਜ਼ ਕਰੋ

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

**ਵਿੱਚ ਢਾਂਚਾ (main.bicep):**
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

### ਨਮੂਨਾ 2: AI ਖੋਜ + RAG ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਵਰਤੋਂ ਦਾ ਕੇਸ**: ਰੀਟਰੀਵਲ-ਆਗਮੈਂਟਡ ਜਨਰੇਸ਼ਨ (RAG) ਅਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤਜ਼ਵੀਜ਼ ਕਰੋ

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

### ਨਮੂਨਾ 3: ਦਸਤਾਵੇਜ਼ ਬੁੱਧੀ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

**ਵਰਤੋਂ ਦਾ ਕੇਸ**: ਦਸਤਾਵੇਜ਼ ਪ੍ਰੋਸੈਸਿੰਗ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਣ ਵਰਕਫਲੋਜ਼

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

## 🔧 ਸੰਰਚਨਾ ਨਮੂਨੇ

### ਵਾਤਾਵਰਣ ਚਲ ਸੰਰਚਨਾ

**ਉਤਪਾਦਨ ਸੰਰਚਨਾ:**
```bash
# ਮੂਲ ਐਆਈ ਸੇਵਾਵਾਂ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# ਮਾਡਲ ਸੰਰਚਨਾਵਾਂ
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# ਕਾਰਗੁਜ਼ਾਰੀ ਸੈਟਿੰਗਜ਼
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**ਵਿਕਾਸ ਸੰਰਚਨਾ:**
```bash
# ਵਿਕਾਸ ਲਈ ਲਾਗਤ-ਸਹੀ ਸੈਟਿੰਗਜ਼
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ਮੁਫ਼ਤ ਸਤਰ
```

### ਕੀ ਵాలਟ ਨਾਲ ਸੁਰੱਖਿਅਤ ਸੰਰਚਨਾ

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

## ਤਜ਼ਵੀਜ਼ ਵਰਕਫਲੋਜ਼

### ਫਾਊਂਡਰੀ ਲਈ AZD ਵਿਸ਼ਤਾਰ

AZD ਵਿਸ਼ਤਾਰ ਮੁਹੱਈਆ ਕਰਦਾ ਹੈ ਜੋ ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਸੇਵਾਵਾਂ ਲਈ AI-ਵਿਸ਼ੇਸ਼ ਯੋਜਨਾਵਾਂ ਜੋੜਦੇ ਹਨ:

```bash
# ਫਾਉਂਡਰੀ ਏਜੰਟਸ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.agents

# ਫਾਈਨ-ਟਿਊਨਿੰਗ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.finetune

# ਕਸਟਮ ਮਾਡਲ ਐਕਸਟੈਂਸ਼ਨ ਇੰਸਟਾਲ ਕਰੋ
azd extension install azure.ai.models

# ਇੰਸਟਾਲ ਕੀਤੇ ਐਕਸਟੈਂਸ਼ਨ ਦੀ ਸੂਚੀ ਬਣਾਓ
azd extension list --installed

# ਮੌਜੂਦਾ ਇੰਸਟਾਲ ਕੀਤੇ ਏਜੰਟ ਐਕਸਟੈਂਸ਼ਨ ਦਾ ਵਰਜਨ ਜਾਂਚੋ
azd extension show azure.ai.agents
```

AI ਵਿਸ਼ਤਾਰ ਹਾਲੇ ਪ੍ਰੀਵਿਊ ਵਿੱਚ ਤੇਜ਼ੀ ਨਾਲ ਤਬਦੀਲ ਹੋ ਰਹੇ ਹਨ। ਜੇ ਕੋਈ ਕਮਾਂਡ ਇੱਥੇ ਦਿਖਾਏ ਤੋਂ ਵੱਖਰਾ ਵਰਤाव ਕਰਦਾ ਹੈ, ਤਾਂ ਪ੍ਰੋਜੈਕਟ ਦੀ ਸਮੱਸਿਆ-ਪਤਾ ਲਗਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਸੰਬੰਧਤ ਵਿਸ਼ਤਾਰ ਨੂੰ ਅਪਡੇਟ ਕਰੋ।

### `azd ai` ਨਾਲ ਏਜੰਟ-ਪਹਿਲਾ ਤਜ਼ਵੀਜ਼

ਜੇ ਤੁਹਾਡੇ ਕੋਲ ਏਜੰਟ ਮੈਨਿਫੈਸਟ ਹੈ, ਤਾਂ `azd ai agent init` ਵਰਤੋਂ ਜੋ ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਏਜੰਟ ਸੇਵਾ ਨਾਲ ਜੁੜਿਆ ਪ੍ਰੋਜੈਕਟ ਬਣਾਉਂਦਾ ਹੈ:

```bash
# ਏਜੰਟ ਮੈਨਿਫੈਸਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ਐਜ਼ੋਰ 'ਤੇ ਤੈਨਾਤ ਕਰੋ
azd up
```

ਹਾਲੀਆ ਪ੍ਰੀਵਿਊ ਰਿਲੀਜ਼ਾਂ `azure.ai.agents` ਨੇ ਵੀ `azd ai agent init` ਲਈ ਟੈਂਪਲੇਟ ਆਧਾਰਿਤ ਸ਼ੁਰੂਆਤ ਸਹਾਇਤਾ ਸ਼ਾਮਲ ਕੀਤੀ ਹੈ। ਜੇ ਤੁਸੀਂ ਨਵੇਂ ਏਜੰਟ ਨਮੂਨਿਆਂ ਨੂੰ ਫਾਲੋ ਕਰ ਰਹੇ ਹੋ, ਤਾਂ ਆਪਣੀ ਇੰਸਟਾਲ ਕੀਤੀ ਸੰਸਕਰਣ ਲਈ ਵਿਸ਼ਤਾਰ ਦੀ ਸਹਾਇਤਾ ਵਿੱਚ ਉਪਲੱਬਧ ਸਹੀ ਫਲੈਗਾਂ ਦੀ ਜਾਂਚ ਕਰੋ।

ਪੂਰੇ ਕਮਾਂਡ ਸੰਦਰਭ ਅਤੇ ਫਲੈਗਾਂ ਲਈ [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ਵੇਖੋ।

### ਸਿੰਗਲ ਕਮਾਂਡ ਤਜ਼ਵੀਜ਼

```bash
# ਇੱਕ ਕਮਾਂਡ ਨਾਲ ਸਾਰਾ ਕੁਝ ਤਾਇਨਾਤ ਕਰੋ
azd up

# ਜਾਂ ਕਦਮਬੱਧ ਤੌਰ 'ਤੇ ਤਾਇਨਾਤ ਕਰੋ
azd provision  # ਸਿਰਫ਼ ਬੁਨਿਆਦੀ ਢਾਂਚਾ
azd deploy     # ਸਿਰਫ਼ ਐਪਲੀਕੇਸ਼ਨ

# azd 1.23.11+ ਵਿੱਚ ਲੰਮੀ ਮਿਆਦ ਚਲਣ ਵਾਲੀਆਂ AI ਐਪ ਤਾਇਨਾਤੀਆਂ ਲਈ
azd deploy --timeout 1800
```

### ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਿਤ ਤਜ਼ਵੀਜ਼

```bash
# ਵਿਕਾਸ ਵਾਤਾਵਰਨ
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਨ
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## ਨਿਗਰਾਨੀ ਅਤੇ ਦ੍ਰਿਸ਼ਟੀਯੋਗਤਾ

### ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਇਟਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ

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

## 🔐 ਸੁਰੱਖਿਆ ਸਾਰੀਆਂ ਸਭਿਆਚਾਰੀਆਂ

### ਪ੍ਰਬੰਧਿਤ ਪਹਚਾਣ ਸੰਰਚਨਾ

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

## ਕਾਰਗੁਜ਼ਾਰੀ ਸੁਧਾਰ

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

## ਆਮ ਮੁੱਦਿਆਂ ਦਾ ਮੁਕਾਬਲਾ

### ਮੁੱਦਾ 1: OpenAI ਕਵੋਟਾ ਪਾਰ ਹੋ ਗਿਆ

**ਲੱਛਣ:**
- ਤਜ਼ਵੀਜ਼ ਕਵੋਟਾ ਗਲਤੀਆਂ ਨਾਲ ਫੇਲ੍ਹਦੀ ਹੈ
- ਐਪਲੀਕੇਸ਼ਨ ਲਾਗਾਂ ਵਿੱਚ 429 ਗਲਤੀਆਂ

**ਹੱਲ:**
```bash
# ਵਰਤਮਾਨ ਕੋਟਾ ਵਰਤੋਂ ਚੈੱਕ ਕਰੋ
az cognitiveservices usage list --location eastus

# ਵੱਖ-ਵੱਖ ਖੇਤਰ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION westus2
azd up

# ਅਸਥਾਈ ਤੌਰ 'ਤੇ ਸਮਰਥਾ ਘਟਾਓ
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ਮੁੱਦਾ 2: ਪ੍ਰਮਾਣਿਕਤਾ ਅਸਫਲਤਾ

**ਲੱਛਣ:**
- AI ਸੇਵਾਵਾਂ ਨੂੰ ਕਾਲ ਕਰਦੇ ਸਮੇਂ 401/403 ਗਲਤੀਆਂ
- "ਪਹੁੰਚ ਨਾਕਾਮ" ਸੁਨੇਹੇ

**ਹੱਲ:**
```bash
# ਭੂਮਿਕਾ ਸੌਂਪਣਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ਪ੍ਰਬੰਧਿਤ ਪਹਚਾਣ ਸੰਰਚਨਾ ਦੀ ਜਾਂਚ ਕਰੋ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ਕੰਜੀ ਮੰਦਰ ਦੀ ਪਹੁੰਚ ਨੂੰ ਸਹੀ ਕਰੋ
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ਮੁੱਦਾ 3: ਮਾਡਲ ਤਜ਼ਵੀਜ਼ ਮੁੱਦੇ

**ਲੱਛਣ:**
- ਤਜ਼ਵੀਜ਼ ਵਿੱਚ ਮਾਡਲ ਉਪਲੱਬਧ ਨਹੀਂ
- ਖਾਸ ਮਾਡਲ ਵਰਜਨਾਂ ਦੀ ਨਾਕਾਮੀ

**ਹੱਲ:**
```bash
# ਇਲਾਕੇ ਦੁਆਰਾ ਉਪਲਬਧ ਮਾਡਲਾਂ ਦੀ ਸੂਚੀ ਬਣਾਓ
az cognitiveservices model list --location eastus

# ਬਾਈਸਪ ਟੈਂਪਲੇਟ ਵਿੱਚ ਮਾਡਲ ਦਾ ਸੰਸਕਰਨ ਅਪਡੇਟ ਕਰੋ
# ਮਾਡਲ ਸਮਰੱਥਾ ਦੀਆਂ ਲੋੜਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
```

## ਉਦਾਹਰਣ ਟੈਂਪਲੇਟ

### RAG ਚੈਟ ਅਪਲੀਕੇਸ਼ਨ (ਪਾਇਥਨ)

**ਰਿਪੋਜ਼ਿਟਰੀ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**ਸੇਵਾਵਾਂ**: ਅਜ਼ਯੂਰ ਮੈਂਚੀਅਨ + ਅਜ਼ਯੂਰ AI ਖੋਜ + ਅਜ਼ਯੂਰ ਕੰਟੇਨਰ ਐਪਸ + ਅਜ਼ਯੂਰ ਬਲੌਬ ਸਟੋਰੇਜ

**ਵਰਣਨ**: ਸਭ ਤੋਂ ਲੋਕਪਰੀਅਤ ਜਨਰੇਸ਼ਨ RAG ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਜੋ ਤੁਹਾਡੇ ਆਪਣੇ ਦਸਤਾਵੇਜ਼ਾਂ 'ਤੇ ਸਵਾਲ ਪੁੱਛਣ ਦਿੰਦਾ ਹੈ। ਗੱਲਬਾਤ ਲਈ GPT-4.1-mini ਵਰਤਦਾ ਹੈ, ਐਬੈੱਡਿੰਗ ਲਈ ਟੈਕਸਟ-ਐਮਬੈੱਡਿੰਗ-3-ਲਾਰਜ ਅਤੇ ਖੋਜ ਲਈ ਅਜ਼ਯੂਰ AI ਖੋਜ ਵਰਤੀ ਜਾਂਦੀ ਹੈ। ਬਹੁਮੁੱਖੀ ਦਸਤਾਵੇਜ਼, ਬੋਲੀ ਇਨਪੁਟ / ਆਊਟਪੁਟ, ਮਾਇਕਰੋਸੌਫਟ ਐਂਟਰਾ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਇਟਸ ਟ੍ਰੇਸਿੰਗ ਸਹਾਇਤਾ ਕਰਦਾ ਹੈ।

**ਛੇਤੀ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG ਚੈਟ ਅਪਲੀਕੇਸ਼ਨ (.NET)

**ਰਿਪੋਜ਼ਿਟਰੀ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**ਸੇਵਾਵਾਂ**: ਅਜ਼ਯੂਰ ਮੈਂਚੀਅਨ + ਅਜ਼ਯੂਰ AI ਖੋਜ + ਅਜ਼ਯੂਰ ਕੰਟੇਨਰ ਐਪਸ + ਸੈਮਾਂਟਿਕ ਕਰੋਨਲ

**ਵਰਣਨ**: ਪਾਇਥਨ RAG ਚੈਟ ਨਮੂਨੇ ਦਾ .NET/C# ਸਦৃਸ਼। ASP.NET ਕੋਰ ਮਿਨੀਮਲ API ਅਤੇ ਬਲੇਜ਼ਰ ਵੈਪ ਐਸੈਂਬਲੀ ਫਰੰਟਐਂਡ ਨਾਲ ਬਣਾਇਆ ਗਿਆ। ਵੋਇਸ ਚੈਟ, GPT-4o-mini ਵਿਜ਼ਨ ਸਹਾਇਤਾ ਅਤੇ .NET MAUI ਬਲੇਜ਼ਰ ਹਾਈਬ੍ਰਿਡ ਡੈਸਕਟਾਪ/ਮੋਬਾਈਲ ਕਲਾਇਂਟ ਸ਼ਾਮਲ ਹੈ।

**ਛੇਤੀ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG ਚੈਟ ਅਪਲੀਕੇਸ਼ਨ (ਜਾਵਾ)

**ਰਿਪੋਜ਼ਿਟਰੀ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**ਸੇਵਾਵਾਂ**: ਅਜ਼ਯੂਰ ਮੈਂਚੀਅਨ + ਅਜ਼ਯੂਰ AI ਖੋਜ + ਅਜ਼ਯੂਰ ਕੰਟੇਨਰ ਐਪਸ / AKS + Langchain4J + ਅਜ਼ਯੂਰ ਕੋਸਮੋਜ਼ DB

**ਵਰਣਨ**: ਜੀਲ ਵਰਜ਼ਨ ਆਫ਼ ਰਾਗ ਚੈਟ ਨਮੂਨਾ ਜੋ Langchain4J ਨੂੰ AI ਪ੍ਰਬੰਧਨ ਲਈ ਵਰਤਦਾ ਹੈ। ਵਿਕੀਰਨ ਅਤੇ ਮਾਈਕਰੋਸਰਵਿਸ ਈਵੇਂਟ-ਚਲਿਤ ਵਿਸ਼ਲੇਸ਼ਣ, ਕਈ ਖੋਜ ਰਣਨੀਤੀਆਂ (ਟੈਕਸਟ, ਵੇਕਟਰ, ਹਾਈਬ੍ਰਿਡ), ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ ਅਜ਼ਯੂਰ ਦਸਤਾਵੇਜ਼ ਬੁੱਧੀ ਸਹਾਇਤਾ ਨਾਲ ਅਤੇ ਅਜ਼ਯੂਰ ਕੰਟੇਨਰ ਐਪਸ ਜਾਂ ਅਜ਼ਯੂਰ ਕੁਬਰਨੇਟਸ ਸਰਵਿਸ 'ਤੇ ਤਜ਼ਵੀਜ਼ ਲਈ ਸਮਰਥਿਤ।

**ਛੇਤੀ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਨਾਲ ਵਪਾਰੀ ਰੀਟੇਲ ਕੋਪਾਈਲਟ

**ਰਿਪੋਜ਼ਿਟਰੀ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**ਸੇਵਾਵਾਂ**: ਅਜ਼ਯੂਰ OpenAI + ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ + ਪ੍ਰੋਂਪਟੀ + ਅਜ਼ਯੂਰ AI ਖੋਜ + ਅਜ਼ਯੂਰ ਕੰਟੇਨਰ ਐਪਸ + ਅਜ਼ਯੂਰ ਕੋਸਮੋਜ਼ DB

**ਵਰਣਨ**: ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਅਤੇ ਪ੍ਰੋਂਪਟੀ ਦੇ ਨਾਲ ਏਂਡ-ਟੂ-ਏਂਡ ਰੀਟੇਲ RAG ਕੋਪਾਈਲਟ। ਕੋਟੋਸੋ ਆਊਟਡੋਰ ਰੀਟੇਲਰ ਚੈਟਬੋਟ ਜੋ ਉਤਪਾਦ ਕੈਟਾਲੋਗ ਅਤੇ ਗਾਹਕ ਦੀ ਆਰਡਰ ਜਾਣਕਾਰੀ 'ਤੇ ਬੇਸ ਕਰਦਾ ਹੈ। GenAIOps ਪੂਰੇ ਵਰਕਫਲੋ ਦਾ ਪ੍ਰੋਟੋਟਾਈਪ — ਪ੍ਰੋਂਪਟੀ ਨਾਲ ਪ੍ਰੋਟੋਟਾਈਪ ਬਣਾਓ, AI-ਮਦਦਗਾਰ ਮੁਲਾਂਕਨ ਕਰਨ ਵਾਲਿਆਂ ਨਾਲ ਅੰਕੜਾ ਲਗਾਓ, ਅਤੇ AZD ਰਾਹੀਂ ਕੰਟੇਨਰ ਐਪਸ ਵਿੱਚ ਤਜ਼ਵੀਜ਼ ਕਰੋ।

**ਛੇਤੀ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template contoso-chat
azd up
```

### ਰਚਨਾਤਮਕ ਲਿਖਾਈ ਬਹੁ-ਏਜੰਟ ਐਪਲੀਕੇਸ਼ਨ

**ਰਿਪੋਜ਼ਿਟਰੀ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**ਸੇਵਾਵਾਂ**: ਅਜ਼ਯੂਰ OpenAI + ਅਜ਼ਯੂਰ AI ਏਜੰਟ ਸੇਵਾ + ਬਿੰਗ ਗਰਾਉਂਡਿੰਗ + ਅਜ਼ਯੂਰ AI ਖੋਜ + ਅਜ਼ਯੂਰ ਕੰਟੇਨਰ ਐਪਸ

**ਵਰਣਨ**: ਪ੍ਰੋਂਪਟੀ ਨਾਲ AI ਏਜੰਟ ਅੰਤਰਸੰਚਾਲਨ ਦਰਸਾਉਂਦਾ ਬਹੁ-ਏਜੰਟ ਨਮੂਨਾ। ਇੱਕ ਅਨੁਸੰਧਾਨ ਏਜੰਟ (ਬਿੰਗ ਗਰਾਉਂਡਿੰਗ ਅਜ਼ਯੂਰ AI ਏਜੰਟ ਸੇਵਾ ਵਿੱਚ), ਇੱਕ ਉਤਪਾਦ ਏਜੰਟ (ਅਜ਼ਯੂਰ AI ਖੋਜ), ਇੱਕ ਲੇਖਕ ਏਜੰਟ ਅਤੇ ਇੱਕ ਸੰਪਾਦਕ ਏਜੰਟ ਮਿਲ ਕੇ ਸੋਧੇ ਖੋਜ ਲੇਖ ਲਿਖਦੇ ਹਨ। GitHub ਏਕਸ਼ਨਜ਼ ਵਿੱਚ ਮੁਲਾਂਕਣ ਅਤੇ CI/CD ਸ਼ਾਮਲ ਹੈ।

**ਛੇਤੀ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template contoso-creative-writer
azd up
```

### ਸਰਵਰਲੈੱਸ RAG ਚੈਟ (ਜਾਵਾਸਕ੍ਰਿਪਟ/ਟਾਈਪਸਕ੍ਰਿਪਟ)

**ਰਿਪੋਜ਼ਿਟਰੀ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**ਸੇਵਾਵਾਂ**: ਅਜ਼ਯੂਰ OpenAI + ਅਜ਼ਯੂਰ ਫੰਕਸ਼ਨ + ਅਜ਼ਯੂਰ ਸਟੈਟਿਕ ਵੈਬ ਐਪਸ + ਅਜ਼ਯੂਰ ਕੋਸਮੋਜ਼ ਡੀਬੀ ਫੋਰ NoSQL + LangChain.js

**ਵਰਣਨ**: ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਰਵਰਲੈੱਸ RAG ਚੈਟਬੋਟ ਜੋ LangChain.js ਨੂੰ ਅਜ਼ਯੂਰ ਫੰਕਸ਼ਨਜ਼ ਨਾਲ API ਲਈ ਅਤੇ ਅਜ਼ਯੂਰ ਸਟੈਟਿਕ ਵੈਬ ਐਪਸ ਦੇ ਜ਼ਰੀਏ ਹੋਸਟਿੰਗ ਲਈ ਵਰਤਦਾ ਹੈ। ਅਜ਼ਯੂਰ ਕੋਸਮੋਜ਼ ਡੀਬੀ ਨੂੰ ਵੇਕਟਰ ਸਟੋਰ ਅਤੇ ਚੈਟ ਇਤਿਹਾਸ ਡੇਟਾਬੇਸ ਵਜੋਂ ਵਰਤਦਾ ਹੈ। ਜ਼ੀਰੋ-ਖ਼ਰਚ ਟੈਸਟਿੰਗ ਲਈ ਓਲਾਮਾ ਨਾਲ ਸਥਾਨਕ ਵਿਕਾਸ ਸਮਰਥਿਤ।

**ਛੇਤੀ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### ਆਪਣੀ ਡਾਟਾ ਨਾਲ ਗੱਲਬਾਤ ਹੱਲ ਐਕਸਲਰੇਟਰ

**ਰਿਪੋਜ਼ਿਟਰੀ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**ਸੇਵਾਵਾਂ**: ਅਜ਼ਯੂਰ OpenAI + ਅਜ਼ਯੂਰ AI ਖੋਜ + ਅਜ਼ਯੂਰ ਐਪ ਸੇਵਾ + ਅਜ਼ਯੂਰ ਦਸਤਾਵੇਜ਼ ਬੁੱਧੀ + ਅਜ਼ਯੂਰ ਫੰਕਸ਼ਨ + ਅਜ਼ਯੂਰ ਕੋਸਮੋਜ਼ DB / PostgreSQL

**ਵਰਣਨ**: ਵਪਾਰੀ-ਪੱਧਰ ਦਾ RAG ਹੱਲ ਐਕਸਲਰੇਟਰ ਜੋ ਦਸਤਾਵੇਜ਼ ਅਪਲੋਡ/ਪ੍ਰਬੰਧਨ ਲਈ ਐਡਮਿਨ ਪੋਰਟਲ, ਕਈ ਅੰਤਰਸੰਚਾਲਕ ਵਿਕਲਪ (ਸੈਮਾਂਟਿਕ ਕਰੋਨਲ, ਲੈਂਗਚੇਨ, ਪ੍ਰਾਂਪਟ ਫਲੋ), ਬੋਲੀ ਟੈਕਸਟ ਵਿੱਚ ਤਬਦੀਲ, ਮਾਇਕਰੋਸੌਫਟ ਟੀਮ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਅਤੇ PostgreSQL ਜਾਂ ਕੋਸਮੋਜ਼ DB ਬੈਕਐਂਡ ਨਾਲ। ਉਤਪਾਦਨ RAG ਪ੍ਰਸੰਗਾਂ ਲਈ ਅਨੁਕੂਲ ਸ਼ੁਰੂਆਤੀ ਬਿੰਦੂ ਵਜੋਂ ਡਿਜ਼ਾਈਨ ਕੀਤਾ ਗਿਆ।

**ਛੇਤੀ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ਟ੍ਰੈਵਲ ਏਜੰਟ — ਬਹੁ-ਏਜੰਟ MCP ਅੰਤਰਸੰਚਾਲਨ

**ਰਿਪੋਜ਼ਿਟਰੀ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**ਸੇਵਾਵਾਂ**: ਅਜ਼ਯੂਰ OpenAI + ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ + ਅਜ਼ਯੂਰ ਕੰਟੇਨਰ ਐਪਸ + MCP ਸਰਵਰ (.NET, ਪਾਇਥਨ, ਜਾਵਾ, ਟਾਈਪਸਕ੍ਰਿਪਟ)

**ਵਰਣਨ**: ਤਿੰਨ ਫਰੇਮਵਰਕਸ (LangChain.js, LlamaIndex.TS, ਤੇ ਮਾਇਕਰੋਸੌਫਟ ਏਜੰਟ ਫਰੇਮਵਰਕ) ਦੀ ਵਰਤੋਂ ਨਾਲ ਬਹੁ-ਏਜੰਟ AI ਅੰਤਰਸੰਚਾਲਨ ਲਈ ਰੈਫਰੰਸ ਅਪਲਿਕੇਸ਼ਨ। MCP (ਮਾਡਲ ਕਾਂਟੈਕਸਟ ਪ੍ਰੋਟੋਕੋਲ) ਸਰਵਰ ਚਾਰ ਭਾਸ਼ਾਵਾਂ ਵਿੱਚ ਸਰਵਰਲੈੱਸ ਅਜ਼ਯੂਰ ਕੰਟੇਨਰ ਐਪਸ ਵਜੋਂ ਤਜ਼ਵੀਜ਼ ਕੀਤੇ ਗਏ ਜਿਸ ਵਿੱਚ ਓਪਨਟੈਲੀਮੈਟਰੀ ਨਿਗਰਾਨੀ ਹੈ।

**ਛੇਤੀ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### ਅਜ਼ਯੂਰ AI ਸਟਾਰਟਰ

**ਰਿਪੋਜ਼ਿਟਰੀ**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**ਸੇਵਾਵਾਂ**: ਅਜ਼ਯੂਰ AI ਸੇਵਾਵਾਂ + ਅਜ਼ਯੂਰ OpenAI

**ਵਰਣਨ**: ਇੱਕ ਨਿਊਨਤਮ ਬਾਈਸਪ ਟੈਂਪਲੇਟ ਜੋ ਮਸ਼ੀਨ ਲਰਨਿੰਗ ਮਾਡਲਾਂ ਨਾਲ ਨਿਰਮਿਤ ਅਜ਼ਯੂਰ AI ਸੇਵਾਵਾਂ ਨੂੰ ਤਜ਼ਵੀਜ਼ ਕਰਦਾ ਹੈ। ਜਦੋਂ ਤੁਹਾਨੂੰ ਸਿਰਫ ਅਜ਼ਯੂਰ AI ਢਾਂਚਾ ਤਜ਼ਵੀਜ਼ ਕਰਨਾ ਹੋਵੇ ਤੇ ਪੂਰਾ ਐਪਲੀਕੇਸ਼ਨ ਸਟੈਕ ਨਹੀਂ ਚਾਹੀਦਾ, ਤਾਂ ਇਹ ਇੱਕ ਹਲਕਾ-ਫੁਲਕਾ ਸ਼ੁਰੂਆਤੀ ਬਿੰਦੂ ਹੈ।

**ਛੇਤੀ ਸ਼ੁਰੂਆਤ**:
```bash
azd init --template azd-ai-starter
azd up
```

> **ਹੋਰ ਟੈਂਪਲੇਟ ਦਰਸ਼ਨ ਕਰੋ**: 80+ AI-ਵਿਸ਼ੇਸ਼ AZD ਟੈਂਪਲੇਟਾਂ ਲਈ [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) 'ਤੇ ਜਾਓ ਜੋ ਭਾਸ਼ਾਵਾਂ ਅਤੇ ਵਿਵਿੱਧ ਪ੍ਰਸੰਗਾਂ ਵਿੱਚ ਹਨ।

## ਅਗਲੇ ਕਦਮ

1. **ਉਦਾਹਰਣਾਂ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ**: ਆਪਣੇ ਵਰਤੋਂ ਦੇ ਕੇਸ ਨਾਲ ਮੇਲ ਖਾਂਦੇ ਪ੍ਰੀ-ਬਿਲਟ ਟੈਂਪਲੇਟ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ
2. **ਆਪਣੀਆਂ ਜ਼ਰੂਰਤਾਂ ਲਈ ਕਸਟਮਾਈਜ਼ ਕਰੋ**: ਢਾਂਚਾ ਅਤੇ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਵਿੱਚ ਸੋਧ ਕਰੋ
3. **ਨਿਗਰਾਨੀ ਜੋੜੋ**: ਵਿਸ਼ਤਾਰ ਵਾਲੀ ਦ੍ਰਿਸ਼ਟੀਯੋਗਤਾ ਲਾਗੂ ਕਰੋ
4. **ਲਾਗਤਾਂ ਵਿੱਚ ਸੁਧਾਰ ਕਰੋ**: ਆਪਣੇ ਬਜਟ ਲਈ ਸੰਰਚਨਾਵਾਂ ਨੂੰ ਬਿਹਤਰ ਬਣਾਓ
5. **ਆਪਣੀ ਤਜ਼ਵੀਜ਼ ਸੁਰੱਖਿਅਤ ਬਣਾਓ**: ਕਾਰਪੋਰੇਟ ਸੁਰੱਖਿਆ ਨમੂਨੇ ਲਾਗੂ ਕਰੋ
6. **ਉਤਪਾਦਨ ਲਈ ਸਕੇਲ ਕਰੋ**: ਬਹੁ-ਖੇਤਰ ਅਤੇ ਉੱਚ-ਉਪਲਬਧਤਾ ਫੀਚਰ ਜੋੜੋ

## 🎯 ਹੱਥ-ਨਾਲ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਮਾਡਲਾਂ ਚੈਟ ਐਪ ਤਜ਼ਵੀਜ਼ ਕਰੋ (30 ਮਿੰਟ)
**ਲਕਸ਼**: ਉਤਪਾਦ-ਤਿਆਰ AI ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਤਜ਼ਵੀਜ਼ ਅਤੇ ਟੈਸਟ ਕਰੋ

```bash
# ਟੈਮਪਲੇਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰੋ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ ਸੈੱਟ ਕਰੋ
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ਤੈਨਾਤ ਕਰੋ
azd up

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ਏਆਈ ਸਜ਼ੇਤਰ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor

# ਸਾਫ ਸਫਾਈ ਕਰੋ
azd down --force --purge
```

**ਕامیابی ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਤਜ਼ਵੀਜ਼ ਬਿਨਾਂ ਕਵੋਟਾ ਗਲਤੀਆਂ ਦੇ ਮੁਕੰਮਲ ਹੋਵੇ
- [ ] ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਚੈਟ ਇੰਟਰਫੇਸ ਤੱਕ ਪਹੁੰਚ ਹੋਵੇ
- [ ] ਸਵਾਲ ਪੁੱਛੇ ਜਾ ਸਕਦੇ ਹੋ ਅਤੇ AI-ਚਾਲਿਤ ਜਵਾਬ ਮਿਲਦੇ ਹਨ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਇਟਸ ਟੈਲੀਮੇਟਰੀ ਡੇਟਾ ਦਿਖਾਉਂਦਾ ਹੈ
- [ ] ਸੰਸਾਧਨਾਂ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਸਾਫ਼ ਕੀਤਾ ਗਿਆ

**ਅੰਦਾਜ਼ਿਤ ਖ਼ਰਚਾ**: 30 ਮਿੰਟ ਦੀ ਟੈਸਟਿੰਗ ਲਈ $5-10

### ਅਭਿਆਸ 2: ਇਕੱਠਾ ਮਾਡਲ ਤਜ਼ਵੀਜ਼ ਸੰਰਚਨਾ ਕਰੋ (45 ਮਿੰਟ)
**ਲਕਸ਼**: ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਨਾਲ ਕਈ AI ਮਾਡਲ ਤਜ਼ਵੀਜ਼ ਕਰੋ

```bash
# ਕਸਟਮ ਬਾਇਸਪ ਕੰਫਿਗਰੇਸ਼ਨ ਬਣਾਓ
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

# ਡਿਪਲੋ ਕਰੋ ਅਤੇ ਪੁਸ਼ਟੀ ਕਰੋ
azd provision
azd show
```

**ਕامیابی ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਕਈ ਮਾਡਲ ਸਫ਼ਲਤਾਪੂਰਵਕ ਤਜ਼ਵੀਜ਼ ਕੀਤੇ ਗਏ
- [ ] ਵੱਖ-ਵੱਖ ਸਮਰੱਥਾ ਸੈਟਿੰਗਜ਼ ਲਾਗੂ ਕੀਤੀਆਂ ਗਈਆਂ
- [ ] ਮਾਡਲ API ਰਾਹੀਂ ਪਹੁੰਚਯੋਗ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਵੱਲੋਂ ਦੋਹਾਂ ਮਾਡਲਾਂ ਨੂੰ ਕਾਲ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

### ਅਭਿਆਸ 3: ਖ਼ਰਚ ਨਿਗਰਾਨੀ ਲਾਗੂ ਕਰੋ (20 ਮਿੰਟ)
**ਲਕਸ਼**: ਬਜਟ ਅਲਾਰਮ ਅਤੇ ਖ਼ਰਚ ਟਰੇਕਿੰਗ ਸੈੱਟ ਕਰੋ

```bash
# ਬਜਟ ਚੇਤਾਵਨੀ ਬਾਈਸਪ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ
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

# ਬਜਟ ਚੇਤਾਵਨੀ ਤੈਅ ਕਰੋ
azd provision

# ਮੌਜੂਦਾ ਖਰਚੇ ਚੈੱਕ ਕਰੋ
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**ਕامیابی ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਅਜ਼ਯੂਰ ਵਿੱਚ ਬਜਟ ਅਲਾਰਟ ਬਣਾਇਆ ਗਿਆ
- [ ] ਈਮੇਲ ਸੂਚਨਾਵਾਂ ਸੰਰਚਿਤ
- [ ] ਅਜ਼ਯੂਰ ਪੋਰਟਲ ਵਿੱਚ ਖ਼ਰਚ ਡੇਟਾ ਦੇਖ ਸਕਦੇ ਹੋ
- [ ] ਬਜਟ ਸੀਮਾਵਾਂ ਠੀਕ ਢੰਗ ਨਾਲ ਸੈਟ ਕੀਤੀਆਂ ਗਈਆਂ

## 💡 ਅਕਸਰ ਪੁੱਛੇ ਗਏ ਸਵਾਲ

<details>
<summary><strong>ਮੈਂ ਵਿਕਾਸ ਦੌਰਾਨ ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਮਾਡਲਾਂ ਦੇ ਖ਼ਰਚੇ ਕਿਵੇਂ ਘਟਾ ਸਕਦਾ ਹਾਂ?</strong></summary>

1. **ਮੁਫ਼ਤ ਟੀਅਰ ਦੀ ਵਰਤੋਂ ਕਰੋ**: ਮਾਇਕਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਮਾਡਲ ਮਹੀਨੇ ਵਿੱਚ 50,000 ਟੋਕਨ ਮੁਫ਼ਤ ਦਿੰਦਾ ਹੈ
2. **ਸਮਰੱਥਾ ਘਟਾਓ**: ਵਿਕਾਸ ਲਈ 30+ ਦੀ ਬਜਾਏ 10 TPM ਸਮਰੱਥਾ ਸੈੱਟ ਕਰੋ
3. **azd down ਵਰਤੋਂ ਕਰੋ**: ਜਦੋਂ ਤਕਤਵੀਕਾਰੀ ਨਾ ਕਰ ਰਹੇ ਹੋ ਤਦ ਸਰੋਤਾਂ ਨੂੰ ਮੁਕਤ ਕਰੋ
4. **ਜਵਾਬ ਕੈਸ਼ ਕਰੋ**: ਪੁਨਰਾਵਰਤੀ ਸਵਾਲਾਂ ਲਈ Redis ਕੈਸ਼ ਲਾਗੂ ਕਰੋ
5. **ਪ੍ਰਾਂਪਟ ਇੰਜੀਨੀਅਰਿੰਗ ਵਰਤੋਂ**: ਪ੍ਰਭਾਵਸ਼ালী ਪ੍ਰਾਂਪਟਸ ਨਾਲ ਟੋਕਨ ਖਪਤ ਘਟਾਓ


```bash
# ਵਿਕਾਸ ਸੰਰਚਨਾ
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry ਮਾਡਲਾਂ ਅਤੇ OpenAI API ਵਿਚ ਕੀ ਫਰਕ ਹੈ?</strong></summary>

**Microsoft Foundry ਮਾਡਲ**:
- ਏਂਟਰপ্ৰਾਈਜ਼ ਸੁਰੱਖਿਆ ਅਤੇ ਅਨੁਕੂਲਤਾ
- ਨਿੱਜੀ ਨੈੱਟਵਰਕ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- SLA ਗਾਰੰਟੀਜ਼
- ਪ੍ਰਬੰਧਿਤ ਪਹਿਚਾਣ ਪ੍ਰਮਾਣਿਕਤਾ
- ਵੱਧ ਕੋਟੇ ਉਪਲਬਧ

**OpenAI API**:
- ਨਵੇਂ ਮਾਡਲਾਂ ਤੱਕ ਤੇਜ਼ ਪਹੁੰਚ
- ਸਧਾਰਣ ਸੈੱਟਅੱਪ
- ਘੱਟ ਪ੍ਰवੇਸ਼ ਰੁਕਾਵਟ
- ਸਿਰਫ਼ ਪਬਲਿਕ ਇੰਟਰਨੈੱਟ

ਉਤਪਾਦਨ ਐਪਸ ਲਈ, **Microsoft Foundry ਮਾਡਲ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ**.
</details>

<details>
<summary><strong>ਮੈਂ Microsoft Foundry ਮਾਡਲ ਕੋਟੇ ਵੱਧ ਗਿਆ ਤਰੁਟੀਆਂ ਨੂੰ ਕਿਵੇਂ ਸੰਭਾਲਾਂ?</strong></summary>

```bash
# ਮੌਜੂਦਾ ਕੋਟਾ ਚੈੱਕ ਕਰੋ
az cognitiveservices usage list --location eastus2

# ਵੱਖ-ਵੱਖ ਖੇਤਰ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION westus2
azd up

# ਸਮੇਂ ਲਈ ਸਮਰੱਥਾ ਘਟਾਓ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ਕੋਟਾ ਵਾਧੇ ਦੀ ਬੇਨਤੀ ਕਰੋ
# ਅਜ਼ੂਰ ਪੋਰਟਲ > ਕੋਟਾ > ਵਾਧੇ ਦੀ ਬੇਨਤੀ 'ਤੇ ਜਾਓ
```
</details>

<details>
<summary><strong>ਕੀ ਮੈਂ Microsoft Foundry ਮਾਡਲਾਂ ਨਾਲ ਆਪਣਾ ਡਾਟਾ ਵਰਤ ਸਕਦਾ ਹਾਂ?</strong></summary>

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

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) ਟੈਮਪਲੇਟ ਵੇਖੋ.
</details>

<details>
<summary><strong>ਮੈਂ AI ਮਾਡਲ ਦੇ ਐਂਡਪੌਇੰਟਾਂ ਨੂੰ ਕਿਵੇਂ ਸੁਰੱਖਿਅਤ ਕਰਾਂ?</strong></summary>

**ਸਰੋਤ ਅਮਲ**:
1. Managed Identity ਵਰਤੋ (ਕੋਈ API ਚਾਬੀਆਂ ਨਹੀਂ)
2. ਪ੍ਰਾਈਵੇਟ ਐਂਡਪੌਇੰਟਸ ਸਸ਼ਕਤ ਕਰੋ
3. ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ ਸਮੂਹਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
4. ਦਰ ਸੀਮਾ ਲਾਗੂ ਕਰੋ
5. ਰਾਜ ਦੀਆਂ ਚੀਜ਼ਾਂ ਲਈ Azure Key Vault ਵਰਤੋ

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

## ਕਮਿਊਨਿਟੀ ਅਤੇ ਸਹਿਯੋਗ

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [ਅਧਿਕਾਰਿਤ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/ai-studio/)
- **ਏਜੰਟ ਸਕਿਲਜ਼**: [Microsoft Foundry ਕੌਸ਼ਲ skills.sh 'ਤੇ](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ਆਪਣੇ ਸੰਪਾਦਕ ਵਿੱਚ Azure + Foundry ਏਜੰਟ ਕੌਸ਼ਲ `npx skills add microsoft/github-copilot-for-azure` ਨਾਲ ਇੰਸਟਾਲ ਕਰੋ

---

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਲਈ ਸ਼ੁਰੂਆਤੀ](../../README.md)
- **📖 ਵਰਤਮਾਨ ਚੈਪਟਰ**: ਚੈਪਟਰ 2 - AI-ਪਹਿਲਾ ਵਿਕਾਸ
- **⬅️ ਪਹਿਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 1: ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../chapter-01-foundation/first-project.md)
- **➡️ ਅਗਲਾ**: [AI ਮਾਡਲ ਤਾਇਨਾਤੀ](ai-model-deployment.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)

**ਸਹਾਇਤਾ ਚਾਹੀਦੀ ਹੈ?** ਸਾਡੇ ਕਮਿਊਨਿਟੀ ਚਰਚਾ ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ ਜਾਂ ਰਿਪੋਜ਼ਿਟਰੀ ਵਿੱਚ ਇੱਕ ਮੁੱਦਾ ਖੋਲ੍ਹੋ. Azure AI + AZD ਕਮਿਊਨਿਟੀ ਤੁਹਾਡੇ ਸਫਲ ਹੋਣ ਲਈ ਉੱਥੇ ਹੈ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->