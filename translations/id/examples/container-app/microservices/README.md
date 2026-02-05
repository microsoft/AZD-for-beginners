# Arsitektur Microservices - Contoh Aplikasi Container

⏱️ **Estimasi Waktu**: 25-35 menit | 💰 **Estimasi Biaya**: ~$50-100/bulan | ⭐ **Kompleksitas**: Tingkat Lanjut

Arsitektur microservices yang **sederhana namun fungsional** diterapkan ke Azure Container Apps menggunakan AZD CLI. Contoh ini menunjukkan komunikasi antar layanan, orkestrasi container, dan pemantauan dengan pengaturan 2 layanan yang praktis.

> **📚 Pendekatan Pembelajaran**: Contoh ini dimulai dengan arsitektur minimal 2 layanan (API Gateway + Backend Service) yang dapat Anda terapkan dan pelajari. Setelah menguasai dasar ini, kami memberikan panduan untuk memperluas ke ekosistem microservices yang lebih lengkap.

## Apa yang Akan Anda Pelajari

Dengan menyelesaikan contoh ini, Anda akan:
- Menerapkan beberapa container ke Azure Container Apps
- Mengimplementasikan komunikasi antar layanan dengan jaringan internal
- Mengonfigurasi penskalaan berbasis lingkungan dan pemeriksaan kesehatan
- Memantau aplikasi terdistribusi dengan Application Insights
- Memahami pola penerapan microservices dan praktik terbaik
- Belajar memperluas secara progresif dari arsitektur sederhana ke kompleks

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

**Mengapa Memulai dengan Sederhana?**
- ✅ Cepat diterapkan dan dipahami (25-35 menit)
- ✅ Belajar pola microservices inti tanpa kompleksitas
- ✅ Kode yang berfungsi yang dapat Anda modifikasi dan eksperimen
- ✅ Biaya lebih rendah untuk pembelajaran (~$50-100/bulan vs $300-1400/bulan)
- ✅ Membangun kepercayaan diri sebelum menambahkan database dan antrean pesan

**Analogi**: Anggap ini seperti belajar mengemudi. Anda mulai di tempat parkir kosong (2 layanan), menguasai dasar-dasarnya, lalu maju ke lalu lintas kota (5+ layanan dengan database).

### Fase 2: Perluasan di Masa Depan (Arsitektur Referensi)

Setelah Anda menguasai arsitektur 2 layanan, Anda dapat memperluas ke:

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

Lihat bagian "Panduan Perluasan" di akhir untuk instruksi langkah demi langkah.

## Fitur yang Termasuk

✅ **Penemuan Layanan**: Penemuan otomatis berbasis DNS antar container  
✅ **Load Balancing**: Load balancing bawaan di antara replika  
✅ **Auto-scaling**: Penskalaan independen per layanan berdasarkan permintaan HTTP  
✅ **Pemantauan Kesehatan**: Pemeriksaan liveness dan readiness untuk kedua layanan  
✅ **Logging Terdistribusi**: Logging terpusat dengan Application Insights  
✅ **Jaringan Internal**: Komunikasi antar layanan yang aman  
✅ **Orkestrasi Container**: Penerapan dan penskalaan otomatis  
✅ **Pembaruan Tanpa Downtime**: Pembaruan bergulir dengan manajemen revisi  

## Prasyarat

### Alat yang Dibutuhkan

