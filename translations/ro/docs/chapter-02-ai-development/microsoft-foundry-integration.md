# Integrarea Microsoft Foundry cu AZD

**Navigare capitol:**
- **📚 Acasă curs**: [AZD pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitol anterior**: [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următorul**: [Agenți AI](agents.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

## Prezentare generală

Acest ghid demonstrează cum să integrezi serviciile Microsoft Foundry cu Azure Developer CLI (AZD) pentru implementări simplificate de aplicații AI. Microsoft Foundry oferă o platformă cuprinzătoare pentru construirea, implementarea și gestionarea aplicațiilor AI, în timp ce AZD simplifică procesul de infrastructură și implementare.

## Ce este Microsoft Foundry?

Microsoft Foundry este platforma unificată a Microsoft pentru dezvoltarea AI care include:

- **Catalogul de modele**: Acces la modele AI de ultimă generație
- **Flux de prompturi**: Designer vizual pentru fluxuri de lucru AI
- **Portal Microsoft Foundry**: Mediu integrat de dezvoltare pentru aplicații AI
- **Opțiuni de implementare**: Multiple opțiuni de găzduire și scalare
- **Siguranță și securitate**: Funcții AI responsabile integrate

## AZD + Microsoft Foundry: Mai bune împreună

| Funcționalitate | Microsoft Foundry | Beneficiu integrare AZD |
|---------|-----------------|------------------------|
| **Implementare model** | Implementare manuală prin portal | Implementări automate, repetabile |
| **Infrastructură** | Provizionare prin click | Infrastructură ca cod (Bicep) |
| **Gestionare mediu** | Focalizare pe un singur mediu | Medii multiple (dev/staging/prod) |
| **Integrare CI/CD** | Limitată | Suport nativ pentru GitHub Actions |
| **Gestionare costuri** | Monitorizare de bază | Optimizare costuri specifică mediului |

## Cerințe prealabile

- Subscriptie Azure cu permisiuni adecvate
- Azure Developer CLI instalat
- Acces la serviciile Microsoft Foundry Models
- Familiaritate de bază cu Microsoft Foundry

> **Revizuire lansare (2026-11-04):** Ghidul AI CLI a fost verificat prin `azd` `1.37.2`, agenți `1.0.0-beta.23`, și documentația/sursa evaluărilor `1.0.0-beta.2`. Folosește `azd >= 1.37.0` pentru fluxul combinat. Vezi [schimbări și remedieri lansare](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); această revizuire nu certifică fiecare șablon sau exemplu SDK față de o implementare live.

## Modele de integrare de bază

**Domeniul exemplelor:** Codul Bicep de mai jos conține fragmente ilustrative de resurse, nu un șablon complet de implementare. Șablonul conținător trebuie să definească nume, `location`, resursele referențiate, identități, ieșiri și găzduirea aplicației. Folosește un exemplu legat pentru un punct de pornire rulabil. Exemplele Bash necesită autentificare Azure CLI separat de `azd auth login`.

### Model 1: Integrarea Microsoft Foundry Models

**Caz de utilizare**: Implementare aplicații de chat cu modele Azure OpenAI în Microsoft Foundry

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

**Infrastructură (main.bicep):**
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

Apelantul are nevoie de o identitate gestionată atașată și `Cognitive Services OpenAI User` la nivel de cont; dezactivarea cheilor nu conferă acces. Verifică disponibilitatea regiunii/modelului/SKU și cota înainte de implementare.

### Model 2: Integrarea AI Search + RAG

**Caz de utilizare**: Implementare aplicații de generare augmentată prin căutare (RAG)

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

Nu există o resursă ARM `Microsoft.Search/searchServices/dataConnections` pentru această integrare. Configurează un index Search, sursă de date, indexer/skillset sau vectorizer prin API-urile plane ale Search acceptate. Dacă Search apelează un model embedding, activează-i identitatea gestionată, acordă rolul relevant modelului și configurează-i skill-ul/vectorizer-ul embedding. Vezi [vectorizare integrată](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Model 3: Integrarea Document Intelligence

**Caz de utilizare**: Fluxuri de procesare și analiză documente

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

## 🔧 Modele de configurare

### Setare variabile de mediu

Cu excepția setărilor AZD documentate cum ar fi `AZURE_LOCATION`, acestea sunt **nume personalizate de intrare pentru șablon**. Nu au efect decât dacă șablonul/aplicația le consumă prin parametri și mapări de mediu gazdă. Pentru `azure-search-openai-demo`, folosește numele reale cum ar fi `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` și `AZURE_SEARCH_SERVICE_SKU` în schimb. Capacitatea modelului nu este SKU de cont.

**Configurare producție:**
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

**Configurare dezvoltare:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configurare securizată cu Key Vault

Preferă Entra ID cu autentificare locală a cheilor dezactivată. Următorul este doar o **alternativă de autentificare prin cheie veche** pentru aplicații care necesită chei: are nevoie de un cont cu autentificare prin chei activată, identitatea aplicației atașată gazdei și acces/rețea funcțională la Key Vault. Nu combina recuperarea cheii cu `disableLocalAuth: true` și aștepta-te ca apelurile bazate pe chei să funcționeze.

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

## Fluxuri de implementare

### Extensii AZD pentru Foundry

AZD oferă extensii care adaugă capabilități specifice AI pentru lucrul cu serviciile Microsoft Foundry:

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

Extensiile AI sunt încă în dezvoltare rapidă în previzualizare. Dacă o comandă se comportă diferit față de cum este prezentată aici, actualizează extensia relevantă înainte de a depana proiectul în sine.

### Implementare agent-first cu `azd ai`

Folosește `azd ai agent init` interactiv, sau adoptă un șablon curent de proiect agent `azure.yaml` conectat la Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` înlocuiește ortografia învechită `--manifest`/`-m`; manifestul vechi și configurarea agentului încorporat mai necesită migrare. Evaluează agenții cu `azd ai eval` din `azure.ai.evaluations`, nu cu fluxul vechi eliminat. Vezi [migrarea evaluării](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) pentru configurare, execuție și rezultate.

Vezi [Comenzi AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pentru referință completă de comenzi și opțiuni.

### Implementare cu o singură comandă

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Implementări specifice mediului

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

## Monitorizare și Observabilitate

### Integrare Application Insights

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

Aceasta provisionează o resursă Insights, nu instrumentație de telemetrie. După ce aplicația ta emite span-uri de apel model outbound, rulează această interogare ilustrativă în Jurnalele Application Insights (adaptă filtrul la numele efective ale span-urilor):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitorizarea costurilor

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

Folosește un destinatar real și verifică permisiunile de facturare la nivel de domeniu. Un buget trimite alerte; nu este o limită de cheltuială.

## 🔐 Cele mai bune practici de securitate

### Configurare identitate gestionată

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

### Securitate rețea

Fragmentul acesta de endpoint necesită de asemenea o zonă/grup DNS privat, legături VNet, conectivitate VNet aplicație și o politică explicită de acces public. Crearea unui endpoint privat singur nu dezactivează accesul public.

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

## Optimizarea performanței

### Strategii de caching

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

Azure Cache pentru Redis Basic/Standard/Premium este pe un [drum de pensionare](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); folosește Azure Managed Redis pentru noi implementări și urmează ghidajul curent pentru șabloane/autentificare. Domeniul răspunsurilor AI cache-uite trebuie limitat la autorizare, model/instrucțiuni, și versiune date, cu expirare; nu partaja niciodată răspunsuri private folosind doar textul interogării.

### Configurare auto-scalare

**Resursă parțială:** îmbină aceste setări pentru scalare/ingres într-un Container App complet cu un mediu gestionat, imagine container și limite de resurse. Mai multe replici nu cresc cota modelului.

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

## Depanarea problemelor comune

### Problema 1: Cota OpenAI depășită

**Simptome:**
- Implementarea eșuează cu erori de cotă
- erori 429 în jurnalele aplicației

**Soluții:**
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

Variabila de capacitate de mai sus se aplică doar unui șablon personalizat configurat să o consume. Pentru exemplul RAG, folosește `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Nu modifica `AZURE_LOCATION` pentru a muta resurse existente în loc; creează un mediu separat pentru o regiune nouă și planifică migrarea/curățenia.

### Problema 2: Eșecuri de autentificare

**Simptome:**
- erori 401/403 când apelezi serviciile AI
- mesaje „Acces refuzat”

**Soluții:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problema 3: Probleme de implementare a modelului

**Simptome:**
- Modele indisponibile în implementare
- Versiuni specifice de model care eșuează

**Soluții:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Șabloane exemplu

Acestea sunt alternative, nu comenzi secvențiale. Pornește fiecare într-un director gol separat. Destinația explicită `.` păstrează inițializarea în directorul tău curent; altfel AZD poate crea un director copil numit după șablon fără să schimbe directorul de lucru al shell-ului.

### Aplicație RAG Chat (Python)

**Depozit**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descriere**: O aplicație de referință RAG chat pentru întrebări despre documentele tale, cu extragere Azure AI Search. Revizuiește modelele suportate, caracteristicile opționale, ghidul de costuri și întărirea pentru producție înainte de utilizare; implementarea unui exemplu nu face aplicația gata pentru producție.

**Început rapid**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplicație RAG Chat (.NET)

**Depozit**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descriere**: Echivalentul .NET/C# al exemplului RAG chat Python. Construit cu ASP.NET Core Minimal API și frontend Blazor WebAssembly. Include chat vocal, suport GPT-4o-mini vision și un client desktop/mobil companion .NET MAUI Blazor Hybrid.

**Început rapid**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplicație RAG Chat (Java)

**Depozit**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descriere**: Versiunea Java a exemplului RAG chat folosind Langchain4J pentru orchestrare AI. Suportă arhitectură microservicii bazată pe evenimente, strategii multiple de căutare (text, vector, hibrid), încărcare documente cu Azure Document Intelligence și implementare pe Azure Container Apps sau Azure Kubernetes Service.

**Început rapid**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot cu Microsoft Foundry

**Depozit**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicii**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descriere**: Copilot RAG complet pentru retail folosind Microsoft Foundry și Prompty. Chatbot Contoso Outdoor retailer care fundamentează răspunsurile în catalogul de produse și datele comenzilor clienților. Demonstrează întregul flux GenAIOps — prototipare cu Prompty, evaluare cu evaluatori asistati AI, și implementare prin AZD în Container Apps.

**Început rapid**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplicație Multi-Agent pentru Scriere Creativă

**Depozit**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicii**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descriere**: Exemplu multi-agent demonstrând orchestrare agent AI cu Prompty. Folosește un agent de cercetare (Bing Grounding în Azure AI Agent Service), un agent de produs (Azure AI Search), un agent scriitor și un agent editor pentru a produce colaborativ articole bine documentate. Include CI/CD cu evaluare în GitHub Actions.

**Început rapid**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Depozit**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicii**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Descriere**: Chatbot RAG complet serverless folosind LangChain.js cu Azure Functions pentru API și Azure Static Web Apps pentru găzduire. Folosește Azure Cosmos DB atât ca magazin vectorial cât și ca bază de date istoric chat. Suportă dezvoltare locală cu Ollama pentru testare gratuită.

**Început rapid**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Accelerator Soluție Chat cu Datele Tale

**Depozit**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicii**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search cu Cosmos DB, sau PostgreSQL cu pgvector

**Descriere**: Accelerator chat fundamentat pe documente cu citări. Exemplul curent găzduiește un frontend React, backend FastAPI și un worker Functions pentru ingestie pe Container Apps; opțiunile de orchestrare sunt Agent Framework și LangGraph. Opțiunile de bază de date/extragere sunt selectate la implementare. Este un punct de plecare, nu un sistem gata de producție; nu presupune că variante mai vechi de App Service, Semantic Kernel, sau Prompt Flow descriu implicitul curent.

**Început rapid**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agenți AI pentru Călătorii — Orchestrare Multi-Agent MCP

**Depozit**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicii**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servere MCP (.NET, Python, Java, TypeScript)

**Descriere**: Aplicație de referință pentru orchestrarea AI multi-agent folosind trei cadre (LangChain.js, LlamaIndex.TS și Microsoft Agent Framework). Include servere MCP (Model Context Protocol) în patru limbaje, implementate ca Azure Container Apps fără server cu monitorizare OpenTelemetry.

**Început rapid**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Răsfoiți mai multe șabloane**: Vizitați [Galeria de Șabloane AZD AI Awesome](https://azure.github.io/awesome-azd/?tags=ai) pentru șabloanele disponibile în prezent în diverse limbi și scenarii. Fiecare exemplu legat este un depozit extern, nu un exemplu local furnizat de acest curs; inspectați cerințele actuale și ghidul de producție înainte de implementare.

## Pașii următori

1. **Încercați exemplele**: Începeți cu un șablon predefinit care se potrivește cazului dvs. de utilizare
2. **Personalizați după nevoile dvs.**: Modificați infrastructura și codul aplicației
3. **Adăugați monitorizare**: Implementați observabilitate cuprinzătoare
4. **Optimizați costurile**: Ajustați configurațiile pentru bugetul dvs.
5. **Asigurați implementarea**: Implementați modele de securitate enterprise
6. **Scalare pentru producție**: Adăugați funcții multi-regiune și înaltă disponibilitate

## 🎯 Exerciții Practice

### Exercițiul 1: Implementați aplicația de chat Microsoft Foundry Models (30 minute)
**Obiectiv**: Implementați și testați o aplicație de referință AI de chat

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

**Criterii de succes:**
- [ ] Implementarea să se finalizeze fără erori de cotă
- [ ] Se poate accesa interfața de chat în browser
- [ ] Se pot pune întrebări și primi răspunsuri generate de AI
- [ ] Application Insights afișează date de telemetrie
- [ ] Resursele sunt curățate cu succes

**Cost:** Consultați ghidul curent de costuri și SKU-urile selectate înainte de implementare. Facturarea continuă până la ștergerea resurselor; nu există o estimare fixă de 30 de minute care să se aplice tuturor configurațiilor.

### Exercițiul 2: Configurare implementare multi-model (45 minute)
**Obiectiv**: Implementați mai multe modele AI cu configurații diferite

**Punct de pornire:** Un cont Azure OpenAI existent și un modul AZD pentru grupul de resurse care poate apela acest fișier. Creați `infra/ai-models.bicep` cu următorul conținut folosind editorul dvs. Nu este implementat automat doar pentru că se află sub `infra/`.

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

Din modulul cu scope pentru grupul de resurse care deține contul, adăugați o invocare a modulului (adaptând numele simbolului la contul dvs. efectiv):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nu declarați aceleași implementări în ambele module. Dacă punctul de intrare AZD este la nivel de abonament, apelați acest modul din modulul copil cu scope grup de resurse și ajustați calea relativă. Compilați modulul conținător cu `az bicep build --file <path-to-containing-module>`, apoi:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Criterii de succes:**
- [ ] Mai multe modele implementate cu succes
- [ ] Setări de capacitate diferite aplicate
- [ ] Modele accesibile prin API
- [ ] Se pot apela ambele modele din aplicație

### Exercițiul 3: Implementați monitorizarea costurilor (20 minute)
**Obiectiv**: Configurați alerte bugetare și urmărire a costurilor

**Punct de pornire:** Modelul de buget de mai sus și un modul de infrastructură scoped pentru grup de resurse. Adăugați această resursă folosind editorul dvs.; transmiteți `budgetStartDate` din maparea de parametri (nu duplicați parametrul dacă este deja declarat). Înlocuiți destinatarul și confirmați că aveți acces la scriere pentru buget.

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

Așteptat: răspunsul conține `amount: 200`, ambele praguri și destinatarul dvs. Inspectați Cost Management în portal pentru taxele efective; datele despre costuri sunt întârziate și o alertă nu trebuie să se declanșeze în timpul unui exercițiu scurt.

**Criterii de succes:**
- [ ] Alertă buget creată în Azure
- [ ] Notificări prin email configurate
- [ ] Se pot vedea datele de cost în portalul Azure
- [ ] Pragurile bugetare setate corespunzător

## 💡 Întrebări frecvente

<details>
<summary><strong>Cum reduc costurile Microsoft Foundry Models în timpul dezvoltării?</strong></summary>

1. **Verificați prețurile**: Nu există o alocație universală gratuită de 50.000 de tokeni pe lună pentru modelele Azure OpenAI
2. **Dimensionați capacitatea corect**: Capacitatea `10` reprezintă de obicei 10.000 TPM pentru aceste modele text Standard, nu 10 TPM. Reducerea acestei limitări de rată nu scade prețurile pe token
3. **Folosiți azd down**: Ștergeți resursele de unică folosință când nu dezvoltați activ (nu este de-alocare)
4. **Cache pentru răspunsuri**: Implementați cache Redis pentru interogările repetate
5. **Utilizați ingineria prompturilor**: Reduceți utilizarea tokenilor cu prompturi eficiente

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Care este diferența între Microsoft Foundry Models și OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Securitate și conformitate enterprise
- Integrare în rețea privată
- Garanții SLA
- Autentificare prin identitate gestionată
- Cote mai mari disponibile

**OpenAI API**: Un furnizor / API separat cu disponibilitatea propriilor modele, prețuri, autentificare și opțiuni de conectivitate enterprise. Comparați ofertele actuale în loc să presupuneți că este doar pentru internetul public sau că furnizează întotdeauna primele modele.

Alegeți în funcție de cerințele organizației dvs.; exemplele de identitate gestionată specifică Azure și private-link din acest curs se aplică serviciilor găzduite în Azure, nu fiecărui model/furnizor din catalogul Foundry.
</details>

<details>
<summary><strong>Cum gestionez erorile de depășire a cotei Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Pot folosi propriile mele date cu Microsoft Foundry Models?</strong></summary>

Da! Folosiți **Azure AI Search** pentru RAG (Generare augmentată prin căutare):

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

Consultați șablonul [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Cum securizez punctele finale ale modelului AI?</strong></summary>

**Cele mai bune practici**:
1. Folosiți identitate gestionată (fără chei API)
2. Activați Private Endpoints
3. Configurați grupuri de securitate a rețelei
4. Implementați limitarea ratelor
5. Folosiți Azure Key Vault pentru secrete

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

## Comunitate și Suport

- **Microsoft Foundry Discord**: [canalul #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleme și discuții](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentația oficială](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Competență Microsoft Foundry pe skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalați competențe agent Azure + Foundry în editorul dvs. cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitol anterior**: [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următorul**: [Agenți AI](agents.md)
- **🚀 Capitol următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Aveți nevoie de ajutor?** Alăturați-vă discuțiilor comunității sau deschideți o problemă în depozit. Comunitatea Azure AI + AZD este aici pentru a vă ajuta să reușiți!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->