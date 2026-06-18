# Microsoft Foundry का AZD के साथ इंटीग्रेशन

**अध्याय नेविगेशन:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous Chapter**: [अध्याय 1: आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI मॉडल तैनाती](ai-model-deployment.md)
- **🚀 Next Chapter**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

## अवलोकन

यह मार्गदर्शिका Microsoft Foundry सेवाओं को Azure Developer CLI (AZD) के साथ एकीकृत करने का तरीका दिखाती है ताकि AI एप्लिकेशन की तैनाती सुगम हो सके। Microsoft Foundry AI एप्लिकेशन बनाने, तैनात करने और प्रबंधित करने के लिए एक व्यापक प्लेटफ़ॉर्म प्रदान करता है, जबकि AZD बुनियादी ढांचे और तैनाती प्रक्रिया को आसान बनाता है।

## Microsoft Foundry क्या है?

Microsoft Foundry Microsoft का एक एकीकृत AI विकास प्लेटफ़ॉर्म है जिसमें शामिल हैं:

- **मॉडल कैटलॉग**: उन्नत AI मॉडलों तक पहुंच
- **प्रॉम्प्ट फ्लो**: AI वर्कफ़्लो के लिए विज़ुअल डिज़ाइनर
- **Microsoft Foundry Portal**: AI एप्लिकेशन के लिए एकीकृत विकास वातावरण
- **तैनाती विकल्प**: कई होस्टिंग और स्केलिंग विकल्प
- **सुरक्षा और सुरक्षा**: अंतर्निर्मित उत्तरदायी AI सुविधाएँ

## AZD + Microsoft Foundry: साथ मिलकर बेहतर

| विशेषता | Microsoft Foundry | AZD एकीकरण लाभ |
|---------|-----------------|------------------------|
| **मॉडल तैनाती** | मैनुअल पोर्टल तैनाती | स्वचालित, दोहराने योग्य तैनातियाँ |
| **बुनियादी ढांचा** | क्लिक-थ्रू प्रोविजनिंग | कोड के रूप में इन्फ्रास्ट्रक्चर (Bicep) |
| **पर्यावरण प्रबंधन** | एकल पर्यावरण केंद्रित | मल्टी-पर्यावरण (dev/staging/prod) |
| **CI/CD एकीकरण** | सीमित | मूल GitHub Actions समर्थन |
| **लागत प्रबंधन** | बुनियादी निगरानी | पर्यावरण-विशिष्ट लागत अनुकूलन |

## पूर्वापेक्षाएँ

- उपयुक्त अनुमतियों के साथ Azure सब्सक्रिप्शन
- Azure Developer CLI स्थापित
- Microsoft Foundry Models सेवाओं तक पहुंच
- Microsoft Foundry के साथ बुनियादी परिचय

> **वर्तमान AZD बेसलाइन:** इन उदाहरणों की समीक्षा `azd` `1.23.12` के खिलाफ की गई थी। AI एजेंट वर्कफ़्लो के लिए, वर्तमान प्रिव्यू एक्सटेंशन रिलीज़ का उपयोग करें और आरंभ करने से पहले अपना इंस्टॉल किया हुआ संस्करण जांचें।

## मुख्य इंटीग्रेशन पैटर्न

### पैटर्न 1: Microsoft Foundry Models इंटीग्रेशन

**उपयोग केस**: Microsoft Foundry Models मॉडलों के साथ चैट एप्लिकेशन तैनात करें

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

### पैटर्न 2: AI Search + RAG इंटीग्रेशन

**उपयोग केस**: रिट्रीवल-ऑगमेंटेड जनरेशन (RAG) एप्लिकेशन तैनात करें

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

**उपयोग केस**: दस्तावेज़ प्रसंस्करण और विश्लेषण वर्कफ़्लो

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

### एनवायरनमेंट वेरिएबल्स सेटअप

**प्रोडक्शन कॉन्फ़िगरेशन:**
```bash
# मुख्य एआई सेवाएँ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडल विन्यास
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# प्रदर्शन समायोजन
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**डेवलपमेंट कॉन्फ़िगरेशन:**
```bash
# विकास के लिए लागत-अनुकूल सेटिंग्स
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # निःशुल्क स्तर
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

