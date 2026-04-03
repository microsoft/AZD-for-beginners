# Microsoft Foundry Integration with AZD

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ अघिल्लो अध्याय**: [अध्याय 1: तपाईंको पहिलो प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ अर्को**: [AI मोडेल डिप्लोइमेन्ट](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

## अवलोकन

यस मार्गदर्शकले Microsoft Foundry सेवा र Azure Developer CLI (AZD) लाई कसरी एकीकृत गर्ने देखाउँछ जसले AI अनुप्रयोग डिप्लोइमेन्टलाई सजिलो र समन्वित बनाउँछ। Microsoft Foundry AI अनुप्रयोगहरू निर्माण, डिप्लोइ र व्यवस्थापन गर्न व्यापक प्लेटफर्म हो, जबकि AZD ले पूर्वाधार र डिप्लोइ प्रक्रिया लाई सरलीकृत गर्छ।

## Microsoft Foundry भनेको के हो?

Microsoft Foundry माइक्रोसफ्टको एकीकृत AI विकास प्लेटफर्म हो जसमा समावेश छन्:

- **मोडेल क्यालोग**: अत्याधुनिक AI मोडेलहरू पहुँच
- **प्रॉम्प्ट फ्लो**: AI वर्कफ्लोको लागि भिजुअल डिजाइनर
- **Microsoft Foundry पोर्टल**: AI अनुप्रयोगहरूको लागि एकीकृत विकास वातावरण
- **डिप्लोइमेन्ट विकल्पहरू**: धेरै होस्टिङ र स्केलिङ विकल्पहरू
- **सुरक्षा र सुरक्षा**: निर्मित जिम्मेवार AI सुविधाहरू

## AZD + Microsoft Foundry: सँगै राम्रो

| सुविधा | Microsoft Foundry | AZD एकीकरण लाभ |
|---------|-----------------|------------------------|
| **मोडेल डिप्लोइमेन्ट** | म्यानुअल पोर्टल डिप्लोइमेन्ट | स्वचालित, पुनरावृत्ति योग्य डिप्लोइमेन्टहरू |
| **पूर्वाधार** | क्लिक-थ्रु प्रावधान | पूर्वाधारको रूपमा कोड (Bicep) |
| **पर्यावरण व्यवस्थापन** | एकल वातावरण फोकस | बहु-पर्यावरण (डेभ/स्टेजिङ/प्रोड) |
| **CI/CD समाकालीनता** | सीमित | नेटिव GitHub Actions समर्थन |
| **खर्च व्यवस्थापन** | आधारभूत अनुगमन | वातावरण-विशिष्ट लागत अनुकूलन |

## आवश्यकताहरू

- उपयुक्त अनुमति सहित Azure सदस्यता
- Azure Developer CLI स्थापना गरिएको
- Microsoft Foundry मोडेल सेवाहरू पहुँच
- Microsoft Foundry को आधारभूत परिचय

> **हालको AZD आधाररेखा:** यी उदाहरणहरू `azd` `1.23.12` विरुद्ध समीक्षा गरिएका थिए। AI एजेन्ट वर्कफ्लोको लागि, वर्तमान प्रिभ्यू एक्सटेन्शन रिलीज प्रयोग गर्नुहोस् र सुरु गर्नु अघि तपाईंको इन्स्टल गरिएको संस्करण जाँच गर्नुहोस्।

## मुख्य एकीकरण ढाँचाहरू

### ढाँचा 1: Microsoft Foundry मोडेल एकीकरण

**प्रयोग मामला**: Microsoft Foundry मोडेलहरूसँग च्याट अनुप्रयोग डिप्लोइमेन्ट

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

### ढाँचा 2: AI खोज + RAG एकीकरण

**प्रयोग मामला**: पुनःप्राप्ति-वर्धित उत्पादन (RAG) अनुप्रयोग डिप्लोइमेन्ट

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

### ढाँचा 3: कागजात बुद्धिमत्ता एकीकरण

**प्रयोग मामला**: कागजात प्रशोधन र विश्लेषण वर्कफ्लोहरू

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

### वातावरण चरहरू सेटअप

**उत्पादन कन्फिगरेसन:**
```bash
# मूल एआई सेवाहरू
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मोडेल कन्फिगरेशन्स
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# प्रदर्शन सेटिङहरू
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**विकास कन्फिगरेसन:**
```bash
# विकासका लागि लागत-अनुकूल सेटिङहरू
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # निःशुल्क स्तर
```

### Key Vault सँग सुरक्षित कन्फिगरेसन

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

## डिप्लोइमेन्ट वर्कफ्लोहरू

### Foundry का लागि AZD एक्सटेन्शनहरू

AZD ले Microsoft Foundry सेवाहरूसँग काम गर्न AI-विशिष्ट क्षमता थप्ने एक्सटेन्शनहरू प्रदान गर्दछ:

```bash
# Foundry एजेन्टहरू एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.finetune

# कस्टम मोडेलहरू एक्सटेन्सन स्थापना गर्नुहोस्
azd extension install azure.ai.models

# स्थापना गरिएको एक्सटेन्सनहरूको सूची बनाउनुहोस्
azd extension list --installed

# हाल स्थापना गरिएको एजेन्ट एक्सटेन्सन संस्करण जाँच गर्नुहोस्
azd extension show azure.ai.agents
```

AI एक्सटेन्शनहरू अझै प्रिभ्यूमा तीव्रगतिमा छ। कुनै आदेश यहाँ देखिएजस्तै व्यवहार नगरेमा, परियोजना समाधान अघि सम्बन्धित एक्सटेन्शन अपडेट गर्नुहोस्।

### `azd ai` संग एजेन्ट-प्रथम डिप्लोइमेन्ट

यदि तपाईंसँग एजेन्ट म्यानिफेस्ट छ भने, `azd ai agent init` प्रयोग गरेर Foundry Agent Service मा जडित परियोजना स्क्याफोल्ड गर्न सक्नुहुन्छ:

```bash
# एजेन्ट मेनिफेष्टबाट सुरु गर्नुहोस्
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure मा तैनाथ गर्नुहोस्
azd up
```

हालैका `azure.ai.agents` प्रिभ्यू रिलिजहरूले `azd ai agent init` का लागि टेम्प्लेट-आधारित इनिसियलाइजेसन समर्थन थपेका छन्। नयाँ एजेन्ट नमूनाहरू अनुकरण गर्दा, इन्स्टल गरिएको संस्करणमा उपलब्ध ठ्याक्कै झण्डाहरूका लागि एक्सटेन्शन सहयोग जाँच गर्नुहोस्।

पूर्ण आदेश संदर्भ र झण्डाहरूका लागि [AZD AI CLI कमाण्डहरू](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) हेर्नुहोस्।

### एकल कमाण्ड डिप्लोइमेन्ट

```bash
# सबै कुरा एउटै कमाण्डले डिप्लोय गर्नुहोस्
azd up

# वा क्रमिक रूपमा डिप्लोय गर्नुहोस्
azd provision  # केवल पूर्वाधार
azd deploy     # केवल अनुप्रयोग

# azd 1.23.11+ मा लामो समय चल्ने AI अनुप्रयोग डिप्लोयमेन्टका लागि
azd deploy --timeout 1800
```

### वातावरण-विशिष्ट डिप्लोइमेन्टहरू

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

### अनुप्रयोग इनसाइट्स एकीकरण

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

### प्रबन्धित पहिचान कन्फिगरेसन

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

### अटो-स्केल कन्फिगरेसन

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

### समस्या १: OpenAI कोटा समाप्त

**लक्षणहरू:**
- डिप्लोइमेन्ट कोटा त्रुटिसँग असफल हुन्छ
- आवेदन लगहरूमा 429 त्रुटिहरू

**समाधानहरू:**
```bash
# हालको कोटा प्रयोग जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus

# फरक क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूपमा क्षमता घटाउनुहोस्
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या २: प्रमाणीकरण असफलता

**लक्षणहरू:**
- AI सेवाहरू कल गर्दा 401/403 त्रुटिहरू
- "प्रवेश अस्वीकृत" सन्देशहरू

**समाधानहरू:**
```bash
# भूमिकाका नियुक्तिहरू पुष्टि गर्नुहोस्
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# व्यवस्थापित पहिचान कन्फिगरेसन जाँच गर्नुहोस्
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# की भल्ट पहुँच प्रमाणीकरण गर्नुहोस्
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या ३: मोडेल डिप्लोइमेन्ट समस्याहरू

**लक्षणहरू:**
- मोडेलहरू डिप्लोइमेन्टमा उपलब्ध छैनन्
- विशिष्ट मोडेल संस्करणहरू असफल छन्

**समाधानहरू:**
```bash
# क्षेत्र अनुसार उपलब्ध मोडेलहरूको सूची बनाउनुहोस्
az cognitiveservices model list --location eastus

# बाइसेप टेम्प्लेटमा मोडेल संस्करण अपडेट गर्नुहोस्
# मोडेल क्षमताको आवश्यकता जाँच गर्नुहोस्
```

## उदाहरण टेम्प्लेटहरू

### RAG च्याट अनुप्रयोग (Python)

**रिपोजिटरी**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**विवरण**: सबैभन्दा लोकप्रिय Azure AI नमूना — उत्पादन-तयार RAG च्याट अनुप्रयोग जसले तपाईका आफ्नै कागजातहरूमा प्रश्न सोध्न दिन्छ। GPT-4.1-mini प्रयोग गरेर च्याट, टेक्स्ट-एम्बेडिङ-3-लार्ज एम्बेडिङ्सका लागि, र Azure AI Search पुनःप्राप्तिका लागि। मल्टिमोडल कागजातहरू, स्पीच इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण, र Application Insights ट्रेसिङ समर्थन गर्दछ।

**छिटो सुरु:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG च्याट अनुप्रयोग (.NET)

**रिपोजिटरी**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**विवरण**: Python RAG च्याट नमूनाको .NET/C# समकक्ष। ASP.NET Core मिनिमल API र Blazor WebAssembly फ्रन्टएण्डसहित निर्माण गरिएको। भ्वाइस च्याट, GPT-4o-mini भिजन समर्थन, र .NET MAUI Blazor हाइब्रिड डेस्कटप/मोबाइल क्लाइन्ट समावेश गर्दछ।

**छिटो सुरु:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG च्याट अनुप्रयोग (Java)

**रिपोजिटरी**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**विवरण**: Langchain4J प्रयोग गरी AI समन्वयन गर्ने Java संस्करण RAG च्याट नमूना। माइक्रोसर्भिस घटना-चालित वास्तुकला, धेरै खोज रणनीतिहरू (टेक्स्ट, भेक्टर, मिश्रित), Azure Document Intelligence सहित कागजात अपलोड, र Azure Container Apps वा Azure Kubernetes Service मा डिप्लोइमेन्ट समर्थन गर्दछ।

**छिटो सुरु:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Azure AI Foundry सहित उद्यम खुद्रा सहायक

**रिपोजिटरी**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाहरू**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**विवरण**: Azure AI Foundry र Prompty प्रयोग गर्ने अन्तिम खुद्रा RAG सहायक। Contoso आउटडोर खुद्रा च्याटबट जसले प्रतिक्रियाहरूलाई उत्पादन सूची र ग्राहक अर्डर डाटामा आधारित बनाउँछ। पूर्ण GenAIOps वर्कफ्लो प्रदर्शन गर्दछ — Prompty सँग प्रोटोटाइप, AI-सहायक मूल्यांकनकर्ताहरू सँग मूल्यांकन, र AZD मार्फत Container Apps मा डिप्लोइ।

**छिटो सुरु:**
```bash
azd init --template contoso-chat
azd up
```

### सिर्जनात्मक लेखन बहु-एजेन्ट अनुप्रयोग

**रिपोजिटरी**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**सेवाहरू**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**विवरण**: Prompty सँगै AI एजेन्ट समन्वयन देखाउने बहु-एजेन्ट नमूना। अनुसन्धान एजेन्ट (Bing Grounding Azure AI Agent Service मा), उत्पादन एजेन्ट (Azure AI Search), लेखक एजेन्ट, र सम्पादक एजेन्ट समावेश गरि सँगै अनुसन्धान गरेका लेखहरू उत्पादन गर्न। GitHub Actions मा मूल्यांकनसहित CI/CD समावेश।

**छिटो सुरु:**
```bash
azd init --template contoso-creative-writer
azd up
```

### सर्भरलेस RAG च्याट (JavaScript/TypeScript)

**रिपोजिटरी**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**सेवाहरू**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**विवरण**: LangChain.js प्रयोग गरी पूर्ण सर्भरलेस RAG च्याटबट जसमा API को लागि Azure Functions र होस्टिङको लागि Azure Static Web Apps। Azure Cosmos DB लाई भेक्टर स्टोर र च्याट इतिहास डेटाबेस दुवै रूपमा प्रयोग गर्दछ। स्थानीय विकासका लागि Ollama सहित शून्य लागत परीक्षण समर्थन गर्दछ।

**छिटो सुरु:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### तपाइँको डाटासँगको च्याट समाधान त्वरक

**रिपोजिटरी**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**सेवाहरू**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**विवरण**: प्रशासन पोर्टल सहित उद्यम-स्तरको RAG समाधान त्वरक, कागजात अपलोड/व्यवस्थापन, विभिन्न समन्वयकर्ता विकल्पहरू (Semantic Kernel, LangChain, Prompt Flow), भाषण-टेक्स्ट, Microsoft Teams एकीकरण, र PostgreSQL वा Cosmos DB ब्याकएन्ड चयन। उत्पादन RAG परिदृश्यहरूका लागि अनुकूलनयोग्य प्रारम्भिक बिन्दु।

**छिटो सुरु:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI यात्रा एजेन्टहरू — बहु-एजेन्ट MCP समन्वय

**रिपोजिटरी**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**सेवाहरू**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP सर्भरहरू (.NET, Python, Java, TypeScript)

**विवरण**: तीन फ्रेमवर्कहरू (LangChain.js, LlamaIndex.TS, र Microsoft Agent Framework) प्रयोग गरेर बहु-एजेन्ट AI समन्वयको लागि सन्दर्भ अनुप्रयोग। चार भाषाहरूमा MCP (Model Context Protocol) सर्भरहरूलाई सर्भरलेस Azure Container Apps रूपमा डिप्लोइ गरे र OpenTelemetry अनुगमनका साथ।

**छिटो सुरु:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI स्टार्टर

**रिपोजिटरी**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**सेवाहरू**: Azure AI सेवाहरू + Azure OpenAI

**विवरण**: Azure AI सेवाहरूलाई कन्फिगर गरिएको मेसिन लर्निङ मोडेलहरूसहित डिप्लोइ गर्ने न्यूनतम Bicep टेम्प्लेट। जब तपाईलाई पूर्ण अनुप्रयोग स्ट्याक बिना Azure AI पूर्वाधार मात्र चाहिन्छ भने हल्का प्रारम्भिक बिन्दु।

**छिटो सुरु:**
```bash
azd init --template azd-ai-starter
azd up
```

> **थप टेम्प्लेटहरू ब्राउज गर्नुहोस्**: भाषाहरू र प्रासंगिक परिदृश्यहरूमा ८०+ AI-विशिष्ट AZD टेम्प्लेटहरूको लागि [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) भ्रमण गर्नुहोस्।

## अर्को चरणहरू

1. **उदाहरणहरू प्रयास गर्नुहोस्**: पूर्व-निर्मित टेम्प्लेटबाट सुरु गर्नुहोस् जुन तपाईंको प्रयोग मामिलासँग मेल खान्छ
2. **आफ्नो आवश्यकताहरूका लागि अनुकूलन गर्नुहोस्**: पूर्वाधार र अनुप्रयोग कोड परिमार्जन गर्नुहोस्
3. **अनुगमन थप्नुहोस्**: व्यापक अवलोकनयोग्यता कार्यान्वयन गर्नुहोस्
4. **खर्चहरू अनुकूलन गर्नुहोस्**: तपाईंको बजेटका लागि कन्फिगरेसनहरू परिमार्जन गर्नुहोस्
5. **तपाईंको डिप्लोइ सुरक्षित गर्नुहोस्**: उद्यम सुरक्षा ढाँचाहरू लागू गर्नुहोस्
6. **उत्पादन स्तरमा स्केल गर्नुहोस्**: बहु-क्षेत्र र उच्च उपलब्धता सुविधाहरू थप्नुहोस्

## 🎯 व्यावहारिक अभ्यासहरू

### अभ्यास १: Microsoft Foundry मोडेल च्याट अनुप्रयोग डिप्लोइ गर्नुहोस् (३० मिनेट)
**लक्ष्य**: उत्पादन-मैत्री AI च्याट अनुप्रयोग डिप्लोइ र परीक्षण गर्नुहोस्

```bash
# टेम्प्लेट सुरु गर्नुहोस्
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# वातावरण चर सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# तैनाथ गर्नुहोस्
azd up

# अनुप्रयोग परीक्षण गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# एआई अपरेसनहरू निगरानी गर्नुहोस्
azd monitor

# सफा गर्नुहोस्
azd down --force --purge
```

**सफलता मापदण्डहरू:**
- [ ] कोटा त्रुटि बिना डिप्लोइमेन्ट सफल हुन्छ
- [ ] ब्राउजरमा च्याट इन्टरफेस पहुँच गर्न सक्छ
- [ ] प्रश्न सोध्न र AI-सञ्चालित प्रतिक्रियाहरू प्राप्त गर्न सक्छ
- [ ] एप्लिकेसन इनसाइट्सले टेलिमेट्री डेटा देखाउँछ
- [ ] स्रोतहरू सफलतापूर्वक सफा गरियो

**अनुमानित लागत**: ३० मिनेट परीक्षणका लागि $5-10

### अभ्यास २: बहु-मोडेल डिप्लोइमेन्ट कन्फिगर गर्नुहोस् (४५ मिनेट)
**लक्ष्य**: विभिन्न कन्फिगरेसनहरूसँग बहु AI मोडेल डिप्लोइमेन्ट गर्नुहोस्

```bash
# अनुकूलित बाइसेप कन्फिगरेसन बनाउनुहोस्
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

# डिप्लॉय र प्रमाणित गर्नुहोस्
azd provision
azd show
```

**सफलता मापदण्डहरू:**
- [ ] विभिन्न मोडेलहरू सफलतापूर्वक डिप्लोइ
- [ ] फरक-फरक क्षमता सेटिङहरू लागू गरियो
- [ ] API मार्फत मोडेलहरू पहुँचयोग्य
- [ ] अनुप्रयोगबाट दुवै मोडेल कल गर्न सक्छ

### अभ्यास ३: लागत अनुगमन कार्यान्वयन गर्नुहोस् (२० मिनेट)
**लक्ष्य**: बजेट सूचना र लागत ट्र्याकिङ सेटअप गर्नुहोस्

```bash
# Bicep मा बजेट सूचना थप्नुहोस्
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

# बजेट सूचना तैनाथ गर्नुहोस्
azd provision

# वर्तमान खर्चहरू जाँच्नुहोस्
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**सफलता मापदण्डहरू:**
- [ ] Azure मा बजेट सूचना सिर्जना गरियो
- [ ] इमेल सूचनाहरू कन्फिगर गरियो
- [ ] Azure पोर्टलमा लागत डेटा हेर्न सकिन्छ
- [ ] बजेट सीमा उपयुक्त रूपमा सेट गरियो

## 💡 बारम्बार सोधिने प्रश्नहरू

<details>
<summary><strong>विकासको क्रममा Microsoft Foundry मोडेलहरूको लागत कसरी घटाउने?</strong></summary>

1. **निःशुल्क स्तर प्रयोग गर्नुहोस्**: Microsoft Foundry मोडेलहरूले प्रति महिना ५०,००० टोकन निःशुल्क दिन्छ
2. **क्षमता घटाउनुहोस्**: विकासका लागि ३०+ सट्टा १० TPM सेट गर्नुहोस्
3. **azd down प्रयोग गर्नुहोस्**: सक्रिय रूपमा विकास नगर्दा स्रोतहरू डिलिएट गर्नुहोस्
4. **प्रतिक्रिया क्यास गर्नुहोस्**: पुनरावृत्त प्रश्नहरूको लागि Redis क्यास लागू गर्नुहोस्
5. **प्रॉम्प्ट इन्जिनियरिङ प्रयोग गर्नुहोस्**: प्रभावकारी प्रॉम्प्टहरूसँग टोकन प्रयोग घटाउनुहोस्
```bash
# विकास संरचना
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Microsoft Foundry मोडेलहरू र OpenAI API बीच के फरक छ?</strong></summary>

**Microsoft Foundry मोडेलहरू**:
- उद्यम सुरक्षा र अनुपालन
- निजी नेटवर्क एकीकरण
- SLA सुनिश्चितताहरू
- प्रबन्धित पहिचान प्रमाणीकरण
- बढी कोटा उपलब्ध

**OpenAI API**:
- नयाँ मोडेलहरूमा छिटो पहुँच
- सरल सेटअप
- कम प्रवेश बाधा
- सार्वजनिक इन्टरनेट मात्र

उत्पादन एपहरूको लागि, **Microsoft Foundry मोडेलहरू सिफारिस गरिन्छ**।
</details>

<details>
<summary><strong>म Microsoft Foundry मोडेलहरू कोटा ओगटिएको त्रुटिहरू कसरी व्यवस्थापन गर्ने?</strong></summary>

```bash
# हालको कोटा जाँच गर्नुहोस्
az cognitiveservices usage list --location eastus2

# फरक क्षेत्र प्रयास गर्नुहोस्
azd env set AZURE_LOCATION westus2
azd up

# क्षणिक रूपमा क्षमता घटाउनुहोस्
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वृद्धि अनुरोध गर्नुहोस्
# Azure पोर्टल > कोटा > वृद्धि अनुरोधमा जानुहोस्
```
</details>

<details>
<summary><strong>के म मेरो आफ्नै डेटा Microsoft Foundry मोडेलहरूसँग प्रयोग गर्न सक्छु?</strong></summary>

हो! RAG (Retrieval Augmented Generation) को लागि **Azure AI Search** प्रयोग गर्नुहोस्:

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
<summary><strong>म कसरी AI मोडेल अन्त्यबिन्दुहरू सुरक्षित गर्ने?</strong></summary>

**सर्वोत्तम अभ्यासहरू**:
1. प्रबन्धित पहिचान प्रयोग गर्नुहोस् (API कुञ्जीहरू बिना)
2. निजी अन्त्यबिन्दुहरू सक्षम गर्नुहोस्
3. नेटवर्क सुरक्षा समूहहरू कन्फिगर गर्नुहोस्
4. दर सीमांकन लागू गर्नुहोस्
5. गोप्य जानकारीका लागि Azure Key Vault प्रयोग गर्नुहोस्

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

- **Microsoft Foundry Discord**: [#Azure च्यानल](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [समस्या र छलफलहरू](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [औपचारिक कागजातहरू](https://learn.microsoft.com/azure/ai-studio/)
- **एजेन्ट स्किलहरू**: [Microsoft Foundry स्किल skills.sh मा](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - `npx skills add microsoft/github-copilot-for-azure` कमाण्ड प्रयोग गरी आफ्नो सम्पादकमा Azure + Foundry एजेन्ट स्किलहरू स्थापना गर्नुहोस्

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [AZD शुरूआतीहरूका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ अघिल्लो अध्याय**: [अध्याय १: तपाईंको पहिलो परियोजना](../chapter-01-foundation/first-project.md)
- **➡️ अर्को**: [AI मोडेल डिप्लोइमेन्ट](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

**मद्दत चाहिन्छ?** हाम्रो समुदाय छलफलमा सहभागी हुनुहोस् वा रिपोजिटरीमा मुद्दा खोल्नुहोस्। Azure AI + AZD समुदाय तपाईंलाई सफल बनाउन यहाँ छ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यस दस्तावेज़लाई AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी सटीकताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धिहरू हुन सक्नेछन्। मूल भाषामा रहेको दस्तावेज़लाई प्रमाणिक स्रोतको रूपमा मान्नुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि भ्रम वा गलतफहमीका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->