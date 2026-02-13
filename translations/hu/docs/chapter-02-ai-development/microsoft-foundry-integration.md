# Microsoft Foundry integráció az AZD-vel

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI modell üzembe helyezése](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

## Áttekintés

Ez az útmutató bemutatja, hogyan lehet összekapcsolni a Microsoft Foundry szolgáltatásait az Azure Developer CLI-vel (AZD) az AI-alkalmazások egyszerűsített telepítése érdekében. A Microsoft Foundry átfogó platformot nyújt AI-alkalmazások építéséhez, telepítéséhez és kezeléséhez, míg az AZD leegyszerűsíti az infrastruktúrát és a telepítési folyamatot.

## Mi az a Microsoft Foundry?

A Microsoft Foundry a Microsoft egységes AI-fejlesztési platformja, amely tartalmazza:

- **Modelkatalógus**: Hozzáférés a csúcstechnológiás AI-modellekhez
- **Prompt Flow**: Vizuális tervező AI munkafolyamatokhoz
- **AI Foundry portál**: Integrált fejlesztési környezet AI-alkalmazásokhoz
- **Telepítési lehetőségek**: Több tárhely- és méretezési opció
- **Biztonság és védelmi intézkedések**: Beépített felelős AI funkciók

## AZD + Microsoft Foundry: Jobban együtt

| Funkció | Microsoft Foundry | AZD integráció előnye |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Előfeltételek

- Azure-előfizetés megfelelő jogosultságokkal
- Azure Developer CLI telepítve
- Hozzáférés az Azure OpenAI szolgáltatásokhoz
- Alapvető ismeretek a Microsoft Foundry-ról

## Alap integrációs minták

### Minta 1: Azure OpenAI integráció

**Használati eset**: Chat-alkalmazások telepítése Azure OpenAI modellekkel

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
// Azure OpenAI Account
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

### Minta 2: AI Search + RAG integráció

**Használati eset**: Visszakeresés-augmentált generálást (RAG) használó alkalmazások telepítése

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

### Minta 3: Document Intelligence integráció

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
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

### Egyparancsos telepítés

```bash
# Telepíts mindent egy paranccsal
azd up

# Vagy telepíts fokozatosan
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

## 🔐 Biztonsági bevált gyakorlatok

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

### Hálózatbiztonság

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

## Teljesítményoptimalizálás

### Cache-kezelési stratégiák

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

## Gyakori problémák elhárítása

### Probléma 1: OpenAI kvóta túllépve

**Tünetek:**
- A telepítés kvótahibák miatt sikertelen
- 429-es hibák az alkalmazás naplóiban

**Megoldások:**
```bash
# Ellenőrizze az aktuális kvótahasználatot
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
- 401/403-as hibák AI szolgáltatások hívásakor
- "Access denied" üzenetek

**Megoldások:**
```bash
# Ellenőrizze a szerepkör-hozzárendeléseket
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ellenőrizze a kezelt identitás konfigurációját
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Ellenőrizze a Key Vault hozzáférését
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probléma 3: Modell telepítési problémák

**Tünetek:**
- Modellek nem érhetők el a telepítésben
- Egyes modellverziók hibát okoznak

**Megoldások:**
```bash
# Listázza az elérhető modelleket régiónként
az cognitiveservices model list --location eastus

# Frissítse a modell verzióját a bicep sablonban
# Ellenőrizze a modell kapacitáskövetelményeit
```

## Példa sablonok

### Alap chat-alkalmazás

**Tároló**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Szolgáltatások**: Azure OpenAI + Cognitive Search + App Service

**Gyors kezdés**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentumfeldolgozó csővezeték

**Tároló**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Szolgáltatások**: Document Intelligence + Storage + Functions

**Gyors kezdés**:
```bash
azd init --template ai-document-processing
azd up
```

### Vállalati chat RAG-gal

**Tároló**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Szolgáltatások**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Gyors kezdés**:
```bash
azd init --template contoso-chat
azd up
```

## Következő lépések

1. **Próbáld ki a példákat**: Kezdd egy előre elkészített sablonnal, amely megfelel az esetednek
2. **Személyre szabás**: Módosítsd az infrastruktúrát és az alkalmazáskódot
3. **Adj hozzá monitorozást**: Valósíts meg átfogó megfigyelhetőséget
4. **Költségek optimalizálása**: Finomhangold a beállításokat a költségvetésedhez
5. **Biztosítsd a telepítést**: Valósíts meg vállalati szintű biztonsági mintákat
6. **Skálázás éles környezetre**: Adj hozzá több régiót és magas rendelkezésre állást biztosító funkcionalitásokat

## 🎯 Gyakorlati feladatok

### Feladat 1: Azure OpenAI chat-alkalmazás telepítése (30 perc)
**Cél**: Telepíts és tesztelj egy élesre kész MI chat-alkalmazást

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

# MI-műveletek figyelése
azd monitor

# Takarítás
azd down --force --purge
```

**Siker kritériumok:**
- [ ] A telepítés kvótahibák nélkül befejeződik
- [ ] Hozzáférhető a chat felület a böngészőben
- [ ] Lehet kérdéseket feltenni és AI-támogatott válaszokat kapni
- [ ] Az Application Insights mutat telemetriai adatokat
- [ ] Az erőforrások sikeresen eltávolítva

**Becsült költség**: $5–10 a 30 perc teszteléshez

### Feladat 2: Többmodell-telepítés konfigurálása (45 perc)
**Cél**: Több MI modell telepítése különböző konfigurációkkal

```bash
# Egyedi Bicep-konfiguráció létrehozása
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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
- [ ] Különböző kapacitásbeállítások alkalmazva
- [ ] A modellek elérhetők API-n keresztül
- [ ] Az alkalmazás képes mindkét modellt meghívni

### Feladat 3: Költségfigyelés bevezetése (20 perc)
**Cél**: Költségkeret-riasztások és költségkövetés beállítása

```bash
# Költségvetési riasztás hozzáadása a Bicephez
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

# Aktuális költségek ellenőrzése
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Siker kritériumok:**
- [ ] Költségkeret-riasztás létrehozva az Azure-ban
- [ ] E-mail értesítések beállítva
- [ ] A költségadatok megtekinthetők az Azure Portalon
- [ ] A költségkeret küszöbértékei megfelelően beállítva

## 💡 Gyakran ismételt kérdések

<details>
<summary><strong>Hogyan csökkenthetem az Azure OpenAI költségeit fejlesztés közben?</strong></summary>

1. **Használd az ingyenes szintet**: Az Azure OpenAI havonta 50,000 token ingyen
2. **Csökkentsd a kapacitást**: Állítsd a kapacitást 10 TPM-re a fejlesztéshez a 30+ helyett
3. **Használd az azd down parancsot**: Deallokáld az erőforrásokat, ha nem fejlesztesz aktívan
4. **Válaszok gyorsítótárazása**: Valósíts meg Redis cache-t ismétlődő lekérdezésekhez
5. **Prompt engineering használata**: Csökkentsd a token használatot hatékony promptokkal

```bash
# Fejlesztési konfiguráció
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Mi a különbség az Azure OpenAI és az OpenAI API között?</strong></summary>

**Azure OpenAI**:
- Vállalati szintű biztonság és megfelelőség
- Privát hálózati integráció
- SLA garanciák
- Managed identity alapú hitelesítés
- Magasabb kvóták érhetők el

**OpenAI API**:
- Gyorsabb hozzáférés az új modellekhez
- Egyszerűbb beállítás
- Alacsonyabb belépési küszöb
- Csak nyilvános internet

Éles alkalmazásokhoz **az Azure OpenAI ajánlott**.
</details>

<details>
<summary><strong>Hogyan kezeljem az Azure OpenAI kvóta túllépési hibákat?</strong></summary>

```bash
# Ellenőrizze az aktuális kvótát
az cognitiveservices usage list --location eastus2

# Próbáljon másik régiót
azd env set AZURE_LOCATION westus2
azd up

# Ideiglenesen csökkentse a kapacitást
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Kérjen kvótaemelést
# Nyissa meg az Azure Portalt > Kvóták > Növelés kérése
```
</details>

<details>
<summary><strong>Használhatom a saját adataimat az Azure OpenAI-val?</strong></summary>

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

Lásd a [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) sablont.
</details>

<details>
<summary><strong>Hogyan biztosíthatom az AI modell végpontokat?</strong></summary>

**Legjobb gyakorlatok**:
1. Használj Managed Identity-t (nincs API-kulcs)
2. Engedélyezd a Private Endpoint-eket
3. Konfiguráld a hálózatbiztonsági csoportokat
4. Valósíts meg sebességkorlátozást
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

## Közösség és támogatás

- **Microsoft Foundry Discord**: [#Azure csatorna](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémák és viták](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Hivatalos dokumentáció](https://learn.microsoft.com/azure/ai-studio/)

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző fejezet**: [1. fejezet: Az első projekted](../chapter-01-foundation/first-project.md)
- **➡️ Következő**: [AI modell üzembe helyezése](ai-model-deployment.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

**Segítségre van szükséged?** Csatlakozz a közösségi beszélgetéseinkhez vagy nyiss egy issue-t a tárolóban. Az Azure AI + AZD közösség azért van, hogy segítsen a sikerben!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Felelősségkizárás**:
Ezt a dokumentumot AI-alapú fordító szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, anyanyelvi dokumentum tekintendő hiteles forrásnak. Fontos információk esetén professzionális, emberi fordítást javasolunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->