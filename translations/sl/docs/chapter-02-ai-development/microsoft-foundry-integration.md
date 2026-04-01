# Integracija Microsoft Foundry z AZD

**Navigacija poglavij:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Poglavje 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Pregled

Ta vodnik prikazuje, kako integrirati storitve Microsoft Foundry z Azure Developer CLI (AZD) za poenostavljeno razmestitev AI aplikacij. Microsoft Foundry zagotavlja celovito platformo za gradnjo, razmestitev in upravljanje AI aplikacij, medtem ko AZD poenostavi infrastrukturo in postopek razmestitve.

## Kaj je Microsoft Foundry?

Microsoft Foundry je Microsoftova združena platforma za razvoj AI, ki vključuje:

- **Katalog modelov**: Dostop do najsodobnejših AI modelov
- **Prompt Flow**: Vizualni oblikovalec za AI delovne tokove
- **Microsoft Foundry Portal**: Integrirano razvojno okolje za AI aplikacije
- **Možnosti razmestitve**: Več možnosti gostovanja in skaliranja
- **Varnost in zaščita**: Vgrajene funkcije odgovorne uporabe AI

## AZD + Microsoft Foundry: Bolje skupaj

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Predpogoji

- Azure naročnina z ustreznimi dovoljenji
- Nameščen Azure Developer CLI
- Dostop do storitev Microsoft Foundry Models
- Osnovno poznavanje Microsoft Foundry

> **Current AZD baseline:** These examples were reviewed against `azd` `1.23.12`. For the AI agent workflow, use the current preview extension release and check your installed version before you begin.

## Osnovni vzorci integracije

### Vzorec 1: Integracija Microsoft Foundry Models

**Primer uporabe**: Razmestitev klepetalnih aplikacij z modeli Microsoft Foundry Models

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

### Vzorec 2: AI Search + RAG integracija

**Primer uporabe**: Razmestitev aplikacij za pridobivanje z dopolnjenim generiranjem (RAG)

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

### Vzorec 3: Integracija Document Intelligence

**Primer uporabe**: Delovni tokovi za obdelavo in analizo dokumentov

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

## 🔧 Vzorec konfiguracij

### Nastavitev okolijskih spremenljivk

**Nastavitve za produkcijo:**
```bash
# Temeljne AI storitve
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracije modelov
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Nastavitve zmogljivosti
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Nastavitve za razvoj:**
```bash
# Nastavitve, optimizirane za nizke stroške med razvojem
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Brezplačni nivo
```

### Varna konfiguracija s Key Vault

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

## Delovni tokovi razmestitve

### Razširitve AZD za Foundry

AZD zagotavlja razširitve, ki dodajo AI-specifične zmogljivosti za delo z Microsoft Foundry storitvami:

```bash
# Namestite razširitev Foundry agents
azd extension install azure.ai.agents

# Namestite razširitev za fino prilagajanje
azd extension install azure.ai.finetune

# Namestite razširitev za prilagojene modele
azd extension install azure.ai.models

# Prikažite nameščene razširitve
azd extension list --installed

# Preverite trenutno nameščeno različico razširitve agentov
azd extension show azure.ai.agents
```

AI razširitve se še hitro razvijajo v predogledu. Če se ukaz obnaša drugače kot je prikazano tukaj, posodobite ustrezno razširitev, preden odpravljate težave s projektom.

### Agent-prva razmestitev z `azd ai`

Če imate manifest agenta, uporabite `azd ai agent init`, da ustvarite ogrodje projekta, povezano s Foundry Agent Service:

```bash
# Inicializiraj iz manifesta agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Razporedi v Azure
azd up
```

Nedavne predogledne izdaje `azure.ai.agents` so prav tako dodale podporo za inicializacijo na osnovi predlog za `azd ai agent init`. Če sledite novejšim agent vzorcem, preglejte pomoč razširitve za natančne zastavice, ki so na voljo v vaši nameščeni različici.

Oglejte si [AZD AI CLI ukazi](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za celoten referenčni seznam ukazov in zastavic.

### Enostavna razmestitev z enim ukazom

```bash
# Razporedi vse z enim ukazom
azd up

# Ali razporedi postopoma
azd provision  # Samo infrastruktura
azd deploy     # Samo aplikacija

# Za dolgotrajno uvajanje AI-aplikacij v azd 1.23.11+
azd deploy --timeout 1800
```

### Razmestitve specifične za okolje

```bash
# Razvojno okolje
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Produkcijsko okolje
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Spremljanje in opazovanje

### Integracija z Application Insights

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

### Spremljanje stroškov

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

## 🔐 Varnostne najboljše prakse

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

### Strategije predpomnjenja

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

### Konfiguracija samodejnega skaliranja

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

## Reševanje pogostih težav

### Težava 1: Presežena kvota OpenAI

**Simptomi:**
- Razmestitev ne uspe zaradi napak kvote
- 429 napake v dnevnikih aplikacije

