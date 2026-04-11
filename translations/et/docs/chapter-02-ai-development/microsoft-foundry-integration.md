# Microsoft Foundry integreerimine AZD-ga

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-keskne arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Ülevaade

See juhend demonstreerib, kuidas integreerida Microsoft Foundry teenuseid Azure Developer CLI-ga (AZD), et hõlbustada AI rakenduste juurutamist. Microsoft Foundry pakub kõikehõlmavat platvormi AI rakenduste loomiseks, juurutamiseks ja haldamiseks, samas kui AZD lihtsustab infrastruktuuri ja juurutusprotsessi.

## Mis on Microsoft Foundry?

Microsoft Foundry on Microsofti ühtne AI arendusplatvorm, mis sisaldab:

- **Mudelite kataloog**: Juurdepääs tipptasemel AI mudelitele
- **Prompt Flow**: AI töövoogude visuaalne disainer
- **Microsoft Foundry portaal**: Integreeritud arenduskeskkond AI rakendustele
- **Juurutusvalikud**: Mitmed majutuse ja skaleerimise võimalused
- **Turvalisus ja vastutus**: Sisseehitatud vastutustundliku AI funktsioonid

## AZD + Microsoft Foundry: Koos parem

| Omadus | Microsoft Foundry | AZD integratsiooni eelised |
|---------|-----------------|----------------------------|
| **Mudelite juurutamine** | Käsitsi portaalis juurutamine | Automatiseeritud, korduvad juurutused |
| **Infrastruktuur** | Vajutamisega provisjoneerimine | Infrastruktuur koodina (Bicep) |
| **Keskkonna haldus** | Ühe keskkonna fookus | Mitmekeskkond (arendus/test/tootmine) |
| **CI/CD integratsioon** | Piiratud | Natiivne GitHub Actions tugi |
| **Kulude haldus** | Põhijälgimine | Keskkonnipõhine kulude optimeerimine |

## Eeltingimused

- Azure tellimus sobivate õigustega
- Azure Developer CLI installitud
- Juurdepääs Microsoft Foundry mudelite teenustele
- Põhiteadmised Microsoft Foundryst

> **Praegune AZD baasversioon:** Need näited on testitud `azd` versiooni `1.23.12` alusel. AI agentide töövoo puhul kasuta praegust eelvaate laiendusversiooni ja kontrolli oma paigaldatud versiooni enne alustamist.

## Põhilised integratsioonimustrid

### Muster 1: Microsoft Foundry mudelite integreerimine

**Kasutusjuhtum**: Rääkimisrakenduste juurutamine Microsoft Foundry mudelitega

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
  
**Infrastruktuur (main.bicep):**  
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
  
### Muster 2: AI otsing + RAG integratsioon

**Kasutusjuhtum**: Tagasivõetud andmetega genereerimise (RAG) rakenduste juurutamine

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
  
### Muster 3: Dokumenditeadlikkuse integratsioon

**Kasutusjuhtum**: Dokumentide töötlemise ja analüüsi töövood

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
  
## 🔧 Konfiguratsioonimustrid

### Keskkonnamuutujate seadistamine

**Tootmiskonfiguratsioon:**  
```bash
# Põhitehisintellekti teenused
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mudeli konfiguratsioonid
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Tulemuslikkuse seaded
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```
  
**Arenduskonfiguratsioon:**  
```bash
# Kuluefektiivsed seaded arenduseks
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Tasuta tase
```
  
### Turvaline konfiguratsioon Key Vaultiga

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
  
## Juurutusprotsessid

### AZD laiendused Foundry jaoks

AZD pakub laiendusi, mis lisavad Microsoft Foundry teenustega töötamiseks AI-spetsiifilisi võimalusi:

```bash
# Paigalda Foundry agentide laiendus
azd extension install azure.ai.agents

# Paigalda peenhäälestuse laiendus
azd extension install azure.ai.finetune

# Paigalda kohandatud mudelite laiendus
azd extension install azure.ai.models

# Loetle paigaldatud laiendused
azd extension list --installed

# Kontrolli hetkel paigaldatud agendi laienduse versiooni
azd extension show azure.ai.agents
```
  
AI laiendused arenevad eelvaates kiiresti. Kui mõni käsk käitub teisiti kui siin näidatud, uuenda vastavat laiendust enne, kui hakkad projekti ise tõrkeotsingut tegema.

### Agent-keskne juurutus käsuga `azd ai`

Kui sul on agentide manifest, kasuta `azd ai agent init`, et luua projekt, mis on ühendatud Foundry agentide teenusega:

```bash
# Algatamine agendi manifestist
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Paigalda Azure'i
azd up
```
  
