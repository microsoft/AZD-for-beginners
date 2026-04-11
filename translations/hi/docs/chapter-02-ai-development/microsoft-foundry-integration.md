# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

यह गाइड Microsoft Foundry सेवाओं को Azure Developer CLI (AZD) के साथ एकीकृत करने का तरीका दिखाता है ताकि AI एप्लिकेशन की त्वरित तैनाती हो सके। Microsoft Foundry एक व्यापक प्लेटफॉर्म प्रदान करता है AI एप्लिकेशन के निर्माण, तैनाती, और प्रबंधन के लिए, जबकि AZD आधारभूत संरचना और तैनाती प्रक्रिया को सरल बनाता है।

## What is Microsoft Foundry?

Microsoft Foundry माइक्रोसॉफ्ट का एक एकीकृत प्लेटफ़ॉर्म है AI विकास के लिए जिसमें शामिल हैं:

- **Model Catalog**: अत्याधुनिक AI मॉडल तक पहुंच
- **Prompt Flow**: AI वर्कफ़्लोज़ के लिए विज़ुअल डिज़ाइनर
- **Microsoft Foundry Portal**: AI एप्लिकेशन के लिए एकीकृत विकास वातावरण
- **Deployment Options**: कई होस्टिंग और स्केलिंग विकल्प
- **Safety and Security**: निर्मित जिम्मेदार AI विशेषताएं

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | मैनुअल पोर्टल तैनाती | स्वचालित, दोहराने योग्य तैनाती |
| **Infrastructure** | क्लिक-थ्रू प्रोविजनिंग | Infrastructure as Code (Bicep) |
| **Environment Management** | एकल पर्यावरण फोकस | मल्टी-पर्यावरण (डेव/स्टेजिंग/प्रोड) |
| **CI/CD Integration** | सीमित | नेटिव GitHub Actions समर्थन |
| **Cost Management** | बेसिक मॉनिटरिंग | पर्यावरण-विशिष्ट लागत अनुकूलन |

## Prerequisites

- उपयुक्त अनुमतियों के साथ Azure सदस्यता
- Azure Developer CLI इंस्टॉल किया हुआ
- Microsoft Foundry Models सेवाओं तक पहुंच
- Microsoft Foundry की बुनियादी परिचय

> **Current AZD baseline:** ये उदाहरण `azd` `1.23.12` के खिलाफ समीक्षा किए गए थे। AI एजेंट वर्कफ़्लो के लिए, वर्तमान प्रिव्यू एक्सटेंशन रिलीज का उपयोग करें और शुरुआत से पहले अपनी इंस्टॉल की गई संस्करण जांचें।

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: Microsoft Foundry Models मॉडल के साथ चैट एप्लिकेशन तैनात करें

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

**Use Case**: retrieval-augmented generation (RAG) एप्लिकेशन तैनात करें

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

**Use Case**: दस्तावेज़ प्रसंस्करण और विश्लेषण वर्कफ़्लोज़

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

## 🔧 Configuration Patterns

### Environment Variables Setup

**Production Configuration:**
```bash
# कोर एआई सेवाएं
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडल कॉन्फ़िगरेशन
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# प्रदर्शन सेटिंग्स
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# विकास के लिए लागत-अनुकूलित सेटिंग्स
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # मुफ्त स्तर
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

## Deployment Workflows

### AZD Extensions for Foundry

AZD एक्सटेंशन्स प्रदान करता है जो Microsoft Foundry सेवाओं के लिए AI-विशिष्ट क्षमताएं जोड़ते हैं:

```bash
# Foundry एजेंट एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.agents

# फाइन-ट्यूनिंग एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.finetune

# कस्टम मॉडल्स एक्सटेंशन इंस्टॉल करें
azd extension install azure.ai.models

# इंस्टॉल किए गए एक्सटेंशनों की सूची बनाएं
azd extension list --installed

