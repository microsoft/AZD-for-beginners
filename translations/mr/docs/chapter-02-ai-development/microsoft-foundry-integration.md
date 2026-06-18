# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

हा मार्गदर्शक Microsoft Foundry सेवा Azure Developer CLI (AZD) सोबत कशी एकत्रित करायची हे दर्शवितो जेणेकरून AI अनुप्रयोगांचे तातडीने वितरण होईल. Microsoft Foundry हे AI अनुप्रयोग तयार करण्यासाठी, वितरणासाठी, आणि व्यवस्थापनासाठी एक संपूर्ण प्लॅटफॉर्म प्रदान करते, जेव्हा AZD या इन्फ्रास्ट्रक्चर आणि वितरण प्रक्रियेचे सुलभीकरण करते.

## Microsoft Foundry म्हणजे काय?

Microsoft Foundry हे Microsoft चे एकत्रित AI विकासासाठीचे प्लॅटफॉर्म आहे ज्यात समाविष्ट आहे:

- **मॉडेल कॅटलॉग**: अत्याधुनिक AI मॉडेल्ससाठी प्रवेश
- **प्रॉम्प्ट फ्लो**: AI वर्कफ्लोजसाठी व्हिज्युअल डिझायनर
- **Microsoft Foundry पोर्टल**: AI अनुप्रयोगांसाठी एकात्मित विकास वातावरण
- **डिप्लॉयमेंट पर्याय**: अनेक होस्टिंग आणि स्केलिंग पर्याय
- **सुरक्षितता आणि सुरक्षितता**: अंगभूत जबाबदार AI वैशिष्ट्ये

## AZD + Microsoft Foundry: एकत्रित केल्याने बरे

| वैशिष्ट्य | Microsoft Foundry | AZD एकत्रीकरणाचा फायदा |
|---------|-----------------|------------------------|
| **मॉडेल वितरण** | मॅन्युअल पोर्टल वितरण | स्वयंचलित, पुनरावृत्तीयोग्य वितरण |
| **इन्फ्रास्ट्रक्चर** | क्लिक-थ्रू प्रोव्हिजनिंग | Infrastructure as Code (Bicep) |
| **परिसर व्यवस्थापन** | एकच पर्यावरण लक्ष केंद्रित | मल्टी-पर्यावरण (dev/staging/prod) |
| **CI/CD एकत्रीकरण** | मर्यादित | नेटिव्ह GitHub Actions समर्थन |
| **खर्च व्यवस्थापन** | मूलभूत मॉनिटरिंग | पर्यावरणानुसार खर्च ऑप्टिमायझेशन |

## पूर्वअटी

- योग्य परवानग्या असलेले Azure सदस्यता
- Azure Developer CLI स्थापित केलेले
- Microsoft Foundry मॉडेल्स सेवांचा प्रवेश
- Microsoft Foundry ची मूलभूत ओळख

> **सध्याचा AZD बेसलाइन:** हे उदाहरण `azd` `1.23.12` वर आधारित आहे. AI एजंट वर्कफ्लोसाठी, सध्याच्या प्रीव्ह्यू विस्ताराचा वापर करा आणि सुरुवात करण्यापूर्वी आपल्या स्थापित आवृत्तीची खात्री करा.

## मुख्य एकत्रीकरण नमुने

### नमुना 1: Microsoft Foundry Models एकत्रीकरण

**वापर प्रकरण**: Microsoft Foundry Models मॉडेल्ससह चॅट अनुप्रयोग वितरण

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

**वापर प्रकरण**: रिट्रीव्हल-ऑगमेंटेड जनरेशन (RAG) अनुप्रयोग वितरण

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

### नमुना 3: डॉक्युमेंट इंटेलिजेंस एकत्रीकरण

**वापर प्रकरण**: डॉक्युमेंट प्रक्रिया व विश्लेषण वर्कफ्लोज़

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

### वातावरण परिवर्तक सेटअप

**उत्पादन कॉन्फिगरेशन:**
```bash
# मुख्य AI सेवा
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडेल संरचना
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# कामगिरी सेटिंग्ज
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**विकास कॉन्फिगरेशन:**
```bash
# विकासासाठी खर्च-कमी केलेले सेटिंग्ज
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # विनामूल्य स्तर
```

### की व्हॉल्टसह सुरक्षित कॉन्फिगरेशन

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

## वितरण वर्कफ्लो

### Foundry साठी AZD विस्तार

AZD विस्तार AI-विशिष्ट क्षमता जोडा जे Microsoft Foundry सेवांसह कामासाठी आहेत:

```bash
# Foundry एजंट्स विस्तार स्थापित करा
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग विस्तार स्थापित करा
azd extension install azure.ai.finetune

