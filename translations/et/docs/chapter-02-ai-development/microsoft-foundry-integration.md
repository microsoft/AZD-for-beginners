# Microsoft Foundry integreerimine AZD-ga

**Peatükkide navigeerimine:**  
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)  
- **📖 Praegune peatükk**: Peatükk 2 - AI-esmane arendus  
- **⬅️ Eelmine peatükk**: [Peatükk 1: Teie esimene projekt](../chapter-01-foundation/first-project.md)  
- **➡️ Järgmine**: [AI mudeli juurutamine](ai-model-deployment.md)  
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)  

## Ülevaade

See juhend demonstreerib, kuidas integreerida Microsoft Foundry teenused Azure Developer CLI-ga (AZD), et lihtsustada AI rakenduste juurutamist. Microsoft Foundry pakub terviklikku platvormi AI rakenduste ehitamiseks, juurutamiseks ja haldamiseks, samas kui AZD lihtsustab infrastruktuuri ja juurutusprotsessi.

## Mis on Microsoft Foundry?

Microsoft Foundry on Microsofti ühtne platvorm AI arenduseks, mis sisaldab:

- **Mudelite kataloog**: Juhtivate AI mudelitele ligipääs  
- **Prompt Flow**: Visuaalne AI töövoogude disainer  
- **Microsoft Foundry portaali**: Integreeritud arenduskeskkond AI rakendustele  
- **Juurutusvalikud**: Mitmed majutuse ja skaleerimise võimalused  
- **Turvalisus ja turvalisus**: Ehitussiis vastutustundlikud AI funktsioonid  

## AZD + Microsoft Foundry: Koos paremad

| Funktsioon | Microsoft Foundry | AZD integratsiooni eelised |
|------------|------------------|----------------------------|
| **Mudelite juurutamine** | Käsitsi portaali kaudu | Automatiseeritud, korduvad juurutused |
| **Infrastruktuur** | Klõpsuga provisjonimine | Infrastruktuur koodina (Bicep) |
| **Keskkonna haldus** | Üksik keskkond | Mitmekeskkond (arendus/test/tootmine) |
| **CI/CD integratsioon** | Piiratud | Natiivne GitHub Actions tugi |
| **Kulu juhtimine** | Põhiline jälgimine | Keskkonnapõhine kuluoptimeerimine |

## Eeltingimused

- Azure tellimus õigetel õigustel  
- Azure Developer CLI installitud  
- Ligipääs Microsoft Foundry mudelite teenustele  
- Põhiteadmised Microsoft Foundry-st  

## Põhi integratsioonimustrid

### Muster 1: Microsoft Foundry mudelite integreerimine

**Kasutusjuhtum**: Chat-rakendused Microsoft Foundry mudelitega juurutamiseks

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
  
### Muster 2: AI otsing + RAG integratsioon

**Kasutusjuhtum**: Päringu-põhine lisatud generatsiooni (RAG) rakenduste juurutamine

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
  
### Muster 3: Dokumendi intellekti integratsioon

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

# Märgimudelite konfiguratsioonid
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Tulemuse optimeerimise seaded
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```
  
**Arenduskonfiguratsioon:**  
```bash
# Arenduseks kulutusi optimeeritud seaded
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Tasuta tase
```
  
### Turvaline konfiguratsioon Key Vault abil

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
  
## Juurutus töövood

### AZD laiendused Foundry jaoks

AZD pakub laiendusi, mis lisavad AI-spetsiifilisi võimeid Microsoft Foundry teenustega töötamiseks:

```bash
# Paigalda Foundry agendi laiendus
azd extension install azure.ai.agents

# Paigalda peenhäälestuse laiendus
azd extension install azure.ai.finetune

# Paigalda kohandatud mudelite laiendus
azd extension install azure.ai.models

# Kuva paigaldatud laiendused
azd extension list
```
  
### Agent-põhine juurutus `azd ai` käsuga

Kui teil on agentmanifest, kasutage `azd ai agent init` projekti scaffoldinguks koos Foundry Agent Service ühendusega:

```bash
# Algatamine agendi manifestist
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Paigalda Azure'i
azd up
```
  
Vaata [AZD AI CLI käsud](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) täielikku käsu ja lipu kirjeldust.

### Üksikkäsu juurutamine

```bash
# Hõlma kõik ühe käsuga
azd up

