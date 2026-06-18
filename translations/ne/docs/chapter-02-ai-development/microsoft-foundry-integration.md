# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD शुरुवातकर्ताका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## अवलोकन

यो मार्गदर्शनले Microsoft Foundry सेवाहरूलाई Azure Developer CLI (AZD) सँग कसरी एकीकृत गर्ने भनेर देखाउँछ जसले AI अनुप्रयोग डिप्लोइमेन्टलाई सहज बनाउँछ। Microsoft Foundry AI अनुप्रयोगहरू निर्माण, डिप्लोय, र व्यवस्थापनको लागि एक विस्तृत प्लेटफर्म प्रदान गर्छ, जबकि AZD पूर्वाधार र डिप्लोयमेन्ट प्रक्रियालाई सरल पार्छ।

## Microsoft Foundry भनेको के हो?

Microsoft Foundry Microsoft को एक एकीकृत AI विकास प्लेटफर्म हो जसले समावेश गर्छ:

- **Model Catalog**: अत्याधुनिक AI मोडेलहरूमा पहुँच
- **Prompt Flow**: AI कार्यप्रवाहहरूको लागि भिजुअल डिजाइनर
- **Microsoft Foundry Portal**: AI अनुप्रयोगहरूको लागि एकीकृत विकास वातावरण
- **Deployment Options**: बहु होस्टिङ र स्केलिङ विकल्पहरू
- **Safety and Security**: निर्मित जिम्मेवार AI सुविधाहरू

## AZD + Microsoft Foundry: सँगै राम्रो

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | स्वचालित, पुनरावृत्त डिप्लोयमेन्टहरू |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | बहु-पर्यावरण (dev/staging/prod) |
| **CI/CD Integration** | Limited | नेभिगेटेड GitHub Actions समर्थन |
| **Cost Management** | Basic monitoring | वातावरण-विशिष्ट लागत अनुकूलन |

## पूर्वआवश्यकता

- उपयुक्त अनुमति भएका Azure सदस्यता
- Azure Developer CLI इन्स्टल गरिएको
- Microsoft Foundry Models सेवाहरूको पहुँच
- Microsoft Foundry सँग सामान्य परिचितता

> **Current AZD baseline:** यी उदाहरणहरू `azd` `1.23.12` विरुद्ध जाँचिएका थिए। AI एजेन्ट कार्यप्रवाहका लागि, हालको प्रिभ्यु एक्स्टेन्सन रिलीज प्रयोग गर्नुहोस् र सुरु गर्नु अघि आफ्नो इन्स्टल गरिएको संस्करण जाँच गर्नुहोस्।

## मुख्य एकीकरण ढाँचाहरू

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: Microsoft Foundry Models मोडेलहरू प्रयोग गरी च्याट अनुप्रयोगहरू डिप्लोय गर्नुहोस्

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

### Pattern 2: AI Search + RAG Integration

**Use Case**: retrieval-augmented generation (RAG) अनुप्रयोगहरू डिप्लोय गर्नुहोस्

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

### Pattern 3: Document Intelligence Integration

**Use Case**: दस्तावेज प्रसोधन र विश्लेषण कार्यप्रवाहहरू

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

### Environment Variables Setup

**Production Configuration:**
```bash
# मुख्य एआई सेवाहरू
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

**Development Configuration:**
```bash
# विकासका लागि लागत-अनुकूल सेटिङहरू
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # निशुल्क तह
```

### Secure Configuration with Key Vault

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

## डिप्लोयमेन्ट कार्यप्रवाहहरू

### AZD Extensions for Foundry

AZD ले त्यस्ता एक्स्टेन्सनहरू प्रदान गर्छ जुन Microsoft Foundry सेवाहरू सँग काम गर्न AI-विशिष्ट क्षमता थप्छ:

```bash
# Foundry agents एक्सटेन्शन इन्स्टल गर्नुहोस्
azd extension install azure.ai.agents

# फाइन-ट्यूनिङ एक्सटेन्शन इन्स्टल गर्नुहोस्
azd extension install azure.ai.finetune

# कस्टम मोडेल एक्सटेन्शन इन्स्टल गर्नुहोस्
azd extension install azure.ai.models

