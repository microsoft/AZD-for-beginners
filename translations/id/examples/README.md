# Examples - Practical AZD Templates and Configurations

**Learning by Example - Organized by Chapter**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Chapter Mapping**: Examples organized by learning complexity
- **🚀 Local Example**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 External AI Examples**: Links to Azure Samples repositories

> **📍 IMPORTANT: Local vs External Examples**  
> This repository contains **4 complete local examples** with full implementations:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 deployment with chat interface)  
> - **Container Apps** (Simple Flask API + Microservices)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Enterprise AI Solution)  
>  
> Additional examples are **external references** to Azure-Samples repositories that you can clone.

## Introduction

This directory provides practical examples and references to help you learn Azure Developer CLI through hands-on practice. The Retail Multi-Agent scenario is a complete, production-ready implementation included in this repository. Additional examples reference official Azure Samples that demonstrate various AZD patterns.

### Complexity Rating Legend

- ⭐ **Beginner** - Basic concepts, single service, 15-30 minutes
- ⭐⭐ **Intermediate** - Multiple services, database integration, 30-60 minutes
- ⭐⭐⭐ **Advanced** - Complex architecture, AI integration, 1-2 hours
- ⭐⭐⭐⭐ **Expert** - Production-ready, enterprise patterns, 2+ hours

## 🎯 What's Actually in This Repository

### ✅ Local Implementation (Ready to Use)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Complete gpt-4.1 deployment with chat interface included in this repo**

- **Location:** `examples/azure-openai-chat/`
- **Complexity:** ⭐⭐ (Intermediate)
- **What's Included:**
  - Complete Microsoft Foundry Models deployment (gpt-4.1)
  - Python command-line chat interface
  - Key Vault integration for secure API keys
  - Bicep infrastructure templates
  - Token usage and cost tracking
  - Rate limiting and error handling

**Quick Start:**
```bash
# Arahkan ke contoh
cd examples/azure-openai-chat

# Deploy semuanya
azd up

# Instal dependensi dan mulai mengobrol
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Comprehensive container deployment examples included in this repo**

- **Location:** `examples/container-app/`
- **Complexity:** ⭐-⭐⭐⭐⭐ (Beginner to Advanced)
- **What's Included:**
  - [Master Guide](container-app/README.md) - Complete overview of container deployments
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Basic REST API example
  - [Microservices Architecture](../../../examples/container-app/microservices) - Production-ready multi-service deployment
  - Quick Start, Production, and Advanced patterns
  - Monitoring, security, and cost optimization

**Quick Start:**
```bash
# Lihat panduan utama
cd examples/container-app

# Menerapkan API Flask sederhana
cd simple-flask-api
azd up

