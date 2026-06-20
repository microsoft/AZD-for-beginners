# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Beranda Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berorientasi AI
- **⬅️ Bab Sebelumnya**: [Bab 1: Proyek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Selanjutnya**: [Penerapan Model AI](ai-model-deployment.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Ikhtisar

Panduan ini menunjukkan cara mengintegrasikan layanan Microsoft Foundry dengan Azure Developer CLI (AZD) untuk penyebaran aplikasi AI yang lebih efisien. Microsoft Foundry menyediakan platform komprehensif untuk membangun, menyebarkan, dan mengelola aplikasi AI, sementara AZD menyederhanakan proses infrastruktur dan penyebaran.

## Apa itu Microsoft Foundry?

Microsoft Foundry adalah platform terpadu Microsoft untuk pengembangan AI yang mencakup:

- **Model Catalog**: Akses ke model AI mutakhir
- **Prompt Flow**: Desainer visual untuk alur kerja AI
- **Microsoft Foundry Portal**: Lingkungan pengembangan terintegrasi untuk aplikasi AI
- **Deployment Options**: Berbagai opsi hosting dan penskalaan
- **Safety and Security**: Fitur AI bertanggung jawab bawaan

## AZD + Microsoft Foundry: Lebih Baik Bersama

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prasyarat

- Langganan Azure dengan izin yang sesuai
- Azure Developer CLI terpasang
- Akses ke layanan Microsoft Foundry Models
- Familiaritas dasar dengan Microsoft Foundry

> **Current AZD baseline:** These examples were reviewed against `azd` `1.23.12`. For the AI agent workflow, use the current preview extension release and check your installed version before you begin.

## Pola Integrasi Inti

### Pola 1: Integrasi Microsoft Foundry Models

**Kasus Penggunaan**: Menyebarkan aplikasi obrolan dengan model Microsoft Foundry Models

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
// Microsoft Foundry Models Account
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
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Pola 2: Integrasi AI Search + RAG

**Kasus Penggunaan**: Menyebarkan aplikasi retrieval-augmented generation (RAG)

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
# Layanan inti AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurasi model
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Pengaturan kinerja
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurasi Pengembangan:**
```bash
# Pengaturan yang dioptimalkan untuk biaya pengembangan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Tingkat gratis
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

### Ekstensi AZD untuk Foundry

AZD menyediakan ekstensi yang menambahkan kemampuan khusus AI untuk bekerja dengan layanan Microsoft Foundry:

```bash
# Instal ekstensi agen Foundry
azd extension install azure.ai.agents

# Instal ekstensi penyetelan halus
azd extension install azure.ai.finetune

# Instal ekstensi model kustom
azd extension install azure.ai.models

# Daftar ekstensi yang terinstal
azd extension list --installed

# Periksa versi ekstensi agen yang saat ini terinstal
azd extension show azure.ai.agents
```

Ekstensi AI masih berkembang dengan cepat dalam preview. Jika sebuah perintah berperilaku berbeda dari yang ditunjukkan di sini, perbarui ekstensi terkait sebelum men-troubleshoot proyek itu sendiri.

### Penerapan Berbasis Agen dengan `azd ai`

Jika Anda memiliki manifes agen, gunakan `azd ai agent init` untuk men-scaffold proyek yang terhubung ke Foundry Agent Service:

```bash
# Inisialisasi dari manifes agen
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Terapkan ke Azure
azd up
```

Rilis preview terbaru dari `azure.ai.agents` juga menambahkan dukungan inisialisasi berbasis templat untuk `azd ai agent init`. Jika Anda mengikuti contoh agen yang lebih baru, periksa bantuan ekstensi untuk flag tepat yang tersedia di versi yang terpasang.

Lihat [Perintah AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk referensi perintah dan flag lengkap.

### Penerapan dengan Satu Perintah

```bash
# Terapkan semuanya dengan satu perintah
azd up

# Atau terapkan secara bertahap
azd provision  # Hanya infrastruktur
azd deploy     # Hanya aplikasi

# Untuk penerapan aplikasi AI jangka panjang di azd 1.23.11+
azd deploy --timeout 1800
```

### Penerapan Spesifik Lingkungan

```bash
# Lingkungan pengembangan
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Lingkungan produksi
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

## 🔐 Praktik Keamanan Terbaik

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

## Optimisasi Kinerja

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
- Penyebaran gagal dengan kesalahan kuota
- Kesalahan 429 di log aplikasi

**Solusi:**
```bash
# Periksa penggunaan kuota saat ini
az cognitiveservices usage list --location eastus

# Coba wilayah lain
azd env set AZURE_LOCATION westus2
azd up

# Kurangi kapasitas sementara
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Masalah 2: Kegagalan Otentikasi

**Gejala:**
- Kesalahan 401/403 saat memanggil layanan AI
- Pesan "Access denied"

**Solusi:**
```bash
# Verifikasi penetapan peran
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Periksa konfigurasi identitas terkelola
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validasi akses ke Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Masalah 3: Masalah Penerapan Model

**Gejala:**
- Model tidak tersedia dalam penyebaran
- Versi model tertentu gagal

**Solusi:**
```bash
# Daftar model yang tersedia berdasarkan wilayah
az cognitiveservices model list --location eastus

# Perbarui versi model dalam templat Bicep
# Periksa persyaratan kapasitas model
```

## Template Contoh

### Aplikasi Obrolan RAG (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Layanan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Deskripsi**: Sampel Azure AI yang paling populer — aplikasi obrolan RAG siap produksi yang memungkinkan Anda mengajukan pertanyaan terhadap dokumen Anda sendiri. Menggunakan GPT-4.1-mini untuk obrolan, text-embedding-3-large untuk embeddings, dan Azure AI Search untuk pengambilan. Mendukung dokumen multimodal, input/output suara, otentikasi Microsoft Entra, dan pelacakan Application Insights.

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplikasi Obrolan RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Layanan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Deskripsi**: Padanan .NET/C# dari sampel obrolan RAG Python. Dibangun dengan ASP.NET Core Minimal API dan frontend Blazor WebAssembly. Menyertakan obrolan suara, dukungan GPT-4o-mini vision, dan klien desktop/mobile .NET MAUI Blazor Hybrid pendamping.

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplikasi Obrolan RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Layanan**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Deskripsi**: Versi Java dari sampel obrolan RAG yang menggunakan Langchain4J untuk orkestrasi AI. Mendukung arsitektur mikroservis berbasis peristiwa, beberapa strategi pencarian (teks, vektor, hibrida), unggah dokumen dengan Azure Document Intelligence, dan penyebaran pada Azure Container Apps atau Azure Kubernetes Service.

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot dengan Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Layanan**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Deskripsi**: Copilot RAG ritel ujung-ke-ujung menggunakan Microsoft Foundry dan Prompty. Chatbot Contoso Outdoor yang menghubungkan respons ke katalog produk dan data pesanan pelanggan. Menunjukkan alur kerja GenAIOps lengkap — prototipe dengan Prompty, evaluasi dengan evaluator berbantuan AI, dan penyebaran melalui AZD ke Container Apps.

**Mulai Cepat**:
```bash
azd init --template contoso-chat
azd up
```

### Aplikasi Multi-Agen Penulisan Kreatif

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Layanan**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Deskripsi**: Sampel multi-agen yang menunjukkan orkestrasi agen AI dengan Prompty. Menggunakan agen riset (Bing Grounding di Azure AI Agent Service), agen produk (Azure AI Search), agen penulis, dan agen editor untuk menghasilkan artikel yang didasarkan pada riset bersama. Termasuk CI/CD dengan evaluasi di GitHub Actions.

**Mulai Cepat**:
```bash
azd init --template contoso-creative-writer
azd up
```

### RAG Chat Serverless (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Layanan**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Deskripsi**: Chatbot RAG sepenuhnya serverless menggunakan LangChain.js dengan Azure Functions untuk API dan Azure Static Web Apps untuk hosting. Menggunakan Azure Cosmos DB sebagai vector store dan basis data riwayat obrolan. Mendukung pengembangan lokal dengan Ollama untuk pengujian tanpa biaya.

**Mulai Cepat**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Layanan**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Deskripsi**: Accelerator solusi RAG tingkat perusahaan dengan portal admin untuk unggah/manajemen dokumen, beberapa opsi orkestrator (Semantic Kernel, LangChain, Prompt Flow), speech-to-text, integrasi Microsoft Teams, dan pilihan backend PostgreSQL atau Cosmos DB. Dirancang sebagai titik awal yang dapat disesuaikan untuk skenario RAG produksi.

**Mulai Cepat**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Orkestrasi Multi-Agen MCP

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Layanan**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Deskripsi**: Aplikasi referensi untuk orkestrasi AI multi-agen menggunakan tiga kerangka kerja (LangChain.js, LlamaIndex.TS, dan Microsoft Agent Framework). Menampilkan server MCP (Model Context Protocol) dalam empat bahasa yang disebarkan sebagai Azure Container Apps serverless dengan pemantauan OpenTelemetry.

**Mulai Cepat**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Layanan**: Azure AI Services + Azure OpenAI

**Deskripsi**: Templat Bicep minimal yang menyebarkan layanan Azure AI dengan model machine learning yang dikonfigurasi. Titik awal ringan ketika Anda hanya membutuhkan infrastruktur Azure AI yang disediakan tanpa tumpukan aplikasi penuh.

**Mulai Cepat**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Jelajahi lebih banyak template**: Kunjungi [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) untuk 80+ template AZD khusus AI di berbagai bahasa dan skenario.

## Langkah Selanjutnya

1. **Coba Contoh**: Mulai dengan templat pra-bangun yang sesuai dengan kasus penggunaan Anda
2. **Sesuaikan untuk Kebutuhan Anda**: Ubah infrastruktur dan kode aplikasi
3. **Tambahkan Pemantauan**: Terapkan observabilitas yang komprehensif
4. **Optimalkan Biaya**: Sesuaikan konfigurasi sesuai anggaran Anda
5. **Amankan Penerapan Anda**: Terapkan pola keamanan enterprise
6. **Skalakan ke Produksi**: Tambahkan fitur multi-region dan ketersediaan tinggi

## 🎯 Latihan Praktik

### Latihan 1: Sebarkan Aplikasi Obrolan Microsoft Foundry Models (30 menit)
**Tujuan**: Menyebarkan dan menguji aplikasi obrolan AI siap produksi

```bash
# Inisialisasi templat
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Atur variabel lingkungan
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Sebarkan
azd up

# Uji aplikasi
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Pantau operasi AI
azd monitor

# Bersihkan
azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Penyebaran selesai tanpa kesalahan kuota
- [ ] Dapat mengakses antarmuka obrolan di browser
- [ ] Dapat mengajukan pertanyaan dan menerima respons bertenaga AI
- [ ] Application Insights menunjukkan data telemetri
- [ ] Berhasil membersihkan sumber daya

**Perkiraan Biaya**: $5-10 untuk 30 menit pengujian

### Latihan 2: Konfigurasi Penyebaran Multi-Model (45 menit)
**Tujuan**: Menyebarkan beberapa model AI dengan konfigurasi berbeda

```bash
# Buat konfigurasi Bicep khusus
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Terapkan dan verifikasi
azd provision
azd show
```

**Kriteria Keberhasilan:**
- [ ] Beberapa model berhasil disebarkan
- [ ] Pengaturan kapasitas berbeda diterapkan
- [ ] Model dapat diakses melalui API
- [ ] Dapat memanggil kedua model dari aplikasi

### Latihan 3: Terapkan Pemantauan Biaya (20 menit)
**Tujuan**: Mengatur peringatan anggaran dan pelacakan biaya

```bash
# Tambahkan peringatan anggaran ke Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# Terapkan peringatan anggaran
azd provision

# Periksa biaya saat ini
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteria Keberhasilan:**
- [ ] Peringatan anggaran dibuat di Azure
- [ ] Notifikasi email dikonfigurasi
- [ ] Dapat melihat data biaya di Azure Portal
- [ ] Ambang anggaran diatur dengan tepat

## 💡 Pertanyaan yang Sering Diajukan

<details>
<summary><strong>Bagaimana cara mengurangi biaya Microsoft Foundry Models selama pengembangan?</strong></summary>

1. **Gunakan Tingkat Gratis**: Microsoft Foundry Models menawarkan 50.000 token/bulan gratis
2. **Kurangi Kapasitas**: Atur kapasitas ke 10 TPM alih-alih 30+ untuk pengembangan
3. **Gunakan azd down**: Dealokasikan sumber daya saat tidak sedang mengembangkan
4. **Cache Respons**: Implementasikan cache Redis untuk kueri berulang
5. **Gunakan Prompt Engineering**: Kurangi penggunaan token dengan prompt yang efisien


```bash
# Konfigurasi pengembangan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Apa perbedaan antara Microsoft Foundry Models dan OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Keamanan dan kepatuhan perusahaan
- Integrasi jaringan privat
- Jaminan SLA
- Otentikasi Managed Identity
- Kuota yang lebih tinggi tersedia

**OpenAI API**:
- Akses lebih cepat ke model baru
- Pengaturan lebih sederhana
- Hambatan masuk lebih rendah
- Hanya internet publik

Untuk aplikasi produksi, **Microsoft Foundry Models direkomendasikan**.
</details>

<details>
<summary><strong>Bagaimana cara saya menangani kesalahan kuota terlampaui pada Microsoft Foundry Models?</strong></summary>

```bash
# Periksa kuota saat ini
az cognitiveservices usage list --location eastus2

# Coba wilayah berbeda
azd env set AZURE_LOCATION westus2
azd up

# Kurangi kapasitas untuk sementara
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Minta peningkatan kuota
# Buka Azure Portal > Kuota > Ajukan peningkatan
```
</details>

<details>
<summary><strong>Bisakah saya menggunakan data saya sendiri dengan Microsoft Foundry Models?</strong></summary>

Ya! Gunakan **Azure AI Search** untuk RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Lihat template [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Bagaimana cara saya mengamankan endpoint model AI?</strong></summary>

**Praktik Terbaik**:
1. Gunakan Managed Identity (tanpa kunci API)
2. Aktifkan Private Endpoints
3. Konfigurasikan grup keamanan jaringan
4. Terapkan pembatasan laju
5. Gunakan Azure Key Vault untuk menyimpan rahasia

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Komunitas dan Dukungan

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Isu dan diskusi](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Dokumentasi resmi](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [skill Microsoft Foundry di skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instal skill agen Azure + Foundry di editor Anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berorientasi AI
- **⬅️ Bab Sebelumnya**: [Bab 1: Proyek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Berikutnya**: [Penerapan Model AI](ai-model-deployment.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlu Bantuan?** Bergabunglah dengan diskusi komunitas kami atau buka issue di repositori. Komunitas Azure AI + AZD ada di sini untuk membantu Anda berhasil!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->