# वर्तमान में इंस्टॉल किए गए एजेंट एक्सटेंशन संस्करण का निरीक्षण करें
azd extension show azure.ai.agents
```

AI एक्सटेंशन्स अभी भी प्रिव्यू में तेजी से विकसित हो रहे हैं। यदि कोई कमांड यहाँ दिखाए अनुसार व्यवहार नहीं करता है, तो संबंधित एक्सटेंशन को अपग्रेड करें और परियोजना के साथ समस्याओं के निवारण से पहले जांच करें।

### Agent-First Deployment with `azd ai`

यदि आपके पास एजेंट मैनिफेस्ट है, तो `azd ai agent init` का उपयोग करें ताकि Foundry Agent Service से जुड़ा प्रोजेक्ट बनाएँ:

```bash
# एजेंट मेनिफेस्ट से प्रारंभ करें
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Azure पर तैनात करें
azd up
```

हालिया प्रिव्यू रिलीज़ `azure.ai.agents` ने `azd ai agent init` के लिए टेम्पलेट आधारित इनिशियलाइज़ेशन समर्थन भी जोड़ा है। यदि आप नवीनतम एजेंट नमूनों का अनुसरण कर रहे हैं, तो अपनी इंस्टॉल की गई संस्करण के लिए उपलब्ध फ्लैग्स के लिए एक्सटेंशन सहायता देखें।

पूर्ण कमांड संदर्भ और फ्लैग्स के लिए देखें [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) ।

### Single Command Deployment

```bash
# एक कमांड से सभी तैनात करें
azd up

# या क्रमागत रूप से तैनात करें
azd provision  # केवल अवसंरचना
azd deploy     # केवल अनुप्रयोग

# azd 1.23.11+ में लंबे समय तक चलने वाले AI ऐप तैनाती के लिए
azd deploy --timeout 1800
```

### Environment-Specific Deployments

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

## Monitoring and Observability

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

### Cost Monitoring

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

## 🔐 Security Best Practices

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

### Network Security

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

## Performance Optimization

### Caching Strategies

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Exceeded

**Symptoms:**
- तैनाती कोटा त्रुटियों के साथ विफल होती है
- एप्लिकेशन लॉग्स में 429 त्रुटियाँ

**Solutions:**
```bash
# वर्तमान कोटा उपयोग जांचें
az cognitiveservices usage list --location eastus

# भिन्न क्षेत्र आज़माएं
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- AI सेवाओं को कॉल करते समय 401/403 त्रुटियाँ
- "Access denied" संदेश

**Solutions:**
```bash
# भूमिका असाइनमेंट की पुष्टि करें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# प्रबंधित पहचान विन्यास जांचें
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# की वॉल्ट एक्सेस सत्यापित करें
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- तैनाती में मॉडल उपलब्ध नहीं हैं
- विशिष्ट मॉडल संस्करण विफल हो रहे हैं

**Solutions:**
```bash
# क्षेत्र द्वारा उपलब्ध मॉडलों की सूची बनाएं
az cognitiveservices model list --location eastus