# Või paigalda sammhaaval
azd provision  # Ainult infrastruktuur
azd deploy     # Ainult rakendus
```
  
### Keskkonnapõhised juurutused

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
  
## Jälgimine ja jälgitavus

### Application Insights integratsioon

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
  
### Kulu jälgimine

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

### Haldatud identiteedi konfiguratsioon

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
  
### Automaatse skalaarimise konfiguratsioon

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
  
## Tavaliste probleemide lahendamine

### Probleem 1: OpenAI limiidi ületamine

**Sümptomid:**  
- Juurutus ebaõnnestub limiidiveaga  
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
  
### Probleem 2: Autentimise vead

**Sümptomid:**  
- 401/403 vead AI teenuseid kutsudes  
- "Juurdepääs keelatud" teated  

**Lahendused:**  
```bash
# Kontrolli rolli määranguid
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrolli hallatud identiteedi seadistust
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Kontrolli võtmegaala ligipääsu kehtivust
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```
  
### Probleem 3: Mudeli juurutamise tõrked

**Sümptomid:**  
- Mudelid ei ole juurutuses saadaval  
- Konkreetsete mudeli versioonide tõrked  

**Lahendused:**  
```bash
# Loetle saadavalolevad mudelid piirkonniti
az cognitiveservices model list --location eastus

# Uuenda mudeli versiooni bicep-mallil
# Kontrolli mudeli mahunõudeid
```
  
## Näidismallid

### RAG vestlusrakendus (Python)

**Repo**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kirjeldus**: Kõige populaarsem Azure AI näidis — tootmiskõlbulik RAG vestlusrakendus, mis võimaldab küsida küsimusi oma dokumentide põhjal. Kasutab GPT-4.1-mini vestlusteks, text-embedding-ada-002 manusteks ja Azure AI Search päringuks. Toetab multimodaalseid dokumente, kõne sisestust/väljundit, Microsoft Entra autentimist ja Application Insights jälgimist.

**Kiire juurutus**:  
```bash
azd init --template azure-search-openai-demo
azd up
```
  
### RAG vestlusrakendus (.NET)

**Repo**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kirjeldus**: Python RAG vestlusnäidise .NET/C# ekvivalent. Ehitatud ASP.NET Core Minimal API ja Blazor WebAssembly frontendiga. Sisaldab häälvestlust, GPT-4o-mini nägemise tuge ja kaasas .NET MAUI Blazor hübriid lauaarvuti/mobiiliklient.

**Kiire juurutus**:  
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```
  
### RAG vestlusrakendus (Java)

**Repo**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kirjeldus**: Java versioon RAG vestlusnäidisest, kasutades Langchain4J AI orkestreerimiseks. Toetab mikroteenuste sündmuspõhist arhitektuuri, mitut otsingustrateegiat (tekst, vektor, hübriid), dokumentide üleslaadimist Azure Document Intelligence’iga ja juurutust kas Azure Container Apps või Azure Kubernetes Service'i peale.

**Kiire juurutus**:  
```bash
azd init --template azure-search-openai-demo-java
azd up
```
  
### Ettevõtte jaemüügikopiloot Azure AI Foundryga

**Repo**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Teenused**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kirjeldus**: Lõpp-punkti jaemüügi RAG kopiloot Azure AI Foundry ja Promptyga. Contoso Outdoori jaemüügi vestlusrobot, mis põhineb tootekataloogil ja kliendi tellimustel. Demonstreerib kogu GenAIOps töövoogu — prototüüp Promptyga, hindamine AI-assisteeritud hindajatega ja juurutus AZD kaudu Container Appsisse.

**Kiire juurutus**:  
```bash
azd init --template contoso-chat
azd up
```
  
### Loomingulise kirjutamise multi-agent rakendus

**Repo**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Teenused**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kirjeldus**: Multi-agendi näidis, demonstreerides AI agendi orkestreerimist Promptyga. Kasutab uurimisagentuuri (Bing Grounding Azure AI Agent Service’is), tootmisagentuuri (Azure AI Search), kirjutajaagentuuri ja toimetajaagentuuri koostöö artiklite loomiseks. Sisaldab CI/CD-d hindamisega GitHub Actionsis.

**Kiire juurutus**:  
```bash
azd init --template contoso-creative-writer
azd up
```
  
