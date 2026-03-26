# Microsoft Foundry integráció AZD-vel

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI modell telepítés](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Áttekintés

Ez az útmutató bemutatja, hogyan lehet a Microsoft Foundry szolgáltatásait integrálni az Azure Developer CLI-vel (AZD), hogy egyszerűbbé tegyük az AI alkalmazások telepítését. A Microsoft Foundry egy átfogó platform az AI alkalmazások építésére, telepítésére és kezelésére, míg az AZD leegyszerűsíti az infrastruktúra és a telepítési folyamatot.

## Mi az a Microsoft Foundry?

A Microsoft Foundry a Microsoft egységes AI fejlesztési platformja, amely magában foglalja:

- **Modell katalógus**: Hozzáférés a legmodernebb AI modellekhez
- **Prompt Flow**: AI munkafolyamatok vizuális tervezője
- **Microsoft Foundry portál**: Integrált fejlesztői környezet AI alkalmazásokhoz
- **Telepítési lehetőségek**: Több hosztolási és skálázási opció
- **Biztonság és védelem**: Beépített felelős AI funkciók

## AZD + Microsoft Foundry: Jobban együtt

| Funkció | Microsoft Foundry | AZD integráció előnye |
|---------|-------------------|-----------------------|
| **Modell telepítés** | Kézi portál telepítés | Automatizált, ismételhető telepítések |
| **Infrastruktúra** | Kattintgatós erőforrás létrehozás | Infrastructure as Code (Bicep) |
| **Környezeti kezelés** | Egyetlen környezet fókusz | Több környezet (dev/staging/prod) |
| **CI/CD integráció** | Korlátozott | Natív GitHub Actions támogatás |
| **Költségmenedzsment** | Alap monitoring | Környezet specifikus költségoptimalizálás |

## Előfeltételek

- Azure előfizetés megfelelő jogosultságokkal
- Azure Developer CLI telepítve
- Hozzáférés a Microsoft Foundry Models szolgáltatásokhoz
- Alapvető ismeretek a Microsoft Foundry-ról

## Alapvető integrációs minták

### Minta 1: Microsoft Foundry Models integráció

**Használati eset**: Chat alkalmazások telepítése Microsoft Foundry Modelsekkel

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

**Infrastruktúra (main.bicep):**
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

### Minta 2: AI keresés + RAG integráció

**Használati eset**: Keresésalapú generációs (RAG) alkalmazások telepítése

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

### Minta 3: Dokumentum intelligencia integráció

**Használati eset**: Dokumentumfeldolgozó és elemző munkafolyamatok

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

## 🔧 Konfigurációs minták

### Környezeti változók beállítása

**Éles konfiguráció:**
```bash
# Alapvető MI szolgáltatások
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modell konfigurációk
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Teljesítmény beállítások
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Fejlesztői konfiguráció:**
```bash
# Költséghatékony beállítások fejlesztéshez
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Ingyenes szint
```

### Biztonságos konfiguráció Key Vault használatával

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

## Telepítési munkafolyamatok

### AZD bővítmények Foundryhoz

AZD kiterjesztéseket kínál, melyek AI-specifikus képességeket adnak Microsoft Foundry szolgáltatásokhoz:

```bash
# Telepítse a Foundry agents kiterjesztést
azd extension install azure.ai.agents

# Telepítse a finomhangolási kiterjesztést
azd extension install azure.ai.finetune

# Telepítse az egyedi modellek kiterjesztést
azd extension install azure.ai.models

# Telepített kiterjesztések listázása
azd extension list
```

### Agent-First telepítés `azd ai`-vel

Ha rendelkezel agent manifesttel, használd az `azd ai agent init` parancsot a Foundry Agent Service-hez kötött projekt előkészítésére:

```bash
# Inicializálás egy agent manifestből
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Telepítés Azure-ra
azd up
```

Teljes parancsreferenciáért és kapcsolókért lásd az [AZD AI CLI parancsokat](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Egyszerű parancsos telepítés

```bash
# Minden telepítése egy parancsal
azd up

# Vagy lépésenként telepíteni
azd provision  # Csak az infrastruktúra
azd deploy     # Csak az alkalmazás
```

### Környezet-specifikus telepítések

```bash
# Fejlesztési környezet
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Éles környezet
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitoring és megfigyelhetőség

### Application Insights integráció

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

### Költségfigyelés

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

## 🔐 Biztonsági legjobb gyakorlatok

### Kezelt identitás konfiguráció

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

### Hálózati biztonság

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

## Teljesítmény optimalizálás

### Gyorsítótárazási stratégiák

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

### Automatikus skálázás beállítása

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

## Gyakori problémák hibaelhárítása

### Probléma 1: OpenAI kvóta túllépés

**Tünetek:**
- Telepítés kvóta hibával meghiúsul
- 429-es hibák az alkalmazás naplókban

**Megoldások:**
```bash
# Ellenőrizze az aktuális kvóta használatot
az cognitiveservices usage list --location eastus

# Próbáljon meg másik régiót
azd env set AZURE_LOCATION westus2
azd up

# Ideiglenesen csökkentse a kapacitást
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probléma 2: Hitelesítési hibák

**Tünetek:**
- 401/403 hibák AI szolgáltatások hívásakor
- "Hozzáférés megtagadva" üzenetek

**Megoldások:**
```bash
# Szerepkör-hozzárendelések ellenőrzése
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kezelt identitás konfigurációjának ellenőrzése
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault hozzáférés érvényesítése
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probléma 3: Modell telepítési problémák

**Tünetek:**
- Modellek nem elérhetők a telepítéskor
- Egyes modell verziók hibáznak

**Megoldások:**
```bash
# Rendelkezésre álló modellek listázása régiónként
az cognitiveservices model list --location eastus

# Modell verziójának frissítése bicep sablonban
# Modell kapacitáskövetelmények ellenőrzése
```

## Példa sablonok

### RAG Chat alkalmazás (Python)

**Könyvtár**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Leírás**: A legnépszerűbb Azure AI példa — éles RAG chat alkalmazás, amellyel a saját dokumentumaid felett teheted fel kérdéseidet. GPT-4.1-mini chathez, text-embedding-ada-002 beágyazásokhoz, és Azure AI Search a lekérdezéshez. Támogatja multimodális dokumentumokat, beszéd bevitel/kimenet, Microsoft Entra hitelesítést és Application Insights nyomkövetést.

**Gyors indítás**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat alkalmazás (.NET)

**Könyvtár**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Leírás**: A Python RAG chat minta .NET/C# megfelelője. ASP.NET Core Minimal API és Blazor WebAssembly frontenddel építve. Támogatja a hangalapú chatet, GPT-4o-mini látást, és egy .NET MAUI Blazor Hybrid asztali/mobil klienset is tartalmaz.

**Gyors indítás**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat alkalmazás (Java)

**Könyvtár**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Leírás**: A RAG chat minta Java verziója Langchain4J-vel az AI koordinációhoz. Támogatja a mikroszolgáltatás-alapú eseményvezérelt architektúrát, többféle keresési stratégiát (szöveg, vektor, hibrid), dokumentum feltöltést Azure Document Intelligencével és telepítést Azure Container Apps vagy Azure Kubernetes Service szolgáltatásokra.

**Gyors indítás**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Vállalati kiskereskedelmi copilot Azure AI Foundry-val

**Könyvtár**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Szolgáltatások**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Leírás**: Teljes körű kiskereskedelmi RAG copilot Azure AI Foundry-val és Prompty-val. Egy Contoso Outdoor kereskedelmi chatbot, amely válaszait termékkatalógus és vásárlói rendelés adatok alapján adja. Bemutatja a teljes GenAIOps munkafolyamatot — prototípuskészítés Prompty-val, értékelés AI támogatott értékelőkkel, majd telepítés AZD-vel Container Apps-be.

**Gyors indítás**:
```bash
azd init --template contoso-chat
azd up
```

### Kreatív írás több ügynökös alkalmazás

**Könyvtár**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Szolgáltatások**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Leírás**: Több ügynökös példa AI ügynökök koordinációjára Prompty-val. Tartalmaz egy kutató ügynököt (Bing Grounding az Azure AI Agent Service-ben), egy termék ügynököt (Azure AI Search), egy író ügynököt és egy szerkesztő ügynököt, akik együttműködve készítenek jól kutatott cikkeket. CI/CD támogatás GitHub Actions-ban értékeléssel.

**Gyors indítás**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Könyvtár**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Szolgáltatások**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB NoSQL + LangChain.js

**Leírás**: Teljesen serverless RAG chatbot LangChain.js-sel, Azure Functions API-ként és Azure Static Web Apps hosztolással. Azure Cosmos DB-t használ mind vektor tárhelyként, mind chat előzmények adatbázisaként. Lokális fejlesztést támogat Ollama-hoz, költségmentes teszteléshez.

**Gyors indítás**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data megoldásgyorsító

**Könyvtár**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Leírás**: Vállalati szintű RAG megoldásgyorsító admin portállal dokumentum feltöltéshez/kezeléshez, többféle orchestratorral (Semantic Kernel, LangChain, Prompt Flow), beszéd-szöveg funkcióval, Microsoft Teams integrációval, és választható PostgreSQL vagy Cosmos DB háttérrel. Testreszabható kiindulási pont éles RAG forgatókönyvekhez.

**Gyors indítás**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI utazási ügynökök — Több ügynökös MCP koordináció

**Könyvtár**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Szolgáltatások**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP szerverek (.NET, Python, Java, TypeScript)

**Leírás**: Referencia alkalmazás több ügynökös AI koordinációra három keretrendszerrel (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework). Tartalmaz négynyelvű MCP (Model Context Protocol) szervereket, melyek serverless Azure Container Apps-ként futnak OpenTelemetry megfigyeléssel.

**Gyors indítás**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Könyvtár**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Szolgáltatások**: Azure AI Services + Azure OpenAI

**Leírás**: Minimális Bicep sablon, amely telepíti az Azure AI szolgáltatásokat konfigurált gépi tanulási modellekkel. Könnyű kiindulópont, ha csak az Azure AI infrastruktúra szükséges, teljes alkalmazásstack nélkül.

**Gyors indítás**:
```bash
azd init --template azd-ai-starter
azd up
```

> **További sablonok böngészése**: Látogass el az [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) oldalra, ahol több mint 80 AI-specifikus AZD sablon található különböző nyelveken és forgatókönyvekben.

## Következő lépések

1. **Próbáld ki a példákat**: Kezdj egy előre elkészített sablonnal, amely megfelel az igényeidnek
2. **Személyre szabás**: Módosítsd az infrastruktúrát és az alkalmazáskódot
3. **Add hozzá a monitoringot**: Valósíts meg teljes körű megfigyelhetőséget
4. **Optimalizáld a költségeket**: Finomhangold a beállításokat a költségvetésedhez
5. **Biztosítsd a telepítést**: Alkalmazz vállalati szintű biztonsági mintákat
6. **Skálázás éles környezetre**: Adj hozzá több régiót és nagy rendelkezésre állást

## 🎯 Gyakorlati feladatok

### 1. gyakorlat: Microsoft Foundry Models chat alkalmazás telepítése (30 perc)
**Cél**: Éles, AI-alapú chat alkalmazás telepítése és tesztelése

```bash
# Inicializálja a sablont
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Környezeti változók beállítása
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Telepítés
azd up

# Az alkalmazás tesztelése
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# AI műveletek figyelése
azd monitor

# Tisztítás
azd down --force --purge
```

**Siker kritériumok:**
- [ ] A telepítés kvóta hiba nélkül lefut
- [ ] Elérhető a chat felület a böngészőben
- [ ] Lehet kérdéseket feltenni és AI válaszokat kapni
- [ ] Application Insights megjeleníti a telemetria adatokat
- [ ] Erőforrások sikeres takarítása

**Becsült költség**: 5-10 USD 30 perc tesztelésért

### 2. gyakorlat: Többmodell telepítés konfigurálása (45 perc)
**Cél**: Több AI modell telepítése eltérő konfigurációkkal

```bash
# Egyéni Bicep konfiguráció létrehozása
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

# Telepítés és ellenőrzés
azd provision
azd show
```

**Siker kritériumok:**
- [ ] Több modell sikeresen telepítve
- [ ] Eltérő kapacitás beállítások alkalmazva
- [ ] Modellek elérhetők API-n keresztül
- [ ] Mindkét modell hívható az alkalmazásból

### 3. gyakorlat: Költségfigyelés bevezetése (20 perc)
**Cél**: Költségkeret riasztások és költségkövetés beállítása

```bash
# Költségkeret figyelmeztetés hozzáadása a Bicep-hez
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

# Költségkeret figyelmeztetés telepítése
azd provision

# Aktuális költségek ellenőrzése
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Siker kritériumok:**
- [ ] Költségkeret-riasztás létrehozva az Azure-ban
- [ ] E-mail értesítések konfigurálva
- [ ] Költés adat megtekinthető az Azure Portálban
- [ ] Költségküszöbök megfelelően beállítva

## 💡 Gyakran ismételt kérdések

<details>
<summary><strong>Hogyan csökkentsem a Microsoft Foundry Models költségeit fejlesztés közben?</strong></summary>

1. **Használj ingyenes csomagot**: A Microsoft Foundry Models havonta 50 000 token ingyenes
2. **Csökkentsd a kapacitást**: Állíts kapacitást 10 TPM-re fejlesztéshez a 30+ helyett
3. **Használd az azd down parancsot**: Szabadítsd fel az erőforrásokat, amikor nem fejlesztesz
4. **Implementálj gyorsítótárat**: Redis cache az ismétlődő lekérdezésekhez
5. **Használj prompt-mérnökséget**: Csökkentsd a token felhasználást hatékony promptokkal

```bash
# Fejlesztési konfiguráció
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mi a különbség a Microsoft Foundry Models és az OpenAI API között?</strong></summary>

**Microsoft Foundry Models**:
- Vállalati szintű biztonság és megfelelőség
- Privát hálózati integráció
- SLA garanciák
- Kezelt identitás alapú hitelesítés
- Magasabb elérhető kvóták

**OpenAI API**:
- Gyorsabb hozzáférés az új modellekhez
- Egyszerűbb beállítás
- Alacsonyabb belépési küszöb
- Csak nyilvános internet

Éles alkalmazásokhoz **ajánlott a Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Hogyan kezeljem a Microsoft Foundry Modellek kvóta túllépési hibáit?</strong></summary>

```bash
# Ellenőrizze az aktuális kvótát
az cognitiveservices usage list --location eastus2

# Próbáljon meg más régiót
azd env set AZURE_LOCATION westus2
azd up

# Ideiglenesen csökkentse a kapacitást
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kérjen kvótaemelést
# Lépjen az Azure Portalra > Kvóták > Emelés kérése
```
</details>

<details>
<summary><strong>Használhatok saját adatokat a Microsoft Foundry Modelleknél?</strong></summary>

Igen! Használd az **Azure AI Search**-t RAG-hez (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Lásd az [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) sablont.
</details>

<details>
<summary><strong>Hogyan védjem meg az AI modell végpontokat?</strong></summary>

**Legjobb gyakorlatok**:
1. Használj Kezelet Identitást (API kulcsok nélkül)
2. Engedélyezd a Privát Végpontokat
3. Állítsd be a hálózati biztonsági csoportokat
4. Implementálj sebességkorlátozást
5. Használd az Azure Key Vault-ot a titkokhoz

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

## Közösség és Támogatás

- **Microsoft Foundry Discord**: [#Azure csatorna](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémák és beszélgetések](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Hivatalos dokumentáció](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry képesség a skills.sh-en](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Telepítsd az Azure + Foundry agent képességeket a szerkesztődbe a `npx skills add microsoft/github-copilot-for-azure` paranccsal

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-First Fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első project](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI Modell telepítés](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Segítségre van szükséged?** Csatlakozz a közösségi beszélgetésekhez vagy nyiss egy problémát a repóban. Az Azure AI + AZD közösség itt van, hogy segítsen a sikerben!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:
Ezt a dokumentumot az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatás segítségével fordítottuk. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvű változata tekintendő a hiteles forrásnak. Kritikus információk esetén szakmai emberi fordítást javasolunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->