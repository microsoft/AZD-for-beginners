<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-22T11:34:29+00:00",
  "source_file": "docs/microsoft-foundry/ai-workshop-lab.md",
  "language_code": "ms"
}
-->
# AI Workshop Lab: Menjadikan Penyelesaian AI Anda Boleh Dideploy dengan AZD

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berasaskan AI
- **⬅️ Sebelumnya**: [Penyebaran Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI Pengeluaran](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)

## Gambaran Keseluruhan Bengkel

Makmal ini memberikan panduan praktikal kepada pembangun untuk mengambil templat AI sedia ada dan menyebarkannya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari corak penting untuk penyebaran AI pengeluaran menggunakan perkhidmatan Microsoft Foundry.

**Tempoh:** 2-3 jam  
**Tahap:** Pertengahan  
**Prasyarat:** Pengetahuan asas Azure, pemahaman konsep AI/ML

## 🎓 Objektif Pembelajaran

Menjelang akhir bengkel ini, anda akan dapat:
- ✅ Menukar aplikasi AI sedia ada untuk menggunakan templat AZD
- ✅ Mengkonfigurasi perkhidmatan Microsoft Foundry dengan AZD
- ✅ Melaksanakan pengurusan kelayakan yang selamat untuk perkhidmatan AI
- ✅ Menyebarkan aplikasi AI sedia pengeluaran dengan pemantauan
- ✅ Menyelesaikan masalah biasa dalam penyebaran AI

## Prasyarat

