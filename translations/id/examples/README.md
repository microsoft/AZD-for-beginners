# Contoh - Template dan Konfigurasi AZD Praktis

**Belajar dengan Contoh - Diatur berdasarkan Bab**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Pemetaan Bab**: Contoh diatur berdasarkan tingkat kompleksitas pembelajaran
- **🚀 Contoh Lokal**: [Solusi Multi-Agent Retail](retail-scenario.md)
- **🤖 Contoh AI Eksternal**: Tautan ke repositori Azure Samples

> **📍 PENTING: Contoh Lokal vs Eksternal**  
> Repositori ini berisi **4 contoh lokal lengkap** dengan implementasi penuh:  
> - **Azure OpenAI Chat** (Penerapan GPT-4 dengan antarmuka chat)  
> - **Container Apps** (API Flask sederhana + Arsitektur Microservices)  
> - **Database App** (Web + Database SQL)  
> - **Retail Multi-Agent** (Solusi AI Perusahaan)  
>  
> Contoh tambahan adalah **referensi eksternal** ke repositori Azure-Samples yang dapat Anda kloning.

## Pendahuluan

Direktori ini menyediakan contoh praktis dan referensi untuk membantu Anda mempelajari Azure Developer CLI melalui praktik langsung. Skenario Multi-Agent Retail adalah implementasi lengkap yang siap produksi dan termasuk dalam repositori ini. Contoh tambahan merujuk pada Azure Samples resmi yang menunjukkan berbagai pola AZD.

### Legenda Tingkat Kompleksitas

- ⭐ **Pemula** - Konsep dasar, layanan tunggal, 15-30 menit
- ⭐⭐ **Menengah** - Layanan ganda, integrasi database, 30-60 menit
- ⭐⭐⭐ **Lanjutan** - Arsitektur kompleks, integrasi AI, 1-2 jam
- ⭐⭐⭐⭐ **Ahli** - Siap produksi, pola perusahaan, 2+ jam

## 🎯 Apa yang Ada di Repositori Ini

### ✅ Implementasi Lokal (Siap Digunakan)

#### [Aplikasi Chat Azure OpenAI](azure-openai-chat/README.md) 🆕
**Penerapan GPT-4 lengkap dengan antarmuka chat termasuk dalam repositori ini**

- **Lokasi:** `examples/azure-openai-chat/`
- **Kompleksitas:** ⭐⭐ (Menengah)
- **Yang Termasuk:**
  - Penerapan Azure OpenAI lengkap (GPT-4)
  - Antarmuka chat berbasis Python command-line
  - Integrasi Key Vault untuk keamanan API key
  - Template infrastruktur Bicep
  - Pelacakan penggunaan token dan biaya
  - Pembatasan tingkat dan penanganan error

