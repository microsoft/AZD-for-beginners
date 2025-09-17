<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T23:27:27+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "da"
}
-->
# Azure AI Foundry Integration med AZD

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 2 - AI-First Udvikling
- **⬅️ Forrige Kapitel**: [Kapitel 1: Dit Første Projekt](../getting-started/first-project.md)
- **➡️ Næste**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Næste Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

## Oversigt

Denne guide viser, hvordan man integrerer Azure AI Foundry-tjenester med Azure Developer CLI (AZD) for at forenkle udrulningen af AI-applikationer. Azure AI Foundry tilbyder en omfattende platform til opbygning, udrulning og styring af AI-applikationer, mens AZD gør infrastrukturen og udrulningsprocessen mere enkel.

## Hvad er Azure AI Foundry?

Azure AI Foundry er Microsofts samlede platform for AI-udvikling, som inkluderer:

- **Modelkatalog**: Adgang til avancerede AI-modeller
- **Prompt Flow**: Visuel designer til AI-arbejdsgange
- **AI Foundry Portal**: Integreret udviklingsmiljø til AI-applikationer
- **Udrulningsmuligheder**: Flere hosting- og skaleringsmuligheder
- **Sikkerhed og Ansvarlighed**: Indbyggede funktioner til ansvarlig AI

## AZD + Azure AI Foundry: Bedre Sammen

| Funktion | Azure AI Foundry | Fordel ved AZD-integration |
|----------|------------------|---------------------------|
| **Modeludrulning** | Manuel portaludrulning | Automatiserede, gentagelige udrulninger |
| **Infrastruktur** | Klik-baseret provisionering | Infrastruktur som kode (Bicep) |
| **Miljøstyring** | Fokus på ét miljø | Multi-miljø (dev/staging/prod) |
| **CI/CD Integration** | Begrænset | Indbygget GitHub Actions support |
| **Omkostningsstyring** | Grundlæggende overvågning | Miljøspecifik optimering af omkostninger |

## Forudsætninger

- Azure-abonnement med passende tilladelser
- Azure Developer CLI installeret
- Adgang til Azure OpenAI-tjenester
- Grundlæggende kendskab til Azure AI Foundry

## Kerneintegrationsmønstre

### Mønster 1: Azure OpenAI Integration

**Anvendelse**: Udrul chatapplikationer med Azure OpenAI-modeller

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

**Infrastruktur (main.bicep):**
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

### Mønster 2: AI Search + RAG Integration

**Anvendelse**: Udrul applikationer med retrieval-augmented generation (RAG)

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

### Mønster 3: Dokumentintelligens Integration

**Anvendelse**: Dokumentbehandling og analysearbejdsgange

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

## 🔧 Konfigurationsmønstre

### Opsætning af Miljøvariabler

**Produktionskonfiguration:**
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

**Udviklingskonfiguration:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Sikker Konfiguration med Key Vault

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

## Udrulningsarbejdsgange

### Udrulning med Én Kommando

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Miljøspecifikke Udrulninger

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

## Overvågning og Observabilitet

### Integration med Application Insights

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

### Omkostningsovervågning

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

## 🔐 Sikkerhedsbedste Praksis

### Konfiguration af Managed Identity

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

### Netværkssikkerhed

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

## Optimering af Ydeevne

### Cache-strategier

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

### Konfiguration af Auto-skalering

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

## Fejlfinding af Almindelige Problemer

### Problem 1: OpenAI Kvota Overskredet

**Symptomer:**
- Udrulning fejler med kvotafejl
- 429-fejl i applikationslogfiler

**Løsninger:**
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

### Problem 2: Autentificeringsfejl

**Symptomer:**
- 401/403-fejl ved kald til AI-tjenester
- "Adgang nægtet"-meddelelser

**Løsninger:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problem 3: Problemer med Modeludrulning

**Symptomer:**
- Modeller er ikke tilgængelige i udrulningen
- Specifikke modelversioner fejler

**Løsninger:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Eksempel Skabeloner

### Grundlæggende Chatapplikation

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Tjenester**: Azure OpenAI + Cognitive Search + App Service

**Hurtig Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Dokumentbehandlingspipeline

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Tjenester**: Dokumentintelligens + Storage + Functions

**Hurtig Start**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise Chat med RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Tjenester**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Hurtig Start**:
```bash
azd init --template contoso-chat
azd up
```

## Næste Skridt

1. **Prøv Eksemplerne**: Start med en forudbygget skabelon, der matcher din anvendelse
2. **Tilpas til Dine Behov**: Modificer infrastrukturen og applikationskoden
3. **Tilføj Overvågning**: Implementer omfattende observabilitet
4. **Optimer Omkostninger**: Finjuster konfigurationer til dit budget
5. **Sikr Din Udrulning**: Implementer sikkerhedsmønstre til virksomheder
6. **Skalér til Produktion**: Tilføj multi-region og høj tilgængelighed

## Fællesskab og Support

- **Azure AI Foundry Discord**: [#Azure kanal](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues og diskussioner](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Officiel dokumentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 2 - AI-First Udvikling
- **⬅️ Forrige Kapitel**: [Kapitel 1: Dit Første Projekt](../getting-started/first-project.md)
- **➡️ Næste**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Næste Kapitel**: [Kapitel 3: Konfiguration](../getting-started/configuration.md)

**Brug for Hjælp?** Deltag i vores fællesskabsdiskussioner eller opret en issue i repositoryen. Azure AI + AZD-fællesskabet er her for at hjælpe dig med at få succes!

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at opnå nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.