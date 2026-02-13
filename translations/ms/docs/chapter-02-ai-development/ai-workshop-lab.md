# Makmal Bengkel AI: Menjadikan Penyelesaian AI Anda Boleh Dideploy dengan AZD

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berorientasikan AI
- **⬅️ Sebelumnya**: [Penyebaran Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI Pengeluaran](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Gambaran Keseluruhan Bengkel

Makmal praktikal ini membimbing pembangun melalui proses mengambil templat AI sedia ada dan menyebarkannya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari corak penting untuk penyebaran AI produksi menggunakan perkhidmatan Microsoft Foundry.

**Tempoh:** 2-3 jam  
**Tahap:** Pertengahan  
**Prasyarat:** Pengetahuan asas Azure, kefahaman konsep AI/ML

## 🎓 Objektif Pembelajaran

Menjelang akhir bengkel ini, anda akan dapat:
- ✅ Menukar aplikasi AI sedia ada untuk menggunakan templat AZD
- ✅ Mengkonfigurasi perkhidmatan Microsoft Foundry dengan AZD
- ✅ Melaksanakan pengurusan kelayakan yang selamat untuk perkhidmatan AI
- ✅ Menyebarkan aplikasi AI siap produksi dengan pemantauan
- ✅ Menyelesaikan masalah biasa dalam penyebaran AI

## Prasyarat

### Alat Diperlukan
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) dipasang
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) dipasang
- [Git](https://git-scm.com/) dipasang
- Penyunting kod (VS Code disyorkan)

### Sumber Azure
- Langganan Azure dengan akses penyumbang
- Akses ke perkhidmatan Azure OpenAI (atau keupayaan untuk memohon akses)
- Kebenaran untuk mencipta kumpulan sumber

### Prasyarat Pengetahuan
- Pemahaman asas mengenai perkhidmatan Azure
- Kefahaman dengan antara muka baris perintah
- Konsep asas AI/ML (API, model, prompt)

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

### Anatomi Templat AZD AI

Terokai fail utama dalam templat AZD yang sedia untuk AI:

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

**Perkara yang perlu dicari:**
- Definisi perkhidmatan untuk komponen AI
- Pemetaan pembolehubah persekitaran
- Konfigurasi hos

2. **Semak infrastruktur main.bicep:**
```bash
cat infra/main.bicep
```

**Corak AI utama untuk dikenal pasti:**
- Penyediaan perkhidmatan Azure OpenAI
- Integrasi Cognitive Search
- Pengurusan kunci yang selamat
- Konfigurasi keselamatan rangkaian

### **Titik Perbincangan:** Mengapa Corak Ini Penting untuk AI

- **Kebergantungan Perkhidmatan**: Aplikasi AI sering memerlukan pelbagai perkhidmatan yang diselaraskan
- **Keselamatan**: Kunci API dan titik akhir perlu diuruskan dengan selamat
- **Kebolehskalaan**: Beban kerja AI mempunyai keperluan penskalaan yang unik
- **Pengurusan Kos**: Perkhidmatan AI boleh menjadi mahal jika tidak dikonfigurasi dengan betul

## Modul 2: Sebarkan Aplikasi AI Pertama Anda

### Langkah 2.1: Inisialisasi Persekitaran

1. **Cipta persekitaran AZD baru:**
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

### Langkah 2.2: Sebarkan Infrastruktur dan Aplikasi

1. **Sebarkan dengan AZD:**
```bash
azd up
```

**Apa yang berlaku semasa `azd up`:**
- ✅ Menyediakan perkhidmatan Azure OpenAI
- ✅ Mencipta perkhidmatan Cognitive Search
- ✅ Menyediakan App Service untuk aplikasi web
- ✅ Mengkonfigurasi rangkaian dan keselamatan
- ✅ Menyebarkan kod aplikasi
- ✅ Menyediakan pemantauan dan pencatatan

2. **Pantau kemajuan penyebaran** dan ambil perhatian sumber yang sedang dicipta.

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
   - Cuba pertanyaan contoh
   - Sahkan tindak balas AI berfungsi

### **Latihan Makmal 2.1: Latihan Menyelesaikan Masalah**

**Senario**: Penyebaran anda berjaya tetapi AI tidak memberi respons.

**Isu biasa untuk diperiksa:**
1. **Kunci API OpenAI**: Sahkan ia ditetapkan dengan betul
2. **Ketersediaan model**: Semak jika rantau anda menyokong model tersebut
3. **Kesambungan rangkaian**: Pastikan perkhidmatan boleh berkomunikasi
4. **Kebenaran RBAC**: Sahkan aplikasi boleh mengakses OpenAI

**Arahan penyahpepijat:**
```bash
# Semak pembolehubah persekitaran
azd env get-values

# Lihat log penyebaran
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Periksa status penyebaran OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Menyesuaikan Aplikasi AI Mengikut Keperluan Anda

### Langkah 3.1: Ubah Suai Konfigurasi AI

1. **Kemas kini model OpenAI:**
```bash
# Tukar kepada model yang berbeza (jika tersedia di rantau anda)
azd env set AZURE_OPENAI_MODEL gpt-4

# Terapkan semula dengan konfigurasi baharu
azd deploy
```

2. **Tambah perkhidmatan AI tambahan:**

Sunting `infra/main.bicep` untuk menambah Document Intelligence:

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

**Amalan Terbaik**: Konfigurasi berbeza untuk pembangunan dan pengeluaran.

1. **Cipta persekitaran pengeluaran:**
```bash
azd env new myai-production
```

2. **Tetapkan parameter khusus pengeluaran:**
```bash
# Pengeluaran biasanya menggunakan SKU yang lebih tinggi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Dayakan ciri keselamatan tambahan
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Latihan Makmal 3.1: Pengoptimuman Kos**

**Cabaran**: Konfigurasikan templat untuk pembangunan yang berpatutan kos.

**Tugasan:**
1. Kenalpasti SKU mana yang boleh ditetapkan ke lapisan percuma/asas
2. Konfigurasikan pembolehubah persekitaran untuk kos minima
3. Sebarkan dan bandingkan kos dengan konfigurasi pengeluaran

**Petunjuk penyelesaian:**
- Gunakan lapisan F0 (percuma) untuk Cognitive Services apabila boleh
- Gunakan lapisan Asas untuk Search Service semasa pembangunan
- Pertimbangkan menggunakan pelan Consumption untuk Functions

## Modul 4: Keselamatan dan Amalan Terbaik Pengeluaran

### Langkah 4.1: Pengurusan Kelayakan yang Selamat

**Cabaran semasa**: Banyak aplikasi AI menyimpan kunci API secara tertanam atau menggunakan storan tidak selamat.

**Penyelesaian AZD**: Integrasi Managed Identity + Key Vault.

1. **Semak konfigurasi keselamatan dalam templat anda:**
```bash
# Cari konfigurasi Key Vault dan Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Sahkan Managed Identity berfungsi:**
```bash
# Periksa sama ada aplikasi web mempunyai konfigurasi identiti yang betul
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Langkah 4.2: Keselamatan Rangkaian

1. **Dayakan private endpoints** (jika belum dikonfigurasi):

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

### Langkah 4.3: Pemantauan dan Keterlihatan

1. **Konfigurasikan Application Insights:**
```bash
# Application Insights harus dikonfigurasi secara automatik
# Periksa konfigurasi:
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

**Tugas**: Semak penyebaran anda untuk amalan terbaik keselamatan.

**Senarai semak:**
- [ ] Tiada rahsia tertanam dalam kod atau konfigurasi
- [ ] Managed Identity digunakan untuk pengesahan perkhidmatan-ke-perkhidmatan
- [ ] Key Vault menyimpan konfigurasi sensitif
- [ ] Akses rangkaian dibatasi dengan betul
- [ ] Pemantauan dan pencatatan diaktifkan

## Modul 5: Menukar Aplikasi AI Anda Sendiri

### Langkah 5.1: Lembaran Kerja Penilaian

**Sebelum menukar aplikasi anda**, jawab soalan-soalan ini:

1. **Seni Bina Aplikasi:**
   - Perkhidmatan AI apa yang digunakan oleh aplikasi anda?
   - Sumber pengkomputeran apa yang diperlukan?
   - Adakah ia memerlukan pangkalan data?
   - Apakah kebergantungan antara perkhidmatan?

2. **Keperluan Keselamatan:**
   - Apakah data sensitif yang dikendalikan oleh aplikasi anda?
   - Apakah keperluan pematuhan yang anda ada?
   - Adakah anda memerlukan rangkaian swasta?

3. **Keperluan Penskalaan:**
   - Apakah beban yang diharapkan?
   - Adakah anda memerlukan auto-scaling?
   - Adakah terdapat keperluan serantau?

### Langkah 5.2: Cipta Templat AZD Anda

**Ikuti corak ini untuk menukar aplikasi anda:**

1. **Cipta struktur asas:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inisialisasi templat AZD
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

### Isu Penyebaran Biasa

#### Isu 1: Kuota Perkhidmatan OpenAI Melebihi Had
**Gejala:** Penyebaran gagal dengan ralat kuota
**Penyelesaian:**
```bash
# Periksa kuota semasa
az cognitiveservices usage list --location eastus

# Minta peningkatan kuota atau cuba rantau lain
azd env set AZURE_LOCATION westus2
azd up
```

#### Isu 2: Model Tidak Tersedia di Rantau
**Gejala:** Tindak balas AI gagal atau ralat penyebaran model
**Penyelesaian:**
```bash
# Periksa ketersediaan model mengikut wilayah
az cognitiveservices model list --location eastus

# Kemas kini kepada model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Isu 3: Masalah Kebenaran
**Gejala:** Ralat 403 Forbidden apabila memanggil perkhidmatan AI
**Penyelesaian:**
```bash
# Semak penugasan peranan
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tambah peranan yang hilang
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Isu Prestasi

#### Isu 4: Tindak Balas AI Perlahan
**Langkah penyiasatan:**
1. Periksa Application Insights untuk metrik prestasi
2. Semak metrik perkhidmatan OpenAI di portal Azure
3. Sahkan kesambungan rangkaian dan latensi

**Penyelesaian:**
- Laksanakan caching untuk pertanyaan biasa
- Gunakan model OpenAI yang sesuai untuk kes penggunaan anda
- Pertimbangkan read replicas untuk senario beban tinggi

### **Latihan Makmal 6.1: Cabaran Penyahpepijatan**

**Senario**: Penyebaran anda berjaya, tetapi aplikasi mengembalikan ralat 500.

**Tugasan penyahpepijatan:**
1. Periksa log aplikasi
2. Sahkan kesambungan perkhidmatan
3. Uji pengesahan
4. Semak konfigurasi

**Alat untuk digunakan:**
- `azd show` untuk gambaran keseluruhan penyebaran
- Portal Azure untuk log perkhidmatan terperinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Pengoptimuman

### Langkah 7.1: Sediakan Pemantauan Menyeluruh

1. **Cipta papan pemuka tersuai:**

Navigasi ke portal Azure dan cipta papan pemuka dengan:
- Kiraan permintaan OpenAI dan latensi
- Kadar ralat aplikasi
- Penggunaan sumber
- Penjejakan kos

2. **Sediakan amaran:**
```bash
# Amaran untuk kadar ralat yang tinggi
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
- Gunakan polisi autoscaling
- Laksanakan caching permintaan
- Pantau penggunaan token untuk OpenAI

### **Latihan Makmal 7.1: Pengoptimuman Prestasi**

**Tugas**: Optimumkan aplikasi AI anda untuk prestasi dan kos.

**Metrik untuk diperbaiki:**
- Kurangkan purata masa tindak balas sebanyak 20%
- Kurangkan kos bulanan sebanyak 15%
- Kekalkan masa up 99.9%

**Strategi yang boleh dicuba:**
- Laksanakan caching tindak balas
- Optimumkan prompt untuk kecekapan token
- Gunakan SKU pengkomputeran yang sesuai
- Sediakan autoscaling yang betul

## Cabaran Akhir: Pelaksanaan dari Hujung ke Hujung

### Senario Cabaran

Anda ditugaskan untuk mencipta chatbot khidmat pelanggan berkuasa AI yang sedia untuk produksi dengan keperluan berikut:

**Keperluan Fungsional:**
- Antara muka web untuk interaksi pelanggan
- Integrasi dengan Azure OpenAI untuk tindak balas
- Keupayaan carian dokumen menggunakan Cognitive Search
- Integrasi dengan pangkalan data pelanggan sedia ada
- Sokongan berbilang bahasa

**Keperluan Bukan Fungsional:**
- Menangani 1000 pengguna serentak
- SLA masa up 99.9%
- Pematuhan SOC 2
- Kos di bawah $500/bulan
- Sebarkan ke pelbagai persekitaran (dev, staging, prod)

### Langkah Pelaksanaan

1. **Reka seni bina**
2. **Cipta templat AZD**
3. **Laksanakan langkah keselamatan**
4. **Sediakan pemantauan dan amaran**
5. **Cipta saluran paip penyebaran**
6. **Dokumentasikan penyelesaian**

### Kriteria Penilaian

- ✅ **Fungsi**: Adakah ia memenuhi semua keperluan?
- ✅ **Keselamatan**: Adakah amalan terbaik dilaksanakan?
- ✅ **Kebolehskalaan**: Bolehkah ia menangani beban?
- ✅ **Kebolehlawatan**: Adakah kod dan infrastruktur tersusun dengan baik?
- ✅ **Kos**: Adakah ia kekal dalam bajet?

## Sumber Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Perkhidmatan Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templat Contoh
- [Aplikasi Sembang Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Permulaan Pantas Aplikasi Sembang OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Komuniti
- [Discord Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Templat AZD Hebat](https://azure.github.io/awesome-azd/)

## 🎓 Sijil Penyelesaian
Tahniah! Anda telah menyelesaikan Makmal Bengkel AI. Anda kini sepatutnya boleh:

- ✅ Menukar aplikasi AI sedia ada kepada templat AZD
- ✅ Menyebarkan aplikasi AI yang sedia untuk pengeluaran
- ✅ Melaksanakan amalan keselamatan terbaik untuk beban kerja AI
- ✅ Memantau dan mengoptimum prestasi aplikasi AI
- ✅ Menyelesaikan masalah penyebaran biasa

### Langkah Seterusnya
1. Terapkan corak ini kepada projek AI anda sendiri
2. Sumbangkan templat kembali kepada komuniti
3. Sertai Microsoft Foundry Discord untuk sokongan berterusan
4. Terokai topik lanjutan seperti penyebaran pelbagai rantau

---

**Maklum Balas Bengkel**: Bantu kami memperbaiki bengkel ini dengan berkongsi pengalaman anda di the [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berorientasikan AI
- **⬅️ Sebelumnya**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Seterusnya**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlukan Bantuan?** Sertai komuniti kami untuk sokongan dan perbincangan mengenai AZD dan penyebaran AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidakakuratan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber rujukan utama. Untuk maklumat penting, disyorkan mendapatkan terjemahan profesional oleh penterjemah manusia. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->