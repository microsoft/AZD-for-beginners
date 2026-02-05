# Melancarkan Pangkalan Data Microsoft SQL dan Aplikasi Web dengan AZD

⏱️ **Anggaran Masa**: 20-30 minit | 💰 **Anggaran Kos**: ~$15-25/bulan | ⭐ **Tahap Kesukaran**: Pertengahan

Contoh **lengkap dan berfungsi** ini menunjukkan cara menggunakan [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) untuk melancarkan aplikasi web Python Flask dengan Pangkalan Data Microsoft SQL ke Azure. Semua kod disertakan dan diuji—tiada kebergantungan luaran diperlukan.

## Apa yang Anda Akan Pelajari

Dengan melengkapkan contoh ini, anda akan:
- Melancarkan aplikasi berlapis (aplikasi web + pangkalan data) menggunakan infrastruktur sebagai kod
- Mengkonfigurasi sambungan pangkalan data yang selamat tanpa menyimpan rahsia dalam kod
- Memantau kesihatan aplikasi dengan Application Insights
- Mengurus sumber Azure dengan cekap menggunakan AZD CLI
- Mengikuti amalan terbaik Azure untuk keselamatan, pengoptimuman kos, dan pemerhatian

## Gambaran Senario
- **Aplikasi Web**: REST API Python Flask dengan sambungan pangkalan data
- **Pangkalan Data**: Azure SQL Database dengan data sampel
- **Infrastruktur**: Disediakan menggunakan Bicep (templat modular, boleh guna semula)
- **Pelancaran**: Automatik sepenuhnya dengan arahan `azd`
- **Pemantauan**: Application Insights untuk log dan telemetri

## Prasyarat

### Alat Diperlukan

Sebelum memulakan, pastikan anda telah memasang alat berikut:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versi 2.50.0 atau lebih tinggi)
   ```sh
   az --version
   # Output yang dijangka: azure-cli 2.50.0 atau lebih tinggi
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versi 1.0.0 atau lebih tinggi)
   ```sh
   azd version
   # Output yang dijangka: azd versi 1.0.0 atau lebih tinggi
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (untuk pembangunan tempatan)
   ```sh
   python --version
   # Output yang dijangka: Python 3.8 atau lebih tinggi
   ```

