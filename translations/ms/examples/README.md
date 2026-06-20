# Contoh - Templat dan Konfigurasi AZD Praktikal

**Belajar Melalui Contoh - Disusun Mengikut Bab**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Pemetaan Bab**: Contoh disusun mengikut kerumitan pembelajaran
- **🚀 Contoh Tempatan**: [Penyelesaian Multi-Ejen Runcit](retail-scenario.md)
- **🤖 Contoh AI Luaran**: Pautan ke repositori Azure Samples

> **📍 PENTING: Contoh Tempatan vs Luaran**  
> Repositori ini mengandungi **4 contoh tempatan lengkap** dengan pelaksanaan penuh:  
> - **Sembang Model Foundry Microsoft** (penyebaran gpt-4.1 dengan antara muka sembang)  
> - **Aplikasi Kontena** (API Flask ringkas + Mikroservis)  
> - **Aplikasi Pangkalan Data** (Web + Pangkalan Data SQL)  
> - **Multi-Ejen Runcit** (Penyelesaian AI Perusahaan)  
>  
> Contoh tambahan adalah **rujukan luaran** ke repositori Azure-Samples yang boleh anda klon.

## Pengenalan

Direktori ini menyediakan contoh praktikal dan rujukan untuk membantu anda mempelajari Azure Developer CLI melalui amalan secara langsung. Senario Multi-Ejen Runcit adalah pelaksanaan lengkap sedia produksi yang termasuk dalam repositori ini. Contoh tambahan merujuk kepada Azure Samples rasmi yang menunjukkan pelbagai corak AZD.

### Legenda Penarafan Kerumitan

- ⭐ **Pemula** - Konsep asas, satu servis, 15-30 minit
- ⭐⭐ **Pertengahan** - Berbilang servis, integrasi pangkalan data, 30-60 minit
- ⭐⭐⭐ **Lanjutan** - Seni bina kompleks, integrasi AI, 1-2 jam
- ⭐⭐⭐⭐ **Pakar** - Sedia produksi, corak perusahaan, 2+ jam

## 🎯 Apa Yang Ada Dalam Repositori Ini

### ✅ Pelaksanaan Tempatan (Sedia Digunakan)

#### [Aplikasi Sembang Model Foundry Microsoft](azure-openai-chat/README.md) 🆕
**Penyebaran gpt-4.1 lengkap dengan antara muka sembang termasuk dalam repo ini**

- **Lokasi:** `examples/azure-openai-chat/`
- **Kerumitan:** ⭐⭐ (Pertengahan)
- **Yang Termasuk:**
  - Pelaksanaan lengkap Model Foundry Microsoft (gpt-4.1)
  - Antara muka sembang baris perintah Python
  - Integrasi Key Vault untuk kunci API selamat
  - Templat infrastruktur Bicep
  - Penjejakan penggunaan token dan kos
  - Had kadar dan pengendalian ralat

**Mula Pantas:**
```bash
# Navigasi ke contoh
cd examples/azure-openai-chat

# Sebarkan semuanya
azd up

# Pasang kebergantungan dan mula berbual
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologi:** Model Foundry Microsoft, gpt-4.1, Key Vault, Python, Bicep

#### [Contoh Aplikasi Kontena](container-app/README.md) 🆕  
**Contoh penyebaran kontena menyeluruh termasuk dalam repo ini**

- **Lokasi:** `examples/container-app/`
- **Kerumitan:** ⭐-⭐⭐⭐⭐ (Pemula hingga Lanjutan)
- **Yang Termasuk:**
  - [Panduan Utama](container-app/README.md) - Gambaran keseluruhan lengkap penyebaran kontena
  - [API Flask Ringkas](../../../examples/container-app/simple-flask-api) - Contoh API REST asas
  - [Seni Bina Mikroservis](../../../examples/container-app/microservices) - Penyebaran multi-servis sedia produksi
  - Mula Pantas, Produksi, dan corak Lanjutan
  - Pemantauan, keselamatan, dan pengoptimuman kos

**Mula Pantas:**
```bash
# Lihat panduan induk
cd examples/container-app

# Gunakan API Flask mudah
cd simple-flask-api
azd up

