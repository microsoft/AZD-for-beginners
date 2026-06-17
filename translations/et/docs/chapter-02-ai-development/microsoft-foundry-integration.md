# Microsoft Foundry integreerimine AZD-ga

**Lõikude navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune lõik**: Lõik 2 - AI-eskse arenduse loomine
- **⬅️ Eelmine lõik**: [Lõik 1: Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **🚀 Järgmine lõik**: [Lõik 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Ülevaade

See juhend demonstreerib, kuidas integreerida Microsoft Foundry teenused Azure Developer CLI (AZD)-ga, et lihtsustada AI rakenduste juurutamist. Microsoft Foundry pakub kõikehõlmavat platvormi AI rakenduste ülesehitamiseks, juurutamiseks ja haldamiseks, samas kui AZD lihtsustab infrastruktuuri ja juurutamise protsessi.

## Mis on Microsoft Foundry?

Microsoft Foundry on Microsofti ühtne AI arendusalane platvorm, mis sisaldab:

- **Mudelite kataloog**: Juhtivate AI mudelite juurde pääs
- **Prompt Flow**: AI töövoogude visuaalne kujundaja
- **Microsoft Foundry portaal**: Integreeritud arenduskeskkond AI rakendustele
- **Juurutamisvõimalused**: Mitmed hostimise ja mastaapimise variandid
- **Turvalisus ja ohutus**: Sisseehitatud vastutustundliku AI funktsioonid

## AZD + Microsoft Foundry: koos parem

| Funktsioon | Microsoft Foundry | AZD integreerimise eelis |
|------------|-------------------|--------------------------|
| **Mudeli juurutamine** | Käsitsi portaali kaudu | Automatiseeritud, korduvad juurutused |
| **Infrastruktuur** | Klikitav juurutus | Infrastructure as Code (Bicep) |
| **Keskkonna haldus** | Üks keskkond | Mitmekeskkond (dev/staging/prod) |
| **CI/CD integratsioon** | Piiratud | Loomupärane GitHub Actions tugi |
| **Kulu juhtimine** | Lihtne jälgimine | Keskkonnapõhine kulude optimeerimine |

## Eeltingimused

- Azure tellimus sobivate õigustega
- Azure Developer CLI paigaldatud
- Juurdepääs Microsoft Foundry mudelite teenustele
- Põhilised teadmised Microsoft Foundry'st

> **Praegune AZD baasversioon:** Need näited on testitud `azd` versiooniga `1.23.12`. AI agendi töövoo jaoks kasuta viimast eelvaate laienduse versiooni ja kontrolli enne alustamist oma paigaldatud versiooni.

## Põhjuskuptiga integratsioonimustrid

### Muster 1: Microsoft Foundry mudelite integratsioon

**Kasutusjuhtum**: Juurutamine vestlusrakendustele Microsoft Foundry mudelite abil

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

**Kasutusjuhtum**: Juurutamine otsingu-põhiste generatsioonirakenduste (RAG) jaoks

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

### Muster 3: Dokumentide intelligentsuse integratsioon

**Kasutusjuhtum**: Dokumenditöötluse ja analüüsi töövood

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
# Põhi tehisintellekti teenused
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
# Kuluefektiivsed seadistused arenduseks
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

## Juurutamise töövood

### AZD laiendused Foundry jaoks

AZD pakub laiendusi, mis lisavad AI-spetsiifilisi võimeid Microsoft Foundry teenustega töötamiseks:

```bash
# Paigalda Foundry agentide laiendus
azd extension install azure.ai.agents

# Paigalda peenhäälestamise laiendus
azd extension install azure.ai.finetune

# Paigalda kohandatud mudelite laiendus
azd extension install azure.ai.models

# Kuva installitud laiendused
azd extension list --installed

# Kontrolli hetkel installitud agendi laienduse versiooni
azd extension show azure.ai.agents
```

AI laiendused on endiselt aktiivses eelvaates. Kui mõni käsk käitub teisiti kui siin näidatud, uuenda asjakohast laiendust enne projekti tõrkeotsingut.

### Agendi-eskne juurutamine käsuga `azd ai`

Kui sul on agendi manifest, kasuta `azd ai agent init` oma projekti algatamiseks, mis on ühendatud Foundry Agent Service-ga:

```bash
# Algatamine agendi manifestist
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Paigalda Azure'isse
azd up
```

Viimased eelvaate versioonid `azure.ai.agents` sisaldavad ka malle-põhist initsialiseerimise tuge käsule `azd ai agent init`. Kui kasutad uuemaid agendi näiteid, vaata laienduse abi, et teada saada täpsed lippude valikud oma versioonis.

Vaata [AZD AI CLI käsud](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) täielikku käsu ja lippude loetelu.

### Ühiskäskluslik juurutamine

```bash
# Paigalda kõik ühe käsuga
azd up

# Või paigalda järk-järgult
azd provision  # Ainult infrastruktuur
azd deploy     # Ainult rakendus

# Pikaajaliste AI rakenduste juurutamiseks azd versioonis 1.23.11+
azd deploy --timeout 1800
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

## 🔐 Turvalisuse parimad praktikad

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

### Automaatne mastaapimine

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

## Sageli esinevate probleemide lahendamine

### Probleem 1: OpenAI limiidi ületamine

**Sümptomid:**
- Juurutuse ebaõnnestumine limiidi vigade tõttu
- 429 vead rakenduste logides

**Lahendused:**
```bash
# Kontrolli praegust kvota kasutust
az cognitiveservices usage list --location eastus

# Proovi erinevat piirkonda
azd env set AZURE_LOCATION westus2
azd up

# Vähenda mahutavust ajutiselt
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probleem 2: Autentimise tõrked

**Sümptomid:**
- 401/403 vead AI teenuste kutsumisel
- "Juurdepääs keelatud" teated

**Lahendused:**
```bash
# Kontrolli rollide määramisi
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrolli hallatava identiteedi konfiguratsiooni
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Kontrolli Key Vaulti juurdepääsu kehtivust
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probleem 3: Mudelite juurutamise probleemid

**Sümptomid:**
- Mudelid ei ole juurutamisel saadaval
- Konkreetsed mudeliversioonid ebaõnnestuvad

**Lahendused:**
```bash
# Loetle piirkonna saadaval olevad mudelid
az cognitiveservices model list --location eastus

# Uuenda mudeli versiooni bicep-mallil
# Kontrolli mudeli mahutavuse nõudeid
```

## Näidismallid

### RAG vestlusrakendus (Python)

**Repo**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kirjeldus**: Kõige populaarsem Azure AI näidis — tootmiseks valmis RAG vestlusrakendus, mis võimaldab esitada küsimusi oma dokumentide kohta. Kasutab GPT-4.1-mini vestluseks, text-embedding-3-large hõlmisteks ning Azure AI Search tõmbamiseks. Toetab multimodaalseid dokumente, kõnesisendit/väljundit, Microsoft Entra autentimist ja Application Insights jälgimist.

**Kiire algus**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG vestlusrakendus (.NET)

**Repo**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kirjeldus**: .NET/C# ekvivalent Pythoni RAG vestlusele. Ehitatud ASP.NET Core Minimal API ja Blazor WebAssembly front-endiga. Sisaldab häälevestlust, GPT-4o-mini nägemist tuge ja kaaslase .NET MAUI Blazor Hybrid töölaua/mobiilse klienti.

**Kiire algus**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG vestlusrakendus (Java)

**Repo**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kirjeldus**: Java versioon RAG vestlustest, kasutades Langchain4J AI orkestreerimiseks. Toetab mikroteenuste sündmuspõhist arhitektuuri, mitut otsingustrateegiat (tekst, vektor, hübriid), dokumentide üleslaadimist Azure Document Intelligence abil ning juurutamist Azure Container Apps või Azure Kubernetes Service peal.

**Kiire algus**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Ettevõtte jaemüügipartner koos Microsoft Foundryga

**Repo**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Teenused**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kirjeldus**: Lõpptarbija jaemüügi RAG abiline Microsoft Foundry ja Prompty abil. Contoso Outdoor jaemüügi vestlusrobot, mis tugineb vastustes toodete kataloogile ja kliendi tellimuse andmetele. Näitab täit GenAIOps töövoogu — prototüüp Promptyga, hindamine AI abiga ja juurutamine AZD-ga Container Apps-sse.

**Kiire algus**:
```bash
azd init --template contoso-chat
azd up
```

### Loovkirjutuse mitme-agendi rakendus

**Repo**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Teenused**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kirjeldus**: Mitme-agendi näidis, mis demonstreerib AI agendi orkestreerimist Prompty abil. Kasutab uurimisagentuuri (Bing Grounding Azure AI Agent Service's), tootmisagentuuri (Azure AI Search), kirjanikuagenti ja toimetajaagenti kaaskondlikult põhjalike artiklite loomiseks. Sisaldab CI/CD koos hindamisega GitHub Actions’is.

**Kiire algus**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverivaba RAG vestlus (JavaScript/TypeScript)

**Repo**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Teenused**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Kirjeldus**: Täiesti serverivaba RAG vestlusteenus, kasutades LangChain.js koos Azure Functions API ja Azure Static Web Apps hostinguga. Kasutab Azure Cosmos DB nii vektorite poena kui vestlusajaloo andmebaasina. Toetab lokaalarendust Ollama abil nullkulu testimiseks.

**Kiire algus**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Vestlus oma andmetega lahenduse kiirendaja

**Repo**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Teenused**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Kirjeldus**: Ettevõtte tasemel RAG lahenduse kiirendaja koos administraatori portaaliga dokumentide üleslaadimiseks/haldamiseks, mitmete orkestreerijate valikutega (Semantic Kernel, LangChain, Prompt Flow), kõnetekstiks, Microsoft Teams integratsiooni ja PostgreSQL või Cosmos DB valikuga tagapool. Mõeldud kohandatavaks lähtepunktiks tootmise RAG stsenaariumide jaoks.

**Kiire algus**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI reisibüroo agendid — Mitme-agendi MCP orkestreerimine

**Repo**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Teenused**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP serverid (.NET, Python, Java, TypeScript)

**Kirjeldus**: Näidisarendus mitme-agendi AI orkestreerimiseks kolme raamistikuga (LangChain.js, LlamaIndex.TS ja Microsoft Agent Framework). Sisaldab MCP (Model Context Protocol) servereid neljas keeles, juurutatud serverivabalt Azure Container Apps'is koos OpenTelemetry jälgimisega.

**Kiire algus**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repo**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Teenused**: Azure AI teenused + Azure OpenAI

**Kirjeldus**: Minimalistlik Bicep mall, mis juurutab Azure AI teenused konfigureeritud masinõppemudelitega. Kergekaaluline alguspunkt, kui vajad vaid Azure AI infrastruktuuri ilma täismahus rakenduse virnata.

**Kiire algus**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Sirvi rohkem malle**: Vali [Awesome AZD AI malligalerii](https://azure.github.io/awesome-azd/?tags=ai) üle 80 AI-spetsiifilise AZD malliga erinevates keeltes ja stsenaariumites.

## Järgmised sammud

1. **Proovi näiteid**: Alusta valmis mallist, mis sobib sinu kasutusjuhtumiga
2. **Kohanda vastavalt vajadusele**: Muuda infrastruktuuri ja rakenduse koodi
3. **Lisa jälgimine**: Rakenda terviklik jälgitavus
4. **Optimeeri kulud**: Häälesta konfiguratsioonid oma eelarvele vastavaks
5. **Tugevda turvalisust**: Rakenda ettevõtte turvalisuse mustreid
6. **Skaleeri tootmisse**: Lisa mitme regiooni ja kõrge kättesaadavusega funktsioonid

## 🎯 Praktilised ülesanded

### Ülesanne 1: Juuruta Microsoft Foundry mudelite vestlusrakendus (30 minutit)
**Eesmärk**: Juurutada ja testida tootmiskõlblikku AI vestlusrakendust

```bash
# Initsialiseeri mall
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Määra keskkonnamuutujad
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Käivita
azd up

# Testi rakendust
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Jälgi tehisintellekti toiminguid
azd monitor

# Puhasta üles
azd down --force --purge
```

**Edu kriteeriumid:**
- [ ] Juurutamine lõpeb ilma limiidi vigadeta
- [ ] Saab avada vestluse kasutajaliidese brauseris
- [ ] Saab esitada küsimusi ja saada AI-põhiseid vastuseid
- [ ] Application Insights kuvab telemeetriaandmeid
- [ ] Edukas ressursside puhastus

**Hinnanguline kulu**: 5-10 dollarit 30-minutilise testimise eest

### Ülesanne 2: Konfigureeri mitmemudeline juurutus (45 minutit)
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

**Edu kriteeriumid:**
- [ ] Mitmed mudelid juurutatud edukalt
- [ ] Rakendatud erinevad võimsuse seaded
- [ ] Mudelid API kaudu ligipääsetavad
- [ ] Saab kutsuda mõlemat mudelit rakendusest

### Ülesanne 3: Rakenda kulu jälgimine (20 minutit)
**Eesmärk**: Seadista eelarve hoiatused ja kulude jälgimine

```bash
# Lisa eelarvehoiatus Bicep-ile
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

# Käivita eelarvehoiatus
azd provision

# Kontrolli praeguseid kulusid
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Edu kriteeriumid:**
- [ ] Azure’is loodud eelarve hoiatus
- [ ] E-posti teavitused konfigureeritud
- [ ] Saab vaadata kulude andmeid Azure portaali kaudu
- [ ] Eelarve läved sobivalt määratud

## 💡 Kõige sagedasemad küsimused

<details>
<summary><strong>Kuidas vähendada Microsoft Foundry mudelite kulusid arenduse ajal?</strong></summary>

1. **Kasu tasuta tasemest**: Microsoft Foundry mudelitel on 50 000 tokenit kuus tasuta
2. **Vähenda võimsust**: Sea võimsus 10 TPM peale arenguferiis 30+ asemel
3. **Kasuta käsku azd down**: Vabasta ressursid, kui aktiivselt ei arenda
4. **Cache'i vastused**: Rakenda Redis vahemälu korduvate päringute jaoks
5. **Kasuta Prompt Engineeringut**: Vähenda tokenite kasutust efektiivsete promptidega
```bash
# Arenduskonfiguratsioon
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mis vahe on Microsoft Foundry mudelite ja OpenAI API-l?</strong></summary>

**Microsoft Foundry mudelid**:
- Ettevõtte turvalisus ja vastavus
- Privaatvõrgu integratsioon
- SLA garantiid
- Hallatud identiteedi autentimine
- Suurem kvantiteet saadaval

**OpenAI API**:
- Kiirem juurdepääs uutele mudelitele
- Lihtsam seadistus
- Madalam lävepakkumiskünnis
- Avalik internet ainult

Tootmiskeskkonna rakendustele on **soovitatav Microsoft Foundry mudelid**.
</details>

<details>
<summary><strong>Kuidas ma käsitlen Microsoft Foundry mudelite kvantiteedi ületamise vigu?</strong></summary>

```bash
# Kontrolli praegust piirmäära
az cognitiveservices usage list --location eastus2

# Proovi teist regioon
azd env set AZURE_LOCATION westus2
azd up

# Vähenda ajutiselt mahtu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Taotle piirmäära suurendust
# Mine Azure Portal > Piirmäärad > Taotle suurendust
```
</details>

<details>
<summary><strong>Kas ma saan kasutada oma andmeid Microsoft Foundry mudelitega?</strong></summary>

Jah! Kasuta **Azure AI Search** RAG (Retrieval Augmented Generation) jaoks:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Vaata [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) näidismalli.
</details>

<details>
<summary><strong>Kuidas turvata tehisintellekti mudelite lõpp-punkte?</strong></summary>

**Parimad tavad**:
1. Kasuta hallatud identiteeti (ilma API võtmeteta)
2. Luba privaatlõpp-punktid
3. Sea võrguturbe grupid
4. Rakenda kiirusepiirangud
5. Kasuta saladuste haldamiseks Azure Key Vaulti

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
- **Agentide oskused**: [Microsoft Foundry oskus aadressil skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) – Paigalda Azure + Foundry agendi oskused oma redaktoris käsuga `npx skills add microsoft/github-copilot-for-azure`

---

**Lõigu navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune lõik**: Lõik 2 - AI-esimene arendus
- **⬅️ Eelmine lõik**: [Lõik 1: Sinu esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI mudelite juurutamine](ai-model-deployment.md)
- **🚀 Järgmine lõik**: [Lõik 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Vajad abi?** Liitu meie kogukonnaga aruteludes või ava küsimus hoidlas. Azure AI + AZD kogukond on siin, et sind aidata!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->