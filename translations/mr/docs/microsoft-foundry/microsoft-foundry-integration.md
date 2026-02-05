# Microsoft Foundry आणि AZD यांचे एकत्रीकरण

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 चालू प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील प्रकरण**: [प्रकरण 1: तुमचा पहिला प्रकल्प](../getting-started/first-project.md)
- **➡️ पुढे**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../getting-started/configuration.md)

## आढावा

ही मार्गदर्शिका Microsoft Foundry सेवा Azure Developer CLI (AZD) सह कसे एकत्र करायचे हे दाखवते, ज्यामुळे AI अनुप्रयोग डिप्लॉयमेंट अधिक सुलभ होते. Microsoft Foundry AI अनुप्रयोग तयार करणे, डिप्लॉय करणे आणि व्यवस्थापित करण्यासाठी एक व्यापक प्लॅटफॉर्म प्रदान करते, तर AZD पायाभूत सुविधा आणि डिप्लॉयमेंट प्रक्रिया सुलभ करते.

## Microsoft Foundry म्हणजे काय?

Microsoft Foundry हा AI विकासासाठी Microsoft चा एकत्रित प्लॅटफॉर्म आहे, ज्यामध्ये समाविष्ट आहे:

- **मॉडेल कॅटलॉग**: अत्याधुनिक AI मॉडेल्सचा प्रवेश
- **प्रॉम्प्ट फ्लो**: AI वर्कफ्लो साठी व्हिज्युअल डिझायनर
- **AI Foundry पोर्टल**: AI अनुप्रयोगांसाठी एकात्मिक विकास वातावरण
- **डिप्लॉयमेंट पर्याय**: होस्टिंग आणि स्केलिंगसाठी अनेक पर्याय
- **सुरक्षा आणि सुरक्षितता**: जबाबदार AI वैशिष्ट्ये अंगभूत

## AZD + Microsoft Foundry: एकत्रित फायदे

| वैशिष्ट्य | Microsoft Foundry | AZD एकत्रीकरणाचा फायदा |
|-----------|-------------------|------------------------|
| **मॉडेल डिप्लॉयमेंट** | मॅन्युअल पोर्टल डिप्लॉयमेंट | स्वयंचलित, पुनरावृत्तीक्षम डिप्लॉयमेंट |
| **पायाभूत सुविधा** | क्लिक-थ्रू प्रोव्हिजनिंग | Infrastructure as Code (Bicep) |
| **पर्यावरण व्यवस्थापन** | एकल पर्यावरणावर लक्ष केंद्रित | बहु-पर्यावरण (डेव्ह/स्टेजिंग/प्रॉड) |
| **CI/CD एकत्रीकरण** | मर्यादित | नेटिव्ह GitHub Actions समर्थन |
| **खर्च व्यवस्थापन** | मूलभूत मॉनिटरिंग | पर्यावरण-विशिष्ट खर्च ऑप्टिमायझेशन |

## पूर्वअट

- योग्य परवान्यांसह Azure सदस्यता
- Azure Developer CLI स्थापित
- Azure OpenAI सेवांमध्ये प्रवेश
- Microsoft Foundry ची मूलभूत ओळख

## मुख्य एकत्रीकरण नमुने

### नमुना 1: Azure OpenAI एकत्रीकरण

**वापर प्रकरण**: Azure OpenAI मॉडेल्ससह चॅट अनुप्रयोग डिप्लॉय करा

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

**पायाभूत सुविधा (main.bicep):**
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

### नमुना 2: AI शोध + RAG एकत्रीकरण

**वापर प्रकरण**: Retrieval-Augmented Generation (RAG) अनुप्रयोग डिप्लॉय करा

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

**वापर प्रकरण**: दस्तऐवज प्रक्रिया आणि विश्लेषण वर्कफ्लो

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

### पर्यावरणीय व्हेरिएबल्स सेटअप

**उत्पादन कॉन्फिगरेशन:**
```bash
# मुख्य AI सेवा
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

**विकसनशील कॉन्फिगरेशन:**
```bash
# विकासासाठी खर्च-ऑप्टिमाइझ केलेल्या सेटिंग्ज
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # मोफत स्तर
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

## डिप्लॉयमेंट वर्कफ्लो

### सिंगल कमांड डिप्लॉयमेंट

