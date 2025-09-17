<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T23:11:39+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "sw"
}
-->
# Azure AI Foundry Ujumuishaji na AZD

**Iliyopita:** [Mradi wa Kwanza](../getting-started/first-project.md) | **Inayofuata:** [Uwekaji wa Modeli ya AI](ai-model-deployment.md)

## Muhtasari

Mwongozo huu unaonyesha jinsi ya kuunganisha huduma za Azure AI Foundry na Azure Developer CLI (AZD) kwa urahisi wa uwekaji wa programu za AI. Azure AI Foundry inatoa jukwaa kamili la kujenga, kuweka, na kusimamia programu za AI, huku AZD ikirahisisha mchakato wa miundombinu na uwekaji.

## Azure AI Foundry ni nini?

Azure AI Foundry ni jukwaa la Microsoft lililounganishwa kwa maendeleo ya AI linalojumuisha:

- **Model Catalog**: Ufikiaji wa modeli za AI za kisasa
- **Prompt Flow**: Muundaji wa kuona wa mtiririko wa kazi za AI
- **AI Foundry Portal**: Mazingira ya maendeleo yaliyounganishwa kwa programu za AI
- **Chaguo za Uwekaji**: Chaguo nyingi za kuhifadhi na kupanua
- **Usalama na Ulinzi**: Vipengele vya AI vinavyowajibika vilivyojengwa ndani

## AZD + Azure AI Foundry: Pamoja ni Bora

| Kipengele | Azure AI Foundry | Faida ya Ujumuishaji wa AZD |
|-----------|------------------|----------------------------|
| **Uwekaji wa Modeli** | Uwekaji wa mwongozo kupitia portal | Uwekaji wa kiotomatiki, unaorudiwa |
| **Miundombinu** | Utoaji wa rasilimali kwa kubofya | Miundombinu kama Msimbo (Bicep) |
| **Usimamizi wa Mazingira** | Kuzingatia mazingira moja | Mazingira mengi (dev/staging/prod) |
| **Ujumuishaji wa CI/CD** | Ujumuishaji mdogo | Msaada wa asili wa GitHub Actions |
| **Usimamizi wa Gharama** | Ufuatiliaji wa msingi | Uboreshaji wa gharama maalum kwa mazingira |

## Mahitaji ya Awali

- Usajili wa Azure wenye ruhusa zinazofaa
- Azure Developer CLI imewekwa
- Ufikiaji wa huduma za Azure OpenAI
- Uelewa wa msingi wa Azure AI Foundry

## Mifumo ya Msingi ya Ujumuishaji

### Mfumo 1: Ujumuishaji wa Azure OpenAI

**Matumizi**: Weka programu za mazungumzo na modeli za Azure OpenAI

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

**Miundombinu (main.bicep):**
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

### Mfumo 2: AI Search + Ujumuishaji wa RAG

**Matumizi**: Weka programu za kizazi kilichoongezwa na urejeshaji (RAG)

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

### Mfumo 3: Ujumuishaji wa Ujasusi wa Nyaraka

**Matumizi**: Mtiririko wa kazi wa uchakataji na uchambuzi wa nyaraka

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

## 🔧 Mifumo ya Usanidi

### Usanidi wa Vigezo vya Mazingira

**Usanidi wa Uzalishaji:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Usanidi wa Maendeleo:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Usanidi Salama na Key Vault

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

## Mtiririko wa Uwekaji

### Uwekaji kwa Amri Moja

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Uwekaji Maalum kwa Mazingira

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Ufuatiliaji na Uangalizi

### Ujumuishaji wa Application Insights

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

### Ufuatiliaji wa Gharama

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

## 🔐 Mazoea Bora ya Usalama

### Usanidi wa Managed Identity

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

### Usalama wa Mtandao

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

## Uboreshaji wa Utendaji

### Mikakati ya Kuhifadhi Kache

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

### Usanidi wa Upanuzi wa Kiotomatiki

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

## Utatuzi wa Masuala ya Kawaida

### Tatizo 1: Kiwango cha OpenAI Kimezidi

**Dalili:**
- Uwekaji unashindwa na makosa ya kiwango
- Makosa ya 429 kwenye magogo ya programu

**Suluhisho:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Tatizo 2: Kushindwa kwa Uthibitishaji

**Dalili:**
- Makosa ya 401/403 wakati wa kupiga huduma za AI
- Ujumbe wa "Ufikiaji umekataliwa"

**Suluhisho:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Tatizo 3: Masuala ya Uwekaji wa Modeli

**Dalili:**
- Modeli hazipatikani katika uwekaji
- Toleo maalum la modeli linashindwa

**Suluhisho:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Violezo vya Mfano

### Programu ya Mazungumzo ya Msingi

**Hifadhi**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Huduma**: Azure OpenAI + Cognitive Search + App Service

**Kuanza Haraka**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Mtiririko wa Uchakataji wa Nyaraka

**Hifadhi**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Huduma**: Ujasusi wa Nyaraka + Hifadhi + Functions

**Kuanza Haraka**:
```bash
azd init --template ai-document-processing
azd up
```

### Mazungumzo ya Biashara na RAG

**Hifadhi**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Huduma**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Kuanza Haraka**:
```bash
azd init --template contoso-chat
azd up
```

## Hatua Zifuatazo

1. **Jaribu Mifano**: Anza na kiolezo kilichojengwa tayari kinacholingana na matumizi yako
2. **Badilisha kwa Mahitaji Yako**: Rekebisha miundombinu na msimbo wa programu
3. **Ongeza Ufuatiliaji**: Tekeleza uangalizi wa kina
4. **Boresha Gharama**: Rekebisha usanidi kwa bajeti yako
5. **Linda Uwekaji Wako**: Tekeleza mifumo ya usalama ya biashara
6. **Panua hadi Uzalishaji**: Ongeza vipengele vya mikoa mingi na upatikanaji wa hali ya juu

## Jamii na Usaidizi

- **Azure AI Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Masuala na majadiliano](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Nyaraka rasmi](https://learn.microsoft.com/azure/ai-studio/)

---

**Iliyopita:** [Mradi wa Kwanza](../getting-started/first-project.md) | **Inayofuata:** [Uwekaji wa Modeli ya AI](ai-model-deployment.md)

**Unahitaji Msaada?** Jiunge na majadiliano ya jamii yetu au fungua suala kwenye hifadhi. Jamii ya Azure AI + AZD iko hapa kukusaidia kufanikiwa!

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.