### Serverivaba RAG vestlus (JavaScript/TypeScript)

**Repo**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Teenused**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB NoSQL + LangChain.js

**Kirjeldus**: Täielikult serverivaba RAG vestlusrobot LangChain.js ja Azure Functions koos API ning Azure Static Web Apps hostimisega. Kasutab Azure Cosmos DB-d nii vektorpoodina kui vestluse ajaloo andmebaasina. Toetab lokaalarendust Ollama abil nullkulu testimiseks.

**Kiire juurutus**:  
```bash
azd init --template serverless-chat-langchainjs
azd up
```
  
### Vestlus oma andmetega lahenduse kiirendaja

**Repo**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Teenused**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Kirjeldus**: Ettevõttekvaliteediga RAG lahenduse kiirendaja admin-portaaliga dokumentide üleslaadimiseks ja haldamiseks, mitme orkestreerija valikuga (Semantic Kernel, LangChain, Prompt Flow), kõnetekstiks, Microsoft Teams integratsiooniga ning valikuga PostgreSQL või Cosmos DB taustaks. Mõeldud kohandatavaks lähtepunktiks tootmis-RAG stsenaariumitele.

**Kiire juurutus**:  
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```
  
### AI reisiagentid — Multi-Agendi MCP orkestreerimine

**Repo**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Teenused**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP serverid (.NET, Python, Java, TypeScript)

**Kirjeldus**: Viiterakendus mitme agendi AI orkestreerimiseks kolmel raamistikul (LangChain.js, LlamaIndex.TS ja Microsoft Agent Framework). Sisaldab neljas keeles MCP (Model Context Protocol) servereid, mis on juurutatud serverivabade Azure Container Apps’ina OpenTelemetry jälgimisega.

**Kiire juurutus**:  
```bash
azd init --template azure-ai-travel-agents
azd up
```
  
### Azure AI alguskomplekt

**Repo**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Teenused**: Azure AI teenused + Azure OpenAI

**Kirjeldus**: Minimaalne Bicep mall, mis juurutab Azure AI teenused konfigureeritud masinõppemudelitega. Kerge lähtepunkt, kui on vajadus ainult Azure AI infrastruktuuri proviisorimiseks ilma täieliku rakenduse virna juurutamiseta.

**Kiire juurutus**:  
```bash
azd init --template azd-ai-starter
azd up
```
  
> **Sirvi rohkem malle**: Külastage [Awesome AZD AI Template Gallery’it](https://azure.github.io/awesome-azd/?tags=ai), kus on 80+ AI-spetsiifilist AZD malli eri keeltes ja stsenaariumites.

## Edasised sammud

1. **Proovige näidiseid**: Alustage valmis malliga, mis vastab teie kasutusjuhtumile  
2. **Kohandage enda vajadustele**: Muutke infrastruktuuri ja rakenduse koodi  
3. **Lisage jälgimine**: Rakendage põhjalik jälgitavus  
4. **Optimeerige kulusid**: Häälestage konfiguratsioone vastavalt eelarvele  
5. **Turvalisus**: Rakendage ettevõtte turvalisuse mustrid  
6. **Skaleerige tootmiskeskkonda**: Lisage mitme regiooni ja kõrge kättesaadavusega funktsioone  

## 🎯 Praktilised harjutused

### Harjutus 1: Microsoft Foundry mudelite vestlusrakenduse juurutamine (30 minutit)  
**Eesmärk**: Juurutada ja testida tootmiskõlbulikku AI vestlusrakendust

```bash
# Algata mall
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Määra keskkonnamuutujad
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Avalda
azd up

# Testi rakendust
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Jälgi tehisintellekti toiminguid
azd monitor

# Puhasta
azd down --force --purge
```
  
**Õnnestumise kriteeriumid:**  
- [ ] Juurutus lõpeb ilma quota vigadeta  
- [ ] Veebibrauseris ligipääs vestlusliidesele  
- [ ] Suudab esitada küsimusi ja saada AI-jõul vastuseid  
- [ ] Application Insights kuvab telemeetria andmeid  
- [ ] Ressursid on edukalt koristatud  

**Hinnanguline kulu**: 5-10 dollarit 30-minutilise testimise eest  

### Harjutus 2: Mitme mudeli juurutuse konfiguratsioon (45 minutit)  
**Eesmärk**: Juurutada mitu AI mudelit erinevate seadistustega

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

# Loo ja kontrolli deploydimist
azd provision
azd show
```
  
