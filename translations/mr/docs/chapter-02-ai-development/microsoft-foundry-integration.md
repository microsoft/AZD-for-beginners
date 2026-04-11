# Microsoft Foundry चे AZD बरोबर समाकलन

**Chapter Navigation:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## आढावा

हा मार्गदर्शक Microsoft Foundry सेवा आणि Azure Developer CLI (AZD) यांचे समाकलन करून AI अनुप्रयोगांच्या तैनातीची प्रक्रिया सुलभ करण्याचा कसा दाखवतो हे स्पष्ट करतो. Microsoft Foundry AI अनुप्रयोग तयार करणे, तैनात करणे आणि व्यवस्थापित करण्यासाठी एक सर्वसमावेशक प्लॅटफॉर्म पुरवते, तर AZD पायाभूत सुविधा आणि तैनाती प्रक्रिया साधी करते.

## Microsoft Foundry म्हणजे काय?

Microsoft Foundry हा Microsoft चा एकत्रित AI विकास प्लॅटफॉर्म आहे ज्यामध्ये समाविष्ट आहे:

- **Model Catalog**: अत्याधुनिक AI मॉडेल्ससाठी प्रवेश
- **Prompt Flow**: AI वर्कफ्लोसाठी व्हिज्युअल डिझायनर
- **Microsoft Foundry Portal**: AI अनुप्रयोगांसाठी एकात्मिक विकास वातावरण
- **Deployment Options**: अनेक होस्टिंग आणि स्केलिंग पर्याय
- **Safety and Security**: अंगभूत जबाबदार AI वैशिष्ट्ये

## AZD + Microsoft Foundry: एकत्रितपणे चांगले

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | मॅन्युअल पोर्टल वितरण | स्वयंचलित, पुनरावृत्ती करण्याजोगी तैनाती |
| **Infrastructure** | क्लिक-थ्रू प्राव्हिजनिंग | Infrastructure as Code (Bicep) |
| **Environment Management** | एकाच पर्यावरणावर लक्ष | बहु-पर्यावरण (dev/staging/prod) |
| **CI/CD Integration** | मर्यादित | नेटिव्ह GitHub Actions समर्थन |
| **Cost Management** | मूलभूत देखरेख | पर्यावरण-विशिष्ट खर्च सुधारणा |

## पूर्वअटी

- योग्य परवानग्यांसह Azure सदस्यता
- Azure Developer CLI स्थापित असणे
- Microsoft Foundry Models सेवांसाठी प्रवेश
- Microsoft Foundry ची मूलभूत ओळख

> **सध्याचे AZD बेसलाइन:** हे उदाहरण `azd` `1.23.12` विरुद्ध तपासले गेले आहे. AI एजंट वर्कफ्लो साठी, चालू प्रीव्यू विस्तार प्रकाशन वापरा आणि सुरुवात करण्यापूर्वी आपल्या स्थापित आवृत्तीची खात्री करा.

## मुख्य समाकलन पॅटर्न

### Pattern 1: Microsoft Foundry Models समाकलन

**Use Case**: Microsoft Foundry Models मॉडेलसह चॅट अनुप्रयोग तैनात करा

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

### Pattern 2: AI Search + RAG समाकलन

**Use Case**: retrieval-augmented generation (RAG) अनुप्रयोग तैनात करा

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

### Pattern 3: Document Intelligence समाकलन

**Use Case**: दस्तऐवज प्रक्रिया आणि विश्लेषण वर्कफ्लो

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

## 🔧 कॉन्फिगरेशन पॅटर्न

### पर्यावरण चल सेटअप

**Production Configuration:**
```bash
# मुख्य एआय सेवा
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडेल विन्यास
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# कार्यक्षमता सेटिंग्ज
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# विकासासाठी खर्च-अनुकूल सेटिंग्ज
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # मोफत स्तर
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

## तैनाती वर्कफ्लो

### Foundry साठी AZD विस्तार

AZD मध्ये असे विस्तार आहेत जे Microsoft Foundry सेवांसह काम करण्यासाठी AI-विशिष्ट क्षमता जोडतात:

```bash
# Foundry एजंट्स एक्सटेंशन स्थापित करा
azd extension install azure.ai.agents

