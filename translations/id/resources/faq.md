<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T22:41:53+00:00",
  "source_file": "resources/faq.md",
  "language_code": "id"
}
-->
# Pertanyaan yang Sering Diajukan (FAQ)

## Pendahuluan

FAQ ini memberikan jawaban atas pertanyaan umum tentang Azure Developer CLI (azd) dan proses deployment di Azure. Temukan solusi cepat untuk masalah umum, pahami praktik terbaik, dan dapatkan penjelasan tentang konsep serta alur kerja azd.

## Tujuan Pembelajaran

Dengan membaca FAQ ini, Anda akan:
- Menemukan jawaban cepat untuk pertanyaan dan masalah umum terkait Azure Developer CLI
- Memahami konsep dan terminologi utama melalui format tanya jawab praktis
- Mengakses solusi pemecahan masalah untuk skenario error yang sering terjadi
- Mempelajari praktik terbaik melalui pertanyaan umum tentang optimasi
- Menemukan fitur dan kemampuan tingkat lanjut melalui pertanyaan ahli
- Merujuk panduan strategi biaya, keamanan, dan deployment secara efisien

## Hasil Pembelajaran

Dengan merujuk FAQ ini secara rutin, Anda akan mampu:
- Menyelesaikan masalah umum Azure Developer CLI secara mandiri menggunakan solusi yang disediakan
- Membuat keputusan yang tepat tentang strategi dan konfigurasi deployment
- Memahami hubungan antara azd dan alat serta layanan Azure lainnya
- Menerapkan praktik terbaik berdasarkan pengalaman komunitas dan rekomendasi ahli
- Memecahkan masalah autentikasi, deployment, dan konfigurasi secara efektif
- Mengoptimalkan biaya dan performa menggunakan wawasan serta rekomendasi dari FAQ

## Daftar Isi

- [Memulai](../../../resources)
- [Autentikasi & Akses](../../../resources)
- [Template & Proyek](../../../resources)
- [Deployment & Infrastruktur](../../../resources)
- [Konfigurasi & Lingkungan](../../../resources)
- [Pemecahan Masalah](../../../resources)
- [Biaya & Penagihan](../../../resources)
- [Praktik Terbaik](../../../resources)
- [Topik Lanjutan](../../../resources)

---

## Memulai

### Q: Apa itu Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) adalah alat baris perintah yang berfokus pada pengembang untuk mempercepat waktu yang dibutuhkan untuk membawa aplikasi dari lingkungan pengembangan lokal ke Azure. Alat ini menyediakan praktik terbaik melalui template dan membantu dalam seluruh siklus hidup deployment.

### Q: Apa perbedaan antara azd dan Azure CLI?
**A**: 
- **Azure CLI**: Alat serbaguna untuk mengelola sumber daya Azure
- **azd**: Alat yang berfokus pada pengembang untuk alur kerja deployment aplikasi
- azd menggunakan Azure CLI secara internal tetapi menyediakan abstraksi tingkat tinggi untuk skenario pengembangan umum
- azd mencakup template, manajemen lingkungan, dan otomatisasi deployment

### Q: Apakah saya perlu menginstal Azure CLI untuk menggunakan azd?
**A**: Ya, azd membutuhkan Azure CLI untuk autentikasi dan beberapa operasi. Instal Azure CLI terlebih dahulu, lalu instal azd.

### Q: Bahasa pemrograman apa saja yang didukung oleh azd?
**A**: azd mendukung berbagai bahasa, termasuk:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Situs web statis
- Aplikasi yang dikontainerisasi

### Q: Bisakah saya menggunakan azd dengan proyek yang sudah ada?
**A**: Tentu! Anda dapat:
1. Menggunakan `azd init` untuk menambahkan konfigurasi azd ke proyek yang sudah ada
2. Menyesuaikan proyek yang sudah ada agar sesuai dengan struktur template azd
3. Membuat template kustom berdasarkan arsitektur yang sudah ada

---

## Autentikasi & Akses

### Q: Bagaimana cara autentikasi dengan Azure menggunakan azd?
**A**: Gunakan `azd auth login` yang akan membuka jendela browser untuk autentikasi Azure. Untuk skenario CI/CD, gunakan service principal atau managed identities.

