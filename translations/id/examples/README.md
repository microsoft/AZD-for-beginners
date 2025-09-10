<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:19:39+00:00",
  "source_file": "examples/README.md",
  "language_code": "id"
}
-->
# Contoh - Template dan Konfigurasi Praktis AZD

## Pendahuluan

Direktori ini berisi contoh praktis, template, dan skenario dunia nyata untuk membantu Anda mempelajari Azure Developer CLI melalui praktik langsung. Setiap contoh menyediakan kode kerja lengkap, template infrastruktur, dan instruksi terperinci untuk berbagai arsitektur aplikasi dan pola penerapan.

## Tujuan Pembelajaran

Dengan mempelajari contoh-contoh ini, Anda akan:
- Mempraktikkan alur kerja Azure Developer CLI dengan skenario aplikasi yang realistis
- Memahami berbagai arsitektur aplikasi dan implementasi azd-nya
- Menguasai pola Infrastructure as Code untuk berbagai layanan Azure
- Menerapkan manajemen konfigurasi dan strategi penerapan spesifik lingkungan
- Mengimplementasikan pola pemantauan, keamanan, dan penskalaan dalam konteks praktis
- Membangun pengalaman dalam pemecahan masalah dan debugging skenario penerapan nyata

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
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Contoh Memulai Cepat

### Untuk Pemula
1. **[Aplikasi Web Sederhana - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Menerapkan aplikasi web Node.js Express dengan MongoDB
2. **[Situs Statis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hosting situs web statis React dengan Azure Static Web Apps
3. **[Aplikasi Kontainer - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Menerapkan aplikasi Python Flask yang dikontainerkan

### Untuk Pengguna Menengah
4. **[Aplikasi Database - C# dengan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Aplikasi web dengan API C# dan Azure SQL Database
5. **[Fungsi Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions dengan pemicu HTTP dan Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Aplikasi Java multi-layanan dengan Container Apps dan API gateway

### Template Azure AI Foundry

1. **[Aplikasi Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Aplikasi chat cerdas dengan Azure OpenAI
2. **[Pemrosesan Dokumen AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analisis dokumen menggunakan layanan Azure AI
3. **[Pipeline Pembelajaran Mesin](https://github.com/Azure-Samples/mlops-v2)** - Alur kerja MLOps dengan Azure Machine Learning

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
- **README.md** - Instruksi pengaturan dan penyesuaian terperinci
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

### Aplikasi Web Sederhana - Node.js Express
**Teknologi**: Node.js, Express, MongoDB, Container Apps  
**Kompleksitas**: Pemula  
**Konsep**: Penerapan dasar, REST API, integrasi database NoSQL

### Situs Statis - React SPA
**Teknologi**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitas**: Pemula  
**Konsep**: Hosting statis, backend serverless, pengembangan web modern

### Aplikasi Kontainer - Python Flask
**Teknologi**: Python Flask, Docker, Container Apps, Container Registry  
**Kompleksitas**: Pemula  
**Konsep**: Kontainerisasi, arsitektur microservices, pengembangan API

### Aplikasi Database - C# dengan Azure SQL
**Teknologi**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitas**: Menengah  
**Konsep**: Entity Framework, koneksi database, pengembangan web API

### Fungsi Serverless - Python Azure Functions
**Teknologi**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitas**: Menengah  
**Konsep**: Arsitektur berbasis event, komputasi serverless, pengembangan full-stack

### Microservices - Java Spring Boot
**Teknologi**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitas**: Menengah  
**Konsep**: Komunikasi microservices, sistem terdistribusi, pola enterprise

### Contoh Azure AI Foundry

#### Aplikasi Chat Azure OpenAI
**Teknologi**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksitas**: Menengah  
**Konsep**: Arsitektur RAG, pencarian vektor, integrasi LLM

#### Pemrosesan Dokumen AI
**Teknologi**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitas**: Menengah  
**Konsep**: Analisis dokumen, OCR, ekstraksi data

#### Pipeline Pembelajaran Mesin
**Teknologi**: Azure ML, MLOps, Container Registry  
**Kompleksitas**: Lanjutan  
**Konsep**: Pelatihan model, pipeline penerapan, pemantauan

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

## 🔧 Panduan Penyesuaian

### Menyesuaikan Contoh untuk Kebutuhan Anda

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
   - Implementasikan manajemen rahasia
   - Aktifkan pemantauan dan peringatan

## 📊 Matriks Perbandingan

| Contoh | Layanan | Database | Auth | Pemantauan | Kompleksitas |
|--------|---------|----------|------|------------|--------------|
| Node.js Express Todo | 2 | ✅ | Dasar | Dasar | ⭐ |
| React SPA + Functions | 3 | ✅ | Dasar | Lengkap | ⭐ |
| Python Flask Container | 2 | ❌ | Dasar | Lengkap | ⭐ |
| C# Web API + SQL | 2 | ✅ | Lengkap | Lengkap | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Lengkap | Lengkap | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Lengkap | Lengkap | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Lengkap | Lengkap | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Dasar | Lengkap | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Lengkap | Lengkap | ⭐⭐⭐⭐ |

## 🎓 Jalur Pembelajaran

### Progression yang Direkomendasikan

1. **Mulai dengan Aplikasi Web Sederhana**
   - Pelajari konsep dasar AZD
   - Pahami alur kerja penerapan
   - Praktikkan manajemen lingkungan

2. **Coba Situs Statis**
   - Jelajahi opsi hosting yang berbeda
   - Pelajari integrasi CDN
   - Pahami konfigurasi DNS

3. **Lanjutkan ke Aplikasi Kontainer**
   - Pelajari dasar-dasar kontainerisasi
   - Pahami konsep penskalaan
   - Praktikkan dengan Docker

4. **Tambahkan Integrasi Database**
   - Pelajari penyediaan database
   - Pahami string koneksi
   - Praktikkan manajemen rahasia

5. **Jelajahi Serverless**
   - Pahami arsitektur berbasis event
   - Pelajari tentang pemicu dan binding
   - Praktikkan dengan API

6. **Bangun Microservices**
   - Pelajari komunikasi layanan
   - Pahami sistem terdistribusi
   - Praktikkan penerapan yang kompleks

## 🔍 Menemukan Contoh yang Tepat

### Berdasarkan Teknologi
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontainer**: Python Flask Container App, Java Microservices
- **Database**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Berdasarkan Pola Arsitektur
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Statis + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Kontainerisasi**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Berdasarkan Tingkat Kompleksitas
- **Pemula**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Menengah**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Lanjutan**: ML Pipeline

## 📚 Sumber Daya Tambahan

### Tautan Dokumentasi
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Contoh Komunitas
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Galeri Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo App dengan C# dan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App dengan Python dan MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App dengan Node.js dan PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App dengan C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Praktik Terbaik
- [Kerangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Kerangka Adopsi Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Berkontribusi pada Contoh

Punya contoh berguna untuk dibagikan? Kami menyambut kontribusi!

### Panduan Pengiriman
1. Ikuti struktur direktori yang telah ditetapkan
2. Sertakan README.md yang komprehensif
3. Tambahkan komentar pada file konfigurasi
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
- Bereksperimen dengan penyesuaian
- Bagikan pembelajaran Anda dengan komunitas

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](../resources/study-guide.md)
- **Kembali ke**: [README Utama](../README.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.