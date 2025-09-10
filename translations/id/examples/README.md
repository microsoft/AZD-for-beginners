<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:21:06+00:00",
  "source_file": "examples/README.md",
  "language_code": "id"
}
-->
# Contoh - Template dan Konfigurasi AZD Praktis

## Pendahuluan

Direktori ini berisi contoh praktis, template, dan skenario dunia nyata untuk membantu Anda mempelajari Azure Developer CLI melalui praktik langsung. Setiap contoh menyediakan kode yang berfungsi penuh, template infrastruktur, dan instruksi terperinci untuk berbagai arsitektur aplikasi dan pola penerapan.

## Tujuan Pembelajaran

Dengan mempelajari contoh-contoh ini, Anda akan:
- Mempraktikkan alur kerja Azure Developer CLI dengan skenario aplikasi yang realistis
- Memahami berbagai arsitektur aplikasi dan implementasi azd-nya
- Menguasai pola Infrastructure as Code untuk berbagai layanan Azure
- Menerapkan manajemen konfigurasi dan strategi penerapan spesifik lingkungan
- Mengimplementasikan pola pemantauan, keamanan, dan penskalaan dalam konteks praktis
- Membangun pengalaman dalam memecahkan masalah dan debugging skenario penerapan nyata

## Hasil Pembelajaran

Setelah menyelesaikan contoh-contoh ini, Anda akan dapat:
- Menerapkan berbagai jenis aplikasi menggunakan Azure Developer CLI dengan percaya diri
- Menyesuaikan template yang disediakan untuk kebutuhan aplikasi Anda sendiri
- Merancang dan mengimplementasikan pola infrastruktur khusus menggunakan Bicep
- Mengonfigurasi aplikasi multi-layanan yang kompleks dengan dependensi yang tepat
- Menerapkan praktik terbaik keamanan, pemantauan, dan kinerja dalam skenario nyata
- Memecahkan masalah dan mengoptimalkan penerapan berdasarkan pengalaman praktis

## Struktur Direktori

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Contoh Memulai Cepat

### Untuk Pemula
1. **[Aplikasi Web Sederhana](../../../examples/simple-web-app)** - Menerapkan aplikasi web Node.js dasar
2. **[Situs Web Statis](../../../examples/static-website)** - Menyimpan situs web statis di Azure Storage
3. **[Aplikasi Kontainer](../../../examples/container-app)** - Menerapkan aplikasi yang dikontainerisasi

### Untuk Pengguna Menengah
4. **[Aplikasi Database](../../../examples/database-app)** - Aplikasi web dengan database PostgreSQL
5. **[Fungsi Tanpa Server](../../../examples/serverless-function)** - Azure Functions dengan pemicu HTTP
6. **[Mikroservis](../../../examples/microservices)** - Aplikasi multi-layanan dengan API gateway

## 📋 Instruksi Penggunaan

### Menjalankan Contoh Secara Lokal

1. **Clone atau Salin Contoh**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inisialisasi Lingkungan AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurasi Lingkungan**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Penerapan**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Menyesuaikan Contoh

