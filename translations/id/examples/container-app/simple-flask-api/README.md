# Simple Flask API - Contoh Aplikasi Kontainer

**Jalur Pembelajaran:** Pemula ⭐ | **Waktu:** 25-35 menit | **Biaya:** $0-15/bulan

Aplikasi Python Flask REST API yang lengkap dan berfungsi yang dideploy ke Azure Container Apps menggunakan Azure Developer CLI (azd). Contoh ini menunjukkan penerapan kontainer, auto-scaling, dan dasar-dasar pemantauan.

## 🎯 Apa yang Akan Anda Pelajari

- Mendeploy aplikasi Python yang dikontainerkan ke Azure
- Mengonfigurasi auto-scaling dengan scale-to-zero
- Menerapkan health probes dan readiness checks
- Memantau log dan metrik aplikasi
- Menggunakan Azure Developer CLI untuk deployment cepat

## 📦 Apa yang Disertakan

✅ **Flask Application** - REST API lengkap dengan operasi CRUD (`src/app.py`)  
✅ **Dockerfile** - Konfigurasi kontainer siap produksi  
✅ **Bicep Infrastructure** - Lingkungan Container Apps dan penerapan API  
✅ **AZD Configuration** - Pengaturan penerapan dengan satu perintah  
✅ **Health Probes** - Pemeriksaan liveness dan readiness dikonfigurasi  
✅ **Auto-scaling** - 0-10 replika berdasarkan beban HTTP  

## Architecture

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Persyaratan

