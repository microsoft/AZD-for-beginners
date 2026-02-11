# Melancarkan Pangkalan Data Microsoft SQL dan Aplikasi Web dengan AZD

⏱️ **Anggaran Masa**: 20-30 minit | 💰 **Anggaran Kos**: ~$15-25/sebulan | ⭐ **Kerumitan**: Sederhana

**Contoh lengkap dan berfungsi** ini menunjukkan cara menggunakan [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) untuk melancarkan aplikasi web Python Flask dengan Pangkalan Data Microsoft SQL ke Azure. Semua kod disertakan dan diuji—tiada kebergantungan luaran diperlukan.

## Apa Yang Akan Anda Pelajari

Dengan menyelesaikan contoh ini, anda akan:
- Melancarkan aplikasi bertingkat dua (aplikasi web + pangkalan data) menggunakan infrastruktur sebagai kod
- Menyediakan sambungan pangkalan data yang selamat tanpa memasukkan rahsia secara keras
- Memantau kesihatan aplikasi dengan Application Insights
- Menguruskan sumber Azure dengan cekap menggunakan AZD CLI
- Mengikuti amalan terbaik Azure untuk keselamatan, pengoptimuman kos, dan keterlihatan

## Gambaran Keseluruhan Senario
- **Aplikasi Web**: API REST Python Flask dengan sambungan pangkalan data
- **Pangkalan Data**: Pangkalan Data Azure SQL dengan data contoh
- **Infrastruktur**: Disediakan menggunakan Bicep (templat modular, boleh guna semula)
- **Pelancaran**: Automasi sepenuhnya dengan arahan `azd`
- **Pemantauan**: Application Insights untuk log dan telemetri

## Prasyarat

### Alat Yang Diperlukan

Sebelum memulakan, pastikan anda mempunyai alat berikut:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versi 2.50.0 atau lebih tinggi)
   ```sh
   az --version
   # Output yang dijangka: azure-cli 2.50.0 atau lebih tinggi
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versi 1.0.0 atau lebih tinggi)
   ```sh
   azd version
   # Output yang dijangka: versi azd 1.0.0 atau lebih tinggi
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (untuk pembangunan tempatan)
   ```sh
   python --version
   # Output yang dijangka: Python 3.8 atau lebih tinggi
   ```

