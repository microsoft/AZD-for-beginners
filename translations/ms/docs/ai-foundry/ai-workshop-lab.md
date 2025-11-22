<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-22T09:45:50+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "ms"
}
-->
# Makmal Bengkel AI: Menjadikan Penyelesaian AI Anda Boleh Diterapkan dengan AZD

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berasaskan AI
- **⬅️ Sebelumnya**: [Penggunaan Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI untuk Pengeluaran](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)

## Gambaran Keseluruhan Bengkel

Makmal praktikal ini membimbing pembangun melalui proses mengambil templat AI sedia ada dan menggunakannya dengan Azure Developer CLI (AZD). Anda akan mempelajari corak penting untuk penggunaan AI dalam pengeluaran menggunakan perkhidmatan Microsoft Foundry.

**Tempoh:** 2-3 jam  
**Tahap:** Pertengahan  
**Prasyarat:** Pengetahuan asas Azure, pemahaman konsep AI/ML

## 🎓 Objektif Pembelajaran

Menjelang akhir bengkel ini, anda akan dapat:
- ✅ Menukar aplikasi AI sedia ada untuk menggunakan templat AZD
- ✅ Mengkonfigurasi perkhidmatan Microsoft Foundry dengan AZD
- ✅ Melaksanakan pengurusan kelayakan yang selamat untuk perkhidmatan AI
- ✅ Menggunakan aplikasi AI sedia pengeluaran dengan pemantauan
- ✅ Menyelesaikan masalah biasa dalam penggunaan AI

## Prasyarat

