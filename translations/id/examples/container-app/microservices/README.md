# Arsitektur Microservices - Contoh Container App

⏱️ **Perkiraan Waktu**: 25-35 menit | 💰 **Perkiraan Biaya**: ~$50-100/bulan | ⭐ **Kompleksitas**: Lanjutan

Sebuah arsitektur microservices yang **sederhana tetapi fungsional** yang dideploy ke Azure Container Apps menggunakan AZD CLI. Contoh ini memperagakan komunikasi antar layanan, orkestrasi container, dan pemantauan dengan setup praktis 2-layanan.

> **📚 Pendekatan Pembelajaran**: Contoh ini dimulai dengan arsitektur 2-layanan minimal (API Gateway + Backend Service) yang benar-benar dapat Anda deploy dan pelajari. Setelah menguasai dasar ini, kami memberikan panduan untuk memperluas ke ekosistem microservices yang lengkap.

## Apa yang Akan Anda Pelajari

Dengan menyelesaikan contoh ini, Anda akan:
- Mendeploy beberapa container ke Azure Container Apps
- Mengimplementasikan komunikasi antar layanan dengan jaringan internal
- Mengonfigurasi skala berbasis lingkungan dan pemeriksaan kesehatan
- Memantau aplikasi terdistribusi dengan Application Insights
- Memahami pola deployment microservices dan praktik terbaik
- Mempelajari ekspansi progresif dari arsitektur sederhana ke kompleks

## Arsitektur

### Fase 1: Apa yang Kita Bangun (Termasuk dalam Contoh Ini)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Mengapa Mulai Sederhana?**
- ✅ Deploy dan pahami dengan cepat (25-35 menit)
- ✅ Pelajari pola inti microservices tanpa kompleksitas
- ✅ Kode yang berfungsi yang dapat Anda modifikasi dan eksperimen
- ✅ Biaya lebih rendah untuk pembelajaran (~$50-100/bulan vs $300-1400/bulan)
- ✅ Bangun kepercayaan diri sebelum menambahkan database dan antrean pesan

**Analogi**: Anggap ini seperti belajar mengemudi. Anda mulai dengan tempat parkir kosong (2 layanan), menguasai dasar, lalu berlanjut ke lalu lintas kota (5+ layanan dengan database).

### Fase 2: Ekspansi di Masa Depan (Arsitektur Referensi)

Sekali Anda menguasai arsitektur 2-layanan, Anda dapat memperluas ke:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Lihat bagian "Expansion Guide" di bagian akhir untuk instruksi langkah-demi-langkah.

## Fitur yang Disertakan

✅ **Penemuan Layanan**: Penemuan berbasis DNS otomatis antar container  
✅ **Load Balancing**: Load balancing bawaan di antara replika  
✅ **Auto-scaling**: Skala independen per layanan berdasarkan permintaan HTTP  
✅ **Pemantauan Kesehatan**: Liveness dan readiness probes untuk kedua layanan  
✅ **Logging Terdistribusi**: Logging terpusat dengan Application Insights  
✅ **Jaringan Internal**: Komunikasi layanan-ke-layanan yang aman  
✅ **Orkestrasi Container**: Deploy dan skala otomatis  
✅ **Pembaruan Tanpa Downtime**: Rolling updates dengan manajemen revisi  

## Prasyarat

### Alat yang Diperlukan