**Õnnestumise kriteeriumid:**  
- [ ] Mitu mudelit juurutatud edukalt  
- [ ] Rakendatud erinevad mahutavuse seaded  
- [ ] Mudelid on API kaudu kättesaadavad  
- [ ] Suudab mõlemaid mudeleid rakendusest kutsuda  

### Harjutus 3: Kulude jälgimise rakendamine (20 minutit)  
**Eesmärk**: Seadistada eelarvehoiatused ja kulu jälgimine

```bash
# Lisa eelarve hoiatus Bicep-i
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

# Paigalda eelarve hoiatus
azd provision

# Kontrolli jooksvaid kulusid
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```
  
**Õnnestumise kriteeriumid:**  
- [ ] Eelarvehoiatus loodud Azure’is  
- [ ] Eposti teavitused konfigureeritud  
- [ ] Kulusid saab vaadata Azure portaalis  
- [ ] Eelarve läved on sobivalt seatud  

## 💡 Korduma kippuvad küsimused

<details>  
<summary><strong>Kuidas arenduse ajal Microsoft Foundry mudelite kulusid vähendada?</strong></summary>  

1. **Kasuta tasuta kihti**: Microsoft Foundry Models pakub 50 000 märki kuus tasuta  
2. **Vähenda mahutavust**: Seadista maht 10 TPM asemel 30+ arenduseks  
3. **Kasuta azd down käsku**: Vabasta ressursid, kui aktiivselt ei arenda  
4. **Vahemälu vastused**: Rakenda Redis vahemälu korduvate päringute jaoks  
5. **Kasuta prompt engineeringut**: Vähenda märgikasutust efektiivsete promptidega  

```bash
# Arenduskeskkonna konfiguratsioon
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>  

<details>  
<summary><strong>Mis vahe on Microsoft Foundry mudelitel ja OpenAI API-l?</strong></summary>  

**Microsoft Foundry Models:**  
- Ettevõtte tase turvalisus ja nõuetele vastavus  
- Privaatvõrgu integratsioon  
- SLA garantiid  
- Haldatud identiteediga autentimine  
- Suuremad limiidid saadaval  

**OpenAI API:**  
- Kiirem juurdepääs uutele mudelitele  
- Lihtsam seadistus  
- Madalam sisenemislävi  
- Avalik interneti ligipääs  

Tootmisrakenduste jaoks on soovitatav **Microsoft Foundry Models**.  
</details>  

<details>
<summary><strong>Kuidas käsitseda Microsoft Foundry mudelite eeskirja ületamise (quota exceeded) vigu?</strong></summary>

```bash
# Kontrolli praegust piirmäära
az cognitiveservices usage list --location eastus2

# Proovi erinevat piirkonda
azd env set AZURE_LOCATION westus2
azd up

# Vähenda ajutiselt mahtu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Taotle piirmäära suurendust
# Mine Azure Portaali > Piirmäärad > Taotle suurendust
```
</details>

<details>
<summary><strong>Kas ma saan kasutada oma andmeid Microsoft Foundry mudelitega?</strong></summary>

Jah! Kasutage **Azure AI Search** RAG-i (Retrieval Augmented Generation) jaoks:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Vaadake [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) malli.
</details>

<details>
<summary><strong>Kuidas tagada AI mudelite lõpp-punktide turvalisus?</strong></summary>

**Parimad tavad**:
1. Kasutage Managed Identity't (ilma API võtiteta)
2. Lubage Private Endpoints
3. Konfigureerige võrgu turvagrupid
4. Rakendage kiirusepiirangud
5. Kasutage Azure Key Vaulti saladuste jaoks

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
- **Agentide oskused**: [Microsoft Foundry oskus lehel skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Paigaldage Azure + Foundry agendi oskused oma redaktorisse käsuga `npx skills add microsoft/github-copilot-for-azure`

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: 2. peatükk - AI-esimene arendus
- **⬅️ Eelmine peatükk**: [1. peatükk: Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI mudelite juurutamine](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [3. peatükk: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Vaja abi?** Liituge meie kogukonna aruteludega või avage probleem repos. Azure AI + AZD kogukond on siin, et aidata teil edukas olla!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud arusaamatuste ega valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->