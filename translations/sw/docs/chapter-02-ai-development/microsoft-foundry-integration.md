# Muunganisho wa Microsoft Foundry na AZD

**Uavigaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI Kwanza
- **⬅️ Sura ya Awali**: [Sura ya 1: Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Ujaaji wa Mfano wa AI](ai-model-deployment.md)
- **🚀 Sura Ifuatayo**: [Sura ya 3: Usanidi](../chapter-03-configuration/configuration.md)

## Muhtasari

Mwongozo huu unaonyesha jinsi ya kuunganisha huduma za Microsoft Foundry na Azure Developer CLI (AZD) kwa ujuzi wa kupeleka programu za AI. Microsoft Foundry hutoa jukwaa kamili la kujenga, kupeleka, na kusimamia programu za AI, wakati AZD hufanya mchakato wa miundombinu na upeleaji kuwa rahisi.

## Microsoft Foundry ni Nini?

Microsoft Foundry ni jukwaa la umoja la maendeleo ya AI la Microsoft linalojumuisha:

- **Katalogi ya Mfano**: Kufikia mifano ya hali ya juu ya AI
- **Mtiririko wa Amri**: Mbunifu wa kuona wa michakato ya AI
- **Portal ya Microsoft Foundry**: Mazingira ya maendeleo yaliyojumuishwa kwa programu za AI
- **Chaguo za Upeleaji**: Chaguo mbalimbali za kuhosti na kupanua
- **Usalama na Ulinzi**: Vipengele vya AI vinavyowajibika vilivyojumuishwa

## AZD + Microsoft Foundry: Bora Pamoja

| Kipengele | Microsoft Foundry | Faida ya Muunganisho wa AZD |
|---------|-----------------|------------------------|
| **Upeleaji wa Mfano** | Upeleaji wa lango kwa mkono | Upeleaji wa kiotomatiki, unaoweza kurudiwa |
| **Miundombinu** | Kutoa huduma kwa kubofya | Miundombinu kama Kanuni (Bicep) |
| **Usimamizi wa Mazingira** | Umuhimu wa mazingira moja | Mazingira mengi (maendeleo/utayarishaji/uzalishaji) |
| **Muunganisho wa CI/CD** | Mdogo | Msaada wa asili wa Vitendo vya GitHub |
| **Usimamizi wa Gharama** | Ufuatiliaji wa msingi | Uboreshaji wa gharama maalum kwa mazingira |

## Masharti ya Awali

- Usajili wa Azure wenye ruhusa zinazofaa
- CLI ya Azure Developer imewekwa
- Upatikanaji wa huduma za Microsoft Foundry Models
- Uelewa wa msingi wa Microsoft Foundry

> **Kiwango cha sasa cha AZD:** Mifano hii ilikaguliwa dhidi ya `azd` `1.27.1`. Kwa mtiririko wa wakala wa AI, tumia toleo jipya la awali la kiongezi na angalia toleo uliloloweka kabla ya kuanza.

## Mifumo Mikuu ya Muunganisho

### Mfano 1: Muunganisho wa Microsoft Foundry Models

**Matumizi**: Itaelekeza programu za mazungumzo na mifano ya Microsoft Foundry Models

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

### Mfano 2: Muunganisho wa AI Search + RAG

**Matumizi**: Kupeleka programu za kizazi zilizosaidiwa na upokeaji (RAG)

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

### Mfano 3: Muunganisho wa Hekima ya Nyaraka

**Matumizi**: Michakato ya usindikaji na uchambuzi wa nyaraka

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

### Mpangilio wa Mabadiliko ya Mazingira

**Usanidi wa Uzalishaji:**
```bash
# Huduma za msingi za AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mipangilio ya mfano
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Mipangilio ya utendaji
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Usanidi wa Maendeleo:**
```bash
# Mipangilio iliyo optimized kwa gharama kwa ajili ya maendeleo
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

## Michakato ya Upeleaji

### Viongezi vya AZD kwa Foundry

AZD hutoa viongezi vinavyoongeza uwezo maalum wa AI kwa kazi na huduma za Microsoft Foundry:

```bash
# Sakinisha upanuzi wa mawakala wa Foundry
azd extension install azure.ai.agents

# Sakinisha upanuzi wa urekebishaji mzuri
azd extension install azure.ai.finetune

# Sakinisha upanuzi wa mifano maalum
azd extension install azure.ai.models

# Orodhesha upanuzi zilizowekwa
azd extension list --installed

# Angalia toleo la sasa la upanuzi wa wakala lililowekwa
azd extension show azure.ai.agents
```

Viongezi vya AI bado vinaendelea haraka katika awali. Ikiwa amri inafanya tofauti na ilivyoonyesha hapa, sasisha kiendelezi kinachohusika kabla ya kutatua tatizo la mradi.