Sebelum memulai, pastikan Anda memiliki alat-alat berikut yang terinstal:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versi 1.0.0 atau lebih tinggi)
   ```bash
   azd version
   # Output yang diharapkan: azd versi 1.0.0 atau lebih tinggi
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versi 2.50.0 atau lebih tinggi)
   ```bash
   az --version
   # Output yang diharapkan: azure-cli 2.50.0 atau lebih tinggi
   ```

3. **[Docker](https://www.docker.com/get-started)** (untuk pengembangan/pengujian lokal - opsional)
   ```bash
   docker --version
   # Output yang diharapkan: Versi Docker 20.10 atau lebih tinggi
   ```

### Persyaratan Azure

- **Langganan Azure** yang aktif ([buat akun gratis](https://azure.microsoft.com/free/))
- Izin untuk membuat sumber daya di langganan Anda
- Peran **Contributor** pada langganan atau grup sumber daya

### Pengetahuan yang Dibutuhkan

Ini adalah contoh tingkat lanjut. Anda sebaiknya:
- Menyelesaikan [Contoh API Flask Sederhana](../../../../../examples/container-app/simple-flask-api) 
- Memahami dasar-dasar arsitektur microservices
- Familiar dengan REST API dan HTTP
- Memahami konsep container

**Baru mengenal Container Apps?** Mulailah dengan [Contoh API Flask Sederhana](../../../../../examples/container-app/simple-flask-api) terlebih dahulu untuk mempelajari dasar-dasarnya.

## Langkah Cepat (Step-by-Step)

### Langkah 1: Clone dan Navigasi

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Pemeriksaan Keberhasilan**: Pastikan Anda melihat `azure.yaml`:
```bash
ls
# Diharapkan: README.md, azure.yaml, infra/, src/
```

### Langkah 2: Autentikasi dengan Azure

```bash
azd auth login
```

Ini akan membuka browser Anda untuk autentikasi Azure. Masuk dengan kredensial Azure Anda.

**✓ Pemeriksaan Keberhasilan**: Anda seharusnya melihat:
```
Logged in to Azure.
```

### Langkah 3: Inisialisasi Lingkungan

```bash
azd init
```

**Prompt yang akan Anda lihat**:
- **Nama lingkungan**: Masukkan nama pendek (misalnya, `microservices-dev`)
- **Langganan Azure**: Pilih langganan Anda
- **Lokasi Azure**: Pilih wilayah (misalnya, `eastus`, `westeurope`)

**✓ Pemeriksaan Keberhasilan**: Anda seharusnya melihat:
```
SUCCESS: New project initialized!
```

### Langkah 4: Terapkan Infrastruktur dan Layanan

```bash
azd up
```

**Apa yang terjadi** (memakan waktu 8-12 menit):
1. Membuat lingkungan Container Apps
2. Membuat Application Insights untuk pemantauan
3. Membangun container API Gateway (Node.js)
4. Membangun container Product Service (Python)
5. Menerapkan kedua container ke Azure
6. Mengonfigurasi jaringan dan pemeriksaan kesehatan
7. Menyiapkan pemantauan dan logging

**✓ Pemeriksaan Keberhasilan**: Anda seharusnya melihat:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Waktu**: 8-12 menit

### Langkah 5: Uji Penerapan

```bash
# Dapatkan endpoint gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Uji kesehatan API Gateway
curl $GATEWAY_URL/health

# Output yang diharapkan:
# {"status":"sehat","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Uji layanan produk melalui gateway**:
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

**✓ Pemeriksaan Keberhasilan**: Kedua endpoint mengembalikan data JSON tanpa error.

---

**🎉 Selamat!** Anda telah menerapkan arsitektur microservices ke Azure!

## Struktur Proyek

Semua file implementasi disertakan—ini adalah contoh lengkap yang berfungsi:

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

**Apa yang Dilakukan Setiap Komponen:**

**Infrastruktur (infra/)**:
- `main.bicep`: Mengorkestrasi semua sumber daya Azure dan dependensinya
- `core/container-apps-environment.bicep`: Membuat lingkungan Container Apps dan Azure Container Registry
- `core/monitor.bicep`: Menyiapkan Application Insights untuk logging terdistribusi
- `app/*.bicep`: Definisi aplikasi container individu dengan penskalaan dan pemeriksaan kesehatan

**API Gateway (src/api-gateway/)**:
- Layanan yang menghadap publik yang merutekan permintaan ke layanan backend
- Mengimplementasikan logging, penanganan error, dan penerusan permintaan
- Menunjukkan komunikasi HTTP antar layanan

**Product Service (src/product-service/)**:
- Layanan internal dengan katalog produk (in-memory untuk kesederhanaan)
- REST API dengan pemeriksaan kesehatan
- Contoh pola microservice backend

## Ikhtisar Layanan

### API Gateway (Node.js/Express)

**Port**: 8080  
**Akses**: Publik (ingress eksternal)  
**Tujuan**: Merutekan permintaan masuk ke layanan backend yang sesuai  

**Endpoint**:
- `GET /` - Informasi layanan
- `GET /health` - Endpoint pemeriksaan kesehatan
- `GET /api/products` - Diteruskan ke layanan produk (daftar semua)
- `GET /api/products/:id` - Diteruskan ke layanan produk (dapatkan berdasarkan ID)