# इन्स्टल गरिएका एक्सटेन्शनहरू सूचीबद्ध गर्नुहोस्
azd extension list --installed

# हाल इन्स्टल गरिएको एजेन्ट एक्सटेन्शनको संस्करण जाँच्नुहोस्
azd extension show azure.ai.agents
```

AI एक्स्टेन्सनहरू अझै प्रिभ्युमा तीब्र रूपमा परिवर्तन हुँदैछन्। यदि कुनै कमाण्ड यहाँ देखिएको जस्तो व्यवहार नगरेको खण्डमा, प्रोजेक्ट आफैँ समस्या समाधान गर्नु अघि सम्बन्धित एक्स्टेन्सनलाई अपग्रेड गर्नुहोस्।

### Agent-First Deployment with `azd ai`

यदि तपाईंसँग एजेन्ट म्यानिफेस्ट छ भने, Foundry Agent Service सँग जडित प्रोजेक्ट स्केफोल्ड गर्न `azd ai agent init` प्रयोग गर्नुहोस्:

```bash
# एजेन्ट म्यानिफेस्टबाट आरम्भ गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure मा परिनियोजन गर्नुहोस्
azd up
```

`azure.ai.agents` का भर्खरका प्रिभ्यु रिलीजहरूले `azd ai agent init` का लागि टेम्प्लेट-आधारित आरम्भ समर्थन पनि थपेका छन्। यदि तपाईँ नयाँ एजेन्ट उदाहरणहरू अनुसरण गर्दै हुनुहुन्छ भने, आफ्नो इन्स्टल गरिएको संस्करणमा उपलब्ध सही फ्ल्यागहरूको लागि एक्स्टेन्सन हेल्प जाँच गर्नुहोस्।

पुरा कमाण्ड रेफरेन्स र फ्ल्यागहरूको लागि हेर्नुहोस् [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)।

### Single Command Deployment

```bash
# एकै कमाण्डले सबै तैनाथ गर्नुहोस्
azd up

# वा क्रमिक रूपमा तैनाथ गर्नुहोस्
azd provision  # केवल पूर्वाधार
azd deploy     # केवल अनुप्रयोग

# azd 1.23.11+ मा दीर्घकालिक रूपमा चल्ने AI अनुप्रयोग तैनाथीकरणका लागि
azd deploy --timeout 1800
```

### Environment-Specific Deployments

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

### Application Insights Integration

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

## 🔐 सुरक्षा सर्वोत्तम अभ्यासहरू

### Managed Identity Configuration

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

### क्याशिन रणनीतिहरू

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

### Auto-scaling Configuration

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

### Issue 1: OpenAI Quota Exceeded

**लक्षणहरू:**
- डिप्लोयमेन्ट क्वोटा त्रुटिहरूका साथ असफल हुन्छ
- एप्लिकेसन लगहरूमा 429 त्रुटिहरू

**समाधानहरू:**
```bash
# हालको कोटा प्रयोग जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus

# विभिन्न क्षेत्रमा प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूपमा क्षमता घटाउनुहोस्
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**लक्षणहरू:**
- AI सेवाहरू कल गर्दा 401/403 त्रुटिहरू
- "Access denied" सन्देशहरू

**समाधानहरू:**
```bash
# भूमिका आवंटनहरू सत्यापित गर्नुहोस्
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# प्रबन्धित पहिचानको कन्फिगरेसन जाँच गर्नुहोस्
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault को पहुँच सत्यापित गर्नुहोस्
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**लक्षणहरू:**
- मोडेलहरू डिप्लोयमा उपलब्ध छैनन्
- विशिष्ट मोडेल संस्करणहरू असफल हुँदैछन्

**समाधानहरू:**
```bash
# क्षेत्रअनुसार उपलब्ध मोडेलहरूको सूची
az cognitiveservices model list --location eastus