### Upeleaji wa Kwanza wa Wakala kwa `azd ai`

Ikiwa una hati ya wakala, tumia `azd ai agent init` kuanzisha mradi uliounganishwa na Huduma ya Wakala wa Foundry:

```bash
# Anzisha kutoka kwa hati ya wakala
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Tumia kwenye Azure
azd up
```

Toleo la hivi karibuni la awali la `azure.ai.agents` pia limeongeza msaada wa mwanzo kwa kutumia templates kwa `azd ai agent init`. Ikiwa unafuata sampuli mpya za wakala, angalia msaada wa kiendelezi kwa bendera halisi zinazopatikana katika toleo uliloloweka.

Angalia [Amri za AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) kwa rejea kamili ya amri na bendera.

### Upeleaji kwa Amri Moja

```bash
# Sambaza kila kitu kwa amri moja
azd up

# Au sambaza kwa hatua
azd provision  # Miundombinu tu
azd deploy     # Programu tu

# Kwa usambazaji wa programu za AI zinazotumia muda mrefu katika azd 1.23.11+
azd deploy --timeout 1800
```

### Upelekaji Maalum kwa Mazingira

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

### Muungano wa Application Insights

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

### Usanidi wa Utambulisho ulioendeshwa

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

### Mikakati ya Kuweka Kumbukumbu (Caching)

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

### Usanidi wa Kuongezeka Kiotomatiki

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

## Utatuzi wa Matatizo ya Kawaida

### Tatizo 1: Kiasi cha OpenAI Kimezidiwa

**Dalili:**
- Upelekaji unashindwa na makosa ya kiwango
- Makosa 429 katika kumbukumbu za programu

**Suluhisho:**
```bash
# Angalia matumizi ya kikao cha sasa
az cognitiveservices usage list --location eastus

# Jaribu mkoa tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa wakati mfupi
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Tatizo 2: Kushindwa kwa Uthibitishaji

**Dalili:**
- Makosa 401/403 wakati wa kuita huduma za AI
- Ujumbe wa "Ufikiaji umekataliwa"

**Suluhisho:**
```bash
# Thibitisha ugawaji wa nafasi
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Angalia usanidi wa utambulisho uliofadhiliwa
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Thibitisha ufikiaji wa Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Tatizo 3: Matatizo ya Upeleaji wa Mfano

**Dalili:**
- Mifano haipatikani katika upeleaji
- Toleo la mfano fulani linashindwa

**Suluhisho:**
```bash
# Orodhesha mifano inayopatikana kwa kanda
az cognitiveservices model list --location eastus

# Sasisha toleo la mfano katika kiolezo cha bicep
# Angalia mahitaji ya uwezo wa mfano
```

## Mifano ya Templates

### Programu ya Mazungumzo ya RAG (Python)

**Hifadhidata**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Maelezo**: Sampuli maarufu ya AI ya Azure — programu ya mazungumzo ya RAG tayari kwa uzalishaji inayokuwezesha kuuliza maswali juu ya nyaraka zako mwenyewe. Inatumia GPT-4.1-mini kwa mazungumzo, text-embedding-3-large kwa uchoraji, na Azure AI Search kwa upokeaji. Inasaidia nyaraka za aina nyingi, sauti ingizo/masohoto, uthibitishaji wa Microsoft Entra, na ufuatiliaji wa Application Insights.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Programu ya Mazungumzo ya RAG (.NET)

**Hifadhidata**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Maelezo**: Toleo la .NET/C# la sampuli ya mazungumzo ya RAG ya Python. Imejengwa na API ndogo ya ASP.NET Core na mbele ya Blazor WebAssembly. Inajumuisha mazungumzo ya sauti, msaada wa GPT-4o-mini kwa kuona, na kliente wa desktop/mkononi .NET MAUI Blazor Hybrid.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Programu ya Mazungumzo ya RAG (Java)

**Hifadhidata**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Huduma**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Maelezo**: Toleo la Java la sampuli ya mazungumzo ya RAG likitumia Langchain4J kwa orkestreshini ya AI. Linaunga mkono usanifu wa huduma ndogo za matukio, mikakati mingi ya utaftaji (maandishi, vector, mchanganyiko), upakiaji wa nyaraka na Azure Document Intelligence, na upeleaji katika Azure Container Apps au Azure Kubernetes Service.

**Anza Haraka**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Msaidizi wa Enterprise Retail Copilot na Microsoft Foundry

