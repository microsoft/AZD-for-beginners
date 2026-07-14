# Integracija Microsoft Foundry z AZD

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj AI na prvem mestu
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [Implementacija modela AI](ai-model-deployment.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

## Pregled

Ta vodič prikazuje, kako integrirati Microsoft Foundry storitve z Azure Developer CLI (AZD) za poenostavljene implementacije AI aplikacij. Microsoft Foundry zagotavlja celovito platformo za gradnjo, implementacijo in upravljanje AI aplikacij, medtem ko AZD poenostavlja infrastrukturo in proces uvajanja.

## Kaj je Microsoft Foundry?

Microsoft Foundry je Microsoftova združena platforma za razvoj AI, ki vključuje:

- **Katalog modelov**: Dostop do najsodobnejših AI modelov
- **Prompt Flow**: Vizualni oblikovalec za AI delovne tokove
- **Portal Microsoft Foundry**: Integrirano razvojno okolje za AI aplikacije
- **Možnosti uvajanja**: Več možnosti gostovanja in skaliranja
- **Varnost in zaščita**: Vgrajene funkcije odgovorne AI

## AZD + Microsoft Foundry: Bolje skupaj

| Značilnost | Microsoft Foundry | Prednost integracije z AZD |
|---------|-----------------|------------------------|
| **Implementacija modela** | Ročna implementacija preko portala | Avtomatizirane, ponovljive implementacije |
| **Infrastruktura** | Provisioniranje preko klikov | Infrastruktura kot koda (Bicep) |
| **Upravljanje okolja** | Usmerjeno na eno okolje | Več okolij (dev/staging/prod) |
| **Integracija CI/CD** | Omejena | Nativna podpora za GitHub Actions |
| **Upravljanje stroškov** | Osnovno spremljanje | Optimizacija stroškov na okolje |

## Pogoji

- Azure naročnina s potrebnimi dovoljenji
- Namestitev Azure Developer CLI
- Dostop do storitev Microsoft Foundry Models
- Osnovno poznavanje Microsoft Foundry

> **Trenutna baza AZD:** Ti primeri so bili preverjeni z `azd` `1.27.1`. Za delovni tok AI agenta uporabite trenutno predogledno različico razširitve in preverite svojo nameščeno različico pred začetkom.

## Osnovni vzorci integracije

### Vzorec 1: Integracija Microsoft Foundry Models

**Uporaba**: Implementacija klepetalnih aplikacij z modeli Microsoft Foundry Models

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

### Vzorec 2: Integracija AI Search + RAG

**Uporaba**: Implementacija aplikacij za generiranje zlasti preko iskanja (RAG)

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

### Vzorec 3: Integracija dokumentne inteligence

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

## 🔧 Konfiguracijski vzorci

### Nastavitev okoljskih spremenljivk

**Konfiguracija za produkcijo:**
```bash
# Osnovne AI storitve
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfiguracije modela
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

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

### Varnostna konfiguracija s Key Vault

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

## Delovni tokovi uvajanja

### Razširitve AZD za Foundry

AZD ponuja razširitve, ki dodajajo AI-specifične zmogljivosti za delo z Microsoft Foundry storitvami:

```bash
# Namestite razširitev Foundry agents
azd extension install azure.ai.agents

# Namestite razširitev za fino nastavitev
azd extension install azure.ai.finetune

# Namestite razširitev za prilagojene modele
azd extension install azure.ai.models

# Prikaži nameščene razširitve
azd extension list --installed

# Preveri trenutno nameščeno različico razširitve agentov
azd extension show azure.ai.agents
```

AI razširitve so še vedno v hitrem predogledu. Če se ukaz obnaša drugače kot tukaj, nadgradite ustrezno razširitev preden začnete odpravljati težave s samim projektom.

### Uvajanje z agentom na prvem mestu z `azd ai`

Če imate manifest agenta, uporabite `azd ai agent init` za ustvarjanje projekta, povezanega s Foundry Agent Service:

```bash
# Inicializiraj iz manifesta agenta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Namesti na Azure
azd up
```

Nedavne predogledne različice `azure.ai.agents` so dodale tudi podporo za inicializacijo na podlagi predloge za `azd ai agent init`. Če sledite novejšim agentnim primerom, preverite pomoč razširitve za točne zastavice, ki so na voljo v vaši nameščeni različici.

Glejte [AZD AI CLI ukaze](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za celoten seznam ukazov in zastavic.

### Uvajanje z enim ukazom

```bash
# Vse razporedite z enim ukazom
azd up

# Ali pa razporedite postopoma
azd provision  # Samo infrastruktura
azd deploy     # Samo aplikacija

# Za dolgotrajne razporeditve AI aplikacij v azd 1.23.11+
azd deploy --timeout 1800
```

### Uvajanja specifična za okolje

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

## Odpravljanje pogostih težav

### Težava 1: Presežen kvota OpenAI

**Simptomi:**
- Implementacija neuspešna zaradi napak kvote
- Napake 429 v dnevnikih aplikacije

**Rešitve:**
```bash
# Preveri trenutno porabo kvote
az cognitiveservices usage list --location eastus

# Poskusi drugo regijo
azd env set AZURE_LOCATION westus2
azd up

# Začasno zmanjša zmogljivost
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Težava 2: Težave z avtentikacijo

**Simptomi:**
- Napake 401/403 pri klicanju AI storitev
- Sporočila "Dostop zavrnjen"

**Rešitve:**
```bash
# Preveri dodelitve vlog
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Preveri konfiguracijo upravljane identitete
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Preveri dostop do Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Težava 3: Težave z implementacijo modela

**Simptomi:**
- Modeli niso na voljo v implementaciji
- Specifične različice modelov ne uspevajo

**Rešitve:**
```bash
# Navedite razpoložljive modele po regijah
az cognitiveservices model list --location eastus

# Posodobite različico modela v predlogi bicep
# Preverite zahteve glede zmogljivosti modela
```

## Primeri predlog

### RAG klepetalna aplikacija (Python)

**Repozitorij**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Opis**: Najbolj priljubljen Azure AI primer — RAG klepetalna aplikacija, pripravljena za produkcijo, ki omogoča zastavljanje vprašanj na vaših dokumentih. Uporablja GPT-4.1-mini za klepet, text-embedding-3-large za vdelave in Azure AI Search za pridobivanje. Podpira multimodalne dokumente, govor vnos/izhod, Microsoft Entra avtentikacijo in sledenje Application Insights.

**Hiter začetek**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG klepetalna aplikacija (.NET)

**Repozitorij**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Opis**: .NET/C# ekvivalent Python RAG klepetalnega primera. Zgrajeno z ASP.NET Core Minimal API in Blazor WebAssembly sprednjo stranjo. Vključuje glasovni klepet, podporo GPT-4o-mini vision in spremljevalno .NET MAUI Blazor Hybrid namizno/mobilno aplikacijo.

**Hiter začetek**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG klepetalna aplikacija (Java)

**Repozitorij**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Storitve**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Opis**: Java različica RAG klepetalnega primera z uporabo Langchain4J za AI orkestracijo. Podpira mikroservisno dogodkovno-arhitekturo, več strategij iskanja (besedilo, vektor, hibrid), nalaganje dokumentov z Azure Document Intelligence ter implementacijo na Azure Container Apps ali Azure Kubernetes Service.

**Hiter začetek**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot z Microsoft Foundry

**Repozitorij**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Storitve**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Opis**: Celoviti maloprodajni RAG copilot z Microsoft Foundry in Prompty. Contoso Outdoor maloprodajni klepetalni robot, ki temelji na katalogu izdelkov in podatkih o naročilih strank. Prikazuje celoten GenAIOps delovni tok — prototip z Prompty, ocenjevanje z AI-podprtimi ocenjevalci in implementacija preko AZD v Container Apps.

**Hiter začetek**:
```bash
azd init --template contoso-chat
azd up
```

### Kreativna pisateljska večagentna aplikacija

**Repozitorij**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Storitve**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Opis**: Večagentni primer, ki prikazuje orkestracijo AI agentov z Prompty. Uporablja raziskovalnega agenta (Bing Grounding v Azure AI Agent Service), produkcijskega agenta (Azure AI Search), pisateljskega agenta in uredniškega agenta za skupno ustvarjanje dobro raziskanih člankov. Vključuje CI/CD z ocenjevanjem v GitHub Actions.

**Hiter začetek**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Brezstrežni RAG klepet (JavaScript/TypeScript)

**Repozitorij**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Storitve**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB za NoSQL + LangChain.js

**Opis**: Popolnoma brezstrežni RAG klepetalni robot z uporabo LangChain.js z Azure Functions za API in Azure Static Web Apps za gostovanje. Uporablja Azure Cosmos DB kot tako vektorski shrambo kot zbirko klepetalnih zgodovin. Podpira lokalni razvoj z Ollama za brezplačno testiranje.

**Hiter začetek**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Pospeševalnik rešitve Chat z Vašimi podatki

**Repozitorij**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Storitve**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Opis**: Pospeševalnik rešitve RAG nivoja podjetja z upravljavo portala za nalaganje/upravljanje dokumentov, več možnostmi orkestratorja (Semantic Kernel, LangChain, Prompt Flow), govor-v-besedilo, Microsoft Teams integracijo in izbiro PostgreSQL ali Cosmos DB v ozadju. Namenjeno kot prilagodljiva izhodiščna točka za produkcijske scenarije RAG.

**Hiter začetek**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI potovalni agenti — večagentna MCP orkestracija

**Repozitorij**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Storitve**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP strežniki (.NET, Python, Java, TypeScript)

**Opis**: Referenčna aplikacija za večagentno AI orkestracijo z uporabo treh ogrodij (LangChain.js, LlamaIndex.TS in Microsoft Agent Framework). Ponuja MCP (Model Context Protocol) strežnike v štirih jezikih, nameščene kot brezstrežni Azure Container Apps z OpenTelemetry spremljanjem.

**Hiter začetek**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Začetnik Azure AI

**Repozitorij**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Storitve**: Azure AI Storitve + Azure OpenAI

**Opis**: Minimalna Bicep predloga, ki implementira Azure AI storitve s konfiguriranimi modeli strojnega učenja. Lahka izhodiščna točka, ko potrebujete samo zagotovljeno Azure AI infrastrukturo brez celotne aplikacijske plasti.

**Hiter začetek**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Oglejte si več predlog**: Obiščite [Galerijo Awesome AZD AI Predlog](https://azure.github.io/awesome-azd/?tags=ai) za več kot 80 AZD predlog, specifičnih za AI, v različnih jezikih in scenarijih.

## Naslednji koraki

1. **Preizkusite primere**: Začnite s predlogo, ki ustreza vašemu primeru uporabe
2. **Prilagodite vašim potrebam**: Spremenite infrastrukturo in kodo aplikacije
3. **Dodajte spremljanje**: Izvedite celovito opazovanje
4. **Optimizirajte stroške**: Natančno nastavite konfiguracije za vaš proračun
5. **Zavarujte uvajanje**: Uvedite varnostne vzorce za podjetja
6. **Razširite za produkcijo**: Dodajte funkcije za večregijsko in visoko razpoložljivost

## 🎯 Praktične vaje

### vaja 1: Implementacija klepetalne aplikacije Microsoft Foundry Models (30 minut)
**Cilj**: Implementacija in testiranje produkcijsko pripravljene AI klepetalne aplikacije

```bash
# Inicializiraj predlogo
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Nastavi okoljske spremenljivke
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Izvedi namestitev
azd up

# Testiraj aplikacijo
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Spremljaj operacije AI
azd monitor

# Očisti
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Implementacija se izvede brez napak kvote
- [ ] Dostop do klepetalnega vmesnika v brskalniku
- [ ] Možnost zastavljanja vprašanj in prejem AI-poganjanih odgovorov
- [ ] Application Insights prikazuje telemetrične podatke
- [ ] Viri so uspešno očiščeni

**Ocenjeni strošek**: $5-10 za 30 minut testiranja

### vaja 2: Konfiguracija uvajanja več modelov (45 minut)
**Cilj**: Implementacija več AI modelov z različnimi konfiguracijami

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

# Namesti in preveri
azd provision
azd show
```

**Kriteriji uspeha:**
- [ ] Uspešno implementirani več modelov
- [ ] Uporabljene različne nastavitve zmogljivosti
- [ ] Modeli dostopni preko API-ja
- [ ] Oba modela dostopna iz aplikacije

### vaja 3: Implementacija spremljanja stroškov (20 minut)
**Cilj**: Nastavitev proračunskih opozoril in spremljanje stroškov

```bash
# Dodajte opozorilo o proračunu v Bicep
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

# Namestite opozorilo o proračunu
azd provision

# Preverite trenutne stroške
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteriji uspeha:**
- [ ] V Azure ustvarjeno opozorilo proračuna
- [ ] Nastavljeni emaili za obvestila
- [ ] Možnost ogleda podatkov o stroških v Azure portalu
- [ ] Proračunske meje ustrezno nastavljene

## 💡 Pogosto zastavljena vprašanja

<details>
<summary><strong>Kaj lahko storim za zmanjšanje stroškov Microsoft Foundry Models med razvojem?</strong></summary>

1. **Uporabite brezplačni nivo**: Microsoft Foundry Models ponuja 50.000 tokenov/mesec brezplačno
2. **Zmanjšajte zmogljivost**: Nastavite zmogljivost na 10 TPM namesto 30+ za razvoj
3. **Uporabite azd down**: Oprostite vire, ko ne razvijate aktivno
4. **Predpomnjenje odgovorov**: Implementirajte Redis cache za ponavljajoče poizvedbe
5. **Uporabite prompt inženiring**: Zmanjšajte uporabo tokenov z učinkoviti pozivi


```bash
# Konfiguracija za razvoj
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Kakšna je razlika med Microsoft Foundry Models in OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Zavarovanje podjetij in skladnost
- Integracija zasebnega omrežja
- Zagotovitve SLA
- Avtentikacija preko upravljane identitete
- Na voljo višje kvote

**OpenAI API**:
- Hitrejši dostop do novih modelov
- Preprostejša nastavitev
- Nižja ovira za vstop
- Samo javni internet

Za produkcijske aplikacije je **priporočeno Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Kako ravnam z napakami o prekoračitvi kvote Microsoft Foundry Models?</strong></summary>

```bash
# Preveri trenutno kvoto
az cognitiveservices usage list --location eastus2

# Poskusi drugo regijo
azd env set AZURE_LOCATION westus2
azd up

# Začasno zmanjši zmogljivost
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Zahtevaj povečanje kvote
# Pojdi na Azure Portal > Kvote > Zahtevaj povečanje
```
</details>

<details>
<summary><strong>Ali lahko uporabljam svoje podatke z Microsoft Foundry Models?</strong></summary>

Seveda! Uporabite **Azure AI Search** za RAG (Retrieval Augmented Generation):

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
<summary><strong>Kako zavarujem AI model končne točke?</strong></summary>

**Najboljše prakse**:
1. Uporabite upravljano identiteto (brez API ključev)
2. Omogočite zasebne končne točke
3. Konfigurirajte varnostne skupine omrežja
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
- **AZD GitHub**: [Težave in razprave](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Uradna dokumentacija](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill na skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Namestite Azure + Foundry agent spretnosti v svoj urejevalnik z `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj z AI v ospredju
- **⬅️ Prejšnje poglavje**: [Poglavje 1: Vaš prvi projekt](../chapter-01-foundation/first-project.md)
- **➡️ Naslednje**: [Implementacija AI modela](ai-model-deployment.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

**Potrebujete pomoč?** Pridružite se razpravam v skupnosti ali odprite težavo v repozitoriju. Azure AI + AZD skupnost je tu, da vam pomaga uspeti!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->