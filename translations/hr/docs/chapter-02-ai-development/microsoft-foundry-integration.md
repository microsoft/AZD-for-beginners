# Integracija Microsoft Foundry s AZD

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - Razvoj vođen umjetnom inteligencijom
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [Implementacija AI modela](ai-model-deployment.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ovaj vodič prikazuje kako integrirati Microsoft Foundry usluge s Azure Developer CLI-jem (AZD) za pojednostavljene implementacije AI aplikacija. Microsoft Foundry pruža sveobuhvatnu platformu za izradu, implementaciju i upravljanje AI aplikacijama, dok AZD pojednostavljuje infrastrukturni i implementacijski proces.

## Što je Microsoft Foundry?

Microsoft Foundry je Microsoftova objedinjena platforma za razvoj umjetne inteligencije koja uključuje:

- **Katalog modela**: Pristup najsuvremenijim AI modelima
- **Prompt Flow**: Vizualni dizajner za AI radne tokove
- **Microsoft Foundry Portal**: Integrirano razvojno okruženje za AI aplikacije
- **Opcije implementacije**: Više opcija hostanja i skaliranja
- **Sigurnost i zaštita**: Ugrađene značajke odgovorne umjetne inteligencije

## AZD + Microsoft Foundry: Bolje zajedno

| Značajka | Microsoft Foundry | Prednost integracije s AZD |
|---------|-----------------|---------------------------|
| **Implementacija modela** | Ručna implementacija putem portala | Automatske, ponovljive implementacije |
| **Infrastruktura** | Provisioniranje putem klikanja | Infrastruktura kao kod (Bicep) |
| **Upravljanje okruženjem** | Fokus na jedno okruženje | Višestruka okruženja (dev/staging/prod) |
| **Integracija CI/CD** | Ograničena | Izvorna podrška za GitHub Actions |
| **Upravljanje troškovima** | Osnovno praćenje | Optimizacija troškova po okruženju |

## Pretpostavke

- Azure pretplata s odgovarajućim dopuštenjima
- Instaliran Azure Developer CLI
- Pristup Microsoft Foundry Models uslugama
- Osnovno poznavanje Microsoft Foundry

> **Trenutna verzija AZD:** Ovi su primjeri pregledani za `azd` `1.23.12`. Za AI agent workflow koristite trenutačni release preview ekstenzije i provjerite verziju prije nego započnete.

## Osnovni obrasci integracije

### Obrazac 1: Integracija Microsoft Foundry Models

**Slučaj upotrebe**: Implementacija chat aplikacija s Microsoft Foundry Models modelima

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

### Obrazac 2: AI pretraživanje + RAG integracija

**Slučaj upotrebe**: Implementacija aplikacija s retrieval-augmented generation (RAG)

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

### Obrazac 3: Integracija inteligencije za dokumente

**Slučaj upotrebe**: Radni tokovi za obradu i analizu dokumenata

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

**Produkcijska konfiguracija:**
```bash
# Osnovne AI usluge
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracije modela
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Postavke performansi
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Razvojna konfiguracija:**
```bash
# Postavke optimizirane za troškove za razvoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Besplatni sloj
```

### Sigurna konfiguracija s Key Vaultom

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

## Radni tokovi implementacije

### AZD ekstenzije za Foundry

AZD pruža ekstenzije koje dodaju AI-specifične mogućnosti za rad s Microsoft Foundry uslugama:

```bash
# Instalirajte proširenje Foundry agenata
azd extension install azure.ai.agents

# Instalirajte proširenje za fino podešavanje
azd extension install azure.ai.finetune

# Instalirajte proširenje za prilagođene modele
azd extension install azure.ai.models

# Popis instaliranih proširenja
azd extension list --installed

# Pregledajte trenutno instaliranu verziju proširenja agenta
azd extension show azure.ai.agents
```

AI ekstenzije se još uvijek brzo razvijaju u preview modu. Ako se neka naredba ponaša drugačije nego što je ovdje prikazano, nadogradite relevantnu ekstenziju prije nego što započnete rješavanje problema projekta.

### Implementacija s fokusom na agente koristeći `azd ai`

Ako imate manifest agenata, koristite `azd ai agent init` za generiranje projekta povezanog s Foundry Agent Service:

```bash
# Inicijaliziraj iz manifesta agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Implementiraj na Azure
azd up
```

Nedavni preview izdanja `azure.ai.agents` također su dodala podršku za inicijalizaciju temeljenu na predlošcima za `azd ai agent init`. Ako pratite novije primjere agenata, provjerite pomoć ekstenzije za točne zastavice dostupne u vašoj instaliranoj verziji.

Pogledajte [AZD AI CLI naredbe](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za puni popis naredbi i zastavica.

### Implementacija jednom naredbom

```bash
# Implementirajte sve jednom naredbom
azd up

# Ili implementirajte postepeno
azd provision  # Samo infrastruktura
azd deploy     # Samo aplikacija

# Za dugotrajne implementacije AI aplikacija u azd 1.23.11+
azd deploy --timeout 1800
```

### Implementacije specifične za okruženje

```bash
# Razvojno okruženje
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

## Praćenje i uvidi

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

## Rješavanje čestih problema

### Problem 1: Prekoračenje kvote za OpenAI

**Simptomi:**
- Implementacija ne uspijeva zbog pogrešaka kvote
- 429 pogreške u zapisima aplikacije

**Rješenja:**
```bash
# Provjerite trenutačnu upotrebu kvote
az cognitiveservices usage list --location eastus

# Isprobajte drugu regiju
azd env set AZURE_LOCATION westus2
azd up

# Privremeno smanjite kapacitet
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problem 2: Neuspjesi autentifikacije

**Simptomi:**
- 401/403 pogreške pri pozivanju AI usluga
- Poruke "Access denied"

**Rješenja:**
```bash
# Provjerite dodjele uloga
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Provjerite konfiguraciju upravljanog identiteta
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Potvrdite pristup Key Vault-u
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemi s implementacijom modela

**Simptomi:**
- Modeli nisu dostupni u implementaciji
- Neuspjeh određenih verzija modela

**Rješenja:**
```bash
# Popis dostupnih modela po regiji
az cognitiveservices model list --location eastus

# Ažuriraj verziju modela u bicep predlošku
# Provjeri zahtjeve za kapacitet modela
```

## Primjeri predložaka

### RAG chat aplikacija (Python)

**Repozitorij**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Najpopularniji uzorak Azure AI-a — proizvodno spremna RAG chat aplikacija koja omogućuje postavljanje pitanja nad vlastitim dokumentima. Koristi GPT-4.1-mini za chat, text-embedding-3-large za ugradnje i Azure AI Search za dohvat. Podržava multimodalne dokumente, unos/izlaz govora, Microsoft Entra autentifikaciju i Application Insights praćenje.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG chat aplikacija (.NET)

**Repozitorij**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# ekvivalent Python RAG chat primjera. Izgrađen s ASP.NET Core Minimal API i Blazor WebAssembly frontendom. Uključuje glasovni chat, GPT-4o-mini podršku za viziju i pratećeg .NET MAUI Blazor Hybrid desktop/mobilnog klijenta.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG chat aplikacija (Java)

**Repozitorij**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Usluge**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Java verzija RAG chat primjera koristeći Langchain4J za AI orkestraciju. Podržava mikroservisnu event-driven arhitekturu, višestruke strategije pretraživanja (tekst, vektor, hibrid), učitavanje dokumenata s Azure Document Intelligence i implementaciju na Azure Container Apps ili Azure Kubernetes Service.

**Brzi početak**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise retail copilot s Azure AI Foundry

**Repozitorij**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Usluge**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: End-to-end retail RAG copilot koristeći Azure AI Foundry i Prompty. Chatbot trgovca Contoso Outdoor koji temelji odgovore na katalogu proizvoda i podacima o narudžbama kupaca. Demonstrira cijeli GenAIOps radni tok — prototipiranje s Promptyjem, evaluaciju uz AI-podržane evaluatore i implementaciju preko AZD-a u Container Apps.

**Brzi početak**:
```bash
azd init --template contoso-chat
azd up
```

### Multi-agent aplikacija za kreativno pisanje

**Repozitorij**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Usluge**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Primjer multi-agenta koji prikazuje orkestraciju AI agenta s Promptyjem. Uključuje istraživačkog agenta (Bing Grounding u Azure AI Agent Service), agenta za proizvod, agenta pisca i agenta urednika koji zajednički proizvode dobro istražene članke. Uključuje CI/CD s evaluacijom u GitHub Actions.

**Brzi početak**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG chat (JavaScript/TypeScript)

**Repozitorij**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Usluge**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB za NoSQL + LangChain.js

**Opis**: Potpuno serverless RAG chatbot koristeći LangChain.js s Azure Functions za API i Azure Static Web Apps za hostanje. Koristi Azure Cosmos DB kao spremište vektora i bazu povijesti razgovora. Podržava lokalni razvoj s Ollama za testiranje bez troškova.

**Brzi početak**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repozitorij**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Usluge**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Opis**: Enterprise razina RAG akceleratora rješenja s administratorskim portalom za učitavanje/upravljanje dokumentima, višestrukim opcijama orkestratora (Semantic Kernel, LangChain, Prompt Flow), govor-tekst funkcijama, integracijom s Microsoft Teams i izborom PostgreSQL ili Cosmos DB baze. Dizajniran kao prilagodljiva polazna točka za produkcijske RAG scenarije.

**Brzi početak**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI travel agents — Multi-Agent MCP orkestracija

**Repozitorij**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Usluge**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP serveri (.NET, Python, Java, TypeScript)

**Opis**: Referentna aplikacija za multi-agent AI orkestraciju koristeći tri okvira (LangChain.js, LlamaIndex.TS i Microsoft Agent Framework). Sadrži MCP (Model Context Protocol) servere na četiri jezika implementirane kao serverless Azure Container Apps uz nadzor OpenTelemetry.

**Brzi početak**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repozitorij**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Usluge**: Azure AI usluge + Azure OpenAI

**Opis**: Minimalni Bicep predložak koji implementira Azure AI usluge s konfiguriranim modelima strojnog učenja. Lagana polazna točka kada vam treba samo Azure AI infrastruktura bez pune aplikacijske strukture.

**Brzi početak**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Pogledajte više predložaka**: Posjetite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) za preko 80 AI-specifičnih AZD predložaka na različitim jezicima i scenarijima.

