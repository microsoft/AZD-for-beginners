# Integrácia Microsoft Foundry s AZD

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj s prioritou AI
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Ďalšie**: [AI agenti](agents.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

## Prehľad

Tento návod ukazuje, ako integrovať služby Microsoft Foundry s Azure Developer CLI (AZD) pre zjednodušené nasadzovanie AI aplikácií. Microsoft Foundry poskytuje komplexnú platformu na tvorbu, nasadzovanie a správu AI aplikácií, zatiaľ čo AZD zjednodušuje infraštruktúru a proces nasadzovania.

## Čo je Microsoft Foundry?

Microsoft Foundry je jednotná platforma Microsoftu pre vývoj AI, ktorá obsahuje:

- **Katalóg modelov**: Prístup k najmodernejším AI modelom
- **Prompt Flow**: Vizualizér pre AI pracovné postupy
- **Portál Microsoft Foundry**: Integrované vývojové prostredie pre AI aplikácie
- **Možnosti nasadzovania**: Rôzne možnosti hostovania a škálovania
- **Bezpečnosť a ochrana**: Vstavané funkcie zodpovednej AI

## AZD + Microsoft Foundry: Spolu lepšie

| Funkcia | Microsoft Foundry | Výhoda integrácie s AZD |
|---------|-----------------|------------------------|
| **Nasadenie modelu** | Manuálne nasadenie v portáli | Automatizované, opakovateľné nasadenia |
| **Infraštuktúra** | Klikací provisioning | Infrastructure as Code (Bicep) |
| **Správa prostredia** | Zameranie na jedno prostredie | Viacero prostredí (dev/staging/prod) |
| **CI/CD integrácia** | Obmedzená | Nativná podpora GitHub Actions |
| **Správa nákladov** | Základný monitoring | Optimalizácia nákladov podľa prostredia |

## Predpoklady

- Predplatné Azure s príslušnými oprávneniami
- Nainštalovaný Azure Developer CLI
- Prístup k službám Microsoft Foundry Models
- Základná znalosť Microsoft Foundry

> **Kontrola vydania (2026-11-04):** AI CLI návod bol overený proti dokumentácii/zdrojom `azd` `1.37.2`, agentov `1.0.0-beta.23` a hodnotení `1.0.0-beta.2`. Použite `azd >= 1.37.0` pre kombinovaný pracovný tok. Pozrite si [zmeny a opravy vo vydaní](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); táto kontrola nezaručuje platnosť každej šablóny alebo príkladu SDK pri skutočnom nasadení.

## Hlavné vzory integrácie

**Rozsah príkladov:** Nasledujúci Bicep obsahuje ilustračné fragmenty zdrojov, nie úplnú šablónu na nasadenie. Obsahujúca šablóna musí definovať mená, `location`, referencované zdroje, identity, výstupy a hosting aplikácie. Použite prepojený príklad ako spustiteľný východiskový bod. Bash príklady si vyžadujú autentifikáciu Azure CLI samostatne od `azd auth login`.

### Vzor 1: Integrácia Microsoft Foundry Models

**Použitie**: Nasadenie chat aplikácií s Azure OpenAI modelmi v Microsoft Foundry

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

**Infraštuktúra (main.bicep):**
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

Volajúci musí mať priradenú spravovanú identitu a `Cognitive Services OpenAI User` v rozsahu konta; zakázanie kľúčov nepridáva prístup. Pred nasadením overte dostupnosť regiónu/modelu/SKU a kvótu.

### Vzor 2: Integrácia AI Search + RAG

**Použitie**: Nasadenie aplikácií s retrieval-augmented generation (RAG)

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

Pre túto integráciu neexistuje ARM zdroj `Microsoft.Search/searchServices/dataConnections`. Konfigurujte index vyhľadávania, dátový zdroj, indexer/skillset alebo vektorizér prostredníctvom podporovaných Search data-plane API. Ak Search volá embedding model, povoľte jeho spravovanú identitu, priraďte relevantnú rolu modelu a nakonfigurujte embedding skill/vektorizér. Viac na [integrovaná vektorizácia](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Vzor 3: Integrácia Document Intelligence

**Použitie**: Pracovné postupy spracovania a analýzy dokumentov

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

## 🔧 Konfiguračné vzory

### Nastavenie premenných prostredia

Okrem dokumentovaných nastavení AZD, ako je `AZURE_LOCATION`, sú tieto **názvy vstupov vlastných šablón**. Nemajú žiadny efekt, ak ich šablóna/aplikácia nekonzumuje cez mapovanie parametrov a hostiteľského prostredia. Pre `azure-search-openai-demo` používajte jeho skutočné názvy ako `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` a `AZURE_SEARCH_SERVICE_SKU`. Kapacita modelu nie je SKU konta.

**Produkčná konfigurácia:**
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

**Vývojová konfigurácia:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Bezpečná konfigurácia s Key Vault

Preferujte Entra ID s lokálne zakázanou autentifikáciou kľúčov. Nasledujúca možnosť je iba **alternatívou legacy autentifikácie kľúčom** pre aplikácie vyžadujúce kľúče: potrebuje konto s povolenou autentifikáciou kľúčom, aplikáciu s priradenou identitou hosťa a fungujúci prístup/konektivitu k Key Vault. Nekombinujte získavanie kľúča s `disableLocalAuth: true` a neočakávajte, že volania na základe kľúča budú fungovať.

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

## Pracovné toky nasadzovania

### Rozšírenia AZD pre Foundry

AZD poskytuje rozšírenia, ktoré pridávajú AI-specific funkcie pre prácu so službami Microsoft Foundry:

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

AI rozšírenia sú stále v rýchlom vývoji vo verzii preview. Ak sa príkaz správa inak, než je tu uvedené, aktualizujte príslušné rozšírenie pred riešením problému v projekte.

### Nasadenie orientované na agenta s `azd ai`

Použite `azd ai agent init` interaktívne alebo zvoľte aktuálnu šablónu projektu agenta `azure.yaml` prepojenú so službou Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` nahrádza zastaranú syntax `--manifest`/`-m`; legacy manifest a vnorená konfigurácia agenta stále vyžadujú migráciu. Agentov hodnotte s `azd ai eval` z `azure.ai.evaluations`, nie starým legacym pracovným tokom. Pozrite [migráciu hodnotenia](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) pre nastavenie, vykonanie a výsledky.

Pozrite si [AZD AI CLI príkazy](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pre kompletný zoznam príkazov a parametrov.

### Nasadenie jedným príkazom

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Nasadenia špecifické pre prostredie

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

## Monitorovanie a pozorovateľnosť

### Integrácia Application Insights

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

Toto vytvorí zdroj Insights, nie telemetrickú inštrumentáciu. Ak vaša aplikácia vydáva odchádzajúce volania modelov, spustite tento ilustračný dotaz v Application Insights Logs (prispôsobte filter skutočným názvom spanov):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Sledovanie nákladov

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

Použite reálneho príjemcu a overte oprávnenia na fakturačný rozsah. Rozpočet posiela upozornenia; nie je to strop výdavkov.

## 🔐 Najlepšie bezpečnostné praktiky

### Konfigurácia spravovanej identity

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

### Sieťová bezpečnosť

Tento fragment endpointu tiež potrebuje súkromnú DNS zónu/skupinu, VNet prepojenia, VNet konektivitu aplikácie a explicitnú politiku verejného prístupu. Samotné vytvorenie súkromného endpointu neznemožňuje verejný prístup.

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

## Optimalizácia výkonu

### Stratégie cacheovania

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

Azure Cache for Redis Basic/Standard/Premium je na [ceste k vyradeniu](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); použite Azure Managed Redis pre nové nasadenia a sledujte aktuálne pokyny pre šablóny/auntentifikáciu. Scope cached AI odpovedí podľa autorizácie, modelu/inštrukcií a verzie dát, s expiráciou; nikdy nezdieľajte súkromné odpovede len na základe textu dotazu.

### Konfigurácia automatického škálovania

**Čiastočný zdroj:** zlúčte tieto nastavenia škálovania/vstupu do kompletnej Container App so spravovaným prostredím, obrazom kontajnera a limitmi zdrojov. Viac replík nezvýši kvótu modelu.

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

## Riešenie bežných problémov

### Problém 1: Prekročená kvóta OpenAI

**Príznaky:**
- Nasadenie končí chybami kvóty
- 429 chybných hlásení v logoch aplikácie

**Riešenia:**
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

Premenná kapacity vyššie sa používa len v rámci vlastnej šablóny, ktorá ju spotrebúva. Pre vzor RAG používajte `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Nezmeňte `AZURE_LOCATION` pre presun existujúcich zdrojov na mieste; vytvorte nové prostredie pre nový región a plánujte migráciu/čistenie.

### Problém 2: Neúspešné overenie identity

**Príznaky:**
- 401/403 chyby pri volaní AI služieb
- Hlásenia "Prístup zamietnutý"

**Riešenia:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problém 3: Problémy s nasadením modelu

**Príznaky:**
- Modely nie sú dostupné v nasadení
- Neúspešné konkrétne verzie modelu

**Riešenia:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Príkladové šablóny

Ide o alternatívy, nie po sebe idúce príkazy. Každý začnite v samostatnom prázdnom adresári. Explicitný cieľ `.` udržiava inicializáciu vo vašom aktuálnom adresári; inak môže AZD vytvoriť podadresár názvom šablóny bez zmeny pracovného adresára shellu.

### RAG Chat aplikácia (Python)

**Repozitár**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Popis**: Referenčná RAG chat aplikácia pre otázky nad vašimi dokumentmi, s vyhľadávaním Azure AI Search. Pred použitím si preštudujte podporované modely, voliteľné funkcie, odporúčania ohľadom nákladov a produkčnú hardening. Nasadenie ukážky automaticky nerobí aplikáciu produkčne pripravenou.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat aplikácia (.NET)

**Repozitár**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Popis**: .NET/C# ekvivalent RAG chat vzoru v Pythone. Postavený s ASP.NET Core Minimal API a Blazor WebAssembly frontendom. Zahrňuje hlasovú konverzáciu, podporu GPT-4o-mini vision a sprievodcu .NET MAUI Blazor Hybrid desktop/mobilným klientom.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat aplikácia (Java)

**Repozitár**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Popis**: Java verzia RAG chatu s využitím Langchain4J pre AI orchesteráciu. Podporuje mikroservisnú event-driven architektúru, viacero stratégií vyhľadávania (text, vektor, hybrid), nahrávanie dokumentov s Azure Document Intelligence a nasadenie buď na Azure Container Apps, alebo Azure Kubernetes Service.

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Podnikový retailový Copilot s Microsoft Foundry

**Repozitár**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Popis**: End-to-end retailový RAG copilot využívajúci Microsoft Foundry a Prompty. Chatbot Contoso Outdoor predajcu, ktorý zakladá odpovede na katalógu produktov a údajoch objednávok zákazníka. Ukazuje celý pracovný tok GenAIOps — prototypovanie s Prompty, hodnotenie s AI-asistovanými evaluátormi a nasadenie cez AZD do Container Apps.

**Rýchly štart**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplikácia pre tvorbu kreatívneho písania viacerých agentov

**Repozitár**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Služby**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Popis**: Vzorová multi-agent aplikácia demonštrujúca orchestráciu AI agentov s Prompty. Používa výskumného agenta (Bing Grounding v Azure AI Agent Service), produktového agenta (Azure AI Search), agenta autora a agenta editora pre spoločnú tvorbu dobre preskúmaných článkov. Obsahuje CI/CD s hodnotením v GitHub Actions.

**Rýchly štart**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repozitár**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Služby**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pre NoSQL + LangChain.js

**Popis**: Plne serverless RAG chatbot využívajúci LangChain.js s Azure Functions pre API a Azure Static Web Apps pre hosting. Používa Azure Cosmos DB ako vektorový obchod a databázu histórie chatu. Podporuje lokálny vývoj s Ollama pre bezplatné testovanie.

**Rýchly štart**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Rýchly štart Chat s vašimi dátami

**Repozitár**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Služby**: Microsoft Foundry + Azure Container Apps (web/API/ingestia) + Azure AI Search s Cosmos DB, alebo PostgreSQL s pgvector

**Popis**: Chat akcelerátor zakotvený v dokumentoch s citáciami. Aktuálny vzor hostí React frontend, FastAPI backend a Functions ingest worker v Container Apps; orkestrátory sú Agent Framework a LangGraph. Možnosti databázy/vyhľadávania sa volia pri nasadení. Je to východiskový bod, nie úplný produkčný systém; nepovažujte staršie verzie App Service, Semantic Kernel alebo Prompt Flow za aktuálny štandard.

**Rýchly štart**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI cestovné agenti — Multi-agentná MCP orchestrácia

**Repozitár**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Služby**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP servery (.NET, Python, Java, TypeScript)

**Popis**: Referenčná aplikácia pre multi-agentnú AI orchestráciu využívajúca tri frameworky (LangChain.js, LlamaIndex.TS a Microsoft Agent Framework). Obsahuje MCP (Model Context Protocol) servery vo štyroch jazykoch nasadené ako serverless Azure Container Apps s monitorovaním pomocou OpenTelemetry.

**Rýchly začiatok**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Prezrite si viac šablón**: Navštívte [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pre aktuálne dostupné šablóny v rôznych jazykoch a scenároch. Každý prepojený príklad je externé repozitórium, nie lokálny príklad poskytnutý týmto kurzom; pred nasadením si skontrolujte aktuálne predpoklady a usmernenia pre produkciu.

## Ďalšie kroky

1. **Vyskúšajte príklady**: Začnite s predpripravenou šablónou, ktorá sa hodí pre váš prípad použitia
2. **Prispôsobte podľa potreby**: Upravte infraštruktúru a aplikačný kód
3. **Pridajte monitorovanie**: Implementujte komplexnú pozorovateľnosť
4. **Optimalizujte náklady**: Doladte konfigurácie podľa vášho rozpočtu
5. **Zabezpečte nasadenie**: Implementujte bezpečnostné vzory pre podnikové využitie
6. **Škálujte do produkcie**: Pridajte viacregiónové a s vysokou dostupnosťou funkcie

## 🎯 Praktické cvičenia

### Cvičenie 1: Nasadenie Microsoft Foundry Models Chat aplikácie (30 minút)
**Cieľ**: Nasadiť a otestovať referenčnú AI chat aplikáciu

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

**Kritériá úspechu:**
- [ ] Nasadenie prebehne bez chyby kvóty
- [ ] Prístup ku chat rozhraniu v prehliadači
- [ ] Možnosť klásť otázky a získať odpovede poháňané AI
- [ ] Application Insights zobrazuje telemetrické dáta
- [ ] Úspešné vyčistenie zdrojov

**Náklady:** Pred nasadením si prezrite aktuálny sprievodca nákladmi a vybrané SKU. Účtovanie pokračuje do vymazania zdrojov; neexistuje fixný 30-minútový odhad, ktorý platí pre každú konfiguráciu.

### Cvičenie 2: Konfigurácia multi-modelového nasadenia (45 minút)
**Cieľ**: Nasadiť viacero AI modelov s rôznymi konfiguráciami

**Východiskový bod:** Existujúci účet Azure OpenAI a AZD modul zdrojovej skupiny, ktorý môže volať tento súbor. Vytvorte `infra/ai-models.bicep` s nasledujúcim obsahom vo vašom editore. Nie je automaticky nasadený len preto, že je v `infra/`.

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

Z modulu zdrojovej skupiny vlastnícej účet pridajte volanie modulu (upraviť názov symbolu podľa vášho účtu):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nerozhlasujte rovnaké nasadenia v oboch moduloch. Ak je vstupný bod AZD viazaný na predplatné, vyvolajte tento z jeho potomka modulov viazaných na zdrojovú skupinu a upravte relatívnu cestu. Zostavte tento obsahujúci modul pomocou `az bicep build --file <path-to-containing-module>`, potom:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kritériá úspechu:**
- [ ] Viacero modelov úspešne nasadených
- [ ] Použité rôzne nastavenia kapacity
- [ ] Modely prístupné cez API
- [ ] Možnosť volať oba modely z aplikácie

### Cvičenie 3: Implementácia monitorovania nákladov (20 minút)
**Cieľ**: Nastaviť upozornenia na rozpočet a sledovanie nákladov

**Východiskový bod:** Vzor rozpočtu vyššie a infraštruktúrny modul viazaný na zdrojovú skupinu. Pridajte tento zdroj pomocou editora; predajte `budgetStartDate` z mapovania parametrov (nezdvojujte parameter, ak už je deklarovaný). Nahraďte príjemcu a potvrďte, že máte práva na zápis do rozpočtu.

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

Očakávané: odpoveď obsahuje `amount: 200`, oba prahy a váš príjemca. Skontrolujte Cost Management v portáli pre aktuálne poplatky; dáta o nákladoch sa oneskorujú a upozornenie nemusí v krátkom cvičení zareagovať.

**Kritériá úspechu:**
- [ ] Upozornenie na rozpočet vytvorené v Azure
- [ ] Nastavené e-mailové notifikácie
- [ ] Možnosť zobraziť dáta nákladov v Azure Portáli
- [ ] Práh rozpočtu správne nastavený

## 💡 Najčastejšie otázky

<details>
<summary><strong>Ako znížiť náklady na Microsoft Foundry Models počas vývoja?</strong></summary>

1. **Skontrolujte ceny**: Neexistuje univerzálny mesačný bezplatný limit 50 000 tokenov pre Azure OpenAI modely
2. **Prispôsobte kapacitu**: Kapacita `10` typicky predstavuje 10 000 TPM pre tieto štandardné textové modely, nie 10 TPM. Zníženie tohto limitu neznižuje cenu za token
3. **Použite azd down**: Vymažte dočasné zdroje, keď aktívne nevyvíjate (nie je to de-allocácia)
4. **Cache odpovedí**: Implementujte Redis cache pre opakované dotazy
5. **Použite prompt engineering**: Znížte spotrebu tokenov efektívnymi promptami

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Aký je rozdiel medzi Microsoft Foundry Models a OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Podniková bezpečnosť a súlad
- Integrácia do privátnej siete
- SLA záruky
- Overovanie pomocou spravovanej identity
- Vyššie kvóty dostupné

**OpenAI API**: Samostatný poskytovateľ/API s vlastnou dostupnosťou modelov, cenami, autentifikáciou a možnosťami podnikovej konektivity. Porovnávajte aktuálne ponuky namiesto predpokladov, že je to len verejný internet alebo že vždy dodáva modely ako prvý.

Vyberajte podľa požiadaviek vašej organizácie; špecifické Azure príklady spravovanej identity a privátnych odkazov v tomto kurze platia pre Azure-hostované služby, nie pre každý model/poskytovateľa z katalógu Foundry.
</details>

<details>
<summary><strong>Ako riešiť chyby prekročenia kvóty Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Môžem použiť vlastné dáta s Microsoft Foundry Models?</strong></summary>

Áno! Použite **Azure AI Search** pre RAG (Retrieval Augmented Generation):

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

Pozrite si šablónu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Ako zabezpečiť endpointy AI modelov?</strong></summary>

**Najlepšie praktiky**:
1. Používajte Spravovanú identitu (žiadne API kľúče)
2. Povoliť súkromné endpointy
3. Konfigurujte sieťové bezpečnostné skupiny
4. Implementujte obmedzovanie prístupov
5. Používajte Azure Key Vault na uchovávanie tajomstiev

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

## Komunita a podpora

- **Microsoft Foundry Discord**: [#Azure kanál](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémy a diskusie](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiálna dokumentácia](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry zručnosti na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Inštalujte Azure + Foundry agent skills vo vašom editore pomocou `npx skills add microsoft/github-copilot-for-azure`

---

**Navigácia kapitolou:**
- **📚 Úvod do kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-prvý vývoj
- **⬅️ Predchádzajúca kapitola**: [Kapitola 1: Váš prvý projekt](../chapter-01-foundation/first-project.md)
- **➡️ Ďalšia**: [AI agenti](agents.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

**Potrebujete pomoc?** Pridajte sa do našich komunitných diskusií alebo otvorte issue v repozitári. Komunita Azure AI + AZD je tu, aby vám pomohla uspieť!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->