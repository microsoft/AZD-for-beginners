# Makmal Bengkel AI: Menjadikan Penyelesaian AI Anda Boleh Dipasang AZD

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-First
- **⬅️ Sebelumnya**: [Penghantaran Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Gambaran Keseluruhan Bengkel

Makmal praktikal ini membimbing pembangun melalui proses mengambil templat AI sedia ada dan memasangnya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari corak penting untuk penghantaran AI produksi menggunakan perkhidmatan Microsoft Foundry.

> **Nota pengesahan (2026-07-13):** Bengkel ini telah disemak menggunakan `azd` `1.27.1`. Jika pemasangan tempatan anda lebih lama, kemaskini AZD sebelum bermula supaya proses pengesahan, templat, dan penghantaran selaras dengan langkah-langkah di bawah.

**Tempoh:** 2-3 jam  
**Tahap:** Pertengahan  
**Prasyarat:** Pengetahuan asas Azure, kebiasaan dengan konsep AI/ML

## 🎓 Objektif Pembelajaran

Pada akhir bengkel ini, anda akan dapat:
- ✅ Menukar aplikasi AI sedia ada untuk menggunakan templat AZD
- ✅ Mengkonfigurasi perkhidmatan Microsoft Foundry dengan AZD
- ✅ Melaksanakan pengurusan kredensial yang selamat untuk perkhidmatan AI
- ✅ Menghantar aplikasi AI yang sedia produksi dengan pemantauan
- ✅ Menyelesaikan isu penghantaran AI yang biasa

## Prasyarat

### Alat Diperlukan
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) dipasang
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) dipasang
- [Git](https://git-scm.com/) dipasang
- Penyunting kod (disarankan VS Code)

### Sumber Azure
- Langganan Azure dengan akses penyumbang
- Akses ke perkhidmatan Microsoft Foundry Models (atau kebolehan untuk memohon akses)
- Kebenaran untuk penciptaan kumpulan sumber

### Pengetahuan Prasyarat
- Pemahaman asas tentang perkhidmatan Azure
- Kebiasaan menggunakan antara muka baris perintah
- Konsep asas AI/ML (API, model, pertanyaan)

## Persediaan Makmal

### Langkah 1: Persiapan Persekitaran

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

Jika anda bekerja merentasi beberapa penyewa atau langganan anda tidak dikesan secara automatik, cuba semula dengan `azd auth login --tenant-id <tenant-id>`.

2. **Clone repositori bengkel:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Memahami Struktur AZD untuk Aplikasi AI

### Anatomi Templat AZD AI

Terokai fail utama dalam templat AZD siap AI:

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

1. **Periksa fail azure.yaml:**
```bash
cat azure.yaml
```

**Apa yang perlu dicari:**
- Definisi perkhidmatan untuk komponen AI
- Pemetaan pembolehubah persekitaran
- Konfigurasi hos

2. **Semak infrastruktur main.bicep utama:**
```bash
cat infra/main.bicep
```

**Corak AI utama yang perlu dikenalpasti:**
- Penyediaan perkhidmatan Microsoft Foundry Models
- Integrasi Azure AI Search
- Pengurusan kunci selamat
- Konfigurasi keselamatan rangkaian

### **Perbincangan:** Mengapa Corak Ini Penting untuk AI

- **Kebergantungan Perkhidmatan**: Aplikasi AI sering memerlukan pelbagai perkhidmatan yang dikoordinasi
- **Keselamatan**: Kunci API dan titik akhir perlu diurus secara selamat
- **Skalabiliti**: Beban kerja AI mempunyai keperluan penskalaan unik
- **Pengurusan Kos**: Perkhidmatan AI boleh menjadi mahal jika tidak dikonfigurasi dengan betul

## Modul 2: Menghantar Aplikasi AI Pertama Anda

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
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Langkah 2.2: Hantar Infrastruktur dan Aplikasi

1. **Hantar dengan AZD:**
```bash
azd up
```

**Apa yang berlaku semasa `azd up`:**
- ✅ Menyediakan perkhidmatan Microsoft Foundry Models
- ✅ Mencipta perkhidmatan Azure AI Search
- ✅ Menyediakan App Service untuk aplikasi web
- ✅ Mengkonfigurasikan rangkaian dan keselamatan
- ✅ Menghantar kod aplikasi
- ✅ Menyediakan pemantauan dan perekodan

2. **Pantau kemajuan penghantaran** dan catat sumber yang sedang dibuat.

### Langkah 2.3: Sahkan Penghantaran Anda

1. **Semak sumber yang dihantar:**
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
   - Cuba pertanyaan contoh
   - Sahkan respons AI berfungsi

### **Latihan Makmal 2.1: Amalan Penyelesaian Masalah**

**Senario**: Penghantaran anda berjaya tetapi AI tidak memberi respons.

**Isu biasa untuk semak:**
1. **Kunci API OpenAI**: Sahkan ia ditetapkan dengan betul
2. **Ketersediaan model**: Semak jika rantau anda menyokong model tersebut
3. **Sambungan rangkaian**: Pastikan perkhidmatan boleh berkomunikasi
4. **Kebenaran RBAC**: Sahkan aplikasi boleh mengakses OpenAI

**Perintah debug:**
```bash
# Semak pemboleh ubah persekitaran
azd env get-values

# Lihat log penyebaran
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Semak status penyebaran OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Menyesuaikan Aplikasi AI Mengikut Keperluan Anda

### Langkah 3.1: Ubah Konfigurasi AI

1. **Kemaskini model OpenAI:**
```bash
# Tukar ke model lain (jika tersedia di wilayah anda)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Deploy semula dengan konfigurasi baru
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

**Amalan Terbaik**: Konfigurasi berbeza untuk pembangunan vs produksi.

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

**Cabaran**: Konfigurasikan templat untuk pembangunan yang kos efektif.

**Tugas:**
1. Kenalpasti SKU mana yang boleh ditetapkan ke tier percuma/asas
2. Konfigurasikan pembolehubah persekitaran untuk kos minimum
3. Hantar dan bandingkan kos dengan konfigurasi produksi

**Petunjuk penyelesaian:**
- Gunakan tier F0 (percuma) untuk Perkhidmatan Azure AI apabila boleh
- Gunakan tier Asas untuk Perkhidmatan Carian dalam pembangunan
- Pertimbangkan penggunaan pelan Penggunaan untuk Fungsi

## Modul 4: Keselamatan dan Amalan Terbaik Produksi

### Langkah 4.1: Pengurusan Kredensial Selamat

**Cabaran semasa**: Banyak aplikasi AI memasukkan kunci API secara keras atau menggunakan storan tidak selamat.

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

### Langkah 4.3: Pemantauan dan Kebolehamatan

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

**Tugas**: Semak penghantaran anda untuk amalan keselamatan terbaik.

**Senarai semak:**
- [ ] Tiada rahsia dimasukkan keras dalam kod atau konfigurasi
- [ ] Identiti Terurus digunakan untuk pengesahan antara perkhidmatan
- [ ] Key Vault menyimpan konfigurasi sensitif
- [ ] Akses rangkaian dihadkan dengan betul
- [ ] Pemantauan dan perekodan diaktifkan

## Modul 5: Menukar Aplikasi AI Anda Sendiri

### Langkah 5.1: Lembaran Penilaian

**Sebelum menukar aplikasi anda**, jawablah soalan berikut:

1. **Senibina Aplikasi:**
   - Perkhidmatan AI apa yang aplikasi anda gunakan?
   - Sumber pengkomputeran apa yang diperlukan?
   - Adakah ia memerlukan pangkalan data?
   - Apakah kebergantungan antara perkhidmatan?

2. **Keperluan Keselamatan:**
   - Data sensitif apa yang aplikasi anda kendalikan?
   - Apakah keperluan pematuhan yang anda ada?
   - Adakah anda memerlukan rangkaian peribadi?

3. **Keperluan Penskalaan:**
   - Apakah beban yang dijangka?
   - Adakah anda memerlukan penskalaan automatik?
   - Adakah terdapat keperluan wilayah?

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
- Microsoft Foundry Models untuk analisis kandungan
- Document Intelligence untuk OCR
- Akaun Storan untuk muat naik dokumen
- Fungsi App untuk logik pemprosesan
- Aplikasi web untuk antara muka pengguna

**Mata bonus:**
- Tambah pengendalian ralat yang betul
- Sertakan anggaran kos
- Sediakan papan pemuka pemantauan

## Modul 6: Menyelesaikan Masalah Biasa

### Isu Penghantaran Biasa

#### Isu 1: Kuota Perkhidmatan OpenAI Terlampau
**Gejala:** Penghantaran gagal dengan ralat kuota
**Penyelesaian:**
```bash
# Semak kuota semasa
az cognitiveservices usage list --location eastus

# Mohon peningkatan kuota atau cuba rantau berbeza
azd env set AZURE_LOCATION westus2
azd up
```

#### Isu 2: Model Tidak Tersedia di Wilayah
**Gejala:** Respons AI gagal atau ralat penghantaran model
**Penyelesaian:**
```bash
# Semak ketersediaan model mengikut wilayah
az cognitiveservices model list --location eastus

# Kemas kini kepada model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Isu 3: Masalah Kebenaran
**Gejala:** Ralat 403 Forbidden ketika memanggil perkhidmatan AI
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
**Langkah penyelidikan:**
1. Semak Application Insights untuk metrik prestasi
2. Semak metrik perkhidmatan OpenAI di portal Azure
3. Sahkan sambungan rangkaian dan latensi

**Penyelesaian:**
- Laksanakan penampan bagi pertanyaan biasa
- Gunakan model OpenAI yang sesuai untuk kes penggunaan anda
- Pertimbangkan replika bacaan untuk senario beban tinggi

### **Latihan Makmal 6.1: Cabaran Debugging**

**Senario**: Penghantaran anda berjaya, tetapi aplikasi mengembalikan ralat 500.

**Tugas debugging:**
1. Semak log aplikasi
2. Sahkan sambungan perkhidmatan
3. Uji pengesahan
4. Semak konfigurasi

**Alat untuk digunakan:**
- `azd show` untuk gambaran keseluruhan penghantaran
- Portal Azure untuk log perkhidmatan terperinci
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Pengoptimuman

### Langkah 7.1: Sediakan Pemantauan Menyeluruh

1. **Cipta papan pemuka tersuai:**

Navigasi ke portal Azure dan cipta papan pemuka dengan:
- Bilangan permintaan OpenAI dan latensi
- Kadar ralat aplikasi
- Penggunaan sumber
- Penjejakan kos

2. **Tetapkan amaran:**
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
- Tetapkan amaran bajet
- Gunakan polisi penskalaan automatik
- Laksanakan penampan permintaan
- Pantau penggunaan token untuk OpenAI

### **Latihan Makmal 7.1: Pengoptimuman Prestasi**

**Tugas**: Optimumkan aplikasi AI anda untuk prestasi dan kos.

**Metik untuk diperbaiki:**
- Kurangkan masa respons purata sebanyak 20%
- Kurangkan kos bulanan sebanyak 15%
- Kekalkan uptime 99.9%

**Strategi untuk cuba:**
- Laksanakan penampan respons
- Optimumkan prompt untuk kecekapan token
- Gunakan SKU pengkomputeran yang sesuai
- Sediakan penskalaan automatik yang betul

## Cabaran Akhir: Pelaksanaan Sepanjang Proses

### Senario Cabaran

Anda ditugaskan untuk mencipta chatbot perkhidmatan pelanggan berkuasa AI yang sedia untuk produksi dengan keperluan berikut:

**Keperluan Fungsian:**
- Antara muka web untuk interaksi pelanggan
- Integrasi dengan Microsoft Foundry Models untuk respons
- Keupayaan carian dokumen menggunakan Azure AI Search
- Integrasi dengan pangkalan data pelanggan sedia ada
- Sokongan pelbagai bahasa

**Keperluan Bukan Fungsian:**
- Menangani 1000 pengguna serentak
- SLA uptime 99.9%
- Pematuhan SOC 2
- Kos di bawah $500/bulan
- Hantar ke pelbagai persekitaran (dev, staging, prod)

### Langkah Pelaksanaan

1. **Reka bentuk senibina**
2. **Cipta templat AZD**
3. **Laksanakan langkah keselamatan**
4. **Sediakan pemantauan dan amaran**
5. **Cipta saluran penghantaran**
6. **Dokumentasikan penyelesaian**

### Kriteria Penilaian

- ✅ **Fungsian**: Adakah ia memenuhi semua keperluan?
- ✅ **Keselamatan**: Adakah amalan terbaik dilaksanakan?
- ✅ **Skalabiliti**: Bolehkah ia menangani beban?
- ✅ **Pengurusan**: Adakah kod dan infrastruktur tersusun baik?
- ✅ **Kos**: Adakah ia kekal dalam bajet?

## Sumber Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Perkhidmatan Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templat Contoh
- [Aplikasi Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Permulaan Pantas Aplikasi Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Komuniti
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sijil Penyertaan

Tahniah! Anda telah menyelesaikan Bengkel AI. Anda kini sepatutnya boleh:

- ✅ Menukar aplikasi AI sedia ada kepada templat AZD
- ✅ Melaksanakan aplikasi AI yang sedia untuk pengeluaran
- ✅ Melaksanakan amalan keselamatan terbaik untuk beban kerja AI
- ✅ Memantau dan mengoptimumkan prestasi aplikasi AI
- ✅ Menyelesaikan masalah pengeluaran biasa

### Langkah Seterusnya
1. Gunakan corak ini untuk projek AI anda sendiri
2. Sumbangkan templat kembali kepada komuniti
3. Sertai Microsoft Foundry Discord untuk sokongan berterusan
4. Terokai topik lanjutan seperti pengeluaran berbilang wilayah

---

**Maklum Balas Bengkel**: Bantu kami memperbaiki bengkel ini dengan berkongsi pengalaman anda di [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI Pertama
- **⬅️ Sebelum**: [Pengeluaran Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI untuk Pengeluaran](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlukan Bantuan?** Sertai komuniti kami untuk sokongan dan perbincangan tentang AZD dan pengeluaran AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->