<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-18T07:54:51+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "id"
}
-->
# AI Workshop Lab: Membuat Solusi AI Anda Dapat Dideploy dengan AZD

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berbasis AI
- **⬅️ Sebelumnya**: [Deploy Model AI](ai-model-deployment.md)
- **➡️ Selanjutnya**: [Praktik Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Selanjutnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)

## Ikhtisar Workshop

Lab ini memberikan panduan praktis kepada pengembang untuk mengambil aplikasi AI yang sudah ada dan membuatnya dapat dideploy menggunakan Azure Developer CLI (AZD). Anda akan mempelajari pola penting untuk deployment AI produksi menggunakan layanan Azure AI Foundry.

**Durasi:** 2-3 jam  
**Tingkat:** Menengah  
**Prasyarat:** Pengetahuan dasar Azure, pemahaman konsep AI/ML

## 🎓 Tujuan Pembelajaran

Pada akhir workshop ini, Anda akan dapat:
- ✅ Mengonversi aplikasi AI yang sudah ada untuk menggunakan template AZD
- ✅ Mengonfigurasi layanan Azure AI Foundry dengan AZD
- ✅ Menerapkan manajemen kredensial yang aman untuk layanan AI
- ✅ Mendeply aplikasi AI siap produksi dengan pemantauan
- ✅ Memecahkan masalah umum dalam deployment AI

## Prasyarat

