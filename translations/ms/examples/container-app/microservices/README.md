<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-22T10:38:32+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "ms"
}
-->
# Seni Bina Mikroservis - Contoh Aplikasi Kontena

⏱️ **Anggaran Masa**: 25-35 minit | 💰 **Anggaran Kos**: ~$50-100/bulan | ⭐ **Kerumitan**: Lanjutan

Satu **seni bina mikroservis yang ringkas tetapi berfungsi** yang dikerahkan ke Azure Container Apps menggunakan AZD CLI. Contoh ini menunjukkan komunikasi antara perkhidmatan, orkestrasi kontena, dan pemantauan dengan tetapan 2 perkhidmatan yang praktikal.

> **📚 Pendekatan Pembelajaran**: Contoh ini bermula dengan seni bina 2 perkhidmatan yang minimum (API Gateway + Backend Service) yang boleh anda kerahkan dan pelajari. Selepas menguasai asas ini, kami menyediakan panduan untuk mengembangkan kepada ekosistem mikroservis penuh.

## Apa yang Anda Akan Pelajari

Dengan melengkapkan contoh ini, anda akan:
- Mengerahkan pelbagai kontena ke Azure Container Apps
- Melaksanakan komunikasi antara perkhidmatan dengan rangkaian dalaman
- Mengkonfigurasi penskalaan berdasarkan persekitaran dan pemeriksaan kesihatan
- Memantau aplikasi teragih dengan Application Insights
- Memahami corak dan amalan terbaik pengkerahan mikroservis
- Belajar pengembangan progresif daripada seni bina mudah kepada kompleks

## Seni Bina

### Fasa 1: Apa yang Kita Bina (Termasuk dalam Contoh Ini)

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

**Kenapa Bermula dengan Mudah?**
- ✅ Kerahkan dan fahami dengan cepat (25-35 minit)
- ✅ Pelajari corak mikroservis teras tanpa kerumitan
- ✅ Kod yang berfungsi yang boleh anda ubah dan uji
- ✅ Kos pembelajaran lebih rendah (~$50-100/bulan berbanding $300-1400/bulan)
- ✅ Tingkatkan keyakinan sebelum menambah pangkalan data dan antrian mesej

**Analogi**: Anggap ini seperti belajar memandu. Anda bermula di tempat letak kereta kosong (2 perkhidmatan), kuasai asas, kemudian maju ke lalu lintas bandar (5+ perkhidmatan dengan pangkalan data).

### Fasa 2: Pengembangan Masa Depan (Rujukan Seni Bina)

Setelah anda menguasai seni bina 2 perkhidmatan, anda boleh mengembangkannya kepada:

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

Lihat bahagian "Panduan Pengembangan" di akhir untuk arahan langkah demi langkah.

## Ciri-Ciri Termasuk

✅ **Penemuan Perkhidmatan**: Penemuan automatik berdasarkan DNS antara kontena  
✅ **Pengimbangan Beban**: Pengimbangan beban terbina dalam antara replika  
✅ **Auto-scaling**: Penskalaan bebas bagi setiap perkhidmatan berdasarkan permintaan HTTP  
✅ **Pemantauan Kesihatan**: Pemeriksaan liveness dan readiness untuk kedua-dua perkhidmatan  
✅ **Log Teragih**: Log terpusat dengan Application Insights  
✅ **Rangkaian Dalaman**: Komunikasi perkhidmatan-ke-perkhidmatan yang selamat  
✅ **Orkestrasi Kontena**: Pengkerahan dan penskalaan automatik  
✅ **Kemas Kini Tanpa Henti**: Kemas kini bergulir dengan pengurusan semakan  

## Prasyarat

### Alat Diperlukan

