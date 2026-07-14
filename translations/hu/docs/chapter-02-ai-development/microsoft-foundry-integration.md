# Microsoft Foundry Integráció AZD-vel

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-First fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI modell telepítés](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Áttekintés

Ez az útmutató bemutatja, hogyan integráljuk a Microsoft Foundry szolgáltatásokat az Azure Developer CLI-vel (AZD) az AI alkalmazások gördülékeny telepítéséhez. A Microsoft Foundry átfogó platformot nyújt AI alkalmazások építéséhez, telepítéséhez és kezeléséhez, míg az AZD leegyszerűsíti az infrastruktúra és a telepítés folyamatát.

## Mi az a Microsoft Foundry?

A Microsoft Foundry a Microsoft egységes AI fejlesztő platformja, amely magában foglalja:

- **Modell katalógus**: Hozzáférés a legkorszerűbb AI modellekhez
- **Prompt Flow**: Vizualis tervező AI munkafolyamatokhoz
- **Microsoft Foundry portál**: Integrált fejlesztői környezet AI alkalmazásokhoz
- **Telepítési lehetőségek**: Többféle hosztolási és skálázási opció
- **Biztonság és felelősség**: Beépített felelős AI funkciók

## AZD + Microsoft Foundry: Jobban együtt

| Funkció | Microsoft Foundry | AZD integráció előnye |
|---------|-----------------|------------------------|
| **Modell telepítés** | Kézi portál telepítés | Automatikus, ismételhető telepítések |
| **Infrastruktúra** | Kattintásos provisioning | Infrastruktúra kód formájában (Bicep) |
| **Környezeti menedzsment** | Egyetlen környezet fókusz | Többkörnyezetes (fejlesztés/staging/éles) |
| **CI/CD integráció** | Korlátozott | Natív GitHub Actions támogatás |
| **Költség menedzsment** | Alapvető monitorozás | Környezet-specifikus költségoptimalizáció |

## Előfeltételek

- Azure előfizetés megfelelő jogosultságokkal
- Azure Developer CLI telepítve
- Hozzáférés a Microsoft Foundry Modellek szolgáltatásaihoz
- Alapvető ismeretek a Microsoft Foundry-val kapcsolatban

> **Jelenlegi AZD verzió:** Ezeket a példákat a `azd` `1.27.1` verzióval ellenőriztük. Az AI ügynök munkafolyamathoz az aktuális előzetes bővítmény verziót használd, és telepítés előtt ellenőrizd a verziódat.

## Alapvető integrációs minták

### Minta 1: Microsoft Foundry Modellek Integrációja

**Használati eset**: Chat alkalmazások telepítése Microsoft Foundry Modellek modellekkel

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

### Minta 2: AI Keresés + RAG Integráció

**Használati eset**: Lekérdezés-alapú generálás (RAG) alkalmazások telepítése

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

### Minta 3: Dokumentumintelligencia integráció

**Használati eset**: Dokumentumfeldolgozási és elemzési munkafolyamatok

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
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

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

### Biztonságos konfiguráció Key Vault-tal

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

### AZD bővítmények Foundry-hoz

Az AZD bővítményeket kínál, amelyek AI-specifikus képességeket adnak hozzá a Microsoft Foundry szolgáltatások kezeléséhez:

```bash
# Telepítse a Foundry ügynökök bővítményt
azd extension install azure.ai.agents

# Telepítse a finomhangolás bővítményt
azd extension install azure.ai.finetune

# Telepítse az egyedi modellek bővítményt
azd extension install azure.ai.models

# Telepítse a telepített bővítmények listáját
azd extension list --installed

# Vizsgálja meg az aktuálisan telepített ügynök bővítmény verzióját
azd extension show azure.ai.agents
```

Az AI bővítmények még gyorsan fejlődnek az előzetes verzióban. Ha egy parancs nem a leírtak szerint viselkedik, frissítsd a megfelelő bővítményt, mielőtt a projektet hibakeresnéd.

### Ügynök-első telepítés `azd ai`-val

Ha van ügynök manifest fájlod, használd az `azd ai agent init` parancsot, hogy Foundry Ügynök Szolgáltatáshoz kapcsolódó projektet állíts elő:

```bash
# Inicializálás egy ügynök-manifesztből
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Telepítés az Azure-ra
azd up
```

A legfrissebb `azure.ai.agents` előzetes kiadások sablon-alapú inicializálást is támogatnak az `azd ai agent init` számára. Ha újabb ügynök mintákat követsz, ellenőrizd a bővítmény súgóját a telepített verziód elérhető kapcsolóiért.

Lásd a [AZD AI CLI parancsokat](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) a teljes parancs referencia és kapcsolókért.

### Egyparancsos telepítés

```bash
# Mindent egy parancssal telepíts
azd up

# Vagy telepíts lépésenként
azd provision  # Csak infrastruktúra
azd deploy     # Csak alkalmazás

# Hosszú ideig futó AI alkalmazástelepítésekhez az azd 1.23.11+ verzióban
azd deploy --timeout 1800
```

### Környezet-specifikus telepítések

```bash
# Fejlesztői környezet
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

## Monitorozás és megfigyelhetőség

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

### Autómatikusskálázás konfiguráció

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
- A telepítés kvóta hibákkal megszakad
- 429-es hibák az alkalmazás naplókban

**Megoldások:**
```bash
# Ellenőrizze az aktuális kvótahasználatot
az cognitiveservices usage list --location eastus

# Próbáljon ki másik régiót
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
# Ellenőrizze a szerepkör-hozzárendeléseket
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ellenőrizze a kezelt identitás konfigurációját
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Érvényesítse a Key Vault hozzáférést
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probléma 3: Modell telepítési problémák

**Tünetek:**
- Modellek nem elérhetők a telepítésben
- Egyes modell verziók hibáznak

**Megoldások:**
```bash
# A régió szerinti elérhető modellek listázása
az cognitiveservices model list --location eastus

# Modell verzió frissítése a bicep sablonban
# Ellenőrizze a modell kapacitáskövetelményeit
```

## Példa sablonok

### RAG csevegőalkalmazás (Python)

**Tárhely**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Leírás**: A legnépszerűbb Azure AI példa — egy éles RAG csevegőalkalmazás, amely lehetővé teszi, hogy kérdéseket tegyél fel a saját dokumentumaidról. GPT-4.1-mini a csevegéshez, text-embedding-3-large az embeddingekhez, és Azure AI Search a kereséshez. Támogatja multimodális dokumentumokat, beszéd be- és kimenetet, Microsoft Entra hitelesítést és Application Insights nyomkövetést.

**Gyors kezdés**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG csevegőalkalmazás (.NET)

**Tárhely**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Leírás**: A Python RAG csevegőmintájának .NET/C# megfelelője. ASP.NET Core Minimal API és Blazor WebAssembly frontenddel építve. Tartalmaz hangcsevegést, GPT-4o-mini látássupportot, és egy .NET MAUI Blazor Hybrid asztali/mobil kliens társprogramot.

**Gyors kezdés**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG csevegőalkalmazás (Java)

**Tárhely**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Leírás**: A RAG csevegő minta Java verziója, AI koordinációhoz Langchain4J-t használva. Támogatja a mikroszolgáltatás alapú eseményvezérelt architektúrát, több keresési stratégiát (szöveg, vektor, hibrid), dokumentumfeltöltést Azure Document Intelligence-n keresztül, és telepíthető Azure Container Apps-re vagy Azure Kubernetes Service-re.

**Gyors kezdés**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot a Microsoft Foundry-val

**Tárhely**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Szolgáltatások**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Leírás**: Teljes értékű retail RAG copilot a Microsoft Foundry és Prompty használatával. Contoso Outdoor kiskereskedelmi chatbot, amely a válaszokat a termékkatalógus és ügyfélrendelési adatok alapján generálja. Bemutatja a teljes GenAIOps munkafolyamatot — prototípuskészítés Prompty-val, értékelés AI-asszisztált értékelőkkel, és telepítés AZD-vel Container Apps-re.

**Gyors kezdés**:
```bash
azd init --template contoso-chat
azd up
```

### Kreatív írás többügynökös alkalmazás

**Tárhely**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Szolgáltatások**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Leírás**: Többügynökös minta, amely az AI ügynökök összehangolását demonstrálja Prompty-val. Tartalmaz egy kutató ügynököt (Bing Grounding az Azure AI Agent Service-ben), egy termék ügynököt (Azure AI Search), egy író ügynököt és egy szerkesztő ügynököt, akik együttműködve készítenek jól kutatott cikkeket. Tartalmaz CI/CD-t a GitHub Actions-ben történő értékeléssel.

**Gyors kezdés**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG csevegő (JavaScript/TypeScript)

**Tárhely**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Szolgáltatások**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB NoSQL + LangChain.js

**Leírás**: Teljesen szerver nélküli RAG chatbot LangChain.js használatával, Azure Functions API-val és Azure Static Web Apps hosztolással. Az Azure Cosmos DB szolgál vektor-tárolóként és csevegési előzmény adatbázisként. Támogatja a helyi fejlesztést Ollama-val költségmentes teszteléshez.

**Gyors kezdés**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat a saját adatoddal megoldás gyorsító

**Tárhely**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Leírás**: Vállalati szintű RAG megoldás gyorsító admin portállal dokumentum feltöltéshez/kezeléshez, többféle orchestrator opcióval (Semantic Kernel, LangChain, Prompt Flow), beszéd-szöveg funkcióval, Microsoft Teams integrációval, valamint PostgreSQL vagy Cosmos DB háttérrel. Testreszabható kiindulópont éles RAG forgatókönyvekhez.

**Gyors kezdés**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI utazási ügynökök — Többügynökös MCP koordináció

**Tárhely**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Szolgáltatások**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP szerverek (.NET, Python, Java, TypeScript)

**Leírás**: Referencia alkalmazás többügynökös AI koordinációhoz három keretrendszerrel (LangChain.js, LlamaIndex.TS és Microsoft Agent Framework). Négy nyelven MCP (Model Context Protocol) szerverek, szerver nélküli Azure Container Apps-ben telepítve, OpenTelemetry monitorozással.

**Gyors kezdés**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Tárhely**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Szolgáltatások**: Azure AI szolgáltatások + Azure OpenAI

**Leírás**: Minimalista Bicep sablon, amely Azure AI szolgáltatásokat telepít konfigurált gépi tanulási modellekkel. Közvetlen kiindulópont, amikor csak az Azure AI infrastruktúrát szeretnéd előkészíteni, teljes alkalmazás stack nélkül.

**Gyors kezdés**:
```bash
azd init --template azd-ai-starter
azd up
```

> **További sablonok böngészése**: Látogasd meg az [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) oldalt, ahol 80+ AI-specifikus AZD sablon található különböző nyelveken és forgatókönyvekhez.

## Következő lépések

1. **Próbáld ki a példákat**: Kezdd egy előre elkészített sablonnal, ami megfelel az esetednek
2. **Személyre szabás**: Módosítsd az infrastruktúrát és az alkalmazáskódot
3. **Monitorozás hozzáadása**: Kiterjedt megfigyelhetőség megvalósítása
4. **Költségoptimalizálás**: Finomhangold a konfigurációt a költségvetésedhez
5. **Biztonságos telepítés**: Vállalati biztonsági minták megvalósítása
6. **Éles skálázás**: Több régió és magas rendelkezésre állás funkciók hozzáadása

## 🎯 Gyakorlati feladatok

### Feladat 1: Microsoft Foundry Modellek csevegőalkalmazás telepítése (30 perc)
**Cél**: Telepíts és tesztelj egy éles AI csevegőalkalmazást

```bash
# Sablon inicializálása
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Környezeti változók beállítása
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Telepítés
azd up

# Alkalmazás tesztelése
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Az AI műveletek figyelése
azd monitor

# Takarítás
azd down --force --purge
```

**Siker kritériumok:**
- [ ] A telepítés kvóta hibák nélkül befejeződik
- [ ] Böngészőben elérhető a csevegőfelület
- [ ] Kérdéseket lehet feltenni és AI-vezérelt válaszokat kapni
- [ ] Application Insights-ban látszik a telemetria adat
- [ ] Sikeresen törlődtek az erőforrások

**Becsült költség**: 5-10 USD 30 perces teszteléshez

### Feladat 2: Többmodell telepítés konfigurálása (45 perc)
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

# Telepítés és ellenőrzés
azd provision
azd show
```

**Siker kritériumok:**
- [ ] Több modell sikeresen telepítve
- [ ] Különböző kapacitásbeállítások alkalmazva
- [ ] Modellek elérhetők API-n keresztül
- [ ] Mindkét modellt hívni tudja az alkalmazás

### Feladat 3: Költségfigyelő bevezetése (20 perc)
**Cél**: Költségkeret-értesítések és költségkövetés beállítása

```bash
# Költségkeret-riasztás hozzáadása a Bicephez
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

# Költségkeret-riasztás telepítése
azd provision

# Aktuális költségek ellenőrzése
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Siker kritériumok:**
- [ ] Költségkeret értesítés létrehozva az Azure-ban
- [ ] E-mail értesítések beállítva
- [ ] Költségadatok megtekinthetők az Azure Portalon
- [ ] Költségkeret küszöbértékek helyesen beállítva

## 💡 Gyakran ismételt kérdések

<details>
<summary><strong>Hogyan csökkenthetem a Microsoft Foundry Modellek költségeit fejlesztés közben?</strong></summary>

1. **Használd az ingyenes réteget**: A Microsoft Foundry Modellek havi 50,000 token ingyenes
2. **Csökkentsd a kapacitást**: Állítsd be a kapacitást 10 TPM-re a 30+ helyett fejlesztéshez
3. **Használd az azd down parancsot**: Erőforrások felszabadítása, amikor nem fejlesztesz aktívan
4. **Gyorsítótárazd a válaszokat**: Redis cache bevezetése ismétlődő lekérdezésekhez
5. **Használj promt tervezést**: Csökkentsd a tokenhasználatot hatékony promptokkal


```bash
# Fejlesztési konfiguráció
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mi a különbség a Microsoft Foundry modellek és az OpenAI API között?</strong></summary>

**Microsoft Foundry modellek**:
- Vállalati szintű biztonság és megfelelőség
- Privát hálózati integráció
- SLA garanciák
- Kezelt azonosítók hitelesítése
- Magasabb kvóták elérhetőek

**OpenAI API**:
- Gyorsabb hozzáférés az új modellekhez
- Egyszerűbb beállítás
- Alacsonyabb belépési korlát
- Csak nyilvános internet

Termelő alkalmazásokhoz **a Microsoft Foundry modellek ajánlottak**.
</details>

<details>
<summary><strong>Hogyan kezeljem a Microsoft Foundry modellek kvóta túllépési hibáit?</strong></summary>

```bash
# Aktuális kvóta ellenőrzése
az cognitiveservices usage list --location eastus2

# Próbáljon ki másik régiót
azd env set AZURE_LOCATION westus2
azd up

# Kapacitás ideiglenes csökkentése
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kvóta növelésének igénylése
# Lépjen az Azure Portalra > Kvóták > Növelés igénylése
```
</details>

<details>
<summary><strong>Használhatom saját adataimat a Microsoft Foundry modellekkel?</strong></summary>

Igen! Használd az **Azure AI Search** szolgáltatást RAG-hoz (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Lásd a [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) sablont.
</details>

<details>
<summary><strong>Hogyan biztosítsam az AI modell végpontokat?</strong></summary>

**Legjobb gyakorlatok**:
1. Használj Kezelt Azonosítót (nincs szükség API kulcsokra)
2. Kapcsold be a Privát Végpontokat
3. Konfiguráld a hálózati biztonsági csoportokat
4. Alkalmazz sebességkorlátozást
5. Használd az Azure Key Vaultot a titkok kezelésére

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

## Közösség és támogatás

- **Microsoft Foundry Discord**: [#Azure csatorna](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémák és viták](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Hivatalos dokumentáció](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill a skills.sh oldalon](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Telepítsd az Azure + Foundry agent skilleket a szerkesztődbe a `npx skills add microsoft/github-copilot-for-azure` paranccsal

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI modell telepítése](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Szükséged van segítségre?** Csatlakozz közösségi beszélgetéseinkhez, vagy nyiss hibajegyet a tárban. Az Azure AI + AZD közösség azért van, hogy segítsen neked sikeres lenni!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->