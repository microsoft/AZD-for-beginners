# Microsoft Foundry र AZD सँग एकीकरण

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ अघिल्लो अध्याय**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ अर्को**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## अवलोकन

यो मार्गदर्शिकाले Microsoft Foundry सेवाहरूलाई Azure Developer CLI (AZD) सँग कसरी एकीकृत गर्ने देखाउँछ जसले AI अनुप्रयोगहरूको परिनियोजनलाई सरल र सुव्यवस्थित बनाउँछ। Microsoft Foundry ले AI अनुप्रयोगहरू निर्माण, परिनियोजन, र व्यवस्थापन गर्नको लागि समग्र प्लेटफर्म प्रदान गर्दछ, जब कि AZD पूर्वाधार र परिनियोजन प्रक्रियालाई सजिलो बनाउँछ।

## Microsoft Foundry के हो?

Microsoft Foundry माईक्रोसफ्टको एक एकीकृत AI विकास प्लेटफर्म हो जसले समावेश गर्दछ:

- **Model Catalog**: अत्याधुनिक AI मोडेलहरूमा पहुँच
- **Prompt Flow**: AI वर्कफ्लोहरूको लागि दृश्य डिजाइनर
- **Microsoft Foundry Portal**: AI अनुप्रयोगहरूको लागि एकीकृत विकास वातावरण
- **Deployment Options**: होस्टिङ र स्केलिङका बहु विकल्पहरू
- **Safety and Security**: निर्मित जिम्मेवार AI सुविधाहरू

## AZD + Microsoft Foundry: सँगै राम्रो

| विशेषता | Microsoft Foundry | AZD एकीकरण लाभ |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | स्वचालित, पुनरावृत्त गर्न मिल्ने परिनियोजनहरू |
| **Infrastructure** | Click-through provisioning | कोडको रूपमा पूर्वाधार (Bicep) |
| **Environment Management** | Single environment focus | बहु-वातावरण (dev/staging/prod) |
| **CI/CD Integration** | Limited | मूल GitHub Actions समर्थन |
| **Cost Management** | Basic monitoring | वातावरण-विशेष लागत अनुकूलन |

## पूर्वआवश्यकताहरू

- Azure सदस्यता र उपयुक्त अनुमति
- Azure Developer CLI स्थापना गरिएको
- Microsoft Foundry Models सेवाहरूमा पहुँच
- Microsoft Foundry सम्बन्धी आधारभूत परिचित

## मुख्य एकीकरण ढाँचा

### ढाँचा 1: Microsoft Foundry Models एकीकरण

**प्रयोग केस**: Microsoft Foundry Models मोडेलहरूसँग च्याट अनुप्रयोगहरू परिनियोजन गर्नुहोस्

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

### ढाँचा 2: AI Search + RAG एकीकरण

**प्रयोग केस**: retrieval-augmented generation (RAG) अनुप्रयोगहरू परिनियोजन गर्नुहोस्

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

### ढाँचा 3: Document Intelligence एकीकरण

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
# मुख्य एआई सेवाहरू
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मोडेल विन्यासहरू
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# प्रदर्शन सेटिङहरू
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**विकास कन्फिगरेसन:**
```bash
# विकासका लागि लागत-अनुकूल सेटिङहरू
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # निःशुल्क तह
```

### Key Vault मार्फत सुरक्षित कन्फिगरेसन

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

## परिनियोजन कार्यप्रवाहहरू

### Foundry का लागि AZD एक्सटेन्सनहरू

AZD ले Foundry सेवाहरूसँग काम गर्न AI-विशेष क्षमताहरू थप्ने एक्सटेन्सनहरू प्रदान गर्दछ:

```bash
# Foundry agents एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.agents

# फाइन-ट्यूनिङ एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.finetune

# अनुकूलित मोडेलहरू एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.models

# स्थापित एक्सटेन्सनहरू सूचीबद्ध गर्नुहोस्
azd extension list
```

### `azd ai` सँग एजेन्ट-प्रथम परिनियोजन

यदि तपाईंसँग एजेन्ट म्यानिफेस्ट छ भने, Foundry Agent Service सँग जोडिएको प्रोजेक्ट स्कफल्ड गर्न `azd ai agent init` प्रयोग गर्नुहोस्:

