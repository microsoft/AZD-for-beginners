<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T23:15:10+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "lt"
}
-->
# Azure AI Foundry integracija su AZD

**Ankstesnis:** [Pirmasis projektas](../getting-started/first-project.md) | **Kitas:** [AI modelio diegimas](ai-model-deployment.md)

## Apžvalga

Šiame vadove parodoma, kaip integruoti Azure AI Foundry paslaugas su Azure Developer CLI (AZD), siekiant supaprastinti AI programų diegimą. Azure AI Foundry siūlo išsamų platformos sprendimą AI programų kūrimui, diegimui ir valdymui, o AZD palengvina infrastruktūros ir diegimo procesą.

## Kas yra Azure AI Foundry?

Azure AI Foundry yra Microsoft sukurta vieninga platforma AI kūrimui, kuri apima:

- **Modelių katalogą**: Prieiga prie pažangiausių AI modelių
- **Prompt Flow**: Vizualinis AI darbo eigų dizaineris
- **AI Foundry portalą**: Integruota AI programų kūrimo aplinka
- **Diegimo galimybes**: Įvairūs talpinimo ir mastelio keitimo sprendimai
- **Saugumą ir patikimumą**: Integruotos atsakingo AI funkcijos

## AZD + Azure AI Foundry: geriau kartu

| Funkcija | Azure AI Foundry | AZD integracijos privalumas |
|----------|------------------|----------------------------|
| **Modelio diegimas** | Rankinis diegimas per portalą | Automatizuoti, pakartojami diegimai |
| **Infrastruktūra** | Diegimas per paspaudimus | Infrastruktūra kaip kodas (Bicep) |
| **Aplinkos valdymas** | Vienos aplinkos dėmesys | Daug aplinkų (dev/staging/prod) |
| **CI/CD integracija** | Ribota | Integruota GitHub Actions palaikymas |
| **Kaštų valdymas** | Bazinis stebėjimas | Aplinkai specifinis kaštų optimizavimas |

## Būtinos sąlygos

- Azure prenumerata su tinkamais leidimais
- Įdiegtas Azure Developer CLI
- Prieiga prie Azure OpenAI paslaugų
- Pagrindinės žinios apie Azure AI Foundry

## Pagrindiniai integracijos modeliai

### Modelis 1: Azure OpenAI integracija

**Naudojimo atvejis**: Pokalbių programų diegimas su Azure OpenAI modeliais

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

**Infrastruktūra (main.bicep):**
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

### Modelis 2: AI paieška + RAG integracija

**Naudojimo atvejis**: Diegimas su retrieval-augmented generation (RAG) programomis

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

### Modelis 3: Dokumentų intelekto integracija

**Naudojimo atvejis**: Dokumentų apdorojimo ir analizės darbo eigos

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

## 🔧 Konfigūracijos modeliai

### Aplinkos kintamųjų nustatymas

**Produkcijos konfigūracija:**
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

**Kūrimo konfigūracija:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Saugus konfigūravimas naudojant Key Vault

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

## Diegimo darbo eigos

### Diegimas vienu komanda

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Aplinkai specifiniai diegimai

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

## Stebėjimas ir stebimumas

### Application Insights integracija

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

### Kaštų stebėjimas

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

## 🔐 Saugumo geriausios praktikos

### Valdomos tapatybės konfigūracija

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

### Tinklo saugumas

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

## Našumo optimizavimas

### Talpyklos strategijos

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

### Automatinio mastelio keitimo konfigūracija

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

## Dažniausiai pasitaikančių problemų sprendimas

### Problema 1: OpenAI kvotos viršijimas

**Simptomai:**
- Diegimas nepavyksta dėl kvotos klaidų
- 429 klaidos programos žurnaluose

**Sprendimai:**
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

### Problema 2: Autentifikacijos klaidos

**Simptomai:**
- 401/403 klaidos, kai kreipiamasi į AI paslaugas
- „Prieiga uždrausta“ pranešimai

**Sprendimai:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Modelio diegimo problemos

**Simptomai:**
- Modeliai nėra pasiekiami diegime
- Konkretūs modelio versijų gedimai

**Sprendimai:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Pavyzdiniai šablonai

### Paprasta pokalbių programa

**Saugykla**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Paslaugos**: Azure OpenAI + Cognitive Search + App Service

**Greitas startas**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentų apdorojimo procesas

**Saugykla**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Paslaugos**: Dokumentų intelektas + Saugykla + Funkcijos

**Greitas startas**:
```bash
azd init --template ai-document-processing
azd up
```

### Įmonės pokalbių programa su RAG

**Saugykla**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Paslaugos**: Azure OpenAI + Paieška + Konteinerių programos + Cosmos DB

**Greitas startas**:
```bash
azd init --template contoso-chat
azd up
```

## Kiti žingsniai

1. **Išbandykite pavyzdžius**: Pradėkite nuo iš anksto paruošto šablono, kuris atitinka jūsų naudojimo atvejį
2. **Pritaikykite savo poreikiams**: Modifikuokite infrastruktūrą ir programos kodą
3. **Pridėkite stebėjimą**: Įgyvendinkite išsamų stebimumą
4. **Optimizuokite kaštus**: Koreguokite konfigūracijas pagal savo biudžetą
5. **Užtikrinkite diegimo saugumą**: Įgyvendinkite įmonės saugumo modelius
6. **Mastelio keitimas iki produkcijos**: Pridėkite daugiaregionines ir aukšto prieinamumo funkcijas

## Bendruomenė ir palaikymas

- **Azure AI Foundry Discord**: [#Azure kanalas](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problemos ir diskusijos](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Oficiali dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

---

**Ankstesnis:** [Pirmasis projektas](../getting-started/first-project.md) | **Kitas:** [AI modelio diegimas](ai-model-deployment.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės diskusijų arba atidarykite problemą saugykloje. Azure AI + AZD bendruomenė pasiruošusi padėti jums pasiekti sėkmę!

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.