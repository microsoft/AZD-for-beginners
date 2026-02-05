# Contoh - Templat dan Konfigurasi AZD Praktikal

**Belajar Melalui Contoh - Disusun Mengikut Bab**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../README.md)
- **📖 Pemetaan Bab**: Contoh disusun mengikut tahap pembelajaran
- **🚀 Contoh Tempatan**: [Penyelesaian Multi-Ejen Runcit](retail-scenario.md)
- **🤖 Contoh AI Luaran**: Pautan ke repositori Azure Samples

> **📍 PENTING: Contoh Tempatan vs Luaran**  
> Repositori ini mengandungi **4 contoh tempatan lengkap** dengan pelaksanaan penuh:  
> - **Azure OpenAI Chat** (penggunaan GPT-4 dengan antara muka sembang)  
> - **Aplikasi Container** (API Flask ringkas + Perkhidmatan Mikro)  
> - **Aplikasi Pangkalan Data** (Web + Pangkalan Data SQL)  
> - **Multi-Ejen Runcit** (Penyelesaian AI Perusahaan)  
>  
> Contoh tambahan adalah **rujukan luaran** kepada repositori Azure-Samples yang boleh anda klon.

## Pengenalan

Direktori ini menyediakan contoh praktikal dan rujukan untuk membantu anda mempelajari Azure Developer CLI melalui latihan langsung. Senario Multi-Ejen Runcit adalah pelaksanaan lengkap yang sedia untuk pengeluaran yang disertakan dalam repositori ini. Contoh tambahan merujuk kepada Azure Samples rasmi yang menunjukkan pelbagai corak AZD.

### Penilaian Kerumitan

- ⭐ **Pemula** - Konsep asas, satu perkhidmatan, 15-30 minit
- ⭐⭐ **Pertengahan** - Pelbagai perkhidmatan, integrasi pangkalan data, 30-60 minit
- ⭐⭐⭐ **Lanjutan** - Seni bina kompleks, integrasi AI, 1-2 jam
- ⭐⭐⭐⭐ **Pakar** - Sedia untuk pengeluaran, corak perusahaan, 2+ jam

## 🎯 Apa Yang Terdapat Dalam Repositori Ini

### ✅ Pelaksanaan Tempatan (Sedia Digunakan)

#### [Aplikasi Sembang Azure OpenAI](azure-openai-chat/README.md) 🆕
**Penggunaan GPT-4 lengkap dengan antara muka sembang disertakan dalam repositori ini**

- **Lokasi:** `examples/azure-openai-chat/`
- **Kerumitan:** ⭐⭐ (Pertengahan)
- **Apa Yang Disertakan:**
  - Penggunaan Azure OpenAI lengkap (GPT-4)
  - Antara muka sembang Python baris perintah
  - Integrasi Key Vault untuk kunci API yang selamat
  - Templat infrastruktur Bicep
  - Penjejakan penggunaan token dan kos
  - Had kadar dan pengendalian ralat

**Permulaan Pantas:**
```bash
# Navigasi ke contoh
cd examples/azure-openai-chat

# Sebarkan semuanya
azd up

# Pasang kebergantungan dan mula berbual
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologi:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Contoh Aplikasi Container](container-app/README.md) 🆕
**Contoh penggunaan container yang komprehensif disertakan dalam repositori ini**

- **Lokasi:** `examples/container-app/`
- **Kerumitan:** ⭐-⭐⭐⭐⭐ (Pemula hingga Pakar)
- **Apa Yang Disertakan:**
  - [Panduan Utama](container-app/README.md) - Gambaran keseluruhan lengkap penggunaan container
  - [API Flask Ringkas](../../../examples/container-app/simple-flask-api) - Contoh API REST asas
  - [Seni Bina Perkhidmatan Mikro](../../../examples/container-app/microservices) - Penggunaan pelbagai perkhidmatan sedia untuk pengeluaran
  - Corak Permulaan Pantas, Pengeluaran, dan Lanjutan
  - Pemantauan, keselamatan, dan pengoptimuman kos

**Permulaan Pantas:**
```bash
# Lihat panduan utama
cd examples/container-app