# फाईन-ट्यूनिंग एक्सटेंशन स्थापित करा
azd extension install azure.ai.finetune

# कस्टम मॉडेल्स एक्सटेंशन स्थापित करा
azd extension install azure.ai.models

# स्थापित एक्सटेंशन्सची यादी करा
azd extension list --installed

# सध्या स्थापित एजंट एक्सटेंशनची आवृत्ती तपासा
azd extension show azure.ai.agents
```

AI विस्तार अजूनही प्रीव्यूमध्ये जलद गतीने बदलत आहेत. जर एखादी कमांड येथे दाखवल्यापेक्षा वेगळी वागली, तर प्रोजेक्टचे त्रुटी निवारण करण्यापूर्वी संबंधित विस्तार अद्यतनित करा.

### `azd ai` सह एजंट-प्रथम तैनाती

जर आपल्याकडे एजंट मॅनिफेस्ट असेल, तर Foundry Agent Service शी जोडलेला प्रोजेक्ट स्कॅफल्ड करण्यासाठी `azd ai agent init` वापरा:

```bash
# एजंट मॅनिफेस्टमधून प्रारंभ करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure वर तैनात करा
azd up
```

`azure.ai.agents` च्या अलीकडील प्रीव्यू रीलिझने `azd ai agent init` साठी टेम्पलेट-आधारित इनिशियलायझेशन समर्थन देखील जोडले आहे. जर आपण नवीन एजंट नमुन्यांचे अनुसरण करत असाल, तर आपल्या स्थापित आवृत्तीत उपलब्ध अचूक फ्लॅग्ससाठी विस्ताराच्या मदतीची तपासणी करा.

पूर्ण कमांड संदर्भ आणि फ्लॅग्ससाठी [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) पाहा.

### एक कमांड तैनाती

```bash
# एकाच कमांडने सर्व काही तैनात करा
azd up

# किंवा टप्प्याटप्प्याने तैनात करा
azd provision  # फक्त पायाभूत सुविधा
azd deploy     # फक्त अनुप्रयोग

# azd 1.23.11+ मध्ये दीर्घकाळ चालणाऱ्या AI अनुप्रयोगांच्या तैनातीसाठी
azd deploy --timeout 1800
```

### पर्यावरण-विशिष्ट तैनाती

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

## मॉनिटरिंग आणि निरीक्षणक्षमता

### Application Insights समाकलन

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

## कार्यप्रदर्शन अनुकूलन

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

## सामान्य समस्या निराकरण

### समस्या 1: OpenAI कोटा ओलांडला

**लक्षणे:**
- तैनाती कोटा त्रुटींसह अयशस्वी होते
- अनुप्रयोग लॉगमध्ये 429 त्रुटी

**उपाय:**
```bash
# सध्याच्या कोटा वापराची तपासणी करा
az cognitiveservices usage list --location eastus

# वेगळ्या प्रदेशात प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# क्षमता तात्पुरती कमी करा
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण त्रुटी

**लक्षणे:**
- AI सेवांना कॉल करताना 401/403 त्रुटी
- "Access denied" संदेश

**उपाय:**
```bash
# भूमिका नियुक्तींची पडताळणी करा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# व्यवस्थापित ओळख संरचनेची पडताळणी करा
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# की व्हॉल्ट प्रवेशाची पडताळणी करा
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडेल तैनाती समस्या

**लक्षणे:**
- मॉडेल तैनातीसाठी उपलब्ध नाहीत
- विशिष्ट मॉडेल आवृत्ती अयशस्वी होत आहे

**उपाय:**
```bash
# प्रदेशानुसार उपलब्ध मॉडेल्सची यादी
az cognitiveservices model list --location eastus

