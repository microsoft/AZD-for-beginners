# Projek Pertama Anda - Tutorial Hands-On

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Selamat datang ke projek CLI Pembangun Azure pertama anda! Tutorial hands-on yang komprehensif ini memberikan panduan lengkap tentang cara membuat, menyebar, dan mengurus aplikasi full-stack di Azure menggunakan azd. Anda akan bekerja dengan aplikasi todo sebenar yang termasuk frontend React, backend API Node.js, dan pangkalan data MongoDB.

## Matlamat Pembelajaran

Dengan menyelesaikan tutorial ini, anda akan:
- Menguasai aliran kerja inisialisasi projek azd menggunakan templat
- Memahami struktur projek Azure Developer CLI dan fail konfigurasi
- Melaksanakan penyebaran aplikasi penuh ke Azure dengan penyediaan infrastruktur
- Melaksanakan kemas kini aplikasi dan strategi penyebaran semula
- Menguruskan pelbagai persekitaran bagi pembangunan dan persediaan
- Menggunakan amalan pembersihan sumber dan pengurusan kos

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Menginisialisasi dan mengkonfigurasi projek azd dari templat secara berdikari
- Melayari dan mengubah suai struktur projek azd dengan berkesan
- Menyebar aplikasi full-stack ke Azure menggunakan arahan tunggal
- Menyelesaikan isu penyebaran biasa dan masalah pengesahan
- Menguruskan banyak persekitaran Azure untuk pelbagai tahap penyebaran
- Melaksanakan aliran kerja penyebaran berterusan untuk kemas kini aplikasi

## Memulakan

### Senarai Semak Pra-syarat
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](installation.md))
- ✅ Azure CLI dipasang dan disahkan
- ✅ Git dipasang pada sistem anda
- ✅ Node.js 16+ (untuk tutorial ini)
- ✅ Visual Studio Code (disyorkan)

### Sahkan Persediaan Anda
```bash
# Semak pemasangan azd
azd version
```
### Sahkan pengesahan Azure

```bash
az account show
```

### Semak versi Node.js
```bash
node --version
```

## Langkah 1: Pilih dan Inisialisasi Templat

Mari mulakan dengan templat aplikasi todo yang popular yang termasuk frontend React dan backend API Node.js.

```bash
# Layari templat yang tersedia
azd template list

# Mulakan templat aplikasi todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ikuti arahan:
# - Masukkan nama persekitaran: "dev"
# - Pilih langganan (jika anda mempunyai lebih dari satu)
# - Pilih wilayah: "East US 2" (atau wilayah pilihan anda)
```

### Apa yang Baru Berlaku?
- Memuat turun kod templat ke direktori tempatan anda
- Membuat fail `azure.yaml` dengan definisi perkhidmatan
- Menyediakan kod infrastruktur dalam direktori `infra/`
- Membuat konfigurasi persekitaran

## Langkah 2: Terokai Struktur Projek

Mari periksa apa yang azd cipta untuk kita:

```bash
# Lihat struktur projek
tree /f   # Windows
# atau
find . -type f | head -20   # macOS/Linux
```

Anda akan nampak:
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

### Fail Utama Untuk Difahami

**azure.yaml** - Teras projek azd anda:
```bash
# Lihat konfigurasi projek
cat azure.yaml
```

**infra/main.bicep** - Definisi infrastruktur:
```bash
# Lihat kod infrastruktur
head -30 infra/main.bicep
```

## Langkah 3: Sesuaikan Projek Anda (Pilihan)

Sebelum menyebar, anda boleh mengubah suai aplikasi:

### Ubahsuai Frontend
```bash
# Buka komponen aplikasi React
code src/web/src/App.tsx
```

Buat perubahan ringkas:
```typescript
// Cari tajuk dan tukarkannya
<h1>My Awesome Todo App</h1>
```

### Konfigurasi Pembolehubah Persekitaran
```bash
# Tetapkan pembolehubah persekitaran tersuai
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Lihat semua pembolehubah persekitaran
azd env get-values
```

## Langkah 4: Sebar ke Azure

Kini bahagian yang menarik - sebarkan semuanya ke Azure!

```bash
# Memasang infrastruktur dan aplikasi
azd up

# Arahan ini akan:
# 1. Menyediakan sumber Azure (Perkhidmatan Aplikasi, Cosmos DB, dll.)
# 2. Membangunkan aplikasi anda
# 3. Memasang ke sumber yang disediakan
# 4. Memaparkan URL aplikasi
```