4. **[Docker](https://www.docker.com/get-started)** (pilihan, untuk pembangunan berasaskan bekas secara tempatan)
   ```sh
   docker --version
   # Jangkaan output: Versi Docker 20.10 atau lebih tinggi
   ```

### Keperluan Azure

- Langganan **Azure aktif** ([buat akaun percuma](https://azure.microsoft.com/free/))
- Kebenaran untuk membuat sumber dalam langganan anda
- Peranan **Owner** atau **Contributor** pada langganan atau kumpulan sumber

### Prasyarat Pengetahuan

Ini adalah contoh **peringkat sederhana**. Anda harus biasa dengan:
- Operasi asas baris arahan
- Konsep awan asas (sumber, kumpulan sumber)
- Pemahaman asas aplikasi web dan pangkalan data

**Baru dengan AZD?** Mulakan dengan [panduan Memulakan](../../docs/chapter-01-foundation/azd-basics.md) terlebih dahulu.

## Seni Bina

Contoh ini melancarkan seni bina bertingkat dua dengan aplikasi web dan pangkalan data SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Pelancaran Sumber:**
- **Kumpulan Sumber**: Penampung untuk semua sumber
- **Pelan App Service**: Penempatan berasaskan Linux (tier B1 untuk kecekapan kos)
- **Aplikasi Web**: Runtime Python 3.11 dengan aplikasi Flask
- **Pelayan SQL**: Pelayan pangkalan data yang diurus dengan TLS 1.2 minimum
- **Pangkalan Data SQL**: Tier asas (2GB, sesuai untuk pembangunan/ujian)
- **Application Insights**: Pemantauan dan pencatatan
- **Log Analytics Workspace**: Penyimpanan log berpusat

**Analogi**: Anggap seperti restoran (aplikasi web) dengan peti beku berjalan masuk (pangkalan data). Pelanggan membuat pesanan daripada menu (endpoint API), dan dapur (aplikasi Flask) mengambil bahan (data) dari peti sejuk. Pengurus restoran (Application Insights) menjejak semua yang berlaku.

## Struktur Folder

Semua fail disertakan dalam contoh ini—tiada kebergantungan luaran diperlukan:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Fungsi Setiap Fail:**
- **azure.yaml**: Memberitahu AZD apa yang hendak dilancarkan dan ke mana
- **infra/main.bicep**: Mengatur semua sumber Azure
- **infra/resources/*.bicep**: Definisi sumber individu (modular untuk kegunaan semula)
- **src/web/app.py**: Aplikasi Flask dengan logik pangkalan data
- **requirements.txt**: Kebergantungan pakej Python
- **Dockerfile**: Arahan kontena untuk pelancaran

## Permulaan Pantas (Langkah demi Langkah)

### Langkah 1: Klon dan Navigasi

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Semakan Kejayaan**: Sahkan anda melihat `azure.yaml` dan folder `infra/`:
```sh
ls
# Dijangka: README.md, azure.yaml, infra/, src/
```

### Langkah 2: Autentikasi dengan Azure

```sh
azd auth login
```

Ini membuka penyemak imbas anda untuk autentikasi Azure. Log masuk dengan kelayakan Azure anda.

**✓ Semakan Kejayaan**: Anda harus melihat:
```
Logged in to Azure.
```

### Langkah 3: Inisialisasi Persekitaran

```sh
azd init
```

**Apa yang berlaku**: AZD membuat konfigurasi tempatan untuk pelancaran anda.

**Prompt yang akan anda lihat**:
- **Nama persekitaran**: Masukkan nama pendek (contoh: `dev`, `myapp`)
- **Langganan Azure**: Pilih langganan anda daripada senarai
- **Lokasi Azure**: Pilih rantau (contoh: `eastus`, `westeurope`)

**✓ Semakan Kejayaan**: Anda harus melihat:
```
SUCCESS: New project initialized!
```

### Langkah 4: Sediakan Sumber Azure

```sh
azd provision
```

**Apa yang berlaku**: AZD melancarkan semua infrastruktur (ambil masa 5-8 minit):
1. Membuat kumpulan sumber
2. Membuat Pelayan dan Pangkalan Data SQL
3. Membuat Pelan App Service
4. Membuat Aplikasi Web
5. Membuat Application Insights
6. Menyediakan rangkaian dan keselamatan

**Anda akan diminta untuk**:
- **Nama pengguna pentadbir SQL**: Masukkan nama pengguna (contoh: `sqladmin`)
- **Katalaluan pentadbir SQL**: Masukkan kata laluan kuat (simpan ini!)

**✓ Semakan Kejayaan**: Anda harus melihat:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Masa**: 5-8 minit

### Langkah 5: Lancarkan Aplikasi

```sh
azd deploy
```

**Apa yang berlaku**: AZD membina dan melancarkan aplikasi Flask anda:
1. Membungkus aplikasi Python
2. Membangun kontena Docker
3. Menolak ke Azure Web App
4. Memulakan pangkalan data dengan data contoh
5. Memulakan aplikasi

**✓ Semakan Kejayaan**: Anda harus melihat:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Masa**: 3-5 minit

### Langkah 6: Layari Aplikasi

```sh
azd browse
```

Ini membuka aplikasi web yang telah dilancarkan di penyemak imbas pada `https://app-<unique-id>.azurewebsites.net`

**✓ Semakan Kejayaan**: Anda harus melihat output JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Langkah 7: Uji Endpoint API

**Pemeriksaan Kesihatan** (sahkan sambungan pangkalan data):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Respons Dijangka**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Senaraikan Produk** (data contoh):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Respons Dijangka**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Dapatkan Produk Tunggal**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Semakan Kejayaan**: Semua endpoint mengembalikan data JSON tanpa ralat.

---

**🎉 Tahniah!** Anda telah berjaya melancarkan aplikasi web dengan pangkalan data ke Azure menggunakan AZD.

## Penjelasan Konfigurasi Mendalam

### Pembolehubah Persekitaran

Rahsia diurus secara selamat melalui konfigurasi Azure App Service—**tidak pernah dimasukkan keras dalam kod sumber**.

**Dikonfigurasi Secara Automatik oleh AZD**:
- `SQL_CONNECTION_STRING`: Sambungan pangkalan data dengan kelayakan disulitkan
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Titik hujung telemetri pemantauan
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Mengaktifkan pemasangan kebergantungan automatik

**Tempat Penyimpanan Rahsia**:
1. Semasa `azd provision`, anda beri kelayakan SQL melalui prompt selamat
2. AZD menyimpan ini dalam fail tempatan `.azure/<env-name>/.env` (diabaikan oleh git)
3. AZD menyuntik ke dalam konfigurasi Azure App Service (disulitkan semasa simpanan)
4. Aplikasi membacanya melalui `os.getenv()` semasa runtime

### Pembangunan Tempatan

Untuk ujian tempatan, buat fail `.env` dari contoh:

```sh
cp .env.sample .env
# Sunting .env dengan sambungan pangkalan data tempatan anda
```

**Aliran Kerja Pembangunan Tempatan**:
```sh
# Pasang kebergantungan
cd src/web
pip install -r requirements.txt

# Tetapkan pembolehubah persekitaran
export SQL_CONNECTION_STRING="your-local-connection-string"

# Jalankan aplikasi
python app.py
```

**Uji secara tempatan**:
```sh
curl http://localhost:8000/health
# Dijangka: {"status": "sihat", "database": "bersambung"}
```

### Infrastruktur sebagai Kod

Semua sumber Azure ditakrifkan dalam **templat Bicep** (`infra/` folder):

- **Reka Bentuk Modular**: Setiap jenis sumber mempunyai fail sendiri untuk kegunaan semula
- **Parameterisasi**: Sesuaikan SKU, rantau, konvensyen penamaan
- **Amalan Terbaik**: Mengikuti piawaian penamaan Azure dan tetapan keselamatan lalai
- **Kawalan Versi**: Perubahan infrastruktur dijejaki dalam Git

**Contoh Penyesuaian**:
Untuk menukar tier pangkalan data, sunting `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Amalan Terbaik Keselamatan

Contoh ini mengikuti amalan terbaik keselamatan Azure:

### 1. **Tiada Rahsia dalam Kod Sumber**
- ✅ Kelayakan disimpan dalam konfigurasi Azure App Service (disulitkan)
- ✅ Fail `.env` dikecualikan dari Git melalui `.gitignore`
- ✅ Rahsia disampaikan melalui parameter selamat semasa penyediaan

### 2. **Sambungan Disulitkan**
- ✅ TLS 1.2 minimum untuk Pelayan SQL
- ✅ Hanya HTTPS dipaksakan untuk Aplikasi Web
- ✅ Sambungan pangkalan data menggunakan saluran disulitkan

### 3. **Keselamatan Rangkaian**
- ✅ Firewall Pelayan SQL dikonfigurasi untuk membenarkan perkhidmatan Azure sahaja
- ✅ Akses rangkaian awam terhad (boleh dikunci lagi dengan Private Endpoints)
- ✅ FTPS dimatikan pada Aplikasi Web

### 4. **Pengesahan & Kebenaran**
- ⚠️ **Sekarang**: Pengesahan SQL (nama pengguna/katalaluan)
- ✅ **Cadangan Produksi**: Gunakan Managed Identity Azure untuk pengesahan tanpa kata laluan

**Untuk Naik Taraf ke Managed Identity** (untuk produksi):
1. Hidupkan Managed Identity pada Aplikasi Web
2. Berikan kebenaran SQL kepada identiti
3. Kemas kini rentetan sambungan untuk menggunakan Managed Identity
4. Alih keluar pengesahan berasaskan kata laluan

### 5. **Pengauditan & Pematuhan**
- ✅ Application Insights merekodkan semua permintaan dan ralat
- ✅ Pengauditan Pangkalan Data SQL dihidupkan (boleh dikonfigurasi untuk pematuhan)
- ✅ Semua sumber bertanda untuk tadbir urus

**Senarai Semak Keselamatan Sebelum Produksi**:
- [ ] Hidupkan Azure Defender untuk SQL
- [ ] Konfigurasikan Private Endpoints untuk Pangkalan Data SQL
- [ ] Hidupkan Web Application Firewall (WAF)
- [ ] Laksanakan Azure Key Vault untuk putaran rahsia
- [ ] Konfigurasikan pengesahan Azure AD
- [ ] Aktifkan pencatatan diagnostik untuk semua sumber

## Pengoptimuman Kos

**Anggaran Kos Bulanan** (sehingga November 2025):

| Sumber | SKU/Tier | Anggaran Kos |
|----------|----------|----------------|
| Pelan App Service | B1 (Asas) | ~$13/sebulan |
| Pangkalan Data SQL | Asas (2GB) | ~$5/sebulan |
| Application Insights | Bayar ikut penggunaan | ~$2/sebulan (trafik rendah) |
| **Jumlah** | | **~$20/sebulan** |

**💡 Petua Penjimatan Kos**:

1. **Gunakan Tier Percuma untuk Pembelajaran**:
   - App Service: tier F1 (percuma, jam terhad)
   - Pangkalan Data SQL: Gunakan Azure SQL Database serverless
   - Application Insights: Penyerapan percuma 5GB/bulan

2. **Hentikan Sumber Bila Tidak Digunakan**:
   ```sh
   # Hentikan aplikasi web (pangkalan data masih dikenakan caj)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Mulakan semula apabila perlu
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Padam Semua Selepas Ujian**:
   ```sh
   azd down
   ```
   Ini membuang SEMUA sumber dan menghentikan caj.

4. **SKU Pembangunan vs Produksi**:
   - **Pembangunan**: tier asas (digunakan dalam contoh ini)
   - **Produksi**: tier Standard/Premium dengan redundansi

**Pemantauan Kos**:
- Lihat kos dalam [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Tetapkan amaran kos untuk mengelakkan kejutan
- Tandakan semua sumber dengan `azd-env-name` untuk penjejakan

**Alternatif Tier Percuma**:
Untuk tujuan pembelajaran, anda boleh ubah `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Nota**: Tier percuma ada had (CPU 60 min/hari, tiada sentiasa hidup).

## Pemantauan & Keterlihatan

### Integrasi Application Insights

Contoh ini termasuk **Application Insights** untuk pemantauan menyeluruh:

**Apa Yang Dipantau**:
- ✅ Permintaan HTTP (latensi, kod status, endpoint)
- ✅ Ralat dan pengecualian aplikasi
- ✅ Pencatatan tersuai dari aplikasi Flask
- ✅ Kesihatan sambungan pangkalan data
- ✅ Metik prestasi (CPU, memori)

**Akses Application Insights**:
1. Buka [Azure Portal](https://portal.azure.com)
2. Pergi ke kumpulan sumber anda (`rg-<env-name>`)
3. Klik pada sumber Application Insights (`appi-<unique-id>`)

**Pertanyaan Berguna** (Application Insights → Log):

**Lihat Semua Permintaan**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Cari Ralat**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Semak Endpoint Kesihatan**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Pengauditan Pangkalan Data SQL

**Pengauditan Pangkalan Data SQL dihidupkan** untuk menjejak:
- Corak akses pangkalan data
- Cubaan log masuk gagal
- Perubahan skema
- Akses data (untuk pematuhan)

**Akses Log Audit**:
1. Azure Portal → Pangkalan Data SQL → Pengauditan
2. Lihat log di workspace Log Analytics

### Pemantauan Masa Nyata

**Lihat Metik Langsung**:
1. Application Insights → Live Metrics
2. Lihat permintaan, kegagalan, dan prestasi secara masa nyata

**Tetapkan Amaran**:
Buat amaran untuk peristiwa kritikal:
- Ralat HTTP 500 > 5 dalam 5 minit
- Kegagalan sambungan pangkalan data
- Masa tindak balas tinggi (>2 saat)

**Contoh Penciptaan Amaran**:  
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```
  
## Penyelesaian Masalah

### Isu Biasa dan Penyelesaian

#### 1. `azd provision` gagal dengan "Lokasi tidak tersedia"

**Gejala**:  
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```
  
**Penyelesaian**:  
Pilih rantau Azure yang berbeza atau daftarkan pembekal sumber:  
```sh
az provider register --namespace Microsoft.Insights
```
  
#### 2. Sambungan SQL Gagal Semasa Penghasilan

**Gejala**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**Penyelesaian**:  
- Sahkan firewall SQL Server membenarkan perkhidmatan Azure (dikonfigurasikan secara automatik)  
- Periksa kata laluan pentadbir SQL dimasukkan dengan betul semasa `azd provision`  
- Pastikan SQL Server telah sepenuhnya disediakan (boleh mengambil masa 2-3 minit)

**Sahkan Sambungan**:  
```sh
# Dari Azure Portal, pergi ke SQL Database → Penyunting pertanyaan
# Cuba untuk sambung dengan kelayakan anda
```
  
#### 3. Aplikasi Web Memaparkan "Ralat Aplikasi"

**Gejala**:  
Pelayar memaparkan halaman ralat generik.

**Penyelesaian**:  
Periksa log aplikasi:  
```sh
# Lihat log terkini
az webapp log tail --name <app-name> --resource-group <rg-name>
```
  
**Sebab biasa**:  
- Variabel persekitaran hilang (periksa App Service → Configuration)  
- Pemasangan pakej Python gagal (periksa log penghasilan)  
- Ralat inisialisasi pangkalan data (periksa sambungan SQL)

#### 4. `azd deploy` Gagal dengan "Ralat Binaan"

**Gejala**:  
```
Error: Failed to build project
```
  
**Penyelesaian**:  
- Pastikan `requirements.txt` tiada kesalahan sintaksis  
- Periksa bahawa Python 3.11 dinyatakan dalam `infra/resources/web-app.bicep`  
- Sahkan Dockerfile menggunakan imej asas yang betul

**Nyahpepijat secara tempatan**:  
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```
  
#### 5. "Tidak Sah" Semasa Menjalankan Arahan AZD

**Gejala**:  
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```
  
**Penyelesaian**:  
Log masuk semula dengan Azure:  
```sh
azd auth login
az login
```
  
Sahkan anda mempunyai kebenaran yang betul (peranan Contributor) ke atas langganan.

#### 6. Kos Pangkalan Data Tinggi

**Gejala**:  
Bil Azure yang tidak dijangka.

**Penyelesaian**:  
- Periksa sama ada anda terlupa menjalankan `azd down` selepas ujian  
- Sahkan SQL Database menggunakan tier Basic (bukan Premium)  
- Semak kos dalam Pengurusan Kos Azure  
- Tetapkan amaran kos

### Mendapatkan Bantuan

**Lihat Semua Variabel Persekitaran AZD**:  
```sh
azd env get-values
```
  
**Periksa Status Penghasilan**:  
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```
  
**Akses Log Aplikasi**:  
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```
  
**Perlukan Bantuan Lebih?**  
- [Panduan Penyelesaian Masalah AZD](../../docs/chapter-07-troubleshooting/common-issues.md)  
- [Penyelesaian Masalah Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [Penyelesaian Masalah Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Latihan Praktikal

### Latihan 1: Sahkan Penghasilan Anda (Pemula)

**Matlamat**: Sahkan semua sumber telah dihasilkan dan aplikasi berfungsi.

**Langkah**:  
1. Senaraikan semua sumber dalam kumpulan sumber anda:  
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
  
  **Jangkaan**: 6-7 sumber (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Uji semua titik akhir API:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
  
  **Jangkaan**: Semua memulangkan JSON sah tanpa ralat

3. Semak Application Insights:  
   - Navigasi ke Application Insights di Azure Portal  
   - Pergi ke "Live Metrics"  
   - Segarkan pelayar anda di aplikasi web  
   **Jangkaan**: Melihat permintaan muncul secara masa nyata

**Kriteria Kejayaan**: Semua 6-7 sumber wujud, semua titik akhir memulangkan data, Live Metrics menunjukkan aktiviti.

---

### Latihan 2: Tambah Titik Akhir API Baru (Pertengahan)

**Matlamat**: Luaskan aplikasi Flask dengan titik akhir baru.

**Kod Permulaan**: Titik akhir semasa dalam `src/web/app.py`

**Langkah**:  
1. Edit `src/web/app.py` dan tambah titik akhir baru selepas fungsi `get_product()`:  
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```
  
2. Deploy aplikasi yang dikemaskini:  
   ```sh
   azd deploy
   ```
  
3. Uji titik akhir baru:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
  
  **Jangkaan**: Memulangkan produk yang sepadan dengan "laptop"

**Kriteria Kejayaan**: Titik akhir baru berfungsi, memulangkan keputusan terpilih, muncul dalam log Application Insights.

---

### Latihan 3: Tambah Pemantauan dan Amaran (Lanjutan)

**Matlamat**: Sediakan pemantauan proaktif dengan amaran.

**Langkah**:  
1. Buat amaran untuk ralat HTTP 500:  
   ```sh
   # Dapatkan ID sumber Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Cipta amaran
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```
  
2. Picu amaran dengan menyebabkan ralat:  
   ```sh
   # Meminta produk yang tidak wujud
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```
  
3. Periksa jika amaran dipicu:  
   - Azure Portal → Alerts → Alert Rules  
   - Periksa emel anda (jika dikonfigurasikan)

**Kriteria Kejayaan**: Peraturan amaran dibuat, mencetus apabila ada ralat, pemberitahuan diterima.

---

### Latihan 4: Perubahan Skema Pangkalan Data (Lanjutan)

**Matlamat**: Tambah jadual baru dan ubah aplikasi untuk menggunakannya.

**Langkah**:  
1. Sambung ke SQL Database melalui Editor Pertanyaan di Azure Portal

2. Cipta jadual `categories` baru:  
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```
  
3. Kemas kini `src/web/app.py` untuk memasukkan maklumat kategori dalam respons

4. Deploy dan uji

**Kriteria Kejayaan**: Jadual baru wujud, produk menunjukkan maklumat kategori, aplikasi masih berfungsi.

---

### Latihan 5: Laksanakan Penampanan (Pakar)

**Matlamat**: Tambah Azure Redis Cache untuk meningkatkan prestasi.

**Langkah**:  
1. Tambah Redis Cache ke `infra/main.bicep`  
2. Kemas kini `src/web/app.py` untuk menampan pertanyaan produk  
3. Ukur peningkatan prestasi dengan Application Insights  
4. Bandingkan masa tindak balas sebelum/selepas penampanan

**Kriteria Kejayaan**: Redis telah dideploy, penampanan berfungsi, masa tindak balas bertambah baik >50%.

**Petua**: Mulakan dengan [dokumentasi Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Pembersihan

Untuk mengelakkan caj berterusan, padam semua sumber selepas selesai:

```sh
azd down
```
  
**Promp pengesahan**:  
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```
  
Taip `y` untuk mengesahkan.

**✓ Semakan Kejayaan**:  
- Semua sumber dipadam dari Azure Portal  
- Tiada caj berlanjutan  
- Folder tempatan `.azure/<env-name>` boleh dipadam

**Alternatif** (simpan infrastruktur, padam data):  
```sh
# Padam hanya kumpulan sumber (simpan konfigurasi AZD)
az group delete --name rg-<env-name> --yes
```
  
## Ketahui Lebih Lanjut

### Dokumentasi Berkaitan  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Dokumentasi Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)  
- [Dokumentasi Azure App Service](https://learn.microsoft.com/azure/app-service/)  
- [Dokumentasi Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)  
- [Rujukan Bahasa Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Langkah Seterusnya dalam Kursus Ini  
- **[Contoh Container Apps](../../../../examples/container-app)**: Deploy mikroservis dengan Azure Container Apps  
- **[Panduan Integrasi AI](../../../../docs/ai-foundry)**: Tambah kebolehan AI ke aplikasi anda  
- **[Amalan Terbaik Penghasilan](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Corak penghasilan ke pengeluaran

### Topik Lanjutan  
- **Identiti Terurus**: Buang kata laluan dan gunakan pengesahan Azure AD  
- **Private Endpoints**: Amankan sambungan pangkalan data dalam rangkaian maya  
- **Integrasi CI/CD**: Automatikkan penghasilan dengan GitHub Actions atau Azure DevOps  
- **Multi-Persekitaran**: Sediakan persekitaran pembangunan, ujian, dan pengeluaran  
- **Migrasi Pangkalan Data**: Gunakan Alembic atau Entity Framework untuk versi skema

### Perbandingan dengan Pendekatan Lain

**AZD vs. Templat ARM**:  
- ✅ AZD: Abstraksi peringkat tinggi, arahan mudah  
- ⚠️ ARM: Lebih panjang, kawalan terperinci

**AZD vs. Terraform**:  
- ✅ AZD: Natip Azure, integrasi dengan perkhidmatan Azure  
- ⚠️ Terraform: Sokongan pelbagai awan, ekosistem besar

**AZD vs. Portal Azure**:  
- ✅ AZD: Boleh diulang, dikawal versi, automatik  
- ⚠️ Portal: Klik manual, sukar untuk diulang

**Fikirkan AZD sebagai**: Docker Compose untuk Azure—konfigurasi mudah untuk penghasilan kompleks.

---

## Soalan Lazim

**S: Bolehkah saya menggunakan bahasa pengaturcaraan lain?**  
J: Ya! Gantikan `src/web/` dengan Node.js, C#, Go, atau mana-mana bahasa. Kemaskini `azure.yaml` dan Bicep mengikut.

**S: Bagaimana saya tambah lebih pangkalan data?**  
J: Tambah modul SQL Database lain dalam `infra/main.bicep` atau gunakan PostgreSQL/MySQL dari perkhidmatan Azure Database.

**S: Bolehkah saya gunakan ini untuk produksi?**  
J: Ini titik permulaan. Untuk produksi, tambah: identiti terurus, private endpoints, redundansi, strategi sandaran, WAF, dan pemantauan lebih baik.

**S: Apa jika saya mahu guna kontena dan bukan deploy kod?**  
J: Lihat [Contoh Container Apps](../../../../examples/container-app) yang menggunakan Docker kontena sepenuhnya.

**S: Bagaimana saya sambung ke pangkalan data dari mesin tempatan saya?**  
J: Tambah IP anda ke firewall SQL Server:  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```
  
**S: Bolehkah saya guna pangkalan data sedia ada dan tidak cipta baru?**  
J: Ya, ubah `infra/main.bicep` untuk refer SQL Server sedia ada dan kemaskini parameter string sambungan.

---

> **Nota:** Contoh ini menunjukkan amalan terbaik untuk menghasil aplikasi web dengan pangkalan data menggunakan AZD. Ia merangkumi kod berfungsi, dokumentasi lengkap, dan latihan praktikal untuk memperkukuh pembelajaran. Untuk penghasilan produksi, semak keselamatan, penskalaan, pematuhan, dan keperluan kos khusus organisasi anda.

**📚 Navigasi Kursus:**  
- ← Sebelum: [Contoh Container Apps](../../../../examples/container-app)  
- → Seterusnya: [Panduan Integrasi AI](../../../../docs/ai-foundry)  
- 🏠 [Rumah Kursus](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->