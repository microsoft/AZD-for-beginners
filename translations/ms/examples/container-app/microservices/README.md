# Seni Bina Mikroservis - Contoh Aplikasi Kontena

⏱️ **Anggaran Masa**: 25-35 minit | 💰 **Anggaran Kos**: ~$50-100/bulan | ⭐ **Kesukaran**: Lanjutan

**Seni bina mikroservis yang dipermudahkan tetapi berfungsi** yang dikerahkan ke Azure Container Apps menggunakan AZD CLI. Contoh ini menunjukkan komunikasi perkhidmatan-ke-perkhidmatan, pengurusan kontena, dan pemantauan dengan susunan 2 perkhidmatan yang praktikal.

> **📚 Pendekatan Pembelajaran**: Contoh ini bermula dengan seni bina 2 perkhidmatan yang minimum (API Gateway + Perkhidmatan Backend) yang boleh anda kerahkan dan pelajari. Selepas menguasai asas ini, kami menyediakan panduan untuk berkembang ke ekosistem mikroservis penuh.

## Apa Yang Akan Anda Pelajari

Dengan melengkapkan contoh ini, anda akan:
- Melaksanakan berbilang kontena ke Azure Container Apps
- Melaksanakan komunikasi perkhidmatan-ke-perkhidmatan dengan rangkaian dalaman
- Mengkonfigurasi skala berdasarkan persekitaran dan pemeriksaan kesihatan
- Memantau aplikasi teragih dengan Application Insights
- Memahami corak dan amalan terbaik pelaksanaan mikroservis
- Memahami perkembangan progresif dari seni bina mudah ke kompleks

## Seni Bina

### Fasa 1: Apa Yang Kita Bangunkan (Termasuk Dalam Contoh Ini)

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

**Mengapa Mulakan Dengan Mudah?**
- ✅ Melaksanakan dan memahami dengan cepat (25-35 minit)
- ✅ Belajar corak mikroservis teras tanpa kerumitan
- ✅ Kod yang berfungsi yang boleh anda ubah suai dan bereksperimen
- ✅ Kos lebih rendah untuk pembelajaran (~$50-100/bulan berbanding $300-1400/bulan)
- ✅ Membangun keyakinan sebelum menambah pangkalan data dan barisan mesej

**Analogi**: Fikirkan ini seperti belajar memandu. Anda mula dengan tempat letak kereta kosong (2 perkhidmatan), kuasai asas, kemudian maju ke trafik bandar (5+ perkhidmatan dengan pangkalan data).

### Fasa 2: Pengembangan Masa Depan (Rujukan Seni Bina)

Setelah anda menguasai seni bina 2 perkhidmatan, anda boleh mengembangkan kepada:

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

## Ciri Termasuk

✅ **Pencarian Perkhidmatan**: Pencarian DNS automatik antara kontena  
✅ **Pengimbangan Beban**: Pengimbangan beban terbina dalam merentasi replika  
✅ **Skala Automatik**: Skala bebas untuk setiap perkhidmatan berdasarkan permintaan HTTP  
✅ **Pemantauan Kesihatan**: Probe liveness dan readiness untuk kedua-dua perkhidmatan  
✅ **Log Teragih**: Log berpusat dengan Application Insights  
✅ **Rangkaian Dalaman**: Komunikasi selamat perkhidmatan-ke-perkhidmatan  
✅ **Orkestrasi Kontena**: Pelaksanaan dan skala automatik  
✅ **Kemas Kini Tanpa Henti**: Kemas kini berperingkat dengan pengurusan revisi  

## Prasyarat

### Alat Diperlukan

