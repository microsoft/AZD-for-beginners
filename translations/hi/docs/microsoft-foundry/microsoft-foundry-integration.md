# Microsoft Foundry और AZD का एकीकरण

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती लोगों के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला अध्याय**: [अध्याय 1: आपका पहला प्रोजेक्ट](../getting-started/first-project.md)
- **➡️ अगला**: [AI मॉडल परिनियोजन](ai-model-deployment.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../getting-started/configuration.md)

## अवलोकन

यह गाइड Microsoft Foundry सेवाओं को Azure Developer CLI (AZD) के साथ एकीकृत करने की प्रक्रिया को दिखाता है ताकि AI एप्लिकेशन को आसानी से परिनियोजित किया जा सके। Microsoft Foundry AI एप्लिकेशन बनाने, परिनियोजित करने और प्रबंधित करने के लिए एक व्यापक प्लेटफ़ॉर्म प्रदान करता है, जबकि AZD बुनियादी ढांचे और परिनियोजन प्रक्रिया को सरल बनाता है।

## Microsoft Foundry क्या है?

Microsoft Foundry AI विकास के लिए Microsoft का एकीकृत प्लेटफ़ॉर्म है, जिसमें शामिल हैं:

- **मॉडल कैटलॉग**: अत्याधुनिक AI मॉडल तक पहुंच
- **प्रॉम्प्ट फ्लो**: AI वर्कफ़्लो के लिए विज़ुअल डिज़ाइनर
- **AI Foundry पोर्टल**: AI एप्लिकेशन के लिए एकीकृत विकास वातावरण
- **परिनियोजन विकल्प**: होस्टिंग और स्केलिंग के कई विकल्प
- **सुरक्षा और सुरक्षा**: जिम्मेदार AI सुविधाओं के साथ निर्मित

## AZD + Microsoft Foundry: साथ में बेहतर

| विशेषता | Microsoft Foundry | AZD एकीकरण लाभ |
|---------|-----------------|------------------------|
| **मॉडल परिनियोजन** | मैनुअल पोर्टल परिनियोजन | स्वचालित, दोहराने योग्य परिनियोजन |
| **बुनियादी ढांचा** | क्लिक-थ्रू प्रावधान | कोड के रूप में बुनियादी ढांचा (Bicep) |
| **पर्यावरण प्रबंधन** | एकल पर्यावरण पर ध्यान केंद्रित | बहु-पर्यावरण (डेव/स्टेजिंग/प्रोड) |
| **CI/CD एकीकरण** | सीमित | नेटिव GitHub Actions समर्थन |
| **लागत प्रबंधन** | बुनियादी निगरानी | पर्यावरण-विशिष्ट लागत अनुकूलन |

## आवश्यकताएँ

- उपयुक्त अनुमतियों के साथ Azure सदस्यता
- Azure Developer CLI स्थापित
- Azure OpenAI सेवाओं तक पहुंच
- Microsoft Foundry की बुनियादी जानकारी

## मुख्य एकीकरण पैटर्न

### पैटर्न 1: Azure OpenAI एकीकरण

**उपयोग का मामला**: Azure OpenAI मॉडल के साथ चैट एप्लिकेशन परिनियोजित करें

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

**बुनियादी ढांचा (main.bicep):**
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

### पैटर्न 2: AI सर्च + RAG एकीकरण

**उपयोग का मामला**: पुनर्प्राप्ति-वर्धित पीढ़ी (RAG) एप्लिकेशन परिनियोजित करें

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

### पैटर्न 3: दस्तावेज़ इंटेलिजेंस एकीकरण

**उपयोग का मामला**: दस्तावेज़ प्रसंस्करण और विश्लेषण वर्कफ़्लो

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

### पर्यावरण चर सेटअप

**उत्पादन कॉन्फ़िगरेशन:**
```bash
# कोर एआई सेवाएं
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडल कॉन्फ़िगरेशन
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# प्रदर्शन सेटिंग्स
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**विकास कॉन्फ़िगरेशन:**
```bash
# विकास के लिए लागत-अनुकूल सेटिंग्स
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # मुफ्त स्तर
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

## परिनियोजन वर्कफ़्लो

### एकल कमांड परिनियोजन

```bash
# एक कमांड के साथ सब कुछ तैनात करें
azd up

# या धीरे-धीरे तैनात करें
azd provision  # केवल बुनियादी ढांचा
azd deploy     # केवल एप्लिकेशन
```

