# Microsoft Foundry integracija z AZD

**Navigacija poglavij:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, ki postavlja AI na prvo mesto
- **⬅️ Predhodno poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [Razmestitev AI modela](ai-model-deployment.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ta vodnik prikazuje, kako integrirati storitve Microsoft Foundry z Azure Developer CLI (AZD) za poenostavljene razmestitve AI aplikacij. Microsoft Foundry zagotavlja celovito platformo za izgradnjo, razmestitev in upravljanje AI aplikacij, medtem ko AZD poenostavi infrastrukturo in proces razmestitve.

## Kaj je Microsoft Foundry?

Microsoft Foundry je Microsoftova enotna platforma za razvoj AI, ki vključuje:

- **Katalog modelov**: Dostop do naprednih AI modelov
- **Prompt Flow**: Vizualni oblikovalec za AI delovne tokove
- **Microsoft Foundry Portal**: Integrirano razvojno okolje za AI aplikacije
- **Možnosti razmestitve**: Več možnosti gostovanja in skaliranja
- **Varnost in zaščita**: Vgrajene funkcije za odgovorno AI

## AZD + Microsoft Foundry: Bolje skupaj

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Ročna namestitev prek portala | Avtomatizirane, ponovljive razmestitve |
| **Infrastructure** | Provisioniranje s klikom | Infrastruktura kot koda (Bicep) |
| **Environment Management** | Osredotočenost na eno okolje | Več okolij (dev/staging/prod) |
| **CI/CD Integration** | Omejena | Nativna podpora za GitHub Actions |
| **Cost Management** | Osnovno spremljanje | Optimizacija stroškov po okolju |

## Predpogoji

- Azure naročnina z ustreznimi dovoljenji
- Azure Developer CLI nameščen
- Dostop do storitev Microsoft Foundry Models
- Osnovno poznavanje Microsoft Foundry

## Osnovni vzorci integracije

### Vzorec 1: Integracija Microsoft Foundry Models

**Uporaba**: Razmestitev klepetalnih aplikacij z modeli Microsoft Foundry Models

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
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Vzorec 2: AI Search + RAG integracija

**Uporaba**: Razmestitev aplikacij z dodatnim pridobivanjem za generacijo (RAG)

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

**Uporaba**: Delovni tokovi za obdelavo in analizo dokumentov

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

## 🔧 Vzorci konfiguracije

### Nastavitev spremenljivk okolja

**Konfiguracija za produkcijo:**
```bash
# Osnovne AI storitve
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracije modelov
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Nastavitve zmogljivosti
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfiguracija za razvoj:**
```bash
# Stroškovno optimizirane nastavitve za razvoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Brezplačna raven
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

AZD nudi razširitve, ki dodajajo funkcionalnosti specifične za AI za delo s storitvami Microsoft Foundry:

```bash
# Namestite razširitev Foundry Agents
azd extension install azure.ai.agents

# Namestite razširitev za fino prilagajanje
azd extension install azure.ai.finetune

# Namestite razširitev za prilagojene modele
azd extension install azure.ai.models

# Prikažite nameščene razširitve
azd extension list
```

### Razmestitev, usmerjena na agente, z `azd ai`

Če imate agent manifest, uporabite `azd ai agent init` za ustvarjanje ogrodja projekta povezanega s Foundry Agent Service:

```bash
# Inicializiraj iz manifesta agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Razporedi v Azure
azd up
```

Oglejte si [Ukazi AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za celoten seznam ukazov in stikal.

### Razmestitev z enim ukazom

```bash
# Namestite vse z enim ukazom
azd up

# Ali pa namestite postopoma
azd provision  # Samo infrastruktura
azd deploy     # Samo aplikacija
```

### Razmestitve po okoljih

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

### Omrežna varnost

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

## Odpravljanje pogostih težav

### Težava 1: Kvota OpenAI je prekoračena

**Simptomi:**
- Razmestitev ne uspe zaradi napak kvote
- Napake 429 v dnevnikih aplikacije

**Rešitve:**
```bash
# Preveri trenutno porabo kvote
az cognitiveservices usage list --location eastus

# Preizkusi drugo regijo
azd env set AZURE_LOCATION westus2
azd up

# Začasno zmanjšaj zmogljivost
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Težava 2: Napake pri overjanju

**Simptomi:**
- Napake 401/403 pri klicanju AI storitev
- Sporočila "Access denied"

**Rešitve:**
```bash
# Preveri dodelitve vlog
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Preveri konfiguracijo upravljane identitete
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Preveri dostop do Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Težava 3: Težave z razmestitvijo modela

**Simptomi:**
- Modeli niso na voljo v razmestitvi
- Konkretne različice modelov odpovejo

**Rešitve:**
```bash
# Prikaži razpoložljive modele po regiji
az cognitiveservices model list --location eastus

# Posodobi različico modela v Bicep predlogi
# Preveri zahteve glede zmogljivosti modela
```

## Primeri predlog

### RAG klepetalna aplikacija (Python)

**Repozitorij**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Najbolj priljubljen Azure AI primer — produkcijsko pripravljen RAG klepetalni pripomoček, ki vam omogoča postavljanje vprašanj glede vaših dokumentov. Uporablja GPT-4.1-mini za klepet, text-embedding-ada-002 za vdelave in Azure AI Search za pridobivanje. Podpira multimodalne dokumente, glasovni vhod/izhod, Microsoft Entra avtentikacijo in sledenje z Application Insights.

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG klepetalna aplikacija (.NET)

**Repozitorij**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# ekvivalent Python RAG klepetalnega primera. Zgrajen z ASP.NET Core Minimal API in Blazor WebAssembly frontendom. Vključuje glasovni klepet, podporo GPT-4o-mini vision in spremljevalnega .NET MAUI Blazor Hybrid namiznega/mobilnega odjemalca.

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG klepetalna aplikacija (Java)

**Repozitorij**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Java različica RAG klepetalnega primera, ki uporablja Langchain4J za AI orkestracijo. Podpira mikroservisno dogodkovno arhitekturo, več strategij iskanja (besedilo, vektor, hibrid), nalaganje dokumentov z Azure Document Intelligence in razmestitev na Azure Container Apps ali Azure Kubernetes Service.

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot z Azure AI Foundry

**Repozitorij**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Storitve**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: Celostni trgovinski RAG copilot z uporabo Azure AI Foundry in Prompty. Klepetalni pomočnik trgovine Contoso Outdoor, ki utemeljuje odgovore v katalogu izdelkov in podatkih o naročilih strank. Prikazuje celoten GenAIOps potek dela — prototipiranje z Prompty, ocenjevanje z AI-pomočnimi ocenjevalci in razmestitev preko AZD v Container Apps.

**Hitri začetek**:
```bash
azd init --template contoso-chat
azd up
```

### Večagentna aplikacija za ustvarjalno pisanje

**Repozitorij**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Storitve**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Večagentni primer, ki prikazuje orkestracijo AI agentov z uporabo Prompty. Uporablja raziskovalnega agenta (Bing Grounding v Azure AI Agent Service), produktnega agenta (Azure AI Search), pisateljskega agenta in uredniškega agenta za skupno ustvarjanje dobro raziskovanih člankov. Vključuje CI/CD z ocenjevanjem v GitHub Actions.

**Hitri začetek**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Brezstrežni RAG klepet (JavaScript/TypeScript)

**Repozitorij**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Storitve**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Opis**: Popolnoma brezstrežni RAG klepetalnik, ki uporablja LangChain.js z Azure Functions za API in Azure Static Web Apps za gostovanje. Uporablja Azure Cosmos DB kot vektorsko shrambo in bazo zgodovine klepeta. Podpira lokalni razvoj z Ollama za brezplačno testiranje.

**Hitri začetek**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repozitorij**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Storitve**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Opis**: Rešitev posrednik za RAG na ravni podjetja z upravljalnim vmesnikom za nalaganje/upravljanje dokumentov, več možnostmi orkestratorja (Semantic Kernel, LangChain, Prompt Flow), govor v besedilo, integracijo z Microsoft Teams in izbiro PostgreSQL ali Cosmos DB kot podatkovne rešitve. Zasnovan kot prilagodljiva izhodiščna točka za produkcijske RAG scenarije.

**Hitri začetek**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — večagentna MCP orkestracija

**Repozitorij**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Storitve**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Opis**: Referenčna aplikacija za večagentno AI orkestracijo, ki uporablja tri ogrodja (LangChain.js, LlamaIndex.TS in Microsoft Agent Framework). Vključuje MCP (Model Context Protocol) strežnike v štirih jezikih, razmeščene kot brezstrežne Azure Container Apps z OpenTelemetry spremljanjem.

**Hitri začetek**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repozitorij**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Storitve**: Azure AI Services + Azure OpenAI

**Opis**: Minimalen Bicep predloga, ki razmestí Azure AI storitve s konfiguriranimi modeli strojnega učenja. Lahka izhodiščna točka, ko potrebujete le zagotovljeno Azure AI infrastrukturo brez celotnega aplikacijskega sklopa.

**Hitri začetek**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Preglejte več predlog**: Obiščite [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) za več kot 80 AI-specifičnih AZD predlog v različnih jezikih in scenarijih.

## Naslednji koraki

1. **Preizkusite primere**: Začnite s predpripravljenim predlogom, ki ustreza vašemu primeru uporabe
2. **Prilagodite glede na potrebe**: Spremenite infrastrukturo in aplikacijsko kodo
3. **Dodajte spremljanje**: Uvedite celovito opazovanje
4. **Optimizirajte stroške**: Prilagodite konfiguracije glede na proračun
5. **Zavarujte razmestitev**: Uvedite varnostne vzorce za podjetja
6. **Skalirajte v produkcijo**: Dodajte večregijske in visoko razpoložljive funkcije

## 🎯 Praktične vaje

### Vaja 1: Razmestitev klepetalne aplikacije Microsoft Foundry Models (30 minut)
**Cilj**: Razmestiti in preizkusiti produkcijsko pripravljeno AI klepetalno aplikacijo

```bash
# Inicializiraj predlogo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nastavi okoljske spremenljivke
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Namesti
azd up

# Preizkusi aplikacijo
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Spremljaj delovanje AI
azd monitor

# Počisti
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Razmestitev se zaključi brez napak kvote
- [ ] Do dostopa klepetalnega vmesnika v brskalniku
- [ ] Lahko postavljate vprašanja in dobite odgovore, podprte z AI
- [ ] Application Insights prikazuje telemetrijske podatke
- [ ] Uspešno očiščene vire

**Ocenjeni stroški**: $5-10 za 30 minut testiranja

### Vaja 2: Konfiguracija večmodelne razmestitve (45 minut)
**Cilj**: Razmestiti več AI modelov z različnimi konfiguracijami

```bash
# Ustvari prilagojeno konfiguracijo Bicep
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
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
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
- [ ] Več modelov uspešno razmeščenih
- [ ] Uporabljene različne nastavitve zmogljivosti
- [ ] Modeli dostopni preko API-ja
- [ ] Aplikacija lahko kliče oba modela

### Vaja 3: Uvedba spremljanja stroškov (20 minut)
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
- [ ] Opozorilo za proračun ustvarjeno v Azure
- [ ] Nastavljene e-poštne notifikacije
- [ ] Ogled podatkov o stroških v Azure Portalu
- [ ] Pragovi proračuna ustrezno nastavljeni

## 💡 Pogosto zastavljena vprašanja

<details>
<summary><strong>Kaj lahko storim za zmanjšanje stroškov Microsoft Foundry Models med razvojem?</strong></summary>

1. **Uporabite brezplačni nivo**: Microsoft Foundry Models ponuja 50.000 tokenov/mesec brezplačno
2. **Zmanjšajte kapaciteto**: Nastavite kapaciteto na 10 TPM namesto 30+ za razvoj
3. **Uporabite azd down**: Odstranite dodeljene vire, ko ne razvijate aktivno
4. **Predpomnite odgovore**: Uvedite Redis predpomnilnik za ponavljajoče se poizvedbe
5. **Uporabite inženiring pozivov (prompt engineering)**: Zmanjšajte uporabo tokenov z učinkovitimi pozivi

```bash
# Razvojna konfiguracija
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Kakšna je razlika med Microsoft Foundry Models in OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Poslovna varnost in skladnost
- Integracija z zasebnim omrežjem
- Zagotovitve SLA
- Avtentikacija z upravljano identiteto
- Na voljo so višje kvote

**OpenAI API**:
- Hitrejši dostop do novih modelov
- Enostavnejša nastavitev
- Nižja ovira za vstop
- Samo javni internet

Za produkcijske aplikacije je priporočena **Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Kako naj obravnavam napake zaradi prekoračitve kvote pri Microsoft Foundry Models?</strong></summary>

```bash
# Preverite trenutno kvoto
az cognitiveservices usage list --location eastus2

# Poskusite drugo regijo
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
<summary><strong>Ali lahko uporabim svoje podatke z Microsoft Foundry Models?</strong></summary>

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
<summary><strong>Kako zaščitim končne točke AI modelov?</strong></summary>

**Najboljše prakse**:
1. Uporabite Managed Identity (brez API ključev)
2. Omogočite Private Endpoints
3. Konfigurirajte network security groups
4. Uvedite omejevanje hitrosti
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
- **AZD GitHub**: [Zadeve in razprave](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Uradna dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Namestite Azure + Foundry agent skills v vašem urejevalniku z `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavij:**
- **📚 Domača stran tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - AI-First Development
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [Razmestitev AI modela](ai-model-deployment.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se razpravam v skupnosti ali odprite težavo (issue) v repozitoriju. Skupnost Azure AI + AZD je tukaj, da vam pomaga uspeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazuma ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->