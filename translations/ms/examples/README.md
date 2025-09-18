<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T08:18:03+00:00",
  "source_file": "examples/README.md",
  "language_code": "ms"
}
-->
# Contoh - Templat dan Konfigurasi AZD Praktikal

**Belajar Melalui Contoh - Diatur Mengikut Bab**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../README.md)
- **📖 Pemetaan Bab**: Contoh diatur mengikut tahap kesukaran pembelajaran
- **🚀 Mulakan Dengan Mudah**: [Contoh Bab 1](../../../examples)
- **🤖 Contoh AI**: [Contoh Bab 2 & 5 Penyelesaian AI](../../../examples)

## Pengenalan

Direktori ini mengandungi contoh praktikal, templat, dan senario dunia sebenar untuk membantu anda mempelajari Azure Developer CLI melalui latihan langsung. Setiap contoh menyediakan kod lengkap yang berfungsi, templat infrastruktur, dan arahan terperinci untuk pelbagai seni bina aplikasi dan corak penyebaran.

## Matlamat Pembelajaran

Dengan mengerjakan contoh-contoh ini, anda akan:
- Berlatih aliran kerja Azure Developer CLI dengan senario aplikasi yang realistik
- Memahami pelbagai seni bina aplikasi dan pelaksanaan azd mereka
- Menguasai corak Infrastruktur sebagai Kod untuk pelbagai perkhidmatan Azure
- Menerapkan pengurusan konfigurasi dan strategi penyebaran khusus persekitaran
- Melaksanakan corak pemantauan, keselamatan, dan penskalaan dalam konteks praktikal
- Membina pengalaman dengan menyelesaikan masalah dan debugging senario penyebaran sebenar

## Hasil Pembelajaran

Setelah menyelesaikan contoh-contoh ini, anda akan dapat:
- Menyebarkan pelbagai jenis aplikasi menggunakan Azure Developer CLI dengan yakin
- Menyesuaikan templat yang disediakan untuk keperluan aplikasi anda sendiri
- Merancang dan melaksanakan corak infrastruktur tersuai menggunakan Bicep
- Mengkonfigurasi aplikasi multi-perkhidmatan yang kompleks dengan kebergantungan yang betul
- Menerapkan amalan terbaik keselamatan, pemantauan, dan prestasi dalam senario sebenar
- Menyelesaikan masalah dan mengoptimumkan penyebaran berdasarkan pengalaman praktikal

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

## Contoh Permulaan Cepat

