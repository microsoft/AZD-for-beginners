<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T17:34:28+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "hi"
}
-->
# Azure AI Foundry और AZD का इंटीग्रेशन

**पिछला:** [पहला प्रोजेक्ट](../getting-started/first-project.md) | **अगला:** [AI मॉडल डिप्लॉयमेंट](ai-model-deployment.md)

## परिचय

यह गाइड दिखाता है कि Azure AI Foundry सेवाओं को Azure Developer CLI (AZD) के साथ कैसे इंटीग्रेट करें ताकि AI एप्लिकेशन को आसानी से डिप्लॉय किया जा सके। Azure AI Foundry एक व्यापक प्लेटफ़ॉर्म प्रदान करता है जो AI एप्लिकेशन बनाने, डिप्लॉय करने और प्रबंधित करने में मदद करता है, जबकि AZD इंफ्रास्ट्रक्चर और डिप्लॉयमेंट प्रक्रिया को सरल बनाता है।

## Azure AI Foundry क्या है?

Azure AI Foundry माइक्रोसॉफ्ट का एकीकृत प्लेटफ़ॉर्म है जो AI डेवलपमेंट के लिए निम्नलिखित सुविधाएं प्रदान करता है:

- **मॉडल कैटलॉग**: अत्याधुनिक AI मॉडल्स तक पहुंच
- **प्रॉम्प्ट फ्लो**: AI वर्कफ़्लो के लिए विज़ुअल डिज़ाइनर
- **AI Foundry पोर्टल**: AI एप्लिकेशन के लिए इंटीग्रेटेड डेवलपमेंट एनवायरनमेंट
- **डिप्लॉयमेंट विकल्प**: होस्टिंग और स्केलिंग के कई विकल्प
- **सुरक्षा और सेफ्टी**: जिम्मेदार AI फीचर्स के साथ

## AZD + Azure AI Foundry: साथ में बेहतर

| फीचर | Azure AI Foundry | AZD इंटीग्रेशन का लाभ |
|------|------------------|-----------------------|
| **मॉडल डिप्लॉयमेंट** | मैनुअल पोर्टल डिप्लॉयमेंट | ऑटोमेटेड, रिपीटेबल डिप्लॉयमेंट्स |
| **इंफ्रास्ट्रक्चर** | क्लिक-थ्रू प्रोविज़निंग | इंफ्रास्ट्रक्चर ऐज़ कोड (Bicep) |
| **एनवायरनमेंट मैनेजमेंट** | सिंगल एनवायरनमेंट फोकस | मल्टी-एनवायरनमेंट (डेव/स्टेजिंग/प्रोड) |
| **CI/CD इंटीग्रेशन** | सीमित | नेटिव GitHub Actions सपोर्ट |
| **कॉस्ट मैनेजमेंट** | बेसिक मॉनिटरिंग | एनवायरनमेंट-विशिष्ट कॉस्ट ऑप्टिमाइज़ेशन |

## आवश्यकताएँ

- Azure सब्सक्रिप्शन जिसमें उपयुक्त अनुमतियाँ हों
- Azure Developer CLI इंस्टॉल किया हुआ हो
- Azure OpenAI सेवाओं तक पहुंच
- Azure AI Foundry की बेसिक जानकारी

## कोर इंटीग्रेशन पैटर्न्स

### पैटर्न 1: Azure OpenAI इंटीग्रेशन

**उपयोग का मामला**: Azure OpenAI मॉडल्स के साथ चैट एप्लिकेशन डिप्लॉय करें

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

**इंफ्रास्ट्रक्चर (main.bicep):**
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

### पैटर्न 2: AI सर्च + RAG इंटीग्रेशन

**उपयोग का मामला**: रिट्रीवल-ऑगमेंटेड जनरेशन (RAG) एप्लिकेशन डिप्लॉय करें

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

### पैटर्न 3: डॉक्यूमेंट इंटेलिजेंस इंटीग्रेशन

**उपयोग का मामला**: डॉक्यूमेंट प्रोसेसिंग और एनालिसिस वर्कफ़्लो

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

## 🔧 कॉन्फ़िगरेशन पैटर्न्स