# बाइसप टेम्पलेट में मॉडल संस्करण अपडेट करें
# मॉडल क्षमता आवश्यकताओं की जांच करें
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: सबसे लोकप्रिय Azure AI नमूना — एक उत्पादन-तैयार RAG चैट ऐप जो आपको अपने दस्तावेज़ों पर प्रश्न पूछने देता है। चैट के लिए GPT-4.1-mini का उपयोग करता है, एम्बेडिंग के लिए text-embedding-3-large, और पुनःप्राप्ति के लिए Azure AI Search। मल्टीमॉडल दस्तावेज़, भाषण इनपुट/आउटपुट, Microsoft Entra प्रमाणीकरण, और Application Insights ट्रेसिंग का समर्थन करता है।

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: Python RAG चैट नमूने का .NET/C# समकक्ष। ASP.NET Core Minimal API और Blazor WebAssembly फ्रंटेंड के साथ बना। वॉयस चैट, GPT-4o-mini विज़न समर्थन, और एक साथी .NET MAUI Blazor हाइब्रिड डेस्कटॉप/मोबाइल क्लाइंट शामिल हैं।

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: Langchain4J का उपयोग करते हुए RAG चैट नमूने का जावा संस्करण। माईक्रोसर्विस इवेंट-चालित आर्किटेक्चर, कई खोज रणनीतियाँ (टेक्स्ट, वेक्टर, हाइब्रिड), Azure Document Intelligence के साथ दस्तावेज़ अपलोड, और Azure Container Apps या Azure Kubernetes Service पर तैनाती का समर्थन करता है।

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: एंटरप्राइज़-ग्रेड रिटेल RAG कॉपिलॉट जिसे Azure AI Foundry और Prompty के साथ बनाया गया है। एक Contoso आउटडोर रिटेलर चैटबॉट जो उत्पाद कैटलॉग और ग्राहक आदेश डेटा पर आधारित उत्तर प्रदान करता है। पूर्ण GenAIOps वर्कफ़्लो दिखाता है — Prompty के साथ प्रोटोटाइप, AI-सहायता प्राप्त मूल्यांकनकर्ताओं के साथ मूल्यांकन, और AZD के माध्यम से कंटेनर ऐप्स में तैनाती।

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: मल्टी-एजेंट नमूना जो Prompty के साथ AI एजेंट समन्वय दिखाता है। एक अनुसंधान एजेंट (Bing Grounding in Azure AI Agent Service), एक उत्पाद एजेंट (Azure AI Search), एक लेखक एजेंट, और एक संपादक एजेंट का उपयोग कर सहयोगात्मक रूप से अच्छे से शोध किए गए लेख तैयार करता है। GitHub Actions में CI/CD के साथ मूल्यांकन शामिल है।

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: पूरी तरह से सर्वरलेस RAG चैटबॉट जो LangChain.js का उपयोग करता है, Azure Functions API के लिए और Azure Static Web Apps होस्टिंग के लिए। Azure Cosmos DB को वेक्टर स्टोर और चैट इतिहास डेटाबेस दोनों के रूप में उपयोग करता है। ज़ीरो-कॉस्ट परीक्षण के लिए लोकल डेवलपमेंट में Ollama का समर्थन करता है।

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: एंटरप्राइज़-ग्रेड RAG समाधान एक्सेलेरेटर जिसमें दस्तावेज़ अपलोड/प्रबंधन के लिए प्रशासक पोर्टल, कई ओरकेस्ट्रेटर विकल्प (Semantic Kernel, LangChain, Prompt Flow), भाषण से पाठ, Microsoft Teams एकीकरण, और PostgreSQL या Cosmos DB बैकएंड का विकल्प शामिल है। उत्पादन RAG परिदृश्यों के लिए एक अनुकूलनीय प्रारंभिक बिंदु के रूप में डिज़ाइन किया गया है।

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: तीन फ्रेमवर्क्स (LangChain.js, LlamaIndex.TS, और Microsoft Agent Framework) का उपयोग करते हुए मल्टी-एजेंट AI समन्वय के लिए संदर्भ अनुप्रयोग। चार भाषाओं में MCP (Model Context Protocol) सर्वर दिखाता है जिन्हें सर्वरलेस Azure Container Apps के रूप में तैनात किया गया है और OpenTelemetry मॉनिटरिंग के साथ।

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: एक न्यूनतम Bicep टेम्पलेट जो Azure AI सेवाओं को निर्दिष्ट मशीन लर्निंग मॉडलों के साथ तैनात करता है। जब आपको केवल Azure AI इन्फ्रास्ट्रक्चर चाहिए होता है बिना पूरे एप्लिकेशन स्टैक के, तब यह हल्का प्रारंभिक बिंदु है।

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: 80+ AI-विशिष्ट AZD टेम्प्लेट्स के लिए [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) पर जाएं, जो भाषाओं और परिदृश्यों में उपलब्ध हैं।

## Next Steps

1. **Try the Examples**: उस प्री-बिल्ट टेम्प्लेट से शुरू करें जो आपके उपयोग के मामले से मेल खाता हो
2. **Customize for Your Needs**: आधारभूत संरचना और एप्लिकेशन कोड को संशोधित करें
3. **Add Monitoring**: व्यापक अवलोकन लागू करें
4. **Optimize Costs**: अपने बजट के लिए सेटिंग्स को अनुकूलित करें
5. **Secure Your Deployment**: एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
6. **Scale to Production**: मल्टी-रीजन और उच्च उपलब्धता फीचर्स जोड़ें

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: उत्पादन-तैयार AI चैट एप्लिकेशन तैनात और परीक्षण करें

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

# साफ-सफाई करें
azd down --force --purge
```

**Success Criteria:**
- [ ] तैनाती बिना कोटा त्रुटियों के पूरी हो
- [ ] ब्राउज़र में चैट इंटरफेस तक पहुंच हो
- [ ] प्रश्न पूछ सकें और AI-संचालित जवाब प्राप्त करें
- [ ] Application Insights टेलीमेट्री डेटा दिखाए
- [ ] संसाधनों की सफाई सफलतापूर्वक हो

**Estimated Cost**: 30 मिनट के परीक्षण के लिए $5-10

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: विभिन्न कॉन्फ़िगरेशन के साथ कई AI मॉडल तैनात करें

```bash
# कस्टम बाइसप कॉन्फ़िगरेशन बनाएं
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