```bash
# एजेन्ट म्यानिफेस्टबाट आरम्भ गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure मा तैनाथ गर्नुहोस्
azd up
```

पूर्ण आदेश सन्दर्भ र झण्डाहरूका लागि हेर्नुहोस् [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)।

### एकल आदेश परिनियोजन

```bash
# एकै आदेशमा सबै तैनाथ गर्नुहोस्
azd up

# वा क्रमिक रूपमा तैनाथ गर्नुहोस्
azd provision  # पूर्वाधार मात्र
azd deploy     # अनुप्रयोग मात्र
```

### वातावरण-विशेष परिनियोजनहरू

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

## अनुगमन र अवलोकन

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

## 🔐 सुरक्षा उत्तम अभ्यासहरू

### Managed Identity कन्फिगरेसन

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

### क्याचिङ रणनीतिहरू

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

### अटो-स्केलिङ कन्फिगरेसन

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

## सामान्य समस्याहरू समाधान

### समस्या 1: OpenAI को कोटा अधिक

**लक्षणहरू:**
- कोटा त्रुटिहरूका साथ परिनियोजन असफल हुन्छ
- एप्लिकेसन लगहरूमा 429 त्रुटिहरू

**समाधानहरू:**
```bash
# हालको कोटा प्रयोग जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus

# अर्को क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up

# क्षमता अस्थायी रूपमा घटाउनुहोस्
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणिकरण असफलता

**लक्षणहरू:**
- AI सेवाहरू कल गर्दा 401/403 त्रुटिहरू
- "Access denied" सन्देशहरू

**समाधानहरू:**
```bash
# भूमिका नियुक्तिहरू जाँच गर्नुहोस्
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# प्रबन्धित पहिचान कन्फिगरेसन जाँच गर्नुहोस्
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault पहुँच मान्य गर्नुहोस्
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मोडेल परिनियोजन समस्या

**लक्षणहरू:**
- परिनियोजनमा मोडेलहरू उपलब्ध छैनन्
- विशिष्ट मोडेल संस्करणहरू असफल छन्

**समाधानहरू:**
```bash
# क्षेत्रअनुसार उपलब्ध मोडेलहरू सूचीबद्ध गर्नुहोस्
az cognitiveservices model list --location eastus

# bicep टेम्पलेटमा मोडेल संस्करण अद्यावधिक गर्नुहोस्
# मोडेलको क्षमता आवश्यकताहरू जाँच गर्नुहोस्
```

## उदाहरण टेम्प्लेटहरू

### RAG च्याट अनुप्रयोग (Python)

**रिपोजिटरी**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**विवरण**: सबैभन्दा लोकप्रिय Azure AI नमूना — उत्पादन-तयार RAG च्याट एप जसले तपाईंका आफ्नै दस्तावेजहरूमा प्रश्नहरू सोध्न दिन्छ। GPT-4.1-mini लाई च्याटका लागि, text-embedding-ada-002 लाई एम्बेडिङ्सका लागि, र Azure AI Search लाई रिट्राइवलका लागि प्रयोग गर्छ। मल्टि-मोडल दस्तावेजहरू, स्पीच इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण, र Application Insights ट्रेसिङ समर्थन गर्दछ।

**छिटो सुरुवात**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG च्याट अनुप्रयोग (.NET)

**रिपोजिटरी**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**विवरण**: Python RAG च्याट नमूनाको .NET/C# समकक्ष। ASP.NET Core Minimal API र Blazor WebAssembly फ्रन्टएन्डसँग बनाइएको। भ्वाइस च्याट, GPT-4o-mini भिजन समर्थन, र सहयोगी .NET MAUI Blazor Hybrid डेस्कटप/मोबाइल क्लाइन्ट समावेश छ।

**छिटो सुरुवात**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG च्याट अनुप्रयोग (Java)

**रिपोजिटरी**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**विवरण**: Langchain4J प्रयोग गरेर AI सङ्गठनका लागि Java संस्करण। माइक्रोसर्भिस इभेन्ट-ड्रिभेन आर्किटेक्चर, बहु खोज रणनीतिहरू (टेक्स्ट, भेक्टर, हाइब्रिड), Azure Document Intelligence सँग दस्तावेज अपलोड समर्थन, र Azure Container Apps वा Azure Kubernetes Service मा परिनियोजन समर्थन गर्दछ।