### एनवायरनमेंट वेरिएबल्स सेटअप

**प्रोडक्शन कॉन्फ़िगरेशन:**
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

**डेवलपमेंट कॉन्फ़िगरेशन:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Key Vault के साथ सुरक्षित कॉन्फ़िगरेशन

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

## डिप्लॉयमेंट वर्कफ़्लो

### सिंगल कमांड डिप्लॉयमेंट

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### एनवायरनमेंट-विशिष्ट डिप्लॉयमेंट्स

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

## मॉनिटरिंग और ऑब्ज़र्वेबिलिटी

### एप्लिकेशन इनसाइट्स इंटीग्रेशन

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

### कॉस्ट मॉनिटरिंग

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

## 🔐 सुरक्षा के सर्वोत्तम उपाय

### मैनेज्ड आइडेंटिटी कॉन्फ़िगरेशन

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

### नेटवर्क सुरक्षा

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

## प्रदर्शन अनुकूलन

### कैशिंग रणनीतियाँ

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

### ऑटो-स्केलिंग कॉन्फ़िगरेशन

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

## सामान्य समस्याओं का समाधान

### समस्या 1: OpenAI कोटा समाप्त

**लक्षण:**
- डिप्लॉयमेंट कोटा एरर के साथ विफल होता है
- एप्लिकेशन लॉग्स में 429 एरर

**समाधान:**
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

### समस्या 2: ऑथेंटिकेशन विफलताएँ

**लक्षण:**
- AI सेवाओं को कॉल करते समय 401/403 एरर
- "एक्सेस डिनाइड" संदेश

**समाधान:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडल डिप्लॉयमेंट समस्याएँ

**लक्षण:**
- डिप्लॉयमेंट में मॉडल्स उपलब्ध नहीं
- विशिष्ट मॉडल वर्ज़न विफल हो रहे हैं

**समाधान:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## उदाहरण टेम्पलेट्स

### बेसिक चैट एप्लिकेशन

**रिपॉजिटरी**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाएँ**: Azure OpenAI + Cognitive Search + App Service

**त्वरित शुरुआत**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### डॉक्यूमेंट प्रोसेसिंग पाइपलाइन

**रिपॉजिटरी**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**सेवाएँ**: Document Intelligence + Storage + Functions

**त्वरित शुरुआत**:
```bash
azd init --template ai-document-processing
azd up
```

### एंटरप्राइज़ चैट RAG के साथ

**रिपॉजिटरी**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाएँ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**त्वरित शुरुआत**:
```bash
azd init --template contoso-chat
azd up
```

## अगले कदम

1. **उदाहरण आज़माएँ**: अपने उपयोग के मामले से मेल खाने वाले प्री-बिल्ट टेम्पलेट से शुरुआत करें
2. **अपनी ज़रूरतों के लिए कस्टमाइज़ करें**: इंफ्रास्ट्रक्चर और एप्लिकेशन कोड को संशोधित करें
3. **मॉनिटरिंग जोड़ें**: व्यापक ऑब्ज़र्वेबिलिटी लागू करें
4. **खर्चों को अनुकूलित करें**: अपने बजट के लिए कॉन्फ़िगरेशन को फाइन-ट्यून करें
5. **अपना डिप्लॉयमेंट सुरक्षित करें**: एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
6. **प्रोडक्शन तक स्केल करें**: मल्टी-रीजन और हाई-एवेलिबिलिटी फीचर्स जोड़ें

## समुदाय और सहायता

- **Azure AI Foundry Discord**: [#Azure चैनल](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [इश्यूज़ और चर्चाएँ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [आधिकारिक दस्तावेज़](https://learn.microsoft.com/azure/ai-studio/)

---

**पिछला:** [पहला प्रोजेक्ट](../getting-started/first-project.md) | **अगला:** [AI मॉडल डिप्लॉयमेंट](ai-model-deployment.md)

**सहायता चाहिए?** हमारे समुदाय चर्चाओं में शामिल हों या रिपॉजिटरी में एक इश्यू खोलें। Azure AI + AZD समुदाय आपकी सफलता में मदद करने के लिए यहाँ है!

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।