# bicep टेम्प्लेटमा मोडेल संस्करण अद्यावधिक गर्नुहोस्
# मोडेलको क्षमता आवश्यकताहरू जाँच गर्नुहोस्
```

## उदाहरण टेम्प्लेटहरू

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**विवरण**: सबैभन्दा लोकप्रिय Azure AI नमूना — एक production-तयार RAG च्याट अनुप्रयोग जसले तपाईंलाई आफ्नै कागजातहरूमा प्रश्न सोध्न अनुमति दिन्छ। च्याटका लागि GPT-4.1-mini, एम्बेडिङ्सका लागि text-embedding-3-large, र पुनःप्राप्तिका लागि Azure AI Search प्रयोग गर्छ। मल्टिमोडल दस्तावेजहरू, आवाज इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण, र Application Insights ट्रेसिङ समर्थन गर्दछ।

**छिटो सुरु:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**विवरण**: Python RAG च्याट नमुनाको .NET/C# समकक्ष। ASP.NET Core Minimal API र Blazor WebAssembly फ्रन्टएन्डसँग निर्माण गरिएको। भ्वाइस च्याट, GPT-4o-mini vision समर्थन, र एक सहायक .NET MAUI Blazor Hybrid डेस्कटप/मोबाइल क्लाइन्ट समावेश गर्दछ।

**छिटो सुरु:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**विवरण**: Langchain4J प्रयोग गरी AI ओरकेस्ट्रेशन भएको RAG च्याट नमुनाको Java संस्करण। माइक्रोसर्भिस इभेन्ट-ड्राइभेन आर्किटेक्चर, बहु सर्च रणनीतिहरू (पाठ, भेक्टर, हाइब्रिड), Azure Document Intelligence सँग दस्तावेज अपलोड, र Azure Container Apps वा Azure Kubernetes Service मा डिप्लोय गर्ने विकल्पहरू समर्थन गर्दछ।

**छिटो सुरु:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**विवरण**: Microsoft Foundry र Prompty प्रयोग गर्ने अन्त्यदेखि-अन्तसम्मको खुद्रा RAG कोपाइलट। Contoso Outdoor खुद्रा च्याटबोट जसले जवाफहरूलाई उत्पाद क्याटलग र ग्राहक अर्डर डाटामा आधारभूत बनाउँछ। पूर्ण GenAIOps कार्यप्रवाह प्रदर्शन गर्दछ — Prompty सँग प्रोटोटाइप, AI-सहायक मूल्याङ्कनकर्ताहरू सँग मूल्याङ्कन, र AZD मार्फत Container Apps मा डिप्लोय।

**छिटो सुरु:**
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**विवरण**: Prompty सँग AI एजेन्ट ओरकेस्ट्रेशन देखाउने बहु-एजेन्ट नमूना। अनुसन्धान एजेन्ट (Bing Grounding in Azure AI Agent Service), उत्पादन एजेन्ट (Azure AI Search), लेखक एजेन्ट, र सम्पादक एजेन्ट प्रयोग गरेर राम्रो अनुसन्धान गरिएको लेखहरू सँगै उत्पादन गर्छ। GitHub Actions मा मूल्याङ्कन सहित CI/CD समावेश छ।

**छिटो सुरु:**
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**विवरण**: LangChain.js प्रयोग गरी पूर्ण रूपमा serverless RAG च्याटबोट जसले API का लागि Azure Functions र होस्टिङका लागि Azure Static Web Apps प्रयोग गर्छ। Azure Cosmos DB लाई भेक्टर स्टोर र च्याट हिस्ट्री डाटाबेस दुवैको रूपमा प्रयोग गरिन्छ। शून्य-लागत परीक्षणका लागि स्थानीय विकासमा Ollama समर्थन गर्दछ।

**छिटो सुरु:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**विवरण**: एंटरप्राइज-ग्रेड RAG समाधान एक्सेलेरेटर जसमा दस्तावेज अपलोड/व्यवस्थापनको लागि प्रशासक पोर्टल, विभिन्न ओरकेस्ट्रेटर विकल्पहरू (Semantic Kernel, LangChain, Prompt Flow), स्पीच-टु-टेक्स्ट, Microsoft Teams एकीकरण, र PostgreSQL वा Cosmos DB ब्याकएन्डको विकल्प छ। उत्पादन RAG परिदृश्यहरूको लागि अनुकूलनयोग्य सुरूवात बिन्दुको रूपमा डिजाइन गरिएको।

**छिटो सुरु:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**विवरण**: तीन फ्रेमवर्कहरू (LangChain.js, LlamaIndex.TS, र Microsoft Agent Framework) प्रयोग गरी बहु-एजेन्ट AI ओरकेस्ट्रेशनको लागि रिफरेन्स अनुप्रयोग। चार भाषाहरूमा MCP (Model Context Protocol) सर्भरहरू सर्भरलेस Azure Container Apps मा डिप्लोय गरिएका छन् र OpenTelemetry अनुगमन सुविधा समावेश छ।

**छिटो सुरु:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**विवरण**: Azure AI सेवाहरू कन्फिगर गरिएको मेशिन लर्निङ मोडेलहरूसँग डिप्लोय गर्ने न्यूनतम Bicep टेम्प्लेट। जब तपाईँलाई मात्र Azure AI पूर्वाधार चाहिन्छ र पूर्ण अनुप्रयोग स्ट्याक आवश्यक छैन भने हल्का आरम्भिक बिन्दु।

**छिटो सुरु:**
```bash
azd init --template azd-ai-starter
azd up
```

> **अझ टेम्प्लेट ब्राउज गर्नुहोस्**: 80+ AI-विशिष्ट AZD टेम्प्लेटहरूको लागि [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) भ्रमण गर्नुहोस्।

## अर्को कदमहरू

1. **उदाहरणहरू कोशिश गर्नुहोस्**: आफ्नो प्रयोग केससँग मेल खाने पूर्व-निर्मित टेम्पलेटबाट सुरु गर्नुहोस्
2. **आफ्नो आवश्यकताहरूको लागि अनुकूलन गर्नुहोस्**: पूर्वाधार र अनुप्रयोग कोड परिमार्जन गर्नुहोस्
3. **अनुगमन थप्नुहोस्**: व्यापक अवलोकनक्षमता लागू गर्नुहोस्
4. **लागत अनुकूलन गर्नुहोस्**: आफ्नो बजेटका लागि कन्फिगरेसनहरू परिमार्जन गर्नुहोस्
5. **तपाईंको डिप्लोयमेन्ट सुरक्षित गर्नुहोस्**: एंटरप्राइज सुरक्षा ढाँचाहरू लागू गर्नुहोस्
6. **उत्पादनसम्म स्केल गर्नुहोस्**: बहु-क्षेत्र र उच्च-उपलब्धता सुविधाहरू थप्नुहोस्

## 🎯 व्यवहारिक अभ्यासहरू

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: उत्पादन-तयार AI च्याट अनुप्रयोग डिप्लोय र परीक्षण गर्नुहोस्

```bash
# टेम्प्लेट आरम्भ गर्नुहोस्
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# वातावरण चरहरू सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# परिनियोजन गर्नुहोस्
azd up

