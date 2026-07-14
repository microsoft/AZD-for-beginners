# Microsoft Foundry चे AZD सह एकत्रीकरण

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ मागील अध्याय**: [अध्याय 1: तुमचा पहिला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ पुढील**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

## ओव्हरव्ह्यू

हा मार्गदर्शक Microsoft Foundry सेवा Azure Developer CLI (AZD) सह कशा एकत्रित करता येतात हे दाखवतो, ज्यामुळे AI अनुप्रयोगांच्या डिप्लॉयमेंटसाठी प्रक्रिया सुलभ होते. Microsoft Foundry हे AI अनुप्रयोग तयार करणे, डिप्लॉय करणे आणि व्यवस्थापित करण्यासाठी एक विस्तृत प्लॅटफॉर्म प्रदान करते, तर AZD इन्फ्रास्ट्रक्चर आणि डिप्लॉयमेंट प्रक्रिया सुलभ करते.

## Microsoft Foundry म्हणजे काय?

Microsoft Foundry ही Microsoft ची AI विकासासाठी एक एकत्रित प्लॅटफॉर्म आहे ज्यात समाविष्ट आहे:

- **मॉडेल कॅटलॉग**: अत्याधुनिक AI मॉडेल्सचा प्रवेश
- **प्रॉम्प्ट फ्लो**: AI वर्कफ्लोजसाठी व्हिज्युअल डिझायनर
- **Microsoft Foundry पोर्टल**: AI अनुप्रयोगांसाठी एकत्रित विकास पर्यावरण
- **डिप्लॉयमेंट पर्याय**: विविध होस्टिंग आणि स्केलिंग पर्याय
- **सुरक्षितता आणि सुरक्षा**: अंगभूत जबाबदार AI वैशिष्ट्ये

## AZD + Microsoft Foundry: एकत्रित उत्तम

| वैशिष्ट्य | Microsoft Foundry | AZD एकत्रीकरणाचा लाभ |
|---------|-----------------|------------------------|
| **मॉडेल डिप्लॉयमेंट** | मॅन्युअल पोर्टल डिप्लॉयमेंट | ऑटोमेटेड, पुनरावृत्तीयोग्य डिप्लॉयमेंट |
| **इन्फ्रास्ट्रक्चर** | क्लिक-थ्रू प्रोव्हिजनिंग | इन्फ्रास्ट्रक्चर अस कोड (Bicep) |
| **पर्यावरण व्यवस्थापन** | एकल पर्यावरण केंद्रित | बहु-पर्यावरण (डेव्ह/स्टेजिंग/प्रॉडक्शन) |
| **CI/CD एकत्रीकरण** | मर्यादित | नैसर्गिक GitHub Actions समर्थन |
| **खर्च व्यवस्थापन** | मूलभूत निरीक्षण | पर्यावरण-विशिष्ट खर्च अनुकूलन |

## पूर्वअटी

- योग्य परवानग्या असलेले Azure सबस्क्रिप्शन
- Azure Developer CLI स्थापित केलेले असणे
- Microsoft Foundry मॉडेल सेवा प्रवेश
- Microsoft Foundry ची मूलभूत ओळख

> **सध्याचा AZD बेसलाइन:** हे उदाहरण `azd` `1.27.1` विरुद्ध पुनरावलोकन केले गेले आहे. AI एजंट वर्कफ्लो साठी, चालू प्रिव्ह्युअर विस्तार प्रकाशन वापरा आणि स्थापित आवृत्ती तपासा.

## मुख्य एकत्रीकरण नमुने

### नमुना 1: Microsoft Foundry मॉडेल्स एकत्रीकरण

**वापर प्रकरण**: Microsoft Foundry मॉडेल्स मॉडेल्ससह चॅट अनुप्रयोग डिप्लॉय करा

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

### नमुना 2: AI शोध + RAG एकत्रीकरण

**वापर प्रकरण**: रिट्रीवल-ऑगमेंटेड जनरेशन (RAG) अनुप्रयोग डिप्लॉय करा

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

**वापर प्रकरण**: दस्तऐवज प्रक्रियाकरण आणि विश्लेषण वर्कफ्लोज

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

### पर्यावरण चल सेटअप

**उत्पादन कॉन्फिगरेशन:**
```bash
# मुख्य एआय सेवा
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडेल संरचना
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# कार्यक्षमता सेटिंग्ज
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**विकास कॉन्फिगरेशन:**
```bash
# विकासासाठी खर्च-कार्यक्षम सेटिंग्ज
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # विनामूल्य स्तर
```

### की वॉल्ट सह सुरक्षित कॉन्फिगरेशन

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

## डिप्लॉयमेंट वर्कफ्लोज

### Foundry साठी AZD एक्सटेंशन्स

AZD मध्ये Microsoft Foundry सेवांसह काम करण्यासाठी AI-विशिष्ट क्षमता वाढविणारे एक्सटेंशन्स आहेत:

```bash
# Foundry एजंट्स एक्सटेन्शन स्थापित करा
azd extension install azure.ai.agents

# फाईन-ट्यूनिंग एक्सटेन्शन स्थापित करा
azd extension install azure.ai.finetune

# कस्टम मॉडेल्स एक्सटेन्शन स्थापित करा
azd extension install azure.ai.models

# स्थापित एक्सटेन्शन्सची यादी करा
azd extension list --installed

# सध्या स्थापित एजंट एक्सटेन्शन आवृत्ती तपासा
azd extension show azure.ai.agents
```

AI एक्सटेंशन्स अजूनही प्रिव्ह्युअरमध्ये वेगाने विकसित होत आहेत. जर एखादा कमांड इथे दाखवल्याच्या तुलनेत वेगळ्या प्रकारे वागत असेल, तर संबंधित एक्सटेंशन अपग्रेड करा आणि नंतर प्रोजेक्टची तक्रारी हाताळा.

### `azd ai` सह एजंट-प्रथम डिप्लॉयमेंट

तुमच्याकडे एजंट मॅनिफेस्ट असल्यास, Foundry एजंट सेवा शी जोडलेला प्रोजेक्ट स्कॅफोल्ड करण्यासाठी `azd ai agent init` वापरा:

```bash
# एजंट मॅनिफेस्टमधून प्रारंभ करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure वर तैनात करा
azd up
```

`azure.ai.agents` च्या अलीकडच्या प्रिव्ह्युअर प्रकाशनांनी `azd ai agent init` साठी टेम्पलेट-आधारित इनिशियलायझेशन समर्थन देखील जोडले आहे. जर तुम्ही नवीन एजंट उदाहरणे वापरत असाल, तर तुमच्या स्थापित आवृत्तीतील अचूक फ्लॅगसाठी एक्सटेंशन मदत तपासा.

संपूर्ण कमांड संदर्भ आणि फ्लॅगसाठी पाहा [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### एकल कमांड डिप्लॉयमेंट

```bash
# एकाच आदेशाने सर्वकाही तैनात करा
azd up

# किंवा कालक्रमानुसार तैनात करा
azd provision  # फक्त आधारभूत रचना
azd deploy     # फक्त अनुप्रयोग

# azd 1.23.11+ मध्ये दीर्घ काळ चालणाऱ्या AI अनुप्रयोग तैनातीसाठी
azd deploy --timeout 1800
```

### पर्यावरण-विशिष्ट डिप्लॉयमेंट

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

## निरीक्षण आणि अवलोकनक्षमता

### अनुप्रयोग इनसाइट्स एकत्रीकरण

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

### खर्च निरीक्षण

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

## 🔐 सुरक्षा सर्वोत्तम प्रथा

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

## कार्यक्षमता ऑप्टिमायझेशन

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

## सामान्य समस्या निवारण

### समस्या 1: OpenAI कोटा ओलांडला

**लक्षणे:**
- डिप्लॉयमेंट कोटा त्रुटींसह अयशस्वी होते
- अनुप्रयोग लॉगमध्ये 429 त्रुटी

**उपाय:**
```bash
# वर्तमान कोटा वापर तपासा
az cognitiveservices usage list --location eastus

# वेगळ्या प्रदेशाचा प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# तात्पुरती क्षमता कमी करा
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण अयशस्वी

**लक्षणे:**
- AI सेवांना कॉल करताना 401/403 त्रुटी
- "Access denied" संदेश

**उपाय:**
```bash
# भूमिका नियुक्त्या तपासा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# व्यवस्थापित ओळखीची संरचना तपासा
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# की वॉल्ट प्रवेश वैधता करा
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडेल डिप्लॉयमेंट समस्या

**लक्षणे:**
- मॉडेल डिप्लॉयमेंटमध्ये अनुपलब्ध
- विशिष्ट मॉडेल आवृत्त्या अयशस्वी

**उपाय:**
```bash
# विभागानुसार उपलब्ध मॉडेलची यादी करा
az cognitiveservices model list --location eastus

# बायसेप टेम्पलेटमध्ये मॉडेल आवृत्ती अद्ययावत करा
# मॉडेल क्षमतेच्या गरजांची तपासणी करा
```

## उदाहरण टेम्प्लेट्स

### RAG चॅट अनुप्रयोग (Python)

**रिपॉझिटरी**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवा**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**वर्णन**: सर्वाधिक लोकप्रिय Azure AI नमुना — उत्पादन-तयार RAG चॅट अॅप जो तुम्हाला तुमच्या स्वतःच्या दस्तऐवजांवर प्रश्न विचारण्याची परवानगी देतो. GPT-4.1-mini चॅटसाठी, text-embedding-3-large एम्बेडिंगसाठी, आणि Azure AI Search पुनर्प्राप्तीसाठी वापरतो. मल्टीमोडल दस्तऐवज, भाषण इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण, आणि Application Insights ट्रेसिंगला समर्थन.

**जलद सुरूवात**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG चॅट अनुप्रयोग (.NET)

**रिपॉझिटरी**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**सेवा**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**वर्णन**: Python RAG चॅट नमुन्याचा .NET/C# समतुल्य. ASP.NET Core Minimal API आणि Blazor WebAssembly फ्रंटएंड सह तयार केलेले. व्हॉइस चॅट, GPT-4o-mini दृष्टी समर्थन, आणि एक संगी .NET MAUI Blazor हायब्रिड डेस्कटॉप/मोबाइल क्लायंट समाविष्ट.

**जलद सुरूवात**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG चॅट अनुप्रयोग (Java)

**रिपॉझिटरी**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**सेवा**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**वर्णन**: Langchain4J वापरून AI ऑर्केस्ट्रेशनसाठी Java आवृत्ती RAG चॅट नमुन्याची. मायक्रोसर्व्हिस इव्हेंट-चालित आर्किटेक्चर, विविध शोध धोरणे (टेक्स्ट, व्हेक्टर, हायब्रिड), Azure Document Intelligence सह दस्तऐवज अपलोड, आणि Azure Container Apps किंवा Azure Kubernetes Service मधील कोणत्याही डिप्लॉयमेंटवर समर्थन.

**जलद सुरूवात**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry सह एंटरप्राइझ रिटेल कोपायलट

**रिपॉझिटरी**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवा**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**वर्णन**: Microsoft Foundry आणि Prompty वापरून संपूर्ण रिटेल RAG कोपायलट. Contoso आउटडोअर रिटेलर चॅटबॉट जो उत्पादन कॅटलॉग आणि ग्राहक ऑर्डर डेटावर आधारित प्रतिसाद देतो. GenAIOps चा पूर्ण वर्कफ्लो दाखवतो — Prompty सह प्रोटोटाइप, AI-सहाय्यक मूल्यांकनांसह मूल्यांकन, आणि AZD द्वारे कंटेनर अॅप्सवर डिप्लॉयमेंट.

**जलद सुरूवात**:
```bash
azd init --template contoso-chat
azd up
```

### क्रिएटिव्ह राइटिंग मल्टी-एजंट अनुप्रयोग

**रिपॉझिटरी**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**सेवा**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**वर्णन**: Prompty वापरून AI एजंट ऑर्केस्ट्रेशन दर्शवणारा मल्टी-एजंट नमुना. संशोधन एजंट (Bing Grounding Azure AI Agent Service मध्ये), उत्पादन एजंट (Azure AI Search), लेखक एजंट, आणि संपादक एजंट एकत्रितपणे संशोधित लेख तयार करतात. GitHub Actions मधील मूल्यांकनासह CI/CD समाविष्ट.

**जलद सुरूवात**:
```bash
azd init --template contoso-creative-writer
azd up
```

### सर्व्हरलेस RAG चॅट (JavaScript/TypeScript)

**रिपॉझिटरी**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**सेवा**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**वर्णन**: LangChain.js सह पूर्णपणे सर्व्हरलेस RAG चॅटबॉट ज्यामध्ये Azure Functions API साठी आणि Azure Static Web Apps होस्टिंगसाठी वापरते. Azure Cosmos DB व्हेक्टर स्टोअर आणि चॅट इतिहास डेटाबेस म्हणून वापरते. स्थानिक विकासासाठी Ollama सह शून्य खर्च चाचणी समर्थन करते.

**जलद सुरूवात**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### तुमच्या डेटा सोबत चॅट सोल्यूशन अॅक्सेलरेटर

**रिपॉझिटरी**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**सेवा**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**वर्णन**: दस्तऐवज अपलोड/व्यवस्थापनासाठी अॅडमिन पोर्टलसह एंटरप्राइझ दर्जाचा RAG सोल्यूशन अॅक्सेलरेटर, अनेक ऑर्केस्ट्रेटर पर्याय (Semantic Kernel, LangChain, Prompt Flow), भाषण-ते-टेक्स्ट, Microsoft Teams एकत्रीकरण, आणि PostgreSQL किंवा Cosmos DB बॅकएंडची निवड. उत्पादन RAG परिस्थितीसाठी सानुकूलता करण्यास योग्य प्रारंभ बिंदू म्हणून डिझाइन केलेला.

**जलद सुरूवात**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ट्रॅव्हल एजंट्स — मल्टी-एजंट MCP ऑर्केस्ट्रेशन

**रिपॉझिटरी**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**सेवा**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP सर्व्हर्स (.NET, Python, Java, TypeScript)

**वर्णन**: तीन फ्रेमवर्क्स (LangChain.js, LlamaIndex.TS, आणि Microsoft Agent Framework) वापरून मल्टी-एजंट AI ऑर्केस्ट्रेशनसाठी संदर्भ अनुप्रयोग. चार भाषा MCP (मॉडेल कॉन्टेक्स्ट प्रोटोकॉल) सर्व्हर्ससह, OpenTelemetry निरीक्षणासह सर्व्हरलेस Azure Container Apps मध्ये डिप्लॉय केलेले.

**जलद सुरूवात**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI स्टार्टर

**रिपॉझिटरी**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**सेवा**: Azure AI Services + Azure OpenAI

**वर्णन**: मशीन लर्निंग मॉडेल्ससह Azure AI सेवांची कॉन्फिगरेशनसह न्यूनतम बिसेप टेम्प्लेट. पूर्ण अनुप्रयोग स्टॅकशिवाय फक्त Azure AI इन्फ्रास्ट्रक्चर प्रोव्हिजन करण्यासाठी एक हलके प्रारंभ बिंदू.

**जलद सुरूवात**:
```bash
azd init --template azd-ai-starter
azd up
```

> **अधिक टेम्प्लेट्स पहा**: भाषां आणि परिस्थितींसाठी 80+ AI-विशिष्ट AZD टेम्प्लेट्ससाठी [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) भेट द्या.

## पुढील पावले

1. **उदाहरणे वापरून पहा**: तुमच्या वापर प्रकरणाशी जुळणारा प्री-बिल्ट टेम्प्लेट वापरून सुरू करा
2. **तुमच्या गरजेनुसार सानुकूलित करा**: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग कोड बदल करा
3. **निरीक्षण जोडा**: संपूर्ण अवलोकनक्षमता अंमलात आणा
4. **खर्चाचे ऑप्टिमायझेशन करा**: तुमच्या बजेटसाठी कॉन्फिगरेशन योग्य प्रकारे ट्यून करा
5. **तुमचा डिप्लॉयमेंट सुरक्षित करा**: एंटरप्राइझ सुरक्षा नमुन्यांची अंमलबजावणी करा
6. **प्रॉडक्शनसाठी स्केल करा**: बहु-प्रांत आणि उच्च उपलब्धता वैशिष्ट्ये जोडा

## 🎯 प्रत्यक्ष व्यायाम

### व्यायाम 1: Microsoft Foundry मॉडेल्स चॅट अॅप डिप्लॉय करा (30 मिनिटे)
**लक्ष्य**: उत्पादन-तयार AI चॅट अनुप्रयोग डिप्लॉय आणि तपासा

```bash
# टेम्पलेट प्रारंभ करा
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरण चल सेट करा
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# तैनात करा
azd up

# अनुप्रयोग चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# एआय ऑपरेशन्सवर देखरेख करा
azd monitor

# साफसफाई करा
azd down --force --purge
```

**यशस्वी निकष:**
- [ ] कोटा त्रुटीशिवाय डिप्लॉयमेंट पूर्ण होणे
- [ ] ब्राउझरमध्ये चॅट इंटरफेसला प्रवेश करता येणे
- [ ] प्रश्न विचारता येणे आणि AI-शक्तीशाली प्रतिसाद मिळणे
- [ ] Application Insights मध्ये टेलीमेट्री डेटा दिसणे
- [ ] यशस्वीपणे संसाधने साफ करणे

**अंदाजे खर्च**: 30 मिनिटांच्या तपासणीसाठी $5-10

### व्यायाम 2: मल्टी-मॉडेल डिप्लॉयमेंट कॉन्फिगर करा (45 मिनिटे)
**लक्ष्य**: वेगवेगळ्या कॉन्फिगरेशनसह अनेक AI मॉडेल्स डिप्लॉय करा

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

# तैनात करा आणि सत्यापित करा
azd provision
azd show
```

**यशस्वी निकष:**
- [ ] अनेक मॉडेल्स यशस्वीपणे डिप्लॉय झाले
- [ ] भिन्न क्षमता सेटिंग्ज लागू केल्या
- [ ] मॉडेल्स API द्वारे प्रवेशयोग्य
- [ ] दोन्ही मॉडेल्सना अनुप्रयोगातून कॉल करता येणे

### व्यायाम 3: खर्च निरीक्षण अंमलात आणा (20 मिनिटे)
**लक्ष्य**: बजेट अलर्ट आणि खर्च ट्रॅकिंग सेटअप करा

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

# वर्तमान खर्च तपासा
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**यशस्वी निकष:**
- [ ] Azure मध्ये बजेट अलर्ट तयार केले
- [ ] ईमेल सूचनांची कॉन्फिगरेशन
- [ ] Azure पोर्टलमध्ये खर्च डेटा पाहता येणे
- [ ] बजेट सीमा योग्यरित्या सेट केल्या

## 💡 वारंवार विचारले जाणारे प्रश्न

<details>
<summary><strong>विकसनादरम्यान Microsoft Foundry मॉडेल्सचा खर्च कसा कमी करावा?</strong></summary>

1. **फ्री टियर वापरा**: Microsoft Foundry मॉडेल्स 50,000 टोकन्स/महिना मोफत ऑफर करतो
2. **क्षमता कमी करा**: विकासासाठी 30+ ऐवजी 10 TPM सेट करा
3. **azd down वापरा**: सक्रियपणे विकसित न करताना संसाधने डी-अलोकेट करा
4. **रेडिस कॅश वापरा**: पुनरावृत्ती विचारांसाठी कॅश अंमलात आणा
5. **प्रॉम्प्ट इंजिनिअरिंग वापरा**: कार्यक्षम प्रॉम्प्ट्सद्वारे टोकन वापर कमी करा


```bash
# विकास संरचना
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry मॉडेल्स आणि OpenAI API यामध्ये काय फरक आहे?</strong></summary>

**Microsoft Foundry मॉडेल्स**:
- एंटरप्राइझ सुरक्षा आणि नियमांचे पालन
- खाजगी नेटवर्क एकात्मीकरण
- SLA हमी
- व्यवस्थापित ओळख प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नवीन मॉडेल्ससाठी जलद प्रवेश
- सोपी सेटअप
- प्रवेशासाठी कमी अडथळा
- केवळ सार्वजनिक इंटरनेट

उत्पादन अनुप्रयोगांसाठी, **Microsoft Foundry मॉडेल्सची शिफारस केली जाते**.
</details>

<details>
<summary><strong>Microsoft Foundry मॉडेल्स कोटा ओलांडलेल्या त्रुटी कशा हाताळायच्या?</strong></summary>

```bash
# सध्याची कोटा तपासा
az cognitiveservices usage list --location eastus2

# वेगळा प्रदेश वापरून पाहा
azd env set AZURE_LOCATION westus2
azd up

# क्षमतेत तात्पुरता घट करा
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वाढविण्याची विनंती करा
# Azure पोर्टल > कोटा > वाढविण्याची विनंती येथे जा
```
</details>

<details>
<summary><strong>Microsoft Foundry मॉडेल्ससह मी माझे स्वतःचे डेटा वापरू शकतो का?</strong></summary>

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

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्प्लेट पाहा.
</details>

<details>
<summary><strong>मी AI मॉडेलचा एंडपॉइंट्स कसे सुरक्षित करावे?</strong></summary>

**सर्वोत्तम पद्धती**:
1. व्यवस्थापित ओळख वापरा (API कीज नाही)
2. खाजगी एंडपॉइंट्स सक्षम करा
3. नेटवर्क सुरक्षा गट कॉन्फिगर करा
4. दर मर्यादा लागू करा
5. की सिक्रेटसाठी Azure Key Vault वापरा

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
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [अधिकृत दस्तऐवज](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh वरील Microsoft Foundry कौशल्य](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - आपला संपादकात `npx skills add microsoft/github-copilot-for-azure` कमांडसह Azure + Foundry एजंट कौशल्ये स्थापित करा

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD Beginners साठी](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ मागील अध्याय**: [अध्याय 1: तुमचा पहिला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ पुढील**: [AI मॉडेल तैनाती](ai-model-deployment.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

**मदतीची गरज आहे का?** आमच्या समुदाय चर्चेत सहभागी व्हा किंवा रेपॉझिटरीमध्ये एक मुद्दा उघडा. Azure AI + AZD समुदाय आपले यश मिळविण्यासाठी येथे आहे!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->