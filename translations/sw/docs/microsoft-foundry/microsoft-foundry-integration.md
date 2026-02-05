# Microsoft Foundry Uunganishaji na AZD

**Urambazaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI Kwanza
- **⬅️ Sura Iliyopita**: [Sura ya 1: Mradi Wako wa Kwanza](../getting-started/first-project.md)
- **➡️ Inayofuata**: [Uwekaji wa Modeli ya AI](ai-model-deployment.md)
- **🚀 Sura Inayofuata**: [Sura ya 3: Usanidi](../getting-started/configuration.md)

## Muhtasari

Mwongozo huu unaonyesha jinsi ya kuunganisha huduma za Microsoft Foundry na Azure Developer CLI (AZD) kwa uwekaji wa programu za AI ulio rahisi. Microsoft Foundry inatoa jukwaa kamili la kujenga, kuweka, na kusimamia programu za AI, huku AZD ikirahisisha mchakato wa miundombinu na uwekaji.

## Microsoft Foundry ni nini?

Microsoft Foundry ni jukwaa la Microsoft lililounganishwa kwa maendeleo ya AI linalojumuisha:

- **Katalogi ya Modeli**: Ufikiaji wa modeli za AI za hali ya juu
- **Prompt Flow**: Mbunifu wa kuona kwa mtiririko wa kazi za AI
- **Portal ya AI Foundry**: Mazingira ya maendeleo yaliyounganishwa kwa programu za AI
- **Chaguo za Uwekaji**: Chaguo nyingi za mwenyeji na upanuzi
- **Usalama na Ulinzi**: Vipengele vya AI vinavyowajibika vilivyojengwa ndani

## AZD + Microsoft Foundry: Bora Pamoja

| Kipengele | Microsoft Foundry | Faida ya Uunganishaji wa AZD |
|-----------|-------------------|-----------------------------|
| **Uwekaji wa Modeli** | Uwekaji wa portal wa mwongozo | Uwekaji wa kiotomatiki, unaoweza kurudiwa |
| **Miundombinu** | Utoaji wa rasilimali kwa kubofya | Miundombinu kama Msimbo (Bicep) |
| **Usimamizi wa Mazingira** | Kuzingatia mazingira moja | Mazingira mengi (dev/staging/prod) |
| **Uunganishaji wa CI/CD** | Mdogo | Msaada wa asili wa GitHub Actions |
| **Usimamizi wa Gharama** | Ufuatiliaji wa msingi | Uboreshaji wa gharama maalum kwa mazingira |

## Mahitaji ya Awali

- Usajili wa Azure na ruhusa zinazofaa
- Azure Developer CLI imewekwa
- Ufikiaji wa huduma za Azure OpenAI
- Uelewa wa msingi wa Microsoft Foundry

## Mifumo ya Msingi ya Uunganishaji

### Mfumo 1: Uunganishaji wa Azure OpenAI

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

### Mfumo 2: AI Search + Uunganishaji wa RAG

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

### Mfumo 3: Uunganishaji wa Akili ya Nyaraka

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
# Huduma kuu za AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Usanidi wa mifano
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Mipangilio ya utendaji
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Usanidi wa Maendeleo:**
```bash
# Mipangilio ya gharama nafuu kwa maendeleo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Kiwango cha bure
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

### Uwekaji wa Amri Moja

```bash
# Tuma kila kitu kwa amri moja
azd up

# Au tuma hatua kwa hatua
azd provision  # Miundombinu pekee
azd deploy     # Programu pekee
```

### Uwekaji Maalum kwa Mazingira

```bash
# Mazingira ya maendeleo
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Mazingira ya uzalishaji
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Ufuatiliaji na Uangalizi

### Uunganishaji wa Application Insights

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

### Usanidi wa Utambulisho Ulio Simamiwa

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

### Mikakati ya Kuhifadhi

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

### Usanidi wa Kujiendesha

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

### Tatizo 1: Kiwango cha Azure OpenAI Kimezidi

**Dalili:**
- Uwekaji unashindwa na makosa ya kiwango
- Makosa ya 429 kwenye kumbukumbu za programu

**Suluhisho:**
```bash
# Angalia matumizi ya kiwango cha sasa
az cognitiveservices usage list --location eastus

# Jaribu eneo tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa muda
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Tatizo 2: Kushindwa kwa Uthibitishaji

**Dalili:**
- Makosa ya 401/403 wakati wa kupiga huduma za AI
- Ujumbe wa "Ufikiaji umekataliwa"

**Suluhisho:**
```bash
# Thibitisha mgawanyo wa majukumu
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Angalia usanidi wa utambulisho unaosimamiwa
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Thibitisha ufikiaji wa Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Tatizo 3: Masuala ya Uwekaji wa Modeli

**Dalili:**
- Modeli hazipatikani katika uwekaji
- Toleo maalum la modeli linashindwa

**Suluhisho:**
```bash
# Orodhesha mifano inayopatikana kwa eneo
az cognitiveservices model list --location eastus

# Sasisha toleo la mfano katika kiolezo cha bicep
# Angalia mahitaji ya uwezo wa mfano
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

**Huduma**: Akili ya Nyaraka + Hifadhi + Kazi

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
6. **Panua hadi Uzalishaji**: Ongeza vipengele vya maeneo mengi na upatikanaji wa hali ya juu

## 🎯 Mazoezi ya Vitendo

### Zoezi 1: Weka Programu ya Mazungumzo ya Azure OpenAI (Dakika 30)
**Lengo**: Weka na jaribu programu ya mazungumzo ya AI iliyo tayari kwa uzalishaji

```bash
# Anzisha kiolezo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Weka vigezo vya mazingira
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Peleka
azd up

