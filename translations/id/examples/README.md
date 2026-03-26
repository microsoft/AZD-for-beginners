# Contoh - Template dan Konfigurasi AZD Praktis

**Belajar dari Contoh - Diatur per Bab**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Pemetaan Bab**: Contoh diatur berdasarkan kompleksitas pembelajaran
- **🚀 Contoh Lokal**: [Solusi Multi-Agen Retail](retail-scenario.md)
- **🤖 Contoh AI Eksternal**: Tautan ke repositori Azure Samples

> **📍 PENTING: Contoh Lokal vs Eksternal**  
> Repositori ini berisi **4 contoh lokal lengkap** dengan implementasi penuh:  
> - **Microsoft Foundry Models Chat** (deployment gpt-4.1 dengan antarmuka chat)  
> - **Container Apps** (API Flask sederhana + Mikroservis)  
> - **Aplikasi Database** (Web + SQL Database)  
> - **Retail Multi-Agent** (Solusi Enterprise AI)  
>  
> Contoh tambahan adalah **referensi eksternal** ke repositori Azure-Samples yang dapat Anda clone.

## Pendahuluan

Direktori ini menyediakan contoh praktis dan referensi untuk membantu Anda mempelajari Azure Developer CLI melalui praktik langsung. Skenario Retail Multi-Agent adalah implementasi lengkap siap produksi yang disertakan dalam repositori ini. Contoh tambahan merujuk ke Azure Samples resmi yang menunjukkan berbagai pola AZD.

### Legenda Peringkat Kompleksitas

- ⭐ **Pemula** - Konsep dasar, satu layanan, 15-30 menit
- ⭐⭐ **Menengah** - Beberapa layanan, integrasi database, 30-60 menit
- ⭐⭐⭐ **Lanjutan** - Arsitektur kompleks, integrasi AI, 1-2 jam
- ⭐⭐⭐⭐ **Ahli** - Siap produksi, pola enterprise, 2+ jam

## 🎯 Apa Saja yang Ada di Repositori Ini

### ✅ Implementasi Lokal (Siap Pakai)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Deployment gpt-4.1 lengkap dengan antarmuka chat termasuk dalam repo ini**

- **Lokasi:** `examples/azure-openai-chat/`
- **Kompleksitas:** ⭐⭐ (Menengah)
- **Yang Disertakan:**
  - Deployment Microsoft Foundry Models lengkap (gpt-4.1)
  - Antarmuka chat berbasis command-line Python
  - Integrasi Key Vault untuk kunci API yang aman
  - Template infrastruktur Bicep
  - Pelacakan penggunaan token dan biaya
  - Pembatasan laju dan penanganan kesalahan

**Mulai Cepat:**
```bash
# Masuk ke contoh
cd examples/azure-openai-chat

# Sebarkan semuanya
azd up

# Pasang dependensi dan mulai mengobrol
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologi:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Contoh Container App](container-app/README.md) 🆕
**Contoh deployment container komprehensif termasuk dalam repo ini**

- **Lokasi:** `examples/container-app/`
- **Kompleksitas:** ⭐-⭐⭐⭐⭐ (Pemula hingga Ahli)
- **Yang Disertakan:**
  - [Master Guide](container-app/README.md) - Tinjauan lengkap deployment container
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Contoh REST API dasar
  - [Microservices Architecture](../../../examples/container-app/microservices) - Deployment multi-service siap produksi
  - Pola Mulai Cepat, Produksi, dan Lanjutan
  - Pemantauan, keamanan, dan optimasi biaya

**Mulai Cepat:**
```bash
# Lihat panduan utama
cd examples/container-app

# Terapkan API Flask sederhana
cd simple-flask-api
azd up

