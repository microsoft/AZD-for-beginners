<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-18T09:39:31+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "cs"
}
-->
# Integrace Azure AI Foundry s AZD

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../getting-started/first-project.md)
- **➡️ Další**: [Nasazení AI modelu](ai-model-deployment.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../getting-started/configuration.md)

## Přehled

Tento průvodce ukazuje, jak integrovat služby Azure AI Foundry s Azure Developer CLI (AZD) pro zjednodušené nasazení AI aplikací. Azure AI Foundry poskytuje komplexní platformu pro vytváření, nasazení a správu AI aplikací, zatímco AZD zjednodušuje proces infrastruktury a nasazení.

## Co je Azure AI Foundry?

Azure AI Foundry je jednotná platforma Microsoftu pro vývoj AI, která zahrnuje:

- **Katalog modelů**: Přístup k nejmodernějším AI modelům
- **Prompt Flow**: Vizualizér pro AI pracovní postupy
- **Portál AI Foundry**: Integrované vývojové prostředí pro AI aplikace
- **Možnosti nasazení**: Různé možnosti hostování a škálování
- **Bezpečnost a ochrana**: Vestavěné funkce odpovědné AI

## AZD + Azure AI Foundry: Lepší společně

| Funkce | Azure AI Foundry | Výhoda integrace s AZD |
|--------|------------------|------------------------|
| **Nasazení modelu** | Manuální nasazení přes portál | Automatizované, opakovatelné nasazení |
| **Infrastruktura** | Klikací zřizování | Infrastruktura jako kód (Bicep) |
| **Správa prostředí** | Zaměření na jedno prostředí | Více prostředí (vývoj/test/produkce) |
| **Integrace CI/CD** | Omezená | Nativní podpora GitHub Actions |
| **Správa nákladů** | Základní monitorování | Optimalizace nákladů podle prostředí |

## Předpoklady

- Azure předplatné s odpovídajícími oprávněními
- Nainstalovaný Azure Developer CLI
- Přístup ke službám Azure OpenAI
- Základní znalost Azure AI Foundry

## Základní integrační vzory

### Vzor 1: Integrace Azure OpenAI

**Použití**: Nasazení chatovacích aplikací s modely Azure OpenAI

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

### Vzor 2: AI vyhledávání + RAG integrace

**Použití**: Nasazení aplikací s generováním obohaceným o vyhledávání (RAG)

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

### Vzor 3: Integrace inteligence dokumentů

**Použití**: Pracovní postupy pro zpracování a analýzu dokumentů

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

## 🔧 Konfigurační vzory

### Nastavení proměnných prostředí

**Konfigurace produkce:**
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

**Konfigurace vývoje:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Bezpečná konfigurace pomocí Key Vault

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

## Pracovní postupy nasazení

### Nasazení jedním příkazem

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Nasazení specifické pro prostředí

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

## Monitorování a pozorovatelnost

### Integrace Application Insights

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

### Monitorování nákladů

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

## 🔐 Nejlepší bezpečnostní postupy

### Konfigurace spravované identity

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

### Síťová bezpečnost

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

## Optimalizace výkonu

### Strategie ukládání do mezipaměti

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

### Konfigurace automatického škálování

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

## Řešení běžných problémů

### Problém 1: Překročená kvóta OpenAI

**Příznaky:**
- Nasazení selhává kvůli chybám kvóty
- Chyby 429 v aplikačních logech

**Řešení:**
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

### Problém 2: Selhání autentizace

**Příznaky:**
- Chyby 401/403 při volání AI služeb
- Zprávy "Přístup odepřen"

**Řešení:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problém 3: Problémy s nasazením modelu

**Příznaky:**
- Modely nejsou dostupné v nasazení
- Selhání konkrétních verzí modelů

**Řešení:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Příkladové šablony

### Základní chatovací aplikace

**Repozitář**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Služby**: Azure OpenAI + Cognitive Search + App Service

**Rychlý start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline pro zpracování dokumentů

**Repozitář**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Služby**: Document Intelligence + Storage + Functions

**Rychlý start**:
```bash
azd init --template ai-document-processing
azd up
```

### Podnikový chat s RAG

**Repozitář**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Služby**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Rychlý start**:
```bash
azd init --template contoso-chat
azd up
```

## Další kroky

1. **Vyzkoušejte příklady**: Začněte s předpřipravenou šablonou, která odpovídá vašemu použití
2. **Přizpůsobte si řešení**: Upravte infrastrukturu a aplikační kód
3. **Přidejte monitorování**: Implementujte komplexní pozorovatelnost
4. **Optimalizujte náklady**: Doladěte konfigurace podle svého rozpočtu
5. **Zabezpečte nasazení**: Implementujte bezpečnostní vzory pro podnikové prostředí
6. **Škálujte do produkce**: Přidejte funkce pro více regionů a vysokou dostupnost

## Komunita a podpora

- **Discord Azure AI Foundry**: [#Azure kanál](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problémy a diskuze](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiální dokumentace](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí kapitola**: [Kapitola 1: Váš první projekt](../getting-started/first-project.md)
- **➡️ Další**: [Nasazení AI modelu](ai-model-deployment.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../getting-started/configuration.md)

**Potřebujete pomoc?** Připojte se k diskuzím komunity nebo otevřete problém v repozitáři. Komunita Azure AI + AZD je tu, aby vám pomohla uspět!

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádné nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.