### Apa yang Berlaku Semasa Penyebaran?

Perintah `azd up` melakukan langkah berikut:
1. **Penyediaan** (`azd provision`) - Membina sumber Azure
2. **Pakej** - Membina kod aplikasi anda
3. **Penyebaran** (`azd deploy`) - Menyebar kod ke sumber Azure

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
Klik pada URL yang diberikan dalam output penyebaran, atau dapatkannya bila-bila masa:
```bash
# Dapatkan titik akhir aplikasi
azd show

# Buka aplikasi dalam pelayar anda
azd show --output json | jq -r '.services.web.endpoint'
```

### Uji Aplikasi Todo
1. **Tambah item todo** - Klik "Tambah Todo" dan masukkan tugasan
2. **Tandakan selesai** - Tandakan item yang telah disiapkan
3. **Padam item** - Keluarkan todo yang tidak lagi diperlukan

### Pantau Aplikasi Anda
```bash
# Buka portal Azure untuk sumber anda
azd monitor

# Lihat log aplikasi
azd monitor --logs

# Lihat metrik langsung
azd monitor --live
```

## Langkah 6: Buat Perubahan dan Sebar Semula

Mari buat perubahan dan lihat betapa mudahnya mengemas kini:

### Ubahsuai API
```bash
# Sunting kod API
code src/api/src/routes/lists.js
```

Tambah header respons tersuai:
```javascript
// Cari pengendali laluan dan tambah:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Sebar Hanya Perubahan Kod
```bash
# Hanya gunakan kod aplikasi (langkau infrastruktur)
azd deploy

# Ini jauh lebih cepat daripada 'azd up' kerana infrastruktur sudah wujud
```

## Langkah 7: Uruskan Pelbagai Persekitaran

Cipta persekitaran persediaan untuk menguji perubahan sebelum produksi:

```bash
# Cipta persekitaran staging baru
azd env new staging

# Lancarkan ke staging
azd up

# Beralih kembali ke persekitaran dev
azd env select dev

# Senaraikan semua persekitaran
azd env list
```

### Perbandingan Persekitaran
```bash
# Lihat persekitaran dev
azd env select dev
azd show

# Lihat persekitaran staging
azd env select staging
azd show
```

## Langkah 8: Bersihkan Sumber

Apabila anda selesai bereksperimen, bersihkan untuk mengelakkan caj berterusan:

```bash
# Padam semua sumber Azure untuk persekitaran semasa
azd down

# Paksa padam tanpa pengesahan dan bersihkan sumber yang dipadam lembut
azd down --force --purge

# Padam persekitaran tertentu
azd env select staging
azd down --force --purge
```

## Aplikasi Klasik vs. Aplikasi Dipacu AI: Aliran Kerja Sama

Anda baru sahaja menyebarkan aplikasi web tradisional. Tetapi bagaimana jika anda ingin menyebarkan aplikasi dipacu AI — seperti aplikasi chat yang disokong oleh Microsoft Foundry Models?

Berita baik: **aliran kerjanya adalah sama.**

| Langkah | Aplikasi Todo Klasik | Aplikasi Chat AI |
|------|-----------------|-------------|
| Inisialisasi | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Sahkan | `azd auth login` | `azd auth login` |
| Sebar | `azd up` | `azd up` |
| Pantau | `azd monitor` | `azd monitor` |
| Bersihkan | `azd down --force --purge` | `azd down --force --purge` |

Perbezaan satu-satunya adalah **templat** yang anda mula gunakan. Templat AI termasuk infrastruktur tambahan (seperti sumber Microsoft Foundry Models atau indeks AI Search), tetapi azd menguruskan semua itu untuk anda. Anda tidak perlu belajar arahan baru, menggunakan alat berbeza, atau mengubah cara anda melihat penyebaran.

Ini adalah prinsip teras azd: **satu aliran kerja, apa-apa beban kerja.** Kemahiran yang anda praktikkan dalam tutorial ini — menginisialisasi, menyebar, memantau, menyebar semula, dan membersihkan — digunakan sama rata untuk aplikasi dan agen AI.

---

## Apa yang Anda Telah Pelajari

Tahniah! Anda telah berjaya:
- ✅ Menginisialisasi projek azd dari templat
- ✅ Menerokai struktur projek dan fail utama
- ✅ Menyebar aplikasi full-stack ke Azure
- ✅ Membuat perubahan kod dan menyebar semula
- ✅ Menguruskan pelbagai persekitaran
- ✅ Membersihkan sumber

## 🎯 Latihan Pengesahan Kemahiran

### Latihan 1: Sebar Templat Berbeza (15 minit)
**Matlamat**: Demonstrasi penguasaan azd init dan aliran kerja penyebaran

```bash
# Cuba tumpukan Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Sahkan penyebaran
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Bersihkan kembali
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Aplikasi disebar tanpa ralat
- [ ] Boleh akses URL aplikasi dalam pelayar
- [ ] Aplikasi berfungsi dengan betul (tambah/padam todo)
- [ ] Berjaya membersihkan semua sumber

