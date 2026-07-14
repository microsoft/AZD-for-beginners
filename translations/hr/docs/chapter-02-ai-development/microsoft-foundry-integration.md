# Microsoft Foundry integracija s AZD

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvo razvoj
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [Implementacija AI modela](ai-model-deployment.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ovaj vodič pokazuje kako integrirati Microsoft Foundry usluge s Azure Developer CLI (AZD) za pojednostavljene implementacije AI aplikacija. Microsoft Foundry pruža sveobuhvatnu platformu za izgradnju, implementaciju i upravljanje AI aplikacijama, dok AZD pojednostavljuje proces infrastrukture i implementacije.

## Što je Microsoft Foundry?

Microsoft Foundry je Microsoftova objedinjena platforma za razvoj AI koja uključuje:

- **Katalog modela**: Pristup najsuvremenijim AI modelima
- **Prompt Flow**: Vizualni dizajner AI tijekova rada
- **Microsoft Foundry Portal**: Integrirano razvojno okruženje za AI aplikacije
- **Opcije implementacije**: Više opcija hostinga i skaliranja
- **Sigurnost i zaštićenost**: Ugrađene funkcije odgovornog AI-ja

## AZD + Microsoft Foundry: Bolje zajedno

| Značajka | Microsoft Foundry | Korist AZD integracije |
|---------|-----------------|------------------------|
| **Implementacija modela** | Ručna implementacija putem portala | Automatizirane, ponovljive implementacije |
| **Infrastruktura** | Provisioniranje putem klika | Infrastruktura kao kod (Bicep) |
| **Upravljanje okruženjem** | Fokus na jednom okruženju | Višestruka okruženja (razvoj/test/produkcija) |
| **CI/CD integracija** | Ograničena | Izvorna podrška za GitHub Actions |
| **Upravljanje troškovima** | Osnovno praćenje | Optimizacija troškova specifična za okruženje |

## Preduvjeti

- Pretplata na Azure sa odgovarajućim dopuštenjima
- Instaliran Azure Developer CLI
- Pristup Microsoft Foundry Models uslugama
- Osnovno poznavanje Microsoft Foundry

> **Trenutna verzija AZD-a:** Ovi su primjeri pregledani u odnosu na `azd` `1.27.1`. Za AI tijek rada agenta koristite trenutačno izdanje preview ekstenzije i provjerite verziju prije početka.

## Osnovni obrasci integracije

### Obrasci 1: Integracija Microsoft Foundry Models

**Upotreba slučaja**: Implementacija chat aplikacija s modelima Microsoft Foundry Models

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

### Obrasci 2: AI pretraživanje + RAG integracija

**Upotreba slučaja**: Implementacija aplikacija za generaciju augmentiranu dohvaćanjem (RAG)

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

### Obrasci 3: Integracija inteligencije dokumenata

**Upotreba slučaja**: Tijekovi rada za obradu i analizu dokumenata

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

**Konfiguracija za produkciju:**
```bash
# Osnovne AI usluge
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracije modela
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Postavke izvedbe
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfiguracija za razvoj:**
```bash
# Postavke optimizirane za troškove za razvoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Besplatna razina
```

### Sigurna konfiguracija s Key Vault

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

## Tijekovi rada implementacije

### AZD ekstenzije za Foundry

AZD pruža ekstenzije koje dodaju AI-specifične mogućnosti za rad s Microsoft Foundry uslugama:

```bash
# Instalirajte Foundry agenta dodatak
azd extension install azure.ai.agents

# Instalirajte dodatak za fino podešavanje
azd extension install azure.ai.finetune

# Instalirajte dodatak za prilagođene modele
azd extension install azure.ai.models

# Popis instaliranih dodataka
azd extension list --installed

# Pregledajte trenutno instaliranu verziju agenta dodatka
azd extension show azure.ai.agents
```

AI ekstenzije su još uvijek u brzom razvoju u pregledu. Ako se neka naredba ponaša drugačije nego što je ovdje prikazano, nadogradite odgovarajuću ekstenziju prije nego što započnete rješavanje problema projekta.

### Implementacija agent-prvo s `azd ai`

Ako imate manifest agenta, koristite `azd ai agent init` za generiranje projekta povezanog s Foundry Agent Service:

```bash
# Inicijaliziraj iz manifesta agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Postavi na Azure
azd up
```

Nedavna pregledna izdanja `azure.ai.agents` također su dodala podršku za generiranje šablona kroz `azd ai agent init`. Ako pratite novije primjere agenata, provjerite pomoć ekstenzije za točne zastavice dostupne u vašoj instaliranoj verziji.

Pogledajte [AZD AI CLI naredbe](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za cjeloviti popis naredbi i zastavica.

### Implementacija jednim naredbom

```bash
# Sve implementirajte jednom naredbom
azd up

# Ili implementirajte postepeno
azd provision  # Samo infrastruktura
azd deploy     # Samo aplikacija

# Za dugotrajne implementacije AI aplikacija u azd 1.23.11+
azd deploy --timeout 1800
```

### Implementacije specifične za okruženje

```bash
# Okruženje za razvoj
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produkcijsko okruženje
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Praćenje i očitljivost

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

### Praćenje troškova

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

### Strategije keširanja

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

### Konfiguracija automatskog skaliranja

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

## Rješavanje uobičajenih problema

### Problem 1: Prelazak OpenAI kvote

**Simptomi:**
- Implementacija ne uspijeva s greškama kvote
- 429 grešaka u zapisima aplikacije

**Rješenja:**
```bash
# Provjerite trenutnu upotrebu kvote
az cognitiveservices usage list --location eastus

# Isprobajte drugu regiju
azd env set AZURE_LOCATION westus2
azd up

# Privremeno smanjite kapacitet
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Neuspjeh autentikacije

**Simptomi:**
- 401/403 greške prilikom poziva AI usluga
- Poruke "Pristup odbijen"

**Rješenja:**
```bash
# Provjerite dodjele uloga
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Provjerite konfiguraciju upravljanog identiteta
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Potvrdite pristup Key Vaultu
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemi s implementacijom modela

**Simptomi:**
- Modeli nisu dostupni u implementaciji
- Specifične verzije modela ne uspijevaju

**Rješenja:**
```bash
# Popis dostupnih modela po regiji
az cognitiveservices model list --location eastus

# Ažuriraj verziju modela u bicep predlošku
# Provjeri zahtjeve za kapacitet modela
```

## Primjer predložaka

### RAG chat aplikacija (Python)

**Spremište**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Najpopularniji Azure AI primjer — proizvodno spremna RAG chat aplikacija koja omogućava postavljanje pitanja nad vlastitim dokumentima. Koristi GPT-4.1-mini za chat, text-embedding-3-large za ugradnje i Azure AI Search za dohvaćanje. Podržava multimodalne dokumente, unos/izlaz govora, Microsoft Entra autentikaciju i praćenje s Application Insights.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG chat aplikacija (.NET)

**Spremište**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# ekvivalent Python RAG chat primjera. Izgrađeno s ASP.NET Core Minimal API i Blazor WebAssembly frontendom. Uključuje glasovni chat, podršku za GPT-4o-mini vision i companion .NET MAUI Blazor Hybrid mobilni i desktop klijent.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG chat aplikacija (Java)

**Spremište**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Java verzija RAG chat primjera koristeći Langchain4J za AI orkestraciju. Podržava mikroservisnu event-driven arhitekturu, više strategija pretraživanja (tekst, vektor, hibrid), prijenos dokumenata s Azure Document Intelligence te implementaciju na Azure Container Apps ili Azure Kubernetes Service.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot s Microsoft Foundry

**Spremište**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Usluge**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: End-to-end maloprodajni RAG copilot koristeći Microsoft Foundry i Prompty. Contoso Outdoor chatbot s odgovorima utemeljenim na katalogu proizvoda i podacima o narudžbama kupaca. Demonstrira kompletan GenAIOps tijek rada — prototip s Promptyjem, evaluacija s AI-podržanim evaluatorima i implementacija putem AZD u Container Apps.

**Brzi početak**:
```bash
azd init --template contoso-chat
azd up
```

### Višekomponentna aplikacija za kreativno pisanje

**Spremište**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Usluge**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Primjer višekomponentnog upravljanja AI agentima s Promptyjem. Koristi istraživačkog agenta (Bing Grounding u Azure AI Agent Service), produktnog agenta (Azure AI Search), pisca i urednika za zajedničku proizvodnju dobro istraženih članaka. Uključuje CI/CD s evaluacijom u GitHub Actions.

**Brzi početak**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Spremište**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Usluge**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB za NoSQL + LangChain.js

**Opis**: Potpuno serverless RAG chatbot koristeći LangChain.js s Azure Functions za API i Azure Static Web Apps za hosting. Koristi Azure Cosmos DB kao skladište vektora i bazu podataka povijesti chatova. Podržava lokalni razvoj s Ollama za testiranje bez troškova.

**Brzi početak**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat s vašim podacima Solution Accelerator

**Spremište**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Usluge**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Opis**: Enterprise razina RAG rješenja s administratorskim portalom za prijenos/upravljanje dokumentima, više opcija orkestratora (Semantic Kernel, LangChain, Prompt Flow), govor u tekst, integracija Microsoft Teamsa i izbor PostgreSQL ili Cosmos DB pozadine. Dizajnirano kao prilagodljiva polazna točka za produkcijske RAG scenarije.

**Brzi početak**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Višekomponentna MCP orkestracija

**Spremište**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Usluge**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Opis**: Referentna aplikacija za višekomponentnu AI orkestraciju koristeći tri okvira (LangChain.js, LlamaIndex.TS i Microsoft Agent Framework). Sadrži MCP (Model Context Protocol) servere na četiri jezika implementirane kao serverless Azure Container Apps s OpenTelemetry praćenjem.

**Brzi početak**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Spremište**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Usluge**: Azure AI usluge + Azure OpenAI

**Opis**: Minimalni Bicep predložak koji implementira Azure AI usluge s konfiguriranim modelima strojnog učenja. Lagana polazna točka kada vam je potrebna samo Azure AI infrastruktura bez pune aplikacijske slojeve.

**Brzi početak**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Pogledajte više predložaka**: Posjetite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) za više od 80 AI-specifičnih AZD predložaka na različitim jezicima i scenarijima.

