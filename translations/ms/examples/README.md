# Contoh - Templat dan Konfigurasi AZD Praktikal

**Belajar Melalui Contoh - Disusun Mengikut Bab**  
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../README.md)  
- **📖 Pemetaan Bab**: Contoh disusun mengikut tahap kesukaran pembelajaran  
- **🚀 Contoh Tempatan**: [Penyelesaian Runcit Multi-Ejen](retail-scenario.md)  
- **🤖 Contoh AI Luar**: Pautan ke repositori Azure Samples  

> **📍 PENTING: Contoh Tempatan vs Luar**  
> Repositori ini mengandungi **4 contoh lengkap tempatan** dengan pelaksanaan penuh:  
> - **Sembang Model Microsoft Foundry** (penyebaran gpt-4.1 dengan antara muka sembang)  
> - **Aplikasi Kontena** (API Flask Ringkas + Mikroses)  
> - **Aplikasi Pangkalan Data** (Web + Pangkalan Data SQL)  
> - **Penyelesaian Runcit Multi-Ejen** (Penyelesaian AI Perusahaan)  
>  
> Contoh tambahan adalah **rujukan luaran** ke repositori Azure-Samples yang boleh anda klonkan.

## Pengenalan

Direktori ini menyediakan contoh praktikal dan rujukan untuk membantu anda belajar Azure Developer CLI melalui latihan langsung. Senario Runcit Multi-Ejen adalah pelaksanaan lengkap yang sedia untuk produksi yang disertakan dalam repositori ini. Contoh tambahan merujuk sampel rasmi Azure yang menunjukkan pelbagai corak AZD.

### Legenda Penarafan Kesukaran

- ⭐ **Pemula** - Konsep asas, perkhidmatan tunggal, 15-30 minit  
- ⭐⭐ **Pertengahan** - Pelbagai perkhidmatan, integrasi pangkalan data, 30-60 minit  
- ⭐⭐⭐ **Lanjutan** - Seni bina kompleks, integrasi AI, 1-2 jam  
- ⭐⭐⭐⭐ **Pakar** - Sedia produksi, corak perusahaan, 2+ jam  

## 🎯 Apa yang Terdapat Dalam Repositori Ini

### ✅ Pelaksanaan Tempatan (Sedia Digunakan)

#### [Aplikasi Sembang Model Microsoft Foundry](azure-openai-chat/README.md) 🆕  
**Penyebaran lengkap gpt-4.1 dengan antara muka sembang disertakan dalam repositori ini**

- **Lokasi:** `examples/azure-openai-chat/`  
- **Kesukaran:** ⭐⭐ (Pertengahan)  
- **Apa yang Termasuk:**
  - Penyebaran lengkap Model Microsoft Foundry (gpt-4.1)  
  - Antara muka sembang baris arahan Python  
  - Integrasi Key Vault untuk kunci API selamat  
  - Templat infrastruktur Bicep  
  - Penjejakan penggunaan token dan kos  
  - Had kadar dan pengendalian ralat  

**Mula Cepat:**  
```bash
# Navigasi ke contoh
cd examples/azure-openai-chat

# Berpindah semua
azd up

# Pasang kebergantungan dan mula berbual
pip install -r src/requirements.txt
python src/chat.py
```
  
**Teknologi:** Model Microsoft Foundry, gpt-4.1, Key Vault, Python, Bicep  

#### [Contoh Aplikasi Kontena](container-app/README.md) 🆕  
**Contoh penyebaran kontena menyeluruh disertakan dalam repositori ini**

- **Lokasi:** `examples/container-app/`  
- **Kesukaran:** ⭐-⭐⭐⭐⭐ (Pemula ke Lanjutan)  
- **Apa yang Termasuk:**
  - [Panduan Induk](container-app/README.md) - Gambaran keseluruhan penyebaran kontena  
  - [API Flask Ringkas](../../../examples/container-app/simple-flask-api) - Contoh API REST asas  
  - [Seni Bina Mikroses](../../../examples/container-app/microservices) - Penyebaran multi-perkhidmatan sedia produksi  
  - Corak Mula Cepat, Produksi, dan Lanjutan  
  - Pemantauan, keselamatan, dan pengoptimuman kos  