### Foundry के लिए AZD एक्सटेंशन्स

AZD ऐसे एक्सटेंशन्स प्रदान करता है जो Microsoft Foundry सेवाओं के साथ काम करने के लिए AI-विशिष्ट क्षमताएँ जोड़ते हैं:

```bash
# Foundry एजेंट्स एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.finetune

# कस्टम मॉडल्स एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.models

# इंस्टॉल किए गए एक्सटेंशनों की सूची
azd extension list --installed

# वर्तमान में इंस्टॉल किए गए एजेंट एक्सटेंशन के संस्करण की जाँच करें
azd extension show azure.ai.agents
```

AI एक्सटेंशन्स अभी भी प्रिव्यू में तेज़ी से बदल रहे हैं। यदि कोई कमांड यहाँ दिखाए गए तरीके से अलग व्यवहार करता है, तो परियोजना का समस्या निवारण करने से पहले संबंधित एक्सटेंशन को अपग्रेड करें।

### एजेंट-फर्स्ट तैनाती `azd ai` के साथ

यदि आपके पास एजेंट मैनिफेस्ट है, तो Foundry Agent Service से जुड़ा एक प्रोजेक्ट स्कैफ़ोल्ड करने के लिए `azd ai agent init` का उपयोग करें:

```bash
# एजेंट मैनिफेस्ट से प्रारंभ करें
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure पर तैनात करें
azd up
```

हाल के प्रिव्यू रिलीज़ `azure.ai.agents` ने `azd ai agent init` के लिए टेम्पलेट-आधारित इनिशियलाइज़ेशन समर्थन भी जोड़ा है। यदि आप नए एजेंट सैंपल का पालन कर रहे हैं, तो अपने इंस्टॉल किए गए संस्करण में उपलब्ध सटीक फ्लैग हेतु एक्सटेंशन सहायता देखें।

