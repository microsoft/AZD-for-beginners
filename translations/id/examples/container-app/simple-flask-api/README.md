<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-22T10:43:37+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "id"
}
-->
# Contoh Aplikasi Container - API Flask Sederhana

**Jalur Pembelajaran:** Pemula ⭐ | **Waktu:** 25-35 menit | **Biaya:** $0-15/bulan

API REST Python Flask yang lengkap dan berfungsi, diterapkan ke Azure Container Apps menggunakan Azure Developer CLI (azd). Contoh ini menunjukkan penerapan container, penskalaan otomatis, dan dasar-dasar pemantauan.

## 🎯 Apa yang Akan Anda Pelajari

- Menerapkan aplikasi Python yang dikontainerisasi ke Azure
- Mengonfigurasi penskalaan otomatis dengan penskalaan ke nol
- Menerapkan pemeriksaan kesehatan dan kesiapan
- Memantau log dan metrik aplikasi
- Menggunakan Azure Developer CLI untuk penerapan cepat

## 📦 Apa yang Termasuk

✅ **Aplikasi Flask** - API REST lengkap dengan operasi CRUD (`src/app.py`)  
✅ **Dockerfile** - Konfigurasi container siap produksi  
✅ **Infrastruktur Bicep** - Lingkungan Container Apps dan penerapan API  
✅ **Konfigurasi AZD** - Pengaturan penerapan dengan satu perintah  
✅ **Pemeriksaan Kesehatan** - Pemeriksaan liveness dan readiness yang dikonfigurasi  
✅ **Penskalaan Otomatis** - 0-10 replika berdasarkan beban HTTP  

## Arsitektur

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

## Prasyarat

### Diperlukan
- **Azure Developer CLI (azd)** - [Panduan instalasi](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Langganan Azure** - [Akun gratis](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instal Docker](https://www.docker.com/products/docker-desktop/) (untuk pengujian lokal)

### Verifikasi Prasyarat

```bash
# Periksa versi azd (membutuhkan 1.5.0 atau lebih tinggi)
azd version

# Verifikasi login Azure
azd auth login

# Periksa Docker (opsional, untuk pengujian lokal)
docker --version
```

## ⏱️ Garis Waktu Penerapan

| Fase | Durasi | Apa yang Terjadi |
|------|--------|------------------|
| Pengaturan lingkungan | 30 detik | Membuat lingkungan azd |
| Membangun container | 2-3 menit | Docker membangun aplikasi Flask |
| Penyediaan infrastruktur | 3-5 menit | Membuat Container Apps, registry, pemantauan |
| Menerapkan aplikasi | 2-3 menit | Mendorong gambar dan menerapkan ke Container Apps |
| **Total** | **8-12 menit** | Penerapan selesai siap digunakan |

## Memulai Cepat

```bash
# Navigasikan ke contoh
cd examples/container-app/simple-flask-api

# Inisialisasi lingkungan (pilih nama unik)
azd env new myflaskapi

# Terapkan semuanya (infrastruktur + aplikasi)
azd up
# Anda akan diminta untuk:
# 1. Pilih langganan Azure
# 2. Pilih lokasi (misalnya, eastus2)
# 3. Tunggu 8-12 menit untuk penerapan

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
# Lihat layanan yang diterapkan
azd show

# Output yang diharapkan menunjukkan:
# - Layanan: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
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

# Buat item
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
# Streaming log langsung
azd logs api --follow

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

| Endpoint | Metode | Deskripsi |
|----------|--------|-----------|
| `/health` | GET | Pemeriksaan kesehatan |
| `/api/items` | GET | Daftar semua item |
| `/api/items` | POST | Membuat item baru |
| `/api/items/{id}` | GET | Mendapatkan item tertentu |
| `/api/items/{id}` | PUT | Memperbarui item |
| `/api/items/{id}` | DELETE | Menghapus item |

## Konfigurasi

### Variabel Lingkungan

```bash
# Atur konfigurasi khusus
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
# Pasang dependensi
cd src
pip install -r requirements.txt

# Jalankan aplikasi
python app.py

# Uji secara lokal
curl http://localhost:8000/health
```

### Bangun dan Uji Container

```bash
# Bangun gambar Docker
docker build -t flask-api:local ./src

# Jalankan kontainer secara lokal
docker run -p 8000:8000 flask-api:local

# Uji kontainer
curl http://localhost:8000/health
```

## Penerapan

### Penerapan Lengkap

```bash
# Menerapkan infrastruktur dan aplikasi
azd up
```

### Penerapan Hanya Kode

```bash
# Hanya menerapkan kode aplikasi (infrastruktur tidak berubah)
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
# Streaming log langsung
azd logs api --follow

# Lihat 100 baris terakhir
azd logs api --tail 100
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

Respon yang diharapkan:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Membuat Item

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Mendapatkan Semua Item

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Optimasi Biaya

Penerapan ini menggunakan penskalaan ke nol, sehingga Anda hanya membayar saat API memproses permintaan:

- **Biaya tidak aktif**: ~$0/bulan (menskalakan ke nol)
- **Biaya aktif**: ~$0.000024/detik per replika
- **Perkiraan biaya bulanan** (penggunaan ringan): $5-15

### Kurangi Biaya Lebih Lanjut

```bash
# Kurangi jumlah maksimum replika untuk pengembangan
azd env set MAX_REPLICAS 3

# Gunakan waktu tunggu idle yang lebih pendek
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 menit
```

## Pemecahan Masalah

### Container Tidak Mau Mulai

```bash
# Periksa log kontainer
azd logs api --tail 100

# Verifikasi pembuatan gambar Docker secara lokal
docker build -t test ./src
```

### API Tidak Dapat Diakses

```bash
# Verifikasi ingress adalah eksternal
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Waktu Respon Tinggi

```bash
# Periksa penggunaan CPU/Memori
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

## Langkah Berikutnya

### Kembangkan Contoh Ini

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

3. **Siapkan CI/CD** - Alur kerja GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Tambahkan Identitas Terkelola** - Amankan akses ke layanan Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Contoh Terkait

- **[Aplikasi Database](../../../../../examples/database-app)** - Contoh lengkap dengan SQL Database
- **[Mikroservis](../../../../../examples/container-app/microservices)** - Arsitektur multi-layanan
- **[Panduan Utama Container Apps](../README.md)** - Semua pola container

### Sumber Belajar

- 📚 [Kursus AZD untuk Pemula](../../../README.md) - Halaman utama kursus
- 📚 [Pola Container Apps](../README.md) - Pola penerapan lainnya
- 📚 [Galeri Template AZD](https://azure.github.io/awesome-azd/) - Template komunitas

## Sumber Tambahan

### Dokumentasi
- **[Dokumentasi Flask](https://flask.palletsprojects.com/)** - Panduan kerangka kerja Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Dokumentasi resmi Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referensi perintah azd

### Tutorial
- **[Quickstart Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Terapkan aplikasi pertama Anda
- **[Python di Azure](https://learn.microsoft.com/azure/developer/python/)** - Panduan pengembangan Python
- **[Bahasa Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur sebagai kode

### Alat
- **[Azure Portal](https://portal.azure.com)** - Kelola sumber daya secara visual
- **[Ekstensi Azure VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrasi IDE

---

**🎉 Selamat!** Anda telah menerapkan API Flask siap produksi ke Azure Container Apps dengan penskalaan otomatis dan pemantauan.

**Ada pertanyaan?** [Buka masalah](https://github.com/microsoft/AZD-for-beginners/issues) atau periksa [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa terjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang salah yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->