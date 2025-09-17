<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T23:14:08+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "sl"
}
-->
# Integracija Azure AI Foundry z AZD

**Prejšnje:** [Prvi projekt](../getting-started/first-project.md) | **Naslednje:** [Namestitev AI modela](ai-model-deployment.md)

## Pregled

Ta vodič prikazuje, kako integrirati storitve Azure AI Foundry z Azure Developer CLI (AZD) za poenostavljeno nameščanje AI aplikacij. Azure AI Foundry ponuja celovito platformo za gradnjo, nameščanje in upravljanje AI aplikacij, medtem ko AZD poenostavi proces infrastrukture in nameščanja.

## Kaj je Azure AI Foundry?

Azure AI Foundry je Microsoftova enotna platforma za razvoj AI, ki vključuje:

- **Katalog modelov**: Dostop do najsodobnejših AI modelov
- **Prompt Flow**: Vizualni oblikovalec za AI delovne tokove
- **Portal AI Foundry**: Integrirano razvojno okolje za AI aplikacije
- **Možnosti nameščanja**: Več možnosti gostovanja in skaliranja
- **Varnost in zaščita**: Vgrajene funkcije odgovornega AI

## AZD + Azure AI Foundry: Boljše skupaj

| Funkcija | Azure AI Foundry | Prednosti integracije z AZD |
|----------|------------------|-----------------------------|
| **Nameščanje modelov** | Ročno nameščanje prek portala | Avtomatizirano, ponovljivo nameščanje |
| **Infrastruktura** | Klikni za vzpostavitev | Infrastruktura kot koda (Bicep) |
| **Upravljanje okolij** | Osredotočeno na eno okolje | Več okolij (razvoj/testiranje/produkcija) |
| **Integracija CI/CD** | Omejena | Podpora za GitHub Actions |
| **Upravljanje stroškov** | Osnovno spremljanje | Optimizacija stroškov po okolju |

## Predpogoji

- Azure naročnina z ustreznimi dovoljenji
- Nameščen Azure Developer CLI
- Dostop do storitev Azure OpenAI
- Osnovno poznavanje Azure AI Foundry

## Osnovni vzorci integracije

### Vzorec 1: Integracija Azure OpenAI

**Primer uporabe**: Nameščanje aplikacij za klepet z modeli Azure OpenAI

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

### Vzorec 2: AI iskanje + RAG integracija

**Primer uporabe**: Nameščanje aplikacij za generacijo z izboljšanim iskanjem (RAG)

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

### Vzorec 3: Integracija inteligence dokumentov

**Primer uporabe**: Delovni tokovi za obdelavo in analizo dokumentov

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

## 🔧 Vzorci konfiguracije

### Nastavitev spremenljivk okolja

**Konfiguracija za produkcijo:**
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

**Konfiguracija za razvoj:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Varna konfiguracija z Key Vault

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

## Delovni tokovi nameščanja

### Nameščanje z enim ukazom

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Nameščanje po okolju

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

## Spremljanje in opazovanje

### Integracija z Application Insights

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

## 🔐 Najboljše prakse za varnost

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

### Omrežna varnost

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

### Težava 1: Presežena kvota OpenAI

**Simptomi:**
- Nameščanje ne uspe zaradi napak kvote
- Napake 429 v dnevnikih aplikacije

**Rešitve:**
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

### Težava 2: Napake pri avtentikaciji

**Simptomi:**
- Napake 401/403 pri klicanju AI storitev
- Sporočila "Dostop zavrnjen"

**Rešitve:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Težava 3: Težave pri nameščanju modelov

**Simptomi:**
- Modeli niso na voljo pri nameščanju
- Napake pri določenih različicah modelov

**Rešitve:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Primeri predlog

### Osnovna aplikacija za klepet

**Repozitorij**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Storitve**: Azure OpenAI + Cognitive Search + App Service

**Hitri začetek**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Cevovod za obdelavo dokumentov

**Repozitorij**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Storitve**: Inteligenca dokumentov + Shranjevanje + Funkcije

**Hitri začetek**:
```bash
azd init --template ai-document-processing
azd up
```

### Podjetniški klepet z RAG

**Repozitorij**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Storitve**: Azure OpenAI + Iskanje + Container Apps + Cosmos DB

**Hitri začetek**:
```bash
azd init --template contoso-chat
azd up
```

## Naslednji koraki

1. **Preizkusite primere**: Začnite s predhodno pripravljeno predlogo, ki ustreza vašemu primeru uporabe
2. **Prilagodite svojim potrebam**: Spremenite infrastrukturo in kodo aplikacije
3. **Dodajte spremljanje**: Implementirajte celovito opazovanje
4. **Optimizirajte stroške**: Prilagodite konfiguracije glede na vaš proračun
5. **Zavarujte nameščanje**: Uporabite varnostne vzorce za podjetja
6. **Razširite na produkcijo**: Dodajte funkcije za več regij in visoko razpoložljivost

## Skupnost in podpora

- **Azure AI Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Težave in razprave](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Uradna dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

---

**Prejšnje:** [Prvi projekt](../getting-started/first-project.md) | **Naslednje:** [Namestitev AI modela](ai-model-deployment.md)

**Potrebujete pomoč?** Pridružite se razpravam v skupnosti ali odprite težavo v repozitoriju. Skupnost Azure AI + AZD je tukaj, da vam pomaga pri uspehu!

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.