Viimased `azure.ai.agents` eelvaateversioonid lisasid ka mallipõhise initsialiseerimise toe `azd ai agent init` jaoks. Kui kasutad uuemaid agentide näidiseid, kontrolli laienduse abi, et teada saada, millised lipud sinu paigaldatud versioonis saadaval on.

Vaata [AZD AI käsud](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) täielikku käsurea viidet ja lippe.

### Ühe käsu juurutamine

```bash
# Paigalda kõik ühe käsuga
azd up

# Või paigalda sammhaaval
azd provision  # Ainult infrastruktuur
azd deploy     # Ainult rakendus

# Pikalt kestvate tehisintellekti rakenduste paigaldamiseks azd 1.23.11+ versioonis
azd deploy --timeout 1800
```
  
### Keskkonnipõhised juurutused

```bash
# Arenduskeskkond
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Tootmiskeskkond
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```
  
## Jälgimine ja nähtavus

### Application Insightsi integratsioon

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
  
### Kulude jälgimine

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
  
## 🔐 Turvalisuse parimad tavad

### Halda identiteedi seadistust

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
  
### Võrgu turvalisus

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
  
## Jõudluse optimeerimine

### Vahemällu salvestamise strateegiad

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
  
### Automaatse skaleerimise konfiguratsioon

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
  
## Tõrkeotsingu sagedased probleemid

### Probleem 1: OpenAI limiidi ületamine

**Sümptomid:**
- Juurutus nurjub limiidi vigadega
- Rakenduse logides 429 vead

**Lahendused:**
```bash
# Kontrolli praegust kvota kasutust
az cognitiveservices usage list --location eastus

# Proovi teist piirkonda
azd env set AZURE_LOCATION westus2
azd up

# Vähenda ajutiselt mahtu
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```
  
### Probleem 2: Autentimiserandid

**Sümptomid:**
- 401/403 vead AI teenuseid kutsudes
- „Juhtmetee keelatud“ teated

**Lahendused:**
```bash
# Kontrolli rollide määramisi
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrolli hallatava identiteedi konfiguratsiooni
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Kinnita võtmehoidla juurdepääs
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```
  
### Probleem 3: Mudelite juurutamise probleemid

**Sümptomid:**
- Mudelid ei ole juurutuses saadaval
- Kindlate mudeliversioonide tõrked

**Lahendused:**
```bash
# Loetle saadaolevad mudelid regiooni kaupa
az cognitiveservices model list --location eastus

# Uuenda mudeli versiooni bicep mallis
# Kontrolli mudeli mahtuvusnõudeid
```
  
## Näidismallid

### RAG juturobot rakendus (Python)

