# Microsoft Foundry चे AZD सह समाकलन

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 चालू प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील प्रकरण**: [प्रकरण 1: आपला पहिला प्रकल्प](../chapter-01-foundation/first-project.md)
- **➡️ पुढे**: [AI मॉडेल तैनात करणे](ai-model-deployment.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

## आढावा

हा मार्गदर्शक Microsoft Foundry सेवा Azure Developer CLI (AZD) सोबत कशाप्रकारे समाकलित करायचे आणि AI अनुप्रयोग तैनाती सुलभ कशी करायची हे दर्शवितो. Microsoft Foundry हे AI अनुप्रयोग तयार करणे, तैनात करणे आणि व्यवस्थापित करण्यासाठी एक सर्वसमावेशक व्यासपीठ प्रदान करते, तर AZD पूर्वसंचित पायाभूत सुविधा आणि तैनाती प्रक्रियेचे सुलभीकरण करते.

## Microsoft Foundry म्हणजे काय?

Microsoft Foundry ही Microsoft ची एक एकत्रित AI विकास व्यासपीठ आहे ज्यात समाविष्ट आहे:

- **मॉडेल कॅटलॉग**: अत्याधुनिक AI मॉडेल्सची उपलब्धता
- **Prompt Flow**: AI वर्कफ्लो साठी व्हिज्युअल डिझायनर
- **AI Foundry पोर्टल**: AI अनुप्रयोगांसाठी एकात्मिक विकास वातावरण
- **तैनात करण्याचे पर्याय**: होस्टिंग आणि स्केलिंगचे विविध पर्याय
- **सुरक्षा आणि जबाबदारी**: अंगभूत जबाबदार AI वैशिष्ट्ये

## AZD + Microsoft Foundry: एकत्रितपणे अधिक सक्षम

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | मॅन्युअल पोर्टल तैनाती | स्वयंचलित, पुनरावृत्तीयोग्य तैनाती |
| **Infrastructure** | क्लिक-थ्रू प्रोविजनिंग | Infrastructure as Code (Bicep) |
| **Environment Management** | एकल वातावरणावर लक्ष केंद्रित | मल्टी-पर्यावरण (dev/staging/prod) |
| **CI/CD Integration** | मर्यादित | नेटीव्ह GitHub Actions समर्थन |
| **Cost Management** | प्राथमिक मॉनिटरिंग | वातावरण-विशिष्ट खर्च अनुकूलन |

## पूर्वअट

- योग्य परवानग्यांसह Azure सबस्क्रिप्शन
- Azure Developer CLI स्थापित केलेले
- Azure OpenAI सेवा उपलब्धतेसाठी प्रवेश
- Microsoft Foundry ची प्राथमिक ओळख

## मुख्य समाकलन नमुने

### नमुना 1: Azure OpenAI समाकलन

**उपयोग प्रकरण**: Azure OpenAI मॉडेल्ससह चॅट अनुप्रयोग तैनात करा

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

### नमुना 2: AI Search + RAG समाकलन

**उपयोग प्रकरण**: retrieval-augmented generation (RAG) अनुप्रयोग तैनात करणे

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

### नमुना 3: Document Intelligence समाकलन

**उपयोग प्रकरण**: दस्तऐवज प्रक्रिया आणि विश्लेषण वर्कफ्लो

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
# मुख्य एआय सेवा
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# मॉडेल समायोजन
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# कार्यक्षमता सेटिंग्ज
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**विकास कॉन्फिगरेशन:**
```bash
# विकासासाठी खर्च-अनुकूल सेटिंग्ज
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

## तैनाती कार्यप्रवाह

### एकल कमांड तैनाती

```bash
# एकाच आदेशाने सर्वकाही तैनात करा
azd up

# किंवा क्रमशः तैनात करा
azd provision  # केवळ पायाभूत सुविधा
azd deploy     # केवळ अनुप्रयोग
```

### वातावरण-विशिष्ट तैनाती

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

## निरीक्षण आणि ऑबझर्वेबिलिटी

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

### Managed Identity कॉन्फिगरेशन

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

## कार्यक्षमतेचे अनुकूलन

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

## सामान्य समस्या निवारण

### समस्या 1: OpenAI कोटा ओलांडला

**लक्षणे:**
- तैनाती कोटा त्रुटींमुळे अयशस्वी होते
- अनुप्रयोग लॉगमध्ये 429 त्रुटी

**उपाय:**
```bash
# सध्याचा कोटा वापर तपासा
az cognitiveservices usage list --location eastus

# वेगळ्या प्रदेशाचा प्रयत्न करा
azd env set AZURE_LOCATION westus2
azd up

# क्षमता तात्पुरती कमी करा
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### समस्या 2: प्रमाणीकरण अयशस्वी

**लक्षणे:**
- AI सेवांना कॉल करताना 401/403 त्रुटी
- "Access denied" संदेश

**उपाय:**
```bash
# भूमिका नेमण्यांची पडताळणी करा
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# व्यवस्थापित ओळख कॉन्फिगरेशन तपासा
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# की वॉल्ट प्रवेशाची पडताळणी करा
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### समस्या 3: मॉडेल तैनाती समस्या

**लक्षणे:**
- तैनात केलेले मॉडेल उपलब्ध नाहीत
- विशिष्ट मॉडेल आवृत्त्या अयशस्वी होणे

**उपाय:**
```bash
# प्रदेशानुसार उपलब्ध मॉडेलची यादी करा
az cognitiveservices model list --location eastus

# bicep टेम्पलेटमधील मॉडेल आवृत्ती अद्ययावत करा
# मॉडेलसाठी क्षमतेच्या आवश्यकतांची तपासणी करा
```

## उदाहरण टेम्पलेट्स

### मूलभूत चॅट अनुप्रयोग

**रिपॉझिटरी**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**सेवा**: Azure OpenAI + Cognitive Search + App Service

**त्वरित प्रारंभ**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### दस्तऐवज प्रक्रिया पाईपलाइन

**रिपॉझिटरी**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**सेवा**: Document Intelligence + Storage + Functions

**त्वरित प्रारंभ**:
```bash
azd init --template ai-document-processing
azd up
```

### एंटरप्राइझ चॅट with RAG

**रिपॉझिटरी**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**सेवा**: Azure OpenAI + Search + Container Apps + Cosmos DB

**त्वरित प्रारंभ**:
```bash
azd init --template contoso-chat
azd up
```

## पुढील पावले

1. **उदाहरण वापरून पहा**: आपल्या उपयोग प्रकरणाशी जुळणारा प्री-बिल्ट टेम्पलेट वापरून सुरू करा
2. **आपल्या गरजेनुसार सानुकूल करा**: इन्फ्रास्ट्रक्चर आणि अनुप्रयोग कोडमध्ये बदल करा
3. **निगराणी जोडा**: व्यापक ऑबझर्वेबिलिटी अंमलात आणा
4. **खर्च अनुकूल करा**: आपल्या बजेटसाठी कॉन्फिगरेशन समायोजित करा
5. **आपली तैनात सुरक्षित करा**: एंटरप्राइझ सुरक्षा पॅटर्न लागू करा
6. **उत्पादनासाठी स्केल करा**: मल्टी-रिजन आणि उच्च-उपलब्धता वैशिष्ट्ये जोडा

## 🎯 व्यावहारिक व्यायाम

### व्यायाम 1: Azure OpenAI चॅट अ‍ॅप तैनात करा (30 मिनिटे)
**उद्दिष्ट**: उत्पादन-तयार AI चॅट अनुप्रयोग तैनात करा आणि चाचणी करा

```bash
# टेम्पलेट प्रारंभ करा
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# पर्यावरणीय चल सेट करा
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# तैनात करा
azd up

# अर्जाची चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# कृत्रिम बुद्धिमत्तेच्या कार्यांची देखरेख करा
azd monitor

# साफ करा
azd down --force --purge
```

**यश निकष:**
- [ ] तैनाती कोटा त्रुटीशिवाय पूर्ण होते
- [ ] ब्राउझरमध्ये चॅट इंटरफेसमध्ये प्रवेश करता येतो
- [ ] प्रश्न विचारू शकता आणि AI-चालित प्रत्ये उत्तरे मिळतात
- [ ] Application Insights मध्ये टेलेमेट्री डेटा दिसतो
- [ ] संसाधने यशस्वीरीत्या क्लीनअप केल्या गेल्या

**अंदाजित खर्च**: $5-10 (30 मिनिटांच्या चाचणीसाठी)

### व्यायाम 2: मल्टी-मॉडेल तैनाती कॉन्फिगर करा (45 मिनिटे)
**उद्दिष्ट**: वेगवेगळ्या कॉन्फिगरेशनसह एकाधिक AI मॉडेल तैनात करा

```bash
# सानुकूल Bicep कॉन्फिगरेशन तयार करा
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

**यश निकष:**
- [ ] एकाधिक मॉडेल्स यशस्वीरीत्या तैनात केल्या गेल्या
- [ ] भिन्न क्षमता सेटिंग्ज लागू केल्या गेल्या
- [ ] मॉडेल्स API द्वारे उपलब्ध आहेत
- [ ] अनुप्रयोगातून दोन्ही मॉडेल्सला कॉल करता येतो

### व्यायाम 3: खर्च निरीक्षण अंमलात आणा (20 मिनिटे)
**उद्दिष्ट**: बजेट अलर्ट्स आणि खर्च ट्रॅकिंग सेट करा

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

# सध्याचे खर्च तपासा
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**यश निकष:**
- [ ] Azure मध्ये बजेट अलर्ट तयार झाले
- [ ] ईमेल नोटिफिकेशन्स कॉन्फिगर केल्या गेल्या
- [ ] Azure पोर्टलमध्ये खर्च डेटा पाहता येतो
- [ ] बजेट थ्रेशहोल्ड योग्यरित्या सेट केले गेले

## 💡 वारंवार विचारले जाणारे प्रश्न

<details>
<summary><strong>विकास दरम्यान Azure OpenAI खर्च कसा कमी करावा?</strong></summary>

1. **फ्री टियर वापरा**: Azure OpenAI प्रति महिना 50,000 टोकन्स मोफत देते
2. **क्षमता कमी करा**: विकासासाठी क्षमता 30+ ऐवजी 10 TPM वर सेट करा
3. **azd down वापरा**: सक्रियपणे विकसित न करताना संसाधने डीअलोकेट करा
4. **प्रतिक्रिया कॅश करा**: पुनरावृत्ती प्रश्नांसाठी Redis कॅश अमलात आणा
5. **प्रॉम्प्ट इंजीनियरिंग वापरा**: कार्यक्षम प्रॉम्प्टसह टोकन वापर कमी करा

```bash
# विकास कॉन्फिगरेशन
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Azure OpenAI आणि OpenAI API मध्ये फरक काय आहे?</strong></summary>

**Azure OpenAI**:
- एंटरप्राइझ सुरक्षा आणि अनुपालन
- खासगी नेटवर्क समाकलन
- SLA हमी
- Managed Identity प्रमाणीकरण
- उच्च कोटा उपलब्ध

**OpenAI API**:
- नवीन मॉडेल्ससाठी वेगवान प्रवेश
- साधी सेटअप प्रक्रिया
- प्रवेश करण्याची कमी अडचण
- सार्वजनिक इंटरनेटद्वारेच

उत्पादन अनुप्रयोगांसाठी, **Azure OpenAI शिफारसीय आहे**.
</details>

<details>
<summary><strong>Azure OpenAI कोटा ओलांडलेल्या त्रुटी कशा हाताळायच्या?</strong></summary>

```bash
# सध्याचा कोटा तपासा
az cognitiveservices usage list --location eastus2

# इतर प्रदेश वापरून पहा
azd env set AZURE_LOCATION westus2
azd up

# क्षमता तात्पुरती कमी करा
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# कोटा वाढविण्याची विनंती करा
# Azure पोर्टल > कोटा > वाढीसाठी विनंती करा
```
</details>

<details>
<summary><strong>मी माझे स्वतःचे डेटा Azure OpenAI सोबत वापरू शकतो का?</strong></summary>

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
<summary><strong>AI मॉडेल एंडपॉइंट्स कसे सुरक्षित करावे?</strong></summary>

**उत्तम पद्धती**:
1. Managed Identity वापरा (API की न वापरा)
2. Private Endpoints सक्षम करा
3. नेटवर्क सुरक्षा गट कॉन्फिगर करा
4. रेट लिमिटिंग लागू करा
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
- **AZD GitHub**: [इश्यू आणि चर्चासत्र](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [अधिकृत दस्तऐवजीकरण](https://learn.microsoft.com/azure/ai-studio/)

---

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD For Beginners](../../README.md)
- **📖 चालू प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील प्रकरण**: [प्रकरण 1: आपला पहिला प्रकल्प](../chapter-01-foundation/first-project.md)
- **➡️ पुढे**: [AI मॉडेल तैनात करणे](ai-model-deployment.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

**मदत हवी आहे का?** आमच्या समुदाय चर्चेत सामील व्हा किंवा रिपॉझिटरीमध्ये एक इश्यू उघडा. Azure AI + AZD समुदाय आपले यश सुनिश्चित करण्यासाठी येथे आहे!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज एआय अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो; तरीही कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेशी संबंधित त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेतच अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थनिर्देशांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->