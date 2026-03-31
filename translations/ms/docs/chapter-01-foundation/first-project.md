# Projek Pertama Anda - Tutorial Praktikal

**Navigasi Bab:**
- **📚 Rumah Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelum**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Selamat datang ke projek Azure Developer CLI pertama anda! Tutorial praktikal komprehensif ini memberikan panduan lengkap tentang mencipta, menyebarkan, dan menguruskan aplikasi full-stack di Azure menggunakan azd. Anda akan bekerja dengan aplikasi todo sebenar yang merangkumi frontend React, backend API Node.js, dan pangkalan data MongoDB.

## Matlamat Pembelajaran

Dengan menyelesaikan tutorial ini, anda akan:
- Menguasai aliran kerja inisialisasi projek azd menggunakan templat
- Memahami struktur projek Azure Developer CLI dan fail konfigurasi
- Melaksanakan penyebaran aplikasi penuh ke Azure dengan penyediaan infrastruktur
- Melaksanakan kemas kini aplikasi dan strategi penyebaran semula
- Menguruskan pelbagai persekitaran untuk pembangunan dan staging
- Mengaplikasi amalan pembersihan sumber dan pengurusan kos

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Inisialisasi dan konfigurasi projek azd dari templat secara berdikari
- Navigasi dan ubah suai struktur projek azd dengan berkesan
- Menyebarkan aplikasi full-stack ke Azure menggunakan arahan tunggal
- Menyelesaikan masalah penyebaran biasa dan masalah pengesahan
- Menguruskan pelbagai persekitaran Azure untuk peringkat penyebaran berlainan
- Melaksanakan aliran kerja penyebaran berterusan untuk kemas kini aplikasi

## Memulakan

### Senarai Semak Prasyarat
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](installation.md))
- ✅ Pengesahan AZD diselesaikan dengan `azd auth login`
- ✅ Git dipasang pada sistem anda
- ✅ Node.js 16+ (untuk tutorial ini)
- ✅ Visual Studio Code (disyorkan)

Sebelum anda meneruskan, jalankan pemeriksa persediaan dari akar repositori:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Sahkan Persediaan Anda
```bash
# Semak pemasangan azd
azd version

# Semak pengesahan AZD
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

Mari kita mulakan dengan templat aplikasi todo popular yang merangkumi frontend React dan backend API Node.js.

```bash
# Layari templat yang tersedia
azd template list

# Mulakan templat aplikasi todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Ikut arahan:
# - Masukkan nama persekitaran: "dev"
# - Pilih langganan (jika anda mempunyai lebih daripada satu)
# - Pilih rantau: "East US 2" (atau rantau pilihan anda)
```

### Apa Yang Baru Berlaku?
- Memuat turun kod templat ke direktori setempat anda
- Mencipta fail `azure.yaml` dengan definisi perkhidmatan
- Menyediakan kod infrastruktur dalam direktori `infra/`
- Mencipta konfigurasi persekitaran

## Langkah 2: Teroka Struktur Projek

Mari kita lihat apa yang azd hasilkan untuk kita:

```bash
# Lihat struktur projek
tree /f   # Windows
# atau
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
# Lihat konfigurasi projek
cat azure.yaml
```

**infra/main.bicep** - Definisi infrastruktur:
```bash
# Lihat kod infrastruktur
head -30 infra/main.bicep
```

## Langkah 3: Sesuaikan Projek Anda (Pilihan)

Sebelum menyebar, anda boleh menyesuaikan aplikasi:

### Ubahsuai Frontend
```bash
# Buka komponen aplikasi React
code src/web/src/App.tsx
```

Buat perubahan mudah:
```typescript
// Cari tajuk dan ubah ia
<h1>My Awesome Todo App</h1>
```

### Konfigurasi Pembolehubah Persekitaran
```bash
# Tetapkan pemboleh ubah persekitaran tersuai
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Lihat semua pemboleh ubah persekitaran
azd env get-values
```

## Langkah 4: Sebar ke Azure

Sekarang bahagian menarik - sebarkan semuanya ke Azure!

```bash
# Sediakan infrastruktur dan aplikasi
azd up

