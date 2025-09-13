<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T23:12:32+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "sk"
}
-->
# Integrácia Azure AI Foundry s AZD

**Predchádzajúce:** [Prvý projekt](../getting-started/first-project.md) | **Ďalšie:** [Nasadenie AI modelu](ai-model-deployment.md)

## Prehľad

Tento návod ukazuje, ako integrovať služby Azure AI Foundry s Azure Developer CLI (AZD) pre zjednodušené nasadenie AI aplikácií. Azure AI Foundry poskytuje komplexnú platformu na vytváranie, nasadzovanie a správu AI aplikácií, zatiaľ čo AZD zjednodušuje proces infraštruktúry a nasadenia.

## Čo je Azure AI Foundry?

Azure AI Foundry je jednotná platforma od Microsoftu pre vývoj AI, ktorá zahŕňa:

- **Katalóg modelov**: Prístup k najmodernejším AI modelom
- **Prompt Flow**: Vizualizér pre AI pracovné postupy
- **Portál AI Foundry**: Integrované vývojové prostredie pre AI aplikácie
- **Možnosti nasadenia**: Viacero možností hostingu a škálovania
- **Bezpečnosť a ochrana**: Zabudované funkcie zodpovednej AI

## AZD + Azure AI Foundry: Lepšie spolu

| Funkcia | Azure AI Foundry | Výhody integrácie s AZD |
|---------|------------------|-------------------------|
| **Nasadenie modelov** | Manuálne nasadenie cez portál | Automatizované, opakovateľné nasadenia |
| **Infraštruktúra** | Klikacie nastavenie | Infraštruktúra ako kód (Bicep) |
| **Správa prostredí** | Zameranie na jedno prostredie | Viac prostredí (dev/staging/prod) |
| **Integrácia CI/CD** | Obmedzená | Natívna podpora GitHub Actions |
| **Správa nákladov** | Základné monitorovanie | Optimalizácia nákladov podľa prostredia |

## Predpoklady

- Azure predplatné s vhodnými oprávneniami
- Nainštalovaný Azure Developer CLI
- Prístup k službám Azure OpenAI
- Základná znalosť Azure AI Foundry

## Základné integračné vzory

### Vzor 1: Integrácia Azure OpenAI

**Použitie**: Nasadenie chatovacích aplikácií s modelmi Azure OpenAI

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

**Infraštruktúra (main.bicep):**
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

### Vzor 2: AI vyhľadávanie + RAG integrácia

**Použitie**: Nasadenie aplikácií s generovaním podporovaným vyhľadávaním (RAG)

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

### Vzor 3: Integrácia dokumentovej inteligencie

**Použitie**: Pracovné postupy na spracovanie a analýzu dokumentov

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

## 🔧 Konfiguračné vzory

### Nastavenie premenných prostredia

**Konfigurácia pre produkciu:**
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

**Konfigurácia pre vývoj:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Bezpečná konfigurácia s Key Vault

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

## Pracovné postupy nasadenia

### Nasadenie jedným príkazom

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Nasadenia podľa prostredia

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

## Monitorovanie a pozorovateľnosť

### Integrácia Application Insights

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

### Monitorovanie nákladov

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

## 🔐 Najlepšie bezpečnostné postupy

### Konfigurácia spravovanej identity

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

### Sieťová bezpečnosť

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

## Optimalizácia výkonu

### Stratégie ukladania do vyrovnávacej pamäte

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

### Konfigurácia automatického škálovania

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

## Riešenie bežných problémov

### Problém 1: Prekročenie kvóty OpenAI

**Príznaky:**
- Nasadenie zlyhá kvôli chybám kvóty
- Chyby 429 v logoch aplikácie

**Riešenia:**
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

### Problém 2: Zlyhanie autentifikácie

**Príznaky:**
- Chyby 401/403 pri volaní AI služieb
- Hlásenia "Prístup zamietnutý"

**Riešenia:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problém 3: Problémy s nasadením modelov

**Príznaky:**
- Modely nie sú dostupné v nasadení
- Zlyhanie konkrétnych verzií modelov

**Riešenia:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Príkladové šablóny

### Základná chatovacia aplikácia

**Repozitár**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Cognitive Search + App Service

**Rýchly štart**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline na spracovanie dokumentov

**Repozitár**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Služby**: Document Intelligence + Storage + Functions

**Rýchly štart**:
```bash
azd init --template ai-document-processing
azd up
```

### Podnikový chat s RAG

**Repozitár**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Rýchly štart**:
```bash
azd init --template contoso-chat
azd up
```

## Ďalšie kroky

1. **Vyskúšajte príklady**: Začnite s predpripravenou šablónou, ktorá zodpovedá vášmu použitiu
2. **Prispôsobte si podľa potreby**: Upravte infraštruktúru a kód aplikácie
3. **Pridajte monitorovanie**: Implementujte komplexnú pozorovateľnosť
4. **Optimalizujte náklady**: Doladte konfigurácie podľa vášho rozpočtu
5. **Zabezpečte nasadenie**: Implementujte bezpečnostné vzory pre podniky
6. **Škálujte do produkcie**: Pridajte funkcie pre viac regiónov a vysokú dostupnosť

## Komunita a podpora

- **Azure AI Foundry Discord**: [#Azure kanál](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémy a diskusie](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiálna dokumentácia](https://learn.microsoft.com/azure/ai-studio/)

---

**Predchádzajúce:** [Prvý projekt](../getting-started/first-project.md) | **Ďalšie:** [Nasadenie AI modelu](ai-model-deployment.md)

**Potrebujete pomoc?** Pripojte sa k diskusiám komunity alebo otvorte problém v repozitári. Komunita Azure AI + AZD je tu, aby vám pomohla uspieť!

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.