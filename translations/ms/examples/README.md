# Contoh - Templat dan Konfigurasi AZD Praktikal

**Belajar Melalui Contoh - Disusun Mengikut Bab**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Pemetaan Bab**: Contoh dianjurkan mengikut tahap kesukaran pembelajaran
- **🚀 Contoh Tempatan**: [Penyelesaian Multi-Agen Runcit](retail-scenario.md)
- **🤖 Contoh AI Luar**: Pautan ke repositori Azure Samples

> **📍 PENTING: Contoh Tempatan vs Luar**  
> Repositori ini mengandungi **4 contoh tempatan lengkap** dengan pelaksanaan penuh:  
> - **Azure OpenAI Chat** (penyebaran GPT-4 dengan antara muka sembang)  
> - **Container Apps** (API Flask Ringkas + Microservices)  
> - **Aplikasi Pangkalan Data** (Web + Pangkalan Data SQL)  
> - **Penyelesaian Multi-Agen Runcit** (Penyelesaian AI Enterprise)  
>  
> Contoh tambahan adalah **rujukan luar** kepada repositori Azure-Samples yang boleh anda klon.

## Pengenalan

Direktori ini menyediakan contoh praktikal dan rujukan untuk membantu anda mempelajari Azure Developer CLI melalui latihan amali. Senario Multi-Agen Runcit adalah pelaksanaan lengkap yang sedia digunakan untuk pengeluaran dan disertakan dalam repositori ini. Contoh tambahan merujuk kepada Azure Samples rasmi yang menunjukkan pelbagai corak AZD.

### Legenda Penarafan Kerumitan

- ⭐ **Pemula** - Konsep asas, satu perkhidmatan, 15-30 minit
- ⭐⭐ **Pertengahan** - Pelbagai perkhidmatan, integrasi pangkalan data, 30-60 minit
- ⭐⭐⭐ **Lanjutan** - Seni bina kompleks, integrasi AI, 1-2 jam
- ⭐⭐⭐⭐ **Pakar** - Sedia pengeluaran, corak perusahaan, 2+ jam

## 🎯 Apa Sebenarnya Ada Dalam Repositori Ini

### ✅ Pelaksanaan Tempatan (Sedia Digunakan)

#### [Aplikasi Sembang Azure OpenAI](azure-openai-chat/README.md) 🆕  
**Penyebaran GPT-4 penuh dengan antara muka sembang disertakan dalam repo ini**

- **Lokasi:** `examples/azure-openai-chat/`
- **Kerumitan:** ⭐⭐ (Pertengahan)
- **Apa Yang Disertakan:**
  - Penyebaran Azure OpenAI lengkap (GPT-4)
  - Antara muka sembang baris perintah Python
  - Integrasi Key Vault untuk kunci API yang selamat
  - Templat infrastruktur Bicep
  - Penjejakan penggunaan token dan kos
  - Had kadar dan pengendalian ralat

**Mula Cepat:**
```bash
# Navigasi ke contoh
cd examples/azure-openai-chat

# Sebarkan semuanya
azd up

# Pasang kebergantungan dan mula bersembang
pip install -r src/requirements.txt
python src/chat.py
```
  
**Teknologi:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Contoh Aplikasi Container](container-app/README.md) 🆕  
**Contoh penyebaran container yang menyeluruh disertakan dalam repo ini**

- **Lokasi:** `examples/container-app/`
- **Kerumitan:** ⭐-⭐⭐⭐⭐ (Pemula ke Lanjutan)
- **Apa Yang Disertakan:**
  - [Panduan Utama](container-app/README.md) - Gambaran keseluruhan lengkap penyebaran container
  - [API Flask Ringkas](../../../examples/container-app/simple-flask-api) - Contoh REST API asas
  - [Seni Bina Microservices](../../../examples/container-app/microservices) - Penyebaran pelbagai perkhidmatan sedia produksi
  - Mula Cepat, Pengeluaran, dan Corak Lanjutan
  - Pemantauan, keselamatan, dan pengoptimuman kos

**Mula Cepat:**
```bash
# Lihat panduan utama
cd examples/container-app

# Menggunakan API Flask mudah
cd simple-flask-api
azd up

# Contoh penggunaan mikroservis
cd ../microservices
azd up
```
  
