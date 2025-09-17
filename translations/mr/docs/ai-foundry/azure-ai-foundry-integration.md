<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T19:40:50+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "mr"
}
-->
# Azure AI Foundry AZD सोबत एकत्रीकरण

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD सुरुवातीसाठी](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ मागील अध्याय**: [अध्याय 1: तुमचा पहिला प्रकल्प](../getting-started/first-project.md)
- **➡️ पुढे**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../getting-started/configuration.md)

## आढावा

ही मार्गदर्शिका Azure AI Foundry सेवा Azure Developer CLI (AZD) सोबत एकत्र कशी करायची हे दाखवते, ज्यामुळे AI अॅप्लिकेशन डिप्लॉयमेंट सुलभ होते. Azure AI Foundry एक व्यापक प्लॅटफॉर्म प्रदान करते जे AI अॅप्लिकेशन तयार करणे, डिप्लॉय करणे आणि व्यवस्थापित करणे सुलभ करते, तर AZD इन्फ्रास्ट्रक्चर आणि डिप्लॉयमेंट प्रक्रिया सुलभ करते.

## Azure AI Foundry म्हणजे काय?

Azure AI Foundry हे Microsoft चे AI विकासासाठी एकत्रित प्लॅटफॉर्म आहे ज्यामध्ये समाविष्ट आहे:

- **मॉडेल कॅटलॉग**: अत्याधुनिक AI मॉडेल्ससाठी प्रवेश
- **प्रॉम्प्ट फ्लो**: AI वर्कफ्लो साठी व्हिज्युअल डिझायनर
- **AI Foundry पोर्टल**: AI अॅप्लिकेशनसाठी एकत्रित विकास वातावरण
- **डिप्लॉयमेंट पर्याय**: होस्टिंग आणि स्केलिंगसाठी अनेक पर्याय
- **सुरक्षितता आणि सुरक्षा**: जबाबदार AI वैशिष्ट्ये अंगभूत

## AZD + Azure AI Foundry: एकत्रित फायदे

| वैशिष्ट्य | Azure AI Foundry | AZD एकत्रीकरणाचा फायदा |
|-----------|------------------|------------------------|
| **मॉडेल डिप्लॉयमेंट** | पोर्टलद्वारे मॅन्युअल डिप्लॉयमेंट | स्वयंचलित, पुनरावृत्तीक्षम डिप्लॉयमेंट |
| **इन्फ्रास्ट्रक्चर** | क्लिक-थ्रू प्रोव्हिजनिंग | कोड म्हणून इन्फ्रास्ट्रक्चर (Bicep) |
| **पर्यावरण व्यवस्थापन** | एकाच पर्यावरणावर लक्ष केंद्रित | बहु-पर्यावरण (डेव्ह/स्टेजिंग/प्रॉड) |
| **CI/CD एकत्रीकरण** | मर्यादित | GitHub Actions साठी मूळ समर्थन |
| **खर्च व्यवस्थापन** | मूलभूत मॉनिटरिंग | पर्यावरण-विशिष्ट खर्च अनुकूलन |

## पूर्वअट

- योग्य परवानग्यांसह Azure सदस्यता
- Azure Developer CLI स्थापित
- Azure OpenAI सेवांसाठी प्रवेश
- Azure AI Foundry ची मूलभूत ओळख

## मुख्य एकत्रीकरण नमुने

### नमुना 1: Azure OpenAI एकत्रीकरण

**वापर प्रकरण**: Azure OpenAI मॉडेल्ससह चॅट अॅप्लिकेशन डिप्लॉय करा

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

**इन्फ्रास्ट्रक्चर (main.bicep):**
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

### नमुना 2: AI शोध + RAG एकत्रीकरण

**वापर प्रकरण**: Retrieval-Augmented Generation (RAG) अॅप्लिकेशन डिप्लॉय करा

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

### नमुना 3: दस्तऐवज बुद्धिमत्ता एकत्रीकरण

**वापर प्रकरण**: दस्तऐवज प्रक्रिया आणि विश्लेषण वर्कफ्लो

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

## 🔧 कॉन्फिगरेशन नमुने

