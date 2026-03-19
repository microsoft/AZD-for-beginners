# Microsoft Foundry और AZD का एकीकरण

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-First विकास
- **⬅️ पिछला अध्याय**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ अगला**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 अगला अध्याय**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## सारांश

यह मार्गदर्शिका Microsoft Foundry सेवाओं को Azure Developer CLI (AZD) के साथ एकीकृत करने का प्रदर्शन करती है ताकि AI अनुप्रयोगों की तैनाती सुगम हो सके। Microsoft Foundry AI अनुप्रयोगों के निर्माण, तैनाती और प्रबंधन के लिए एक व्यापक प्लेटफ़ॉर्म प्रदान करता है, जबकि AZD इन्फ्रास्ट्रक्चर और तैनाती प्रक्रिया को सरल बनाता है।

## Microsoft Foundry क्या है?

Microsoft Foundry Microsoft का AI विकास के लिए एक एकीकृत प्लेटफ़ॉर्म है जिसमें शामिल हैं:

- **Model Catalog**: उन्नत AI मॉडलों तक पहुँच
- **Prompt Flow**: AI वर्कफ़्लो के लिए विज़ुअल डिजाइनर
- **Microsoft Foundry Portal**: AI अनुप्रयोगों के लिए एकीकृत विकास वातावरण
- **Deployment Options**: होस्टिंग और स्केलिंग के कई विकल्प
- **Safety and Security**: अंतर्निर्मित जिम्मेदार AI सुविधाएँ

## AZD + Microsoft Foundry: साथ में बेहतर

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | मैन्युअल पोर्टल तैनाती | स्वचालित, पुनरुत्पादनीय तैनातियाँ |
| **Infrastructure** | क्लिक-थ्रू प्रोविज़निंग | Infrastructure as Code (Bicep) |
| **Environment Management** | एकल वातावरण फोकस | बहु-पर्यावरण (dev/staging/prod) |
| **CI/CD Integration** | सीमित | नेटिव GitHub Actions सपोर्ट |
| **Cost Management** | बेसिक मॉनिटरिंग | वातावरण-विशिष्ट लागत अनुकूलन |

## आवश्यकताएँ

- उपयुक्त अनुमतियों के साथ Azure सब्सक्रिप्शन
- Azure Developer CLI इंस्टॉल किया हुआ
- Microsoft Foundry Models सेवाओं की पहुँच
- Microsoft Foundry का बुनियादी परिचय

## कोर एकीकरण पैटर्न

### पैटर्न 1: Microsoft Foundry Models एकीकरण

**उपयोग का मामला**: Microsoft Foundry Models मॉडल के साथ चैट अनुप्रयोग तैनात करना

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

**Infrastructure (main.bicep):**
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

### पैटर्न 2: AI Search + RAG एकीकरण

**उपयोग का मामला**: Retrieval-augmented generation (RAG) अनुप्रयोग तैनात करना

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

### पैटर्न 3: Document Intelligence एकीकरण

**उपयोग का मामला**: दस्तावेज़ प्रसंस्करण और विश्लेषण वर्कफ़्लो

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

### वातावरण वेरिएबल सेटअप

**Production कॉन्फ़िगरेशन:**
```bash
# मुख्य एआई सेवाएँ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडल विन्यास
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# प्रदर्शन सेटिंग्स
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development कॉन्फ़िगरेशन:**
```bash
# विकास के लिए लागत-अनुकूलित सेटिंग्स
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

## तैनाती वर्कफ़्लो

### Foundry के लिए AZD एक्सटेंशन

AZD एक्सटेंशन प्रदान करता है जो Microsoft Foundry सेवाओं के साथ कार्य करने के लिए AI-विशिष्ट क्षमताएँ जोड़ता है:

```bash
# Foundry एजेंट्स एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.finetune

# कस्टम मॉडल्स एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.models

# इंस्टॉल किए गए एक्सटेंशनों की सूची
azd extension list
```

### `azd ai` के साथ Agent-First तैनाती

यदि आपके पास एक एजेंट मैनिफ़ेस्ट है, तो Foundry Agent Service से जुड़ा प्रोजेक्ट स्कैफोल्ड करने के लिए `azd ai agent init` का उपयोग करें:

```bash
# एजेंट मैनिफेस्ट से प्रारंभ करें
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure पर तैनात करें
azd up
```

पूर्ण कमांड संदर्भ और फ़्लैग्स के लिए [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) देखें।

### एक ही कमांड में तैनाती

```bash
# एक कमांड से सब कुछ तैनात करें
azd up

# या क्रमिक रूप से तैनात करें
azd provision  # केवल अवसंरचना
azd deploy     # केवल अनुप्रयोग
```

### वातावरण-विशिष्ट तैनातियाँ

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

