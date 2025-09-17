<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T21:45:46+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "ms"
}
-->
# Integrasi Azure AI Foundry dengan AZD

**Sebelumnya:** [Projek Pertama](../getting-started/first-project.md) | **Seterusnya:** [Penyebaran Model AI](ai-model-deployment.md)

## Gambaran Keseluruhan

Panduan ini menunjukkan cara mengintegrasikan perkhidmatan Azure AI Foundry dengan Azure Developer CLI (AZD) untuk penyebaran aplikasi AI yang lebih lancar. Azure AI Foundry menyediakan platform komprehensif untuk membina, menyebarkan, dan mengurus aplikasi AI, manakala AZD mempermudah proses infrastruktur dan penyebaran.

## Apa itu Azure AI Foundry?

Azure AI Foundry ialah platform bersatu Microsoft untuk pembangunan AI yang merangkumi:

- **Model Catalog**: Akses kepada model AI terkini
- **Prompt Flow**: Pereka bentuk visual untuk aliran kerja AI
- **AI Foundry Portal**: Persekitaran pembangunan bersepadu untuk aplikasi AI
- **Pilihan Penyebaran**: Pelbagai pilihan hosting dan penskalaan
- **Keselamatan dan Perlindungan**: Ciri AI bertanggungjawab terbina dalam

## AZD + Azure AI Foundry: Lebih Baik Bersama

| Ciri | Azure AI Foundry | Manfaat Integrasi AZD |
|------|------------------|-----------------------|
| **Penyebaran Model** | Penyebaran manual melalui portal | Penyebaran automatik dan berulang |
| **Infrastruktur** | Penyediaan klik melalui portal | Infrastruktur sebagai Kod (Bicep) |
| **Pengurusan Persekitaran** | Fokus pada satu persekitaran | Pelbagai persekitaran (dev/staging/prod) |
| **Integrasi CI/CD** | Terhad | Sokongan asli GitHub Actions |
| **Pengurusan Kos** | Pemantauan asas | Pengoptimuman kos khusus persekitaran |

## Prasyarat

- Langganan Azure dengan kebenaran yang sesuai
- Azure Developer CLI dipasang
- Akses kepada perkhidmatan Azure OpenAI
- Pemahaman asas tentang Azure AI Foundry

## Corak Integrasi Teras

### Corak 1: Integrasi Azure OpenAI

**Kes Penggunaan**: Menyebarkan aplikasi sembang dengan model Azure OpenAI

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

### Corak 2: AI Search + Integrasi RAG

**Kes Penggunaan**: Menyebarkan aplikasi retrieval-augmented generation (RAG)

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

### Corak 3: Integrasi Document Intelligence

**Kes Penggunaan**: Aliran kerja pemprosesan dan analisis dokumen

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

## 🔧 Corak Konfigurasi

### Persediaan Pembolehubah Persekitaran

**Konfigurasi Pengeluaran:**
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

**Konfigurasi Pembangunan:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Konfigurasi Selamat dengan Key Vault

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

## Aliran Kerja Penyebaran

### Penyebaran Satu Perintah

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Penyebaran Khusus Persekitaran

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

## Pemantauan dan Pemerhatian

### Integrasi Application Insights

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

### Pemantauan Kos

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

## 🔐 Amalan Terbaik Keselamatan

### Konfigurasi Identiti Terurus

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

### Keselamatan Rangkaian

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

## Pengoptimuman Prestasi

### Strategi Caching

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

### Konfigurasi Auto-scaling

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

## Penyelesaian Masalah Umum

### Isu 1: Kuota OpenAI Melebihi

**Gejala:**
- Penyebaran gagal dengan ralat kuota
- Ralat 429 dalam log aplikasi

**Penyelesaian:**
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

### Isu 2: Kegagalan Pengesahan

**Gejala:**
- Ralat 401/403 semasa memanggil perkhidmatan AI
- Mesej "Akses ditolak"

**Penyelesaian:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isu 3: Masalah Penyebaran Model

**Gejala:**
- Model tidak tersedia dalam penyebaran
- Versi model tertentu gagal

**Penyelesaian:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Templat Contoh

### Aplikasi Sembang Asas

**Repositori**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Perkhidmatan**: Azure OpenAI + Cognitive Search + App Service

**Permulaan Pantas**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Saluran Pemprosesan Dokumen

**Repositori**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Perkhidmatan**: Document Intelligence + Storage + Functions

**Permulaan Pantas**:
```bash
azd init --template ai-document-processing
azd up
```

### Sembang Korporat dengan RAG

**Repositori**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Perkhidmatan**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Permulaan Pantas**:
```bash
azd init --template contoso-chat
azd up
```

## Langkah Seterusnya

1. **Cuba Contoh**: Mulakan dengan templat pra-bina yang sesuai dengan kes penggunaan anda
2. **Sesuaikan untuk Keperluan Anda**: Ubah suai infrastruktur dan kod aplikasi
3. **Tambah Pemantauan**: Laksanakan pemerhatian yang komprehensif
4. **Optimumkan Kos**: Laraskan konfigurasi mengikut bajet anda
5. **Amankan Penyebaran Anda**: Laksanakan corak keselamatan perusahaan
6. **Skala ke Pengeluaran**: Tambah ciri multi-region dan ketersediaan tinggi

## Komuniti dan Sokongan

- **Discord Azure AI Foundry**: [Saluran #Azure](https://discord.gg/microsoft-azure)
- **GitHub AZD**: [Isu dan perbincangan](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Dokumentasi rasmi](https://learn.microsoft.com/azure/ai-studio/)

---

**Sebelumnya:** [Projek Pertama](../getting-started/first-project.md) | **Seterusnya:** [Penyebaran Model AI](ai-model-deployment.md)

**Perlu Bantuan?** Sertai perbincangan komuniti kami atau buka isu dalam repositori. Komuniti Azure AI + AZD sedia membantu anda berjaya!

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.