```bash
# एकाच आदेशाने सर्वकाही तैनात करा
azd up

# किंवा टप्प्याटप्प्याने तैनात करा
azd provision  # फक्त पायाभूत सुविधा
azd deploy     # फक्त अनुप्रयोग
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

## मॉनिटरिंग आणि निरीक्षण

### Application Insights एकत्रीकरण

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

### खर्च मॉनिटरिंग

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

### समस्या 1: OpenAI कोटा ओलांडला

**लक्षणे:**
- कोटा त्रुटींसह डिप्लॉयमेंट अयशस्वी
- अनुप्रयोग लॉगमध्ये 429 त्रुटी

**उपाय:**
```bash
# वर्तमान कोटा वापर तपासा
az cognitiveservices usage list --location eastus

# वेगळ्या प्रदेशाचा प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# तात्पुरते क्षमता कमी करा
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण अयशस्वी

**लक्षणे:**
- AI सेवांना कॉल करताना 401/403 त्रुटी
- "प्रवेश नाकारला" संदेश

**उपाय:**
```bash
# भूमिका असाइनमेंट सत्यापित करा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# व्यवस्थापित ओळख कॉन्फिगरेशन तपासा
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# की व्हॉल्ट प्रवेश सत्यापित करा
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडेल डिप्लॉयमेंट समस्या

**लक्षणे:**
- डिप्लॉयमेंटमध्ये मॉडेल्स उपलब्ध नाहीत
- विशिष्ट मॉडेल आवृत्त्या अयशस्वी

**उपाय:**
```bash
# प्रदेशानुसार उपलब्ध मॉडेल्सची यादी करा
az cognitiveservices model list --location eastus

# बायसेप टेम्पलेटमध्ये मॉडेल आवृत्ती अद्यतनित करा
# मॉडेल क्षमता आवश्यकता तपासा
```

## उदाहरण टेम्पलेट्स

### मूलभूत चॅट अनुप्रयोग

**संग्रह**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवा**: Azure OpenAI + Cognitive Search + App Service

**जलद प्रारंभ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### दस्तऐवज प्रक्रिया पाइपलाइन

**संग्रह**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**सेवा**: Document Intelligence + Storage + Functions

**जलद प्रारंभ**:
```bash
azd init --template ai-document-processing
azd up
```

### RAG सह एंटरप्राइझ चॅट

**संग्रह**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवा**: Azure OpenAI + Search + Container Apps + Cosmos DB

**जलद प्रारंभ**:
```bash
azd init --template contoso-chat
azd up
```

## पुढील पावले

1. **उदाहरणे वापरा**: तुमच्या वापर प्रकरणाशी जुळणाऱ्या पूर्व-निर्मित टेम्पलेटसह प्रारंभ करा
2. **तुमच्या गरजांसाठी सानुकूलित करा**: पायाभूत सुविधा आणि अनुप्रयोग कोड सुधारित करा
3. **मॉनिटरिंग जोडा**: व्यापक निरीक्षण अंमलात आणा
4. **खर्च ऑप्टिमाइझ करा**: तुमच्या बजेटसाठी कॉन्फिगरेशन सुधारित करा
5. **तुमचे डिप्लॉयमेंट सुरक्षित करा**: एंटरप्राइझ सुरक्षा नमुने अंमलात आणा
6. **उत्पादनासाठी स्केल करा**: मल्टी-रीजन आणि उच्च-उपलब्धता वैशिष्ट्ये जोडा

## 🎯 प्रायोगिक सराव

### सराव 1: Azure OpenAI चॅट अनुप्रयोग डिप्लॉय करा (30 मिनिटे)
**उद्दिष्ट**: उत्पादन-तयार AI चॅट अनुप्रयोग डिप्लॉय करा आणि चाचणी करा

```bash
# टेम्पलेट प्रारंभ करा
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरण व्हेरिएबल्स सेट करा
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# तैनात करा
azd up

# अनुप्रयोगाची चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# एआय ऑपरेशन्सचे निरीक्षण करा
azd monitor

# साफ करा
azd down --force --purge
```

**यशस्वी निकष:**
- [ ] डिप्लॉयमेंट कोटा त्रुटीशिवाय पूर्ण होते
- [ ] ब्राउझरमध्ये चॅट इंटरफेस प्रवेशयोग्य आहे
- [ ] प्रश्न विचारू शकतो आणि AI-चालित प्रतिसाद मिळवू शकतो
- [ ] Application Insights टेलिमेट्री डेटा दर्शवते
- [ ] संसाधने यशस्वीरित्या साफ केली

**अंदाजे खर्च**: 30 मिनिटांच्या चाचणीसाठी $5-10

### सराव 2: मल्टी-मॉडेल डिप्लॉयमेंट कॉन्फिगर करा (45 मिनिटे)
**उद्दिष्ट**: वेगवेगळ्या कॉन्फिगरेशनसह एकाधिक AI मॉडेल्स डिप्लॉय करा

```bash
# सानुकूल बायसेप कॉन्फिगरेशन तयार करा
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