# Terapkan contoh mikroservis
cd ../microservices
azd up
```

**Teknologi:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solusi Retail Multi-Agent](retail-scenario.md) 🆕
**Implementasi lengkap siap produksi termasuk dalam repo ini**

- **Lokasi:** `examples/retail-multiagent-arm-template/`
- **Kompleksitas:** ⭐⭐⭐⭐ (Lanjutan)
- **Yang Disertakan:**
  - Template deployment ARM lengkap
  - Arsitektur multi-agen (Customer + Inventory)
  - Integrasi Microsoft Foundry Models
  - AI Search dengan RAG
  - Pemantauan komprehensif
  - Skrip deployment satu-klik

**Mulai Cepat:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologi:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples Eksternal (Clone untuk Digunakan)

Contoh berikut dipelihara di repositori Azure-Samples resmi. Clone untuk mengeksplorasi berbagai pola AZD:

### Aplikasi Sederhana (Bab 1-2)

| Template | Repository | Kompleksitas | Layanan |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cara menggunakan:**
```bash
# Salin contoh apa pun
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Terapkan
azd up
```

### Contoh Aplikasi AI (Bab 2, 5, 8)

| Template | Repository | Kompleksitas | Fokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | deployment gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI dasar |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Kerangka agen |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Pola RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Pola Lanjutan (Bab 3-8)

| Template | Repository | Kompleksitas | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrasi database |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Tujuan Pembelajaran

Dengan mengerjakan contoh-contoh ini, Anda akan:
- Melatih alur kerja Azure Developer CLI dengan skenario aplikasi yang realistis
- Memahami berbagai arsitektur aplikasi dan implementasi azd mereka
- Menguasai pola Infrastructure as Code untuk berbagai layanan Azure
- Menerapkan manajemen konfigurasi dan strategi deployment spesifik lingkungan
- Mengimplementasikan pemantauan, keamanan, dan pola penskalaan dalam konteks praktis
- Membangun pengalaman troubleshooting dan debugging skenario deployment nyata

## Hasil Pembelajaran

Setelah menyelesaikan contoh-contoh ini, Anda akan mampu:
- Mendeploy berbagai jenis aplikasi menggunakan Azure Developer CLI dengan percaya diri
- Menyesuaikan template yang disediakan untuk kebutuhan aplikasi Anda sendiri
- Merancang dan mengimplementasikan pola infrastruktur kustom menggunakan Bicep
- Mengonfigurasi aplikasi multi-service kompleks dengan dependensi yang tepat
- Menerapkan praktik terbaik keamanan, pemantauan, dan performa dalam skenario nyata
- Memecahkan masalah dan mengoptimalkan deployment berdasarkan pengalaman praktis

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

## Contoh Mulai Cepat

> **💡 Baru di AZD?** Mulailah dengan contoh #1 (Flask API) - memakan waktu ~20 menit dan mengajarkan konsep inti.

### Untuk Pemula
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Deploy REST API sederhana dengan scale-to-zero  
   **Waktu:** 20-25 menit | **Biaya:** $0-5/bulan  
   **Yang Akan Anda Pelajari:** Alur kerja azd dasar, containerization, health probes  
   **Hasil yang Diharapkan:** Endpoint API berfungsi mengembalikan "Hello, World!" dengan pemantauan

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Deploy aplikasi web Node.js Express dengan MongoDB  
   **Waktu:** 25-35 menit | **Biaya:** $10-30/bulan  
   **Yang Akan Anda Pelajari:** Integrasi database, variabel lingkungan, connection strings  
   **Hasil yang Diharapkan:** Aplikasi todo list dengan fungsi buat/baca/perbarui/hapus

3. **[Website Statis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hosting situs statis React dengan Azure Static Web Apps  
   **Waktu:** 20-30 menit | **Biaya:** $0-10/bulan  
   **Yang Akan Anda Pelajari:** Hosting statis, fungsi serverless, deployment CDN  
   **Hasil yang Diharapkan:** UI React dengan backend API, SSL otomatis, CDN global

### Untuk Pengguna Menengah
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Deploy gpt-4.1 dengan antarmuka chat dan manajemen kunci API yang aman  
   **Waktu:** 35-45 menit | **Biaya:** $50-200/bulan  
   **Yang Akan Anda Pelajari:** Deployment Microsoft Foundry Models, integrasi Key Vault, pelacakan token  
   **Hasil yang Diharapkan:** Aplikasi chat berfungsi dengan gpt-4.1 dan pemantauan biaya

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Arsitektur multi-service siap produksi  
   **Waktu:** 45-60 menit | **Biaya:** $50-150/bulan  
   **Yang Akan Anda Pelajari:** Komunikasi layanan, antrean pesan, distributed tracing  
   **Hasil yang Diharapkan:** Sistem 2-service (API Gateway + Product Service) dengan pemantauan

6. **[Aplikasi Database - C# dengan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikasi web dengan API C# dan Azure SQL Database  
   **Waktu:** 30-45 menit | **Biaya:** $20-80/bulan  
   **Yang Akan Anda Pelajari:** Entity Framework, migrasi database, keamanan koneksi  
   **Hasil yang Diharapkan:** API C# dengan backend Azure SQL, deployment skema otomatis

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions dengan trigger HTTP dan Cosmos DB  
   **Waktu:** 30-40 menit | **Biaya:** $10-40/bulan  
   **Yang Akan Anda Pelajari:** Arsitektur event-driven, penskalaan serverless, integrasi NoSQL  
   **Hasil yang Diharapkan:** Function app merespons request HTTP dengan penyimpanan Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplikasi multi-service Java dengan Container Apps dan API gateway  
   **Waktu:** 60-90 menit | **Biaya:** $80-200/bulan  
   **Yang Akan Anda Pelajari:** Deployment Spring Boot, service mesh, load balancing  
   **Hasil yang Diharapkan:** Sistem multi-service Java dengan service discovery dan routing

### Template Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Contoh Lokal](../../../examples/azure-openai-chat)** ⭐⭐  
   Deployment gpt-4.1 lengkap dengan antarmuka chat  
   **Waktu:** 35-45 menit | **Biaya:** $50-200/bulan  
   **Hasil yang Diharapkan:** Aplikasi chat berfungsi dengan pelacakan token dan pemantauan biaya

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplikasi chat cerdas dengan arsitektur RAG  
   **Waktu:** 60-90 menit | **Biaya:** $100-300/bulan  
   **Hasil yang Diharapkan:** Antarmuka chat bertenaga RAG dengan pencarian dokumen dan sitasi

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisis dokumen menggunakan layanan Azure AI  
   **Waktu:** 40-60 menit | **Biaya:** $20-80/bulan  
   **Hasil yang Diharapkan:** API yang mengekstrak teks, tabel, dan entitas dari dokumen yang diunggah

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Alur kerja MLOps dengan Azure Machine Learning  
   **Waktu:** 2-3 jam | **Biaya:** $150-500/bulan  
   **Hasil yang Diharapkan:** Pipeline ML otomatis dengan pelatihan, deployment, dan pemantauan

### Skenario Dunia Nyata

#### **Solusi Retail Multi-Agent** 🆕
**[Panduan Implementasi Lengkap](./retail-scenario.md)**

Sebuah solusi multi-agen dukungan pelanggan yang komprehensif dan siap produksi yang menunjukkan deployment aplikasi AI tingkat enterprise dengan AZD. Skenario ini menyediakan:
- **Arsitektur Lengkap**: Sistem multi-agen dengan agen layanan pelanggan dan manajemen inventaris yang khusus
- **Infrastruktur Produksi**: Penyebaran Microsoft Foundry Models multi-wilayah, Azure AI Search, Container Apps, dan pemantauan komprehensif
- **Template ARM Siap-Disebarkan**: Penyebaran satu-klik dengan beberapa mode konfigurasi (Minimal/Standar/Premium)
- **Fitur Lanjutan**: Validasi keamanan red teaming, kerangka evaluasi agen, optimisasi biaya, dan panduan pemecahan masalah
- **Konteks Bisnis Nyata**: Kasus penggunaan dukungan pelanggan peritel dengan unggahan berkas, integrasi pencarian, dan penskalaan dinamis

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Lanjutan - Siap Produksi Perusahaan)

**Perfect for**: Pengembang AI, arsitek solusi, dan tim yang membangun sistem multi-agen produksi

**Quick Start**: Sebarkan solusi lengkap dalam kurang dari 30 menit menggunakan template ARM yang disertakan dengan `./deploy.sh -g myResourceGroup`

## 📋 Petunjuk Penggunaan

### Prasyarat

Sebelum menjalankan contoh apa pun:
- ✅ Langganan Azure dengan akses Owner atau Contributor
- ✅ Azure Developer CLI terinstal ([Panduan Instalasi](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop berjalan (untuk contoh berbasis container)
- ✅ Kuota Azure yang sesuai (periksa persyaratan khusus contoh)

> **💰 Peringatan Biaya:** Semua contoh membuat sumber daya Azure nyata yang menimbulkan biaya. Lihat file README masing-masing untuk estimasi biaya. Ingat untuk menjalankan `azd down` ketika selesai untuk menghindari biaya berkelanjutan.

### Menjalankan Contoh Secara Lokal

1. **Clone atau Salin Contoh**
   ```bash
   # Buka contoh yang diinginkan
   cd examples/simple-web-app
   ```

2. **Inisialisasi Lingkungan AZD**
   ```bash
   # Inisialisasi menggunakan templat yang sudah ada
   azd init
   
   # Atau buat lingkungan baru
   azd env new my-environment
   ```

3. **Konfigurasi Lingkungan**
   ```bash
   # Tetapkan variabel yang diperlukan
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Menyebarkan infrastruktur dan aplikasi
   azd up
   ```

5. **Verifikasi Penyebaran**
   ```bash
   # Dapatkan endpoint layanan
   azd env get-values
   
   # Uji endpoint (contoh)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indikator Keberhasilan yang Diharapkan:**
   - ✅ `azd up` selesai tanpa kesalahan
   - ✅ Endpoint layanan mengembalikan HTTP 200
   - ✅ Azure Portal menampilkan status "Running"
   - ✅ Application Insights menerima telemetri