# Sebarkan API Flask yang mudah
cd simple-flask-api
azd up

# Sebarkan contoh mikroservis
cd ../microservices
azd up
```

**Teknologi:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Penyelesaian Multi-Ejen Runcit](retail-scenario.md) 🆕
**Pelaksanaan sedia untuk pengeluaran lengkap disertakan dalam repositori ini**

- **Lokasi:** `examples/retail-multiagent-arm-template/`
- **Kerumitan:** ⭐⭐⭐⭐ (Lanjutan)
- **Apa Yang Disertakan:**
  - Templat penggunaan ARM lengkap
  - Seni bina multi-ejen (Pelanggan + Inventori)
  - Integrasi Azure OpenAI
  - Carian AI dengan RAG
  - Pemantauan komprehensif
  - Skrip penggunaan satu klik

**Permulaan Pantas:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologi:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Contoh Azure Luaran (Klon untuk Digunakan)

Contoh berikut diselenggara dalam repositori rasmi Azure-Samples. Klon untuk meneroka pelbagai corak AZD:

### Aplikasi Ringkas (Bab 1-2)

| Templat | Repositori | Kerumitan | Perkhidmatan |
|:---------|:-----------|:-----------|:---------|
| **API Flask Python** | [Tempatan: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Perkhidmatan Mikro** | [Tempatan: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Pelbagai perkhidmatan, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Container Flask Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cara Menggunakan:**
```bash
# Klon mana-mana contoh
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Laksanakan
azd up
```

### Contoh Aplikasi AI (Bab 2, 5, 8)

| Templat | Repositori | Kerumitan | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Tempatan: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Penggunaan GPT-4 |
| **Permulaan Sembang AI** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Sembang AI asas |
| **Ejen AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Kerangka ejen |
| **Demo Carian + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Corak RAG |
| **Sembang Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI Perusahaan |

### Pangkalan Data & Corak Lanjutan (Bab 3-8)

| Templat | Repositori | Kerumitan | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrasi pangkalan data |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL tanpa pelayan |
| **Perkhidmatan Mikro Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Pelbagai perkhidmatan |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Matlamat Pembelajaran

Dengan mengerjakan contoh-contoh ini, anda akan:
- Mengamalkan aliran kerja Azure Developer CLI dengan senario aplikasi yang realistik
- Memahami pelbagai seni bina aplikasi dan pelaksanaan azd mereka
- Menguasai corak Infrastruktur sebagai Kod untuk pelbagai perkhidmatan Azure
- Menerapkan pengurusan konfigurasi dan strategi penggunaan khusus persekitaran
- Melaksanakan corak pemantauan, keselamatan, dan penskalaan dalam konteks praktikal
- Membina pengalaman dengan penyelesaian masalah dan debugging senario penggunaan sebenar

## Hasil Pembelajaran

Setelah menyelesaikan contoh-contoh ini, anda akan dapat:
- Menggunakan pelbagai jenis aplikasi menggunakan Azure Developer CLI dengan yakin
- Menyesuaikan templat yang disediakan kepada keperluan aplikasi anda sendiri
- Merancang dan melaksanakan corak infrastruktur tersuai menggunakan Bicep
- Mengkonfigurasi aplikasi pelbagai perkhidmatan yang kompleks dengan kebergantungan yang betul
- Menerapkan amalan terbaik keselamatan, pemantauan, dan prestasi dalam senario sebenar
- Menyelesaikan masalah dan mengoptimumkan penggunaan berdasarkan pengalaman praktikal

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

## Contoh Permulaan Pantas

> **💡 Baru dengan AZD?** Mulakan dengan contoh #1 (API Flask) - ia mengambil masa ~20 minit dan mengajar konsep teras.

### Untuk Pemula
1. **[Aplikasi Container - API Flask Python](../../../examples/container-app/simple-flask-api)** (Tempatan) ⭐  
   Gunakan API REST ringkas dengan skala-ke-sifar  
   **Masa:** 20-25 minit | **Kos:** $0-5/bulan  
   **Anda Akan Belajar:** Aliran kerja azd asas, pengkontenaan, probe kesihatan  
   **Hasil Dijangka:** Titik akhir API berfungsi yang mengembalikan "Hello, World!" dengan pemantauan

2. **[Aplikasi Web Ringkas - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Gunakan aplikasi web Node.js Express dengan MongoDB  
   **Masa:** 25-35 minit | **Kos:** $10-30/bulan  
   **Anda Akan Belajar:** Integrasi pangkalan data, pembolehubah persekitaran, rentetan sambungan  
   **Hasil Dijangka:** Aplikasi senarai tugasan dengan fungsi buat/baca/kemas kini/hapus

3. **[Laman Web Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hos laman web statik React dengan Azure Static Web Apps  
   **Masa:** 20-30 minit | **Kos:** $0-10/bulan  
   **Anda Akan Belajar:** Pengehosan statik, fungsi tanpa pelayan, penggunaan CDN  
   **Hasil Dijangka:** UI React dengan backend API, SSL automatik, CDN global

### Untuk Pengguna Pertengahan
4. **[Aplikasi Sembang Azure OpenAI](../../../examples/azure-openai-chat)** (Tempatan) ⭐⭐  
   Gunakan GPT-4 dengan antara muka sembang dan pengurusan kunci API yang selamat  
   **Masa:** 35-45 minit | **Kos:** $50-200/bulan  
   **Anda Akan Belajar:** Penggunaan Azure OpenAI, integrasi Key Vault, penjejakan token  
   **Hasil Dijangka:** Aplikasi sembang berfungsi dengan GPT-4 dan pemantauan kos

5. **[Aplikasi Container - Perkhidmatan Mikro](../../../examples/container-app/microservices)** (Tempatan) ⭐⭐⭐⭐  
   Seni bina pelbagai perkhidmatan sedia untuk pengeluaran  
   **Masa:** 45-60 minit | **Kos:** $50-150/bulan  
   **Anda Akan Belajar:** Komunikasi perkhidmatan, penjadualan mesej, penjejakan teragih  
   **Hasil Dijangka:** Sistem 2 perkhidmatan (API Gateway + Product Service) dengan pemantauan

6. **[Aplikasi Pangkalan Data - C# dengan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikasi web dengan API C# dan Pangkalan Data Azure SQL  
   **Masa:** 30-45 minit | **Kos:** $20-80/bulan  
   **Anda Akan Belajar:** Entity Framework, migrasi pangkalan data, keselamatan sambungan  
   **Hasil Dijangka:** API C# dengan backend Azure SQL, penggunaan skema automatik

7. **[Fungsi Tanpa Pelayan - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Fungsi Azure Python dengan pencetus HTTP dan Cosmos DB  
   **Masa:** 30-40 minit | **Kos:** $10-40/bulan  
   **Anda Akan Belajar:** Seni bina berasaskan acara, penskalaan tanpa pelayan, integrasi NoSQL  
   **Hasil Dijangka:** Aplikasi fungsi yang bertindak balas kepada permintaan HTTP dengan penyimpanan Cosmos DB

8. **[Perkhidmatan Mikro - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplikasi Java pelbagai perkhidmatan dengan Container Apps dan API gateway  
   **Masa:** 60-90 minit | **Kos:** $80-200/bulan  
   **Anda Akan Belajar:** Penggunaan Spring Boot, mesh perkhidmatan, pengimbangan beban  
   **Hasil Dijangka:** Sistem Java pelbagai perkhidmatan dengan penemuan perkhidmatan dan penghalaan

### Templat Foundry AI Azure

1. **[Aplikasi Sembang Azure OpenAI - Contoh Tempatan](../../../examples/azure-openai-chat)** ⭐⭐  
   Penggunaan GPT-4 lengkap dengan antara muka sembang  
   **Masa:** 35-45 minit | **Kos:** $50-200/bulan  
   **Hasil Dijangka:** Aplikasi sembang berfungsi dengan penjejakan token dan pemantauan kos

2. **[Demo Carian + OpenAI Azure](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplikasi sembang pintar dengan seni bina RAG  
   **Masa:** 60-90 minit | **Kos:** $100-300/bulan  
   **Hasil Dijangka:** Antara muka sembang berkuasa RAG dengan carian dokumen dan sitasi

3. **[Pemprosesan Dokumen AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisis dokumen menggunakan perkhidmatan AI Azure  
   **Masa:** 40-60 minit | **Kos:** $20-80/bulan  
   **Hasil Dijangka:** API yang mengekstrak teks, jadual, dan entiti daripada dokumen yang dimuat naik

4. **[Pipeline Pembelajaran Mesin](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Aliran kerja MLOps dengan Pembelajaran Mesin Azure  
   **Masa:** 2-3 jam | **Kos:** $150-500/bulan  
   **Hasil Dijangka:** Pipeline ML automatik dengan latihan, penggunaan, dan pemantauan

### Senario Dunia Sebenar

#### **Penyelesaian Multi-Ejen Runcit** 🆕
**[Panduan Pelaksanaan Lengkap](./retail-scenario.md)**

Penyelesaian sokongan pelanggan multi-ejen yang komprehensif dan sedia untuk pengeluaran yang menunjukkan penggunaan aplikasi AI perusahaan dengan AZD. Senario ini menyediakan:

- **Seni Bina Lengkap**: Sistem multi-ejen dengan ejen perkhidmatan pelanggan dan pengurusan inventori khusus
- **Infrastruktur Pengeluaran**: Penerapan Azure OpenAI pelbagai rantau, AI Search, Container Apps, dan pemantauan menyeluruh  
- **Templat ARM Sedia untuk Diterapkan**: Penerapan satu klik dengan pelbagai mod konfigurasi (Minimal/Standard/Premium)  
- **Ciri Lanjutan**: Pengesahan keselamatan red teaming, rangka kerja penilaian agen, pengoptimuman kos, dan panduan penyelesaian masalah  
- **Konteks Perniagaan Sebenar**: Kes penggunaan sokongan pelanggan peruncit dengan muat naik fail, integrasi carian, dan penskalaan dinamik  

**Teknologi**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kerumitan**: ⭐⭐⭐⭐ (Lanjutan - Sedia untuk Pengeluaran Perusahaan)  

**Sesuai untuk**: Pembangun AI, arkitek penyelesaian, dan pasukan yang membina sistem multi-agen pengeluaran  

**Permulaan Pantas**: Terapkan penyelesaian lengkap dalam masa kurang daripada 30 minit menggunakan templat ARM yang disertakan dengan `./deploy.sh -g myResourceGroup`  

## 📋 Arahan Penggunaan  

### Prasyarat  

Sebelum menjalankan sebarang contoh:  
- ✅ Langganan Azure dengan akses Pemilik atau Penyumbang  
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](../docs/getting-started/installation.md))  
- ✅ Docker Desktop berjalan (untuk contoh kontena)  
- ✅ Kuota Azure yang sesuai (semak keperluan spesifik contoh)  

> **💰 Amaran Kos:** Semua contoh mencipta sumber Azure sebenar yang akan dikenakan caj. Lihat fail README individu untuk anggaran kos. Ingat untuk menjalankan `azd down` apabila selesai untuk mengelakkan kos berterusan.  

### Menjalankan Contoh Secara Tempatan  

1. **Klon atau Salin Contoh**  
   ```bash
   # Navigasi ke contoh yang diinginkan
   cd examples/simple-web-app
   ```
  
2. **Inisialisasi Persekitaran AZD**  
   ```bash
   # Mulakan dengan templat sedia ada
   azd init
   
   # Atau cipta persekitaran baru
   azd env new my-environment
   ```
  
3. **Konfigurasi Persekitaran**  
   ```bash
   # Tetapkan pembolehubah yang diperlukan
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Terapkan**  
   ```bash
   # Sebarkan infrastruktur dan aplikasi
   azd up
   ```
  
