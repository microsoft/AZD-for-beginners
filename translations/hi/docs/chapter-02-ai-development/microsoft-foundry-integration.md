# माइक्रोसॉफ्ट फाउंड्री का AZD के साथ एकीकरण

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [शुरुआती के लिए AZD](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - एआई-फर्स्ट विकास
- **⬅️ पिछला अध्याय**: [अध्याय 1: आपकी पहली परियोजना](../chapter-01-foundation/first-project.md)
- **➡️ अगला**: [एआई मॉडल तैनाती](ai-model-deployment.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

## अवलोकन

यह मार्गदर्शिका दिखाती है कि कैसे Microsoft Foundry सेवाओं को Azure Developer CLI (AZD) के साथ एकीकृत किया जाता है ताकि एआई एप्लिकेशन तैनाती को सरल बनाया जा सके। माइक्रोसॉफ्ट फाउंड्री AI एप्लिकेशन बनाने, तैनात करने और प्रबंधित करने के लिए एक व्यापक प्लेटफ़ॉर्म प्रदान करता है, जबकि AZD अवसंरचना और तैनाती प्रक्रिया को सरल बनाता है।

## Microsoft Foundry क्या है?

Microsoft Foundry माइक्रोसॉफ्ट का एक एकीकृत एआई विकास मंच है जिसमें शामिल हैं:

- **मॉडल कैटलॉग**: अत्याधुनिक एआई मॉडल तक पहुँच
- **प्रॉम्प्ट फ्लो**: एआई वर्कफ़्लोज़ के लिए विज़ुअल डिज़ाइनर
- **Microsoft Foundry पोर्टल**: एआई एप्लिकेशन के लिए एकीकृत विकास पर्यावरण
- **तैनाती विकल्प**: कई होस्टिंग और स्केलिंग विकल्प
- **सुरक्षा और सुरक्षा**: अंतर्निर्मित जिम्मेदार एआई सुविधाएँ

## AZD + Microsoft Foundry: बेहतर साथ में

| फीचर | Microsoft Foundry | AZD एकीकरण लाभ |
|---------|-----------------|------------------------|
| **मॉडल तैनाती** | मैनुअल पोर्टल तैनाती | स्वचालित, पुनरावृत्त तैनातियां |
| **इन्फ्रास्ट्रक्चर** | क्लिक-थ्रू प्रावधान | इन्फ्रास्ट्रक्चर ऐज़ कोड (बाइसप) |
| **पर्यावरण प्रबंधन** | एकल पर्यावरण केंद्रित | मल्टी-पर्यावरण (डेव/स्टेजिंग/प्रोड) |
| **CI/CD एकीकरण** | सीमित | नेटिव GitHub Actions समर्थन |
| **लागत प्रबंधन** | बुनियादी निगरानी | पर्यावरण-विशिष्ट लागत अनुकूलन |

## पूर्व आवश्यकताएं

- उपयुक्त अनुमतियों वाला Azure सदस्यता
- Azure Developer CLI स्थापित
- Microsoft Foundry मॉडल सेवाओं की पहुँच
- Microsoft Foundry की बुनियादी परिचितता

> **वर्तमान AZD बेसलाइन:** इन उदाहरणों की समीक्षा `azd` `1.27.1` के खिलाफ की गई है। एआई एजेंट वर्कफ़्लो के लिए, वर्तमान प्रीव्यू एक्सटेंशन रिलीज़ का उपयोग करें और शुरू करने से पहले अपने स्थापित संस्करण की जांच करें।

## मुख्य एकीकरण पैटर्न

### पैटर्न 1: Microsoft Foundry मॉडल एकीकरण

**उपयोग मामला**: Microsoft Foundry मॉडल मॉडल के साथ चैट एप्लिकेशन तैनात करें

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

### पैटर्न 2: AI खोज + RAG एकीकरण

**उपयोग मामला**: रिट्रीवल-ऑगमेंटेड जनरेशन (RAG) एप्लिकेशन तैनात करें

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

### पैटर्न 3: दस्तावेज़ बुद्धिमत्ता एकीकरण

**उपयोग मामला**: दस्तावेज़ प्रसंस्करण और विश्लेषण वर्कफ़्लोज

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

## 🔧 कॉन्फ़िगरेशन पैटर्न

### पर्यावरण चर सेटअप

**उत्पादन कॉन्फ़िगरेशन:**
```bash
# मुख्य एआई सेवाएँ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडल विन्यास
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# प्रदर्शन सेटिंग्स
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**विकास कॉन्फ़िगरेशन:**
```bash
# विकास के लिए लागत-इष्टतम सेटिंग्स
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # मुफ्त स्तर
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

## तैनाती वर्कफ़्लोज़

### फाउंड्री के लिए AZD एक्सटेंशन्स

AZD एक्सटेंशन्स प्रदान करता है जो Microsoft Foundry सेवाओं के साथ कार्य करने के लिए AI-विशिष्ट क्षमताएँ जोड़ते हैं:

```bash
# Foundry एजेंट एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.finetune

# कस्टम मॉडल एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.models

# इंस्टॉल किए गए एक्सटेंशनों की सूची बनाएं
azd extension list --installed

# वर्तमान में इंस्टॉल किए गए एजेंट एक्सटेंशन संस्करण का निरीक्षण करें
azd extension show azure.ai.agents
```

AI एक्सटेंशन्स अभी भी प्रीव्यू में तेजी से विकसित हो रहे हैं। यदि कोई कमांड यहां दिखाए गए तरीके से अलग व्यवहार करता है, तो परियोजना का त्रुटि निवारण करने से पहले संबंधित एक्सटेंशन को अपग्रेड करें।

### `azd ai` के साथ एजेंट-फर्स्ट तैनाती

यदि आपके पास एजेंट मैनिफेस्ट है, तो `azd ai agent init` का उपयोग करके Foundry Agent Service से जुड़ी परियोजना का निर्माण करें:

```bash
# एजेंट मैनिफेस्ट से आरंभ करें
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure पर परिनियोजित करें
azd up
```

`azure.ai.agents` के हाल के प्रीव्यू रिलीज़ में भी `azd ai agent init` के लिए टेम्पलेट-आधारित इनिशियलाइज़ेशन समर्थन जोड़ा गया। यदि आप नए एजेंट नमूनों का पालन कर रहे हैं, तो अपने स्थापित संस्करण में उपलब्ध सटीक फ्लैग्स के लिए एक्सटेंशन सहायता देखें।

पूर्ण कमांड संदर्भ और फ्लैग्स के लिए [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) देखें।

### एकल कमांड तैनाती

```bash
# एक कमांड के साथ सब कुछ परिनियोजित करें
azd up

# या क्रमिक रूप से परिनियोजित करें
azd provision  # केवल अवसंरचना
azd deploy     # केवल एप्लिकेशन

# azd 1.23.11+ में लंबी अवधि तक चलने वाले AI ऐप तैनाती के लिए
azd deploy --timeout 1800
```

### पर्यावरण-विशिष्ट तैनातियां

```bash
# विकास पर्यावरण
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# उत्पादन पर्यावरण
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## निगरानी और परिवेक्षणीयता

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

### लागत निगरानी

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

## 🔐 सुरक्षा सर्वोत्तम प्रथाएं

### प्रबंधित पहचान कॉन्फ़िगरेशन

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

### कैशिंग रणनीतियां

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

### स्वचालित-स्केलिंग कॉन्फ़िगरेशन

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

## सामान्य समस्याओं का निवारण

### समस्या 1: OpenAI कोटा पार हो गया

**लक्षण:**
- तैनाती कोटा त्रुटियों के साथ विफल होती है
- एप्लिकेशन लॉग में 429 त्रुटियाँ

**समाधान:**
```bash
# वर्तमान कोटा उपयोग जांचें
az cognitiveservices usage list --location eastus

# विभिन्न क्षेत्र का प्रयास करें
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण विफलताएं

**लक्षण:**
- एआई सेवाओं को कॉल करते समय 401/403 त्रुटियाँ
- "Access denied" संदेश

**समाधान:**
```bash
# भूमिका असाइनमेंट सत्यापित करें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# प्रबंधित पहचान विन्यास जांचें
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# कुंजी वॉल्ट एक्सेस मान्य करें
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडल तैनाती समस्याएं

**लक्षण:**
- तैनाती में मॉडल उपलब्ध नहीं हैं
- विशिष्ट मॉडल संस्करण विफल हो रहे हैं

**समाधान:**
```bash
# क्षेत्र द्वारा उपलब्ध मॉडलों की सूची बनाएं
az cognitiveservices model list --location eastus

# बाइसप टेम्पलेट में मॉडल संस्करण अपडेट करें
# मॉडल क्षमता आवश्यकताओं की जांच करें
```

## उदाहरण टेम्पलेट्स

### RAG चैट एप्लिकेशन (पायथन)

**रिपॉजिटरी**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाएं**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**विवरण**: सबसे लोकप्रिय Azure AI नमूना — एक उत्पादन-तैयार RAG चैट ऐप जो आपको अपने दस्तावेजों पर प्रश्न पूछने देता है। चैट के लिए GPT-4.1-मिनी, एम्बेडिंग के लिए text-embedding-3-large, और रिट्रीवल के लिए Azure AI Search उपयोग करता है। मल्टीमॉडल दस्तावेज़, स्पीच इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण, और एप्लिकेशन इनसाइट्स ट्रेसिंग को सपोर्ट करता है।

**त्वरित शुरुआत**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG चैट एप्लिकेशन (.NET)

**रिपॉजिटरी**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**सेवाएं**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**विवरण**: पायथन RAG चैट नमूने का .NET/C# समकक्ष। ASP.NET कोर मिनिमल API और ब्लेज़र वेबअसेंबली फ्रंटेंड के साथ बनाया गया। वॉयस चैट, GPT-4o-मिनी विज़न समर्थन, और एक सहयोगी .NET MAUI ब्लेज़र हाइब्रिड डेस्कटॉप/मोबाइल क्लाइंट शामिल हैं।

**त्वरित शुरुआत**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG चैट एप्लिकेशन (जावा)

**रिपॉजिटरी**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**सेवाएं**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**विवरण**: Langchain4J का उपयोग करके RAG चैट नमूने का जावा संस्करण। माइक्रोसर्विस इवेंट-चालित वास्तुकला, कई खोज रणनीतियों (टेक्स्ट, वेक्टर, हाइब्रिड), दस्तावेज़ अपलोड Azure Document Intelligence के साथ, और Azure Container Apps या Azure Kubernetes Service पर तैनाती का समर्थन करता है।

**त्वरित शुरुआत**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry के साथ एंटरप्राइज़ रिटेल कोपाइलेट

**रिपॉजिटरी**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाएं**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**विवरण**: Microsoft Foundry और Prompty के साथ एंड-टू-एंड रिटेल RAG कोपाइलेट। Contoso आउटडोर रिटेलर चैटबॉट जो उत्पाद कैटलॉग और ग्राहक आदेश डेटा में आधारित उत्तर प्रदान करता है। पूरा GenAIOps वर्कफ़्लो दिखाता है — Prompty के साथ प्रोटोटाइप, AI-सहायता प्राप्त मूल्यांकनकर्ताओं के साथ मूल्यांकन, और AZD के द्वारा Container Apps में तैनाती।

**त्वरित शुरुआत**:
```bash
azd init --template contoso-chat
azd up
```

### रचनात्मक लेखन मल्टी-एजेंट एप्लिकेशन

**रिपॉजिटरी**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**सेवाएं**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**विवरण**: Prompty के साथ AI एजेंट ऑर्केस्ट्रेशन दिखाने वाला मल्टी-एजेंट नमूना। एक शोध एजेंट (Bing Grounding in Azure AI Agent Service), एक उत्पाद एजेंट (Azure AI Search), एक लेखक एजेंट, और एक संपादक एजेंट का उपयोग करके अच्छी तरह से शोध किए गए लेख सहकारी रूप से बनाता है। GitHub Actions में मूल्यांकन के साथ CI/CD शामिल है।

**त्वरित शुरुआत**:
```bash
azd init --template contoso-creative-writer
azd up
```

### सर्वरलेस RAG चैट (JavaScript/TypeScript)

**रिपॉजिटरी**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**सेवाएं**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**विवरण**: LangChain.js का उपयोग करते हुए पूर्णतया सर्वरलेस RAG चैटबॉट, API के लिए Azure Functions और होस्टिंग के लिए Azure Static Web Apps के साथ। Azure Cosmos DB दोनों वेक्टर स्टोर और चैट इतिहास डेटाबेस के रूप में उपयोग करता है। स्थानीय विकास के लिए ओल्लामा के साथ ज़ीरो-लागत परीक्षण का समर्थन करता है।

**त्वरित शुरुआत**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### अपने डेटा के साथ चैट सॉल्यूशन एक्सेलेरेटर

**रिपॉजिटरी**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**सेवाएं**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**विवरण**: दस्तावेज़ अपलोड/प्रबंधन के लिए एडमिन पोर्टल वाला एंटरप्राइज़-ग्रेड RAG सॉल्यूशन एक्सेलेरेटर, विभिन्न ऑर्केस्ट्रेटर विकल्प (Semantic Kernel, LangChain, Prompt Flow), स्पीच-टू-टेक्स्ट, Microsoft Teams एकीकरण, और PostgreSQL या Cosmos DB बैकएंड का विकल्प। उत्पादन RAG परिदृश्यों के लिए एक अनुकूलन योग्य प्रारंभिक बिंदु के रूप में डिज़ाइन किया गया।

**त्वरित शुरुआत**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI यात्रा एजेंट — मल्टी-एजेंट MCP ऑर्केस्ट्रेशन

**रिपॉजिटरी**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**सेवाएं**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP सर्वर (.NET, Python, Java, TypeScript)

**विवरण**: तीन फ्रेमवर्क (LangChain.js, LlamaIndex.TS, और Microsoft Agent Framework) का उपयोग करते हुए मल्टी-एजेंट AI ऑर्केस्ट्रेशन के लिए संदर्भ आवेदन। चार भाषाओं में MCP (Model Context Protocol) सर्वर को सर्वरलेस Azure Container Apps के रूप में तैनात करता है, OpenTelemetry निगरानी के साथ।

**त्वरित शुरुआत**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI स्टार्टर

**रिपॉजिटरी**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**सेवाएं**: Azure AI सेवाएं + Azure OpenAI

**विवरण**: न्यूनतम बाइसप टेम्पलेट जो कॉन्फ़िगर किए गए मशीन लर्निंग मॉडलों के साथ Azure AI सेवाओं को तैनात करता है। जब आपको केवल Azure AI अवसंरचना की आवश्यकता होती है बिना पूरे एप्लिकेशन स्टैक के तो यह हल्का प्रारंभिक बिंदु है।

**त्वरित शुरुआत**:
```bash
azd init --template azd-ai-starter
azd up
```

> **और टेम्पलेट्स ब्राउज़ करें**: भाषाओं और परिदृश्यों में 80+ AI-विशिष्ट AZD टेम्पलेट्स के लिए [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) पर जाएं।

## अगले कदम

1. **उदाहरण आज़माएं**: एक पूर्व-निर्मित टेम्पलेट से शुरुआत करें जो आपके उपयोग मामले से मेल खाता हो
2. **अपनी आवश्यकताओं के अनुसार अनुकूलित करें**: इन्फ्रास्ट्रक्चर और एप्लिकेशन कोड संशोधित करें
3. **मॉनिटरिंग जोड़ें**: व्यापक पर्यवेक्षण लागू करें
4. **लागत अनुकूलित करें**: आपके बजट के लिए विन्यासों को सूक्ष्म समायोजित करें
5. **अपनी तैनाती को सुरक्षित करें**: एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
6. **उत्पादन में स्केल करें**: मल्टी-रीजन और उच्च उपलब्धता फीचर्स जोड़ें

## 🎯 व्यावहारिक अभ्यास

### अभ्यास 1: Microsoft Foundry मॉडल चैट ऐप तैनात करें (30 मिनट)
**लक्ष्य**: एक उत्पादन-तैयार AI चैट एप्लिकेशन तैनात करें और परीक्षण करें

```bash
# टेम्पलेट प्रारंभ करें
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरण वेरिएबल सेट करें
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# तैनात करें
azd up

# एप्लिकेशन का परीक्षण करें
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# एआई संचालन की निगरानी करें
azd monitor

# साफ़-सफाई करें
azd down --force --purge
```

**सफलता मानदंड:**
- [ ] तैनाती बिना कोटा त्रुटियों के पूरी हो जाए
- [ ] ब्राउज़र में चैट इंटरफ़ेस तक पहुँच हो सके
- [ ] प्रश्न पूछ सकें और AI-संचालित उत्तर प्राप्त कर सकें
- [ ] एप्लिकेशन इनसाइट्स टेलीमेट्री डेटा दिखाए
- [ ] संसाधनों को सफलतापूर्वक साफ़ किया गया हो

**अनुमानित लागत**: 30 मिनट के परीक्षण के लिए $5-10

### अभ्यास 2: मल्टी-मॉडल तैनाती कॉन्फ़िगर करें (45 मिनट)
**लक्ष्य**: अलग-अलग कॉन्फ़िगरेशन के साथ कई AI मॉडल तैनात करें

```bash
# कस्टम बिसेप कॉन्फ़िगरेशन बनाएं
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

# तैनात करें और सत्यापित करें
azd provision
azd show
```

**सफलता मानदंड:**
- [ ] कई मॉडल सफलतापूर्वक तैनात हो गए
- [ ] विभिन्न क्षमता सेटिंग्स लागू की गईं
- [ ] मॉडल API के माध्यम से सुलभ हैं
- [ ] एप्लिकेशन से दोनों मॉडलों को कॉल कर सकते हैं

### अभ्यास 3: लागत निगरानी लागू करें (20 मिनट)
**लक्ष्य**: बजट अलर्ट और लागत ट्रैकिंग सेटअप करें

```bash
# बजट अलर्ट Bicep में जोड़ें
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

# बजट अलर्ट तैनात करें
azd provision

# वर्तमान लागतें जांचें
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**सफलता मानदंड:**
- [ ] Azure में बजट अलर्ट बनाया गया
- [ ] ईमेल सूचनाएं कॉन्फ़िगर की गईं
- [ ] Azure पोर्टल में लागत डेटा देख सकते हैं
- [ ] बजट सीमा उपयुक्त रूप से सेट की गई

## 💡 अक्सर पूछे जाने वाले प्रश्न

<details>
<summary><strong>विकास के दौरान Microsoft Foundry मॉडल की लागत कैसे कम करें?</strong></summary>

1. **मुफ्त स्तरीय उपयोग करें**: Microsoft Foundry मॉडल प्रति माह 50,000 टोकन मुफ्त प्रदान करता है
2. **क्षमता कम करें**: विकास के लिए 30+ की बजाय TPM 10 सेट करें
3. **azd down का उपयोग करें**: जब सक्रिय रूप से विकास नहीं कर रहे हों तो संसाधनों को समाप्त करें
4. **उत्तर कैश करें**: पुनः पूछे जाने वाले प्रश्नों के लिए Redis कैश लागू करें
5. **प्रॉम्प्ट इंजीनियरिंग का उपयोग करें**: कुशल प्रॉम्प्ट के साथ टोकन उपयोग कम करें


```bash
# विकास विन्यास
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models और OpenAI API में क्या अंतर है?</strong></summary>

**Microsoft Foundry Models**:
- एंटरप्राइज सुरक्षा और अनुपालन
- निजी नेटवर्क एकीकरण
- SLA गारंटी
- प्रबंधित पहचान प्रमाणीकरण
- उच्च क्वोटा उपलब्ध

**OpenAI API**:
- नए मॉडलों तक तेज़ पहुंच
- सरल सेटअप
- प्रवेश के लिए कम बाधा
- केवल सार्वजनिक इंटरनेट

प्रोडक्शन ऐप के लिए, **Microsoft Foundry Models की सिफारिश की जाती है**।
</details>

<details>
<summary><strong>Microsoft Foundry Models के क्वोटा अधिभारित त्रुटियों को कैसे संभालें?</strong></summary>

```bash
# वर्तमान कोटा जांचें
az cognitiveservices usage list --location eastus2

# अलग क्षेत्र आज़माएं
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता घटाएं
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा बढ़ाने का अनुरोध करें
# Azure पोर्टल > कोटा > वृद्धि का अनुरोध करें जाएं
```
</details>

<details>
<summary><strong>क्या मैं Microsoft Foundry Models के साथ अपने स्वयं के डेटा का उपयोग कर सकता हूं?</strong></summary>

हाँ! RAG (रिकवरी ऑगमेंटेड जनरेशन) के लिए **Azure AI Search** का उपयोग करें:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट देखें।
</details>

<details>
<summary><strong>मैं AI मॉडल एंडपॉइंट्स को कैसे सुरक्षित करूं?</strong></summary>

**सर्वश्रेष्ठ अभ्यास**:
1. प्रबंधित पहचान का उपयोग करें (कोई API कुंजी नहीं)
2. प्राइवेट एंडपॉइंट सक्षम करें
3. नेटवर्क सुरक्षा समूह कॉन्फ़िगर करें
4. रेट लिमिटिंग लागू करें
5. सीक्रेट्स के लिए Azure Key Vault का उपयोग करें

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

## समुदाय और सहायता

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - अपने एडिटर में `npx skills add microsoft/github-copilot-for-azure` के साथ Azure + Foundry एजेंट कौशल इंस्टॉल करें

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-फर्स्ट डेवलपमेंट
- **⬅️ पिछला अध्याय**: [अध्याय 1: आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ अगला**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

**सहायता चाहिए?** हमारे समुदाय चर्चा में शामिल हों या रिपॉजिटरी में एक मुद्दा खोलें। Azure AI + AZD समुदाय आपकी सफलता के लिए यहां है!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->