### पर्यावरण व्हेरिएबल्स सेटअप

**प्रॉडक्शन कॉन्फिगरेशन:**
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

**विकसनशील कॉन्फिगरेशन:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Key Vault सह सुरक्षित कॉन्फिगरेशन

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

## डिप्लॉयमेंट वर्कफ्लो

### सिंगल कमांड डिप्लॉयमेंट

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### पर्यावरण-विशिष्ट डिप्लॉयमेंट

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

## मॉनिटरिंग आणि निरीक्षण

### Application Insights एकत्रीकरण

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

### खर्च मॉनिटरिंग

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

## 🔐 सुरक्षा सर्वोत्तम पद्धती

### व्यवस्थापित ओळख कॉन्फिगरेशन

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

## कार्यक्षमता अनुकूलन

### कॅशिंग धोरणे

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

### ऑटो-स्केलिंग कॉन्फिगरेशन

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

## सामान्य समस्या सोडवणे

### समस्या 1: OpenAI कोटा ओलांडला

**लक्षणे:**
- कोटा त्रुटींसह डिप्लॉयमेंट अयशस्वी
- अॅप्लिकेशन लॉगमध्ये 429 त्रुटी

**उपाय:**
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

### समस्या 2: प्रमाणीकरण अयशस्वी

**लक्षणे:**
- AI सेवांना कॉल करताना 401/403 त्रुटी
- "प्रवेश नाकारला" संदेश

**उपाय:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडेल डिप्लॉयमेंट समस्या

**लक्षणे:**
- डिप्लॉयमेंटमध्ये मॉडेल्स उपलब्ध नाहीत
- विशिष्ट मॉडेल आवृत्त्या अयशस्वी

**उपाय:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## उदाहरण टेम्पलेट्स

### मूलभूत चॅट अॅप्लिकेशन

**संग्रह**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवा**: Azure OpenAI + Cognitive Search + App Service

**जलद सुरुवात**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### दस्तऐवज प्रक्रिया पाइपलाइन

**संग्रह**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**सेवा**: Document Intelligence + Storage + Functions

**जलद सुरुवात**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG सह एंटरप्राइझ चॅट

**संग्रह**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवा**: Azure OpenAI + Search + Container Apps + Cosmos DB

**जलद सुरुवात**:
```bash
azd init --template contoso-chat
azd up
```

## पुढील पायऱ्या

1. **उदाहरणे वापरा**: तुमच्या वापर प्रकरणाशी जुळणारे पूर्व-निर्मित टेम्पलेट वापरून सुरुवात करा
2. **तुमच्या गरजांसाठी सानुकूलित करा**: इन्फ्रास्ट्रक्चर आणि अॅप्लिकेशन कोड सुधारित करा
3. **मॉनिटरिंग जोडा**: व्यापक निरीक्षण अंमलात आणा
4. **खर्च अनुकूलित करा**: तुमच्या बजेटसाठी कॉन्फिगरेशन सुधारित करा
5. **तुमचे डिप्लॉयमेंट सुरक्षित करा**: एंटरप्राइझ सुरक्षा नमुने अंमलात आणा
6. **प्रॉडक्शनसाठी स्केल करा**: मल्टी-रीजन आणि उच्च-उपलब्धता वैशिष्ट्ये जोडा

## समुदाय आणि समर्थन

- **Azure AI Foundry Discord**: [#Azure चॅनल](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [समस्या आणि चर्चा](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [अधिकृत दस्तऐवज](https://learn.microsoft.com/azure/ai-studio/)

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD सुरुवातीसाठी](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ मागील अध्याय**: [अध्याय 1: तुमचा पहिला प्रकल्प](../getting-started/first-project.md)
- **➡️ पुढे**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../getting-started/configuration.md)

**मदतीची गरज आहे?** आमच्या समुदाय चर्चांमध्ये सामील व्हा किंवा रेपॉझिटरीमध्ये समस्या उघडा. Azure AI + AZD समुदाय तुम्हाला यशस्वी होण्यासाठी मदत करण्यासाठी येथे आहे!

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण होणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.