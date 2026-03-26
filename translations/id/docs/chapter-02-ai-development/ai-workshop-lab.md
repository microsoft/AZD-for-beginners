# AI Workshop Lab: Membuat Solusi AI Anda Dapat Dideploy dengan AZD

**Chapter Navigation:**
- **📚 Beranda Kursus**: [AZD untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berfokus AI
- **⬅️ Sebelumnya**: [Penerapan Model AI](ai-model-deployment.md)
- **➡️ Selanjutnya**: [Praktik Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Selanjutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Ikhtisar Workshop

Lab praktis ini memandu pengembang melalui proses mengambil template AI yang ada dan mendeploy-nya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari pola-pola penting untuk deployment AI produksi menggunakan layanan Microsoft Foundry.

**Durasi:** 2-3 jam  
**Tingkat:** Menengah  
**Prasyarat:** Pengetahuan dasar Azure, pemahaman tentang konsep AI/ML

## 🎓 Tujuan Pembelajaran

Pada akhir workshop ini, Anda akan mampu:
- ✅ Mengubah aplikasi AI yang ada untuk menggunakan template AZD
- ✅ Mengonfigurasi layanan Microsoft Foundry dengan AZD
- ✅ Menerapkan manajemen kredensial yang aman untuk layanan AI
- ✅ Mendeploy aplikasi AI siap produksi dengan pemantauan
- ✅ Memecahkan masalah umum pada deployment AI

## Prasyarat

### Alat yang Diperlukan
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) terpasang
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) terpasang
- [Git](https://git-scm.com/) terpasang
- Editor kode (VS Code direkomendasikan)

### Sumber Daya Azure
- Langganan Azure dengan akses kontributor
- Akses ke layanan Microsoft Foundry Models (atau kemampuan untuk meminta akses)
- Izin pembuatan grup sumber daya

### Prasyarat Pengetahuan
- Pemahaman dasar tentang layanan Azure
- Familiaritas dengan antarmuka baris perintah
- Konsep dasar AI/ML (API, model, prompt)

## Persiapan Lab

### Langkah 1: Persiapan Lingkungan

1. **Verifikasi pemasangan alat:**
```bash
# Periksa instalasi AZD
azd version

# Periksa Azure CLI
az --version

# Masuk ke Azure
az login
azd auth login
```

2. **Kloning repositori workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Memahami Struktur AZD untuk Aplikasi AI

### Anatomi Template AZD untuk AI

Jelajahi file-file utama dalam template AZD yang siap untuk AI:

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

### **Latihan Lab 1.1: Menjelajahi Konfigurasi**

1. **Periksa file azure.yaml:**
```bash
cat azure.yaml
```

**Yang perlu dicari:**
- Definisi layanan untuk komponen AI
- Pemetaan variabel lingkungan
- Konfigurasi host

2. **Tinjau infrastruktur main.bicep:**
```bash
cat infra/main.bicep
```

**Pola AI kunci yang harus diidentifikasi:**
- Penyediaan layanan Microsoft Foundry Models
- Integrasi Cognitive Search
- Manajemen kunci yang aman
- Konfigurasi keamanan jaringan

### **Poin Diskusi:** Mengapa Pola-Pola Ini Penting untuk AI

- **Ketergantungan Layanan**: Aplikasi AI sering membutuhkan banyak layanan yang terkoordinasi
- **Keamanan**: Kunci API dan endpoint perlu dikelola secara aman
- **Skalabilitas**: Beban kerja AI memiliki kebutuhan penskalaan yang unik
- **Manajemen Biaya**: Layanan AI bisa mahal jika tidak dikonfigurasi dengan benar

## Modul 2: Menerapkan Aplikasi AI Pertama Anda

### Langkah 2.1: Inisialisasi Lingkungan

1. **Buat lingkungan AZD baru:**
```bash
azd env new myai-workshop
```

2. **Atur parameter yang diperlukan:**
```bash
# Atur wilayah Azure pilihan Anda
azd env set AZURE_LOCATION eastus

# Opsional: Tetapkan model OpenAI tertentu
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Langkah 2.2: Terapkan Infrastruktur dan Aplikasi

1. **Terapkan dengan AZD:**
```bash
azd up
```

**Apa yang terjadi selama `azd up`:**
- ✅ Menyediakan layanan Microsoft Foundry Models
- ✅ Membuat layanan Cognitive Search
- ✅ Menyiapkan App Service untuk aplikasi web
- ✅ Mengonfigurasi jaringan dan keamanan
- ✅ Mendeploy kode aplikasi
- ✅ Menyiapkan pemantauan dan pencatatan

2. **Pantau kemajuan deployment** dan catat sumber daya yang dibuat.

### Langkah 2.3: Verifikasi Deploy Anda

1. **Periksa sumber daya yang dideploy:**
```bash
azd show
```

2. **Buka aplikasi yang dideploy:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Uji fungsionalitas AI:**
   - Arahkan ke aplikasi web
   - Coba kueri contoh
   - Verifikasi bahwa respons AI berfungsi

### **Latihan Lab 2.1: Latihan Pemecahan Masalah**

**Skenario**: Deploy Anda berhasil tetapi AI tidak merespons.

**Masalah umum yang perlu diperiksa:**
1. **Kunci API OpenAI**: Verifikasi bahwa kunci telah disetel dengan benar
2. **Ketersediaan model**: Periksa apakah wilayah Anda mendukung model tersebut
3. **Konektivitas jaringan**: Pastikan layanan dapat berkomunikasi
4. **Izin RBAC**: Verifikasi bahwa aplikasi dapat mengakses OpenAI

**Perintah debugging:**
```bash
# Periksa variabel lingkungan
azd env get-values

# Lihat log penerapan
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Periksa status penerapan OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Menyesuaikan Aplikasi AI untuk Kebutuhan Anda

### Langkah 3.1: Ubah Konfigurasi AI

1. **Perbarui model OpenAI:**
```bash
# Ganti ke model lain (jika tersedia di wilayah Anda)
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

**Praktik Terbaik**: Konfigurasi berbeda untuk pengembangan vs produksi.

1. **Buat lingkungan produksi:**
```bash
azd env new myai-production
```

2. **Atur parameter khusus produksi:**
```bash
# Produksi biasanya menggunakan SKU yang lebih tinggi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktifkan fitur keamanan tambahan
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Latihan Lab 3.1: Optimisasi Biaya**

**Tantangan**: Konfigurasikan template agar hemat biaya untuk pengembangan.

**Tugas:**
1. Identifikasi SKU mana yang bisa disetel ke tier gratis/dasar
2. Konfigurasikan variabel lingkungan untuk biaya minimal
3. Deploy dan bandingkan biaya dengan konfigurasi produksi

**Petunjuk solusi:**
- Gunakan tier F0 (gratis) untuk Cognitive Services bila memungkinkan
- Gunakan tier Basic untuk Search Service di lingkungan pengembangan
- Pertimbangkan menggunakan plan Consumption untuk Functions

## Modul 4: Keamanan dan Praktik Terbaik Produksi

### Langkah 4.1: Manajemen Kredensial yang Aman

**Tantangan saat ini**: Banyak aplikasi AI menyimpan kunci API secara langsung di kode atau menggunakan penyimpanan yang tidak aman.

**Solusi AZD**: Integrasi Managed Identity + Key Vault.

1. **Tinjau konfigurasi keamanan di template Anda:**
```bash
# Cari konfigurasi Key Vault dan Identitas Terkelola
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

### Langkah 4.3: Pemantauan dan Observabilitas

1. **Konfigurasikan Application Insights:**
```bash
# Application Insights seharusnya dikonfigurasi secara otomatis
# Periksa konfigurasi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Siapkan pemantauan khusus AI:**

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

**Tugas**: Tinjau deployment Anda untuk praktik terbaik keamanan.

**Daftar Periksa:**
- [ ] Tidak ada rahasia yang disimpan langsung di kode atau konfigurasi
- [ ] Managed Identity digunakan untuk otentikasi antar layanan
- [ ] Key Vault menyimpan konfigurasi sensitif
- [ ] Akses jaringan dibatasi dengan benar
- [ ] Pemantauan dan pencatatan diaktifkan

## Modul 5: Mengonversi Aplikasi AI Anda Sendiri

### Langkah 5.1: Lembar Kerja Penilaian

**Sebelum mengonversi aplikasi Anda**, jawab pertanyaan-pertanyaan ini:

1. **Arsitektur Aplikasi:**
   - Layanan AI apa yang digunakan aplikasi Anda?
   - Sumber daya komputasi apa yang dibutuhkan?
   - Apakah memerlukan database?
   - Apa ketergantungan antar layanan?

2. **Persyaratan Keamanan:**
   - Data sensitif apa yang ditangani aplikasi Anda?
   - Persyaratan kepatuhan apa yang Anda miliki?
   - Apakah Anda membutuhkan jaringan privat?

3. **Persyaratan Skalabilitas:**
   - Berapa beban yang diharapkan?
   - Apakah Anda membutuhkan auto-scaling?
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
- Siapkan dashboard pemantauan

## Modul 6: Pemecahan Masalah Umum

### Masalah Deployment Umum

#### Masalah 1: Kuota Layanan OpenAI Terlampaui
**Gejala:** Deployment gagal dengan kesalahan kuota
**Solusi:**
```bash
# Periksa kuota saat ini
az cognitiveservices usage list --location eastus

# Minta peningkatan kuota atau coba wilayah lain
azd env set AZURE_LOCATION westus2
azd up
```

#### Masalah 2: Model Tidak Tersedia di Wilayah
**Gejala:** Respons AI gagal atau terjadi kesalahan deployment model
**Solusi:**
```bash
# Periksa ketersediaan model berdasarkan wilayah
az cognitiveservices model list --location eastus

# Perbarui ke model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
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

### Masalah Performa

#### Masalah 4: Respons AI Lambat
**Langkah investigasi:**
1. Periksa Application Insights untuk metrik performa
2. Tinjau metrik layanan OpenAI di portal Azure
3. Verifikasi konektivitas jaringan dan latensi

**Solusi:**
- Terapkan caching untuk kueri yang sering muncul
- Gunakan model OpenAI yang sesuai untuk kasus penggunaan Anda
- Pertimbangkan read replica untuk skenario beban tinggi

### **Latihan Lab 6.1: Tantangan Debugging**

**Skenario**: Deploy Anda berhasil, tetapi aplikasi mengembalikan kesalahan 500.

**Tugas debugging:**
1. Periksa log aplikasi
2. Verifikasi konektivitas layanan
3. Uji otentikasi
4. Tinjau konfigurasi

**Alat yang digunakan:**
- `azd show` untuk gambaran deployment
- Azure portal untuk log layanan yang lebih rinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Optimisasi

### Langkah 7.1: Siapkan Pemantauan Komprehensif

1. **Buat dasbor kustom:**

Arahkan ke portal Azure dan buat dasbor dengan:
- Jumlah permintaan OpenAI dan latensi
- Tingkat error aplikasi
- Pemanfaatan sumber daya
- Pelacakan biaya

2. **Siapkan pemberitahuan:**
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
- Siapkan notifikasi anggaran
- Gunakan kebijakan autoscaling
- Terapkan caching permintaan
- Pantau penggunaan token untuk OpenAI

### **Latihan Lab 7.1: Optimisasi Performa**

**Tugas**: Optimalkan aplikasi AI Anda untuk performa dan biaya.

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

Anda ditugaskan membuat chatbot layanan pelanggan berbasis AI yang siap produksi dengan persyaratan berikut:

**Persyaratan Fungsional:**
- Antarmuka web untuk interaksi pelanggan
- Integrasi dengan Microsoft Foundry Models untuk respons
- Kemampuan pencarian dokumen menggunakan Cognitive Search
- Integrasi dengan database pelanggan yang ada
- Dukungan multi-bahasa

**Persyaratan Non-Fungsional:**
- Menangani 1000 pengguna bersamaan
- SLA uptime 99.9%
- Kepatuhan SOC 2
- Biaya di bawah $500/bulan
- Deploy ke beberapa lingkungan (dev, staging, prod)

### Langkah Implementasi

1. **Rancang arsitektur**
2. **Buat template AZD**
3. **Terapkan langkah-langkah keamanan**
4. **Siapkan pemantauan dan pemberitahuan**
5. **Buat pipeline deployment**
6. **Dokumentasikan solusi**

### Kriteria Evaluasi

- ✅ **Fungsionalitas**: Apakah memenuhi semua persyaratan?
- ✅ **Keamanan**: Apakah praktik terbaik diimplementasikan?
- ✅ **Skalabilitas**: Dapatkah menangani beban?
- ✅ **Pemeliharaan**: Apakah kode dan infrastruktur terorganisir dengan baik?
- ✅ **Biaya**: Apakah tetap dalam anggaran?

## Sumber Daya Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Layanan Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Contoh Template
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Daya Komunitas
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sertifikat Penyelesaian

Selamat! Anda telah menyelesaikan Lab Workshop AI. Anda sekarang seharusnya dapat:
- ✅ Mengonversi aplikasi AI yang ada menjadi template AZD
- ✅ Mendeploy aplikasi AI siap produksi
- ✅ Menerapkan praktik terbaik keamanan untuk beban kerja AI
- ✅ Memantau dan mengoptimalkan kinerja aplikasi AI
- ✅ Memecahkan masalah deployment umum

### Langkah Selanjutnya
1. Terapkan pola ini ke proyek AI Anda sendiri
2. Kontribusikan template kembali ke komunitas
3. Bergabung dengan Microsoft Foundry Discord untuk dukungan berkelanjutan
4. Jelajahi topik lanjutan seperti penerapan multi-region

---

**Umpan Balik Workshop**: Bantu kami meningkatkan workshop ini dengan membagikan pengalaman Anda di the [Microsoft Foundry Discord saluran #Azure](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berorientasi AI
- **⬅️ Sebelumnya**: [Penerapan Model AI](ai-model-deployment.md)
- **➡️ Selanjutnya**: [Praktik Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Butuh Bantuan?** Bergabunglah dengan komunitas kami untuk dukungan dan diskusi tentang AZD dan penerapan AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah penafsiran yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->