Sebelum bermula, sahkan anda mempunyai alat berikut dipasang:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versi 1.0.0 atau lebih tinggi)
   ```bash
   azd version
   # Output yang dijangka: versi azd 1.0.0 atau lebih tinggi
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versi 2.50.0 atau lebih tinggi)
   ```bash
   az --version
   # Output yang dijangka: azure-cli 2.50.0 atau lebih tinggi
   ```

3. **[Docker](https://www.docker.com/get-started)** (untuk pembangunan/ujian tempatan - pilihan)
   ```bash
   docker --version
   # Output yang dijangka: Versi Docker 20.10 atau lebih tinggi
   ```

### Keperluan Azure

- **Langganan Azure** aktif ([buat akaun percuma](https://azure.microsoft.com/free/))
- Kebenaran mencipta sumber dalam langganan anda
- Peranan **Contributor** pada langganan atau kumpulan sumber

### Prasyarat Pengetahuan

Ini adalah contoh **peringkat lanjutan**. Anda perlu:
- Sudah melengkapkan [Contoh API Flask Mudah](../../../../../examples/container-app/simple-flask-api) 
- Pemahaman asas tentang seni bina mikroservis
- Kebiasaan dengan REST API dan HTTP
- Memahami konsep kontena

**Baru dengan Container Apps?** Mula dengan [Contoh API Flask Mudah](../../../../../examples/container-app/simple-flask-api) dahulu untuk belajar asas.

## Mula Cepat (Langkah demi Langkah)

### Langkah 1: Klon dan Navigasi

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Pemeriksaan Kejayaan**: Sahkan anda melihat `azure.yaml`:
```bash
ls
# Dijangka: README.md, azure.yaml, infra/, src/
```

### Langkah 2: Autentikasi dengan Azure

```bash
azd auth login
```

Ini membuka penyemak imbas anda untuk pengesahan Azure. Log masuk dengan kelayakan Azure anda.

**✓ Pemeriksaan Kejayaan**: Anda patut lihat:
```
Logged in to Azure.
```

### Langkah 3: Inisialisasi Persekitaran

```bash
azd init
```

**Prompt yang akan anda lihat**:
- **Nama persekitaran**: Masukkan nama ringkas (contoh: `microservices-dev`)
- **Langganan Azure**: Pilih langganan anda
- **Lokasi Azure**: Pilih wilayah (contoh: `eastus`, `westeurope`)

**✓ Pemeriksaan Kejayaan**: Anda patut lihat:
```
SUCCESS: New project initialized!
```

### Langkah 4: Melaksanakan Infrastruktur dan Perkhidmatan

```bash
azd up
```

**Yang terjadi** (ambil masa 8-12 minit):
1. Mencipta persekitaran Container Apps
2. Mencipta Application Insights untuk pemantauan
3. Membina kontena API Gateway (Node.js)
4. Membina kontena Perkhidmatan Produk (Python)
5. Melaksanakan kedua-dua kontena ke Azure
6. Mengkonfigurasi rangkaian dan pemeriksaan kesihatan
7. Menyediakan pemantauan dan pencatatan

**✓ Pemeriksaan Kejayaan**: Anda patut lihat:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Masa**: 8-12 minit

### Langkah 5: Uji Pelaksanaan

```bash
# Dapatkan titik akhir pintu masuk
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
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Pemeriksaan Kejayaan**: Kedua-dua titik akhir mengembalikan data JSON tanpa ralat.

---

**🎉 Tahniah!** Anda telah melaksanakan seni bina mikroservis ke Azure!

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

**Apa Yang Dilakukan Setiap Komponen:**

**Infrastruktur (infra/)**:
- `main.bicep`: Mengorkestrakan semua sumber Azure dan kebergantungannya
- `core/container-apps-environment.bicep`: Mencipta persekitaran Container Apps dan Azure Container Registry
- `core/monitor.bicep`: Menyediakan Application Insights untuk log teragih
- `app/*.bicep`: Definisi app kontena individu dengan skala dan pemeriksaan kesihatan

**API Gateway (src/api-gateway/)**:
- Perkhidmatan hadapan awam yang menghala permintaan ke perkhidmatan backend
- Melaksanakan pencatatan, pengendalian ralat, dan penghantaran permintaan
- Menunjukkan komunikasi HTTP perkhidmatan-ke-perkhidmatan

