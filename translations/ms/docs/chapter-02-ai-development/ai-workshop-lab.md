# Makmal Bengkel AI: Menjadikan Penyelesaian AI Anda Boleh Dideploy dengan AZD

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Sebelumnya**: [Penggunaan Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Gambaran Keseluruhan Bengkel

Makmal praktikal ini membimbing pembangun melalui proses mengambil templat AI sedia ada dan mendeploynya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari corak penting untuk deployment AI produksi menggunakan perkhidmatan Microsoft Foundry.

**Tempoh:** 2-3 jam  
**Tahap:** Sederhana  
**Prasyarat:** Pengetahuan asas Azure, kefahaman konsep AI/ML

## 🎓 Objektif Pembelajaran

Menjelang akhir bengkel ini, anda akan dapat:  
- ✅ Menukar aplikasi AI sedia ada untuk menggunakan templat AZD  
- ✅ Mengkonfigurasi perkhidmatan Microsoft Foundry dengan AZD  
- ✅ Melaksanakan pengurusan kelayakan yang selamat untuk perkhidmatan AI  
- ✅ Mendeploy aplikasi AI siap produksi dengan pemantauan  
- ✅ Menyelesaikan isu deployment AI yang biasa

## Prasyarat

### Alat Diperlukan
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) dipasang  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) dipasang  
- [Git](https://git-scm.com/) dipasang  
- Penyunting kod (disyorkan VS Code)

### Sumber Azure
- Langganan Azure dengan akses penyumbang  
- Akses ke perkhidmatan Model Microsoft Foundry (atau keupayaan untuk memohon akses)  
- Kebenaran untuk buat kumpulan sumber

### Pengetahuan Prasyarat
- Kefahaman asas perkhidmatan Azure  
- Kefahaman antara muka baris arahan  
- Konsep asas AI/ML (API, model, prompt)

## Persediaan Makmal

### Langkah 1: Persiapan Persekitaran

1. **Sahkan pemasangan alat:**
```bash
# Semak pemasangan AZD
azd version

# Semak Azure CLI
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

Terokai fail utama dalam templat AZD bersedia AI:

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

**Corak AI utama untuk dikenal pasti:**
- Penyediaan perkhidmatan Model Microsoft Foundry  
- Integrasi Cognitive Search  
- Pengurusan kunci yang selamat  
- Konfigurasi keselamatan rangkaian

### **Perbincangan:** Mengapa Corak Ini Penting untuk AI

- **Kebergantungan Perkhidmatan**: Aplikasi AI sering memerlukan berbilang perkhidmatan bekerjasama  
- **Keselamatan**: Kunci API dan titik akhir perlu dikendalikan dengan selamat  
- **Skalabiliti**: Beban kerja AI mempunyai keperluan penskalaan unik  
- **Pengurusan Kos**: Perkhidmatan AI boleh menjadi mahal jika tidak dikonfigurasi dengan betul

## Modul 2: Deploy Aplikasi AI Pertama Anda

### Langkah 2.1: Inisialisasi Persekitaran

1. **Buat persekitaran AZD baru:**
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

### Langkah 2.2: Deploy Infrastruktur dan Aplikasi

1. **Deploy dengan AZD:**
```bash
azd up
```

**Apa yang berlaku semasa `azd up`:**
- ✅ Menyediakan perkhidmatan Model Microsoft Foundry  
- ✅ Mencipta perkhidmatan Cognitive Search  
- ✅ Menyediakan App Service untuk aplikasi web  
- ✅ Mengkonfigurasi rangkaian dan keselamatan  
- ✅ Mendeploy kod aplikasi  
- ✅ Menyediakan pemantauan dan perekodan log

2. **Pantau kemajuan deployment** dan ambil perhatian sumber yang sedang dibuat.

### Langkah 2.3: Sahkan Deployment Anda

1. **Periksa sumber yang telah dideloy:**
```bash
azd show
```

2. **Buka aplikasi yang telah dideloy:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Uji fungsi AI:**
   - Navigasi ke aplikasi web  
   - Cuba pertanyaan contoh  
   - Sahkan respons AI berfungsi

### **Latihan Makmal 2.1: Latihan Penyelesaian Masalah**

**Senario**: Deployment anda berjaya tetapi AI tidak memberi respons.

**Isu biasa untuk diperiksa:**
1. **Kunci API OpenAI**: Sahkan ia telah diset dengan betul  
2. **Ketersediaan model**: Periksa jika rantau anda menyokong model tersebut  
3. **Sambungan rangkaian**: Pastikan perkhidmatan boleh berkomunikasi  
4. **Kebenaran RBAC**: Sahkan app boleh akses OpenAI

**Arahan debugging:**
```bash
# Semak pembolehubah persekitaran
azd env get-values

# Lihat log penyebaran
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Semak status penyebaran OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Menyesuaikan Aplikasi AI untuk Keperluan Anda

### Langkah 3.1: Ubahsuai Konfigurasi AI

1. **Kemaskini model OpenAI:**
```bash
# Tukar kepada model yang berbeza (jika ada di kawasan anda)
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

**Amalan Terbaik**: Konfigurasi berbeza untuk pembangunan berbanding produksi.

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

**Cabaran**: Konfigurasi templat untuk pembangunan yang kos efektif.

**Tugas:**
1. Kenal pasti SKU mana yang boleh ditetapkan kepada tahap percuma/asas  
2. Konfigurasikan pembolehubah persekitaran untuk kos minimum  
3. Deploy dan bandingkan kos dengan konfigurasi produksi

**Petunjuk penyelesaian:**
- Gunakan tahap F0 (percuma) untuk Cognitive Services apabila boleh  
- Gunakan tahap Asas untuk Perkhidmatan Carian dalam pembangunan  
- Pertimbangkan menggunakan pelan Penggunaan untuk Functions

## Modul 4: Keselamatan dan Amalan Terbaik Produksi

### Langkah 4.1: Pengurusan Kelayakan Selamat

**Cabaran semasa**: Ramai aplikasi AI menyimpankan kunci API secara statik atau menggunakan storan tidak selamat.

**Penyelesaian AZD**: Identiti Terurus + Integrasi Key Vault.

1. **Semak konfigurasi keselamatan dalam templat anda:**
```bash
# Cari konfigurasi Key Vault dan Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Sahkan Identiti Terurus berfungsi:**
```bash
# Semak jika aplikasi web mempunyai konfigurasi identiti yang betul
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Langkah 4.2: Keselamatan Rangkaian

1. **Dayakan endpoint peribadi** (jika belum dikonfigurasi):

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

### Langkah 4.3: Pemantauan dan Kebolehperhathatan

1. **Konfigurasikan Application Insights:**
```bash
# Application Insights harus dikonfigurasikan secara automatik
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

**Tugas**: Semak deployment anda untuk amalan keselamatan terbaik.

**Senarai semak:**
- [ ] Tiada rahsia terbenam dalam kod atau konfigurasi  
- [ ] Identiti Terurus digunakan untuk pengesahan perkhidmatan-ke-perkhidmatan  
- [ ] Key Vault menyimpan konfigurasi sensitif  
- [ ] Akses rangkaian dihadkan dengan betul  
- [ ] Pemantauan dan perekodan log diaktifkan

## Modul 5: Menukar Aplikasi AI Sendiri

### Langkah 5.1: Lembaran Penilaian

**Sebelum menukar aplikasi anda**, jawab soalan berikut:

1. **Senibina Aplikasi:**  
   - Perkhidmatan AI apa yang aplikasi anda gunakan?  
   - Sumber pengkomputeran apa yang ia perlukan?  
   - Adakah ia memerlukan pangkalan data?  
   - Apakah kebergantungan antara perkhidmatan?

2. **Keperluan Keselamatan:**  
   - Data sensitif apa yang aplikasi anda kendalikan?  
   - Keperluan pematuhan apa yang anda ada?  
   - Adakah anda memerlukan rangkaian peribadi?

3. **Keperluan Skalabiliti:**  
   - Apakah beban jangkaan anda?  
   - Adakah anda perlu autoscaling?  
   - Adakah terdapat keperluan rantau?

### Langkah 5.2: Cipta Templat AZD Anda

**Ikuti corak ini untuk menukar aplikasi anda:**

1. **Buat struktur asas:**
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
- Model Microsoft Foundry untuk analisis kandungan  
- Document Intelligence untuk OCR  
- Akaun Penyimpanan untuk muat naik dokumen  
- Fungsi App untuk logik pemprosesan  
- Aplikasi web untuk antara muka pengguna

**Markah bonus:**  
- Tambah pengurusan ralat yang sesuai  
- Sertakan anggaran kos  
- Sediakan papan pemuka pemantauan

## Modul 6: Menyelesaikan Isu Biasa

### Isu Deployment Biasa

#### Isu 1: Kuota Perkhidmatan OpenAI Terlebih
**Gejala:** Deployment gagal dengan ralat kuota  
**Penyelesaian:**
```bash
# Semak kuota semasa
az cognitiveservices usage list --location eastus

# Mohon peningkatan kuota atau cuba wilayah lain
azd env set AZURE_LOCATION westus2
azd up
```

#### Isu 2: Model Tidak Tersedia di Rantau
**Gejala:** Respons AI gagal atau ralat deployment model  
**Penyelesaian:**
```bash
# Semak ketersediaan model mengikut wilayah
az cognitiveservices model list --location eastus

# Kemas kini kepada model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
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

### Isu Prestasi

#### Isu 4: Respons AI Perlahan
**Langkah penyiasatan:**  
1. Periksa Application Insights untuk metrik prestasi  
2. Semak metrik perkhidmatan OpenAI di portal Azure  
3. Sahkan sambungan dan latensi rangkaian

**Penyelesaian:**  
- Laksanakan caching untuk pertanyaan biasa  
- Gunakan model OpenAI yang sesuai untuk kes penggunaan anda  
- Pertimbangkan replika baca untuk senario beban tinggi

### **Latihan Makmal 6.1: Cabaran Debugging**

**Senario:** Deployment anda berjaya, tetapi aplikasi memberikan ralat 500.

**Tugas debugging:**  
1. Periksa log aplikasi  
2. Sahkan sambungan perkhidmatan  
3. Uji pengesahan  
4. Semak konfigurasi

**Alat yang digunakan:**  
- `azd show` untuk gambaran deployment  
- Portal Azure untuk log perkhidmatan terperinci  
- Application Insights untuk telemetri aplikasi

## Modul 7: Pemantauan dan Pengoptimuman

### Langkah 7.1: Sediakan Pemantauan Komprehensif

1. **Buat papan pemuka khusus:**

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

**Metrik untuk ditingkatkan:**  
- Kurangkan masa respons purata sebanyak 20%  
- Kurangkan kos bulanan sebanyak 15%  
- Kekalkan uptime 99.9%

**Strategi yang boleh dicuba:**  
- Laksanakan caching respons  
- Optimumkan prompt untuk kecekapan token  
- Gunakan SKU pengkomputeran yang sesuai  
- Sediakan autoscaling yang betul

## Cabaran Akhir: Pelaksanaan Sepenuhya

### Senario Cabaran

Anda ditugaskan mencipta chatbot perkhidmatan pelanggan berkuasa AI siap produksi dengan keperluan berikut:

**Keperluan Fungsi:**  
- Antara muka web untuk interaksi pelanggan  
- Integrasi dengan Microsoft Foundry Models untuk respons  
- Keupayaan carian dokumen menggunakan Cognitive Search  
- Integrasi dengan pangkalan data pelanggan sedia ada  
- Sokongan pelbagai bahasa

**Keperluan Bukan Fungsi:**  
- Mengendalikan 1000 pengguna serentak  
- SLA uptime 99.9%  
- Pematuhan SOC 2  
- Kos bawah $500/bulan  
- Deploy ke pelbagai persekitaran (dev, staging, prod)

### Langkah Pelaksanaan

1. **Reka senibina**  
2. **Cipta templat AZD**  
3. **Laksanakan langkah keselamatan**  
4. **Sediakan pemantauan dan amaran**  
5. **Cipta aliran deployment**  
6. **Dokumentasikan penyelesaian**

### Kriteria Penilaian

- ✅ **Fungsi**: Adakah memenuhi semua keperluan?  
- ✅ **Keselamatan**: Adakah amalan terbaik dilaksanakan?  
- ✅ **Skalabiliti**: Bolehkah ia mengendalikan beban?  
- ✅ **Pengurusan**: Adakah kod dan infrastruktur tersusun dengan baik?  
- ✅ **Kos**: Adakah ia dalam bajet?

## Sumber Tambahan

### Dokumentasi Microsoft
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Dokumentasi Perkhidmatan Model Microsoft Foundry](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Templat Contoh
- [Aplikasi Chat Model Microsoft Foundry](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)  
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Sumber Komuniti
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)  
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Sijil Penyelesaian

Tahniah! Anda telah menamatkan Makmal Bengkel AI. Anda kini seharusnya boleh:
- ✅ Tukar aplikasi AI sedia ada kepada templat AZD
- ✅ Lancarkan aplikasi AI yang sedia untuk produksi
- ✅ Laksanakan amalan terbaik keselamatan untuk beban kerja AI
- ✅ Pantau dan optima prestasi aplikasi AI
- ✅ Selesaikan masalah biasa pelancaran

### Langkah Seterusnya
1. Gunakan corak ini dalam projek AI anda sendiri
2. Sumbangkan templat kembali kepada komuniti
3. Sertai Microsoft Foundry Discord untuk sokongan berterusan
4. Terokai topik lanjutan seperti pelancaran pelbagai rantau

---

**Maklum Balas Bengkel**: Bantu kami meningkatkan bengkel ini dengan berkongsi pengalaman anda di [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Sebelumnya**: [Pelancaran Model AI](ai-model-deployment.md)
- **➡️ Seterusnya**: [Amalan Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlukan Bantuan?** Sertai komuniti kami untuk sokongan dan perbincangan mengenai AZD dan pelancaran AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat yang penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau tafsiran salah yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->