**Panduan Cepat:**
```bash
# Navigasikan ke contoh
cd examples/azure-openai-chat

# Sebarkan semuanya
azd up

# Instal dependensi dan mulai mengobrol
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologi:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Contoh Container App](container-app/README.md) 🆕
**Contoh penerapan container yang komprehensif termasuk dalam repositori ini**

- **Lokasi:** `examples/container-app/`
- **Kompleksitas:** ⭐-⭐⭐⭐⭐ (Pemula hingga Ahli)
- **Yang Termasuk:**
  - [Panduan Utama](container-app/README.md) - Ikhtisar lengkap penerapan container
  - [API Flask Sederhana](../../../examples/container-app/simple-flask-api) - Contoh REST API dasar
  - [Arsitektur Microservices](../../../examples/container-app/microservices) - Penerapan multi-layanan siap produksi
  - Pola Cepat, Produksi, dan Lanjutan
  - Pemantauan, keamanan, dan optimasi biaya

**Panduan Cepat:**
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

#### [Solusi Multi-Agent Retail](retail-scenario.md) 🆕
**Implementasi siap produksi lengkap termasuk dalam repositori ini**

- **Lokasi:** `examples/retail-multiagent-arm-template/`
- **Kompleksitas:** ⭐⭐⭐⭐ (Lanjutan)
- **Yang Termasuk:**
  - Template penerapan ARM lengkap
  - Arsitektur multi-agent (Pelanggan + Inventaris)
  - Integrasi Azure OpenAI
  - Pencarian AI dengan RAG
  - Pemantauan komprehensif
  - Skrip penerapan satu klik

**Panduan Cepat:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologi:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples Eksternal (Klon untuk Digunakan)

Contoh berikut dikelola dalam repositori resmi Azure-Samples. Klon untuk mengeksplorasi berbagai pola AZD:

### Aplikasi Sederhana (Bab 1-2)

| Template | Repository | Kompleksitas | Layanan |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-layanan, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cara Menggunakan:**
```bash
# Klon contoh apa saja
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Terapkan
azd up
```

### Contoh Aplikasi AI (Bab 2, 5, 8)

| Template | Repository | Kompleksitas | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Penerapan GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat AI dasar |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Kerangka kerja agen |
| **Demo Search + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Pola RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI Perusahaan |

### Database & Pola Lanjutan (Bab 3-8)

| Template | Repository | Kompleksitas | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrasi database |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-layanan |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Tujuan Pembelajaran

Dengan bekerja melalui contoh-contoh ini, Anda akan:
- Mempraktikkan alur kerja Azure Developer CLI dengan skenario aplikasi yang realistis
- Memahami berbagai arsitektur aplikasi dan implementasi azd-nya
- Menguasai pola Infrastructure as Code untuk berbagai layanan Azure
- Menerapkan manajemen konfigurasi dan strategi penerapan spesifik lingkungan
- Mengimplementasikan pola pemantauan, keamanan, dan penskalaan dalam konteks praktis
- Membangun pengalaman dengan pemecahan masalah dan debugging skenario penerapan nyata

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

## Contoh Panduan Cepat

> **💡 Baru di AZD?** Mulailah dengan contoh #1 (Flask API) - membutuhkan waktu ~20 menit dan mengajarkan konsep inti.

### Untuk Pemula
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Terapkan REST API sederhana dengan scale-to-zero  
   **Waktu:** 20-25 menit | **Biaya:** $0-5/bulan  
   **Yang Akan Dipelajari:** Alur kerja azd dasar, kontainerisasi, health probes  
   **Hasil yang Diharapkan:** Endpoint API yang berfungsi mengembalikan "Hello, World!" dengan pemantauan

2. **[Aplikasi Web Sederhana - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Terapkan aplikasi web Node.js Express dengan MongoDB  
   **Waktu:** 25-35 menit | **Biaya:** $10-30/bulan  
   **Yang Akan Dipelajari:** Integrasi database, variabel lingkungan, string koneksi  
   **Hasil yang Diharapkan:** Aplikasi daftar tugas dengan fungsi create/read/update/delete

3. **[Website Statis - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hosting website statis React dengan Azure Static Web Apps  
   **Waktu:** 20-30 menit | **Biaya:** $0-10/bulan  
   **Yang Akan Dipelajari:** Hosting statis, fungsi serverless, penerapan CDN  
   **Hasil yang Diharapkan:** UI React dengan backend API, SSL otomatis, CDN global

### Untuk Pengguna Menengah
4. **[Aplikasi Chat Azure OpenAI](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Terapkan GPT-4 dengan antarmuka chat dan manajemen API key yang aman  
   **Waktu:** 35-45 menit | **Biaya:** $50-200/bulan  
   **Yang Akan Dipelajari:** Penerapan Azure OpenAI, integrasi Key Vault, pelacakan token  
   **Hasil yang Diharapkan:** Aplikasi chat yang berfungsi dengan GPT-4 dan pemantauan biaya

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Arsitektur multi-layanan siap produksi  
   **Waktu:** 45-60 menit | **Biaya:** $50-150/bulan  
   **Yang Akan Dipelajari:** Komunikasi layanan, antrian pesan, pelacakan terdistribusi  
   **Hasil yang Diharapkan:** Sistem 2-layanan (API Gateway + Product Service) dengan pemantauan

6. **[Aplikasi Database - C# dengan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikasi web dengan API C# dan Azure SQL Database  
   **Waktu:** 30-45 menit | **Biaya:** $20-80/bulan  
   **Yang Akan Dipelajari:** Entity Framework, migrasi database, keamanan koneksi  
   **Hasil yang Diharapkan:** API C# dengan backend Azure SQL, penerapan skema otomatis

7. **[Fungsi Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions dengan pemicu HTTP dan Cosmos DB  
   **Waktu:** 30-40 menit | **Biaya:** $10-40/bulan  
   **Yang Akan Dipelajari:** Arsitektur berbasis event, penskalaan serverless, integrasi NoSQL  
   **Hasil yang Diharapkan:** Aplikasi fungsi yang merespons permintaan HTTP dengan penyimpanan Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplikasi Java multi-layanan dengan Container Apps dan API gateway  
   **Waktu:** 60-90 menit | **Biaya:** $80-200/bulan  
   **Yang Akan Dipelajari:** Penerapan Spring Boot, service mesh, load balancing  
   **Hasil yang Diharapkan:** Sistem Java multi-layanan dengan penemuan layanan dan routing

### Template Foundry AI Azure

1. **[Aplikasi Chat Azure OpenAI - Contoh Lokal](../../../examples/azure-openai-chat)** ⭐⭐  
   Penerapan GPT-4 lengkap dengan antarmuka chat  
   **Waktu:** 35-45 menit | **Biaya:** $50-200/bulan  
   **Hasil yang Diharapkan:** Aplikasi chat yang berfungsi dengan pelacakan token dan pemantauan biaya

2. **[Demo Azure Search + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplikasi chat cerdas dengan arsitektur RAG  
   **Waktu:** 60-90 menit | **Biaya:** $100-300/bulan  
   **Hasil yang Diharapkan:** Antarmuka chat berbasis RAG dengan pencarian dokumen dan kutipan

3. **[Pemrosesan Dokumen AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisis dokumen menggunakan layanan AI Azure  
   **Waktu:** 40-60 menit | **Biaya:** $20-80/bulan  
   **Hasil yang Diharapkan:** API yang mengekstrak teks, tabel, dan entitas dari dokumen yang diunggah

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Alur kerja MLOps dengan Azure Machine Learning  
   **Waktu:** 2-3 jam | **Biaya:** $150-500/bulan  
   **Hasil yang Diharapkan:** Pipeline ML otomatis dengan pelatihan, penerapan, dan pemantauan

### Skenario Dunia Nyata

#### **Solusi Multi-Agent Retail** 🆕
**[Panduan Implementasi Lengkap](./retail-scenario.md)**

Solusi dukungan pelanggan multi-agent yang komprehensif dan siap produksi yang menunjukkan penerapan aplikasi AI tingkat perusahaan dengan AZD. Skenario ini menyediakan:

- **Arsitektur Lengkap**: Sistem multi-agent dengan agen layanan pelanggan dan manajemen inventaris khusus
- **Infrastruktur Produksi**: Penerapan Azure OpenAI multi-region, AI Search, Container Apps, dan pemantauan yang komprehensif  
- **Template ARM Siap Pakai**: Penerapan satu klik dengan beberapa mode konfigurasi (Minimal/Standar/Premium)  
- **Fitur Canggih**: Validasi keamanan red teaming, kerangka evaluasi agen, optimasi biaya, dan panduan pemecahan masalah  
- **Konteks Bisnis Nyata**: Kasus penggunaan dukungan pelanggan untuk ritel dengan unggahan file, integrasi pencarian, dan penskalaan dinamis  

**Teknologi**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kompleksitas**: ⭐⭐⭐⭐ (Lanjutan - Siap Produksi untuk Perusahaan)  

**Cocok untuk**: Pengembang AI, arsitek solusi, dan tim yang membangun sistem multi-agen produksi  

**Mulai Cepat**: Terapkan solusi lengkap dalam waktu kurang dari 30 menit menggunakan template ARM yang disertakan dengan `./deploy.sh -g myResourceGroup`  

## 📋 Petunjuk Penggunaan  

### Prasyarat  

Sebelum menjalankan contoh apa pun:  
- ✅ Langganan Azure dengan akses Pemilik atau Kontributor  
- ✅ Azure Developer CLI terinstal ([Panduan Instalasi](../docs/getting-started/installation.md))  
- ✅ Docker Desktop berjalan (untuk contoh container)  
- ✅ Kuota Azure yang sesuai (periksa persyaratan spesifik contoh)  

> **💰 Peringatan Biaya:** Semua contoh membuat sumber daya Azure nyata yang akan dikenakan biaya. Lihat file README masing-masing untuk estimasi biaya. Ingat untuk menjalankan `azd down` setelah selesai untuk menghindari biaya berkelanjutan.  

### Menjalankan Contoh Secara Lokal  

1. **Clone atau Salin Contoh**  
   ```bash
   # Navigasikan ke contoh yang diinginkan
   cd examples/simple-web-app
   ```
  
2. **Inisialisasi Lingkungan AZD**  
   ```bash
   # Inisialisasi dengan template yang ada
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
  