# Gunakan contoh mikroservis
cd ../microservices
azd up
```

**Teknologi:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Penyelesaian Multi-Ejen Runcit](retail-scenario.md) 🆕  
**Pelaksanaan lengkap sedia produksi termasuk dalam repo ini**

- **Lokasi:** `examples/retail-multiagent-arm-template/`
- **Kerumitan:** ⭐⭐⭐⭐ (Lanjutan)
- **Yang Termasuk:**
  - Templat penyebaran ARM lengkap
  - Seni bina multi-ejen (Pelanggan + Inventori)
  - Integrasi Model Foundry Microsoft
  - Pencarian AI dengan RAG
  - Pemantauan menyeluruh
  - Skrip penyebaran satu klik

**Mula Pantas:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologi:** Model Foundry Microsoft, Pencarian AI, Aplikasi Kontena, Cosmos DB, Application Insights

---

## 🔗 Azure Samples Luaran (Klon Untuk Guna)

Contoh berikut dikendalikan dalam repositori Azure-Samples rasmi. Klon untuk meneroka pelbagai corak AZD:

### Aplikasi Ringkas (Bab 1-2)

| Templat | Repositori | Kerumitan | Servis |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Tempatan: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Aplikasi Kontena, Application Insights |
| **Mikroservis** | [Tempatan: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-servis, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Aplikasi Kontena |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Aplikasi Kontena, API |

**Cara guna:**
```bash
# Klon mana-mana contoh
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Pasang
azd up
```
  
### Contoh Aplikasi AI (Bab 2, 5, 8)

| Templat | Repositori | Kerumitan | Fokus |
|:---------|:-----------|:-----------|:------|
| **Sembang Model Foundry Microsoft** | [Tempatan: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Penyebaran gpt-4.1 |
| **Permulaan Sembang AI** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Sembang AI asas |
| **Ejen AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Rangka kerja ejen |
| **Demo Cari + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Corak RAG |
| **Sembang Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI perusahaan |

### Pangkalan Data & Corak Lanjutan (Bab 3-8)

| Templat | Repositori | Kerumitan | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrasi pangkalan data |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Tanpa pelayan NoSQL |
| **Java Mikroservis** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-servis |
| **Saluran ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Matlamat Pembelajaran

Dengan mengendalikan contoh-contoh ini, anda akan:
- Berlatih aliran kerja Azure Developer CLI dengan senario aplikasi nyata
- Memahami seni bina aplikasi yang berbeza dan pelaksanaan azd mereka
- Menguasai corak Infrastruktur sebagai Kod untuk pelbagai servis Azure
- Menerapkan pengurusan konfigurasi dan strategi penyebaran khusus persekitaran
- Melaksanakan corak pemantauan, keselamatan, dan penskalaan dalam konteks praktikal
- Membangun pengalaman dengan penyelesaian masalah dan penyahpepijatan senario penyebaran sebenar

## Hasil Pembelajaran

Selepas melengkapkan contoh-contoh ini, anda akan dapat:
- Menyebarkan pelbagai jenis aplikasi menggunakan Azure Developer CLI dengan yakin
- Menyesuaikan templat disediakan kepada keperluan aplikasi anda sendiri
- Reka bentuk dan laksanakan corak infrastruktur tersuai menggunakan Bicep
- Konfigurasi aplikasi multi-servis kompleks dengan pergantungan yang betul
- Terapkan amalan terbaik keselamatan, pemantauan, dan prestasi dalam senario nyata
- Selesaikan masalah dan optimakan penyebaran berdasarkan pengalaman praktikal

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
  
## Contoh Mula Pantas

> **💡 Baru dengan AZD?** Mulakan dengan contoh #1 (API Flask) - ia mengambil masa ~20 minit dan mengajar konsep teras.

### Untuk Pemula
1. **[Aplikasi Kontena - API Python Flask](../../../examples/container-app/simple-flask-api)** (Tempatan) ⭐  
   Sebar API REST ringkas dengan skala-ke-nol  
   **Masa:** 20-25 minit | **Kos:** $0-5/bulan  
   **Anda Akan Belajar:** Aliran kerja azd asas, kontena, pemeriksaan kesihatan  
   **Hasil Dijangka:** Titik akhir API yang berfungsi memulangkan "Hello, World!" dengan pemantauan

2. **[Aplikasi Web Ringkas - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Sebar aplikasi web Node.js Express dengan MongoDB  
   **Masa:** 25-35 minit | **Kos:** $10-30/bulan  
   **Anda Akan Belajar:** Integrasi pangkalan data, pembolehubah persekitaran, rentetan sambungan  
   **Hasil Dijangka:** Aplikasi senarai tugasan dengan fungsi buat/baca/kemas kini/hapus

3. **[Laman Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hos laman web statik React dengan Azure Static Web Apps  
   **Masa:** 20-30 minit | **Kos:** $0-10/bulan  
   **Anda Akan Belajar:** Hos statik, fungsi tanpa pelayan, penyebaran CDN  
   **Hasil Dijangka:** UI React dengan API backend, SSL automatik, CDN global

### Untuk Pengguna Pertengahan
4. **[Aplikasi Sembang Model Foundry Microsoft](../../../examples/azure-openai-chat)** (Tempatan) ⭐⭐  
   Sebar gpt-4.1 dengan antara muka sembang dan pengurusan kunci API selamat  
   **Masa:** 35-45 minit | **Kos:** $50-200/bulan  
   **Anda Akan Belajar:** Penyebaran Model Foundry Microsoft, integrasi Key Vault, penjejakan token  
   **Hasil Dijangka:** Aplikasi sembang yang berfungsi dengan gpt-4.1 dan pemantauan kos

5. **[Aplikasi Kontena - Mikroservis](../../../examples/container-app/microservices)** (Tempatan) ⭐⭐⭐⭐  
   Seni bina multi-servis sedia produksi  
   **Masa:** 45-60 minit | **Kos:** $50-150/bulan  
   **Anda Akan Belajar:** Komunikasi servis, pengurusan mesej, jejak teragih  
   **Hasil Dijangka:** Sistem 2-servis (API Gateway + Servis Produk) dengan pemantauan

6. **[Aplikasi Pangkalan Data - C# dengan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikasi web dengan API C# dan Azure SQL Database  
   **Masa:** 30-45 minit | **Kos:** $20-80/bulan  
   **Anda Akan Belajar:** Entity Framework, migrasi pangkalan data, keselamatan sambungan  
   **Hasil Dijangka:** API C# dengan backend Azure SQL, penyebaran skema automatik

7. **[Fungsi Tanpa Pelayan - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions dengan pencetus HTTP dan Cosmos DB  
   **Masa:** 30-40 minit | **Kos:** $10-40/bulan  
   **Anda Akan Belajar:** Seni bina berasaskan acara, penskalaan tanpa pelayan, integrasi NoSQL  
   **Hasil Dijangka:** Aplikasi fungsi yang memberi respons kepada permintaan HTTP dengan storan Cosmos DB

8. **[Mikroservis - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplikasi Java multi-servis dengan Aplikasi Kontena dan gerbang API  
   **Masa:** 60-90 minit | **Kos:** $80-200/bulan  
   **Anda Akan Belajar:** Penyebaran Spring Boot, jaring servis, pengimbangan beban  
   **Hasil Dijangka:** Sistem Java multi-servis dengan penemuan servis dan penghalaan

### Templat Microsoft Foundry

1. **[Aplikasi Sembang Model Foundry Microsoft - Contoh Tempatan](../../../examples/azure-openai-chat)** ⭐⭐  
   Penyebaran gpt-4.1 lengkap dengan antara muka sembang  
   **Masa:** 35-45 minit | **Kos:** $50-200/bulan  
   **Hasil Dijangka:** Aplikasi sembang yang berfungsi dengan penjejakan token dan pemantauan kos

2. **[Azure Search + Demo OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplikasi sembang pintar dengan seni bina RAG  
   **Masa:** 60-90 minit | **Kos:** $100-300/bulan  
   **Hasil Dijangka:** Antara muka sembang berkuasa RAG dengan pencarian dokumen dan petikan

3. **[Pemprosesan Dokumen AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisis dokumen menggunakan servis Azure AI  
   **Masa:** 40-60 minit | **Kos:** $20-80/bulan  
   **Hasil Dijangka:** API mengekstrak teks, jadual, dan entiti dari dokumen yang dimuat naik

4. **[Saluran Pembelajaran Mesin](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Aliran kerja MLOps dengan Azure Machine Learning  
   **Masa:** 2-3 jam | **Kos:** $150-500/bulan  
   **Hasil Dijangka:** Saluran ML automatik dengan latihan, penyebaran, dan pemantauan

### Senario Dunia Sebenar

#### **Penyelesaian Multi-Ejen Runcit** 🆕  
**[Panduan Pelaksanaan Lengkap](./retail-scenario.md)**

Penyelesaian sokongan pelanggan multi-ejen komprehensif, sedia produksi yang menunjukkan penyebaran aplikasi AI kelas perusahaan dengan AZD. Senario ini menyediakan:

- **Seni Bina Lengkap**: Sistem multi-ejen dengan ejen perkhidmatan pelanggan dan pengurusan inventori khusus
- **Infrastruktur Pengeluaran**: Penempatan Model Microsoft Foundry Pelbagai Wilayah, Carian AI, Aplikasi Kontena, dan pemantauan menyeluruh  
- **Templat ARM Sedia-Digunakan**: Penempatan satu klik dengan pelbagai mod konfigurasi (Minimal/Standard/Premium)  
- **Ciri Lanjutan**: Pengesahan keselamatan red teaming, rangka kerja penilaian ejen, pengoptimuman kos, dan panduan penyelesaian masalah  
- **Konteks Perniagaan Sebenar**: Kes penggunaan sokongan pelanggan peruncit dengan muat naik fail, integrasi carian, dan penskalaan dinamik

**Teknologi**: Model Microsoft Foundry (gpt-4.1, gpt-4.1-mini), Azure AI Search, Aplikasi Kontena, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Kerumitan**: ⭐⭐⭐⭐ (Lanjutan - Sedia Pengeluaran Enterprise)

**Sesuai untuk**: Pembangun AI, arkitek penyelesaian, dan pasukan yang membina sistem multi-ejen pengeluaran

**Permulaan Pantas**: Deploy penyelesaian lengkap dalam masa kurang daripada 30 minit menggunakan templat ARM yang disertakan dengan `./deploy.sh -g myResourceGroup`

## 📋 Arahan Penggunaan

### Prasyarat

Sebelum menjalankan sebarang contoh:  
- ✅ Langganan Azure dengan akses Pemilik atau Kontributor  
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop berjalan (untuk contoh kontena)  
- ✅ Kuota Azure yang sesuai (semak keperluan khusus contoh)

> **💰 Amaran Kos:** Semua contoh mencipta sumber Azure sebenar yang akan dikenakan caj. Lihat fail README individu untuk anggaran kos. Ingat untuk menjalankan `azd down` selepas selesai untuk mengelakkan kos berterusan.

### Menjalankan Contoh Secara Tempatan

1. **Klon atau Salin Contoh**  
   ```bash
   # Navigasi ke contoh yang diingini
   cd examples/simple-web-app
   ```
  
2. **Inisialisasi Persekitaran AZD**  
   ```bash
   # Mulakan dengan templat yang sedia ada
   azd init
   
   # Atau buat persekitaran baru
   azd env new my-environment
   ```
  
3. **Konfigurasi Persekitaran**  
   ```bash
   # Tetapkan pembolehubah yang diperlukan
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Deploy**  
   ```bash
   # Lancarkan infrastruktur dan aplikasi
   azd up
   ```
  
