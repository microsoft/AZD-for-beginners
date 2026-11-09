# Pertanyaan yang Sering Diajukan (FAQ)

**Dapatkan Bantuan berdasarkan Bab**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **🚆 Masalah Instalasi**: [Bab 1: Instalasi & Pengaturan](../docs/chapter-01-foundation/installation.md)
- **🤖 Pertanyaan AI**: [Bab 2: Pengembangan AI-Pertama](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Pemecahan Masalah**: [Bab 7: Pemecahan Masalah & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Pendahuluan

FAQ ini yang komprehensif memberikan jawaban atas pertanyaan paling umum tentang Azure Developer CLI (azd) dan implementasi di Azure. Temukan solusi cepat untuk masalah umum, pahami praktik terbaik, dan dapatkan penjelasan tentang konsep dan alur kerja azd.

## Tujuan Pembelajaran

Dengan meninjau FAQ ini, Anda akan:
- Menemukan jawaban cepat untuk pertanyaan dan masalah umum Azure Developer CLI
- Memahami konsep dan terminologi utama melalui format tanya jawab praktis
- Mengakses solusi pemecahan masalah untuk masalah dan skenario kesalahan yang sering terjadi
- Mempelajari praktik terbaik melalui pertanyaan yang sering diajukan tentang optimasi
- Menemukan fitur dan kapabilitas canggih melalui pertanyaan tingkat ahli
- Merujuk panduan biaya, keamanan, dan strategi penerapan dengan efisien

## Hasil Pembelajaran

Dengan merujuk FAQ ini secara rutin, Anda akan dapat:
- Menyelesaikan masalah Azure Developer CLI umum secara mandiri dengan solusi yang diberikan
- Membuat keputusan yang tepat mengenai strategi dan konfigurasi penerapan
- Memahami hubungan antara azd dan alat serta layanan Azure lainnya
- Menerapkan praktik terbaik berdasarkan pengalaman komunitas dan rekomendasi ahli
- Memecahkan masalah otentikasi, penerapan, dan konfigurasi secara efektif
- Mengoptimalkan biaya dan kinerja menggunakan wawasan dan rekomendasi FAQ

## Daftar Isi

- [Memulai](#getting-started)
- [Otentikasi & Akses](#authentication--access)
- [Template & Proyek](#templates--projects)
- [Penerapan & Infrastruktur](#deployment--infrastructure)
- [Konfigurasi & Lingkungan](#configuration--environments)
- [Pemecahan Masalah](#troubleshooting)
- [Biaya & Penagihan](#cost--billing)
- [Praktik Terbaik](#best-practices)
- [Topik Lanjutan](#advanced-topics)

---

## Memulai

### Q: Apa itu Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) adalah alat baris perintah yang berfokus pada pengembang yang mempercepat waktu yang dibutuhkan untuk membawa aplikasi Anda dari lingkungan pengembangan lokal ke Azure. Ini menyediakan praktik terbaik melalui template dan membantu dengan seluruh siklus hidup penerapan.

### Q: Apa perbedaan azd dengan Azure CLI?
**A**: 
- **Azure CLI**: Alat serba guna untuk mengelola sumber daya Azure
- **azd**: Alat yang berfokus pada pengembang untuk alur kerja penerapan aplikasi
- azd memiliki otentikasi dan alur kerja penerapan sendiri; Azure CLI adalah alat terpisah yang melengkapi
- azd menyertakan template, manajemen lingkungan, dan otomatisasi penerapan

### Q: Apakah saya perlu menginstal Azure CLI untuk menggunakan azd?
**A**: Tidak untuk alur kerja inti AZD. Otentikasi menggunakan `azd auth login`. Pasang Azure CLI secara terpisah jika ada kaitan template atau latihan yang secara eksplisit menjalankan perintah `az`.

### Q: Bahasa pemrograman apa saja yang didukung azd?
**A**: azd bersifat bahasa-agnostik. Ini bekerja dengan:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Situs web statis
- Aplikasi yang dikontainerisasi

### Q: Bisakah saya menggunakan azd dengan proyek yang sudah ada?
**A**: Ya! Anda dapat:
1. Menggunakan `azd init` untuk menambahkan konfigurasi azd ke proyek yang sudah ada
2. Menyesuaikan proyek yang ada agar sesuai dengan struktur template azd
3. Membuat template khusus berdasarkan arsitektur Anda yang sudah ada

---

## Otentikasi & Akses

### Q: Bagaimana cara otentikasi dengan Azure menggunakan azd?
**A**: Gunakan `azd auth login` yang akan membuka jendela browser untuk otentikasi Azure. Untuk skenario CI/CD, gunakan service principal atau managed identity.

### Q: Bisakah saya menggunakan azd dengan beberapa langganan Azure?
**A**: Ya. Gunakan `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` untuk menentukan langganan mana yang akan digunakan untuk setiap lingkungan.

### Q: Izin apa yang saya butuhkan untuk menerapkan dengan azd?
**A**: Biasanya Anda membutuhkan:
- Peran **Contributor** pada grup sumber daya atau langganan
- **User Access Administrator** jika menerapkan sumber daya yang memerlukan penetapan peran
- Izin spesifik bervariasi tergantung pada template dan sumber daya yang diterapkan

### Q: Bisakah saya menggunakan azd dalam pipeline CI/CD?
**A**: Tentu! azd dirancang untuk integrasi CI/CD. Gunakan service principal untuk otentikasi dan atur variabel lingkungan untuk konfigurasi.

### Q: Bagaimana saya menangani otentikasi di GitHub Actions?
**A**: Disarankan menggunakan federasi identitas beban kerja (OIDC), dikonfigurasi dengan `azd pipeline config`. Workflow yang dihasilkan memasang AZD dan mengotentikasi AZD langsung dengan identitas federasi. Langkah `azure/login` saja tidak menetapkan login AZD. Langkah login dalam pekerjaan yang ada adalah:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Provision atau terapkan setelah login, dengan lingkungan AZD, langganan, dan lokasi yang dimaksud dikonfigurasi. Kredensial federasi identitas harus mempercayai repositori/ref workflow atau lingkungan GitHub, dan peran Azure-nya harus mengizinkan operasi yang diminta.

---

## Template & Proyek

### Q: Di mana saya bisa menemukan template azd?
**A**: 
- Template resmi dan komunitas: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Template komunitas: Cari di GitHub untuk "azd-template"
- Gunakan `azd template list` untuk menjelajahi template yang tersedia

### Q: Bagaimana cara membuat template kustom?
**A**: 
1. Mulai dengan struktur template yang ada
2. Modifikasi `azure.yaml`, file infrastruktur, dan kode aplikasi
3. Uji secara menyeluruh dengan `azd up`
4. Publikasikan ke GitHub dengan tag yang sesuai

### Q: Bisakah saya menggunakan azd tanpa template?
**A**: Ya, gunakan `azd init` dalam proyek yang ada untuk membuat file konfigurasi yang diperlukan. Anda perlu mengonfigurasi `azure.yaml` dan file infrastruktur secara manual.

### Q: Apa perbedaan antara template resmi dan komunitas?
**A**: 
- **Template resmi**: Dipelihara oleh Microsoft, diperbarui secara rutin, dokumentasi lengkap
- **Template komunitas**: Dibuat oleh pengembang, mungkin memiliki kasus penggunaan khusus, kualitas dan pemeliharaan bervariasi

### Q: Bagaimana cara memperbarui template di proyek saya?
**A**: Template tidak diperbarui secara otomatis. Anda dapat:
1. Membandingkan dan menggabungkan perubahan dari template sumber secara manual
2. Mulai baru dengan `azd init` menggunakan template yang diperbarui
3. Memilih perbaikan spesifik dari template yang diperbarui

---

## Penerapan & Infrastruktur

### Q: Layanan Azure apa yang bisa diterapkan azd?
**A**: azd dapat menerapkan layanan Azure apa pun melalui template Bicep/ARM, termasuk:
- App Services, Container Apps, Functions
- Database (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Jaringan, keamanan, dan sumber daya pemantauan

### Q: Bisakah saya menerapkan ke beberapa wilayah?
**A**: Ya, konfigurasikan beberapa wilayah dalam template Bicep Anda dan atur parameter lokasi dengan tepat untuk setiap lingkungan.

### Q: Bagaimana cara menangani migrasi skema database?
**A**: Gunakan hook penerapan di `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Bisakah saya menerapkan hanya infrastruktur tanpa aplikasi?
**A**: Ya, gunakan `azd provision` untuk hanya menerapkan komponen infrastruktur yang didefinisikan dalam template Anda.

### Q: Bagaimana saya menerapkan ke sumber daya Azure yang sudah ada?
**A**: Ya, jika template mendukungnya. Referensikan sumber daya yang ada dengan deklarasi `existing` Bicep atau parameter sumber daya yang sudah ada yang didokumentasikan di template, dan peta layanan aplikasi ke target yang dimaksud. Ini tidak mengimpor kepemilikan atau membuat izin yang hilang secara otomatis. Tinjau template sebelum menerapkan.

### Q: Bisakah saya menggunakan Terraform daripada Bicep?
**A**: Ya. AZD mendukung Terraform selain Bicep. Pilih template berbasis Terraform atau konfigurasikan `infra.provider: terraform` dalam `azure.yaml`, dengan file Terraform dan konfigurasi state/backend yang sesuai. Lihat [workflow Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurasi & Lingkungan

### Q: Bagaimana saya mengelola lingkungan yang berbeda (dev, staging, prod)?
**A**: Buat lingkungan terpisah dengan `azd env new <environment-name>` dan konfigurasikan pengaturan yang berbeda untuk masing-masing:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Di mana konfigurasi lingkungan disimpan?
**A**: Di folder `.azure` dalam direktori proyek Anda. Setiap lingkungan memiliki folder sendiri dengan file konfigurasi.

### Q: Bagaimana cara saya mengatur konfigurasi khusus lingkungan?
**A**: Gunakan `azd env set` untuk mengonfigurasi variabel lingkungan:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Bisakah saya berbagi konfigurasi lingkungan antar anggota tim?
**A**: Folder `.azure` berisi informasi sensitif dan tidak boleh dikomit ke kontrol versi. Sebagai gantinya:
1. Dokumentasikan variabel lingkungan yang diperlukan
2. Gunakan skrip penerapan untuk mengatur lingkungan
3. Gunakan Azure Key Vault untuk konfigurasi sensitif

### Q: Bagaimana cara saya menimpa default template?
**A**: Atur variabel lingkungan yang sesuai dengan parameter template:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Hanya variabel yang digunakan oleh template yang memengaruhi penerapan. `SKU_NAME` di atas adalah contoh input kustom, bukan pengaturan AZD universal.

---

## Pemecahan Masalah

### Q: Mengapa `azd up` gagal?
**A**: Penyebab umum:
1. **Masalah otentikasi**: Jalankan `azd auth login`
2. **Izin tidak cukup**: Periksa penetapan peran Azure Anda
3. **Konflik penamaan sumber daya**: Tinjau sumber daya yang konflik dan input penamaan di template; buat lingkungan terpisah dengan `azd env new` saat isolasi diperlukan
4. **Masalah kuota/kapasitas**: Periksa ketersediaan regional
5. **Kesalahan template**: Validasi template Bicep

### Q: Bagaimana saya men-debug kegagalan penerapan?
**A**: 
1. Gunakan `azd deploy --debug` untuk keluaran verbose
2. Periksa riwayat penerapan di portal Azure
3. Tinjau Activity Log di portal Azure
4. Gunakan `azd show` untuk menampilkan status lingkungan saat ini

### Q: Mengapa variabel lingkungan saya tidak berfungsi?
**A**: Periksa:
1. Nama variabel cocok persis dengan parameter template
2. Nilai sudah diapit tanda kutip jika mengandung spasi
3. Lingkungan sudah dipilih: `azd env select <environment>`
4. Variabel sudah disetel dalam lingkungan yang benar

### Q: Bagaimana saya membersihkan penerapan yang gagal?
**A**: 
```bash
azd down
```
Tinjau lingkungan yang dipilih dan konfirmasi penghapusan terlebih dahulu. Ini akan menghapus sumber daya Azure yang telah diprovisikan, bukan konfigurasi lingkungan lokal `.azure`. `--purge` juga meminta penghapusan permanen sumber daya yang dihapus lunak jika didukung dan bisa diblokir oleh perlindungan retensi/penghapusan; ini bukan langkah pemulihan rutin.

### Q: Mengapa aplikasi saya tidak dapat diakses setelah penerapan?
**A**: Periksa:
1. Penerapan selesai dengan sukses
2. Aplikasi berjalan (periksa log di portal Azure)
3. Grup keamanan jaringan mengizinkan trafik
4. DNS/domain kustom dikonfigurasi dengan benar

---

## Biaya & Penagihan

### Q: Berapa biaya penerapan azd?
**A**: Biaya bergantung pada:
- Layanan Azure yang diterapkan
- Tier/SKU layanan yang dipilih
- Perbedaan harga regional
- Pola penggunaan

Gunakan [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) untuk perkiraan.

### Q: Bagaimana saya mengontrol biaya dalam penerapan azd?
**A**: 
1. Gunakan SKU tingkat rendah untuk lingkungan pengembangan
2. Tetapkan anggaran dan peringatan Azure
3. Gunakan `azd down` untuk menghapus sumber daya saat tidak diperlukan
4. Pilih wilayah yang sesuai (biaya berbeda berdasarkan lokasi)
5. Gunakan alat Manajemen Biaya Azure

### Q: Apakah ada opsi tingkat gratis untuk template azd?
**A**: Beberapa layanan memiliki SKU gratis atau hibah bulanan, tergantung kelayakan, rencana hosting, wilayah, dan batas langganan. Ini tidak membuat seluruh template gratis: database, pencarian, jaringan, registri, telemetri, dan inferensi model dapat menimbulkan biaya secara terpisah. Periksa [daftar layanan gratis Azure](https://azure.microsoft.com/free/) dan harga terkini untuk setiap sumber daya sebelum penerapan.

### Q: Bagaimana saya memperkirakan biaya sebelum penerapan?
**A**: 
1. Tinjau `main.bicep` template untuk melihat sumber daya apa yang dibuat
2. Gunakan Azure Pricing Calculator dengan SKU spesifik
3. Terapkan dulu ke lingkungan pengembangan untuk memantau biaya sebenarnya
4. Gunakan Manajemen Biaya Azure untuk analisis biaya mendetail

---

## Praktik Terbaik

### Q: Apa praktik terbaik untuk struktur proyek azd?
**A**: 
1. Pisahkan kode aplikasi dari infrastruktur
2. Gunakan nama layanan yang bermakna dalam `azure.yaml`
3. Terapkan penanganan kesalahan yang tepat dalam skrip build
4. Gunakan konfigurasi khusus lingkungan
5. Sertakan dokumentasi yang lengkap

### Q: Bagaimana saya mengatur beberapa layanan dalam azd?
**A**: Gunakan struktur yang direkomendasikan:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Haruskah saya meng-commit folder `.azure` ke kontrol versi?
**A**: **Tidak!** Folder `.azure` berisi informasi sensitif. Tambahkan ke `.gitignore`:
```gitignore
.azure/
```

### T: Bagaimana saya menangani rahasia dan konfigurasi sensitif?
**J**: 
1. Gunakan Azure Key Vault untuk rahasia
2. Referensikan rahasia Key Vault dalam konfigurasi aplikasi
3. Jangan pernah meng-commit rahasia ke kontrol versi
4. Gunakan managed identities untuk autentikasi layanan-ke-layanan

### T: Apa pendekatan yang direkomendasikan untuk CI/CD dengan azd?
**J**: 
1. Gunakan lingkungan terpisah untuk setiap tahap (dev/staging/prod)
2. Terapkan pengujian otomatis sebelum deployment
3. Gunakan service principals untuk autentikasi
4. Simpan konfigurasi sensitif dalam rahasia/variabel pipeline
5. Terapkan approval gates untuk deployment produksi

---

## Topik Lanjutan

### T: Bisakah saya memperluas azd dengan fungsionalitas kustom?
**J**: Ya, melalui deployment hooks di `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### T: Bagaimana saya mengintegrasikan azd dengan proses DevOps yang ada?
**J**: 
1. Gunakan perintah azd dalam skrip pipeline yang ada
2. Standarisasi template azd di seluruh tim
3. Integrasikan dengan monitoring dan alerting yang ada
4. Gunakan output JSON azd untuk integrasi pipeline

### T: Bisakah saya menggunakan azd dengan Azure DevOps?
**J**: Ya, azd bekerja dengan sistem CI/CD mana pun. Buat pipeline Azure DevOps yang menggunakan perintah azd.

### T: Bagaimana saya berkontribusi ke azd atau membuat template komunitas?
**J**: 
1. **alat azd**: Berkontribusi ke [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Template**: Ikuti [instruksi kontribusi galeri Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentasi**: Berkontribusi ke dokumen di [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### T: Apa roadmap untuk azd?
**J**: Periksa [roadmap resmi](https://github.com/Azure/azure-dev/projects) untuk fitur dan peningkatan yang direncanakan.

### T: Bagaimana saya bermigrasi dari alat deployment lain ke azd?
**J**: 
1. Analisis arsitektur deployment saat ini
2. Buat template Bicep yang setara
3. Konfigurasikan `azure.yaml` untuk mencocokkan layanan saat ini
4. Uji secara menyeluruh di lingkungan pengembangan
5. Migrasikan lingkungan secara bertahap

---

## Masih Ada Pertanyaan?

### **Cari Terlebih Dahulu**
- Periksa [dokumentasi resmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Cari [isu GitHub](https://github.com/Azure/azure-dev/issues) untuk masalah serupa

### **Dapatkan Bantuan**
- [Diskusi GitHub](https://github.com/Azure/azure-dev/discussions) - Dukungan komunitas
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Pertanyaan teknis
- [Azure Discord](https://discord.gg/azure) - Obrolan komunitas waktu nyata

### **Laporkan Masalah**
- [Isu GitHub](https://github.com/Azure/azure-dev/issues/new) - Laporan bug dan permintaan fitur
- Sertakan log, pesan error, dan langkah reproduksi yang relevan

### **Pelajari Lebih Lanjut**
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Panduan teknis diperiksa: 4 November 2026. Ketersediaan cloud dan harga harus diperiksa untuk langganan dan wilayah Anda.*

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Glosarium](glossary.md)
- **Pelajaran Berikutnya**: [Panduan Studi](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->