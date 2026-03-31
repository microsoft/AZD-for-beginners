# Makmal Bengkel AI: Membuat Penyelesaian AI Anda Boleh Digunakan dengan AZD-Deployable

**Navigasi Bab:**  
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)  
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama  
- **⬅️ Sebelumnya**: [Penghasilan Model AI](ai-model-deployment.md)  
- **➡️ Seterusnya**: [Amalan Terbaik AI Pengeluaran](production-ai-practices.md)  
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)  

## Gambaran Keseluruhan Bengkel

Makmal praktikal ini membimbing pembangun melalui proses mengambil templat AI sedia ada dan menghasilkannya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari corak penting untuk penghasilan AI produksi menggunakan perkhidmatan Microsoft Foundry.

> **Nota Pengesahan (2026-03-25):** Bengkel ini telah disemak berasaskan `azd` `1.23.12`. Jika pemasangan tempatan anda lebih lama, kemaskini AZD sebelum memulakan supaya aliran kerja pengesahan, templat dan penghasilan sepadan dengan langkah di bawah.

**Tempoh:** 2-3 jam  
**Tahap:** Pertengahan  
**Prasyarat:** Pengetahuan asas Azure, kefahaman konsep AI/ML  

## 🎓 Objektif Pembelajaran

Menjelang akhir bengkel ini, anda akan dapat:  
- ✅ Menukar aplikasi AI sedia ada untuk menggunakan templat AZD  
- ✅ Mengkonfigurasi perkhidmatan Microsoft Foundry dengan AZD  
- ✅ Melaksanakan pengurusan kelayakan yang selamat untuk perkhidmatan AI  
- ✅ Menghasilkan aplikasi AI bersiap produksi dengan pemantauan  
- ✅ Menyelesaikan masalah biasa penghasilan AI  

## Prasyarat

