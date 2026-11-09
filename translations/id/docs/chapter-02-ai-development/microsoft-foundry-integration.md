# Integrasi Microsoft Foundry dengan AZD

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-Pertama
- **⬅️ Bab Sebelumnya**: [Bab 1: Proyek Pertamamu](../chapter-01-foundation/first-project.md)
- **➡️ Berikutnya**: [Agen AI](agents.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Ikhtisar

Panduan ini menunjukkan cara mengintegrasikan layanan Microsoft Foundry dengan Azure Developer CLI (AZD) untuk penyebaran aplikasi AI yang lebih lancar. Microsoft Foundry menyediakan platform komprehensif untuk membangun, menyebarkan, dan mengelola aplikasi AI, sementara AZD menyederhanakan proses infrastruktur dan penyebaran.

## Apa itu Microsoft Foundry?

Microsoft Foundry adalah platform terpadu Microsoft untuk pengembangan AI yang mencakup:

- **Katalog Model**: Akses ke model AI tercanggih
- **Prompt Flow**: Perancang visual untuk alur kerja AI
- **Portal Microsoft Foundry**: Lingkungan pengembangan terintegrasi untuk aplikasi AI
- **Opsi Penyebaran**: Berbagai pilihan hosting dan penskalaan
- **Keamanan dan Keselamatan**: Fitur AI bertanggung jawab bawaan

## AZD + Microsoft Foundry: Lebih Baik Bersama

| Fitur | Microsoft Foundry | Manfaat Integrasi AZD |
|---------|-----------------|------------------------|
| **Penyebaran Model** | Penyebaran portal manual | Penyebaran otomatis dan dapat diulang |
| **Infrastruktur** | Provisioning klik | Infrastruktur sebagai Kode (Bicep) |
| **Manajemen Lingkungan** | Fokus lingkungan tunggal | Multi-lingkungan (dev/staging/prod) |
| **Integrasi CI/CD** | Terbatas | Dukungan native GitHub Actions |
| **Manajemen Biaya** | Pemantauan dasar | Optimasi biaya spesifik lingkungan |

## Prasyarat

- Langganan Azure dengan izin yang sesuai
- Azure Developer CLI terinstal
- Akses ke layanan Model Microsoft Foundry
- Familiaritas dasar dengan Microsoft Foundry

> **Tinjauan rilis (2026-11-04):** Panduan AI CLI diperiksa terhadap dokumentasi/sumber `azd` `1.37.2`, agen `1.0.0-beta.23`, dan evaluasi `1.0.0-beta.2`. Gunakan `azd >= 1.37.0` untuk alur kerja gabungan. Lihat [perubahan dan perbaikan rilis](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); tinjauan ini tidak menjamin setiap template atau contoh SDK terhadap penyebaran langsung.

## Pola Integrasi Inti

**Ruang Lingkup Contoh:** Bicep di bawah ini berisi fragmen sumber daya ilustratif, bukan template yang lengkap untuk disebarkan. Template induk harus mendefinisikan nama, `location`, sumber daya yang direferensikan, identitas, keluaran, dan hosting aplikasi. Gunakan sampel terhubung sebagai titik awal yang dapat dijalankan. Contoh Bash memerlukan autentikasi Azure CLI secara terpisah dari `azd auth login`.

### Pola 1: Integrasi Model Microsoft Foundry

**Kasus Penggunaan**: Menyebarkan aplikasi chat dengan model Azure OpenAI di Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
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
    disableLocalAuth: true
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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Pemanggil memerlukan identitas terkelola yang terpasang dan `Cognitive Services OpenAI User` pada lingkup akun; menonaktifkan kunci tidak memberi akses. Verifikasi ketersediaan wilayah/model/SKU dan kuota sebelum penyebaran.

### Pola 2: Integrasi AI Search + RAG

**Kasus Penggunaan**: Menyebarkan aplikasi generasi berbantuan pengambilan (RAG)

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

```

Tidak ada sumber daya ARM `Microsoft.Search/searchServices/dataConnections` untuk integrasi ini. Konfigurasikan indeks Search, sumber data, indexer/skillset atau vectorizer melalui API data-plane Search yang didukung. Jika Search memanggil model embedding, aktifkan identitas terkelolanya, beri peran model yang relevan, dan konfigurasi skill embedding/vectorizer-punya. Lihat [vektorisasi terintegrasi](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

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

Kecuali untuk pengaturan AZD yang didokumentasikan seperti `AZURE_LOCATION`, ini adalah **nama input template kustom**. Mereka tidak berpengaruh kecuali template/aplikasi menggunakannya melalui peta parameter dan host-environment. Untuk `azure-search-openai-demo`, gunakan nama aktualnya seperti `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` dan `AZURE_SEARCH_SERVICE_SKU`. Kapasitas model bukan SKU akun.

**Konfigurasi Produksi:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

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

Utamakan Entra ID dengan autentikasi kunci lokal dinonaktifkan. Berikut ini hanya **alternatif autentikasi kunci warisan** untuk aplikasi yang memerlukan kunci: membutuhkan akun dengan autentikasi kunci diaktifkan, identitas aplikasi terpasang pada host-nya, dan akses/jaringan Key Vault yang berfungsi. Jangan gabungkan pengambilan kunci dengan `disableLocalAuth: true` dan berharap panggilan berbasis kunci berfungsi.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

## Alur Kerja Penyebaran

### Ekstensi AZD untuk Foundry

AZD menyediakan ekstensi yang menambahkan kemampuan khusus AI untuk bekerja dengan layanan Microsoft Foundry:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

Ekstensi AI masih berkembang cepat dalam versi preview. Jika suatu perintah berperilaku berbeda dari yang ditampilkan di sini, perbarui ekstensi terkait sebelum memecahkan masalah proyek itu sendiri.

### Penyebaran Berbasis Agen Pertama dengan `azd ai`

Gunakan `azd ai agent init` secara interaktif, atau gunakan template proyek agen `azure.yaml` saat ini yang terhubung ke Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` menggantikan ejaan `--manifest`/`-m` yang sudah usang; manifest warisan dan konfigurasi agen bersarang masih perlu migrasi. Evaluasi agen dengan `azd ai eval` dari `azure.ai.evaluations`, bukan alur kerja warisan yang dihapus. Lihat [migrasi evaluasi](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) untuk pengaturan, eksekusi, dan hasil.

Lihat [Perintah AI CLI AZD](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk referensi perintah dan flag lengkap.

### Penyebaran Satu Perintah

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Penyebaran Spesifik Lingkungan

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
```

Ini mengatur sumber daya Insights, bukan instrumentasi telemetri. Setelah aplikasi Anda mengeluarkan span panggilan model keluar, jalankan kueri ilustratif ini di Application Insights Logs (sesuaikan filter dengan nama span Anda):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Pemantauan Biaya

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Gunakan penerima nyata dan periksa izin lingkup penagihan. Anggaran mengirimkan peringatan; ini bukan batas pengeluaran.

## 🔐 Praktik Keamanan Terbaik

### Konfigurasi Identitas Terkelola

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

Fragmen titik akhir ini juga memerlukan zona DNS privat/grup, tautan VNet, konektivitas aplikasi VNet, dan kebijakan akses publik eksplisit. Membuat endpoint privat saja tidak menonaktifkan akses publik.

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

## Optimasi Kinerja

### Strategi Caching

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache for Redis Basic/Standard/Premium berada pada [jalur pensiun](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); gunakan Azure Managed Redis untuk penyebaran baru dan ikuti panduan template/autentikasi terbarunya. Tetapkan cakupan respons AI yang di-cache berdasarkan otorisasi, model/instruksi, dan versi data, dengan kedaluwarsa; jangan pernah membagikan respons pribadi hanya dengan teks kueri.

### Konfigurasi Penyesuaian Otomatis

**Sumber daya parsial:** gabungkan pengaturan skala/ingress ini ke dalam Container App lengkap dengan lingkungan terkelola, gambar container, dan batas sumber daya. Lebih banyak replika tidak meningkatkan kuota model.

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
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Variabel kapasitas di atas hanya berlaku untuk template kustom yang dirancang untuk mengonsumsinya. Untuk sampel RAG, gunakan `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Jangan ubah `AZURE_LOCATION` untuk memindahkan sumber daya yang sudah ada; buat lingkungan terpisah untuk wilayah baru dan rencanakan migrasi/pembersihan.

### Masalah 2: Gagal Otentikasi

**Gejala:**
- Kesalahan 401/403 saat memanggil layanan AI
- Pesan "Akses ditolak"

**Solusi:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Masalah 3: Masalah Penyebaran Model

**Gejala:**
- Model tidak tersedia dalam penyebaran
- Versi model tertentu gagal

**Solusi:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Contoh Template

Ini adalah alternatif, bukan perintah berurutan. Mulai masing-masing di direktori kosong terpisah. Tujuan `.` yang eksplisit menjaga inisialisasi di direktori saat ini; jika tidak, AZD saat ini dapat membuat direktori anak bernama template tanpa mengubah direktori kerja shell Anda.

### Aplikasi Chat RAG (Python)

**Repositori**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Layanan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Deskripsi**: Aplikasi referensi chat RAG untuk pertanyaan atas dokumen Anda, dengan pengambilan Azure AI Search. Tinjau model yang didukung sampel saat ini, fitur opsional, panduan biaya, dan pengerasan produksi sebelum digunakan; menyebarkan sampel tidak membuat aplikasi siap produksi.

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplikasi Chat RAG (.NET)

**Repositori**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Layanan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Deskripsi**: Setara .NET/C# dari sampel chat RAG Python. Dibangun dengan ASP.NET Core Minimal API dan frontend Blazor WebAssembly. Termasuk chat suara, dukungan visi GPT-4o-mini, dan klien pendamping .NET MAUI Blazor Hybrid desktop/mobile.

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplikasi Chat RAG (Java)

**Repositori**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Layanan**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Deskripsi**: Versi Java dari sampel chat RAG menggunakan Langchain4J untuk orkestrasi AI. Mendukung arsitektur event-driven microservice, berbagai strategi pencarian (teks, vektor, hibrid), unggah dokumen dengan Azure Document Intelligence, dan penyebaran pada Azure Container Apps atau Azure Kubernetes Service.

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Kopilot Ritel Enterprise dengan Microsoft Foundry

**Repositori**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Layanan**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Deskripsi**: Kopilot RAG ritel ujung-ke-ujung menggunakan Microsoft Foundry dan Prompty. Chatbot retailer Contoso Outdoor yang mendasarkan respons pada katalog produk dan data pesanan pelanggan. Menunjukkan alur kerja penuh GenAIOps — prototipe dengan Prompty, evaluasi dengan evaluator berbantu AI, dan penyebaran melalui AZD ke Container Apps.

**Mulai Cepat**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplikasi Multi-Agen Penulis Kreatif

**Repositori**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Layanan**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Deskripsi**: Sampel multi-agen yang menunjukkan orkestrasi agen AI dengan Prompty. Menggunakan agen riset (Bing Grounding dalam Azure AI Agent Service), agen produk (Azure AI Search), agen penulis, dan agen editor untuk secara kolaboratif menghasilkan artikel yang ter-research dengan baik. Termasuk CI/CD dengan evaluasi di GitHub Actions.

**Mulai Cepat**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Tanpa Server (JavaScript/TypeScript)

**Repositori**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Layanan**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB untuk NoSQL + LangChain.js

**Deskripsi**: Chatbot RAG sepenuhnya serverless menggunakan LangChain.js dengan Azure Functions untuk API dan Azure Static Web Apps untuk hosting. Menggunakan Azure Cosmos DB sebagai penyimpanan vektor dan basis data riwayat chat. Mendukung pengembangan lokal dengan Ollama untuk pengujian tanpa biaya.

**Mulai Cepat**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Solusi Percepatan Chat dengan Data Anda

**Repositori**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Layanan**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search dengan Cosmos DB, atau PostgreSQL dengan pgvector

**Deskripsi**: Percepatan chat yang didukung dokumen dengan sitasi. Sampel saat ini menyelenggarakan frontend React, backend FastAPI, dan pekerja ingestion Functions di Container Apps; pilihan orkestrator adalah Agent Framework dan LangGraph. Opsi database/pengambilan dipilih saat penyebaran. Ini adalah titik awal, bukan sistem produksi turnkey; jangan menganggap varian App Service, Semantic Kernel, atau Prompt Flow yang lebih lama menggambarkan default saat ini.

**Mulai Cepat**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agen Perjalanan AI — Orkestrasi MCP Multi-Agen

**Repositori**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Layanan**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Deskripsi**: Aplikasi referensi untuk orkestrasi AI multi-agen menggunakan tiga framework (LangChain.js, LlamaIndex.TS, dan Microsoft Agent Framework). Menampilkan server MCP (Model Context Protocol) dalam empat bahasa yang dideploy sebagai Azure Container Apps serverless dengan monitoring OpenTelemetry.

**Mulai Dengan Cepat**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Jelajahi lebih banyak template**: Kunjungi [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) untuk template yang saat ini tersedia lintas bahasa dan skenario. Setiap contoh yang terhubung adalah repositori eksternal, bukan contoh lokal yang disediakan oleh kursus ini; periksa prasyarat dan panduan produksi saat ini sebelum melakukan deployment.

## Langkah Selanjutnya

1. **Coba Contoh**: Mulai dengan template bawaan yang sesuai dengan kasus penggunaan Anda
2. **Sesuaikan dengan Kebutuhan Anda**: Modifikasi infrastruktur dan kode aplikasi
3. **Tambahkan Monitoring**: Terapkan observabilitas yang komprehensif
4. **Optimalkan Biaya**: Sesuaikan konfigurasi sesuai anggaran Anda
5. **Amankan Deployment**: Terapkan pola keamanan perusahaan
6. **Skalakan ke Produksi**: Tambahkan fitur multi-wilayah dan ketersediaan tinggi

## 🎯 Latihan Praktik

### Latihan 1: Deploy Aplikasi Chat Model Microsoft Foundry (30 menit)
**Tujuan**: Deploy dan uji aplikasi chat AI referensi

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Deployment selesai tanpa error kuota
- [ ] Bisa mengakses antarmuka chat di browser
- [ ] Bisa mengajukan pertanyaan dan mendapat balasan dari AI
- [ ] Application Insights menampilkan data telemetry
- [ ] Sukses membersihkan resource

**Biaya:** Tinjau panduan biaya dan SKU pilihan dari sampel saat ini sebelum deploy. Penagihan berlanjut sampai resource dihapus; tidak ada estimasi tetap 30 menit untuk setiap konfigurasi.

### Latihan 2: Konfigurasikan Deployment Multi-Model (45 menit)
**Tujuan**: Deploy beberapa model AI dengan konfigurasi berbeda

**Titik awal:** Akun Azure OpenAI yang sudah ada dan modul resource-group AZD yang dapat memanggil file ini. Buat `infra/ai-models.bicep` dengan konten berikut menggunakan editor Anda. File ini tidak otomatis dideploy hanya karena berada di bawah `infra/`.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
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
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Dari modul scoped ke resource group yang memiliki akun, tambahkan pemanggilan modul (sesuaikan nama simbol dengan akun Anda sebenarnya):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Jangan deklarasikan deployment yang sama di kedua modul. Jika entry point AZD scoped ke subscription, panggil ini dari modul anak yang scoped ke resource group dan sesuaikan path relatifnya. Bangun modul yang memuat itu dengan `az bicep build --file <path-to-containing-module>`, lalu:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kriteria Keberhasilan:**
- [ ] Beberapa model berhasil dideploy
- [ ] Pengaturan kapasitas berbeda diterapkan
- [ ] Model dapat diakses melalui API
- [ ] Bisa memanggil kedua model dari aplikasi

### Latihan 3: Implementasikan Monitoring Biaya (20 menit)
**Tujuan**: Menyiapkan alert anggaran dan pelacakan biaya

**Titik awal:** Pola anggaran di atas dan modul infrastruktur scoped ke resource group. Tambahkan resource ini menggunakan editor Anda; oper parameter `budgetStartDate` dari pemetaan parameter Anda (jangan duplikasi jika sudah dideklarasikan). Ganti penerima dan pastikan Anda memiliki akses tulis ke anggaran.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Diharapkan: respons berisi `amount: 200`, kedua threshold, dan penerima Anda. Periksa Cost Management di portal untuk tagihan aktual; data biaya terlambat dan alert tidak perlu aktif selama latihan singkat.

**Kriteria Keberhasilan:**
- [ ] Alert anggaran dibuat di Azure
- [ ] Notifikasi email dikonfigurasi
- [ ] Bisa melihat data biaya di Azure Portal
- [ ] Threshold anggaran ditetapkan dengan tepat

## 💡 Pertanyaan yang Sering Diajukan

<details>
<summary><strong>Bagaimana cara mengurangi biaya Microsoft Foundry Models selama pengembangan?</strong></summary>

1. **Periksa harga**: Tidak ada kuota gratis universal 50.000 token per bulan untuk model Azure OpenAI
2. **Sesuaikan kapasitas**: Kapasitas `10` biasanya mewakili 10.000 TPM untuk model teks Standar ini, bukan 10 TPM. Mengurangi batas ini tidak mengurangi harga per token
3. **Gunakan azd down**: Hapus resource yang bisa dibuang saat tidak aktif mengembangkan (ini bukan pengurangan alokasi)
4. **Cache Jawaban**: Terapkan cache Redis untuk pertanyaan berulang
5. **Gunakan Prompt Engineering**: Kurangi penggunaan token dengan prompt yang efisien

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Apa perbedaan antara Microsoft Foundry Models dan OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Keamanan dan kepatuhan perusahaan
- Integrasi jaringan privat
- Jaminan SLA
- Otentikasi identitas terkelola
- Kuota lebih tinggi tersedia

**OpenAI API**: Penyedia/API terpisah dengan ketersediaan model, harga, otentikasi, dan opsi konektivitas enterprise sendiri. Bandingkan penawaran saat ini daripada mengira hanya untuk internet publik atau selalu mengirim model paling awal.

Pilih berdasarkan kebutuhan organisasi Anda; contoh identitas terkelola dan private-link spesifik Azure dalam kursus ini berlaku untuk layanan yang dihosting Azure, bukan setiap model/penyedia dalam katalog Foundry.
</details>

<details>
<summary><strong>Bagaimana menangani error kuota Microsoft Foundry Models terlampaui?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Bisakah saya menggunakan data sendiri dengan Microsoft Foundry Models?</strong></summary>

Ya! Gunakan **Azure AI Search** untuk RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Lihat template [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Bagaimana cara mengamankan endpoint model AI?</strong></summary>

**Praktik Terbaik**:
1. Gunakan Managed Identity (tanpa kunci API)
2. Aktifkan Private Endpoints
3. Konfigurasi grup keamanan jaringan
4. Terapkan pembatasan laju (rate limiting)
5. Gunakan Azure Key Vault untuk rahasia

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
- **AZD GitHub**: [Issues dan diskusi](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Dokumentasi resmi](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Skill Microsoft Foundry di skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Pasang skill agen Azure + Foundry di editor Anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-First
- **⬅️ Bab Sebelumnya**: [Bab 1: Proyek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Selanjutnya**: [AI Agents](agents.md)
- **🚀 Bab Selanjutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlu Bantuan?** Bergabunglah dalam diskusi komunitas kami atau buka issue di repositori. Komunitas Azure AI + AZD di sini untuk membantu Anda sukses!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->