### Q: Bisakah saya menggunakan azd dengan beberapa langganan Azure?
**A**: Ya. Gunakan `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` untuk menentukan langganan yang akan digunakan untuk setiap lingkungan.

### Q: Izin apa yang saya perlukan untuk melakukan deployment dengan azd?
**A**: Biasanya Anda memerlukan:
- Peran **Contributor** pada grup sumber daya atau langganan
- **User Access Administrator** jika melakukan deployment sumber daya yang memerlukan penugasan peran
- Izin spesifik bergantung pada template dan sumber daya yang dideploy

### Q: Bisakah saya menggunakan azd dalam pipeline CI/CD?
**A**: Tentu saja! azd dirancang untuk integrasi CI/CD. Gunakan service principal untuk autentikasi dan atur variabel lingkungan untuk konfigurasi.

### Q: Bagaimana cara menangani autentikasi di GitHub Actions?
**A**: Gunakan Azure Login action dengan kredensial service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Template & Proyek

### Q: Di mana saya bisa menemukan template azd?
**A**: 
- Template resmi: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Template komunitas: Cari di GitHub dengan kata kunci "azd-template"
- Gunakan `azd template list` untuk melihat template yang tersedia

### Q: Bagaimana cara membuat template kustom?
**A**: 
1. Mulai dengan struktur template yang sudah ada
2. Modifikasi `azure.yaml`, file infrastruktur, dan kode aplikasi
3. Uji dengan `azd up`
4. Publikasikan ke GitHub dengan tag yang sesuai

### Q: Bisakah saya menggunakan azd tanpa template?
**A**: Ya, gunakan `azd init` dalam proyek yang sudah ada untuk membuat file konfigurasi yang diperlukan. Anda perlu mengonfigurasi `azure.yaml` dan file infrastruktur secara manual.

### Q: Apa perbedaan antara template resmi dan komunitas?
**A**: 
- **Template resmi**: Dikelola oleh Microsoft, diperbarui secara berkala, dokumentasi lengkap
- **Template komunitas**: Dibuat oleh pengembang, mungkin memiliki kasus penggunaan khusus, kualitas dan pemeliharaan bervariasi

### Q: Bagaimana cara memperbarui template dalam proyek saya?
**A**: Template tidak diperbarui secara otomatis. Anda dapat:
1. Membandingkan dan menggabungkan perubahan dari sumber template secara manual
2. Memulai ulang dengan `azd init` menggunakan template yang diperbarui
3. Memilih perbaikan spesifik dari template yang diperbarui

---

## Deployment & Infrastruktur