### Latihan 2: Sesuaikan Konfigurasi (20 minit)
**Matlamat**: Latihan konfigurasi pembolehubah persekitaran

```bash
cd my-first-azd-app

# Cipta persekitaran tersuai
azd env new custom-config

# Tetapkan pembolehubah tersuai
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Sahkan pembolehubah
azd env get-values | grep APP_TITLE

# Lancarkan dengan konfigurasi tersuai
azd up
```

**Kriteria Kejayaan:**
- [ ] Persekitaran tersuai berjaya dibuat
- [ ] Pembolehubah persekitaran ditetapkan dan boleh diambil balik
- [ ] Aplikasi disebar dengan konfigurasi tersuai
- [ ] Boleh sahkan tetapan tersuai dalam aplikasi yang disebar

### Latihan 3: Aliran Kerja Pelbagai Persekitaran (25 minit)
**Matlamat**: Kuasai pengurusan persekitaran dan strategi penyebaran

```bash
# Cipta persekitaran dev
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Catat URL dev
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Cipta persekitaran staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Catat URL staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Bandingkan persekitaran
azd env list

# Uji kedua-dua persekitaran
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Bersihkan kedua-duanya
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Dua persekitaran dibuat dengan konfigurasi berlainan
- [ ] Kedua-dua persekitaran berjaya disebar
- [ ] Boleh bertukar persekitaran menggunakan `azd env select`
- [ ] Pembolehubah persekitaran berbeza antara persekitaran
- [ ] Berjaya membersihkan kedua-dua persekitaran

## 📊 Kemajuan Anda

**Masa Dilaburkan**: ~60-90 minit  
**Kemahiran Diperoleh**:
- ✅ Inisialisasi projek berasaskan templat
- ✅ Penyediaan sumber Azure
- ✅ Aliran kerja penyebaran aplikasi
- ✅ Pengurusan persekitaran
- ✅ Pengurusan konfigurasi
- ✅ Pembersihan sumber dan pengurusan kos

**Tahap Seterusnya**: Anda bersedia untuk [Panduan Konfigurasi](configuration.md) untuk mempelajari corak konfigurasi lanjutan!

## Penyelesaian Masalah Biasa

### Ralat Pengesahan
```bash
# Sahkan semula dengan Azure
az login

# Sahkan akses langganan
az account show
```

### Kegagalan Penyebaran
```bash
# Dayakan log debug
export AZD_DEBUG=true
azd up --debug

# Lihat log aplikasi di Azure
azd monitor --logs

# Untuk Aplikasi Kontena, gunakan Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflik Nama Sumber
```bash
# Gunakan nama persekitaran yang unik
azd env new dev-$(whoami)-$(date +%s)
```

### Isu Port/Rangkaian
```bash
# Semak jika port tersedia
netstat -an | grep :3000
netstat -an | grep :3100
```

## Langkah Seterusnya

Kini anda telah menyelesaikan projek pertama anda, terokai topik lanjutan ini:

### 1. Sesuaikan Infrastruktur
- [Infrastruktur sebagai Kod](../chapter-04-infrastructure/provisioning.md)
- [Tambah pangkalan data, storan, dan perkhidmatan lain](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sediakan CI/CD
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) - Aliran kerja CI/CD Lengkap
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasi saluran

### 3. Amalan Terbaik Produksi
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) - Keselamatan, prestasi, dan pemantauan

### 4. Terokai Lebih Banyak Templat
```bash
# Layari templat mengikut kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Cuba timbunan teknologi yang berbeza
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
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
- [Templat Komuniti](https://github.com/Azure-Samples/azd-templates)
- [Corak Perusahaan](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tahniah telah melengkapkan projek azd pertama anda!** Kini anda bersedia untuk membina dan menyebar aplikasi hebat di Azure dengan yakin.

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Pelajaran Seterusnya**: [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->