# bicep टेम्पलेटमध्ये मॉडेल आवृत्ती अद्यतनित करा
# मॉडेल क्षमतेच्या आवश्यकतांची तपासणी करा
```

## उदाहरण टेम्पलेट

### RAG चॅट अनुप्रयोग (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: सर्वाधिक लोकप्रिय Azure AI नमुना — उत्पादन-तयार RAG चॅट अॅप जे आपले दस्तऐवज वापरून प्रश्न विचारण्यास अनुमती देते. चॅटसाठी GPT-4.1-mini, एंबेडिंगसाठी text-embedding-3-large आणि शोधासाठी Azure AI Search वापरते. मल्टिमोडल दस्तऐवज, स्पीच इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण आणि Application Insights ट्रेसिंगला समर्थन देते.

**जलद प्रारंभ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG चॅट अनुप्रयोग (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG चॅट नमुन्याचा .NET/C# समतुल्य. ASP.NET Core Minimal API आणि Blazor WebAssembly फ्रंटेंडने बनवलेले. व्हॉइस चॅट, GPT-4o-mini व्हिजन समर्थन आणि एक सुसंगत .NET MAUI Blazor हायब्रिड डेस्कटॉप/मोबाईल क्लायंट समाविष्ट आहे.

**जलद प्रारंभ**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG चॅट अनुप्रयोग (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Langchain4J वापरून AI ऑर्केस्ट्रेशनसाठी Java आवृत्ती. मायक्रोसर्व्हिस ईव्हेंट-चालित आर्किटेक्चर, अनेक शोध धोरणे (टेक्स्ट, व्हेक्टर, हायब्रिड), Azure Document Intelligence सह दस्तऐवज अपलोड आणि Azure Container Apps किंवा Azure Kubernetes Service वर तैनातीचे समर्थन करते.

**जलद प्रारंभ**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### एंटरप्राइझ रिटेल कॉपायलट with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: Azure AI Foundry आणि Prompty वापरून एंड-टू-एंड रिटेल RAG कॉपायलट. Contoso Outdoor रिटेलरचा चॅटबॉट जो उत्पादक कॅटलॉग आणि ग्राहक ऑर्डर डेटामध्ये आधारित उत्तरे प्रदान करतो. संपूर्ण GenAIOps वर्कफ्लो दाखवते — Prompty सह प्रोटोटाइप, AI-आधारित मूल्यांकनांसह मूल्यांकन, आणि AZD द्वारे Container Apps मध्ये तैनात करणे.

**जलद प्रारंभ**:
```bash
azd init --template contoso-chat
azd up
```

### क्रिएटिव्ह रायटिंग मल्टी-एजंट अनुप्रयोग

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: Prompty सह AI एजंट ऑर्केस्ट्रेशन दाखवणारे मल्टी-एजंट उदाहरण. संशोधन एजंट (Bing Grounding in Azure AI Agent Service), उत्पादन एजंट (Azure AI Search), लेखक एजंट आणि संपादक एजंट सह संयुक्तपणे संशोधित लेख तयार करतात. GitHub Actions मध्ये मूल्यांकनासह CI/CD समाविष्ट आहे.

**जलद प्रारंभ**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG चॅट (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: LangChain.js वापरून पूर्णपणे सर्व्हरलेस RAG चॅटबोट, API साठी Azure Functions आणि होस्टिंगसाठी Azure Static Web Apps वापरते. व्हेक्टर स्टोअर आणि चॅट इतिहास डेटाबेस म्हणून Azure Cosmos DB वापरते. शून्य-किंमत चाचणीसाठी स्थानिक विकासात Ollama ला समर्थन देते.

**जलद प्रारंभ**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: एंटरप्राइझ-ग्रेड RAG सोल्यूशन अ‍ॅक्सेलरेटर ज्यात दस्तऐवज अपलोड/व्यवस्थापनासाठी अॅडमिन पोर्टल, अनेक ऑर्केस्ट्रेटर पर्याय (Semantic Kernel, LangChain, Prompt Flow), स्पीच-टू-टेक्स्ट, Microsoft Teams समाकलन आणि PostgreSQL किंवा Cosmos DB बॅकएंडचा पर्याय आहे. उत्पादन RAG परिस्थितीसाठी सानुकूल करण्यायोग्य प्रारंभबिंदू म्हणून डिझाइन केलेले.

**जलद प्रारंभ**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI प्रवास एजंट — मल्टी-एजंट MCP ऑर्केस्ट्रेशन

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: तीन फ्रेमवर्क (LangChain.js, LlamaIndex.TS, आणि Microsoft Agent Framework) वापरून मल्टी-एजंट AI ऑर्केस्ट्रेशनसाठी संदर्भ अनुप्रयोग. चार भाषांमध्ये MCP (Model Context Protocol) सर्व्हर्स सर्व्हरलेस Azure Container Apps म्हणून तैनात केलेले आणि OpenTelemetry मॉनिटरिंगसमवेत.

**जलद प्रारंभ**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: Azure AI सेवांसह कॉन्फिगर केलेले मशीन लर्निंग मॉडेल्स तैनात करणारे सूक्ष्म Bicep टेम्पलेट. जेव्हा आपल्याला फक्त Azure AI इन्फ्रास्ट्रक्चर आवश्यक असेल आणि पूर्ण अनुप्रयोग स्टॅक नको असेल तेव्हा हे हलके प्रारंभबिंदू आहे.

**जलद प्रारंभ**:
```bash
azd init --template azd-ai-starter
azd up
```

> **अधिक टेम्पलेट ब्राउझ करा**: 80+ AI-विशिष्ट AZD टेम्पलेट्ससाठी भाषां आणि परिस्थितींसाठी [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) भेट द्या.

## पुढील पावले

1. **उदाहरणे वापरून पहा**: आपल्या वापर प्रकरणाशी सुसंगत प्री-बिल्ट टेम्पलेटने सुरू करा
2. **आपल्या गरजेनुसार सानुकूल करा**: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग कोड सानुकूल करा
3. **मॉनिटरिंग जोडा**: सर्वसमावेशक निरीक्षण अंमलात आणा
4. **खर्चे अनुकूल करा**: आपल्या बजेटसाठी कॉन्फिगरेशन सूक्ष्म करा
5. **आपली तैनाती सुरक्षित करा**: एंटरप्राइझ सुरक्षा पॅटर्न अंमलात आणा
6. **उत्पादनासाठी स्केल करा**: बहु-प्रदेश आणि उच्च-उपलब्धता वैशिष्ट्ये जोडा

## 🎯 हँड्स-ऑन व्यायाम

### व्यायाम 1: Microsoft Foundry Models चा चॅट अ‍ॅप तैनात करा (30 मिनिटे)
**ध्येय**: उत्पादन-तयार AI चॅट अनुप्रयोग तैनात करा आणि चाचणी करा

```bash
# टेम्पलेट प्रारंभ करा
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरणीय चल सेट करा
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# तैनात करा
azd up

