# Microsoft Foundry का AZD के साथ एकीकरण

**अध्याय नेविगेशन:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous Chapter**: [अध्याय 1: आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI मॉडल परिनियोजन](ai-model-deployment.md)
- **🚀 Next Chapter**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

## अवलोकन

यह गाइड दिखाती है कि Microsoft Foundry सेवाओं को Azure Developer CLI (AZD) के साथ कैसे एकीकृत किया जा सकता है ताकि AI अनुप्रयोगों के परिनियोजन को आसान बनाया जा सके। Microsoft Foundry AI अनुप्रयोगों के निर्माण, परिनियोजन और प्रबंधन के लिए एक व्यापक प्लेटफ़ॉर्म प्रदान करता है, जबकि AZD इन्फ्रास्ट्रक्चर और परिनियोजन प्रक्रिया को सरल बनाता है।

## Microsoft Foundry क्या है?

Microsoft Foundry Microsoft का एक एकीकृत AI विकास प्लेटफ़ॉर्म है जिसमें शामिल हैं:

- **Model Catalog**: अत्याधुनिक AI मॉडलों तक पहुँच
- **Prompt Flow**: AI वर्कफ़्लोज़ के लिए विज़ुअल डिज़ाइनर
- **AI Foundry Portal**: AI अनुप्रयोगों के लिए एकीकृत विकास पर्यावरण
- **Deployment Options**: होस्टिंग और स्केलिंग के कई विकल्प
- **Safety and Security**: बिल्ट-इन जिम्मेदार AI सुविधाएँ

## AZD + Microsoft Foundry: एक साथ बेहतर

| विशेषता | Microsoft Foundry | AZD एकीकरण लाभ |
|---------|-----------------|------------------------|
| **Model Deployment** | मैनुअल पोर्टल परिनियोजन | स्वचालित, दोहराने योग्य परिनियोजन |
| **Infrastructure** | क्लिक-थ्रू प्रोविजनिंग | कोड के रूप में बुनियादी ढांचा (Bicep) |
| **Environment Management** | एकल परिवेश फोकस | मल्टी-पर्यावरण (dev/staging/prod) |
| **CI/CD Integration** | सीमित | नैटिव GitHub Actions समर्थन |
| **Cost Management** | बुनियादी निगरानी | परिवेश-विशिष्ट लागत अनुकूलन |

## आवश्यकताएँ

- उपयुक्त अनुमतियों के साथ Azure सदस्यता
- Azure Developer CLI स्थापित
- Azure OpenAI सेवाओं तक पहुँच
- Microsoft Foundry से बुनियादी परिचय

## मुख्य एकीकरण पैटर्न

### पैटर्न 1: Azure OpenAI एकीकरण

**उपयोग मामला**: Azure OpenAI मॉडलों के साथ चैट अनुप्रयोग परिनियोजित करें

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

### पैटर्न 2: AI Search + RAG एकीकरण

**उपयोग मामला**: retrieval-augmented generation (RAG) अनुप्रयोग परिनियोजित करें

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

### पैटर्न 3: दस्तावेज़ बुद्धिमत्ता एकीकरण

**उपयोग मामला**: दस्तावेज़ प्रसंस्करण और विश्लेषण वर्कफ़्लोज़

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

**प्रोडक्शन कॉन्फ़िगरेशन:**
```bash
# मुख्य एआई सेवाएँ
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडल विन्यास
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# प्रदर्शन सेटिंग्स
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**डेवलपमेंट कॉन्फ़िगरेशन:**
```bash
# विकास के लिए लागत-अनुकूलित सेटिंग्स
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
# एक कमांड से सब कुछ तैनात करें
azd up

# या क्रमिक रूप से तैनात करें
azd provision  # केवल बुनियादी ढांचा
azd deploy     # केवल अनुप्रयोग
```

### पर्यावरण-विशिष्ट परिनियोजन

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

## मॉनिटरिंग और अवलोकनीयता

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

## 🔐 सुरक्षा सर्वोत्तम अभ्यास

### Managed Identity कॉन्फ़िगरेशन

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

### समस्या 1: OpenAI कोटा पार हो गया

**लक्षण:**
- डिप्लॉयमेंट कोटा त्रुटियों के साथ असफल होता है
- एप्लिकेशन लॉग में 429 त्रुटियाँ

**समाधान:**
```bash
# वर्तमान कोटा उपयोग की जाँच करें
az cognitiveservices usage list --location eastus

