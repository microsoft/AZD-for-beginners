# Integrasi Microsoft Foundry dengan AZD

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Seterusnya**: [Ejen AI](agents.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Gambaran Keseluruhan

Panduan ini menunjukkan cara mengintegrasikan perkhidmatan Microsoft Foundry dengan Azure Developer CLI (AZD) untuk pelaksanaan aplikasi AI yang mudah. Microsoft Foundry menyediakan platform komprehensif untuk membina, melaksanakan, dan mengurus aplikasi AI, manakala AZD mempermudahkan proses infrastruktur dan pelaksanaan.

## Apakah Microsoft Foundry?

Microsoft Foundry adalah platform bersatu Microsoft untuk pembangunan AI yang merangkumi:

- **Katalog Model**: Akses kepada model AI terkini
- **Prompt Flow**: Pereka visual untuk aliran kerja AI
- **Portal Microsoft Foundry**: Persekitaran pembangunan terintegrasi untuk aplikasi AI
- **Pilihan Pelaksanaan**: Pelbagai pilihan hos dan pengskalaan
- **Keselamatan dan Keamanan**: Ciri AI bertanggungjawab terbina dalam

## AZD + Microsoft Foundry: Lebih Baik Bersama

| Ciri | Microsoft Foundry | Manfaat Integrasi AZD |
|---------|-----------------|------------------------|
| **Pelaksanaan Model** | Pelaksanaan portal manual | Pelaksanaan automatik dan boleh diulang |
| **Infrastruktur** | Penyediaan klik-lewat | Infrastruktur sebagai Kod (Bicep) |
| **Pengurusan Persekitaran** | Fokus pada satu persekitaran | Multi-persekitaran (dev/staging/prod) |
| **Integrasi CI/CD** | Terhad | Sokongan asli GitHub Actions |
| **Pengurusan Kos** | Pemantauan asas | Pengoptimuman kos khusus persekitaran |

## Prasyarat

- Langganan Azure dengan kebenaran yang sesuai
- Azure Developer CLI dipasang
- Akses kepada perkhidmatan Microsoft Foundry Models
- Kefahaman asas tentang Microsoft Foundry

> **Ulasan keluaran (2026-11-04):** Panduan AI CLI telah diperiksa dengan `azd` `1.37.2`, ejen `1.0.0-beta.23`, dan dokumentasi/sumber penilaian `1.0.0-beta.2`. Gunakan `azd >= 1.37.0` untuk aliran kerja gabungan. Lihat [perubahan dan pembaikan keluaran](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); ulasan ini tidak mengesahkan setiap templat atau contoh SDK terhadap pelaksanaan langsung.

## Corak Integrasi Teras

**Skop contoh:** Bicep di bawah mengandungi serpihan sumber ilustrasi, bukan templat lengkap yang boleh dilaksanakan. Templat mengandungi mesti menentukan nama, `location`, sumber dirujuk, identiti, keluaran, dan hos aplikasi. Gunakan contoh berkait untuk titik permulaan boleh jalan. Contoh Bash memerlukan pengesahan Azure CLI berasingan dari `azd auth login`.

### Corak 1: Integrasi Model Microsoft Foundry

**Kes Penggunaan**: Melaksanakan aplikasi sembang dengan model Azure OpenAI dalam Microsoft Foundry

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

Penelepon memerlukan identiti terurus terlampir dan `Cognitive Services OpenAI User` pada skop akaun; melumpuhkan kekunci tidak memberikan akses. Sahkan ketersediaan rantau/model/SKU dan kuota sebelum melaksanakan.

### Corak 2: Integrasi Carian AI + RAG

**Kes Penggunaan**: Melaksanakan aplikasi generasi diperkuatkan ambilan (RAG)

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

Tiada sumber ARM `Microsoft.Search/searchServices/dataConnections` untuk integrasi ini. Konfigurasikan indeks Carian, sumber data, pengindeks/set kemahiran atau vektorisasi melalui API data-plane Carian yang disokong. Jika Carian memanggil model penjelmaan, dayakan identiti terurusnya, berikan peranan model yang relevan, dan konfigurasikan kemahiran penjelmaan/vektorisasinya. Lihat [vektorisasi terintegrasi](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Corak 3: Integrasi Kecerdasan Dokumen

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

Kecuali tetapan AZD yang didokumenkan seperti `AZURE_LOCATION`, ini adalah **nama input templat khusus**. Ia tidak memberi kesan melainkan templat/aplikasi menggunakannya melalui parameter dan pemetaan persekitaran hos. Untuk `azure-search-openai-demo`, gunakan nama sebenar seperti `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` dan `AZURE_SEARCH_SERVICE_SKU` sebaliknya. Kapasiti model bukan SKU akaun.

**Konfigurasi Pengeluaran:**
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

**Konfigurasi Pembangunan:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Konfigurasi Selamat dengan Key Vault

Utamakan Entra ID dengan pengesahan kekunci tempatan dilumpuhkan. Berikut adalah **alternatif pengesahan kekunci warisan** untuk aplikasi yang memerlukan kekunci: ia memerlukan akaun dengan pengesahan kekunci diaktifkan, identiti aplikasi terlampir pada hosnya, dan akses/networks Key Vault berfungsi. Jangan gabungkan pengambilan kekunci dengan `disableLocalAuth: true` dan jangka panggilan berasaskan kekunci berfungsi.

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

## Aliran Kerja Pelaksanaan

### Sambungan AZD untuk Foundry

AZD menyediakan sambungan yang menambah keupayaan khusus AI untuk bekerja dengan perkhidmatan Microsoft Foundry:

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

Sambungan AI masih berkembang dengan cepat dalam pratonton. Jika arahan berkelakuan berlainan seperti yang ditunjukkan di sini, tingkatkan sambungan berkaitan sebelum menyelesaikan masalah projek itu sendiri.

### Pelaksanaan Berfokus Ejen Pertama dengan `azd ai`

Gunakan `azd ai agent init` secara interaktif, atau guna templat projek ejen `azure.yaml` terkini yang disambungkan ke Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` menggantikan ejaan lapuk `--manifest`/`-m`; manifes lama dan konfigurasi ejen bertingkat masih perlu migrasi. Nilai ejen dengan `azd ai eval` dari `azure.ai.evaluations`, bukan aliran kerja lama yang dibuang. Lihat [migrasi penilaian](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) untuk persediaan, pelaksanaan, dan keputusan.

Lihat [Perintah AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk rujukan dan bendera penuh arahan.

### Pelaksanaan Satu Perintah

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Pelaksanaan Khusus Persekitaran

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

## Pemantauan dan Kebolehlihatan

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

Ini menyediakan sumber Insights, bukan instrumentasi telemetri. Setelah aplikasi anda mengeluarkan rentetan panggilan model keluar, jalankan pertanyaan ilustrasi ini dalam Application Insights Logs (sesuaikan penapis dengan nama rentetan sebenar anda):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Pemantauan Kos

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

Gunakan penerima sebenar dan sahkan kebenaran skop pengebilan. Bajet menghantar amaran; ia bukan had perbelanjaan.

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

Fragmen titik akhir ini juga memerlukan zon DNS persendirian/kumpulan, pautan VNet, sambungan VNet aplikasi, dan polisi akses awam eksplisit. Membuat titik akhir persendirian sahaja tidak melumpuhkan akses awam.

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

### Strategi Pemcachedan

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

Azure Cache for Redis Basic/Standard/Premium berada pada [laluan persaraan](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); gunakan Azure Managed Redis untuk pelaksanaan baru dan ikuti panduan templat/pengesahan semasa. Skop respons AI yang dipcachedkan mengikut kebenaran, model/arahan, dan versi data, dengan tamat tempoh; jangan kongsi respons peribadi menggunakan teks pertanyaan sahaja.

### Konfigurasi penskalaan automatik

**Sumber separa:** gabungkan tetapan skala/ingress ini ke dalam Container App lengkap dengan persekitaran terurus, imej kontena, dan had sumber. Lebih banyak replika tidak meningkatkan kuota model.

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

## Menyelesaikan Masalah Lazim

### Isu 1: Kuota OpenAI Terlampau

**Gejala:**
- Pelaksanaan gagal dengan ralat kuota
- Ralat 429 dalam log aplikasi

**Penyelesaian:**
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

Pembolehubah kapasiti di atas terpakai hanya kepada templat khusus yang disambungkan untuk menggunakannya. Untuk sampel RAG, gunakan `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Jangan ubah `AZURE_LOCATION` untuk memindahkan sumber sedia ada; buat persekitaran berasingan untuk rantau baru dan rancangkan migrasi/pembersihan.

### Isu 2: Kegagalan Pengesahan

**Gejala:**
- Ralat 401/403 semasa memanggil perkhidmatan AI
- Mesej "Akses ditolak"

**Penyelesaian:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Isu 3: Masalah Pelaksanaan Model

**Gejala:**
- Model tidak tersedia dalam pelaksanaan
- Versi model tertentu gagal

**Penyelesaian:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Templat Contoh

Ini adalah alternatif, bukan arahan berurutan. Mulakan setiap satu dalam direktori kosong berasingan. Destinasi `.` eksplisit mengekalkan inisialisasi dalam direktori semasa anda; jika tidak, AZD semasa boleh membuat direktori anak bernama templat tanpa mengubah direktori kerja shell anda.

### Aplikasi Sembang RAG (Python)

**Repositori**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Penerangan**: Aplikasi sembang rujukan RAG untuk soalan ke atas dokumen anda, dengan pengambilan Azure AI Search. Semak model disokong semasa, ciri pilihan, panduan kos, dan penguatan pengeluaran sebelum guna; melaksanakan sampel tidak menjadikan aplikasi sedia untuk produksi.

**Mula Pantas**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplikasi Sembang RAG (.NET)

**Repositori**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Penerangan**: Setara .NET/C# bagi sampel sembang RAG Python. Dibina dengan ASP.NET Core Minimal API dan frontend Blazor WebAssembly. Termasuk sembang suara, sokongan visi GPT-4o-mini, dan klien desktop/mobile .NET MAUI Blazor Hybrid.

**Mula Pantas**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplikasi Sembang RAG (Java)

**Repositori**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Penerangan**: Versi Java bagi sampel sembang RAG menggunakan Langchain4J untuk orkestrasi AI. Menyokong seni bina perkhidmatan mikro pendorong acara, berbilang strategi carian (teks, vektor, hibrid), muat naik dokumen dengan Azure Document Intelligence, dan pelaksanaan pada Azure Container Apps atau Azure Kubernetes Service.

**Mula Pantas**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Retail Copilot Perusahaan dengan Microsoft Foundry

**Repositori**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Perkhidmatan**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Penerangan**: Retail RAG copilot hujung-ke-hujung menggunakan Microsoft Foundry dan Prompty. Chatbot Contoso Outdoor yang mendasari jawapan dalam katalog produk dan data pesanan pelanggan. Menunjukkan aliran kerja GenAIOps penuh — prototaip dengan Prompty, nilai dengan penilai berpandu AI, dan lancar melalui AZD ke Container Apps.

**Mula Pantas**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplikasi Penulisan Kreatif Multi-Ejen

**Repositori**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Perkhidmatan**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Penerangan**: Sampel multi-ejen yang menunjukkan orkestrasi ejen AI dengan Prompty. Menggunakan ejen penyelidikan (Bing Grounding dalam Azure AI Agent Service), ejen produk (Azure AI Search), ejen penulis, dan ejen penyunting untuk menghasilkan artikel yang diselidiki dengan baik secara kolaboratif. Termasuk CI/CD dengan penilaian dalam GitHub Actions.

**Mula Pantas**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Sembang RAG Tanpa Server (JavaScript/TypeScript)

**Repositori**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Perkhidmatan**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB untuk NoSQL + LangChain.js

**Penerangan**: Chatbot RAG sepenuhnya tanpa server menggunakan LangChain.js dengan Azure Functions untuk API dan Azure Static Web Apps untuk hos. Menggunakan Azure Cosmos DB sebagai stor vektor dan pangkalan data sejarah sembang. Menyokong pembangunan tempatan dengan Ollama untuk ujian tanpa kos.

**Mula Pantas**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Penyegar Penyelesaian Sembang Dengan Data Anda

**Repositori**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Perkhidmatan**: Microsoft Foundry + Azure Container Apps (web/API/pengambilan) + Azure AI Search dengan Cosmos DB, atau PostgreSQL dengan pgvector

**Penerangan**: Penyegar sembang berasaskan dokumen dengan petikan. Sampel semasa menghoskan frontend React, backend FastAPI, dan pekerja pengambilan Functions pada Container Apps; pilihan pengatur cara ialah Agent Framework dan LangGraph. Pilihan pangkalan data/ambilan dipilih semasa pelaksanaan. Ia titik permulaan, bukan sistem produksi turnkey; jangan anggap varian App Service, Semantic Kernel, atau Prompt Flow lama menggambarkan lalai semasa.

**Mula Pantas**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Ejen Pelancongan AI — Orkestrasi MCP Multi-Ejen

**Repositori**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Perkhidmatan**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Penerangan**: Aplikasi rujukan untuk orkestrasi AI berbilang ejen menggunakan tiga rangka kerja (LangChain.js, LlamaIndex.TS, dan Microsoft Agent Framework). Menampilkan pelayan MCP (Model Context Protocol) dalam empat bahasa yang dihoskan sebagai Azure Container Apps tanpa pelayan dengan pemantauan OpenTelemetry.

**Mula Pantas**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Terokai lebih banyak templat**: Lawati [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) untuk templat yang tersedia sekarang merangkumi bahasa dan senario. Setiap contoh yang dipautkan adalah repositori luaran, bukan contoh tempatan yang disediakan oleh kursus ini; periksa prasyarat semasa dan panduan pengeluaran sebelum pelaksanaan.

## Langkah Seterusnya

1. **Cuba Contoh**: Mulakan dengan templat siap yang sepadan dengan kes penggunaan anda
2. **Sesuaikan Mengikut Keperluan**: Ubah suai infrastruktur dan kod aplikasi
3. **Tambah Pemantauan**: Laksanakan kebolehlihatan menyeluruh
4. **Optimumkan Kos**: Laraskan konfigurasi mengikut bajet anda
5. **Amankan Pengeluaran Anda**: Gunakan corak keselamatan perusahaan
6. **Skala ke Pengeluaran**: Tambah ciri pelbagai rantau dan kebolehcapaian tinggi

## 🎯 Latihan Praktikal

### Latihan 1: Lancarkan Aplikasi Chat Model Microsoft Foundry (30 minit)
**Matlamat**: Lancarkan dan uji aplikasi rujukan chat AI

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

**Kriteria Kejayaan:**
- [ ] Pelancaran selesai tanpa ralat kuota
- [ ] Boleh akses antara muka chat dalam pelayar
- [ ] Boleh tanya soalan dan dapatkan jawapan berkuasa AI
- [ ] Application Insights menunjukkan data telemetri
- [ ] Sumber berjaya dibersihkan

**Kos:** Semak panduan kos contoh semasa dan SKU yang dipilih sebelum melaksanakan. Pengebilan berterusan sehingga sumber dipadam; tiada anggaran 30 minit tetap untuk setiap konfigurasi.

### Latihan 2: Konfigurasi Pelancaran Multi-Model (45 minit)
**Matlamat**: Lancarkan beberapa model AI dengan konfigurasi berbeza

**Titik mula:** Akaun Azure OpenAI sedia ada dan modul kumpulan sumber AZD yang boleh memanggil fail ini. Buat `infra/ai-models.bicep` dengan kandungan berikut menggunakan penyunting anda. Ia tidak dilancarkan secara automatik hanya kerana berada di bawah `infra/`.

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

Dari modul kumpulan sumber yang memiliki akaun, tambah panggilan modul (sesuaikan nama simbol dengan akaun sebenar anda):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Jangan isytiharkan pelancaran yang sama dalam kedua-dua modul. Jika titik masuk AZD berpandukan langganan, panggil ini dari modul anak berpandukan kumpulan sumber dan laraskan laluan relatif. Bina modul tersebut dengan `az bicep build --file <path-to-containing-module>`, kemudian:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kriteria Kejayaan:**
- [ ] Beberapa model berjaya dilancarkan
- [ ] Tetapan kapasiti berbeza digunakan
- [ ] Model boleh diakses melalui API
- [ ] Boleh panggil kedua-dua model dari aplikasi

### Latihan 3: Laksanakan Pemantauan Kos (20 minit)
**Matlamat**: Sediakan amaran bajet dan penjejakan kos

**Titik mula:** Corak bajet di atas dan modul infrastruktur kumpulan sumber. Tambah sumber ini menggunakan penyunting anda; pass `budgetStartDate` dari pemetaan parameter anda (jangan gandakan parameter jika sudah diisytiharkan). Gantikan penerima dan sahkan anda mempunyai akses tulis bajet.

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

Dijangkakan: respons mengandungi `amount: 200`, kedua-dua ambang, dan penerima anda. Periksa Pengurusan Kos dalam portal untuk caj sebenar; data kos lambat dan amaran mungkin tidak aktif semasa latihan singkat.

**Kriteria Kejayaan:**
- [ ] Amaran bajet dibuat dalam Azure
- [ ] Pemberitahuan e-mel dikonfigurasikan
- [ ] Boleh lihat data kos dalam Azure Portal
- [ ] Ambang bajet diset dengan betul

## 💡 Soalan Lazim

<details>
<summary><strong>Bagaimanakah saya mengurangkan kos Model Microsoft Foundry semasa pembangunan?</strong></summary>

1. **Semak harga**: Tiada elaun percuma 50,000 token bulanan sejagat untuk model Azure OpenAI
2. **Sesuai saiz kapasiti**: Kapasiti `10` biasanya mewakili 10,000 TPM untuk model teks Standard ini, bukan 10 TPM. Mengurangkan had kadar ini tidak mengurangkan harga per token
3. **Gunakan azd down**: Padam sumber boleh guna ketika tidak sedang membangun (ini bukan deallokasikan)
4. **Cache Respons**: Laksanakan cache Redis untuk pertanyaan berulang
5. **Gunakan Kejuruteraan Prompt**: Kurangkan penggunaan token dengan prompt cekap

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Apa bezanya Model Microsoft Foundry dan OpenAI API?</strong></summary>

**Model Microsoft Foundry**:
- Keselamatan dan pematuhan perusahaan
- Integrasi rangkaian peribadi
- Jaminan SLA
- Pengesahan identiti terurus
- Kuota lebih tinggi tersedia

**OpenAI API**: Penyedia/API berasingan dengan ketersediaan model, harga, pengesahan, dan pilihan sambungan perusahaan sendiri. Bandingkan tawaran semasa dan jangan anggap ia hanya untuk internet umum atau sentiasa mengeluarkan model dahulu.

Pilih berdasarkan keperluan organisasi anda; contoh identiti terurus khusus Azure dan pautan peribadi dalam kursus ini adalah untuk perkhidmatan dihoskan Azure, bukan setiap model/pembekal dalam katalog Foundry.
</details>

<details>
<summary><strong>Bagaimana saya mengatasi ralat kuota terlampau Model Microsoft Foundry?</strong></summary>

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
<summary><strong>Bolehkah saya gunakan data sendiri dengan Model Microsoft Foundry?</strong></summary>

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

Lihat templat [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Bagaimana saya mengamankan titik akhir model AI?</strong></summary>

**Amalan Terbaik**:
1. Gunakan Identiti Terurus (tanpa kekunci API)
2. Hidupkan Titik Akhir Peribadi
3. Konfigurasikan kumpulan keselamatan rangkaian
4. Laksanakan had kadar
5. Gunakan Azure Key Vault untuk rahsia

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

## Komuniti dan Sokongan

- **Microsoft Foundry Discord**: [saluran #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Isu dan perbincangan](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Dokumentasi rasmi](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Kemahiran Microsoft Foundry di skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Pasang kemahiran agen Azure + Foundry dalam penyunting anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Seterusnya**: [Ejen AI](agents.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlukan Bantuan?** Sertai perbincangan komuniti kami atau buka isu dalam repositori. Komuniti Azure AI + AZD sedia membantu kejayaan anda!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->