### Q: Layanan Azure apa saja yang dapat dideploy oleh azd?
**A**: azd dapat mendepoy layanan Azure apa pun melalui template Bicep/ARM, termasuk:
- App Services, Container Apps, Functions
- Database (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Jaringan, keamanan, dan sumber daya pemantauan

### Q: Bisakah saya melakukan deployment ke beberapa wilayah?
**A**: Ya, konfigurasikan beberapa wilayah dalam template Bicep Anda dan atur parameter lokasi sesuai untuk setiap lingkungan.

### Q: Bagaimana cara menangani migrasi skema database?
**A**: Gunakan deployment hooks di `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Bisakah saya hanya mendepoy infrastruktur tanpa aplikasi?
**A**: Ya, gunakan `azd provision` untuk mendepoy hanya komponen infrastruktur yang didefinisikan dalam template Anda.

### Q: Bagaimana cara mendepoy ke sumber daya Azure yang sudah ada?
**A**: Ini cukup kompleks dan tidak didukung secara langsung. Anda dapat:
1. Mengimpor sumber daya yang sudah ada ke dalam template Bicep Anda
2. Menggunakan referensi sumber daya yang sudah ada dalam template
3. Memodifikasi template untuk secara kondisional membuat atau merujuk sumber daya

### Q: Bisakah saya menggunakan Terraform sebagai pengganti Bicep?
**A**: Saat ini, azd terutama mendukung template Bicep/ARM. Dukungan untuk Terraform belum tersedia secara resmi, meskipun solusi komunitas mungkin ada.

---

## Konfigurasi & Lingkungan

### Q: Bagaimana cara mengelola lingkungan yang berbeda (dev, staging, prod)?
**A**: Buat lingkungan terpisah dengan `azd env new <environment-name>` dan konfigurasikan pengaturan yang berbeda untuk masing-masing:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Di mana konfigurasi lingkungan disimpan?
**A**: Dalam folder `.azure` di direktori proyek Anda. Setiap lingkungan memiliki folder sendiri dengan file konfigurasi.

### Q: Bagaimana cara mengatur konfigurasi spesifik lingkungan?
**A**: Gunakan `azd env set` untuk mengatur variabel lingkungan:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Bisakah saya berbagi konfigurasi lingkungan dengan anggota tim?
**A**: Folder `.azure` berisi informasi sensitif dan tidak boleh dikomit ke kontrol versi. Sebagai gantinya:
1. Dokumentasikan variabel lingkungan yang diperlukan
2. Gunakan skrip deployment untuk menyiapkan lingkungan
3. Gunakan Azure Key Vault untuk konfigurasi sensitif

### Q: Bagaimana cara menimpa default template?
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
2. **Izin tidak mencukupi**: Periksa penugasan peran Azure Anda
3. **Konflik nama sumber daya**: Ubah AZURE_ENV_NAME
4. **Masalah kuota/kapasitas**: Periksa ketersediaan regional
5. **Error template**: Validasi template Bicep

### Q: Bagaimana cara debug kegagalan deployment?
**A**: 
1. Gunakan `azd deploy --debug` untuk output yang lebih rinci
2. Periksa riwayat deployment di portal Azure
3. Tinjau Log Aktivitas di portal Azure
4. Gunakan `azd show` untuk menampilkan status lingkungan saat ini

### Q: Mengapa variabel lingkungan saya tidak berfungsi?
**A**: Periksa:
1. Nama variabel sesuai dengan parameter template secara tepat
2. Nilai dikutip dengan benar jika mengandung spasi
3. Lingkungan dipilih: `azd env select <environment>`
4. Variabel diatur di lingkungan yang benar

### Q: Bagaimana cara membersihkan deployment yang gagal?
**A**: 
```bash
azd down --force --purge
```
Ini akan menghapus semua sumber daya dan konfigurasi lingkungan.

### Q: Mengapa aplikasi saya tidak dapat diakses setelah deployment?
**A**: Periksa:
1. Deployment selesai dengan sukses
2. Aplikasi berjalan (periksa log di portal Azure)
3. Grup keamanan jaringan memungkinkan lalu lintas
4. DNS/domain kustom dikonfigurasi dengan benar

---

## Biaya & Penagihan

### Q: Berapa biaya deployment azd?
**A**: Biaya bergantung pada:
- Layanan Azure yang dideploy
- Tingkat layanan/SKU yang dipilih
- Perbedaan harga regional
- Pola penggunaan

Gunakan [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) untuk estimasi.

### Q: Bagaimana cara mengontrol biaya dalam deployment azd?
**A**: 
1. Gunakan SKU tingkat rendah untuk lingkungan pengembangan
2. Atur anggaran dan peringatan Azure
3. Gunakan `azd down` untuk menghapus sumber daya saat tidak diperlukan
4. Pilih wilayah yang sesuai (biaya bervariasi berdasarkan lokasi)
5. Gunakan alat Manajemen Biaya Azure

### Q: Apakah ada opsi tingkat gratis untuk template azd?
**A**: Banyak layanan Azure menawarkan tingkat gratis:
- App Service: Tersedia tingkat gratis
- Azure Functions: 1 juta eksekusi gratis/bulan
- Cosmos DB: Tingkat gratis dengan 400 RU/s
- Application Insights: 5GB pertama/bulan gratis

Konfigurasikan template untuk menggunakan tingkat gratis jika tersedia.

### Q: Bagaimana cara memperkirakan biaya sebelum deployment?
**A**: 
1. Tinjau `main.bicep` dalam template untuk melihat sumber daya yang dibuat
2. Gunakan Azure Pricing Calculator dengan SKU spesifik
3. Deploy ke lingkungan pengembangan terlebih dahulu untuk memantau biaya aktual
4. Gunakan Manajemen Biaya Azure untuk analisis biaya yang mendetail

---

## Praktik Terbaik

### Q: Apa praktik terbaik untuk struktur proyek azd?
**A**: 
1. Pisahkan kode aplikasi dari infrastruktur
2. Gunakan nama layanan yang bermakna di `azure.yaml`
3. Terapkan penanganan error yang baik dalam skrip build
4. Gunakan konfigurasi spesifik lingkungan
5. Sertakan dokumentasi yang lengkap

### Q: Bagaimana cara mengatur beberapa layanan dalam azd?
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

### Q: Haruskah saya mengkomit folder `.azure` ke kontrol versi?
**A**: **Tidak!** Folder `.azure` berisi informasi sensitif. Tambahkan ke `.gitignore`:
```gitignore
.azure/
```

### Q: Bagaimana cara menangani rahasia dan konfigurasi sensitif?
**A**: 
1. Gunakan Azure Key Vault untuk rahasia
2. Referensikan rahasia Key Vault dalam konfigurasi aplikasi
3. Jangan pernah mengkomit rahasia ke kontrol versi
4. Gunakan managed identities untuk autentikasi antar layanan

### Q: Apa pendekatan yang direkomendasikan untuk CI/CD dengan azd?
**A**: 
1. Gunakan lingkungan terpisah untuk setiap tahap (dev/staging/prod)
2. Terapkan pengujian otomatis sebelum deployment
3. Gunakan service principal untuk autentikasi
4. Simpan konfigurasi sensitif dalam rahasia/variabel pipeline
5. Terapkan persetujuan untuk deployment produksi

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

### Q: Bagaimana cara mengintegrasikan azd dengan proses DevOps yang sudah ada?
**A**: 
1. Gunakan perintah azd dalam skrip pipeline yang sudah ada
2. Standarkan template azd di seluruh tim
3. Integrasikan dengan pemantauan dan peringatan yang sudah ada
4. Gunakan output JSON azd untuk integrasi pipeline

### Q: Bisakah saya menggunakan azd dengan Azure DevOps?
**A**: Ya, azd bekerja dengan sistem CI/CD apa pun. Buat pipeline Azure DevOps yang menggunakan perintah azd.

### Q: Bagaimana cara berkontribusi pada azd atau membuat template komunitas?
**A**: 
1. **Alat azd**: Berkontribusi ke [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Template**: Buat template sesuai panduan [template guidelines](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentasi**: Berkontribusi ke dokumen di [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Apa roadmap untuk azd?
**A**: Periksa [roadmap resmi](https://github.com/Azure/azure-dev/projects) untuk fitur dan peningkatan yang direncanakan.

### Q: Bagaimana cara migrasi dari alat deployment lain ke azd?
**A**:
1. Analisis arsitektur penyebaran saat ini  
2. Buat template Bicep yang setara  
3. Konfigurasikan `azure.yaml` agar sesuai dengan layanan saat ini  
4. Uji secara menyeluruh di lingkungan pengembangan  
5. Migrasikan lingkungan secara bertahap  

---

## Masih Ada Pertanyaan?

### **Cari Terlebih Dahulu**  
- Periksa [dokumentasi resmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Cari [masalah di GitHub](https://github.com/Azure/azure-dev/issues) untuk masalah serupa  

### **Dapatkan Bantuan**  
- [Diskusi GitHub](https://github.com/Azure/azure-dev/discussions) - Dukungan komunitas  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Pertanyaan teknis  
- [Azure Discord](https://discord.gg/azure) - Obrolan komunitas secara real-time  

### **Laporkan Masalah**  
- [Masalah GitHub](https://github.com/Azure/azure-dev/issues/new) - Laporan bug dan permintaan fitur  
- Sertakan log yang relevan, pesan kesalahan, dan langkah-langkah untuk mereproduksi  

### **Pelajari Lebih Lanjut**  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*FAQ ini diperbarui secara berkala. Terakhir diperbarui: 9 September 2025*  

---

**Navigasi**  
- **Pelajaran Sebelumnya**: [Glosarium](glossary.md)  
- **Pelajaran Selanjutnya**: [Panduan Belajar](study-guide.md)  

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.