Sebelum bermula, pastikan anda telah memasang alat-alat ini:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versi 1.0.0 atau lebih tinggi)
   ```bash
   azd version
   # Output yang dijangka: azd versi 1.0.0 atau lebih tinggi
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versi 2.50.0 atau lebih tinggi)
   ```bash
   az --version
   # Output yang dijangka: azure-cli 2.50.0 atau lebih tinggi
   ```

3. **[Docker](https://www.docker.com/get-started)** (untuk pembangunan/pengujian tempatan - pilihan)
   ```bash
   docker --version
   # Output yang dijangka: Versi Docker 20.10 atau lebih tinggi
   ```

### Keperluan Azure

- Langganan **Azure** yang aktif ([buat akaun percuma](https://azure.microsoft.com/free/))
- Kebenaran untuk mencipta sumber dalam langganan anda
- Peranan **Contributor** pada langganan atau kumpulan sumber

### Prasyarat Pengetahuan

Ini adalah contoh pada **tahap lanjutan**. Anda seharusnya:
- Telah melengkapkan [Contoh API Flask Mudah](../../../../../examples/container-app/simple-flask-api) 
- Memahami asas seni bina mikroservis
- Biasa dengan REST API dan HTTP
- Memahami konsep kontena

**Baru dengan Container Apps?** Mulakan dengan [Contoh API Flask Mudah](../../../../../examples/container-app/simple-flask-api) terlebih dahulu untuk mempelajari asas.

## Permulaan Pantas (Langkah demi Langkah)

### Langkah 1: Klon dan Navigasi

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Semakan Berjaya**: Pastikan anda melihat `azure.yaml`:
```bash
ls
# Dijangka: README.md, azure.yaml, infra/, src/
```

### Langkah 2: Sahkan dengan Azure

```bash
azd auth login
```

Ini akan membuka pelayar anda untuk pengesahan Azure. Log masuk dengan kelayakan Azure anda.

**✓ Semakan Berjaya**: Anda sepatutnya melihat:
```
Logged in to Azure.
```

### Langkah 3: Inisialisasi Persekitaran

```bash
azd init
```

**Arahan yang akan anda lihat**:
- **Nama persekitaran**: Masukkan nama pendek (contoh: `microservices-dev`)
- **Langganan Azure**: Pilih langganan anda
- **Lokasi Azure**: Pilih kawasan (contoh: `eastus`, `westeurope`)

**✓ Semakan Berjaya**: Anda sepatutnya melihat:
```
SUCCESS: New project initialized!
```

### Langkah 4: Kerahkan Infrastruktur dan Perkhidmatan

```bash
azd up
```

**Apa yang berlaku** (mengambil masa 8-12 minit):
1. Mencipta persekitaran Container Apps
2. Mencipta Application Insights untuk pemantauan
3. Membina kontena API Gateway (Node.js)
4. Membina kontena Product Service (Python)
5. Mengerahkan kedua-dua kontena ke Azure
6. Mengkonfigurasi rangkaian dan pemeriksaan kesihatan
7. Menyediakan pemantauan dan log

**✓ Semakan Berjaya**: Anda sepatutnya melihat:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Masa**: 8-12 minit

### Langkah 5: Uji Pengkerahan

```bash
# Dapatkan titik akhir gerbang
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Uji kesihatan API Gateway
curl $GATEWAY_URL/health

# Output yang dijangka:
# {"status":"sihat","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Uji perkhidmatan produk melalui gateway**:
```bash
# Senaraikan produk
curl $GATEWAY_URL/api/products

# Output yang dijangka:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Tetikus","price":29.99,"stock":200},
#   {"id":3,"name":"Papan Kekunci","price":79.99,"stock":150}
# ]
```

**✓ Semakan Berjaya**: Kedua-dua titik akhir mengembalikan data JSON tanpa ralat.

---

**🎉 Tahniah!** Anda telah berjaya mengerahkan seni bina mikroservis ke Azure!

## Struktur Projek

Semua fail pelaksanaan disertakan—ini adalah contoh lengkap dan berfungsi:

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

**Apa Fungsi Setiap Komponen:**