# Menerapkan contoh mikroservis
cd ../microservices
azd up
```

**Technologies:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Complete production-ready implementation included in this repo**

- **Location:** `examples/retail-multiagent-arm-template/`
- **Complexity:** ⭐⭐⭐⭐ (Advanced)
- **What's Included:**
  - Complete ARM deployment template
  - Multi-agent architecture (Customer + Inventory)
  - Microsoft Foundry Models integration
  - AI Search with RAG
  - Comprehensive monitoring
  - One-click deployment script

**Quick Start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 External Azure Samples (Clone to Use)

The following examples are maintained in official Azure-Samples repositories. Clone them to explore different AZD patterns:

### Simple Applications (Chapters 1-2)

| Template | Repository | Complexity | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**How to use:**
```bash
# Salin contoh apa saja
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Terapkan
azd up
```

### AI Application Examples (Chapters 2, 5, 8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 deployment |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Basic AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG pattern |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Database & Advanced Patterns (Chapters 3-8)

| Template | Repository | Complexity | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Database integration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Learning Goals

By working through these examples, you will:
- Practice Azure Developer CLI workflows with realistic application scenarios
- Understand different application architectures and their azd implementations
- Master Infrastructure as Code patterns for various Azure services
- Apply configuration management and environment-specific deployment strategies
- Implement monitoring, security, and scaling patterns in practical contexts
- Build experience with troubleshooting and debugging real deployment scenarios

## Learning Outcomes

Upon completing these examples, you will be able to:
- Deploy various application types using Azure Developer CLI confidently
- Adapt provided templates to your own application requirements
- Design and implement custom infrastructure patterns using Bicep
- Configure complex multi-service applications with proper dependencies
- Apply security, monitoring, and performance best practices in real scenarios
- Troubleshoot and optimize deployments based on practical experience

## Directory Structure

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

## Quick Start Examples

> **💡 New to AZD?** Start with example #1 (Flask API) - it takes ~20 minutes and teaches core concepts.

### For Beginners
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Deploy a simple REST API with scale-to-zero  
   **Time:** 20-25 minutes | **Cost:** $0-5/month  
   **You'll Learn:** Basic azd workflow, containerization, health probes  
   **Expected Outcome:** Working API endpoint returning "Hello, World!" with monitoring

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Deploy a Node.js Express web application with MongoDB  
   **Time:** 25-35 minutes | **Cost:** $10-30/month  
   **You'll Learn:** Database integration, environment variables, connection strings  
   **Expected Outcome:** Todo list app with create/read/update/delete functionality

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Host a React static website with Azure Static Web Apps  
   **Time:** 20-30 minutes | **Cost:** $0-10/month  
   **You'll Learn:** Static hosting, serverless functions, CDN deployment  
   **Expected Outcome:** React UI with API backend, automatic SSL, global CDN

### For Intermediate Users
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Deploy gpt-4.1 with chat interface and secure API key management  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **You'll Learn:** Microsoft Foundry Models deployment, Key Vault integration, token tracking  
   **Expected Outcome:** Working chat application with gpt-4.1 and cost monitoring

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Production-ready multi-service architecture  
   **Time:** 45-60 minutes | **Cost:** $50-150/month  
   **You'll Learn:** Service communication, message queuing, distributed tracing  
   **Expected Outcome:** 2-service system (API Gateway + Product Service) with monitoring

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web application with C# API and Azure SQL Database  
   **Time:** 30-45 minutes | **Cost:** $20-80/month  
   **You'll Learn:** Entity Framework, database migrations, connection security  
   **Expected Outcome:** C# API with Azure SQL backend, automatic schema deployment

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions with HTTP triggers and Cosmos DB  
   **Time:** 30-40 minutes | **Cost:** $10-40/month  
   **You'll Learn:** Event-driven architecture, serverless scaling, NoSQL integration  
   **Expected Outcome:** Function app responding to HTTP requests with Cosmos DB storage

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java application with Container Apps and API gateway  
   **Time:** 60-90 minutes | **Cost:** $80-200/month  
   **You'll Learn:** Spring Boot deployment, service mesh, load balancing  
   **Expected Outcome:** Multi-service Java system with service discovery and routing

### Microsoft Foundry Templates

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Complete gpt-4.1 deployment with chat interface  
   **Time:** 35-45 minutes | **Cost:** $50-200/month  
   **Expected Outcome:** Working chat application with token tracking and cost monitoring

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligent chat application with RAG architecture  
   **Time:** 60-90 minutes | **Cost:** $100-300/month  
   **Expected Outcome:** RAG-powered chat interface with document search and citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Document analysis using Azure AI services  
   **Time:** 40-60 minutes | **Cost:** $20-80/month  
   **Expected Outcome:** API extracting text, tables, and entities from uploaded documents

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow with Azure Machine Learning  
   **Time:** 2-3 hours | **Cost:** $150-500/month  
   **Expected Outcome:** Automated ML pipeline with training, deployment, and monitoring

### Real-World Scenarios

#### **Retail Multi-Agent Solution** 🆕
**[Complete Implementation Guide](./retail-scenario.md)**

A comprehensive, production-ready multi-agent customer support solution that demonstrates enterprise-grade AI application deployment with AZD. This scenario provides:

- **Complete Architecture**: Multi-agent system with specialized customer service and inventory management agents
- **Production Infrastructure**: Penerapan Microsoft Foundry Models multi-region, AI Search, Container Apps, dan pemantauan komprehensif
- **Ready-to-Deploy ARM Template**: Penyebaran satu-klik dengan beberapa mode konfigurasi (Minimal/Standard/Premium)
- **Advanced Features**: Validasi keamanan red teaming, kerangka evaluasi agen, optimisasi biaya, dan panduan pemecahan masalah
- **Real Business Context**: Kasus penggunaan dukungan pelanggan retailer dengan unggahan file, integrasi pencarian, dan penskalaan dinamis

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kompleksitas**: ⭐⭐⭐⭐ (Lanjutan - Siap Produksi untuk Perusahaan)

**Sangat cocok untuk**: Pengembang AI, arsitek solusi, dan tim yang membangun sistem multi-agen produksi

**Mulai Cepat**: Sebarkan solusi lengkap dalam waktu kurang dari 30 menit menggunakan template ARM yang disertakan dengan `./deploy.sh -g myResourceGroup`

## 📋 Instruksi Penggunaan

### Prasyarat

Sebelum menjalankan contoh apa pun:
- ✅ Langganan Azure dengan akses Owner atau Contributor
- ✅ Azure Developer CLI terinstal ([Panduan Instalasi](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop berjalan (untuk contoh container)
- ✅ Kuota Azure yang sesuai (periksa persyaratan spesifik contoh)

> **💰 Peringatan Biaya:** Semua contoh membuat sumber daya Azure nyata yang menimbulkan biaya. Lihat file README masing-masing untuk estimasi biaya. Ingat untuk menjalankan `azd down` setelah selesai untuk menghindari biaya berkelanjutan.

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

4. **Sebarkan**
   ```bash
   # Menerapkan infrastruktur dan aplikasi
   azd up
   ```

5. **Verifikasi Penyebaran**
   ```bash
   # Dapatkan titik akhir layanan
   azd env get-values
   
   # Uji titik akhir (contoh)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indikator Keberhasilan yang Diharapkan:**
   - ✅ `azd up` selesai tanpa kesalahan
   - ✅ Endpoint layanan mengembalikan HTTP 200
   - ✅ Azure Portal menampilkan status "Running"
   - ✅ Application Insights menerima telemetri