Sebelum memulai, pastikan Anda telah menginstal alat-alat ini:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versi 1.0.0 atau lebih tinggi)
   ```bash
   azd version
   # Keluaran yang diharapkan: azd versi 1.0.0 atau lebih tinggi
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versi 2.50.0 atau lebih tinggi)
   ```bash
   az --version
   # Keluaran yang diharapkan: azure-cli 2.50.0 atau lebih tinggi
   ```

3. **[Docker](https://www.docker.com/get-started)** (untuk pengembangan/pengujian lokal - opsional)
   ```bash
   docker --version
   # Keluaran yang diharapkan: Docker versi 20.10 atau lebih tinggi
   ```

### Persyaratan Azure

- Langganan **Azure** yang aktif ([create a free account](https://azure.microsoft.com/free/)
- Izin untuk membuat sumber daya di langganan Anda
- Peran **Contributor** pada subscription atau resource group

### Prasyarat Pengetahuan

Ini adalah contoh tingkat **lanjutan**. Anda sebaiknya telah:
- Menyelesaikan [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Pemahaman dasar tentang arsitektur microservices
- Familiar dengan REST API dan HTTP
- Memahami konsep container

**Baru di Container Apps?** Mulai dengan [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) terlebih dahulu untuk mempelajari dasar-dasarnya.

## Mulai Cepat (Langkah-demi-Langkah)

### Langkah 1: Clone dan Masuk

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Pemeriksaan Sukses**: Verifikasi Anda melihat `azure.yaml`:
```bash
ls
# Diharapkan: README.md, azure.yaml, infra/, src/
```

### Langkah 2: Autentikasi dengan Azure

```bash
azd auth login
```

Ini akan membuka browser Anda untuk autentikasi Azure. Masuk dengan kredensial Azure Anda.

**✓ Pemeriksaan Sukses**: Anda seharusnya melihat:
```
Logged in to Azure.
```

### Langkah 3: Inisialisasi Environment

```bash
azd init
```

**Prompt yang akan Anda lihat**:
- **Environment name**: Masukkan nama singkat (mis. `microservices-dev`)
- **Azure subscription**: Pilih subscription Anda
- **Azure location**: Pilih region (mis. `eastus`, `westeurope`)

**✓ Pemeriksaan Sukses**: Anda seharusnya melihat:
```
SUCCESS: New project initialized!
```

### Langkah 4: Deploy Infrastruktur dan Layanan

```bash
azd up
```

**Apa yang terjadi** (memakan waktu 8-12 menit):
1. Membuat Container Apps environment
2. Membuat Application Insights untuk pemantauan
3. Membangun container API Gateway (Node.js)
4. Membangun container Product Service (Python)
5. Mendeploy kedua container ke Azure
6. Mengonfigurasi jaringan dan pemeriksaan kesehatan
7. Menyiapkan pemantauan dan logging

**✓ Pemeriksaan Sukses**: Anda seharusnya melihat:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Waktu**: 8-12 menit

### Langkah 5: Uji Deployment

```bash
# Dapatkan endpoint gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Uji kesehatan API Gateway
curl $GATEWAY_URL/health