# अनुप्रयोगाची चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# कृत्रिम बुद्धिमत्ता कार्यांची देखरेख करा
azd monitor

# साफसफाई करा
azd down --force --purge
```

**यश मानदंड:**
- [ ] तैनात पूर्णपणे कोटा त्रुटीांशिवाय पूर्ण होते
- [ ] ब्राउझरमध्ये चॅट इंटरफेसवर प्रवेश शक्य आहे
- [ ] प्रश्न विचारता येतात आणि AI-सक्षम उत्तरे मिळतात
- [ ] Application Insights मध्ये टेलिमेट्री डेटा दिसतो
- [ ] संसाधने यशस्वीरित्या क्लिनअप केल्या गेल्या

**अनुमानित खर्च**: 30 मिनिटांच्या चाचणीसाठी $5-10

### व्यायाम 2: मल्टि-मॉडेल तैनाती कॉन्फिगर करा (45 मिनिटे)
**ध्येय**: वेगवेगळ्या कॉन्फिगरेशनसह एकाधिक AI मॉडेल तैनात करा

```bash
# सानुकूल Bicep कॉन्फिगरेशन तयार करा
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

# डिप्लॉय करा आणि सत्यापित करा
azd provision
azd show
```

**यश मानदंड:**
- [ ] एकाधिक मॉडेल यशस्वीरित्या तैनात झाले
- [ ] वेगवेगळ्या क्षमता सेटिंग्ज लागू केल्या गेल्या
- [ ] मॉडेल API द्वारे प्रवेशयोग्य आहेत
- [ ] अनुप्रयोगातून दोन्ही मॉडेलना कॉल करता येतो

### व्यायाम 3: खर्च मॉनिटरिंग अंमलात आणा (20 मिनिटे)
**ध्येय**: बजेट अलर्ट आणि खर्च ट्रॅकिंग सेटअप करा

```bash
# Bicep मध्ये बजेट अलर्ट जोडा
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

# बजेट अलर्ट तैनात करा
azd provision