**Fitur Utama**:
- Routing permintaan dengan axios
- Logging terpusat
- Penanganan error dan manajemen timeout
- Penemuan layanan melalui variabel lingkungan
- Integrasi Application Insights

**Sorotan Kode** (`src/api-gateway/app.js`):
```javascript
// Komunikasi layanan internal
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Akses**: Internal saja (tidak ada ingress eksternal)  
**Tujuan**: Mengelola katalog produk dengan data in-memory  

**Endpoint**:
- `GET /` - Informasi layanan
- `GET /health` - Endpoint pemeriksaan kesehatan
- `GET /products` - Daftar semua produk
- `GET /products/<id>` - Dapatkan produk berdasarkan ID

**Fitur Utama**:
- API RESTful dengan Flask
- Penyimpanan produk in-memory (sederhana, tanpa database)
- Pemantauan kesehatan dengan probe
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
Layanan produk tidak diekspos secara publik. Semua permintaan harus melalui API Gateway, yang menyediakan:
- Keamanan: Titik akses yang terkontrol
- Fleksibilitas: Dapat mengubah backend tanpa memengaruhi klien
- Pemantauan: Logging permintaan terpusat

## Memahami Komunikasi Layanan

### Bagaimana Layanan Berkomunikasi Satu Sama Lain

Dalam contoh ini, API Gateway berkomunikasi dengan Product Service menggunakan **panggilan HTTP internal**:

```javascript
// Gerbang API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Membuat permintaan HTTP internal
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Poin Penting**:

1. **Penemuan Berbasis DNS**: Container Apps secara otomatis menyediakan DNS untuk layanan internal
   - FQDN Layanan Produk: `product-service.internal.<environment>.azurecontainerapps.io`
   - Disederhanakan sebagai: `http://product-service` (Container Apps menyelesaikannya)

2. **Tidak Ada Eksposur Publik**: Layanan Produk memiliki `external: false` di Bicep
   - Hanya dapat diakses dalam lingkungan Container Apps
   - Tidak dapat dijangkau dari internet

3. **Variabel Lingkungan**: URL layanan disuntikkan saat penerapan
   - Bicep meneruskan FQDN internal ke gateway
   - Tidak ada URL yang di-hardcode dalam kode aplikasi

**Analogi**: Anggap ini seperti ruangan kantor. API Gateway adalah meja resepsionis (menghadap publik), dan Product Service adalah ruangan kantor (hanya internal). Pengunjung harus melalui resepsionis untuk mencapai ruangan mana pun.

## Opsi Penerapan

### Penerapan Lengkap (Direkomendasikan)

```bash
# Menerapkan infrastruktur dan kedua layanan
azd up
```

Ini menerapkan:
1. Lingkungan Container Apps
2. Application Insights
3. Container Registry
4. Container API Gateway
5. Container Product Service

**Waktu**: 8-12 menit

### Terapkan Layanan Individu

```bash
# Sebarkan hanya satu layanan (setelah azd up awal)
azd deploy api-gateway

# Atau sebarkan layanan produk
azd deploy product-service
```

**Kasus Penggunaan**: Ketika Anda telah memperbarui kode dalam satu layanan dan ingin menerapkan ulang hanya layanan tersebut.

### Perbarui Konfigurasi

```bash
# Ubah parameter penskalaan
azd env set GATEWAY_MAX_REPLICAS 30

# Terapkan ulang dengan konfigurasi baru
azd up
```

## Konfigurasi

### Konfigurasi Penskalaan

Kedua layanan dikonfigurasi dengan penskalaan otomatis berbasis HTTP dalam file Bicep mereka:

**API Gateway**:
- Replika minimum: 2 (selalu setidaknya 2 untuk ketersediaan)
- Replika maksimum: 20
- Pemicu penskalaan: 50 permintaan bersamaan per replika

**Product Service**:
- Replika minimum: 1 (dapat diskalakan ke nol jika diperlukan)
- Replika maksimum: 10
- Pemicu penskalaan: 100 permintaan bersamaan per replika

**Sesuaikan Penskalaan** (di `infra/app/*.bicep`):
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
- Memori: 2 GiB
- Alasan: Menangani semua lalu lintas eksternal

**Product Service**:
- CPU: 0.5 vCPU
- Memori: 1 GiB
- Alasan: Operasi in-memory yang ringan

