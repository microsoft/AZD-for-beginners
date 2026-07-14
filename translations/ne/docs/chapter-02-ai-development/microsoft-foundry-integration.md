# माइक्रोसफ्ट फाउन्ड्रीको एकीकरण AZD सँग

**अध्याय नेभिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ अघिल्लो अध्याय**: [अध्याय १: तपाईंको पहिलो प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ अर्को**: [AI मोडेल परिनियोजन](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

## अवलोकन

यो मार्गदर्शिकाले माइक्रोसफ्ट फाउन्ड्री सेवाहरूलाई एज़्योर डिभेलपर CLI (AZD) सँग कसरी एकीकृत गर्ने देखाउँछ जसले AI एप्लिकेशनहरूको सहज परिनियोजनलाई सजिलो बनाउँछ। माइक्रोसफ्ट फाउन्ड्री AI एप्लिकेशनहरू निर्माण, परिनियोजन, र व्यवस्थापनका लागि विस्तृत प्लेटफर्म प्रदान गर्छ भने AZD पूर्वाधार र परिनियोजन प्रक्रियालाई सजिलो बनाउँछ।

## माइक्रोसफ्ट फाउन्ड्री के हो?

माइक्रोसफ्ट फाउन्ड्री माइक्रोसफ्टको एकीकृत AI विकास प्लेटफर्म हो जुन समावेश गर्दछ:

- **मोडेल क्याटलग**: अत्याधुनिक AI मोडेलहरूको पहुँच
- **प्राम्प्ट फ्लो**: AI वर्कफ्लोहरूको लागि दृश्य डिजाइनर
- **माइक्रोसफ्ट फाउन्ड्री पोर्टल**: AI एप्लिकेशनहरूको एकीकृत विकास वातावरण
- **परिनियोजन विकल्पहरू**: विभिन्न होस्टिंग र स्केलिंग विकल्पहरू
- **सुरक्षा र सुरक्षा**: बनाइएको जिम्मेवार AI फीचरहरू

## AZD + माइक्रोसफ्ट फाउन्ड्री: सँगै राम्रो

| सुविधा | माइक्रोसफ्ट फाउन्ड्री | AZD एकीकरण लाभ |
|---------|-----------------|------------------------|
| **मोडेल परिनियोजन** | म्यानुअल पोर्टल परिनियोजन | स्वचालित, दोहोरिने परिनियोजनहरू |
| **पूर्वाधार** | क्लिक-थ्रु प्रावधान | पूर्वाधार कोडको रूपमा (Bicep) |
| **पर्यावरण व्यवस्थापन** | एकल पर्यावरण केन्द्रित | बहु-पर्यावरण (डेभ/स्टेजिंग/प्रोड) |
| **CI/CD एकीकरण** | सीमित | नेटिभ GitHub Actions समर्थन |
| **लागत व्यवस्थापन** | आधारभूत अनुगमन | पर्यावरण-विशिष्ट लागत अनुकूलन |

## पूर्व आवश्यकताहरू

- उपयुक्त अनुमतिहरू सहित Azure सदस्यता
- Azure Developer CLI स्थापना गरिएको
- माइक्रोसफ्ट फाउन्ड्री मोडेल सेवाहरूमा पहुँच
- माइक्रोसफ्ट फाउन्ड्रीसँग आधारभूत परिचय

> **हालको AZD आधाररेखा:** यी उदाहरणहरू `azd` `1.27.1` सँग समीक्षा गरिएको छ। AI एजेन्ट वर्कफ्लोको लागि, हालको पूर्वावलोकन एक्सटेन्सन रिलिज प्रयोग गर्नुहोस् र सुरु गर्नु अघि आफ्नो स्थापना संस्करण जाँच गर्नुहोस्।

## मुख्य एकीकरण ढाँचा

### ढाँचा १: माइक्रोसफ्ट फाउन्ड्री मोडेलहरू एकीकरण

**प्रयोग केस**: माइक्रोसफ्ट फाउन्ड्री मोडेलहरूसँग च्याट एप्लिकेशनहरू परिनियोजन गर्नुहोस्

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

### ढाँचा २: AI खोज + RAG एकीकरण

**प्रयोग केस**: पुन:प्राप्ति-सुदृढित उत्पादन (RAG) एप्लिकेशनहरू परिनियोजन गर्नुहोस्

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

### ढाँचा ३: कागजात बुद्धिमत्ता एकीकरण

**प्रयोग केस**: कागजात प्रशोधन र विश्लेषण वर्कफ्लोहरू

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

## 🔧 कन्फिगरेसन ढाँचा

### वातावरण भेरिएबल सेटअप

**उत्पादन कन्फिगरेसन:**
```bash
# मुख्य AI सेवा
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मोडेल कन्फिगरेसनहरू
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# प्रदर्शन सेटिङहरू
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**विकास कन्फिगरेसन:**
```bash
# विकासको लागि लागत-अनुकूलित सेटिङहरू
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # निःशुल्क स्तर
```

### की भल्टसहित सुरक्षित कन्फिगरेसन

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

### फाउन्ड्रीका लागि AZD एक्सटेन्सनहरू

AZD ले माइक्रोसफ्ट फाउन्ड्री सेवासँग काम गर्दा AI-विशिष्ट क्षमताहरू थप्ने एक्सटेन्सनहरू प्रदान गर्दछ:

```bash
# Foundry एजेन्ट विस्तार स्थापना गर्नुहोस्
azd extension install azure.ai.agents

# फाइन-ट्यूनिङ विस्तार स्थापना गर्नुहोस्
azd extension install azure.ai.finetune

# अनुकूलित मोडेलहरू विस्तार स्थापना गर्नुहोस्
azd extension install azure.ai.models

# स्थापना गरिएका विस्तारहरूको सूची बनाउनुहोस्
azd extension list --installed

# हाल स्थापना गरिएको एजेन्ट विस्तार संस्करण जाँच्नुहोस्
azd extension show azure.ai.agents
```

AI एक्सटेन्सनहरू अझै पनि पूर्वावलोकन चरणमा छिटो अघि बढ्दैछन्। यदि कुनै कमाण्ड प्रदर्शन यहाँ देखाएको भन्दा फरक भयो भने, प्रोजेक्ट आफैंलाई ट्रबलसुट गर्नु अघि सम्बन्धित एक्सटेन्सनलाई अपग्रेड गर्नुहोस्।

### `azd ai` सँग एजेन्ट-प्रथम परिनियोजन

यदि तपाईंसँग एजेन्ट म्यानिफेस्ट छ भने, `azd ai agent init` प्रयोग गरी फाउन्ड्री एजेन्ट सेवामा जोडिएको प्रोजेक्ट स्क्याफोल्ड गर्नुहोस्:

```bash
# एजेन्ट म्यानिफेस्टबाट आरम्भ गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure मा डिप्लॉय गर्नुहोस्
azd up
```

`azure.ai.agents` का हालका पूर्वावलोकन रिलिजहरूले `azd ai agent init` को लागि टेम्प्लेट-आधारित इनिसियलाइजेसन समर्थन पनि थपेका छन्। यदि तपाईँ नयाँ एजेन्ट नमूनाहरू पछ्याइरहनु भएको छ भने, तपाईँले स्थापना गरेको संस्करणमा उपलब्ध सटीक फ्ल्यागहरूका लागि एक्सटेन्सन मद्दत जाँच गर्नुहोस्।

पूर्ण कमाण्ड रेफरेन्स र फ्ल्यागहरूको लागि [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) हेर्नुहोस्।

### एकल कमाण्ड परिनियोजन

```bash
# सबै कुरा एक आदेशले तैनाथ गर्नुहोस्
azd up

# वा क्रमिक रूपमा तैनाथ गर्नुहोस्
azd provision  # केवल पूर्वाधार
azd deploy     # केवल अनुप्रयोग

# azd 1.23.11+ मा लामो समय चल्ने AI अनुप्रयोग तैनाथीकरणको लागि
azd deploy --timeout 1800
```

### वातावरण-विशिष्ट परिनियोजनहरू

```bash
# विकास वातावरण
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# उत्पादन वातावरण
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## अनुगमन र अवलोकनयोग्यता

### एप्लिकेशन इनसाइट्स एकीकरण

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

### लागत अनुगमन

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

## 🔐 सुरक्षा सर्वश्रेष्ठ अभ्यासहरू

### व्यवस्थापन गरिएको पहिचान कन्फिगरेसन

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

### अटो-स्केलिंग कन्फिगरेसन

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

## सामान्य समस्याहरूको समाधान

### समस्या १: OpenAI कोटा अधिक

**लक्षणहरू:**
- परिनियोजन कोटा त्रुटिहरूका कारण असफल हुन्छ
- आवेदन लगहरूमा 429 त्रुटिहरू

**समाधानहरू:**
```bash
# हालको कोटा प्रयोग जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus

# विभिन्न क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूपमा क्षमता कम गर्नुहोस्
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या २: प्रमाणीकरण विफलताहरू

**लक्षणहरू:**
- AI सेवाहरू कल गर्दा 401/403 त्रुटिहरू
- "पहुँच अस्वीकृत" सन्देशहरू

**समाधानहरू:**
```bash
# भूमिका असाइनमेन्टहरू जाँच गर्नुहोस्
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# व्यवस्थापन गरिएको पहिचान कन्फिगरेसन जाँच गर्नुहोस्
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# कुञ्जी भण्डार पहुँच प्रमाणित गर्नुहोस्
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या ३: मोडेल परिनियोजन समस्या

**लक्षणहरू:**
- परिनियोजनमा मोडेलहरू उपलब्ध छैनन्
- विशेष मोडेल संस्करणहरू असफल छन्

**समाधानहरू:**
```bash
# क्षेत्र अनुसार उपलब्ध मोडेलहरूको सूची
az cognitiveservices model list --location eastus

# बाइसिप टेम्प्लेटमा मोडेल संस्करण अद्यावधिक गर्नुहोस्
# मोडेल क्षमता आवश्यकताहरू जाँच गर्नुहोस्
```

## उदाहरण टेम्प्लेटहरू

### RAG च्याट एप्लिकेशन (Python)

**रेपोजिटोरी**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**वर्णन**: सबैभन्दा लोकप्रिय Azure AI नमूना — उत्पादन-तयार RAG च्याट एप्लिकेशन जसले तपाईँलाई आफ्नै कागजातहरूमा प्रश्न सोध्न अनुमति दिन्छ। GPT-4.1-mini च्याटका लागि, text-embedding-3-large एम्बेडिङ्सका लागि, र Azure AI Search पुन:प्राप्तिका लागि प्रयोग गर्दछ। बहु-मोडल कागजातहरू, आवाज इनपुट/आउटपुट, माइक्रोसफ्ट एन्ट्रा प्रमाणीकरण, र एप्लिकेशन इनसाइट्स ट्रेसिंग समर्थन गर्दछ।

**छिटो सुरुवात**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG च्याट एप्लिकेशन (.NET)

**रेपोजिटोरी**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**वर्णन**: Python RAG च्याट नमुनाको .NET/C# समकक्ष। ASP.NET कोर मिनिमल API र ब्लाजर वेबअसेम्बली फ्रन्टएन्डका साथ निर्माण गरिएको। भ्वाइस च्याट, GPT-4o-mini भिजन समर्थन, र सहायता .NET MAUI ब्लाजर हाइब्रिड डेस्कटप/मोबाइल क्लाइन्ट समावेश गर्दछ।

**छिटो सुरुवात**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG च्याट एप्लिकेशन (Java)

**रेपोजिटोरी**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**वर्णन**: Langchain4J प्रयोग गरी AI समन्वयका लागि Java संस्करणको RAG च्याट नमूना। माइक्रोसर्भिस इभेन्ट-ड्राइभन आर्किटेक्चर, विभिन्न खोज रणनीतिहरू (टेक्स्ट, भेक्टर, हाइब्रिड), Azure Document Intelligence सँग कागजात अपलोड, र Azure Container Apps वा Azure Kubernetes Service मा परिनियोजन समर्थन गर्दछ।

**छिटो सुरुवात**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry सहित एंटरप्राइज रिटेल कोपायलट

**रेपोजिटोरी**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाहरू**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**वर्णन**: माइक्रोसफ्ट फाउन्ड्री र Prompty प्रयोग गरी अन्त-to-अन्त रिटेल RAG कोपायलट। Contoso आउटडोर रिटेलर च्याटबोट जसले प्रतिक्रिया उत्पादन क्याटलग र ग्राहक अर्डर डाटामा आधारित बनाउँछ। पूर्ण GenAIOps वर्कफ्लो प्रदर्शन गर्दछ — Prompty सँग प्रोटोटाइप, AI-सहायक मूल्यांकनकर्ताहरूसँग मूल्यांकन, र AZD मार्फत Container Apps मा परिनियोजन।

**छिटो सुरुवात**:
```bash
azd init --template contoso-chat
azd up
```

### सिर्जनात्मक लेखन बहु-एजेन्ट एप्लिकेशन

**रेपोजिटोरी**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**सेवाहरू**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**वर्णन**: Prompty सँग AI एजेन्ट समन्वय प्रदर्शन गर्ने बहु-एजेन्ट नमूना। अनुसन्धान एजेन्ट (Bing Grounding Azure AI Agent Service मा), उत्पाद एजेन्ट (Azure AI Search), लेखक एजेन्ट, र सम्पादक एजेन्ट समावेश गरी राम्रोसँग अनुसन्धान गरिएका लेखहरू संयुक्त रूपमा उत्पादन गर्दछ। GitHub Actions मा मूल्यांकनसहित CI/CD समावेश छ।

**छिटो सुरुवात**:
```bash
azd init --template contoso-creative-writer
azd up
```

### सर्वरलेस RAG च्याट (JavaScript/TypeScript)

**रेपोजिटोरी**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**सेवाहरू**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**वर्णन**: LangChain.js प्रयोग गरी पूर्ण सर्वरलेस RAG च्याटबोट जसमा Azure Functions API का लागि र Azure Static Web Apps होस्टिंगका लागि। Azure Cosmos DB लाई भेक्टर स्टोर र च्याट इतिहास डाटाबेस दुबैको रूपमा प्रयोग गर्दछ। शून्य खर्च परीक्षणको लागि Ollama सँग स्थानीय विकासलाई समर्थन गर्दछ।

**छिटो सुरुवात**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### तपाईंको डाटा समाधान छिटो चालिका लागि च्याट

**रेपोजिटोरी**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**वर्णन**: कागजात अपलोड/व्यवस्थापनका लागि एडमिन पोर्टलसहितको उध्यम-ग्रेड RAG समाधान छिटो चालिका, विभिन्न आयोजक विकल्पहरू (Semantic Kernel, LangChain, Prompt Flow), भाषणदेखि-पाठ, माइक्रोसफ्ट टीम्स एकीकरण, र PostgreSQL वा Cosmos DB ब्याकएन्डको विकल्प। उत्पादन RAG परिदृश्यहरूका लागि अनुकूलनयोग्य सुरुवात बिन्दुको रूपमा डिजाइन गरिएको।

**छिटो सुरुवात**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI यात्रा एजेन्टहरू — बहु-एजेन्ट MCP समन्वय

**रेपोजिटोरी**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**सेवाहरू**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**वर्णन**: तीन फ्रेमवर्कहरू (LangChain.js, LlamaIndex.TS, र Microsoft Agent Framework) प्रयोग गरी बहु-एजेन्ट AI समन्वयको लागि संदर्भ आवेदन। चार भाषाहरूमा MCP (Model Context Protocol) सर्भरहरू सहित जुन सर्वरलेस Azure Container Apps को रूपमा परिनियोजित गरिएको छ र OpenTelemetry अनुगमन छ।

**छिटो सुरुवात**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI स्टार्टर

**रेपोजिटोरी**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**सेवाहरू**: Azure AI सेवाहरू + Azure OpenAI

**वर्णन**: न्यूनतम Bicep टेम्पलेट जुन Azure AI सेवाहरू र कन्फिगर गरिएको मेसिन लर्निङ मोडेलहरूसँग परिनियोजन गर्छ। जब तपाईँलाई पूर्ण एप्लिकेशन स्ट्याक बिना Azure AI पूर्वाधार मात्र चाहिन्छ तब हल्का सुरुवात बिन्दु।

**छिटो सुरुवात**:
```bash
azd init --template azd-ai-starter
azd up
```

> **थप टेम्प्लेटहरू ब्राउज गर्नुहोस्**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) मा ८०+ AI-विशिष्ट AZD टेम्प्लेटहरू भाषाहरू र परिदृश्यहरूमा अवलोकन गर्नुहोस्।

## आगामी कदमहरू

1. **उदाहरणहरू प्रयास गर्नुहोस्**: आफ्नो प्रयोग केससँग मिल्ने पूर्व-निर्मित टेम्प्लेटबाट सुरु गर्नुहोस्
2. **आफ्नो आवश्यकता अनुसार अनुकूलन गर्नुहोस्**: पूर्वाधार र एप्लिकेशन कोड परिवर्तन गर्नुहोस्
3. **अनुगमन थप्नुहोस्**: पूर्ण अवलोकनयोग्यता लागू गर्नुहोस्
4. **लागतहरूलाई अनुकूलित गर्नुहोस्**: आफ्नो बजेटको लागि कन्फिगरेसनहरू समायोजन गर्नुहोस्
5. **आफ्नो परिनियोजन सुरक्षित गर्नुहोस्**: एंटरप्राइज सुरक्षा ढाँचाहरू लागू गर्नुहोस्
6. **उत्पादनमा स्केल गर्नुहोस्**: बहु-क्षेत्र र उच्च-उपलब्धता सुविधाहरू थप्नुहोस्

## 🎯 व्यावहारिक अभ्यासहरू

### अभ्यास १: माइक्रोसफ्ट फाउन्ड्री मोडेलहरूको च्याट एप परिनियोजन (३० मिनेट)
**लक्ष्य**: उत्पादन-तयार AI च्याट एप्लिकेशन परिनियोजन र परीक्षण गर्नुहोस्

```bash
# टेम्प्लेट सुरु गर्नुहोस्
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# वातावरण भेरियेबलहरू सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# परिनियोजन गर्नुहोस्
azd up

# अनुप्रयोग परीक्षण गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI अपरेसनहरु अनुगमन गर्नुहोस्
azd monitor

# सफाई गर्नुहोस्
azd down --force --purge
```

**सफलताको मापदण्ड:**
- [ ] कोटा त्रुटिहरू बिना परिनियोजन पूरा हुन्छ
- [ ] ब्राउजरमा च्याट इन्टरफेस पहुँच योग्य हुन्छ
- [ ] प्रश्न सोध्न र AI-संचालित जवाफहरू प्राप्त गर्न सकिन्छ
- [ ] एप्लिकेशन इनसाइट्सले टेलीमेट्री डेटा देखाउँछ
- [ ] स्रोतहरू सफलतापूर्वक सफा गरियो

**अनुमानित लागत**: ३० मिनेट परीक्षणका लागि $५-१०

### अभ्यास २: बहु-मोडेल परिनियोजन कन्फिगरेसन (४५ मिनेट)
**लक्ष्य**: फरक कन्फिगरेसनहरू सहित बहु AI मोडेलहरू परिनियोजन गर्नुहोस्

```bash
# अनुकूलित Bicep कन्फिगरेसन सिर्जना गर्नुहोस्
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

# तैनाथ गर्नुहोस् र प्रमाणित गर्नुहोस्
azd provision
azd show
```

**सफलताको मापदण्ड:**
- [ ] धेरै मोडेलहरू सफलतापूर्वक परिनियोजित
- [ ] भिन्न क्षमता सेटिङहरू लागू
- [ ] मोडेलहरू API मार्फत पहुँचयोग्य
- [ ] एप्लिकेशनबाट दुवै मोडेलहरू कल गर्न सकिन्छ

### अभ्यास ३: लागत अनुगमन लागू गर्नुहोस् (२० मिनेट)
**लक्ष्य**: बजेट अलर्ट र लागत ट्र्याकिङ सेट अप गर्नुहोस्

```bash
# बाइसेपमा बजेट अलर्ट थप्नुहोस्
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

# बजेट अलर्ट तैनाथ गर्नुहोस्
azd provision

# वर्तमान खर्च जाँच गर्नुहोस्
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**सफलताको मापदण्ड:**
- [ ] Azure मा बजेट अलर्ट सिर्जना गरियो
- [ ] इमेल सूचनाहरू कन्फिगर गरियो
- [ ] Azure पोर्टलमा लागत डेटा हेर्न सकिन्छ
- [ ] बजेट सीमा उचित रूपमा सेट गरियो

## 💡 प्रायः पूछिने प्रश्नहरू

<details>
<summary><strong>विकासको समयमा माइक्रोसफ्ट फाउन्ड्री मोडेलहरूको लागत कसरी घटाउने?</strong></summary>

१. **नि:शुल्क तह प्रयोग गर्नुहोस्**: माइक्रोसफ्ट फाउन्ड्री मोडेलहरूले ५०,००० टोकन/महिना नि:शुल्क प्रदान गर्दछ
२. **क्षमता घटाउनुहोस्**: विकासका लागि ३०+ को सट्टा १० TPM सेट गर्नुहोस्
३. **azd down प्रयोग गर्नुहोस्**: सक्रिय रूपमा विकास नगर्दा स्रोतहरू खाली गर्नुहोस्
४. **प्रतिक्रियाहरू क्यास गर्नुहोस्**: बारम्बार सोधिने प्रश्नहरूको लागि Redis क्यास लागू गर्नुहोस्
५. **प्राम्प्ट इन्जिनियरींग प्रयोग गर्नुहोस्**: कुशल प्राम्प्टहरूसँग टोकन प्रयोग घटाउनुहोस्


```bash
# विकास कन्फिगरेसन
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry मोडेलहरू र OpenAI API बीचमा के फरक छ?</strong></summary>

**Microsoft Foundry मोडेलहरू**:
- उद्यम सुरक्षा र अनुपालन
- निजी नेटवर्क एकीकरण
- SLA प्रतिबद्धताहरू
- प्रबन्धित पहिचान प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नयाँ मोडेलहरूको छिटो पहुँच
- सरल सेटअप
- कम प्रवेश बाधा
- सार्वजनिक इन्टरनेट मात्र

उत्पादन एपहरूको लागि, **Microsoft Foundry मोडेलहरू सिफारिस गरिन्छ**।
</details>

<details>
<summary><strong>Microsoft Foundry मोडेल कोटा नाघ्ने त्रुटिहरू कसरी व्यवस्थापन गर्ने?</strong></summary>

```bash
# हालको कोटा जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus2

# फरक क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up

# क्षमता अस्थायी रूपमा घटाउनुहोस्
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वृद्धि अनुरोध गर्नुहोस्
# Azure Portal > Quotas > Request increase मा जानुहोस्
```
</details>

<details>
<summary><strong>के म Microsoft Foundry मोडेलहरूसँग मेरो आफ्नै डाटा प्रयोग गर्न सक्छु?</strong></summary>

हो! RAG (Retrieval Augmented Generation) का लागि **Azure AI Search** प्रयोग गर्नुहोस्:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्प्लेट हेर्नुहोस्।
</details>

<details>
<summary><strong>म कसरी AI मोडेल अन्त्यबिन्दुहरूलाई सुरक्षित बनाउने?</strong></summary>

**सर्वोत्तम अभ्यासहरू**:
1. प्रबन्धित पहिचान प्रयोग गर्नुहोस् (API कुञ्जीहरू छैनन्)
2. निजी अन्त्यबिन्दु सक्षम गर्नुहोस्
3. नेटवर्क सुरक्षा समूहहरू कन्फिगर गर्नुहोस्
4. दर सीमितीकरण लागू गर्नुहोस्
5. गुप्तहरूका लागि Azure Key Vault प्रयोग गर्नुहोस्

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

## समुदाय र समर्थन

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - आफ्नो सम्पादकमा `npx skills add microsoft/github-copilot-for-azure` सँग Azure + Foundry एजेन्ट स्किलहरू स्थापना गर्नुहोस्

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ अघिल्लो अध्याय**: [अध्याय 1: तपाईंको पहिलो परियोजना](../chapter-01-foundation/first-project.md)
- **➡️ अर्को**: [AI मोडेल डिप्लोयमेन्ट](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

**मद्दत चाहिन्छ?** हाम्रो समुदाय छलफलहरूमा सामेल हुनुहोस् वा रिपोजिटोरीमा समस्या खोल्नुहोस्। Azure AI + AZD समुदाय तपाईंको सफलताको लागि यहाँ छ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->