4. **Terapkan**  
   ```bash
   # Menyebarkan infrastruktur dan aplikasi
   azd up
   ```
  
5. **Verifikasi Penerapan**  
   ```bash
   # Dapatkan titik akhir layanan
   azd env get-values
   
   # Uji titik akhir (contoh)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Indikator Keberhasilan yang Diharapkan:**  
   - ✅ `azd up` selesai tanpa kesalahan  
   - ✅ Endpoint layanan mengembalikan HTTP 200  
   - ✅ Portal Azure menunjukkan status "Running"  
   - ✅ Application Insights menerima telemetri  

> **⚠️ Masalah?** Lihat [Masalah Umum](../docs/troubleshooting/common-issues.md) untuk pemecahan masalah penerapan  

### Menyesuaikan Contoh  

Setiap contoh mencakup:  
- **README.md** - Petunjuk pengaturan dan kustomisasi yang terperinci  
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

### Situs Web Statis - React SPA  
**Teknologi**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitas**: Pemula  
**Konsep**: Hosting statis, backend serverless, pengembangan web modern  

### Aplikasi Container - Python Flask  
**Teknologi**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksitas**: Pemula  
**Konsep**: Kontainerisasi, REST API, scale-to-zero, pemeriksaan kesehatan, pemantauan  
**Lokasi**: [Contoh Lokal](../../../examples/container-app/simple-flask-api)  

### Aplikasi Container - Arsitektur Mikroservis  
**Teknologi**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksitas**: Lanjutan  
**Konsep**: Arsitektur multi-layanan, komunikasi layanan, antrian pesan, pelacakan terdistribusi  
**Lokasi**: [Contoh Lokal](../../../examples/container-app/microservices)  

### Aplikasi Database - C# dengan Azure SQL  
**Teknologi**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitas**: Menengah  
**Konsep**: Entity Framework, koneksi database, pengembangan web API  

### Fungsi Serverless - Python Azure Functions  
**Teknologi**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitas**: Menengah  
**Konsep**: Arsitektur berbasis peristiwa, komputasi serverless, pengembangan full-stack  

### Mikroservis - Java Spring Boot  
**Teknologi**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitas**: Menengah  
**Konsep**: Komunikasi mikroservis, sistem terdistribusi, pola perusahaan  

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
- Otomatisasi pengaturan lingkungan  
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
   - Aktifkan pemantauan dan peringatan  

## 📊 Matriks Perbandingan  

| Contoh | Layanan | Database | Auth | Pemantauan | Kompleksitas |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI Chat** (Lokal) | 2 | ❌ | Key Vault | Lengkap | ⭐⭐ |  
| **Python Flask API** (Lokal) | 1 | ❌ | Dasar | Lengkap | ⭐ |  
| **Mikroservis** (Lokal) | 5+ | ✅ | Perusahaan | Lanjutan | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Dasar | Dasar | ⭐ |  
| React SPA + Functions | 3 | ✅ | Dasar | Lengkap | ⭐ |  
| Python Flask Container | 2 | ❌ | Dasar | Lengkap | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Lengkap | Lengkap | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Lengkap | Lengkap | ⭐⭐ |  
| Java Mikroservis | 5+ | ✅ | Lengkap | Lengkap | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Lengkap | Lengkap | ⭐⭐⭐ |  
| Pemrosesan Dokumen AI | 2 | ❌ | Dasar | Lengkap | ⭐⭐ |  
| Pipeline ML | 4+ | ✅ | Lengkap | Lengkap | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Lokal) | **8+** | **✅** | **Perusahaan** | **Lanjutan** | **⭐⭐⭐⭐** |  

## 🎓 Jalur Pembelajaran  

### Kemajuan yang Direkomendasikan  

1. **Mulai dengan Aplikasi Web Sederhana**  
   - Pelajari konsep dasar AZD  
   - Pahami alur kerja penerapan  
   - Latih manajemen lingkungan  

2. **Coba Situs Web Statis**  
   - Jelajahi opsi hosting yang berbeda  
   - Pelajari tentang integrasi CDN  
   - Pahami konfigurasi DNS  

3. **Lanjutkan ke Aplikasi Container**  
   - Pelajari dasar-dasar kontainerisasi  
   - Pahami konsep penskalaan  
   - Latih dengan Docker  

4. **Tambahkan Integrasi Database**  
   - Pelajari penyediaan database  
   - Pahami string koneksi  
   - Latih manajemen rahasia  

5. **Jelajahi Serverless**  
   - Pahami arsitektur berbasis peristiwa  
   - Pelajari tentang pemicu dan pengikatan  
   - Latih dengan API  

6. **Bangun Mikroservis**  
   - Pelajari komunikasi layanan  
   - Pahami sistem terdistribusi  
   - Latih penerapan yang kompleks  

## 🔍 Menemukan Contoh yang Tepat  

### Berdasarkan Teknologi  
- **Container Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Mikroservis (Lokal)](../../../examples/container-app/microservices), Java Mikroservis  
- **Node.js**: Node.js Express Todo App, [API Gateway Mikroservis (Lokal)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Layanan Produk Mikroservis (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Layanan Pesanan Mikroservis (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, Pipeline ML  
- **Go**: [Layanan Pengguna Mikroservis (Lokal)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroservis  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Mikroservis (Lokal)](../../../examples/container-app/microservices), Java Mikroservis  
- **Databases**: [Mikroservis (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Pemrosesan Dokumen AI, Pipeline ML, **Retail Multi-Agent Solution**  
- **Sistem Multi-Agen**: **Retail Multi-Agent Solution**  
- **Integrasi OpenAI**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Produksi Perusahaan**: [Mikroservis (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Berdasarkan Pola Arsitektur  
- **REST API Sederhana**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)  
- **Monolitik**: Node.js Express Todo, C# Web API + SQL  
- **Statis + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Mikroservis**: [Mikroservis Produksi (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Mikroservis  
- **Terkontainerisasi**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Mikroservis (Lokal)](../../../examples/container-app/microservices)  
- **Didukung AI**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Pemrosesan Dokumen AI, Pipeline ML, **Retail Multi-Agent Solution**  
- **Arsitektur Multi-Agen**: **Retail Multi-Agent Solution**  
- **Multi-Layanan Perusahaan**: [Mikroservis (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Berdasarkan Tingkat Kompleksitas  
- **Pemula**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Menengah**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservis, Azure OpenAI Chat App, Pemrosesan Dokumen AI  
- **Lanjutan**: Pipeline ML  
- **Siap Produksi Perusahaan**: [Mikroservis (Lokal)](../../../examples/container-app/microservices) (Multi-layanan dengan antrian pesan), **Retail Multi-Agent Solution** (Sistem multi-agen lengkap dengan penerapan template ARM)  

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
- [Aplikasi Todo dengan C# dan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Aplikasi Todo dengan Python dan MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Aplikasi Todo dengan Node.js dan PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikasi Web React dengan API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Praktik Terbaik
- [Kerangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Kerangka Kerja Adopsi Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Berkontribusi dengan Contoh

Punya contoh yang bermanfaat untuk dibagikan? Kami menyambut kontribusi Anda!

### Panduan Pengajuan
1. Ikuti struktur direktori yang sudah ditentukan
2. Sertakan README.md yang lengkap
3. Tambahkan komentar pada file konfigurasi
4. Uji dengan cermat sebelum mengajukan
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

**Tips Pro**: Mulailah dengan contoh paling sederhana yang sesuai dengan tumpukan teknologi Anda, lalu secara bertahap lanjutkan ke skenario yang lebih kompleks. Setiap contoh membangun konsep dari contoh sebelumnya!

## 🚀 Siap Memulai?

### Jalur Pembelajaran Anda

1. **Pemula Total?** → Mulailah dengan [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 menit)
2. **Punya Pengetahuan Dasar AZD?** → Coba [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 menit)
3. **Membangun Aplikasi AI?** → Mulailah dengan [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 menit) atau jelajahi [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ jam)
4. **Butuh Tumpukan Teknologi Tertentu?** → Gunakan bagian [Menemukan Contoh yang Tepat](../../../examples) di atas

### Langkah Selanjutnya

- ✅ Tinjau [Prasyarat](../../../examples) di atas
- ✅ Pilih contoh yang sesuai dengan tingkat keahlian Anda (lihat [Legenda Kompleksitas](../../../examples))
- ✅ Baca README contoh dengan saksama sebelum menerapkan
- ✅ Pasang pengingat untuk menjalankan `azd down` setelah pengujian
- ✅ Bagikan pengalaman Anda melalui GitHub Issues atau Discussions

### Butuh Bantuan?

- 📖 [FAQ](../resources/faq.md) - Jawaban atas pertanyaan umum
- 🐛 [Panduan Pemecahan Masalah](../docs/troubleshooting/common-issues.md) - Perbaiki masalah penerapan
- 💬 [Diskusi GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Tanya komunitas
- 📚 [Panduan Belajar](../resources/study-guide.md) - Perkuat pembelajaran Anda

---

**Navigasi**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Materi Belajar**: [Panduan Belajar](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glosarium](../resources/glossary.md)
- **🔧 Sumber Daya**: [FAQ](../resources/faq.md) | [Pemecahan Masalah](../docs/troubleshooting/common-issues.md)

---

*Terakhir Diperbarui: November 2025 | [Laporkan Masalah](https://github.com/microsoft/AZD-for-beginners/issues) | [Berkontribusi dengan Contoh](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap disadari bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa terjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->