**Mula Cepat:**  
```bash
# Lihat panduan induk
cd examples/container-app

# Lancarkan API Flask mudah
cd simple-flask-api
azd up

# Lancarkan contoh mikroservis
cd ../microservices
azd up
```
  
**Teknologi:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Penyelesaian Runcit Multi-Ejen](retail-scenario.md) 🆕  
**Pelaksanaan lengkap sedia produksi disertakan dalam repositori ini**

- **Lokasi:** `examples/retail-multiagent-arm-template/`  
- **Kesukaran:** ⭐⭐⭐⭐ (Lanjutan)  
- **Apa yang Termasuk:**
  - Templat ARM penyebaran lengkap  
  - Seni bina multi-ejen (Pelanggan + Inventori)  
  - Integrasi Model Microsoft Foundry  
  - Carian AI dengan RAG  
  - Pemantauan menyeluruh  
  - Skrip penyebaran satu klik  

**Mula Cepat:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Teknologi:** Model Microsoft Foundry, Carian AI, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Azure Samples Luar (Klon untuk Guna)

Contoh berikut dikekalkan dalam repositori Azure-Samples rasmi. Klonkan untuk meneroka pelbagai corak AZD:

### Aplikasi Ringkas (Bab 1-2)

| Templat | Repositori | Kesukaran | Perkhidmatan |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Tempatan: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroses** | [Tempatan: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-perkhidmatan, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Kontena Flask Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cara guna:**  
```bash
# Klon mana-mana contoh
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Lancarkan
azd up
```
  
### Contoh Aplikasi AI (Bab 2, 5, 8)

| Templat | Repositori | Kesukaran | Fokus |
|:---------|:-----------|:-----------|:------|
| **Sembang Model Microsoft Foundry** | [Tempatan: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Penyebaran gpt-4.1 |
| **Mula Cepat Sembang AI** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Sembang AI asas |
| **Ejen AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Rangka kerja agen |
| **Demo Carian + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Corak RAG |
| **Sembang Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI perusahaan |

### Pangkalan Data & Corak Lanjutan (Bab 3-8)

| Templat | Repositori | Kesukaran | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrasi pangkalan data |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL tanpa server |
| **Mikroses Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-perkhidmatan |
| **Saluran Pembelajaran Mesin** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Matlamat Pembelajaran

Dengan mengkaji contoh ini, anda akan:  
- Berlatih aliran kerja Azure Developer CLI dengan senario aplikasi yang realistik  
- Memahami pelbagai seni bina aplikasi dan pelaksanaan azd mereka  
- Menguasai corak Infrastruktur sebagai Kod untuk pelbagai perkhidmatan Azure  
- Menggunakan pengurusan konfigurasi dan strategi penyebaran khusus persekitaran  
- Melaksanakan corak pemantauan, keselamatan, dan penskalaan dalam konteks praktikal  
- Membina pengalaman dengan penyelesaian masalah dan debug senario penyebaran sebenar  

## Hasil Pembelajaran

Setelah menyiapkan contoh ini, anda akan dapat:  
- Menyebarkan pelbagai jenis aplikasi menggunakan Azure Developer CLI dengan yakin  
- Menyesuaikan templat yang disediakan untuk keperluan aplikasi anda sendiri  
- Reka dan laksanakan corak infrastruktur khusus menggunakan Bicep  
- Konfigurasi aplikasi multi-perkhidmatan kompleks dengan kebergantungan yang betul  
- Gunakan amalan terbaik keselamatan, pemantauan, dan prestasi dalam senario sebenar  
- Selesaikan masalah dan optimumkan penyebaran berdasarkan pengalaman praktikal  

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
  
## Contoh Mula Cepat

> **💡 Baru dengan AZD?** Mulakan dengan contoh #1 (Flask API) - mengambil masa ~20 minit dan mengajar konsep teras.

### Untuk Pemula  
1. **[Aplikasi Kontena - API Flask Python](../../../examples/container-app/simple-flask-api)** (Tempatan) ⭐  
   Sebarkan API REST ringkas dengan skala ke sifar  
   **Masa:** 20-25 minit | **Kos:** $0-5/bulan  
   **Anda Akan Belajar:** Aliran kerja azd asas, kontena, probe kesihatan  
   **Hasil Dijangka:** Titik akhir API berfungsi mengembalikan "Hello, World!" dengan pemantauan  

2. **[Aplikasi Web Ringkas - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Sebarkan aplikasi web Node.js Express dengan MongoDB  
   **Masa:** 25-35 minit | **Kos:** $10-30/bulan  
   **Anda Akan Belajar:** Integrasi pangkalan data, pembolehubah persekitaran, rentetan sambungan  
   **Hasil Dijangka:** Aplikasi senarai tugasan dengan fungsi buat/baca/kemas kini/hapus  

3. **[Laman Web Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hoskan laman web statik React dengan Azure Static Web Apps  
   **Masa:** 20-30 minit | **Kos:** $0-10/bulan  
   **Anda Akan Belajar:** Penghosan statik, fungsi tanpa pelayan, penyebaran CDN  
   **Hasil Dijangka:** UI React dengan backend API, SSL automatik, CDN global  

### Untuk Pengguna Pertengahan  
4. **[Aplikasi Sembang Model Microsoft Foundry](../../../examples/azure-openai-chat)** (Tempatan) ⭐⭐  
   Sebarkan gpt-4.1 dengan antara muka sembang dan pengurusan kunci API selamat  
   **Masa:** 35-45 minit | **Kos:** $50-200/bulan  
   **Anda Akan Belajar:** Penyebaran Model Microsoft Foundry, integrasi Key Vault, penjejakan token  
   **Hasil Dijangka:** Aplikasi sembang berfungsi dengan gpt-4.1 dan pemantauan kos  

5. **[Aplikasi Kontena - Mikroses](../../../examples/container-app/microservices)** (Tempatan) ⭐⭐⭐⭐  
   Seni bina multi-perkhidmatan sedia produksi  
   **Masa:** 45-60 minit | **Kos:** $50-150/bulan  
   **Anda Akan Belajar:** Komunikasi perkhidmatan, penjujukan mesej, penjejakan diedarkan  
   **Hasil Dijangka:** Sistem 2 perkhidmatan (API Gateway + Perkhidmatan Produk) dengan pemantauan  

6. **[Aplikasi Pangkalan Data - C# dengan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikasi web dengan API C# dan Azure SQL Database  
   **Masa:** 30-45 minit | **Kos:** $20-80/bulan  
   **Anda Akan Belajar:** Entity Framework, migrasi pangkalan data, keselamatan sambungan  
   **Hasil Dijangka:** API C# dengan backend Azure SQL, penyebaran skema automatik  

7. **[Fungsi Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Fungsi Azure Python dengan pencetus HTTP dan Cosmos DB  
   **Masa:** 30-40 minit | **Kos:** $10-40/bulan  
   **Anda Akan Belajar:** Seni bina acara, penskalaan tanpa pelayan, integrasi NoSQL  
   **Hasil Dijangka:** Aplikasi fungsi menjawab permintaan HTTP dengan simpanan Cosmos DB  

8. **[Mikroses - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplikasi multi-perkhidmatan Java dengan Container Apps dan gerbang API  
   **Masa:** 60-90 minit | **Kos:** $80-200/bulan  
   **Anda Akan Belajar:** Penyebaran Spring Boot, mesh perkhidmatan, pengimbangan beban  
   **Hasil Dijangka:** Sistem Java multi-perkhidmatan dengan penemuan perkhidmatan dan penghalaan  

### Templat Microsoft Foundry

1. **[Aplikasi Sembang Model Microsoft Foundry - Contoh Tempatan](../../../examples/azure-openai-chat)** ⭐⭐  
   Penyebaran lengkap gpt-4.1 dengan antara muka sembang  
   **Masa:** 35-45 minit | **Kos:** $50-200/bulan  
   **Hasil Dijangka:** Aplikasi sembang berfungsi dengan penjejakan token dan pemantauan kos  

2. **[Azure Search + Demo OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplikasi sembang pintar dengan seni bina RAG  
   **Masa:** 60-90 minit | **Kos:** $100-300/bulan  
   **Hasil Dijangka:** Antara muka sembang dikuasai RAG dengan carian dokumen dan petikan  

3. **[Pemprosesan Dokumen AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisis dokumen menggunakan perkhidmatan AI Azure  
   **Masa:** 40-60 minit | **Kos:** $20-80/bulan  
   **Hasil Dijangka:** API mengekstrak teks, jadual, dan entiti daripada dokumen yang dimuat naik  

4. **[Saluran Pembelajaran Mesin](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Aliran kerja MLOps dengan Azure Machine Learning  
   **Masa:** 2-3 jam | **Kos:** $150-500/bulan  
   **Hasil Dijangka:** Saluran ML automatik dengan latihan, penyebaran, dan pemantauan  

### Senario Dunia Sebenar

#### **Penyelesaian Runcit Multi-Ejen** 🆕  
**[Panduan Pelaksanaan Lengkap](./retail-scenario.md)**  

Penyelesaian sokongan pelanggan multi-ejen lengkap, sedia produksi yang menunjukkan penyebaran aplikasi AI gred perusahaan dengan AZD. Senario ini menyediakan:
- **Seni Bina Lengkap**: Sistem multi-ejen dengan ejen perkhidmatan pelanggan dan pengurusan inventori khusus
- **Infrastruktur Pengeluaran**: Penggubalan Microsoft Foundry Models berbilang rantau, Azure AI Search, Container Apps, dan pemantauan menyeluruh
- **Templat ARM Sedia-Digunakan**: Penyebaran satu klik dengan pelbagai mod konfigurasi (Minimal/Standard/Premium)
- **Ciri-Ciri Lanjutan**: Pengesahan keselamatan red teaming, rangka kerja penilaian ejen, pengoptimuman kos, dan panduan penyelesaian masalah
- **Konteks Perniagaan Sebenar**: Kes penggunaan sokongan pelanggan peruncit dengan muat naik fail, integrasi carian, dan penskalaan dinamik

**Teknologi**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kerumitan**: ⭐⭐⭐⭐ (Lanjutan - Sedia Untuk Pengeluaran Perusahaan)

**Sesuai untuk**: Pembangun AI, arkitek penyelesaian, dan pasukan yang membina sistem multi-ejen pengeluaran

**Mula Pantas**: Sebarkan penyelesaian lengkap dalam masa kurang dari 30 minit menggunakan templat ARM yang disertakan dengan `./deploy.sh -g myResourceGroup`

## 📋 Arahan Penggunaan

### Prasyarat

Sebelum menjalankan sebarang contoh:
- ✅ Langganan Azure dengan akses Pemilik atau Penyumbang
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop berjalan (untuk contoh kontena)
- ✅ Kuota Azure yang sesuai (periksa keperluan khusus contoh)

> **💰 Amaran Kos:** Semua contoh mewujudkan sumber Azure sebenar yang akan mengenakan caj. Lihat fail README masing-masing untuk anggaran kos. Ingat untuk jalankan `azd down` apabila selesai untuk mengelakkan kos berterusan.

### Menjalankan Contoh Secara Tempatan

1. **Klon atau Salin Contoh**
   ```bash
   # Navigasi ke contoh yang diingini
   cd examples/simple-web-app
   ```

2. **Inisialisasi Persekitaran AZD**
   ```bash
   # Mulakan dengan templat sedia ada
   azd init
   
   # Atau cipta persekitaran baru
   azd env new my-environment
   ```

3. **Konfigurasikan Persekitaran**
   ```bash
   # Tetapkan pembolehubah yang diperlukan
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Sebarkan**
   ```bash
   # Menyebarkan infrastruktur dan aplikasi
   azd up
   ```

5. **Sahkan Penyebaran**
   ```bash
   # Dapatkan titik akhir perkhidmatan
   azd env get-values
   
   # Uji titik akhir (contoh)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Penunjuk Kejayaan Yang Dijangka:**
   - ✅ `azd up` selesai tanpa ralat
   - ✅ Titik hujung perkhidmatan mengembalikan HTTP 200
   - ✅ Portal Azure menunjukkan status "Running"
   - ✅ Application Insights menerima telemetri

> **⚠️ Masalah?** Lihat [Isu Lazim](../docs/chapter-07-troubleshooting/common-issues.md) untuk penyelesaian masalah penyebaran

### Menyesuaikan Contoh

Setiap contoh mengandungi:
- **README.md** - Arahan terperinci untuk penyediaan dan pengubahsuaian
- **azure.yaml** - Konfigurasi AZD dengan komen
- **infra/** - Templat Bicep dengan penjelasan parameter
- **src/** - Kod contoh aplikasi
- **scripts/** - Skrip pembantu untuk tugas biasa

## 🎯 Objektif Pembelajaran

### Kategori Contoh

#### **Penyebaran Asas**
- Aplikasi perkhidmatan tunggal
- Corak infrastruktur mudah
- Pengurusan konfigurasi asas
- Persediaan pembangunan kos efektif

#### **Senario Lanjutan**
- Seni bina multi-perkhidmatan
- Konfigurasi rangkaian kompleks
- Corak integrasi pangkalan data
- Pelaksanaan keselamatan dan pematuhan

#### **Corak Sedia Produksi**
- Konfigurasi ketersediaan tinggi
- Pemantauan dan keterlihatan
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
**Teknologi**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kerumitan**: Pemula  
**Konsep**: Pengkontenan, REST API, skala-ke-nol, prob kesihatan, pemantauan  
**Lokasi**: [Contoh Tempatan](../../../examples/container-app/simple-flask-api)

### Aplikasi Kontena - Seni Bina Mikroservis
**Teknologi**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kerumitan**: Lanjutan  
**Konsep**: Seni bina multi-perkhidmatan, komunikasi perkhidmatan, penjujukan mesej, jejak diedarkan  
**Lokasi**: [Contoh Tempatan](../../../examples/container-app/microservices)

### Aplikasi Pangkalan Data - C# dengan Azure SQL
**Teknologi**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kerumitan**: Pertengahan  
**Konsep**: Entity Framework, sambungan pangkalan data, pembangunan API web

### Fungsi Serverless - Python Azure Functions
**Teknologi**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kerumitan**: Pertengahan  
**Konsep**: Seni bina berasaskan peristiwa, pengkomputeran tanpa pelayan, pembangunan penuh-stap

### Mikroservis - Java Spring Boot
**Teknologi**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kerumitan**: Pertengahan  
**Konsep**: Komunikasi mikroservis, sistem diedarkan, corak perusahaan

### Contoh Microsoft Foundry

#### Aplikasi Chat Microsoft Foundry Models
**Teknologi**: Microsoft Foundry Models, Cognitive Search, App Service  
**Kerumitan**: Pertengahan  
**Konsep**: Seni bina RAG, carian vektor, integrasi LLM

#### Pemprosesan Dokumen AI
**Teknologi**: Azure AI Document Intelligence, Penyimpanan, Functions  
**Kerumitan**: Pertengahan  
**Konsep**: Analisis dokumen, OCR, pengekstrakan data

#### Aliran Mesin Pembelajaran
**Teknologi**: Azure ML, MLOps, Container Registry  
**Kerumitan**: Lanjutan  
**Konsep**: Latihan model, aliran penyebaran, pemantauan

## 🛠 Contoh Konfigurasi

Direktori `configurations/` mengandungi komponen boleh guna semula:

### Konfigurasi Persekitaran
- Tetapan persekitaran pembangunan
- Konfigurasi persekitaran staging
- Konfigurasi sedia produksi
- Penempatan multi-rantau

### Modul Bicep
- Komponen infrastruktur boleh guna semula
- Corak sumber biasa
- Templat yang dikuatkuasakan keselamatan
- Konfigurasi pengoptimuman kos

### Skrip Pembantu
- Automasi persediaan persekitaran
- Skrip migrasi pangkalan data
- Alat pengesahan penyebaran
- Utiliti pemantauan kos

## 🔧 Panduan Penyesuaian

### Menyesuaikan Contoh untuk Kes Penggunaan Anda

1. **Semak Prasyarat**
   - Semak keperluan perkhidmatan Azure
   - Sahkan had langganan
   - Fahami implikasi kos

2. **Ubahsuai Konfigurasi**
   - Kemas kini definisi perkhidmatan `azure.yaml`
   - Sesuaikan templat Bicep
   - Laraskan pembolehubah persekitaran

3. **Uji Secara Menyeluruh**
   - Sebarkan ke persekitaran pembangunan terlebih dahulu
   - Sahkan fungsi
   - Uji penskalaan dan prestasi

4. **Semak Keselamatan**
   - Semak kawalan akses
   - Laksanakan pengurusan rahsia
   - Aktifkan pemantauan dan amaran

## 📊 Matriks Perbandingan

| Contoh | Perkhidmatan | Pangkalan Data | Autentikasi | Pemantauan | Kerumitan |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Tempatan) | 2 | ❌ | Key Vault | Penuh | ⭐⭐ |
| **Python Flask API** (Tempatan) | 1 | ❌ | Asas | Penuh | ⭐ |
| **Mikroservis** (Tempatan) | 5+ | ✅ | Perusahaan | Lanjutan | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Asas | Asas | ⭐ |
| React SPA + Functions | 3 | ✅ | Asas | Penuh | ⭐ |
| Python Flask Container | 2 | ❌ | Asas | Penuh | ⭐ |
| C# Web API + SQL | 2 | ✅ | Penuh | Penuh | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Penuh | Penuh | ⭐⭐ |
| Java Mikroservis | 5+ | ✅ | Penuh | Penuh | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Penuh | Penuh | ⭐⭐⭐ |
| AI Pemprosesan Dokumen | 2 | ❌ | Asas | Penuh | ⭐⭐ |
| Aliran ML | 4+ | ✅ | Penuh | Penuh | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Tempatan) | **8+** | **✅** | **Perusahaan** | **Lanjutan** | **⭐⭐⭐⭐** |

## 🎓 Laluan Pembelajaran

### Perkembangan Disarankan

1. **Mula dengan Aplikasi Web Mudah**
   - Pelajari konsep asas AZD
   - Fahami aliran kerja penyebaran
   - Amalkan pengurusan persekitaran

2. **Cuba Laman Web Statik**
   - Terokai pilihan hosting berbeza
   - Ketahui integrasi CDN
   - Fahami konfigurasi DNS

3. **Bergerak ke Aplikasi Kontena**
   - Pelajari asas pengkontenan
   - Fahami konsep penskalaan
   - Amalkan dengan Docker

4. **Tambah Integrasi Pangkalan Data**
   - Pelajari penyediaan pangkalan data
   - Fahami rentetan sambungan
   - Amalkan pengurusan rahsia

5. **Terokai Serverless**
   - Fahami seni bina berasaskan peristiwa
   - Pelajari pencetus dan pengikatan
   - Amalkan dengan API

6. **Bina Mikroservis**
   - Pelajari komunikasi perkhidmatan
   - Fahami sistem diedarkan
   - Amalkan penyebaran kompleks

## 🔍 Mencari Contoh Yang Sesuai

### Mengikut Teknologi
- **Container Apps**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Java Mikroservis
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Tempatan)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis Perkhidmatan Produk (Tempatan)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Mikroservis Perkhidmatan Pesanan (Tempatan)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, Aliran ML
- **Go**: [Mikroservis Perkhidmatan Pengguna (Tempatan)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Mikroservis
- **React**: React SPA + Functions
- **Kontena**: [Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Java Mikroservis
- **Pangkalan Data**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Tempatan)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Pemprosesan Dokumen, Aliran ML, **Penyelesaian Multi-Ejen Retail**
- **Sistem Multi-Ejen**: **Penyelesaian Multi-Ejen Retail**
- **Integrasi OpenAI**: **[Microsoft Foundry Models Chat (Tempatan)](../../../examples/azure-openai-chat)**, Penyelesaian Multi-Ejen Retail
- **Pengeluaran Perusahaan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), **Penyelesaian Multi-Ejen Retail**

### Mengikut Corak Seni Bina
- **REST API Mudah**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api)
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Statik + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservis**: [Produksi Mikroservis (Tempatan)](../../../examples/container-app/microservices), Java Spring Boot Mikroservis
- **Berkontena**: [Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices)
- **Digerakkan AI**: **[Microsoft Foundry Models Chat (Tempatan)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Pemprosesan Dokumen, Aliran ML, **Penyelesaian Multi-Ejen Retail**
- **Seni Bina Multi-Ejen**: **Penyelesaian Multi-Ejen Retail**
- **Multi-Perkhidmatan Perusahaan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), **Penyelesaian Multi-Ejen Retail**

### Mengikut Tahap Kerumitan
- **Pemula**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Pertengahan**: **[Microsoft Foundry Models Chat (Tempatan)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservis, Microsoft Foundry Models Chat App, AI Pemprosesan Dokumen
- **Lanjutan**: Aliran ML
- **Sedia Pengeluaran Perusahaan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices) (Multi-perkhidmatan dengan penjujukan mesej), **Penyelesaian Multi-Ejen Retail** (Sistem multi-ejen lengkap dengan penyebaran templat ARM)

## 📚 Sumber Tambahan

### Pautan Dokumentasi
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Contoh Komuniti
- [Templat Contoh Azure AZD](https://github.com/Azure-Samples/azd-templates)
- [Templat Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galeri Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Aplikasi Todo dengan C# dan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplikasi Todo dengan Python dan MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikasi Todo dengan Node.js dan PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikasi Web React dengan API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Amalan Terbaik
- [Rangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Rangka Kerja Pengambilan Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Menyumbang Contoh

Ada contoh berguna untuk dikongsi? Kami mengalu-alukan sumbangan!

### Garis Panduan Penghantaran
1. Ikuti struktur direktori yang ditetapkan
2. Sertakan README.md yang lengkap
3. Tambah komen pada fail konfigurasi
4. Uji dengan teliti sebelum menghantar
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

**Tip Pro**: Mulakan dengan contoh paling mudah yang sesuai dengan set teknologi anda, kemudian secara beransur-ansur tingkatkan kepada senario yang lebih kompleks. Setiap contoh membina konsep dari contoh sebelumnya!

## 🚀 Sedia Mula?

### Laluan Pembelajaran Anda

1. **Pemula Lengkap?** → Mula dengan [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minit)
2. **Ada Pengetahuan AZD Asas?** → Cuba [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minit)
3. **Membangun Aplikasi AI?** → Mula dengan [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minit) atau terokai [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ jam)
4. **Perlukan Set Teknologi Spesifik?** → Gunakan bahagian [Mencari Contoh Yang Betul](#-finding-the-right-example) di atas

### Langkah Seterusnya

- ✅ Semak [Prasyarat](#prasyarat) di atas
- ✅ Pilih contoh yang sesuai dengan tahap kemahiran anda (lihat [Legenda Kompleksiti](#legenda-penarafan-kesukaran))
- ✅ Baca README contoh dengan teliti sebelum melaksanakan
- ✅ Tetapkan peringatan untuk menjalankan `azd down` selepas menguji
- ✅ Kongsi pengalaman anda melalui Isu GitHub atau Perbincangan

### Perlukan Bantuan?

- 📖 [FAQ](../resources/faq.md) - Soalan lazim dijawab
- 🐛 [Panduan Penyelesaian Masalah](../docs/chapter-07-troubleshooting/common-issues.md) - Betulkan isu pelaksanaan
- 💬 [Perbincangan GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Tanyakan komuniti
- 📚 [Panduan Belajar](../resources/study-guide.md) - Mengukuhkan pembelajaran anda

---

**Navigasi**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Bahan Belajar**: [Panduan Belajar](../resources/study-guide.md) | [Lembaran Panduan](../resources/cheat-sheet.md) | [Glosari](../resources/glossary.md)
- **🔧 Sumber**: [FAQ](../resources/faq.md) | [Penyelesaian Masalah](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Kemaskini Terakhir: November 2025 | [Laporkan Isu](https://github.com/microsoft/AZD-for-beginners/issues) | [Sumbang Contoh](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sah. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->