**Perkhidmatan Produk (src/product-service/)**:
- Perkhidmatan dalaman dengan katalog produk (dalam memori untuk kesederhanaan)
- REST API dengan pemeriksaan kesihatan
- Contoh corak mikroservis backend

## Gambaran Keseluruhan Perkhidmatan

### API Gateway (Node.js/Express)

**Port**: 8080  
**Akses**: Awam (ingress luaran)  
**Tujuan**: Menghala permintaan masuk ke perkhidmatan backend yang sesuai  

**Titik Akhir**:
- `GET /` - Maklumat perkhidmatan
- `GET /health` - Titik akhir pemeriksaan kesihatan
- `GET /api/products` - Hantar ke perkhidmatan produk (senaraikan semua)
- `GET /api/products/:id` - Hantar ke perkhidmatan produk (dapatkan mengikut ID)

**Ciri Utama**:
- Penghalaan permintaan dengan axios
- Pencatatan berpusat
- Pengendalian ralat dan pengurusan masa tamat
- Pencarian perkhidmatan melalui pembolehubah persekitaran
- Integrasi Application Insights

**Sorotan Kod** (`src/api-gateway/app.js`):
```javascript
// Komunikasi perkhidmatan dalaman
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Perkhidmatan Produk (Python/Flask)

**Port**: 8000  
**Akses**: Dalaman sahaja (tiada ingress luaran)  
**Tujuan**: Mengurus katalog produk dengan data dalam memori  

**Titik Akhir**:
- `GET /` - Maklumat perkhidmatan
- `GET /health` - Titik akhir pemeriksaan kesihatan
- `GET /products` - Senaraikan semua produk
- `GET /products/<id>` - Dapatkan produk mengikut ID

**Ciri Utama**:
- RESTful API dengan Flask
- Penyimpanan produk dalam memori (mudah, tanpa pangkalan data)
- Pemantauan kesihatan dengan probe
- Pencatatan berstruktur
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

**Mengapa Dalaman Sahaja?**
Perkhidmatan produk tidak didedahkan secara awam. Semua permintaan mesti melalui API Gateway, yang menyediakan:
- Keselamatan: Titik akses terkawal
- Fleksibiliti: Boleh ubah backend tanpa menjejaskan klien
- Pemantauan: Pencatatan permintaan berpusat

## Memahami Komunikasi Perkhidmatan

### Bagaimana Perkhidmatan Berkomunikasi

Dalam contoh ini, API Gateway berkomunikasi dengan Perkhidmatan Produk menggunakan **panggilan HTTP dalaman**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Buat permintaan HTTP dalaman
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Perkara Utama**:

1. **Pencarian Berasaskan DNS**: Container Apps secara automatik menyediaka DNS untuk perkhidmatan dalaman
   - FQDN Perkhidmatan Produk: `product-service.internal.<environment>.azurecontainerapps.io`
   - Disederhanakan sebagai: `http://product-service` (Container Apps menyelesaikannya)

2. **Tiada Pendedahan Awam**: Perkhidmatan Produk mempunyai `external: false` dalam Bicep
   - Hanya boleh diakses dalam persekitaran Container Apps
   - Tidak boleh diakses dari internet

3. **Pembolehubah Persekitaran**: URL perkhidmatan disuntik semasa pelaksanaan
   - Bicep menghantar FQDN dalaman ke gateway
   - Tiada URL terbina dalam kod aplikasi

**Analogi**: Fikirkan ini seperti bilik pejabat. API Gateway ialah meja resepsi (hadapan awam), dan Perkhidmatan Produk adalah bilik pejabat (dalam sahaja). Pelawat mesti melalui resepsi untuk sampai ke mana-mana pejabat.

## Pilihan Pelaksanaan

### Pelaksanaan Penuh (Disyorkan)

```bash
# Menyebarkan infrastruktur dan kedua-dua perkhidmatan
azd up
```

Ini melaksanakan:
1. Persekitaran Container Apps
2. Application Insights
3. Container Registry
4. Kontena API Gateway
5. Kontena Perkhidmatan Produk