**Hifadhidata**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Huduma**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Maelezo**: Msaidizi kamili wa biashara ya rejareja wa RAG ukitumia Microsoft Foundry na Prompty. Chatbot ya mtoza mali wa nje ya Contoso inayotumia taarifa za katalogi ya bidhaa na data ya oda za wateja. Inaonyesha mtiririko kamili wa GenAIOps — tengeneza mfano na Prompty, tathmini kwa wakaguzi wa AI, na peleka kupitia AZD kwa Container Apps.

**Anza Haraka**:
```bash
azd init --template contoso-chat
azd up
```

### Programu ya Kuandika Ubunifu ya Wakala Wengi

**Hifadhidata**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Huduma**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Maelezo**: Sampuli ya wakala wengi ikionyesha orkestreshini ya wakala wa AI na Prompty. Inatumia wakala wa utafiti (Bing Grounding katika Huduma ya Wakala wa AI ya Azure), wakala wa bidhaa (Azure AI Search), wakala wa mwandishi, na wakala wa mhariri kuandaa makala zenye utafiti mzuri kwa ushirikiano. Inajumuisha CI/CD na tathmini katika Vitendo vya GitHub.

**Anza Haraka**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Mazungumzo ya RAG Yasiyo na Seva (JavaScript/TypeScript)

**Hifadhidata**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Huduma**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB kwa NoSQL + LangChain.js

**Maelezo**: Chatbot ya RAG isiyo na seva ikitumia LangChain.js na Azure Functions kwa API na Azure Static Web Apps kwa kuhudumia. Inatumia Azure Cosmos DB kama duka la vector na hifadhidata ya historia ya mazungumzo. Inasaidia maendeleo ya ndani na Ollama kwa upimaji wa bure.

**Anza Haraka**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Kihariri cha Suluhisho cha Mazungumzo na Data Yako

**Hifadhidata**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Huduma**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Maelezo**: Kihariri cha suluhisho cha RAG cha kiwango cha biashara chenye portal ya usimamizi wa nyaraka, chaguzi nyingi za orkestratori (Semantic Kernel, LangChain, Prompt Flow), hotuba hadi maandishi, muunganisho wa Microsoft Teams, na chaguo la PostgreSQL au Cosmos DB kama backend. Imebuniwa kama sehemu inayoweza kubadilishwa kwa hali za uzalishaji za RAG.

**Anza Haraka**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Wakala wa Kusafiri wa AI — Orkestreshini ya Wakala Wengi ya MCP

**Hifadhidata**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Huduma**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Maelezo**: Programu ya rejea ya orkestreshini ya AI ya wakala wengi ikitumia mfumo tatu (LangChain.js, LlamaIndex.TS, na Microsoft Agent Framework). Ina vipokezi vya MCP (Model Context Protocol) katika lugha nne vinavyopangwa kama Azure Container Apps zisizo na seva na ufuatiliaji wa OpenTelemetry.

**Anza Haraka**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Mwanzilishi wa Azure AI

**Hifadhidata**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Huduma**: Huduma za Azure AI + Azure OpenAI

**Maelezo**: Template ya Bicep ndogo inayowekeza huduma za Azure AI zenye mifano ya kujifunza mashine iliyosanidiwa. Sehemu ya mwanzo nyepesi unapohitaji tu miundombinu ya Azure AI bila stack kamili ya programu.

