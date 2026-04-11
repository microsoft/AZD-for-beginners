# Microsoft Foundry integráció az AZD-vel

**Fejezet navigáció:**
- **📚 Tanfolyam főoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet – AI-első fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI modell telepítése](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Áttekintés

Ez az útmutató bemutatja, hogyan integrálható a Microsoft Foundry szolgáltatás az Azure Developer CLI-vel (AZD) az AI alkalmazások egyszerűbb telepítéséhez. A Microsoft Foundry egy átfogó platform AI alkalmazások építésére, telepítésére és kezelésére, míg az AZD leegyszerűsíti az infrastruktúrát és a telepítési folyamatot.

## Mi az a Microsoft Foundry?

A Microsoft Foundry a Microsoft egységes AI fejlesztési platformja, amely tartalmazza:

- **Modell katalógus**: Hozzáférés a legkorszerűbb AI modellekhez
- **Prompt Flow**: Vizualizált tervező AI munkafolyamatokhoz
- **Microsoft Foundry portál**: Integrált fejlesztői környezet AI alkalmazásokhoz
- **Telepítési opciók**: Többféle hosztolási és skálázási lehetőség
- **Biztonság és védelem**: Beépített felelős AI funkciók

## AZD + Microsoft Foundry: Jobban együtt

| Jellemző | Microsoft Foundry | AZD integráció előnye |
|---------|-----------------|------------------------|
| **Modell telepítés** | Kézi portálon keresztüli telepítés | Automatizált, ismételhető telepítések |
| **Infrastruktúra** | Kattintásos előkészítés | Infrastruktúra kódként (Bicep) |
| **Környezetkezelés** | Egyetlen környezet fókusz | Többkörnyezetes (fejlesztés/teszt/prod) |
| **CI/CD integráció** | Korlátozott | Beépített GitHub Actions támogatás |
| **Költségkezelés** | Alap monitorozás | Környezet specifikus költségoptimalizálás |

## Előfeltételek

- Azure előfizetés megfelelő jogosultságokkal
- Azure Developer CLI telepítve
- Hozzáférés a Microsoft Foundry Models szolgáltatásokhoz
- Alapvető ismeretek a Microsoft Foundry-ról

> **Jelenlegi AZD verzió:** Ezeket a példákat a `azd` `1.23.12` verzióján teszteltük. Az AI ügynök munkafolyamathoz használd az aktuális előzetes bővítmény verziót, és kezdés előtt ellenőrizd a telepített verziódat.

## Alapvető integrációs minták

### Minta 1: Microsoft Foundry Models integráció

**Használati eset**: Csevegő alkalmazások telepítése Microsoft Foundry Models modellekkel

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

### Minta 2: AI keresés + RAG integráció

**Használati eset**: Keresés-alapú generálás (RAG) alkalmazások telepítése

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

**Használati eset**: Dokumentum feldolgozó és elemző munkafolyamatok

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

**Termelési konfiguráció:**
```bash
# Alapvető AI szolgáltatások
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Modellkonfigurációk
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Teljesítménybeállítások
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Fejlesztési konfiguráció:**
```bash
# Költségoptimalizált beállítások fejlesztéshez
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

### AZD bővítmények a Foundry-hoz

Az AZD bővítmények AI-specifikus képességeket adnak a Microsoft Foundry szolgáltatásokhoz való munkához:

```bash
# Telepítse a Foundry ügynökök kiterjesztését
azd extension install azure.ai.agents

# Telepítse a finomhangoló kiterjesztést
azd extension install azure.ai.finetune

# Telepítse az egyedi modellek kiterjesztését
azd extension install azure.ai.models

# Listázza a telepített kiterjesztéseket
azd extension list --installed

# Ellenőrizze a jelenleg telepített ügynök kiterjesztés verzióját
azd extension show azure.ai.agents
```

Az AI bővítmények továbbra is gyorsan fejlődnek előzetes állapotban. Ha egy parancs máshogy viselkedik, mint itt leírva, frissítsd a vonatkozó bővítményt, mielőtt a projekt hibajavításába kezdenél.

### Ügynök-első telepítés `azd ai`-vel

Ha van ügynök manifest fájlod, használd az `azd ai agent init` parancsot, hogy a projektet a Foundry Agent Service-hez kötve scaffoldold:

```bash
# Inicializálás egy ügynök manifestből
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Telepítés Azure-ra
azd up
```

A `azure.ai.agents` nemrég megjelent előzetes verziója sablon-alapú inicializációs támogatást is adott az `azd ai agent init` számára. Ha újabb ügynök mintákat követsz, nézd meg a bővítmény súgóját a telepített verziódban elérhető pontos flag-ekhez.

Teljes parancs referencia és opciók a [AZD AI CLI parancsainál](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Egy parancsos telepítés

```bash
# Minden telepítése egy parancssal
azd up

# Vagy fokozatos telepítés
azd provision  # Csak infrastruktúra
azd deploy     # Csak alkalmazás

# Hosszú futású AI alkalmazástelepítésekhez az azd 1.23.11+ verzióban
azd deploy --timeout 1800
```

### Környezet specifikus telepítések

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

### Managed Identity konfiguráció

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

## Teljesítmény optimalizáció

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

### Autómatikusan skálázás konfigurációja

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

## Gyakori problémák elhárítása

### Probléma 1: OpenAI kvóta túllépés

**Tünetek:**
- A telepítés kvóta hibával megszakad
- 429-es hibák az alkalmazás naplójában

**Megoldások:**
```bash
# Ellenőrizze a jelenlegi kvótahasználatot
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
- 401/403-as hibák AI szolgáltatások hívásakor
- "Hozzáférés megtagadva" üzenetek

**Megoldások:**
```bash
# Ellenőrizze a szerepkör-hozzárendeléseket
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Vizsgálja meg a kezelt identitás beállításait
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Érvényesítse a Key Vault hozzáférést
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probléma 3: Modell telepítési gondok

**Tünetek:**
- Modellek nem elérhetők telepítéskor
- Bizonyos modell verziók hibásan működnek

**Megoldások:**
```bash
# Modellek elérhetőségének listázása régiónként
az cognitiveservices model list --location eastus

# Model verzió frissítése bicep sablonban
# Modell kapacitás követelmények ellenőrzése
```

## Példa sablonok

### RAG Csevegőalkalmazás (Python)

**Tároló**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Leírás**: Az egyik legnépszerűbb Azure AI minta — egy éles RAG csevegőalkalmazás, amely lehetővé teszi, hogy saját dokumentumaidra kérdezz rá. GPT-4.1-mini-t használ chathez, text-embedding-3-large-ot az embeddingekhez, és Azure AI Search-t a kereséshez. Támogatja a multimodális dokumentumokat, beszéd bemenet/kimenetet, Microsoft Entra hitelesítést és Application Insights nyomkövetést.

**Gyors kezdés**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Csevegőalkalmazás (.NET)

**Tároló**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Leírás**: A Python RAG chat mintának .NET/C# megfelelője. ASP.NET Core Minimal API és Blazor WebAssembly frontenddel. Tartalmaz hang alapú csevegést, GPT-4o-mini látási támogatást, valamint egy .NET MAUI Blazor Hybrid asztali/mobil klienst.

**Gyors kezdés**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Csevegőalkalmazás (Java)

**Tároló**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Leírás**: A RAG chat minta Java verziója Langchain4J-vel az AI szervezéshez. Támogatja a mikroszolgáltatás esemény-vezérelt architektúrát, több keresési stratégiát (szöveg, vektor, hibrid), dokumentumfeltöltést Azure Document Intelligence segítségével, valamint telepíthető Azure Container Appsekre vagy Azure Kubernetes Service-re.

**Gyors kezdés**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Vállalati kiskereskedelmi copilot Azure AI Foundry-val

**Tároló**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Szolgáltatások**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Leírás**: Teljes körű kiskereskedelmi RAG copilot Azure AI Foundry-val és Prompty-val. Egy Contoso Outdoor kiskereskedő chatbotja, amely válaszait termékkatalógusokra és ügyfél rendelési adatokra alapozza. Bemutatja a teljes GenAIOps munkafolyamatot — prototípus készítés Prompty-val, értékelés AI-támogatott értékelőkkel, majd telepítés AZD-vel Container Apps-re.

**Gyors kezdés**:
```bash
azd init --template contoso-chat
azd up
```

### Kreatív írás Többügynökös alkalmazás

**Tároló**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Szolgáltatások**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Leírás**: Többügynökös minta az AI ügynökök összefogására Prompty-val. Használ kutató ügynököt (Bing Grounding az Azure AI Agent Service-ben), termék ügynököt (Azure AI Search), író és szerkesztő ügynököket, amelyek együttműködve állítanak elő jól kutatott cikkeket. Tartalmaz CI/CD-t GitHub Actions-ben történő értékeléssel.

**Gyors kezdés**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Tároló**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Szolgáltatások**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Leírás**: Teljesen szervertelen RAG chatbot LangChain.js-sel, Azure Functions API-val és Azure Static Web Apps hosztolással. Azure Cosmos DB-t használ vektor tárolónak és csevegési előzmények adatbázisának. Támogatja a helyi fejlesztést Ollama-val nulla költségű teszteléshez.

**Gyors kezdés**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat az adataiddal megoldásgyorsító

**Tároló**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Leírás**: Vállalati szintű RAG megoldásgyorsító admin portállal dokumentum feltöltés/kezeléshez, számos orkestrációs opcióval (Semantic Kernel, LangChain, Prompt Flow), beszéd-szöveg átalakítóval, Microsoft Teams integrációval, valamint PostgreSQL vagy Cosmos DB backend választási lehetőséggel. Testreszabható indulópont éles RAG forgatókönyvekhez.

**Gyors kezdés**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI utazási ügynökök — Többügynökös MCP szerverek összefogása

**Tároló**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Szolgáltatások**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP szerverek (.NET, Python, Java, TypeScript)

**Leírás**: Referencia alkalmazás többügynökös AI összefogásra három keretrendszerrel (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework). Tartalmaz MCP (Model Context Protocol) szervereket négy nyelven, szervertelen Azure Container Appsként telepítve OpenTelemetry monitorozással.

**Gyors kezdés**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Tároló**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Szolgáltatások**: Azure AI szolgáltatások + Azure OpenAI

**Leírás**: Egy minimális Bicep sablon, ami telepíti az Azure AI szolgáltatásokat konfigurált gépi tanulási modellekkel. Könnyű indulópont, amikor csak az Azure AI infrastruktúrát szeretnéd előkészíteni, teljes alkalmazásréteg nélkül.

**Gyors kezdés**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Nézz meg több sablont**: Látogass el az [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) oldalra, ahol 80+ AI-specifikus AZD sablont találsz különböző nyelveken és forgatókönyvekhez.

## Következő lépések

1. **Próbáld ki a példákat**: Kezdd egy előre elkészített sablonnal, amely illik a használati esetedhez
2. **Testreszabás**: Módosítsd az infrastruktúrát és az alkalmazáskódot
3. **Add hozzá a monitorozást**: Valósíts meg teljes körű megfigyelhetőséget
4. **Optimalizáld a költségeket**: Hangold finomra a konfigurációkat a költségvetésedhez
5. **Biztosítsd a telepítést**: Vezess be vállalati biztonsági mintákat
6. **Skálázz éles környezetbe**: Adj hozzá több régiós és magas rendelkezésre állási funkciókat

## 🎯 Gyakorlati feladatok

### 1. gyakorlat: Microsoft Foundry Models csevegőalkalmazás telepítése (30 perc)
**Cél**: Éles AI csevegőalkalmazás telepítése és tesztelése

```bash
# Sablon inicializálása
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

# Az AI műveleteinek figyelése
azd monitor

# Takarítás
azd down --force --purge
```

**Siker kritériumok:**
- [ ] Telepítés kvóta hibák nélkül befejeződik
- [ ] Hozzáférés biztosított a csevegő felülethez böngészőben
- [ ] Kérdéseket lehet feltenni, AI által támogatott válaszokat kapni
- [ ] Az Application Insights adatokat rögzít
- [ ] Erőforrások sikeres eltávolítása

**Becsült költség**: $5-10 30 perc tesztelésre

### 2. gyakorlat: Többmodell telepítés konfigurálása (45 perc)
**Cél**: Több AI modell telepítése eltérő beállításokkal

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
- [ ] Különböző kapacitás beállítások érvényesítve
- [ ] Modellek API-n keresztül elérhetők
- [ ] Mindkét modell hívható az alkalmazásból

### 3. gyakorlat: Költségfigyelés beállítása (20 perc)
**Cél**: Költségfigyelési riasztások és nyomon követés beállítása

```bash
# Költségvetési riasztás hozzáadása Bicep-hez
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

# Költségvetési riasztás telepítése
azd provision

# Az aktuális költségek ellenőrzése
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Siker kritériumok:**
- [ ] Költségkeret riasztás létrehozva az Azure-ban
- [ ] E-mail értesítések konfigurálva
- [ ] Költségadatok megtekinthetők az Azure Portalban
- [ ] Költségkeret küszöbértékek megfelelően beállítva

## 💡 Gyakran ismételt kérdések

<details>
<summary><strong>Hogyan csökkenthetem a Microsoft Foundry Models költségeit fejlesztés során?</strong></summary>

1. **Használd az ingyenes szintet**: A Microsoft Foundry Models 50,000 token/hó ingyenes keretet ad
2. **Csökkentsd a kapacitást**: Állítsd a kapacitást fejlesztéshez 10 TPM-re a 30+ helyett
3. **Használd az azd down parancsot**: Amikor nem fejlesztesz aktívan, szabadítsd fel az erőforrásokat
4. **Gyorsítótárazd a válaszokat**: Valósíts meg Redis cache-t az ismétlődő lekérdezésekhez
5. **Használj prompt-mérnökséget**: Hatékony promptokkal csökkentsd a token felhasználást
```bash
# Fejlesztési konfiguráció
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mi a különbség a Microsoft Foundry Modelleket és az OpenAI API között?</strong></summary>

**Microsoft Foundry Modelleket**:
- Vállalati biztonság és megfelelőség
- Privát hálózati integráció
- SLA garanciák
- Kezelt identitás hitelesítés
- Magasabb kvóták elérhetők

**OpenAI API**:
- Gyorsabb hozzáférés az új modellekhez
- Egyszerűbb beállítás
- Alacsonyabb belépési korlát
- Csak nyilvános internet

Termelési alkalmazásokhoz a **Microsoft Foundry Modelleket javasolt** használni.
</details>

<details>
<summary><strong>Hogyan kezeljem a Microsoft Foundry Modellekkel kapcsolatos kvóta túllépés hibákat?</strong></summary>

```bash
# Ellenőrizze az aktuális kvótát
az cognitiveservices usage list --location eastus2

# Próbáljon ki másik régiót
azd env set AZURE_LOCATION westus2
azd up

# Átmenetileg csökkentse a kapacitást
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Igényeljen kvóta növelést
# Menjen az Azure Portálra > Kvóták > Növelés igénylése
```
</details>

<details>
<summary><strong>Használhatok saját adatokat a Microsoft Foundry Modellekkel?</strong></summary>

Igen! Használd az **Azure AI Search**-t az RAG (Retrieval Augmented Generation) számára:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Nézd meg az [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) sablont.
</details>

<details>
<summary><strong>Hogyan védjem az AI modell végpontokat?</strong></summary>

**Legjobb gyakorlatok**:
1. Használj Kezelt Identitást (nincs API kulcs)
2. Engedélyezd a Privát Végpontokat
3. Állíts be hálózati biztonsági csoportokat
4. Valósíts meg korlátozást sebességre
5. Használj Azure Key Vault-ot titkokhoz

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
- **Agent Skills**: [Microsoft Foundry készség a skills.sh oldalon](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Telepítsd az Azure + Foundry agent készségeket a szerkesztődbe a `npx skills add microsoft/github-copilot-for-azure` paranccsal

---

**Fejezeti navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-központú fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI modell telepítése](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Segítségre van szükséged?** Csatlakozz a közösségi vitáinkhoz vagy nyiss egy problémát a tárolóban. Az Azure AI + AZD közösség itt van, hogy segítsen a sikeredben!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum a saját nyelvén tekintendő hiteles forrásnak. Kiemelten fontos információk esetén javasolt szakmai, emberi fordítást igénybe venni. Nem vállalunk felelősséget az ebből eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->