## Sljedeći koraci

1. **Isprobajte primjere**: Započnite s unaprijed izrađenim predloškom koji odgovara vašem slučaju upotrebe
2. **Prilagodite za svoje potrebe**: Izmijenite infrastrukturu i aplikacijski kod
3. **Dodajte praćenje**: Implementirajte sveobuhvatnu očitljivost
4. **Optimizirajte troškove**: Precizno namjestite konfiguracije prema vašem proračunu
5. **Osigurajte implementaciju**: Implementirajte sigurnosne obrasce za tvrtku
6. **Skalirajte za produkciju**: Dodajte više regija i značajke visoke dostupnosti

## 🎯 Praktične vježbe

### Vježba 1: Implementirajte Microsoft Foundry Models chat aplikaciju (30 minuta)
**Cilj**: Implementirati i testirati proizvodno spremnu AI chat aplikaciju

```bash
# Inicijaliziraj predložak
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Postavi varijable okoline
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Implementiraj
azd up

# Testiraj aplikaciju
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Nadziranje AI operacija
azd monitor

# Očisti
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Implementacija završava bez grešaka kvote
- [ ] Pristup chat sučelju putem preglednika
- [ ] Mogućnost postavljanja pitanja i dobivanja AI-pokretanih odgovora
- [ ] Application Insights prikazuje telemetrijske podatke
- [ ] Uspješno čišćenje resursa

**Procijenjeni trošak**: 5-10 USD za 30 minuta testiranja

### Vježba 2: Konfigurirajte višemodelsku implementaciju (45 minuta)
**Cilj**: Implementirati više AI modela s različitim konfiguracijama

```bash
# Izradite prilagođenu Bicep konfiguraciju
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