# Jaribu programu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Fuatilia shughuli za AI
azd monitor

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Uwekaji unakamilika bila makosa ya kiwango
- [ ] Unaweza kufikia kiolesura cha mazungumzo kwenye kivinjari
- [ ] Unaweza kuuliza maswali na kupata majibu yanayotokana na AI
- [ ] Application Insights inaonyesha data ya telemetry
- [ ] Rasilimali zimesafishwa kwa mafanikio

**Gharama Inayokadiriwa**: $5-10 kwa dakika 30 za majaribio

### Zoezi 2: Sanidi Uwekaji wa Modeli Nyingi (Dakika 45)
**Lengo**: Weka modeli nyingi za AI na usanidi tofauti

```bash
# Unda usanidi wa Bicep maalum
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

# Peleka na thibitisha
azd provision
azd show
```

**Vigezo vya Mafanikio:**
- [ ] Modeli nyingi zimewekwa kwa mafanikio
- [ ] Mipangilio tofauti ya uwezo imetumika
- [ ] Modeli zinapatikana kupitia API
- [ ] Unaweza kupiga modeli zote kutoka kwa programu

### Zoezi 3: Tekeleza Ufuatiliaji wa Gharama (Dakika 20)
**Lengo**: Sanidi arifa za bajeti na ufuatiliaji wa gharama

```bash
# Ongeza arifa ya bajeti kwa Bicep
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

# Peleka arifa ya bajeti
azd provision

# Angalia gharama za sasa
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Vigezo vya Mafanikio:**
- [ ] Arifa ya bajeti imeundwa katika Azure
- [ ] Arifa za barua pepe zimesanidiwa
- [ ] Unaweza kuona data ya gharama katika Portal ya Azure
- [ ] Viwango vya bajeti vimesanidiwa ipasavyo

## 💡 Maswali Yanayoulizwa Mara kwa Mara

<details>
<summary><strong>Jinsi ya kupunguza gharama za Azure OpenAI wakati wa maendeleo?</strong></summary>

1. **Tumia Kiwango cha Bure**: Azure OpenAI inatoa tokeni 50,000/mwezi bure
2. **Punguza Uwezo**: Weka uwezo wa 10 TPM badala ya 30+ kwa maendeleo
3. **Tumia azd down**: Ondoa rasilimali wakati hauendelezi kikamilifu
4. **Hifadhi Majibu**: Tekeleza hifadhi ya Redis kwa maswali yanayorudiwa
5. **Tumia Uhandisi wa Prompt**: Punguza matumizi ya tokeni kwa maelezo bora

```bash
# Usanidi wa maendeleo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Tofauti kati ya Azure OpenAI na OpenAI API ni nini?</strong></summary>

**Azure OpenAI**:
- Usalama wa biashara na uzingatiaji
- Uunganishaji wa mtandao wa kibinafsi
- Dhamana za SLA
- Uthibitishaji wa utambulisho ulio simamiwa
- Viwango vya juu vinapatikana

**OpenAI API**:
- Ufikiaji wa haraka wa modeli mpya
- Usanidi rahisi
- Kizuizi cha kuingia cha chini
- Mtandao wa umma pekee

Kwa programu za uzalishaji, **Azure OpenAI inapendekezwa**.
</details>

<details>
<summary><strong>Jinsi ya kushughulikia makosa ya kiwango cha Azure OpenAI?</strong></summary>

```bash
# Angalia kiwango cha sasa
az cognitiveservices usage list --location eastus2

# Jaribu eneo tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa muda
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Omba ongezeko la kiwango
# Nenda kwenye Azure Portal > Kiwango > Omba ongezeko
```
</details>

<details>
<summary><strong>Je, ninaweza kutumia data yangu mwenyewe na Azure OpenAI?</strong></summary>

Ndiyo! Tumia **Azure AI Search** kwa RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Tazama kiolezo cha [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Jinsi ya kulinda sehemu za mwisho za modeli za AI?</strong></summary>

**Mazoea Bora**:
1. Tumia Utambulisho Ulio Simamiwa (hakuna funguo za API)
2. Washa Sehemu za Kibinafsi
3. Sanidi vikundi vya usalama wa mtandao
4. Tekeleza upunguzaji wa kiwango
5. Tumia Azure Key Vault kwa siri

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

## Jamii na Msaada

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Masuala na mijadala](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Nyaraka rasmi](https://learn.microsoft.com/azure/ai-studio/)

---

**Urambazaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI Kwanza
- **⬅️ Sura Iliyopita**: [Sura ya 1: Mradi Wako wa Kwanza](../getting-started/first-project.md)
- **➡️ Inayofuata**: [Uwekaji wa Modeli ya AI](ai-model-deployment.md)
- **🚀 Sura Inayofuata**: [Sura ya 3: Usanidi](../getting-started/configuration.md)

**Unahitaji Msaada?** Jiunge na mijadala ya jamii yetu au fungua suala katika hifadhi. Jamii ya Azure AI + AZD iko hapa kukusaidia kufanikiwa!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->