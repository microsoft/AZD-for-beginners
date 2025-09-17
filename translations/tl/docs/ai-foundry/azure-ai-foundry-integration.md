<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T21:46:06+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "tl"
}
-->
# Azure AI Foundry Integration with AZD

**Nauna:** [Unang Proyekto](../getting-started/first-project.md) | **Susunod:** [Pag-deploy ng AI Model](ai-model-deployment.md)

## Pangkalahatang-ideya

Ang gabay na ito ay nagpapakita kung paano i-integrate ang mga serbisyo ng Azure AI Foundry sa Azure Developer CLI (AZD) para sa mas maayos na pag-deploy ng mga AI application. Ang Azure AI Foundry ay nagbibigay ng komprehensibong platform para sa pagbuo, pag-deploy, at pamamahala ng mga AI application, habang ang AZD ay nagpapadali sa proseso ng imprastruktura at pag-deploy.

## Ano ang Azure AI Foundry?

Ang Azure AI Foundry ay ang pinag-isang platform ng Microsoft para sa AI development na naglalaman ng:

- **Model Catalog**: Access sa mga makabagong AI model
- **Prompt Flow**: Visual designer para sa mga AI workflow
- **AI Foundry Portal**: Integrated development environment para sa mga AI application
- **Deployment Options**: Iba't ibang hosting at scaling options
- **Safety and Security**: Mga built-in na responsible AI features

## AZD + Azure AI Foundry: Mas Maganda Kapag Magkasama

| Tampok | Azure AI Foundry | Benepisyo ng AZD Integration |
|--------|------------------|-----------------------------|
| **Model Deployment** | Manual na pag-deploy sa portal | Automated, repeatable deployments |
| **Imprastruktura** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Pamamahala ng Kapaligiran** | Nakatuon sa isang kapaligiran | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limitado | Native GitHub Actions support |
| **Pamamahala ng Gastos** | Basic monitoring | Environment-specific cost optimization |

## Mga Kinakailangan

- Azure subscription na may tamang mga pahintulot
- Nakainstall ang Azure Developer CLI
- Access sa Azure OpenAI services
- Pangunahing kaalaman sa Azure AI Foundry

## Pangunahing Mga Pattern ng Integrasyon

### Pattern 1: Azure OpenAI Integration

**Gamit:** Pag-deploy ng mga chat application gamit ang Azure OpenAI models

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

**Imprastruktura (main.bicep):**
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

### Pattern 2: AI Search + RAG Integration

**Gamit:** Pag-deploy ng retrieval-augmented generation (RAG) applications

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

### Pattern 3: Document Intelligence Integration

**Gamit:** Mga workflow para sa pagproseso at pagsusuri ng dokumento

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

## 🔧 Mga Pattern ng Konpigurasyon

### Setup ng Environment Variables

**Konpigurasyon para sa Produksyon:**
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

**Konpigurasyon para sa Pag-develop:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Secure Configuration gamit ang Key Vault

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

## Mga Workflow ng Pag-deploy

### Pag-deploy gamit ang Single Command

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Pag-deploy Batay sa Kapaligiran

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

## Monitoring at Observability

### Application Insights Integration

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

### Monitoring ng Gastos

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

## 🔐 Mga Pinakamahusay na Praktika sa Seguridad

### Managed Identity Configuration

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

### Seguridad ng Network

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

## Pag-optimize ng Performance

### Mga Estratehiya sa Caching

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

### Konpigurasyon ng Auto-scaling

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

## Pag-troubleshoot ng Karaniwang Mga Isyu

### Isyu 1: Naubos ang OpenAI Quota

**Sintomas:**
- Nabigo ang pag-deploy dahil sa quota errors
- 429 errors sa application logs

**Mga Solusyon:**
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

### Isyu 2: Mga Pagkabigo sa Authentication

**Sintomas:**
- 401/403 errors kapag tumatawag sa AI services
- Mga mensaheng "Access denied"

**Mga Solusyon:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isyu 3: Mga Problema sa Pag-deploy ng Model

**Sintomas:**
- Hindi available ang mga model sa pag-deploy
- Nabibigo ang partikular na mga bersyon ng model

**Mga Solusyon:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Mga Halimbawang Template

### Pangunahing Chat Application

**Repositoryo**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Mga Serbisyo**: Azure OpenAI + Cognitive Search + App Service

**Mabilis na Simula**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline para sa Pagproseso ng Dokumento

**Repositoryo**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Mga Serbisyo**: Document Intelligence + Storage + Functions

**Mabilis na Simula**:
```bash
azd init --template ai-document-processing
azd up
```

### Enterprise Chat gamit ang RAG

**Repositoryo**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Mga Serbisyo**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Mabilis na Simula**:
```bash
azd init --template contoso-chat
azd up
```

## Mga Susunod na Hakbang

1. **Subukan ang Mga Halimbawa**: Simulan sa isang pre-built template na tumutugma sa iyong use case
2. **I-customize Ayon sa Iyong Pangangailangan**: Baguhin ang imprastruktura at application code
3. **Magdagdag ng Monitoring**: Magpatupad ng komprehensibong observability
4. **I-optimize ang Gastos**: Ayusin ang mga konpigurasyon ayon sa iyong budget
5. **Siguraduhin ang Iyong Pag-deploy**: Magpatupad ng mga enterprise security pattern
6. **I-scale sa Produksyon**: Magdagdag ng multi-region at high-availability features

## Komunidad at Suporta

- **Azure AI Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Mga Isyu at Diskusyon](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Opisyal na Dokumentasyon](https://learn.microsoft.com/azure/ai-studio/)

---

**Nauna:** [Unang Proyekto](../getting-started/first-project.md) | **Susunod:** [Pag-deploy ng AI Model](ai-model-deployment.md)

**Kailangan ng Tulong?** Sumali sa aming mga diskusyon sa komunidad o magbukas ng isyu sa repositoryo. Ang komunidad ng Azure AI + AZD ay narito upang tulungan kang magtagumpay!

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.