<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T22:14:11+00:00",
  "source_file": "examples/README.md",
  "language_code": "ms"
}
-->
# Contoh - Templat dan Konfigurasi AZD Praktikal

## Pengenalan

Direktori ini mengandungi contoh praktikal, templat, dan senario dunia sebenar untuk membantu anda mempelajari Azure Developer CLI melalui latihan secara langsung. Setiap contoh menyediakan kod kerja lengkap, templat infrastruktur, dan arahan terperinci untuk pelbagai seni bina aplikasi dan corak penyebaran.

## Matlamat Pembelajaran

Dengan mengerjakan contoh-contoh ini, anda akan:
- Berlatih aliran kerja Azure Developer CLI dengan senario aplikasi yang realistik
- Memahami pelbagai seni bina aplikasi dan pelaksanaan azd mereka
- Menguasai corak Infrastructure as Code untuk pelbagai perkhidmatan Azure
- Menerapkan pengurusan konfigurasi dan strategi penyebaran khusus persekitaran
- Melaksanakan corak pemantauan, keselamatan, dan penskalaan dalam konteks praktikal
- Membina pengalaman dengan penyelesaian masalah dan debugging senario penyebaran sebenar

## Hasil Pembelajaran

Setelah melengkapkan contoh-contoh ini, anda akan dapat:
- Menyebarkan pelbagai jenis aplikasi menggunakan Azure Developer CLI dengan yakin
- Menyesuaikan templat yang disediakan kepada keperluan aplikasi anda sendiri
- Merancang dan melaksanakan corak infrastruktur tersuai menggunakan Bicep
- Mengkonfigurasi aplikasi multi-perkhidmatan yang kompleks dengan kebergantungan yang betul
- Menerapkan amalan terbaik keselamatan, pemantauan, dan prestasi dalam senario sebenar
- Menyelesaikan masalah dan mengoptimumkan penyebaran berdasarkan pengalaman praktikal

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

## Contoh Permulaan Cepat

### Untuk Pemula
1. **[Aplikasi Web Mudah](../../../examples/simple-web-app)** - Menyebarkan aplikasi web Node.js asas
2. **[Laman Web Statik](../../../examples/static-website)** - Menghoskan laman web statik pada Azure Storage
3. **[Aplikasi Kontena](../../../examples/container-app)** - Menyebarkan aplikasi yang dikontena

### Untuk Pengguna Pertengahan
4. **[Aplikasi Pangkalan Data](../../../examples/database-app)** - Aplikasi web dengan pangkalan data PostgreSQL
5. **[Fungsi Tanpa Pelayan](../../../examples/serverless-function)** - Azure Functions dengan pencetus HTTP
6. **[Mikroservis](../../../examples/microservices)** - Aplikasi multi-perkhidmatan dengan API gateway

## 📋 Arahan Penggunaan

### Menjalankan Contoh Secara Tempatan

1. **Klon atau Salin Contoh**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inisialisasi Persekitaran AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurasi Persekitaran**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Penyebaran**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Menyesuaikan Contoh