**Teknologi:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Penyelesaian Multi-Agen Runcit](retail-scenario.md) 🆕  
**Pelaksanaan lengkap yang sedia pengeluaran disertakan dalam repo ini**

- **Lokasi:** `examples/retail-multiagent-arm-template/`
- **Kerumitan:** ⭐⭐⭐⭐ (Lanjutan)
- **Apa Yang Disertakan:**
  - Templat penyebaran ARM lengkap
  - Seni bina multi-agen (Pelanggan + Inventori)
  - Integrasi Azure OpenAI
  - Carian AI dengan RAG
  - Pemantauan menyeluruh
  - Skrip penyebaran satu klik

**Mula Cepat:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Teknologi:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Contoh Azure Luar (Klon Untuk Gunakan)

Contoh berikut dikekalkan dalam repositori Azure-Samples rasmi. Klon untuk terokai corak AZD yang berbeza:

### Aplikasi Mudah (Bab 1-2)

| Templat | Repositori | Kerumitan | Perkhidmatan |
|:---------|:-----------|:-----------|:---------|
| **API Python Flask** | [Tempatan: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Tempatan: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Pelbagai perkhidmatan, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Container Python Flask** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Cara menggunakan:**
```bash
# Klon mana-mana contoh
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Lancarkan
azd up
```
  
### Contoh Aplikasi AI (Bab 2, 5, 8)

| Templat | Repositori | Kerumitan | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Tempatan: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Penyebaran GPT-4 |
| **Mula Cepat Sembang AI** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Sembang AI asas |
| **Ejen AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Rangka kerja agen |
| **Cari + Demonstrasi OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Corak RAG |
| **Sembang Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI perusahaan |

### Pangkalan Data & Corak Lanjutan (Bab 3-8)

| Templat | Repositori | Kerumitan | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrasi pangkalan data |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Pelbagai perkhidmatan |
| **Saluran ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Matlamat Pembelajaran

Dengan mengusahakan contoh-contoh ini, anda akan:  
- Amalkan aliran kerja Azure Developer CLI dengan senario aplikasi yang realistik  
- Fahami seni bina aplikasi berbeza dan pelaksanaan azd mereka  
- Kuasai corak Infrastruktur sebagai Kod bagi pelbagai perkhidmatan Azure  
- Terapkan pengurusan konfigurasi dan strategi penyebaran khusus persekitaran  
- Laksanakan corak pemantauan, keselamatan, dan penskalaan dalam konteks praktikal  
- Kumpul pengalaman menyelesaikan masalah dan debug senario penyebaran sebenar

## Hasil Pembelajaran

Selepas menamatkan contoh-contoh ini, anda mampu:  
- Menyebarkan pelbagai jenis aplikasi menggunakan Azure Developer CLI dengan yakin  
- Sesuaikan templat disediakan mengikut keperluan aplikasi anda sendiri  
- Reka bentuk dan laksanakan corak infrastruktur tersuai menggunakan Bicep  
- Konfigurasikan aplikasi pelbagai perkhidmatan yang kompleks dengan kebergantungan yang betul  
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

> **💡 Baru dengan AZD?** Mulakan dengan contoh #1 (Flask API) - ia mengambil ~20 minit dan mengajar konsep teras.

### Untuk Pemula
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Tempatan) ⭐  
   Sebarkan REST API mudah dengan skala ke sifar  
   **Masa:** 20-25 minit | **Kos:** $0-5/bulan  
   **Anda Akan Belajar:** Aliran kerja azd asas, kontena, probe kesihatan  
   **Hasil Yang Dijangka:** Titik akhir API berfungsi memaparkan "Hello, World!" dengan pemantauan