### पर्यावरण-विशिष्ट परिनियोजन

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

## निगरानी और अवलोकन

### एप्लिकेशन इनसाइट्स एकीकरण

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

### लागत निगरानी

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

### समस्या 1: OpenAI कोटा समाप्त

**लक्षण:**
- परिनियोजन कोटा त्रुटियों के साथ विफल
- एप्लिकेशन लॉग में 429 त्रुटियाँ

**समाधान:**
```bash
# वर्तमान कोटा उपयोग की जांच करें
az cognitiveservices usage list --location eastus

# अलग क्षेत्र आज़माएं
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण विफलताएँ

**लक्षण:**
- AI सेवाओं को कॉल करते समय 401/403 त्रुटियाँ
- "पहुंच अस्वीकृत" संदेश

**समाधान:**
```bash
# भूमिका असाइनमेंट की पुष्टि करें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# प्रबंधित पहचान कॉन्फ़िगरेशन की जांच करें
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# की वॉल्ट पहुंच को मान्य करें
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडल परिनियोजन समस्याएँ

**लक्षण:**
- परिनियोजन में मॉडल उपलब्ध नहीं
- विशिष्ट मॉडल संस्करण विफल हो रहे हैं

**समाधान:**
```bash
# क्षेत्र द्वारा उपलब्ध मॉडलों की सूची बनाएं
az cognitiveservices model list --location eastus

# बाइसेप टेम्पलेट में मॉडल संस्करण अपडेट करें
# मॉडल क्षमता आवश्यकताओं की जांच करें
```

## उदाहरण टेम्पलेट्स

### बुनियादी चैट एप्लिकेशन

**भंडार**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाएँ**: Azure OpenAI + Cognitive Search + App Service

**त्वरित शुरुआत**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### दस्तावेज़ प्रसंस्करण पाइपलाइन

**भंडार**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**सेवाएँ**: Document Intelligence + Storage + Functions

**त्वरित शुरुआत**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG के साथ एंटरप्राइज़ चैट

**भंडार**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाएँ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**त्वरित शुरुआत**:
```bash
azd init --template contoso-chat
azd up
```

## अगले कदम

1. **उदाहरण आज़माएँ**: अपने उपयोग के मामले से मेल खाने वाले पूर्व-निर्मित टेम्पलेट से शुरुआत करें
2. **अपनी आवश्यकताओं के लिए अनुकूलित करें**: बुनियादी ढांचे और एप्लिकेशन कोड को संशोधित करें
3. **निगरानी जोड़ें**: व्यापक अवलोकन लागू करें
4. **लागत अनुकूलित करें**: अपने बजट के लिए कॉन्फ़िगरेशन को ठीक करें
5. **अपना परिनियोजन सुरक्षित करें**: एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
6. **उत्पादन तक स्केल करें**: बहु-क्षेत्र और उच्च उपलब्धता सुविधाएँ जोड़ें

## 🎯 व्यावहारिक अभ्यास

### अभ्यास 1: Azure OpenAI चैट ऐप परिनियोजित करें (30 मिनट)
**लक्ष्य**: एक उत्पादन-तैयार AI चैट एप्लिकेशन परिनियोजित और परीक्षण करें

```bash
# टेम्पलेट प्रारंभ करें
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरण चर सेट करें
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# परिनियोजित करें
azd up

# एप्लिकेशन का परीक्षण करें
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# एआई संचालन की निगरानी करें
azd monitor

# साफ करें
azd down --force --purge
```

**सफलता मानदंड:**
- [ ] परिनियोजन कोटा त्रुटियों के बिना पूरा होता है
- [ ] ब्राउज़र में चैट इंटरफ़ेस तक पहुंच सकते हैं
- [ ] प्रश्न पूछ सकते हैं और AI-संचालित उत्तर प्राप्त कर सकते हैं
- [ ] एप्लिकेशन इनसाइट्स टेलीमेट्री डेटा दिखाता है
- [ ] संसाधनों को सफलतापूर्वक साफ़ किया गया

**अनुमानित लागत**: परीक्षण के 30 मिनट के लिए $5-10

### अभ्यास 2: बहु-मॉडल परिनियोजन कॉन्फ़िगर करें (45 मिनट)
**लक्ष्य**: विभिन्न कॉन्फ़िगरेशन के साथ कई AI मॉडल परिनियोजित करें

```bash
# कस्टम बाइसेप कॉन्फ़िगरेशन बनाएं
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

# परिनियोजित करें और सत्यापित करें
azd provision
azd show
```

