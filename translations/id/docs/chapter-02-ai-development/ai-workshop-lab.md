# AI Workshop Lab: Membuat Solusi AI Anda Dapat Dideploy dengan AZD

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berbasis AI
- **⬅️ Sebelumnya**: [Penerapan Model AI](ai-model-deployment.md)
- **➡️ Berikutnya**: [Praktik Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Ikhtisar Workshop

Laboratorium praktis ini memandu pengembang melalui proses mengambil template AI yang sudah ada dan menerapkannya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari pola-pola penting untuk penerapan AI produksi menggunakan layanan Microsoft Foundry.

> **Catatan validasi (2026-03-25):** Workshop ini ditinjau terhadap `azd` `1.23.12`. Jika instalasi lokal Anda lebih lama, perbarui AZD sebelum memulai agar alur kerja autentikasi, template, dan penerapan sesuai dengan langkah-langkah di bawah.

**Durasi:** 2-3 jam  
**Tingkat:** Menengah  
**Prasyarat:** Pengetahuan dasar Azure, familiar dengan konsep AI/ML

## 🎓 Tujuan Pembelajaran

Di akhir workshop ini, Anda akan dapat:
- ✅ Mengonversi aplikasi AI yang ada agar menggunakan template AZD
- ✅ Mengonfigurasi layanan Microsoft Foundry dengan AZD
- ✅ Menerapkan manajemen kredensial yang aman untuk layanan AI
- ✅ Menerapkan aplikasi AI siap-produksi dengan pemantauan
- ✅ Memecahkan masalah umum penerapan AI

## Prasyarat

### Alat yang Diperlukan
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) terinstal
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) terinstal
- [Git](https://git-scm.com/) terinstal
- Editor kode (disarankan VS Code)

### Sumber Daya Azure
- Langganan Azure dengan akses contributor
- Akses ke layanan Microsoft Foundry Models (atau kemampuan untuk meminta akses)
- Izin untuk membuat resource group

### Prasyarat Pengetahuan
- Pemahaman dasar layanan Azure
- Familiar dengan antarmuka baris perintah
- Konsep dasar AI/ML (API, model, prompt)

## Pengaturan Lab

### Langkah 1: Persiapan Lingkungan

1. **Verifikasi instalasi alat:**
```bash
# Periksa instalasi AZD
azd version

# Periksa Azure CLI
az --version

# Masuk ke Azure untuk alur kerja AZD
azd auth login

# Masuk ke Azure CLI hanya jika Anda berencana menjalankan perintah az selama diagnostik
az login
```

Jika Anda bekerja di beberapa tenant atau langganan Anda tidak terdeteksi secara otomatis, ulangi dengan `azd auth login --tenant-id <tenant-id>`.

2. **Clone repositori workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Memahami Struktur AZD untuk Aplikasi AI

### Anatomi template AZD untuk AI

Jelajahi file-file kunci dalam template AZD yang siap AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Latihan Lab 1.1: Jelajahi Konfigurasi**

1. **Periksa file azure.yaml:**
```bash
cat azure.yaml
```

**Yang perlu diperhatikan:**
- Definisi layanan untuk komponen AI
- Pemetaan variabel lingkungan
- Konfigurasi host

2. **Tinjau infrastruktur main.bicep:**
```bash
cat infra/main.bicep
```

**Polapola AI utama yang perlu diidentifikasi:**
- Penyediaan layanan Microsoft Foundry Models
- Integrasi Cognitive Search
- Manajemen kunci yang aman
- Konfigurasi keamanan jaringan

### **Poin Diskusi:** Mengapa Pola-Pola Ini Penting untuk AI

- **Ketergantungan Layanan**: Aplikasi AI sering membutuhkan beberapa layanan yang terkoordinasi
- **Keamanan**: Kunci API dan endpoint perlu dikelola dengan aman
- **Skalabilitas**: Beban kerja AI memiliki kebutuhan penskalaan yang unik
- **Manajemen Biaya**: Layanan AI bisa mahal jika tidak dikonfigurasi dengan benar

## Modul 2: Menerapkan Aplikasi AI Pertama Anda

### Langkah 2.1: Inisialisasi Lingkungan

1. **Buat lingkungan AZD baru:**
```bash
azd env new myai-workshop
```

2. **Tetapkan parameter yang diperlukan:**
```bash
# Atur wilayah Azure pilihan Anda
azd env set AZURE_LOCATION eastus

# Opsional: Atur model OpenAI tertentu
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Langkah 2.2: Terapkan Infrastruktur dan Aplikasi

1. **Deploy dengan AZD:**
```bash
azd up
```

**Apa yang terjadi selama `azd up`:**
- ✅ Menyediakan layanan Microsoft Foundry Models
- ✅ Membuat layanan Cognitive Search
- ✅ Menyiapkan App Service untuk aplikasi web
- ✅ Mengonfigurasi jaringan dan keamanan
- ✅ Menerapkan kode aplikasi
- ✅ Menyiapkan pemantauan dan logging

2. **Pantau kemajuan penerapan** dan catat sumber daya yang dibuat.

### Langkah 2.3: Verifikasi Penerapan Anda

1. **Periksa sumber daya yang telah diterapkan:**
```bash
azd show
```

2. **Buka aplikasi yang telah diterapkan:**
```bash
azd show
```

Buka endpoint web yang ditampilkan pada output `azd show`.

3. **Uji fungsionalitas AI:**
   - Buka aplikasi web
   - Coba kueri contoh
   - Verifikasi bahwa respons AI berfungsi

### **Latihan Lab 2.1: Latihan Pemecahan Masalah**

**Skenario**: Penerapan Anda berhasil tetapi AI tidak merespons.

**Masalah umum yang perlu diperiksa:**
1. **Kunci API OpenAI**: Verifikasi bahwa kunci tersebut diatur dengan benar
2. **Ketersediaan model**: Periksa apakah wilayah Anda mendukung model tersebut
3. **Konektivitas jaringan**: Pastikan layanan dapat berkomunikasi
4. **Izin RBAC**: Verifikasi aplikasi dapat mengakses OpenAI

**Perintah debugging:**
```bash
# Periksa variabel lingkungan
azd env get-values

# Lihat log penerapan
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Periksa status penerapan OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Menyesuaikan Aplikasi AI Sesuai Kebutuhan Anda

### Langkah 3.1: Ubah Konfigurasi AI

1. **Perbarui model OpenAI:**
```bash
# Ganti ke model yang berbeda (jika tersedia di wilayah Anda)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Terapkan ulang dengan konfigurasi baru
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

**Praktik Terbaik**: Konfigurasi yang berbeda untuk pengembangan dan produksi.

1. **Buat lingkungan produksi:**
```bash
azd env new myai-production
```

2. **Tetapkan parameter khusus produksi:**
```bash
# Produksi biasanya menggunakan SKU yang lebih tinggi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktifkan fitur keamanan tambahan
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Latihan Lab 3.1: Optimisasi Biaya**

**Tantangan**: Konfigurasikan template untuk pengembangan yang hemat biaya.

**Tugas:**
1. Identifikasi SKU mana yang dapat disetel ke tier gratis/dasar
2. Konfigurasikan variabel lingkungan untuk biaya minimal
3. Terapkan dan bandingkan biaya dengan konfigurasi produksi

**Petunjuk solusi:**
- Gunakan tier F0 (gratis) untuk Cognitive Services bila memungkinkan
- Gunakan tier Basic untuk Search Service pada pengembangan
- Pertimbangkan menggunakan rencana Consumption untuk Functions

## Modul 4: Keamanan dan Praktik Terbaik Produksi

### Langkah 4.1: Manajemen Kredensial yang Aman

**Tantangan saat ini**: Banyak aplikasi AI menyimpan kunci API secara hardcode atau menggunakan penyimpanan yang tidak aman.

**Solusi AZD**: Integrasi Managed Identity + Key Vault.

1. **Tinjau konfigurasi keamanan di template Anda:**
```bash
# Cari konfigurasi Key Vault dan Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifikasi Managed Identity berfungsi:**
```bash
# Periksa apakah aplikasi web memiliki konfigurasi identitas yang benar
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

### Langkah 4.3: Monitoring dan Observabilitas

1. **Konfigurasikan Application Insights:**
```bash
# Application Insights harus dikonfigurasi secara otomatis
# Periksa konfigurasi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Siapkan monitoring khusus AI:**

Tambahkan metrik kustom untuk operasi AI:
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

**Tugas**: Tinjau penerapan Anda untuk praktik terbaik keamanan.

**Daftar Periksa:**
- [ ] Tidak ada rahasia yang di-hardcode di kode atau konfigurasi
- [ ] Managed Identity digunakan untuk autentikasi layanan-ke-layanan
- [ ] Key Vault menyimpan konfigurasi sensitif
- [ ] Akses jaringan dibatasi dengan benar
- [ ] Monitoring dan logging diaktifkan

## Modul 5: Mengonversi Aplikasi AI Anda Sendiri

### Langkah 5.1: Lembar Penilaian

**Sebelum mengonversi aplikasi Anda**, jawab pertanyaan-pertanyaan ini:

1. **Arsitektur Aplikasi:**
   - Layanan AI apa yang digunakan aplikasi Anda?
   - Sumber daya komputasi apa yang dibutuhkan?
   - Apakah memerlukan basis data?
   - Apa ketergantungan antar layanan?

2. **Kebutuhan Keamanan:**
   - Data sensitif apa yang ditangani aplikasi Anda?
   - Persyaratan kepatuhan apa yang Anda miliki?
   - Apakah Anda membutuhkan jaringan privat?

3. **Kebutuhan Penskalaan:**
   - Berapa beban yang diharapkan?
   - Apakah Anda memerlukan autoscaling?
   - Apakah ada persyaratan regional?

### Langkah 5.2: Buat Template AZD Anda

**Ikuti pola ini untuk mengonversi aplikasi Anda:**

1. **Buat struktur dasar:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inisialisasi template AZD
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
- Microsoft Foundry Models untuk analisis konten
- Document Intelligence untuk OCR
- Storage Account untuk unggahan dokumen
- Function App untuk logika pemrosesan
- Web app untuk antarmuka pengguna

**Poin bonus:**
- Tambahkan penanganan kesalahan yang tepat
- Sertakan estimasi biaya
- Siapkan dashboard monitoring

## Modul 6: Memecahkan Masalah Umum

### Masalah Penerapan Umum

#### Masalah 1: Kuota Layanan OpenAI Terlampaui
**Gejala:** Penerapan gagal dengan kesalahan kuota
**Solusi:**
```bash
# Periksa kuota saat ini
az cognitiveservices usage list --location eastus

# Minta peningkatan kuota atau coba wilayah yang berbeda
azd env set AZURE_LOCATION westus2
azd up
```

#### Masalah 2: Model Tidak Tersedia di Wilayah
**Gejala:** Respons AI gagal atau terjadi kesalahan penerapan model
**Solusi:**
```bash
# Periksa ketersediaan model berdasarkan wilayah
az cognitiveservices model list --location eastus

# Perbarui ke model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Masalah 3: Masalah Izin
**Gejala:** Kesalahan 403 Forbidden saat memanggil layanan AI
**Solusi:**
```bash
# Periksa penugasan peran
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tambahkan peran yang hilang
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
- Terapkan caching untuk kueri yang sering
- Gunakan model OpenAI yang sesuai untuk kasus penggunaan Anda
- Pertimbangkan read replica untuk skenario beban tinggi

### **Latihan Lab 6.1: Tantangan Debugging**

**Skenario**: Penerapan Anda berhasil, tetapi aplikasi mengembalikan kesalahan 500.

**Tugas debugging:**
1. Periksa log aplikasi
2. Verifikasi konektivitas layanan
3. Uji autentikasi
4. Tinjau konfigurasi

**Alat yang digunakan:**
- `azd show` untuk ikhtisar penerapan
- Azure portal untuk log layanan yang lebih rinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Monitoring dan Optimisasi

### Langkah 7.1: Siapkan Monitoring Komprehensif

1. **Buat dashboard kustom:**

Arahkan ke portal Azure dan buat dashboard dengan:
- Jumlah permintaan OpenAI dan latensi
- Tingkat kesalahan aplikasi
- Pemanfaatan sumber daya
- Pelacakan biaya

2. **Siapkan peringatan:**
```bash
# Peringatan untuk tingkat kesalahan yang tinggi
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Langkah 7.2: Optimisasi Biaya

1. **Analisis biaya saat ini:**
```bash
# Gunakan Azure CLI untuk mendapatkan data biaya
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Terapkan kontrol biaya:**
- Tetapkan peringatan anggaran
- Gunakan kebijakan autoscaling
- Terapkan caching permintaan
- Monitor penggunaan token untuk OpenAI

### **Latihan Lab 7.1: Optimisasi Kinerja**

**Tugas**: Optimalkan aplikasi AI Anda untuk kinerja dan biaya.

**Metrik yang perlu ditingkatkan:**
- Kurangi waktu respons rata-rata sebesar 20%
- Kurangi biaya bulanan sebesar 15%
- Pertahankan ketersediaan 99,9%

**Strategi yang bisa dicoba:**
- Terapkan caching respons
- Optimalkan prompt untuk efisiensi token
- Gunakan SKU komputasi yang sesuai
- Siapkan autoscaling yang tepat

## Tantangan Akhir: Implementasi End-to-End

### Skenario Tantangan

Anda ditugaskan untuk membuat chatbot layanan pelanggan bertenaga AI siap-produksi dengan persyaratan berikut:

**Persyaratan Fungsional:**
- Antarmuka web untuk interaksi pelanggan
- Integrasi dengan Microsoft Foundry Models untuk respons
- Kemampuan pencarian dokumen menggunakan Cognitive Search
- Integrasi dengan basis data pelanggan yang ada
- Dukungan multi-bahasa

**Persyaratan Non-Fungsional:**
- Menangani 1000 pengguna bersamaan
- SLA ketersediaan 99,9%
- Kepatuhan SOC 2
- Biaya di bawah $500/bulan
- Terapkan ke beberapa lingkungan (dev, staging, prod)

### Langkah-langkah Implementasi

1. **Rancang arsitektur**
2. **Buat template AZD**
3. **Terapkan langkah-langkah keamanan**
4. **Siapkan monitoring dan pemberitahuan**
5. **Buat pipeline penerapan**
6. **Dokumentasikan solusi**

### Kriteria Evaluasi

- ✅ **Fungsionalitas**: Apakah memenuhi semua persyaratan?
- ✅ **Keamanan**: Apakah praktik terbaik diterapkan?
- ✅ **Skalabilitas**: Dapatkah menangani beban?
- ✅ **Pemeliharaan**: Apakah kode dan infrastruktur terorganisir dengan baik?
- ✅ **Biaya**: Apakah tetap dalam anggaran?

## Sumber Daya Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Layanan Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Template Sampel
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Daya Komunitas
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sertifikat Penyelesaian

Selamat! Anda telah menyelesaikan AI Workshop Lab. Anda sekarang seharusnya mampu:

- ✅ Mengonversi aplikasi AI yang ada menjadi template AZD
- ✅ Mendeploy aplikasi AI siap produksi
- ✅ Menerapkan praktik terbaik keamanan untuk beban kerja AI
- ✅ Memantau dan mengoptimalkan kinerja aplikasi AI
- ✅ Memecahkan masalah umum saat deployment

### Langkah Berikutnya
1. Terapkan pola-pola ini pada proyek AI Anda sendiri
2. Sumbangkan kembali template ke komunitas
3. Bergabung dengan Microsoft Foundry Discord untuk dukungan berkelanjutan
4. Jelajahi topik lanjutan seperti penyebaran multi-region

---

**Masukan Workshop**: Bantu kami meningkatkan workshop ini dengan membagikan pengalaman Anda di [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan yang Mengutamakan AI
- **⬅️ Sebelumnya**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Berikutnya**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Bab Selanjutnya**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Perlu Bantuan?** Bergabunglah dengan komunitas kami untuk dukungan dan diskusi tentang AZD dan penyebaran AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->