4. **[Docker](https://www.docker.com/get-started)** (pilihan, untuk pembangunan kontena tempatan)
   ```sh
   docker --version
   # Output yang dijangka: Versi Docker 20.10 atau lebih tinggi
   ```

### Keperluan Azure

- Langganan **Azure** yang aktif ([buat akaun percuma](https://azure.microsoft.com/free/))
- Kebenaran untuk mencipta sumber dalam langganan anda
- Peranan **Owner** atau **Contributor** pada langganan atau kumpulan sumber

### Pengetahuan Diperlukan

Ini adalah contoh **tahap pertengahan**. Anda seharusnya biasa dengan:
- Operasi asas baris perintah
- Konsep awan asas (sumber, kumpulan sumber)
- Pemahaman asas tentang aplikasi web dan pangkalan data

**Baru dengan AZD?** Mulakan dengan [panduan Memulakan](../../docs/getting-started/azd-basics.md) terlebih dahulu.

## Seni Bina

Contoh ini melancarkan seni bina dua lapisan dengan aplikasi web dan pangkalan data SQL:

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
- **Kumpulan Sumber**: Kontena untuk semua sumber
- **Pelan Perkhidmatan Aplikasi**: Hosting berasaskan Linux (tier B1 untuk kecekapan kos)
- **Aplikasi Web**: Python 3.11 runtime dengan aplikasi Flask
- **Pelayan SQL**: Pelayan pangkalan data terurus dengan minimum TLS 1.2
- **Pangkalan Data SQL**: Tier asas (2GB, sesuai untuk pembangunan/ujian)
- **Application Insights**: Pemantauan dan log
- **Log Analytics Workspace**: Penyimpanan log terpusat

**Analogi**: Anggap ini seperti restoran (aplikasi web) dengan peti sejuk beku (pangkalan data). Pelanggan memesan dari menu (endpoint API), dan dapur (aplikasi Flask) mengambil bahan (data) dari peti sejuk beku. Pengurus restoran (Application Insights) menjejaki semua yang berlaku.

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

**Apa Fungsi Setiap Fail:**
- **azure.yaml**: Memberitahu AZD apa yang perlu dilancarkan dan di mana
- **infra/main.bicep**: Mengatur semua sumber Azure
- **infra/resources/*.bicep**: Definisi sumber individu (modular untuk kegunaan semula)
- **src/web/app.py**: Aplikasi Flask dengan logik pangkalan data
- **requirements.txt**: Kebergantungan pakej Python
- **Dockerfile**: Arahan kontena untuk pelancaran

## Panduan Pantas (Langkah demi Langkah)

### Langkah 1: Klon dan Navigasi

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Semakan Berjaya**: Pastikan anda melihat `azure.yaml` dan folder `infra/`:
```sh
ls
# Dijangka: README.md, azure.yaml, infra/, src/
```

### Langkah 2: Sahkan dengan Azure

```sh
azd auth login
```

Ini akan membuka pelayar anda untuk pengesahan Azure. Log masuk dengan kelayakan Azure anda.

**✓ Semakan Berjaya**: Anda sepatutnya melihat:
```
Logged in to Azure.
```

### Langkah 3: Inisialisasi Persekitaran

```sh
azd init
```

**Apa yang berlaku**: AZD mencipta konfigurasi tempatan untuk pelancaran anda.

**Prom yang akan anda lihat**:
- **Nama persekitaran**: Masukkan nama pendek (contoh, `dev`, `myapp`)
- **Langganan Azure**: Pilih langganan anda dari senarai
- **Lokasi Azure**: Pilih rantau (contoh, `eastus`, `westeurope`)

**✓ Semakan Berjaya**: Anda sepatutnya melihat:
```
SUCCESS: New project initialized!
```

### Langkah 4: Sediakan Sumber Azure

```sh
azd provision
```

**Apa yang berlaku**: AZD melancarkan semua infrastruktur (mengambil masa 5-8 minit):
1. Mencipta kumpulan sumber
2. Mencipta Pelayan SQL dan Pangkalan Data
3. Mencipta Pelan Perkhidmatan Aplikasi
4. Mencipta Aplikasi Web
5. Mencipta Application Insights
6. Mengkonfigurasi rangkaian dan keselamatan

**Anda akan diminta untuk**:
- **Nama pengguna admin SQL**: Masukkan nama pengguna (contoh, `sqladmin`)
- **Kata laluan admin SQL**: Masukkan kata laluan yang kuat (simpan ini!)

**✓ Semakan Berjaya**: Anda sepatutnya melihat:
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
2. Membina kontena Docker
3. Menolak ke Aplikasi Web Azure
4. Memulakan pangkalan data dengan data sampel
5. Memulakan aplikasi

**✓ Semakan Berjaya**: Anda sepatutnya melihat:
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

Ini akan membuka aplikasi web anda yang dilancarkan dalam pelayar di `https://app-<unique-id>.azurewebsites.net`

**✓ Semakan Berjaya**: Anda sepatutnya melihat output JSON:
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

**Semakan Kesihatan** (sahkan sambungan pangkalan data):
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

**Senarai Produk** (data sampel):
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

**✓ Semakan Berjaya**: Semua endpoint mengembalikan data JSON tanpa ralat.

---

**🎉 Tahniah!** Anda telah berjaya melancarkan aplikasi web dengan pangkalan data ke Azure menggunakan AZD.

## Penjelasan Konfigurasi

### Pembolehubah Persekitaran

Rahsia diuruskan dengan selamat melalui konfigurasi Azure App Service—**tidak pernah disimpan dalam kod sumber**.

**Dikonfigurasi Secara Automatik oleh AZD**:
- `SQL_CONNECTION_STRING`: Sambungan pangkalan data dengan kelayakan yang disulitkan
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint telemetri pemantauan
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Membolehkan pemasangan kebergantungan automatik

**Di Mana Rahsia Disimpan**:
1. Semasa `azd provision`, anda memberikan kelayakan SQL melalui prom selamat
2. AZD menyimpannya dalam fail `.azure/<env-name>/.env` tempatan anda (diabaikan oleh git)
3. AZD menyuntikkannya ke dalam konfigurasi Azure App Service (disulitkan semasa rehat)
4. Aplikasi membacanya melalui `os.getenv()` semasa runtime

### Pembangunan Tempatan

Untuk ujian tempatan, cipta fail `.env` dari sampel:

```sh
cp .env.sample .env
# Edit .env dengan sambungan pangkalan data tempatan anda
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
# Dijangka: {"status": "sihat", "pangkalan data": "bersambung"}
```

### Infrastruktur sebagai Kod

Semua sumber Azure ditakrifkan dalam **templat Bicep** (folder `infra/`):

- **Reka Bentuk Modular**: Setiap jenis sumber mempunyai fail sendiri untuk kegunaan semula
- **Berparameter**: Sesuaikan SKU, rantau, konvensyen penamaan
- **Amalan Terbaik**: Mengikuti piawaian penamaan Azure dan lalai keselamatan
- **Dikawal Versi**: Perubahan infrastruktur dijejaki dalam Git

**Contoh Penyesuaian**:
Untuk menukar tier pangkalan data, edit `infra/resources/sql-database.bicep`:
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
- ✅ Rahsia dihantar melalui parameter selamat semasa penyediaan

### 2. **Sambungan Disulitkan**
- ✅ Minimum TLS 1.2 untuk Pelayan SQL
- ✅ HTTPS sahaja dikuatkuasakan untuk Aplikasi Web
- ✅ Sambungan pangkalan data menggunakan saluran disulitkan

### 3. **Keselamatan Rangkaian**
- ✅ Firewall Pelayan SQL dikonfigurasi untuk membenarkan perkhidmatan Azure sahaja
- ✅ Akses rangkaian awam dihadkan (boleh dikunci lebih lanjut dengan Private Endpoints)
- ✅ FTPS dilumpuhkan pada Aplikasi Web

### 4. **Pengesahan & Kebenaran**
- ⚠️ **Semasa**: Pengesahan SQL (nama pengguna/kata laluan)
- ✅ **Cadangan Pengeluaran**: Gunakan Azure Managed Identity untuk pengesahan tanpa kata laluan

**Untuk Naik Taraf ke Managed Identity** (untuk pengeluaran):
1. Dayakan managed identity pada Aplikasi Web
2. Berikan kebenaran SQL kepada identiti
3. Kemas kini string sambungan untuk menggunakan managed identity
4. Alihkan pengesahan berasaskan kata laluan

### 5. **Audit & Pematuhan**
- ✅ Application Insights merekodkan semua permintaan dan ralat
- ✅ Audit Pangkalan Data SQL diaktifkan (boleh dikonfigurasi untuk pematuhan)
- ✅ Semua sumber ditandakan untuk tadbir urus

**Senarai Semak Keselamatan Sebelum Pengeluaran**:
- [ ] Aktifkan Azure Defender untuk SQL
- [ ] Konfigurasikan Private Endpoints untuk Pangkalan Data SQL
- [ ] Aktifkan Web Application Firewall (WAF)
- [ ] Laksanakan Azure Key Vault untuk putaran rahsia
- [ ] Konfigurasikan pengesahan Azure AD
- [ ] Aktifkan log diagnostik untuk semua sumber

## Pengoptimuman Kos

**Anggaran Kos Bulanan** (sehingga November 2025):

| Sumber | SKU/Tier | Anggaran Kos |
|--------|----------|--------------|
| Pelan Perkhidmatan Aplikasi | B1 (Asas) | ~$13/bulan |
| Pangkalan Data SQL | Asas (2GB) | ~$5/bulan |
| Application Insights | Bayar mengikut penggunaan | ~$2/bulan (trafik rendah) |
| **Jumlah** | | **~$20/bulan** |

**💡 Petua Penjimatan Kos**:

1. **Gunakan Tier Percuma untuk Pembelajaran**:
   - App Service: Tier F1 (percuma, jam terhad)
   - SQL Database: Gunakan Azure SQL Database serverless
   - Application Insights: 5GB/bulan pengambilan percuma

2. **Hentikan Sumber Apabila Tidak Digunakan**:
   ```sh
   # Hentikan aplikasi web (pangkalan data masih dikenakan caj)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Mulakan semula apabila diperlukan
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Padamkan Semua Selepas Ujian**:
   ```sh
   azd down
   ```
   Ini akan menghapuskan SEMUA sumber dan menghentikan caj.

4. **SKU Pembangunan vs. Pengeluaran**:
   - **Pembangunan**: Tier asas (digunakan dalam contoh ini)
   - **Pengeluaran**: Tier Standard/Premium dengan redundansi

**Pemantauan Kos**:
- Lihat kos di [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Tetapkan amaran kos untuk mengelakkan kejutan
- Tandakan semua sumber dengan `azd-env-name` untuk penjejakan

**Alternatif Tier Percuma**:
Untuk tujuan pembelajaran, anda boleh mengubah `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Nota**: Tier percuma mempunyai had (60 minit/hari CPU, tiada always-on).

## Pemantauan & Pemerhatian

### Integrasi Application Insights

Contoh ini termasuk **Application Insights** untuk pemantauan menyeluruh:

**Apa yang Dipantau**:
- ✅ Permintaan HTTP (latensi, kod status, endpoint)
- ✅ Ralat aplikasi dan pengecualian
- ✅ Log tersuai dari aplikasi Flask
- ✅ Kesihatan sambungan pangkalan data
- ✅ Metrik prestasi (CPU, memori)

**Akses Application Insights**:
1. Buka [Azure Portal](https://portal.azure.com)
2. Navigasi ke kumpulan sumber anda (`rg-<env-name>`)
3. Klik pada sumber Application Insights (`appi-<unique-id>`)

**Pertanyaan Berguna** (Application Insights → Logs):

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

### Audit Pangkalan Data SQL

**Audit Pangkalan Data SQL diaktifkan** untuk menjejaki:
- Corak akses pangkalan data
- Percubaan log masuk yang gagal
- Perubahan skema
- Akses data (untuk pematuhan)

**Akses Log Audit**:
1. Azure Portal → Pangkalan Data SQL → Auditing
2. Lihat log di Log Analytics workspace

### Pemantauan Masa Nyata

**Lihat Metrik Langsung**:
1. Application Insights → Live Metrics
2. Lihat permintaan, kegagalan, dan prestasi secara masa nyata

**Tetapkan Amaran**:
Cipta amaran untuk acara kritikal:
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

**Simptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Penyelesaian**:
Pilih rantau Azure yang lain atau daftar penyedia sumber:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Sambungan SQL Gagal Semasa Penerapan

**Simptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Penyelesaian**:
- Pastikan firewall SQL Server membenarkan perkhidmatan Azure (dikonfigurasi secara automatik)
- Semak kata laluan admin SQL dimasukkan dengan betul semasa `azd provision`
- Pastikan SQL Server telah disediakan sepenuhnya (boleh mengambil masa 2-3 minit)

**Sahkan Sambungan**:
```sh
# Dari Portal Azure, pergi ke Pangkalan Data SQL → Penyunting pertanyaan
# Cuba sambung dengan kelayakan anda
```

#### 3. Aplikasi Web Menunjukkan "Ralat Aplikasi"

**Simptom**:
Pelayar menunjukkan halaman ralat generik.

**Penyelesaian**:
Semak log aplikasi:
```sh
# Lihat log terkini
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Punca biasa**:
- Pembolehubah persekitaran hilang (semak App Service → Configuration)
- Pemasangan pakej Python gagal (semak log penerapan)
- Ralat inisialisasi pangkalan data (semak sambungan SQL)

#### 4. `azd deploy` Gagal dengan "Ralat Binaan"

**Simptom**:
```
Error: Failed to build project
```

**Penyelesaian**:
- Pastikan `requirements.txt` tiada ralat sintaks
- Semak Python 3.11 dinyatakan dalam `infra/resources/web-app.bicep`
- Sahkan Dockerfile mempunyai imej asas yang betul

**Debug secara tempatan**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Tidak Dibenarkan" Semasa Menjalankan Perintah AZD

**Simptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Penyelesaian**:
Autentikasi semula dengan Azure:
```sh
azd auth login
az login
```

Sahkan anda mempunyai kebenaran yang betul (peranan Contributor) pada langganan.

#### 6. Kos Pangkalan Data Tinggi

**Simptom**:
Bil Azure yang tidak dijangka.

**Penyelesaian**:
- Semak jika anda terlupa menjalankan `azd down` selepas ujian
- Pastikan Pangkalan Data SQL menggunakan tier Basic (bukan Premium)
- Semak kos dalam Pengurusan Kos Azure
- Tetapkan amaran kos

### Mendapatkan Bantuan

**Lihat Semua Pembolehubah Persekitaran AZD**:
```sh
azd env get-values
```

**Semak Status Penerapan**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Akses Log Aplikasi**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Perlukan Lebih Banyak Bantuan?**
- [Panduan Penyelesaian Masalah AZD](../../docs/troubleshooting/common-issues.md)
- [Penyelesaian Masalah Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Penyelesaian Masalah Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Latihan Praktikal

### Latihan 1: Sahkan Penerapan Anda (Pemula)

**Matlamat**: Sahkan semua sumber telah diterapkan dan aplikasi berfungsi.

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
   **Jangkaan**: Semua mengembalikan JSON yang sah tanpa ralat

3. Semak Application Insights:
   - Navigasi ke Application Insights dalam Portal Azure
   - Pergi ke "Live Metrics"
   - Segarkan pelayar anda pada aplikasi web
   **Jangkaan**: Lihat permintaan muncul secara masa nyata

**Kriteria Kejayaan**: Semua 6-7 sumber wujud, semua titik akhir mengembalikan data, Live Metrics menunjukkan aktiviti.

---

### Latihan 2: Tambah Titik Akhir API Baru (Pertengahan)

**Matlamat**: Kembangkan aplikasi Flask dengan titik akhir baru.

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

2. Terapkan aplikasi yang dikemas kini:
   ```sh
   azd deploy
   ```

3. Uji titik akhir baru:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Jangkaan**: Mengembalikan produk yang sepadan dengan "laptop"

**Kriteria Kejayaan**: Titik akhir baru berfungsi, mengembalikan hasil yang ditapis, muncul dalam log Application Insights.

---

### Latihan 3: Tambah Pemantauan dan Amaran (Lanjutan)

**Matlamat**: Tetapkan pemantauan proaktif dengan amaran.

**Langkah**:
1. Cipta amaran untuk ralat HTTP 500:
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

2. Cetuskan amaran dengan menyebabkan ralat:
   ```sh
   # Meminta produk yang tidak wujud
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Semak jika amaran dicetuskan:
   - Portal Azure → Alerts → Alert Rules
   - Semak e-mel anda (jika dikonfigurasi)

**Kriteria Kejayaan**: Peraturan amaran dicipta, dicetuskan pada ralat, pemberitahuan diterima.

---

### Latihan 4: Perubahan Skema Pangkalan Data (Lanjutan)

**Matlamat**: Tambah jadual baru dan ubah aplikasi untuk menggunakannya.

**Langkah**:
1. Sambung ke Pangkalan Data SQL melalui Editor Pertanyaan Portal Azure

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

4. Terapkan dan uji

**Kriteria Kejayaan**: Jadual baru wujud, produk menunjukkan maklumat kategori, aplikasi masih berfungsi.

---

### Latihan 5: Laksanakan Caching (Pakar)

**Matlamat**: Tambah Azure Redis Cache untuk meningkatkan prestasi.

**Langkah**:
1. Tambah Redis Cache ke `infra/main.bicep`
2. Kemas kini `src/web/app.py` untuk cache pertanyaan produk
3. Ukur peningkatan prestasi dengan Application Insights
4. Bandingkan masa tindak balas sebelum/selepas caching

**Kriteria Kejayaan**: Redis diterapkan, caching berfungsi, masa tindak balas meningkat >50%.

**Petunjuk**: Mulakan dengan [dokumentasi Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Pembersihan

Untuk mengelakkan caj berterusan, padamkan semua sumber apabila selesai:

```sh
azd down
```

**Prompt pengesahan**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Taip `y` untuk mengesahkan.

**✓ Semakan Kejayaan**: 
- Semua sumber dipadamkan dari Portal Azure
- Tiada caj berterusan
- Folder `.azure/<env-name>` tempatan boleh dipadamkan

**Alternatif** (simpan infrastruktur, padamkan data):
```sh
# Padam hanya kumpulan sumber (simpan konfigurasi AZD)
az group delete --name rg-<env-name> --yes
```
## Ketahui Lebih Lanjut

### Dokumentasi Berkaitan
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Pangkalan Data Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/)
- [Dokumentasi Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Dokumentasi Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Rujukan Bahasa Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Langkah Seterusnya dalam Kursus Ini
- **[Contoh Aplikasi Kontena](../../../../examples/container-app)**: Terapkan mikroservis dengan Azure Container Apps
- **[Panduan Integrasi AI](../../../../docs/ai-foundry)**: Tambah keupayaan AI pada aplikasi anda
- **[Amalan Terbaik Penerapan](../../docs/deployment/deployment-guide.md)**: Corak penerapan untuk produksi

### Topik Lanjutan
- **Managed Identity**: Hapuskan kata laluan dan gunakan pengesahan Azure AD
- **Private Endpoints**: Amankan sambungan pangkalan data dalam rangkaian maya
- **Integrasi CI/CD**: Automasi penerapan dengan GitHub Actions atau Azure DevOps
- **Multi-Environment**: Tetapkan persekitaran dev, staging, dan produksi
- **Migrasi Pangkalan Data**: Gunakan Alembic atau Entity Framework untuk versi skema

### Perbandingan dengan Pendekatan Lain

**AZD vs. ARM Templates**:
- ✅ AZD: Abstraksi tahap tinggi, perintah lebih ringkas
- ⚠️ ARM: Lebih verbose, kawalan granular

**AZD vs. Terraform**:
- ✅ AZD: Native Azure, terintegrasi dengan perkhidmatan Azure
- ⚠️ Terraform: Sokongan multi-cloud, ekosistem lebih besar

**AZD vs. Azure Portal**:
- ✅ AZD: Boleh diulang, dikawal versi, automatik
- ⚠️ Portal: Klik manual, sukar untuk diulang

**Anggap AZD sebagai**: Docker Compose untuk Azure—konfigurasi dipermudahkan untuk penerapan kompleks.

---

## Soalan Lazim

**S: Bolehkah saya menggunakan bahasa pengaturcaraan lain?**  
J: Ya! Gantikan `src/web/` dengan Node.js, C#, Go, atau mana-mana bahasa. Kemas kini `azure.yaml` dan Bicep mengikut keperluan.

**S: Bagaimana saya menambah lebih banyak pangkalan data?**  
J: Tambah modul Pangkalan Data SQL lain dalam `infra/main.bicep` atau gunakan PostgreSQL/MySQL dari perkhidmatan Pangkalan Data Azure.

**S: Bolehkah saya menggunakan ini untuk produksi?**  
J: Ini adalah titik permulaan. Untuk produksi, tambah: managed identity, private endpoints, redundansi, strategi sandaran, WAF, dan pemantauan yang dipertingkatkan.

**S: Bagaimana jika saya mahu menggunakan kontena dan bukannya penerapan kod?**  
J: Lihat [Contoh Aplikasi Kontena](../../../../examples/container-app) yang menggunakan kontena Docker sepenuhnya.

**S: Bagaimana saya menyambung ke pangkalan data dari mesin tempatan saya?**  
J: Tambah IP anda ke firewall SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**S: Bolehkah saya menggunakan pangkalan data sedia ada dan bukannya mencipta yang baru?**  
J: Ya, ubah `infra/main.bicep` untuk merujuk kepada SQL Server sedia ada dan kemas kini parameter rentetan sambungan.

---

> **Nota:** Contoh ini menunjukkan amalan terbaik untuk menerapkan aplikasi web dengan pangkalan data menggunakan AZD. Ia termasuk kod kerja, dokumentasi komprehensif, dan latihan praktikal untuk memperkukuh pembelajaran. Untuk penerapan produksi, semak keperluan keselamatan, penskalaan, pematuhan, dan kos yang khusus untuk organisasi anda.

**📚 Navigasi Kursus:**
- ← Sebelumnya: [Contoh Aplikasi Kontena](../../../../examples/container-app)
- → Seterusnya: [Panduan Integrasi AI](../../../../docs/ai-foundry)
- 🏠 [Halaman Utama Kursus](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->