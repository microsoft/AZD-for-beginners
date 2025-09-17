<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T23:11:57+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "hu"
}
-->
# Azure AI Foundry integráció AZD-vel

**Előző:** [Első projekt](../getting-started/first-project.md) | **Következő:** [AI modell telepítése](ai-model-deployment.md)

## Áttekintés

Ez az útmutató bemutatja, hogyan integrálhatók az Azure AI Foundry szolgáltatások az Azure Developer CLI (AZD) eszközzel, hogy egyszerűsítsék az AI alkalmazások telepítését. Az Azure AI Foundry átfogó platformot kínál AI alkalmazások fejlesztéséhez, telepítéséhez és kezeléséhez, míg az AZD leegyszerűsíti az infrastruktúra és telepítési folyamatokat.

## Mi az Azure AI Foundry?

Az Azure AI Foundry a Microsoft egységes AI fejlesztési platformja, amely magában foglalja:

- **Modellek katalógusa**: Hozzáférés a legmodernebb AI modellekhez
- **Prompt Flow**: Vizualizációs tervező AI munkafolyamatokhoz
- **AI Foundry portál**: Integrált fejlesztési környezet AI alkalmazásokhoz
- **Telepítési lehetőségek**: Többféle hosztolási és skálázási opció
- **Biztonság és védelem**: Beépített felelős AI funkciók

## AZD + Azure AI Foundry: Jobb együtt

| Funkció | Azure AI Foundry | AZD integráció előnye |
|---------|-----------------|------------------------|
| **Modell telepítése** | Manuális portál telepítés | Automatizált, ismételhető telepítések |
| **Infrastruktúra** | Kattintás-alapú létrehozás | Infrastructure as Code (Bicep) |
| **Környezetkezelés** | Egyetlen környezetre fókuszál | Több környezet (fejlesztés/tesztelés/éles) |
| **CI/CD integráció** | Korlátozott | Natív GitHub Actions támogatás |
| **Költségkezelés** | Alapvető monitorozás | Környezet-specifikus költségoptimalizálás |

## Előfeltételek

- Azure előfizetés megfelelő jogosultságokkal
- Telepített Azure Developer CLI
- Hozzáférés az Azure OpenAI szolgáltatásokhoz
- Alapvető ismeretek az Azure AI Foundry-ról

## Alapvető integrációs minták

### Minta 1: Azure OpenAI integráció

**Felhasználási eset**: Chat alkalmazások telepítése Azure OpenAI modellekkel

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

### Minta 2: AI keresés + RAG integráció

**Felhasználási eset**: Visszakeresés-alapú generációs (RAG) alkalmazások telepítése

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

**Felhasználási eset**: Dokumentumfeldolgozási és elemzési munkafolyamatok

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
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Fejlesztési konfiguráció:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Biztonságos konfiguráció Key Vault segítségével

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

### Egyszerű parancs telepítés

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Környezet-specifikus telepítések

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

## Teljesítményoptimalizálás

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

### Automatikus skálázás konfiguráció

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

### Probléma 1: OpenAI kvóta túllépése

**Tünetek:**
- Telepítés kvóta hibákkal meghiúsul
- 429-es hibák az alkalmazásnaplókban

**Megoldások:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Probléma 2: Hitelesítési hibák

**Tünetek:**
- 401/403-as hibák AI szolgáltatások hívásakor
- "Hozzáférés megtagadva" üzenetek

**Megoldások:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probléma 3: Modell telepítési problémák

**Tünetek:**
- Modellek nem érhetők el a telepítésben
- Specifikus modellverziók hibásak

**Megoldások:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Példa sablonok

### Alapvető chat alkalmazás

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Szolgáltatások**: Azure OpenAI + Cognitive Search + App Service

**Gyors kezdés**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentumfeldolgozó csővezeték

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Szolgáltatások**: Dokumentum intelligencia + Tárhely + Funkciók

**Gyors kezdés**:
```bash
azd init --template ai-document-processing
azd up
```

### Vállalati chat RAG segítségével

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Szolgáltatások**: Azure OpenAI + Keresés + Konténeres alkalmazások + Cosmos DB

**Gyors kezdés**:
```bash
azd init --template contoso-chat
azd up
```

## Következő lépések

1. **Próbáld ki a példákat**: Kezdd egy előre elkészített sablonnal, amely megfelel az igényeidnek
2. **Testreszabás**: Módosítsd az infrastruktúrát és az alkalmazáskódot
3. **Monitorozás hozzáadása**: Valósíts meg átfogó megfigyelhetőséget
4. **Költségoptimalizálás**: Finomhangold a konfigurációkat a költségvetésedhez
5. **Biztonságos telepítés**: Valósíts meg vállalati biztonsági mintákat
6. **Skálázás éles környezetre**: Adj hozzá több régiót és magas rendelkezésre állást

## Közösség és támogatás

- **Azure AI Foundry Discord**: [#Azure csatorna](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémák és megbeszélések](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Hivatalos dokumentáció](https://learn.microsoft.com/azure/ai-studio/)

---

**Előző:** [Első projekt](../getting-started/first-project.md) | **Következő:** [AI modell telepítése](ai-model-deployment.md)

**Segítségre van szükséged?** Csatlakozz a közösségi beszélgetésekhez, vagy nyiss egy problémát a repository-ban. Az Azure AI + AZD közösség azért van, hogy segítsen neked sikerrel járni!

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.