# Pertanyaan yang Sering Diajukan (FAQ)

**Dapatkan Bantuan berdasarkan Bab**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **🚆 Masalah Instalasi**: [Bab 1: Instalasi & Pengaturan](../docs/chapter-01-foundation/installation.md)
- **🤖 Pertanyaan AI**: [Bab 2: Pengembangan AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Pemecahan Masalah**: [Bab 7: Pemecahan Masalah & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Pendahuluan

FAQ komprehensif ini menyediakan jawaban untuk pertanyaan yang paling umum tentang Azure Developer CLI (azd) dan penyebaran Azure. Temukan solusi cepat untuk masalah umum, pahami praktik terbaik, dan dapatkan klarifikasi tentang konsep dan alur kerja azd.

## Tujuan Pembelajaran

Dengan meninjau FAQ ini, Anda akan:
- Menemukan jawaban cepat untuk pertanyaan dan masalah Azure Developer CLI yang umum
- Memahami konsep dan terminologi utama melalui format tanya jawab praktis
- Mengakses solusi pemecahan masalah untuk masalah dan skenario kesalahan yang sering terjadi
- Mempelajari praktik terbaik melalui pertanyaan yang sering diajukan tentang optimasi
- Menemukan fitur dan kemampuan lanjutan melalui pertanyaan tingkat ahli
- Merujuk panduan biaya, keamanan, dan strategi penyebaran dengan efisien

## Hasil Pembelajaran

Dengan merujuk FAQ ini secara rutin, Anda akan dapat:
- Menyelesaikan masalah Azure Developer CLI yang umum secara mandiri menggunakan solusi yang disediakan
- Membuat keputusan yang tepat tentang strategi dan konfigurasi penyebaran
- Memahami hubungan antara azd dan alat serta layanan Azure lainnya
- Menerapkan praktik terbaik berdasarkan pengalaman komunitas dan rekomendasi ahli
- Memecahkan masalah otentikasi, penyebaran, dan konfigurasi secara efektif
- Mengoptimalkan biaya dan kinerja menggunakan wawasan dan rekomendasi dari FAQ

## Daftar Isi

- [Memulai](#getting-started)
- [Otentikasi & Akses](#authentication--access)
- [Templat & Proyek](#templates--projects)
- [Penyebaran & Infrastruktur](#deployment--infrastructure)
- [Konfigurasi & Lingkungan](#configuration--environments)
- [Pemecahan Masalah](#troubleshooting)
- [Biaya & Penagihan](#cost--billing)
- [Praktik Terbaik](#best-practices)
- [Topik Lanjutan](#advanced-topics)

---

## Memulai

### T: Apa itu Azure Developer CLI (azd)?
**J**: Azure Developer CLI (azd) adalah alat baris perintah yang berfokus pada pengembang yang mempercepat waktu yang Anda butuhkan untuk memindahkan aplikasi dari lingkungan pengembangan lokal ke Azure. Ia menyediakan praktik terbaik melalui templat dan membantu dengan seluruh siklus hidup penyebaran.

### T: Apa perbedaan azd dengan Azure CLI?
**J**: 
- **Azure CLI**: Alat serba guna untuk mengelola sumber daya Azure
- **azd**: Alat yang berfokus pada pengembang untuk alur kerja penyebaran aplikasi
- azd memiliki otentikasi dan alur kerja penyebaran sendiri; Azure CLI adalah alat terpisah yang melengkapi
- azd termasuk templat, manajemen lingkungan, dan otomatisasi penyebaran

### T: Apakah saya perlu menginstal Azure CLI untuk menggunakan azd?
**J**: Tidak untuk alur kerja inti AZD. Otentikasi dengan `azd auth login`. Instal Azure CLI secara terpisah saat kait templat atau latihan secara eksplisit menjalankan perintah `az`.

### T: Bahasa pemrograman apa saja yang didukung azd?
**J**: azd bersifat bahasa-agnostik. Ia bekerja dengan:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Situs web statis
- Aplikasi berbasis kontainer

### T: Bisakah saya menggunakan azd dengan proyek yang sudah ada?
**J**: Ya! Anda bisa:
1. Gunakan `azd init` untuk menambahkan konfigurasi azd ke proyek yang sudah ada
2. Sesuaikan proyek yang sudah ada agar sesuai dengan struktur templat azd
3. Buat templat khusus berdasarkan arsitektur yang sudah Anda miliki

### T: Apa perubahan dengan ketersediaan umum ekstensi Foundry?
**A**: Bundel `microsoft.foundry` mencapai versi 1.0 dan GA pada 5 November 2026. Dengan AZD 1.37.0+, gunakan `azd ext install microsoft.foundry` untuk menginstal tujuh ekstensi inti untuk agen, koneksi, inspector, proyek, rutinitas, keterampilan, dan kotak alat. Ini bukan namespace perintah baru, dan komponennya memiliki versi independen. Evaluasi, set data, penyetelan halus, dan model khusus diinstal secara terpisah; fitur pratinjau opsional tidak menjadi GA hanya karena bundel ini GA.

The [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) menggunakan Python 3.13+ dan uv saat ini. `azd ai agent run` membuka Agent Inspector secara lokal, tetapi panggilan model masih menggunakan Azure dan menimbulkan biaya. Mode kode `azd deploy` mengunggah sumber untuk build jarak jauh tanpa memerlukan build container lokal.

### Q: Apakah `azd down` menghapus hosted agent dari proyek Foundry yang sudah ada?
**A**: Tidak untuk jalur reused-project yang dijelaskan dalam quickstart hosted-agent: itu membiarkan proyek, hosted agent, dan sumber daya lainnya tetap ada. Hapus sumber daya yang tidak diinginkan secara terpisah tanpa menghapus sumber daya bersama. Jika lingkungan membuat proyek Foundry baru, `azd down` menghapus grup sumber dayanya dan semua isinya. Tinjau [panduan pembersihan](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) dan prompt penghapusan sebelum mengonfirmasi.

---

## Autentikasi & Akses

### Q: Bagaimana cara saya melakukan autentikasi dengan Azure menggunakan azd?
**A**: Gunakan `azd auth login` yang akan membuka jendela browser untuk autentikasi Azure. Untuk skenario CI/CD, gunakan service principals atau managed identities.

### Q: Bisakah saya menggunakan azd dengan beberapa langganan Azure?
**A**: Ya. Gunakan `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` untuk menentukan langganan mana yang digunakan untuk setiap lingkungan.

### Q: Izin apa yang saya butuhkan untuk melakukan deployment dengan azd?
**A**: Biasanya Anda memerlukan:
- Peran **Contributor** pada grup sumber daya atau langganan
- **User Access Administrator** jika melakukan deployment sumber daya yang memerlukan penugasan peran
- Izin spesifik bervariasi tergantung pada template dan sumber daya yang dideploy

### Q: Bisakah saya menggunakan azd dalam pipeline CI/CD?
**A**: Tentu saja! azd dirancang untuk integrasi CI/CD. Gunakan service principals untuk otentikasi dan atur variabel lingkungan untuk konfigurasi.

### Q: Bagaimana saya menangani otentikasi di GitHub Actions?
**A**: Utamakan federasi identitas beban kerja (OIDC), dikonfigurasi dengan `azd pipeline config`. Workflow yang dihasilkan menginstal AZD dan mengotentikasi AZD langsung dengan identitas federasi. Langkah `azure/login` saja tidak membangun login AZD. Langkah login dalam pekerjaan yang ada adalah:
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

Provisikan atau deploy setelah login, dengan lingkungan AZD, langganan, dan lokasi yang dimaksudkan sudah dikonfigurasi. Kredensial federasi identitas harus mempercayai repositori/ref workflow atau lingkungan GitHub, dan peran Azure-nya harus mengizinkan operasi yang diminta.

---

## Template & Proyek

### Q: Di mana saya dapat menemukan template azd?
**A**: 
- Template resmi dan komunitas: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Template komunitas: Cari GitHub untuk "azd-template"
- Gunakan `azd template list` untuk menelusuri template yang tersedia

### Q: Bagaimana saya membuat template kustom?
**A**: 
1. Mulai dengan struktur template yang sudah ada
2. Modifikasi `azure.yaml`, file infrastruktur, dan kode aplikasi
3. Uji secara menyeluruh dengan `azd up`
4. Publikasikan ke GitHub dengan tag yang sesuai

### Q: Bisakah saya menggunakan azd tanpa template?
**A**: Ya, gunakan `azd init` dalam proyek yang sudah ada untuk membuat file konfigurasi yang diperlukan. Anda harus mengonfigurasi secara manual `azure.yaml` dan file infrastruktur.

### T: Apa perbedaan antara template resmi dan komunitas?
**J**: 
- **Template resmi**: Dipelihara oleh Microsoft, diperbarui secara berkala, dokumentasi komprehensif
- **Template komunitas**: Dibuat oleh pengembang, mungkin memiliki kasus penggunaan khusus, kualitas dan pemeliharaan bervariasi

### T: Bagaimana cara memperbarui template di proyek saya?
**J**: Template tidak diperbarui secara otomatis. Anda dapat:
1. Membandingkan dan menggabungkan perubahan dari template sumber secara manual
2. Mulai baru dengan `azd init` menggunakan template yang diperbarui
3. Memilih perbaikan tertentu dari template yang diperbarui

---

## Penyebaran & Infrastruktur

### T: Layanan Azure apa saja yang bisa di-deploy oleh azd?
**J**: azd dapat menyebarkan layanan Azure apa pun melalui template Bicep/ARM, termasuk:
- App Services, Container Apps, Functions
- Basis data (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Jaringan, keamanan, dan sumber daya pemantauan

### T: Bisakah saya menyebarkan ke beberapa wilayah?
**J**: Ya, konfigurasikan beberapa wilayah dalam template Bicep Anda dan atur parameter lokasi dengan tepat untuk setiap lingkungan.

### T: Bagaimana saya menangani migrasi skema basis data?
**J**: Gunakan hooks penyebaran di `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### T: Bisakah saya hanya menyebarkan infrastruktur tanpa aplikasi?
**J**: Ya, gunakan `azd provision` untuk hanya menyebarkan komponen infrastruktur yang didefinisikan dalam template Anda.

### T: Bagaimana saya menyebarkan ke sumber daya Azure yang sudah ada?
**A**: Ya, ketika template mendukungnya. Referensikan sumber daya yang ada dengan deklarasi `existing` Bicep atau parameter sumber daya-eksisting yang didokumentasikan dalam template, dan petakan layanan aplikasi ke target yang dimaksudkan. Ini tidak mengimpor kepemilikan atau secara otomatis membuat izin yang hilang. Tinjau template sebelum melakukan deploy.

### Q: Bisakah saya menggunakan Terraform sebagai pengganti Bicep?
**A**: Ya. AZD mendukung Terraform serta Bicep. Pilih template berbasis Terraform atau konfigurasikan `infra.provider: terraform` dalam `azure.yaml`, dengan file Terraform dan konfigurasi state/backend yang sesuai. Lihat [alur kerja Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurasi & Lingkungan

### Q: Bagaimana cara mengelola lingkungan yang berbeda (dev, staging, prod)?
**A**: Buat lingkungan terpisah dengan `azd env new <environment-name>` dan konfigurasi pengaturan yang berbeda untuk masing-masing:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Di mana konfigurasi lingkungan disimpan?
**A**: Di folder `.azure` dalam direktori proyek Anda. Setiap lingkungan memiliki folder sendiri dengan file konfigurasi.

### Q: Bagaimana saya menetapkan konfigurasi spesifik lingkungan?
**A**: Gunakan `azd env set` untuk mengkonfigurasi variabel lingkungan:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Bisakah saya berbagi konfigurasi lingkungan antar anggota tim?
**A**: Folder `.azure` berisi informasi sensitif dan tidak boleh dikomit ke kontrol versi. Sebagai gantinya:
1. Dokumentasikan variabel lingkungan yang diperlukan
2. Gunakan skrip deployment untuk menyiapkan lingkungan
3. Gunakan Azure Key Vault untuk konfigurasi sensitif

### Q: Bagaimana saya menimpa default template?
**A**: Tetapkan variabel lingkungan yang sesuai dengan parameter template:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Hanya variabel yang digunakan dalam template yang memengaruhi penyebaran. `SKU_NAME` di atas adalah contoh input kustom, bukan pengaturan AZD universal.

---

## Pemecahan Masalah

### T: Mengapa `azd up` gagal?
**J**: Penyebab umum:
1. **Masalah autentikasi**: Jalankan `azd auth login`
2. **Izin tidak mencukupi**: Periksa penugasan peran Azure Anda
3. **Konflik penamaan sumber daya**: Tinjau sumber daya yang bertentangan dan input penamaan template; buat lingkungan terpisah dengan `azd env new` saat isolasi diperlukan
4. **Masalah kuota/kapasitas**: Periksa ketersediaan regional
5. **Kesalahan template**: Validasi template Bicep

### T: Bagaimana cara saya men-debug kegagalan penyebaran?
**J**: 
1. Gunakan `azd deploy --debug` untuk keluaran verbose
2. Periksa riwayat penyebaran di portal Azure
3. Tinjau Log Aktivitas di portal Azure
4. Gunakan `azd show` untuk menampilkan keadaan lingkungan saat ini

### T: Mengapa variabel lingkungan saya tidak berfungsi?
**J**: Periksa:
1. Nama variabel cocok persis dengan parameter template
2. Nilai sudah dikutip dengan benar jika mengandung spasi
3. Lingkungan dipilih: `azd env select <environment>`
4. Variabel diatur di lingkungan yang benar

### T: Bagaimana cara saya membersihkan penyebaran yang gagal?
**J**: 
```bash
azd down
```
Tinjau lingkungan yang dipilih dan konfirmasi penghapusan terlebih dahulu. Ini menghapus sumber daya Azure yang sudah disediakan, bukan konfigurasi lingkungan lokal `.azure`. `--purge` juga meminta penghapusan permanen sumber daya yang dihapus secara lunak yang didukung dan dapat diblokir oleh perlindungan retensi/pembersihan; ini bukan langkah pemulihan rutin.

### Q: Mengapa aplikasi saya tidak dapat diakses setelah penyebaran?
**A**: Periksa:
1. Penyebaran selesai dengan sukses
2. Aplikasi berjalan (periksa log di portal Azure)
3. Grup keamanan jaringan mengizinkan lalu lintas
4. DNS/domain kustom dikonfigurasi dengan benar

---

## Biaya & Penagihan

### Q: Berapa biaya penyebaran azd?
**A**: Biaya tergantung pada:
- Layanan Azure yang dideploy
- Tingkat layanan/SKU yang dipilih
- Perbedaan harga regional
- Pola penggunaan

Gunakan [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/) untuk estimasi.

### Q: Bagaimana saya mengontrol biaya dalam penyebaran azd?
**A**: 
1. Gunakan SKU tingkat lebih rendah untuk lingkungan pengembangan
2. Atur anggaran dan peringatan Azure
3. Gunakan `azd down` untuk menghapus sumber daya saat tidak dibutuhkan
4. Pilih wilayah yang sesuai (biaya bervariasi berdasarkan lokasi)
5. Gunakan alat Manajemen Biaya Azure

### T: Apakah ada opsi paket gratis untuk template azd?
**J**: Beberapa layanan memiliki SKU gratis atau hibah bulanan, tergantung pada kelayakan, rencana hosting, wilayah, dan batas langganan. Ini tidak membuat seluruh template menjadi gratis: basis data, pencarian, jaringan, registri, telemetri, dan inferensi model dapat mengenakan biaya secara terpisah. Periksa [daftar layanan gratis Azure](https://azure.microsoft.com/free/) dan harga saat ini untuk setiap sumber daya sebelum penyebaran.

### T: Bagaimana cara memperkirakan biaya sebelum penyebaran?
**J**: 
1. Tinjau `main.bicep` template untuk melihat sumber daya apa yang dibuat
2. Gunakan Kalkulator Harga Azure dengan SKU spesifik
3. Deploy ke lingkungan pengembangan terlebih dahulu untuk memantau biaya sebenarnya
4. Gunakan Azure Cost Management untuk analisis biaya secara rinci

---

## Praktik Terbaik

### T: Apa praktik terbaik untuk struktur proyek azd?
**J**: 
1. Pisahkan kode aplikasi dari infrastruktur
2. Gunakan nama layanan yang bermakna di `azure.yaml`
3. Terapkan penanganan error yang tepat pada skrip build
4. Gunakan konfigurasi khusus lingkungan
5. Sertakan dokumentasi yang lengkap

### T: Bagaimana saya harus mengorganisasi beberapa layanan di azd?
**J**: Gunakan struktur yang direkomendasikan:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### T: Haruskah saya meng-commit folder `.azure` ke kontrol versi?
**J**: **Tidak!** Folder `.azure` berisi informasi sensitif. Tambahkan ke `.gitignore`:
```gitignore
.azure/
```

### T: Bagaimana saya mengelola rahasia dan konfigurasi sensitif?
**J**: 
1. Gunakan Azure Key Vault untuk rahasia
2. Referensikan rahasia Key Vault dalam konfigurasi aplikasi
3. Jangan pernah meng-commit rahasia ke kontrol versi
4. Gunakan managed identities untuk autentikasi layanan-ke-layanan

### T: Apa pendekatan yang direkomendasikan untuk CI/CD dengan azd?
**J**: 
1. Gunakan lingkungan terpisah untuk setiap tahap (dev/staging/prod)
2. Terapkan pengujian otomatis sebelum penyebaran
3. Gunakan service principals untuk autentikasi
4. Simpan konfigurasi sensitif dalam rahasia/variabel pipeline
5. Terapkan gate persetujuan untuk penyebaran produksi

---

## Topik Lanjutan

### T: Bisakah saya memperluas azd dengan fungsi kustom?
**J**: Ya, melalui deployment hooks di `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### T: Bagaimana cara mengintegrasikan azd dengan proses DevOps yang ada?
**J**: 
1. Gunakan perintah azd dalam skrip pipeline yang ada
2. Standarisasi pada template azd di semua tim
3. Integrasi dengan pemantauan dan peringatan yang sudah ada
4. Gunakan output JSON azd untuk integrasi pipeline

### T: Bisakah saya menggunakan azd dengan Azure DevOps?
**J**: Ya, azd bekerja dengan sistem CI/CD apa pun. Buat pipeline Azure DevOps yang menggunakan perintah azd.

### T: Bagaimana cara saya berkontribusi pada azd atau membuat template komunitas?
**J**: 
1. **alat azd**: Berkontribusi ke [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Template**: Ikuti [instruksi kontribusi galeri Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentasi**: Berkontribusi ke docs di [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### T: Apa roadmap azd?
**J**: Periksa [roadmap resmi](https://github.com/Azure/azure-dev/projects) untuk fitur dan peningkatan yang direncanakan.

### T: Bagaimana cara migrasi dari alat penyebaran lain ke azd?
**J**: 
1. Analisis arsitektur penyebaran saat ini
2. Buat template Bicep yang setara
3. Konfigurasi `azure.yaml` untuk mencocokkan layanan saat ini
4. Uji secara menyeluruh di lingkungan pengembangan
5. Migrasi lingkungan secara bertahap

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
- [Pusat Arsitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Panduan teknis ditinjau: 4 November 2026. Ketersediaan cloud dan harga harus diperiksa sesuai langganan dan wilayah Anda.*

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Glosarium](glossary.md)
- **Pelajaran Berikutnya**: [Panduan Studi](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->