**Infrastruktur (infra/)**:
- `main.bicep`: Mengatur semua sumber Azure dan kebergantungan mereka
- `core/container-apps-environment.bicep`: Mencipta persekitaran Container Apps dan Azure Container Registry
- `core/monitor.bicep`: Menyediakan Application Insights untuk log teragih
- `app/*.bicep`: Definisi aplikasi kontena individu dengan penskalaan dan pemeriksaan kesihatan

**API Gateway (src/api-gateway/)**:
- Perkhidmatan yang menghadap awam yang mengarahkan permintaan ke perkhidmatan backend
- Melaksanakan log, pengendalian ralat, dan pemajuan permintaan
- Menunjukkan komunikasi HTTP perkhidmatan-ke-perkhidmatan

**Product Service (src/product-service/)**:
- Perkhidmatan dalaman dengan katalog produk (dalam memori untuk kesederhanaan)
- REST API dengan pemeriksaan kesihatan
- Contoh corak mikroservis backend

## Gambaran Keseluruhan Perkhidmatan

### API Gateway (Node.js/Express)

**Port**: 8080  
**Akses**: Awam (ingres luaran)  
**Tujuan**: Mengarahkan permintaan masuk ke perkhidmatan backend yang sesuai  

**Titik Akhir**:
- `GET /` - Maklumat perkhidmatan
- `GET /health` - Titik akhir pemeriksaan kesihatan
- `GET /api/products` - Maju ke perkhidmatan produk (senarai semua)
- `GET /api/products/:id` - Maju ke perkhidmatan produk (dapatkan mengikut ID)

**Ciri Utama**:
- Pengarahan permintaan dengan axios
- Log terpusat
- Pengendalian ralat dan pengurusan tamat masa
- Penemuan perkhidmatan melalui pembolehubah persekitaran
- Integrasi Application Insights

**Sorotan Kod** (`src/api-gateway/app.js`):
```javascript
// Komunikasi perkhidmatan dalaman
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Akses**: Dalaman sahaja (tiada ingres luaran)  
**Tujuan**: Mengurus katalog produk dengan data dalam memori  

**Titik Akhir**:
- `GET /` - Maklumat perkhidmatan
- `GET /health` - Titik akhir pemeriksaan kesihatan
- `GET /products` - Senaraikan semua produk
- `GET /products/<id>` - Dapatkan produk mengikut ID

**Ciri Utama**:
- API RESTful dengan Flask
- Kedai produk dalam memori (mudah, tiada pangkalan data diperlukan)
- Pemantauan kesihatan dengan probe
- Log berstruktur
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

**Kenapa Dalaman Sahaja?**
Perkhidmatan produk tidak didedahkan secara awam. Semua permintaan mesti melalui API Gateway, yang menyediakan:
- Keselamatan: Titik akses terkawal
- Fleksibiliti: Boleh menukar backend tanpa menjejaskan klien
- Pemantauan: Log permintaan terpusat

## Memahami Komunikasi Perkhidmatan

### Bagaimana Perkhidmatan Berkomunikasi Antara Satu Sama Lain

Dalam contoh ini, API Gateway berkomunikasi dengan Product Service menggunakan **panggilan HTTP dalaman**:

```javascript
// Gerbang API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Buat permintaan HTTP dalaman
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Perkara Utama**:

1. **Penemuan Berdasarkan DNS**: Container Apps secara automatik menyediakan DNS untuk perkhidmatan dalaman
   - FQDN Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Dipermudahkan sebagai: `http://product-service` (Container Apps menyelesaikannya)

2. **Tiada Pendedahan Awam**: Product Service mempunyai `external: false` dalam Bicep
   - Hanya boleh diakses dalam persekitaran Container Apps
   - Tidak boleh dicapai dari internet

3. **Pembolehubah Persekitaran**: URL perkhidmatan disuntik semasa pengkerahan
   - Bicep menghantar FQDN dalaman ke gateway
   - Tiada URL yang dikodkan keras dalam kod aplikasi