**Masa**: 8-12 minit

### Melaksanakan Perkhidmatan Individu

```bash
# Hanya lancarkan satu perkhidmatan (selepas azd up awal)
azd deploy api-gateway

# Atau lancarkan perkhidmatan produk
azd deploy product-service
```

**Kes Penggunaan**: Apabila anda telah mengemas kini kod dalam satu perkhidmatan dan mahu melaksanakan semula hanya perkhidmatan itu.

### Kemas Kini Konfigurasi

```bash
# Tukar parameter skala
azd env set GATEWAY_MAX_REPLICAS 30

# Hantar semula dengan konfigurasi baru
azd up
```

## Konfigurasi

### Konfigurasi Penskalaan

Kedua-dua perkhidmatan dikonfigurasi dengan autoskala berasaskan HTTP dalam fail Bicep mereka:

**API Gateway**:
- Replika min: 2 (sentiasa sekurang-kurangnya 2 untuk kebolehaksesan)
- Replika maks: 20
- Pencetus skala: 50 permintaan serentak setiap replika

**Perkhidmatan Produk**:
- Replika min: 1 (boleh skala ke sifar jika perlu)
- Replika maks: 10
- Pencetus skala: 100 permintaan serentak setiap replika

**Sesuaikan Skala** (dalam `infra/app/*.bicep`):
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

**Perkhidmatan Produk**:
- CPU: 0.5 vCPU
- Memori: 1 GiB
- Sebab: Operasi ringan dalam memori

### Pemeriksaan Kesihatan

Kedua-dua perkhidmatan termasuk probe liveness dan readiness:

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

**Apa Maksud Ini**:
- **Liveness**: Jika pemeriksaan kesihatan gagal, Container Apps memulakan semula kontena
- **Readiness**: Jika belum bersedia, Container Apps berhenti menyalurkan trafik ke replika itu



## Pemantauan & Pemerhatian

### Melihat Log Perkhidmatan

```bash
# Lihat log menggunakan azd monitor
azd monitor --logs

# Atau gunakan Azure CLI untuk Aplikasi Kontena tertentu:
# Alirkan log dari API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Lihat log perkhidmatan produk terkini
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Output Dijangka**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Pertanyaan Application Insights

Akses Application Insights di Azure Portal, kemudian jalankan pertanyaan ini:

**Cari Permintaan Perlahan**:
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

**Isipadu Permintaan Mengikut Masa**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Akses Papan Pemuka Pemantauan

```bash
# Dapatkan butiran Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Buka pemantauan Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metrik Secara Langsung

1. Navigasi ke Application Insights dalam Azure Portal  
2. Klik "Live Metrics"  
3. Lihat permintaan, kegagalan, dan prestasi masa nyata  
4. Uji dengan menjalankan: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Latihan Praktikal

[Catatan: Lihat latihan penuh di bahagian "Practical Exercises" untuk latihan langkah demi langkah terperinci termasuk verifikasi pelaksanaan, pengubahsuaian data, ujian autoskala, pengendalian ralat, dan penambahan perkhidmatan ketiga.]

## Analisis Kos

### Anggaran Kos Bulanan (Untuk Contoh 2 Perkhidmatan Ini)

| Sumber | Konfigurasi | Anggaran Kos |
|----------|--------------|----------------|
| API Gateway | 2-20 replika, 1 vCPU, 2GB RAM | $30-150 |
| Perkhidmatan Produk | 1-10 replika, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Tahap asas | $5 |
| Application Insights | 1-2 GB/bulan | $5-10 |
| Log Analytics | 1 GB/bulan | $3 |
| **Jumlah** | | **$58-243/bulan** |

**Pecahan Kos Mengikut Penggunaan**:
- **Trafik ringan** (ujian/pembelajaran): ~$60/bulan
- **Trafik sederhana** (produksi kecil): ~$120/bulan
- **Trafik tinggi** (tempoh sibuk): ~$240/bulan

