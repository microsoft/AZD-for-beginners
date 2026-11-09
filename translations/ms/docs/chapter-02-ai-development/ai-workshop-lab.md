# Makmal Bengkel AI: Membuat Penyelesaian AI Anda Boleh Disebarkan Dengan AZD  

**Navigasi Bab:**  
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)  
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berasaskan AI  
- **⬅️ Sebelum**: [Pengedaran Model AI](ai-model-deployment.md)  
- **➡️ Seterusnya**: [Amalan Terbaik AI Untuk Pengeluaran](../chapter-08-production/production-ai-practices.md)  
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)  

## Gambaran Keseluruhan Bengkel  

Makmal praktikal ini membimbing pembangun melalui proses mengambil templat AI sedia ada dan menyebarkannya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari corak penting untuk pengedaran AI produksi menggunakan perkhidmatan Microsoft Foundry.  

> **Ulasan keluaran (2026-11-04):** Panduan arahan AZD dan nama konfigurasi contoh telah diperiksa berbanding keluaran `azd` `1.37.2` dan konfigurasi contoh yang dipautkan sekarang. Ini adalah ulasan dokumentasi, bukan pengesahan penyebaran langsung. Makmal RAG tidak memerlukan sambungan ejen; untuk penilaian ejen, gunakan sambungan `azure.ai.evaluations` berasingan dan [aliran kerja penilaian semasa](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), bukan arahan penilaian ejen lama.  

**Tempoh:** 2-3 jam  
**Tahap:** Sederhana  
**Prasyarat:** Pengetahuan asas Azure, kefahaman konsep AI/ML  

## 🎓 Objektif Pembelajaran  

Pada akhir bengkel ini, anda akan dapat:  
- ✅ Terokai templat AI AZD sedia ada dan rancang penukaran aplikasi anda sendiri  
- ✅ Konfigurasi perkhidmatan Microsoft Foundry menggunakan AZD  
- ✅ Laksanakan pengurusan kelayakan yang selamat untuk perkhidmatan AI  
- ✅ Sebarkan aplikasi rujukan AI dengan pemantauan  
- ✅ Selesaikan isu biasa penyebaran AI  

## Prasyarat  

