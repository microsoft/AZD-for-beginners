# Microsoft Foundry र AZD सँग एकीकरण

**Chapter Navigation:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: Chapter 2 - AI-First Development
- **⬅️ अघिल्लो अध्याय**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ अर्को**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## अवलोकन

यो मार्गदर्शिकाले Microsoft Foundry सेवाहरूलाई Azure Developer CLI (AZD) सँग कसरी एकीकृत गर्ने देखाउँछ ताकि AI अनुप्रयोगहरूको तैनाती सरल र सुव्यवस्थित होस्। Microsoft Foundry ले AI अनुप्रयोगहरू निर्माण, तैनाथ र व्यवस्थापन गर्नका लागि व्यापक प्लेटफर्म प्रदान गर्छ भने AZD ले पूर्वाधार र तैनाती प्रक्रियालाई साधारण बनाउँछ।

## Microsoft Foundry भनेको के हो?

Microsoft Foundry Microsoft को एकीकृत AI विकास प्लेटफर्म हो जसमा समावेश छन्:

- **Model Catalog**: अत्याधुनिक AI मोडेलहरूमा पहुँच
- **Prompt Flow**: AI कार्यप्रवाहहरूको भिजुअल डिजाइनर
- **AI Foundry Portal**: AI अनुप्रयोगहरूको लागि एकीकृत विकास वातावरण
- **Deployment Options**: बहु होस्टिङ र स्केलेङ विकल्पहरू
- **Safety and Security**: बिल्ट-इन जिम्मेवार AI सुविधाहरू

## AZD + Microsoft Foundry: सँगै अझ राम्रो

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## पूर्वापेक्षाहरू

- Azure सदस्यता र उपयुक्त अनुमति
- Azure Developer CLI इन्स्टल गरिएको
- Azure OpenAI सेवाहरूमा पहुँच
- Microsoft Foundry सम्बन्धी आधारभूत परिचितता

## मुख्य एकीकरण ढाँचाहरू

### ढाँचा 1: Azure OpenAI एकीकरण

**प्रयोग केस**: Azure OpenAI मोडेलहरूसँग चैट अनुप्रयोग तैनाथ गर्नुहोस्

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
// Azure OpenAI Account
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

**प्रयोग केस**: Retrieval-augmented generation (RAG) अनुप्रयोग तैनाथ गर्नुहोस्

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

**प्रयोग केस**: कागजात प्रशोधन र विश्लेषण कार्यप्रवाहहरू

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

## 🔧 कन्फिगरेशन ढाँचाहरू

### वातावरण चर सेटअप

**Production कन्फिगरेशन:**
```bash
# मूल एआई सेवाहरू
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

**Development कन्फिगरेशन:**
```bash
# विकासका लागि लागत-अनुकूल सेटिङहरू
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # निःशुल्क तह
```

### Key Vault प्रयोग गरेर सुरक्षित कन्फिगरेशन

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

## तैनाती कार्यप्रवाहहरू

### एकल कमाण्ड तैनाती

```bash
# एकै आदेशमा सबै तैनाथ गर्नुहोस्
azd up

# वा क्रमिक रूपमा तैनाथ गर्नुहोस्
azd provision  # केवल पूर्वाधार
azd deploy     # केवल अनुप्रयोग
```

### वातावरण-विशिष्ट तैनातीहरू

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

## अनुगमन र अवलोकनीयता

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

## 🔐 सुरक्षा उत्कृष्ट अभ्यासहरू

### Managed Identity कन्फिगरेशन

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

### स्वचालित-स्केलिङ कन्फिगरेशन

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

### समस्या 1: OpenAI कोटा बढी भएको

**लक्षणहरू:**
- कोटा त्रुटिहरूका कारण तैनाती असफल हुन्छ
- एप्लिकेसन लगहरूमा 429 त्रुटिहरू

**समाधानहरू:**
```bash
# वर्तमान कोटा उपयोग जाँच्नुहोस्
az cognitiveservices usage list --location eastus

# विभिन्न क्षेत्र प्रयास गर्नुहोस्
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
# भूमिका नियुक्तिहरूको जाँच गर्नुहोस्
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# प्रबन्धित पहिचानको विन्यास जाँच गर्नुहोस्
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault पहुँच मान्य गर्नुहोस्
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मोडेल तैनाती समस्याहरू