### Petua Pengoptimuman Kos

1. **Skala ke Sifar untuk Pembangunan**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Gunakan Pelan Penggunaan untuk Cosmos DB** (apabila anda menambahnya):
   - Bayar hanya untuk apa yang anda guna
   - Tiada caj minimum

3. **Tetapkan Sampling Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Contoh 50% permintaan
   ```

4. **Bersihkan Apabila Tidak Diperlukan**:
   ```bash
   azd down
   ```

### Pilihan Tahap Percuma
Untuk pembelajaran/ujian, pertimbangkan:  
- Gunakan kredit percuma Azure (30 hari pertama)  
- Kekalkan replika minimum  
- Padam selepas ujian (tiada caj berterusan)  

---

## Pembersihan

Untuk mengelakkan caj berterusan, padam semua sumber:

```bash
azd down --force --purge
```
  
**Arahan Pengesahan**:  
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```
  
Taip `y` untuk mengesahkan.

**Apa Yang Akan Dipadam**:  
- Persekitaran Aplikasi Bekas  
- Kedua-dua Aplikasi Bekas (gateway & perkhidmatan produk)  
- Registry Bekas  
- Application Insights  
- Log Analytics Workspace  
- Kumpulan Sumber  

**✓ Sahkan Pembersihan**:  
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```
  
Sebaiknya mengembalikan kosong.

---

## Panduan Pengembangan: Dari 2 ke 5+ Perkhidmatan

Setelah menguasai seni bina 2-perkhidmatan ini, ini cara untuk mengembang:

### Fasa 1: Tambah Penyimpanan Pangkalan Data (Langkah Seterusnya)

**Tambah Cosmos DB untuk Perkhidmatan Produk**:

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
  
2. Kemaskini perkhidmatan produk untuk menggunakan Cosmos DB menggantikan data dalam memori

3. Anggaran kos tambahan: ~$25/bulan (serverless)

### Fasa 2: Tambah Perkhidmatan Ketiga (Pengurusan Pesanan)

**Cipta Perkhidmatan Pesanan**:

1. Folder baru: `src/order-service/` (Python/Node.js/C#)  
2. Bicep baru: `infra/app/order-service.bicep`  
3. Kemaskini API Gateway untuk laluan `/api/orders`  
4. Tambah Azure SQL Database untuk penyimpanan pesanan

**Senibina menjadi**:  
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```
  
### Fasa 3: Tambah Komunikasi Async (Service Bus)

**Laksanakan Seni Bina Berpandukan Peristiwa**:

1. Tambah Azure Service Bus: `infra/core/servicebus.bicep`  
2. Perkhidmatan Produk menerbitkan peristiwa "ProductCreated"  
3. Perkhidmatan Pesanan melanggan peristiwa produk  
4. Tambah Perkhidmatan Pemberitahuan untuk memproses peristiwa

**Corak**: Permintaan/Respons (HTTP) + Berpandukan Peristiwa (Service Bus)

### Fasa 4: Tambah Pengesahan Pengguna

**Laksanakan Perkhidmatan Pengguna**:

1. Cipta `src/user-service/` (Go/Node.js)  
2. Tambah Azure AD B2C atau pengesahan JWT tersuai  
3. API Gateway mengesahkan token  
4. Perkhidmatan memeriksa kebenaran pengguna

### Fasa 5: Kesiapan Pengeluaran

**Tambah Komponen Ini**:  
- Azure Front Door (pengimbangan beban global)  
- Azure Key Vault (pengurusan rahsia)  
- Azure Monitor Workbooks (papan pemuka tersuai)  
- Saluran CI/CD (GitHub Actions)  
- Penghantaran Blue-Green  
- Identity Terurus untuk semua perkhidmatan

**Kos Seni Bina Pengeluaran Penuh**: ~$300-1,400/bulan

---

## Ketahui Lebih Lanjut