### Alat Diperlukan  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) dipasang  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) dipasang  
- [Git](https://git-scm.com/) dipasang  
- Penyunting kod (disyorkan VS Code)  

### Sumber Azure  
- Langganan Azure dengan akses penyumbang  
- Akses kepada perkhidmatan Microsoft Foundry Models (atau keupayaan untuk memohon akses)  
- Kebenaran mencipta kumpulan sumber  

### Pengetahuan Prasyarat  
- Kefahaman asas perkhidmatan Azure  
- Kefahaman antara muka baris perintah  
- Konsep asas AI/ML (API, model, prompt)  

## Penyediaan Makmal

### Langkah 1: Persediaan Persekitaran

1. **Sahkan pemasangan alat:**
```bash
# Semak pemasangan AZD
azd version

# Semak Azure CLI
az --version

# Log masuk ke Azure untuk aliran kerja AZD
azd auth login

# Log masuk ke Azure CLI hanya jika anda merancang untuk menjalankan arahan az semasa diagnostik
az login
```
  
Jika anda bekerja merentasi berbilang tenant atau langganan anda tidak dikesan secara automatik, cuba semula dengan `azd auth login --tenant-id <tenant-id>`.  

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
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```
  
### **Latihan Makmal 1.1: Teroka Konfigurasi**

1. **Periksa fail azure.yaml:**
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
- Integrasi Cognitive Search  
- Pengurusan kunci yang selamat  
- Konfigurasi keselamatan rangkaian  

### **Perbincangan:** Mengapa Corak Ini Penting untuk AI

- **Kebergantungan Perkhidmatan**: Aplikasi AI sering memerlukan pelbagai perkhidmatan yang dikordinasi  
- **Keselamatan**: Kunci API dan titik akhir memerlukan pengurusan selamat  
- **Kebolehsuaian**: Beban kerja AI mempunyai keperluan skala unik  
- **Pengurusan Kos**: Perkhidmatan AI boleh mahal jika tidak dikonfigurasi dengan betul  

## Modul 2: Hasilkan Aplikasi AI Pertama Anda

### Langkah 2.1: Mulakan Persekitaran

1. **Cipta persekitaran AZD baru:**
```bash
azd env new myai-workshop
```
  
2. **Tetapkan parameter diperlukan:**
```bash
# Tetapkan wilayah Azure pilihan anda
azd env set AZURE_LOCATION eastus

# Pilihan: Tetapkan model OpenAI tertentu
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### Langkah 2.2: Hasilkan Infrastruktur dan Aplikasi

1. **Hasilkan dengan AZD:**
```bash
azd up
```
  
**Apa yang berlaku semasa `azd up`:**  
- ✅ Menyediakan perkhidmatan Microsoft Foundry Models  
- ✅ Mencipta perkhidmatan Cognitive Search  
- ✅ Menyediakan App Service untuk aplikasi web  
- ✅ Mengkonfigurasi rangkaian dan keselamatan  
- ✅ Menghasilkan kod aplikasi  
- ✅ Menyediakan pemantauan dan log  

2. **Pantau kemajuan penghasilan** dan catat sumber yang sedang dibuat.  

### Langkah 2.3: Sahkan Penghasilan Anda

1. **Semak sumber yang dihasilkan:**
```bash
azd show
```
  
2. **Buka aplikasi yang dihasilkan:**
```bash
azd show
```
  
Buka titik akhir web yang dipaparkan dalam output `azd show`.  

3. **Uji fungsi AI:**  
   - Layari aplikasi web  
   - Cuba pertanyaan contoh  
   - Sahkan respons AI berfungsi  

### **Latihan Makmal 2.1: Latihan Penyelesaian Masalah**

**Senario**: Penghasilan anda berjaya tetapi AI tidak memberi respons.  

**Isu biasa untuk disemak:**  
1. **Kunci API OpenAI**: Sahkan telah ditetapkan dengan betul  
2. **Ketersediaan model**: Semak jika rantau anda menyokong model tersebut  
3. **Sambungan rangkaian**: Pastikan perkhidmatan boleh berkomunikasi  
4. **Kebenaran RBAC**: Sahkan aplikasi boleh akses OpenAI  

**Perintah debugging:**  
```bash
# Semak pembolehubah persekitaran
azd env get-values

# Lihat log penghantaran
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Semak status penghantaran OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Modul 3: Menyesuaikan Aplikasi AI Untuk Keperluan Anda

### Langkah 3.1: Ubahsuai Konfigurasi AI

1. **Kemas kini model OpenAI:**
```bash
# Tukar kepada model yang lain (jika ada di kawasan anda)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Pasang semula dengan konfigurasi baru
azd deploy
```
  
2. **Tambah perkhidmatan AI tambahan:**

Sunting `infra/main.bicep` untuk tambah Document Intelligence:

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
  
### Langkah 3.2: Konfigurasi Spesifik Persekitaran

**Amalan Terbaik**: Konfigurasi berbeza untuk pembangunan vs pengeluaran.

1. **Cipta persekitaran produksi:**
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

**Cabaran**: Konfigurasi templat untuk pembangunan kos efektif.

**Tugas:**  
1. Kenal pasti SKU mana boleh ditetapkan ke tier percuma/asas  
2. Konfigurasi pembolehubah persekitaran untuk kos minimum  
3. Hasilkan dan bandingkan kos dengan konfigurasi produksi  

**Petunjuk penyelesaian:**  
- Gunakan tier F0 (percuma) untuk Perkhidmatan Kognitif apabila boleh  
- Gunakan tier Asas untuk Perkhidmatan Carian dalam pembangunan  
- Pertimbangkan menggunakan pelan Consumption untuk Fungsi  

## Modul 4: Keselamatan dan Amalan Terbaik Pengeluaran

### Langkah 4.1: Pengurusan Kelayakan Selamat

**Cabaran semasa**: Banyak aplikasi AI menyimpan kunci API secara terus atau menggunakan simpanan tidak selamat.

**Penyelesaian AZD**: Identiti Terurus + integrasi Key Vault.

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

1. **Aktifkan endpoint persendirian** (jika belum dikonfigurasi):  

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

1. **Konfigurasi Application Insights:**
```bash
# Application Insights harus dikonfigurasikan secara automatik
# Semak konfigurasi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Sediakan pemantauan khusus AI:**

Tambah metrik tersuai untuk operasi AI:  
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

**Tugas**: Semak penghasilan anda untuk amalan keselamatan terbaik.

**Senarai semak:**  
- [ ] Tiada rahsia tersemat dalam kod atau konfigurasi  
- [ ] Identiti Terurus digunakan untuk pengesahan perkhidmatan-ke-perkhidmatan  
- [ ] Key Vault menyimpan konfigurasi sensitif  
- [ ] Akses rangkaian dikawal dengan betul  
- [ ] Pemantauan dan perekodan diaktifkan  

## Modul 5: Menukar Aplikasi AI Anda Sendiri

### Langkah 5.1: Lembaran Penilaian

**Sebelum menukar aplikasi anda**, jawab soalan ini:

1. **Seni Bina Aplikasi:**  
   - Perkhidmatan AI apa yang aplikasi anda gunakan?  
   - Sumber pengkomputeran apa yang diperlukan?  
   - Adakah ia memerlukan pangkalan data?  
   - Apakah pergantungan antara perkhidmatan?  

2. **Keperluan Keselamatan:**  
   - Data sensitif apa yang dikendalikan aplikasi anda?  
   - Apakah keperluan pematuhan anda?  
   - Adakah anda perlukan rangkaian persendirian?  

3. **Keperluan Pengskalaan:**  
   - Berapakah beban yang dijangkakan?  
   - Adakah anda perlukan auto-scaling?  
   - Adakah terdapat keperluan rantau?  

### Langkah 5.2: Cipta Templat AZD Anda

**Ikuti corak ini untuk menukar aplikasi anda:**

1. **Bina struktur asas:**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Mulakan templat AZD
azd init --template minimal
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```
  
### **Latihan Makmal 5.1: Cabaran Ciptaan Templat**

**Cabaran**: Cipta templat AZD untuk aplikasi pemprosesan dokumen AI.

**Keperluan:**  
- Microsoft Foundry Models untuk analisis kandungan  
- Document Intelligence untuk OCR  
- Akaun Penyimpanan untuk muat naik dokumen  
- Fungsi App untuk logik pemprosesan  
- Aplikasi web untuk antara muka pengguna  

**Mata bonus:**  
- Tambah pengendalian ralat yang betul  
- Sertakan anggaran kos  
- Sediakan papan pemuka pemantauan  

## Modul 6: Menyelesaikan Masalah Biasa

### Masalah Penghasilan Biasa

#### Isu 1: Kuota Perkhidmatan OpenAI Melebihi  
**Gejala:** Penghasilan gagal dengan ralat kuota  
**Penyelesaian:**  
```bash
# Semak kuota semasa
az cognitiveservices usage list --location eastus

# Mohon kenaikan kuota atau cuba wilayah berbeza
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Isu 2: Model Tidak Tersedia di Rantau  
**Gejala:** Respons AI gagal atau ralat penghasilan model  
**Penyelesaian:**  
```bash
# Semak ketersediaan model mengikut wilayah
az cognitiveservices model list --location eastus

# Kemas kini kepada model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### Isu 3: Masalah Kebenaran  
**Gejala:** Ralat 403 Forbidden apabila memanggil perkhidmatan AI  
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
  
### Masalah Prestasi

#### Isu 4: Respons AI Lambat  
**Langkah penyiasatan:**  
1. Semak Application Insights untuk metrik prestasi  
2. Semak metrik perkhidmatan OpenAI dalam portal Azure  
3. Pastikan sambungan rangkaian dan latensi  

**Penyelesaian:**  
- Laksanakan caching untuk pertanyaan biasa  
- Gunakan model OpenAI sesuai untuk kes penggunaan anda  
- Pertimbangkan replikasi baca untuk senario beban tinggi  

### **Latihan Makmal 6.1: Cabaran Debugging**

**Senario**: Penghasilan berjaya, tetapi aplikasi memberi ralat 500.

**Tugas debugging:**  
1. Semak log aplikasi  
2. Sahkan sambungan perkhidmatan  
3. Uji pengesahan  
4. Semak konfigurasi  

**Alat untuk digunakan:**  
- `azd show` untuk gambaran keseluruhan penghasilan  
- Portal Azure untuk log perkhidmatan terperinci  
- Application Insights untuk telemetri aplikasi  

## Modul 7: Pemantauan dan Pengoptimuman

### Langkah 7.1: Sediakan Pemantauan Komprehensif

1. **Cipta papan pemuka tersuai:**

Navigasi ke portal Azure dan cipta papan pemuka dengan:  
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
- Sediakan amaran bajet  
- Gunakan polisi autoscaling  
- Laksanakan caching permintaan  
- Pantau penggunaan token untuk OpenAI  

### **Latihan Makmal 7.1: Pengoptimuman Prestasi**

**Tugas:** Optimumkan aplikasi AI anda untuk prestasi dan kos.

**Metrik untuk dipertingkatkan:**  
- Kurangkan masa respons purata sebanyak 20%  
- Kurangkan kos bulanan sebanyak 15%  
- Kekalkan uptime 99.9%  

**Strategi untuk cuba:**  
- Laksanakan caching respons  
- Optimumkan prompt untuk kecekapan token  
- Gunakan SKU pengkomputeran yang sesuai  
- Sediakan autoscaling yang betul  

## Cabaran Akhir: Pelaksanaan Sepenuhnya

### Senario Cabaran

Anda ditugaskan mencipta chatbot perkhidmatan pelanggan berkuasa AI bersiap produksi dengan keperluan berikut:

**Keperluan Fungsi:**  
- Antara muka web untuk interaksi pelanggan  
- Integrasi dengan Microsoft Foundry Models untuk respons  
- Kebolehan carian dokumen menggunakan Cognitive Search  
- Integrasi dengan pangkalan data pelanggan sedia ada  
- Sokongan pelbagai bahasa  

**Keperluan Bukan Fungsi:**  
- Menangani 1000 pengguna serentak  
- SLA uptime 99.9%  
- Pematuhan SOC 2  
- Kos di bawah $500/bulan  
- Hasilkan ke berbilang persekitaran (dev, staging, prod)  

### Langkah Pelaksanaan

1. **Reka seni bina**  
2. **Cipta templat AZD**  
3. **Laksanakan langkah keselamatan**  
4. **Sediakan pemantauan dan amaran**  
5. **Cipta saluran penghasilan**  
6. **Dokumentasikan penyelesaian**  

### Kriteria Penilaian

- ✅ **Fungsi**: Adakah memenuhi semua keperluan?  
- ✅ **Keselamatan**: Adakah amalan terbaik dilaksanakan?  
- ✅ **Kebolehsuaian**: Bolehkah menangani beban?  
- ✅ **Penyelenggaraan**: Adakah kod & infrastruktur tersusun?  
- ✅ **Kos**: Adakah kekal dalam bajet?  

## Sumber Tambahan

### Dokumentasi Microsoft  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Dokumentasi Perkhidmatan Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### Templat Contoh
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Komuniti
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sijil Penyelesaian

Tahniah! Anda telah menamatkan Makmal Bengkel AI. Kini anda sepatutnya boleh:

- ✅ Menukar aplikasi AI sedia ada kepada templat AZD
- ✅ Melancarkan aplikasi AI sedia untuk pengeluaran
- ✅ Melaksanakan amalan terbaik keselamatan untuk beban kerja AI
- ✅ Memantau dan mengoptimumkan prestasi aplikasi AI
- ✅ Menyelesaikan isu biasa pelancaran

### Langkah Seterusnya
1. Guna corak ini dalam projek AI anda sendiri
2. Sumbangkan semula templat kepada komuniti
3. Sertai Microsoft Foundry Discord untuk sokongan berterusan
4. Terokai topik lanjutan seperti pelancaran pelbagai rantau

---

**Maklum Balas Bengkel**: Bantu kami memperbaiki bengkel ini dengan berkongsi pengalaman anda di saluran [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Sebelum**: [Pelancaran Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI Pengeluaran](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlukan Bantuan?** Sertai komuniti kami untuk sokongan dan perbincangan mengenai AZD dan pelancaran AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan penterjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesalahan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, penterjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau penafsiran yang salah yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->