# Lab Workshop AI: Membuat Solusi AI Anda Bisa Dideploy dengan AZD  

**Navigasi Bab:**  
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)  
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-Pertama  
- **⬅️ Sebelumnya**: [Deployment Model AI](ai-model-deployment.md)  
- **➡️ Berikutnya**: [Praktik Terbaik AI Produksi](production-ai-practices.md)  
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)  

## Ikhtisar Workshop  

Laboratorium praktik ini memandu pengembang melalui proses mengambil template AI yang sudah ada dan menerapkannya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari pola penting untuk deployment AI produksi menggunakan layanan Microsoft Foundry.  

> **Catatan validasi (2026-07-13):** Workshop ini telah ditinjau dengan `azd` versi `1.27.1`. Jika instalasi lokal Anda lebih lama, perbarui AZD sebelum memulai agar autentikasi, template, dan alur kerja deployment cocok dengan langkah-langkah di bawah ini.  

**Durasi:** 2-3 jam  
**Tingkat:** Menengah  
**Prasyarat:** Pengetahuan dasar Azure, pemahaman konsep AI/ML  

## 🎓 Objektif Pembelajaran  

Pada akhir workshop ini, Anda akan dapat:  
- ✅ Mengonversi aplikasi AI yang sudah ada untuk menggunakan template AZD  
- ✅ Mengonfigurasi layanan Microsoft Foundry dengan AZD  
- ✅ Menerapkan pengelolaan kredensial yang aman untuk layanan AI  
- ✅ Mendeploy aplikasi AI siap produksi dengan monitoring  
- ✅ Memecahkan masalah umum deployment AI  

## Prasyarat  

