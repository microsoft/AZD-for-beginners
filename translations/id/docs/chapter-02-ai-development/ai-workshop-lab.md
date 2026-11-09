# Lab Workshop AI: Membuat Solusi AI Anda Bisa Dideploy dengan AZD  

**Navigasi Bab:**  
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)  
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-Pertama  
- **⬅️ Sebelumnya**: [Deployment Model AI](ai-model-deployment.md)  
- **➡️ Berikutnya**: [Praktik Terbaik AI Produksi](../chapter-08-production/production-ai-practices.md)  
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)  

## Ikhtisar Workshop  

Lab praktis ini membimbing pengembang melalui proses mengambil template AI yang sudah ada dan mendeploynya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari pola penting untuk deployment AI produksi menggunakan layanan Microsoft Foundry.  

> **Ulasan Rilis (2026-11-04):** Panduan perintah AZD dan nama konfigurasi contoh telah diperiksa terhadap rilis `azd` `1.37.2` dan konfigurasi contoh yang terhubung saat ini. Ini adalah tinjauan dokumentasi, bukan validasi deployment langsung. Lab RAG tidak memerlukan ekstensi agen; untuk evaluasi agen, gunakan ekstensi `azure.ai.evaluations` terpisah dan [alur evaluasi saat ini](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), bukan perintah evaluasi agen lama.  

**Durasi:** 2-3 jam  
**Tingkat:** Menengah  
**Prasyarat:** Pengetahuan dasar Azure, pemahaman konsep AI/ML  

## 🎓 Tujuan Pembelajaran  

Pada akhir workshop ini, Anda akan dapat:  
- ✅ Menjelajahi template AI AZD yang ada dan merencanakan konversi aplikasi Anda sendiri  
- ✅ Mengonfigurasi layanan Microsoft Foundry dengan AZD  
- ✅ Menerapkan manajemen kredensial aman untuk layanan AI  
- ✅ Mendeploy aplikasi referensi AI dengan pemantauan  
- ✅ Memecahkan masalah umum deployment AI  

## Prasyarat  