### Alat yang Dibutuhkan
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) terinstal
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) terinstal
- [Git](https://git-scm.com/) terinstal
- Editor kode (disarankan VS Code)

### Sumber Daya Azure
- Langganan Azure dengan akses kontributor
- Akses ke layanan Azure OpenAI (atau kemampuan untuk meminta akses)
- Izin untuk membuat grup sumber daya

### Pengetahuan yang Dibutuhkan
- Pemahaman dasar tentang layanan Azure
- Familiaritas dengan antarmuka baris perintah
- Konsep dasar AI/ML (API, model, prompt)

## Persiapan Lab

### Langkah 1: Persiapan Lingkungan

1. **Verifikasi instalasi alat:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clone repositori workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Memahami Struktur AZD untuk Aplikasi AI

### Anatomi Template AZD Siap AI

Eksplorasi file utama dalam template AZD yang siap AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Latihan Lab 1.1: Eksplorasi Konfigurasi**

1. **Periksa file azure.yaml:**
```bash
cat azure.yaml
```

**Hal yang perlu diperhatikan:**
- Definisi layanan untuk komponen AI
- Pemetaan variabel lingkungan
- Konfigurasi host

2. **Tinjau infrastruktur main.bicep:**
```bash
cat infra/main.bicep
```

**Pola AI utama yang perlu diidentifikasi:**
- Penyediaan layanan Azure OpenAI
- Integrasi Cognitive Search
- Manajemen kunci yang aman
- Konfigurasi keamanan jaringan

### **Poin Diskusi:** Mengapa Pola Ini Penting untuk AI

- **Ketergantungan Layanan**: Aplikasi AI sering membutuhkan beberapa layanan yang terkoordinasi
- **Keamanan**: Kunci API dan endpoint perlu dikelola dengan aman
- **Skalabilitas**: Beban kerja AI memiliki kebutuhan skalabilitas yang unik
- **Manajemen Biaya**: Layanan AI bisa mahal jika tidak dikonfigurasi dengan benar

## Modul 2: Deploy Aplikasi AI Pertama Anda

### Langkah 2.1: Inisialisasi Lingkungan

1. **Buat lingkungan AZD baru:**
```bash
azd env new myai-workshop
```

2. **Set parameter yang diperlukan:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Langkah 2.2: Deploy Infrastruktur dan Aplikasi

1. **Deploy dengan AZD:**
```bash
azd up
```

**Apa yang terjadi selama `azd up`:**
- ✅ Menyediakan layanan Azure OpenAI
- ✅ Membuat layanan Cognitive Search
- ✅ Menyiapkan App Service untuk aplikasi web
- ✅ Mengonfigurasi jaringan dan keamanan
- ✅ Mendeply kode aplikasi
- ✅ Menyiapkan pemantauan dan logging

2. **Pantau kemajuan deployment** dan catat sumber daya yang dibuat.

### Langkah 2.3: Verifikasi Deployment Anda

1. **Periksa sumber daya yang dideploy:**
```bash
azd show
```

2. **Buka aplikasi yang dideploy:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Uji fungsionalitas AI:**
   - Navigasikan ke aplikasi web
   - Coba kueri sampel
   - Verifikasi respons AI berfungsi

### **Latihan Lab 2.1: Latihan Pemecahan Masalah**

**Skenario**: Deployment Anda berhasil tetapi AI tidak merespons.

**Masalah umum yang perlu diperiksa:**
1. **Kunci API OpenAI**: Verifikasi bahwa kunci sudah diatur dengan benar
2. **Ketersediaan model**: Periksa apakah wilayah Anda mendukung model tersebut
3. **Konektivitas jaringan**: Pastikan layanan dapat berkomunikasi
4. **Izin RBAC**: Verifikasi bahwa aplikasi dapat mengakses OpenAI

**Perintah debugging:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Menyesuaikan Aplikasi AI untuk Kebutuhan Anda

### Langkah 3.1: Modifikasi Konfigurasi AI

1. **Perbarui model OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Tambahkan layanan AI tambahan:**

Edit `infra/main.bicep` untuk menambahkan Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Langkah 3.2: Konfigurasi Spesifik Lingkungan

**Praktik Terbaik**: Konfigurasi yang berbeda untuk pengembangan vs produksi.

1. **Buat lingkungan produksi:**
```bash
azd env new myai-production
```

2. **Set parameter spesifik produksi:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Latihan Lab 3.1: Optimasi Biaya**

**Tantangan**: Konfigurasikan template untuk pengembangan yang hemat biaya.

**Tugas:**
1. Identifikasi SKU yang dapat diatur ke tingkat gratis/dasar
2. Konfigurasikan variabel lingkungan untuk biaya minimal
3. Deploy dan bandingkan biaya dengan konfigurasi produksi

**Petunjuk solusi:**
- Gunakan tingkat F0 (gratis) untuk Cognitive Services jika memungkinkan
- Gunakan tingkat Basic untuk Search Service dalam pengembangan
- Pertimbangkan menggunakan rencana Consumption untuk Functions

## Modul 4: Keamanan dan Praktik Terbaik Produksi

### Langkah 4.1: Manajemen Kredensial yang Aman

**Tantangan saat ini**: Banyak aplikasi AI yang menyimpan kunci API secara hardcode atau menggunakan penyimpanan yang tidak aman.

**Solusi AZD**: Managed Identity + integrasi Key Vault.

1. **Tinjau konfigurasi keamanan dalam template Anda:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifikasi Managed Identity berfungsi:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Langkah 4.2: Keamanan Jaringan

1. **Aktifkan private endpoints** (jika belum dikonfigurasi):

Tambahkan ke template bicep Anda:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
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

### Langkah 4.3: Pemantauan dan Observabilitas

1. **Konfigurasikan Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Siapkan pemantauan khusus untuk AI:**

Tambahkan metrik khusus untuk operasi AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Latihan Lab 4.1: Audit Keamanan**

**Tugas**: Tinjau deployment Anda untuk praktik terbaik keamanan.

**Daftar Periksa:**
- [ ] Tidak ada rahasia yang disimpan secara hardcode dalam kode atau konfigurasi
- [ ] Managed Identity digunakan untuk autentikasi antar layanan
- [ ] Key Vault menyimpan konfigurasi sensitif
- [ ] Akses jaringan dibatasi dengan benar
- [ ] Pemantauan dan logging diaktifkan

## Modul 5: Mengonversi Aplikasi AI Anda Sendiri

### Langkah 5.1: Lembar Kerja Penilaian

**Sebelum mengonversi aplikasi Anda**, jawab pertanyaan berikut:

1. **Arsitektur Aplikasi:**
   - Layanan AI apa yang digunakan aplikasi Anda?
   - Sumber daya komputasi apa yang dibutuhkan?
   - Apakah membutuhkan database?
   - Apa ketergantungan antar layanan?

2. **Persyaratan Keamanan:**
   - Data sensitif apa yang ditangani aplikasi Anda?
   - Persyaratan kepatuhan apa yang Anda miliki?
   - Apakah Anda membutuhkan jaringan privat?

3. **Persyaratan Skalabilitas:**
   - Beban yang diharapkan?
   - Apakah Anda membutuhkan auto-scaling?
   - Apakah ada persyaratan regional?

### Langkah 5.2: Buat Template AZD Anda

**Ikuti pola ini untuk mengonversi aplikasi Anda:**

1. **Buat struktur dasar:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Buat azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Buat template infrastruktur:**

**infra/main.bicep** - Template utama:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Modul OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Latihan Lab 5.1: Tantangan Pembuatan Template**

**Tantangan**: Buat template AZD untuk aplikasi AI pemrosesan dokumen.

**Persyaratan:**
- Azure OpenAI untuk analisis konten
- Document Intelligence untuk OCR
- Storage Account untuk unggahan dokumen
- Function App untuk logika pemrosesan
- Aplikasi web untuk antarmuka pengguna

**Poin bonus:**
- Tambahkan penanganan error yang tepat
- Sertakan estimasi biaya
- Siapkan dashboard pemantauan

## Modul 6: Memecahkan Masalah Umum

### Masalah Umum dalam Deployment

#### Masalah 1: Kuota Layanan OpenAI Terlampaui
**Gejala:** Deployment gagal dengan error kuota
**Solusi:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Masalah 2: Model Tidak Tersedia di Wilayah
**Gejala:** Respons AI gagal atau error deployment model
**Solusi:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Masalah 3: Masalah Izin
**Gejala:** Error 403 Forbidden saat memanggil layanan AI
**Solusi:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Masalah Kinerja

#### Masalah 4: Respons AI Lambat
**Langkah investigasi:**
1. Periksa Application Insights untuk metrik kinerja
2. Tinjau metrik layanan OpenAI di portal Azure
3. Verifikasi konektivitas jaringan dan latensi

**Solusi:**
- Terapkan caching untuk kueri umum
- Gunakan model OpenAI yang sesuai untuk kasus penggunaan Anda
- Pertimbangkan read replicas untuk skenario beban tinggi

### **Latihan Lab 6.1: Tantangan Debugging**

**Skenario**: Deployment Anda berhasil, tetapi aplikasi mengembalikan error 500.

**Tugas debugging:**
1. Periksa log aplikasi
2. Verifikasi konektivitas layanan
3. Uji autentikasi
4. Tinjau konfigurasi

**Alat yang digunakan:**
- `azd show` untuk gambaran deployment
- Portal Azure untuk log layanan yang lebih rinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Optimasi

### Langkah 7.1: Siapkan Pemantauan Komprehensif

1. **Buat dashboard khusus:**

Navigasikan ke portal Azure dan buat dashboard dengan:
- Jumlah permintaan OpenAI dan latensi
- Tingkat error aplikasi
- Pemanfaatan sumber daya
- Pelacakan biaya

2. **Siapkan alert:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Langkah 7.2: Optimasi Biaya

1. **Analisis biaya saat ini:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Terapkan kontrol biaya:**
- Siapkan alert anggaran
- Gunakan kebijakan autoscaling
- Terapkan caching permintaan
- Pantau penggunaan token untuk OpenAI

### **Latihan Lab 7.1: Optimasi Kinerja**

**Tugas**: Optimalkan aplikasi AI Anda untuk kinerja dan biaya.

**Metrik yang perlu ditingkatkan:**
- Kurangi waktu respons rata-rata sebesar 20%
- Kurangi biaya bulanan sebesar 15%
- Pertahankan uptime 99.9%

**Strategi yang dapat dicoba:**
- Terapkan caching respons
- Optimalkan prompt untuk efisiensi token
- Gunakan SKU komputasi yang sesuai
- Siapkan autoscaling yang tepat

## Tantangan Akhir: Implementasi End-to-End

### Skenario Tantangan

Anda ditugaskan untuk membuat chatbot layanan pelanggan berbasis AI yang siap produksi dengan persyaratan berikut:

**Persyaratan Fungsional:**
- Antarmuka web untuk interaksi pelanggan
- Integrasi dengan Azure OpenAI untuk respons
- Kemampuan pencarian dokumen menggunakan Cognitive Search
- Integrasi dengan database pelanggan yang sudah ada
- Dukungan multi-bahasa

**Persyaratan Non-Fungsional:**
- Menangani 1000 pengguna secara bersamaan
- SLA uptime 99.9%
- Kepatuhan SOC 2
- Biaya di bawah $500/bulan
- Deploy ke beberapa lingkungan (dev, staging, prod)

### Langkah Implementasi

1. **Desain arsitektur**
2. **Buat template AZD**
3. **Terapkan langkah-langkah keamanan**
4. **Siapkan pemantauan dan alerting**
5. **Buat pipeline deployment**
6. **Dokumentasikan solusi**

### Kriteria Evaluasi

- ✅ **Fungsionalitas**: Apakah memenuhi semua persyaratan?
- ✅ **Keamanan**: Apakah praktik terbaik diterapkan?
- ✅ **Skalabilitas**: Apakah dapat menangani beban?
- ✅ **Kemudahan Pemeliharaan**: Apakah kode dan infrastruktur terorganisir dengan baik?
- ✅ **Biaya**: Apakah tetap dalam anggaran?

## Sumber Daya Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Layanan Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Template Contoh
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Daya Komunitas
- [Discord Azure AI Foundry](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sertifikat Penyelesaian

Selamat! Anda telah menyelesaikan Lab Workshop AI. Sekarang Anda seharusnya dapat:

- ✅ Mengonversi aplikasi AI yang ada ke template AZD
- ✅ Mendeploy aplikasi AI yang siap produksi
- ✅ Menerapkan praktik terbaik keamanan untuk beban kerja AI
- ✅ Memantau dan mengoptimalkan kinerja aplikasi AI
- ✅ Memecahkan masalah umum dalam proses deployment

### Langkah Selanjutnya
1. Terapkan pola ini ke proyek AI Anda sendiri
2. Kontribusikan template kembali ke komunitas
3. Bergabunglah dengan Discord Azure AI Foundry untuk dukungan berkelanjutan
4. Jelajahi topik lanjutan seperti deployment multi-region

---

**Umpan Balik Workshop**: Bantu kami meningkatkan workshop ini dengan membagikan pengalaman Anda di [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berbasis AI
- **⬅️ Sebelumnya**: [Deployment Model AI](ai-model-deployment.md)
- **➡️ Selanjutnya**: [Praktik Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Selanjutnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)

**Butuh Bantuan?** Bergabunglah dengan komunitas kami untuk dukungan dan diskusi tentang AZD dan deployment AI.

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.