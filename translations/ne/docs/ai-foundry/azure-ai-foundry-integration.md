<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T19:59:58+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "ne"
}
-->
# Azure AI Foundry को AZD सँग एकीकरण

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD को लागि शुरुवात](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ अघिल्लो अध्याय**: [अध्याय १: तपाईंको पहिलो प्रोजेक्ट](../getting-started/first-project.md)
- **➡️ अगाडि**: [AI मोडेल परिनियोजन](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../getting-started/configuration.md)

## अवलोकन

यो गाइडले Azure AI Foundry सेवाहरूलाई Azure Developer CLI (AZD) सँग कसरी एकीकृत गर्ने भनेर देखाउँछ ताकि AI एप्लिकेसन परिनियोजनलाई सरल बनाइयोस्। Azure AI Foundry ले AI एप्लिकेसन निर्माण, परिनियोजन, र व्यवस्थापनको लागि व्यापक प्लेटफर्म प्रदान गर्दछ, जबकि AZD ले पूर्वाधार र परिनियोजन प्रक्रियालाई सरल बनाउँछ।

## Azure AI Foundry के हो?

Azure AI Foundry माइक्रोसफ्टको एकीकृत प्लेटफर्म हो जसले निम्न समावेश गर्दछ:

- **मोडेल क्याटलग**: अत्याधुनिक AI मोडेलहरूको पहुँच
- **प्रम्प्ट फ्लो**: AI वर्कफ्लोहरूको भिजुअल डिजाइनर
- **AI Foundry पोर्टल**: AI एप्लिकेसनहरूको लागि एकीकृत विकास वातावरण
- **परिनियोजन विकल्पहरू**: बहु होस्टिंग र स्केलिंग विकल्पहरू
- **सुरक्षा र सुरक्षा**: जिम्मेवार AI सुविधाहरू समावेश

## AZD + Azure AI Foundry: सँगै राम्रो

| विशेषता | Azure AI Foundry | AZD एकीकरण लाभ |
|---------|-----------------|------------------------|
| **मोडेल परिनियोजन** | म्यानुअल पोर्टल परिनियोजन | स्वचालित, दोहोर्याउन मिल्ने परिनियोजन |
| **पूर्वाधार** | क्लिक-थ्रु प्रोभिजनिङ | पूर्वाधार कोडको रूपमा (Bicep) |
| **पर्यावरण व्यवस्थापन** | एकल वातावरण केन्द्रित | बहु वातावरण (डेभ/स्टेजिङ/प्रोड) |
| **CI/CD एकीकरण** | सीमित | GitHub Actions को देशी समर्थन |
| **खर्च व्यवस्थापन** | आधारभूत निगरानी | वातावरण-विशिष्ट खर्च अनुकूलन |

## पूर्वशर्तहरू

- उपयुक्त अनुमतिहरू भएको Azure सदस्यता
- Azure Developer CLI स्थापना गरिएको
- Azure OpenAI सेवाहरूको पहुँच
- Azure AI Foundry को आधारभूत ज्ञान

## कोर एकीकरण ढाँचाहरू

### ढाँचा १: Azure OpenAI एकीकरण

**प्रयोग केस**: Azure OpenAI मोडेलहरूसँग च्याट एप्लिकेसन परिनियोजन गर्नुहोस्

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

**पूर्वाधार (main.bicep):**
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

### ढाँचा २: AI खोज + RAG एकीकरण

**प्रयोग केस**: पुनःप्राप्ति-अग्मेन्टेड जेनेरेसन (RAG) एप्लिकेसन परिनियोजन गर्नुहोस्

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

### ढाँचा ३: दस्तावेज बुद्धिमत्ता एकीकरण

**प्रयोग केस**: दस्तावेज प्रशोधन र विश्लेषण वर्कफ्लोहरू

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

## 🔧 कन्फिगरेसन ढाँचाहरू

### वातावरण चर सेटअप

**उत्पादन कन्फिगरेसन:**
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

**विकास कन्फिगरेसन:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Key Vault को साथ सुरक्षित कन्फिगरेसन

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

## परिनियोजन वर्कफ्लोहरू

### एकल कमाण्ड परिनियोजन

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### वातावरण-विशिष्ट परिनियोजनहरू

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

## निगरानी र अवलोकन

### एप्लिकेसन इनसाइट्स एकीकरण

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

### खर्च निगरानी

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

## 🔐 सुरक्षा उत्तम अभ्यासहरू

### व्यवस्थापित पहिचान कन्फिगरेसन

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

### क्यासिङ रणनीतिहरू

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

### स्वतः-स्केलिंग कन्फिगरेसन

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

## सामान्य समस्याहरू समाधान गर्ने

### समस्या १: OpenAI कोटा समाप्त भयो

**लक्षणहरू:**
- परिनियोजन कोटा त्रुटिहरूको साथ असफल हुन्छ
- एप्लिकेसन लगहरूमा 429 त्रुटिहरू

**समाधानहरू:**
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

### समस्या २: प्रमाणीकरण असफलता

**लक्षणहरू:**
- AI सेवाहरू कल गर्दा 401/403 त्रुटिहरू
- "पहुंच अस्वीकृत" सन्देशहरू

**समाधानहरू:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या ३: मोडेल परिनियोजन समस्याहरू

**लक्षणहरू:**
- परिनियोजनमा मोडेलहरू उपलब्ध छैनन्
- विशिष्ट मोडेल संस्करणहरू असफल

**समाधानहरू:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## उदाहरण टेम्प्लेटहरू

### आधारभूत च्याट एप्लिकेसन

**रिपोजिटरी**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाहरू**: Azure OpenAI + Cognitive Search + App Service

**द्रुत शुरुवात**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### दस्तावेज प्रशोधन पाइपलाइन

**रिपोजिटरी**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**सेवाहरू**: Document Intelligence + Storage + Functions

**द्रुत शुरुवात**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG सहित उद्यम च्याट

**रिपोजिटरी**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाहरू**: Azure OpenAI + Search + Container Apps + Cosmos DB

**द्रुत शुरुवात**:
```bash
azd init --template contoso-chat
azd up
```

## अगाडि के गर्ने

1. **उदाहरणहरू प्रयास गर्नुहोस्**: तपाईंको प्रयोग केससँग मेल खाने पूर्व-निर्मित टेम्प्लेटबाट सुरु गर्नुहोस्
2. **आफ्नो आवश्यकताहरूको लागि अनुकूलन गर्नुहोस्**: पूर्वाधार र एप्लिकेसन कोड परिमार्जन गर्नुहोस्
3. **निगरानी थप्नुहोस्**: व्यापक अवलोकन कार्यान्वयन गर्नुहोस्
4. **खर्च अनुकूलन गर्नुहोस्**: तपाईंको बजेटको लागि कन्फिगरेसनहरू परिमार्जन गर्नुहोस्
5. **तपाईंको परिनियोजन सुरक्षित गर्नुहोस्**: उद्यम सुरक्षा ढाँचाहरू कार्यान्वयन गर्नुहोस्
6. **उत्पादनमा स्केल गर्नुहोस्**: बहु-क्षेत्र र उच्च-उपलब्धता सुविधाहरू थप्नुहोस्

## समुदाय र समर्थन

- **Azure AI Foundry Discord**: [#Azure च्यानल](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [समस्या र छलफलहरू](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [आधिकारिक दस्तावेज](https://learn.microsoft.com/azure/ai-studio/)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD को लागि शुरुवात](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ अघिल्लो अध्याय**: [अध्याय १: तपाईंको पहिलो प्रोजेक्ट](../getting-started/first-project.md)
- **➡️ अगाडि**: [AI मोडेल परिनियोजन](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../getting-started/configuration.md)

**मद चाहिन्छ?** हाम्रो समुदाय छलफलमा सामेल हुनुहोस् वा रिपोजिटरीमा समस्या खोल्नुहोस्। Azure AI + AZD समुदाय तपाईंलाई सफल बनाउन यहाँ छ!

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।