**छिटो सुरुवात**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**रिपोजिटरी**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाहरू**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**विवरण**: Azure AI Foundry र Prompty प्रयोग गरेर पूर्ण-सम्पूर्ण रिटेल RAG copilot। Contoso Outdoor रिटेलर च्याटबट जसले उत्तरहरू उत्पादन क्याटलग र ग्राहक अर्डर डाटामा आधार बनाउँछ। GenAIOps वर्कफ्लो देखाउँछ — Prompty सँग प्रोटोटाइप, AI-सहायता प्राप्त इवालुएटर्स सँग मूल्याङ्कन, र AZD मार्फत Container Apps मा परिनियोजन।

**छिटो सुरुवात**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**रिपोजिटरी**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**सेवाहरू**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**विवरण**: Prompty सहित AI एजेन्ट ऑर्केस्ट्रेसन देखाउने मल्टि-एजेन्ट नमूना। अनुसन्धान एजेन्ट (Bing Grounding in Azure AI Agent Service), प्रोडक्ट एजेन्ट (Azure AI Search), लेखक एजेन्ट, र सम्पादक एजेन्ट मिलेर राम्रोसँग अनुसन्धान गरिएका लेखहरू उत्पादन गर्छन्। GitHub Actions मा इवलुएसन सहित CI/CD समावेश छ।

**छिटो सुरुवात**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**रिपोजिटरी**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**सेवाहरू**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**विवरण**: LangChain.js प्रयोग गरेर पूर्ण रूपमा सर्वरलेस RAG च्याटबट, API का लागि Azure Functions र होस्टिङका लागि Azure Static Web Apps। Azure Cosmos DB लाई भेक्टर स्टोर र च्याट इतिहास डाटाबेस दुवैको रूपमा प्रयोग गर्छ। शून्य-लागत परीक्षणको लागि स्थानीय विकासमा Ollama समर्थन गर्दछ।

**छिटो सुरुवात**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**रिपोजिटरी**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**विवरण**: प्रशासन पोर्टल सहित एन्त्रप्राइज-ग्रेड RAG समाधान एक्सेलेरेटर जसमा दस्तावेज अपलोड/प्रबन्धन, बहु ऑर्केस्ट्रेटर विकल्पहरू (Semantic Kernel, LangChain, Prompt Flow), स्पीच-टु-टेक्स्ट, Microsoft Teams एकीकरण, र PostgreSQL वा Cosmos DB ब्याकएन्ड छनोट समावेश छ। उत्पादन RAG परिदृश्यहरूको लागि अनुकूलनयोग्य सुरुआत बिन्दुको रूपमा डिजाइन गरिएको।

**छिटो सुरुवात**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**रिपोजिटरी**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**सेवाहरू**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**विवरण**: तीन फ्रेमवर्कहरू (LangChain.js, LlamaIndex.TS, र Microsoft Agent Framework) प्रयोग गरेर मल्टि-एजेन्ट AI ऑर्केस्ट्रेसनको लागि संदर्भ अनुप्रयोग। चार भाषाहरूमा MCP (Model Context Protocol) सर्भरहरू सर्भरलेस Azure Container Apps मा परिनियोजन गरिएका छन् र OpenTelemetry अनुगमन समावेश छ।

**छिटो सुरुवात**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**रिपोजिटरी**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**सेवाहरू**: Azure AI Services + Azure OpenAI

**विवरण**: Azure AI सेवाहरू र कन्फिगर गरिएको मेसिन लर्निङ मोडेलहरूसँग सानो Bicep टेम्पलेट। विस्तृत अनुप्रयोग स्ट्याक बिना मात्र Azure AI पूर्वाधार चाहिने अवस्थामा हल्का सुरुवात बिन्दु।

**छिटो सुरुवात**:
```bash
azd init --template azd-ai-starter
azd up
```

> **अझ टेम्प्लेटहरू ब्राउज गर्नुहोस्**: Visit the [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) for 80+ AI-specific AZD templates across languages and scenarios.