### Pemeriksaan Kesehatan

Kedua layanan menyertakan liveness dan readiness probe:

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
- **Liveness**: Jika pemeriksaan kesehatan gagal, Container Apps akan memulai ulang container
- **Readiness**: Jika tidak siap, Container Apps akan berhenti merutekan lalu lintas ke replika tersebut

## Pemantauan & Observabilitas

### Lihat Log Layanan

```bash
# Alirkan log dari API Gateway
azd logs api-gateway --follow

# Lihat log layanan produk terbaru
azd logs product-service --tail 100

# Lihat semua log dari kedua layanan
azd logs --follow
```

**Output yang Diharapkan**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Query Application Insights

Akses Application Insights di Azure Portal, lalu jalankan query berikut:

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

**Tingkat Error Berdasarkan Layanan**:
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

### Akses Dashboard Pemantauan

```bash
# Dapatkan detail Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Buka pemantauan Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metrik Langsung

1. Navigasikan ke Application Insights di Azure Portal
2. Klik "Live Metrics"
3. Lihat permintaan, kegagalan, dan kinerja secara real-time
4. Uji dengan menjalankan: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Latihan Praktis

[Catatan: Lihat latihan lengkap di bagian "Latihan Praktis" di atas untuk latihan langkah demi langkah termasuk verifikasi penerapan, modifikasi data, pengujian penskalaan otomatis, penanganan error, dan penambahan layanan ketiga.]

## Analisis Biaya

### Estimasi Biaya Bulanan (Untuk Contoh 2 Layanan Ini)

| Sumber Daya | Konfigurasi | Estimasi Biaya |
|-------------|-------------|----------------|
| API Gateway | 2-20 replika, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replika, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Tier dasar | $5 |
| Application Insights | 1-2 GB/bulan | $5-10 |
| Log Analytics | 1 GB/bulan | $3 |
| **Total** | | **$58-243/bulan** |

**Rincian Biaya Berdasarkan Penggunaan**:
- **Lalu lintas ringan** (pengujian/pembelajaran): ~$60/bulan
- **Lalu lintas sedang** (produksi kecil): ~$120/bulan
- **Lalu lintas tinggi** (periode sibuk): ~$240/bulan

### Tips Optimasi Biaya

1. **Skalakan ke Nol untuk Pengembangan**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Gunakan Consumption Plan untuk Cosmos DB** (saat Anda menambahkannya):
   - Bayar hanya untuk apa yang Anda gunakan
   - Tidak ada biaya minimum

3. **Atur Sampling Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Sampel 50% dari permintaan
   ```

4. **Bersihkan Saat Tidak Dibutuhkan**:
   ```bash
   azd down
   ```

### Opsi Tier Gratis
Untuk pembelajaran/percobaan, pertimbangkan:
- Gunakan kredit gratis Azure (30 hari pertama)
- Gunakan replika seminimal mungkin
- Hapus setelah pengujian (tidak ada biaya berkelanjutan)

---

## Pembersihan

Untuk menghindari biaya berkelanjutan, hapus semua sumber daya:

```bash
azd down --force --purge
```

**Prompt Konfirmasi**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Ketik `y` untuk mengonfirmasi.

**Apa yang Dihapus**:
- Container Apps Environment
- Kedua Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verifikasi Pembersihan**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Harus mengembalikan kosong.

---

## Panduan Ekspansi: Dari 2 ke 5+ Layanan

Setelah Anda menguasai arsitektur 2 layanan ini, berikut cara memperluasnya:

### Fase 1: Tambahkan Persistensi Database (Langkah Berikutnya)

**Tambahkan Cosmos DB untuk Product Service**:

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

2. Perbarui product service untuk menggunakan Cosmos DB alih-alih data in-memory

3. Perkiraan biaya tambahan: ~$25/bulan (serverless)

### Fase 2: Tambahkan Layanan Ketiga (Order Management)

**Buat Order Service**:

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

**Implementasikan Arsitektur Berbasis Event**:

1. Tambahkan Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service mempublikasikan event "ProductCreated"
3. Order Service berlangganan event produk
4. Tambahkan Notification Service untuk memproses event

**Pola**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Fase 4: Tambahkan Autentikasi Pengguna

**Implementasikan User Service**:

1. Buat `src/user-service/` (Go/Node.js)
2. Tambahkan Azure AD B2C atau autentikasi JWT kustom
3. API Gateway memvalidasi token
4. Layanan memeriksa izin pengguna

### Fase 5: Kesiapan Produksi

**Tambahkan Komponen Ini**:
- Azure Front Door (load balancing global)
- Azure Key Vault (manajemen rahasia)
- Azure Monitor Workbooks (dashboard kustom)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity untuk semua layanan

**Biaya Arsitektur Produksi Penuh**: ~$300-1,400/bulan

---

## Pelajari Lebih Lanjut

### Dokumentasi Terkait
- [Dokumentasi Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Panduan Arsitektur Microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights untuk Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Langkah Berikutnya dalam Kursus Ini
- ← Sebelumnya: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Contoh aplikasi satu kontainer untuk pemula
- → Berikutnya: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Tambahkan kemampuan AI
- 🏠 [Beranda Kursus](../../README.md)

### Perbandingan: Kapan Menggunakan Apa

**Single Container App** (Contoh Simple Flask API):
- ✅ Aplikasi sederhana
- ✅ Arsitektur monolitik
- ✅ Cepat untuk diterapkan
- ❌ Skalabilitas terbatas
- **Biaya**: ~$15-50/bulan

**Microservices** (Contoh ini):
- ✅ Aplikasi kompleks
- ✅ Skalabilitas independen per layanan
- ✅ Otonomi tim (layanan berbeda, tim berbeda)
- ❌ Lebih kompleks untuk dikelola
- **Biaya**: ~$60-250/bulan

**Kubernetes (AKS)**:
- ✅ Kontrol dan fleksibilitas maksimum
- ✅ Portabilitas multi-cloud
- ✅ Jaringan tingkat lanjut
- ❌ Membutuhkan keahlian Kubernetes
- **Biaya**: ~$150-500/bulan minimum

**Rekomendasi**: Mulailah dengan Container Apps (contoh ini), pindah ke AKS hanya jika Anda membutuhkan fitur spesifik Kubernetes.

---

## Pertanyaan yang Sering Diajukan

**T: Mengapa hanya 2 layanan, bukan 5+?**  
J: Untuk pembelajaran bertahap. Kuasai dasar-dasar (komunikasi layanan, pemantauan, skalabilitas) dengan contoh sederhana sebelum menambah kompleksitas. Pola yang Anda pelajari di sini berlaku untuk arsitektur dengan 100 layanan.

**T: Bisakah saya menambahkan lebih banyak layanan sendiri?**  
J: Tentu saja! Ikuti panduan ekspansi di atas. Setiap layanan baru mengikuti pola yang sama: buat folder src, buat file Bicep, perbarui azure.yaml, terapkan.

**T: Apakah ini siap produksi?**  
J: Ini adalah fondasi yang solid. Untuk produksi, tambahkan: managed identity, Key Vault, database persisten, pipeline CI/CD, peringatan pemantauan, dan strategi pencadangan.

**T: Mengapa tidak menggunakan Dapr atau service mesh lainnya?**  
J: Tetap sederhana untuk pembelajaran. Setelah Anda memahami jaringan native Container Apps, Anda dapat menambahkan Dapr untuk skenario lanjutan.

**T: Bagaimana cara debug secara lokal?**  
J: Jalankan layanan secara lokal dengan Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**T: Bisakah saya menggunakan bahasa pemrograman yang berbeda?**  
J: Ya! Contoh ini menunjukkan Node.js (gateway) + Python (product service). Anda dapat mencampur bahasa apa pun yang berjalan di dalam kontainer.

**T: Bagaimana jika saya tidak memiliki kredit Azure?**  
J: Gunakan tier gratis Azure (30 hari pertama dengan akun baru) atau terapkan untuk periode pengujian singkat dan hapus segera.

---

> **🎓 Ringkasan Jalur Pembelajaran**: Anda telah belajar menerapkan arsitektur multi-layanan dengan skalabilitas otomatis, jaringan internal, pemantauan terpusat, dan pola siap produksi. Fondasi ini mempersiapkan Anda untuk sistem terdistribusi yang kompleks dan arsitektur microservices tingkat perusahaan.

**📚 Navigasi Kursus:**
- ← Sebelumnya: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Berikutnya: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Beranda Kursus](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa terjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang salah yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->