### Alat Diperlukan
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) dipasang
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) dipasang
- [Git](https://git-scm.com/) dipasang
- Penyunting kod (disyorkan VS Code)

### Sumber Azure
- Langganan Azure dengan akses penyumbang
- Akses kepada perkhidmatan Azure OpenAI (atau keupayaan untuk memohon akses)
- Kebenaran untuk mencipta kumpulan sumber

### Pengetahuan Diperlukan
- Pemahaman asas tentang perkhidmatan Azure
- Kebiasaan dengan antara muka baris perintah
- Konsep asas AI/ML (API, model, arahan)

## Persediaan Makmal

### Langkah 1: Penyediaan Persekitaran

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
- Integrasi Cognitive Search
- Pengurusan kunci yang selamat
- Konfigurasi keselamatan rangkaian

### **Titik Perbincangan:** Kenapa Corak Ini Penting untuk AI

- **Kebergantungan Perkhidmatan**: Aplikasi AI sering memerlukan pelbagai perkhidmatan yang diselaraskan
- **Keselamatan**: Kunci API dan titik akhir perlu diuruskan dengan selamat
- **Kebolehskalaan**: Beban kerja AI mempunyai keperluan penskalaan yang unik
- **Pengurusan Kos**: Perkhidmatan AI boleh menjadi mahal jika tidak dikonfigurasi dengan betul

## Modul 2: Gunakan Aplikasi AI Pertama Anda

### Langkah 2.1: Inisialisasi Persekitaran

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

### Langkah 2.2: Gunakan Infrastruktur dan Aplikasi

1. **Gunakan dengan AZD:**
```bash
azd up
```

**Apa yang berlaku semasa `azd up`:**
- ✅ Menyediakan perkhidmatan Azure OpenAI
- ✅ Mencipta perkhidmatan Cognitive Search
- ✅ Menyediakan App Service untuk aplikasi web
- ✅ Mengkonfigurasi rangkaian dan keselamatan
- ✅ Menggunakan kod aplikasi
- ✅ Menyediakan pemantauan dan log

2. **Pantau kemajuan penggunaan** dan perhatikan sumber yang sedang dicipta.

### Langkah 2.3: Sahkan Penggunaan Anda

1. **Semak sumber yang digunakan:**
```bash
azd show
```

2. **Buka aplikasi yang digunakan:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Uji fungsi AI:**
   - Navigasi ke aplikasi web
   - Cuba pertanyaan sampel
   - Sahkan respons AI berfungsi

### **Latihan Makmal 2.1: Amalan Penyelesaian Masalah**

**Senario**: Penggunaan anda berjaya tetapi AI tidak memberikan respons.

**Isu biasa untuk diperiksa:**
1. **Kunci API OpenAI**: Sahkan ia ditetapkan dengan betul
2. **Ketersediaan model**: Periksa jika wilayah anda menyokong model tersebut
3. **Sambungan rangkaian**: Pastikan perkhidmatan boleh berkomunikasi
4. **Kebenaran RBAC**: Sahkan aplikasi boleh mengakses OpenAI

**Perintah penyahpepijatan:**
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

**Cabaran**: Konfigurasikan templat untuk pembangunan yang menjimatkan kos.

**Tugas:**
1. Kenal pasti SKU yang boleh ditetapkan kepada peringkat percuma/asas
2. Konfigurasikan pembolehubah persekitaran untuk kos minimum
3. Gunakan dan bandingkan kos dengan konfigurasi pengeluaran

**Petunjuk penyelesaian:**
- Gunakan peringkat F0 (percuma) untuk Cognitive Services jika boleh
- Gunakan peringkat Asas untuk Search Service dalam pembangunan
- Pertimbangkan menggunakan pelan Consumption untuk Functions

## Modul 4: Keselamatan dan Amalan Terbaik Pengeluaran

### Langkah 4.1: Pengurusan Kelayakan yang Selamat

**Cabaran semasa**: Banyak aplikasi AI menyimpan kunci API secara keras atau menggunakan storan yang tidak selamat.

**Penyelesaian AZD**: Integrasi Managed Identity + Key Vault.

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

1. **Dayakan titik akhir peribadi** (jika belum dikonfigurasi):

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

### Langkah 4.3: Pemantauan dan Pemerhatian

1. **Konfigurasikan Application Insights:**
```bash
# Aplikasi Insights harus dikonfigurasi secara automatik
# Periksa konfigurasi:
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

**Tugas**: Semak penggunaan anda untuk amalan terbaik keselamatan.

**Senarai Semak:**
- [ ] Tiada rahsia yang disimpan secara keras dalam kod atau konfigurasi
- [ ] Managed Identity digunakan untuk pengesahan perkhidmatan-ke-perkhidmatan
- [ ] Key Vault menyimpan konfigurasi sensitif
- [ ] Akses rangkaian dihadkan dengan betul
- [ ] Pemantauan dan log diaktifkan

## Modul 5: Menukar Aplikasi AI Anda Sendiri

### Langkah 5.1: Lembaran Kerja Penilaian

**Sebelum menukar aplikasi anda**, jawab soalan-soalan ini:

1. **Seni Bina Aplikasi:**
   - Apakah perkhidmatan AI yang digunakan oleh aplikasi anda?
   - Apakah sumber pengkomputeran yang diperlukan?
   - Adakah ia memerlukan pangkalan data?
   - Apakah kebergantungan antara perkhidmatan?

2. **Keperluan Keselamatan:**
   - Apakah data sensitif yang dikendalikan oleh aplikasi anda?
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
- Sediakan papan pemuka pemantauan

## Modul 6: Menyelesaikan Masalah Biasa

### Isu Penggunaan Biasa

#### Isu 1: Kuota Perkhidmatan OpenAI Melebihi
**Gejala:** Penggunaan gagal dengan ralat kuota
**Penyelesaian:**
```bash
# Semak kuota semasa
az cognitiveservices usage list --location eastus

# Mohon peningkatan kuota atau cuba kawasan lain
azd env set AZURE_LOCATION westus2
azd up
```

#### Isu 2: Model Tidak Tersedia di Wilayah
**Gejala:** Respons AI gagal atau ralat penggunaan model
**Penyelesaian:**
```bash
# Semak ketersediaan model mengikut wilayah
az cognitiveservices model list --location eastus

# Kemas kini kepada model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Isu 3: Masalah Kebenaran
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

### Isu Prestasi

#### Isu 4: Respons AI Perlahan
**Langkah penyiasatan:**
1. Semak Application Insights untuk metrik prestasi
2. Semak metrik perkhidmatan OpenAI dalam portal Azure
3. Sahkan sambungan rangkaian dan latensi

**Penyelesaian:**
- Laksanakan caching untuk pertanyaan biasa
- Gunakan model OpenAI yang sesuai untuk kes penggunaan anda
- Pertimbangkan replika baca untuk senario beban tinggi

### **Latihan Makmal 6.1: Cabaran Penyahpepijatan**

**Senario**: Penggunaan anda berjaya, tetapi aplikasi mengembalikan ralat 500.

**Tugas penyahpepijatan:**
1. Semak log aplikasi
2. Sahkan sambungan perkhidmatan
3. Uji pengesahan
4. Semak konfigurasi

**Alat yang digunakan:**
- `azd show` untuk gambaran keseluruhan penggunaan
- Portal Azure untuk log perkhidmatan terperinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Pengoptimuman

### Langkah 7.1: Sediakan Pemantauan Komprehensif

1. **Cipta papan pemuka tersuai:**

Navigasi ke portal Azure dan cipta papan pemuka dengan:
- Bilangan permintaan dan latensi OpenAI
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

1. **Analisis kos semasa:**
```bash
# Gunakan Azure CLI untuk mendapatkan data kos
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Laksanakan kawalan kos:**
- Sediakan amaran bajet
- Gunakan dasar penskalaan automatik
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
- Sediakan penskalaan automatik yang betul

## Cabaran Akhir: Pelaksanaan Hujung-ke-Hujung

### Senario Cabaran

Anda ditugaskan untuk mencipta chatbot perkhidmatan pelanggan berkuasa AI yang sedia pengeluaran dengan keperluan berikut:

**Keperluan Fungsional:**
- Antara muka web untuk interaksi pelanggan
- Integrasi dengan Azure OpenAI untuk respons
- Keupayaan carian dokumen menggunakan Cognitive Search
- Integrasi dengan pangkalan data pelanggan sedia ada
- Sokongan pelbagai bahasa

**Keperluan Bukan Fungsional:**
- Mengendalikan 1000 pengguna serentak
- SLA masa operasi 99.9%
- Pematuhan SOC 2
- Kos di bawah $500/bulan
- Digunakan ke pelbagai persekitaran (pembangunan, pementasan, pengeluaran)

### Langkah Pelaksanaan

1. **Reka bentuk seni bina**
2. **Cipta templat AZD**
3. **Laksanakan langkah keselamatan**
4. **Sediakan pemantauan dan amaran**
5. **Cipta saluran penggunaan**
6. **Dokumentasikan penyelesaian**

### Kriteria Penilaian

- ✅ **Fungsi**: Adakah ia memenuhi semua keperluan?
- ✅ **Keselamatan**: Adakah amalan terbaik dilaksanakan?
- ✅ **Kebolehskalaan**: Bolehkah ia mengendalikan beban?
- ✅ **Kebolehselenggaraan**: Adakah kod dan infrastruktur teratur?
- ✅ **Kos**: Adakah ia kekal dalam bajet?

## Sumber Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Perkhidmatan Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templat Contoh
- [Aplikasi Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Permulaan Cepat Aplikasi Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Komuniti
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Templat AZD Hebat](https://azure.github.io/awesome-azd/)

## 🎓 Sijil Penyelesaian
Tahniah! Anda telah menyelesaikan Makmal Bengkel AI. Anda kini sepatutnya mampu untuk:

- ✅ Menukar aplikasi AI sedia ada kepada templat AZD
- ✅ Melancarkan aplikasi AI yang sedia untuk pengeluaran
- ✅ Melaksanakan amalan terbaik keselamatan untuk beban kerja AI
- ✅ Memantau dan mengoptimumkan prestasi aplikasi AI
- ✅ Menyelesaikan masalah biasa semasa pelancaran

### Langkah Seterusnya
1. Gunakan corak ini pada projek AI anda sendiri
2. Sumbangkan templat kembali kepada komuniti
3. Sertai Microsoft Foundry Discord untuk sokongan berterusan
4. Terokai topik lanjutan seperti pelancaran multi-rantau

---

**Maklum Balas Bengkel**: Bantu kami memperbaiki bengkel ini dengan berkongsi pengalaman anda di [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

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