### Alat Diperlukan
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) dipasang
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) dipasang
- [Git](https://git-scm.com/) dipasang
- Penyunting kod (VS Code disyorkan)

### Sumber Azure
- Langganan Azure dengan akses penyumbang
- Akses kepada perkhidmatan Azure OpenAI (atau keupayaan untuk meminta akses)
- Kebenaran untuk mencipta kumpulan sumber

### Pengetahuan Prasyarat
- Pemahaman asas tentang perkhidmatan Azure
- Familiariti dengan antara muka baris perintah
- Konsep asas AI/ML (API, model, arahan)

## Persediaan Makmal

### Langkah 1: Persediaan Persekitaran

1. **Sahkan pemasangan alat:**
```bash
# Periksa pemasangan AZD
azd version

# Periksa Azure CLI
az --version

# Log masuk ke Azure
az login
azd auth login
```

2. **Klon repositori bengkel:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Memahami Struktur AZD untuk Aplikasi AI

### Anatomi Templat AZD Sedia AI

Terokai fail utama dalam templat AZD sedia AI:

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

### **Latihan Makmal 1.1: Terokai Konfigurasi**

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

**Corak AI utama untuk dikenalpasti:**
- Penyediaan perkhidmatan Azure OpenAI
- Integrasi Carian Kognitif
- Pengurusan kunci yang selamat
- Konfigurasi keselamatan rangkaian

### **Titik Perbincangan:** Mengapa Corak Ini Penting untuk AI

- **Kebergantungan Perkhidmatan**: Aplikasi AI sering memerlukan pelbagai perkhidmatan yang diselaraskan
- **Keselamatan**: Kunci API dan titik akhir perlu pengurusan yang selamat
- **Kebolehskalaan**: Beban kerja AI mempunyai keperluan penskalaan yang unik
- **Pengurusan Kos**: Perkhidmatan AI boleh mahal jika tidak dikonfigurasi dengan betul

## Modul 2: Menyebarkan Aplikasi AI Pertama Anda

### Langkah 2.1: Memulakan Persekitaran

1. **Cipta persekitaran AZD baharu:**
```bash
azd env new myai-workshop
```

2. **Tetapkan parameter yang diperlukan:**
```bash
# Tetapkan rantau Azure pilihan anda
azd env set AZURE_LOCATION eastus

# Pilihan: Tetapkan model OpenAI tertentu
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Langkah 2.2: Menyebarkan Infrastruktur dan Aplikasi

1. **Sebarkan dengan AZD:**
```bash
azd up
```

**Apa yang berlaku semasa `azd up`:**
- ✅ Menyediakan perkhidmatan Azure OpenAI
- ✅ Mencipta perkhidmatan Carian Kognitif
- ✅ Menyediakan App Service untuk aplikasi web
- ✅ Mengkonfigurasi rangkaian dan keselamatan
- ✅ Menyebarkan kod aplikasi
- ✅ Menyediakan pemantauan dan log

2. **Pantau kemajuan penyebaran** dan perhatikan sumber yang sedang dicipta.

### Langkah 2.3: Sahkan Penyebaran Anda

1. **Periksa sumber yang disebarkan:**
```bash
azd show
```

2. **Buka aplikasi yang disebarkan:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Uji fungsi AI:**
   - Navigasi ke aplikasi web
   - Cuba pertanyaan sampel
   - Sahkan respons AI berfungsi

### **Latihan Makmal 2.1: Latihan Penyelesaian Masalah**

**Senario**: Penyebaran anda berjaya tetapi AI tidak memberikan respons.

**Masalah biasa untuk diperiksa:**
1. **Kunci API OpenAI**: Sahkan ia ditetapkan dengan betul
2. **Ketersediaan model**: Periksa jika wilayah anda menyokong model tersebut
3. **Kesambungan rangkaian**: Pastikan perkhidmatan boleh berkomunikasi
4. **Kebenaran RBAC**: Sahkan aplikasi boleh mengakses OpenAI

**Perintah penyahpepijat:**
```bash
# Periksa pembolehubah persekitaran
azd env get-values

# Lihat log penyebaran
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Periksa status penyebaran OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Menyesuaikan Aplikasi AI untuk Keperluan Anda

### Langkah 3.1: Ubah Konfigurasi AI

1. **Kemas kini model OpenAI:**
```bash
# Tukar kepada model lain (jika tersedia di kawasan anda)
azd env set AZURE_OPENAI_MODEL gpt-4

# Lakukan penyebaran semula dengan konfigurasi baru
azd deploy
```

2. **Tambah perkhidmatan AI tambahan:**

Edit `infra/main.bicep` untuk menambah Document Intelligence:

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

**Amalan Terbaik**: Konfigurasi berbeza untuk pembangunan vs pengeluaran.

1. **Cipta persekitaran pengeluaran:**
```bash
azd env new myai-production
```

2. **Tetapkan parameter khusus pengeluaran:**
```bash
# Pengeluaran biasanya menggunakan SKU yang lebih tinggi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktifkan ciri keselamatan tambahan
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Latihan Makmal 3.1: Pengoptimuman Kos**

**Cabaran**: Konfigurasikan templat untuk pembangunan yang kos efektif.

**Tugas:**
1. Kenalpasti SKU yang boleh ditetapkan kepada peringkat percuma/asas
2. Konfigurasikan pembolehubah persekitaran untuk kos minimum
3. Sebarkan dan bandingkan kos dengan konfigurasi pengeluaran

**Petunjuk penyelesaian:**
- Gunakan peringkat F0 (percuma) untuk Cognitive Services jika boleh
- Gunakan peringkat Asas untuk Search Service dalam pembangunan
- Pertimbangkan menggunakan pelan Consumption untuk Functions

## Modul 4: Keselamatan dan Amalan Terbaik Pengeluaran

### Langkah 4.1: Pengurusan Kelayakan yang Selamat

**Cabaran semasa**: Banyak aplikasi AI menyimpan kunci API secara langsung atau menggunakan storan yang tidak selamat.

**Penyelesaian AZD**: Managed Identity + integrasi Key Vault.

1. **Semak konfigurasi keselamatan dalam templat anda:**
```bash
# Cari konfigurasi Key Vault dan Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Sahkan Managed Identity berfungsi:**
```bash
# Periksa jika aplikasi web mempunyai konfigurasi identiti yang betul
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Langkah 4.2: Keselamatan Rangkaian

1. **Aktifkan titik akhir peribadi** (jika belum dikonfigurasi):

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
# Aplikasi Insights harus dikonfigurasi secara automatik
# Periksa konfigurasi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Tetapkan pemantauan khusus AI:**

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

**Tugas**: Semak penyebaran anda untuk amalan terbaik keselamatan.

**Senarai Semak:**
- [ ] Tiada rahsia yang disimpan secara langsung dalam kod atau konfigurasi
- [ ] Managed Identity digunakan untuk pengesahan perkhidmatan-ke-perkhidmatan
- [ ] Key Vault menyimpan konfigurasi sensitif
- [ ] Akses rangkaian dihadkan dengan betul
- [ ] Pemantauan dan log diaktifkan

## Modul 5: Menukar Aplikasi AI Anda Sendiri

### Langkah 5.1: Lembaran Kerja Penilaian

**Sebelum menukar aplikasi anda**, jawab soalan berikut:

1. **Senibina Aplikasi:**
   - Perkhidmatan AI apa yang digunakan oleh aplikasi anda?
   - Sumber pengkomputeran apa yang diperlukan?
   - Adakah ia memerlukan pangkalan data?
   - Apakah kebergantungan antara perkhidmatan?

2. **Keperluan Keselamatan:**
   - Data sensitif apa yang dikendalikan oleh aplikasi anda?
   - Apakah keperluan pematuhan yang anda ada?
   - Adakah anda memerlukan rangkaian peribadi?

3. **Keperluan Penskalaan:**
   - Apakah beban yang dijangkakan?
   - Adakah anda memerlukan penskalaan automatik?
   - Adakah terdapat keperluan wilayah?

### Langkah 5.2: Cipta Templat AZD Anda

**Ikuti corak ini untuk menukar aplikasi anda:**

1. **Cipta struktur asas:**
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

### **Latihan Makmal 5.1: Cabaran Penciptaan Templat**

**Cabaran**: Cipta templat AZD untuk aplikasi AI pemprosesan dokumen.

**Keperluan:**
- Azure OpenAI untuk analisis kandungan
- Document Intelligence untuk OCR
- Storage Account untuk muat naik dokumen
- Function App untuk logik pemprosesan
- Aplikasi web untuk antara muka pengguna

**Mata bonus:**
- Tambah pengendalian ralat yang betul
- Sertakan anggaran kos
- Tetapkan papan pemantauan

## Modul 6: Menyelesaikan Masalah Biasa

### Masalah Penyebaran Biasa

#### Masalah 1: Kuota Perkhidmatan OpenAI Melebihi
**Gejala:** Penyebaran gagal dengan ralat kuota
**Penyelesaian:**
```bash
# Semak kuota semasa
az cognitiveservices usage list --location eastus

# Mohon peningkatan kuota atau cuba kawasan lain
azd env set AZURE_LOCATION westus2
azd up
```

#### Masalah 2: Model Tidak Tersedia di Wilayah
**Gejala:** Respons AI gagal atau ralat penyebaran model
**Penyelesaian:**
```bash
# Semak ketersediaan model mengikut wilayah
az cognitiveservices model list --location eastus

# Kemas kini kepada model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Masalah 3: Masalah Kebenaran
**Gejala:** Ralat 403 Forbidden semasa memanggil perkhidmatan AI
**Penyelesaian:**
```bash
# Periksa tugasan peranan
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tambah peranan yang hilang
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Masalah Prestasi

#### Masalah 4: Respons AI Perlahan
**Langkah penyiasatan:**
1. Periksa Application Insights untuk metrik prestasi
2. Semak metrik perkhidmatan OpenAI di portal Azure
3. Sahkan kesambungan rangkaian dan latensi

**Penyelesaian:**
- Laksanakan caching untuk pertanyaan biasa
- Gunakan model OpenAI yang sesuai untuk kes penggunaan anda
- Pertimbangkan replika baca untuk senario beban tinggi

### **Latihan Makmal 6.1: Cabaran Penyahpepijat**

**Senario**: Penyebaran anda berjaya, tetapi aplikasi mengembalikan ralat 500.

**Tugas penyahpepijat:**
1. Periksa log aplikasi
2. Sahkan kesambungan perkhidmatan
3. Uji pengesahan
4. Semak konfigurasi

**Alat untuk digunakan:**
- `azd show` untuk gambaran keseluruhan penyebaran
- Portal Azure untuk log perkhidmatan terperinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Pengoptimuman

### Langkah 7.1: Tetapkan Pemantauan Komprehensif

1. **Cipta papan pemuka tersuai:**

Navigasi ke portal Azure dan cipta papan pemuka dengan:
- Bilangan permintaan dan latensi OpenAI
- Kadar ralat aplikasi
- Penggunaan sumber
- Penjejakan kos

2. **Tetapkan amaran:**
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

1. **Analisis kos semasa:**
```bash
# Gunakan Azure CLI untuk mendapatkan data kos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Laksanakan kawalan kos:**
- Tetapkan amaran bajet
- Gunakan polisi penskalaan automatik
- Laksanakan caching permintaan
- Pantau penggunaan token untuk OpenAI

### **Latihan Makmal 7.1: Pengoptimuman Prestasi**

**Tugas**: Optimumkan aplikasi AI anda untuk prestasi dan kos.

**Metrik untuk diperbaiki:**
- Kurangkan masa respons purata sebanyak 20%
- Kurangkan kos bulanan sebanyak 15%
- Kekalkan masa operasi 99.9%

**Strategi untuk dicuba:**
- Laksanakan caching respons
- Optimumkan arahan untuk kecekapan token
- Gunakan SKU pengkomputeran yang sesuai
- Tetapkan penskalaan automatik yang betul

## Cabaran Akhir: Pelaksanaan Menyeluruh

### Senario Cabaran

Anda ditugaskan untuk mencipta chatbot perkhidmatan pelanggan berkuasa AI yang sedia pengeluaran dengan keperluan berikut:

**Keperluan Fungsional:**
- Antara muka web untuk interaksi pelanggan
- Integrasi dengan Azure OpenAI untuk respons
- Keupayaan carian dokumen menggunakan Cognitive Search
- Integrasi dengan pangkalan data pelanggan sedia ada
- Sokongan pelbagai bahasa

**Keperluan Tidak Fungsional:**
- Menangani 1000 pengguna serentak
- SLA masa operasi 99.9%
- Pematuhan SOC 2
- Kos di bawah $500/bulan
- Penyebaran ke pelbagai persekitaran (pembangunan, pementasan, pengeluaran)

### Langkah Pelaksanaan

1. **Reka bentuk senibina**
2. **Cipta templat AZD**
3. **Laksanakan langkah keselamatan**
4. **Tetapkan pemantauan dan amaran**
5. **Cipta saluran penyebaran**
6. **Dokumentasikan penyelesaian**

### Kriteria Penilaian

- ✅ **Fungsi**: Adakah ia memenuhi semua keperluan?
- ✅ **Keselamatan**: Adakah amalan terbaik dilaksanakan?
- ✅ **Kebolehskalaan**: Bolehkah ia menangani beban?
- ✅ **Kebolehselenggaraan**: Adakah kod dan infrastruktur teratur?
- ✅ **Kos**: Adakah ia kekal dalam bajet?

## Sumber Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Perkhidmatan Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templat Contoh
- [Aplikasi Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart Aplikasi Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Komuniti
- [Discord Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Templat AZD Hebat](https://azure.github.io/awesome-azd/)

## 🎓 Sijil Penyelesaian
Tahniah! Anda telah menyelesaikan Bengkel Makmal AI. Anda kini sepatutnya mampu untuk:

- ✅ Menukar aplikasi AI sedia ada kepada templat AZD
- ✅ Melancarkan aplikasi AI yang sedia untuk pengeluaran
- ✅ Melaksanakan amalan terbaik keselamatan untuk beban kerja AI
- ✅ Memantau dan mengoptimumkan prestasi aplikasi AI
- ✅ Menyelesaikan masalah biasa semasa pelancaran

### Langkah Seterusnya
1. Gunakan corak ini pada projek AI anda sendiri
2. Sumbangkan templat kembali kepada komuniti
3. Sertai Microsoft Foundry Discord untuk sokongan berterusan
4. Terokai topik lanjutan seperti pelancaran pelbagai wilayah

---

**Maklum Balas Bengkel**: Bantu kami meningkatkan bengkel ini dengan berkongsi pengalaman anda di [Microsoft Foundry Discord saluran #Azure](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berasaskan AI
- **⬅️ Sebelumnya**: [Pelancaran Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI Pengeluaran](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)

**Perlukan Bantuan?** Sertai komuniti kami untuk sokongan dan perbincangan tentang AZD dan pelancaran AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->