**सफलता मानदंड:**
- [ ] कई मॉडल सफलतापूर्वक परिनियोजित किए गए
- [ ] विभिन्न क्षमता सेटिंग्स लागू की गईं
- [ ] मॉडल API के माध्यम से सुलभ हैं
- [ ] एप्लिकेशन से दोनों मॉडलों को कॉल कर सकते हैं

### अभ्यास 3: लागत निगरानी लागू करें (20 मिनट)
**लक्ष्य**: बजट अलर्ट और लागत ट्रैकिंग सेट करें

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

# वर्तमान लागत जांचें
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**सफलता मानदंड:**
- [ ] Azure में बजट अलर्ट बनाया गया
- [ ] ईमेल सूचनाएँ कॉन्फ़िगर की गईं
- [ ] Azure पोर्टल में लागत डेटा देख सकते हैं
- [ ] बजट सीमा उपयुक्त रूप से सेट की गई

## 💡 अक्सर पूछे जाने वाले प्रश्न

<details>
<summary><strong>विकास के दौरान Azure OpenAI लागत कैसे कम करें?</strong></summary>

1. **मुफ्त टियर का उपयोग करें**: Azure OpenAI प्रति माह 50,000 टोकन मुफ्त प्रदान करता है
2. **क्षमता कम करें**: विकास के लिए 30+ के बजाय 10 TPM सेट करें
3. **azd down का उपयोग करें**: सक्रिय रूप से विकास न करते समय संसाधनों को डीएलोकेट करें
4. **प्रतिक्रिया कैश करें**: बार-बार पूछे जाने वाले प्रश्नों के लिए Redis कैश लागू करें
5. **प्रॉम्प्ट इंजीनियरिंग का उपयोग करें**: कुशल प्रॉम्प्ट के साथ टोकन उपयोग कम करें

```bash
# विकास कॉन्फ़िगरेशन
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI और OpenAI API में क्या अंतर है?</strong></summary>

**Azure OpenAI**:
- एंटरप्राइज़ सुरक्षा और अनुपालन
- निजी नेटवर्क एकीकरण
- SLA गारंटी
- प्रबंधित पहचान प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नए मॉडलों तक तेज़ पहुंच
- सरल सेटअप
- प्रवेश के लिए कम बाधा
- केवल सार्वजनिक इंटरनेट

उत्पादन एप्लिकेशन के लिए, **Azure OpenAI अनुशंसित है**।
</details>

<details>
<summary><strong>Azure OpenAI कोटा समाप्त त्रुटियों को कैसे संभालें?</strong></summary>

```bash
# वर्तमान कोटा जांचें
az cognitiveservices usage list --location eastus2

# अलग क्षेत्र आज़माएं
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वृद्धि का अनुरोध करें
# Azure पोर्टल पर जाएं > कोटा > वृद्धि का अनुरोध करें
```
</details>

<details>
<summary><strong>क्या मैं Azure OpenAI के साथ अपना डेटा उपयोग कर सकता हूँ?</strong></summary>

हाँ! **Azure AI Search** का उपयोग RAG (Retrieval Augmented Generation) के लिए करें:

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
<summary><strong>AI मॉडल एंडपॉइंट्स को कैसे सुरक्षित करें?</strong></summary>

**सर्वोत्तम प्रथाएँ**:
1. प्रबंधित पहचान का उपयोग करें (कोई API कुंजी नहीं)
2. निजी एंडपॉइंट सक्षम करें
3. नेटवर्क सुरक्षा समूह कॉन्फ़िगर करें
4. दर सीमित करें
5. गुप्त जानकारी के लिए Azure Key Vault का उपयोग करें

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
- **AZD GitHub**: [समस्याएँ और चर्चाएँ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [आधिकारिक दस्तावेज़](https://learn.microsoft.com/azure/ai-studio/)

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती लोगों के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला अध्याय**: [अध्याय 1: आपका पहला प्रोजेक्ट](../getting-started/first-project.md)
- **➡️ अगला**: [AI मॉडल परिनियोजन](ai-model-deployment.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../getting-started/configuration.md)

**मदद चाहिए?** हमारे समुदाय चर्चाओं में शामिल हों या रिपॉजिटरी में एक समस्या खोलें। Azure AI + AZD समुदाय आपकी सफलता में मदद करने के लिए यहाँ है!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में दस्तावेज़ को आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->