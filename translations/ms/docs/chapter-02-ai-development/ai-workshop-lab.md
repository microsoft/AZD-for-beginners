# Makmal Bengkel AI: Membuat Penyelesaian AI Anda Boleh Dideploy dengan AZD

**Navigasi Bab:**  
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)  
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama  
- **⬅️ Sebelumnya**: [Penghantaran Model AI](ai-model-deployment.md)  
- **➡️ Seterusnya**: [Amalan Terbaik AI Produksi](production-ai-practices.md)  
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Gambaran Keseluruhan Bengkel

Makmal praktikal ini membimbing pembangun melalui proses mengambil templat AI sedia ada dan menghantarnya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari corak penting untuk penghantaran AI produksi menggunakan perkhidmatan Microsoft Foundry.

> **Nota pengesahan (2026-03-25):** Bengkel ini telah disemak menggunakan `azd` `1.23.12`. Jika pemasangan tempatan anda lebih lama, kemas kini AZD sebelum bermula supaya proses pengesahan, templat, dan penghantaran sepadan dengan langkah-langkah di bawah.

**Tempoh:** 2-3 jam  
**Tahap:** Pertengahan  
**Prasyarat:** Pengetahuan asas Azure, kefahaman konsep AI/ML

## 🎓 Objektif Pembelajaran

Pada akhir bengkel ini, anda akan dapat:  
- ✅ Menukar aplikasi AI sedia ada untuk menggunakan templat AZD  
- ✅ Mengkonfigurasi perkhidmatan Microsoft Foundry dengan AZD  
- ✅ Melaksanakan pengurusan kelayakan yang selamat untuk perkhidmatan AI  
- ✅ Menghantar aplikasi AI produksi yang siap dengan pemantauan  
- ✅ Menyelesaikan masalah biasa penghantaran AI  

## Prasyarat

