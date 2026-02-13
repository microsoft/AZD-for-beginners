# Contoh - Template dan Konfigurasi AZD Praktis

**Belajar dengan Contoh - Diatur berdasarkan Bab**
- **📚 Beranda Kursus**: [AZD For Beginners](../README.md)
- **📖 Pemetaan Bab**: Contoh diatur berdasarkan kompleksitas pembelajaran
- **🚀 Contoh Lokal**: [Solusi Retail Multi-Agent](retail-scenario.md)
- **🤖 Contoh AI Eksternal**: Tautan ke repositori Azure Samples

> **📍 PENTING: Contoh Lokal vs Eksternal**  
> Repositori ini berisi **4 contoh lokal lengkap** dengan implementasi penuh:  
> - **Azure OpenAI Chat** (penyebaran GPT-4 dengan antarmuka obrolan)  
> - **Container Apps** (API Flask Sederhana + Microservices)  
> - **Aplikasi Database** (Web + Database SQL)  
> - **Retail Multi-Agent** (Solusi AI Perusahaan)  
>  
> Contoh tambahan adalah **referensi eksternal** ke repositori Azure-Samples yang dapat Anda kloning.

## Pendahuluan

Direktori ini menyediakan contoh praktis dan referensi untuk membantu Anda mempelajari Azure Developer CLI melalui praktik langsung. Skenario Retail Multi-Agent adalah implementasi lengkap yang siap produksi dan disertakan di repositori ini. Contoh tambahan merujuk ke Azure Samples resmi yang menunjukkan berbagai pola AZD.

### Legenda Peringkat Kompleksitas

- ⭐ **Pemula** - Konsep dasar, satu layanan, 15-30 menit
- ⭐⭐ **Menengah** - Beberapa layanan, integrasi database, 30-60 menit
- ⭐⭐⭐ **Lanjutan** - Arsitektur kompleks, integrasi AI, 1-2 jam
- ⭐⭐⭐⭐ **Ahli** - Siap produksi, pola perusahaan, 2+ jam

## 🎯 Apa Sebenarnya yang Ada di Repositori Ini

### ✅ Implementasi Lokal (Siap Digunakan)

#### [Aplikasi Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Penyebaran GPT-4 lengkap dengan antarmuka obrolan disertakan dalam repo ini**

- **Lokasi:** `examples/azure-openai-chat/`
- **Kompleksitas:** ⭐⭐ (Menengah)
- **Yang Disertakan:**
  - Penyebaran Azure OpenAI lengkap (GPT-4)
  - Antarmuka obrolan baris perintah Python
  - Integrasi Key Vault untuk kunci API yang aman
  - Template infrastruktur Bicep
  - Pelacakan penggunaan token dan biaya
  - Pembatasan laju dan penanganan kesalahan

**Mulai Cepat:**
```bash
# Masuk ke direktori example
cd examples/azure-openai-chat

# Deploy semuanya
azd up

# Pasang dependensi dan mulai mengobrol
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologi:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Contoh Aplikasi Container](container-app/README.md) 🆕
**Contoh penyebaran container komprehensif disertakan di repo ini**

- **Lokasi:** `examples/container-app/`
- **Kompleksitas:** ⭐-⭐⭐⭐⭐ (Pemula hingga Ahli)
- **Yang Disertakan:**
  - [Panduan Utama](container-app/README.md) - Tinjauan lengkap tentang penyebaran container
  - [API Flask Sederhana](../../../examples/container-app/simple-flask-api) - Contoh REST API dasar
  - [Arsitektur Microservices](../../../examples/container-app/microservices) - Penyebaran multi-layanan siap produksi
  - Mulai Cepat, pola Produksi, dan pola Lanjutan
  - Pemantauan, keamanan, dan optimisasi biaya

**Mulai Cepat:**
```bash
# Lihat panduan utama
cd examples/container-app

# Terapkan API Flask sederhana
cd simple-flask-api
azd up