**Anza Haraka**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Vinapo viongezeo zaidi vya template**: Tembelea [Maonyesho ya Amazing AZD AI Template](https://azure.github.io/awesome-azd/?tags=ai) kwa templates 80+ za AI za AZD kwa lugha na senario mbalimbali.

## Hatua Zifuatazo

1. **Jaribu Mifano**: Anza na template iliyotengenezwa kabla inayoendana na matumizi yako
2. **Badilisha Kwa Mahitaji Yako**: Rekebisha miundombinu na msimbo wa programu
3. **Ongeza Ufuatiliaji**: Tekeleza uonekano kamili
4. **Boresha Gharama**: Fanya usanidi unaolingana na bajeti yako
5. **Linda Upeleaji Wako**: Tekeleza mifumo ya usalama ya biashara
6. **Panua kwa Uzalishaji**: Ongeza vipengele vya maeneo mengi na upatikanaji wa juu

## 🎯 Mazoezi ya Vitendo

### Zoëzi 1: Wekeza Programu ya Mazungumzo ya Microsoft Foundry Models (Dakika 30)
**Lengo**: Wekeza na jaribu programu ya mazungumzo ya AI tayari kwa uzalishaji

```bash
# anzisha kiolezo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# weka vigezo vya mazingira
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# tuma
azd up

# jaribu programu
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# fuatilia shughuli za AI
azd monitor

# safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Upelekaji unamalizika bila makosa ya kiwango
- [ ] Inaweza kufikia kiolesura cha mazungumzo katika kivinjari
- [ ] Inaweza kuuliza maswali na kupata majibu yenye nguvu ya AI
- [ ] Application Insights inaonyesha data ya telemetry
- [ ] Mafanikio ya kusafisha rasilimali

**Gharama Inakadiriwa**: $5-10 kwa dakika 30 za majaribio

### Zoëzi 2: Sanidi Upeleaji wa Mifano Mingi (Dakika 45)
**Lengo**: Wekeza mifano mingi ya AI yenye usanidi tofauti

```bash
# Unda usanidi maalum wa Bicep
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

# Tumia na thibitisha
azd provision
azd show
```

**Vigezo vya Mafanikio:**
- [ ] Mifano mingi imewekwa kwa mafanikio
- [ ] Mipangilio ya uwezo tofauti imetekelezwa
- [ ] Mifano inapatikana kupitia API
- [ ] Inaweza kuita mifano yote miwili kutoka kwenye programu

### Zoëzi 3: Tekeleza Ufuatiliaji wa Gharama (Dakika 20)
**Lengo**: Sanidi onyo la bajeti na ufuatiliaji wa gharama

```bash
# Ongeza tahadhari ya bajeti kwa Bicep
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

# Sambaza tahadhari ya bajeti
azd provision

# Angalia gharama za sasa
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Vigezo vya Mafanikio:**
- [ ] Onyo la bajeti limetengenezwa katika Azure
- [ ] Arifa za barua pepe zimesanidiwa
- [ ] Inaweza kuona data ya gharama katika Portal ya Azure
- [ ] Vizingiti vya bajeti vimewekwa ipasavyo

## 💡 Maswali Yanayoulizwa Mara kwa Mara

<details>
<summary><strong:Ninawezaje kupunguza gharama za Microsoft Foundry Models wakati wa maendeleo?</strong></summary>

1. **Tumia Ngazi ya Bure**: Microsoft Foundry Models hutolewa tokeni 50,000 kwa mwezi bure
2. **Punguza Uwezo**: Weka uwezo kuwa 10 TPM badala ya 30+ kwa maendeleo
3. **Tumia azd down**: Ongeza rasilimali wakati hauendi haraka katika maendeleo
4. **Hifadhi Majibu**: Tekeleza Redis cache kwa maswali yanayojirudia
5. **Tumia Uhandisi wa Amri**: Punguza matumizi ya tokeni kwa amri bora


```bash
# Mpangilio wa maendeleo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Tofauti gani kati ya Microsoft Foundry Models na OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Usalama wa kampuni na ufuataji
- Uunganishaji wa mtandao binafsi
- Dhamana za SLA
- Uthibitishaji wa utambulisho ulioendeshwa
- Vikomo vya juu vinavyopatikana

**OpenAI API**:
- Upatikanaji wa haraka kwa mifano mipya
- Usanidi rahisi
- Kizuizi kidogo cha kuingia
- Mtandao wa umma tu

Kwa programu za uzalishaji, **Microsoft Foundry Models inashauriwa**.
</details>

<details>
<summary><strong>Ninawezaje kushughulikia makosa ya kutozidi kikomo cha Microsoft Foundry Models?</strong></summary>

```bash
# Angalia kikomo cha sasa
az cognitiveservices usage list --location eastus2

# Jaribu mkoa tofauti
azd env set AZURE_LOCATION westus2
azd up

# Punguza uwezo kwa muda
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Omba ongezeko la kikomo
# Nenda kwenye Azure Portal > Quotas > Omba ongezeko
```
</details>

<details>
<summary><strong>Ninaweza kutumia data yangu mwenyewe na Microsoft Foundry Models?</strong></summary>

Ndiyo! Tumia **Azure AI Search** kwa RAG (Uzalishaji ulioboreshwa kwa Utafutaji):

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
<summary><strong>Ninawezaje kuimarisha viingilio vya mfano wa AI?</strong></summary>

**Mbinu Bora**:
1. Tumia Utambulisho ulioendeshwa (bila funguo za API)
2. Wezesha Viingilio Binafsi
3. Sanidi vikundi vya usalama wa mtandao
4. Tekeleza ukomo wa kasi
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
- **Ujuzi wa Wakala**: [Ujuzi wa Microsoft Foundry kwenye skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Sakinisha ujuzi wa wakala wa Azure + Foundry katika mhariri wako kwa `npx skills add microsoft/github-copilot-for-azure`

---

**Uelekeo wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Komo](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Sura Iliyopita**: [Sura 1: Mradi wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **➡️ Ifuatayo**: [Utekelezaji wa Mfano wa AI](ai-model-deployment.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

**Unahitaji Msaada?** Jiunge na mijadala ya jamii yetu au fungua suala kwenye maktaba. Jamii ya Azure AI + AZD iko hapa kusaidia kufanikisha mafanikio yako!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->