# सध्याचे खर्च तपासा
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**यश मानदंड:**
- [ ] Azure मध्ये बजेट अलर्ट तयार झाले
- [ ] ईमेल सूचना कॉन्फिगर केल्या गेल्या
- [ ] Azure पोर्टलमध्ये खर्च डेटा पाहता येतो
- [ ] बजेट थ्रेसहोल्ड योग्यरित्या सेट केले गेले

## 💡 वारंवार विचारले जाणारे प्रश्न

<details>
<summary><strong>विकासादरम्यान Microsoft Foundry Models चे खर्च मी कसे कमी करू?</strong></summary>

1. **फ्री टियर वापरा**: Microsoft Foundry Models प्रति महिना 50,000 टोकन्स मोफत देतो
2. **क्षमता कमी करा**: dev साठी 30+ ऐवजी क्षमता 10 TPM वर सेट करा
3. **azd down वापरा**: सक्रियपणे विकसित करत नसाल तेव्हा संसाधने डी-अलोकेट करा
4. **प्रतिक्रिया कॅश करा**: पुनरावृत्ती प्रश्नांसाठी Redis कॅश लागू करा
5. **Prompt Engineering वापरा**: कार्यक्षम प्रॉम्प्टसह टोकन वापर कमी करा


```bash
# विकास कॉन्फिगरेशन
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models आणि OpenAI API यामध्ये काय फरक आहे?</strong></summary>

**Microsoft Foundry Models**:
- एंटरप्राइझ सुरक्षा आणि अनुपालन
- खाजगी नेटवर्क एकत्रीकरण
- SLA हमी
- Managed Identity प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नवीन मॉडेल्ससाठी जलद प्रवेश
- सुलभ सेटअप
- कमी प्रवेश अडथळा
- फक्त सार्वजनिक इंटरनेट

प्रॉडक्शन अॅप्ससाठी, **Microsoft Foundry Models शिफारस केली जाते**.
</details>

<details>
<summary><strong>Microsoft Foundry Models चे 'quota exceeded' त्रुटी कशा हाताळाव्यात?</strong></summary>

```bash
# सध्याचा कोटा तपासा
az cognitiveservices usage list --location eastus2

# वेगळ्या प्रदेशात प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# क्षमता तात्पुरती कमी करा
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वाढीसाठी विनंती करा
# Azure पोर्टलवर जा > कोटे > वाढीसाठी विनंती करा
```
</details>

<details>
<summary><strong>मी माझे स्वतःचे डेटा Microsoft Foundry Models सोबत वापरू शकतो का?</strong></summary>

होय! RAG (Retrieval Augmented Generation) साठी **Azure AI Search** वापरा:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

हे [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट पहा.
</details>

<details>
<summary><strong>AI मॉडेल एंडपॉइंट कसे सुरक्षित करावे?</strong></summary>

**सर्वोत्तम पद्धती**:
1. Managed Identity वापरा (API की न वापरा)
2. Private Endpoints सक्षम करा
3. Network Security Groups कॉन्फिगर करा
4. रेट लिमिटिंग अंमलात आणा
5. गुप्त माहिती साठवण्यासाठी Azure Key Vault वापरा

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

## समुदाय आणि समर्थन

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [इश्यूज आणि चर्चा](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [अधिकृत दस्तऐवजीकरण](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - आपल्या एडिटरमध्ये Azure + Foundry agent skills इन्स्टॉल करा `npx skills add microsoft/github-copilot-for-azure`

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 सध्याचा अध्याय**: Chapter 2 - AI-First Development
- **⬅️ मागील अध्याय**: [अध्याय 1: तुमचे पहिले प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ पुढचे**: [AI मॉडेल तैनाती](ai-model-deployment.md)
- **🚀 पुढचा अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

**मदत हवी आहे का?** आमच्या समुदाय चर्चेत सामील व्हा किंवा रेपॉझिटरीमध्ये एक इश्यू उघडा. Azure AI + AZD समुदाय आपल्याला यशस्वी होण्यासाठी मदत करण्यासाठी येथे आहे!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून विचारात घ्यावा. महत्त्वाच्या माहितीकरिता व्यावसायिक मानवी अनुवाद शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजां किंवा चुकीच्या अर्थ लावण्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->