### Diperlukan
- **Azure Developer CLI (azd)** - [Panduan instalasi](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Akun gratis](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instal Docker](https://www.docker.com/products/docker-desktop/) (untuk pengujian lokal)

### Verifikasi Persyaratan

```bash
# Periksa versi azd (membutuhkan 1.5.0 atau lebih tinggi)
azd version

# Verifikasi login Azure
azd auth login

# Periksa Docker (opsional, untuk pengujian lokal)
docker --version
```

## ⏱️ Garis Waktu Penerapan

| Tahap | Durasi | Apa yang Terjadi |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Mulai Cepat

```bash
# Buka contoh
cd examples/container-app/simple-flask-api

# Inisialisasi lingkungan (pilih nama unik)
azd env new myflaskapi

# Deploy semuanya (infrastruktur + aplikasi)
azd up
# Anda akan diminta untuk:
# 1. Pilih langganan Azure
# 2. Pilih lokasi (misalnya, eastus2)
# 3. Tunggu 8-12 menit untuk penyebaran

# Dapatkan endpoint API Anda
azd env get-values

# Uji API
curl $(azd env get-value API_ENDPOINT)/health
```

**Output yang Diharapkan:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verifikasi Penerapan

### Langkah 1: Periksa Status Penerapan

```bash
# Lihat layanan yang dideploy
azd show

# Keluaran yang diharapkan menunjukkan:
# - Layanan: api
# - Titik akhir: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Berjalan
```

### Langkah 2: Uji Endpoint API

```bash
# Dapatkan endpoint API
API_URL=$(azd env get-value API_ENDPOINT)

# Uji kesehatan
curl $API_URL/health

# Uji endpoint root
curl $API_URL/

# Buat sebuah item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Dapatkan semua item
curl $API_URL/api/items
```

**Kriteria Keberhasilan:**
- ✅ Endpoint kesehatan mengembalikan HTTP 200
- ✅ Endpoint root menampilkan informasi API
- ✅ POST membuat item dan mengembalikan HTTP 201
- ✅ GET mengembalikan item yang dibuat

### Langkah 3: Lihat Log

```bash
# Alirkan log langsung menggunakan azd monitor
azd monitor --logs

# Atau gunakan Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Anda akan melihat:
# - Pesan startup Gunicorn
# - Log permintaan HTTP
# - Log informasi aplikasi
```

## Struktur Proyek

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Endpoint API

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Pemeriksaan kesehatan |
| `/api/items` | GET | Daftar semua item |
| `/api/items` | POST | Buat item baru |
| `/api/items/{id}` | GET | Dapatkan item tertentu |
| `/api/items/{id}` | PUT | Perbarui item |
| `/api/items/{id}` | DELETE | Hapus item |

## Konfigurasi

### Variabel Lingkungan

```bash
# Tetapkan konfigurasi khusus
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfigurasi Penskalaan

API secara otomatis menskalakan berdasarkan lalu lintas HTTP:
- **Replika Minimum**: 0 (menskalakan ke nol saat tidak aktif)
- **Replika Maksimum**: 10
- **Permintaan Bersamaan per Replika**: 50

## Pengembangan

### Jalankan Secara Lokal

```bash
# Instal dependensi
cd src
pip install -r requirements.txt

# Jalankan aplikasi
python app.py

# Uji secara lokal
curl http://localhost:8000/health
```

### Bangun dan Uji Kontainer

```bash
# Bangun image Docker
docker build -t flask-api:local ./src

# Jalankan kontainer secara lokal
docker run -p 8000:8000 flask-api:local

# Uji kontainer
curl http://localhost:8000/health
```

## Penerapan

### Penerapan Lengkap

```bash
# Terapkan infrastruktur dan aplikasi
azd up
```

### Penerapan Hanya Kode

```bash
# Sebarkan hanya kode aplikasi (infrastruktur tidak berubah)
azd deploy api
```

### Perbarui Konfigurasi

```bash
# Perbarui variabel lingkungan
azd env set API_KEY "new-api-key"

# Terapkan ulang dengan konfigurasi baru
azd deploy api
```

## Pemantauan

### Lihat Log

```bash
# Alirkan log secara langsung menggunakan azd monitor
azd monitor --logs

# Atau gunakan Azure CLI untuk Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Lihat 100 baris terakhir
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Pantau Metrik

```bash
# Buka dasbor Azure Monitor
azd monitor --overview

# Lihat metrik tertentu
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Pengujian

### Pemeriksaan Kesehatan

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Respons yang diharapkan:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Buat Item

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Dapatkan Semua Item

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimisasi Biaya

Penerapan ini menggunakan scale-to-zero, sehingga Anda hanya membayar saat API memproses permintaan:

- **Biaya saat tidak aktif**: ~ $0/bulan (diskalakan ke nol)
- **Biaya aktif**: ~ $0.000024/detik per replika
- **Perkiraan biaya bulanan** (penggunaan ringan): $5-15

### Kurangi Biaya Lebih Lanjut

```bash
# Kurangi jumlah maksimum replika untuk pengembangan
azd env set MAX_REPLICAS 3

# Gunakan waktu tunggu idle yang lebih pendek
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 menit
```

## Pemecahan Masalah

### Kontainer Tidak Mulai

```bash
# Periksa log kontainer menggunakan Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Verifikasi pembuatan image Docker secara lokal
docker build -t test ./src
```

### API Tidak Dapat Diakses

```bash
# Verifikasi bahwa ingress bersifat eksternal
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Waktu Respon Tinggi

```bash
# Periksa penggunaan CPU dan memori
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Tingkatkan sumber daya jika diperlukan
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Bersihkan

```bash
# Hapus semua sumber daya
azd down --force --purge
```

## Langkah Selanjutnya

### Perluas Contoh Ini

1. **Tambahkan Database** - Integrasikan Azure Cosmos DB atau SQL Database
   ```bash
   # Tambahkan modul Cosmos DB ke infra/main.bicep
   # Perbarui app.py dengan koneksi database
   ```

2. **Tambahkan Autentikasi** - Terapkan Azure AD atau kunci API
   ```python
   # Tambahkan middleware autentikasi ke app.py
   from functools import wraps
   ```

3. **Atur CI/CD** - alur kerja GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Tambahkan Managed Identity** - Amankan akses ke layanan Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Contoh Terkait

- **[Database App](../../../../../examples/database-app)** - Contoh lengkap dengan SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Arsitektur multi-layanan
- **[Container Apps Master Guide](../README.md)** - Semua pola kontainer

### Sumber Belajar

- 📚 [AZD For Beginners Course](../../../README.md) - Halaman utama kursus
- 📚 [Container Apps Patterns](../README.md) - Lebih banyak pola penerapan
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Template komunitas

## Sumber Tambahan

### Dokumentasi
- **[Dokumentasi Flask](https://flask.palletsprojects.com/)** - Panduan framework Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Dokumentasi resmi Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referensi perintah azd

### Tutorial
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Terapkan aplikasi pertama Anda
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Panduan pengembangan Python
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur sebagai kode

### Alat
- **[Azure Portal](https://portal.azure.com)** - Kelola sumber daya secara visual
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrasi IDE

---

**🎉 Selamat!** Anda telah menerapkan API Flask siap produksi ke Azure Container Apps dengan auto-scaling dan pemantauan.

**Pertanyaan?** [Buka issue](https://github.com/microsoft/AZD-for-beginners/issues) atau periksa [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya menjaga akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->