# Keluaran yang diharapkan:
# {"status":"sehat","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Uji product service melalui gateway**:
```bash
# Daftar produk
curl $GATEWAY_URL/api/products

# Output yang diharapkan:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Pemeriksaan Sukses**: Kedua endpoint mengembalikan data JSON tanpa error.

---

**🎉 Selamat!** Anda telah mendeploy arsitektur microservices ke Azure!

## Struktur Proyek

Semua file implementasi disertakan—ini adalah contoh lengkap dan berfungsi:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Fungsi Setiap Komponen:**

**Infrastructure (infra/)**:
- `main.bicep`: Mengorkestrasi semua sumber daya Azure dan dependensinya
- `core/container-apps-environment.bicep`: Membuat Container Apps environment dan Azure Container Registry
- `core/monitor.bicep`: Menyiapkan Application Insights untuk logging terdistribusi
- `app/*.bicep`: Definisi container app individual dengan konfigurasi skala dan pemeriksaan kesehatan

**API Gateway (src/api-gateway/)**:
- Layanan yang menghadap publik yang merutekan permintaan ke layanan backend
- Mengimplementasikan logging, penanganan error, dan penerusan permintaan
- Memperagakan komunikasi HTTP layanan-ke-layanan

**Product Service (src/product-service/)**:
- Layanan internal dengan katalog produk (in-memory untuk kesederhanaan)
- REST API dengan pemeriksaan kesehatan
- Contoh pola microservice backend

## Ikhtisar Layanan

### API Gateway (Node.js/Express)

**Port**: 8080  
**Akses**: Publik (external ingress)  
**Tujuan**: Merutekan permintaan masuk ke layanan backend yang sesuai  

**Endpoints**:
- `GET /` - Informasi layanan
- `GET /health` - Endpoint pemeriksaan kesehatan
- `GET /api/products` - Meneruskan ke product service (daftar semua)
- `GET /api/products/:id` - Meneruskan ke product service (ambil berdasarkan ID)

**Fitur Utama**:
- Routing permintaan dengan axios
- Logging terpusat
- Penanganan error dan manajemen timeout
- Penemuan layanan melalui variabel lingkungan
- Integrasi Application Insights

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// Komunikasi layanan internal
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Akses**: Internal saja (tidak ada external ingress)  
**Tujuan**: Mengelola katalog produk dengan data in-memory  

**Endpoints**:
- `GET /` - Informasi layanan
- `GET /health` - Endpoint pemeriksaan kesehatan
- `GET /products` - Daftar semua produk
- `GET /products/<id>` - Ambil produk berdasarkan ID

**Fitur Utama**:
- RESTful API dengan Flask
- Penyimpanan produk in-memory (sederhana, tanpa database)
- Pemantauan kesehatan dengan probes
- Logging terstruktur
- Integrasi Application Insights

**Model Data**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Mengapa Hanya Internal?**
Product service tidak diekspos secara publik. Semua permintaan harus melewati API Gateway, yang menyediakan:
- Keamanan: Titik akses yang dikendalikan
- Fleksibilitas: Bisa mengubah backend tanpa memengaruhi klien
- Pemantauan: Logging permintaan terpusat

## Memahami Komunikasi Layanan

### Bagaimana Layanan Berkomunikasi Satu Sama Lain

Dalam contoh ini, API Gateway berkomunikasi dengan Product Service menggunakan **panggilan HTTP internal**:

```javascript
// Gerbang API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Buat permintaan HTTP internal
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Poin Penting**:

1. **Penemuan Berbasis DNS**: Container Apps secara otomatis menyediakan DNS untuk layanan internal
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Disederhanakan menjadi: `http://product-service` (Container Apps menyelesaikannya)

2. **Tidak Diekspos ke Publik**: Product Service memiliki `external: false` di Bicep
   - Hanya dapat diakses dalam Container Apps environment
   - Tidak dapat dijangkau dari internet

3. **Variabel Lingkungan**: URL layanan disuntikkan saat deployment
   - Bicep meneruskan FQDN internal ke gateway
   - Tidak ada URL yang disematkan di kode aplikasi

**Analogi**: Anggap ini seperti ruang kantor. API Gateway adalah meja resepsionis (menghadap publik), dan Product Service adalah ruang kantor (hanya internal). Pengunjung harus melalui resepsionis untuk mencapai kantor mana pun.

## Opsi Deploy

### Deploy Penuh (Direkomendasikan)

```bash
# Menyebarkan infrastruktur dan kedua layanan
azd up
```

Ini mendeploy:
1. Container Apps environment
2. Application Insights
3. Container Registry
4. Container API Gateway
5. Container Product Service

**Waktu**: 8-12 menit

### Deploy Layanan Individual

```bash
# Sebarkan hanya satu layanan (setelah azd up awal)
azd deploy api-gateway

# Atau sebarkan layanan produk
azd deploy product-service
```

**Kasus Penggunaan**: Ketika Anda telah memperbarui kode di satu layanan dan ingin mendeploy hanya layanan itu.

### Perbarui Konfigurasi

```bash
# Ubah parameter penskalaan
azd env set GATEWAY_MAX_REPLICAS 30

# Gelar ulang dengan konfigurasi baru
azd up
```

## Konfigurasi

### Konfigurasi Skala

Kedua layanan dikonfigurasi dengan autoscaling berbasis HTTP di file Bicep mereka:

**API Gateway**:
- Min replicas: 2 (selalu minimal 2 untuk ketersediaan)
- Max replicas: 20
- Scale trigger: 50 concurrent requests per replica

**Product Service**:
- Min replicas: 1 (dapat diskalakan hingga nol jika diperlukan)
- Max replicas: 10
- Scale trigger: 100 concurrent requests per replica

**Sesuaikan Skala** (di `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Alokasi Sumber Daya

**API Gateway**:
- CPU: 1.0 vCPU
- Memory: 2 GiB
- Alasan: Menangani semua trafik eksternal

**Product Service**:
- CPU: 0.5 vCPU
- Memory: 1 GiB
- Alasan: Operasi in-memory yang ringan

### Pemeriksaan Kesehatan

Kedua layanan menyertakan liveness dan readiness probes:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Apa Artinya Ini**:
- **Liveness**: Jika pemeriksaan kesehatan gagal, Container Apps akan merestart container
- **Readiness**: Jika tidak siap, Container Apps berhenti merutekan trafik ke replika tersebut



## Pemantauan & Observabilitas

### Melihat Log Layanan

```bash
# Lihat log menggunakan azd monitor
azd monitor --logs

# Atau gunakan Azure CLI untuk Container Apps tertentu:
# Alirkan log dari API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Lihat log layanan produk terbaru
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Keluaran yang Diharapkan**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Query Application Insights

Akses Application Insights di Azure Portal, lalu jalankan query-query ini:

**Temukan Permintaan Lambat**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Lacak Panggilan Antar Layanan**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Tingkat Error per Layanan**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volume Permintaan Seiring Waktu**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Akses Dasbor Pemantauan

```bash
# Dapatkan detail Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Buka pemantauan Portal Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metrik Langsung

1. Buka Application Insights di Azure Portal
2. Klik "Live Metrics"
3. Lihat permintaan, kegagalan, dan performa secara real-time
4. Uji dengan menjalankan: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Latihan Praktis

[Catatan: Lihat latihan lengkap di atas dalam bagian "Practical Exercises" untuk latihan langkah-demi-langkah terperinci termasuk verifikasi deployment, modifikasi data, pengujian autoscaling, penanganan error, dan menambahkan layanan ketiga.]

## Analisis Biaya

### Perkiraan Biaya Bulanan (Untuk Contoh 2-Layanan Ini)

| Sumber Daya | Konfigurasi | Perkiraan Biaya |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**Rincian Biaya berdasarkan Penggunaan**:
- **Trafik ringan** (pengujian/pembelajaran): ~$60/bulan
- **Trafik sedang** (produksi kecil): ~$120/bulan
- **Trafik tinggi** (periode sibuk): ~$240/bulan

### Tips Optimasi Biaya

1. **Skala ke Nol untuk Pengembangan**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Gunakan Consumption Plan untuk Cosmos DB** (ketika Anda menambahkannya):
   - Bayar hanya untuk yang Anda gunakan
   - Tidak ada biaya minimum

3. **Atur Sampling di Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Ambil sampel 50% dari permintaan
   ```

4. **Bersihkan Saat Tidak Dibutuhkan**:
   ```bash
   azd down
   ```

### Opsi Tier Gratis
Untuk pembelajaran/pengetesan, pertimbangkan:
- Gunakan kredit gratis Azure (30 hari pertama)
- Pertahankan jumlah replika seminimal mungkin
- Hapus setelah pengujian (tidak ada biaya berkelanjutan)

---

## Pembersihan

Untuk menghindari biaya berkelanjutan, hapus semua sumber daya:

```bash
azd down --force --purge
```

**Permintaan Konfirmasi**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Ketik `y` untuk mengonfirmasi.

**Apa yang Dihapus**:
- Container Apps Environment
- Both Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verifikasi Pembersihan**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Seharusnya kosong.

---

## Panduan Perluasan: Dari 2 ke 5+ Layanan

Setelah Anda menguasai arsitektur 2-layanan ini, berikut cara mengembangkannya:

### Fase 1: Tambahkan Persistensi Database (Langkah Berikutnya)

**Tambahkan Cosmos DB untuk layanan produk**:

1. Buat `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Perbarui layanan produk untuk menggunakan Cosmos DB alih-alih menyimpan data di memori

3. Estimasi biaya tambahan: ~$25/bulan (serverless)

### Fase 2: Tambahkan Layanan Ketiga (Manajemen Pesanan)

**Buat Layanan Pesanan**:

1. Folder baru: `src/order-service/` (Python/Node.js/C#)
2. Bicep baru: `infra/app/order-service.bicep`
3. Perbarui API Gateway untuk merutekan `/api/orders`
4. Tambahkan Azure SQL Database untuk persistensi pesanan

**Arsitektur menjadi**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Tambahkan Komunikasi Asinkron (Service Bus)

**Implementasikan Arsitektur Berbasis Peristiwa**:

1. Tambahkan Azure Service Bus: `infra/core/servicebus.bicep`
2. Layanan produk menerbitkan event "ProductCreated"
3. Layanan pesanan berlangganan ke event produk
4. Tambahkan Layanan Notifikasi untuk memproses event

**Polanya**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Fase 4: Tambahkan Otentikasi Pengguna

**Implementasikan Layanan Pengguna**:

1. Buat `src/user-service/` (Go/Node.js)
2. Tambahkan Azure AD B2C atau otentikasi JWT kustom
3. API Gateway memvalidasi token
4. Layanan memeriksa izin pengguna

### Fase 5: Kesiapan Produksi

**Tambahkan Komponen Ini**:
- Azure Front Door (penyeimbangan beban global)
- Azure Key Vault (manajemen rahasia)
- Azure Monitor Workbooks (dasbor kustom)
- Pipeline CI/CD (GitHub Actions)
- Blue-Green Deployments
- Managed Identity untuk semua layanan

**Perkiraan Biaya Arsitektur Produksi Penuh**: ~$300-1,400/bulan

---

## Pelajari Lebih Lanjut

### Dokumentasi Terkait
- [Dokumentasi Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Panduan Arsitektur Mikroservis](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights untuk Pelacakan Terdistribusi](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Langkah Berikutnya dalam Kursus Ini
- ← Sebelumnya: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Contoh pemula single-container
- → Selanjutnya: [Panduan Integrasi AI](../../../../../examples/docs/ai-foundry) - Tambahkan kemampuan AI
- 🏠 [Beranda Kursus](../../README.md)

### Perbandingan: Kapan Menggunakan Apa

**Aplikasi Satu Kontainer** (contoh Simple Flask API):
- ✅ Aplikasi sederhana
- ✅ Arsitektur monolitik
- ✅ Cepat untuk dideploy
- ❌ Skalabilitas terbatas
- **Biaya**: ~$15-50/bulan

**Mikroservis** (Contoh ini):
- ✅ Aplikasi kompleks
- ✅ Skala independen per layanan
- ✅ Otonomi tim (layanan berbeda, tim berbeda)
- ❌ Lebih kompleks untuk dikelola
- **Biaya**: ~$60-250/bulan

**Kubernetes (AKS)**:
- ✅ Kontrol dan fleksibilitas maksimal
- ✅ Portabilitas multi-cloud
- ✅ Jaringan lanjutan
- ❌ Membutuhkan keahlian Kubernetes
- **Biaya**: ~$150-500/bulan minimal

**Rekomendasi**: Mulai dengan Container Apps (contoh ini), beralih ke AKS hanya jika Anda membutuhkan fitur khusus Kubernetes.

---

## Pertanyaan yang Sering Diajukan

**Q: Mengapa hanya 2 layanan alih-alih 5+?**  
A: Progresi pembelajaran. Kuasai dasar-dasar (komunikasi layanan, pemantauan, penskalaan) dengan contoh sederhana sebelum menambahkan kompleksitas. Pola yang Anda pelajari di sini berlaku untuk arsitektur berisi 100 layanan.

**Q: Bisakah saya menambahkan lebih banyak layanan sendiri?**  
A: Tentu! Ikuti panduan perluasan di atas. Setiap layanan baru mengikuti pola yang sama: buat folder src, buat file Bicep, perbarui azure.yaml, deploy.

**Q: Apakah ini siap produksi?**  
A: Ini adalah fondasi yang solid. Untuk produksi, tambahkan: managed identity, Key Vault, database persisten, pipeline CI/CD, alert pemantauan, dan strategi backup.

**Q: Mengapa tidak menggunakan Dapr atau service mesh lain?**  
A: Jaga supaya tetap sederhana untuk pembelajaran. Setelah Anda memahami jaringan Container Apps bawaan, Anda dapat menambahkan Dapr untuk skenario lanjutan.

**Q: Bagaimana cara saya melakukan debug secara lokal?**  
A: Jalankan layanan secara lokal dengan Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Bisakah saya menggunakan bahasa pemrograman yang berbeda?**  
A: Ya! Contoh ini menunjukkan Node.js (gateway) + Python (layanan produk). Anda bisa mencampur bahasa apa pun yang berjalan di dalam container.

**Q: Bagaimana jika saya tidak punya kredit Azure?**  
A: Gunakan Azure free tier (30 hari pertama untuk akun baru) atau deploy untuk periode pengujian singkat dan hapus segera.

---

> **🎓 Ringkasan Jalur Pembelajaran**: Anda telah belajar menerapkan arsitektur multi-layanan dengan penskalaan otomatis, jaringan internal, pemantauan terpusat, dan pola siap-produksi. Fondasi ini mempersiapkan Anda untuk sistem terdistribusi yang kompleks dan arsitektur mikroservis kelas perusahaan.

**📚 Navigasi Kursus:**
- ← Sebelumnya: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Selanjutnya: [Contoh Integrasi Database](../../../../../examples/database-app)
- 🏠 [Beranda Kursus](../../../README.md)
- 📖 [Praktik Terbaik Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Meskipun kami berusaha mencapai akurasi, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->