# अनुप्रयोग परीक्षण गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# एआई सञ्चालनहरू अनुगमन गर्नुहोस्
azd monitor

# सफाइ गर्नुहोस्
azd down --force --purge
```

**Success Criteria:**
- [ ] डिप्लोयमेन्ट क्वोटा त्रुटि बिना पूरा हुन्छ
- [ ] ब्राउजरमा च्याट इन्टरफेस पहुँच गर्न सकिन्छ
- [ ] प्रश्न सोध्न र AI-समर्थित प्रतिक्रियाहरू प्राप्त गर्न सकिन्छ
- [ ] Application Insights मा टेलिमेट्री डाटा देखिन्छ
- [ ] स्रोतहरू सफलतापूर्वक सफा/हटाइयो

**अनुमानित लागत**: 30 मिनेटको परीक्षणका लागि $5-10

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: विभिन्न कन्फिगरेसनहरूसँग बहु AI मोडेलहरू डिप्लोय गर्नुहोस्

```bash
# कस्टम Bicep कन्फिगरेसन सिर्जना गर्नुहोस्
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

# तैनाथ गर्नुहोस् र जाँच गर्नुहोस्
azd provision
azd show
```

**Success Criteria:**
- [ ] बहु मोडेलहरू सफलतापूर्वक डिप्लोय भएका छन्
- [ ] फरक क्षमता सेटिङहरू लागू भएका छन्
- [ ] मोडेलहरू API मार्फत पहुँचयोग्य छन्
- [ ] अनुप्रयोगबाट दुबै मोडेलहरू कल गर्न सकिन्छ

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: बजेट अलर्ट र लागत ट्र्याकिङ सेटअप गर्नुहोस्

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

# बजेट अलर्ट परिनियोजन गर्नुहोस्
azd provision

# वर्तमान लागतहरू जाँच्नुहोस्
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] Azure मा बजेट अलर्ट सिर्जना भयो
- [ ] ईमेल सूचना कन्फिगर गरियो
- [ ] Azure Portal मा लागत डाटा हेर्न सकिन्छ
- [ ] बजेट थ्रेसहोल्डहरू उपयुक्त रूपमा सेट गरिएको छ

## 💡 बारम्बार सोधिने प्रश्नहरू

<details>
<summary><strong>विकासको समयमा Microsoft Foundry Models को लागत कसरी घटाउने?</strong></summary>

1. **Free Tier प्रयोग गर्नुहोस्**: Microsoft Foundry Models ले 50,000 tokens/महिना निःशुल्क दिन्छ
2. **क्षमता घटाउनुहोस्**: dev को लागि 30+ को सट्टा क्षमता 10 TPM मा सेट गर्नुहोस्
3. **azd down प्रयोग गर्नुहोस्**: सक्रिय रुपमा विकास नगर्दा स्रोतहरू deallocate गर्नुहोस्
4. **प्रतिक्रियाहरू क्यास गर्नुहोस्**: पुनरावर्ती क्वेरीहरूका लागि Redis क्यास लागू गर्नुहोस्
5. **Prompt Engineering प्रयोग गर्नुहोस्**: प्रभावकारी प्रम्प्टहरूसँग टोकन उपयोग घटाउनुहोस्


```bash
# विकास विन्यास
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry मोडेलहरू र OpenAI API बीच के फरक छ?</strong></summary>

