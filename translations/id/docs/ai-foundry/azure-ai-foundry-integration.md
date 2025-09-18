<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-18T07:55:35+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "id"
}
-->
# Integrasi Azure AI Foundry dengan AZD

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berbasis AI
- **⬅️ Bab Sebelumnya**: [Bab 1: Proyek Pertama Anda](../getting-started/first-project.md)
- **➡️ Selanjutnya**: [Penerapan Model AI](ai-model-deployment.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)

## Ikhtisar

Panduan ini menunjukkan cara mengintegrasikan layanan Azure AI Foundry dengan Azure Developer CLI (AZD) untuk penerapan aplikasi AI yang lebih efisien. Azure AI Foundry menyediakan platform lengkap untuk membangun, menerapkan, dan mengelola aplikasi AI, sementara AZD menyederhanakan proses infrastruktur dan penerapan.

## Apa itu Azure AI Foundry?

Azure AI Foundry adalah platform terpadu dari Microsoft untuk pengembangan AI yang mencakup:

- **Model Catalog**: Akses ke model AI terkini
- **Prompt Flow**: Desainer visual untuk alur kerja AI
- **AI Foundry Portal**: Lingkungan pengembangan terintegrasi untuk aplikasi AI
- **Opsi Penerapan**: Beragam pilihan hosting dan skala
- **Keamanan dan Keselamatan**: Fitur AI yang bertanggung jawab bawaan

## AZD + Azure AI Foundry: Lebih Baik Bersama

| Fitur | Azure AI Foundry | Manfaat Integrasi AZD |
|-------|------------------|-----------------------|
| **Penerapan Model** | Penerapan manual melalui portal | Penerapan otomatis dan berulang |
| **Infrastruktur** | Penyediaan melalui klik | Infrastruktur sebagai Kode (Bicep) |
| **Manajemen Lingkungan** | Fokus pada satu lingkungan | Multi-lingkungan (dev/staging/prod) |
| **Integrasi CI/CD** | Terbatas | Dukungan GitHub Actions bawaan |
| **Manajemen Biaya** | Pemantauan dasar | Optimasi biaya spesifik lingkungan |

## Prasyarat

- Langganan Azure dengan izin yang sesuai
- Azure Developer CLI terinstal
- Akses ke layanan Azure OpenAI
- Pemahaman dasar tentang Azure AI Foundry

## Pola Integrasi Inti

### Pola 1: Integrasi Azure OpenAI

**Kasus Penggunaan**: Menerapkan aplikasi chat dengan model Azure OpenAI

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

### Pola 2: Integrasi AI Search + RAG

**Kasus Penggunaan**: Menerapkan aplikasi retrieval-augmented generation (RAG)

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

### Pola 3: Integrasi Document Intelligence

**Kasus Penggunaan**: Alur kerja pemrosesan dan analisis dokumen

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

## 🔧 Pola Konfigurasi

### Pengaturan Variabel Lingkungan

**Konfigurasi Produksi:**
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

**Konfigurasi Pengembangan:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Konfigurasi Aman dengan Key Vault

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

## Alur Kerja Penerapan

### Penerapan dengan Satu Perintah

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Penerapan Spesifik Lingkungan

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

## Pemantauan dan Observabilitas

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

### Pemantauan Biaya

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

## 🔐 Praktik Terbaik Keamanan

### Konfigurasi Managed Identity

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

### Keamanan Jaringan

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

## Optimasi Performa

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

## Pemecahan Masalah Umum

### Masalah 1: Kuota OpenAI Terlampaui

**Gejala:**
- Penerapan gagal dengan kesalahan kuota
- Kesalahan 429 dalam log aplikasi

**Solusi:**
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

### Masalah 2: Kegagalan Autentikasi

**Gejala:**
- Kesalahan 401/403 saat memanggil layanan AI
- Pesan "Akses ditolak"

**Solusi:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Masalah 3: Masalah Penerapan Model

**Gejala:**
- Model tidak tersedia dalam penerapan
- Versi model tertentu gagal

**Solusi:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Template Contoh

### Aplikasi Chat Dasar

**Repositori**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Layanan**: Azure OpenAI + Cognitive Search + App Service

**Panduan Cepat**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline Pemrosesan Dokumen

**Repositori**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Layanan**: Document Intelligence + Storage + Functions

**Panduan Cepat**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat Perusahaan dengan RAG

**Repositori**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Layanan**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Panduan Cepat**:
```bash
azd init --template contoso-chat
azd up
```

## Langkah Berikutnya

1. **Coba Contoh**: Mulai dengan template yang sudah dibuat sesuai kasus penggunaan Anda
2. **Sesuaikan dengan Kebutuhan Anda**: Modifikasi infrastruktur dan kode aplikasi
3. **Tambahkan Pemantauan**: Implementasikan observabilitas yang komprehensif
4. **Optimalkan Biaya**: Sesuaikan konfigurasi untuk anggaran Anda
5. **Amankan Penerapan Anda**: Terapkan pola keamanan tingkat perusahaan
6. **Skala ke Produksi**: Tambahkan fitur multi-region dan ketersediaan tinggi

## Komunitas dan Dukungan

- **Discord Azure AI Foundry**: [#Azure channel](https://discord.gg/microsoft-azure)
- **GitHub AZD**: [Masalah dan diskusi](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Dokumentasi resmi](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berbasis AI
- **⬅️ Bab Sebelumnya**: [Bab 1: Proyek Pertama Anda](../getting-started/first-project.md)
- **➡️ Selanjutnya**: [Penerapan Model AI](ai-model-deployment.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)

**Butuh Bantuan?** Bergabunglah dalam diskusi komunitas kami atau buka masalah di repositori. Komunitas Azure AI + AZD siap membantu Anda sukses!

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.