Setiap contoh mencakup:
- **README.md** - Instruksi pengaturan dan kustomisasi yang terperinci
- **azure.yaml** - Konfigurasi AZD dengan komentar
- **infra/** - Template Bicep dengan penjelasan parameter
- **src/** - Kode aplikasi contoh
- **scripts/** - Skrip pembantu untuk tugas umum

## 🎯 Tujuan Pembelajaran

### Kategori Contoh

#### **Penerapan Dasar**
- Aplikasi layanan tunggal
- Pola infrastruktur sederhana
- Manajemen konfigurasi dasar
- Pengaturan pengembangan yang hemat biaya

#### **Skenario Lanjutan**
- Arsitektur multi-layanan
- Konfigurasi jaringan yang kompleks
- Pola integrasi database
- Implementasi keamanan dan kepatuhan

#### **Pola Siap Produksi**
- Konfigurasi ketersediaan tinggi
- Pemantauan dan observabilitas
- Integrasi CI/CD
- Pengaturan pemulihan bencana

## 📖 Deskripsi Contoh

### Aplikasi Web Sederhana
**Teknologi**: Node.js, App Service, Application Insights  
**Kompleksitas**: Pemula  
**Konsep**: Penerapan dasar, variabel lingkungan, pemeriksaan kesehatan

### Situs Web Statis
**Teknologi**: HTML/CSS/JS, Storage Account, CDN  
**Kompleksitas**: Pemula  
**Konsep**: Hosting statis, integrasi CDN, domain kustom

### Aplikasi Kontainer
**Teknologi**: Docker, Container Apps, Container Registry  
**Kompleksitas**: Menengah  
**Konsep**: Kontainerisasi, penskalaan, konfigurasi ingress

### Aplikasi Database
**Teknologi**: Python Flask, PostgreSQL, App Service  
**Kompleksitas**: Menengah  
**Konsep**: Koneksi database, manajemen rahasia, migrasi

### Fungsi Tanpa Server
**Teknologi**: Azure Functions, Cosmos DB, API Management  
**Kompleksitas**: Menengah  
**Konsep**: Arsitektur berbasis peristiwa, binding, manajemen API

### Mikroservis
**Teknologi**: Layanan multi, Service Bus, API Gateway  
**Kompleksitas**: Lanjutan  
**Konsep**: Komunikasi layanan, antrian pesan, penyeimbangan beban

## 🛠 Contoh Konfigurasi

Direktori `configurations/` berisi komponen yang dapat digunakan kembali:

### Konfigurasi Lingkungan
- Pengaturan lingkungan pengembangan
- Konfigurasi lingkungan staging
- Konfigurasi siap produksi
- Pengaturan penerapan multi-region

### Modul Bicep
- Komponen infrastruktur yang dapat digunakan kembali
- Pola sumber daya umum
- Template yang diperkuat keamanan
- Konfigurasi yang dioptimalkan biaya

### Skrip Pembantu
- Otomasi pengaturan lingkungan
- Skrip migrasi database
- Alat validasi penerapan
- Utilitas pemantauan biaya

## 🔧 Panduan Kustomisasi

### Menyesuaikan Contoh untuk Kasus Penggunaan Anda

1. **Tinjau Prasyarat**
   - Periksa persyaratan layanan Azure
   - Verifikasi batas langganan
   - Pahami implikasi biaya

2. **Modifikasi Konfigurasi**
   - Perbarui definisi layanan di `azure.yaml`
   - Sesuaikan template Bicep
   - Sesuaikan variabel lingkungan

3. **Uji Secara Menyeluruh**
   - Terapkan ke lingkungan pengembangan terlebih dahulu
   - Validasi fungsionalitas
   - Uji penskalaan dan kinerja

4. **Tinjauan Keamanan**
   - Tinjau kontrol akses
   - Terapkan manajemen rahasia
   - Aktifkan pemantauan dan pemberitahuan

## 📊 Matriks Perbandingan

| Contoh | Layanan | Database | Auth | Pemantauan | Kompleksitas |
|--------|---------|----------|------|------------|--------------|
| Aplikasi Web Sederhana | 1 | ❌ | Dasar | Dasar | ⭐ |
| Situs Web Statis | 1 | ❌ | ❌ | Dasar | ⭐ |
| Aplikasi Kontainer | 1 | ❌ | Dasar | Penuh | ⭐⭐ |
| Aplikasi Database | 2 | ✅ | Penuh | Penuh | ⭐⭐⭐ |
| Fungsi Tanpa Server | 3 | ✅ | Penuh | Penuh | ⭐⭐⭐ |
| Mikroservis | 5+ | ✅ | Penuh | Penuh | ⭐⭐⭐⭐ |

## 🎓 Jalur Pembelajaran

### Kemajuan yang Direkomendasikan

1. **Mulai dengan Aplikasi Web Sederhana**
   - Pelajari konsep dasar AZD
   - Pahami alur kerja penerapan
   - Praktikkan manajemen lingkungan

2. **Coba Situs Web Statis**
   - Jelajahi opsi hosting yang berbeda
   - Pelajari tentang integrasi CDN
   - Pahami konfigurasi DNS

3. **Lanjutkan ke Aplikasi Kontainer**
   - Pelajari dasar-dasar kontainerisasi
   - Pahami konsep penskalaan
   - Praktikkan dengan Docker

4. **Tambahkan Integrasi Database**
   - Pelajari penyediaan database
   - Pahami string koneksi
   - Praktikkan manajemen rahasia

5. **Jelajahi Fungsi Tanpa Server**
   - Pahami arsitektur berbasis peristiwa
   - Pelajari tentang pemicu dan binding
   - Praktikkan dengan API

6. **Bangun Mikroservis**
   - Pelajari komunikasi layanan
   - Pahami sistem terdistribusi
   - Praktikkan penerapan yang kompleks

## 🔍 Menemukan Contoh yang Tepat

### Berdasarkan Teknologi
- **Node.js**: Aplikasi Web Sederhana, Mikroservis
- **Python**: Aplikasi Database, Fungsi Tanpa Server
- **Situs Statis**: Situs Web Statis
- **Kontainer**: Aplikasi Kontainer, Mikroservis
- **Database**: Aplikasi Database, Fungsi Tanpa Server

### Berdasarkan Pola Arsitektur
- **Monolitik**: Aplikasi Web Sederhana, Aplikasi Database
- **Statis**: Situs Web Statis
- **Mikroservis**: Contoh Mikroservis
- **Tanpa Server**: Fungsi Tanpa Server
- **Hibrid**: Aplikasi Kontainer

### Berdasarkan Tingkat Kompleksitas
- **Pemula**: Aplikasi Web Sederhana, Situs Web Statis
- **Menengah**: Aplikasi Kontainer, Aplikasi Database, Fungsi Tanpa Server  
- **Lanjutan**: Mikroservis

## 📚 Sumber Daya Tambahan

### Tautan Dokumentasi
- [Template AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Pusat Arsitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Contoh Komunitas
- [Template AZD Contoh Azure](https://github.com/Azure-Samples/azd-templates)
- [Template Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeri Azure Developer CLI](https://azure.github.io/awesome-azd/)

### Praktik Terbaik
- [Kerangka Kerja Arsitektur yang Baik Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Kerangka Kerja Adopsi Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Berkontribusi pada Contoh

Punya contoh berguna untuk dibagikan? Kami menyambut kontribusi!

### Panduan Pengiriman
1. Ikuti struktur direktori yang telah ditetapkan
2. Sertakan README.md yang komprehensif
3. Tambahkan komentar ke file konfigurasi
4. Uji secara menyeluruh sebelum mengirimkan
5. Sertakan estimasi biaya dan prasyarat

### Struktur Template Contoh
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Tips Profesional**: Mulailah dengan contoh paling sederhana yang sesuai dengan teknologi Anda, lalu secara bertahap tingkatkan ke skenario yang lebih kompleks. Setiap contoh membangun konsep dari yang sebelumnya!

**Langkah Selanjutnya**: 
- Pilih contoh yang sesuai dengan tingkat keahlian Anda
- Ikuti instruksi pengaturan di README contoh
- Bereksperimen dengan kustomisasi
- Bagikan pembelajaran Anda dengan komunitas

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](../resources/study-guide.md)
- **Kembali ke**: [README Utama](../README.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.