**लक्षणहरू:**
- तैनातीमा मोडेलहरू उपलब्ध छैनन्
- विशिष्ट मोडेल संस्करणहरू असफल हुँदैछ

**समाधानहरू:**
```bash
# क्षेत्रअनुसार उपलब्ध मोडेलहरू सूचीबद्ध गर्नुहोस्
az cognitiveservices model list --location eastus

# bicep टेम्पलेटमा मोडेल संस्करण अद्यावधिक गर्नुहोस्
# मोडेलको क्षमता आवश्यकताहरू जाँच गर्नुहोस्
```

## उदाहरण ढाँचाहरू

### आधारभूत चैट एप्लिकेसन

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाहरू**: Azure OpenAI + Cognitive Search + App Service

**द्रुत सुरु**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### कागजात प्रशोधन पाइपलाइन

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**सेवाहरू**: Document Intelligence + Storage + Functions

**द्रुत सुरु**:
```bash
azd init --template ai-document-processing
azd up
```

### एंटरप्राइज चैट विथ RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाहरू**: Azure OpenAI + Search + Container Apps + Cosmos DB

**द्रुत सुरु**:
```bash
azd init --template contoso-chat
azd up
```

## अर्को कदमहरू

1. **उदाहरणहरू प्रयास गर्नुहोस्**: तपाईंको प्रयोग केससँग मेल खाने प्रि-बिल्ट टेम्पलेटबाट सुरु गर्नुहोस्
2. **आवश्यकताअनुसार अनुकूलन गर्नुहोस्**: पूर्वाधार र एप्लिकेसन कोड संशोधन गर्नुहोस्
3. **अनुगमन थप्नुहोस्**: व्यापक अवलोकनीयता लागू गर्नुहोस्
4. **लागत अनुकूलन गर्नुहोस्**: तपाईंको बजेट अनुसार कन्फिगरेसनहरू परिमार्जन गर्नुहोस्
5. **तैनाती सुरक्षित गर्नुहोस्**: एंटरप्राइज सुरक्षा ढाँचाहरू लागू गर्नुहोस्
6. **उत्पादनसम्म स्केल गर्नुहोस्**: बहु-क्षेत्र र उच्च-उपलब्धता सुविधाहरू थप्नुहोस्

## 🎯 व्यावहारिक अभ्यासहरू

### अभ्यास 1: Azure OpenAI चैट एप तैनाथ गर्नुहोस् (30 मिनेट)
**लक्ष्य**: उत्पादन-तैयार AI चैट अनुप्रयोग तैनाथ र परीक्षण गर्नुहोस्

```bash
# ढाँचा प्रारम्भ गर्नुहोस्
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरण चरहरू सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# परिनियोजन गर्नुहोस्
azd up

# अनुप्रयोग परीक्षण गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# कृत्रिम बुद्धिमत्ताका कार्यहरू अनुगमन गर्नुहोस्
azd monitor

# सफा गर्नुहोस्
azd down --force --purge
```

**सफलता मापदण्ड:**
- [ ] तैनाती बिना कोटा त्रुटिहरू पूरा भयो
- [ ] ब्राउजरमा चैट इन्टरफेस पहुँच गर्न सकिन्छ
- [ ] प्रश्न सोध्न र AI-सञ्चालित प्रतिक्रिया प्राप्त गर्न सकिन्छ
- [ ] Application Insights ले टेलीमेट्री डेटा देखाउँछ
- [ ] स्रोतहरू सफलतापूर्वक सफा गरियो

**अनुमानित लागत**: $5-10 को 30 मिनेट परीक्षणको लागि

### अभ्यास 2: बहु-मोडेल तैनाती कन्फिगर गर्नुहोस् (45 मिनेट)
**लक्ष्य**: फरक कन्फिगरेसनहरूसँग बहु AI मोडेल तैनाथ गर्नुहोस्

```bash
# कस्टम Bicep कन्फिगरेसन सिर्जना गर्नुहोस्
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

# परिनियोजन गर्नुहोस् र जाँच गर्नुहोस्
azd provision
azd show
```

**सफलता मापदण्ड:**
- [ ] धेरै मोडेलहरू सफलतापूर्वक तैनाथ गरियो
- [ ] फरक क्षमता सेटिङहरू लागू गरियो
- [ ] मोडेलहरू API मार्फत पहुँचयोग्य छन्
- [ ] एप्लिकेसनबाट दुवै मोडेललाई कल गर्न सकिन्छ

