<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T21:41:25+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "ms"
}
-->
# Bengkel AI: Menjadikan Penyelesaian AI Anda Boleh Dideploy dengan AZD

**Sebelumnya:** [AI Model Deployment](ai-model-deployment.md) | **Seterusnya:** [Production AI Practices](production-ai-practices.md)

## Gambaran Bengkel

Bengkel praktikal ini membimbing pembangun melalui proses mengambil aplikasi AI sedia ada dan menjadikannya boleh dideploy menggunakan Azure Developer CLI (AZD). Anda akan mempelajari corak penting untuk deployment AI dalam pengeluaran menggunakan perkhidmatan Azure AI Foundry.

**Tempoh:** 2-3 jam  
**Tahap:** Pertengahan  
**Prasyarat:** Pengetahuan asas Azure, pemahaman konsep AI/ML

## 🎓 Objektif Pembelajaran

Pada akhir bengkel ini, anda akan dapat:
- ✅ Menukar aplikasi AI sedia ada untuk menggunakan templat AZD
- ✅ Mengkonfigurasi perkhidmatan Azure AI Foundry dengan AZD
- ✅ Melaksanakan pengurusan kelayakan yang selamat untuk perkhidmatan AI
- ✅ Mendeply aplikasi AI sedia pengeluaran dengan pemantauan
- ✅ Menyelesaikan masalah biasa dalam deployment AI

## Prasyarat

