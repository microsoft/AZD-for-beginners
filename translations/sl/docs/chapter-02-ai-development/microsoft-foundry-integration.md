# Integracija Microsoft Foundry z AZD

**Navigacija poglavij:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - AI-prvo razvijanje
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [AI agenti](agents.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ta vodič prikazuje, kako integrirati storitve Microsoft Foundry z Azure Developer CLI (AZD) za poenostavljene namestitve AI aplikacij. Microsoft Foundry zagotavlja celovito platformo za gradnjo, nameščanje in upravljanje AI aplikacij, medtem ko AZD poenostavi infrastrukturo in postopek nameščanja.

## Kaj je Microsoft Foundry?

Microsoft Foundry je združena platforma Microsofta za razvoj AI, ki vključuje:

- **Katalog modelov**: Dostop do naprednih AI modelov
- **Prompt Flow**: Vizualni oblikovalec AI potekov dela
- **Portal Microsoft Foundry**: Integrirano razvojno okolje za AI aplikacije
- **Možnosti nameščanja**: Več možnosti gostovanja in skaliranja
- **Varnost in zaščita**: Vgrajene funkcije odgovorne AI

## AZD + Microsoft Foundry: Bolje skupaj

| Funkcija | Microsoft Foundry | Prednost integracije z AZD |
|---------|-----------------|------------------------|
| **Nameščanje modelov** | Ročno nameščanje preko portala | Avtomatizirane, ponovljive namestitve |
| **Infrastruktura** | Namestitev s klikom | Infrastruktura kot koda (Bicep) |
| **Upravljanje okolij** | Osredotočenost na eno okolje | Več okolij (dev/staging/prod) |
| **Integracija CI/CD** | Omejena | Nativna podpora GitHub Actions |
| **Upravljanje stroškov** | Osnovno spremljanje | Optimizacija stroškov po okoljih |

## Predpogoji

- Azure naročnina z ustreznimi dovoljenji
- Namestitev Azure Developer CLI
- Dostop do storitev Microsoft Foundry Models
- Osnovno poznavanje Microsoft Foundry

> **Pregled izdaje (2026-11-04):** Navodila za AI CLI so bila preverjena z dokumentacijo/viri `azd` `1.37.2`, agenti `1.0.0-beta.23` in evaluacije `1.0.0-beta.2`. Za združen potek dela uporabite `azd >= 1.37.0`. Oglejte si [spremembe in popravke izdaje](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); ta pregled ne potrjuje vsake predloge ali primerka SDK proti dejanski namestitvi.

## Osnovni vzorci integracije

**Obseg primerov:** Spodnji Bicep vsebuje ilustrativne segmente virov, ne popolno namestljivo predlogo. Vsebuječa predloga mora določiti imena, `location`, sklice na vire, identitete, izhode in gostovanje aplikacij. Za zagon uporabite povezano vzorčno predlogo. Bash primeri zahtevajo ločeno prijavo z Azure CLI neodvisno od `azd auth login`.

### Vzorec 1: Integracija Microsoft Foundry Models

**Uporabniški primer**: Nameščanje klepetalnih aplikacij z Azure OpenAI modeli v Microsoft Foundry

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

**Infrastruktura (main.bicep):**
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

Klicatelj mora imeti pripeto upravljano identiteto in `Cognitive Services OpenAI User` na računu; onemogočanje ključev ne daje dostopa. Pred nameščanjem preverite razpoložljivost regije/modela/SKU in kvoto.

### Vzorec 2: Integracija AI Search + RAG

**Uporabniški primer**: Nameščanje aplikacij za generacijo z obogatitvijo poiskave (RAG)

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

Za to integracijo ni ARM vira `Microsoft.Search/searchServices/dataConnections`. Konfigurirajte iskalni indeks, vir podatkov, indexer/skillset ali vektorizer prek podprtih Search podatkovnih API-jev. Če Search kliče vgradni model, omogočite njegovo upravljano identiteto, dodelite ustrezno vlogo modela ter konfigurirajte vgradno veščino/vektorizer. Glejte [integrirano vektorizacijo](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Vzorec 3: Integracija dokumentne inteligence

**Uporabniški primer**: Poteki obdelave in analize dokumentov

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

## 🔧 Vzorce konfiguracije

### Nastavitev okoljskih spremenljivk

Razen dokumentiranih nastavitev AZD, kot je `AZURE_LOCATION`, so to **vnosna imena po meri predloge**. Nimajo učinka, dokler jih predloga/aplikacija ne uporabi prek preslikav parametrov in gostujočega okolja. Za `azure-search-openai-demo` uporabite dejanska imena, kot so `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` in `AZURE_SEARCH_SERVICE_SKU`. Kapaciteta modela ni SKU računa.

**Produkcijska konfiguracija:**
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

**Razvojna konfiguracija:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Varnostna konfiguracija z Key Vault

Prednost dajte Entra ID z onemogočeno lokalno avtentikacijo ključev. Naslednje je le **alternativa za avtentikacijo s ključem iz starejših sistemov** za aplikacije, ki zahtevajo ključe: zahteva račun z omogočeno avtentikacijo ključev, identiteto aplikacije, pripeto na gostitelja, in delujoč dostop do Key Vaulta omrežno. Ne kombinirajte pridobivanja ključev z `disableLocalAuth: true` in pričakujte delovanje klicev s ključi.

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

## Poteki nameščanja

### Razširitve AZD za Foundry

AZD ponuja razširitve, ki dodajo AI-specifične zmogljivosti za delo s storitvami Microsoft Foundry:

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

AI razširitve se še hitro razvijajo v predogledu. Če se ukaz vede drugače kot tukaj, nadgradite ustrezno razširitev preden odpravljate težave pri projektu.

### Nameščanje z osredotočenostjo na agente z `azd ai`

Uporabite `azd ai agent init` interaktivno ali pa sprejmite trenutno predlogo projekta `azure.yaml`, povezano s Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` nadomešča zastarelo črkovanje `--manifest`/`-m`; zastarela manifestacija in gnezdena konfiguracija agentov še potrebujeta migracijo. Evaluirajte agente z `azd ai eval` iz `azure.ai.evaluations`, ne pa s starejšim potekom dela. Glejte [migracijo evalvacij](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) za nastavitev, izvajanje in rezultate.

Oglejte si [Ukaze AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za celoten seznam ukazov in zastavic.

### Namestitev z enim ukazom

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Namestitve po okoljih

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

## Spremljanje in opazovanje

### Integracija Application Insights

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

To namesti vir Insights, ne telemetrične instrumentacije. Ko vaša aplikacija odda izhodne modele klicev, zaženite ta ilustrativni poizvedbo v dnevnikih Application Insights (prilagodite filter dejanskim imenom vaših sledi):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Spremljanje stroškov

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

Uporabite dejanskega prejemnika in preverite dovoljenja za obseg obračunavanja. Proračun pošilja opozorila; ni omejitev porabe.

## 🔐 Najboljše varnostne prakse

### Konfiguracija upravljane identitete

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

### Varnost omrežja

Ta del končne točke potrebuje tudi zasebno DNS cono/skupino, povezave VNet, povezljivost aplikacije VNet in izrecno politiko javnega dostopa. Samo ustvarjanje zasebne končne točke ne onemogoči javnega dostopa.

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

## Optimizacija zmogljivosti

### Strategije keširanja

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

Azure Cache za Redis Basic/Standard/Premium je na [potem upokojevanja](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); za nove namestitve uporabite Azure Managed Redis in sledite trenutnim navodilom za predloge/avtentikacijo. Omejite shranjene AI odzive po avtorizaciji, modelu/navodilih in različici podatkov z rokom trajanja; nikoli ne delite zasebnih odzivov samo s besedilom poizvedbe.

### Konfiguracija samodejnega skaliranja

**Delni vir:** združite te nastavitve skaliranja/vhoda v popolno Container App z upravljanim okoljem, vsebnim slikom in omejitvami virov. Več replik ne poveča kvote modela.

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

## Odpravljanje pogostih težav

### Težava 1: Presežena kvota OpenAI

**Simptomi:**
- Namestitev ne uspe zaradi napak kvote
- Napake 429 v dnevnikih aplikacije

**Rešitve:**
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

Spremenljivka kapacitete zgoraj velja samo za predlogo po meri, ki jo je povezana z njo. Za RAG primer uporabite `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Ne spreminjajte `AZURE_LOCATION` za premik obstoječih virov; ustvarite ločeno okolje za novo regijo in načrtujte migracijo/čiščenje.

### Težava 2: Napake pri avtentikaciji

**Simptomi:**
- Napake 401/403 pri klicih AI storitev
- Sporočila "Dostop zavrnjen"

**Rešitve:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Težava 3: Težave z nameščanjem modelov

**Simptomi:**
- Modeli niso na voljo v namestitvi
- Specifične različice modelov ne uspejo

**Rešitve:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Primeri predlog

To so alternative, ne zaporedni ukazi. Začnite vsakega v ločeni prazni mapi. Izrecna destinacija `.` omogoča inicializacijo v trenutni mapi; sicer lahko trenutni AZD ustvari podmapo s predlogami, ne da bi spremenil delovno mapo lupine.

### RAG klepetalna aplikacija (Python)

**Shramba**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: RAG klepetalna referenčna aplikacija za vprašanja glede vaših dokumentov z iskanjem Azure AI Search. Preglejte trenutno podprte modele, izbirne funkcije, navodila o stroških in utrjevanje pred produkcijsko uporabo; namestitev vzorca ne naredi aplikacije pripravljen za produkcijo.

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG klepetalna aplikacija (.NET)

**Shramba**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# ekvivalent Python RAG klepetalnega vzorca. Zgrajen z ASP.NET Core Minimal API in Blazor WebAssembly frontendom. Vključuje glasovni klepet, podporo GPT-4o-mini vision in spremljajočega .NET MAUI Blazor Hybrid odjemalca za namizje/mobilno.

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG klepetalna aplikacija (Java)

**Shramba**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Java različica RAG klepetalnega vzorca, ki uporablja Langchain4J za AI orkestracijo. Podpira mikroservisno arhitekturo, več strategij iskanja (besedilo, vektor, hibrid), nalaganje dokumentov z Azure Document Intelligence in namestitev bodisi na Azure Container Apps ali Azure Kubernetes Service.

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Podjetniški maloprodajni copilot s Microsoft Foundry

**Shramba**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Storitve**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: Celovit maloprodajni RAG copilot, ki uporablja Microsoft Foundry in Prompty. Contoso Outdoor maloprodajni chatbot, ki temelji na katalogu izdelkov in podatkih o naročilih strank. Prikazuje celoten GenAIOps potek dela — prototip z Prompty, ocenjevanje z AI podprtimi ocenjevalci in nameščanje preko AZD na Container Apps.

**Hitri začetek**:
```bash
azd init --template contoso-chat .
azd up
```

### Večagentna aplikacija za ustvarjalno pisanje

**Shramba**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Storitve**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Večagentni vzorec, ki prikazuje orkestracijo AI agentov z Prompty. Uporablja raziskovalnega agenta (Bing Grounding v Azure AI Agent Service), produktnega agenta (Azure AI Search), pisateljskega agenta in uredniškega agenta za skupno pripravo dobro raziskovanih člankov. Vključuje CI/CD z evalvacijo v GitHub Actions.

**Hitri začetek**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Strežniško brezplačni RAG klepet (JavaScript/TypeScript)

**Shramba**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Storitve**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB za NoSQL + LangChain.js

**Opis**: Popolnoma strežniško brezplačni RAG klepetalni robot z uporabo LangChain.js z Azure Functions za API in Azure Static Web Apps za gostovanje. Uporablja Azure Cosmos DB kot tako vektor shrambo kot bazo zgodovine klepeta. Podpira lokalni razvoj z Ollama za testiranje brez stroškov.

**Hitri začetek**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Pospeševalnik rešitve Klepet z vašimi podatki

**Shramba**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Storitve**: Microsoft Foundry + Azure Container Apps (splet/API/vnos) + Azure AI Search s Cosmos DB ali PostgreSQL s pgvector

**Opis**: Pospeševalnik klepeta, ki temelji na dokumentih, s citati. Trenutni vzorec gosti React frontend, FastAPI backend in Functions vnosnega delavca na Container Apps; orkestratorji so Agent Framework in LangGraph. Možnosti baze podatkov/iskanja so izbrane ob nameščanju. Je izhodišče, ne ključnega pomena sistem za produkcijo; ne predpostavljajte, da starejše različice App Service, Semantic Kernel ali Prompt Flow predstavljajo trenutni privzeti sistem.

**Hitri začetek**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI potovalni agenti — večagentna MCP orkestracija

**Shramba**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Storitve**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP strežniki (.NET, Python, Java, TypeScript)

**Opis**: Referenčna aplikacija za večagentno AI orkestracijo z uporabo treh ogrodij (LangChain.js, LlamaIndex.TS in Microsoft Agent Framework). Vključuje MCP (Model Context Protocol) strežnike v štirih jezikih, nameščene kot serverless Azure Container Apps z monitoriranjem OpenTelemetry.

**Hiter začetek**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Raziščite več predlog**: Obiščite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) za trenutno razpoložljive predloge po jezikih in scenarijih. Vsak povezan primer je zunanji repozitorij, ne lokalni primer, ki ga ponuja ta tečaj; pred namestitvijo preverite zahteve in priporočila za produkcijo.

## Naslednji koraki

1. **Preizkusite primere**: Začnite s prednastavljeno predlogo, ki ustreza vašemu primeru uporabe
2. **Prilagodite glede na potrebe**: Spremenite infrastrukturo in kodo aplikacije
3. **Dodajte nadzor**: Uvedite celovito opazovanje
4. **Optimizirajte stroške**: Nastavite konfiguracije za vaš proračun
5. **Zavarujte nameščanje**: Uvedite varnostne vzorce za podjetja
6. **Razširite na produkcijo**: Dodajte funkcije za več regij in visoko razpoložljivost

## 🎯 Praktične vaje

### Vaja 1: Namestitev pogovorne aplikacije Microsoft Foundry Models (30 minut)
**Cilj**: Namestiti in preizkusiti referenčno AI pogovorno aplikacijo

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

**Kriteriji uspeha:**
- [ ] Namestitev se zaključi brez napak zaradi kvot
- [ ] Dostop do pogovornega vmesnika v brskalniku
- [ ] Možnost zastavljanja vprašanj in prejemanja AI odgovorov
- [ ] Application Insights prikazuje telemetrične podatke
- [ ] Uspešno čiščenje virov po uporabi

**Stroški:** Pred namestitvijo preglejte trenutna navodila in izbrane SKUje. Zaračunavanje poteka, dokler viri niso izbrisani; ni fiksne ocene za 30 minut za vsako konfiguracijo.

### Vaja 2: Konfiguracija večmodelne namestitve (45 minut)
**Cilj**: Namestiti več AI modelov z različnimi konfiguracijami

**Izhodišče:** Obstoječ Azure OpenAI račun in modul AZD resource-group, ki lahko kliče to datoteko. Ustvarite `infra/ai-models.bicep` z naslednjo vsebino v urejevalniku. Samodejno ni nameščen, ker je pod `infra/`.

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

Iz modula, višjega po scope resource-group, ki obvladuje račun, dodajte klic modula (prilagodite ime simbola svojemu računu):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Ne deklarirajte istih namestitev v obeh modulih. Če je AZD vstopna točka scoped na naročnino, jo pokličite iz otroškega modula scoped na resource-group in prilagodite relativno pot. Sestavite ta vsebinski modul z `az bicep build --file <path-to-containing-module>` in nato:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kriteriji uspeha:**
- [ ] Več modelov je uspešno nameščenih
- [ ] Uporabljene različne nastavitve zmogljivosti
- [ ] Modele je mogoče klicati preko API
- [ ] Iz aplikacije je mogoče klicati oba modela

### Vaja 3: Uvedba nadzora stroškov (20 minut)
**Cilj**: Nastaviti opozorila proračuna in spremljanje stroškov

**Izhodišče:** Vzorec proračuna iz zgoraj in modul infrastrukture scoped na resource-group. Dodajte ta vir v urejevalniku; posredujte `budgetStartDate` iz preslikave parametrov (ne podvajajte, če je že deklariran). Zamenjajte prejemnika in potrdite, da imate pravice pisanja proračuna.

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

Pričakovano: odgovor vsebuje `amount: 200`, oba praga in vašega prejemnika. Preglejte Cost Management v portalu za dejanske stroške; podatki o stroških so zamaknjeni, opozorilo ni nujno sprožiti med kratko vajo.

**Kriteriji uspeha:**
- [ ] Opozorilo proračuna ustvarjeno v Azure
- [ ] Nastavljeni e-poštni obvestili
- [ ] Možnost ogleda podatkov o stroških v Azure Portalu
- [ ] Pragovi proračuna ustrezno nastavljeni

## 💡 Pogosto zastavljena vprašanja

<details>
<summary><strong>Kako zmanjšati stroške Microsoft Foundry Models med razvojem?</strong></summary>

1. **Preverite cene**: Ni univerzalnega brezplačnega mesečnega zagona za 50.000 tokenov pri Azure OpenAI modelih
2. **Pravilno nastavite kapaciteto**: Kapaciteta `10` običajno predstavlja 10.000 TPM za te Standard tekstovne modele, ne 10 TPM. Zmanjšanje omejitve hitrosti ne zmanjša cene na token
3. **Uporabite azd down**: Izbrišite začasne vire, kadar ne razvijate aktivno (to ni deaktivacija)
4. **Predpomnite odgovore**: Uvedite Redis predpomnilnik za ponavljajoča se vprašanja
5. **Uporabite Prompt Engineering**: Zmanjšajte uporabo tokenov z učinkovitimi vprašanji

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Kakšna je razlika med Microsoft Foundry Models in OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Varnost in skladnost za podjetja
- Integracija zasebnega omrežja
- Zagotovila SLA
- Avtentikacija z upravljano identiteto
- Višji kvotni limiti

**OpenAI API**: Ločen ponudnik/API z lastno razpoložljivostjo modelov, cenami, avtentikacijo in možnostmi povezovanja podjetja. Primerjajte trenutne ponudbe, ne predpostavljajte, da je dostopen samo prek javnega interneta ali da vedno prvo pošilja modele.

Izbirajte glede na zahteve vaše organizacije; specifični primeri uporabe upravljane identitete in zasebne povezave Azure v tem tečaju veljajo za Azure gostujoče storitve, ne za vsak model/ponudnika v Foundry katalogu.
</details>

<details>
<summary><strong>Kako ravnam z napakami zaradi prekoračitve kvot Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Ali lahko uporabim svoje podatke z Microsoft Foundry Models?</strong></summary>

Seveda! Uporabite **Azure AI Search** za RAG (retrieval augmented generation):

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

Oglejte si predlogo [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Kako zavarovati končne točke AI modelov?</strong></summary>

**Najboljši postopki**:
1. Uporabite upravljano identiteto (brez API ključev)
2. Omogočite zasebne končne točke
3. Konfigurirajte varnostne skupine omrežja
4. Uvedite omejevanje hitrosti
5. Za skrivnosti uporabite Azure Key Vault

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

## Skupnost in podpora

- **Microsoft Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Težave in razprave](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Uradna dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Namestite Azure + Foundry agentne veščine v urejevalniku z `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavij:**
- **📚 Domov tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - AI-prednostni razvoj
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [AI agenti](agents.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se skupnostnim razpravam ali odprite težavo v repozitoriju. Skupnost Azure AI + AZD je tu, da vam pomaga uspeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->