### अभ्यास 3: लागत अनुगमन लागू गर्नुहोस् (20 मिनेट)
**लक्ष्य**: बजेट अलर्ट र लागत ट्र्याकिङ सेटअप गर्नुहोस्

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

# बजेट अलर्ट तैनाथ गर्नुहोस्
azd provision

# हालको खर्च जाँच्नुहोस्
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**सफलता मापदण्ड:**
- [ ] Azure मा बजेट अलर्ट सिर्जना गरियो
- [ ] इमेल सूचनाहरू कन्फिगर गरियो
- [ ] Azure पोर्टलमा लागत डेटा हेर्न सकिन्छ
- [ ] बजेट थ्रेसहोल्डहरू उपयुक्त रूपमा सेट गरियो

## 💡 बारम्बार सोधिने प्रश्नहरू

<details>
<summary><strong>विकास समयमा Azure OpenAI लागत कसरी घटाउने?</strong></summary>

1. **Free Tier प्रयोग गर्नुहोस्**: Azure OpenAI ले 50,000 tokens/महिना निशुल्क प्रदान गर्छ
2. **क्षमता घटाउनुहोस्**: डेवका लागि क्षमता 30+ को सट्टा 10 TPM सेट गर्नुहोस्
3. **azd down प्रयोग गर्नुहोस्**: सक्रिय रूपमा विकास नगरिरहेको बेला स्रोतहरू डिलोकेट गर्नुहोस्
4. **प्रतिक्रियाहरू क्यास गर्नुहोस्**: बारम्बार सोधिने प्रश्नहरूको लागि Redis cache लागू गर्नुहोस्
5. **Prompt Engineering प्रयोग गर्नुहोस्**: कुशल प्रॉम्प्टहरूसँग टोकन प्रयोग घटाउनुहोस्

```bash
# विकास कन्फिगरेसन
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI र OpenAI API बीच के फरक छ?</strong></summary>

**Azure OpenAI**:
- एंटरप्राइज सुरक्षा र अनुपालन
- निजी नेटवर्क एकीकरण
- SLA ग्यारेन्टीहरू
- Managed identity प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नयाँ मोडेलहरूमा छिटो पहुँच
- सरल सेटअप
- प्रवेशको लागि कम बाधा
- सार्वजनिक इन्टरनेट मात्र

उत्पादन अनुप्रयोगहरूको लागि, **Azure OpenAI सिफारिस गरिएको**।
</details>

<details>
<summary><strong>Azure OpenAI कोटा बढी भएका त्रुटिहरू कसरी व्यवस्थापन गर्ने?</strong></summary>

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
# Azure पोर्टलमा जानुहोस् > कोटा > वृद्धि अनुरोध
```
</details>

<details>
<summary><strong>के म आफ्नै डाटा Azure OpenAI सँग प्रयोग गर्न सक्छु?</strong></summary>

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

हेर्नुहोस् the [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट।
</details>

<details>
<summary><strong>म AI मोडेल अन्तबिन्दुहरू कसरी सुरक्षित बनाउने?</strong></summary>

**उत्कृष्ट अभ्यासहरू**:
1. Managed Identity प्रयोग गर्नुहोस् (API कुञ्जी होइन)
2. Private Endpoints सक्षम गर्नुहोस्
3. नेटवर्क सुरक्षा समूहहरू कन्फिगर गर्नुहोस्
4. रेट लिमिटिङ लागू गर्नुहोस्
5. गोप्यताका लागि Azure Key Vault प्रयोग गर्नुहोस्

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
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: Chapter 2 - AI-First Development
- **⬅️ अघिल्लो अध्याय**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ अर्को**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 अर्को अध्याय**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**सहयोग चाहिन्छ?** हाम्रो समुदाय छलफलहरूमा सहभागी हुनुहोस् वा रिपोजिटरीमा मुद्दा खोल्नुहोस्। Azure AI + AZD समुदाय तपाईंको सफलताका लागि सहायता गर्न यहाँ छ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी सटीकताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा असत्यताहरू हुन सक्छन्। मूल दस्तावेज त्यसको मूल भाषामा नै अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार हुनेछैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->