### Alat yang Diperlukan  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) terpasang  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) terpasang  
- [Git](https://git-scm.com/) terpasang  
- Editor kode (disarankan VS Code)  

Blok perintah ini menggunakan sintaks Bash (termasuk kelanjutan baris dan `grep`). Di Windows, gunakan Git Bash/WSL atau terjemahkan ke PowerShell. Juga pasang bahasa, manajer paket, dan alat container yang tercantum di [pengaturan lingkungan lokal contoh](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).  

### Sumber Daya Azure  
- Langganan Azure dengan izin provisioning sumber daya dan penetapan peran (Contributor saja tidak bisa membuat penetapan RBAC; gunakan administrator peran resmi atau setara yang didokumentasikan oleh contoh)  
- Akses ke layanan Microsoft Foundry Models (atau kemampuan untuk meminta akses)  
- Izin pembuatan grup sumber daya  

### Pengetahuan Prasyarat  
- Pemahaman dasar layanan Azure  
- Familiar dengan antarmuka baris perintah  
- Konsep dasar AI/ML (API, model, prompt)  

## Persiapan Lab  

### Langkah 1: Persiapan Lingkungan  

1. **Verifikasi pemasangan alat:**  
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```
  
Jika Anda bekerja lintas tenant atau langganan Anda tidak terdeteksi otomatis, coba ulang dengan `azd auth login --tenant-id <tenant-id>`.  

2. **Clone repositori workshop:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Modul 1: Memahami Struktur AZD untuk Aplikasi AI  

### Anatomi Template AI AZD  

Jelajahi berkas utama dalam template AZD yang siap AI:  

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```
  
Contoh checkout dapat berubah; `.azure/` muncul setelah inisialisasi lingkungan, tidak harus di clone baru. Periksa checkout yang sebenarnya daripada membuat direktori hilang untuk mencocokkan skema ini.  

### **Latihan Lab 1.1: Menjelajahi Konfigurasi**  

1. **Periksa berkas azure.yaml:**  
```bash
cat azure.yaml
```
  
**Hal yang diperhatikan:**  
- Definisi layanan untuk komponen AI  
- Pemetaan variabel lingkungan  
- Konfigurasi host  

2. **Tinjau infrastruktur main.bicep:**  
```bash
cat infra/main.bicep
```
  
**Pola AI penting yang diidentifikasi:**  
- Provision layanan Microsoft Foundry Models  
- Integrasi Azure AI Search  
- Manajemen kunci yang aman  
- Konfigurasi keamanan jaringan  

### **Poin Diskusi:** Mengapa Pola Ini Penting untuk AI  

- **Ketergantungan Layanan**: Aplikasi AI sering memerlukan banyak layanan yang terkoordinasi  
- **Keamanan**: Kunci API dan endpoint harus dikelola dengan aman  
- **Skalabilitas**: Beban kerja AI memiliki kebutuhan skala unik  
- **Manajemen Biaya**: Layanan AI bisa mahal jika tidak dikonfigurasi dengan tepat  

## Modul 2: Deploy Aplikasi AI Pertama Anda  

### Langkah 2.1: Inisialisasi Lingkungan  

1. **Buat lingkungan AZD baru:**  
```bash
azd env new myai-workshop
```
  
2. **Setel parameter yang dibutuhkan:**  
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```
  
### Langkah 2.2: Deploy Infrastruktur dan Aplikasi  

1. **Deploy dengan AZD:**  
```bash
azd up
```
  
**Yang terjadi selama `azd up`:**  
- ✅ Meng-provision layanan Microsoft Foundry Models  
- ✅ Membuat layanan Azure AI Search  
- ✅ Mengatur Azure Container Apps untuk backend dan frontend yang dibundel (default contoh saat ini)  
- ✅ Mengonfigurasi jaringan dan keamanan  
- ✅ Mendeploy kode aplikasi  
- ✅ Menyiapkan pemantauan dan pencatatan  

2. **Pantau kemajuan deployment** dan catat sumber daya yang dibuat.  

### Langkah 2.3: Verifikasi Deployment Anda  

1. **Periksa sumber daya yang dideploy:**  
```bash
azd show
```
  
2. **Buka aplikasi yang dideploy:**  
```bash
azd show
```
  
Buka endpoint web yang ditampilkan di output `azd show`.  

3. **Uji fungsionalitas AI:**  
   - Navigasi ke aplikasi web  
   - Coba query contoh  
   - Verifikasi respons AI berfungsi  

### **Latihan Lab 2.1: Latihan Pemecahan Masalah**  

**Skenario**: Deployment Anda berhasil tapi AI tidak merespons.  

**Masalah umum yang perlu diperiksa:**  
1. **Otentikasi**: Verifikasi managed identity dan penugasan peran; periksa kunci API hanya jika Anda sengaja mengaktifkan otentikasi berbasis kunci  
2. **Ketersediaan model**: Periksa apakah wilayah Anda mendukung model  
3. **Konektivitas jaringan**: Pastikan layanan dapat saling berkomunikasi  
4. **Izin RBAC**: Verifikasi aplikasi dapat mengakses OpenAI  

**Perintah debugging:**  
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Modul 3: Kustomisasi Aplikasi AI Sesuai Kebutuhan Anda  

### Langkah 3.1: Modifikasi Konfigurasi AI  

1. **Perbarui model OpenAI:**  
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```
  
2. **Tambahkan layanan AI tambahan:**  

Edit `infra/main.bicep` untuk menambahkan Document Intelligence:  

Berikut ini adalah fragmen ilustratif, bukan template lengkap. Contoh mungkin sudah melakukan provision layanan pemrosesan dokumen: periksa infrastrukturnya saat ini sebelum menambahkan sumber daya duplikat. Penambahan khusus memerlukan pengkabelan output, identitas, dan konfigurasi aplikasi.  

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
  
2. **Setel parameter khusus produksi:**  
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```
  
Nama-nama ini berasal dari [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) contoh. `azd env set` menyimpan nilai tapi tidak membuat variabel arbitrer efektif: template harus menggunakannya. Tinjau [panduan isolasi jaringan](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) contoh sebelum menonaktifkan akses publik, dan gunakan `azd up` untuk menerapkan perubahan infrastruktur. SKU OpenAI `S0` sendiri tidak menentukan throughput model; tipe deployment model dan kapasitas juga penting.  

### **Latihan Lab 3.1: Optimasi Biaya**  

**Tantangan**: Konfigurasikan template untuk pengembangan yang hemat biaya.  

**Tugas:**  
1. Pilih lingkungan workshop sekali pakai: `azd env select myai-workshop`.  
2. Catat SKU Search saat ini dan kapasitas model dari `infra/main.parameters.json` dan lingkungan yang dipilih.  
3. Gunakan input yang didukung di bawah, setelah memeriksa kuota model/wilayah:  
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Verifikasi SKU Search dan kapasitas deployment di portal dan estimasi perbedaan dengan kalkulator harga. Jangan berharap data tagihan diperbarui segera.  

**Kriteria keberhasilan:** Search menggunakan Basic, deployment chat memiliki kapasitas yang diminta didukung, dan aplikasi masih menjawab pertanyaan contoh. Kapasitas `10` adalah alokasi batas laju, bukan diskon harga token. Perubahan tier Search dapat dibatasi atau memerlukan rekreasi; jangan eksperimen di sumber daya produksi. F0 adalah spesifik layanan dan bukan SKU model Azure OpenAI.  

## Modul 4: Keamanan dan Praktik Terbaik Produksi  

### Langkah 4.1: Manajemen Kredensial Aman  

**Tantangan saat ini:** Banyak aplikasi AI menanamkan kunci API atau menggunakan penyimpanan yang tidak aman.  

**Solusi AZD:** Managed Identity + integrasi Key Vault.  

1. **Tinjau konfigurasi keamanan dalam template Anda:**  
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Verifikasi Managed Identity berfungsi:**  
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```
  
### Langkah 4.2: Keamanan Jaringan  

1. **Aktifkan private endpoint** menggunakan konfigurasi jaringan yang didukung contoh (jika belum dikonfigurasi).  

Untuk template Anda sendiri, fragmen ilustratif ini menunjukkan koneksi endpoint OpenAI. Ini juga memerlukan VNet, konfigurasi DNS privat, dan konektivitas aplikasi; jangan tempel tanpa diubah ke contoh, yang sudah memiliki modul private-endpoint:  
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
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```
  
2. **Aktifkan integrasi Application Insights contoh:**  
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```
  
Instrumentasi contoh mengirim telemetri; pengaturan `OPENAI_MONITOR_ENABLED` sewenang-wenang tidak mengaktifkan metrik AI. Tinjau jejak panggilan model, latensi, kegagalan, dan penggunaan token, dan hindari merekam prompt atau respons sensitif.  

### **Latihan Lab 4.1: Audit Keamanan**  

**Tugas:** Tinjau deployment Anda untuk praktik terbaik keamanan.  

**Daftar periksa:**  
- [ ] Tidak ada rahasia tertanam di kode atau konfigurasi  
- [ ] Managed Identity digunakan untuk otentikasi layanan-ke-layanan  
- [ ] Key Vault menyimpan konfigurasi sensitif  
- [ ] Akses jaringan dibatasi dengan benar  
- [ ] Pemantauan dan pencatatan diaktifkan  

## Modul 5: Mengonversi Aplikasi AI Anda Sendiri  

### Langkah 5.1: Lembar Penilaian  

**Sebelum mengonversi aplikasi Anda,** jawab pertanyaan berikut:  

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
   - Berapa beban yang diharapkan?  
   - Apakah Anda memerlukan auto-scaling?  
   - Apakah ada persyaratan regional?  

### Langkah 5.2: Buat Template AZD Anda  

**Ikuti pola ini untuk mengonversi aplikasi Anda:**  

**Hanya scaffolding:** Bagian ini tidak menyediakan sumber API/aplikasi web, infrastruktur host, deployment model, identitas/RBAC, atau `main.parameters.json` lengkap. Bicep yang berjangkauan grup sumber daya menggambarkan komposisi modul; titik masuk berjangkauan langganan AZD biasanya harus membuat grup sumber daya dan memanggilnya di lingkup itu. Jangan berharap `azd up` mendeploy aplikasi lengkap hanya dengan menyalin fragmen ini. Untuk baseline yang dapat dijalankan, terus gunakan template RAG dari Modul 1.  

1. **Buat struktur dasar:**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```
  
### **Latihan Lab 5.1: Tantangan Pembuatan Template**  

**Tantangan:** Buat template AZD untuk aplikasi AI pemrosesan dokumen.  

**Persyaratan:**  
- Microsoft Foundry Models untuk analisis konten  
- Document Intelligence untuk OCR  
- Storage Account untuk unggahan dokumen  
- Function App untuk logika pemrosesan  
- Aplikasi web untuk antarmuka pengguna  

**Poin bonus:**  
- Tambahkan penanganan error yang tepat  
- Sertakan estimasi biaya  
- Siapkan dasbor pemantauan  

## Modul 6: Memecahkan Masalah Umum  

### Masalah Deployment Umum  

#### Masalah 1: Kuota Layanan OpenAI Terlampaui  
**Gejala:** Deployment gagal dengan kesalahan kuota  
**Solusi:**  
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Masalah 2: Model Tidak Tersedia di Wilayah  
**Gejala:** Respons AI gagal atau kesalahan deployment model  
**Solusi:**  
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```
  
#### Masalah 3: Masalah Izin  
**Gejala:** Kesalahan 403 Forbidden saat memanggil layanan AI  
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
3. Verifikasi konektivitas dan latensi jaringan  

**Solusi:**  
- Terapkan caching untuk query umum  
- Gunakan model OpenAI yang sesuai untuk kasus penggunaan Anda  
- Skala replika aplikasi hanya setelah memeriksa batas RPM/TPM model; deployment Azure OpenAI tidak menyediakan pengaturan "read replica" gaya database generik  

### **Latihan Lab 6.1: Tantangan Debugging**  

**Skenario:** Deployment Anda berhasil, namun aplikasi mengembalikan kesalahan 500.  

**Tugas debugging:**  
1. Periksa log aplikasi  
2. Verifikasi konektivitas layanan  
3. Uji autentikasi
4. Tinjau konfigurasi

**Alat yang digunakan:**
- `azd show` untuk gambaran umum deployment
- Portal Azure untuk log layanan secara rinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Optimasi

### Langkah 7.1: Siapkan Pemantauan Komprehensif

1. **Buat dashboard khusus:**

Navigasi ke portal Azure dan buat dashboard dengan:
- Jumlah dan latensi permintaan OpenAI
- Tingkat kesalahan aplikasi
- Pemanfaatan sumber daya
- Pelacakan biaya

2. **Atur peringatan:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Verifikasi komponen mengeluarkan telemetri permintaan dan tambahkan grup tindakan jika pemberitahuan diperlukan. Metrik ini adalah hitungan, bukan persentase kegagalan; peringatan tingkat membutuhkan query dan penyebut yang sesuai.

### Langkah 7.2: Optimasi Biaya

1. **Analisis biaya saat ini:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Ganti placeholder tanggal. Dukungan API Konsumsi bervariasi berdasarkan perjanjian penagihan; gunakan Manajemen Biaya di portal jika detail penggunaan tidak tersedia. Biaya tertunda, bukan pengujian waktu nyata.

2. **Terapkan kontrol biaya:**
- Atur peringatan anggaran
- Gunakan kebijakan autoscaling
- Terapkan caching permintaan
- Pantau penggunaan token untuk OpenAI

### **Latihan Lab 7.1: Optimasi Performa**

**Tugas**: Optimalkan aplikasi AI Anda untuk performa dan biaya.

**Metrik untuk ditingkatkan:**
- Kurangi waktu respons rata-rata sebesar 20%
- Kurangi biaya bulanan sebesar 15%
- Tetapkan SLO ketersediaan 99.9% dan jendela pengukuran (lab singkat tidak dapat menunjukkan uptime bulanan)

**Strategi yang dapat dicoba:**
- Terapkan caching respons
- Optimalkan prompt untuk efisiensi token
- Gunakan SKU komputasi yang sesuai
- Atur autoscaling dengan benar

## Tantangan Akhir: Implementasi Menyeluruh

### Skenario Tantangan

Ini adalah **tantangan arsitektur/desain opsional**, bukan latihan yang dapat dijalankan atau sertifikasi produksi. Usulkan chatbot layanan pelanggan bertenaga AI dan dokumentasikan kebutuhan yang perlu implementasi lanjutan serta bukti:

**Persyaratan Fungsional:**
- Antarmuka web untuk interaksi pelanggan
- Integrasi dengan Microsoft Foundry Models untuk respons
- Kapabilitas pencarian dokumen menggunakan Azure AI Search
- Integrasi dengan database pelanggan yang ada
- Dukungan multi-bahasa

**Persyaratan Non-Fungsional:**
- Menangani 1000 pengguna simultan
- SLA uptime 99.9%
- Kepatuhan SOC 2
- Biaya di bawah $500/bulan
- Deploy ke beberapa lingkungan (dev, staging, prod)

Ini adalah batasan pemangku kepentingan hipotetis, bukan hasil yang dijamin secara bersamaan. Definisikan tingkat permintaan, ukuran prompt/output, dan durasi sesi sebelum memperkirakan biaya; 1000 pengguna simultan tidak menetapkan beban kerja atau membuktikan anggaran $500 dapat dipenuhi. SOC 2 adalah hasil audit organisasi, bukan fitur yang diaktifkan oleh template AZD. Identifikasi trade-off dan tolak batasan tidak layak dengan bukti.

### Langkah Implementasi

1. **Rancang arsitektur**
2. **Buat template AZD**
3. **Terapkan langkah keamanan**
4. **Siapkan pemantauan dan peringatan**
5. **Buat pipeline deployment**
6. **Dokumentasikan solusi**

### Kriteria Evaluasi

- ✅ **Fungsionalitas**: Apakah kemampuan yang diterapkan ditunjukkan dan celah yang tersisa jelas?
- ✅ **Keamanan**: Apakah praktik terbaik diimplementasikan?
- ✅ **Skalabilitas**: Apakah dapat menangani beban?
- ✅ **Pemeliharaan**: Apakah kode dan infrastruktur terorganisir dengan baik?
- ✅ **Biaya**: Apakah tetap dalam anggaran?

## Sumber Daya Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Layanan Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Template Contoh
- [Aplikasi Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Panduan Cepat Aplikasi Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Chat Contoso](https://github.com/Azure-Samples/contoso-chat)

### Sumber Daya Komunitas
- [Discord Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Template AZD Terbaik](https://azure.github.io/awesome-azd/)

## 🎓 Titik Pengecekan Penyelesaian

Selamat! Anda telah menyelesaikan Lab Workshop AI. Sekarang Anda harus dapat:

- ✅ Menjelaskan cara menyesuaikan aplikasi AI yang ada dengan template AZD
- ✅ Melakukan deployment dan pengujian aplikasi referensi AI
- ✅ Menerapkan praktik keamanan terbaik untuk beban kerja AI
- ✅ Memantau dan mengoptimasi performa aplikasi AI
- ✅ Memecahkan masalah umum deployment

**Bersihkan:** Jalankan `azd env list`, pilih setiap lingkungan sementara yang dibuat di lab ini (`myai-workshop`, dan jika sudah dideploy `myai-production`/`myai-quota-test`), dan jalankan `azd down` di masing-masing. Tinjau rencana penghapusan; menghapus konfigurasi lokal sebuah lingkungan saja tidak menghapus sumber daya Azure. Hindari `--purge` kecuali Anda memahami penghapusan sumber daya soft delete yang tidak dapat diubah.

### Langkah Selanjutnya
1. Terapkan pola ini pada proyek AI Anda sendiri
2. Kontribusikan template kembali ke komunitas
3. Bergabung dengan Discord Microsoft Foundry untuk dukungan berkelanjutan
4. Eksplorasi topik lanjut seperti deployment multi-region

---

**Umpan Balik Workshop**: Bantu kami meningkatkan workshop ini dengan berbagi pengalaman Anda di [Saluran Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Rumah Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan AI-Pertama
- **⬅️ Sebelumnya**: [Deployment Model AI](ai-model-deployment.md)
- **➡️ Berikutnya**: [Praktik Terbaik AI Produksi](../chapter-08-production/production-ai-practices.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlu Bantuan?** Bergabunglah dengan komunitas kami untuk dukungan dan diskusi mengenai AZD dan deployment AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->