### Alat yang Diperlukan  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) terpasang  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) terpasang  
- [Git](https://git-scm.com/) terpasang  
- Editor kode (Direkomendasikan VS Code)  

### Sumber Daya Azure  
- Langganan Azure dengan akses kontributor  
- Akses ke layanan Microsoft Foundry Models (atau kemampuan mengajukan akses)  
- Izin pembuatan grup sumber daya  

### Pengetahuan Prasyarat  
- Pemahaman dasar layanan Azure  
- Familiar dengan antarmuka baris perintah  
- Konsep AI/ML dasar (API, model, prompt)  

## Persiapan Lab  

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
  
Jika Anda bekerja di beberapa tenant atau langganan Anda tidak terdeteksi otomatis, coba lagi dengan `azd auth login --tenant-id <tenant-id>`.  

2. **Clone repositori workshop:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Modul 1: Memahami Struktur AZD untuk Aplikasi AI  

### Anatomi Template AZD AI  

Jelajahi file utama dalam template AZD siap AI:  

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
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
  
**Yang harus diperhatikan:**  
- Definisi layanan untuk komponen AI  
- Pemetaan variabel lingkungan  
- Konfigurasi host  

2. **Tinjau infrastruktur main.bicep:**  
```bash
cat infra/main.bicep
```
  
**Pola AI penting yang harus diidentifikasi:**  
- Penyediaan layanan Microsoft Foundry Models  
- Integrasi Azure AI Search  
- Pengelolaan kunci yang aman  
- Konfigurasi keamanan jaringan  

### **Poin Diskusi:** Mengapa Pola Ini Penting untuk AI  

- **Ketergantungan Layanan**: Aplikasi AI sering memerlukan beberapa layanan yang terkoordinasi  
- **Keamanan**: Kunci API dan endpoint perlu pengelolaan yang aman  
- **Skalabilitas**: Beban kerja AI memiliki kebutuhan penskalaan unik  
- **Manajemen Biaya**: Layanan AI bisa mahal jika tidak dikonfigurasi dengan baik  

## Modul 2: Deploy Aplikasi AI Pertama Anda  

### Langkah 2.1: Inisialisasi Lingkungan  

1. **Buat lingkungan AZD baru:**  
```bash
azd env new myai-workshop
```
  
2. **Setel parameter yang diperlukan:**  
```bash
# Atur wilayah Azure yang Anda inginkan
azd env set AZURE_LOCATION eastus

# Opsional: Atur model OpenAI tertentu
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### Langkah 2.2: Deploy Infrastruktur dan Aplikasi  

1. **Deploy dengan AZD:**  
```bash
azd up
```
  
**Yang terjadi selama `azd up`:**  
- ✅ Menyediakan layanan Microsoft Foundry Models  
- ✅ Membuat layanan Azure AI Search  
- ✅ Menyiapkan App Service untuk aplikasi web  
- ✅ Mengonfigurasi jaringan dan keamanan  
- ✅ Mendeploy kode aplikasi  
- ✅ Menyiapkan monitoring dan logging  

2. **Pantau kemajuan deployment** dan catat sumber daya yang dibuat.  

### Langkah 2.3: Verifikasi Deployment Anda  

1. **Periksa sumber daya yang sudah dideploy:**  
```bash
azd show
```
  
2. **Buka aplikasi yang sudah dideploy:**  
```bash
azd show
```
  
Buka endpoint web yang ditampilkan di output `azd show`.  

3. **Uji fungsi AI:**  
   - Navigasikan ke aplikasi web  
   - Coba kueri contoh  
   - Pastikan respons AI berfungsi  

### **Latihan Lab 2.1: Latihan Pemecahan Masalah**  

**Skenario**: Deployment Anda berhasil tapi AI tidak merespons.  

**Masalah umum yang harus diperiksa:**  
1. **Kunci API OpenAI**: Verifikasi sudah disetel dengan benar  
2. **Ketersediaan model**: Periksa apakah wilayah Anda mendukung model tersebut  
3. **Konektivitas jaringan**: Pastikan layanan dapat berkomunikasi  
4. **Izin RBAC**: Verifikasi aplikasi dapat mengakses OpenAI  

**Perintah debugging:**  
```bash
# Periksa variabel lingkungan
azd env get-values

# Lihat log penyebaran
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Periksa status penyebaran OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Modul 3: Kostumisasi Aplikasi AI untuk Kebutuhan Anda  

### Langkah 3.1: Modifikasi Konfigurasi AI  

1. **Perbarui model OpenAI:**  
```bash
# Ganti ke model lain (jika tersedia di wilayah Anda)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Deploy ulang dengan konfigurasi baru
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

**Praktik Terbaik**: Konfigurasi berbeda untuk pengembangan dan produksi.  

1. **Buat lingkungan produksi:**  
```bash
azd env new myai-production
```
  
2. **Setel parameter khusus produksi:**  
```bash
# Produksi biasanya menggunakan SKU yang lebih tinggi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktifkan fitur keamanan tambahan
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **Latihan Lab 3.1: Optimasi Biaya**  

**Tantangan**: Konfigurasikan template untuk pengembangan yang hemat biaya.  

**Tugas:**  
1. Identifikasi SKU mana yang bisa disetel ke tier gratis/dasar  
2. Konfigurasikan variabel lingkungan untuk biaya minimal  
3. Deploy dan bandingkan biaya dengan konfigurasi produksi  

**Petunjuk solusi:**  
- Gunakan tier F0 (gratis) untuk Azure AI Services bila memungkinkan  
- Gunakan tier Dasar untuk Search Service di pengembangan  
- Pertimbangkan penggunaan rencana Konsumsi untuk Functions  

## Modul 4: Keamanan dan Praktik Terbaik Produksi  

### Langkah 4.1: Pengelolaan Kredensial Aman  

**Tantangan saat ini**: Banyak aplikasi AI menyimpan kunci API secara hardcode atau menggunakan penyimpanan yang tidak aman.  

**Solusi AZD**: Identitas Terkelola + integrasi Key Vault.  

1. **Tinjau konfigurasi keamanan di template Anda:**  
```bash
# Cari konfigurasi Key Vault dan Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Verifikasi Identitas Terkelola berfungsi:**  
```bash
# Periksa apakah aplikasi web memiliki konfigurasi identitas yang benar
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### Langkah 4.2: Keamanan Jaringan  

1. **Aktifkan private endpoint** (jika belum dikonfigurasi):  

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

**Tugas:** Tinjau deployment Anda untuk praktik keamanan terbaik.  

**Daftar Periksa:**  
- [ ] Tidak ada rahasia yang di-hardcode di kode atau konfigurasi  
- [ ] Identitas Terkelola digunakan untuk autentikasi layanan ke layanan  
- [ ] Key Vault menyimpan konfigurasi sensitif  
- [ ] Akses jaringan dibatasi dengan benar  
- [ ] Monitoring dan logging diaktifkan  

## Modul 5: Mengonversi Aplikasi AI Anda Sendiri  

### Langkah 5.1: Lembar Penilaian  

**Sebelum mengonversi aplikasi Anda**, jawab pertanyaan ini:  

1. **Arsitektur Aplikasi:**  
   - Layanan AI apa yang digunakan aplikasi Anda?  
   - Sumber daya komputasi apa yang dibutuhkan?  
   - Apakah memerlukan database?  
   - Apa ketergantungan antar layanan?  

2. **Kebutuhan Keamanan:**  
   - Data sensitif apa yang ditangani aplikasi Anda?  
   - Persyaratan kepatuhan apa yang Anda miliki?  
   - Apakah Anda butuh jaringan privat?  

3. **Kebutuhan Skalabilitas:**  
   - Berapa beban yang diharapkan?  
   - Apakah butuh penskalaan otomatis?  
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

**Tantangan**: Buat template AZD untuk aplikasi AI pengolahan dokumen.  

**Persyaratan:**  
- Microsoft Foundry Models untuk analisis konten  
- Document Intelligence untuk OCR  
- Storage Account untuk unggahan dokumen  
- Function App untuk logika pemrosesan  
- Aplikasi web untuk antarmuka pengguna  

**Poin bonus:**  
- Tambahkan penanganan error yang tepat  
- Sertakan estimasi biaya  
- Siapkan dasbor monitoring  

## Modul 6: Memecahkan Masalah Umum  

### Masalah Deployment Umum  

#### Masalah 1: Kuota Layanan OpenAI Terlampaui  
**Gejala:** Deployment gagal dengan error kuota  
**Solusi:**  
```bash
# Periksa kuota saat ini
az cognitiveservices usage list --location eastus

# Minta penambahan kuota atau coba wilayah lain
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Masalah 2: Model Tidak Tersedia di Wilayah  
**Gejala:** Respons AI gagal atau error deployment model  
**Solusi:**  
```bash
# Periksa ketersediaan model berdasarkan wilayah
az cognitiveservices model list --location eastus

# Perbarui ke model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### Masalah 3: Masalah Izin  
**Gejala:** Error 403 Forbidden ketika memanggil layanan AI  
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
3. Verifikasi konektivitas dan latensi jaringan  

**Solusi:**  
- Terapkan caching untuk kueri umum  
- Gunakan model OpenAI yang sesuai dengan kasus penggunaan  
- Pertimbangkan replika baca untuk skenario beban tinggi  

### **Latihan Lab 6.1: Tantangan Debugging**  

**Skenario:** Deployment Anda berhasil, tapi aplikasi mengembalikan error 500.  

**Tugas debugging:**  
1. Periksa log aplikasi  
2. Verifikasi konektivitas layanan  
3. Uji autentikasi  
4. Tinjau konfigurasi  

**Alat yang digunakan:**  
- `azd show` untuk overview deployment  
- Portal Azure untuk log layanan yang detail  
- Application Insights untuk telemetri aplikasi  

## Modul 7: Monitoring dan Optimasi  

### Langkah 7.1: Siapkan Monitoring Komprehensif  

1. **Buat dasbor kustom:**  

Navigasi ke portal Azure dan buat dasbor dengan:  
- Jumlah dan latensi permintaan OpenAI  
- Tingkat error aplikasi  
- Pemanfaatan sumber daya  
- Pelacakan biaya  

2. **Siapkan alert:**  
```bash
# Peringatan untuk tingkat kesalahan yang tinggi
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
# Gunakan Azure CLI untuk mendapatkan data biaya
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Terapkan kontrol biaya:**  
- Siapkan alert anggaran  
- Gunakan kebijakan autoscaling  
- Terapkan caching permintaan  
- Pantau penggunaan token untuk OpenAI  

### **Latihan Lab 7.1: Optimasi Performa**  

**Tugas:** Optimasi aplikasi AI Anda untuk performa dan biaya.  

**Metrik yang harus diperbaiki:**  
- Kurangi waktu respons rata-rata sebanyak 20%  
- Kurangi biaya bulanan sebanyak 15%  
- Pertahankan uptime 99,9%  

**Strategi yang bisa dicoba:**  
- Terapkan caching respons  
- Optimalkan prompt untuk efisiensi token  
- Gunakan SKU komputasi yang sesuai  
- Siapkan autoscaling yang tepat  

## Tantangan Akhir: Implementasi End-to-End  

### Skenario Tantangan  

Anda ditugaskan membuat chatbot layanan pelanggan bertenaga AI siap produksi dengan persyaratan berikut:  

**Persyaratan Fungsional:**  
- Antarmuka web untuk interaksi pelanggan  
- Integrasi dengan Microsoft Foundry Models untuk respons  
- Kemampuan pencarian dokumen menggunakan Azure AI Search  
- Integrasi dengan database pelanggan yang sudah ada  
- Dukungan multi-bahasa  

**Persyaratan Non-Fungsional:**  
- Menangani 1000 pengguna bersamaan  
- SLA uptime 99,9%  
- Kepatuhan SOC 2  
- Biaya di bawah $500/bulan  
- Deploy ke beberapa lingkungan (dev, staging, prod)  

### Langkah Implementasi  

1. **Rancang arsitektur**  
2. **Buat template AZD**  
3. **Terapkan langkah keamanan**  
4. **Siapkan monitoring dan alerting**  
5. **Buat pipeline deployment**  
6. **Dokumentasikan solusi**  

### Kriteria Evaluasi  

- ✅ **Fungsionalitas:** Apakah memenuhi semua persyaratan?  
- ✅ **Keamanan:** Apakah praktik terbaik diterapkan?  
- ✅ **Skalabilitas:** Apakah mampu menangani beban?  
- ✅ **Pemeliharaan:** Apakah kode dan infrastruktur terorganisasi dengan baik?  
- ✅ **Biaya:** Apakah sesuai anggaran?  

## Sumber Daya Tambahan  

### Dokumentasi Microsoft  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Dokumentasi Layanan Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### Template Contoh  
- [Aplikasi Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [Quickstart Aplikasi Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)  

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Daya Komunitas
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sertifikat Penyelesaian

Selamat! Anda telah menyelesaikan Lab Workshop AI. Sekarang Anda seharusnya dapat:

- ✅ Mengubah aplikasi AI yang sudah ada menjadi template AZD
- ✅ Menyebarkan aplikasi AI siap produksi
- ✅ Menerapkan praktik keamanan terbaik untuk beban kerja AI
- ✅ Memantau dan mengoptimalkan kinerja aplikasi AI
- ✅ Memecahkan masalah umum penyebaran

### Langkah Selanjutnya
1. Terapkan pola-pola ini pada proyek AI Anda sendiri
2. Kontribusikan template kembali ke komunitas
3. Bergabunglah dengan Microsoft Foundry Discord untuk dukungan berkelanjutan
4. Jelajahi topik lanjutan seperti penyebaran multi-region

---

**Umpan Balik Workshop**: Bantu kami meningkatkan workshop ini dengan membagikan pengalaman Anda di [saluran Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-Pertama
- **⬅️ Sebelumnya**: [Penyebaran Model AI](ai-model-deployment.md)
- **➡️ Selanjutnya**: [Praktik Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Butuh Bantuan?** Bergabunglah dengan komunitas kami untuk dukungan dan diskusi tentang AZD dan penyebaran AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->