## मॉनिटरिंग और अवलोकनीयता

### Application Insights एकीकरण

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

### लागत मॉनिटरिंग

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

## 🔐 सुरक्षा सर्वोत्तम अभ्यास

### Managed Identity कॉन्फ़िगरेशन

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

## सामान्य समस्याओं का निवारण

### समस्या 1: OpenAI कोटा अतिक्रमित

**लक्षण:**
- तैनाती कोटा त्रुटियों के साथ विफल होती है
- एप्लिकेशन लॉग में 429 त्रुटियाँ

**समाधान:**
```bash
# वर्तमान कोटा उपयोग की जांच करें
az cognitiveservices usage list --location eastus

# किसी अलग क्षेत्र को आज़माएँ
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण असफलताएँ

**लक्षण:**
- AI सेवाओं को कॉल करते समय 401/403 त्रुटियाँ
- "Access denied" संदेश

**समाधान:**
```bash
# रोल असाइनमेंट सत्यापित करें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# प्रबंधित पहचान विन्यास की जाँच करें
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault पहुँच सत्यापित करें
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडल तैनाती समस्याएँ

**लक्षण:**
- तैनाती में मॉडल उपलब्ध नहीं हैं
- विशिष्ट मॉडल संस्करण विफल हो रहे हैं

**समाधान:**
```bash
# क्षेत्र के अनुसार उपलब्ध मॉडलों को सूचीबद्ध करें
az cognitiveservices model list --location eastus

# bicep टेम्पलेट में मॉडल संस्करण अपडेट करें
# मॉडल की क्षमता आवश्यकताओं की जांच करें
```

## उदाहरण टेम्पलेट्स

### RAG चैट एप्लिकेशन (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**विवरण**: सबसे लोकप्रिय Azure AI सैंपल — एक प्रोडक्शन-रेडी RAG चैट ऐप जो आपको अपने दस्तावेज़ों पर प्रश्न करने देता है। चैट के लिए GPT-4.1-mini, एम्बेडिंग के लिए text-embedding-ada-002, और रिट्रीवल के लिए Azure AI Search का उपयोग करता है। मल्टीमोडल दस्तावेज़, स्पीच इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण, और Application Insights ट्रेसिंग का समर्थन करता है।