# कस्टम मॉडेल्स विस्तार स्थापित करा
azd extension install azure.ai.models

# स्थापित केलेले विस्तार यादी करा
azd extension list --installed

# सध्या स्थापित एजंट विस्तार आवृत्ती तपासा
azd extension show azure.ai.agents
```

AI विस्तार अजूनही प्रीव्ह्यू मध्ये वेगाने बदलत आहेत. जर एखादा आदेश येथे दाखविल्याप्रमाणे वागत नसेल, तर संबंधित विस्तार अद्ययावत करा आणि नंतरच प्रोजेक्टशी संबंधित समस्यांचे निराकरण करा.

### `azd ai` सह एजंट-प्रथम वितरण

जर आपल्याकडे एजंट मॅनिफेस्ट असेल, तर `azd ai agent init` वापरून Foundry Agent Service शी कनेक्ट होणारा प्रोजेक्ट तयार करा:

```bash
# एजंट मॅनिफेस्टमधून प्रारंभ करा
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure वर तैनात करा
azd up
```

अलीकडील `azure.ai.agents` प्रीव्ह्यू रिलीज ने `azd ai agent init` साठी टेम्प्लेट-आधारित इनिशियलायझेशनची समर्थन जोडली आहे. नवीन एजंट नमुन्यांचे अनुसरण करत असल्यास, आपल्या स्थापित आवृत्तीत उपलब्ध योग्य फ्लॅगसाठी विस्तार मदत तपासा.

पूर्ण आदेश संदर्भ आणि फ्लॅगसाठी पाहा [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### एकल आदेश वितरण

```bash
# एक आदेशाने सर्व तैनात करा
azd up

# किंवा क्रमिकरित्या तैनात करा
azd provision  # फक्त पायाभूत सुविधा
azd deploy     # फक्त अनुप्रयोग

# azd 1.23.11+ मध्ये दीर्घकालीन AI अनुप्रयोग तैनातीसाठी
azd deploy --timeout 1800
```

### पर्यावरण-विशिष्ट वितरण

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

### अनुप्रयोग अंतर्दृष्टी एकत्रीकरण

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

### व्यवस्थापित ओळख सेटिंग्ज

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

## कामगिरीचे ऑप्टिमायझेशन

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

### स्वयंचलित स्केलिंग कॉन्फिगरेशन

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

### समस्या 1: OpenAI क्वोटा ओलांडले

**लक्षणे:**
- वितरण क्वोटा त्रुटींसह अयशस्वी होते
- अनुप्रयोग लॉगमध्ये 429 त्रुटी

**उपाय:**
```bash
# वर्तमान कोटा वापर तपासा
az cognitiveservices usage list --location eastus

# वेगळ्या प्रदेशात प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# तात्पुरते क्षमता कमी करा
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण अयशस्वी

**लक्षणे:**
- AI सेवांना कॉल करताना 401/403 त्रुटी
- "Access denied" संदेश

**उपाय:**
```bash
# भूमिका वाटपांची पडताळणी करा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# व्यवस्थापित ओळख संरचना तपासा
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# की वॉल्ट प्रवेश प्रमाणित करा
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडेल वितरण समस्या

**लक्षणे:**
- वितरणात मॉडेल उपलब्ध नाहीत
- विशिष्ट मॉडेल आवृत्त्या अयशस्वी

**उपाय:**
```bash
# प्रदेशानुसार उपलब्ध मॉडेल्सची यादी करा
az cognitiveservices model list --location eastus