# Arahan ini akan:
# 1. Menyediakan sumber Azure (Perkhidmatan Apl, Cosmos DB, dll.)
# 2. Membina aplikasi anda
# 3. Menggunakan aplikasi ke sumber yang disediakan
# 4. Paparkan URL aplikasi
```

### Apa Yang Berlaku Semasa Penyebaran?

Arahan `azd up` melaksanakan langkah berikut:
1. **Sediakan** (`azd provision`) - Mencipta sumber Azure
2. **Pakej** - Membina kod aplikasi anda
3. **Sebar** (`azd deploy`) - Menyebar kod ke sumber Azure

### Output Dijangkakan
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
Klik pada URL yang disediakan dalam output penyebaran, atau dapatkan bila-bila masa:
```bash
# Dapatkan titik akhir aplikasi
azd show

# Buka aplikasi dalam pelayar anda
azd show --output json | jq -r '.services.web.endpoint'
```

### Uji Aplikasi Todo
1. **Tambah item todo** - Klik "Add Todo" dan masukkan tugasan
2. **Tandakan sebagai selesai** - Tandakan item yang telah selesai
3. **Padam item** - Alih keluar todo yang tidak lagi diperlukan

### Pantau Aplikasi Anda
```bash
# Buka portal Azure untuk sumber anda
azd monitor

# Lihat log aplikasi
azd monitor --logs

# Lihat metrik secara langsung
azd monitor --live
```

## Langkah 6: Buat Perubahan dan Sebar Semula

Mari buat perubahan dan lihat betapa mudahnya mengemas kini:

### Ubahsuai API
```bash
# Sunting kod API
code src/api/src/routes/lists.js
```

Tambah tajuk respons tersuai:
```javascript
// Cari pengendali laluan dan tambah:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Sebar Hanya Perubahan Kod
```bash
# Hanya sebarkan kod aplikasi (langkau infrastruktur)
azd deploy

# Ini jauh lebih pantas daripada 'azd up' kerana infrastruktur sudah wujud
```

## Langkah 7: Urus Pelbagai Persekitaran

Cipta persekitaran staging untuk menguji perubahan sebelum pengeluaran:

```bash
# Cipta persekitaran pementasan baru
azd env new staging

# Lancarkan ke pementasan
azd up

# Beralih kembali ke persekitaran pembangunan
azd env select dev

# Senaraikan semua persekitaran
azd env list
```

### Perbandingan Persekitaran
```bash
# Lihat persekitaran pembangunan
azd env select dev
azd show

# Lihat persekitaran staging
azd env select staging
azd show
```

## Langkah 8: Bersihkan Sumber

Apabila anda selesai mencuba, bersihkan untuk mengelakkan caj berterusan:

```bash
# Padam semua sumber Azure untuk persekitaran semasa
azd down

# Paksa padam tanpa pengesahan dan padam sumber yang dipadam lembut
azd down --force --purge

# Padam persekitaran tertentu
azd env select staging
azd down --force --purge
```

## Aplikasi Klasik vs. Aplikasi Berkuasa AI: Aliran Kerja Sama

Anda baru sahaja menyebarkan aplikasi web tradisional. Tetapi bagaimana jika anda mahu menyebarkan aplikasi berkuasa AI—contohnya, aplikasi chat yang disokong oleh Model Microsoft Foundry?

Berita baik: **alur kerja adalah sama.**

| Langkah | Aplikasi Todo Klasik | Aplikasi Chat AI |
|------|-----------------|-------------|
| Inisialisasi | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Pengesahan | `azd auth login` | `azd auth login` |
| Sebar | `azd up` | `azd up` |
| Pantau | `azd monitor` | `azd monitor` |
| Bersihkan | `azd down --force --purge` | `azd down --force --purge` |