# अलग क्षेत्र आज़माएँ
azd env set AZURE_LOCATION westus2
azd up

# क्षमता को अस्थायी रूप से कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण असफलताएँ

**लक्षण:**
- AI सेवाओं को कॉल करते समय 401/403 त्रुटियाँ
- "Access denied" संदेश

**समाधान:**
```bash
# भूमिका असाइनमेंट सत्यापित करें
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# प्रबंधित पहचान विन्यास की जाँच करें
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault की पहुँच सत्यापित करें
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडल परिनियोजन समस्याएँ

**लक्षण:**
- डिप्लॉयमेंट में मॉडल उपलब्ध नहीं
- विशिष्ट मॉडल संस्करण विफल हो रहे हैं

**समाधान:**
```bash
# क्षेत्र के अनुसार उपलब्ध मॉडल सूचीबद्ध करें
az cognitiveservices model list --location eastus

# bicep टेम्पलेट में मॉडल संस्करण अपडेट करें
# मॉडल की क्षमता आवश्यकताओं की जाँच करें
```

## उदाहरण टेम्पलेट

### बुनियादी चैट अनुप्रयोग

**रिपॉज़िटरी**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवाएँ**: Azure OpenAI + Cognitive Search + App Service

**त्वरित प्रारंभ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### दस्तावेज़ प्रसंस्करण पाइपलाइन

**रिपॉज़िटरी**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**सेवाएँ**: Document Intelligence + Storage + Functions

**त्वरित प्रारंभ**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG के साथ एंटरप्राइज़ चैट

**रिपॉज़िटरी**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवाएँ**: Azure OpenAI + Search + Container Apps + Cosmos DB

**त्वरित प्रारंभ**:
```bash
azd init --template contoso-chat
azd up
```

## अगले कदम

1. **उदाहरणों को आज़माएँ**: अपने उपयोग केस से मेल खाने वाले प्री-निर्मित टेम्पलेट से शुरू करें
2. **अपनी ज़रूरत के अनुसार अनुकूलित करें**: इन्फ्रास्ट्रक्चर और एप्लिकेशन कोड में संशोधन करें
3. **निगरानी जोड़ें**: समग्र ऑब्ज़र्वेबिलिटी लागू करें
4. **लागतों का अनुकूलन करें**: अपने बजट के अनुसार कॉन्फ़िगरेशन को ठीक करें
5. **अपने परिनियोजन को सुरक्षित करें**: एंटरप्राइज़ सुरक्षा पैटर्न लागू करें
6. **प्रोडक्शन तक स्केल करें**: बहु-रीजन और उच्च-उपलब्धता सुविधाएँ जोड़ें

## 🎯 हैंड्स-ऑन अभ्यास

### अभ्यास 1: Azure OpenAI चैट ऐप परिनियोजित करें (30 मिनट)
**लक्ष्य**: उत्पादन-तैयार AI चैट एप्लिकेशन को परिनियोजित और परीक्षण करें

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

# साफ़ करें
azd down --force --purge
```

**सफलता मानदंड:**
- [ ] डिप्लॉयमेंट कोटा त्रुटियों के बिना पूरा होता है
- [ ] ब्राउज़र में चैट इंटरफ़ेस तक पहुँच सकते हैं
- [ ] प्रश्न पूछ सकते हैं और AI-संचालित उत्तर प्राप्त कर सकते हैं
- [ ] Application Insights टेलीमेट्री डेटा दिखाता है
- [ ] संसाधनों को सफलतापूर्वक साफ़ किया गया

**अनुमानित लागत**: $5-10 for 30 minutes of testing

### अभ्यास 2: मल्टी-मॉडल परिनियोजन कॉन्फ़िगर करें (45 मिनट)
**लक्ष्य**: विभिन्न कॉन्फ़िगरेशनों के साथ कई AI मॉडल परिनियोजित करें

```bash
# कस्टम Bicep कॉन्फ़िगरेशन बनाएँ
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

# तैनात करें और सत्यापित करें
azd provision
azd show
```