**Analogi**: Anggap ini seperti bilik pejabat. API Gateway adalah meja resepsi (menghadap awam), dan Product Service adalah bilik pejabat (dalaman sahaja). Pelawat mesti melalui resepsi untuk mencapai mana-mana bilik.

## Pilihan Pengkerahan

### Pengkerahan Penuh (Disyorkan)

```bash
# Sebarkan infrastruktur dan kedua-dua perkhidmatan
azd up
```

Ini mengerahkan:
1. Persekitaran Container Apps
2. Application Insights
3. Container Registry
4. Kontena API Gateway
5. Kontena Product Service

**Masa**: 8-12 minit

### Kerahkan Perkhidmatan Individu

```bash
# Sebarkan hanya satu perkhidmatan (selepas azd up awal)
azd deploy api-gateway

# Atau sebarkan perkhidmatan produk
azd deploy product-service
```

**Kes Penggunaan**: Apabila anda telah mengemas kini kod dalam satu perkhidmatan dan ingin mengerahkan semula hanya perkhidmatan itu.

### Kemas Kini Konfigurasi

```bash
# Tukar parameter penskalaan
azd env set GATEWAY_MAX_REPLICAS 30

# Lakukan penyebaran semula dengan konfigurasi baharu
azd up
```

## Konfigurasi

### Konfigurasi Penskalaan

Kedua-dua perkhidmatan dikonfigurasi dengan penskalaan automatik berdasarkan HTTP dalam fail Bicep mereka:

**API Gateway**:
- Replika minimum: 2 (sentiasa sekurang-kurangnya 2 untuk ketersediaan)
- Replika maksimum: 20
- Pencetus penskalaan: 50 permintaan serentak setiap replika

**Product Service**:
- Replika minimum: 1 (boleh berskala ke sifar jika diperlukan)
- Replika maksimum: 10
- Pencetus penskalaan: 100 permintaan serentak setiap replika

**Sesuaikan Penskalaan** (dalam `infra/app/*.bicep`):
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

### Peruntukan Sumber

**API Gateway**:
- CPU: 1.0 vCPU
- Memori: 2 GiB
- Sebab: Mengendalikan semua trafik luaran

**Product Service**:
- CPU: 0.5 vCPU
- Memori: 1 GiB
- Sebab: Operasi dalam memori yang ringan

### Pemeriksaan Kesihatan

Kedua-dua perkhidmatan termasuk liveness dan readiness probe:

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

**Apa Maksudnya**:
- **Liveness**: Jika pemeriksaan kesihatan gagal, Container Apps akan memulakan semula kontena
- **Readiness**: Jika tidak bersedia, Container Apps akan menghentikan penghalaan trafik ke replika tersebut

## Pemantauan & Pemerhatian

### Lihat Log Perkhidmatan

```bash
# Alirkan log dari API Gateway
azd logs api-gateway --follow

# Lihat log perkhidmatan produk terkini
azd logs product-service --tail 100

# Lihat semua log dari kedua-dua perkhidmatan
azd logs --follow
```

**Output Dijangka**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Pertanyaan Application Insights

Akses Application Insights di Portal Azure, kemudian jalankan pertanyaan ini:

**Cari Permintaan Lambat**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Jejak Panggilan Perkhidmatan-ke-Perkhidmatan**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Kadar Ralat Mengikut Perkhidmatan**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volume Permintaan Mengikut Masa**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Akses Papan Pemantauan