### Alat Diperlukan  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) dipasang  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) dipasang  
- [Git](https://git-scm.com/) dipasang  
- Penyunting kod (disyorkan VS Code)

### Sumber Azure  
- Langganan Azure dengan akses penyumbang  
- Akses kepada perkhidmatan Microsoft Foundry Models (atau kebolehan untuk memohon akses)  
- Kebenaran membuat kumpulan sumber

### Prasyarat Pengetahuan  
- Pemahaman asas mengenai perkhidmatan Azure  
- Kefahaman antara muka baris perintah  
- Konsep asas AI/ML (API, model, arahan)

## Penyediaan Makmal

### Langkah 1: Persiapan Persekitaran

1. **Sahkan pemasangan alat:**
```bash
# Semak pemasangan AZD
azd version

# Semak CLI Azure
az --version

# Log masuk ke Azure untuk aliran kerja AZD
azd auth login

# Log masuk ke Azure CLI hanya jika anda merancang untuk menjalankan arahan az semasa diagnostik
az login
```
  
Jika anda bekerja merentasi beberapa penyewa atau langganan anda tidak dikesan secara automatik, cuba semula dengan `azd auth login --tenant-id <tenant-id>`.

2. **Klona repositori bengkel:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Modul 1: Memahami Struktur AZD untuk Aplikasi AI

### Anatomi Templat AZD AI

Terokai fail utama dalam templat AZD sedia AI:

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
  
### **Latihan Makmal 1.1: Terokai Konfigurasi**

1. **Teliti fail azure.yaml:**
```bash
cat azure.yaml
```
  
**Apa yang perlu diperhatikan:**  
- Definisi perkhidmatan untuk komponen AI  
- Pemetaan pembolehubah persekitaran  
- Konfigurasi hos  

2. **Semak infrastruktur main.bicep:**
```bash
cat infra/main.bicep
```
  
**Corak AI utama untuk dikenal pasti:**  
- Penyediaan perkhidmatan Microsoft Foundry Models  
- Integrasi Azure AI Search  
- Pengurusan kunci selamat  
- Konfigurasi keselamatan rangkaian  

### **Titik Perbincangan:** Mengapa Corak Ini Penting untuk AI

- **Pergantungan Perkhidmatan:** Aplikasi AI sering memerlukan perkhidmatan berkoodinasi yang pelbagai  
- **Keselamatan:** Kunci API dan titik akhir perlu diuruskan dengan selamat  
- **Skalabiliti:** Beban kerja AI mempunyai keperluan penyesuaian unik  
- **Pengurusan Kos:** Perkhidmatan AI boleh menjadi mahal jika tidak dikonfigurasi dengan betul  

## Modul 2: Hantar Aplikasi AI Pertama Anda

### Langkah 2.1: Inisialisasi Persekitaran

1. **Buat persekitaran AZD baru:**
```bash
azd env new myai-workshop
```
  
2. **Set parameter yang diperlukan:**
```bash
# Tetapkan wilayah Azure pilihan anda
azd env set AZURE_LOCATION eastus

# Pilihan: Tetapkan model OpenAI tertentu
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### Langkah 2.2: Hantar Infrastruktur dan Aplikasi

1. **Hantar menggunakan AZD:**
```bash
azd up
```
  
**Apa yang berlaku semasa `azd up`:**  
- ✅ Menyediakan perkhidmatan Microsoft Foundry Models  
- ✅ Mewujudkan perkhidmatan Azure AI Search  
- ✅ Menyediakan App Service untuk aplikasi web  
- ✅ Mengkonfigurasikan rangkaian dan keselamatan  
- ✅ Menghantar kod aplikasi  
- ✅ Menyediakan pemantauan dan pencatatan  

2. **Pantau kemajuan penghantaran** dan catatkan sumber yang diwujudkan.

### Langkah 2.3: Sahkan Penghantaran Anda

1. **Periksa sumber yang dihantar:**
```bash
azd show
```
  
2. **Buka aplikasi yang dihantar:**
```bash
azd show
```
  
Buka titik akhir web yang dipaparkan dalam output `azd show`.

3. **Uji fungsi AI:**  
   - Navigasi ke aplikasi web  
   - Cuba soalan contoh  
   - Sahkan respons AI berfungsi  

### **Latihan Makmal 2.1: Latihan Menyelesaikan Masalah**

**Senario**: Penghantaran anda berjaya tetapi AI tidak memberi respons.

**Isu biasa untuk semak:**  
1. **Kunci API OpenAI**: Sahkan ia ditetapkan dengan betul  
2. **Ketersediaan model**: Semak jika rantau anda menyokong model  
3. **Kesambungan rangkaian**: Pastikan perkhidmatan boleh berkomunikasi  
4. **Kebenaran RBAC**: Sahkan aplikasi boleh mengakses OpenAI  

**Arahan debugging:**  
```bash
# Semak pemboleh ubah persekitaran
azd env get-values

# Lihat log penyebaran
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Semak status penyebaran OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Modul 3: Sesuaikan Aplikasi AI untuk Keperluan Anda

### Langkah 3.1: Ubahsuai Konfigurasi AI

1. **Kemas kini model OpenAI:**
```bash
# Tukar kepada model yang berbeza (jika terdapat di rantau anda)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Jalankan semula dengan konfigurasi baru
azd deploy
```
  
2. **Tambah perkhidmatan AI tambahan:**

Edit `infra/main.bicep` untuk tambah Document Intelligence:

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

**Amalan Terbaik:** Konfigurasi berbeza untuk pembangunan berbanding produksi.

1. **Buat persekitaran produksi:**
```bash
azd env new myai-production
```
  
2. **Tetapkan parameter khusus produksi:**
```bash
# Pengeluaran biasanya menggunakan SKU yang lebih tinggi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktifkan ciri keselamatan tambahan
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **Latihan Makmal 3.1: Pengoptimuman Kos**

**Cabaran:** Konfigurasikan templat untuk pembangunan kos efektif.

**Tugas:**  
1. Kenal pasti SKU mana yang boleh diset ke tier percuma/asas  
2. Konfigurasikan pembolehubah persekitaran untuk kos minimal  
3. Hantar dan bandingkan kos dengan konfigurasi produksi  

**Petunjuk penyelesaian:**  
- Gunakan tier F0 (percuma) untuk Perkhidmatan Azure AI jika boleh  
- Gunakan tier Asas untuk Perkhidmatan Search semasa pembangunan  
- Pertimbangkan menggunakan pelan Consumption untuk Functions  

## Modul 4: Keselamatan dan Amalan Terbaik Produksi

### Langkah 4.1: Pengurusan Kelayakan yang Selamat

**Cabaran semasa:** Banyak aplikasi AI kod keras kunci API atau guna penyimpanan tidak selamat.

**Penyelesaian AZD:** Integrasi Identiti Terurus + Key Vault.

1. **Semak konfigurasi keselamatan dalam templat anda:**
```bash
# Cari konfigurasi Key Vault dan Identiti Terurus
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Sahkan Identiti Terurus berfungsi:**
```bash
# Semak jika aplikasi web mempunyai konfigurasi identiti yang betul
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### Langkah 4.2: Keselamatan Rangkaian

1. **Dayakan titik akhir peribadi** (jika belum dikonfigurasikan):

Tambah ke templat bicep anda:  
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

1. **Konfigurasikan Application Insights:**
```bash
# Application Insights harus dikonfigurasi secara automatik
# Semak konfigurasi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Sediakan pemantauan khusus AI:**

Tambah metrik khusus untuk operasi AI:  
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
  
### **Latihan Makmal 4.1: Audit Keselamatan**

**Tugas:** Semak penghantaran anda untuk amalan keselamatan terbaik.

**Senarai semak:**  
- [ ] Tiada rahsia dikod keras dalam kod atau konfigurasi  
- [ ] Identiti Terurus digunakan untuk pengesahan perkhidmatan-ke-perkhidmatan  
- [ ] Key Vault menyimpan konfigurasi sensitif  
- [ ] Akses rangkaian dikawal dengan betul  
- [ ] Pemantauan dan pencatatan diaktifkan  

## Modul 5: Menukar Aplikasi AI Anda Sendiri

### Langkah 5.1: Lembaran Penilaian

**Sebelum menukar aplikasi anda**, jawab soalan berikut:

1. **Arkitektur Aplikasi:**  
   - Perkhidmatan AI apa yang digunakan aplikasi anda?  
   - Sumber pengkomputeran apa yang diperlukan?  
   - Adakah ia memerlukan pangkalan data?  
   - Apakah pergantungan antara perkhidmatan?  

2. **Keperluan Keselamatan:**  
   - Data sensitif apa yang aplikasi anda kendalikan?  
   - Keperluan pematuhan apa yang anda ada?  
   - Adakah anda memerlukan rangkaian peribadi?  

3. **Keperluan Skalabiliti:**  
   - Berapa beban yang dijangka?  
   - Adakah anda memerlukan auto-skalabiliti?  
   - Adakah terdapat keperluan rantau?  

### Langkah 5.2: Buat Templat AZD Anda

**Ikuti corak ini untuk menukar aplikasi anda:**

1. **Buat struktur asas:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Mulakan templat AZD
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
  
3. **Buat templat infrastruktur:**

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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```
  
### **Latihan Makmal 5.1: Cabaran Penciptaan Templat**

**Cabaran:** Buat templat AZD untuk aplikasi AI pemprosesan dokumen.

**Keperluan:**  
- Microsoft Foundry Models untuk analisis kandungan  
- Document Intelligence untuk OCR  
- Akaun Penyimpanan untuk muat naik dokumen  
- Function App untuk logik pemprosesan  
- Aplikasi web untuk antara muka pengguna  

**Mata bonus:**  
- Tambah pengendalian ralat yang betul  
- Sertakan anggaran kos  
- Sediakan papan pemuka pemantauan  

## Modul 6: Menyelesaikan Masalah Biasa

### Isu Penghantaran Biasa

#### Isu 1: Kuota Perkhidmatan OpenAI Melebihi  
**Simptom:** Penghantaran gagal dengan ralat kuota  
**Penyelesaian:**  
```bash
# Semak kuota semasa
az cognitiveservices usage list --location eastus

# Minta peningkatan kuota atau cuba wilayah berbeza
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Isu 2: Model Tidak Tersedia di Rantau  
**Simptom:** Respons AI gagal atau ralat penghantaran model  
**Penyelesaian:**  
```bash
# Semak ketersediaan model mengikut wilayah
az cognitiveservices model list --location eastus

# Kemas kini kepada model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### Isu 3: Masalah Kebenaran  
**Simptom:** Ralat 403 Forbidden apabila memanggil perkhidmatan AI  
**Penyelesaian:**  
```bash
# Semak tugasan peranan
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tambah peranan yang hilang
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### Isu Prestasi

#### Isu 4: Respons AI Perlahan  
**Langkah penyiasatan:**  
1. Periksa Application Insights untuk metrik prestasi  
2. Semak metrik perkhidmatan OpenAI dalam portal Azure  
3. Sahkan kesambungan dan latensi rangkaian  

**Penyelesaian:**  
- Laksanakan caching untuk soalan biasa  
- Gunakan model OpenAI sesuai dengan kes penggunaan anda  
- Pertimbangkan penggunaan replika baca untuk senario beban tinggi  

### **Latihan Makmal 6.1: Cabaran Debug**

**Senario:** Penghantaran anda berjaya, tetapi aplikasi memberi ralat 500.

**Tugas debugging:**  
1. Periksa log aplikasi  
2. Sahkan kesambungan perkhidmatan  
3. Uji pengesahan  
4. Semak konfigurasi  

**Alat yang digunakan:**  
- `azd show` untuk gambaran penghantaran  
- Portal Azure untuk log perkhidmatan terperinci  
- Application Insights untuk telemetri aplikasi  

## Modul 7: Pemantauan dan Pengoptimuman

### Langkah 7.1: Sediakan Pemantauan Menyeluruh

1. **Buat papan pemuka tersuai:**

Navigasi ke portal Azure dan buat papan pemuka dengan:  
- Kiraan permintaan dan latensi OpenAI  
- Kadar ralat aplikasi  
- Penggunaan sumber  
- Penjejakan kos  

2. **Sediakan amaran:**  
```bash
# Amaran untuk kadar ralat tinggi
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```
  
### Langkah 7.2: Pengoptimuman Kos

1. **Analisa kos semasa:**  
```bash
# Gunakan Azure CLI untuk mendapatkan data kos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Laksanakan kawalan kos:**  
- Tetapkan amaran bajet  
- Gunakan polisi auto-skalabiliti  
- Laksanakan caching permintaan  
- Pantau penggunaan token untuk OpenAI  

### **Latihan Makmal 7.1: Pengoptimuman Prestasi**

**Tugas:** Optimumkan aplikasi AI anda untuk prestasi dan kos.

**Metrik untuk diperbaiki:**  
- Kurangkan masa respons purata sebanyak 20%  
- Kurangkan kos bulanan sebanyak 15%  
- Kekalkan masa operasi 99.9%  

**Strategi untuk dicuba:**  
- Laksanakan caching respons  
- Optimumkan arahan untuk kecekapan token  
- Gunakan SKU pengkomputeran sesuai  
- Sediakan auto-skalabiliti yang betul  

## Cabaran Akhir: Pelaksanaan Sepanjang Rantaian

### Senario Cabaran

Anda ditugaskan untuk mencipta chatbot perkhidmatan pelanggan berkuasa AI yang sedia untuk produksi dengan keperluan:

**Keperluan Fungsian:**  
- Antara muka web untuk interaksi pelanggan  
- Integrasi dengan Microsoft Foundry Models untuk respons  
- Keupayaan carian dokumen menggunakan Azure AI Search  
- Integrasi dengan pangkalan data pelanggan sedia ada  
- Sokongan pelbagai bahasa  

**Keperluan Bukan Fungsian:**  
- Menangani 1000 pengguna serentak  
- SLA masa operasi 99.9%  
- Pematuhan SOC 2  
- Kos di bawah $500/bulan  
- Hantar ke pelbagai persekitaran (dev, staging, prod)  

### Langkah Pelaksanaan

1. **Reka bentuk arkitektur**  
2. **Buat templat AZD**  
3. **Laksanakan langkah keselamatan**  
4. **Sediakan pemantauan dan pemberitahuan amaran**  
5. **Buat saluran penghantaran**  
6. **Dokumentasikan penyelesaian**  

### Kriteria Penilaian

- ✅ **Fungsionaliti:** Adakah ia memenuhi semua keperluan?  
- ✅ **Keselamatan:** Adakah amalan terbaik dilaksanakan?  
- ✅ **Skalabiliti:** Bolehkah ia menampung beban?  
- ✅ **Kebolehselenggaraan:** Adakah kod dan infrastruktur tersusun baik?  
- ✅ **Kos:** Adakah ia dalam bajet?  

## Sumber Tambahan

### Dokumentasi Microsoft  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Dokumentasi Perkhidmatan Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### Templat Contoh  
- [Aplikasi Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Komuniti
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sijil Penyelesaian

Tahniah! Anda telah menamatkan AI Workshop Lab. Anda kini sepatutnya dapat:

- ✅ Menukar aplikasi AI sedia ada kepada templat AZD
- ✅ Menyebarkan aplikasi AI yang sedia untuk pengeluaran
- ✅ Melaksanakan amalan keselamatan terbaik untuk beban kerja AI
- ✅ Memantau dan mengoptimumkan prestasi aplikasi AI
- ✅ Menyelesaikan isu biasa dalam penyebaran

### Langkah Seterusnya
1. Terapkan corak ini kepada projek AI anda sendiri
2. Sumbangkan templat kembali kepada komuniti
3. Sertai Microsoft Foundry Discord untuk sokongan berterusan
4. Terokai topik lanjutan seperti penyebaran pelbagai rantau

---

**Maklum Balas Bengkel**: Bantu kami memperbaiki bengkel ini dengan berkongsi pengalaman anda dalam [saluran Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Sebelumnya**: [Penyebaran Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI Pengeluaran](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlukan Bantuan?** Sertai komuniti kami untuk sokongan dan perbincangan mengenai AZD dan penyebaran AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->