# तैनात करा आणि सत्यापित करा
azd provision
azd show
```

**यशस्वी निकष:**
- [ ] एकाधिक मॉडेल्स यशस्वीरित्या डिप्लॉय झाले
- [ ] वेगवेगळ्या क्षमता सेटिंग्ज लागू केल्या
- [ ] API द्वारे मॉडेल्स प्रवेशयोग्य आहेत
- [ ] अनुप्रयोगातून दोन्ही मॉडेल्सला कॉल करू शकतो

### सराव 3: खर्च मॉनिटरिंग अंमलात आणा (20 मिनिटे)
**उद्दिष्ट**: बजेट अलर्ट आणि खर्च ट्रॅकिंग सेट करा

```bash
# बाइसपसाठी बजेट अलर्ट जोडा
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
- [ ] Azure मध्ये बजेट अलर्ट तयार केला
- [ ] ईमेल सूचना कॉन्फिगर केल्या
- [ ] Azure पोर्टलमध्ये खर्च डेटा पाहू शकतो
- [ ] बजेट मर्यादा योग्यरित्या सेट केल्या

## 💡 वारंवार विचारले जाणारे प्रश्न

<details>
<summary><strong>विकसनशीलतेदरम्यान Azure OpenAI खर्च कसा कमी करायचा?</strong></summary>

1. **फ्री टियर वापरा**: Azure OpenAI दरमहा 50,000 टोकन्स मोफत देते
2. **क्षमता कमी करा**: विकासासाठी 30+ ऐवजी 10 TPM वर सेट करा
3. **azd down वापरा**: सक्रिय विकास करत नसताना संसाधने डीलोकेट करा
4. **प्रतिक्रिया कॅश करा**: पुनरावृत्ती क्वेरींसाठी Redis कॅश अंमलात आणा
5. **प्रॉम्प्ट इंजिनिअरिंग वापरा**: कार्यक्षम प्रॉम्प्टसह टोकन वापर कमी करा

```bash
# विकास कॉन्फिगरेशन
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI आणि OpenAI API यामध्ये काय फरक आहे?</strong></summary>

**Azure OpenAI**:
- एंटरप्राइझ सुरक्षा आणि अनुपालन
- खाजगी नेटवर्क एकत्रीकरण
- SLA हमी
- व्यवस्थापित ओळख प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नवीन मॉडेल्ससाठी जलद प्रवेश
- सोपी सेटअप
- प्रवेशाची कमी अडथळा
- सार्वजनिक इंटरनेट फक्त

उत्पादन अनुप्रयोगांसाठी, **Azure OpenAI शिफारस केली जाते**.
</details>

<details>
<summary><strong>Azure OpenAI कोटा ओलांडल्याच्या त्रुटी कशा हाताळायच्या?</strong></summary>

```bash
# वर्तमान कोटा तपासा
az cognitiveservices usage list --location eastus2

# वेगळ्या प्रदेशाचा प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# तात्पुरते क्षमता कमी करा
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वाढीची विनंती करा
# Azure पोर्टल > कोटा > वाढीची विनंती येथे जा
```
</details>

<details>
<summary><strong>मी Azure OpenAI सह माझा स्वतःचा डेटा वापरू शकतो का?</strong></summary>

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
<summary><strong>AI मॉडेल एंडपॉइंट्स कसे सुरक्षित करायचे?</strong></summary>

**सर्वोत्तम पद्धती**:
1. व्यवस्थापित ओळख वापरा (API की नाही)
2. खाजगी एंडपॉइंट्स सक्षम करा
3. नेटवर्क सुरक्षा गट कॉन्फिगर करा
4. दर मर्यादा अंमलात आणा
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
- **AZD GitHub**: [समस्या आणि चर्चा](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [अधिकृत दस्तऐवज](https://learn.microsoft.com/azure/ai-studio/)

---

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 चालू प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील प्रकरण**: [प्रकरण 1: तुमचा पहिला प्रकल्प](../getting-started/first-project.md)
- **➡️ पुढे**: [AI मॉडेल डिप्लॉयमेंट](ai-model-deployment.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../getting-started/configuration.md)

**मदतीची गरज आहे?** आमच्या समुदाय चर्चांमध्ये सामील व्हा किंवा रेपॉजिटरीमध्ये समस्या उघडा. Azure AI + AZD समुदाय तुम्हाला यशस्वी होण्यासाठी येथे आहे!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरे त्रुटी किंवा अचूकतेच्या अभावाने युक्त असू शकतात. मूळ भाषेतील दस्तऐवज अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->