## Sljedeći koraci

1. **Isprobajte primjere**: Počnite s unaprijed izrađenim predloškom koji odgovara vašem slučaju upotrebe
2. **Prilagodite svojim potrebama**: Izmijenite infrastrukturu i kod aplikacije
3. **Dodajte praćenje**: Implementirajte sveobuhvatnu vidljivost
4. **Optimizirajte troškove**: Doradite konfiguracije prema proračunu
5. **Osigurajte implementaciju**: Primijenite sigurnosne obrasce za poduzeća
6. **Širite u produkciju**: Dodajte višeregionalne i značajke visoke dostupnosti

## 🎯 Praktične vježbe

### Vježba 1: Implementacija Microsoft Foundry Models chat aplikacije (30 minuta)
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

# Nadgledaj AI operacije
azd monitor

# Očisti
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Implementacija završena bez pogrešaka kvote
- [ ] Mogućnost pristupa chat sučelju u pregledniku
- [ ] Mogućnost postavljanja pitanja i dobivanja AI podržanih odgovora
- [ ] Application Insights prikazuje telemetry podatke
- [ ] Uspješno čišćenje resursa

**Procijenjeni trošak**: 5-10 USD za 30 minuta testiranja

### Vježba 2: Konfiguriranje višemodelske implementacije (45 minuta)
**Cilj**: Implementirati više AI modela s različitim konfiguracijama