### Alat Diperlukan  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) dipasang  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) dipasang  
- [Git](https://git-scm.com/) dipasang  
- Penyunting kod (disyorkan VS Code)  

Blok arahan ini menggunakan sintaks Bash (termasuk sambungan baris dan `grep`). Pada Windows, gunakan Git Bash/WSL atau terjemahkan ke PowerShell. Juga pasang bahasa, pengurus pakej, dan alat kontena yang disenaraikan dalam [penyediaan persekitaran tempatan contoh](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).  

### Sumber Azure  
- Langganan Azure dengan kebenaran menyediakan sumber dan penugasan peranan (Penyumbang sahaja tidak boleh membuat penugasan RBAC; gunakan pentadbir peranan yang dibenarkan atau setara yang didokumenkan dalam contoh)  
- Akses ke perkhidmatan Microsoft Foundry Models (atau keupayaan untuk memohon akses)  
- Kebenaran membuat kumpulan sumber  

### Kefahaman Prasyarat  
- Kefahaman asas tentang perkhidmatan Azure  
- Kefahaman antara muka baris arahan  
- Konsep asas AI/ML (API, model, arahan)  

## Penyediaan Makmal  

### Langkah 1: Persediaan Persekitaran  

1. **Sahkan pemasangan alat:**  
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
  
Jika anda bekerja merentasi beberapa penyewa atau langganan anda tidak dikesan secara automatik, cuba semula dengan `azd auth login --tenant-id <tenant-id>`.  

2. **Klon repositori bengkel:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Modul 1: Memahami Struktur AZD untuk Aplikasi AI  

### Anatomi Templat AI AZD  

Terokai fail utama dalam templat AZD bersedia AI:  

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
  
Sampel yang diperiksa boleh berubah; `.azure/` muncul selepas inisialisasi persekitaran, tidak semestinya dalam klon baru. Periksa checkout sebenar dan bukan membuat direktori yang hilang untuk memadankan skematik ini.  

### **Latihan Makmal 1.1: Terokai Konfigurasi**  

1. **Periksa fail azure.yaml:**  
```bash
cat azure.yaml
```
  
**Apa yang perlu diperhatikan:**  
- Definisi perkhidmatan untuk komponen AI  
- Pemetaan pembolehubah persekitaran  
- Konfigurasi hos  

2. **Semak infrastruktur main.bicep utama:**  
```bash
cat infra/main.bicep
```
  
**Corak AI utama untuk dikenalpasti:**  
- Penyediaan perkhidmatan Microsoft Foundry Models  
- Integrasi Azure AI Search  
- Pengurusan kekunci yang selamat  
- Konfigurasi keselamatan rangkaian  

### **Titik Perbincangan:** Kenapa Corak Ini Penting untuk AI  

- **Kebergantungan Perkhidmatan**: Aplikasi AI sering memerlukan beberapa perkhidmatan yang dikendalikan secara terkawal  
- **Keselamatan**: Kekunci API dan titik akhir perlu pengurusan yang selamat  
- **Kebolehsuaian**: Beban kerja AI mempunyai keperluan penskalaan unik  
- **Pengurusan Kos**: Perkhidmatan AI boleh mahal jika tidak dikonfigurasi dengan betul  

## Modul 2: Sebarkan Aplikasi AI Pertama Anda  

### Langkah 2.1: Inisialisasi Persekitaran  

1. **Cipta persekitaran AZD baru:**  
```bash
azd env new myai-workshop
```
  
2. **Tetapkan parameter yang diperlukan:**  
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```
  
### Langkah 2.2: Sebarkan Infrastruktur dan Aplikasi  

1. **Sebarkan dengan AZD:**  
```bash
azd up
```
  
**Apa yang berlaku semasa `azd up`:**  
- ✅ Menyediakan perkhidmatan Microsoft Foundry Models  
- ✅ Membuat perkhidmatan Azure AI Search  
- ✅ Menyediakan Azure Container Apps untuk backend dan frontend yang dibundel (lalai sampel semasa)  
- ✅ Mengkonfigurasi rangkaian dan keselamatan  
- ✅ Menyebarkan kod aplikasi  
- ✅ Menyediakan pemantauan dan log  

2. **Pantau kemajuan penyebaran** dan catat sumber yang sedang dibuat.  

### Langkah 2.3: Sahkan Penyebaran Anda  

1. **Semak sumber yang disebarkan:**  
```bash
azd show
```
  
2. **Buka aplikasi yang disebarkan:**  
```bash
azd show
```
  
Buka titik akhir web yang dipaparkan dalam output `azd show`.  

3. **Uji fungsi AI:**  
   - Navigasi ke aplikasi web  
   - Cuba pertanyaan contoh  
   - Sahkan respons AI berfungsi  

### **Latihan Makmal 2.1: Amalan Penyelesaian Masalah**  

**Senario**: Penyebaran anda berjaya tetapi AI tidak memberi respons.  

**Isu biasa untuk periksa:**  
1. **Pengesahan**: Sahkan identiti terurus dan penugasan peranan; hanya periksa kekunci API jika anda sengaja mengaktifkan pengesahan berasaskan kekunci  
2. **Ketersediaan model**: Periksa sama ada rantau anda menyokong model  
3. **Sambungan rangkaian**: Pastikan perkhidmatan boleh berkomunikasi  
4. **Kebenaran RBAC**: Sahkan aplikasi boleh mengakses OpenAI  

**Arahan penyahpepijatan:**  
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Modul 3: Mengubahsuai Aplikasi AI untuk Keperluan Anda  

### Langkah 3.1: Ubah Suai Konfigurasi AI  

1. **Kemaskini model OpenAI:**  
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```
  
2. **Tambah perkhidmatan AI tambahan:**  

Edit `infra/main.bicep` untuk menambah Kecerdasan Dokumen:  

Berikut ialah serpihan ilustrasi, bukan templat lengkap. Sampel mungkin sudah menyediakan perkhidmatan pemprosesan dokumen: periksa infrastrukturnya sebelum menambah sumber pendua. Tambahan khusus memerlukan penyambungan output, identiti, dan konfigurasi aplikasi.  

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
  
### Langkah 3.2: Konfigurasi Khusus Persekitaran  

**Amalan Terbaik**: Konfigurasi berbeza untuk pembangunan dan produksi.  

1. **Cipta persekitaran produksi:**  
```bash
azd env new myai-production
```
  
2. **Tetapkan parameter khusus produksi:**  
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```
  
Nama ini berasal dari [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) dalam sampel. `azd env set` menyimpan nilai tetapi tidak membuat pembolehubah rawak berkesan: templat mesti menggunakannya. Semak [panduan pengasingan rangkaian](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) sebelum melumpuhkan akses umum, dan gunakan `azd up` untuk menerapkan perubahan infrastruktur. SKU OpenAI `S0` sahaja tidak menentukan perkapasaan model; jenis dan kapasiti penyebaran model juga penting.  

### **Latihan Makmal 3.1: Pengoptimuman Kos**  

**Cabaran**: Konfigurasikan templat untuk pembangunan yang kos efektif.  

**Tugas:**  
1. Pilih persekitaran bengkel boleh buang: `azd env select myai-workshop`.  
2. Catat SKU Search semasa dan kapasiti model dari `infra/main.parameters.json` dan persekitaran yang dipilih.  
3. Gunakan input yang disokong di bawah, setelah mengesahkan kuota model/rantau:  
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Sahkan SKU Search dan kapasiti penyebaran dalam portal dan anggarkan perbezaan dengan kalkulator harga. Jangan jangka data pengebilan dikemas kini segera.  

**Kriteria kejayaan:** Search menggunakan Basic, penyebaran chat mempunyai kapasiti disokong yang diminta, dan aplikasi masih menjawab soalan sampel. Kapasiti `10` adalah peruntukan had kadar, bukan diskaun harga token. Perubahan tier Search boleh dihadkan atau memerlukan penciptaan semula; jangan bereksperimen pada sumber produksi. F0 adalah khusus perkhidmatan dan bukan SKU model Azure OpenAI.  

## Modul 4: Keselamatan dan Amalan Terbaik Pengeluaran  

### Langkah 4.1: Pengurusan Kelayakan Selamat  

**Cabaran semasa:** Banyak aplikasi AI memasukkan kekunci API secara keras atau menggunakan penyimpanan tidak selamat.  

**Penyelesaian AZD:** Integrasi Identiti Terurus + Key Vault.  

1. **Semak konfigurasi keselamatan dalam templat anda:**  
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Sahkan Identiti Terurus berfungsi:**  
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```
  
### Langkah 4.2: Keselamatan Rangkaian  

1. **Aktifkan titik akhir persendirian** menggunakan konfigurasi rangkaian yang disokong sampel (jika belum dikonfigurasikan).  

Untuk templat anda sendiri, serpihan ilustrasi ini menunjukkan sambungan titik akhir OpenAI. Ia juga memerlukan VNet, konfigurasi DNS persendirian, dan sambungan aplikasi; jangan tampal ia secara tidak berubah ke dalam sampel, yang sudah mempunyai modul titik akhir persendirian:  
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
  
### Langkah 4.3: Pemantauan dan Kebolehlihatan  

1. **Konfigurasi Application Insights:**  
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```
  
2. **Aktifkan integrasi Application Insights sampel:**  
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```
  
Penginstrumentasian sampel menghantar telemetri; tetapan `OPENAI_MONITOR_ENABLED` rawak tidak mengaktifkan metrik AI. Semak jejak untuk panggilan model, kelewatan, kegagalan, dan penggunaan token, dan elakkan merekod arahan atau respons sensitif.  

### **Latihan Makmal 4.1: Audit Keselamatan**  

**Tugas:** Semak penyebaran anda untuk amalan keselamatan terbaik.  

**Senarai semak:**  
- [ ] Tiada rahsia keras dalam kod atau konfigurasi  
- [ ] Identiti Terurus digunakan untuk pengesahan perkhidmatan-ke-perkhidmatan  
- [ ] Key Vault menyimpan konfigurasi sensitif  
- [ ] Akses rangkaian dihadkan dengan betul  
- [ ] Pemantauan dan log diaktifkan  

## Modul 5: Menukar Aplikasi AI Anda Sendiri  

### Langkah 5.1: Lembaran Penilaian  

**Sebelum menukar aplikasi anda**, jawab soalan berikut:  

1. **Senibina Aplikasi:**  
   - Perkhidmatan AI apa yang digunakan aplikasi anda?  
   - Apa sumber pengkomputeran yang diperlukan?  
   - Adakah ia memerlukan pangkalan data?  
   - Apakah kebergantungan antara perkhidmatan?  

2. **Keperluan Keselamatan:**  
   - Data sensitif apa yang dikendalikan aplikasi anda?  
   - Apakah keperluan pematuhan yang anda ada?  
   - Adakah anda memerlukan rangkaian persendirian?  

3. **Keperluan Penskalaan:**  
   - Apakah beban kerja yang dijangka?  
   - Adakah anda memerlukan penskalaan automatik?  
   - Adakah terdapat keperluan serantau?  

### Langkah 5.2: Cipta Templat AZD Anda  

**Ikut corak ini untuk menukar aplikasi anda:**  

**Hanya kerangka:** Bahagian ini tidak menyediakan sumber aplikasi API/web, infrastruktur hos, penyebaran model, identiti/RBAC, atau `main.parameters.json` siap. Bicep berhadapan kumpulan sumber menggambarkan komposisi modul; titik masuk berhadapan langganan AZD biasa mesti mencipta kumpulan sumber dan memanggilnya pada skop itu. Jangan jangka `azd up` menyebarkan aplikasi lengkap selepas menyalin hanya serpihan ini. Untuk garis dasar berjalan, terus gunakan templat RAG dari Modul 1.  

1. **Cipta struktur asas:**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```
  
2. **Cipta azure.yaml:**  
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
  
3. **Cipta templat infrastruktur:**  

**infra/main.bicep** - Templat utama:  
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
  
### **Latihan Makmal 5.1: Cabaran Penciptaan Templat**  

**Cabaran:** Cipta templat AZD untuk aplikasi AI pemprosesan dokumen.  

**Keperluan:**  
- Microsoft Foundry Models untuk analisis kandungan  
- Kecerdasan Dokumen untuk OCR  
- Akaun Stor untuk muat naik dokumen  
- Aplikasi Fungsi untuk logik pemprosesan  
- Aplikasi web untuk antara muka pengguna  

**Mata bonus:**  
- Tambah pengendalian ralat yang betul  
- Termasuk anggaran kos  
- Atur papan pemuka pemantauan  

## Modul 6: Penyelesaian Masalah Isu Biasa  

### Isu Penyebaran Biasa  

#### Isu 1: Kuota Perkhidmatan OpenAI Melebihi Had  
**Gejala:** Penyebaran gagal dengan ralat kuota  
**Penyelesaian:**  
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Isu 2: Model Tidak Tersedia di Rantau  
**Gejala:** Respons AI gagal atau ralat penyebaran model  
**Penyelesaian:**  
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```
  
#### Isu 3: Masalah Kebenaran  
**Gejala:** Ralat 403 Forbidden semasa memanggil perkhidmatan AI  
**Penyelesaian:**  
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### Isu Prestasi  

#### Isu 4: Respons AI Lambat  
**Langkah siasatan:**  
1. Semak Application Insights untuk metrik prestasi  
2. Semak metrik perkhidmatan OpenAI dalam portal Azure  
3. Sahkan sambungan rangkaian dan kelewatan  

**Penyelesaian:**  
- Laksanakan cache untuk pertanyaan biasa  
- Gunakan model OpenAI sesuai untuk kes penggunaan anda  
- Skala replika aplikasi hanya selepas memeriksa had RPM/TPM model; penyebaran Azure OpenAI tidak mendedahkan tetapan "replika baca" gaya pangkalan data generik  

### **Latihan Makmal 6.1: Cabaran Penyahpepijatan**  

**Senario:** Penyebaran anda berjaya, tetapi aplikasi mengembalikan ralat 500.  

**Tugas penyahpepijatan:**  
1. Semak log aplikasi  
2. Sahkan sambungan perkhidmatan  
3. Uji pengesahan
4. Semak konfigurasi

**Alat untuk digunakan:**
- `azd show` untuk gambaran keseluruhan penyebaran
- Portal Azure untuk log perkhidmatan terperinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Pengoptimuman

### Langkah 7.1: Tetapkan Pemantauan Menyeluruh

1. **Cipta papan pemuka tersuai:**

Navigasi ke portal Azure dan cipta papan pemuka dengan:
- Kiraan permintaan dan latensi OpenAI
- Kadar ralat aplikasi
- Penggunaan sumber
- Penjejakan kos

2. **Tetapkan amaran:**
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

Sahkan komponen mengeluarkan telemetri permintaan dan tambah kumpulan tindakan jika notifikasi diperlukan. Metik adalah kiraan, bukan peratusan kegagalan; amaran kadar memerlukan pertanyaan dan penyebut yang sesuai.

### Langkah 7.2: Pengoptimuman Kos

1. **Analisa kos semasa:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Gantikan tempat letak tarikh. Sokongan API penggunaan berbeza mengikut perjanjian bil; gunakan Pengurusan Kos di portal jika butiran penggunaan tidak tersedia. Kos adalah tertunda, bukan ujian masa nyata.

2. **Laksanakan kawalan kos:**
- Tetapkan amaran bajet
- Gunakan polisi autoskala
- Laksanakan cache permintaan
- Pantau penggunaan token untuk OpenAI

### **Latihan Makmal 7.1: Pengoptimuman Prestasi**

**Tugas**: Optimumkan aplikasi AI anda untuk prestasi dan kos.

**Metik untuk diperbaiki:**
- Kurangkan purata masa respon sebanyak 20%
- Kurangkan kos bulanan sebanyak 15%
- Takrifkan SLO ketersediaan 99.9% dan jangka masa pengukuran (makmal pendek tidak dapat menunjukkan masa beroperasi bulanan)

**Strategi untuk dicuba:**
- Laksanakan cache respon
- Optimumkan arahan untuk kecekapan token
- Gunakan SKU pengkomputeran yang sesuai
- Tetapkan autoskala yang betul

## Cabaran Akhir: Pelaksanaan Menyeluruh

### Senario Cabaran

Ini adalah **cabaran seni bina/reka bentuk pilihan**, bukan latihan boleh jalan yang disediakan atau pensijilan pengeluaran. Cadangkan chatbot perkhidmatan pelanggan berkuasa AI dan dokumen keperluan yang memerlukan pelaksanaan dan bukti lanjut:

**Keperluan Fungsi:**
- Antara muka web untuk interaksi pelanggan
- Integrasi dengan Microsoft Foundry Models untuk respons
- Keupayaan carian dokumen menggunakan Azure AI Search
- Integrasi dengan pangkalan data pelanggan sedia ada
- Sokongan pelbagai bahasa

**Keperluan Bukan Fungsi:**
- Menangani 1000 pengguna selari
- SLA masa beroperasi 99.9%
- Pematuhan SOC 2
- Kos di bawah $500/bulan
- Sebarkan ke beberapa persekitaran (dev, staging, prod)

Ini adalah kekangan pemegang kepentingan hipotesis, bukan hasil yang dijamin serentak. Tetapkan kadar permintaan, saiz arahan/keluaran, dan tempoh sesi sebelum menganggar kos; 1,000 pengguna serentak tidak menetapkan beban kerja atau membuktikan bajet $500 boleh dilaksanakan. SOC 2 adalah hasil audit organisasi, bukan suis yang diaktifkan oleh templat AZD. Kenal pasti kompromi dan tolak kekangan yang tidak boleh dilaksanakan dengan bukti.

### Langkah Pelaksanaan

1. **Reka seni bina**
2. **Cipta templat AZD**
3. **Laksanakan langkah keselamatan**
4. **Tetapkan pemantauan dan amaran**
5. **Cipta saluran penyebaran**
6. **Dokumentasikan penyelesaian**

### Kriteria Penilaian

- ✅ **Fungsionaliti**: Adakah kemampuan yang dilaksanakan didemonstrasikan dan jurang yang tinggal dinyatakan secara jelas?
- ✅ **Keselamatan**: Adakah amalan terbaik dilaksanakan?
- ✅ **Kebolehsuaian**: Boleh ia menangani beban?
- ✅ **Boleh diselenggara**: Adakah kod dan infrastruktur tersusun dengan baik?
- ✅ **Kos**: Adakah ia kekal dalam bajet?

## Sumber Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Perkhidmatan Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templat Contoh
- [Aplikasi Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Permulaan Pantas Aplikasi Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Chat Contoso](https://github.com/Azure-Samples/contoso-chat)

### Sumber Komuniti
- [Discord Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Templat AZD Hebat](https://azure.github.io/awesome-azd/)

## 🎓 Titik Semak Penyiapan

Tahniah! Anda telah menyelesaikan Makmal Bengkel AI. Anda kini sepatutnya boleh:

- ✅ Terangkan cara menyesuaikan aplikasi AI sedia ada kepada templat AZD
- ✅ Sebarkan dan uji aplikasi rujukan AI
- ✅ Laksanakan amalan keselamatan terbaik untuk beban kerja AI
- ✅ Pantau dan optimumkan prestasi aplikasi AI
- ✅ Selesaikan isu penyebaran biasa

**Pembersihan:** Jalankan `azd env list`, pilih setiap persekitaran buangan yang dibuat dalam makmal ini (`myai-workshop`, dan jika disebarkan `myai-production`/`myai-quota-test`), dan jalankan `azd down` di setiap satu. Semak pelan penghapusan; memadam konfigurasi tempatan persekitaran sahaja tidak memadam sumber Azure. Elakkan `--purge` melainkan anda faham penghapusan sumber yang dipadam lembut tidak boleh dipulihkan.

### Langkah Seterusnya
1. Gunakan corak ini pada projek AI anda sendiri
2. Sumbangkan semula templat kepada komuniti
3. Sertai Discord Microsoft Foundry untuk sokongan berterusan
4. Terokai topik lanjutan seperti penyebaran pelbagai rantau

---

**Maklum Balas Bengkel**: Bantu kami memperbaiki bengkel ini dengan berkongsi pengalaman anda di [Saluran Discord Microsoft Foundry #Azure](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berasaskan AI
- **⬅️ Sebelumnya**: [Penyebaran Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI Pengeluaran](../chapter-08-production/production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlu Bantuan?** Sertai komuniti kami untuk sokongan dan perbincangan tentang penyebaran AZD dan AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->