### Untuk Pemula
1. **[Aplikasi Web Mudah - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Menyebarkan aplikasi web Node.js Express dengan MongoDB
2. **[Laman Web Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Menghoskan laman web statik React dengan Azure Static Web Apps
3. **[Aplikasi Kontena - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Menyebarkan aplikasi Python Flask yang dikontena

### Untuk Pengguna Pertengahan
4. **[Aplikasi Pangkalan Data - C# dengan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Aplikasi web dengan API C# dan Pangkalan Data Azure SQL
5. **[Fungsi Tanpa Pelayan - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions dengan pencetus HTTP dan Cosmos DB
6. **[Mikroservis - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Aplikasi Java multi-perkhidmatan dengan Container Apps dan API gateway

### Templat Azure AI Foundry

1. **[Aplikasi Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Aplikasi chat pintar dengan Azure OpenAI
2. **[Pemprosesan Dokumen AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analisis dokumen menggunakan perkhidmatan AI Azure
3. **[Pipeline Pembelajaran Mesin](https://github.com/Azure-Samples/mlops-v2)** - Aliran kerja MLOps dengan Azure Machine Learning

### Senario Dunia Sebenar

#### **Penyelesaian Multi-Ejen Runcit** 🆕
**[Panduan Pelaksanaan Lengkap](./retail-scenario.md)**

Penyelesaian sokongan pelanggan multi-ejen yang komprehensif dan sedia untuk pengeluaran yang menunjukkan penyebaran aplikasi AI peringkat perusahaan dengan AZD. Senario ini menyediakan:

- **Seni Bina Lengkap**: Sistem multi-ejen dengan ejen sokongan pelanggan dan pengurusan inventori yang khusus
- **Infrastruktur Pengeluaran**: Penyebaran Azure OpenAI multi-wilayah, AI Search, Container Apps, dan pemantauan menyeluruh
- **Templat ARM Sedia Untuk Disebarkan**: Penyebaran satu klik dengan pelbagai mod konfigurasi (Minimal/Standard/Premium)
- **Ciri Lanjutan**: Validasi keselamatan red teaming, rangka kerja penilaian ejen, pengoptimuman kos, dan panduan penyelesaian masalah
- **Konteks Perniagaan Sebenar**: Kes penggunaan sokongan pelanggan peruncit dengan muat naik fail, integrasi carian, dan penskalaan dinamik

**Teknologi**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kerumitan**: ⭐⭐⭐⭐ (Lanjutan - Sedia Untuk Pengeluaran Perusahaan)

**Sesuai untuk**: Pembangun AI, arkitek penyelesaian, dan pasukan yang membina sistem multi-ejen pengeluaran

**Permulaan Cepat**: Sebarkan penyelesaian lengkap dalam masa kurang daripada 30 minit menggunakan templat ARM yang disertakan dengan `./deploy.sh -g myResourceGroup`

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

4. **Sebarkan**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Menyesuaikan Contoh

Setiap contoh termasuk:
- **README.md** - Arahan persediaan dan penyesuaian terperinci
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
- Pemantauan dan kebolehlihatan
- Integrasi CI/CD
- Persediaan pemulihan bencana

## 📖 Penerangan Contoh

### Aplikasi Web Mudah - Node.js Express
**Teknologi**: Node.js, Express, MongoDB, Container Apps  
**Kerumitan**: Pemula  
**Konsep**: Penyebaran asas, REST API, integrasi pangkalan data NoSQL

### Laman Web Statik - React SPA
**Teknologi**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kerumitan**: Pemula  
**Konsep**: Hosting statik, backend tanpa pelayan, pembangunan web moden

### Aplikasi Kontena - Python Flask
**Teknologi**: Python Flask, Docker, Container Apps, Container Registry  
**Kerumitan**: Pemula  
**Konsep**: Pengkontenaan, seni bina mikroservis, pembangunan API

### Aplikasi Pangkalan Data - C# dengan Azure SQL
**Teknologi**: C# ASP.NET Core, Pangkalan Data Azure SQL, App Service  
**Kerumitan**: Pertengahan  
**Konsep**: Entity Framework, sambungan pangkalan data, pembangunan web API

### Fungsi Tanpa Pelayan - Python Azure Functions
**Teknologi**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kerumitan**: Pertengahan  
**Konsep**: Seni bina berasaskan acara, pengkomputeran tanpa pelayan, pembangunan full-stack

### Mikroservis - Java Spring Boot
**Teknologi**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kerumitan**: Pertengahan  
**Konsep**: Komunikasi mikroservis, sistem teragih, corak perusahaan

### Contoh Azure AI Foundry

#### Aplikasi Chat Azure OpenAI
**Teknologi**: Azure OpenAI, Cognitive Search, App Service  
**Kerumitan**: Pertengahan  
**Konsep**: Seni bina RAG, carian vektor, integrasi LLM

#### Pemprosesan Dokumen AI
**Teknologi**: Azure AI Document Intelligence, Storage, Functions  
**Kerumitan**: Pertengahan  
**Konsep**: Analisis dokumen, OCR, pengekstrakan data

#### Pipeline Pembelajaran Mesin
**Teknologi**: Azure ML, MLOps, Container Registry  
**Kerumitan**: Lanjutan  
**Konsep**: Latihan model, pipeline penyebaran, pemantauan

## 🛠 Contoh Konfigurasi

Direktori `configurations/` mengandungi komponen yang boleh digunakan semula:

### Konfigurasi Persekitaran
- Tetapan persekitaran pembangunan
- Konfigurasi persekitaran staging
- Konfigurasi sedia pengeluaran
- Persediaan penyebaran multi-wilayah

### Modul Bicep
- Komponen infrastruktur yang boleh digunakan semula
- Corak sumber biasa
- Templat yang diperkuatkan keselamatan
- Konfigurasi yang dioptimumkan kos

### Skrip Pembantu
- Automasi persediaan persekitaran
- Skrip migrasi pangkalan data
- Alat validasi penyebaran
- Utiliti pemantauan kos

## 🔧 Panduan Penyesuaian

### Menyesuaikan Contoh untuk Kes Penggunaan Anda

1. **Semak Prasyarat**
   - Periksa keperluan perkhidmatan Azure
   - Sahkan had langganan
   - Fahami implikasi kos

2. **Ubah Konfigurasi**
   - Kemas kini definisi perkhidmatan `azure.yaml`
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
| Node.js Express Todo | 2 | ✅ | Asas | Asas | ⭐ |
| React SPA + Functions | 3 | ✅ | Asas | Penuh | ⭐ |
| Python Flask Container | 2 | ❌ | Asas | Penuh | ⭐ |
| C# Web API + SQL | 2 | ✅ | Penuh | Penuh | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Penuh | Penuh | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Penuh | Penuh | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Penuh | Penuh | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Asas | Penuh | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Penuh | Penuh | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Perusahaan** | **Lanjutan** | **⭐⭐⭐⭐** |

## 🎓 Laluan Pembelajaran

### Perkembangan Yang Disyorkan

1. **Mulakan Dengan Aplikasi Web Mudah**
   - Pelajari konsep asas AZD
   - Fahami aliran kerja penyebaran
   - Berlatih pengurusan persekitaran

2. **Cuba Laman Web Statik**
   - Terokai pilihan hosting yang berbeza
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

## 🔍 Mencari Contoh Yang Sesuai

### Mengikut Teknologi
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontena**: Python Flask Container App, Java Microservices
- **Pangkalan Data**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sistem Multi-Ejen**: **Retail Multi-Agent Solution**
- **Pengeluaran Perusahaan**: **Retail Multi-Agent Solution**

### Mengikut Corak Seni Bina
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Statik + Tanpa Pelayan**: React SPA + Functions, Python Functions + SPA
- **Mikroservis**: Java Spring Boot Microservices
- **Dikontena**: Python Flask Container App
- **Dikuasakan AI**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Seni Bina Multi-Ejen**: **Retail Multi-Agent Solution**
- **Multi-Perkhidmatan Perusahaan**: **Retail Multi-Agent Solution**

### Mengikut Tahap Kerumitan
- **Pemula**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Pertengahan**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Lanjutan**: ML Pipeline
- **Sedia Pengeluaran Perusahaan**: **Retail Multi-Agent Solution** (Sistem multi-ejen lengkap dengan penyebaran templat ARM)

## 📚 Sumber Tambahan

### Pautan Dokumentasi
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Templat AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Contoh Komuniti
- [Templat AZD Contoh Azure](https://github.com/Azure-Samples/azd-templates)
- [Templat Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeri Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplikasi Todo dengan C# dan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplikasi Todo dengan Python dan MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikasi Todo dengan Node.js dan PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikasi Web React dengan API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Amalan Terbaik
- [Kerangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Kerangka Kerja Pengambilan Awan](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Menyumbang Contoh

Ada contoh berguna untuk dikongsi? Kami mengalu-alukan sumbangan anda!

### Garis Panduan Penyerahan
1. Ikuti struktur direktori yang telah ditetapkan
2. Sertakan README.md yang lengkap
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

**Petua Profesional**: Mulakan dengan contoh paling mudah yang sesuai dengan teknologi anda, kemudian secara beransur-ansur beralih kepada senario yang lebih kompleks. Setiap contoh membina konsep daripada yang sebelumnya!

**Langkah Seterusnya**: 
- Pilih contoh yang sesuai dengan tahap kemahiran anda
- Ikuti arahan penyediaan dalam README contoh tersebut
- Cuba sesuaikan mengikut keperluan anda
- Kongsi pembelajaran anda dengan komuniti

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Kajian](../resources/study-guide.md)
- **Kembali ke**: [README Utama](../README.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.