Setiap contoh termasuk:
- **README.md** - Arahan penyiapan dan penyesuaian terperinci
- **azure.yaml** - Konfigurasi AZD dengan komen
- **infra/** - Templat Bicep dengan penjelasan parameter
- **src/** - Kod aplikasi contoh
- **scripts/** - Skrip pembantu untuk tugas biasa

## 🎯 Objektif Pembelajaran

### Kategori Contoh

#### **Penyebaran Asas**
- Aplikasi satu perkhidmatan
- Corak infrastruktur mudah
- Pengurusan konfigurasi asas
- Tetapan pembangunan kos efektif

#### **Senario Lanjutan**
- Seni bina multi-perkhidmatan
- Konfigurasi rangkaian kompleks
- Corak integrasi pangkalan data
- Pelaksanaan keselamatan dan pematuhan

#### **Corak Sedia Pengeluaran**
- Konfigurasi ketersediaan tinggi
- Pemantauan dan pemerhatian
- Integrasi CI/CD
- Penyiapan pemulihan bencana

## 📖 Penerangan Contoh

### Aplikasi Web Mudah
**Teknologi**: Node.js, App Service, Application Insights  
**Kerumitan**: Pemula  
**Konsep**: Penyebaran asas, pembolehubah persekitaran, pemeriksaan kesihatan

### Laman Web Statik
**Teknologi**: HTML/CSS/JS, Storage Account, CDN  
**Kerumitan**: Pemula  
**Konsep**: Penghosan statik, integrasi CDN, domain tersuai

### Aplikasi Kontena
**Teknologi**: Docker, Container Apps, Container Registry  
**Kerumitan**: Pertengahan  
**Konsep**: Pengkontenaan, penskalaan, konfigurasi ingress

### Aplikasi Pangkalan Data
**Teknologi**: Python Flask, PostgreSQL, App Service  
**Kerumitan**: Pertengahan  
**Konsep**: Sambungan pangkalan data, pengurusan rahsia, migrasi

### Fungsi Tanpa Pelayan
**Teknologi**: Azure Functions, Cosmos DB, API Management  
**Kerumitan**: Pertengahan  
**Konsep**: Seni bina berasaskan acara, pengikatan, pengurusan API

### Mikroservis
**Teknologi**: Pelbagai perkhidmatan, Service Bus, API Gateway  
**Kerumitan**: Lanjutan  
**Konsep**: Komunikasi perkhidmatan, penjadualan mesej, pengimbangan beban

## 🛠 Contoh Konfigurasi

Direktori `configurations/` mengandungi komponen yang boleh digunakan semula:

### Konfigurasi Persekitaran
- Tetapan persekitaran pembangunan
- Konfigurasi persekitaran staging
- Konfigurasi sedia pengeluaran
- Penyiapan penyebaran multi-region

### Modul Bicep
- Komponen infrastruktur yang boleh digunakan semula
- Corak sumber biasa
- Templat yang diperkuat keselamatan
- Konfigurasi yang dioptimumkan kos

### Skrip Pembantu
- Automasi penyiapan persekitaran
- Skrip migrasi pangkalan data
- Alat pengesahan penyebaran
- Utiliti pemantauan kos

## 🔧 Panduan Penyesuaian

### Menyesuaikan Contoh untuk Kes Penggunaan Anda

1. **Semak Prasyarat**
   - Periksa keperluan perkhidmatan Azure
   - Sahkan had langganan
   - Fahami implikasi kos

2. **Ubah Konfigurasi**
   - Kemas kini definisi perkhidmatan dalam `azure.yaml`
   - Sesuaikan templat Bicep
   - Laraskan pembolehubah persekitaran

3. **Uji Secara Menyeluruh**
   - Sebarkan ke persekitaran pembangunan terlebih dahulu
   - Sahkan fungsi
   - Uji penskalaan dan prestasi

4. **Semakan Keselamatan**
   - Semak kawalan akses
   - Laksanakan pengurusan rahsia
   - Aktifkan pemantauan dan amaran

## 📊 Matriks Perbandingan

| Contoh | Perkhidmatan | Pangkalan Data | Auth | Pemantauan | Kerumitan |
|--------|--------------|----------------|------|------------|-----------|
| Aplikasi Web Mudah | 1 | ❌ | Asas | Asas | ⭐ |
| Laman Web Statik | 1 | ❌ | ❌ | Asas | ⭐ |
| Aplikasi Kontena | 1 | ❌ | Asas | Penuh | ⭐⭐ |
| Aplikasi Pangkalan Data | 2 | ✅ | Penuh | Penuh | ⭐⭐⭐ |
| Fungsi Tanpa Pelayan | 3 | ✅ | Penuh | Penuh | ⭐⭐⭐ |
| Mikroservis | 5+ | ✅ | Penuh | Penuh | ⭐⭐⭐⭐ |

## 🎓 Laluan Pembelajaran

### Kemajuan yang Disyorkan

1. **Mulakan dengan Aplikasi Web Mudah**
   - Pelajari konsep asas AZD
   - Fahami aliran kerja penyebaran
   - Berlatih pengurusan persekitaran

2. **Cuba Laman Web Statik**
   - Terokai pilihan penghosan yang berbeza
   - Pelajari tentang integrasi CDN
   - Fahami konfigurasi DNS

3. **Berpindah ke Aplikasi Kontena**
   - Pelajari asas pengkontenaan
   - Fahami konsep penskalaan
   - Berlatih dengan Docker

4. **Tambah Integrasi Pangkalan Data**
   - Pelajari penyediaan pangkalan data
   - Fahami rentetan sambungan
   - Berlatih pengurusan rahsia

5. **Terokai Tanpa Pelayan**
   - Fahami seni bina berasaskan acara
   - Pelajari tentang pencetus dan pengikatan
   - Berlatih dengan API

6. **Bina Mikroservis**
   - Pelajari komunikasi perkhidmatan
   - Fahami sistem teragih
   - Berlatih penyebaran kompleks

## 🔍 Mencari Contoh yang Sesuai

### Mengikut Teknologi
- **Node.js**: Aplikasi Web Mudah, Mikroservis
- **Python**: Aplikasi Pangkalan Data, Fungsi Tanpa Pelayan
- **Laman Statik**: Laman Web Statik
- **Kontena**: Aplikasi Kontena, Mikroservis
- **Pangkalan Data**: Aplikasi Pangkalan Data, Fungsi Tanpa Pelayan

### Mengikut Corak Seni Bina
- **Monolitik**: Aplikasi Web Mudah, Aplikasi Pangkalan Data
- **Statik**: Laman Web Statik
- **Mikroservis**: Contoh Mikroservis
- **Tanpa Pelayan**: Fungsi Tanpa Pelayan
- **Hibrid**: Aplikasi Kontena

### Mengikut Tahap Kerumitan
- **Pemula**: Aplikasi Web Mudah, Laman Web Statik
- **Pertengahan**: Aplikasi Kontena, Aplikasi Pangkalan Data, Fungsi Tanpa Pelayan  
- **Lanjutan**: Mikroservis

## 📚 Sumber Tambahan

### Pautan Dokumentasi
- [Spesifikasi Templat AZD](https://aka.ms/azd/templates)
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Contoh Komuniti
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Galeri Templat AZD](https://azure.github.io/awesome-azd/)

### Amalan Terbaik
- [Kerangka Seni Bina Azure yang Baik](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Kerangka Pengambilan Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Menyumbang Contoh

Ada contoh berguna untuk dikongsi? Kami mengalu-alukan sumbangan!

### Garis Panduan Penyerahan
1. Ikuti struktur direktori yang ditetapkan
2. Sertakan README.md yang komprehensif
3. Tambahkan komen pada fail konfigurasi
4. Uji dengan teliti sebelum menyerahkan
5. Sertakan anggaran kos dan prasyarat

### Struktur Templat Contoh
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

**Tip Pro**: Mulakan dengan contoh paling mudah yang sesuai dengan teknologi anda, kemudian secara beransur-ansur tingkatkan kepada senario yang lebih kompleks. Setiap contoh membina konsep daripada yang sebelumnya!

**Langkah Seterusnya**: 
- Pilih contoh yang sesuai dengan tahap kemahiran anda
- Ikuti arahan penyiapan dalam README contoh
- Bereksperimen dengan penyesuaian
- Kongsi pembelajaran anda dengan komuniti

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Kajian](../resources/study-guide.md)
- **Kembali ke**: [README Utama](../README.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.