**सफलता मानदंड:**
- [ ] कई मॉडल सफलतापूर्वक परिनियोजित हुए
- [ ] विभिन्न क्षमता सेटिंग्स लागू की गईं
- [ ] मॉडल API के माध्यम से सुलभ हैं
- [ ] एप्लिकेशन से दोनों मॉडल कॉल कर सकते हैं

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

# वर्तमान लागतों की जांच करें
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**सफलता मानदंड:**
- [ ] Azure में बजट अलर्ट बनाया गया
- [ ] ईमेल सूचनाएँ कॉन्फ़िगर की गईं
- [ ] Azure पोर्टल में लागत डेटा देख सकते हैं
- [ ] बजट थ्रेशहोल्ड उपयुक्त रूप से सेट किए गए

## 💡 अक्सर पूछे जाने वाले प्रश्न

<details>
<summary><strong>डेवलपमेंट के दौरान Azure OpenAI लागत कैसे कम करूँ?</strong></summary>

1. **Free Tier का उपयोग करें**: Azure OpenAI प्रति माह 50,000 टोकन मुफ्त प्रदान करता है
2. **क्षमता घटाएँ**: डेवलप के लिए क्षमता 30+ की बजाय 10 TPM सेट करें
3. **azd down का उपयोग करें**: जब सक्रिय रूप से डेवलप नहीं कर रहे हों तो संसाधनों को डिअलोकेट करें
4. **प्रतिक्रियाओं को कैश करें**: दोहराए गए प्रश्नों के लिए Redis कैश लागू करें
5. **प्रॉम्प्ट इंजीनियरिंग का उपयोग करें**: कुशल प्रॉम्प्ट से टोकन उपयोग कम करें

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
- Managed identity प्रमाणीकरण
- उच्चतर कोटा उपलब्ध

**OpenAI API**:
- नए मॉडलों तक तेज़ पहुँच
- सरल सेटअप
- प्रवेश के लिए कम बाधा
- सार्वजनिक इंटरनेट ही

प्रोडक्शन ऐप्स के लिए, **Azure OpenAI की सिफारिश की जाती है**।
</details>

<details>
<summary><strong>Azure OpenAI कोटा पार होने की त्रुटियों को मैं कैसे संभालूँ?</strong></summary>

```bash
# वर्तमान कोटा जांचें
az cognitiveservices usage list --location eastus2

# दूसरे क्षेत्र को आजमाएँ
azd env set AZURE_LOCATION westus2
azd up

# अस्थायी रूप से क्षमता कम करें
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वृद्धि का अनुरोध करें
# Azure पोर्टल पर जाएँ > कोटा > वृद्धि का अनुरोध करें
```
</details>

<details>
<summary><strong>क्या मैं अपने डेटा का उपयोग Azure OpenAI के साथ कर सकता हूँ?</strong></summary>

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

देखें [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) टेम्पलेट।
</details>

<details>
<summary><strong>मैं AI मॉडल एंडपॉइंट्स को कैसे सुरक्षित करूँ?</strong></summary>

**सर्वोत्तम अभ्यास**:
1. Managed Identity का उपयोग करें (कोई API कुंजी नहीं)
2. Private Endpoints सक्षम करें
3. नेटवर्क सुरक्षा समूह कॉन्फ़िगर करें
4. रेट लिमिटिंग लागू करें
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

## समुदाय और सहायता

- **Microsoft Foundry Discord**: [#Azure चैनल](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [इश्यूज़ और चर्चाएँ](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [आधिकारिक दस्तावेज़](https://learn.microsoft.com/azure/ai-studio/)

---

**अध्याय नेविगेशन:**
- **📚 Course Home**: [AZD शुरुआती के लिए](../../README.md)
- **📖 Current Chapter**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ Previous Chapter**: [अध्याय 1: आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI मॉडल परिनियोजन](ai-model-deployment.md)
- **🚀 Next Chapter**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

**मदद चाहिए?** हमारे समुदाय चर्चाओं में शामिल हों या रिपॉज़िटरी में एक इश्यू खोलें। Azure AI + AZD समुदाय आपकी सफलता में मदद करने के लिए यहाँ मौजूद है!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
इस दस्तावेज़ का अनुवाद एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। हम सटीकता के प्रति प्रयासरत हैं, लेकिन कृपया ध्यान रखें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल भाषा में उपलब्ध दस्तावेज़ को अधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->