# बायसेप टेम्पलेटमध्ये मॉडेल आवृत्ती अपडेट करा
# मॉडेल क्षमतेच्या आवश्यकतांची तपासणी करा
```

## उदाहरण टेम्प्लेट्स

### RAG चॅट अनुप्रयोग (Python)

**संग्रहालय**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवा**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**वर्णन**: Azure AI चे सर्वात लोकप्रिय नमुना — उत्पादन-तयार RAG चॅट अॅप जे आपले स्वतःचे दस्तऐवज वापरून प्रश्न विचारू देते. GPT-4.1-mini चॅटसाठी वापरले जाते, text-embedding-3-large एम्बेडिंगसाठी, आणि Azure AI Search पुनर्प्राप्तीसाठी. मल्टीमोडल डॉक्युमेंट्स, स्पीच इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण आणि Application Insights ट्रेसिंग यांना समर्थन करते.

**त्वरित प्रारंभ:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG चॅट अनुप्रयोग (.NET)

**संग्रहालय**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**सेवा**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**वर्णन**: Python RAG चॅट नमुन्याचा .NET/C# समतुल्य. ASP.NET Core Minimal API आणि Blazor WebAssembly फ्रंटएंडसह तयार केलेले. व्हॉइस चॅट, GPT-4o-mini व्हिजन समर्थन आणि एक कंपॅनियन .NET MAUI Blazor Hybrid डेस्कटॉप/मोबाईल क्लायंट यांचा समावेश.

**त्वरित प्रारंभ:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG चॅट अनुप्रयोग (Java)

**संग्रहालय**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**सेवा**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**वर्णन**: Java आवृत्ती RAG चॅट नमुन्याची, AI ऑर्केस्ट्रेशनसाठी Langchain4J वापरते. मि-क्रोसर्व्हिस इवेंट-चालित आर्किटेक्चर, अनेक शोध धोरणे (टेक्स्ट, व्हेक्टर, हायब्रिड), Azure Document Intelligence द्वारे दस्तऐवज अपलोड आणि Azure Container Apps किंवा Azure Kubernetes Service वर वितरण समर्थित.

**त्वरित प्रारंभ:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Microsoft Foundry सह एंटरप्राइझ रिटेल कॉपायलट

**संग्रहालय**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवा**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**वर्णन**: Microsoft Foundry आणि Prompty वापरून संपूर्ण रिटेल RAG कॉपायलट. Contoso आउटडोअर रिटेलर चॅटबॉट जो उत्पादन कॅटलॉग आणि ग्राहक ऑर्डर डेटावर आधारित प्रतिसाद देतो. संपूर्ण GenAIOps वर्कफ्लो दाखवितो — Prompty सह प्रोटोटाइप, AI-समर्थित मूल्यांकनांसह मुल्यमापन, आणि AZD द्वारे Container Apps मध्ये वितरण.

**त्वरित प्रारंभ:**
```bash
azd init --template contoso-chat
azd up
```

### क्रिएटिव्ह लेखन मल्टी-एजंट अनुप्रयोग

**संग्रहालय**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**सेवा**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**वर्णन**: Prompty सह AI एजंट ऑर्केस्ट्रेशनचे मल्टी-एजंट नमुना. संशोधन एजंट (Azure AI Agent Service मधील Bing Grounding), उत्पादन एजंट (Azure AI Search), लेखक एजंट आणि संपादक एजंट यांचा समावेश, जे सहयोगाने चांगल्या संशोधित लेख तयार करतात. GitHub Actions मध्ये मूल्यांकनासह CI/CD समाविष्ट.

**त्वरित प्रारंभ:**
```bash
azd init --template contoso-creative-writer
azd up
```

### सर्व्हरलेस RAG चॅट (JavaScript/TypeScript)

**संग्रहालय**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**सेवा**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**वर्णन**: LangChain.js वापरून पूर्णपणे सर्व्हरलेस RAG चॅटबॉट, Azure Functions API साठी आणि Azure Static Web Apps होस्टिंगसाठी. Azure Cosmos DB दोन्ही व्हेक्टर स्टोअर आणि चॅट इतिहास डेटाबेस म्हणून वापरतो. Ollamaसह स्थानिक विकसित करण्यास समर्थन, शून्य-किंमतीच्या चाचणीसाठी.

**त्वरित प्रारंभ:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### तुमच्या डेटासह चॅट सोल्यूशन एक्सेलरेटर

**संग्रहालय**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**सेवा**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**वर्णन**: दस्तऐवज अपलोड/व्यवस्थापनासाठी प्रशासकीय पोर्टलसह एंटरप्राइझ-ग्रेड RAG सोल्यूशन एक्सेलरेटर, अनेक ऑर्केस्ट्रेटर पर्यायांसह (Semantic Kernel, LangChain, Prompt Flow), स्पीच-टू-टेक्स्ट, Microsoft Teams एकत्रीकरण, आणि PostgreSQL किंवा Cosmos DB मागील बाजूस निवडणे. उत्पादन RAG परिस्थितींसाठी सानुकूल करण्यायोग्य प्रारंभिक बिंदू म्हणून डिझाइन केलेले.

**त्वरित प्रारंभ:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI ट्रॅव्हल एजंट्स — मल्टी-एजंट MCP ऑर्केस्ट्रेशन

**संग्रहालय**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**सेवा**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**वर्णन**: तीन फ्रेमवर्कसह मल्टी-एजंट AI ऑर्केस्ट्रेशनसाठी संदर्भ अनुप्रयोग (LangChain.js, LlamaIndex.TS, आणि Microsoft Agent Framework). MCP (Model Context Protocol) सर्व्हर्स चार भाषांमध्ये सर्व्हरलेस Azure Container Apps म्हणून तैनात, OpenTelemetry निरीक्षणासह.

**त्वरित प्रारंभ:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI स्टार्टर

**संग्रहालय**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**सेवा**: Azure AI सेवांसह + Azure OpenAI

**वर्णन**: Azure AI सेवांसह संरचित मशीन लर्निंग मॉडेल्स डिप्लॉय करणारा मिनिमल Bicep टेम्प्लेट. जेव्हा तुम्हाला फक्त Azure AI इन्फ्रास्ट्रक्चर आवश्यक असेल व पूर्ण अनुप्रयोग स्टॅक नको असेल तेव्हा वापरण्यास सोपा हलका प्रारंभ बिंदू.

**त्वरित प्रारंभ:**
```bash
azd init --template azd-ai-starter
azd up
```

> **अधिक टेम्प्लेट्स पहा**: अनेक भाषा व परिस्थितींमध्ये 80+ AI-विशिष्ट AZD टेम्प्लेटसाठी [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ला भेट द्या.

## पुढील पावले

1. **उदाहरणे वापरून पहा**: आपल्या वापर प्रकरणाशी सुसंगत प्री-बिल्ट टेम्प्लेट निवडा
2. **आपल्या गरजेनुसार सानुकूलित करा**: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग कोडमध्ये बदल करा
3. **मॉनिटरिंग जोडा**: सर्वसमावेशक निरीक्षणाची अंमलबजावणी करा
4. **खर्च ऑप्टिमायझेशन करा**: आपल्या बजेटसाठी कॉन्फिगरेशन फाइन-ट्युन करा
5. **आपले वितरण सुरक्षित करा**: एंटरप्राइझ सुरक्षा नमुने अंमलात आणा
6. **उत्पादनासाठी स्केल करा**: मल्टि-रीजन आणि उच्च-उपलब्धता वैशिष्ट्ये जोडा

## 🎯 हाताळणीसाठी व्यायाम

### व्यायाम 1: Microsoft Foundry Models चॅट अॅप वितरण (30 मिनिटे)
**ध्येय**: उत्पादन-तयार AI चॅट अनुप्रयोग वितरण आणि चाचणी

```bash
# टेम्पलेट सुरू करा
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरण चल सेट करा
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# तैनात करा
azd up