Satu-satunya perbezaan ialah **templat** yang anda mulakan. Templat AI termasuk infrastruktur tambahan (seperti sumber Model Microsoft Foundry atau indeks AI Search), tetapi azd mengendalikannya semua untuk anda. Anda tidak perlu belajar arahan baru, menggunakan alat berbeza, atau mengubah cara fikir tentang penyebaran.

Ini adalah prinsip teras azd: **satu aliran kerja, apa-apa beban kerja.** Kemahiran yang anda praktikkan dalam tutorial ini—inisialisasi, penyebaran, pemantauan, penyebaran semula, dan pembersihan—berlaku sama rata kepada aplikasi dan agen AI.

---

## Apa Yang Anda Telah Pelajari

Tahniah! Anda telah berjaya:
- ✅ Menginisialisasi projek azd dari templat
- ✅ Meneroka struktur projek dan fail utama
- ✅ Menyebarkan aplikasi full-stack ke Azure
- ✅ Membuat perubahan kod dan menyebar semula
- ✅ Menguruskan pelbagai persekitaran
- ✅ Membersihkan sumber

## 🎯 Latihan Pengesahan Kemahiran

### Latihan 1: Sebarkan Templat Berbeza (15 minit)
**Matlamat**: Demonstrasikan penguasaan alur kerja inisialisasi azd init dan penyebaran

```bash
# Cuba tumpukan Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Sahihkan pelaksanaan
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Bersihkan
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Aplikasi disebar tanpa ralat
- [ ] Boleh akses URL aplikasi di pelayar
- [ ] Aplikasi berfungsi dengan betul (tambah/buang todos)
- [ ] Sumber semua berjaya dibersihkan

### Latihan 2: Sesuaikan Konfigurasi (20 minit)
**Matlamat**: Latih konfigurasi pembolehubah persekitaran

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
- [ ] Pembolehubah persekitaran ditetapkan dan boleh diambil
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

# Bersihkan kedua-dua
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Dua persekitaran dibuat dengan konfigurasi berlainan
- [ ] Kedua-dua persekitaran berjaya disebar
- [ ] Boleh bertukar antara persekitaran menggunakan `azd env select`
- [ ] Pembolehubah persekitaran berbeza antara persekitaran
- [ ] Kedua-dua persekitaran berjaya dibersihkan

## 📊 Kemajuan Anda

**Masa Diperuntukkan**: ~60-90 minit  
**Kemahiran Diperoleh**:
- ✅ Inisialisasi projek berdasarkan templat
- ✅ Penyediaan sumber Azure
- ✅ Alur kerja penyebaran aplikasi
- ✅ Pengurusan persekitaran
- ✅ Pengurusan konfigurasi
- ✅ Pembersihan sumber dan pengurusan kos

**Tahap Seterusnya**: Anda sudah bersedia untuk [Panduan Konfigurasi](configuration.md) untuk mempelajari corak konfigurasi lanjutan!

## Penyelesaian Masalah Lazim

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

# Untuk Container Apps, gunakan Azure CLI:
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

Sekarang anda telah menyelesaikan projek pertama anda, terokai topik lanjutan ini:

### 1. Sesuaikan Infrastruktur
- [Infrastruktur sebagai Kod](../chapter-04-infrastructure/provisioning.md)
- [Tambah pangkalan data, storan, dan perkhidmatan lain](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sediakan CI/CD
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) - Alur kerja CI/CD lengkap
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfigurasi saluran paip

### 3. Amalan Terbaik Produksi
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) - Keselamatan, prestasi, dan pemantauan

### 4. Terokai Lebih Banyak Templat
```bash
# Layari templat mengikut kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Cuba pelbagai tumpukan teknologi
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

**Tahniah kerana menyiapkan projek azd pertama anda!** Anda kini siap membina dan menyebarkan aplikasi hebat di Azure dengan yakin.

---

**Navigasi Bab:**
- **📚 Rumah Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelum**: [Pemasangan & Persediaan](installation.md)
- **➡️ Seterusnya**: [Konfigurasi](configuration.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Pelajaran Seterusnya**: [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat kritikal, terjemahan profesional oleh manusia adalah digalakkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->