# Implementirajte i provjerite
azd provision
azd show
```

**Kriteriji uspjeha:**
- [ ] Više modela uspješno implementirano
- [ ] Primijenjene različite postavke kapaciteta
- [ ] Modeli dostupni putem API-ja
- [ ] Mogućnost pozivanja oba modela iz aplikacije

### Vježba 3: Implementirajte praćenje troškova (20 minuta)
**Cilj**: Postaviti upozorenja za proračun i praćenje troškova

```bash
# Dodaj upozorenje o proračunu u Bicep
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

# Implementiraj upozorenje o proračunu
azd provision

# Provjeri trenutne troškove
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteriji uspjeha:**
- [ ] U Azureu kreirano upozorenje proračuna
- [ ] Konfigurirane e-mail obavijesti
- [ ] Prikaz troškova u Azure Portalu
- [ ] Proračunski pragovi postavljeni odgovarajuće

## 💡 Često postavljana pitanja

<details>
<summary><strong>Kako smanjiti troškove Microsoft Foundry Models tijekom razvoja?</strong></summary>

1. **Koristite besplatni sloj**: Microsoft Foundry Models daje 50.000 tokena/mjesečno besplatno
2. **Smanjite kapacitet**: Postavite kapacitet na 10 TPM umjesto 30+ za razvoj
3. **Koristite azd down**: Dealokirajte resurse dok ne razvijate aktivno
4. **Keširajte odgovore**: Implementirajte Redis cache za ponavljane upite
5. **Koristite prompt inženjering**: Smanjite upotrebu tokena učinkovitim promptima