2. **[Aplikasi Web Ringkas - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Sebarkan aplikasi web Node.js Express dengan MongoDB  
   **Masa:** 25-35 minit | **Kos:** $10-30/bulan  
   **Anda Akan Belajar:** Integrasi pangkalan data, pembolehubah persekitaran, string sambungan  
   **Hasil Yang Dijangka:** Aplikasi senarai tugasan dengan fungsi buat/baca/kemaskini/hapus

3. **[Laman Web Statik - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hos laman web statik React dengan Azure Static Web Apps  
   **Masa:** 20-30 minit | **Kos:** $0-10/bulan  
   **Anda Akan Belajar:** Hosting statik, fungsi serverless, penyebaran CDN  
   **Hasil Yang Dijangka:** UI React dengan API backend, SSL automatik, CDN global

### Untuk Pengguna Pertengahan
4. **[Aplikasi Sembang Azure OpenAI](../../../examples/azure-openai-chat)** (Tempatan) ⭐⭐  
   Sebarkan GPT-4 dengan antara muka sembang dan pengurusan kunci API selamat  
   **Masa:** 35-45 minit | **Kos:** $50-200/bulan  
   **Anda Akan Belajar:** Penyebaran Azure OpenAI, integrasi Key Vault, penjejakan token  
   **Hasil Yang Dijangka:** Aplikasi sembang berfungsi dengan GPT-4 dan pemantauan kos

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Tempatan) ⭐⭐⭐⭐  
   Seni bina pelbagai perkhidmatan sedia pengeluaran  
   **Masa:** 45-60 minit | **Kos:** $50-150/bulan  
   **Anda Akan Belajar:** Komunikasi perkhidmatan, antrian mesej, pengesanan diedarkan  
   **Hasil Yang Dijangka:** Sistem 2 perkhidmatan (API Gateway + Perkhidmatan Produk) dengan pemantauan

6. **[Aplikasi Pangkalan Data - C# dengan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Aplikasi web dengan API C# dan Pangkalan Data Azure SQL  
   **Masa:** 30-45 minit | **Kos:** $20-80/bulan  
   **Anda Akan Belajar:** Entity Framework, migrasi pangkalan data, keselamatan sambungan  
   **Hasil Yang Dijangka:** API C# dengan backend Azure SQL, penyebaran skema automatik

7. **[Fungsi Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Fungsi Python Azure dengan pencetus HTTP dan Cosmos DB  
   **Masa:** 30-40 minit | **Kos:** $10-40/bulan  
   **Anda Akan Belajar:** Seni bina berasaskan acara, penskalaan serverless, integrasi NoSQL  
   **Hasil Yang Dijangka:** Aplikasi fungsi yang bertindak balas kepada permintaan HTTP dengan storan Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Aplikasi Java pelbagai perkhidmatan dengan Container Apps dan gateway API  
   **Masa:** 60-90 minit | **Kos:** $80-200/bulan  
   **Anda Akan Belajar:** Penyebaran Spring Boot, jaringan perkhidmatan, imbangan beban  
   **Hasil Yang Dijangka:** Sistem Java pelbagai perkhidmatan dengan pengesanan perkhidmatan dan penghalaan

### Templat Microsoft Foundry

1. **[Aplikasi Sembang Azure OpenAI - Contoh Tempatan](../../../examples/azure-openai-chat)** ⭐⭐  
   Penyebaran GPT-4 lengkap dengan antara muka sembang  
   **Masa:** 35-45 minit | **Kos:** $50-200/bulan  
   **Hasil Yang Dijangka:** Aplikasi sembang berfungsi dengan penjejakan token dan pemantauan kos

2. **[Azure Search + Demonstrasi OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Aplikasi sembang pintar dengan seni bina RAG  
   **Masa:** 60-90 minit | **Kos:** $100-300/bulan  
   **Hasil Yang Dijangka:** Antara muka sembang dikuasakan RAG dengan carian dokumen dan sitasi

3. **[Pemprosesan Dokumen AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analisis dokumen menggunakan perkhidmatan Azure AI  
   **Masa:** 40-60 minit | **Kos:** $20-80/bulan  
   **Hasil Yang Dijangka:** API mengekstrak teks, jadual, dan entiti dari dokumen yang dimuat naik

4. **[Saluran Pembelajaran Mesin](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Aliran kerja MLOps dengan Azure Machine Learning  
   **Masa:** 2-3 jam | **Kos:** $150-500/bulan  
   **Hasil Yang Dijangka:** Saluran ML automatik dengan latihan, penyebaran, dan pemantauan

### Senario Dunia Sebenar

#### **Penyelesaian Multi-Agen Runcit** 🆕  
**[Panduan Pelaksanaan Lengkap](./retail-scenario.md)**

Penyelesaian sokongan pelanggan multi-agen yang menyeluruh dan sedia pengeluaran yang menunjukkan penyebaran aplikasi AI bertaraf perusahaan menggunakan AZD. Senario ini menyediakan:

- **Seni Bina Lengkap**: Sistem multi-agen dengan agen perkhidmatan pelanggan dan pengurusan inventori khusus
- **Infrastruktur Pengeluaran**: Penempatan Azure OpenAI pelbagai rantau, Carian AI, Apl Kontena, dan pemantauan menyeluruh  
- **Templat ARM Sedia Untuk Diperlukan**: Pelaksanaan satu klik dengan pelbagai mod konfigurasi (Minimal/Standard/Premium)  
- **Ciri-ciri Lanjutan**: Pengesahan keselamatan red teaming, rangka kerja penilaian ejen, pengoptimuman kos, dan panduan penyelesaian masalah  
- **Konteks Perniagaan Sebenar**: Kes penggunaan sokongan pelanggan peruncit dengan muat naik fail, integrasi carian, dan penskalaan dinamik  

**Teknologi**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Kesukaran**: ⭐⭐⭐⭐ (Lanjutan - Sedia Pengeluaran Perusahaan)  

**Sesuai untuk**: Pembangun AI, arkitek penyelesaian, dan pasukan yang membina sistem multi-ejen pengeluaran  

**Permulaan Pantas**: Lancarkan penyelesaian lengkap dalam masa kurang dari 30 minit menggunakan templat ARM yang disediakan dengan `./deploy.sh -g myResourceGroup`  

## 📋 Arahan Penggunaan

### Prasyarat

Sebelum menjalankan mana-mana contoh:  
- ✅ Langganan Azure dengan akses Pemilik atau Penyumbang  
- ✅ Azure Developer CLI dipasang ([Panduan Pemasangan](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop berjalan (untuk contoh kontena)  
- ✅ Kuota Azure yang sesuai (semak keperluan spesifik contoh)  

> **💰 Amaran Kos:** Semua contoh mencipta sumber Azure sebenar yang mengenakan caj. Lihat fail README individu untuk anggaran kos. Ingat untuk menjalankan `azd down` apabila selesai untuk mengelakkan kos berterusan.  

### Menjalankan Contoh Secara Tempatan

1. **Klon atau Salin Contoh**  
   ```bash
   # Navigasi ke contoh yang dikehendaki
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
  
4. **Lancarkan**  
   ```bash
   # Lancarkan infrastruktur dan aplikasi
   azd up
   ```
  
5. **Sahkan Pelaksanaan**  
   ```bash
   # Dapatkan titik akhir perkhidmatan
   azd env get-values
   
   # Uji titik akhir (contoh)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Penunjuk Kejayaan Dijangka:**  
   - ✅ `azd up` selesai tanpa ralat  
   - ✅ Titik akhir perkhidmatan memulangkan HTTP 200  
   - ✅ Azure Portal menunjukkan status "Running"  
   - ✅ Application Insights menerima telemetri  

> **⚠️ Masalah?** Lihat [Isu Biasa](../docs/chapter-07-troubleshooting/common-issues.md) untuk penyelesaian masalah pelaksanaan  

### Menyesuaikan Contoh

Setiap contoh mengandungi:  
- **README.md** - Arahan terperinci untuk penyediaan dan pengubahsuaian  
- **azure.yaml** - Konfigurasi AZD dengan ulasan  
- **infra/** - Templat Bicep dengan penjelasan parameter  
- **src/** - Kod aplikasi sampel  
- **scripts/** - Skrip pembantu untuk tugasan biasa  

## 🎯 Objektif Pembelajaran

### Kategori Contoh

#### **Pelaksanaan Asas**  
- Aplikasi perkhidmatan tunggal  
- Corak infrastruktur mudah  
- Pengurusan konfigurasi asas  
- Penetapan pembangunan kos efektif  

#### **Senario Lanjutan**  
- Seni bina pelbagai perkhidmatan  
- Konfigurasi rangkaian kompleks  
- Corak integrasi pangkalan data  
- Pelaksanaan keselamatan dan pematuhan  

#### **Corak Sedia Pengeluaran**  
- Konfigurasi ketersediaan tinggi  
- Pemantauan dan pemerhatian  
- Integrasi CI/CD  
- Penetapan pemulihan bencana  

## 📖 Penerangan Contoh

### Apl Web Mudah - Node.js Express  
**Teknologi**: Node.js, Express, MongoDB, Container Apps  
**Kesukaran**: Pemula  
**Konsep**: Pelaksanaan asas, API REST, integrasi pangkalan data NoSQL  

### Laman Web Statik - React SPA  
**Teknologi**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kesukaran**: Pemula  
**Konsep**: Penghosan statik, backend tanpa server, pembangunan web moden  

### Apl Kontena - Python Flask  
**Teknologi**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Kesukaran**: Pemula  
**Konsep**: Pengkontenan, API REST, skala-ke-nol, probes kesihatan, pemantauan  
**Lokasi**: [Contoh Tempatan](../../../examples/container-app/simple-flask-api)  

### Apl Kontena - Seni Bina Mikroservis  
**Teknologi**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Kesukaran**: Lanjutan  
**Konsep**: Seni bina pelbagai perkhidmatan, komunikasi perkhidmatan, penjujukan mesej, penjejakan teragih  
**Lokasi**: [Contoh Tempatan](../../../examples/container-app/microservices)  

### Apl Pangkalan Data - C# dengan Azure SQL  
**Teknologi**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kesukaran**: Pertengahan  
**Konsep**: Entity Framework, sambungan pangkalan data, pembangunan web API  

### Fungsi Tanpa Server - Python Azure Functions  
**Teknologi**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kesukaran**: Pertengahan  
**Konsep**: Seni bina berasaskan acara, pengkomputeran tanpa server, pembangunan penuh tumpukan  

### Mikroservis - Java Spring Boot  
**Teknologi**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kesukaran**: Pertengahan  
**Konsep**: Komunikasi mikroservis, sistem teragih, corak perusahaan  

### Contoh Microsoft Foundry

#### Apl Chat Azure OpenAI  
**Teknologi**: Azure OpenAI, Cognitive Search, App Service  
**Kesukaran**: Pertengahan  
**Konsep**: Seni bina RAG, carian vektor, integrasi LLM  

#### Pemprosesan Dokumen AI  
**Teknologi**: Azure AI Document Intelligence, Storage, Functions  
**Kesukaran**: Pertengahan  
**Konsep**: Analisis dokumen, OCR, ekstraksi data  

#### Laluan Pembelajaran Mesin  
**Teknologi**: Azure ML, MLOps, Container Registry  
**Kesukaran**: Lanjutan  
**Konsep**: Latihan model, laluan pelaksanaan, pemantauan  

## 🛠 Contoh Konfigurasi

Direktori `configurations/` mengandungi komponen boleh guna semula:  

### Konfigurasi Persekitaran  
- Tetapan persekitaran pembangunan  
- Konfigurasi persekitaran staging  
- Konfigurasi sedia pengeluaran  
- Penempatan multi-rantau  

### Modul Bicep  
- Komponen infrastruktur boleh guna semula  
- Corak sumber biasa  
- Templat dikuatkuasakan keselamatan  
- Konfigurasi pengoptimuman kos  

### Skrip Pembantu  
- Automasi penyediaan persekitaran  
- Skrip migrasi pangkalan data  
- Alat pengesahan pelaksanaan  
- Utiliti pemantauan kos  

## 🔧 Panduan Penyesuaian

### Menyesuaikan Contoh Mengikut Kes Penggunaan Anda

1. **Semak Prasyarat**  
   - Semak keperluan perkhidmatan Azure  
   - Sahkan had langganan  
   - Fahami implikasi kos  

2. **Ubah Suai Konfigurasi**  
   - Kemas kini definisi perkhidmatan dalam `azure.yaml`  
   - Sesuaikan templat Bicep  
   - Laraskan pembolehubah persekitaran  

3. **Uji Secara Menyeluruh**  
   - Lancarkan ke persekitaran pembangunan terlebih dahulu  
   - Sahkan fungsian  
   - Uji skalabiliti dan prestasi  

4. **Kajian Keselamatan**  
   - Semak kawalan akses  
   - Laksanakan pengurusan rahsia  
   - Aktifkan pemantauan dan pemberitahuan  

## 📊 Matriks Perbandingan

| Contoh | Perkhidmatan | Pangkalan Data | Pengesahan | Pemantauan | Kesukaran |  
|---------|--------------|----------------|------------|------------|------------|  
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
| Laluan ML | 4+ | ✅ | Penuh | Penuh | ⭐⭐⭐⭐ |  
| **Multi-Ejen Peruncit** (Tempatan) | **8+** | **✅** | **Perusahaan** | **Lanjutan** | **⭐⭐⭐⭐** |  

## 🎓 Laluan Pembelajaran

### Progression Disyorkan

1. **Mulakan dengan Apl Web Mudah**  
   - Pelajari konsep AZD asas  
   - Fahami aliran kerja pelaksanaan  
   - Amalkan pengurusan persekitaran  

2. **Cuba Laman Web Statik**  
   - Terokai pilihan penghosan berbeza  
   - Pelajari integrasi CDN  
   - Fahami konfigurasi DNS  

3. **Berpindah ke Apl Kontena**  
   - Pelajari asas pengkontenan  
   - Fahami konsep penskalaan  
   - Amalkan dengan Docker  

4. **Tambah Integrasi Pangkalan Data**  
   - Pelajari penyediaan pangkalan data  
   - Fahami rentetan sambungan  
   - Amalkan pengurusan rahsia  

5. **Terokai Tanpa Server**  
   - Fahami seni bina berasaskan acara  
   - Pelajari pencetus dan pengikat  
   - Amalkan dengan API  

6. **Bina Mikroservis**  
   - Pelajari komunikasi perkhidmatan  
   - Fahami sistem teragih  
   - Amalkan pelaksanaan kompleks  

## 🔍 Mencari Contoh Yang Sesuai

### Mengikut Tumpukan Teknologi  
- **Container Apps**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Java Mikroservis  
- **Node.js**: Apl Todo Node.js Express, [Microservices API Gateway (Tempatan)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis Perkhidmatan Produk (Tempatan)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroservis Perkhidmatan Pesanan (Tempatan)](../../../examples/container-app/microservices), C# Web API + SQL Database, Apl Chat Azure OpenAI, Laluan ML  
- **Go**: [Mikroservis Perkhidmatan Pengguna (Tempatan)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroservis  
- **React**: React SPA + Functions  
- **Kontena**: [Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Java Mikroservis  
- **Pangkalan Data**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Tempatan)](../../../examples/azure-openai-chat)**, Apl Chat Azure OpenAI, Pemprosesan Dokumen AI, Laluan ML, **Penyelesaian Multi-Ejen Peruncit**  
- **Sistem Multi-Ejen**: **Penyelesaian Multi-Ejen Peruncit**  
- **Integrasi OpenAI**: **[Azure OpenAI Chat (Tempatan)](../../../examples/azure-openai-chat)**, Penyelesaian Multi-Ejen Peruncit  
- **Pengeluaran Perusahaan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), **Penyelesaian Multi-Ejen Peruncit**  

### Mengikut Corak Seni Bina  
- **API REST Mudah**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api)  
- **Monolitik**: Node.js Express Todo, C# Web API + SQL  
- **Statik + Tanpa Server**: React SPA + Functions, Python Functions + SPA  
- **Mikroservis**: [Mikroservis Pengeluaran (Tempatan)](../../../examples/container-app/microservices), Java Spring Boot Mikroservis  
- **Berkontena**: [Python Flask (Tempatan)](../../../examples/container-app/simple-flask-api), [Mikroservis (Tempatan)](../../../examples/container-app/microservices)  
- **Diperkasa AI**: **[Azure OpenAI Chat (Tempatan)](../../../examples/azure-openai-chat)**, Apl Chat Azure OpenAI, Pemprosesan Dokumen AI, Laluan ML, **Penyelesaian Multi-Ejen Peruncit**  
- **Seni Bina Multi-Ejen**: **Penyelesaian Multi-Ejen Peruncit**  
- **Multi-Perkhidmatan Perusahaan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices), **Penyelesaian Multi-Ejen Peruncit**  

### Mengikut Tahap Kesukaran  
- **Pemula**: [Python Flask API (Tempatan)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Pertengahan**: **[Azure OpenAI Chat (Tempatan)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservis, Apl Chat Azure OpenAI, Pemprosesan Dokumen AI  
- **Lanjutan**: Laluan ML  
- **Sedia Pengeluaran Perusahaan**: [Mikroservis (Tempatan)](../../../examples/container-app/microservices) (Pelbagai perkhidmatan dengan penjujukan mesej), **Penyelesaian Multi-Ejen Peruncit** (Sistem multi-ejen lengkap dengan templat ARM)  

## 📚 Sumber Tambahan

### Pautan Dokumentasi  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Contoh Komuniti  
- [Templat AZD Sampel Azure](https://github.com/Azure-Samples/azd-templates)  
- [Templat Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Galeri Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Apl Todo dengan C# dan Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Apl Todo dengan Python dan MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikasi Todo dengan Node.js dan PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Aplikasi Web React dengan API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Pekerjaan Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions dengan Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Amalan Terbaik
- [Rangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Rangka Kerja Pengambilan Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Menyumbang Contoh

Ada contoh berguna untuk dikongsi? Kami mengalu-alukan sumbangan!

### Garis Panduan Penyerahan
1. Ikuti struktur direktori yang telah ditetapkan
2. Sertakan README.md yang komprehensif
3. Tambah ulasan pada fail konfigurasi
4. Uji dengan teliti sebelum menyerah
5. Sertakan anggaran kos dan prasyarat

### Struktur Templet Contoh
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

**Pro Tip**: Mulakan dengan contoh yang paling mudah yang sesuai dengan rangka teknologi anda, kemudian secara berperingkat naik ke senario yang lebih kompleks. Setiap contoh dibina berdasarkan konsep dari contoh sebelumnya!

## 🚀 Sedia untuk Bermula?

### Laluan Pembelajaran Anda

1. **Pemula Lengkap?** → Mula dengan [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minit)
2. **Ada Pengetahuan AZD Asas?** → Cuba [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minit)
3. **Membangun Aplikasi AI?** → Mula dengan [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minit) atau terokai [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, lebih 2 jam)
4. **Perlu Rangka Teknologi Spesifik?** → Gunakan bahagian [Mencari Contoh Yang Sesuai](../../../examples) di atas

### Langkah Seterusnya

- ✅ Semak [Prasyarat](../../../examples) di atas
- ✅ Pilih contoh yang sesuai dengan tahap kemahiran anda (rujuk [Legenda Tahap Kerumitan](../../../examples))
- ✅ Baca README contoh dengan teliti sebelum menterjemah
- ✅ Tetapkan peringatan untuk jalankan `azd down` selepas ujian
- ✅ Kongsikan pengalaman anda melalui Isu GitHub atau Perbincangan

### Perlu Bantuan?

- 📖 [FAQ](../resources/faq.md) - Soalan lazim dijawab
- 🐛 [Panduan Penyelesaian Masalah](../docs/chapter-07-troubleshooting/common-issues.md) - Betulkan isu penyebaran
- 💬 [Perbincangan GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Tanya komuniti
- 📚 [Panduan Pembelajaran](../resources/study-guide.md) - Kukuhkan pembelajaran anda

---

**Navigasi**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Bahan Pembelajaran**: [Panduan Pembelajaran](../resources/study-guide.md) | [Lembaran Cepat](../resources/cheat-sheet.md) | [Glosari](../resources/glossary.md)
- **🔧 Sumber**: [FAQ](../resources/faq.md) | [Penyelesaian Masalah](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Terakhir Dikemaskini: November 2025 | [Melaporkan Isu](https://github.com/microsoft/AZD-for-beginners/issues) | [Sumbang Contoh](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sah. Untuk maklumat penting, terjemahan oleh penterjemah manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->