# Microsoft Foundry integreerimine AZD-ga

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esimene arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI agendid](agents.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Ülevaade

See juhend demonstreerib, kuidas integreerida Microsoft Foundry teenuseid Azure Developer CLI-ga (AZD), et sujuvamaks muuta AI rakenduste juurutamist. Microsoft Foundry pakub kõikehõlmavat platvormi AI rakenduste ehitamiseks, juurutamiseks ja haldamiseks, samas kui AZD lihtsustab infrastruktuuri ja juurutusprotsessi.

## Mis on Microsoft Foundry?

Microsoft Foundry on Microsofti ühtne platvorm AI arenduseks, mis sisaldab:

- **Mudelite kataloog**: Ligipääs tipptasemel AI mudelitele
- **Prompt Flow**: Visuaalne disainer AI töövoogude jaoks
- **Microsoft Foundry portaal**: Integreeritud arenduskeskkond AI rakendustele
- **Juurutusvalikud**: Mitmed hostimise ja mahu muutmise võimalused
- **Turvalisus ja vastutus**: Sisseehitatud vastutustundliku AI funktsioonid

## AZD + Microsoft Foundry: Koos paremad

| Funktsioon | Microsoft Foundry | AZD integreerimise eelis |
|---------|-----------------|------------------------|
| **Mudelite juurutus** | Manuaalne portaali kaudu | Automatiseeritud, korduvad juurutused |
| **Infrastruktuur** | Klõpsamisega provisioneerimine | Infrastruktuur koodina (Bicep) |
| **Keskkonna haldus** | Üks keskkond korraga | Mitme keskkonna tugi (dev/staging/prod) |
| **CI/CD integratsioon** | Piiratud | Loomulik GitHub Actions tugi |
| **Kulu juhtimine** | Põhiline jälgimine | Keskkonnapõhine kulu optimeerimine |

## Nõuded

- Azure'i tellimus sobivate õigustega
- Azure Developer CLI paigaldatud
- Ligipääs Microsoft Foundry mudelite teenustele
- Põhiline tuttavus Microsoft Foundryga

> **Väljalaske ülevaade (2026-11-04):** AI CLI juhised kontrolliti `azd` `1.37.2`, agentide `1.0.0-beta.23` ja hindamiste `1.0.0-beta.2` dokumentatsiooni/allika põhjal. Kasutage `azd >= 1.37.0` kombineeritud töövoogude jaoks. Vaadake [väljalaske muudatusi ja parandusi](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); see ülevaade ei kinnita kõiki malle ega SDK näiteid elava juurutuse alusel.

## Põhilised integratsioonimustrid

**Näidete ulatus:** Alljärgnev Bicep sisaldab illustratiivseid ressursitükke, mitte täisväärtuslikku juurutusmalle. Sisaldav mall peab määratlema nimed, `location`, viidatud ressursid, identiteedid, väljundid ja rakenduste hostimise. Kasutage seotud näidet käivitatava lähtepunktina. Bash näited nõuavad Azure CLI autentimist eraldi `azd auth login`-st.

### Muster 1: Microsoft Foundry mudelite integratsioon

**Kasutusjuhtum:** Juurutage vestlusrakendusi Azure OpenAI mudelitega Microsoft Foundrys

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
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
    disableLocalAuth: true
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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Helistajal peab olema liidetud hallatav identiteet ja `Cognitive Services OpenAI User` kontooma ulatuses; võtmete keelamine ei anna juurdepääsu. Kontrollige regiooni/mudeli/SKU saadavust ja kvooti enne juurutamist.

### Muster 2: AI otsing + RAG integratsioon

**Kasutusjuhtum:** Juurutage otsingut ja täiendatud generatsiooni (RAG) rakendusi

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

```

Selle integratsiooni jaoks puudub `Microsoft.Search/searchServices/dataConnections` ARM ressursi tüüp. Konfigureerige otsingu indeks, andmeallikas, indekseerija/oskuste komplekt või vektoriseerija toetatud otsingu API-de kaudu. Kui otsing kutsub manustamismudelit, lubage selle hallatav identiteet, andke vastav mudeli roll ja seadistage manustamisoskused/vektoriseerija. Vaadake [integratsiooni vektoriseerimist](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Muster 3: Dokumendi intelligentsuse integratsioon

**Kasutusjuhtum:** Dokumendi töötlemise ja analüüsi töövood

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

Välja arvatud dokumenteeritud AZD sätted nagu `AZURE_LOCATION`, on need **kohandatud malli sisendi nimed**. Need ei mõjuta midagi, kui mall/rakendus neid parameetrite ja host- keskkonna kaardistuste kaudu ei tarbi. `azure-search-openai-demo` puhul kasutage selle tegelikku nime nagu `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` ja `AZURE_SEARCH_SERVICE_SKU`. Mudeli maht ei ole kontokasutuse SKU.

**Tootmiskonfiguratsioon:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Arenduskonfiguratsioon:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Turvaline konfiguratsioon Key Vaultiga

Eelistage Entra ID-d kohaliku võtmeautentimisega keelatult. Järgnev on ainult **pärandvõtme autentimise alternatiiv** rakendustele, mis võtmeid vajavad: see nõuab kontot võtme autentimisega lubatuna, rakenduse identiteeti hostil ja Key Vaulti ligipääsu/võrguühendust. Ärge kombineerige võtme päringut `disableLocalAuth: true`-ga ja oodake võtme-põhiste kõnede toimimist.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

AZD pakub laiendusi, mis lisavad AI-spetsiifilisi võimalusi Microsoft Foundry teenustega töötamiseks:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

AI laiendused arenevad endiselt kiiresti eelvaates. Kui käsk käitub teistmoodi kui siin näidatud, uuendage vastavat laiendust enne projekti enda tõrkeotsingut.

### Agendi-põhine juurutus `azd ai` abil

Kasutage `azd ai agent init` interaktiivselt või rakendage hetkel aktuaalne `azure.yaml` agendi projekti mall, mis on ühendatud Foundry Agent Service'iga:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` asendab aegunud `--manifest`/`-m` kirjavahemärgi; pärandmanifesti ja pesastatud agendi konfiguratsiooni tuleb jätkuvalt migreerida. Hinnake agente `azd ai eval` abil `azure.ai.evaluations`-st, mitte eemaldatud pärandtöövoo kaudu. Vaadake [hindamise migratsiooni](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) seadistuse, täitmise ja tulemuste kohta.

Täieliku käsurea viite ja lippude kohta vaadake [AZD AI CLI käskude dokumentatsiooni](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Ühe käsuga juurutus

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Keskkonnapõhised juurutused

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

## Jälgimine ja vaatlus

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
```

See loob Insights ressursi, mitte telemeetriainseneri. Kui teie rakendus saadab väljuvaid mudelikõnede mõõtemärke, käivitage see illustratiivne päring Application Insights logides (kohandage filtreid vastavalt tegelikele jälgede nimedele):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Kulu jälgimine

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Kasutage tegelikku saajat ja kontrollige arvelduse ulatusi õigusi. Eelarve saadab hoiatusi; see ei ole kulupiirang.

## 🔐 Turvalisuse parimad praktikad

### Hallatava identiteedi konfiguratsioon

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

See lõpp-punkti fragment vajab ka privaatset DNS tsooni/gruppi, VNet linke, rakenduse VNet ühenduvust ja avaliku juurdepääsu poliitikat. Privaatse lõpp-punkti loomine üksi ei keela avalikku ligipääsu.

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

### Vahemälu strateegiad

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache for Redis Basic/Standard/Premium on [väljasuremise teel](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); kasutage uutes juurutustes Azure Managed Redisit ja järgige selle hetke malli ja autentimisjuhiseid. Vahemälus hoitavad AI vastused tuleks piirata autoriseerimise, mudeli/juhiste ja andmeversiooni alusel ning aegumisega; ärge kunagi jagage privaatseid vastuseid ainult päringu teksti põhjal.

### Automaatse mahu muutmise konfiguratsioon

**Osaline ressurss:** lisage need mahu/sisenemise sätted täielikku konteinerirakendusse, millel on hallatav keskkond, konteineripilt ja ressursipiirangud. Rohkem koopiad ei suurenda mudelifaili kvooti.

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

## Kõige tavalisemate probleemide tõrkeotsing

### Probleem 1: OpenAI kvota ületatud

**Sümptomid:**
- Juurutus ebaõnnestub kvota vigadega
- 429 veateateid rakenduse logides

**Lahendused:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Ülalmainitud maht muutujat kasutatakse ainult kohandatud mallis, mis on seadistatud selle tarbimiseks. RAG näite jaoks kasutage `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ärge muutke `AZURE_LOCATION` olemasolevate ressursside teisaldamiseks; looge uus keskkond uues regioonis ja planeerige migratsioon/puhastus.

### Probleem 2: Autentimise vead

**Sümptomid:**
- 401/403 vead AI teenustele helistamisel
- "Juurdepääs keelatud" sõnumid

**Lahendused:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Probleem 3: Mudelite juurutamise probleemid

**Sümptomid:**
- Mudelid ei ole juurutuses saadaval
- Konkreetsete mudeliversioonide tõrged

**Lahendused:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Näidismallid

Need on alternatiivid, mitte järjestikulised käsud. Alustage igaüks eraldi tühjas kaustas. Selgelt määratletud `.` sihtkoht jätab initsialiseerimise teie praegusesse kausta; vastasel juhul võib AZD luua mallinimega alamkausta ilma töökausta muutmata.

### RAG vestlusrakendus (Python)

**Repositsioon**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Kirjeldus**: RAG vestlusnäidis küsimusteks teie dokumentide põhjal, koos Azure AI Search taasteenusega. Vaadake üle praeguse näidise toetatud mudelid, valikulised funktsioonid, kulu juhised ja tootmiskõlblikkuse nõuded enne kasutamist; näidise juurutamine ei muuda rakendust tootmiseks valmis.

**Kiirstart**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG vestlusrakendus (.NET)

**Repositsioon**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Kirjeldus**: .NET/C# vastendus Python RAG vestlusnäitele. Ehitatud ASP.NET Core Minimal API ja Blazor WebAssembly frontendiga. Sisaldab häälvestlust, GPT-4o-mini nägemise tuge ja kaaslast .NET MAUI Blazor Hybrid lauaarvuti/mobiilseadme kliendi jaoks.

**Kiirstart**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG vestlusrakendus (Java)

**Repositsioon**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Teenused**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Kirjeldus**: Java versioon RAG vestlusnäitest, kasutades Langchain4J AI orkestreerimiseks. Toetab mikroteenuste sündmuslähtelist arhitektuuri, mitut otsingustrateegiat (tekst, vektor, hübriid), dokumentide üleslaadimist Azure Document Intelligence abil ja juurutust Azure Container Apps-is või Azure Kubernetes Service'is.

**Kiirstart**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Ettevõtte jaemüügi kaasabi Microsoft Foundryga

**Repositsioon**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Teenused**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Kirjeldus**: Lõpp-kuni-lõppeni jaemüügi RAG kaasab Microsoft Foundry ja Prompty abil. Contoso Outdoor jaemüüja vestlusrobot, mis tugineb toodete kataloogi ja kliendi tellimuste andmetele. Demonstreerib kogu GenAIOps töövoogu — prototüüp Prompty abil, hindamine AI poolt abistatud hindajatega ja juurutus AZD kaudu Container Apps.

**Kiirstart**:
```bash
azd init --template contoso-chat .
azd up
```

### Loova kirjutamise mitmeagendi rakendus

**Repositsioon**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Teenused**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Kirjeldus**: Mitmeagendi näidis AI agendi orkestreerimisega Prompty kasutades. Kasutab uurimisagenti (Bing Grounding Azure AI Agent Service'is), tootmisagentuuri (Azure AI Search), kirjutajaagenti ja toimetajaagenti, et koostöös luua põhjalikke artikleid. Sisaldab CI/CD süsteemi hindamisega GitHub Actions.

**Kiirstart**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverivaba RAG vestlus (JavaScript/TypeScript)

**Repositsioon**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Teenused**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Kirjeldus**: Täiesti serverivaba RAG vestlusrobot, kasutades LangChain.js koos Azure Functions API ja Azure Static Web Apps hostimise jaoks. Kasutab Azure Cosmos DB-d nii vektorihoidla kui vestlusajaloo andmebaasina. Toetab kohalikku arendust Ollama abil tasuta testimiseks.

**Kiirstart**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Vestlus oma andmetega – lahenduse kiirendi

**Repositsioon**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Teenused**: Microsoft Foundry + Azure Container Apps (veeb/API/ingestioon) + Azure AI Search koos Cosmos DB või PostgreSQL pgvectoriga

**Kirjeldus**: Dokumentidel põhinev vestluskiirendi koos tsitaatidega. Praegune näidis majutab React frontend’i, FastAPI backend’i ja Functions ingestioonitöötaja Container Appsis; orkestreerijatena on Agent Framework ja LangGraph. Andmebaasi/taaste valikud valitakse juurutuse ajal. See on lähtepunkt, mitte kohandatud tootmissüsteem; ärge eeldage, et vanemad App Service, Semantic Kernel või Prompt Flow variandid kirjeldavad praegust vaikimisi.

**Kiirstart**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI reisibüroo agendid — mitmeagendi MCP orkestreerimine

**Repositsioon**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Teenused**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Kirjeldus**: Viiterakendus mitmeagendi AI orkestreerimiseks, kasutades kolme raamistikku (LangChain.js, LlamaIndex.TS ja Microsoft Agent Framework). Sisaldab MCP (Model Context Protocol) servereid neljas keeles, mis on juurutatud serverivabade Azure Container Apps lahendusena koos OpenTelemetry jälgimisega.

**Kiire algus**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Sirvige rohkem malle**: Külastage [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai), et leida praegu saadaval olevad mallid erinevates keeltes ja stsenaariumites. Iga lingitud näide on välise hoidla näide, mitte selle kursuse poolt pakutav kohalik näide; vaadake enne juurutamist selle praeguseid eeltingimusi ja tootmisalaseid juhiseid.

## Järgmised sammud

1. **Proovige näiteid**: Alustage valmis malliga, mis vastab teie kasutusjuhtumile
2. **Kohandage vastavalt vajadusele**: Muutke infrastruktuuri ja rakenduse koodi
3. **Lisage jälgimine**: Rakendage täielik jälgitavus
4. **Optimeerige kulusid**: Seadistage konfiguratsioonid oma eelarve järgi
5. **Turvake oma juurutus**: Rakendage ettevõtte turvavaldkonnad
6. **Skaalake tootmisse**: Lisage mitme regiooni ja kõrge kättesaadavusega funktsioonid

## 🎯 Praktikalised ülesanded

### Ülesanne 1: Microsoft Foundry mudelite vestlusrakenduse juurutamine (30 minutit)
**Eesmärk**: Juurutage ja testige AI-vestluse viiterakendust

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**Õnnestumise kriteeriumid:**
- [ ] Juurutamine lõpeb ilma kvotavigadeta
- [ ] Juurdepääs vestlusliidesele brauseris
- [ ] Võimalus esitada küsimusi ja saada AI-põhiseid vastuseid
- [ ] Application Insights näitab telemeetriaandmeid
- [ ] Ressursid edukalt koristatud

**Kulu:** Kontrollige enne juurutamist näidiskulu juhendit ja valitud SKUsid. Arveldamine jätkub kuni ressursside kustutamiseni; fikseeritud 30-minutilist hinnangut ei saa iga konfiguratsiooniga rakendada.

### Ülesanne 2: Mitme mudeli juurutuse konfigureerimine (45 minutit)
**Eesmärk**: Juurutada mitu AI mudelit erinevate konfiguratsioonidega

**Alguspunkt:** Olemasolev Azure OpenAI konto ja AZD ressurssgrupi moodul, mis saab kutsuda seda faili. Looge `infra/ai-models.bicep` järgmise sisuga oma tekstiredaktoris. See ei juurutata automaatselt ainult sellepärast, et see asub all `infra/`.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
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
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Lisage kontole kuuluva ressurssgrupi mooduli alt mooduli kutse (kohandage sümbolinimi oma kontole):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Ärge deklareerige samu juurutusi mõlemas moodulis. Kui AZD sisenemispunkt on tellimuseulatuses, kutsuge see ressurssgrupi ulatuses lapse moodulist ja kohandage suhtelist rada. Koostage see sisaldav moodul käsuga `az bicep build --file <path-to-containing-module>`, seejärel:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Õnnestumise kriteeriumid:**
- [ ] Mitme mudeli edukas juurutus
- [ ] Erinevate võimsusseadete rakendamine
- [ ] Mudelitele ligipääs API kaudu
- [ ] Võimalus kutsuda mõlemaid mudeleid rakendusest

### Ülesanne 3: Kulujälgimise rakendamine (20 minutit)
**Eesmärk**: Seadistada eelarvehoiatused ja kulude jälgimine

**Alguspunkt:** Ülaltoodud eelarvemuster ja ressurssgrupi ulatuses infrastruktuuri moodul. Lisage see ressurss oma tekstiredaktori abil; andke parameetrite kaardistusest edasi `budgetStartDate` (ära dubleeri parameetrit, kui see on juba deklareeritud). Asendage saaja ja kinnitage, et teil on eelarve kirjutusõigus.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Oodatav: vastuses on `amount: 200`, mõlemad lävendid ja teie saaja. Kontrollige tegelikke kulusid portaali Kulude haldamise sektsioonis; kulude andmed on viivitusega ja hoiatus ei pruugi lühikese harjutuse ajal käivituda.

**Õnnestumise kriteeriumid:**
- [ ] Eelarvehoiatus loodud Azure'is
- [ ] E-posti teavitused konfigureeritud
- [ ] Võimalus vaadata kulude andmeid Azure portaalis
- [ ] Eelarve lävendid vastavalt seadistatud

## 💡 Korduma kippuvad küsimused

<details>
<summary><strong>Kuidas arendada Microsoft Foundry mudelite kulusid madalamaks?</strong></summary>

1. **Kontrollige hinnakirja**: Azure OpenAI mudelite jaoks ei ole universaalset tasuta 50 000 tokeni kuupõhist limiiti
2. **Suurus õigeks seadke**: Võimsus `10` tähistab tavaliselt nende Standard tekstimudelite jaoks 10 000 TPM, mitte 10 TPM. Kiiruspiiri vähendamine ei vähenda tokeni hinda
3. **Kasutage azd down**: Kustutage ajutised ressursid, kui te aktiivselt ei arenda (see ei ole deallokatsioon)
4. **Vahemälu vastuseid**: Rakendage Redis vahemälu korduvatele päringutele
5. **Kasuta prompti inseneritehnikat**: Vähendage tokenite tarbimist tõhusate promptidega

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Mis vahe on Microsoft Foundry mudelitel ja OpenAI API-l?</strong></summary>

**Microsoft Foundry mudelid**:
- Ettevõtte turvalisus ja vastavus
- Privaatvõrgu integratsioon
- SLA garantii
- Hallatud identiteedi autentimine
- Kõrgemad kvotid saadaval

**OpenAI API**: Eri pakkuja/API, millel on oma mudelite saadavus, hinnakujundus, autentimine ja ettevõtte ühenduvuse võimalused. Võrdlege praeguseid pakkumisi, selle asemel et eeldada, et see on vaid avalik-interneti jaoks või mudelid tarnitakse alati esimesena.

Valige põhinedes oma organisatsiooni nõudmistel; selle kursuse Azure-spetsiifilised hallatud identiteedi ja privaatlinkide näited kehtivad Azure'i hostitud teenustele, mitte iga mudeli/pakkuja kohta Foundry kataloogis.
</details>

<details>
<summary><strong>Kuidas käsitleda Microsoft Foundry mudelite kvota ületamise vigu?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Kas saan kasutada oma andmeid Microsoft Foundry mudelitega?</strong></summary>

Jah! Kasutage **Azure AI Search** RAG (Retrieval Augmented Generation) jaoks:

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Vaadake [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) malli.
</details>

<details>
<summary><strong>Kuidas turvata AI mudeli lõpp-punktid?</strong></summary>

**Parimad tavad**:
1. Kasutage hallatud identiteeti (ilma API võtiteta)
2. Lülitage sisse privaatlõpp-punktid
3. Konfigureerige võrgu turvagrupid
4. Rakendage kiiruspiirang
5. Kasutage saladuste hoidmiseks Azure Key Vaulti

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
- **Agentide oskused**: [Microsoft Foundry oskus skills.sh saidil](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Installige Azure + Foundry agendi oskused oma tekstiredaktori abil `npx skills add microsoft/github-copilot-for-azure`

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-eesmärksete arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Teie esimene projekt](../chapter-01-foundation/first-project.md)
- **➡️ Järgmine**: [AI agendid](agents.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfigureerimine](../chapter-03-configuration/configuration.md)

**Vaja abi?** Liituge meie kogukonna aruteludega või avage hoidlas küsimus. Azure AI + AZD kogukond on siin, et aidata teil edukaks saada!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->