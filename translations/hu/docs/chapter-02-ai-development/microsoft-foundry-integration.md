# Microsoft Foundry integráció az AZD-vel

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet – AI-első fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI modell telepítés](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Áttekintés

Ez az útmutató bemutatja, hogyan lehet a Microsoft Foundry szolgáltatásokat integrálni az Azure Developer CLI-vel (AZD), hogy egyszerűbbé váljon az AI alkalmazások telepítése. A Microsoft Foundry átfogó platformot kínál AI alkalmazások építéséhez, telepítéséhez és kezeléséhez, míg az AZD leegyszerűsíti az infrastruktúra és telepítés folyamatát.

## Mi az a Microsoft Foundry?

A Microsoft Foundry a Microsoft egységes AI fejlesztői platformja, amely magában foglalja:

- **Modell katalógus**: Hozzáférés a csúcstechnológiás AI modellekhez
- **Prompt Flow**: AI munkafolyamatok vizuális tervezője
- **Microsoft Foundry portál**: Integrált fejlesztői környezet AI alkalmazásokhoz
- **Telepítési lehetőségek**: Többféle hosztolási és skálázási opció
- **Biztonság és védelem**: Beépített felelős AI funkciók

## AZD + Microsoft Foundry: Jobban együtt

| Funkció | Microsoft Foundry | AZD integráció előnye |
|---------|-----------------|----------------------|
| **Modell telepítés** | Kézi portál alapú telepítés | Automatikus, ismételhető telepítések |
| **Infrastruktúra** | Kattintásos előkészítés | Infrastruktúra kód formájában (Bicep) |
| **Környezetkezelés** | Egyetlen környezet fókusz | Többkörnyezetes (fejlesztő/teszt/éles) |
| **CI/CD integráció** | Korlátozott | Natív GitHub Actions támogatás |
| **Költségkezelés** | Alap monitoring | Környezet-specifikus költségoptimalizálás |

## Előfeltételek

- Azure előfizetés megfelelő jogosultságokkal
- Azure Developer CLI telepítve
- Hozzáférés a Microsoft Foundry Modellek szolgáltatásokhoz
- Alapvető ismeretek a Microsoft Foundry-ról

> **Aktuális AZD alapverzió:** Ezeket a példákat a `azd` `1.23.12` verziójával teszteltük. Az AI ügynök munkafolyamathoz használja a legfrissebb előzetes kiegészítést, és ellenőrizze a telepített verziót a kezdés előtt.

## Alapvető integrációs minták

### Minta 1: Microsoft Foundry Modellek integrációja

**Használati eset**: Chat alkalmazások telepítése Microsoft Foundry Modellek használatával

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

### Minta 2: AI Keresés + RAG integráció

**Használati eset**: Hozzáférés-alapú generálás (RAG) alkalmazások telepítése

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
# Alap AI szolgáltatások
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

### AZD kiterjesztések a Foundryhoz

Az AZD kiterjesztéseket kínál, amelyek AI-specifikus funkciókat adnak hozzá a Microsoft Foundry szolgáltatások használatához:

```bash
# A Foundry ügynökök kiterjesztés telepítése
azd extension install azure.ai.agents

# A finomhangolás kiterjesztés telepítése
azd extension install azure.ai.finetune

# A testreszabott modellek kiterjesztés telepítése
azd extension install azure.ai.models

# A telepített kiterjesztések listázása
azd extension list --installed

# Az aktuálisan telepített ügynök kiterjesztés verziójának ellenőrzése
azd extension show azure.ai.agents
```

Az AI kiterjesztések még gyorsan fejlődnek előzetes verzióban. Ha egy parancs máshogy viselkedik, mint itt, frissítse a vonatkozó kiegészítést, mielőtt a projektet hibakeresné.

### Ügynök-első telepítés `azd ai` használatával

Ha rendelkezik ügynök-manifesztummal, használja az `azd ai agent init` parancsot az Foundry Ügynök Szolgáltatáshoz kapcsolódó projekt vázának elkészítéséhez:

```bash
# Inicializálás egy agent manifestből
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Telepítés az Azure-ra
azd up
```

A közelmúltbeli `azure.ai.agents` előzetes kiadások sablon alapú inicializálási támogatást is hozzáadtak az `azd ai agent init` parancshoz. Ha újabb ügynökmintákat követ, nézze meg a kiterjesztés súgóját a telepített verzió pontos kapcsolóiért.

Lásd a [AZD AI CLI parancsokat](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) a teljes parancsreferencia és kapcsolók listájáért.

### Egyparancsos telepítés

```bash
# Minden telepítése egy parancssal
azd up

# Vagy telepítés lépésenként
azd provision  # Csak infrastruktúra
azd deploy     # Csak alkalmazás

# Hosszú ideig futó AI alkalmazások telepítéséhez az azd 1.23.11+ verzióban
azd deploy --timeout 1800
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

## Megfigyelés és láthatóság

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

### Költségmonitorozás

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

### Kezelt identitás beállítása

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

### Automatikus skálázás konfigurációja

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

### Probléma 1: OpenAI kvóta túllépve

**Tünetek:**
- A telepítés kvótahibával meghiúsul
- 429-es hibák az alkalmazásnaplókban

**Megoldások:**
```bash
# Ellenőrizze a jelenlegi kvóta használatot
az cognitiveservices usage list --location eastus

# Próbáljon másik régiót
azd env set AZURE_LOCATION westus2
azd up

# Csökkentse ideiglenesen a kapacitást
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probléma 2: Hitelesítési hibák

**Tünetek:**
- 401/403 hibák az AI szolgáltatások hívásakor
- „Hozzáférés megtagadva” üzenetek

**Megoldások:**
```bash
# Szerepkiosztások ellenőrzése
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Kezelt identitás konfigurációjának ellenőrzése
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Key Vault hozzáférés érvényesítése
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probléma 3: Modell telepítési gondok

**Tünetek:**
- Modellek nem elérhetők a telepítésben
- Egyes modellverziók hibásak

**Megoldások:**
```bash
# Listázza a rendelkezésre álló modelleket régiónként
az cognitiveservices model list --location eastus

# Frissítse a modell verzióját a bicep sablonban
# Ellenőrizze a modell kapacitás követelményeit
```

## Példa sablonok

### RAG chat alkalmazás (Python)

**Tárhely**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Leírás**: Az egyik legnépszerűbb Azure AI példa — egy éles RAG chat alkalmazás, amely lehetővé teszi kérdések feltevését a saját dokumentumai alapján. GPT-4.1-mini chathez, text-embedding-3-large beágyazáshoz és Azure AI Search visszakereséshez használva. Támogat multimodális dokumentumokat, beszéd bemenet/kimenetet, Microsoft Entra hitelesítést és Application Insights nyomkövetést.

**Gyors indítás**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG chat alkalmazás (.NET)

**Tárhely**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Leírás**: A Python RAG chat minta .NET/C# megfelelője. ASP.NET Core Minimal API és Blazor WebAssembly frontenddel készült. Tartalmazza a hang alapú chatet, GPT-4o-mini látástámogatást, valamint egy .NET MAUI Blazor Hybrid asztali/mobil klienst.

**Gyors indítás**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG chat alkalmazás (Java)

**Tárhely**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Leírás**: A RAG chat minta Java verziója, Langchain4J-al az AI összehangoláshoz. Támogat mikroservice eseményvezérelt architektúrát, több keresési stratégiát (szöveg, vektor, hibrid), dokumentumfeltöltést Azure Document Intelligence segítségével, valamint telepítést Azure Container Apps-re vagy Azure Kubernetes Service-re.

**Gyors indítás**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot Microsoft Foundry-val

**Tárhely**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Szolgáltatások**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Leírás**: Végponttól végpontig kiskereskedelmi RAG copilot Microsoft Foundry és Prompty használatával. A Contoso Outdoor kiskereskedő chatbotja, amely válaszait a termékkatalógus és ügyfélrendelés adataira alapozza. Bemutatja a teljes GenAIOps munkafolyamatot — prototípus Prompty-val, értékelés AI segítségével, majd telepítés AZD-vel Container Apps-re.

**Gyors indítás**:
```bash
azd init --template contoso-chat
azd up
```

### Kreatív írás többügynökös alkalmazás

**Tárhely**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Szolgáltatások**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Leírás**: Többügynökös példa, amely AI ügynökök összehangolását mutatja be Prompty-val. Egy kutató ügynök (Bing Grounding az Azure AI Agent Service-ben), egy termékügynök (Azure AI Search), egy író és egy szerkesztő ügynök együttműködve készít alaposan kutatott cikkeket. Tartalmaz CI/CD-t és GitHub Actions-ban történő értékelést.

**Gyors indítás**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Szerver nélküli RAG chat (JavaScript/TypeScript)

**Tárhely**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Szolgáltatások**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB NoSQL + LangChain.js

**Leírás**: Teljesen szerver nélküli RAG chatbott LangChain.js használatával, Azure Functions API-hoz és Azure Static Web Apps hosztoláshoz. Azure Cosmos DB-t használ vektor adattárként és chat előzmény adatbázisként. Támogat helyi fejlesztést Ollama-val ingyenes teszteléshez.

**Gyors indítás**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat az adataiddal megoldásgyorsító

**Tárhely**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Szolgáltatások**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Leírás**: Vállalati szintű RAG megoldásgyorsító admin portállal dokumentum feltöltéshez/kezeléshez, több orchestrator opcióval (Semantic Kernel, LangChain, Prompt Flow), beszédből szövegbe, Microsoft Teams integrációval, és PostgreSQL vagy Cosmos DB háttérrel. Testreszabható indulópont éles RAG forgatókönyvekhez.

**Gyors indítás**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Utazási ügynökök — többügynökös MCP összehangolás

**Tárhely**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Szolgáltatások**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP szerverek (.NET, Python, Java, TypeScript)

**Leírás**: Referenciaalkalmazás többügynökös AI összehangoláshoz három keretrendszer használatával (LangChain.js, LlamaIndex.TS, Microsoft Agent Framework). MCP (Model Context Protocol) szerverek négy nyelven, szerver nélküli Azure Container Apps-ként telepítve, OpenTelemetry monitorozással.

**Gyors indítás**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Tárhely**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Szolgáltatások**: Azure AI szolgáltatások + Azure OpenAI

**Leírás**: Minimális Bicep sablon, amely Azure AI szolgáltatásokat telepít konfigurált gépi tanulási modellekkel. Könnyű kiindulópont, ha csak az Azure AI infrastruktúrát szeretné előkészíteni teljes alkalmazás stack nélkül.

**Gyors indítás**:
```bash
azd init --template azd-ai-starter
azd up
```

> **További sablonok böngészése**: Látogassa meg az [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) oldalt, ahol 80+ AI-specifikus AZD sablon érhető el több nyelven és forgatókönyvben.

## Következő lépések

1. **Próbálja ki a példákat**: Válasszon egy előre elkészített sablont, amely megfelel az igényeinek
2. **Testreszabás**: Módosítsa az infrastruktúrát és az alkalmazáskódot
3. **Monitoring hozzáadása**: Valósítson meg átfogó megfigyelhetőséget
4. **Költségoptimalizálás**: Finomhangolja a konfigurációkat a költségvetéséhez
5. **Telepítés biztonságosítása**: Alkalmazza a vállalati biztonsági mintákat
6. **Skálázás éles környezetre**: Adjon hozzá több régiót és magas rendelkezésre állást

## 🎯 Gyakorlati feladatok

### Feladat 1: Microsoft Foundry Modellek chat alkalmazás telepítése (30 perc)
**Cél**: Telepítsen és teszteljen egy éles AI chat alkalmazást

```bash
# Inicializálja a sablont
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Állítsa be a környezeti változókat
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Telepítés
azd up

# Tesztelje az alkalmazást
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Felügyelje az AI műveleteket
azd monitor

# Takarítás
azd down --force --purge
```

**Siker kritériumok:**
- [ ] Telepítés kvótahibák nélkül befejeződik
- [ ] Elérhető a chat felület böngészőben
- [ ] Képes kérdéseket feltenni és AI által támogatott válaszokat kapni
- [ ] Application Insights telemetria adatai megjelennek
- [ ] Sikeresen megtisztította az erőforrásokat

**Becsült költség**: 5-10 USD 30 perc tesztelés

### Feladat 2: Többmodellű telepítés konfigurálása (45 perc)
**Cél**: Több AI modellen alapuló telepítés eltérő konfigurációkkal

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
- [ ] Különböző kapacitás beállítások alkalmazva
- [ ] API-n keresztül elérhetők a modellek
- [ ] Mindkét modellt aktiválni tudja az alkalmazásból

### Feladat 3: Költségmonitorozás megvalósítása (20 perc)
**Cél**: Költségértesítők és költéskövetés beállítása

```bash
# Költségkeret riasztás hozzáadása a Bicep-hez
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

# Költségkeret riasztás telepítése
azd provision

# Az aktuális költségek ellenőrzése
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Siker kritériumok:**
- [ ] Költségértesítés létrehozása Azure-ban
- [ ] E-mail értesítések konfigurálva
- [ ] Költségadatok megtekinthetők az Azure Portalon
- [ ] Költségkeret határértékek megfelelően beállítva

## 💡 Gyakran ismételt kérdések

<details>
<summary><strong>Hogyan csökkenthetem a Microsoft Foundry Modellek költségeit fejlesztés közben?</strong></summary>

1. **Használjon ingyenes szintet**: A Microsoft Foundry Modellek havi 50,000 token ingyenes kvótát kínálnak
2. **Csökkentse a kapacitást**: Állítsa a kapacitást 10 TPM-re fejlesztéshez a 30+ helyett
3. **Használja az azd down parancsot**: Szabadítsa fel az erőforrásokat, amikor nem fejleszt aktívan
4. **Gyorsítótárazza a válaszokat**: Implementáljon Redis gyorsítótárat ismétlődő lekérdezésekhez
5. **Használjon prompt tervezést**: Csökkentse a tokenhasználatot hatékony promptokkal
```bash
# Fejlesztési konfiguráció
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mi a különbség a Microsoft Foundry Modellek és az OpenAI API között?</strong></summary>

**Microsoft Foundry Modellek**:
- Vállalati szintű biztonság és megfelelőség
- Privát hálózati integráció
- SLA garanciák
- Kezelt identitás alapú hitelesítés
- Magasabb kvóták elérhetők

**OpenAI API**:
- Gyorsabb hozzáférés az új modellekhez
- Egyszerűbb beállítás
- Alacsonyabb belépési küszöb
- Csak nyilvános internet

Gyártási alkalmazásokhoz **a Microsoft Foundry Modellek ajánlottak**.
</details>

<details>
<summary><strong>Hogyan kezeljem a Microsoft Foundry Modellek kvóta túllépési hibáit?</strong></summary>

```bash
# Ellenőrizze a jelenlegi kvótát
az cognitiveservices usage list --location eastus2

# Próbáljon ki egy másik régiót
azd env set AZURE_LOCATION westus2
azd up

# Ideiglenesen csökkentse a kapacitást
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kvóta növelésének kérelmezése
# Menjen az Azure Portálra > Kvóták > Növelés kérelmezése
```
</details>

<details>
<summary><strong>Használhatom a saját adataimat a Microsoft Foundry Modellekkel?</strong></summary>

Igen! Használd az **Azure AI Search**-t RAG (Retrieval Augmented Generation) célokra:

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
<summary><strong>Hogyan biztosítsam az AI modell végpontokat?</strong></summary>

**Legjobb gyakorlatok**:
1. Használj Kezelt Identitást (API-kulcsok nélkül)
2. Engedélyezd a Privát Végpontokat
3. Állítsd be a hálózati biztonsági csoportokat
4. Vezess be aránylimitálást
5. Használd az Azure Key Vaultot titkokhoz

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
- **Agent Skills**: [Microsoft Foundry skill a skills.sh oldalon](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Telepíts Azure + Foundry agent skilleket a szerkesztődbe a `npx skills add microsoft/github-copilot-for-azure` paranccsal

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI modell telepítése](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Segítségre van szükséged?** Csatlakozz a közösségi beszélgetéseinkhez vagy nyiss egy hibajegyet a tárolóban. Az Azure AI + AZD közösség itt van, hogy segítsen neked!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->