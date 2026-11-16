# Integracija Microsoft Foundry s AZD

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - Razvoj orijentiran na AI
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [AI agenti](agents.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ovaj vodič prikazuje kako integrirati Microsoft Foundry usluge s Azure Developer CLI (AZD) za pojednostavljene implementacije AI aplikacija. Microsoft Foundry pruža sveobuhvatnu platformu za izgradnju, implementaciju i upravljanje AI aplikacijama, dok AZD pojednostavljuje proces infrastrukture i implementacije.

## Što je Microsoft Foundry?

Microsoft Foundry je jedinstvena platforma Microsofta za AI razvoj koja uključuje:

- **Katalog modela**: Pristup vrhunskim AI modelima
- **Prompt Flow**: Vizualni dizajner AI tijekova rada
- **Microsoft Foundry Portal**: Integrirano razvojno okruženje za AI aplikacije
- **Opcije implementacije**: Više opcija hostinga i skaliranja
- **Sigurnost i zaštita**: Ugrađene značajke odgovornog AI

## AZD + Microsoft Foundry: Bolje zajedno

| Značajka | Microsoft Foundry | Prednost integracije s AZD |
|---------|-----------------|------------------------|
| **Implementacija modela** | Ručna implementacija putem portala | Automatizirane, ponovljive implementacije |
| **Infrastruktura** | Pružanje putem klika | Infrastruktura kao kod (Bicep) |
| **Upravljanje okruženjem** | Fokus na jedno okruženje | Višestruka okruženja (dev/staging/prod) |
| **Integracija CI/CD** | Ograničena | Izvorna podrška za GitHub Actions |
| **Upravljanje troškovima** | Osnovno praćenje | Optimizacija troškova specifičnih za okruženje |

## Preduvjeti

- Pretplata na Azure s odgovarajućim dopuštenjima
- Instaliran Azure Developer CLI
- Pristup uslugama Microsoft Foundry Models
- Osnovno poznavanje Microsoft Foundry

> **Pregled izdanja (2026-11-04):** Smjernice za AI CLI su provjerene u skladu s dokumentacijom/izvorima `azd` `1.37.2`, agenata `1.0.0-beta.23` i evaluacija `1.0.0-beta.2`. Koristite `azd >= 1.37.0` za objedinjeni tijek rada. Pogledajte [promjene i ispravke izdanja](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); ovaj pregled ne certificira sve predloške ili primjere SDK-a u odnosu na stvarnu implementaciju.

## Osnovni obrasci integracije

**Opseg primjera:** Donji Bicep sadrži ilustrativne fragmente resursa, a ne potpuni implementacijski predložak. Sadržani predložak mora definirati nazive, `location`, referencirane resurse, identitete, izlaze i hosting aplikacije. Koristite povezani uzorak za početnu izvedbu. Bash primjeri zahtijevaju zasebnu Azure CLI autentikaciju od `azd auth login`.

### Obrazac 1: Integracija Microsoft Foundry Modela

**Slučaj upotrebe**: Implementacija chat aplikacija s Azure OpenAI modelima u Microsoft Foundry

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

Pozivatelj treba priloženi upravljani identitet i `Cognitive Services OpenAI User` na razini računa; onemogućivanje ključeva ne daje pristup. Provjerite dostupnost regije/modela/SKU i kvotu prije implementacije.

### Obrazac 2: Integracija AI pretraživanja + RAG

**Slučaj upotrebe**: Implementacija aplikacija za generiranje uz podršku pretraživanja (RAG)

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

Nema `Microsoft.Search/searchServices/dataConnections` ARM resursa za ovu integraciju. Konfigurirajte Search indeks, izvor podataka, indeksator/sklop vještina ili vektorizer kroz podržane Search API-je na data-plane-u. Ako Search poziva embedding model, omogućite njegov upravljani identitet, dodijelite relevantnu ulogu modela i konfigurirajte njegovu embedding vještinu/vektorizer. Pogledajte [integriranu vektoraciju](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Obrazac 3: Integracija Document Intelligence

**Slučaj upotrebe**: Radni tokovi obrade i analize dokumenata

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

## 🔧 Obrasci konfiguracije

### Postavljanje varijabli okruženja

Osim dokumentiranih AZD postavki kao što je `AZURE_LOCATION`, ovo su **ulazni nazivi prilagođenih predložaka**. Nemaju učinak osim ako ih predložak/aplikacija ne koristi kroz parametre i preslikavanje okoline hosta. Za `azure-search-openai-demo` koristite njegove stvarne nazive poput `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` i `AZURE_SEARCH_SERVICE_SKU`. Kapacitet modela nije SKU računa.

**Konfiguracija za proizvodnju:**
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

**Konfiguracija za razvoj:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Sigurna konfiguracija s Key Vault-om

Preferirajte Entra ID s onemogućenim lokalnim ovjeravanjem ključeva. Sljedeće je samo **nasljedna alternativa za ovjeru ključem** za aplikacije kojima su ključevi potrebni: zahtijeva račun s omogućenim ovjeravanjem ključem, identitet aplikacije priključen na njen host i pravilno funkcioniranje pristupa i mreže za Key Vault. Nemojte kombinirati dohvat ključeva s `disableLocalAuth: true` i očekivati da će pozivi temeljeni na ključevima raditi.

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

## Tijekovi rada implementacije

### AZD proširenja za Foundry

AZD pruža proširenja koja dodaju AI-specifične mogućnosti za rad s Microsoft Foundry uslugama:

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

AI proširenja se još brzo razvijaju u pregledu. Ako se naredba ponaša drugačije nego što je ovdje prikazano, nadogradite relevantno proširenje prije otklanjanja poteškoća u samom projektu.

### Implementacija usmjerena na agente s `azd ai`

Koristite `azd ai agent init` interaktivno ili usvojite trenutni predložak projekta `azure.yaml` agenta povezan s Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` zamjenjuju zastarjeli oblik `--manifest`/`-m`; nasljedna manifest i ugnježđena konfiguracija agente još trebaju migraciju. Procjenjujte agente s `azd ai eval` iz `azure.ai.evaluations`, a ne zastarjelim radnim tokom. Pogledajte [migraciju evaluacije](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) za postavljanje, izvođenje i rezultate.

Pogledajte [AZD AI CLI naredbe](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za puni referentni popis naredbi i zastavica.

### Implementacija jednom naredbom

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Implementacije specifične za okruženje

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

## Praćenje i uočavanje

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

Ovo postavlja Insights resurs, a ne instrumentaciju telemetrije. Kad vaša aplikacija emitira odlazne modele poziva, pokrenite ovaj ilustrativni upit u Application Insights Logs (prilagodite filter stvarnim imenima trajanja):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Praćenje troškova

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

Koristite stvarnog primatelja i provjerite dopuštenja za račun za naplatu. Proračun šalje upozorenja; nije ograničenje potrošnje.

## 🔐 Najbolje sigurnosne prakse

### Konfiguracija upravljanog identiteta

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

### Sigurnost mreže

Ovaj fragment krajnje točke također zahtijeva privatnu DNS zonu/grupu, VNet veze, povezivost aplikacije s VNet-om i eksplicitnu politiku javnog pristupa. Samo stvaranje privatne krajnje točke ne onemogućava javni pristup.

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

## Optimizacija performansi

### Strategije predmemoriranja

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

Azure Cache for Redis Basic/Standard/Premium je na [putu povlačenja](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); koristite Azure Managed Redis za nove implementacije i slijedite njegove trenutne smjernice za predloške/autentikaciju. Ograničite predmemorirane AI odgovore po autorizaciji, modelu/uputama i verziji podataka, uz isteka; nikada nemojte dijeliti privatne odgovore samo s tekstom upita.

### Konfiguracija automatskog skaliranja

**Djelomični resurs:** spojite ove postavke skaliranja/ulaza u potpunu Container App s upravljanim okruženjem, slikom kontejnera i ograničenjima resursa. Više replika ne povećava kvotu modela.

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

## Otklanjanje uobičajenih problema

### Problem 1: Dosegnuta kvota OpenAI-ja

**Simptomi:**
- Implementacija ne uspijeva zbog pogrešaka kvote
- 429 pogrešaka u zapisnicima aplikacije

**Rješenja:**
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

Gornja varijabla kapaciteta se odnosi samo na prilagođeni predložak koji ju koristi. Za RAG uzorak koristite `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Nemojte mijenjati `AZURE_LOCATION` za premještanje postojećih resursa na mjesto; stvorite zasebno okruženje za novu regiju i planirajte migraciju/popravljanje.

### Problem 2: Neuspjeh autentikacije

**Simptomi:**
- 401/403 pogreške pri pozivanju AI usluga
- Poruke "Pristup odbijen"

**Rješenja:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problem 3: Problemi s implementacijom modela

**Simptomi:**
- Modeli nisu dostupni u implementaciji
- Neuspjeh specifičnih verzija modela

**Rješenja:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Primjeri predložaka

Ovo su alternative, a ne uzastopne naredbe. Pokrenite svaku u zasebnom praznom direktoriju. Izričita `.` odredišna putanja zadržava inicijalizaciju u vašem trenutnom direktoriju; inače trenutni AZD može stvoriti poddirektorij naziva predloška bez promjene radnog direktorija vašeg ljuska.

### RAG chat aplikacija (Python)

**Repozitorij**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Referentna RAG chat aplikacija za pitanja nad vašim dokumentima, s Azure AI Search pretraživanjem. Pregledajte podržane modele primjera, opcionalne značajke, smjernice troškova i zaškripte za proizvodnju prije upotrebe; implementacija uzorka ne čini aplikaciju spremnom za proizvodnju.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG chat aplikacija (.NET)

**Repozitorij**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# ekvivalent Python RAG chat uzorka. Izgrađeno s ASP.NET Core Minimal API i Blazor WebAssembly frontendom. Uključuje glasovni chat, podršku za GPT-4o-mini viziju i pratećeg .NET MAUI Blazor Hybrid desktop/mobilnog klijenta.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG chat aplikacija (Java)

**Repozitorij**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Java verzija RAG chat uzorka koristeći Langchain4J za AI orkestraciju. Podržava mikroservisnu arhitekturu vođenu događajima, više strategija pretraživanja (tekst, vektor, hibrid), prijenos dokumenata s Azure Document Intelligence i implementaciju na Azure Container Apps ili Azure Kubernetes Service.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot s Microsoft Foundry

**Repozitorij**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Usluge**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: End-to-end retail RAG copilot koristeći Microsoft Foundry i Prompty. Contoso Outdoor chatbot za trgovinu koji temelji odgovore na katalogu proizvoda i podacima o narudžbi kupca. Demonstrira cjelokupni GenAIOps tijek rada — prototip s Promptyjem, evaluacija uz AI-podržane evaluatore i implementacija putem AZD u Container Apps.

**Brzi početak**:
```bash
azd init --template contoso-chat .
azd up
```

### Višestruka-agentna aplikacija za kreativno pisanje

**Repozitorij**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Usluge**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Višestruki agent primjer koji demonstrira orkestraciju AI agenata s Promptyjem. Koristi istraživačkog agenta (Bing Grounding u Azure AI Agent Service), produkt agenta (Azure AI Search), agenta pisca i agenta urednika za zajedničko stvaranje dobro istraženih članaka. Uključuje CI/CD s evaluacijom u GitHub Actions.

**Brzi početak**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repozitorij**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Usluge**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB za NoSQL + LangChain.js

**Opis**: Potpuno serverless RAG chatbot koristeći LangChain.js s Azure Functions za API i Azure Static Web Apps za hosting. Koristi Azure Cosmos DB kao spremište vektora i bazu podataka povijesti razgovora. Podržava lokalni razvoj s Ollama za testiranje bez troškova.

**Brzi početak**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Accelerator rješenja Chat sa vašim podacima

**Repozitorij**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Usluge**: Microsoft Foundry + Azure Container Apps (web/API/ingestija) + Azure AI Search s Cosmos DB ili PostgreSQL s pgvector

**Opis**: Acelerator chat podržan dokumentima s navodima izvora. Trenutni uzorak hosta React frontend, FastAPI backend i Functions ingestijski radnik na Container Apps; opcije orkestracije su Agent Framework i LangGraph. Izbor baze podataka/pronađi se vrši pri implementaciji. To je početna točka, a ne gotov proizvodni sustav; nemojte pretpostavljati da su starije varijante App Service, Semantic Kernel ili Prompt Flow trenutni zadani.

**Brzi početak**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI agenti za putovanja — višestruka-agentna MCP orkestracija

**Repozitorij**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Usluge**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP poslužitelji (.NET, Python, Java, TypeScript)

**Opis**: Referentna aplikacija za višeagentnu AI orkestraciju koristeći tri okvira (LangChain.js, LlamaIndex.TS i Microsoft Agent Framework). Sadrži MCP (Model Context Protocol) poslužitelje na četiri jezika implementirane kao serverless Azure Container Apps s OpenTelemetry nadzorom.

**Brzi početak**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Pregledajte više predložaka**: Posjetite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) za trenutno dostupne predloške na različitim jezicima i u različitim scenarijima. Svaki povezani primjer je vanjski repozitorij, a ne lokalni primjer koji pruža ovaj tečaj; prije implementacije provjerite njegove trenutne preduvjete i smjernice za proizvodnju.

## Sljedeći koraci

1. **Isprobajte primjere**: Počnite s predloškom koji odgovara vašem slučaju uporabe
2. **Prilagodite prema svojim potrebama**: Izmijenite infrastrukturu i kod aplikacije
3. **Dodajte nadzor**: Implementirajte sveobuhvatnu promatranost
4. **Optimizirajte troškove**: Prilagodite konfiguracije za svoj proračun
5. **Osigurajte implementaciju**: Implementirajte obrasce sigurnosti za poduzeća
6. **Skalirajte u proizvodnju**: Dodajte značajke za višeregionalnost i visoku dostupnost

## 🎯 Praktične vježbe

### Vježba 1: Implementirajte Microsoft Foundry Models Chat aplikaciju (30 minuta)
**Cilj**: Implementirati i testirati referentnu AI chat aplikaciju

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

**Kriteriji uspjeha:**
- [ ] Implementacija dovršena bez pogrešaka zbog kvote
- [ ] Pristup sučelju chata u pregledniku
- [ ] Mogućnost postavljanja pitanja i primanja AI-pokretanih odgovora
- [ ] Application Insights prikazuje telemetry podatke
- [ ] Uspješno očišćeni resursi

**Trošak:** Prije implementacije pregledajte trenutne smjernice i odabrane SKU. Naplata traje dok se resursi ne izbrišu; nema fiksne 30-minutne procjene za svaku konfiguraciju.

### Vježba 2: Konfigurirajte višemodelsku implementaciju (45 minuta)
**Cilj**: Implementirati više AI modela s različitim konfiguracijama

**Početna točka:** Postojeći Azure OpenAI račun i AZD modul resursne grupe koji može pozvati ovu datoteku. Kreirajte `infra/ai-models.bicep` s sljedećim sadržajem koristeći vaš uređivač. Nije automatski implementirano samo zato što se nalazi pod `infra/`.

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

Iz modula ograničenog na resursnu grupu koji posjeduje račun, dodajte poziv modula (prilagodite ime simbola stvarnom računu):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Ne deklarirajte iste implementacije u oba modula. Ako je AZD ulazna točka ograničena na pretplatu, pozovite ovo iz njegovog modula ograničenog na resursnu grupu i prilagodite relativnu putanju. Izgradite taj sadržajni modul s `az bicep build --file <path-to-containing-module>`, zatim:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kriteriji uspjeha:**
- [ ] Više modela uspješno implementirano
- [ ] Primijenjene različite postavke kapaciteta
- [ ] Modeli dostupni putem API-ja
- [ ] Mogućnost poziva oba modela iz aplikacije

### Vježba 3: Implementirajte nadzor troškova (20 minuta)
**Cilj**: Postaviti upozorenja na proračun i praćenje troškova

**Početna točka:** Gornji obrazac proračuna i infrastrukturni modul ograničen na resursnu grupu. Dodajte ovaj resurs koristeći uređivač; proslijedite `budgetStartDate` iz mapiranja parametara (nemojte duplicirati parametar ako je već deklariran). Zamijenite primatelja i potvrdite da imate pristup za pisanje proračuna.

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

Očekivano: odgovor sadrži `amount: 200`, oba praga i vašeg primatelja. Provjerite Cost Management u portalu za stvarne troškove; podaci o troškovima su odgođeni i tijekom kratke vježbe upozorenje se ne mora pojaviti.

**Kriteriji uspjeha:**
- [ ] U Azureu je kreirano upozorenje proračuna
- [ ] Konfigurirane su e-mail obavijesti
- [ ] Moguć je pregled podataka o troškovima u Azure portalu
- [ ] Proračunski pragovi su ispravno postavljeni

## 💡 Često postavljana pitanja

<details>
<summary><strong>Kako smanjiti troškove Microsoft Foundry Models tijekom razvoja?</strong></summary>

1. **Provjerite cijene**: Ne postoji univerzalna besplatna mjesečna kvota od 50.000 tokena za Azure OpenAI modele
2. **Odaberite odgovarajući kapacitet**: Kapacitet `10` obično predstavlja 10.000 TPM za ove Standard tekstualne modele, a ne 10 TPM. Smanjenje tog ograničenja ne smanjuje cijene po tokenu
3. **Koristite azd down**: Izbrišite resurse za jednokratnu uporabu kad ne razvijate aktivno (ovo nije dealokacija)
4. **Predmemorirajte odgovore**: Implementirajte Redis cache za ponovljene upite
5. **Koristite Prompt Engineering**: Smanjite korištenje tokena s učinkovitijim upitima

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Koja je razlika između Microsoft Foundry Models i OpenAI API-ja?</strong></summary>

**Microsoft Foundry Models**:
- Sigurnost i usklađenost za poduzeća
- Integracija privatne mreže
- Jamstva SLA
- Autentikacija putem upravljanog identiteta
- Dostupne veće kvote

**OpenAI API**: Odvojeni pružatelj/API s vlastitom dostupnošću modela, cijenama, autentikacijom i opcijama povezanosti za poduzeća. Usporedite trenutačne ponude umjesto da pretpostavljate da je dostupan samo putem javnog interneta ili da modeli uvijek prvi dolaze tamo.

Odaberite na temelju zahtjeva vaše organizacije; Azure-specifični primjeri upravljanih identiteta i privatnih veza u ovom tečaju vrijede za Azure usluge, ne za svaki model/pružatelja u Foundry katalogu.
</details>

<details>
<summary><strong>Kako riješiti pogreške prekoračenja kvote Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Mogu li koristiti svoje podatke s Microsoft Foundry Models?</strong></summary>

Da! Koristite **Azure AI Search** za RAG (Retrieval Augmented Generation):

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

Pogledajte [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) predložak.
</details>

<details>
<summary><strong>Kako osigurati krajnje točke AI modela?</strong></summary>

**Najbolje prakse**:
1. Koristite upravljani identitet (bez API ključeva)
2. Omogućite privatne krajnje točke
3. Konfigurirajte sigurnosne grupe mreže
4. Implementirajte ograničenje brzine poziva
5. Koristite Azure Key Vault za tajne podatke

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

## Zajednica i podrška

- **Microsoft Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problemi i rasprave](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Službena dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalirajte Azure + Foundry agent skills u svoj uređivač s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvo razvijanje
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [AI agenti](agents.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se raspravama zajednice ili otvorite pitanje u repozitoriju. Azure AI + AZD zajednica je ovdje da vam pomogne uspjeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->