# अनुप्रयोगाची चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI ऑपरेशन्सवर देखरेख करा
azd monitor

# स्वच्छ करा
azd down --force --purge
```

**यशाचे निकष:**
- [ ] वितरण क्वोटा त्रुटीशिवाय पूर्ण होणे
- [ ] ब्राउझरमध्ये चॅट इंटरफेस प्रवेशयोग्य असणे
- [ ] प्रश्न विचारता येणे व AI-शक्तीवर प्रतिसाद मिळणे
- [ ] Application Insights मध्ये टेलिमेट्री डेटा दिसणे
- [ ] संसाधने यशस्वीरित्या साफ झाली

**अनुमानित खर्च**: 30 मिनिटांच्या चाचणीसाठी $5-10

### व्यायाम 2: मल्टी-मॉडेल वितरण कॉन्फिगर करा (45 मिनिटे)
**ध्येय**: विविध कॉन्फिगरेशनसह अनेक AI मॉडेल्सचे वितरण

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

**यशाचे निकष:**
- [ ] अनेक मॉडेल्स यशस्वीरित्या वितरित
- [ ] भिन्न क्षमता सेटिंग्ज लागू
- [ ] API द्वारे मॉडेल्सना प्रवेश
- [ ] अनुप्रयोगातून दोन्ही मॉडेल्स कॉल करू शकणे

### व्यायाम 3: खर्च निरीक्षण अंमलात आणा (20 मिनिटे)
**ध्येय**: बजेट अलर्ट्स आणि खर्च ट्रॅकिंग सेटअप

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

**यशाचे निकष:**
- [ ] Azure मध्ये बजेट अलर्ट तयार झाले
- [ ] ईमेल सूचनांची कॉन्फिगरेशन झाली
- [ ] Azure पोर्टलमध्ये खर्च डेटा पाहता येतो
- [ ] बजेट थ्रेशोल्ड योग्यरित्या सेट केले

## 💡 वारंवार विचारले जाणारे प्रश्न

<details>
<summary><strong>विकासादरम्यान Microsoft Foundry Models च्या खर्चात कसा कपात करावी?</strong></summary>

1. **फ्री टीयर वापरा**: Microsoft Foundry Models 50,000 टोकन्स/माहिन्याची विनामूल्य ऑफर देते
2. **क्षमता कमी करा**: विकासासाठी 30+ ऐवजी 10 TPM सेट करा
3. **azd down वापरा**: सक्रियपणे विकास करत नसताना संसाधने मुक्त करा
4. **कॅशे प्रतिसाद वापरा**: पुनरावृत्ती होणाऱ्या क्वेरीजसाठी Redis कॅशे वापरा
5. **प्रॉम्प्ट इंजिनिअरिंग वापरा**: कार्यक्षम प्रॉम्प्ट्ससह टोकन वापर कमी करा
```bash
# विकास संरचना
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry मॉडेल्स आणि OpenAI API यांत काय फरक आहे?</strong></summary>