**Repos:** [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kirjeldus**: Kõige populaarsem Azure AI näidis — tootmiskõlbulik RAG juturobot, millega saad oma dokumentidest küsimusi esitada. Kasutab GPT-4.1-mini jutu jaoks, text-embedding-3-large manusteks ja Azure AI Search otsinguks. Toetab multimodaalseid dokumente, kõnesisestust/-väljundit, Microsoft Entra autentimist ja Application Insights jälgimist.

**Kiire algus**:  
```bash
azd init --template azure-search-openai-demo
azd up
```
  
### RAG juturobot rakendus (.NET)

**Repos:** [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kirjeldus**: Python RAG juturoboti ekvivalent .NET/C#-s. Ehitatud ASP.NET Core Minimal API ja Blazor WebAssembly eeskujuga. Sisaldab häälvestlust, GPT-4o-mini nägemistuge ja kaaslaseks .NET MAUI Blazor hübriidset töölaua/mobiilse klienti.

**Kiire algus**:  
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```
  
### RAG juturobot rakendus (Java)

**Repos:** [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kirjeldus**: Java versioon RAG juturobotist, kasutades Langchain4J AI orkestreerimiseks. Toetab mikroteenuste sündmustepõhist arhitektuuri, mitut otsingustrateegiat (tekst, vektor, hübriid), dokumentide üleslaadimist Azure Document Intelligence abil ning juurutamist kas Azure Container Apps või Azure Kubernetes Service'iga.

**Kiire algus**:  
```bash
azd init --template azure-search-openai-demo-java
azd up
```
  
### Ettevõtte jaekaubanduse abiline Azure AI Foundryga

**Repos:** [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Teenused**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kirjeldus**: Täislahendus jaekauplejale RAG abil kasutades Azure AI Foundryt ja Prompty't. Contoso Outdoor kaupluse robotvestlus, mis tugineb tootekataloogi ja kliendi tellimuste andmetele. Näitab kogu GenAIOps töövoogu — prototüüp Promptyga, hindamine AI abil, juurutamine AZD kaudu Container Apps'i.

**Kiire algus**:  
```bash
azd init --template contoso-chat
azd up
```
  
### Loovkirjutamise mitmeagendi rakendus

**Repos:** [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Teenused**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kirjeldus**: Mitmeagendi näidis, mis demonstreerib AI agendi orkestreerimist Prompty abil. Kasutab uurimisagent (Bing Grounding Azure AI Agent Service's), tootmisagent (Azure AI Search), kirjutajaagent ja toimetajaagent koostööks hästi uuritud artiklite loomisel. Sisaldab CI/CD-d ja hindamist GitHub Actions'is.

**Kiire algus**:  
```bash
azd init --template contoso-creative-writer
azd up
```
  
### Serverivaba RAG juturobot (JavaScript/TypeScript)

**Repos:** [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Teenused**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB NoSQL + LangChain.js

**Kirjeldus**: Täielikult serverivaba RAG juturobot kasutades LangChain.js ja Azure Functions API jaoks ning Azure Static Web Apps majutuseks. Kasutab Azure Cosmos DB nii vektorite hoidjana kui vestluse ajaloo andmebaasina. Toetab kohalikku arendust Ollama abil, mis võimaldab nullkulu testimist.

**Kiire algus**:  
```bash
azd init --template serverless-chat-langchainjs
azd up
```
  
### Vestlus oma andmetega lahenduse kiirendi

**Repos:** [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Teenused**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Kirjeldus**: Ettevõtte tasemel RAG lahenduse kiirendi koos administraatori portaaliga dokumentide üleslaadimiseks/haldamiseks, mitme orkestreerija valikutega (Semantic Kernel, LangChain, Prompt Flow), kõne tekstiks, Microsoft Teams integreerimise ja valikuga PostgreSQL või Cosmos DB taustsüsteem. Mõeldud kohandatavaks lähtepunktiks tootmistüüpi RAG stsenaariumitele.

**Kiire algus**:  
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```
  
### AI reisibüroo agendid — Mitmeagendi MCP orkestreerimine

**Repos:** [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Teenused**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP serverid (.NET, Python, Java, TypeScript)

**Kirjeldus**: Viite-rakendus mitmeagendi AI orkestreerimiseks kasutades kolme raamistikku (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework). Sisaldab MCP (Model Context Protocol) servereid neljas keeles, juurutatud serverivabalt Azure Container Apps'is koos OpenTelemetry monitooringuga.

**Kiire algus**:  
```bash
azd init --template azure-ai-travel-agents
azd up
```
  
### Azure AI Algusmall

**Repos:** [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Teenused**: Azure AI teenused + Azure OpenAI

**Kirjeldus**: Minimalistlik Bicep mall, mis juurutab Azure AI teenused koos konfigureeritud masinõppemudelitega. Kergekaaluline lähtepunkt, kui vajad ainult Azure AI infrastruktuuri ilma täieliku rakenduseni.

**Kiire algus**:  
```bash
azd init --template azd-ai-starter
azd up
```
  
> **Sirvi rohkem malle**: Vaata [Awesome AZD AI Template Gallery'd](https://azure.github.io/awesome-azd/?tags=ai), mis sisaldab üle 80 AI-spetsiifilise AZD malli erinevates keeltes ja stsenaariumites.

## Järgmised sammud

1. **Proovi näiteid**: Alusta eelnevalt ehitatud malliga, mis vastab su kasutusjuhtumile
2. **Kohanda vastavalt vajadusele**: Muuda infrastruktuuri ja rakenduse koodi
3. **Lisa jälgimine**: Rakenda põhjalik nähtavus
4. **Optimeeri kulusid**: Häälesta konfiguratsioon eelarvele sobivaks
5. **Turvalise juurutuse tagamine**: Rakenda ettevõtte turbemustrid
6. **Skaleeri tootmisse**: Lisa mitmeregiooniline ja kõrge kättesaadavusega tugi

## 🎯 Praktilised harjutused

### Harjutus 1: Microsoft Foundry mudelite juturobotirakenduse juurutamine (30 minutit)  
**Eesmärk**: Juurutada ja testida tootmiskõlbulik AI juturoboti rakendus

```bash
# Algata mall
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Sea keskkonnamuutujad
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Võrku viia
azd up

# Rakendust testida
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Jälgi tehisintellekti toiminguid
azd monitor

# Puhasta üles
azd down --force --purge
```
  
**Õnnestumise kriteeriumid:**
- [ ] Juurutus lõpeb ilma limiidivigadeta
- [ ] Juurdepääs juturoboti liidesele brauseris
- [ ] Võimalus esitada küsimusi ja saada AI toetusega vastuseid
- [ ] Application Insights kuvab telemeetriaid
- [ ] Ressursid puhastatud edukalt

**Hinnanguline maksumus**: 5–10 dollarit 30-minutise testimise eest

### Harjutus 2: Mitme mudeli juurutuse seadistamine (45 minutit)  
**Eesmärk**: Juurutada mitu AI mudelit erinevate konfiguratsioonidega

```bash
# Loo kohandatud Bicep konfiguratsioon
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

# Rakenda ja kontrolli
azd provision
azd show
```
  
**Õnnestumise kriteeriumid:**
- [ ] Mitmed mudelid juurutatud edukalt
- [ ] Rakendatud erinevad mahukonfiguratsioonid
- [ ] Mudelid on API kaudu kättesaadavad
- [ ] Rakendus suudab kutsuda mõlemaid mudeleid

### Harjutus 3: Kulujälgimise rakendamine (20 minutit)  
**Eesmärk**: Seadistada eelarveteated ja kulude jälgimine

```bash
# Lisa eelarvehoiatus Bicepi
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

# Lisa eelarvehoiatus kasutusele
azd provision

# Kontrolli praeguseid kulutusi
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```
  
**Õnnestumise kriteeriumid:**
- [ ] Azure'is loodud eelarveteade
- [ ] E-posti teavitused konfigureeritud
- [ ] Kulud on nähtavad Azure portaalis
- [ ] Eelarve läved on õigesti määratud

## 💡 Korduma kippuvad küsimused

<details>
<summary><strong>Kuidas arendusfaasis Microsoft Foundry mudelite kulusid vähendada?</strong></summary>

1. **Kasuta tasuta taset**: Microsoft Foundry Models pakub kuus 50 000 märki tasuta
2. **Vähenda mahtu**: Sea maht arenduseks 10 TPM, mitte 30+ asemel
3. **Kasuta käsku azd down**: Vabasta ressursid, kui arendust ei toimu
4. **Vahemälu vastused**: Kasuta korduvate päringute jaoks Redis vahemälu
5. **Kasuta Prompt Engineeringut**: Vähenda märgiste kasutust tõhusate promptidega
```bash
# Arenduse seadistus
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mis vahe on Microsoft Foundry mudelite ja OpenAI API vahel?</strong></summary>

**Microsoft Foundry mudelid**:
- Ettevõtte turvalisus ja vastavus
- Privaatvõrgu integreerimine
- SLA garantii
- Hallatud identiteedi autentimine
- Saadaval suuremad kvotid

**OpenAI API**:
- Kiirem ligipääs uutele mudelitele
- Lihtsam seadistus
- Madalam sisenemisbarjäär
- Ainult avalik internet

Tootmisrakenduste puhul on soovitatav **Microsoft Foundry mudelid**.
</details>

<details>
<summary><strong>Kuidas käsitleda Microsoft Foundry mudelite kvoti ületamise vigu?</strong></summary>

```bash
# Kontrolli praegust kvooti
az cognitiveservices usage list --location eastus2

# Proovi teist regiooni
azd env set AZURE_LOCATION westus2
azd up

# Vähenda mahtu ajutiselt
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Esita kvoo suurendamise taotlus
# Mine Azure'i portaali > Kvoodid > Taotle suurendust
```
</details>

<details>
<summary><strong>Kas saan Microsoft Foundry mudelitega kasutada oma andmeid?</strong></summary>

Jah! Kasuta **Azure AI Searchi** RAG jaoks (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Vaata [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) malli.
</details>

<details>
<summary><strong>Kuidas turvaliselt kaitsta tehisintellekti mudelite lõpp-punkte?</strong></summary>

**Parimad tavad**:
1. Kasuta hallatud identiteeti (ilma API võtiteta)
2. Luba privaatsed lõpp-punktid
3. Konfigureeri võrgu turvagrupid
4. Rakenda sageduse piiramine
5. Kasuta saladuste hoidmiseks Azure Key Vaulti

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

## Kogukond ja tugi

- **Microsoft Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleemid ja arutelud](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Ametlik dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)
- **Agentide oskused**: [Microsoft Foundry oskus aadressil skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Paigalda Azure + Foundry agendi oskused oma redaktorisse käsuga `npx skills add microsoft/github-copilot-for-azure`

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD alustajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esimene arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Sinu esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI mudeli rakendamine](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Vaja abi?** Liitu meie kogukonna aruteludega või ava probleem hoidlas. Azure AI + AZD kogukond on siin, et sind edu saavutamisel toetada!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi me püüame saavutada täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Algset dokumenti selle emakeeles tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Meie ei vastuta ühegi sellest tõlkest tuleneva arusaamatuse ega valesti mõistmise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->