5. **Sahkan Penempatan**  
   ```bash
   # Dapatkan titik akhir perkhidmatan
   azd env get-values
   
   # Uji titik akhir (contoh)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Petunjuk Kejayaan Dijangkakan:**  
   - ✅ `azd up` selesai tanpa ralat  
   - ✅ Titik akhir perkhidmatan mengembalikan HTTP 200  
   - ✅ Portal Azure menunjukkan status "Running"  
   - ✅ Application Insights menerima telemetri

> **⚠️ Ada masalah?** Lihat [Isu Biasa](../docs/chapter-07-troubleshooting/common-issues.md) untuk penyelesaian masalah penempatan

### Menyesuaikan Contoh

Setiap contoh termasuk:  
- **README.md** - Arahan terperinci untuk persiapan dan penyesuaian  
- **azure.yaml** - Konfigurasi AZD dengan ulasan  
- **infra/** - Templat Bicep dengan penjelasan parameter  
- **src/** - Kod aplikasi contoh  
- **scripts/** - Skrip bantuan untuk tugas biasa

## 🎯 Objektif Pembelajaran

### Kategori Contoh

#### **Penempatan Asas**  
- Aplikasi perkhidmatan tunggal  
- Corak infrastruktur mudah  
- Pengurusan konfigurasi asas  
- Persediaan pembangunan kos efektif

#### **Senario Lanjutan**  
- Seni bina pelbagai perkhidmatan  
- Konfigurasi rangkaian kompleks  
- Corak integrasi pangkalan data  
- Pelaksanaan keselamatan dan pematuhan

#### **Corak Sedia Pengeluaran**  
- Konfigurasi ketersediaan tinggi  
- Pemantauan dan keterlihatan  
- Integrasi CI/CD  
- Persediaan pemulihan bencana

## 📖 Penerangan Contoh

### Aplikasi Web Mudah - Node.js Express  
**Teknologi**: Node.js, Express, MongoDB, Aplikasi Kontena  
**Kerumitan**: Pemula  
**Konsep**: Penempatan asas, REST API, integrasi pangkalan data NoSQL

### Laman Web Statik - React SPA  
**Teknologi**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kerumitan**: Pemula  
**Konsep**: Hos statik, backend tanpa pelayan, pembangunan web moden

### Aplikasi Kontena - Python Flask  
**Teknologi**: Python Flask, Docker, Aplikasi Kontena, Container Registry, Application Insights  
**Kerumitan**: Pemula  
**Konsep**: Kontena, REST API, skala ke sifar, probe kesihatan, pemantauan  
**Lokasi**: [Contoh Tempatan](../../../examples/container-app/simple-flask-api)

### Aplikasi Kontena - Seni Bina Mikroservis  
**Teknologi**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Aplikasi Kontena  
**Kerumitan**: Lanjutan  
**Konsep**: Seni bina berbilang perkhidmatan, komunikasi perkhidmatan, antrian mesej, penjejakan diedarkan  
**Lokasi**: [Contoh Tempatan](../../../examples/container-app/microservices)

### Aplikasi Pangkalan Data - C# dengan Azure SQL  
**Teknologi**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kerumitan**: Pertengahan  
**Konsep**: Entity Framework, sambungan pangkalan data, pembangunan web API

### Fungsi Serverless - Python Azure Functions  
**Teknologi**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kerumitan**: Pertengahan  
**Konsep**: Seni bina berasaskan acara, pengkomputeran tanpa pelayan, pembangunan penuh tumpukan

### Mikroservis - Java Spring Boot  
**Teknologi**: Java Spring Boot, Aplikasi Kontena, Service Bus, API Gateway  
**Kerumitan**: Pertengahan  
**Konsep**: Komunikasi mikroservis, sistem diedarkan, corak perusahaan

### Contoh Microsoft Foundry

#### Aplikasi Chat Model Microsoft Foundry  
**Teknologi**: Model Microsoft Foundry, Azure AI Search, App Service  
**Kerumitan**: Pertengahan  
**Konsep**: Seni bina RAG, carian vektor, integrasi LLM

#### Pemprosesan Dokumen AI  
**Teknologi**: Azure AI Document Intelligence, Storage, Functions  
**Kerumitan**: Pertengahan  
**Konsep**: Analisis dokumen, OCR, ekstraksi data

#### Saluran Pembelajaran Mesin  
**Teknologi**: Azure ML, MLOps, Container Registry  
**Kerumitan**: Lanjutan  
**Konsep**: Latihan model, saluran pelaksanaan, pemantauan

## 🛠 Contoh Konfigurasi

Direktori `configurations/` mengandungi komponen boleh guna semula:

### Konfigurasi Persekitaran  
- Tetapan persekitaran pembangunan  
- Konfigurasi persekitaran staging  
- Konfigurasi sedia pengeluaran  
- Persediaan penempatan pelbagai wilayah

### Modul Bicep  
- Komponen infrastruktur boleh guna semula  
- Corak sumber biasa  
- Templat dikuatkuasakan keselamatan  
- Konfigurasi pengoptimuman kos

### Skrip Bantuan  
- Automasi persediaan persekitaran  
- Skrip migrasi pangkalan data  
- Alat pengesahan penempatan  
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

3. **Uji Dengan Teliti**  
   - Deploy ke persekitaran pembangunan terlebih dahulu  
   - Sahkan fungsi  
   - Uji penskalaan dan prestasi

4. **Semak Keselamatan**  
   - Semak kawalan akses  
   - Laksanakan pengurusan rahsia  
   - Aktifkan pemantauan dan pemberitahuan

## 📊 Matriks Perbandingan

| Contoh | Perkhidmatan | Pangkalan Data | Auth | Pemantauan | Kerumitan |
|---------|----------|----------|------|------------|------------|
| **Chat Model Microsoft Foundry** (Tempatan) | 2 | ❌ | Key Vault | Penuh | ⭐⭐ |
| **API Python Flask** (Tempatan) | 1 | ❌ | Asas | Penuh | ⭐ |
| **Mikroservis** (Tempatan) | 5+ | ✅ | Enterprise | Lanjutan | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Asas | Asas | ⭐ |
| React SPA + Functions | 3 | ✅ | Asas | Penuh | ⭐ |
| Python Flask Kontena | 2 | ❌ | Asas | Penuh | ⭐ |
| C# Web API + SQL | 2 | ✅ | Penuh | Penuh | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Penuh | Penuh | ⭐⭐ |
| Java Mikroservis | 5+ | ✅ | Penuh | Penuh | ⭐⭐ |
| Chat Model Microsoft Foundry | 3 | ✅ | Penuh | Penuh | ⭐⭐⭐ |
| Pemprosesan Dokumen AI | 2 | ❌ | Asas | Penuh | ⭐⭐ |
| Saluran ML | 4+ | ✅ | Penuh | Penuh | ⭐⭐⭐⭐ |
| **Multi-Ejen Peruncit** (Tempatan) | **8+** | **✅** | **Enterprise** | **Lanjutan** | **⭐⭐⭐⭐** |

## 🎓 Laluan Pembelajaran

### Progression Disyorkan

1. **Mulakan dengan Aplikasi Web Mudah**  
   - Belajar konsep asas AZD  
   - Fahami aliran kerja penempatan  
   - Latih pengurusan persekitaran

2. **Cuba Laman Web Statik**  
   - Teroka pilihan hosting berbeza  
   - Pelajari mengenai integrasi CDN  
   - Fahami konfigurasi DNS

3. **Bergerak ke Aplikasi Kontena**  
   - Pelajari asas kontena  
   - Fahami konsep penskalaan  
   - Latih menggunakan Docker

4. **Tambah Integrasi Pangkalan Data**  
   - Pelajari penyediaan pangkalan data  
   - Fahami rentetan sambungan  
   - Latih pengurusan rahsia

5. **Terokai Serverless**  
   - Fahami seni bina berasaskan acara  
   - Pelajari tentang pencetus dan pautan  
   - Latih dengan API

6. **Bina Mikroservis**  
   - Pelajari komunikasi perkhidmatan  
   - Fahami sistem diedarkan  
   - Latih penempatan kompleks

## 🔍 Mencari Contoh Yang Betul

### Mengikut Tumpukan Teknologi  
- **Aplikasi Kontena**: [API Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Java Mikroservis  
- **Node.js**: Aplikasi Node.js Express Todo, [API Gerbang Mikroservis (Tempatan)](../../../examples/container-app/microservices)  
- **Python**: [API Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Perkhidmatan Produk Mikroservis (Tempatan)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Perkhidmatan Pesanan Mikroservis (Tempatan)](../../../examples/container-app/microservices), C# Web API + Pangkalan Data SQL, Aplikasi Chat Model Microsoft Foundry, Saluran ML  
- **Go**: [Perkhidmatan Pengguna Mikroservis (Tempatan)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroservis  
- **React**: React SPA + Functions  
- **Kontena**: [Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Java Mikroservis  
- **Pangkalan Data**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Chat Model Microsoft Foundry (Tempatan)](../../../examples/azure-openai-chat)**, Aplikasi Chat Model Microsoft Foundry, Pemprosesan Dokumen AI, Saluran ML, **Penyelesaian Multi-Ejen Peruncit**  
- **Sistem Multi-Ejen**: **Penyelesaian Multi-Ejen Peruncit**  
- **Integrasi OpenAI**: **[Chat Model Microsoft Foundry (Tempatan)](../../../examples/azure-openai-chat)**, Penyelesaian Multi-Ejen Peruncit  
- **Pengeluaran Enterprise**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), **Penyelesaian Multi-Ejen Peruncit**

### Mengikut Corak Seni Bina  
- **REST API Mudah**: [API Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api)  
- **Monolitik**: Node.js Express Todo, C# Web API + SQL  
- **Statik + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Mikroservis**: [Mikroservis Pengeluaran (Tempatan)](../../../examples/container-app/microservices), Java Spring Boot Mikroservis  
- **Kontena**: [Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices)  
- **Berkuasa AI**: **[Chat Model Microsoft Foundry (Tempatan)](../../../examples/azure-openai-chat)**, Aplikasi Chat Model Microsoft Foundry, Pemprosesan Dokumen AI, Saluran ML, **Penyelesaian Multi-Ejen Peruncit**  
- **Seni Bina Multi-Ejen**: **Penyelesaian Multi-Ejen Peruncit**  
- **Enterprise Multi-Perkhidmatan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), **Penyelesaian Multi-Ejen Peruncit**

### Mengikut Tahap Kerumitan  
- **Pemula**: [API Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Pertengahan**: **[Chat Model Microsoft Foundry (Tempatan)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservis, Aplikasi Chat Model Microsoft Foundry, Pemprosesan Dokumen AI  
- **Lanjutan**: Saluran ML  
- **Sedia Pengeluaran Enterprise**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices) (Multi-perkhidmatan dengan antrian mesej), **Penyelesaian Multi-Ejen Peruncit** (Sistem multi-ejen lengkap dengan penempatan templat ARM)

## 📚 Sumber Tambahan

### Pautan Dokumentasi  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Templat Microsoft Foundry AZD](https://github.com/Azure/ai-foundry-templates)  
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Pusat Arkitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Contoh Komuniti  
- [Templat Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)  
- [Templat Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Galeri Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Aplikasi Todo dengan C# dan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Aplikasi Todo dengan Python dan MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Aplikasi Todo dengan Node.js dan PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Apl Web React dengan API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Tugas Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Amalan Terbaik
- [Rangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Rangka Kerja Pengambilan Awan](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Menyumbang Contoh

Ada contoh berguna untuk dikongsi? Kami alu-alukan sumbangan!

### Garis Panduan Penyerahan
1. Ikuti struktur direktori yang telah ditetapkan
2. Sertakan README.md yang menyeluruh
3. Tambah komen pada fail konfigurasi
4. Uji secara menyeluruh sebelum menyerah
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

**Petua Pro**: Mulakan dengan contoh paling mudah yang sesuai dengan tumpukan teknologi anda, kemudian secara berperingkat tingkatkan ke senario yang lebih kompleks. Setiap contoh dibina berdasarkan konsep dari contoh sebelumnya!

## 🚀 Sedia Bermula?

### Laluan Pembelajaran Anda

1. **Pemula Lengkap?** → Mula dengan [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minit)
2. **Ada Pengetahuan Asas AZD?** → Cuba [Mikroservis](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minit)
3. **Membangun Apl AI?** → Mula dengan [Model Microsoft Foundry Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minit) atau terokai [Runcit Pelbagai Ejen](retail-scenario.md) (⭐⭐⭐⭐, 2+ jam)
4. **Perlukan Tumpukan Teknologi Spesifik?** → Gunakan bahagian [Menemukan Contoh Yang Sesuai](#-finding-the-right-example) di atas

### Langkah Seterusnya

- ✅ Semak [Prasyarat](#prasyarat) di atas
- ✅ Pilih contoh yang sesuai dengan tahap kemahiran anda (lihat [Legenda Tahap Kerumitan](#legenda-penarafan-kerumitan))
- ✅ Baca README contoh dengan teliti sebelum penerapan
- ✅ Tetapkan peringatan untuk menjalankan `azd down` selepas ujian
- ✅ Kongsi pengalaman anda melalui Isu GitHub atau Perbincangan

### Perlukan Bantuan?

- 📖 [FAQ](../resources/faq.md) - Soalan lazim dijawab
- 🐛 [Panduan Penyelesaian Masalah](../docs/chapter-07-troubleshooting/common-issues.md) - Baiki isu penerapan
- 💬 [Perbincangan GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Tanyakan komuniti
- 📚 [Panduan Pembelajaran](../resources/study-guide.md) - Kukuhkan pembelajaran anda

---

**Navigasi**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Bahan Kajian**: [Panduan Pembelajaran](../resources/study-guide.md) | [Lembaran Panduan](../resources/cheat-sheet.md) | [Glosari](../resources/glossary.md)
- **🔧 Sumber**: [FAQ](../resources/faq.md) | [Penyelesaian Masalah](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Terakhir Dikemas Kini: November 2025 | [Laporkan Isu](https://github.com/microsoft/AZD-for-beginners/issues) | [Sumbang Contoh](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->