**Microsoft Foundry मॉडेल्स**:
- एंटरप्राइज सुरक्षा आणि अनुपालन
- खाजगी नेटवर्क एकत्रीकरण
- SLA हमी
- व्यवस्थापित ओळख प्रमाणीकरण
- अधिक कोटा उपलब्ध

**OpenAI API**:
- नवीन मॉडेल्ससाठी जलद प्रवेश
- सोपे सेटअप
- प्रवेशासाठी कमी अडथळा
- फक्त सार्वजनिक इंटरनेट

उत्पादन अ‍ॅप्ससाठी, **Microsoft Foundry मॉडेल्स शिफारस केली आहे**.
</details>

<details>
<summary><strong>Microsoft Foundry मॉडेल्स कोटा ओलांडल्याच्या त्रुटी कशा हाताळाव्यात?</strong></summary>

```bash
# सध्याचा कोटा तपासा
az cognitiveservices usage list --location eastus2

# वेगळ्या प्रदेशाचा प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# क्षमतेत तात्पुरती कपात करा
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वाढ करण्याची विनंती करा
# Azure पोर्टल > कोटा > वाढीची विनंती करा
```
</details>

<details>
<summary><strong>मी माझे स्वतःचे डेटा Microsoft Foundry मॉडेल्ससह वापरू शकतो का?</strong></summary>

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

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्प्लेट पहा.
</details>

<details>
<summary><strong>AI मॉडेल एंडपॉइंट्स कसे सुरक्षित करायचे?</strong></summary>

**सर्वोत्तम पद्धती**:
1. Managed Identity वापरा (कोणतेही API की नाहीत)
2. Private Endpoints सक्रिय करा
3. नेटवर्क सुरक्षा गट कॉन्फिगर करा
4. दर मर्यादा अंमलात आणा
5. रहस्यांसाठी Azure Key Vault वापरा

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
- **AZD GitHub**: [समस्या आणि चर्चा](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [अधिकृत दस्तऐवज](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh वरील Microsoft Foundry skill](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - आपल्या एडिटरमध्ये Azure + Foundry एजंट स्कील्स `npx skills add microsoft/github-copilot-for-azure` वापरून इंस्टॉल करा

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 2 - AI-First Development
- **⬅️ मागील अध्याय**: [अध्याय 1: आपला पहिला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ पुढील**: [AI मॉडेल वितरण](ai-model-deployment.md)
- **🚀 पुढचा अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

**मदत हवी आहे का?** आमच्या समुदाय चर्चेत सहभागी व्हा किंवा रिपॉझिटरीमध्ये समस्या उघडा. Azure AI + AZD समुदाय आपल्याला यशस्वी होण्यासाठी येथे आहे!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->