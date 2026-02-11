# Uunganisho wa Microsoft Foundry na AZD

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD kwa Waanzaji](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Sura Iliyotangulia**: [Sura 1: Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Uenezwaji wa Modeli za AI](ai-model-deployment.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

## Muhtasari

Mwongozo huu unaonyesha jinsi ya kuunganisha huduma za Microsoft Foundry na Azure Developer CLI (AZD) kwa uenezaji wa programu za AI uliorahisishwa. Microsoft Foundry inatoa jukwaa kamili la kujenga, kueneza, na kusimamia programu za AI, wakati AZD inarahisisha miundombinu na mchakato wa uenezaji.

## Microsoft Foundry ni Nini?

Microsoft Foundry ni jukwaa lililounganishwa la Microsoft kwa maendeleo ya AI ambalo linajumuisha:

- **Model Catalog**: Upatikanaji wa modeli za kisasa za AI
- **Prompt Flow**: Mratibu wa kuona kwa mtiririko wa kazi za AI
- **AI Foundry Portal**: Mazingira yaliyounganishwa ya maendeleo kwa programu za AI
- **Deployment Options**: Chaguzi nyingi za mwenyeji na upanuaji
- **Safety and Security**: Vipengele vya AI vinavyohusiana na uwajibikaji vimejengwa

## AZD + Microsoft Foundry: Bora Pamoja

| Sifa | Microsoft Foundry | Faida ya Uunganisho wa AZD |
|---------|-----------------|------------------------|
| **Uenezwaji wa Modeli** | Manual portal deployment | Uenezaji uliosautomwa, unaorudiwa |
| **Miundombinu** | Click-through provisioning | Miundombinu kama Msimbo (Bicep) |
| **Usimamizi wa Mazingira** | Single environment focus | Mazingira mengi (dev/staging/prod) |
| **Uunganisho wa CI/CD** | Limited | Native GitHub Actions support |
| **Usimamizi wa Gharama** | Basic monitoring | Uboreshaji wa gharama kwa mazingira maalum |

## Mahitaji ya awali

- Azure subscription with appropriate permissions
- Azure Developer CLI installed
- Access to Azure OpenAI services
- Basic familiarity with Microsoft Foundry

## Mifumo ya Msingi ya Uunganisho

### Mfano 1: Uunganisho wa Azure OpenAI

**Matumizi**: Kuweka programu za mazungumzo kwa kutumia modeli za Azure OpenAI

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

### Mfano 2: Uunganisho wa AI Search + RAG

**Matumizi**: Kuweka programu za retrieval-augmented generation (RAG)

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

### Mfano 3: Uunganisho wa Document Intelligence

**Matumizi**: Mtiririko wa kazi wa usindikaji na uchambuzi wa hati

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

# Mipangilio ya modeli
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Mipangilio ya utendaji
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Usanidi wa Maendeleo:**
```bash
# Mipangilio iliyoboreshwa kwa gharama kwa ajili ya maendeleo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ngazi ya bure
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

## Mtiririko wa Uenezaji

### Uenezaji kwa Amri Moja

```bash
# Sambaza kila kitu kwa amri moja
azd up

# Au sambaza kwa hatua
azd provision  # Miundombinu tu
azd deploy     # Programu tu
```

### Uenezaji kwa Mazingira Mahususi

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

## Ufuatiliaji na Uonekano

### Uunganisho wa Application Insights

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

## 🔐 Misingi Bora ya Usalama

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

## Kuboresha Utendaji

### Mikakati ya Caching

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

### Usanidi wa Kujiendesha Kiotomatiki

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

## Kutatua Matatizo ya Kawaida

### Tatizo 1: Kiwango cha OpenAI Kimezidiwa

**Dalili:**
- Deployment fails with quota errors
- 429 errors in application logs

**Suluhisho:**
```bash
# Angalia matumizi ya ukomo wa sasa
az cognitiveservices usage list --location eastus

# Jaribu eneo tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa muda mfupi
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Tatizo 2: Kushindwa kwa Uthibitishaji

**Dalili:**
- 401/403 errors when calling AI services
- "Access denied" messages

**Suluhisho:**
```bash
# Thibitisha uteuzi wa majukumu
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Angalia usanidi wa kitambulisho kilichosimamiwa
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Thibitisha ufikiaji wa Hazina ya Funguo
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Tatizo 3: Matatizo ya Uenezaji wa Modeli

**Dalili:**
- Models not available in deployment
- Specific model versions failing

**Suluhisho:**
```bash
# Orodhesha modeli zinazopatikana kwa kanda
az cognitiveservices model list --location eastus

# Sasisha toleo la modeli katika kiolezo cha bicep
# Kagua mahitaji ya uwezo wa modeli
```

## Mifano ya Kigezo

### Programu ya Msingi ya Mazungumzo

**Hazina**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Huduma**: Azure OpenAI + Cognitive Search + App Service

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Mtiririko wa Usindikaji wa Hati

**Hazina**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Huduma**: Document Intelligence + Storage + Functions

**Anza Haraka**:
```bash
azd init --template ai-document-processing
azd up
```

### Mazungumzo ya Biashara na RAG

**Hazina**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Huduma**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Anza Haraka**:
```bash
azd init --template contoso-chat
azd up
```

## Hatua Zifuatazo

1. **Jaribu Mifano**: Anza na kigezo kilichojengwa tayari kinacholingana na matumizi yako
2. **Binafsisha Kwa Mahitaji Yako**: Badilisha miundombinu na msimbo wa programu
3. **Ongeza Ufuatiliaji**: Tekeleza uonekano kamili
4. **Boresha Gharama**: Rekebisha usanidi kwa bajeti yako
5. **Linda Uenezaji Wako**: Tekeleza mifumo ya usalama ya kampuni
6. **Panua kwa Uzalishaji**: Ongeza vipengele vya maeneo mengi na upatikanaji mkubwa

## 🎯 Mazoezi ya Vitendo

### Zoefuo 1: Weka Programu ya Mazungumzo ya Azure OpenAI (30 minutes)
**Lengo**: Weka na ujaribu programu ya mazungumzo ya AI tayari kwa uzalishaji

```bash
# Anzisha kiolezo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Weka vigezo vya mazingira
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Zindua
azd up

# Jaribu programu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Fuatilia operesheni za AI
azd monitor

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Uenezaji umekamilika bila hitilafu za quota
- [ ] Inawezekana kufikia kiolesura cha mazungumzo katika kivinjari
- [ ] Inawezekana kuuliza maswali na kupokea majibu yaliyoendeshwa na AI
- [ ] Application Insights inaonyesha data za telemetry
- [ ] Rasilimali zilisafishwa kwa mafanikio

**Gharama Inakadiriwa**: $5-10 kwa dakika 30 za majaribio

### Zoefuo 2: Sanidi Uenezaji wa Modeli Nyingi (45 minutes)
**Lengo**: Weka modeli nyingi za AI zenye usanidi tofauti

```bash
# Unda usanidi maalum wa Bicep
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

# Sambaza na thibitisha
azd provision
azd show
```

**Vigezo vya Mafanikio:**
- [ ] Modeli nyingi zimesambazwa kwa mafanikio
- [ ] Mipangilio tofauti ya uwezo imetumika
- [ ] Modeli zinapatikana kupitia API
- [ ] Inawezekana kuita modeli zote kutoka kwenye programu

### Zoefuo 3: Tekeleza Ufuatiliaji wa Gharama (20 minutes)
**Lengo**: Sanidi arifu za bajeti na ufuatiliaji wa gharama

```bash
# Ongeza onyo la bajeti kwa Bicep
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

# Weka onyo la bajeti
azd provision

# Angalia gharama za sasa
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Vigezo vya Mafanikio:**
- [ ] Arifa ya bajeti imetengenezwa katika Azure
- [ ] Arifa kwa barua pepe zimewekwa
- [ ] Inawezekana kuona data za gharama katika Azure Portal
- [ ] Vikomo vya bajeti vimewekwa ipasavyo

## 💡 Maswali Yanayoulizwa Mara kwa Mara

<details>
<summary><strong>Je, ninawezaje kupunguza gharama za Azure OpenAI wakati wa maendeleo?</strong></summary>

1. **Tumia Tier ya Bure**: Azure OpenAI inatoa 50,000 tokens/mwezi bila malipo
2. **Punguza Uwezo**: Weka uwezo hadi 10 TPM badala ya 30+ kwa maendeleo
3. **Tumia azd down**: Tenganisha rasilimali wakati hauendelei maendeleo
4. **Hifadhi Majibu (Cache)**: Tekeleza Redis cache kwa maswali yanayojirudia
5. **Tumia Uhandisi wa Prompt**: Punguza matumizi ya tokens kwa prompts zenye ufanisi

```bash
# Usanidi wa maendeleo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Je, tofauti kati ya Azure OpenAI na OpenAI API ni nini?</strong></summary>

**Azure OpenAI**:
- Usalama wa shirika na uzingatiaji
- Uunganishaji wa mtandao binafsi
- Dhamana za SLA
- Uthibitishaji kwa Managed Identity
- Viwango vya juu vya quota vinapatikana

**OpenAI API**:
- Upatikanaji wa haraka kwa modeli mpya
- Usanidi rahisi
- Kizuizi cha chini cha kuingia
- Mtandao wa umma tu

Kwa programu za uzalishaji, **Azure OpenAI inashauriwa**.
</details>

<details>
<summary><strong>Je, ninawezaje kushughulikia hitilafu za kuzidiwa kwa quota za Azure OpenAI?</strong></summary>

```bash
# Angalia kikomo cha sasa
az cognitiveservices usage list --location eastus2

# Jaribu eneo tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa muda mfupi
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Omba ongezeko la kikomo
# Nenda kwenye Portal ya Azure > Vikomo > Omba ongezeko
```
</details>

<details>
<summary><strong>Je, ninaweza kutumia data yangu mwenyewe na Azure OpenAI?</strong></summary>

Ndio! Tumia **Azure AI Search** kwa RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Tazama kigezo cha [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Je, ninawezaje kuwalinda viunganisho vya mwisho vya modeli za AI?</strong></summary>

**Mbinu Bora**:
1. Tumia Managed Identity (hakuna funguo za API)
2. Washa Private Endpoints
3. Sanidi vikundi vya usalama wa mtandao
4. Tekeleza kikomo cha kiwango cha maombi
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

- **Microsoft Foundry Discord**: [#Kanal ya Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Masuala na mijadala](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Nyaraka rasmi](https://learn.microsoft.com/azure/ai-studio/)

---

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD kwa Waanzaji](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Sura Iliyotangulia**: [Sura 1: Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Uenezwaji wa Modeli za AI](ai-model-deployment.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na mijadala ya jamii yetu au fungua issue katika hazina. Jamii ya Azure AI + AZD ipo hapa kukusaidia kufanikiwa!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la uwajibikaji:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI Co-op Translator (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya awali katika lugha yake ya asili inapaswa kutumika kama chanzo cha kuaminika. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya kitaalamu iliyofanywa na mtafsiri wa binadamu. Hatuwajibiki kwa kutokuelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->