# Microsoft Foundry integracija su AZD

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI Pirmoji plėtra
- **⬅️ Ankstesnis skyrius**: [1 skyrius: Jūsų pirmasis projektas](../chapter-01-foundation/first-project.md)
- **➡️ Kitas**: [AI agentai](agents.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

## Apžvalga

Šiame vadove parodyta, kaip integruoti Microsoft Foundry paslaugas su Azure Developer CLI (AZD), kad būtų supaprastinti AI programų diegimai. Microsoft Foundry suteikia išsamią platformą AI programų kūrimui, diegimui ir valdymui, o AZD palengvina infrastruktūros ir diegimo procesą.

## Kas yra Microsoft Foundry?

Microsoft Foundry yra „Microsoft“ suvienyta AI plėtros platforma, kuri apima:

- **Modelių katalogas**: Prieiga prie pažangiausių AI modelių
- **Prompt Flow**: Vaizdinis AI darbo eigų dizaineris
- **Microsoft Foundry portalas**: Integruota AI programų kūrimo aplinka
- **Diegimo parinktys**: Keli talpinimo ir mastelio didinimo variantai
- **Sauga ir saugumas**: Įmontuotos atsakingo AI funkcijos

## AZD + Microsoft Foundry: Geriau kartu

| Funkcija | Microsoft Foundry | AZD integracijos privalumas |
|---------|-----------------|----------------------------|
| **Modelių diegimas** | Rankinis portalo diegimas | Automatizuoti, pakartotiniai diegimai |
| **Infrastruktūra** | Paspaudimais nustatomas įrengimas | Infrastruktūra kaip kodas (Bicep) |
| **Aplinkos valdymas** | Vienos aplinkos aprėptis | Daugiaplatformė aplinka (dev/staging/prod) |
| **CI/CD integracija** | Ribota | Natūrali GitHub Actions palaikymas |
| **Išlaidų valdymas** | Pagrindinė stebėsena | Aplinkai pritaikyta išlaidų optimizacija |

## Prieš sąlygos

- Azure prenumerata su atitinkamomis teisėmis
- Įdiegtas Azure Developer CLI
- Prieiga prie Microsoft Foundry Modelių paslaugų
- Pagrindinis susipažinimas su Microsoft Foundry

> **Išleidimo peržiūra (2026-11-04):** AI CLI gairės buvo patikrintos pagal `azd` `1.37.2`, agentus `1.0.0-beta.23` ir vertinimų `1.0.0-beta.2` dokumentaciją/šaltinį. Naudokite `azd >= 1.37.0` kombinuotai darbo eigai. Žr. [išleidimo pakeitimus ir pataisas](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); ši peržiūra negarantuoja, kad kiekvienas šablonas ar SDK pavyzdys atitinka veikiantį diegimą.

## Pagrindiniai integracijos modeliai

**Pavyzdžių apimtis:** Toliau pateiktame Bicep faile yra iliustracinės išteklių dalys, o ne pilnas diegiamas šablonas. Turinys šablonas turi apibrėžti pavadinimus, `location`, nurodytus išteklius, tapatybes, išvestis ir programų talpinimą. Naudokite susietą pavyzdį kaip vykdomą pradinį tašką. Bash pavyzdžiai reikalauja Azure CLI autentifikacijos atskirai nuo `azd auth login`.

### Modelis 1: Microsoft Foundry modelių integracija

**Naudojimo atvejis**: Diegti pokalbių programas su Azure OpenAI modeliais Microsoft Foundry

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

**Infrastruktūra (main.bicep):**
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

Šauksmui reikalinga prijungta valdoma tapatybė ir `Cognitive Services OpenAI User` paskyros lygiu; raktų išjungimas nesuteikia prieigos. Prieš diegiant patikrinkite regiono/modelio/SKU prieinamumą ir kvotas.

### Modelis 2: AI paieška + RAG integracija

**Naudojimo atvejis**: Diegti atgaminimu papildytas generavimo (RAG) programas

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

Šiai integracijai nėra `Microsoft.Search/searchServices/dataConnections` ARM ištekliaus. Konfigūruokite Paieškos indeksą, duomenų šaltinį, indeksatorių/įgūdžių rinkinį ar vektorizatorių per palaikomus Paieškos duomenų lygio API. Jei Paieška kviečia įdėjimo modelį, įgalinkite jo valdomą tapatybę, suteikite atitinkamą modelio vaidmenį ir sukonfigūruokite įdėjimo įgūdį/vektorizatorių. Žr. [integruotą vektorizaciją](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Modelis 3: Dokumentų intelektas integracija

**Naudojimo atvejis**: Dokumentų apdorojimo ir analizės darbo srautai

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

## 🔧 Konfigūracijos modeliai

### Aplinkos kintamųjų nustatymas

Išskyrus dokumentuotus AZD nustatymus, tokius kaip `AZURE_LOCATION`, tai yra **pasirinktinių šablonų įvesties pavadinimai**. Jie neturi jokios įtakos, jei šablonas/programa jų nepaima per parametrų ir pagrindinės aplinkos susiejimus. Dėl `azure-search-openai-demo` naudokite tikruosius pavadinimus, tokius kaip `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` ir `AZURE_SEARCH_SERVICE_SKU`. Modelio talpa nėra paskyros SKU.

**Gamybos konfigūracija:**
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

**Kūrimo konfigūracija:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Saugi konfigūracija su Key Vault

Pirmenybę teikite Entra ID su vietine raktų autentifikacija išjungta. Toliau pateiktas tik **senstelėjęs raktų autentifikacijos variantas** programoms, kurios reikalauja raktų: tai reikalauja paskyros su įjungta raktų autentifikacija, programos tapatybės, pridėtos prie jos šeimininko, ir veikiančio Key Vault prieigos/tinklo. Nekombinuokite raktų gavimo su `disableLocalAuth: true` ir nesitikėkite, kad raktų pagrindu atliekami kvietimai veiks.

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

## Diegimo darbo srautai

### AZD plėtiniai Foundry

AZD teikia plėtinius, kurie prideda dirbtinio intelekto specifines galimybes dirbant su Microsoft Foundry paslaugomis:

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

Dirbtinio intelekto plėtiniai dar sparčiai tobulėja peržiūros etape. Jei komanda veikia kitaip nei parodyta čia, atnaujinkite atitinkamą plėtinį prieš trikdžių šalinimą projekte.

### Agentų pirmasis diegimas su `azd ai`

Naudokite `azd ai agent init` interaktyviai arba pasirinkite dabartinį `azure.yaml` agento projekto šabloną, prijungtą prie Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` pakeičia pasenusią `--manifest`/`-m` rašybą; senstelėjęs manifestas ir įdėta agento konfigūracija vis dar turi būti migruojami. Vertinkite agentus su `azd ai eval` iš `azure.ai.evaluations`, o ne su pašalintu senstelėjusiu darbo srautu. Daugiau žr. [vertinimo migracija](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) apie nustatymą, vykdymą ir rezultatus.

Pilną komandų katalogą ir žymes žr. [AZD AI CLI komandose](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Vienos komandos diegimas

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Aplinkai specifiniai diegimai

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

## Stebėjimas ir stebimumas

### Application Insights integracija

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

Tai sukuria Insights išteklių, bet ne telemetrijos instrumentaciją. Kai jūsų programa siunčia išeinančius modelio skambučio intervalus, paleiskite šį iliustracinį užklausimą Application Insights žurnaluose (pritaikykite filtrą pagal tikruosius intervalų pavadinimus):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Sąnaudų stebėjimas

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

Naudokite tikrą gavėją ir patikrinkite apmokėjimo srities teises. Biudžetas siunčia įspėjimus; tai nėra išlaidų riba.

## 🔐 Saugumo geriausios praktikos

### Tvarkomos tapatybės konfigūracija

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

### Tinklo saugumas

Šis galinis taškas taip pat reikalauja privataus DNS zonos/grupės, VNet nuorodų, programos VNet ryšio ir aiškios viešojo prieigos politikos. Tik sukūrimas privataus galinio taško neužblokuoja viešojo prieigos.

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

## Veikimo optimizavimas

### Talpyklos strategijos

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

Azure Cache for Redis Basic/Standard/Premium yra [atsisakymo kelyje](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); naudokite Azure Managed Redis naujiems diegimams ir laikykitės jo dabartinių šablonų/autentifikacijos gairių. Talpinkite saugomus DI atsakymus pagal autorizaciją, modelį/instrukcijas ir duomenų versiją su galiojimo laiku; niekada nesidalykite privačiais atsakymais tik naudodami užklausos tekstą.

### Automatinio mastelio keitimo konfigūracija

**Dalinis išteklius:** sujunkite šiuos mastelio/įleidimo nustatymus į pilną Container App su valdomąja aplinka, konteinerio vaizdu ir išteklių apribojimais. Daugiau kopijų nereiškia didesnės modelio kvotos.

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

## Dažniausiai pasitaikančių problemų sprendimas

### Problema 1: Viršytas OpenAI kvotas

**Simptomai:**
- Diegimas nepavyksta dėl kvotos klaidų
- 429 klaidos programos žurnaluose

**Sprendimai:**
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

Aukščiau nurodytas talpos kintamasis taikomas tik pasirinktiniam šablonui, kuris jį naudoja. RAG pavyzdyje naudokite `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Nekoreguokite `AZURE_LOCATION` perkėlimui esamus išteklius; sukurkite atskirą aplinką naujai sričiai ir planuokite migraciją/šalinimą.

### Problema 2: Autentifikacijos klaidos

**Simptomai:**
- 401/403 klaidos kviečiant DI paslaugas
- "Prieiga uždrausta" pranešimai

**Sprendimai:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problema 3: Modelio diegimo problemos

**Simptomai:**
- Modeliai nepasiekiami diegime
- Nepavyksta atskiros modelio versijos

**Sprendimai:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Pavyzdžių šablonai

Tai yra alternatyvos, o ne sekos komandos. Kiekvieną pradėkite atskirame tuščiame kataloge. Aiški `.` paskirties parinktis išlaiko inicializavimą dabartiniame kataloge; kitu atveju dabartinis AZD gali sukurti šablono pavadinimu pažymėtą antrinį katalogą, nekeisdamas jūsų darbo aplinkos terminale.

### RAG pokalbių programa (Python)

**Saugykla**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Aprašymas**: RAG pokalbių pavyzdinė programa dokumentams peržiūrėti su Azure AI Search paieška. Peržiūrėkite dabartinių pavyzdžio palaikomų modelių, pasirenkamų funkcijų, sąnaudų gairių ir gamybos stiprinimo rekomendacijas prieš naudojimą; pavyzdžio diegimas nepadaro programos gamybai paruoštos.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG pokalbių programa (.NET)

**Saugykla**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Aprašymas**: .NET/C# atitikmuo Python RAG pokalbių pavyzdžiui. Sukurta naudojant ASP.NET Core Minimal API ir Blazor WebAssembly priekinę dalį. Apima balso pokalbius, GPT-4o-mini vizijos palaikymą ir palydovinį .NET MAUI Blazor Hybrid stalinių/mobiliųjų klientų programų paketą.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG pokalbių programa (Java)

**Saugykla**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Paslaugos**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Aprašymas**: Java versija RAG pokalbių pavyzdžiui, naudojant Langchain4J DI orkestracijai. Palaiko mikroservisų įvykių varomą architektūrą, kelis paieškos strategijas (tekstines, vektorines, mišrias), dokumentų įkėlimą su Azure Document Intelligence ir diegimą reikalingoje Azure Container Apps arba Azure Kubernetes Service aplinkoje.

**Greitas pradėjimas**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Įmonių mažmeninės prekybos kopilotas su Microsoft Foundry

**Saugykla**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Paslaugos**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Aprašymas**: Galutinis mažmeninės prekybos RAG kopiloto sprendimas naudojant Microsoft Foundry ir Prompty. „Contoso Outdoor“ mažmenininko pokalbių robotas, kuris pateikia atsakymus remdamasis produktų katalogo ir klientų užsakymų duomenimis. Demonstruoja visą GenAIOps darbo eigą — prototipas su Prompty, vertinimas su DI pagalba įvertintojais ir diegimas per AZD į Container Apps.

**Greitas pradėjimas**:
```bash
azd init --template contoso-chat .
azd up
```

### Kūrybinio rašymo daugiaveiksmė programa

**Saugykla**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Paslaugos**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Aprašymas**: Daugiaveiksmė pavyzdinė programa, demonstruojanti DI agento orkestraciją su Prompty. Naudoja tyrimų agentą (Bing Grounding Azure AI Agent Service), produktų agentą (Azure AI Search), rašytojo ir redaktoriaus agentus bendradarbiauti, kad sukurtų gerai ištirtus straipsnius. Apima CI/CD su vertinimu GitHub Actions.

**Greitas pradėjimas**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG pokalbių programa (JavaScript/TypeScript)

**Saugykla**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Paslaugos**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB NoSQL + LangChain.js

**Aprašymas**: Visiškai serverless RAG pokalbių robotas, naudojantis LangChain.js su Azure Functions API ir Azure Static Web Apps talpinimui. Naudoja Azure Cosmos DB kaip tiek vektorių saugyklą, tiek pokalbių istorijos duomenų bazę. Palaiko vietinį kūrimą su Ollama nulinio sąnaudų testavimui.

**Greitas pradėjimas**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Pokalbis su savo duomenimis sprendimo akseleratorius

**Saugykla**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Paslaugos**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search su Cosmos DB arba PostgreSQL su pgvector

**Aprašymas**: Dokumentais grindžiamas pokalbių akseleratorius su citatomis. Dabartinis pavyzdys talpina React priekinę dalį, FastAPI užpakalinę dalį ir Functions įkėlimo darbo tarpą Container Apps; orkestratoriaus parinktys yra Agent Framework ir LangGraph. Duomenų bazės/paieškos parinktys pasirenkamos diegimo metu. Tai pradžios taškas, ne pilnai pasiruošusi gamybos sistema; nepriimkite seno App Service, Semantic Kernel ar Prompt Flow variantų kaip dabartinės numatytosios konfigūracijos.

**Greitas pradėjimas**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### DI kelionių agentai — daugiaveiksmis MCP orkestravimas

**Saugykla**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Paslaugos**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP serveriai (.NET, Python, Java, TypeScript)

**Aprašymas**: Daugiapolio AI orkestravimo naudojant tris sistemas (LangChain.js, LlamaIndex.TS ir Microsoft Agent Framework) pavyzdinė programa. Pateikiami MCP (Model Context Protocol) serveriai keturiomis kalbomis, dislokuoti kaip be serverių „Azure Container Apps“ su „OpenTelemetry“ stebėjimu.

**Greitas pradžia**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Naršykite daugiau šablonų**: Apsilankykite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) ir peržiūrėkite šiuo metu prieinamus šablonus įvairiomis kalbomis ir scenarijais. Kiekvienas pateiktas pavyzdys yra išorinis saugyklos projektas, o ne vietinis šio kurso pavyzdys; prieš dislokavimą peržiūrėkite jo dabartinius reikalavimus ir gamybos rekomendacijas.

## Tolimesni žingsniai

1. **Išbandykite pavyzdžius**: Pradėkite nuo iš anksto paruošto šablono, atitinkančio jūsų naudojimo scenarijų
2. **Priderinkite pagal savo poreikius**: Keiskite infrastruktūrą ir programos kodą
3. **Įtraukite stebėjimą**: Įgyvendinkite išsamų stebimumą
4. **Optimizuokite išlaidas**: Koreguokite konfigūracijas pagal savo biudžetą
5. **Užtikrinkite diegimą**: Įgyvendinkite įmonės saugumo šablonus
6. **Perveskite į gamybą**: Pridėkite kelių regionų ir aukšto prieinamumo funkcijas

## 🎯 Praktinės užduotys

### Užduotis 1: Dislokuokite Microsoft Foundry Models Pokalbių programą (30 minučių)
**Tikslas**: Dislokuoti ir išbandyti AI pokalbių pavyzdinę programą

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

**Sėkmės kriterijai:**
- [ ] Dislokacija vykdoma be kvotos klaidų
- [ ] Naršyklėje galima pasiekti pokalbių sąsają
- [ ] Galima užduoti klausimus ir gauti AI valdomus atsakymus
- [ ] Application Insights rodo telemetrijos duomenis
- [ ] Resursai sėkmingai išvalyti

**Kaina:** Peržiūrėkite pavyzdžio dabartines kainų gaires ir pasirinktus SKU prieš dislokavimą. Apskaita vyksta tol, kol resursai nebus ištrinti; nėra fiksuoto 30 minučių kainos įvertinimo, kuris galioja visiems nustatymams.

### Užduotis 2: Konfigūruokite daugelio modelių dislokavimą (45 minutės)
**Tikslas**: Dislokuoti kelis AI modelius su skirtingomis konfigūracijomis

**Pradinė vieta:** Esama Azure OpenAI paskyra ir AZD resursų grupės modulis, kuris gali kviesti šį failą. Sukurkite `infra/ai-models.bicep` su šiuo turiniu naudodamiesi savo redaktoriumi. Ji nebus automatiškai dislokuojama vien tik dėl to, kad yra po `infra/` direktorija.

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

Iš paskyros turinčio resursų grupės modulio pridėkite modulio kvietimą (prisitaikykite simbolio pavadinimą prie savo paskyros):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nenurodykite tų pačių dislokacijų abiejuose moduliuose. Jei AZD įėjimo taškas yra prenumeratos lygio, kvieskite šį modulį iš jos resursų grupės lygio vaikų modulio ir pakoreguokite reliatyvų kelią. Sukurkite tą turintį modulį su `az bicep build --file <path-to-containing-module>`, tada:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Sėkmės kriterijai:**
- [ ] Keli modeliai įdiegti sėkmingai
- [ ] Taikyti skirtingi apimties nustatymai
- [ ] Modeliai pasiekiami per API
- [ ] Abu modeliai kviečiami iš programos

### Užduotis 3: Įgyvendinkite išlaidų stebėjimą (20 minučių)
**Tikslas**: Nustatyti biudžeto įspėjimus ir išlaidų sekimą

**Pradinė vieta:** Aukščiau pateiktas biudžeto šablonas ir resursų grupės lygio infrastruktūros modulis. Pridėkite šį resursą naudodami redaktorių; perduokite `budgetStartDate` iš parametrų žemėlapio (nepadarykite parametru dubliavimo, jei jis jau deklaruotas). Pakeiskite gavėją ir patikrinkite, ar turite rašymo prieigą prie biudžeto.

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

Tikimasi: atsakyme yra `amount: 200`, abi ribos ir jūsų gavėjas. Peržiūrėkite išlaidų valdymą portale dėl faktinių mokesčių; išlaidų duomenys pavėluoti, ir per trumpą užduotį įspėjimas nebūtinai turi įsijungti.

**Sėkmės kriterijai:**
- [ ] Biudžeto įspėjimas sukurtas Azure
- [ ] El. pašto pranešimai sukonfigūruoti
- [ ] Galima peržiūrėti išlaidų duomenis Azure portale
- [ ] Biudžeto ribos nustatytos tinkamai

## 💡 Dažnai užduodami klausimai

<details>
<summary><strong>Kaip sumažinti Microsoft Foundry Models išlaidas kūrimo metu?</strong></summary>

1. **Pasižiūrėkite kainodarą**: Azure OpenAI modeliams nėra universalaus nemokamo mėnesinio 50 000 tokenų limito
2. **Tinkamai parinkite pajėgumą**: Pajėgumas `10` paprastai reiškia 10 000 TPM šioms Standartinėms teksto modelių, o ne 10 TPM. Sumažinus šį dažnio limitą, nebus sumažintos kainos už tokeną
3. **Naudokite azd down**: Ištrinkite laikinus resursus, kai aktyviai nekuriate (tai nėra išjungimas)
4. **Talpinkite atsakymus**: Įgyvendinkite Redis talpyklą pakartotinėms užklausoms
5. **Naudokite užklausų inžineriją**: Mažinkite tokenų sunaudojimą efektyviais užklausų formavimais

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Kuo skiriasi Microsoft Foundry Models nuo OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Įmonių saugumas ir atitiktis
- Privataus tinklo integracija
- SLA garantijos
- Valdomos tapatybės autentifikacija
- Galimi didesni kvotos limitai

**OpenAI API**: Atkiras tiekėjas/API su savo modelių prieinamumu, kainodara, autentifikacija ir įmonių ryšio galimybėmis. Lyginkite dabartines pasiūlas, o ne manykite, kad tai tik viešasis internetas ar kad visada pirmieji išleidžia modelius.

Pasirinkite pagal savo organizacijos poreikius; šio kurso pavyzdžiai su Azure specifine valdoma tapatybe ir privataus ryšio nustatymais taikomi Azure talpinamoms paslaugoms, ne kiekvienam modeliui/tiekėjui „Foundry“ kataloge.
</details>

<details>
<summary><strong>Kaip elgtis su Microsoft Foundry Models kvotos viršijimo klaidomis?</strong></summary>

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
<summary><strong>Ar galiu naudoti savo duomenis su Microsoft Foundry Models?</strong></summary>

Taip! Naudokite **Azure AI Search** RAG (Retrieval Augmented Generation) tikslu:

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

Žr. [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) šabloną.
</details>

<details>
<summary><strong>Kaip užtikrinti AI modelio galinių taškų saugumą?</strong></summary>

**Geriausios praktikos**:
1. Naudokite valdoma tapatybę (be API raktų)
2. Įgalinkite privačius galinius taškus
3. Konfigūruokite tinklo saugumo grupes
4. Įgyvendinkite dažnio ribojimą
5. Naudokite Azure Key Vault konfidencialiems duomenims

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

## Bendruomenė ir palaikymas

- **Microsoft Foundry Discord**: [#Azure kanalas](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Klausimai ir diskusijos](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiali dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agentų įgūdžiai**: [Microsoft Foundry įgūdis skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Įdiekite Azure + Foundry agentų įgūdžius redaktoriuje su `npx skills add microsoft/github-copilot-for-azure`

---

**Skyrių navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Esamas skyrius**: 2 skyrius - AI-pirmoji kūrimo tvarka
- **⬅️ Ankstesnis skyrius**: [1 skyrius: Jūsų pirmas projektas](../chapter-01-foundation/first-project.md)
- **➡️ Sekantis**: [AI agentai](agents.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės diskusijų arba atidarykite klausimą saugykloje. Azure AI + AZD bendruomenė pasiruošusi padėti jums sėkmingai!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->