5. **Sahkan Penerapan**  
   ```bash
   # Dapatkan titik akhir perkhidmatan
   azd env get-values
   
   # Uji titik akhir (contoh)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Petunjuk Kejayaan yang Dijangka:**  
   - ✅ `azd up` selesai tanpa ralat  
   - ✅ Titik akhir perkhidmatan mengembalikan HTTP 200  
   - ✅ Portal Azure menunjukkan status "Running"  
   - ✅ Application Insights menerima telemetri  

> **⚠️ Masalah?** Lihat [Masalah Biasa](../docs/troubleshooting/common-issues.md) untuk penyelesaian masalah penerapan  

### Menyesuaikan Contoh  

Setiap contoh termasuk:  
- **README.md** - Arahan persediaan dan penyesuaian terperinci  
- **azure.yaml** - Konfigurasi AZD dengan komen  
- **infra/** - Templat Bicep dengan penjelasan parameter  
- **src/** - Kod aplikasi contoh  
- **scripts/** - Skrip pembantu untuk tugas biasa  

## 🎯 Objektif Pembelajaran  

### Kategori Contoh  

#### **Penerapan Asas**  
- Aplikasi perkhidmatan tunggal  
- Corak infrastruktur mudah  
- Pengurusan konfigurasi asas  
- Persediaan pembangunan kos efektif  

#### **Senario Lanjutan**  
- Seni bina pelbagai perkhidmatan  
- Konfigurasi rangkaian kompleks  
- Corak integrasi pangkalan data  
- Pelaksanaan keselamatan dan pematuhan  

#### **Corak Sedia untuk Pengeluaran**  
- Konfigurasi ketersediaan tinggi  
- Pemantauan dan pemerhatian  
- Integrasi CI/CD  
- Persediaan pemulihan bencana  

## 📖 Penerangan Contoh  

### Aplikasi Web Mudah - Node.js Express  
**Teknologi**: Node.js, Express, MongoDB, Container Apps  
**Kerumitan**: Pemula  
**Konsep**: Penerapan asas, REST API, integrasi pangkalan data NoSQL  

### Laman Web Statik - React SPA  
**Teknologi**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kerumitan**: Pemula  
**Konsep**: Hosting statik, backend tanpa pelayan, pembangunan web moden  

### Aplikasi Kontena - Python Flask  
**Teknologi**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kerumitan**: Pemula  
**Konsep**: Pengkontenaan, REST API, penskalaan ke sifar, probe kesihatan, pemantauan  
**Lokasi**: [Contoh Tempatan](../../../examples/container-app/simple-flask-api)  

### Aplikasi Kontena - Seni Bina Mikroservis  
**Teknologi**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kerumitan**: Lanjutan  
**Konsep**: Seni bina pelbagai perkhidmatan, komunikasi perkhidmatan, antrian mesej, penjejakan teragih  
**Lokasi**: [Contoh Tempatan](../../../examples/container-app/microservices)  

### Aplikasi Pangkalan Data - C# dengan Azure SQL  
**Teknologi**: C# ASP.NET Core, Azure SQL Database, App Service  
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

#### Saluran Pembelajaran Mesin  
**Teknologi**: Azure ML, MLOps, Container Registry  
**Kerumitan**: Lanjutan  
**Konsep**: Latihan model, saluran penerapan, pemantauan  

## 🛠 Contoh Konfigurasi  

Direktori `configurations/` mengandungi komponen yang boleh digunakan semula:  

### Konfigurasi Persekitaran  
- Tetapan persekitaran pembangunan  
- Konfigurasi persekitaran pementasan  
- Konfigurasi sedia untuk pengeluaran  
- Persediaan penerapan pelbagai rantau  

### Modul Bicep  
- Komponen infrastruktur yang boleh digunakan semula  
- Corak sumber biasa  
- Templat yang diperkuatkan keselamatan  
- Konfigurasi yang dioptimumkan kos  

### Skrip Pembantu  
- Automasi persediaan persekitaran  
- Skrip migrasi pangkalan data  
- Alat pengesahan penerapan  
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
   - Terapkan ke persekitaran pembangunan terlebih dahulu  
   - Sahkan fungsi  
   - Uji penskalaan dan prestasi  

4. **Semakan Keselamatan**  
   - Semak kawalan akses  
   - Laksanakan pengurusan rahsia  
   - Aktifkan pemantauan dan amaran  

## 📊 Matriks Perbandingan  

| Contoh | Perkhidmatan | Pangkalan Data | Auth | Pemantauan | Kerumitan |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI Chat** (Tempatan) | 2 | ❌ | Key Vault | Penuh | ⭐⭐ |  
| **Python Flask API** (Tempatan) | 1 | ❌ | Asas | Penuh | ⭐ |  
| **Mikroservis** (Tempatan) | 5+ | ✅ | Perusahaan | Lanjutan | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Asas | Asas | ⭐ |  
| React SPA + Functions | 3 | ✅ | Asas | Penuh | ⭐ |  
| Python Flask Container | 2 | ❌ | Asas | Penuh | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Penuh | Penuh | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Penuh | Penuh | ⭐⭐ |  
| Java Mikroservis | 5+ | ✅ | Penuh | Penuh | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Penuh | Penuh | ⭐⭐⭐ |  
| Pemprosesan Dokumen AI | 2 | ❌ | Asas | Penuh | ⭐⭐ |  
| Saluran ML | 4+ | ✅ | Penuh | Penuh | ⭐⭐⭐⭐ |  
| **Multi-Agent Peruncit** (Tempatan) | **8+** | **✅** | **Perusahaan** | **Lanjutan** | **⭐⭐⭐⭐** |  

## 🎓 Laluan Pembelajaran  

### Perkembangan yang Disyorkan  

1. **Mulakan dengan Aplikasi Web Mudah**  
   - Pelajari konsep asas AZD  
   - Fahami aliran kerja penerapan  
   - Latih pengurusan persekitaran  

2. **Cuba Laman Web Statik**  
   - Terokai pilihan hosting yang berbeza  
   - Pelajari tentang integrasi CDN  
   - Fahami konfigurasi DNS  

3. **Berpindah ke Aplikasi Kontena**  
   - Pelajari asas pengkontenaan  
   - Fahami konsep penskalaan  
   - Latih dengan Docker  

4. **Tambah Integrasi Pangkalan Data**  
   - Pelajari penyediaan pangkalan data  
   - Fahami rentetan sambungan  
   - Latih pengurusan rahsia  

5. **Terokai Tanpa Pelayan**  
   - Fahami seni bina berasaskan acara  
   - Pelajari tentang pencetus dan pengikatan  
   - Latih dengan API  

6. **Bina Mikroservis**  
   - Pelajari komunikasi perkhidmatan  
   - Fahami sistem teragih  
   - Latih penerapan kompleks  

## 🔍 Mencari Contoh yang Sesuai  

### Mengikut Teknologi  
- **Container Apps**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Java Mikroservis  
- **Node.js**: Node.js Express Todo App, [API Gateway Mikroservis (Tempatan)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api), [Perkhidmatan Produk Mikroservis (Tempatan)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Perkhidmatan Pesanan Mikroservis (Tempatan)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, Saluran ML  
- **Go**: [Perkhidmatan Pengguna Mikroservis (Tempatan)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroservis  
- **React**: React SPA + Functions  
- **Kontena**: [Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Java Mikroservis  
- **Pangkalan Data**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Tempatan)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Pemprosesan Dokumen AI, Saluran ML, **Penyelesaian Multi-Agent Peruncit**  
- **Sistem Multi-Agent**: **Penyelesaian Multi-Agent Peruncit**  
- **Integrasi OpenAI**: **[Azure OpenAI Chat (Tempatan)](../../../examples/azure-openai-chat)**, Penyelesaian Multi-Agent Peruncit  
- **Pengeluaran Perusahaan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), **Penyelesaian Multi-Agent Peruncit**  

### Mengikut Corak Seni Bina  
- **REST API Mudah**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api)  
- **Monolitik**: Node.js Express Todo, C# Web API + SQL  
- **Statik + Tanpa Pelayan**: React SPA + Functions, Python Functions + SPA  
- **Mikroservis**: [Mikroservis Pengeluaran (Tempatan)](../../../examples/container-app/microservices), Java Spring Boot Mikroservis  
- **Pengkontenaan**: [Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices)  
- **Dikuasakan AI**: **[Azure OpenAI Chat (Tempatan)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, Pemprosesan Dokumen AI, Saluran ML, **Penyelesaian Multi-Agent Peruncit**  
- **Seni Bina Multi-Agent**: **Penyelesaian Multi-Agent Peruncit**  
- **Pelbagai Perkhidmatan Perusahaan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), **Penyelesaian Multi-Agent Peruncit**  

### Mengikut Tahap Kerumitan  
- **Pemula**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Pertengahan**: **[Azure OpenAI Chat (Tempatan)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservis, Azure OpenAI Chat App, Pemprosesan Dokumen AI  
- **Lanjutan**: Saluran ML  
- **Sedia untuk Pengeluaran Perusahaan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices) (Pelbagai perkhidmatan dengan antrian mesej), **Penyelesaian Multi-Agent Peruncit** (Sistem multi-agent lengkap dengan penerapan templat ARM)  

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
- [Kerja Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Amalan Terbaik
- [Kerangka Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Kerangka Pengambilan Awan](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Menyumbang Contoh

Ada contoh berguna untuk dikongsi? Kami mengalu-alukan sumbangan anda!

### Garis Panduan Penyerahan
1. Ikuti struktur direktori yang telah ditetapkan
2. Sertakan README.md yang lengkap
3. Tambahkan komen pada fail konfigurasi
4. Uji dengan teliti sebelum menyerahkan
5. Sertakan anggaran kos dan prasyarat

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

**Tip Profesional**: Mulakan dengan contoh paling mudah yang sesuai dengan teknologi anda, kemudian secara beransur-ansur beralih kepada senario yang lebih kompleks. Setiap contoh membina konsep daripada yang sebelumnya!

## 🚀 Sedia Bermula?

### Laluan Pembelajaran Anda

1. **Pemula Sepenuhnya?** → Mulakan dengan [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minit)
2. **Ada Pengetahuan Asas AZD?** → Cuba [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minit)
3. **Membina Aplikasi AI?** → Mulakan dengan [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minit) atau terokai [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ jam)
4. **Perlu Teknologi Tertentu?** → Gunakan bahagian [Mencari Contoh yang Tepat](../../../examples) di atas

### Langkah Seterusnya

- ✅ Semak [Prasyarat](../../../examples) di atas
- ✅ Pilih contoh yang sesuai dengan tahap kemahiran anda (lihat [Legenda Kerumitan](../../../examples))
- ✅ Baca README contoh dengan teliti sebelum melaksanakan
- ✅ Tetapkan peringatan untuk menjalankan `azd down` selepas ujian
- ✅ Kongsi pengalaman anda melalui Isu atau Perbincangan GitHub

### Perlu Bantuan?

- 📖 [FAQ](../resources/faq.md) - Soalan lazim dijawab
- 🐛 [Panduan Penyelesaian Masalah](../docs/troubleshooting/common-issues.md) - Baiki isu pelaksanaan
- 💬 [Perbincangan GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Tanya komuniti
- 📚 [Panduan Pembelajaran](../resources/study-guide.md) - Kukuhkan pembelajaran anda

---

**Navigasi**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../README.md)
- **📖 Bahan Pembelajaran**: [Panduan Pembelajaran](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glosari](../resources/glossary.md)
- **🔧 Sumber**: [FAQ](../resources/faq.md) | [Penyelesaian Masalah](../docs/troubleshooting/common-issues.md)

---

*Kemaskini Terakhir: November 2025 | [Laporkan Isu](https://github.com/microsoft/AZD-for-beginners/issues) | [Sumbang Contoh](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->