**त्वरित प्रारम्भ:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG चैट एप्लिकेशन (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**विवरण**: Python RAG चैट सैंपल का .NET/C# समकक्ष। ASP.NET Core Minimal API और Blazor WebAssembly फ्रंटेंड के साथ बनाया गया। वॉइस चैट, GPT-4o-mini vision सपोर्ट, और एक .NET MAUI Blazor Hybrid डेस्कटॉप/मोबाइल क्लाइंट शामिल है।

**त्वरित प्रारम्भ:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG चैट एप्लिकेशन (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**विवरण**: Langchain4J का उपयोग करके AI ऑर्केस्ट्रेशन के लिए Java संस्करण। माइक्रो сервис इवेंट-ड्रिवन आर्किटेक्चर, कई खोज रणनीतियाँ (टेक्स्ट, वेक्टर, हाइब्रिड), Azure Document Intelligence के साथ दस्तावेज़ अपलोड, और Azure Container Apps या Azure Kubernetes Service पर तैनाती का समर्थन करता है।

**त्वरित प्रारम्भ:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**विवरण**: Azure AI Foundry और Prompty का उपयोग करके एंड-टू-एंड रिटेल RAG कॉपाइलट। Contoso Outdoor रिटेलर चैटबोट जो उत्तरों को प्रोडक्ट कैटलॉग और ग्राहक ऑर्डर डेटा में आधारित करता है। पूरा GenAIOps वर्कफ़्लो दिखाता है — Prompty के साथ प्रोटोटाइप, AI-सहायता प्राप्त मूल्यांकनकर्ताओं के साथ मूल्यांकन, और AZD के माध्यम से Container Apps में तैनाती।

**त्वरित प्रारम्भ:**
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**विवरण**: Prompty के साथ AI एजेंट ऑर्केस्ट्रेशन दिखाने वाला मल्टी-एजेंट सैंपल। एक रिसर्च एजेंट (Bing Grounding in Azure AI Agent Service), एक प्रोडक्ट एजेंट (Azure AI Search), एक लेखक एजेंट, और एक संपादक एजेंट का उपयोग कर अच्छी तरह से शोध किए गए लेख सह-निर्मित करने के लिए। GitHub Actions में मूल्यांकन के साथ CI/CD शामिल है।

**त्वरित प्रारम्भ:**
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG चैट (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**विवरण**: LangChain.js का उपयोग करके पूरी तरह से सर्वरलेस RAG चैटबोट जो API के लिए Azure Functions और होस्टिंग के लिए Azure Static Web Apps का उपयोग करता है। Azure Cosmos DB को वेक्टर स्टोर और चैट हिस्ट्री डेटाबेस दोनों के रूप में उपयोग करता है। जीरो-कोस्ट परीक्षण के लिए स्थानीय विकास में Ollama का समर्थन करता है।

**त्वरित प्रारम्भ:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**विवरण**: एंटरप्राइज़-ग्रेड RAG सॉल्यूशन एक्सेलेरेटर जिसमें दस्तावेज़ अपलोड/प्रबंधन के लिए एडमिन पोर्टल, कई ऑर्केस्ट्रेटर विकल्प (Semantic Kernel, LangChain, Prompt Flow), स्पीच-टू-टेक्स्ट, Microsoft Teams एकीकरण, और PostgreSQL या Cosmos DB बैकएंड का विकल्प शामिल है। उत्पादन RAG परिदृश्यों के लिए एक अनुकूलन योग्य प्रारंभिक बिंदु के रूप में डिजाइन किया गया।

**त्वरित प्रारम्भ:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP ऑर्केस्ट्रेशन

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**विवरण**: तीन फ्रेमवर्क (LangChain.js, LlamaIndex.TS, और Microsoft Agent Framework) का उपयोग करके मल्टी-एजेंट AI ऑर्केस्ट्रेशन के लिए संदर्भ अनुप्रयोग। चार भाषाओं में MCP (Model Context Protocol) सर्वर सर्वरलेस Azure Container Apps के रूप में तैनात हैं और OpenTelemetry मॉनिटरिंग फीचर के साथ आते हैं।

**त्वरित प्रारम्भ:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**विवरण**: एक न्यूनतम Bicep टेम्पलेट जो कॉन्फ़िगर किए हुए मशीन लर्निंग मॉडलों के साथ Azure AI सेवाओं को तैनात करता है। जब आपको केवल Azure AI इन्फ्रास्ट्रक्चर की आवश्यकता हो और पूर्ण एप्लिकेशन स्टैक न चाहिए हो तो यह एक हल्का आरम्भिक बिंदु है।

**त्वरित प्रारम्भ:**
```bash
azd init --template azd-ai-starter
azd up
```

> **और टेम्पलेट ब्राउज़ करें**: 80+ AI-विशिष्ट AZD टेम्पलेट्स के लिए [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) देखें।

## अगले कदम

1. **उदाहरण आज़माएँ**: अपने उपयोग मामले से मेल खाने वाले प्री-बिल्ट टेम्पलेट से शुरू करें
2. **अपनी ज़रूरत के अनुसार अनुकूलन करें**: इन्फ्रास्ट्रक्चर और एप्लिकेशन कोड को संशोधित करें
3. **मॉनिटरिंग जोड़ें**: व्यापक अवलोकनीयता लागू करें
4. **लागत अनुकूलित करें**: अपने बजट के अनुसार कॉन्फ़िगरेशन को सूक्ष्म समायोजित करें
5. **अपनी तैनाती को सुरक्षित करें**: एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
6. **प्रोडक्शन के लिए स्केल करें**: बहु-रीजन और उच्च-उपलब्धता सुविधाएँ जोड़ें

## 🎯 हैंड्स-ऑन अभ्यास

### अभ्यास 1: Microsoft Foundry Models चैट ऐप तैनात करें (30 मिनट)
**लक्ष्य**: एक प्रोडक्शन-रेडी AI चैट एप्लिकेशन तैनात और परीक्षण करें

```bash
# टेम्पलेट प्रारंभ करें
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरण चर सेट करें
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# तैनात करें
azd up

# एप्लिकेशन का परीक्षण करें
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# एआई संचालन की निगरानी करें
azd monitor

# साफ़ करें
azd down --force --purge
```

**सफलता मानदंड:**
- [ ] तैनाती बिना कोटा त्रुटियों के पूर्ण होती है
- [ ] ब्राउज़र में चैट इंटरफ़ेस तक पहुँच संभव है
- [ ] प्रश्न पूछ सकते हैं और AI-समर्थित प्रतिक्रियाएँ प्राप्त कर सकते हैं
- [ ] Application Insights में टेलीमेट्री डेटा दिखता है
- [ ] संसाधनों को सफलतापूर्वक क्लीनअप किया गया

**अनुमानित लागत**: 30 मिनट के परीक्षण के लिए $5-10

### अभ्यास 2: मल्टी-मॉडल तैनाती कॉन्फ़िगर करें (45 मिनट)
**लक्ष्य**: विभिन्न कॉन्फ़िगरेशन के साथ कई AI मॉडल तैनात करें

```bash
# कस्टम Bicep कॉन्फ़िगरेशन बनाएं
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

# डिप्लॉय करें और सत्यापित करें
azd provision
azd show
```

**सफलता मानदंड:**
- [ ] कई मॉडल सफलतापूर्वक तैनात हुए
- [ ] विभिन्न क्षमता सेटिंग्स लागू की गईं
- [ ] मॉडल API के माध्यम से सुलभ हैं
- [ ] एप्लिकेशन से दोनों मॉडलों को कॉल किया जा सकता है

### अभ्यास 3: लागत मॉनिटरिंग लागू करें (20 मिनट)
**लक्ष्य**: बजट अलर्ट और लागत ट्रैकिंग सेटअप करें

```bash
# Bicep के लिए बजट अलर्ट जोड़ें
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

# वर्तमान लागतों की जाँच करें
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**सफलता मानदंड:**
- [ ] Azure में बजट अलर्ट बनाया गया
- [ ] ईमेल सूचनाएँ कॉन्फ़िगर की गईं
- [ ] Azure पोर्टल में लागत डेटा देख सकते हैं
- [ ] बजट थ्रेशोल्ड सही तरीके से सेट किए गए

## 💡 अक्सर पूछे जाने वाले प्रश्न

<details>
<summary><strong>डेवलपमेंट के दौरान Microsoft Foundry Models की लागत कैसे घटाऊँ?</strong></summary>

1. **Free Tier का उपयोग करें**: Microsoft Foundry Models प्रति माह 50,000 टोकन मुफ्त प्रदान करता है
2. **क्षमता घटाएँ**: dev के लिए क्षमता 30+ के बजाय 10 TPM सेट करें
3. **azd down का उपयोग करें**: सक्रिय रूप से डेवलप न करने पर संसाधनों को डी-अलोकेट करें
4. **प्रतिक्रियाओं को कैश करें**: बार-बार पूछताछ के लिए Redis कैश लागू करें
5. **Prompt Engineering का उपयोग करें**: कुशल प्रॉम्प्ट्स के साथ टोकन उपयोग घटाएँ

```bash
# विकास विन्यास
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models और OpenAI API में क्या अंतर है?</strong></summary>

**Microsoft Foundry Models**:
- एंटरप्राइज़ सुरक्षा और अनुपालन
- प्राइवेट नेटवर्क एकीकरण
- SLA गारंटियाँ
- Managed identity प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नए मॉडलों तक तेज़ पहुँच
- सरल सेटअप
- प्रवेश की बाधा कम
- सार्वजनिक इंटरनेट केवल

उत्पादन अनुप्रयोगों के लिए, **Microsoft Foundry Models की सिफारिश की जाती है**।
</details>

<details>
<summary><strong>Microsoft Foundry Models के क्वोटा पार होने की त्रुटियों को मैं कैसे संभालूँ?</strong></summary>

```bash
# वर्तमान कोटा जांचें
az cognitiveservices usage list --location eastus2

# किसी अन्य क्षेत्र को आज़माएँ
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वृद्धि का अनुरोध करें
# Azure पोर्टल > कोटाएँ > वृद्धि का अनुरोध करें
```
</details>

<details>
<summary><strong>क्या मैं Microsoft Foundry Models के साथ अपना स्वयं का डेटा उपयोग कर सकता/सकती हूँ?</strong></summary>

हाँ! RAG (Retrieval Augmented Generation) के लिए **Azure AI Search** का उपयोग करें:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

देखें: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट।
</details>

<details>
<summary><strong>मैं AI मॉडल एंडपॉइंट्स को कैसे सुरक्षित करूँ?</strong></summary>

**सर्वोत्तम अभ्यास**:
1. Managed Identity का उपयोग करें (कोई API keys नहीं)
2. Private Endpoints सक्षम करें
3. नेटवर्क सुरक्षा समूहों को कॉन्फ़िगर करें
4. रेट-लिमिटिंग लागू करें
5. गुप्त जानकारी के लिए Azure Key Vault का उपयोग करें

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

## समुदाय और समर्थन

- **Microsoft Foundry Discord**: [#Azure चैनल](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [मुद्दे और चर्चाएँ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [आधिकारिक दस्तावेज़](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh पर Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - अपने एडिटर में Azure + Foundry agent skills को इंस्टॉल करें: `npx skills add microsoft/github-copilot-for-azure`

---

**अध्याय नेविगेशन:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous Chapter**: [अध्याय 1: आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI मॉडल तैनाती](ai-model-deployment.md)
- **🚀 Next Chapter**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

**मदद चाहिए?** हमारे समुदाय चर्चाओं में शामिल हों या रिपॉज़िटरी में एक इश्यू खोलें। Azure AI + AZD समुदाय आपकी सफलता में मदद करने के लिए यहाँ है!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। हालांकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में प्राधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सलाह दी जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या भ्रामक व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->