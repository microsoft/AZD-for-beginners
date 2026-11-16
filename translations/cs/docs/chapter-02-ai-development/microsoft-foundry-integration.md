# Integrace Microsoft Foundry s AZD

**Navigace kapitolou:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj s AI na prvním místě
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [AI agenti](agents.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

## Přehled

Tento průvodce ukazuje, jak integrovat služby Microsoft Foundry s Azure Developer CLI (AZD) pro zjednodušené nasazení AI aplikací. Microsoft Foundry poskytuje komplexní platformu pro vytváření, nasazení a správu AI aplikací, zatímco AZD usnadňuje proces infrastruktury a nasazení.

## Co je Microsoft Foundry?

Microsoft Foundry je sjednocená platforma Microsoftu pro vývoj AI, která zahrnuje:

- **Katalog modelů**: Přístup k špičkovým AI modelům
- **Prompt Flow**: Vizualní návrhář AI workflow
- **Microsoft Foundry Portal**: Integrované vývojové prostředí pro AI aplikace
- **Možnosti nasazení**: Různé možnosti hostování a škálování
- **Bezpečnost a ochrana**: Vestavěné funkce zodpovědné AI

## AZD + Microsoft Foundry: Lepší dohromady

| Funkce | Microsoft Foundry | Výhoda integrace s AZD |
|---------|-----------------|------------------------|
| **Nasazení modelu** | Manuální nasazení v portálu | Automatizované, opakovatelné nasazení |
| **Infrastruktura** | Provisionování přes kliknutí | Infrastruktura jako kód (Bicep) |
| **Správa prostředí** | Zaměření na jedno prostředí | Více prostředí (vývoj/test/prod) |
| **Integrace CI/CD** | Omezená | Nativní podpora GitHub Actions |
| **Správa nákladů** | Základní monitoring | Optimalizace nákladů dle prostředí |

## Požadavky

- Azure předplatné s příslušnými oprávněními
- Nainstalovaný Azure Developer CLI
- Přístup ke službám Microsoft Foundry Models
- Základní znalost Microsoft Foundry

> **Revize vydání (2026-11-04):** AI CLI návod byl zkontrolován vůči dokumentaci/zdroji `azd` `1.37.2`, agentům `1.0.0-beta.23` a hodnocením `1.0.0-beta.2`. Pro kombinovaný workflow použijte `azd >= 1.37.0`. Viz [změny a opravy vydání](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); tato revize necertifikuje každý šablonový či SDK příklad vůči živému nasazení.

## Základní integrační vzory

**Rozsah příkladů:** Níže uvedený Bicep obsahuje ilustrativní fragmenty zdrojů, nikoliv kompletní nasaditelnou šablonu. Obsahující šablona musí definovat názvy, `location`, odkázané zdroje, identity, výstupy a hostování aplikací. Použijte připojený vzorový příklad jako spustitelný výchozí bod. Příklady v Bash vyžadují samostatné ověřování Azure CLI mimo `azd auth login`.

### Vzor 1: Integrace Microsoft Foundry Models

**Případ použití**: Nasazení chatovacích aplikací s modely Azure OpenAI v Microsoft Foundry

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

Volající potřebuje připojenou spravovanou identitu a `Cognitive Services OpenAI User` na úrovni účtu; deaktivace klíčů nepřiděluje přístup. Před nasazením ověřte dostupnost regionu/modelu/SKU a kvótu.

### Vzor 2: Integrace AI Search + RAG

**Případ použití**: Nasazení aplikací pro retrieval-augmented generation (RAG)

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

Pro tuto integraci neexistuje ARM zdroj `Microsoft.Search/searchServices/dataConnections`. Nakonfigurujte index Search, datový zdroj, indexer/skillset nebo vectorizer přes podporované API datové roviny Search. Pokud Search volá embedding model, povolte jeho spravovanou identitu, přidělte příslušnou roli modelu a nakonfigurujte jeho embedding skill/vectorizer. Viz [integrovaná vektorizace](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Vzor 3: Integrace Document Intelligence

**Případ použití**: Workflow zpracování a analýzy dokumentů

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

## 🔧 Konfigurační vzory

### Nastavení proměnných prostředí

Kromě zdokumentovaných nastavení AZD, jako je `AZURE_LOCATION`, jsou toto **vstupní jména vlastních šablon**. Nemají účinek, pokud je šablona/aplikace nekonzumuje přes parametry a mapování hostitelského prostředí. Pro `azure-search-openai-demo` použijte jeho skutečná jména jako `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` a `AZURE_SEARCH_SERVICE_SKU`. Kapacita modelu není SKU účtu.

**Konfigurace pro produkci:**
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

**Konfigurace pro vývoj:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Bezpečná konfigurace s Key Vault

Preferujte Entra ID s deaktivovaným lokálním ověřováním klíčů. Následující je pouze **zastaralá alternativa ověřování klíčem** pro aplikace vyžadující klíče: vyžaduje účet s povoleným ověřováním klíčem, připojenou identitu aplikace k hostiteli a funkční přístup/konektivitu ke Key Vault. Nekombinujte načítání klíčů s `disableLocalAuth: true` a nečekejte funkčnost volání s klíči.

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

## Workflow nasazení

### Rozšíření AZD pro Foundry

AZD poskytuje rozšíření přidávající AI-specifické schopnosti pro práci se službami Microsoft Foundry:

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

AI rozšíření jsou stále rychle ve fázi preview. Pokud se příkaz chová jinak, než je uvedeno, aktualizujte příslušné rozšíření, než začnete řešit projekt samotný.

### Nasazení orientované na agenta s `azd ai`

Použijte `azd ai agent init` interaktivně nebo přijměte aktuální šablonu projektu agenta `azure.yaml` propojenou se službou Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` nahrazuje zastaralý zápis `--manifest`/`-m`; starší manifest a vnořená agentní konfigurace stále vyžadují migraci. Hodnoťte agenty pomocí `azd ai eval` z `azure.ai.evaluations`, nikoliv ze zrušeného starého workflow. Viz [migrace hodnocení](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) pro nastavení, provedení a výsledky.

Viz [Příkazy AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pro úplnou referenci příkazů a parametrů.

### Nasazení jedním příkazem

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Nasazení specifické pro prostředí

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

## Monitorování a pozorovatelnost

### Integrace Application Insights

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

To zřizuje zdroj Insights, nikoli telemetrickou instrumentaci. Jakmile vaše aplikace vydá vyvolání modelu do telemetrie, spusťte tento ilustrační dotaz v Application Insights Logs (přizpůsobte filtr skutečným názvům span):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitorování nákladů

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

Použijte skutečného příjemce a ověřte oprávnění k fakturačnímu rozsahu. Rozpočet posílá upozornění; není to limit výdajů.

## 🔐 Nejlepší bezpečnostní praktiky

### Konfigurace spravované identity

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

### Síťová bezpečnost

Tento fragment koncového bodu také vyžaduje privátní DNS zónu/skupinu, VNet odkazy, připojení aplikace k VNet a explicitní politiku veřejného přístupu. Vytvoření privátního koncového bodu samotné veřejný přístup neblokuje.

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

## Optimalizace výkonu

### Strategie ukládání do cache

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

Azure Cache for Redis Basic/Standard/Premium je na [cestě k ukončení](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); pro nová nasazení používejte Azure Managed Redis a řiďte se jeho aktuálními pokyny pro šablony/ověřování. Vymezte cache AI odpovědí podle autorizace, modelu/instrukcí a verze dat, s vypršením platnosti; nikdy nesdílejte soukromé odpovědi pouze pomocí textu dotazu.

### Konfigurace automatického škálování

**Částečný zdroj:** spojte tato nastavení škálování/ingresu do kompletní Container App s řízeným prostředím, kontejnerovým obrazem a limity zdrojů. Více replik nezvyšuje kvótu modelu.

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

## Řešení běžných problémů

### Problém 1: Překročená kvóta OpenAI

**Příznaky:**
- Nasazení selhává kvůli chybám kvóty
- 429 chyby v aplikačních protokolech

**Řešení:**
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

Výše uvedená proměnná kapacity platí pouze pro vlastní šablonu, která ji konzumuje. Pro ukázku RAG použijte `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Neměňte `AZURE_LOCATION` pro přesun existujících zdrojů; vytvořte samostatné prostředí pro nový region a plánujte migraci/úklid.

### Problém 2: Selhání ověření

**Příznaky:**
- 401/403 chyby při volání AI služeb
- Zprávy „Přístup zamítnut“

**Řešení:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problém 3: Problémy s nasazením modelu

**Příznaky:**
- Modely nejsou v nasazení k dispozici
- Selhání specifických verzí modelu

**Řešení:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Ukázkové šablony

Toto jsou alternativy, ne sekvenční příkazy. Každý spusťte v samostatném prázdném adresáři. Explicitní cíl `.` uchovává inicializaci ve vašem aktuálním adresáři; jinak může AZD vytvořit podsložku pojmenovanou podle šablony bez změny pracovního adresáře shellu.

### RAG chatovací aplikace (Python)

**Repozitář**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Popis**: Referenční aplikace RAG chatu pro dotazy nad vašimi dokumenty s dotazováním Azure AI Search. Před použitím si prohlédněte podporované modely, volitelné funkce, doporučení nákladů a posílení pro produkci; nasazení vzoru nezaručuje připravenost aplikace pro produkci.

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG chatovací aplikace (.NET)

**Repozitář**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Popis**: .NET/C# obdoba ukázky RAG chatu v Pythonu. Vytvořeno s ASP.NET Core Minimal API a Blazor WebAssembly frontendem. Obsahuje hlasový chat, podporu GPT-4o-mini vision a doprovodného desktop/mobilního klienta .NET MAUI Blazor Hybrid.

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG chatovací aplikace (Java)

**Repozitář**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Služby**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Popis**: Java verze ukázky RAG chatu používající Langchain4J pro orchestraci AI. Podpora mikroservisní event-driven architektury, vícero dotazovacích strategií (text, vektor, hybrid), nahrávání dokumentů s Azure Document Intelligence a nasazení buď na Azure Container Apps nebo Azure Kubernetes Service.

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Podnikový retailový kopilot s Microsoft Foundry

**Repozitář**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Popis**: Kompletní retailový RAG kopilot využívající Microsoft Foundry a Prompty. Chatbot pro Contoso Outdoor maloobchod s odpověďmi založenými na katalogu produktů a datech objednávek zákazníků. Demonstruje kompletní GenAIOps workflow — prototypování s Prompty, hodnocení s asistencí AI evaluátorů a nasazení přes AZD do Container Apps.

**Rychlý start**:
```bash
azd init --template contoso-chat .
azd up
```

### Víceagentová aplikace pro kreativní psaní

**Repozitář**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Služby**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Popis**: Ukázka více agentů demonstrující orchestraci AI agentů s Prompty. Používá výzkumného agenta (Bing Grounding v Azure AI Agent Service), produktového agenta (Azure AI Search), agenta pisatele a agenta editora pro společnou tvorbu dobře prostudovaných článků. Zahrnuje CI/CD s hodnocením v GitHub Actions.

**Rychlý start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repozitář**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Služby**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pro NoSQL + LangChain.js

**Popis**: Plně serverless RAG chatbot využívající LangChain.js s Azure Functions pro API a Azure Static Web Apps pro hostování. Používá Azure Cosmos DB jako vektorové úložiště a databázi historie chatu. Podporuje lokální vývoj s Ollama pro testování bez nákladů.

**Rychlý start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Akcelerátor řešení Chat s vašimi daty

**Repozitář**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Služby**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search s Cosmos DB nebo PostgreSQL s pgvector

**Popis**: Akcelerátor konverzace založené na dokumentech s citacemi. Aktuální vzor provozuje React frontend, FastAPI backend a pracovníka Functions pro ingestii v Container Apps; orchestrátorem může být Agent Framework nebo LangGraph. Volby databáze/dotazování jsou určeny při nasazení. Je to výchozí bod, nikoli hotový produkční systém; nepředpokládejte, že starší varianty App Service, Semantic Kernel nebo Prompt Flow popisují výchozí současný stav.

**Rychlý start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI cestovní agenti — multi-agentní orchestr MCP

**Repozitář**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Služby**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP servery (.NET, Python, Java, TypeScript)

**Popis**: Referenční aplikace pro orchestraci víceagentní AI využívající tři rámce (LangChain.js, LlamaIndex.TS a Microsoft Agent Framework). Funkce MCP (Model Context Protocol) servery ve čtyřech jazycích nasazené jako serverless Azure Container Apps s monitorováním OpenTelemetry.

**Rychlý start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Prohlédněte si více šablon**: Navštivte [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pro aktuálně dostupné šablony v různých jazycích a scénářích. Každý propojený příklad je externí repozitář, nikoliv lokální příklad dodaný tímto kurzem; před nasazením si proto prověřte jeho současné předpoklady a doporučení pro produkci.

## Další kroky

1. **Vyzkoušejte příklady**: Začněte s předpřipravenou šablonou odpovídající vašemu použití
2. **Přizpůsobte podle svých potřeb**: Upravte infrastrukturu a aplikační kód
3. **Přidejte monitorování**: Implementujte komplexní pozorovatelnost
4. **Optimalizujte náklady**: Vyladěte konfigurace podle rozpočtu
5. **Zabezpečte své nasazení**: Implementujte podnikové bezpečnostní vzory
6. **Škálujte do produkce**: Přidejte víceregionální a vysoce dostupné funkce

## 🎯 Praktická cvičení

### Cvičení 1: Nasazení chatovací aplikace Microsoft Foundry Models (30 minut)
**Cíl**: Nasadit a otestovat referenční AI chatovací aplikaci

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

**Kritéria úspěchu:**
- [ ] Nasazení proběhlo bez chyb kvót
- [ ] Přístup k chatovacímu rozhraní v prohlížeči
- [ ] Možnost klást otázky a získávat odpovědi poháněné AI
- [ ] Application Insights zobrazuje telemetrická data
- [ ] Úspěšné vyčištění zdrojů

**Náklady:** Před nasazením si projděte aktuální návod k nákladům a vybrané SKU této ukázky. Fakturace pokračuje, dokud nejsou zdroje smazány; neplatí žádný pevný odhad 30 minut pro všechny konfigurace.

### Cvičení 2: Konfigurace nasazení vícero modelů (45 minut)
**Cíl**: Nasadit více AI modelů s různými konfiguracemi

**Výchozí bod:** Existující účet Azure OpenAI a AZD modul rozsahu resource-group, který může volat tento soubor. Vytvořte `infra/ai-models.bicep` s následujícím obsahem pomocí editoru. Není automaticky nasazen jen proto, že je umístěn pod `infra/`.

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

Z modulu rozsahu resource-group, který vlastní účet, přidejte volání modulu (přizpůsobte název symbolu vašemu skutečnému účtu):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nepodekládejte stejné nasazení v obou modulech. Pokud je vstupní bod AZD definován na úrovni subscription, volejte tento modul z jeho child modulu typu resource-group a upravte relativní cestu. Sestavte obsahující modul pomocí `az bicep build --file <path-to-containing-module>` a poté:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kritéria úspěchu:**
- [ ] Více modelů bylo úspěšně nasazeno
- [ ] Použity různé kapacitní nastavení
- [ ] Modely přístupné přes API
- [ ] Lze volat oba modely z aplikace

### Cvičení 3: Implementace monitorování nákladů (20 minut)
**Cíl**: Nastavit upozornění na rozpočet a sledování nákladů

**Výchozí bod:** Vzor rozpočtu výše a infrastrukturní modul rozsahu resource-group. Přidejte tento zdroj pomocí editoru; předávejte `budgetStartDate` ze svého mapování parametrů (nezdvojte parametr, pokud již je deklarován). Nahraďte příjemce a potvrďte, že máte právo zápisu do rozpočtu.

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

Očekává se: odpověď obsahuje `amount: 200`, obě prahové hodnoty a vašeho příjemce. Zkontrolujte Cost Management v portálu pro skutečné poplatky; data o nákladech jsou zpožděná a během krátkého cvičení nemusí dojít k aktivaci upozornění.

**Kritéria úspěchu:**
- [ ] Upozornění na rozpočet vytvořeno v Azure
- [ ] Nastaveny e-mailové notifikace
- [ ] Možnost zobrazit nákladová data v Azure portálu
- [ ] Prahové hodnoty rozpočtu nastaveny správně

## 💡 Často kladené otázky

<details>
<summary><strong>Jak snížit náklady Microsoft Foundry Models během vývoje?</strong></summary>

1. **Zkontrolujte ceny**: Neexistuje univerzální bezplatný měsíční limit 50 000 tokenů pro Azure OpenAI modely
2. **Vyberte správnou kapacitu**: Kapacita `10` typicky představuje 10 000 TPM pro tyto standardní textové modely, nikoli 10 TPM. Snížení tohoto limitu neznamená nižší cenu za token
3. **Používejte azd down**: Odstraňujte dočasné zdroje, když aktivně nevyvíjíte (není to dealokace)
4. **Cache odpovědi**: Implementujte Redis cache pro opakované dotazy
5. **Používejte Prompt Engineering**: Snižte spotřebu tokenů efektivními promptami

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Jaký je rozdíl mezi Microsoft Foundry Models a OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Podniková bezpečnost a shoda
- Integrace do privátní sítě
- SLA záruky
- Ověřování přes managed identity
- Vyšší dostupné kvóty

**OpenAI API**: Samostatný poskytovatel/API s vlastní dostupností modelů, cenami, ověřováním a podnikovými možnostmi konektivity. Porovnejte aktuální nabídky místo předpokladu, že je to pouze veřejný internet nebo že modely vždy doručuje první.

Vyberte podle požadavků vaší organizace; příklady managed identity a private-link specifické pro Azure v tomto kurzu platí pro služby hostované v Azure, ne každý model/poskytovatel v katalogu Foundry.
</details>

<details>
<summary><strong>Jak řešit chyby překročení kvóty Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Mohu používat vlastní data s Microsoft Foundry Models?</strong></summary>

Ano! Použijte **Azure AI Search** pro RAG (Retrieval Augmented Generation):

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

Podívejte se na šablonu [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Jak zabezpečit koncové body AI modelů?</strong></summary>

**Nejlepší praxe**:
1. Používejte managed identity (žádné API klíče)
2. Povolit Private Endpoints
3. Nakonfigurovat síťové bezpečnostní skupiny
4. Implementovat omezení rychlosti volání
5. Používat Azure Key Vault pro tajné informace

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiální dokumentace](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Nainstalujte Azure + Foundry agent skills ve svém editoru pomocí `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitol:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - AI-First vývoj
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../chapter-01-foundation/first-project.md)
- **➡️ Další**: [AI agenti](agents.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

**Potřebujete pomoc?** Připojte se k diskuzím naší komunity nebo otevřete issue v repozitáři. Komunita Azure AI + AZD je zde, aby vám pomohla uspět!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->