### Dokumentasi Berkaitan  
- [Dokumentasi Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)  
- [Panduan Seni Bina Mikroservis](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)  
- [Application Insights untuk Penjejakan Teragih](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  

### Langkah Seterusnya dalam Kursus Ini  
- ← Sebelumnya: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Contoh bekas tunggal untuk pemula  
- → Seterusnya: [Panduan Integrasi AI](../../../../../examples/docs/ai-foundry) - Tambah keupayaan AI  
- 🏠 [Halaman Utama Kursus](../../README.md)  

### Perbandingan: Bila Gunakan Apa

**Aplikasi Bekas Tunggal** (contoh Simple Flask API):  
- ✅ Aplikasi mudah  
- ✅ Seni bina monolitik  
- ✅ Pantas untuk dideploy  
- ❌ Skala terhad  
- **Kos**: ~$15-50/bulan  

**Mikroservis** (Contoh ini):  
- ✅ Aplikasi kompleks  
- ✅ Skala bebas setiap perkhidmatan  
- ✅ Autonomi pasukan (perkhidmatan berbeza, pasukan berbeza)  
- ❌ Lebih rumit untuk diurus  
- **Kos**: ~$60-250/bulan  

**Kubernetes (AKS)**:  
- ✅ Kawalan dan fleksibiliti maksimum  
- ✅ Portabiliti pelbagai awan  
- ✅ Rangkaian maju  
- ❌ Memerlukan kepakaran Kubernetes  
- **Kos**: ~$150-500/bulan minimum  

**Cadangan**: Mulakan dengan Container Apps (contoh ini), beralih ke AKS hanya jika memerlukan ciri khusus Kubernetes.

---

## Soalan Lazim

**S: Kenapa hanya 2 perkhidmatan dan bukan 5+?**  
J: Progresi pendidikan. Kuasai asas (komunikasi perkhidmatan, pemantauan, penskalaan) dengan contoh mudah sebelum tambah kerumitan. Corak yang anda pelajari di sini terpakai untuk seni bina 100 perkhidmatan.

**S: Bolehkan saya tambah lebih banyak perkhidmatan sendiri?**  
J: Sudah tentu! Ikuti panduan pengembangan di atas. Setiap perkhidmatan baru ikut corak sama: cipta folder src, cipta fail Bicep, kemaskini azure.yaml, deploy.

**S: Adakah ini sedia untuk pengeluaran?**  
J: Ia asas yang kukuh. Untuk pengeluaran, tambah: identity terurus, Key Vault, pangkalan data berterusan, saluran CI/CD, amaran pemantauan, dan strategi sandaran.

**S: Kenapa tidak guna Dapr atau mesh perkhidmatan lain?**  
J: Kekalkan mudah untuk pembelajaran. Setelah faham rangkaian asli Container Apps, anda boleh tambah lapisan Dapr untuk senario maju.

**S: Bagaimana debug secara tempatan?**  
J: Jalankan perkhidmatan secara tempatan dengan Docker:  
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```
  
**S: Boleh guna bahasa pengaturcaraan berlainan?**  
J: Ya! Contoh ini tunjuk Node.js (gateway) + Python (perkhidmatan produk). Anda boleh gabung bahasa yang boleh dijalankan dalam bekas.

**S: Apa jika saya tiada kredit Azure?**  
J: Gunakan tier percuma Azure (30 hari pertama dengan akaun baru) atau deploy untuk tempoh ujian singkat dan padam segera.

---

> **🎓 Ringkasan Laluan Pembelajaran**: Anda telah belajar untuk melancarkan seni bina multi-perkhidmatan dengan penskalaan automatik, rangkaian dalaman, pemantauan pusat, dan corak sedia pengeluaran. Asas ini menyediakan anda untuk sistem teragih kompleks dan seni bina mikroservis perusahaan.

**📚 Navigasi Kursus:**  
- ← Sebelumnya: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)  
- → Seterusnya: [Contoh Integrasi Pangkalan Data](../../../../../examples/database-app)  
- 🏠 [Halaman Utama Kursus](../../../README.md)  
- 📖 [Amalan Terbaik Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->