# Terapkan contoh microservices
cd ../microservices
azd up
```

**Teknologi:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solusi Retail Multi-Agent](retail-scenario.md) 🆕
**Implementasi siap produksi lengkap disertakan dalam repo ini**

- **Lokasi:** `examples/retail-multiagent-arm-template/`
- **Kompleksitas:** ⭐⭐⭐⭐ (Lanjutan)
- **Yang Disertakan:**
  - Template penyebaran ARM lengkap
  - Arsitektur multi-agen (Agen Pelanggan + Agen Inventaris)
  - Integrasi Azure OpenAI
  - AI Search dengan RAG
  - Pemantauan komprehensif
  - Skrip penyebaran sekali klik

**Mulai Cepat:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologi:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Contoh Azure Eksternal (Klon untuk Digunakan)

Contoh berikut dipelihara di repositori Azure-Samples resmi. Klon repositori tersebut untuk mengeksplorasi berbagai pola AZD:

### Aplikasi Sederhana (Bab 1-2)

| Template | Repositori | Kompleksitas | Layanan |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cara menggunakan:**
```bash
# Klon contoh apa saja
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Sebarkan
azd up
```

### Contoh Aplikasi AI (Bab 2, 5, 8)

| Template | Repositori | Kompleksitas | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | penyebaran GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Pola Lanjutan (Bab 3-8)

| Template | Repositori | Kompleksitas | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Tujuan Pembelajaran

Dengan mengerjakan contoh-contoh ini, Anda akan:
- Mempraktikkan alur kerja Azure Developer CLI dengan skenario aplikasi realistis
- Memahami berbagai arsitektur aplikasi dan implementasi azd mereka
- Menguasai pola Infrastructure as Code untuk berbagai layanan Azure
- Menerapkan manajemen konfigurasi dan strategi penyebaran spesifik lingkungan
- Mengimplementasikan pola pemantauan, keamanan, dan penskalaan dalam konteks praktis
- Membangun pengalaman dalam pemecahan masalah dan debugging skenario penyebaran nyata

## Hasil Pembelajaran

Setelah menyelesaikan contoh-contoh ini, Anda akan mampu:
- Menyebarkan berbagai jenis aplikasi menggunakan Azure Developer CLI dengan percaya diri
- Menyesuaikan template yang disediakan ke kebutuhan aplikasi Anda sendiri
- Merancang dan mengimplementasikan pola infrastruktur kustom menggunakan Bicep
- Mengonfigurasi aplikasi multi-layanan yang kompleks dengan dependensi yang tepat
- Menerapkan praktik terbaik keamanan, pemantauan, dan kinerja dalam skenario nyata
- Memecahkan masalah dan mengoptimalkan penyebaran berdasarkan pengalaman praktis

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
1. **[Aplikasi Container - API Python Flask](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Menyebarkan REST API sederhana dengan scale-to-zero  
   **Waktu:** 20-25 menit | **Biaya:** $0-5/bulan  
   **Yang Akan Anda Pelajari:** Alur kerja azd dasar, containerization, health probes  
   **Hasil yang Diharapkan:** Endpoint API yang berfungsi mengembalikan "Hello, World!" dengan pemantauan

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Menyebarkan aplikasi web Node.js Express dengan MongoDB  
   **Waktu:** 25-35 menit | **Biaya:** $10-30/bulan  
   **Yang Akan Anda Pelajari:** Integrasi database, variabel lingkungan, connection strings  
   **Hasil yang Diharapkan:** Aplikasi todo list dengan fungsionalitas buat/baca/perbarui/hapus

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Menghosting situs statis React dengan Azure Static Web Apps  
   **Waktu:** 20-30 menit | **Biaya:** $0-10/bulan  
   **Yang Akan Anda Pelajari:** Hosting statis, fungsi serverless, penyebaran CDN  
   **Hasil yang Diharapkan:** UI React dengan backend API, SSL otomatis, CDN global

### Untuk Pengguna Menengah
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Menyebarkan GPT-4 dengan antarmuka obrolan dan manajemen kunci API yang aman  
   **Waktu:** 35-45 menit | **Biaya:** $50-200/bulan  
   **Yang Akan Anda Pelajari:** Penyebaran Azure OpenAI, integrasi Key Vault, pelacakan token  
   **Hasil yang Diharapkan:** Aplikasi obrolan yang berfungsi dengan GPT-4 dan pemantauan biaya

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Arsitektur multi-layanan siap produksi  
   **Waktu:** 45-60 menit | **Biaya:** $50-150/bulan  
   **Yang Akan Anda Pelajari:** Komunikasi layanan, antrean pesan, distributed tracing  
   **Hasil yang Diharapkan:** Sistem 2-layanan (API Gateway + Product Service) dengan pemantauan

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikasi web dengan API C# dan Azure SQL Database  
   **Waktu:** 30-45 menit | **Biaya:** $20-80/bulan  
   **Yang Akan Anda Pelajari:** Entity Framework, migrasi database, keamanan koneksi  
   **Hasil yang Diharapkan:** API C# dengan backend Azure SQL, penyebaran skema otomatis

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions dengan HTTP trigger dan Cosmos DB  
   **Waktu:** 30-40 menit | **Biaya:** $10-40/bulan  
   **Yang Akan Anda Pelajari:** Arsitektur event-driven, penskalaan serverless, integrasi NoSQL  
   **Hasil yang Diharapkan:** Function app yang merespons permintaan HTTP dengan penyimpanan Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplikasi multi-layanan Java dengan Container Apps dan API gateway  
   **Waktu:** 60-90 menit | **Biaya:** $80-200/bulan  
   **Yang Akan Anda Pelajari:** Penyebaran Spring Boot, service mesh, load balancing  
   **Hasil yang Diharapkan:** Sistem Java multi-layanan dengan penemuan layanan dan routing

### Template Microsoft Foundry

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Penyebaran GPT-4 lengkap dengan antarmuka obrolan  
   **Waktu:** 35-45 menit | **Biaya:** $50-200/bulan  
   **Hasil yang Diharapkan:** Aplikasi obrolan yang berfungsi dengan pelacakan token dan pemantauan biaya

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplikasi obrolan cerdas dengan arsitektur RAG  
   **Waktu:** 60-90 menit | **Biaya:** $100-300/bulan  
   **Hasil yang Diharapkan:** Antarmuka obrolan bertenaga RAG dengan pencarian dokumen dan kutipan

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisis dokumen menggunakan layanan Azure AI  
   **Waktu:** 40-60 menit | **Biaya:** $20-80/bulan  
   **Hasil yang Diharapkan:** API yang mengekstrak teks, tabel, dan entitas dari dokumen yang diunggah

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Alur kerja MLOps dengan Azure Machine Learning  
   **Waktu:** 2-3 jam | **Biaya:** $150-500/bulan  
   **Hasil yang Diharapkan:** Pipeline ML otomatis dengan pelatihan, penyebaran, dan pemantauan

### Skenario Dunia Nyata

#### **Retail Multi-Agent Solution** 🆕  
**[Panduan Implementasi Lengkap](./retail-scenario.md)**

A comprehensive, production-ready multi-agent customer support solution that demonstrates enterprise-grade AI application deployment with AZD. This scenario provides:

- **Complete Architecture**: Multi-agent system with specialized customer service and inventory management agents
- **Production Infrastructure**: Multi-region Azure OpenAI deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Advanced - Enterprise Production Ready)

**Perfect for**: AI developers, solution architects, and teams building production multi-agent systems

**Quick Start**: Deploy the complete solution in under 30 minutes using the included ARM template with `./deploy.sh -g myResourceGroup`

## 📋 Petunjuk Penggunaan

### Prasyarat

Sebelum menjalankan contoh apa pun:
- ✅ Langganan Azure dengan akses Owner atau Contributor
- ✅ Azure Developer CLI terinstal ([Panduan Instalasi](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop berjalan (untuk contoh berbasis container)
- ✅ Kuota Azure yang sesuai (periksa persyaratan spesifik setiap contoh)

> **💰 Peringatan Biaya:** Semua contoh membuat sumber daya Azure nyata yang akan menimbulkan biaya. Lihat README masing-masing untuk perkiraan biaya. Ingat untuk menjalankan `azd down` setelah selesai untuk menghindari biaya berkelanjutan.

### Menjalankan Contoh Secara Lokal

1. **Clone atau Salin Contoh**
   ```bash
   # Arahkan ke contoh yang diinginkan
   cd examples/simple-web-app
   ```

2. **Inisialisasi Lingkungan AZD**
   ```bash
   # Inisialisasi dengan templat yang sudah ada
   azd init
   
   # Atau buat lingkungan baru
   azd env new my-environment
   ```

3. **Konfigurasikan Lingkungan**
   ```bash
   # Tetapkan variabel yang diperlukan
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Menerapkan infrastruktur dan aplikasi
   azd up
   ```

5. **Verifikasi Deployment**
   ```bash
   # Dapatkan endpoint layanan
   azd env get-values
   
   # Uji endpoint (contoh)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indikator Keberhasilan yang Diharapkan:**
   - ✅ `azd up` selesai tanpa error
   - ✅ Endpoint layanan mengembalikan HTTP 200
   - ✅ Azure Portal menunjukkan status "Running"
   - ✅ Application Insights menerima telemetri