**Success Criteria:**
- [ ] एक से अधिक मॉडल सफलतापूर्वक तैनात किए गए हों
- [ ] विभिन्न क्षमता सेटिंग्स लागू हों
- [ ] मॉडल API के माध्यम से एक्सेस किए जा सकें
- [ ] एप्लिकेशन से दोनों मॉडलों को कॉल किया जा सके

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: बजट अलर्ट और लागत ट्रैकिंग सेट करें

```bash
# बजट अलर्ट को बाइसेप में जोड़ें
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

**Success Criteria:**
- [ ] Azure में बजट अलर्ट बनाया गया हो
- [ ] ईमेल सूचनाएँ कॉन्फ़िगर की गई हों
- [ ] Azure पोर्टल में लागत डेटा देख सकें
- [ ] बजट थ्रेशोल्ड्स ठीक से सेट किए गए हों

## 💡 Frequently Asked Questions

<details>
<summary><strong>विकास के दौरान Microsoft Foundry Models की लागत कैसे कम करें?</strong></summary>

1. **Free Tier का उपयोग करें**: Microsoft Foundry Models प्रति माह 50,000 टोकन मुफ्त प्रदान करता है
2. **क्षमता कम करें**: विकास के लिए क्षमता को 30+ के बजाय 10 TPM सेट करें
3. **azd down का उपयोग करें**: जब सक्रिय रूप से विकास न कर रहे हों, संसाधनों को डीअलोकेट करें
4. **प्रतिपुष्टि कैश करें**: पुनरावृत्त प्रश्नों के लिए Redis कैश लागू करें
5. **Prompt Engineering का उपयोग करें**: कुशल प्रॉम्प्ट्स के साथ टोकन उपयोग कम करें
```bash
# विकास सेटिंग्स
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
- उच्चतर कोटा उपलब्ध

**OpenAI API**:
- नए मॉडलों तक तेज़ पहुंच
- सरल सेटअप
- प्रवेश के लिए कम बाधा
- केवल सार्वजनिक इंटरनेट

प्रोडक्शन एप्स के लिए, **Microsoft Foundry Models की सिफारिश की जाती है**।
</details>

<details>
<summary><strong>Microsoft Foundry Models कोटा समाप्त होने की त्रुटियों को कैसे संभालूं?</strong></summary>

```bash
# वर्तमान कोटा जांचें
az cognitiveservices usage list --location eastus2

# विभिन्न क्षेत्र का प्रयास करें
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वृद्धि का अनुरोध करें
# Azure पोर्टल > कोटा > वृद्धि का अनुरोध करें पर जाएं
```
</details>

<details>
<summary><strong>क्या मैं Microsoft Foundry Models के साथ अपना डेटा उपयोग कर सकता हूँ?</strong></summary>

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

[azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट देखें।
</details>

<details>
<summary><strong>मैं AI मॉडल एंडपॉइंट्स को कैसे सुरक्षित करूं?</strong></summary>

**सर्वोत्तम प्रथाएँ**:
1. प्रबंधित पहचान का उपयोग करें (कोई API कीज़ नहीं)
2. निजी एंडपॉइंट्स सक्षम करें
3. नेटवर्क सुरक्षा समूह कॉन्फ़िगर करें
4. दर सीमित करें
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

## समुदाय और समर्थन

- **Microsoft Foundry Discord**: [#Azure चैनल](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [इश्यू और चर्चाएं](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [आधिकारिक दस्तावेज़](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skills.sh पर Microsoft Foundry स्किल](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - `npx skills add microsoft/github-copilot-for-azure` के साथ अपने संपादक में Azure + Foundry एजेंट स्किल्स इंस्टॉल करें

---

**अध्याय नेविगेशन:**  
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)  
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-First Development  
- **⬅️ पिछला अध्याय**: [अध्याय 1: आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)  
- **➡️ अगला**: [AI मॉडल तैनाती](ai-model-deployment.md)  
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)  

**मदद चाहिए?** हमारी सामुदायिक चर्चाओं में शामिल हों या रिपॉजिटरी में इश्यू खोलें। Azure AI + AZD समुदाय आपकी सफलता में मदद करने के लिए यहाँ है!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल भाषा में दस्तावेज़ को आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम ज़िम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->