```bash
# Konfiguracija za razvoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Koja je razlika između Microsoft Foundry modela i OpenAI API-ja?</strong></summary>

**Microsoft Foundry modeli**:
- Sigurnost poduzeća i usklađenost
- Integracija privatne mreže
- Jamstvo SLA
- Autentifikacija upravljanim identitetom
- Dostupni veći kvote

**OpenAI API**:
- Brži pristup novim modelima
- Jednostavnija konfiguracija
- Niža ulazna barijera
- Samo javni internet

Za produkcijske aplikacije, **Microsoft Foundry modeli se preporučuju**.
</details>

<details>
<summary><strong>Kako riješiti pogreške prekoračenja kvote za Microsoft Foundry modele?</strong></summary>

```bash
# Provjerite trenutni limit
az cognitiveservices usage list --location eastus2

# Pokušajte s drugačijim područjem
azd env set AZURE_LOCATION westus2
azd up

# Privremeno smanjite kapacitet
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Zatražite povećanje limita
# Idite na Azure Portal > Kvote > Zatraži povećanje
```
</details>

<details>
<summary><strong>Mogu li koristiti vlastite podatke s Microsoft Foundry modelima?</strong></summary>

Da! Koristite **Azure AI Search** za RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Pogledajte predložak [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Kako osigurati krajnje točke AI modela?</strong></summary>

**Najbolje prakse**:
1. Koristite Managed Identity (bez API ključeva)
2. Omogućite Private Endpoints
3. Konfigurirajte mrežne sigurnosne grupe
4. Implementirajte ograničenje brzine (rate limiting)
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Službena dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry vještina na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalirajte Azure + Foundry agent skills u svoj uređivač s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavljima:**
- **📚 Početna tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvi razvoj
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [Implementacija AI modela](ai-model-deployment.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Treba vam pomoć?** Pridružite se našim raspravama u zajednici ili otvorite problem u repozitoriju. Azure AI + AZD zajednica je ovdje da vam pomogne uspjeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->