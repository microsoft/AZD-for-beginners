<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:29:16+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ms"
}
-->
# Projek Pertama Anda - Tutorial Praktikal

## Pengenalan

Selamat datang ke projek pertama anda menggunakan Azure Developer CLI! Tutorial praktikal ini memberikan panduan lengkap untuk mencipta, melancarkan, dan mengurus aplikasi full-stack di Azure menggunakan azd. Anda akan bekerja dengan aplikasi todo sebenar yang merangkumi frontend React, backend API Node.js, dan pangkalan data MongoDB.

## Matlamat Pembelajaran

Dengan menyelesaikan tutorial ini, anda akan:
- Menguasai aliran kerja inisialisasi projek azd menggunakan templat
- Memahami struktur projek dan fail konfigurasi Azure Developer CLI
- Melaksanakan pelancaran aplikasi lengkap ke Azure dengan penyediaan infrastruktur
- Melaksanakan kemas kini aplikasi dan strategi pelancaran semula
- Menguruskan pelbagai persekitaran untuk pembangunan dan staging
- Menerapkan amalan pembersihan sumber dan pengurusan kos

## Hasil Pembelajaran

Selepas selesai, anda akan dapat:
- Memulakan dan mengkonfigurasi projek azd daripada templat secara bebas
- Menavigasi dan mengubah struktur projek azd dengan berkesan
- Melancarkan aplikasi full-stack ke Azure menggunakan arahan tunggal
- Menyelesaikan masalah pelancaran biasa dan isu pengesahan
- Menguruskan pelbagai persekitaran Azure untuk peringkat pelancaran yang berbeza
- Melaksanakan aliran kerja pelancaran berterusan untuk kemas kini aplikasi

## Memulakan

### Senarai Semak Prasyarat
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](installation.md))
- ✅ Azure CLI dipasang dan disahkan
- ✅ Git dipasang pada sistem anda
- ✅ Node.js 16+ (untuk tutorial ini)
- ✅ Visual Studio Code (disyorkan)

### Sahkan Persediaan Anda
```bash
# Check azd installation
azd version
```
### Sahkan pengesahan Azure

```bash
az account show
```

### Periksa versi Node.js
```bash
node --version
```

## Langkah 1: Pilih dan Inisialisasi Templat

Mari mulakan dengan templat aplikasi todo popular yang merangkumi frontend React dan backend API Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Apa yang Baru Berlaku?
- Kod templat dimuat turun ke direktori tempatan anda
- Fail `azure.yaml` dengan definisi perkhidmatan dicipta
- Kod infrastruktur disediakan dalam direktori `infra/`
- Konfigurasi persekitaran dicipta

## Langkah 2: Terokai Struktur Projek

Mari kita periksa apa yang telah azd cipta untuk kita:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Anda sepatutnya melihat:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
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

Sebelum melancarkan, anda boleh menyesuaikan aplikasi:

### Ubah Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Buat perubahan ringkas:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigurasi Pembolehubah Persekitaran
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Langkah 4: Lancarkan ke Azure

Sekarang bahagian yang menarik - lancarkan semuanya ke Azure!

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

Arahan `azd up` melaksanakan langkah-langkah berikut:
1. **Provision** (`azd provision`) - Mencipta sumber Azure
2. **Package** - Membina kod aplikasi anda
3. **Deploy** (`azd deploy`) - Melancarkan kod ke sumber Azure

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
Klik pada URL yang disediakan dalam output pelancaran, atau dapatkan bila-bila masa:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Uji Aplikasi Todo
1. **Tambah item todo** - Klik "Add Todo" dan masukkan tugas
2. **Tandakan sebagai selesai** - Tandakan item yang telah selesai
3. **Padam item** - Hapuskan todo yang tidak lagi diperlukan

### Pantau Aplikasi Anda
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Langkah 6: Buat Perubahan dan Lancarkan Semula

Mari buat perubahan dan lihat betapa mudahnya untuk mengemas kini:

### Ubah API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Tambah header respons tersuai:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Lancarkan Semula Hanya Perubahan Kod
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Langkah 7: Uruskan Pelbagai Persekitaran

Cipta persekitaran staging untuk menguji perubahan sebelum pengeluaran:

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

Apabila anda selesai bereksperimen, bersihkan untuk mengelakkan caj berterusan:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Apa yang Anda Pelajari

Tahniah! Anda telah berjaya:
- Memulakan projek azd daripada templat
- Meneroka struktur projek dan fail utama
- Melancarkan aplikasi full-stack ke Azure
- Membuat perubahan kod dan melancarkan semula
- Menguruskan pelbagai persekitaran
- Membersihkan sumber

## Menyelesaikan Masalah Biasa

### Kesalahan Pengesahan
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Kegagalan Pelancaran
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
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

Sekarang anda telah menyelesaikan projek pertama anda, terokai topik lanjutan ini:

### 1. Sesuaikan Infrastruktur
- [Infrastructure as Code](../deployment/provisioning.md)
- [Tambah pangkalan data, storan, dan perkhidmatan lain](../deployment/provisioning.md#adding-services)

### 2. Sediakan CI/CD
- [Integrasi GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Amalan Terbaik Pengeluaran
- [Konfigurasi keselamatan](../deployment/best-practices.md#security)
- [Pengoptimuman prestasi](../deployment/best-practices.md#performance)
- [Pemantauan dan log](../deployment/best-practices.md#monitoring)

### 4. Terokai Lebih Banyak Templat
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Sumber Tambahan

### Bahan Pembelajaran
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kerangka Well-Architected Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Komuniti & Sokongan
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Komuniti Pembangun Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templat & Contoh
- [Galeri Templat Rasmi](https://azure.github.io/awesome-azd/)
- [Templat Komuniti](https://github.com/Azure-Samples/azd-templates)
- [Corak Perusahaan](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tahniah kerana menyelesaikan projek azd pertama anda!** Anda kini bersedia untuk membina dan melancarkan aplikasi hebat di Azure dengan yakin.

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Konfigurasi](configuration.md)
- **Pelajaran Seterusnya**: [Panduan Pelancaran](../deployment/deployment-guide.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.