```bash
# Dapatkan butiran Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Buka pemantauan Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metrik Langsung

1. Navigasi ke Application Insights di Portal Azure
2. Klik "Live Metrics"
3. Lihat permintaan masa nyata, kegagalan, dan prestasi
4. Uji dengan menjalankan: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Latihan Praktikal

[Nota: Lihat latihan penuh di bahagian "Latihan Praktikal" di atas untuk langkah-langkah terperinci termasuk pengesahan pengkerahan, pengubahsuaian data, ujian penskalaan automatik, pengendalian ralat, dan menambah perkhidmatan ketiga.]

## Analisis Kos

### Anggaran Kos Bulanan (Untuk Contoh 2-Perkhidmatan Ini)

| Sumber | Konfigurasi | Anggaran Kos |
|--------|-------------|--------------|
| API Gateway | 2-20 replika, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replika, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Tier asas | $5 |
| Application Insights | 1-2 GB/bulan | $5-10 |
| Log Analytics | 1 GB/bulan | $3 |
| **Jumlah** | | **$58-243/bulan** |

**Pecahan Kos Berdasarkan Penggunaan**:
- **Trafik ringan** (ujian/pembelajaran): ~$60/bulan
- **Trafik sederhana** (pengeluaran kecil): ~$120/bulan
- **Trafik tinggi** (tempoh sibuk): ~$240/bulan

### Petua Pengoptimuman Kos

1. **Skala ke Sifar untuk Pembangunan**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Gunakan Pelan Penggunaan untuk Cosmos DB** (apabila anda menambahkannya):
   - Bayar hanya untuk apa yang anda gunakan
   - Tiada caj minimum

3. **Tetapkan Sampling Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Sampel 50% daripada permintaan
   ```

4. **Bersihkan Apabila Tidak Diperlukan**:
   ```bash
   azd down
   ```

### Pilihan Tier Percuma
Untuk pembelajaran/ujian, pertimbangkan:
- Gunakan kredit percuma Azure (30 hari pertama)
- Kekalkan bilangan replika minimum
- Padam selepas ujian (tiada caj berterusan)

---

## Pembersihan

Untuk mengelakkan caj berterusan, padamkan semua sumber:

```bash
azd down --force --purge
```

**Prompt Pengesahan**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Taip `y` untuk mengesahkan.

**Apa yang Akan Dipadam**:
- Persekitaran Container Apps
- Kedua-dua Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Sahkan Pembersihan**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Harus mengembalikan kosong.

---

## Panduan Pengembangan: Dari 2 ke 5+ Perkhidmatan

Setelah anda menguasai seni bina 2 perkhidmatan ini, berikut cara untuk berkembang:

### Fasa 1: Tambah Persistensi Pangkalan Data (Langkah Seterusnya)

**Tambah Cosmos DB untuk Product Service**:

1. Cipta `infra/core/cosmos.bicep`:
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

2. Kemas kini product service untuk menggunakan Cosmos DB dan bukannya data dalam memori

3. Anggaran kos tambahan: ~$25/bulan (serverless)

### Fasa 2: Tambah Perkhidmatan Ketiga (Pengurusan Pesanan)

**Cipta Order Service**:

1. Folder baru: `src/order-service/` (Python/Node.js/C#)
2. Bicep baru: `infra/app/order-service.bicep`
3. Kemas kini API Gateway untuk laluan `/api/orders`
4. Tambah Azure SQL Database untuk persistensi pesanan

**Seni bina menjadi**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fasa 3: Tambah Komunikasi Asinkron (Service Bus)

**Laksanakan Seni Bina Berasaskan Peristiwa**:

1. Tambah Azure Service Bus: `infra/core/servicebus.bicep`
2. Product Service menerbitkan peristiwa "ProductCreated"
3. Order Service melanggan peristiwa produk
4. Tambah Notification Service untuk memproses peristiwa

**Pola**: Permintaan/Balasan (HTTP) + Berasaskan Peristiwa (Service Bus)

### Fasa 4: Tambah Pengesahan Pengguna

**Laksanakan User Service**:

1. Cipta `src/user-service/` (Go/Node.js)
2. Tambah Azure AD B2C atau pengesahan JWT tersuai
3. API Gateway mengesahkan token
4. Perkhidmatan memeriksa kebenaran pengguna

### Fasa 5: Kesediaan Pengeluaran

**Tambah Komponen Ini**:
- Azure Front Door (pengimbangan beban global)
- Azure Key Vault (pengurusan rahsia)
- Azure Monitor Workbooks (papan pemuka tersuai)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity untuk semua perkhidmatan

**Kos Seni Bina Pengeluaran Penuh**: ~$300-1,400/bulan

---

## Ketahui Lebih Lanjut

### Dokumentasi Berkaitan
- [Dokumentasi Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Panduan Seni Bina Microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights untuk Pengesanan Teragih](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Langkah Seterusnya dalam Kursus Ini
- ← Sebelumnya: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Contoh aplikasi satu kontena untuk pemula
- → Seterusnya: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Tambah keupayaan AI
- 🏠 [Halaman Utama Kursus](../../README.md)

### Perbandingan: Bila Menggunakan Apa

**Single Container App** (Contoh Simple Flask API):
- ✅ Aplikasi ringkas
- ✅ Seni bina monolitik
- ✅ Cepat untuk diterapkan
- ❌ Skalabiliti terhad
- **Kos**: ~$15-50/bulan

**Microservices** (Contoh ini):
- ✅ Aplikasi kompleks
- ✅ Skalabiliti bebas untuk setiap perkhidmatan
- ✅ Autonomi pasukan (perkhidmatan berbeza, pasukan berbeza)
- ❌ Lebih kompleks untuk diuruskan
- **Kos**: ~$60-250/bulan

**Kubernetes (AKS)**:
- ✅ Kawalan dan fleksibiliti maksimum
- ✅ Portabiliti multi-cloud
- ✅ Rangkaian lanjutan
- ❌ Memerlukan kepakaran Kubernetes
- **Kos**: ~$150-500/bulan minimum

**Rekomendasi**: Mulakan dengan Container Apps (contoh ini), beralih ke AKS hanya jika anda memerlukan ciri khusus Kubernetes.

---

## Soalan Lazim

**S: Kenapa hanya 2 perkhidmatan dan bukannya 5+?**  
J: Perkembangan pendidikan. Kuasai asas (komunikasi perkhidmatan, pemantauan, skalabiliti) dengan contoh ringkas sebelum menambah kerumitan. Pola yang anda pelajari di sini boleh digunakan untuk seni bina 100 perkhidmatan.

**S: Bolehkah saya menambah lebih banyak perkhidmatan sendiri?**  
J: Sudah tentu! Ikuti panduan pengembangan di atas. Setiap perkhidmatan baru mengikuti pola yang sama: cipta folder src, cipta fail Bicep, kemas kini azure.yaml, terapkan.

**S: Adakah ini sedia untuk pengeluaran?**  
J: Ia adalah asas yang kukuh. Untuk pengeluaran, tambahkan: managed identity, Key Vault, pangkalan data berterusan, CI/CD pipeline, amaran pemantauan, dan strategi sandaran.

**S: Kenapa tidak menggunakan Dapr atau service mesh lain?**  
J: Kekalkan kesederhanaan untuk pembelajaran. Setelah anda memahami rangkaian Container Apps asli, anda boleh menambah Dapr untuk senario lanjutan.

**S: Bagaimana saya debug secara tempatan?**  
J: Jalankan perkhidmatan secara tempatan dengan Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**S: Bolehkah saya menggunakan bahasa pengaturcaraan yang berbeza?**  
J: Ya! Contoh ini menunjukkan Node.js (gateway) + Python (product service). Anda boleh mencampur mana-mana bahasa yang berjalan dalam kontena.

**S: Bagaimana jika saya tidak mempunyai kredit Azure?**  
J: Gunakan tier percuma Azure (30 hari pertama dengan akaun baru) atau terapkan untuk tempoh ujian pendek dan padamkan segera.

---

> **🎓 Ringkasan Laluan Pembelajaran**: Anda telah belajar untuk menerapkan seni bina multi-perkhidmatan dengan skalabiliti automatik, rangkaian dalaman, pemantauan terpusat, dan pola sedia pengeluaran. Asas ini mempersiapkan anda untuk sistem teragih yang kompleks dan seni bina microservices perusahaan.

**📚 Navigasi Kursus**:
- ← Sebelumnya: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Seterusnya: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Halaman Utama Kursus](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->