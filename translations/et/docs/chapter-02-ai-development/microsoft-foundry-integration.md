# Microsoft Foundry integratsioon AZD-ga

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esimene arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI mudeli juurutus](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Ülevaade

See juhend demonstreerib, kuidas integreerida Microsoft Foundry teenused Azure Developer CLI-ga (AZD), et lihtsustada AI rakenduste juurutamist. Microsoft Foundry pakub kõikehõlmavat platvormi AI rakenduste ehitamiseks, juurutamiseks ja haldamiseks, samas kui AZD lihtsustab infrastruktuuri ja juurutamisprotsessi.

## Mis on Microsoft Foundry?

Microsoft Foundry on Microsofti ühtne platvorm AI arenduseks, mis sisaldab:

- **Mudelite kataloog**: Juhtiva AI mudelite juurdepääs
- **Prompt Flow**: Visuaalne disainer AI töövoogude jaoks
- **Microsoft Foundry portaal**: Integreeritud arenduskeskkond AI rakendustele
- **Juurutusvõimalused**: Mitmed majutuse ja skaleerimise valikud
- **Ohutus ja turvalisus**: Sisseehitatud vastutustundliku AI funktsioonid

## AZD + Microsoft Foundry: Paremini koos

| Funktsioon | Microsoft Foundry | AZD integratsiooni eelis |
|---------|-----------------|------------------------|
| **Mudelite juurutus** | Käsitsi portaali kaudu juurutamine | Automaatne ja korduv juurutus |
| **Infrastruktuur** | Klikitava kaudu haldamine | Infrastruktuur koodina (Bicep) |
| **Keskkonna haldus** | Üks keskkond korraga | Mitmekeskkond (arendus/katse/tootmine) |
| **CI/CD integreerimine** | Piiratud | Looduslik GitHub Actions tugi |
| **Kulu haldus** | Põhiline monitooring | Keskkonnapõhine kulu optimeerimine |

## Eeltäidised

- Õigustega Azure tellimus
- Azure Developer CLI installitud
- Juurdepääs Microsoft Foundry mudelite teenustele
- Põhiteadmised Microsoft Foundryst

> **Praegune AZD versioon:** Need näited kontrolliti `azd` `1.27.1` vastu. AI agente töövoo puhul kasutage praegust eelvaate laiendust ja kontrollige oma installitud versiooni enne alustamist.

## Põhisintegratsiooni mustrid

### Muster 1: Microsoft Foundry mudelite integratsioon

**Kasutusjuhtum**: Juurutamine vestlusrakendustega Microsoft Foundry mudelitega

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

**Kasutusjuhtum**: Juurutamine taaskasutusel põhinevate genereerimisrakendustega (RAG)

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

## 🔧 Konfiguratsiooni mustrid

### Keskkonnamuutujate seadistamine

**Tootmise konfiguratsioon:**
```bash
# Tuuma tehisintellekti teenused
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Mudeli konfiguratsioonid
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Jõudluse seaded
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Arenduse konfiguratsioon:**
```bash
# Kulutõhusad seaded arendamiseks
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

AZD pakub laiendusi, mis lisavad AI-spetsiifilisi võimalusi Microsoft Foundry teenuste kasutamiseks:

```bash
# Paigalda Foundry agentide laiendus
azd extension install azure.ai.agents

# Paigalda peenhäälestuse laiendus
azd extension install azure.ai.finetune

# Paigalda kohandatud mudelite laiendus
azd extension install azure.ai.models

# Kuva paigaldatud laiendused
azd extension list --installed

# Kontrolli praegu paigaldatud agentide laienduse versiooni
azd extension show azure.ai.agents
```

AI laiendused arenevad kiiresti eelvaates. Kui mõni käsk käitub siin näidatust erinevalt, uuendage vastavat laiendust enne projekti tõrkeotsingut.

### Agendi-esimene juurutus käsuga `azd ai`

Kui teil on agendi manifest, kasutage `azd ai agent init` projekti algatamiseks, mis on ühendatud Foundry Agent teenusega:

```bash
# Algata (initialize'i) agendi manifesti põhjal
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Juhi (deploy) Azure'i
azd up
```

Hiljutised `azure.ai.agents` eelvaate versioonid lisasid mallipõhise initsialiseerimise toe `azd ai agent init` jaoks. Kui järgite uuemaid agendi näiteid, kontrollige laienduse abi täpsete lipumärkide kohta teie paigaldatud versioonis.

Vaadake täielikku käsu viidet ja lippe [AZD AI CLI käskude alt](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Ühe käsuga juurutus

```bash
# Paiguta kõik ühe käsuga
azd up

# Või paiguta järk-järgult
azd provision  # Ainult infrastruktuur
azd deploy     # Ainult rakendus

# Pikatoimeliste tehisintellekti rakenduste paigaldamiseks azd 1.23.11+ versioonis
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

## Monitooring ja jälgitavus

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

### Kulu monitooring

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

## 🔐 Turvalisuse head tavad

### Halduse identiteedi konfiguratsioon

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

### Võrguturve

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

### Automaatne skaleerimine konfiguratsioon

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

## Levinud probleemide tõrkeotsing

### Probleem 1: OpenAI piirang ületatud

**Sümptomid:**
- Juurutus nurjub piirangutega
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
- 401/403 vead AI teenuste kutsumisel
- „Juurdepääs keelatud” teated

**Lahendused:**
```bash
# Kontrolli rolli määramisi
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kontrolli hallatava identiteedi konfiguratsiooni
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Kontrolli Key Vaulti juurdepääsu õigusi
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probleem 3: Mudelite juurutamise vead

**Sümptomid:**
- Mudelid pole juurutuses saadaval
- Konkreetsed mudeliversioonid ebaõnnestuvad

**Lahendused:**
```bash
# Loetle piirkonna saadaval olevad mudelid
az cognitiveservices model list --location eastus

# Uuenda mudeli versiooni bicep-mallil
# Kontrolli mudeli võimsusnõudeid
```

## Näidismallid

### RAG vestlusrakendus (Python)

**Ladustamine**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kirjeldus**: Kõige populaarsem Azure AI näidis — tootmiseks valmis RAG vestlusrakendus, mis võimaldab esitada küsimusi oma dokumentide kohta. Kasutab GPT-4.1-mini vestluseks, text-embedding-3-large manustamiseks ja Azure AI Search andmete toomiseks. Toetab multimodaalseid dokumente, kõne sisendit/väljundit, Microsoft Entrat autentimiseks ja Application Insights jälgimist.

**Kiire algus**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG vestlusrakendus (.NET)

**Ladustamine**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kirjeldus**: .NET/C# ekvivalent Python RAG vestluse näitele. Ehitatud ASP.NET Core Minimal API ja Blazor WebAssembly esiküljele. Sisaldab hääle vestlust, GPT-4o-mini nägemis tuge ja kaaslast .NET MAUI Blazor Hybrid lauaarvuti/ mobiiliklienti.

**Kiire algus**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG vestlusrakendus (Java)

**Ladustamine**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kirjeldus**: Java versioon RAG vestluse näidistest kasutades Langchain4J AI orkestreerimiseks. Toetab mikroteenuste sündmuspõhist arhitektuuri, mitut otsingustrateegiat (tekst, vektor, hübriid), dokumendilaadimisi Azure Document Intelligenciga ja juurutust kas Azure Container Appsis või Azure Kubernetes Service'is.

**Kiire algus**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Ettevõtte jaemüügi assistent Microsoft Foundryga

**Ladustamine**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Teenused**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kirjeldus**: Täielik jaemüügi RAG assistent Microsoft Foundry ja Prompty abil. Contoso Outdoor jaeketi vestlusrobot, mis tugineb toodete kataloogile ja kliendi tellimuste andmetele. Näitab kogu GenAIOps töövoogu — prototüüpimine Promptyga, hindamine AI-abiliste hindajate poolt ja juurutamine AZD-ga Container Appsis.

**Kiire algus**:
```bash
azd init --template contoso-chat
azd up
```

### Loovkirjutamise mitmeagendi rakendus

**Ladustamine**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Teenused**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kirjeldus**: Mitmeagendi näidis, mis demonstreerib AI agendi orkestreerimist Prompty abil. Kasutab uurimisagentuuri (Bing Grounding Azure AI Agent teenuses), tootearenduse agentuuri (Azure AI Search), kirjatöö agentuuri ja toimetaja agentuuri koos koostöös hästi uuritud artiklite loomiseks. Sisaldab CI/CD-d koos hindamisega GitHub Actionsis.

**Kiire algus**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverita RAG vestlus (JavaScript/TypeScript)

**Ladustamine**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Teenused**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Kirjeldus**: Täielikult serverita RAG vestlusrobot kasutades LangChain.js, Azure Functions API jaoks ja Azure Static Web Apps majutamiseks. Kasutab Azure Cosmos DB-d nii vektori hoidla kui vestluse ajaloo andmebaasina. Toetab kohalikku arendust Ollama abil nullkulu testimiseks.

**Kiire algus**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Vestlus oma andmetega lahenduse kiirendaja

**Ladustamine**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Teenused**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Kirjeldus**: Ettevõtte tasemel RAG lahenduse kiirendaja administreerimisportaaliga dokumentide üleslaadimiseks ja haldamiseks, mitu orkestreerija valikut (Semantic Kernel, LangChain, Prompt Flow), kõne tekstiks teisendamine, Microsoft Teams integratsioon ja valiku võimalus PostgreSQL või Cosmos DB taustal. Mõeldud kohandatavaks lähtepunktiks tootmise RAG stsenaariumide jaoks.

**Kiire algus**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI reisiseltsi agendid — mitmeagendi MCP orkestreerimine

**Ladustamine**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Teenused**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP serverid (.NET, Python, Java, TypeScript)

**Kirjeldus**: Viitenäidis mitmeagendi AI orkestreerimiseks kasutades kolme raamistikku (LangChain.js, LlamaIndex.TS ja Microsoft Agent Framework). Omab MCP (Model Context Protocol) serverid neljas keeles, mis on juurutatud serverita Azure Container Apps keskkonnas ning millel on OpenTelemetry monitooring.

**Kiire algus**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI algatus

**Ladustamine**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Teenused**: Azure AI teenused + Azure OpenAI

**Kirjeldus**: Minimalistlik Bicep mall, mis juurutab Azure AI teenused seadistatud masinõppemudelitega. Kergekaaluline lähtepunkt, kui on vaja ainult Azure AI infrastruktuuri ilma täis rakenduse virnata.

**Kiire algus**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Sirvige rohkem malle**: Külastage [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) 80+ AI-spetsiifilise AZD malli jaoks eri keeltes ja stsenaariumides.

## Järgmised sammud

1. **Katseta näiteid**: Alusta eelkonfigureeritud malliga, mis sobib sinu kasutusjuhtumiga
2. **Kohanda vastavalt vajadusele**: Muuda infrastruktuuri ja rakenduse koodi
3. **Lisa monitooring**: Rakenda põhjalik jälgitavus
4. **Optimeeri kulusid**: Häälesta konfiguratsioonid vastavalt eelarvele
5. **Turvalisus**: Rakenda ettevõtte turbemustrid
6. **Skaleeri tootmises**: Lisa mitmeregioniline ja kõrge saadavusega moodulid

## 🎯 Praktilised harjutused

### Harjutus 1: Microsoft Foundry mudelite vestlusrakenduse juurutamine (30 minutit)
**Eesmärk**: Juurutamine ja testimine tootmiseks valmis AI vestlusrakendusega

```bash
# Initsialiseeri mall
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Sea keskkonnamuutujad
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

**Õnnestumise kriteeriumid:**
- [ ] Juurutus lõpeb ilma piiranguvigadeta
- [ ] Saab veebibrauseris vestlusliidest kasutada
- [ ] Saab esitada küsimusi ja saada AI-toega vastuseid
- [ ] Application Insights näitab telemeetria andmeid
- [ ] Ressursid puhastatakse edukalt

**Hinnanguline maksumus**: 5–10 dollarit 30-minutilise testimise eest

### Harjutus 2: Mitme mudeli juurutamise konfiguratsioon (45 minutit)
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

# Loo ja kontrolli
azd provision
azd show
```

**Õnnestumise kriteeriumid:**
- [ ] Mitu mudelit juurutatuna edukalt
- [ ] Rakendatud mitmed mahutavuse seaded
- [ ] Mudelitele on API kaudu juurdepääs
- [ ] Saab mõlema mudeli poole rakendusest kutsuda

### Harjutus 3: Kulude monitooringu rakendamine (20 minutit)
**Eesmärk**: Seadistada eelarvehoiatused ja kulude jälgimine

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

# Juhi eelarvehoiatus kasutusele
azd provision

# Kontrolli jooksvaid kulutusi
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Õnnestumise kriteeriumid:**
- [ ] Azure'is loodud eelarvehoiatus
- [ ] E-posti teavitused seadistatud
- [ ] Kulusid saab Azure portaalis vaadata
- [ ] Eelarve piirid määratud sobivalt

## 💡 Korduma kippuvad küsimused

<details>
<summary><strong>Kuidas vähendada Microsoft Foundry mudelite kulusid arenduse ajal?</strong></summary>

1. **Kasuta tasuta taset**: Microsoft Foundry mudelid pakuvad 50 000 tokenit kuus tasuta
2. **Vähenda mahutavust**: Sea mahutavus 10 TPM peale, mitte 30+ arenduseks
3. **Kasuta azd down**: Ressourcen deaktiveerimine kui ei arenda aktiivselt
4. **Vahemälu vastused**: Rakenda Redis vahemälu korduvate päringute jaoks
5. **Kasuta prompt engineeringut**: Vähenda tokenite tarbimist efektiivsete küsimustega


```bash
# Arenduse konfiguratsioon
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mis vahe on Microsoft Foundry mudelitel ja OpenAI API-l?</strong></summary>

**Microsoft Foundry mudelid**:
- Ettevõtte tase turvalisus ja vastavus
- Privaatvõrgu integratsioon
- SLA garantii
- Haldusega identiteedi autentimine
- Suurem mahupiirang saadaval

**OpenAI API**:
- Kiirem ligipääs uutele mudelitele
- Lihtsam seadistamine
- Madalam sissepääsutõke
- Avalik internetiühendus

Tootmisrakenduste jaoks on soovitatav **Microsoft Foundry mudelid**.
</details>

<details>
<summary><strong>Kuidas käsitleda Microsoft Foundry mudelite mahupiirangu ületamise vigu?</strong></summary>

```bash
# Kontrolli praegust piirmäära
az cognitiveservices usage list --location eastus2

# Proovi teist piirkonda
azd env set AZURE_LOCATION westus2
azd up

# Vähenda ajutiselt mahutavust
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Taotle piirmäära tõstmist
# Mine Azure Portaal > Quota'd > Taotle tõstmist
```
</details>

<details>
<summary><strong>Kas ma saan kasutada Microsoft Foundry mudelitega oma andmeid?</strong></summary>

Jah! Kasuta **Azure AI Search** RAG-iks (otsingupõhine täiendus):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Vaata [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) mall.
</details>

<details>
<summary><strong>Kuidas turvata AI mudelite lõpp-punktid?</strong></summary>

**Parimad tavad**:
1. Kasuta Managed Identity (ilma API võtmeteta)
2. Lülita sisse privaatsed lõpp-punktid
3. Konfigureeri võrgu turbarühmad
4. Rakenda päringute piiramist
5. Kasuta Azure Key Vaulti saladuste jaoks

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
- **AZD GitHub**: [Küsimused ja arutelud](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Ametlik dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)
- **Agentide oskused**: [Microsoft Foundry oskus skills.sh lehel](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installi Azure + Foundry agendi oskused oma redaktori abil käsuga `npx skills add microsoft/github-copilot-for-azure`

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esimene arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Sinu esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI mudelite juurutamine](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Vajate abi?** Liituge meie kogukonna aruteludega või esita probleem repositooriumis. Azure AI + AZD kogukond on siin, et aidata sul edu saavutada!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->