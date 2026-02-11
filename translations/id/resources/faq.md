# Pertanyaan yang Sering Diajukan (FAQ)

**Dapatkan Bantuan per Bab**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **🚆 Masalah Instalasi**: [Bab 1: Instalasi & Pengaturan](../docs/getting-started/installation.md)
- **🤖 Pertanyaan AI**: [Bab 2: Pengembangan Berbasis AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Pemecahan Masalah**: [Bab 7: Pemecahan Masalah & Debugging](../docs/troubleshooting/common-issues.md)

## Pendahuluan

FAQ komprehensif ini memberikan jawaban atas pertanyaan yang paling umum tentang Azure Developer CLI (azd) dan penerapan di Azure. Temukan solusi cepat untuk masalah umum, pahami praktik terbaik, dan dapatkan klarifikasi tentang konsep dan alur kerja azd.

## Tujuan Pembelajaran

Dengan meninjau FAQ ini, Anda akan:
- Menemukan jawaban cepat untuk pertanyaan dan masalah umum Azure Developer CLI
- Memahami konsep dan terminologi kunci melalui format tanya jawab praktis
- Mengakses solusi pemecahan masalah untuk masalah dan skenario kesalahan yang sering terjadi
- Mempelajari praktik terbaik melalui pertanyaan yang sering diajukan tentang optimasi
- Menemukan fitur dan kemampuan lanjutan melalui pertanyaan tingkat ahli
- Merujuk panduan biaya, keamanan, dan strategi penerapan dengan efisien

## Hasil Pembelajaran

Dengan merujuk FAQ ini secara teratur, Anda akan dapat:
- Menyelesaikan masalah Azure Developer CLI umum secara mandiri menggunakan solusi yang disediakan
- Membuat keputusan yang tepat tentang strategi dan konfigurasi penerapan
- Memahami hubungan antara azd dan alat serta layanan Azure lainnya
- Menerapkan praktik terbaik berdasarkan pengalaman komunitas dan rekomendasi ahli
- Memecahkan masalah autentikasi, penerapan, dan konfigurasi dengan efektif
- Mengoptimalkan biaya dan kinerja menggunakan wawasan dan rekomendasi FAQ

## Daftar Isi

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Memulai

### Q: Apa itu Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) adalah alat baris perintah yang berfokus pada pengembang yang mempercepat waktu yang dibutuhkan untuk memindahkan aplikasi Anda dari lingkungan pengembangan lokal ke Azure. Ia menyediakan praktik terbaik melalui template dan membantu seluruh siklus hidup penerapan.

### Q: Bagaimana azd berbeda dari Azure CLI?
**A**: 
- **Azure CLI**: Alat serbaguna untuk mengelola sumber daya Azure
- **azd**: Alat yang berfokus pada pengembang untuk alur kerja penerapan aplikasi
- azd menggunakan Azure CLI secara internal tetapi menyediakan abstraksi tingkat tinggi untuk skenario pengembangan umum
- azd menyertakan template, manajemen lingkungan, dan otomatisasi penerapan

### Q: Apakah saya perlu menginstal Azure CLI untuk menggunakan azd?
**A**: Ya, azd memerlukan Azure CLI untuk autentikasi dan beberapa operasi. Instal Azure CLI terlebih dahulu, lalu instal azd.

### Q: Bahasa pemrograman apa yang didukung azd?
**A**: azd bersifat netral terhadap bahasa pemrograman. Bekerja dengan:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Situs statis
- Aplikasi terkontainerisasi

### Q: Bisakah saya menggunakan azd dengan proyek yang sudah ada?
**A**: Ya! Anda dapat:
1. Gunakan `azd init` untuk menambahkan konfigurasi azd ke proyek yang sudah ada
2. Sesuaikan proyek yang ada agar sesuai dengan struktur template azd
3. Buat template kustom berdasarkan arsitektur Anda yang sudah ada

---

## Autentikasi & Akses

### Q: Bagaimana cara saya mengautentikasi ke Azure menggunakan azd?
**A**: Gunakan `azd auth login` yang akan membuka jendela browser untuk autentikasi Azure. Untuk skenario CI/CD, gunakan service principal atau managed identities.

### Q: Bisakah saya menggunakan azd dengan beberapa langganan Azure?
**A**: Ya. Gunakan `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` untuk menentukan langganan mana yang digunakan untuk setiap lingkungan.

### Q: Izin apa yang saya perlukan untuk mendeploy dengan azd?
**A**: Biasanya Anda memerlukan:
- Peran **Contributor** pada resource group atau subscription
- **User Access Administrator** jika mendeploy sumber daya yang memerlukan penugasan peran
- Izin spesifik bervariasi berdasarkan template dan sumber daya yang dideploy

### Q: Bisakah saya menggunakan azd dalam pipeline CI/CD?
**A**: Tentu! azd dirancang untuk integrasi CI/CD. Gunakan service principal untuk autentikasi dan atur variabel lingkungan untuk konfigurasi.

### Q: Bagaimana saya menangani autentikasi di GitHub Actions?
**A**: Gunakan Azure Login action dengan kredensial service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Template & Proyek

### Q: Di mana saya dapat menemukan template azd?
**A**: 
- Template resmi: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Template komunitas: Cari di GitHub untuk "azd-template"
- Gunakan `azd template list` untuk menelusuri template yang tersedia

### Q: Bagaimana cara membuat template kustom?
**A**: 
1. Mulai dengan struktur template yang ada
2. Ubah `azure.yaml`, file infrastruktur, dan kode aplikasi
3. Uji secara menyeluruh dengan `azd up`
4. Publikasikan ke GitHub dengan tag yang sesuai

### Q: Bisakah saya menggunakan azd tanpa template?
**A**: Ya, gunakan `azd init` di proyek yang ada untuk membuat file konfigurasi yang diperlukan. Anda perlu mengonfigurasi `azure.yaml` dan file infrastruktur secara manual.

### Q: Apa perbedaan antara template resmi dan komunitas?
**A**: 
- **Template resmi**: Dipelihara oleh Microsoft, diperbarui secara berkala, dokumentasi lengkap
- **Template komunitas**: Dibuat oleh pengembang, mungkin memiliki kasus penggunaan khusus, kualitas dan pemeliharaan bervariasi

### Q: Bagaimana cara memperbarui template di proyek saya?
**A**: Template tidak diperbarui secara otomatis. Anda dapat:
1. Membandingkan dan menggabungkan perubahan dari template sumber secara manual
2. Mulai ulang dengan `azd init` menggunakan template yang diperbarui
3. Mengambil perbaikan tertentu dari template yang diperbarui

---

## Penerapan & Infrastruktur

### Q: Layanan Azure apa saja yang dapat dideploy oleh azd?
**A**: azd dapat mendeploy layanan Azure apa pun melalui template Bicep/ARM, termasuk:
- App Services, Container Apps, Functions
- Basis data (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Jaringan, keamanan, dan sumber daya pemantauan

### Q: Bisakah saya mendeploy ke beberapa wilayah?
**A**: Ya, konfigurasi beberapa wilayah di template Bicep Anda dan atur parameter lokasi dengan tepat untuk setiap lingkungan.

### Q: Bagaimana saya menangani migrasi skema basis data?
**A**: Gunakan deployment hooks di `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Bisakah saya mendeploy hanya infrastruktur tanpa aplikasi?
**A**: Ya, gunakan `azd provision` untuk mendeploy hanya komponen infrastruktur yang didefinisikan dalam template Anda.

### Q: Bagaimana saya mendeploy ke sumber daya Azure yang sudah ada?
**A**: Ini kompleks dan tidak didukung langsung. Anda dapat:
1. Mengimpor sumber daya yang ada ke dalam template Bicep Anda
2. Menggunakan referensi sumber daya yang sudah ada di template
3. Memodifikasi template untuk kondisional membuat atau mereferensikan sumber daya

### Q: Bisakah saya menggunakan Terraform alih-alih Bicep?
**A**: Saat ini, azd terutama mendukung template Bicep/ARM. Dukungan Terraform tidak tersedia secara resmi, meskipun solusi komunitas mungkin ada.

---

## Konfigurasi & Lingkungan

### Q: Bagaimana saya mengelola lingkungan yang berbeda (dev, staging, prod)?
**A**: Buat lingkungan terpisah dengan `azd env new <environment-name>` dan konfigurasi pengaturan yang berbeda untuk masing-masing:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Di mana konfigurasi lingkungan disimpan?
**A**: Di folder `.azure` di dalam direktori proyek Anda. Setiap lingkungan memiliki folder sendiri dengan file konfigurasi.

### Q: Bagaimana saya mengatur konfigurasi spesifik lingkungan?
**A**: Gunakan `azd env set` untuk mengonfigurasi variabel lingkungan:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Bisakah saya berbagi konfigurasi lingkungan antar anggota tim?
**A**: Folder `.azure` berisi informasi sensitif dan tidak boleh dikomit ke kontrol versi. Sebagai gantinya:
1. Dokumentasikan variabel lingkungan yang diperlukan
2. Gunakan skrip deployment untuk menyiapkan lingkungan
3. Gunakan Azure Key Vault untuk konfigurasi sensitif

### Q: Bagaimana saya menimpa nilai default template?
**A**: Atur variabel lingkungan yang sesuai dengan parameter template:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Pemecahan Masalah

### Q: Mengapa `azd up` gagal?
**A**: Penyebab umum:
1. **Masalah autentikasi**: Jalankan `azd auth login`
2. **Izin tidak cukup**: Periksa penugasan peran Azure Anda
3. **Konflik penamaan sumber daya**: Ubah AZURE_ENV_NAME
4. **Masalah kuota/kapasitas**: Periksa ketersediaan regional
5. **Kesalahan template**: Validasi template Bicep

### Q: Bagaimana saya men-debug kegagalan penerapan?
**A**: 
1. Gunakan `azd deploy --debug` untuk output verbose
2. Periksa riwayat penerapan di portal Azure
3. Tinjau Activity Log di portal Azure
4. Gunakan `azd show` untuk menampilkan status lingkungan saat ini

### Q: Mengapa variabel lingkungan saya tidak berfungsi?
**A**: Periksa:
1. Nama variabel cocok dengan parameter template secara tepat
2. Nilai dikutip dengan benar jika mengandung spasi
3. Lingkungan dipilih: `azd env select <environment>`
4. Variabel disetel di lingkungan yang benar

### Q: Bagaimana saya membersihkan deployment yang gagal?
**A**: 
```bash
azd down --force --purge
```
Ini menghapus semua sumber daya dan konfigurasi lingkungan.

### Q: Mengapa aplikasi saya tidak dapat diakses setelah penerapan?
**A**: Periksa:
1. Penerapan selesai dengan sukses
2. Aplikasi berjalan (periksa log di portal Azure)
3. Network security group mengizinkan lalu lintas
4. DNS/domain kustom dikonfigurasi dengan benar

---

## Biaya & Penagihan

### Q: Berapa biaya penerapan azd?
**A**: Biaya bergantung pada:
- Layanan Azure yang dideploy
- Tier/SKU layanan yang dipilih
- Perbedaan harga regional
- Pola penggunaan

Gunakan [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/) untuk estimasi.

### Q: Bagaimana saya mengendalikan biaya dalam penerapan azd?
**A**: 
1. Gunakan SKU tingkat lebih rendah untuk lingkungan pengembangan
2. Atur anggaran Azure dan peringatan
3. Gunakan `azd down` untuk menghapus sumber daya saat tidak dibutuhkan
4. Pilih wilayah yang sesuai (biaya berbeda menurut lokasi)
5. Gunakan alat Azure Cost Management

### Q: Apakah ada opsi tingkat gratis untuk template azd?
**A**: Banyak layanan Azure menawarkan tingkat gratis:
- App Service: Tersedia tier gratis
- Azure Functions: 1M eksekusi gratis/bulan
- Cosmos DB: Tingkat gratis dengan 400 RU/s
- Application Insights: 5GB pertama/bulan gratis

Konfigurasikan template untuk menggunakan tier gratis bila tersedia.

### Q: Bagaimana saya memperkirakan biaya sebelum penerapan?
**A**: 
1. Tinjau `main.bicep` pada template untuk melihat sumber daya apa yang dibuat
2. Gunakan Kalkulator Harga Azure dengan SKU spesifik
3. Lakukan penerapan ke lingkungan pengembangan terlebih dahulu untuk memantau biaya aktual
4. Gunakan Azure Cost Management untuk analisis biaya rinci

---

## Praktik Terbaik

### Q: Apa praktik terbaik untuk struktur proyek azd?
**A**: 
1. Pisahkan kode aplikasi dari infrastruktur
2. Gunakan nama layanan yang bermakna di `azure.yaml`
3. Terapkan penanganan kesalahan yang tepat di skrip build
4. Gunakan konfigurasi spesifik lingkungan
5. Sertakan dokumentasi yang komprehensif

### Q: Bagaimana saya harus mengatur beberapa layanan di azd?
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

### Q: Bagaimana saya menangani rahasia dan konfigurasi sensitif?
**A**: 
1. Gunakan Azure Key Vault untuk rahasia
2. Referensikan rahasia Key Vault dalam konfigurasi aplikasi
3. Jangan pernah meng-commit rahasia ke kontrol versi
4. Gunakan managed identities untuk autentikasi antar-layanan

### Q: Pendekatan yang direkomendasikan untuk CI/CD dengan azd?
**A**: 
1. Gunakan lingkungan terpisah untuk setiap tahap (dev/staging/prod)
2. Terapkan pengujian otomatis sebelum penerapan
3. Gunakan service principal untuk autentikasi
4. Simpan konfigurasi sensitif di secret/variable pipeline
5. Terapkan approval gate untuk penerapan produksi

---

## Topik Lanjutan

### Q: Bisakah saya memperluas azd dengan fungsionalitas kustom?
**A**: Ya, melalui deployment hooks di `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Bagaimana saya mengintegrasikan azd dengan proses DevOps yang sudah ada?
**A**: 
1. Gunakan perintah azd dalam skrip pipeline yang sudah ada
2. Standarisasi template azd di seluruh tim
3. Integrasikan dengan monitoring dan alerting yang sudah ada
4. Gunakan output JSON azd untuk integrasi pipeline

### Q: Bisakah saya menggunakan azd dengan Azure DevOps?
**A**: Ya, azd bekerja dengan sistem CI/CD apa pun. Buat pipeline Azure DevOps yang menggunakan perintah azd.

### Q: Bagaimana saya berkontribusi ke azd atau membuat template komunitas?
**A**:
1. **alat azd**: Berkontribusi ke [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templat**: Buat templat mengikuti [panduan templat](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentasi**: Berkontribusi pada docs di [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Apa roadmap untuk azd?
**A**: Periksa [roadmap resmi](https://github.com/Azure/azure-dev/projects) untuk fitur dan perbaikan yang direncanakan.

### Q: Bagaimana cara saya bermigrasi dari alat penyebaran lain ke azd?
**A**: 
1. Analisis arsitektur penyebaran saat ini
2. Buat templat Bicep yang setara
3. Konfigurasikan `azure.yaml` agar sesuai dengan layanan saat ini
4. Uji secara menyeluruh di lingkungan pengembangan
5. Migrasikan lingkungan secara bertahap

---

## Masih Punya Pertanyaan?

### **Cari Terlebih Dahulu**
- Periksa [dokumentasi resmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Telusuri [GitHub issues](https://github.com/Azure/azure-dev/issues) untuk masalah serupa

### **Dapatkan Bantuan**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Dukungan komunitas
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Pertanyaan teknis
- [Azure Discord](https://discord.gg/azure) - Obrolan komunitas waktu nyata

### **Laporkan Masalah**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Laporan bug dan permintaan fitur
- Sertakan log yang relevan, pesan kesalahan, dan langkah untuk mereproduksi

### **Pelajari Lebih Lanjut**
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Arsitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kerangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*FAQ ini diperbarui secara berkala. Terakhir diperbarui: 9 September 2025*

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Glosarium](glossary.md)
- **Pelajaran Berikutnya**: [Panduan Belajar](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk akurat, harap diingat bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->