## अर्को कदमहरू

1. **उदाहरणहरू प्रयास गर्नुहोस्**: आफ्नो उपयोग केससँग मेल खाने पूर्व-निर्मित टेम्पलेटबाट सुरु गर्नुहोस्
2. **आफ्नो आवश्यकतालाई अनुकूलित गर्नुहोस्**: पूर्वाधार र अनुप्रयोग कोड परिमार्जन गर्नुहोस्
3. **अनुगमन थप्नुहोस्**: व्यापक अवलोकन कार्यान्वयन गर्नुहोस्
4. **लागत अनुकूलन गर्नुहोस्**: आफ्नो बजेटका लागि कन्फिगरेसनहरू परिष्कृत गर्नुहोस्
5. **तपाईंको परिनियोजनलाई सुरक्षित गर्नुहोस्**: एन्त्रप्राइज सुरक्षा ढाँचाहरू लागू गर्नुहोस्
6. **उत्पादनमा स्केल गर्नुहोस्**: बहु-क्षेत्र र उच्च उपलब्धता सुविधाहरू थप्नुहोस्

## 🎯 व्यावहारिक अभ्यासहरू

### अभ्यास 1: Microsoft Foundry Models च्याट एप परिनियोजन गर्नुहोस् (30 मिनेट)
**लक्ष्य**: उत्पादन-तयार AI च्याट अनुप्रयोग परिनियोजन र परीक्षण गर्नु

```bash
# टेम्पलेट आरम्भ गर्नुहोस्
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# वातावरणीय चरहरू सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# तैनाथ गर्नुहोस्
azd up

# अनुप्रयोग परीक्षण गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# एआई सञ्चालनहरू अनुगमन गर्नुहोस्
azd monitor

# सफा गर्नुहोस्
azd down --force --purge
```

**सफलताको मापदण्डहरू:**
- [ ] परिनियोजन कोटा त्रुटि बिना पूरा हुन्छ
- [ ] ब्राउजरमा च्याट इन्टरफेस पहुँच गर्न सकिन्छ
- [ ] प्रश्न सोधेर AI-समर्थित उत्तरहरू प्राप्त गर्न सकिन्छ
- [ ] Application Insights ले टेलिमेट्री डाटा देखाउँछ
- [ ] स्रोतहरू सफलतापूर्वक सफा गरिएको छ

**अनुमानित लागत**: $5-10 30 मिनेटको परीक्षणका लागि

### अभ्यास 2: बहु-मोडेल परिनियोजन कन्फिगर गर्नुहोस् (45 मिनेट)
**लक्ष्य**: फरक कन्फिगरेसनहरूसँग बहु AI मोडेलहरू परिनियोजन गर्नु

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

# परिनियोजन गर्नुहोस् र प्रमाणित गर्नुहोस्
azd provision
azd show
```

**सफलताको मापदण्डहरू:**
- [ ] बहु मोडेलहरू सफलतापूर्वक परिनियोजन भएका छन्
- [ ] फरक क्षमता सेटिङहरू लागू भएका छन्
- [ ] मोडेलहरू API मार्फत पहुँचयोग्य छन्
- [ ] एप्लिकेसनबाट दुबै मोडेलहरू कल गर्न सकिन्छ

### अभ्यास 3: लागत अनुगमन कार्यान्वयन गर्नुहोस् (20 मिनेट)
**लक्ष्य**: बजेट अलर्ट र लागत ट्र्याकिङ सेटअप गर्नु

```bash
# Bicep मा बजेट अलर्ट थप्नुहोस्
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

# बजेट अलर्ट तैनात गर्नुहोस्
azd provision

# हालको लागत जाँच गर्नुहोस्
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**सफलताको मापदण्डहरू:**
- [ ] Azure मा बजेट अलर्ट सिर्जना गरिएको छ
- [ ] इमेल सूचनाहरू कन्फिगर गरिएका छन्
- [ ] Azure पोर्टलमा लागत डाटा हेर्न सकिन्छ
- [ ] बजेट थ्रेसहोल्डहरू उपयुक्त रूपमा सेट गरिएको छ

## 💡 बारम्बार सोधिने प्रश्नहरू

