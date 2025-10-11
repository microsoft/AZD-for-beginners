<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-10-11T16:02:46+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "et"
}
-->
# Azure AI Foundry integratsioon AZD-ga

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-põhine arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Sinu esimene projekt](../getting-started/first-project.md)
- **➡️ Järgmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

## Ülevaade

See juhend näitab, kuidas integreerida Azure AI Foundry teenuseid Azure Developer CLI-ga (AZD), et lihtsustada AI rakenduste juurutamist. Azure AI Foundry pakub terviklikku platvormi AI rakenduste loomiseks, juurutamiseks ja haldamiseks, samal ajal kui AZD lihtsustab infrastruktuuri ja juurutusprotsessi.

## Mis on Azure AI Foundry?

Azure AI Foundry on Microsofti ühtne platvorm AI arenduseks, mis sisaldab:

- **Mudelikataloog**: Juurdepääs tipptasemel AI mudelitele
- **Prompt Flow**: Visuaalne disainer AI töövoogude jaoks
- **AI Foundry portaal**: Integreeritud arenduskeskkond AI rakendustele
- **Juurutusvõimalused**: Mitmekesised hostimis- ja skaleerimisvõimalused
- **Turvalisus ja ohutus**: Sisseehitatud vastutustundliku AI funktsioonid

## AZD + Azure AI Foundry: Koos paremad

| Funktsioon | Azure AI Foundry | AZD integratsiooni eelis |
|------------|------------------|--------------------------|
| **Mudeli juurutamine** | Käsitsi portaalis juurutamine | Automatiseeritud, korduvkasutatavad juurutused |
| **Infrastruktuur** | Klikk-põhine seadistamine | Infrastruktuur kui kood (Bicep) |
| **Keskkonna haldamine** | Ühe keskkonna fookus | Mitmekeskkond (arendus/testimine/tootmine) |
| **CI/CD integratsioon** | Piiratud | Loomulik GitHub Actions tugi |
| **Kulude haldamine** | Põhiline jälgimine | Keskkonnaspetsiifiline kulude optimeerimine |

## Eeldused

- Azure'i tellimus koos sobivate õigustega
- Azure Developer CLI paigaldatud
- Juurdepääs Azure OpenAI teenustele
- Põhiline tutvumine Azure AI Foundryga

## Põhilised integratsioonimustrid

### Muster 1: Azure OpenAI integratsioon

**Kasutusjuht**: Vestlusrakenduste juurutamine Azure OpenAI mudelitega

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

**Infrastruktuur (main.bicep):**
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

### Muster 2: AI otsing + RAG integratsioon

**Kasutusjuht**: Juurutamine otsingu- ja generatsioonirakendustele (RAG)

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

### Muster 3: Dokumendi intelligentsuse integratsioon

**Kasutusjuht**: Dokumenditöötluse ja analüüsi töövood

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

## 🔧 Konfiguratsioonimustrid

### Keskkonnamuutujate seadistamine

**Tootmiskonfiguratsioon:**
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

**Arenduskonfiguratsioon:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Turvaline konfiguratsioon Key Vaultiga

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

## Juurutusvood

### Ühe käsuga juurutamine

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Keskkonnaspetsiifilised juurutused

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

## Jälgimine ja nähtavus

### Rakenduse Insights integratsioon

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

### Kulude jälgimine

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

## 🔐 Turvalisuse parimad praktikad

### Hallatud identiteedi konfiguratsioon

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

### Võrguturvalisus

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

## Jõudluse optimeerimine

### Vahemälu strateegiad

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

### Automaatse skaleerimise konfiguratsioon

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

## Tõrkeotsing levinud probleemidele

### Probleem 1: OpenAI kvoot ületatud

**Sümptomid:**
- Juurutus ebaõnnestub kvoodivigadega
- 429 vead rakenduse logides

**Lahendused:**
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

### Probleem 2: Autentimisvead

**Sümptomid:**
- 401/403 vead AI teenuste kutsumisel
- "Juurdepääs keelatud" teated

**Lahendused:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Probleem 3: Mudeli juurutamise probleemid

**Sümptomid:**
- Mudelid pole juurutamisel saadaval
- Konkreetsete mudeliversioonide tõrked

**Lahendused:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Näidismallid

### Põhiline vestlusrakendus

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Teenused**: Azure OpenAI + Cognitive Search + App Service

**Kiire alustamine**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumenditöötluse torujuhe

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Teenused**: Dokumendi intelligentsus + Salvestus + Funktsioonid

**Kiire alustamine**:
```bash
azd init --template ai-document-processing
azd up
```

### Ettevõtte vestlus RAG-ga

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Teenused**: Azure OpenAI + Otsing + Konteinerirakendused + Cosmos DB

**Kiire alustamine**:
```bash
azd init --template contoso-chat
azd up
```

## Järgmised sammud

1. **Proovi näiteid**: Alusta eelvalmistatud malliga, mis sobib sinu kasutusjuhtumiga
2. **Kohanda vastavalt vajadustele**: Muuda infrastruktuuri ja rakenduse koodi
3. **Lisa jälgimine**: Rakenda põhjalik nähtavus
4. **Optimeeri kulusid**: Häälesta konfiguratsioonid vastavalt eelarvele
5. **Turvalise juurutuse rakendamine**: Kasuta ettevõtte turvalisuse mustreid
6. **Skaleeri tootmisse**: Lisa mitme piirkonna ja kõrge saadavuse funktsioonid

## Kogukond ja tugi

- **Azure AI Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleemid ja arutelud](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Ametlik dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-põhine arendus
- **⬅️ Eelmine peatükk**: [Peatükk 1: Sinu esimene projekt](../getting-started/first-project.md)
- **➡️ Järgmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

**Vajad abi?** Liitu meie kogukonna aruteludega või ava probleem repositooriumis. Azure AI + AZD kogukond on siin, et aidata sul edu saavutada!

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.