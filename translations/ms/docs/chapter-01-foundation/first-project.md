# Projek Pertama Anda - Tutorial Praktikal

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Mula Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Bawa Aplikasi Anda Sendiri](bring-your-own-app.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Selamat datang ke projek Azure Developer CLI pertama anda! Anda akan melancarkan aplikasi todo dengan frontend React, API Node.js, dan Azure Cosmos DB. Templat ini mengekalkan nama sejarah `todo-nodejs-mongo`; infrastruktur semasanya menggunakan Cosmos DB untuk NoSQL, jadi periksa README yang dimuat turun dan `infra/` dan jangan membuat andaian API pangkalan data dari nama.

> Disemak dengan `azd 1.37.2` dan templat awam pada November 2026. Contoh di bawah menggunakan Bash; pengekstrakan JSON juga memerlukan `jq`. Penempatan Azure akan dikenakan caj dan tidak dilakukan semasa semakan ini.

## Matlamat Pembelajaran

Dengan menamatkan tutorial ini, anda akan:
- Menguasai aliran kerja inisialisasi projek azd menggunakan templat
- Memahami struktur projek Azure Developer CLI dan fail konfigurasi
- Melaksanakan penyediaan aplikasi lengkap ke Azure dengan penyediaan infrastruktur
- Melaksanakan kemas kini aplikasi dan strategi pelancaran semula
- Mengurus pelbagai persekitaran untuk pembangunan dan penstagingan
- Mengamalkan pembersihan sumber dan amalan pengurusan kos

## Hasil Pembelajaran

Selepas selesai, anda akan dapat:
- Inisialisasi dan konfigurasi projek azd dari templat secara berdikari
- Menavigasi dan mengubahsuai struktur projek azd dengan berkesan
- Melancarkan aplikasi full-stack ke Azure menggunakan arahan tunggal
- Menyelesaikan isu biasa pelancaran dan masalah pengesahan
- Mengurus pelbagai persekitaran Azure untuk tahap pelancaran berbeza
- Melaksanakan aliran kerja pelancaran berterusan untuk kemas kini aplikasi

## Mula

### Senarai Semak Prasyarat
- ✅ Azure Developer CLI telah dipasang ([Panduan Pemasangan](installation.md))
- ✅ Pengesahan AZD selesai dengan `azd auth login`
- ✅ Git telah dipasang pada sistem anda
- ✅ Node.js 22 LTS (atau versi yang disokong diperlukan oleh templat yang dimuat turun)
- ✅ Visual Studio Code (disyorkan)

Sebelum meneruskan, jalankan validator persediaan dari akar repositori:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Sahkan Persediaan Anda
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Sahkan pengesahan Azure CLI pilihan

```bash
az account show
```

### Semak versi Node.js
```bash
node --version
```

## Langkah 1: Pilih dan Inisialisasi Templat

Mari mulakan dengan templat aplikasi todo yang popular yang merangkumi frontend React dan backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Apa yang Baru Berlaku?
- Memuat turun kod templat ke direktori tempatan anda
- Mencipta fail `azure.yaml` dengan definisi perkhidmatan
- Menyediakan kod infrastruktur dalam direktori `infra/`
- Mencipta konfigurasi persekitaran

## Langkah 2: Terokai Struktur Projek

Mari kita periksa apa yang azd telah hasilkan untuk kita:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Anda sepatutnya melihat:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Fail Utama untuk Difahami

**azure.yaml** - Inti projek azd anda:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definisi infrastruktur:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Langkah 3: Sesuaikan Projek Anda (Pilihan)

Sebelum melancarkan, anda boleh sesuaikan aplikasi:

### Ubahsuai Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Buat perubahan ringkas:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Konfigurasi Pembolehubah Persekitaran
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Dua nilai khusus ini bersifat penyimpanan tempatan sahaja. Templat stok tidak menggunakan `WEBSITE_TITLE` atau `API_VERSION`, jadi ia tidak mengubah aplikasi. Suntingan sumber eksplisit di atas mengubah tajuk yang dipaparkan.

## Langkah 4: Lancarkan ke Azure

Kini bahagian menarik - lancarkan semuanya ke Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Apa yang Berlaku Semasa Pelancaran?

Aliran kerja menyediakan infrastruktur dan membungkus/melancarkan kod. Susunan tepat boleh disesuaikan melalui `workflows.up` dalam `azure.yaml`; templat ini menetapkan penyediaan diikuti pelancaran. Jangan bergantung pada satu susunan universal untuk setiap templat.

### Output Dijangka
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Langkah 5: Uji Aplikasi Anda

### Akses Aplikasi Anda
Klik pada URL yang diberikan dalam output pelancaran, atau dapatkannya bila-bila masa:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Uji Aplikasi Todo
1. **Tambah item todo** - Klik "Tambah Todo" dan masukkan tugasan
2. **Tandakan sebagai lengkap** - Tandakan item yang telah siap
3. **Padam item** - Buang todo yang tidak lagi diperlukan

### Pantau Aplikasi Anda
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Sahkan Pelancaran Anda

Sebelum meneruskan, jalankan senarai semak cepat ini untuk mengesahkan semuanya berfungsi - jangan anggap "pelancaran berjaya" bermakna "aplikasi berfungsi":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Pelancaran disahkan apabila:**
- ✅ `azd show` menyenaraikan URL titik akhir yang boleh dicapai
- ✅ URL dibuka dalam pelayar anda tanpa ralat
- ✅ Ciri utama berfungsi (tambah/selesai/padam todo)
- ✅ `azd monitor --logs` menunjukkan permintaan tiba tanpa ralat yang tidak dijangka

Jika sebarang semakan gagal, lompat ke [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md).

## Langkah 6: Buat Perubahan dan Pelancar Semula

Mari buat perubahan dan lihat betapa mudahnya mengemas kini:

### Ubahsuai API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Tambah header respons tersuai:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Lancarkan Hanya Perubahan Kod
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Langkah 7: Urus Pelbagai Persekitaran

Cipta persekitaran penstagingan untuk menguji perubahan sebelum produksi:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Perbandingan Persekitaran
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Langkah 8: Bersihkan Sumber

Apabila selesai bereksperimen, bersihkan untuk mengelakkan caj berterusan:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Aplikasi Klasik vs. Aplikasi Berkuasa AI: Aliran Kerja Sama

Anda baru sahaja melancarkan aplikasi web tradisional. Tetapi bagaimana jika anda mahu melancarkan aplikasi bertenaga AI - contohnya, aplikasi sembang yang disokong oleh Model Microsoft Foundry?

Berita baik: **aliran kerja adalah sama.**

| Langkah | Aplikasi Todo Klasik | Aplikasi Sembang AI |
|------|-----------------|-------------|
| Inisialisasi (direktori kosong) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Pengesahan | `azd auth login` | `azd auth login` |
| Pelancaran | `azd up` | `azd up` |
| Pemantauan | `azd monitor` | `azd monitor` |
| Pembersihan | `azd down --force --purge` | `azd down --force --purge` |

Arahan kitar hayat adalah sama, tetapi prasyarat berbeza. Templat AI mungkin memerlukan akses model, kuota serantau, pencernaan data, dan konfigurasi tambahan. Baca README sebelum pelancaran; `azd up` tidak boleh menyediakan kebenaran atau kuota yang hilang.

Ini adalah prinsip teras azd: **satu aliran kerja, apa-apa beban kerja.** Kemahiran yang anda amalkan dalam tutorial ini—inisialisasi, pelancaran, pemantauan, pelancaran semula, dan pembersihan—digunakan sama rata untuk aplikasi dan agen AI.

---

## Apa yang Anda Telah Pelajari

Tahniah! Anda telah berjaya:
- ✅ Menginisialisasi projek azd dari templat
- ✅ Meneroka struktur projek dan fail utama
- ✅ Melancarkan aplikasi full-stack ke Azure
- ✅ Melakukan perubahan kod dan melancarkan semula
- ✅ Mengurus pelbagai persekitaran
- ✅ Membersihkan sumber

## 🎯 Latihan Pengesahan Kemahiran

### Latihan 1: Lancarkan Templat Berbeza (15 minit)
**Matlamat**: Menunjukkan penguasaan azd init dan aliran kerja pelancaran

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Aplikasi dilancarkan tanpa ralat
- [ ] Boleh akses URL aplikasi dalam pelayar
- [ ] Aplikasi berfungsi dengan betul (tambah/tanggalkan todo)
- [ ] Berjaya membersihkan semua sumber

### Latihan 2: Sesuaikan Konfigurasi (20 minit)
**Matlamat**: Berlatih penyimpanan nilai persekitaran tempatan tanpa mengelirukan dengan konfigurasi masa jalan

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Kriteria Kejayaan:**
- [ ] Persekitaran tersuai berjaya dicipta
- [ ] Pembolehubah persekitaran ditetapkan dan boleh diperoleh semula
- [ ] `azd env get-value APP_TITLE` mencetak `My Custom Todo App`
- [ ] Boleh terangkan kenapa nilai ini tidak mengubah aplikasi stok melainkan kod/infrastruktur menggunakannya

### Latihan 3: Aliran Kerja Multi-Persekitaran (25 minit)
**Matlamat**: Menguasai pengurusan persekitaran dan strategi pelancaran

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Dua persekitaran dicipta dengan konfigurasi berbeza
- [ ] Kedua-dua persekitaran berjaya dilancarkan
- [ ] Boleh bertukar antara persekitaran menggunakan `azd env select`
- [ ] Pembolehubah persekitaran berbeza antara persekitaran
- [ ] Berjaya membersihkan kedua-dua persekitaran

## 📊 Kemajuan Anda

**Masa Dilaburkan**: ~60-90 minit  
**Kemahiran Diperoleh**:
- ✅ Inisialisasi projek berasaskan templat
- ✅ Penyediaan sumber Azure
- ✅ Aliran kerja pelancaran aplikasi
- ✅ Pengurusan persekitaran
- ✅ Pengurusan konfigurasi
- ✅ Pembersihan sumber dan pengurusan kos

**Tahap Seterusnya**: Anda sudah bersedia untuk [Panduan Konfigurasi](../chapter-03-configuration/configuration.md) untuk mempelajari corak konfigurasi lanjutan!

## Penyelesaian Masalah Biasa

### Ralat Pengesahan
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Kegagalan Pelancaran
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflik Nama Sumber
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Isu Port/Rangkaian
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Langkah Seterusnya

Kini anda telah menamatkan projek pertama, terokai topik lanjutan ini:

### 1. Sesuaikan Infrastruktur
- [Infrastruktur sebagai Kod](../chapter-04-infrastructure/provisioning.md)
- [Tambah infrastruktur pangkalan data](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Sediakan CI/CD
- [Panduan Pelancaran](../chapter-04-infrastructure/deployment-guide.md) - Aliran kerja CI/CD lengkap
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasi paip

### 3. Amalan Terbaik Produksi
- [Panduan Pelancaran](../chapter-04-infrastructure/deployment-guide.md) - Keselamatan, prestasi, dan pemantauan

### 4. Terokai Lebih Banyak Templat
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Sumber Tambahan

### Bahan Pembelajaran
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Rangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komuniti & Sokongan
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Komuniti Pembangun Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templat & Contoh
- [Galeri Templat Rasmi](https://azure.github.io/awesome-azd/)
- [Sumbangan Templat Komuniti](https://github.com/Azure/awesome-azd)
- [Sumber Templat Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Tahniah kerana menamatkan projek azd pertama anda!** Anda kini bersedia untuk membina dan melancarkan aplikasi hebat di Azure dengan penuh keyakinan.

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Mula Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Bawa Aplikasi Anda Sendiri](bring-your-own-app.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->