<details>
<summary><strong>विकास दौरान Microsoft Foundry Models को लागत कसरी घटाउने?</strong></summary>

1. **Free Tier प्रयोग गर्नुहोस्**: Microsoft Foundry Models ले प्रति महिना 50,000 टोकन निःशुल्क प्रदान गर्छ
2. **क्षमता घटाउनुहोस्**: विकासका लागि क्षमता 30+ को सट्टा 10 TPM सेट गर्नुहोस्
3. **azd down प्रयोग गर्नुहोस्**: सक्रिय रूपमा विकास नगर्दा स्रोतहरू डिअलोकेट गर्नुहोस्
4. **प्रतिक्रिया क्यास गर्नुहोस्**: दोहोरिंदै सोधिने प्रश्नहरूको लागि Redis क्यास लागू गर्नुहोस्
5. **Prompt Engineering प्रयोग गर्नुहोस्**: प्रभावकारी प्रम्प्टहरू प्रयोग गरेर टोकन उपयोग घटाउनुहोस्

```bash
# विकास कन्फिगरेसन
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry Models र OpenAI API बीच के फरक छ?</strong></summary>

**Microsoft Foundry Models**:
- उद्यम स्तरको सुरक्षा र अनुपालन
- निजी नेटवर्क एकीकरण
- SLA ग्यारेन्टीहरू
- Managed identity प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नयाँ मोडेलहरूमा छिटो पहुँच
- सरल सेटअप
- प्रवेशिका कम बाधा
- सार्वजनिक इन्टरनेटमात्र

उत्पादन अनुप्रयोगहरूको लागि, **Microsoft Foundry Models सिफारिस गरिन्छ**।
</details>

<details>
<summary><strong>Microsoft Foundry मोडेलहरूको कोटा पार गरियो भन्ने त्रुटिहरूलाई म कसरी सम्हाल्ने?</strong></summary>

```bash
# हालको कोटा जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus2

# अर्को क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूपमा क्षमता घटाउनुहोस्
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वृद्धि अनुरोध गर्नुहोस्
# Azure पोर्टल > कोटा > वृद्धि अनुरोधमा जानुहोस्
```
</details>

<details>
<summary><strong>के म आफ्नै डेटा Microsoft Foundry मोडेलहरूसँग प्रयोग गर्न सक्छु?</strong></summary>

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

See the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>म AI मोडेल एन्डप्वाइन्टहरू कसरी सुरक्षित बनाउने?</strong></summary>

**सर्वोत्तम अभ्यासहरू**:
1. Managed Identity प्रयोग गर्नुहोस् (API कुञ्जीहरू प्रयोग नगर्नुहोस्)
2. निजी एन्डप्वाइन्टहरू सक्षम गर्नुहोस्
3. नेटवर्क सुरक्षा समूहहरू कन्फिगर गर्नुहोस्
4. रेट लिमिटिङ लागू गर्नुहोस्
5. गोप्य जानकारीको लागि Azure Key Vault प्रयोग गर्नुहोस्

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

- **Microsoft Foundry Discord**: [#Azure चैनल](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [इश्यूहरू र छलफलहरू](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [आधिकारिक दस्तावेज](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh मा Microsoft Foundry स्किल](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - तपाईंको सम्पादकमा Azure + Foundry एजेन्ट स्किलहरू इन्स्टल गर्न `npx skills add microsoft/github-copilot-for-azure`

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - एआई-प्रथम विकास
- **⬅️ अघिल्लो अध्याय**: [अध्याय 1: तपाइँको पहिलो परियोजना](../chapter-01-foundation/first-project.md)
- **➡️ अर्को**: [एआई मोडेल परिनियोजन](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

**सहयोग चाहिन्छ?** हाम्रो समुदायका छलफलहरूमा सहभागी हुनुहोस् वा रिपोजिटरीमा इश्यू खोल्नुहोस्। Azure AI + AZD समुदाय तपाईंलाई सफल हुन मद्दत गर्न यहाँ छ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी यथासम्भव शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल दस्तावेजलाई त्यसको मूल भाषामा रहेको संस्करणलाई अधिकारिक स्रोतका रूपमा मान्नुहोस्। महत्वपूर्ण जानकारीका लागि पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->