> **⚠️ Ada masalah?** Lihat [Masalah Umum](../docs/chapter-07-troubleshooting/common-issues.md) untuk pemecahan masalah penyebaran

### Menyesuaikan Contoh

Setiap contoh mencakup:
- **README.md** - Instruksi pengaturan dan kustomisasi secara rinci
- **azure.yaml** - Konfigurasi AZD dengan komentar
- **infra/** - Template Bicep dengan penjelasan parameter
- **src/** - Kode aplikasi contoh
- **scripts/** - Skrip bantuan untuk tugas umum

## 🎯 Tujuan Pembelajaran

### Kategori Contoh

#### **Penyebaran Dasar**
- Aplikasi satu-layanan
- Pola infrastruktur sederhana
- Manajemen konfigurasi dasar
- Pengaturan pengembangan hemat biaya

#### **Skenario Lanjutan**
- Arsitektur multi-layanan
- Konfigurasi jaringan kompleks
- Pola integrasi basis data
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
**Konsep**: Penyebaran dasar, REST API, integrasi basis data NoSQL

### Situs Statis - React SPA
**Teknologi**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksitas**: Pemula  
**Konsep**: Hosting statis, backend tanpa server, pengembangan web modern

### Aplikasi Container - Python Flask
**Teknologi**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kompleksitas**: Pemula  
**Konsep**: Kontainerisasi, REST API, scale-to-zero, health probes, pemantauan  
**Lokasi**: [Contoh Lokal](../../../examples/container-app/simple-flask-api)

### Aplikasi Container - Arsitektur Mikroservis
**Teknologi**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kompleksitas**: Lanjutan  
**Konsep**: Arsitektur multi-layanan, komunikasi layanan, antrean pesan, pelacakan terdistribusi  
**Lokasi**: [Contoh Lokal](../../../examples/container-app/microservices)

### Aplikasi Basis Data - C# dengan Azure SQL
**Teknologi**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksitas**: Menengah  
**Konsep**: Entity Framework, koneksi basis data, pengembangan web API

### Fungsi Serverless - Python Azure Functions
**Teknologi**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksitas**: Menengah  
**Konsep**: Arsitektur berbasis peristiwa, komputasi tanpa server, pengembangan full-stack

### Mikroservis - Java Spring Boot
**Teknologi**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksitas**: Menengah  
**Konsep**: Komunikasi mikroservis, sistem terdistribusi, pola perusahaan

### Contoh Microsoft Foundry

#### Aplikasi Chat Microsoft Foundry Models
**Teknologi**: Microsoft Foundry Models, Azure AI Search, App Service  
**Kompleksitas**: Menengah  
**Konsep**: Arsitektur RAG, pencarian vektor, integrasi LLM

#### Pemrosesan Dokumen AI
**Teknologi**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksitas**: Menengah  
**Konsep**: Analisis dokumen, OCR, ekstraksi data

#### Pipeline Pembelajaran Mesin
**Teknologi**: Azure ML, MLOps, Container Registry  
**Kompleksitas**: Lanjutan  
**Konsep**: Pelatihan model, pipeline penyebaran, pemantauan

## 🛠 Contoh Konfigurasi

Direktori `configurations/` berisi komponen yang dapat digunakan ulang:

### Konfigurasi Lingkungan
- Pengaturan lingkungan pengembangan
- Konfigurasi lingkungan staging
- Konfigurasi siap produksi
- Pengaturan penyebaran multi-region

### Modul Bicep
- Komponen infrastruktur yang dapat digunakan ulang
- Pola sumber daya umum
- Template yang diperkuat keamanan
- Konfigurasi yang dioptimalkan biaya

### Skrip Pembantu
- Otomatisasi pengaturan lingkungan
- Skrip migrasi basis data
- Alat validasi penyebaran
- Utilitas pemantauan biaya

## 🔧 Panduan Kustomisasi

### Menyesuaikan Contoh untuk Kasus Penggunaan Anda

1. **Tinjau Prasyarat**
   - Periksa persyaratan layanan Azure
   - Verifikasi batas langganan
   - Pahami implikasi biaya

2. **Ubah Konfigurasi**
   - Perbarui definisi layanan di `azure.yaml`
   - Sesuaikan template Bicep
   - Sesuaikan variabel lingkungan

3. **Uji Secara Menyeluruh**
   - Sebarkan ke lingkungan pengembangan terlebih dahulu
   - Validasi fungsionalitas
   - Uji penskalaan dan kinerja

4. **Tinjauan Keamanan**
   - Tinjau kontrol akses
   - Implementasikan manajemen rahasia
   - Aktifkan pemantauan dan pemberitahuan

## 📊 Matriks Perbandingan

| Contoh | Layanan | Basis Data | Otentikasi | Pemantauan | Kompleksitas |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokal) | 2 | ❌ | Key Vault | Penuh | ⭐⭐ |
| **Python Flask API** (Lokal) | 1 | ❌ | Dasar | Penuh | ⭐ |
| **Microservices** (Lokal) | 5+ | ✅ | Perusahaan | Lanjutan | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Dasar | Dasar | ⭐ |
| React SPA + Functions | 3 | ✅ | Dasar | Penuh | ⭐ |
| Python Flask Container | 2 | ❌ | Dasar | Penuh | ⭐ |
| C# Web API + SQL | 2 | ✅ | Penuh | Penuh | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Penuh | Penuh | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Penuh | Penuh | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Penuh | Penuh | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Dasar | Penuh | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Penuh | Penuh | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokal) | **8+** | **✅** | **Perusahaan** | **Lanjutan** | **⭐⭐⭐⭐** |

## 🎓 Jalur Pembelajaran

### Rekomendasi Progresi

1. **Mulai dengan Aplikasi Web Sederhana**
   - Pelajari konsep AZD dasar
   - Pahami alur kerja penyebaran
   - Latih manajemen lingkungan

2. **Coba Situs Statis**
   - Jelajahi berbagai opsi hosting
   - Pelajari integrasi CDN
   - Pahami konfigurasi DNS

3. **Lanjut ke Aplikasi Container**
   - Pelajari dasar-dasar kontainerisasi
   - Pahami konsep penskalaan
   - Latihan menggunakan Docker

4. **Tambahkan Integrasi Basis Data**
   - Pelajari penyediaan basis data
   - Pahami connection strings
   - Latih manajemen rahasia

5. **Jelajahi Serverless**
   - Pahami arsitektur berbasis peristiwa
   - Pelajari tentang triggers dan bindings
   - Latihan dengan API

6. **Bangun Mikroservis**
   - Pelajari komunikasi layanan
   - Pahami sistem terdistribusi
   - Latih penyebaran kompleks

## 🔍 Menemukan Contoh yang Tepat

### Berdasarkan Tumpukan Teknologi
- **Container Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Aplikasi Node.js Express Todo, [Microservices API Gateway (Lokal)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokal)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sistem Multi-Agen**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Berdasarkan Pola Arsitektur
- **Simple REST API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Statis + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservis**: [Production Microservices (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Arsitektur Multi-Agen**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Berdasarkan Tingkat Kompleksitas
- **Pemula**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Menengah**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Lanjutan**: ML Pipeline
- **Siap Produksi Perusahaan**: [Microservices (Lokal)](../../../examples/container-app/microservices) (Multi-service with message queuing), **Retail Multi-Agent Solution** (Sistem multi-agen lengkap dengan penyebaran template ARM)

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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikasi Web React dengan API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Pekerjaan Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Praktik Terbaik
- [Kerangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Berkontribusi Contoh

Punya contoh yang berguna untuk dibagikan? Kami menyambut kontribusi!

### Pedoman Pengiriman
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

**Tip Pro**: Mulailah dengan contoh paling sederhana yang sesuai dengan tumpukan teknologi Anda, lalu secara bertahap tingkatkan ke skenario yang lebih kompleks. Setiap contoh membangun konsep dari contoh sebelumnya!

## 🚀 Siap Memulai?

### Jalur Pembelajaran Anda

1. **Pemula Total?** → Mulai dengan [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **Memiliki Pengetahuan AZD Dasar?** → Coba [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **Membangun Aplikasi AI?** → Mulai dengan [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) atau jelajahi [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **Butuh Tumpukan Teknologi Tertentu?** → Gunakan bagian [Finding the Right Example](#-finding-the-right-example) di atas

### Langkah Berikutnya

- ✅ Tinjau [Prasyarat](#prasyarat) di atas
- ✅ Pilih contoh yang sesuai dengan tingkat keterampilan Anda (lihat [Legenda Kompleksitas](#complexity-rating-legend))
- ✅ Baca README contoh secara menyeluruh sebelum menerapkan
- ✅ Atur pengingat untuk menjalankan `azd down` setelah pengujian
- ✅ Bagikan pengalaman Anda melalui GitHub Issues atau Discussions

### Butuh Bantuan?

- 📖 [FAQ](../resources/faq.md) - Jawaban untuk pertanyaan umum
- 🐛 [Panduan Pemecahan Masalah](../docs/chapter-07-troubleshooting/common-issues.md) - Memperbaiki masalah penerapan
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Tanyakan pada komunitas
- 📚 [Panduan Studi](../resources/study-guide.md) - Memperkuat pembelajaran Anda

---

**Navigasi**
- **📚 Beranda Kursus**: [AZD For Beginners](../README.md)
- **📖 Materi Belajar**: [Panduan Studi](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glosarium](../resources/glossary.md)
- **🔧 Sumber Daya**: [FAQ](../resources/faq.md) | [Pemecahan Masalah](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Terakhir Diperbarui: November 2025 | [Laporkan Masalah](https://github.com/microsoft/AZD-for-beginners/issues) | [Kontribusikan Contoh](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->