> **⚠️ Mengalami Masalah?** Lihat [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) untuk pemecahan masalah deployment

### Mengadaptasi Contoh

Setiap contoh berisi:
- **README.md** - Instruksi pengaturan dan kustomisasi secara rinci
- **azure.yaml** - Konfigurasi AZD dengan komentar
- **infra/** - Template Bicep dengan penjelasan parameter
- **src/** - Kode aplikasi contoh
- **scripts/** - Skrip bantuan untuk tugas umum

## 🎯 Tujuan Pembelajaran

### Kategori Contoh

#### **Deploy Dasar**
- Aplikasi layanan tunggal
- Pola infrastruktur sederhana
- Manajemen konfigurasi dasar
- Setup pengembangan hemat biaya

#### **Skenario Lanjutan**
- Arsitektur multi-layanan
- Konfigurasi jaringan kompleks
- Pola integrasi basis data
- Implementasi keamanan dan kepatuhan

#### **Pola Siap Produksi**
- Konfigurasi ketersediaan tinggi
- Monitoring dan observability
- Integrasi CI/CD
- Setup pemulihan bencana

## 📖 Deskripsi Contoh

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Pemula  
**Concepts**: Deployment dasar, REST API, integrasi basis data NoSQL

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Pemula  
**Concepts**: Hosting statis, backend serverless, pengembangan web modern

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Pemula  
**Concepts**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Lanjutan  
**Concepts**: Arsitektur multi-layanan, komunikasi layanan, antrean pesan, distributed tracing  
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
**Concepts**: Komunikasi microservices, sistem terdistribusi, pola enterprise

### Microsoft Foundry Examples

#### Azure OpenAI Chat App
**Technologies**: Azure OpenAI, Cognitive Search, App Service  
**Complexity**: Menengah  
**Concepts**: Arsitektur RAG, pencarian vektor, integrasi LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Menengah  
**Concepts**: Analisis dokumen, OCR, ekstraksi data

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Lanjutan  
**Concepts**: Pelatihan model, pipeline deployment, monitoring

## 🛠 Contoh Konfigurasi

Direktori `configurations/` berisi komponen yang dapat digunakan kembali:

### Konfigurasi Lingkungan
- Pengaturan lingkungan development
- Konfigurasi lingkungan staging
- Konfigurasi siap produksi
- Setup deployment multi-region

### Modul Bicep
- Komponen infrastruktur yang dapat digunakan ulang
- Pola sumber daya umum
- Template yang di-hardening untuk keamanan
- Konfigurasi yang dioptimalkan biaya

### Skrip Bantuan
- Otomatisasi setup lingkungan
- Skrip migrasi basis data
- Alat validasi deployment
- Utilitas pemantauan biaya

## 🔧 Panduan Kustomisasi

### Mengadaptasi Contoh untuk Kasus Anda

1. **Tinjau Prasyarat**
   - Periksa persyaratan layanan Azure
   - Verifikasi batasan langganan
   - Pahami implikasi biaya

2. **Ubah Konfigurasi**
   - Perbarui definisi layanan di `azure.yaml`
   - Sesuaikan template Bicep
   - Atur variabel lingkungan

3. **Uji Secara Menyeluruh**
   - Deploy ke lingkungan development terlebih dahulu
   - Validasi fungsionalitas
   - Uji skalabilitas dan performa

4. **Tinjauan Keamanan**
   - Tinjau kontrol akses
   - Terapkan manajemen rahasia
   - Aktifkan monitoring dan alerting

## 📊 Matriks Perbandingan

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Jalur Pembelajaran

### Rekomendasi Progresi

1. **Mulai dengan Simple Web App**
   - Pelajari konsep AZD dasar
   - Pahami alur deployment
   - Latih manajemen lingkungan

2. **Coba Static Website**
   - Jelajahi opsi hosting berbeda
   - Pelajari integrasi CDN
   - Pahami konfigurasi DNS

3. **Bergerak ke Container App**
   - Pelajari dasar-dasar containerization
   - Pahami konsep scaling
   - Latih dengan Docker

4. **Tambahkan Integrasi Basis Data**
   - Pelajari provisioning basis data
   - Pahami connection string
   - Latih manajemen rahasia

5. **Jelajahi Serverless**
   - Pahami arsitektur event-driven
   - Pelajari trigger dan binding
   - Latih dengan API

6. **Bangun Microservices**
   - Pelajari komunikasi layanan
   - Pahami sistem terdistribusi
   - Latih deployment kompleks

## 🔍 Menemukan Contoh yang Tepat

### Berdasarkan Stack Teknologi
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Berdasarkan Pola Arsitektur
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Berdasarkan Tingkat Kompleksitas
- **Pemula**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Menengah**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Lanjutan**: ML Pipeline
- **Siap Produksi Enterprise**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service dengan antrean pesan), **Retail Multi-Agent Solution** (Sistem multi-agent lengkap dengan deployment ARM template)

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
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikasi Todo dengan Node.js dan PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikasi Web React dengan API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Praktik Terbaik
- [Kerangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Kerangka Kerja Adopsi Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Berbagi Contoh

Punya contoh berguna untuk dibagikan? Kami menyambut kontribusi!

### Pedoman Pengiriman
1. Ikuti struktur direktori yang telah ditetapkan
2. Sertakan README.md yang komprehensif
3. Tambahkan komentar pada file konfigurasi
4. Uji secara menyeluruh sebelum mengirim
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

**Tip Pro**: Mulailah dengan contoh paling sederhana yang sesuai dengan tumpukan teknologi Anda, kemudian secara bertahap naik ke skenario yang lebih kompleks. Setiap contoh membangun konsep dari contoh sebelumnya!

## 🚀 Siap Memulai?

### Jalur Pembelajaran Anda

1. **Pemula Total?** → Mulai dengan [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 menit)
2. **Sudah Paham Dasar AZD?** → Coba [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 menit)
3. **Membangun Aplikasi AI?** → Mulai dengan [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 menit) atau jelajahi [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ jam)
4. **Membutuhkan Tumpukan Teknologi Tertentu?** → Gunakan bagian [Mencari Contoh yang Tepat](../../../examples) di atas

### Langkah Selanjutnya

- ✅ Tinjau [Prasyarat](../../../examples) di atas
- ✅ Pilih contoh yang sesuai dengan level keterampilan Anda (lihat [Legenda Kompleksitas](../../../examples))
- ✅ Baca README contoh secara menyeluruh sebelum menerapkan
- ✅ Atur pengingat untuk menjalankan `azd down` setelah pengujian
- ✅ Bagikan pengalaman Anda melalui GitHub Issues atau Discussions

### Butuh Bantuan?

- 📖 [FAQ](../resources/faq.md) - Pertanyaan umum dijawab
- 🐛 [Panduan Pemecahan Masalah](../docs/chapter-07-troubleshooting/common-issues.md) - Memperbaiki masalah penyebaran
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Tanyakan kepada komunitas
- 📚 [Panduan Belajar](../resources/study-guide.md) - Memperkuat pembelajaran Anda

---

**Navigasi**
- **📚 Beranda Kursus**: [AZD For Beginners](../README.md)
- **📖 Materi Belajar**: [Panduan Belajar](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glosarium](../resources/glossary.md)
- **🔧 Sumber Daya**: [FAQ](../resources/faq.md) | [Pemecahan Masalah](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Terakhir Diperbarui: November 2025 | [Laporkan Masalah](https://github.com/microsoft/AZD-for-beginners/issues) | [Sumbangkan Contoh](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->