> **⚠️ Bermasalah?** Lihat [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) untuk pemecahan masalah penyebaran

### Menyesuaikan Contoh

Setiap contoh menyertakan:
- **README.md** - Instruksi pengaturan dan kustomisasi terperinci
- **azure.yaml** - Konfigurasi AZD dengan komentar
- **infra/** - Template Bicep dengan penjelasan parameter
- **src/** - Kode aplikasi contoh
- **scripts/** - Skrip bantu untuk tugas umum

## 🎯 Tujuan Pembelajaran

### Kategori Contoh

#### **Penyebaran Dasar**
- Aplikasi layanan tunggal
- Pola infrastruktur sederhana
- Manajemen konfigurasi dasar
- Pengaturan pengembangan hemat biaya

#### **Skenario Lanjutan**
- Arsitektur multi-layanan
- Konfigurasi jaringan yang kompleks
- Pola integrasi basis data
- Implementasi keamanan dan kepatuhan

#### **Pola Siap-Produksi**
- Konfigurasi ketersediaan tinggi
- Pemantauan dan observabilitas
- Integrasi CI/CD
- Pengaturan pemulihan bencana

## 📖 Deskripsi Contoh

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Pemula  
**Concepts**: Penyebaran dasar, REST API, integrasi basis data NoSQL

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Pemula  
**Concepts**: Hosting statis, backend serverless, pengembangan web modern

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Pemula  
**Concepts**: Containerization, REST API, scale-to-zero, health probes, pemantauan  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Lanjutan  
**Concepts**: Arsitektur multi-layanan, komunikasi layanan, antrian pesan, distributed tracing  
**Location**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Menengah  
**Concepts**: Entity Framework, koneksi basis data, pengembangan web API

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Menengah  
**Concepts**: Arsitektur event-driven, komputasi serverless, pengembangan full-stack

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Menengah  
**Concepts**: Komunikasi microservices, sistem terdistribusi, pola perusahaan

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexity**: Menengah  
**Concepts**: Arsitektur RAG, pencarian vektor, integrasi LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Menengah  
**Concepts**: Analisis dokumen, OCR, ekstraksi data

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Lanjutan  
**Concepts**: Pelatihan model, pipeline penyebaran, pemantauan

## 🛠 Contoh Konfigurasi

Direktori `configurations/` berisi komponen yang dapat digunakan ulang:

### Konfigurasi Lingkungan
- Pengaturan lingkungan pengembangan
- Konfigurasi lingkungan staging
- Konfigurasi siap-produksi
- Pengaturan penyebaran multi-wilayah

### Modul Bicep
- Komponen infrastruktur yang dapat digunakan ulang
- Pola sumber daya umum
- Template yang diperkuat keamanannya
- Konfigurasi yang dioptimalkan biaya

### Skrip Bantu
- Otomatisasi pengaturan lingkungan
- Skrip migrasi basis data
- Alat validasi penyebaran
- Utilitas pemantauan biaya

## 🔧 Panduan Kustomisasi

### Menyesuaikan Contoh untuk Kasus Penggunaan Anda

1. **Tinjau Prasyarat**
   - Periksa persyaratan layanan Azure
   - Verifikasi batasan langganan
   - Pahami implikasi biaya

2. **Ubah Konfigurasi**
   - Perbarui definisi layanan di `azure.yaml`
   - Sesuaikan template Bicep
   - Atur variabel lingkungan

3. **Uji Secara Menyeluruh**
   - Deploy ke lingkungan pengembangan terlebih dahulu
   - Validasi fungsionalitas
   - Uji penskalaan dan kinerja

4. **Tinjauan Keamanan**
   - Tinjau kontrol akses
   - Terapkan manajemen rahasia
   - Aktifkan pemantauan dan pemberitahuan

## 📊 Matriks Perbandingan

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Solusi Multi-Agen Ritel** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Jalur Pembelajaran

### Rekomendasi Progresi

1. **Mulai dengan Simple Web App**
   - Pelajari konsep dasar AZD
   - Pahami alur kerja penyebaran
   - Latih manajemen lingkungan

2. **Coba Static Website**
   - Jelajahi opsi hosting berbeda
   - Pelajari integrasi CDN
   - Pahami konfigurasi DNS

3. **Lanjut ke Container App**
   - Pelajari dasar-dasar containerization
   - Pahami konsep penskalaan
   - Latih dengan Docker

4. **Tambahkan Integrasi Basis Data**
   - Pelajari penyediaan basis data
   - Pahami connection string
   - Latih manajemen rahasia

5. **Jelajahi Serverless**
   - Pahami arsitektur event-driven
   - Pelajari tentang triggers dan bindings
   - Latih dengan API

6. **Bangun Microservices**
   - Pelajari komunikasi layanan
   - Pahami sistem terdistribusi
   - Latih penyebaran kompleks

## 🔍 Menemukan Contoh yang Tepat

### Berdasarkan Stack Teknologi
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Solusi Multi-Agen Ritel**
- **Multi-Agent Systems**: **Solusi Multi-Agen Ritel**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Solusi Multi-Agen Ritel
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Solusi Multi-Agen Ritel**

### Berdasarkan Pola Arsitektur
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **Ditenagai AI**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Solusi Multi-Agen Ritel**
- **Arsitektur Multi-Agen**: **Solusi Multi-Agen Ritel**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Solusi Multi-Agen Ritel**

### Berdasarkan Tingkat Kompleksitas
- **Pemula**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Menengah**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Lanjutan**: ML Pipeline
- **Siap-Produksi Perusahaan**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service dengan antrian pesan), **Solusi Multi-Agen Ritel** (Sistem multi-agen lengkap dengan penyebaran template ARM)

## 📚 Sumber Daya Tambahan

### Tautan Dokumentasi
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Contoh Komunitas
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Aplikasi Todo dengan C# dan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplikasi Todo dengan Python dan MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikasi Todo dengan Node.js dan PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikasi Web React dengan API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Pekerjaan Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Praktik Terbaik
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Kontribusi Contoh

Punya contoh yang berguna untuk dibagikan? Kami menyambut kontribusi!

### Pedoman Pengiriman
1. Ikuti struktur direktori yang sudah ditetapkan
2. Sertakan README.md yang komprehensif
3. Tambahkan komentar pada file konfigurasi
4. Uji secara menyeluruh sebelum mengirimkan
5. Sertakan perkiraan biaya dan prasyarat

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

**Pro Tip**: Mulailah dengan contoh paling sederhana yang sesuai dengan tumpukan teknologi Anda, lalu secara bertahap tingkatkan ke skenario yang lebih kompleks. Setiap contoh membangun konsep dari contoh sebelumnya!

## 🚀 Siap Memulai?

### Jalur Pembelajaran Anda

1. **Benar-benar Pemula?** → Mulai dengan [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **Sudah Memiliki Pengetahuan AZD Dasar?** → Coba [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **Membangun Aplikasi AI?** → Mulai dengan [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) atau jelajahi [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **Butuh Tumpukan Teknologi Tertentu?** → Gunakan bagian [Finding the Right Example](#-finding-the-right-example) di atas

### Langkah Selanjutnya

- ✅ Tinjau [Prerequisites](#prasyarat) di atas
- ✅ Pilih contoh yang sesuai dengan tingkat keterampilan Anda (lihat [Complexity Legend](#legenda-peringkat-kompleksitas))
- ✅ Baca README contoh secara menyeluruh sebelum menerapkan
- ✅ Buat pengingat untuk menjalankan `azd down` setelah pengujian
- ✅ Bagikan pengalaman Anda melalui GitHub Issues atau Discussions

### Butuh Bantuan?

- 📖 [FAQ](../resources/faq.md) - Pertanyaan umum dijawab
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Perbaiki masalah deployment
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Tanyakan pada komunitas
- 📚 [Study Guide](../resources/study-guide.md) - Perkuat pembelajaran Anda

---

**Navigasi**
- **📚 Beranda Kursus**: [AZD For Beginners](../README.md)
- **📖 Materi Studi**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Sumber Daya**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Terakhir Diperbarui: November 2025 | [Laporkan Masalah](https://github.com/microsoft/AZD-for-beginners/issues) | [Kontribusikan Contoh](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk akurat, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang kritis, disarankan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang salah yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->