**Rešitve:**
```bash
# Preveri trenutno porabo kvote
az cognitiveservices usage list --location eastus

# Poskusi drugo regijo
azd env set AZURE_LOCATION westus2
azd up

# Začasno zmanjšaj zmogljivost
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Težava 2: Napake pri overjanju

**Simptomi:**
- 401/403 napake pri klicanju AI storitev
- Sporočila "Access denied"

**Rešitve:**
```bash
# Preveri dodelitve vlog
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Preveri konfiguracijo upravljane identitete
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Preveri dostop do Key Vaulta
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Težava 3: Težave z razmestitvijo modelov

**Simptomi:**
- Modeli niso na voljo v razmestitvi
- Določene različice modelov ne delujejo

**Rešitve:**
```bash
# Naštej razpoložljive modele po regijah
az cognitiveservices model list --location eastus

# Posodobi različico modela v Bicep predlogi
# Preveri zahteve glede zmogljivosti modela
```

## Primeri predlog

### RAG klepetalna aplikacija (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Storitev**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Najbolj priljubljen Azure AI vzorec — produkcijsko pripravljen RAG klepetalni app, ki vam omogoča postavljanje vprašanj nad vašimi dokumenti. Uporablja GPT-4.1-mini za klepet, text-embedding-3-large za vektorje in Azure AI Search za iskanje. Podpira multimodalne dokumente, vhod/izhod govora, Microsoft Entra overjanje in sledenje z Application Insights.

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG klepetalna aplikacija (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Storitev**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# ekvivalent Python RAG klepetalnega vzorca. Zgrajeno z ASP.NET Core Minimal API in Blazor WebAssembly frontendom. Vsebuje glasovni klepet, podporo za GPT-4o-mini vision in spremljevalni .NET MAUI Blazor Hybrid namizni/mobilni klient.

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG klepetalna aplikacija (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Storitev**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Java različica RAG klepetalnega vzorca, ki uporablja Langchain4J za orkestracijo AI. Podpira mikroservisno dogodkovno usmerjeno arhitekturo, več strategij iskanja (besedilno, vektorsko, hibridno), nalaganje dokumentov z Azure Document Intelligence in razmestitev na Azure Container Apps ali Azure Kubernetes Service.

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot z Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Storitev**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: Celoviti trgovinski RAG copilot z uporabo Azure AI Foundry in Prompty. Contoso Outdoor trgovski chatbot, ki temelji odgovore na podatkih o katalogu izdelkov in naročilih strank. Prikazuje celoten GenAIOps delovni tok — prototipiranje s Prompty, ocenjevanje z AI-podprtimi evaluatorji in razmestitev preko AZD v Container Apps.

**Hitri začetek**:
```bash
azd init --template contoso-chat
azd up
```

### Kreativno pisanje, več-agentna aplikacija

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Storitev**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Več-agentni vzorec, ki prikazuje orkestracijo AI agentov s Prompty. Uporablja raziskovalnega agenta (Bing Grounding v Azure AI Agent Service), produktnega agenta (Azure AI Search), pisateljskega agenta in uredniškega agenta za skupno ustvarjanje temeljito raziskanih člankov. Vključuje CI/CD z ocenjevanjem v GitHub Actions.

**Hitri začetek**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG klepetalnik (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Storitev**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB za NoSQL + LangChain.js

**Opis**: Popolnoma serverless RAG chatbot z uporabo LangChain.js, Azure Functions za API in Azure Static Web Apps za gostovanje. Uporablja Azure Cosmos DB kot vektorski repozitorij in podatkovno bazo zgodovine klepeta. Podpira lokalni razvoj z Ollama za brezplačno testiranje.

**Hitri začetek**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Storitev**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Opis**: Rešitev za podjetja s RAG pospeševalnikom z administracijskim portalom za nalaganje/upravljanje dokumentov, več možnostmi orkestratorja (Semantic Kernel, LangChain, Prompt Flow), pretvorbo govora v besedilo, integracijo z Microsoft Teams in izbiro PostgreSQL ali Cosmos DB kot hrbtenico. Zasnovano kot prilagodljiva izhodiščna točka za produkcijske RAG primere.

**Hitri začetek**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — več-agentna MCP orkestracija

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Storitev**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Opis**: Referenčna aplikacija za več-agentno AI orkestracijo z uporabo treh ogrodij (LangChain.js, LlamaIndex.TS in Microsoft Agent Framework). Vključuje MCP (Model Context Protocol) strežnike v štirih jezikih, razmestljene kot serverless Azure Container Apps z OpenTelemetry spremljanjem.

**Hitri začetek**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Storitev**: Azure AI Services + Azure OpenAI

**Opis**: Minimalna Bicep predloga, ki razmestiti Azure AI storitve z vnaprej konfiguriranimi strojno-učenimi modeli. Lahka izhodiščna točka, kadar potrebujete le pripravljeno Azure AI infrastrukturo brez celotnega aplikacijskega sklada.

**Hitri začetek**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Raziščite več predlog**: Obiščite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) za več kot 80 AI-specifičnih AZD predlog v različnih jezikih in scenarijih.

## Naslednji koraki

1. **Preizkusite primere**: Začnite s predpripravljeno predlogo, ki ustreza vašemu primeru uporabe
2. **Prilagodite svojim potrebam**: Spremenite infrastrukturo in aplikacijsko kodo
3. **Dodajte spremljanje**: Implementirajte celovito opazovanje
4. **Optimizirajte stroške**: Natančno nastavite konfiguracije glede na proračun
5. **Zavarujte razmestitev**: Uporabite varnostne vzorce za podjetja
6. **Razširite v produkcijo**: Dodajte več-regionalne in visoko razpoložljivostne funkcije

## 🎯 Praktične vaje

### Vaja 1: Razmestitev Microsoft Foundry Models klepetalnega appa (30 minut)
**Cilj**: Razmestiti in preizkusiti produkcijsko pripravljen AI klepetalni aplikacijo

```bash
# Inicializiraj predlogo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nastavi spremenljivke okolja
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Namesti
azd up

# Preizkusi aplikacijo
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Nadzoruj delovanje AI
azd monitor

# Počisti
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Razmestitev se zaključi brez napak kvote
- [ ] Dostop do vmesnika klepeta v brskalniku
- [ ] Možnost zastavljanja vprašanj in pridobivanja AI-podprtih odgovorov
- [ ] Application Insights prikazuje telemetrične podatke
- [ ] Viri so uspešno očiščeni

**Ocenjeni stroški**: $5-10 za 30 minut testiranja

### Vaja 2: Konfiguracija razmestitve z več modeli (45 minut)
**Cilj**: Razmestiti več AI modelov z različnimi konfiguracijami

```bash
# Ustvari prilagojeno Bicep konfiguracijo
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

# Razporedi in preveri
azd provision
azd show
```

**Kriteriji uspeha:**
- [ ] Več modelov uspešno razmestljenih
- [ ] Uporabljene različne nastavitve kapacitete
- [ ] Modeli dostopni preko API
- [ ] Z aplikacije je mogoče klicati oba modela

### Vaja 3: Implementacija spremljanja stroškov (20 minut)
**Cilj**: Nastaviti opozorila proračuna in sledenje stroškom

```bash
# Dodaj opozorilo o proračunu v Bicep
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

# Razporedi opozorilo o proračunu
azd provision

# Preveri trenutne stroške
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteriji uspeha:**
- [ ] V Azure ustvarjeno opozorilo proračuna
- [ ] E-poštna obvestila konfigurirana
- [ ] Možnost pregleda podatkov o stroških v Azure Portal
- [ ] Pragovi proračuna ustrezno nastavljeni

## 💡 Pogosta vprašanja

<details>
<summary><strong>Kako zmanjšam stroške Microsoft Foundry Models med razvojem?</strong></summary>

1. **Uporabite brezplačen nivo**: Microsoft Foundry Models ponuja 50.000 tokenov/mesec brezplačno
2. **Zmanjšajte kapaciteto**: Nastavite kapaciteto na 10 TPM namesto 30+ za razvoj
3. **Uporabite azd down**: Deallokirajte vire, ko ne razvijate aktivno
4. **Predpomnite odgovore**: Implementirajte Redis predpomnilnik za ponavljajoče se poizvedbe
5. **Uporabite Prompt Engineering**: Z učinkovitim oblikovanjem navodil zmanjšajte porabo tokenov

</details>
```bash
# Razvojna konfiguracija
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Kakšna je razlika med Microsoft Foundry Models in OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Varnost in skladnost za podjetja
- Integracija v zasebno omrežje
- Jamstva SLA
- Avtentikacija z upravljano identiteto
- Na voljo višje kvote

**OpenAI API**:
- Hitrejši dostop do novih modelov
- Enostavnejša nastavitev
- Nižja vstopna ovira
- Samo javni internet

Za produkcijske aplikacije je priporočeno **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Kako naj obravnavam napake zaradi prekoračitve kvote pri Microsoft Foundry Models?</strong></summary>

```bash
# Preverite trenutno kvoto
az cognitiveservices usage list --location eastus2

# Preizkusite drugo regijo
azd env set AZURE_LOCATION westus2
azd up

# Začasno zmanjšajte zmogljivost
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Zahtevajte povečanje kvote
# Pojdite v Azure Portal > Kvote > Zahtevajte povečanje
```
</details>

<details>
<summary><strong>Ali lahko uporabim svoje podatke pri Microsoft Foundry Models?</strong></summary>

Da! Uporabite **Azure AI Search** za RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Oglejte si predlogo [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Kako zavarujem končne točke modelov AI?</strong></summary>

**Najboljše prakse**:
1. Uporabite Managed Identity (brez API ključev)
2. Omogočite zasebne končne točke
3. Konfigurirajte omrežne varnostne skupine
4. Uvedite omejevanje hitrosti zahtev
5. Uporabite Azure Key Vault za skrivnosti

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
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Namestite Azure + Foundry agent skills v svoj urejevalnik z `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavij:**
- **📚 Domov tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, usmerjen na AI
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [Razmestitev AI modela](ai-model-deployment.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se razpravam v skupnosti ali odprite težavo v repozitoriju. Skupnost Azure AI + AZD je tukaj, da vam pomaga uspeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo storitve strojnega prevajanja [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba smatrati za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Nismo odgovorni za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->