**Microsoft Foundry Models**:
- उद्यम स्तरको सुरक्षा र अनुपालन
- निजी नेटवर्क एकीकरण
- SLA ग्यारेन्टी
- Managed Identity प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नयाँ मोडेलहरूमा छिटो पहुँच
- सरल सेटअप
- प्रवेशको बाधा कम
- केवल सार्वजनिक इन्टरनेट

उत्पादन अनुप्रयोगहरूको लागि, **Microsoft Foundry मोडेलहरू सिफारिस गरिन्छ**।
</details>

<details>
<summary><strong>Microsoft Foundry मोडेलहरूको कोटा बढी हुँदा त्रुटिहरू कसरी सामना गर्ने?</strong></summary>

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
# Azure पोर्टलमा जानुहोस् > कोटा > वृद्धि अनुरोध गर्नुहोस्
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

टेम्पलेटका लागि हेर्नुहोस्: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>AI मोडेल एन्डपोइन्टहरू कसरी सुरक्षित गर्ने?</strong></summary>

**सर्वोत्तम अभ्यासहरू**:
1. Managed Identity प्रयोग गर्नुहोस् (API कुञ्जीहरू प्रयोग नगर्नुहोस्)
2. निजी एन्डपोइन्टहरू सक्षम पार्नुहोस्
3. नेटवर्क सुरक्षा समूहहरू कन्फिगर गर्नुहोस्
4. रेट लिमिटिङ लागू गर्नुहोस्
5. गुप्तिहरूका लागि Azure Key Vault प्रयोग गर्नुहोस्

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
- **AZD GitHub**: [इश्यूहरू र छलफलहरू](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [आधिकारिक दस्तावेज](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - आफ्नो सम्पादकमा Azure + Foundry agent skills इन्स्टल गर्न `npx skills add microsoft/github-copilot-for-azure` प्रयोग गर्नुहोस्

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - एआई-प्रथम विकास
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

**मद्दत चाहिन्छ?** हाम्रो समुदाय छलफलहरूमा सहभागी हुनुहोस् वा रिपोजिटरीमा इश्यू खोल्नुहोस्। Azure AI + AZD समुदाय तपाईंलाई सफल बनाउन यहाँ छ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->