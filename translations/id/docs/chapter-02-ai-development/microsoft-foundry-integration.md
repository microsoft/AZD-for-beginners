# Integrasi Microsoft Foundry dengan AZD

**Navigasi Bab:**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-Pertama
- **⬅️ Bab Sebelumnya**: [Bab 1: Proyek Pertamamu](../chapter-01-foundation/first-project.md)
- **➡️ Berikutnya**: [Agen AI](agents.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Ikhtisar

Panduan ini menunjukkan cara mengintegrasikan layanan Microsoft Foundry dengan Azure Developer CLI (AZD) untuk penerapan aplikasi AI yang efisien. Microsoft Foundry menyediakan platform komprehensif untuk membangun, menerapkan, dan mengelola aplikasi AI, sementara AZD menyederhanakan proses infrastruktur dan penerapan.

## Apa itu Microsoft Foundry?

Microsoft Foundry adalah platform terpadu Microsoft untuk pengembangan AI yang mencakup:

- **Model Katalog**: Akses ke model AI canggih terbaru
- **Prompt Flow**: Desainer visual untuk alur kerja AI
- **Portal Microsoft Foundry**: Lingkungan pengembangan terpadu untuk aplikasi AI
- **Opsi Penerapan**: Berbagai pilihan hosting dan penskalaan
- **Keamanan dan Keselamatan**: Fitur AI bertanggung jawab yang terintegrasi

## AZD + Microsoft Foundry: Lebih Baik Bersama

| Fitur | Microsoft Foundry | Manfaat Integrasi AZD |
|---------|-----------------|------------------------|
| **Penerapan Model** | Penerapan portal manual | Penerapan otomatis dan dapat diulang |
| **Infrastruktur** | Konfigurasi proyek dan sumber daya | Mulai dari `azure.yaml`; keluarkan Bicep atau Terraform saat perlu |
| **Manajemen Lingkungan** | Fokus lingkungan tunggal | Multi-lingkungan (dev/staging/prod) |
| **Integrasi CI/CD** | Layanan penerapan dan evaluasi | Gunakan ulang konfigurasi di GitHub Actions atau Azure DevOps |
| **Manajemen Biaya** | Pemantauan dasar | Optimasi biaya spesifik lingkungan |

## Prasyarat

- Langganan Azure dengan izin yang sesuai
- Azure Developer CLI 1.37.0 atau lebih baru untuk alur kerja GA Foundry
- Akses ke layanan Microsoft Foundry Models
- Pemahaman dasar tentang Microsoft Foundry

> **Pembaruan Foundry GA (2026-11-09):** Bundel ekstensi `microsoft.foundry` mencapai versi 1.0 dan ketersediaan umum pada [5 November 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Panduan berikut mengikuti pengumuman tersebut dan quickstart Microsoft Learn yang terkait. Ini adalah tinjauan dokumentasi, bukan validasi penerapan langsung. Fitur pratinjau opsional dan ekstensi yang dirilis secara mandiri tetap mempertahankan status rilisnya sendiri.

**Hasil pembelajaran:** Pasang bundel GA, tinjau `azure.yaml` agen, bandingkan respons lokal dan yang diterapkan, dan jelaskan batas evaluasi, CI/CD, dan pembersihan. Untuk penerapan agen langkah demi langkah, buka [panduan agen-hosted](#hosted-agent-walkthrough-ga). Fragmen sumber daya di bawah mencakup pola integrasi lainnya.

## Pola Integrasi Inti

**Lingkup contoh:** Bicep di bawah mengandung fragmen sumber daya ilustratif, bukan template lengkap yang dapat diterapkan. Template utama harus mendefinisikan nama, `location`, sumber daya yang direferensikan, identitas, keluaran, dan hosting aplikasi. Gunakan contoh terhubung sebagai titik awal yang dapat dijalankan. Contoh Bash memerlukan autentikasi Azure CLI terpisah dari `azd auth login`.

### Pola 1: Integrasi Microsoft Foundry Models

**Kasus Penggunaan**: Terapkan aplikasi chat dengan model Azure OpenAI di Microsoft Foundry

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

Pemanggil memerlukan identitas terkelola yang terkait dan `Cognitive Services OpenAI User` pada ruang lingkup akun; menonaktifkan kunci tidak memberi akses. Verifikasi ketersediaan wilayah/model/SKU dan kuota sebelum penerapan.

### Pola 2: Integrasi AI Search + RAG

**Kasus Penggunaan**: Terapkan aplikasi retrieval-augmented generation (RAG)

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

Tidak ada sumber daya ARM `Microsoft.Search/searchServices/dataConnections` untuk integrasi ini. Konfigurasikan index Search, sumber data, indexer/skillset atau vectorizer melalui API bidang data Search yang didukung. Jika Search memanggil model embedding, aktifkan identitas terkelolanya, berikan peran model yang relevan, dan konfigurasikan skill embedding/vectorizer-nya. Lihat [vektorisasi terintegrasi](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Pola 3: Integrasi Document Intelligence

**Kasus Penggunaan**: Proses dan analisis dokumen

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

Kecuali untuk pengaturan AZD yang terdokumentasi seperti `AZURE_LOCATION`, ini adalah **nama input template khusus**. Mereka tidak berpengaruh kecuali template/aplikasi mengonsumsinya melalui parameter dan pemetaan lingkungan host. Untuk `azure-search-openai-demo`, gunakan nama aslinya seperti `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` dan `AZURE_SEARCH_SERVICE_SKU` sebagai gantinya. Kapasitas model bukan SKU akun.

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

Lebih baik menggunakan Entra ID dengan autentikasi kunci lokal dinonaktifkan. Berikut ini hanya alternatif **autentikasi kunci warisan** untuk aplikasi yang membutuhkan kunci: memerlukan akun dengan autentikasi kunci diaktifkan, identitas aplikasi terkait hostnya, dan akses/jaringan Key Vault yang bekerja. Jangan gabungkan pengambilan kunci dengan `disableLocalAuth: true` dan mengharapkan panggilan berbasis kunci berfungsi.

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

## Alur Kerja Penerapan

### Ekstensi AZD untuk Foundry

Untuk alur kerja GA, instal bundel `microsoft.foundry` daripada merakit ekstensi inti satu per satu:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Bundel ini memasang agen, koneksi, inspector, proyek, rutinitas, keterampilan, dan kotak alat. Tidak menambahkan grup perintah `microsoft.foundry`. Evaluasi, dataset, fine-tuning, dan model kustom dipasang terpisah jika diperlukan. Lihat [referensi pengemasan ekstensi](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Panduan Hosted-Agent (GA)

**Hosted agent** menjalankan kode agen Anda pada komputasi yang dikelola Foundry. Latihan ini menggunakan contoh API Responses Python Agent Framework dasar upstream, bukan fragmen SDK Agent Service klasik pada pelajaran lain.

#### 1. Persiapkan dan inisialisasi

Gunakan direktori kosong di luar checkout kursus ini. Pasang Python 3.13 atau lebih baru dan [rilis uv terbaru](https://docs.astral.sh/uv/getting-started/installation/). Instalasi uv mandiri dapat memakai `uv self update`. Periksa [izin hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), ketersediaan model, dan kuota di langganan dan wilayah Anda sebelum penyediaan. Sumber daya Azure dan panggilan model lokal dikenakan biaya.

Selesaikan pemasangan `azd auth login` dan bundel di atas. Kode contoh lokal memakai `DefaultAzureCredential`; jika menggunakan kredensial Azure CLI, masuklah dengan `az login` menggunakan akun dan tenant yang sama dengan AZD. Masuk AZD saja tidak sama dengan masuk Azure CLI.

Jalankan perintah satu baris ini di Bash atau PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Pilih proyek Foundry baru atau yang sudah ada dan langganan serta wilayah yang dimaksudkan. Untuk menggunakan ulang penerapan model, tambahkan `--model-deployment <existing-deployment-name>` ke perintah inisialisasi **sebelum menjalankannya**, dan pilih proyek yang sudah ada. Tetaplah di direktori yang berisi `azure.yaml` yang dihasilkan untuk perintah selanjutnya.

#### 2. Tinjau definisi penerapan

Buka `azure.yaml` dan temukan pengaturan ini di [contoh upstream](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Pengaturan | Yang harus diperiksa |
|---------|---------------|
| `host: azure.ai.project` dan `deployments` | Proyek Foundry yang dituju dan nama model, versi, SKU penerapan, dan kapasitas |
| `host: azure.ai.agent` dan `project` | Hosted agent dan direktori yang berisi sumbernya |
| `codeConfiguration` | Runtime Python dan titik masuk; contoh yang ditinjau memakai `python_3_13` dan `main.py` |
| `uses` | Ketergantungan pada layanan proyek Foundry |
| `container.resources` | Alokasi CPU dan memori, walaupun kode dibangun secara remote |
| `env` | Pemetaan penerapan model dan `PYTHONNOUSERSITE: "1"` untuk menonaktifkan pemuatan paket dari situs pengguna |
| `infra.provider` | `microsoft.foundry`, yang mensintesis infrastruktur yang diperlukan |

Komit kode `azure.yaml` yang ditinjau dan kode agen bersama-sama. Tidak diperlukan infrastruktur tulisan tangan untuk memulai; saat perlu file provisioning yang dapat diedit, ikuti [eject infrastruktur](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) untuk Bicep atau Terraform dan terus gunakan `azd provision`. Jangan komit kredensial atau status lingkungan `.azure/`.

#### 3. Sediakan dan uji secara lokal

```bash
azd provision
azd ai agent run
```

Provisioning dapat membuat penerapan model yang hilang **bahkan di proyek yang digunakan ulang**. Tinjau prompt model dan pilih jenis penerapan online yang tersedia seperti Global Standard atau Data Zone Standard; dukungan kuota dan regional bervariasi.

Jalankan lokal menyiapkan dependensi dan membuka **Agent Inspector**, tempat Anda dapat memeriksa permintaan, respons, dan aktivitas alat/model. Biarkan berjalan dan buka terminal kedua di direktori proyek yang sama:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Tanda pemeriksaan:** Pastikan Anda menerima respons relevan dan dapat memeriksa aktivitas lokal terkait. Eksekusi lokal tetap memanggil penerapan model Azure Anda; ini bukan uji offline atau gratis. Gunakan prompt sintetis dan hindari mengungkapkan rahasia atau data sensitif dalam output inspector.

#### 4. Terapkan dan bandingkan

Hentikan eksekusi lokal dengan Ctrl+C saat selesai. Sebelum pemanggilan remote, konfigurasikan atau verifikasi [koneksi Application Insights dan akses pembacaan jejak](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) proyek.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

Dalam mode penerapan kode, AZD mengunggah sumber untuk build Foundry jarak jauh; Anda tidak memerlukan build container lokal untuk jalur ini. Output penerapan menyediakan tautan playground dan endpoint. Verifikasi respons agen yang diterapkan dan jejak cloud-nya; event inspector lokal saja tidak membuktikan jejak cloud bekerja.

Untuk perubahan berikutnya, tinjau konfigurasi hosted-agent yang didukung dengan `azd deploy --preview`. Alirkan log dengan `azd ai agent monitor --follow`, atau diagnosis masalah pengaturan dan akses dengan `azd ai agent doctor`. Pratinjau penerapan bukan tinjauan lengkap infrastruktur atau keamanan.

#### 5. Tambahkan pemeriksaan kualitas yang dapat diulang

Pasang ekstensi evaluasi yang dirilis secara mandiri, lalu buat aset uji draf:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Deskripsikan perilaku agen yang diinginkan dan pilih **Dataset dan evaluator**, lalu **Turn**. Tinjau dan edit kasus serta rubrik penilaian yang dibuat, termasuk kasus pertanyaan tidak didukung, sebelum mengonfigurasi evaluasi:

```bash
azd ai eval init --name quality
```

Pilih dataset dan rubrik yang ditinjau dan konfirmasi penerapan model juri. Periksa `evals/azure.eval.yaml` dan rujukan layanan evaluasi dalam `azure.yaml`, lalu daftarkan aset dan jalankan:

```bash
azd up
azd ai eval run start --eval quality
```

Periksa skor dan kasus yang gagal atau error; evaluasi selesai tidak otomatis berarti lolos kualitas. Generasi dan penilaian juga menimbulkan biaya model. Komit konfigurasi non-rahasia, dataset, dan rubrik agar rekan dapat membandingkan perubahan. `azd ai agent optimize` dapat menggunakan evaluasi kompatibel sebagai baseline, tapi tinjau kandidat sebelum menerapkan secara eksplisit. Lihat [pintu kualitas dan migrasi](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) untuk proyek lama dan CI.

#### 6. Gunakan ulang alur kerja di CI/CD

Setelah `azd up` berhasil, jalankan `azd pipeline config` dan tinjau alur kerja GitHub Actions atau Azure DevOps yang dibuat. Pasang `microsoft.foundry` di runner, serta `azure.ai.evaluations` jika menjalankan evaluasi. Simpan pengaturan checkout, sign-in, dan lingkungan yang dibuat; pemasangan saja tidak mengautentikasi pipeline.

Gunakan lingkungan AZD terpisah per tahap, berikan identitas pipeline izin sumber daya dan Foundry yang dibutuhkan, dan simpan kredensial di rahasia pipeline atau gunakan identitas federasi. Komit aset evaluasi dan verifikasi identitas dapat mengakses dataset/evaluator yang direferensikan. Lihat contoh [pipeline kursus](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) dan [panduan Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Bersihkan dengan sengaja

Untuk **proyek baru yang dibuat oleh lingkungan ini**, tinjau sumber daya yang tercantum oleh `azd down` sebelum mengonfirmasi: perintah ini menghapus grup sumber daya beserta semua isinya.

Untuk **proyek yang digunakan ulang**, `azd down` meninggalkan proyek, hosted agent, dan sumber daya lain tetap ada. Hapus hanya sumber daya yang tidak diinginkan dan Anda miliki menggunakan [panduan pembersihan cepat](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); jangan hapus grup sumber daya bersama untuk membersihkan satu latihan.

**Pemeriksaan selesai:** Jelaskan pengaturan yang mengendalikan perilaku lokal dan cloud, tunjukkan respons lokal dan yang diterapkan, tinjau hasil evaluasi, dan identifikasi sumber daya yang tersisa setelah pembersihan.

### Opsional: Scaffold dengan Microsoft Foundry Skill

Pasang [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) untuk host agen pengkodean Anda, lalu buka folder kosong terpisah. Minta untuk membuat scaffold contoh API Responses Python Agent Framework dasar dalam mode penerapan kode, jelaskan `azure.yaml` yang dibuat, dan usulkan langganan, wilayah, proyek, serta penerapan model. Minta persetujuan **sebelum membuat sumber daya Azure**, minta uji lokal, dan berhenti sebelum penerapan. Tinjau output dan lanjutkan dengan langkah penerapan di atas hanya jika sudah siap.

Untuk proyek yang sudah ada, `--template`/`-t` menggantikan ejaan yang sudah tidak digunakan `--manifest`/`-m`; mengubah flag tidak memigrasi manifes lama atau konfigurasi agen bersarang. Lihat [referensi AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Deploy Perintah Tunggal

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Deploy Khusus Lingkungan

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

Ini menyediakan sumber daya Insights, bukan instrumentasi telemetri. Setelah aplikasi Anda mengirimkan span panggilan model keluar, jalankan query ilustratif ini di Application Insights Logs (sesuaikan filter dengan nama span Anda yang sebenarnya):

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

Gunakan penerima yang nyata dan verifikasi izin lingkup penagihan. Anggaran mengirim peringatan; bukan batas pengeluaran.

## 🔐 Praktik Terbaik Keamanan

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

Fragmen endpoint ini juga membutuhkan zona/group DNS pribadi, tautan VNet, konektivitas aplikasi VNet, dan kebijakan akses publik eksplisit. Membuat private endpoint saja tidak menonaktifkan akses publik.

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

Azure Cache untuk Redis Basic/Standard/Premium sedang dalam [jalur pensiun](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); gunakan Azure Managed Redis untuk deployment baru dan ikuti panduan template/autentikasi saat ini. Batasi respons AI yang di-cache berdasarkan otorisasi, model/petunjuk, dan versi data, dengan kedaluwarsa; jangan pernah membagikan respons pribadi hanya dengan teks query.

### Konfigurasi Auto-scaling

**Sumber daya parsial:** gabungkan setelan skala/ingress ini ke dalam Container App lengkap dengan environment terkelola, image container, dan batas sumber daya. Lebih banyak replika tidak meningkatkan kuota model.

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
- Deploy gagal dengan kesalahan kuota
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

Variabel kapasitas di atas hanya berlaku untuk template kustom yang dikonfigurasi untuk menggunakannya. Untuk contoh RAG, gunakan `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Jangan ubah `AZURE_LOCATION` untuk memindahkan sumber daya yang ada; buat environment terpisah untuk wilayah baru dan rencanakan migrasi/pembersihan.

### Masalah 2: Gagal Autentikasi

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

### Masalah 3: Masalah Deploy Model

**Gejala:**
- Model tidak tersedia di deployment
- Versi model spesifik gagal

**Solusi:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Contoh Template

Ini adalah alternatif, bukan perintah berurutan. Mulai masing-masing di direktori kosong terpisah. Tujuan `.` yang eksplisit menjaga inisialisasi di direktori Anda saat ini; jika tidak, AZD saat ini dapat membuat direktori anak bernama template tanpa mengubah direktori kerja shell Anda.

### Aplikasi Obrolan RAG (Python)

**Repositori**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Layanan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Deskripsi**: Aplikasi referensi obrolan RAG untuk pertanyaan atas dokumen Anda, dengan pengambilan Azure AI Search. Tinjau model yang didukung contoh saat ini, fitur opsional, panduan biaya, dan pengerasan produksi sebelum digunakan; melakukan deploy contoh tidak membuat aplikasi siap produksi.

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplikasi Obrolan RAG (.NET)

**Repositori**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Layanan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Deskripsi**: Setara .NET/C# dari contoh obrolan RAG Python. Dibangun dengan ASP.NET Core Minimal API dan frontend Blazor WebAssembly. Termasuk obrolan suara, dukungan visi GPT-4o-mini, dan klien desktop/mobile Blazor Hybrid .NET MAUI pendamping.

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplikasi Obrolan RAG (Java)

**Repositori**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Layanan**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Deskripsi**: Versi Java dari contoh obrolan RAG menggunakan Langchain4J untuk orkestrasi AI. Mendukung arsitektur acara microservice, beberapa strategi pencarian (teks, vektor, hibrid), unggah dokumen dengan Azure Document Intelligence, dan deployment pada Azure Container Apps atau Azure Kubernetes Service.

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copilot Ritel Perusahaan dengan Microsoft Foundry

**Repositori**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Layanan**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Deskripsi**: Copilot ritel RAG ujung-ke-ujung menggunakan Microsoft Foundry dan Prompty. Chatbot retailer Contoso Outdoor yang mengaitkan respons dengan data katalog produk dan pesanan pelanggan. Menunjukkan seluruh alur kerja GenAIOps — prototipe dengan Prompty, evaluasi dengan evaluator berbantuan AI, dan deploy via AZD ke Container Apps.

**Mulai Cepat**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplikasi Multi-Agen Penulisan Kreatif

**Repositori**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Layanan**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Deskripsi**: Contoh multi-agen yang menunjukkan orkestrasi agen AI dengan Prompty. Menggunakan agen riset (Bing Grounding di Azure AI Agent Service), agen produk (Azure AI Search), agen penulis, dan agen editor untuk menghasilkan artikel yang diteliti dengan baik secara kolaboratif. Termasuk CI/CD dengan evaluasi di GitHub Actions.

**Mulai Cepat**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Obrolan RAG Serverless (JavaScript/TypeScript)

**Repositori**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Layanan**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB untuk NoSQL + LangChain.js

**Deskripsi**: Chatbot RAG serverless penuh menggunakan LangChain.js dengan Azure Functions untuk API dan Azure Static Web Apps untuk hosting. Menggunakan Azure Cosmos DB sebagai penyimpanan vektor dan database riwayat obrolan. Mendukung pengembangan lokal dengan Ollama untuk pengujian tanpa biaya.

**Mulai Cepat**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat dengan Percepatan Solusi Data Anda

**Repositori**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Layanan**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search dengan Cosmos DB, atau PostgreSQL dengan pgvector

**Deskripsi**: Percepatan chat berbasis dokumen dengan sitasi. Contoh saat ini menyelenggarakan frontend React, backend FastAPI, dan pekerja ingest fungsi di Container Apps; opsi orkestrator adalah Agent Framework dan LangGraph. Pilihan database/pengambilan dipilih saat deploy. Ini titik awal, bukan sistem produksi siap pakai; jangan anggap varian App Service, Semantic Kernel, atau Prompt Flow lama menggambarkan default saat ini.

**Mulai Cepat**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agen Perjalanan AI — Orkestrasi Multi-Agen MCP

**Repositori**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Layanan**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Deskripsi**: Aplikasi referensi untuk orkestrasi AI multi-agen menggunakan tiga framework (LangChain.js, LlamaIndex.TS, dan Microsoft Agent Framework). Menampilkan server MCP (Model Context Protocol) dalam empat bahasa yang dideploy sebagai Azure Container Apps serverless dengan pemantauan OpenTelemetry.

**Mulai Cepat**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Jelajahi lebih banyak template**: Kunjungi [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) untuk template yang tersedia saat ini di berbagai bahasa dan skenario. Setiap contoh yang terhubung adalah repositori eksternal, bukan contoh lokal yang disediakan oleh kursus ini; periksa prasyarat dan panduan produksi saat ini sebelum deploy.

## Langkah Selanjutnya

1. **Coba Contoh**: Mulai dengan template bawaan yang sesuai kasus penggunaan Anda
2. **Sesuaikan Kebutuhan Anda**: Modifikasi infrastruktur dan kode aplikasi
3. **Tambahkan Pemantauan**: Terapkan observabilitas menyeluruh
4. **Optimalkan Biaya**: Sesuaikan konfigurasi untuk anggaran Anda
5. **Amankan Deploy Anda**: Terapkan pola keamanan perusahaan
6. **Skalakan ke Produksi**: Tambahkan fitur multi-wilayah dan ketersediaan tinggi

## 🎯 Latihan Praktis

### Latihan 1: Deploy Aplikasi Chat Model Microsoft Foundry (30 menit)
**Tujuan**: Deploy dan uji aplikasi referensi chat AI

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

# Review the listed resources and confirm cleanup
azd down
```

**Kriteria Keberhasilan:**
- [ ] Deploy selesai tanpa kesalahan kuota
- [ ] Bisa akses antarmuka chat di browser
- [ ] Bisa bertanya dan mendapatkan respons berbasis AI
- [ ] Application Insights menunjukkan data telemetri
- [ ] Berhasil membersihkan sumber daya

**Biaya:** Tinjau panduan biaya contoh saat ini dan SKU terpilih sebelum deploy. Penagihan berlangsung sampai sumber daya dihapus; tidak ada estimasi 30 menit tetap yang berlaku pada semua konfigurasi.

### Latihan 2: Konfigurasi Deploy Multi-Model (45 menit)
**Tujuan**: Deploy beberapa model AI dengan konfigurasi berbeda

**Titik mulai:** Akun Azure OpenAI yang sudah ada dan modul sumber daya grup AZD yang bisa memanggil file ini. Buat `infra/ai-models.bicep` dengan konten berikut menggunakan editor Anda. Ini tidak otomatis dideploy hanya karena berada di bawah `infra/`.

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

Dari modul berskala grup sumber daya yang memiliki akun, tambahkan pemanggilan modul (sesuaikan nama simbol dengan akun Anda yang sebenarnya):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Jangan deklarasikan deployment yang sama di kedua modul. Jika titik entri AZD berskala langganan, panggil ini dari modul anak yang berskala grup sumber daya dan sesuaikan jalur relatif. Bangun modul tersebut dengan `az bicep build --file <path-to-containing-module>`, lalu:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kriteria Keberhasilan:**
- [ ] Beberapa model berhasil dideploy
- [ ] Setelan kapasitas berbeda diterapkan
- [ ] Model dapat diakses via API
- [ ] Bisa memanggil kedua model dari aplikasi

### Latihan 3: Implementasi Pemantauan Biaya (20 menit)
**Tujuan**: Atur peringatan anggaran dan pelacakan biaya

**Titik mulai:** Pola anggaran di atas dan modul infrastruktur berskala grup sumber daya. Tambahkan sumber daya ini memakai editor Anda; lewati `budgetStartDate` dari pemetaan parameter Anda (jangan duplikat jika sudah dideklarasikan). Ganti penerima dan konfirmasi Anda memiliki akses tulis anggaran.

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

Diperkirakan: respons berisi `amount: 200`, kedua ambang batas, dan penerima Anda. Periksa Cost Management di portal untuk biaya aktual; data biaya tertunda dan peringatan tidak harus aktif selama latihan singkat.

**Kriteria Keberhasilan:**
- [ ] Peringatan anggaran dibuat di Azure
- [ ] Notifikasi email dikonfigurasi
- [ ] Dapat melihat data biaya di Azure Portal
- [ ] Ambang batas anggaran disetel dengan tepat

## 💡 Pertanyaan yang Sering Diajukan

<details>
<summary><strong>Bagaimana cara saya mengurangi biaya Microsoft Foundry Models selama pengembangan?</strong></summary>

1. **Periksa harga**: Tidak ada jatah 50.000 token bulanan gratis universal untuk model Azure OpenAI
2. **Sesuaikan kapasitas**: Kapasitas `10` biasanya mewakili 10.000 TPM untuk model teks Standar ini, bukan 10 TPM. Mengurangi batas laju ini tidak mengurangi harga per token
3. **Gunakan azd down**: Hapus sumber daya yang bisa dibuang saat tidak aktif mengembangkan (ini bukan dealokasi)
4. **Cache Respons**: Terapkan cache Redis untuk kueri berulang
5. **Gunakan Desain Prompt**: Kurangi penggunaan token dengan prompt efisien

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
- Autentikasi identitas terkelola
- Kuota lebih besar tersedia

**OpenAI API**: Penyedia/API terpisah dengan ketersediaan model, harga, autentikasi, dan opsi konektivitas perusahaan sendiri. Bandingkan penawaran terkini daripada menganggap hanya publik internet atau selalu mengirim model terlebih dulu.

Pilih berdasar kebutuhan organisasi Anda; contoh identitas terkelola dan private-link khusus Azure dalam kursus ini berlaku untuk layanan yang dihosting Azure, bukan setiap model/penyedia di katalog Foundry.
</details>

<details>
<summary><strong>Bagaimana menangani kesalahan kuota Microsoft Foundry Models terlampaui?</strong></summary>

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
<summary><strong>Bisakah saya menggunakan data saya sendiri dengan Microsoft Foundry Models?</strong></summary>

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
4. Terapkan pembatasan laju
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
- **AZD GitHub**: [Masalah dan diskusi](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Dokumentasi resmi](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Keahlian Microsoft Foundry di skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instal keahlian agen Azure + Foundry di editor Anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-First
- **⬅️ Bab Sebelumnya**: [Bab 1: Proyek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Berikutnya**: [AI Agents](agents.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Butuh Bantuan?** Bergabunglah dalam diskusi komunitas kami atau buka masalah di repositori. Komunitas Azure AI + AZD siap membantu Anda berhasil!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->