See [AZD AI CLI कमांड](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for the full command reference and flags.

### सिंगल कमांड तैनाती

```bash
# एक ही कमांड से सब कुछ तैनात करें
azd up

# या क्रमिक रूप से तैनात करें
azd provision  # केवल अवसंरचना
azd deploy     # केवल अनुप्रयोग

# azd 1.23.11+ में लंबे समय तक चलने वाले AI ऐप परिनियोजन के लिए
azd deploy --timeout 1800
```

### पर्यावरण-विशिष्ट तैनातियाँ

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

## मॉनिटरिंग और ऑब्ज़र्वेबिलिटी

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

## 🔐 सुरक्षा सर्वोत्तम प्रथाएँ

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

### समस्या 1: OpenAI कोटा पूरा हो गया

**लक्षण:**
- तैनाती कोटा त्रुटियों के साथ विफल हो जाती है
- एप्लिकेशन लॉग में 429 त्रुटियाँ

**समाधान:**
```bash
# वर्तमान कोटा उपयोग जांचें
az cognitiveservices usage list --location eastus

# अलग क्षेत्र आज़माएँ
azd env set AZURE_LOCATION westus2
azd up

# क्षमता को अस्थायी रूप से कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण विफलताएँ

**लक्षण:**
- AI सेवाओं को कॉल करने पर 401/403 त्रुटियाँ
- "Access denied" संदेश

**समाधान:**
```bash
# भूमिका असाइनमेंट की जाँच करें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# प्रबंधित पहचान विन्यास की जाँच करें
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault पहुँच की जाँच करें
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडल तैनाती समस्याएँ

**लक्षण:**
- तैनाती में मॉडल उपलब्ध नहीं हैं
- विशिष्ट मॉडल संस्करण विफल हो रहे हैं

**समाधान:**
```bash
# क्षेत्र के अनुसार उपलब्ध मॉडल सूचीबद्ध करें
az cognitiveservices model list --location eastus

# Bicep टेम्पलेट में मॉडल संस्करण अपडेट करें
# मॉडल की क्षमता आवश्यकताओं की जाँच करें
```

## उदाहरण टेम्पलेट्स

### RAG चैट एप्लिकेशन (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाएँ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**विवरण**: सबसे लोकप्रिय Azure AI सैंपल — एक प्रोडक्शन-रेडी RAG चैट ऐप जो आपको अपने दस्तावेज़ों पर प्रश्न पूछने देता है। चैट के लिए GPT-4.1-mini, एम्बेडिंग के लिए text-embedding-3-large और रिट्रीवल के लिए Azure AI Search का उपयोग करता है। मल्टीमॉडल दस्तावेज़, स्पीच इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण, और Application Insights ट्रेसिंग का समर्थन करता है।

**त्वरित आरंभ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG चैट एप्लिकेशन (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**सेवाएँ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**विवरण**: Python RAG चैट सैंपल का .NET/C# समकक्ष। ASP.NET Core Minimal API और Blazor WebAssembly फ्रंटएंड के साथ बनाया गया। वॉयस चैट, GPT-4o-mini विज़न समर्थन, और एक सहायक .NET MAUI Blazor हाइब्रिड डेस्कटॉप/मोबाइल क्लाइंट शामिल है।

**त्वरित आरंभ**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG चैट एप्लिकेशन (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**सेवाएँ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**विवरण**: Langchain4J के साथ AI ऑर्केस्ट्रेशन का उपयोग करते हुए RAG चैट सैंपल का Java संस्करण। माइक्रोसर्विस ईवेंट-चालित आर्किटेक्चर, कई खोज रणनीतियों (टेक्स्ट, वेक्टर, हाइब्रिड), Azure Document Intelligence के साथ दस्तावेज़ अपलोड, और Azure Container Apps या Azure Kubernetes Service पर तैनाती का समर्थन करता है।

**त्वरित आरंभ**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### एंटरप्राइज़ रिटेल कॉपायलट Microsoft Foundry के साथ

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाएँ**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**विवरण**: Microsoft Foundry और Prompty का उपयोग करते हुए एंड-टू-एंड रिटेल RAG कॉपायलट। यह Contoso Outdoor रिटेलर चैटबॉट है जो उत्तरों को प्रोडक्ट कैटलॉग और ग्राहक ऑर्डर डेटा में ग्राउंड करता है। यह GenAIOps वर्कफ़्लो को पूरी तरह दर्शाता है — Prompty के साथ प्रोटोटाइप, AI-सहायता प्राप्त इवैल्यूएटर्स के साथ मूल्यांकन, और AZD के माध्यम से Container Apps में तैनाती।

**त्वरित आरंभ**:
```bash
azd init --template contoso-chat
azd up
```

### रचनात्मक लेखन मल्टी-एजेंट एप्लिकेशन

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**सेवाएँ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**विवरण**: Prompty के साथ AI एजेंट ऑर्केस्ट्रेशन प्रदर्शित करने वाला मल्टी-एजेंट सैंपल। इसमें रिसर्च एजेंट (Bing Grounding in Azure AI Agent Service), प्रोडक्ट एजेंट (Azure AI Search), राइटर एजेंट और एडिटर एजेंट शामिल हैं जो मिलकर अच्छी तरह शोध किए गए लेख बनाते हैं। GitHub Actions में इवैल्यूएशन के साथ CI/CD शामिल है।

**त्वरित आरंभ**:
```bash
azd init --template contoso-creative-writer
azd up
```

### सर्वरलेस RAG चैट (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**सेवाएँ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**विवरण**: LangChain.js का उपयोग करके पूरी तरह सर्वरलेस RAG चैटबॉट, API के लिए Azure Functions और होस्टिंग के लिए Azure Static Web Apps के साथ। वेक्टर स्टोर और चैट इतिहास डेटाबेस दोनों के रूप में Azure Cosmos DB का उपयोग करता है। ज़ीरो-कॉस्ट परीक्षण के लिए लोकल डेवलपमेंट में Ollama का समर्थन करता है।

**त्वरित आरंभ**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**सेवाएँ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**विवरण**: एंटरप्राइज़-ग्रेड RAG सॉल्यूशन एक्सेलेरेटर जिसमें दस्तावेज़ अपलोड/प्रबंधन के लिए एडमिन पोर्टल, कई ऑर्केस्ट्रेटर विकल्प (Semantic Kernel, LangChain, Prompt Flow), स्पीच-टू-टेक्स्ट, Microsoft Teams एकीकरण, और PostgreSQL या Cosmos DB बैकएंड का विकल्प शामिल है। यह उत्पादन RAG परिदृश्यों के लिए एक अनुकूलन योग्य प्रारंभ बिंदु के रूप में डिज़ाइन किया गया है।

**त्वरित आरंभ**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ट्रैवल एजेंट — मल्टी-एजेंट MCP ऑर्केस्ट्रेशन

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**सेवाएँ**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**विवरण**: तीन फ़्रेमवर्क (LangChain.js, LlamaIndex.TS, और Microsoft Agent Framework) का उपयोग करके मल्टी-एजेंट AI ऑर्केस्ट्रेशन के लिए संदर्भ अनुप्रयोग। चार भाषाओं में MCP (Model Context Protocol) सर्वर सर्वरलेस Azure Container Apps के रूप में तैनात हैं और OpenTelemetry मॉनिटरिंग की सुविधा देते हैं।

**त्वरित आरंभ**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**सेवाएँ**: Azure AI Services + Azure OpenAI

**विवरण**: एक न्यूनतम Bicep टेम्पलेट जो कॉन्फ़िगर किए गए मशीन लर्निंग मॉडलों के साथ Azure AI सेवाओं को तैनात करता है। जब आपको पूरी एप्लिकेशन स्टैक की आवश्यकता नहीं होती और केवल Azure AI बुनियादी ढांचे की तैनाती चाहिए तो यह एक हल्का प्रारंभिक बिंदु है।

**त्वरित आरंभ**:
```bash
azd init --template azd-ai-starter
azd up
```

> **और टेम्पलेट ब्राउज़ करें**: 80+ AI-विशिष्ट AZD टेम्पलेट्स के लिए [Awesome AZD AI टेम्पलेट गैलरी](https://azure.github.io/awesome-azd/?tags=ai) पर जाएँ, जो भाषाओं और परिदृश्यों में फैली हैं।

## अगले कदम

1. **उदाहरणों को आज़माएँ**: उस प्री-बिल्ट टेम्पलेट से शुरू करें जो आपके उपयोग के मामले से मेल खाता है
2. **अपनी आवश्यकता के अनुसार अनुकूलित करें**: इन्फ्रास्ट्रक्चर और एप्लिकेशन कोड को संशोधित करें
3. **मॉनिटरिंग जोड़ें**: व्यापक निरीक्षण लागू करें
4. **लागत अनुकूलित करें**: अपने बजट के अनुसार कॉन्फ़िगरेशन को फाइन-ट्यून करें
5. **अपनी तैनाती को सुरक्षित करें**: एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
6. **प्रोडक्शन के लिए स्केल करें**: मल्टी-रीजन और उच्च उपलब्धता सुविधाएँ जोड़ें

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

**सफलता मापदंड:**
- [ ] तैनाती बिना कोटा त्रुटियों के पूरी हो
- [ ] ब्राउज़र में चैट इंटरफ़ेस तक पहुँच संभव हो
- [ ] प्रश्न पूछ कर AI-समर्थित उत्तर प्राप्त किए जा सकें
- [ ] Application Insights में टेलीमेट्री डेटा दिखाई दे
- [ ] संसाधनों की सफाई सफलतापूर्वक की गई हो

**अनुमानित लागत**: 30 मिनट के परीक्षण के लिए $5-10

### अभ्यास 2: मल्टी-मॉडल तैनाती कॉन्फ़िगर करें (45 मिनट)
**लक्ष्य**: विभिन्न कॉन्फ़िगरेशन के साथ कई AI मॉडल तैनात करें

```bash
# कस्टम Bicep कॉन्फ़िगरेशन बनाएँ
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

**सफलता मापदंड:**
- [ ] कई मॉडल सफलतापूर्वक तैनात हुए हों
- [ ] विभिन्न क्षमता सेटिंग्स लागू की गई हों
- [ ] मॉडल API के माध्यम से सुलभ हों
- [ ] एप्लिकेशन से दोनों मॉडल कॉल किए जा सकें

### अभ्यास 3: लागत मॉनिटरिंग लागू करें (20 मिनट)
**लक्ष्य**: बजट अलर्ट और लागत ट्रैकिंग सेटअप करें

```bash
# Bicep में बजट अलर्ट जोड़ें
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

# वर्तमान लागतों की जांच करें
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**सफलता मापदंड:**
- [ ] Azure में बजट अलर्ट बनाया गया हो
- [ ] ईमेल नोटिफिकेशन कॉन्फ़िगर किए गए हों
- [ ] Azure पोर्टल में लागत डेटा देखा जा सके
- [ ] बजट थ्रेशहोल्ड्स उपयुक्त रूप से सेट किए गए हों

## 💡 अक्सर पूछे जाने वाले प्रश्न

<details>
<summary><strong>डेवलपमेंट के दौरान Microsoft Foundry Models की लागत कैसे घटाएँ?</strong></summary>

1. **Free Tier का उपयोग करें**: Microsoft Foundry Models प्रति माह 50,000 टोकन मुफ्त देता है
2. **क्षमता घटाएँ**: dev के लिए क्षमता को 30+ के बजाय 10 TPM पर सेट करें
3. **azd down का उपयोग करें**: सक्रिय विकास नहीं होने पर संसाधनों को अनडेलीऑकेट करें
4. **प्रतिक्रियाएँ कैश करें**: बार-बार पूछे जाने वाले प्रश्नों के लिए Redis कैश लागू करें
5. **प्रॉम्प्ट इंजीनियरिंग का उपयोग करें**: कुशल प्रॉम्प्ट के साथ टोकन उपयोग कम करें

</details>
```bash
# विकास विन्यास
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models और OpenAI API के बीच क्या अंतर है?</strong></summary>

**Microsoft Foundry Models**:
- एंटरप्राइज़ सुरक्षा और अनुपालन
- निजी नेटवर्क एकीकरण
- SLA गारंटियाँ
- Managed identity प्रमाणीकरण (कोई API कुंजी नहीं)
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नए मॉडलों तक तेज़ पहुँच
- सरल सेटअप
- प्रवेश के लिए कम बाधा
- केवल सार्वजनिक इंटरनेट

प्रोडक्शन ऐप्स के लिए, **Microsoft Foundry Models की सिफारिश की जाती है**।
</details>

<details>
<summary><strong>Microsoft Foundry Models के कोटा पार होने की त्रुटियों को मैं कैसे संभालूँ?</strong></summary>

```bash
# वर्तमान कोटा जांचें
az cognitiveservices usage list --location eastus2

# किसी अन्य क्षेत्र को आज़माएँ
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता घटाएँ
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वृद्धि का अनुरोध करें
# Azure पोर्टल पर जाएँ > कोटा > वृद्धि का अनुरोध करें
```
</details>

<details>
<summary><strong>क्या मैं अपना डेटा Microsoft Foundry Models के साथ उपयोग कर सकता/सकती हूँ?</strong></summary>

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

टेम्पलेट देखें: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)।
</details>

<details>
<summary><strong>AI मॉडल एंडपॉइंट्स को मैं कैसे सुरक्षित करूँ?</strong></summary>

**सर्वोत्तम प्रथाएँ**:
1. Managed Identity का उपयोग करें (कोई API कुंजी नहीं)
2. Private Endpoints सक्षम करें
3. नेटवर्क सुरक्षा समूहों को कॉन्फ़िगर करें
4. रेट लिमिटिंग लागू करें
5. रहस्यों के लिए Azure Key Vault का उपयोग करें

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
- **AZD GitHub**: [इश्यूज़ और चर्चाएँ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [आधिकारिक दस्तावेज़](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - अपने एडिटर में Azure + Foundry एजेंट स्किल्स को `npx skills add microsoft/github-copilot-for-azure` के साथ इंस्टॉल करें

---

**अध्याय नेविगेशन:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: Chapter 2 - AI-First Development
- **⬅️ पिछला अध्याय**: [अध्याय 1: आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

**क्या मदद चाहिए?** हमारी समुदायिक चर्चाओं में शामिल हों या रिपॉज़िटरी में एक इश्यू खोलें। Azure AI + AZD समुदाय आपकी सफलता में मदद करने के लिए यहाँ है!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->