```bash
# Kreirajte prilagođenu Bicep konfiguraciju
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
- [ ] Modeli dostupni preko API-ja
- [ ] Mogućnost poziva oba modela iz aplikacije

### Vježba 3: Implementacija praćenja troškova (20 minuta)
**Cilj**: Postaviti upozorenja budžeta i praćenje troškova

```bash
# Dodajte upozorenje o proračunu u Bicep
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

# Postavite upozorenje o proračunu
azd provision

# Provjerite tekuće troškove
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteriji uspjeha:**
- [ ] Upozorenje budžeta kreirano u Azureu
- [ ] E-mail obavijesti konfigurirane
- [ ] Mogućnost pregleda podataka o troškovima u Azure portalu
- [ ] Prikladno postavljeni pragovi budžeta

## 💡 Često postavljana pitanja

<details>
<summary><strong>Kako smanjiti troškove Microsoft Foundry Models tijekom razvoja?</strong></summary>

1. **Koristite besplatni sloj**: Microsoft Foundry Models nudi 50.000 tokena mjesečno besplatno
2. **Smanjite kapacitet**: Postavite kapacitet na 10 TPM umjesto 30+ tijekom razvoja
3. **Koristite azd down**: De-alocirajte resurse kada ne razvijate aktivno
4. **Keširajte odgovore**: Implementirajte Redis keš za ponovljene upite
5. **Koristite inženjering prompta**: Smanjite potrošnju tokena učinkovitijim upitima
```bash
# Konfiguracija razvoja
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Koja je razlika između Microsoft Foundry Models i OpenAI API-ja?</strong></summary>

**Microsoft Foundry Models**:
- Sigurnost i usklađenost na razini poduzeća
- Integracija s privatnom mrežom
- Jamstva razine usluge (SLA)
- Autentifikacija pomoću upravljanog identiteta
- Dostupne veće kvote

**OpenAI API**:
- Brži pristup novim modelima
- Jednostavnije postavljanje
- Niža prepreka za ulazak
- Samo javni internet

Za proizvodne aplikacije, **preporučuju se Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Kako riješiti pogreške zbog prekoračenja kvote u Microsoft Foundry Models?</strong></summary>

```bash
# Provjeri trenutni kvotu
az cognitiveservices usage list --location eastus2

# Pokušaj drugu regiju
azd env set AZURE_LOCATION westus2
azd up

# Privremeno smanji kapacitet
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Zatraži povećanje kvote
# Idi na Azure Portal > Kvote > Zatraži povećanje
```
</details>

<details>
<summary><strong>Mogu li koristiti vlastite podatke s Microsoft Foundry Models?</strong></summary>

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
2. Omogućite privatne krajnje točke
3. Konfigurirajte mrežne sigurnosne skupine
4. Implementirajte ograničenje brzine zahtjeva
5. Koristite Azure Key Vault za tajne

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
- **Agent Skills**: [Microsoft Foundry skill na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalirajte Azure + Foundry agent vještine u svoj uređivač s `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija po poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-prvi razvoj
- **⬅️ Prethodno poglavlje**: [Poglavlje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Sljedeće**: [Implementacija AI modela](ai-model-deployment.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Trebate pomoć?** Pridružite se zajedničkim raspravama ili otvorite issue u repozitoriju. Zajednica Azure AI + AZD je tu da vam pomogne uspjeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj je dokument preveden pomoću AI usluge prevođenja [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazuma ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->