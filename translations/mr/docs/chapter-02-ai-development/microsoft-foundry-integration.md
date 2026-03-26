# Microsoft Foundry ची AZD सोबत समाकलन

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ मागील अध्याय**: [अध्याय 1: तुमचा पहिला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ पुढचा**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **🚀 पुढचा अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

## आढावा

ही मार्गदर्शिका Microsoft Foundry सेवा Azure Developer CLI (AZD) सोबत समाकलित करुन AI अनुप्रयोगांच्या सोप्या डिप्लॉयमेंटसाठी कशी वापरायची हे दाखवते. Microsoft Foundry AI अनुप्रयोग तयार करण्यासाठी, डिप्लॉय करण्यासाठी आणि व्यवस्थापित करण्यासाठी एक संपूर्ण प्लॅटफॉर्म प्रदान करते, तर AZD यंत्रसामग्री आणि डिप्लॉयमेंट प्रक्रियेला सोपे करते.

## Microsoft Foundry म्हणजे काय?

Microsoft Foundry हा Microsoft चा AI विकासासाठी एकत्र केलेला प्लॅटफॉर्म आहे ज्यामध्ये समाविष्ट आहे:

- **मॉडेल कॅटलॉग**: अत्याधुनिक AI मॉडेल्सची प्रवेश
- **प्रॉम्प्ट फ्लो**: AI वर्कफ्लोजसाठी व्हिज्युअल डिझायनर
- **Microsoft Foundry पोर्टल**: AI अनुप्रयोगांसाठी एकत्रित विकास पर्यावरण
- **डिप्लॉयमेंट पर्याय**: अनेक होस्टिंग आणि स्केलिंग पर्याय
- **सुरक्षा आणि विश्वसनीयता**: अंगीकृत जबाबदार AI वैशिष्ट्ये

## AZD + Microsoft Foundry: एकत्र चांगले

| वैशिष्ट्य | Microsoft Foundry | AZD समाकलन फायदा |
|---------|-----------------|------------------------|
| **मॉडेल डिप्लॉयमेंट** | मॅन्युअल पोर्टल डिप्लॉयमेंट | स्वयंचलित, पुनरावृत्तीयोग्य डिप्लॉयमेंट्स |
| **इन्फ्रास्ट्रक्चर** | क्लिक थ्रू प्राव्हिजनिंग | Infastructure as Code (Bicep) |
| **पर्यावरण व्यवस्थापन** | एकल पर्यावरण लक्ष | बहु-पर्यावरण (dev/staging/prod) |
| **CI/CD समाकलन** | मर्यादित | नेटिव GitHub Actions समर्थन |
| **खर्च व्यवस्थापन** | मूलभूत निरीक्षण | पर्यावरण-विशिष्ट खर्च ऑप्टिमायझेशन |

## पूर्वअटी

- योग्य परवानग्या असलेली Azure सबस्क्रिप्शन
- Azure Developer CLI स्थापित केलेले
- Microsoft Foundry मॉडेल्स सेवा प्रवेश
- Microsoft Foundry ची मूलभूत ओळख

## मुख्य समाकलन नमुने

### नमुना 1: Microsoft Foundry मॉडेल्स समाकलन

**वापर प्रकरण**: Microsoft Foundry मॉडेल्स सह चॅट अनुप्रयोग डिप्लॉय करा

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

### नमुना 2: AI सर्च + RAG समाकलन

**वापर प्रकरण**: प्राप्ती-सुधारित उत्पादन (RAG) अनुप्रयोग डिप्लॉय करा

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

### नमुना 3: दस्तऐवज बुद्धिमत्ता समाकलन

**वापर प्रकरण**: दस्तऐवज प्रक्रिया आणि विश्लेषण वर्कफ्लोज

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
# मूळ एआय सेवा
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडेल संरचना
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

## डिप्लॉयमेंट वर्कफ्लोज

### Foundry साठी AZD एक्सटेंशन्स

AZD Microsoft Foundry सेवांसाठी AI-विशिष्ट क्षमता जोडणारे एक्सटेंशन्स प्रदान करते:

```bash
# Foundry एजेंट एक्सटेंशन इंस्टॉल करा
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग एक्सटेंशन इंस्टॉल करा
azd extension install azure.ai.finetune

# कस्टम मॉडेल्स एक्सटेंशन इंस्टॉल करा
azd extension install azure.ai.models

# इंस्टॉल केलेली एक्सटेंशन्स यादी करा
azd extension list
```

### `azd ai` सह एजंट-प्रथम डिप्लॉयमेंट

जर तुमच्याकडे एजंट मॅनिफेस्ट असेल, तर Foundry Agent सेवा शी जोडलेले प्रोजेक्ट तयार करण्यासाठी `azd ai agent init` वापरा:

```bash
# एजंट मॅनिफेस्टमधून प्रारंभ करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure वर डिप्लॉय करा
azd up
```

पूर्ण कमांड संदर्भ आणि फ्लॅगसाठी पाहा [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### एकच कमांड डिप्लॉयमेंट

```bash
# एकाच कमांडने सर्व तैनात करा
azd up

# किंवा हळूहळू तैनात करा
azd provision  # केवळ पायाभूत सुविधा
azd deploy     # केवळ अनुप्रयोग
```

### पर्यावरण-विशिष्ट डिप्लॉयमेंट्स

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

## देखरेख आणि निरीक्षण

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

## सामान्य समस्या सोडवणे

### समस्या 1: OpenAI कोटा ओलांडली

**लक्षणे:**
- कोटा त्रुटींसह डिप्लॉयमेंट अयशस्वी
- अनुप्रयोग लॉग्स मध्ये 429 त्रुटी

**उपाय:**
```bash
# सध्याच्या कोटाचा वापर तपासा
az cognitiveservices usage list --location eastus

# वेगळ्या प्रदेशात प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# तात्पुरती क्षमता कमी करा
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण अयशस्वी

**लक्षणे:**
- AI सेवा कॉल करताना 401/403 त्रुटी
- "प्रवेश नाकारला" संदेश

**उपाय:**
```bash
# भूमिका नियुक्ती तपासा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# व्यवस्थापित ओळख संरचना तपासा
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault प्रवेश सत्यापित करा
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडेल डिप्लॉयमेंट समस्या

**लक्षणे:**
- डिप्लॉयमेंटमध्ये मॉडेल उपलब्ध नाहीत
- विशिष्ट मॉडेल व्हर्जन अयशस्वी होत आहेत

**उपाय:**
```bash
# प्रदेशानुसार उपलब्ध मॉडेलची यादी करा
az cognitiveservices model list --location eastus

# बायसेप टेम्पलेटमधील मॉडेल आवृत्ती अद्ययावत करा
# मॉडेलची क्षमता आवश्यकता तपासा
```

## उदाहरण साचे

### RAG चॅट अनुप्रयोग (Python)

**स्वामित्व**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवा**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**वर्णन**: सर्वात लोकप्रिय Azure AI नमुना — उत्पादनासाठी सज्ज RAG चॅट अॅप जे तुमच्या स्वतःच्या दस्तऐवजांवर प्रश्न विचारण्याची सुविधा देते. GPT-4.1-mini चॅट साठी, टेक्स्ट-एंबेडिंग-अडा-002 एम्बेडिंगसाठी, आणि Azure AI Search पुनर्प्राप्तीसाठी वापरतो. मल्टिमोडल दस्तऐवज, स्पीच इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण, आणि Application Insights ट्रेसिंगसाठी समर्थन करते.

**जलद प्रारंभ:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG चॅट अनुप्रयोग (.NET)

**स्वामित्व**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**सेवा**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**वर्णन**: Python RAG चॅट नमुन्याचा .NET/C# समकक्ष. ASP.NET Core Minimal API आणि Blazor WebAssembly फ्रंटएंडसह तयार केलेले. व्हॉइस चॅट, GPT-4o-mini व्हिजन समर्थन, आणि एक स्पर्धात्मक .NET MAUI Blazor हायब्रिड डेस्कटॉप/मोबाइल क्लायंट समाविष्ट आहे.

**जलद प्रारंभ:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG चॅट अनुप्रयोग (Java)

**स्वामित्व**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**सेवा**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**वर्णन**: Langchain4J वापरून Java RAG चॅट नमुना AI ऑर्केस्ट्रेशनसाठी. मायक्रोसर्व्हिस इव्हेंट-चालित आर्किटेक्चर, अनेक शोध धोरणे (टेक्स्ट, व्हेक्टर, हायब्रिड), Azure दस्तऐवज बुद्धिमत्तेसह दस्तऐवज अपलोड, आणि Azure Container Apps किंवा Azure Kubernetes Service वर डिप्लॉयमेंटसाठी समर्थन करते.

**जलद प्रारंभ:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### एंटरप्राइझ रिटेल कॉपायलट Azure AI Foundry सह

**स्वामित्व**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवा**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**वर्णन**: Azure AI Foundry आणि Prompty वापरून पूर्ण रिटेल RAG कॉपायलट. प्रॉडक्ट कॅटलॉग आणि ग्राहक ऑर्डर डेटावर आधारलेले Contoso आउटडोअर रिटेलर चॅटबॉट. संपूर्ण GenAIOps वर्कफ्लो दाखवते — Prompty सह प्रोटोटाइप, AI सहाय्यक मूल्यांकन, आणि AZD मधून Container Apps वर डिप्लॉयमेंट.

**जलद प्रारंभ:**
```bash
azd init --template contoso-chat
azd up
```

### क्रिएटिव लेखन मल्टी-एजंट अनुप्रयोग

**स्वामित्व**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**सेवा**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**वर्णन**: Prompty सह AI एजंट ऑर्केस्ट्रेशन दाखवणारा मल्टी-एजंट नमुना. संशोधन एजंट (Bing Grounding in Azure AI Agent Service), उत्पादन एजंट (Azure AI Search), लेखिका एजंट, व संपादक एजंट सह संयुक्तपणे चांगले संशोधित लेख तयार करतो. GitHub Actions मध्ये CI/CD मूल्यांकन समाविष्ट.

**जलद प्रारंभ:**
```bash
azd init --template contoso-creative-writer
azd up
```

### सर्व्हरलेस RAG चॅट (JavaScript/TypeScript)

**स्वामित्व**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**सेवा**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**वर्णन**: Azure Functions API सोबत आणि Azure Static Web Apps होस्टिंगसाठी वापरलेले पूर्णपणे सर्व्हरलेस RAG चॅटबॉट LangChain.js वापरतो. Azure Cosmos DB दोन्ही व्हेक्टर स्टोअर व चॅट इतिहास डेटाबेस म्हणून कार्य करते. Ollama सह स्थानिक विकासासाठी शून्य-खर्च चाचणीसाठी समर्थन.

**जलद प्रारंभ:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**स्वामित्व**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**सेवा**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**वर्णन**: एंटरप्राइझ-ग्रेड RAG सोल्यूशन एक्सेलेरेटर ज्यामध्ये दस्तऐवज अपलोड/व्यवस्थापनासाठी अॅडमिन पोर्टल, अनेक ऑर्केस्ट्रेटर पर्याय (Semantic Kernel, LangChain, Prompt Flow), स्पीच-टू-टेक्स्ट, Microsoft Teams समाकलन, आणि PostgreSQL किंवा Cosmos DB पर्यायांची निवड. उत्पादन RAG परिस्थितींसाठी सानुकूलित प्रारंभिक बिंदू म्हणून डिझाइन केले.

**जलद प्रारंभ:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ट्रॅव्हल एजंट्स — मल्टी-एजंट MCP ऑर्केस्ट्रेशन

**स्वामित्व**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**सेवा**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP सर्व्हर्स (.NET, Python, Java, TypeScript)

**वर्णन**: तीन फ्रेमवर्क (LangChain.js, LlamaIndex.TS, आणि Microsoft Agent Framework) वापरून मल्टी-एजंट AI ऑर्केस्ट्रेशनसाठी संदर्भ अनुप्रयोग. चार भाषांमध्ये MCP (Model Context Protocol) सर्व्हर्स जे सर्व्हरलेस Azure Container Apps म्हणून डिप्लॉय केलेले आणि OpenTelemetry मॉनिटरिंगसह.

**जलद प्रारंभ:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI स्टार्टर

**स्वामित्व**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**सेवा**: Azure AI सेवा + Azure OpenAI

**वर्णन**: Azure AI सेवा मशीन लर्निंग मॉडेलसह कॉन्फिगर करुन डिप्लॉय करणारे मिनिमल Bicep टेम्पलेट. केवळ Azure AI इन्फ्रास्ट्रक्चर आवश्यक असलेल्या हलक्या सुरूवातीसाठी.

**जलद प्रारंभ:**
```bash
azd init --template azd-ai-starter
azd up
```

> **अधिक साच्यांसाठी**: [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) येथे 80+ AI-विशिष्ट AZD टेम्पलेट्स भाषांनुसार आणि परिस्थितींसाठी पहा.

## पुढील पावले

1. **उदाहरणे वापरून पहा**: तुमच्या वापर प्रकरणाशी सुसंगत पूर्वनिर्मित टेम्पलेट वापरून प्रारंभ करा
2. **तुमच्या गरजेनुसार सानुकूल करा**: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग कोड बदल करा
3. **निरीक्षण जोडा**: सर्वसमावेशक निरीक्षण अमलात आणा
4. **खर्च ऑप्टिमायझेशन करा**: तुमच्या बजेटनुसार कॉन्फिगरेशन सुधारित करा
5. **तुमच्या डिप्लॉयमेंटला सुरक्षित करा**: एंटरप्राइझ सुरक्षा नमुने वापरा
6. **उत्पादनासाठी स्केल करा**: बहु-प्रदेश आणि उच्च उपलब्धता वैशिष्ट्ये जोडा

## 🎯 हाताळणी अभ्यास

### अभ्यास 1: Microsoft Foundry मॉडेल्स चॅट अॅप डिप्लॉय करा (30 मिनिटं)
**उद्दिष्ट**: उत्पादनासाठी तयार AI चॅट अनुप्रयोग डिप्लॉय करा आणि चाचणी करा

```bash
# टेम्पलेट प्रारंभ करा
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरणीय चल सेट करा
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# वितरण करा
azd up

# अनुप्रयोगाची चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# एआय ऑपरेशन्सवर देखरेख ठेवा
azd monitor

# स्वच्छता करा
azd down --force --purge
```

**यशस्वी निकष:**
- [ ] कोटा त्रुटीशिवाय डिप्लॉयमेंट पूर्ण
- [ ] ब्राउझरमध्ये चॅट इंटरफेस उपलब्ध
- [ ] प्रश्न विचारू शकणे आणि AI-आधारित प्रतिसाद प्राप्त करणे
- [ ] Application Insights मध्ये टेलीमेट्री डेटा दिसणे
- [ ] संसाधने यशस्वीपणे साफ केली गेली

**अंदाजे खर्च**: 30 मिनिटांच्या चाचणीसाठी $5-10

### अभ्यास 2: बहु-मॉडेल डिप्लॉयमेंट कॉन्फिगर करा (45 मिनिटं)
**उद्दिष्ट**: वेगवेगळ्या कॉन्फिगरेशनसह अनेक AI मॉडेल्स डिप्लॉय करा

```bash
# सानुकूल बायसेप कॉन्फिगरेशन तयार करा
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

# तैनात करा आणि तपासा
azd provision
azd show
```

**यशस्वी निकष:**
- [ ] अनेक मॉडेल्स यशस्वीरित्या डिप्लॉय झाले
- [ ] वेगवेगळ्या क्षमता सेटिंग्ज लागू केल्या
- [ ] API मार्फत मॉडेल्स उपलब्ध आहेत
- [ ] दोन्ही मॉडेल्सवरून अनुप्रयोग कॉल करू शकता

### अभ्यास 3: खर्च निरीक्षण अंमलात आणा (20 मिनिटं)
**उद्दिष्ट**: बजेट अलर्ट्स आणि खर्च ट्रॅकिंग सेटअप करा

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

# विद्यमान खर्च तपासा
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**यशस्वी निकष:**
- [ ] Azure मध्ये बजेट अलर्ट तयार केला
- [ ] ईमेल सूचना कॉन्फिगर केल्या
- [ ] Azure पोर्टल मध्ये खर्च डेटा पाहू शकता
- [ ] बजेट सीमा योग्यरित्या सेट केल्या

## 💡 वारंवार विचारले जाणारे प्रश्न

<details>
<summary><strong>विकासादरम्यान Microsoft Foundry मॉडेल्स खर्च कसे कमी करावे?</strong></summary>

1. **मुफत टियर वापरा**: Microsoft Foundry Models 50,000 टोकन्स/महिना विनामूल्य देते
2. **क्षमता कमी करा**: विकासासाठी 30+ ऐवजी 10 TPM सेट करा
3. **`azd down` वापरा**: सक्रिय विकास नसताना संसाधने डीअलोकेट करा
4. **प्रतिसाद कॅश करा**: पुनरावृत्ती प्रश्नांसाठी Redis कॅश वापरा
5. **Prompt इंजिनिअरिंग वापरा**: कार्यक्षम प्रॉम्प्ट्सने टोकन वापर कमी करा

```bash
# विकास कॉन्फिगरेशन
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models आणि OpenAI API मधील फरक काय आहे?</strong></summary>

**Microsoft Foundry Models**:
- एंटरप्राइझ सुरक्षा आणि अनुपालन
- खाजगी नेटवर्क समाकलन
- SLA हमी
- व्यवस्थापित ओळख प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नवीन मॉडेल्ससाठी जलद प्रवेश
- सुलभ सेटअप
- कमी प्रवेश अडथळा
- केवळ सार्वजनिक इंटरनेट

उत्पादन अनुप्रयोगांसाठी, **Microsoft Foundry Models शिफारस केली आहे**.
</details>

<details>
<summary><strong>मी Microsoft Foundry Models च्या कोटा ओलांडल्याच्या त्रुटी कशा हाताळू?</strong></summary>

```bash
# सध्याचा कोटा तपासा
az cognitiveservices usage list --location eastus2

# वेगळ्या प्रदेशाचा प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# क्षमतेत तात्पुरती कपात करा
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वाढीची विनंती करा
# Azure पोर्टल > कोटा > वाढीची विनंती करा याकडे जा
```
</details>

<details>
<summary><strong>मी माझे स्वतःचे डेटा Microsoft Foundry Models मध्ये वापरू शकतो का?</strong></summary>

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

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट पहा.
</details>

<details>
<summary><strong>मी AI मॉडेल एंडपॉइंट्स कसे सुरक्षित ठेवू?</strong></summary>

**सर्वोत्तम पद्धती**:
1. Managed Identity वापरा (API कीज न वापरता)
2. Private Endpoints सक्षम करा
3. नेटवर्क सुरक्षा गट कॉन्फिगर करा
4. दर मर्यादिती अमलात आणा
5. गुपितांसाठी Azure Key Vault वापरा

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

- **Microsoft Foundry Discord**: [#Azure चॅनेल](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [गोष्टी आणि चर्चा](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [अधिकृत दस्तऐवज](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill skills.sh वर](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - आपल्या संपादकात Azure + Foundry एजंट स्किल्स `npx skills add microsoft/github-copilot-for-azure` वापरून इंस्टॉल करा

---

**पाठ नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-First Development
- **⬅️ मागील अध्याय**: [अध्याय 1: तुमचा पहिला प्रकल्प](../chapter-01-foundation/first-project.md)
- **➡️ पुढील**: [AI मॉडेल तैनात](ai-model-deployment.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

**मदत हवी आहे का?** आमच्या समुदाय चालकांमध्ये सहभागी व्हा किंवा रिपॉझिटरीमध्ये समस्या उघडा. Azure AI + AZD समुदाय तुम्हाला यशस्वी होण्यासाठी येथे आहे!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**डिसक्लेमर**:
हा दस्तऐवज एआय अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील आहोत, तरी कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेचा अभाव असू शकतो. मूळ दस्तऐवज त्याच्या मातृभाषेत अधिकृत स्रोत मानावा. महत्त्वाची माहिती असल्यास व्यावसायिक मानवी अनुवाद घेणे शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवलेल्या कुठल्याही गैरसमज किंवा चुकीच्या समजुतीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->