### Alat Diperlukan
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) dipasang
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) dipasang
- [Git](https://git-scm.com/) dipasang
- Editor kod (VS Code disyorkan)

### Sumber Azure
- Langganan Azure dengan akses penyumbang
- Akses kepada perkhidmatan Azure OpenAI (atau keupayaan untuk meminta akses)
- Kebenaran untuk mencipta kumpulan sumber

### Pengetahuan Prasyarat
- Pemahaman asas tentang perkhidmatan Azure
- Familiariti dengan antara muka baris perintah
- Konsep asas AI/ML (API, model, prompt)

## Persediaan Bengkel

### Langkah 1: Persediaan Persekitaran

1. **Sahkan pemasangan alat:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clone repositori bengkel:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Memahami Struktur AZD untuk Aplikasi AI

### Anatomi Templat AZD Sedia AI

Terokai fail utama dalam templat AZD yang sedia AI:

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

**Apa yang perlu dicari:**
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

### **Titik Perbincangan:** Mengapa Corak Ini Penting untuk AI

- **Kebergantungan Perkhidmatan**: Aplikasi AI sering memerlukan pelbagai perkhidmatan yang diselaraskan
- **Keselamatan**: Kunci API dan endpoint perlu diuruskan dengan selamat
- **Kebolehskalaan**: Beban kerja AI mempunyai keperluan penskalaan yang unik
- **Pengurusan Kos**: Perkhidmatan AI boleh menjadi mahal jika tidak dikonfigurasi dengan betul

## Modul 2: Mendeply Aplikasi AI Pertama Anda

### Langkah 2.1: Memulakan Persekitaran

1. **Cipta persekitaran AZD baharu:**
```bash
azd env new myai-workshop
```

2. **Tetapkan parameter yang diperlukan:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Langkah 2.2: Mendeply Infrastruktur dan Aplikasi

1. **Deploy dengan AZD:**
```bash
azd up
```

**Apa yang berlaku semasa `azd up`:**
- ✅ Menyediakan perkhidmatan Azure OpenAI
- ✅ Mencipta perkhidmatan Cognitive Search
- ✅ Menyediakan App Service untuk aplikasi web
- ✅ Mengkonfigurasi rangkaian dan keselamatan
- ✅ Mendeply kod aplikasi
- ✅ Menyediakan pemantauan dan logging

2. **Pantau kemajuan deployment** dan perhatikan sumber yang sedang dicipta.

### Langkah 2.3: Sahkan Deployment Anda

1. **Periksa sumber yang telah dideploy:**
```bash
azd show
```

2. **Buka aplikasi yang telah dideploy:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Uji fungsi AI:**
   - Navigasi ke aplikasi web
   - Cuba pertanyaan sampel
   - Sahkan respons AI berfungsi

### **Latihan Makmal 2.1: Amalan Penyelesaian Masalah**

**Senario**: Deployment anda berjaya tetapi AI tidak memberikan respons.

**Isu biasa untuk diperiksa:**
1. **Kunci API OpenAI**: Sahkan ia telah ditetapkan dengan betul
2. **Ketersediaan model**: Periksa jika wilayah anda menyokong model tersebut
3. **Kesambungan rangkaian**: Pastikan perkhidmatan boleh berkomunikasi
4. **Kebenaran RBAC**: Sahkan aplikasi boleh mengakses OpenAI

**Perintah debugging:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Menyesuaikan Aplikasi AI untuk Keperluan Anda

### Langkah 3.1: Ubah Konfigurasi AI

1. **Kemas kini model OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Latihan Makmal 3.1: Pengoptimuman Kos**

**Cabaran**: Konfigurasikan templat untuk pembangunan yang kos efektif.

**Tugas:**
1. Kenalpasti SKU yang boleh ditetapkan kepada tier percuma/asas
2. Konfigurasikan pembolehubah persekitaran untuk kos minimum
3. Deploy dan bandingkan kos dengan konfigurasi pengeluaran

**Petunjuk penyelesaian:**
- Gunakan tier F0 (percuma) untuk Cognitive Services jika boleh
- Gunakan tier Basic untuk Search Service dalam pembangunan
- Pertimbangkan menggunakan pelan Consumption untuk Functions

## Modul 4: Keselamatan dan Amalan Terbaik Pengeluaran

### Langkah 4.1: Pengurusan Kelayakan yang Selamat

**Cabaran semasa**: Banyak aplikasi AI menyimpan kunci API secara hardcode atau menggunakan storan yang tidak selamat.

**Penyelesaian AZD**: Integrasi Managed Identity + Key Vault.

1. **Semak konfigurasi keselamatan dalam templat anda:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Sahkan Managed Identity berfungsi:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Langkah 4.2: Keselamatan Rangkaian

1. **Aktifkan endpoint peribadi** (jika belum dikonfigurasi):

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

### Langkah 4.3: Pemantauan dan Observabiliti

1. **Konfigurasikan Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
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

**Tugas**: Semak deployment anda untuk amalan terbaik keselamatan.

**Senarai Semak:**
- [ ] Tiada rahsia yang disimpan secara hardcode dalam kod atau konfigurasi
- [ ] Managed Identity digunakan untuk pengesahan perkhidmatan-ke-perkhidmatan
- [ ] Key Vault menyimpan konfigurasi sensitif
- [ ] Akses rangkaian dihadkan dengan betul
- [ ] Pemantauan dan logging diaktifkan

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

# Initialize AZD template
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

**Bonus:** 
- Tambah pengendalian ralat yang betul
- Sertakan anggaran kos
- Tetapkan papan pemuka pemantauan

## Modul 6: Menyelesaikan Masalah Biasa

### Isu Deployment Biasa

#### Isu 1: Kuota Perkhidmatan OpenAI Melebihi
**Gejala:** Deployment gagal dengan ralat kuota
**Penyelesaian:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Isu 2: Model Tidak Tersedia di Wilayah
**Gejala:** Respons AI gagal atau ralat deployment model
**Penyelesaian:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
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

#### Isu 4: Respons AI Perlahan
**Langkah penyiasatan:**
1. Periksa Application Insights untuk metrik prestasi
2. Semak metrik perkhidmatan OpenAI di portal Azure
3. Sahkan kesambungan rangkaian dan latensi

**Penyelesaian:**
- Laksanakan caching untuk pertanyaan biasa
- Gunakan model OpenAI yang sesuai untuk kes penggunaan anda
- Pertimbangkan replika baca untuk senario beban tinggi

### **Latihan Makmal 6.1: Cabaran Debugging**

**Senario**: Deployment anda berjaya, tetapi aplikasi mengembalikan ralat 500.

**Tugas debugging:**
1. Periksa log aplikasi
2. Sahkan kesambungan perkhidmatan
3. Uji pengesahan
4. Semak konfigurasi

**Alat untuk digunakan:**
- `azd show` untuk gambaran keseluruhan deployment
- Portal Azure untuk log perkhidmatan terperinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Pengoptimuman

### Langkah 7.1: Tetapkan Pemantauan Komprehensif

1. **Cipta papan pemuka tersuai:**

Navigasi ke portal Azure dan cipta papan pemuka dengan:
- Bilangan permintaan OpenAI dan latensi
- Kadar ralat aplikasi
- Penggunaan sumber
- Penjejakan kos

2. **Tetapkan amaran:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
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
- Kekalkan uptime 99.9%

**Strategi untuk dicuba:**
- Laksanakan caching respons
- Optimumkan prompt untuk kecekapan token
- Gunakan SKU pengkomputeran yang sesuai
- Tetapkan penskalaan automatik yang betul

## Cabaran Akhir: Pelaksanaan Hujung-ke-Hujung

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
- SLA uptime 99.9%
- Pematuhan SOC 2
- Kos di bawah $500/bulan
- Deploy ke pelbagai persekitaran (dev, staging, prod)

### Langkah Pelaksanaan

1. **Reka bentuk senibina**
2. **Cipta templat AZD**
3. **Laksanakan langkah keselamatan**
4. **Tetapkan pemantauan dan amaran**
5. **Cipta pipeline deployment**
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
- [Dokumentasi Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templat Contoh
- [Aplikasi Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart Aplikasi Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Komuniti
- [Discord Azure AI Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Templat AZD Hebat](https://azure.github.io/awesome-azd/)

## 🎓 Sijil Penyelesaian

Tahniah! Anda telah menyelesaikan Bengkel AI. Anda kini sepatutnya dapat:

- ✅ Menukar aplikasi AI sedia ada kepada templat AZD
- ✅ Mendeply aplikasi AI sedia pengeluaran
- ✅ Laksanakan amalan terbaik keselamatan untuk beban kerja AI  
- ✅ Pantau dan optimalkan prestasi aplikasi AI  
- ✅ Selesaikan masalah biasa semasa penyebaran  

### Langkah Seterusnya  
1. Gunakan corak ini pada projek AI anda sendiri  
2. Sumbangkan templat kembali kepada komuniti  
3. Sertai Discord Azure AI Foundry untuk sokongan berterusan  
4. Terokai topik lanjutan seperti penyebaran pelbagai wilayah  

---

**Maklum Balas Bengkel**: Bantu kami meningkatkan bengkel ini dengan berkongsi pengalaman anda di [saluran Azure Discord Azure AI Foundry](https://discord.gg/microsoft-azure).  

---

**Sebelumnya:** [Penyebaran Model AI](ai-model-deployment.md) | **Seterusnya:** [Amalan AI Pengeluaran](production-ai-practices.md)  

**Perlu Bantuan?** Sertai komuniti kami untuk sokongan dan perbincangan tentang AZD dan penyebaran AI.  

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.