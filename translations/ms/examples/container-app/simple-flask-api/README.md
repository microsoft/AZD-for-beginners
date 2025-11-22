<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-22T10:45:21+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "ms"
}
-->
# API Flask Mudah - Contoh Aplikasi Kontena

**Laluan Pembelajaran:** Pemula ⭐ | **Masa:** 25-35 minit | **Kos:** $0-15/bulan

API REST Python Flask yang lengkap dan berfungsi, diterapkan ke Azure Container Apps menggunakan Azure Developer CLI (azd). Contoh ini menunjukkan penerapan kontena, penskalaan automatik, dan asas pemantauan.

## 🎯 Apa Yang Anda Akan Pelajari

- Menerapkan aplikasi Python yang dikontena ke Azure
- Mengkonfigurasi penskalaan automatik dengan penskalaan-ke-sifar
- Melaksanakan probe kesihatan dan pemeriksaan kesediaan
- Memantau log aplikasi dan metrik
- Menggunakan Azure Developer CLI untuk penerapan pantas

## 📦 Apa Yang Disertakan

✅ **Aplikasi Flask** - API REST lengkap dengan operasi CRUD (`src/app.py`)  
✅ **Dockerfile** - Konfigurasi kontena siap produksi  
✅ **Infrastruktur Bicep** - Persekitaran Container Apps dan penerapan API  
✅ **Konfigurasi AZD** - Persediaan penerapan dengan satu perintah  
✅ **Probe Kesihatan** - Pemeriksaan liveness dan kesediaan dikonfigurasi  
✅ **Penskalaan Automatik** - 0-10 replika berdasarkan beban HTTP  

## Seni Bina

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
- **Azure Developer CLI (azd)** - [Panduan pemasangan](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Langganan Azure** - [Akaun percuma](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Pasang Docker](https://www.docker.com/products/docker-desktop/) (untuk ujian tempatan)

### Sahkan Prasyarat

```bash
# Periksa versi azd (perlu 1.5.0 atau lebih tinggi)
azd version

# Sahkan log masuk Azure
azd auth login

# Periksa Docker (pilihan, untuk ujian tempatan)
docker --version
```

## ⏱️ Garis Masa Penerapan

| Fasa | Tempoh | Apa Yang Berlaku |
|------|--------|------------------|
| Persediaan persekitaran | 30 saat | Buat persekitaran azd |
| Bina kontena | 2-3 minit | Docker membina aplikasi Flask |
| Penyediaan infrastruktur | 3-5 minit | Buat Container Apps, registry, pemantauan |
| Terapkan aplikasi | 2-3 minit | Tolak imej dan terapkan ke Container Apps |
| **Jumlah** | **8-12 minit** | Penerapan lengkap siap |

## Permulaan Pantas

```bash
# Navigasi ke contoh
cd examples/container-app/simple-flask-api

# Inisialisasi persekitaran (pilih nama unik)
azd env new myflaskapi

# Sebarkan semuanya (infrastruktur + aplikasi)
azd up
# Anda akan diminta untuk:
# 1. Pilih langganan Azure
# 2. Pilih lokasi (contohnya, eastus2)
# 3. Tunggu 8-12 minit untuk penyebaran

# Dapatkan titik akhir API anda
azd env get-values

# Uji API
curl $(azd env get-value API_ENDPOINT)/health
```

**Output Dijangka:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Sahkan Penerapan

### Langkah 1: Periksa Status Penerapan

```bash
# Lihat perkhidmatan yang dideploy
azd show

# Output yang dijangka menunjukkan:
# - Perkhidmatan: api
# - Titik Akhir: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Berjalan
```

### Langkah 2: Uji Endpoint API

```bash
# Dapatkan titik akhir API
API_URL=$(azd env get-value API_ENDPOINT)

# Uji kesihatan
curl $API_URL/health

# Uji titik akhir root
curl $API_URL/

# Cipta item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Dapatkan semua item
curl $API_URL/api/items
```

**Kriteria Kejayaan:**
- ✅ Endpoint kesihatan mengembalikan HTTP 200
- ✅ Endpoint root menunjukkan maklumat API
- ✅ POST mencipta item dan mengembalikan HTTP 201
- ✅ GET mengembalikan item yang dicipta

### Langkah 3: Lihat Log

```bash
# Strim log langsung
azd logs api --follow

# Anda sepatutnya melihat:
# - Mesej permulaan Gunicorn
# - Log permintaan HTTP
# - Log maklumat aplikasi
```

## Struktur Projek

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

| Endpoint | Kaedah | Penerangan |
|----------|--------|-----------|
| `/health` | GET | Pemeriksaan kesihatan |
| `/api/items` | GET | Senaraikan semua item |
| `/api/items` | POST | Cipta item baharu |
| `/api/items/{id}` | GET | Dapatkan item tertentu |
| `/api/items/{id}` | PUT | Kemas kini item |
| `/api/items/{id}` | DELETE | Padam item |

## Konfigurasi

### Pembolehubah Persekitaran

```bash
# Tetapkan konfigurasi tersuai
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Konfigurasi Penskalaan

API secara automatik menskalakan berdasarkan trafik HTTP:
- **Replika Minimum**: 0 (menskalakan ke sifar apabila tidak aktif)
- **Replika Maksimum**: 10
- **Permintaan Serentak per Replika**: 50

## Pembangunan

### Jalankan Secara Tempatan

```bash
# Pasang kebergantungan
cd src
pip install -r requirements.txt

# Jalankan aplikasi
python app.py

# Uji secara tempatan
curl http://localhost:8000/health
```

### Bina dan Uji Kontena

```bash
# Bina imej Docker
docker build -t flask-api:local ./src

# Jalankan kontena secara tempatan
docker run -p 8000:8000 flask-api:local

# Uji kontena
curl http://localhost:8000/health
```

## Penerapan

### Penerapan Penuh

```bash
# Sebarkan infrastruktur dan aplikasi
azd up
```

### Penerapan Kod Sahaja

```bash
# Sebarkan hanya kod aplikasi (infrastruktur tidak berubah)
azd deploy api
```

### Kemas Kini Konfigurasi

```bash
# Kemas kini pembolehubah persekitaran
azd env set API_KEY "new-api-key"

# Lakukan penyebaran semula dengan konfigurasi baharu
azd deploy api
```

## Pemantauan

### Lihat Log

```bash
# Strim log secara langsung
azd logs api --follow

# Lihat 100 baris terakhir
azd logs api --tail 100
```

### Pantau Metrik

```bash
# Buka papan pemuka Azure Monitor
azd monitor --overview

# Lihat metrik tertentu
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Ujian

### Pemeriksaan Kesihatan

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Respons dijangka:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Cipta Item

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Dapatkan Semua Item

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Pengoptimuman Kos

Penerapan ini menggunakan penskalaan-ke-sifar, jadi anda hanya membayar apabila API memproses permintaan:

- **Kos tidak aktif**: ~$0/bulan (menskalakan ke sifar)
- **Kos aktif**: ~$0.000024/saat per replika
- **Kos bulanan dijangka** (penggunaan ringan): $5-15

### Kurangkan Kos Lagi

```bash
# Kurangkan maksimum replika untuk dev
azd env set MAX_REPLICAS 3

# Gunakan masa tamat tidak aktif yang lebih pendek
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minit
```

## Penyelesaian Masalah

### Kontena Tidak Bermula

```bash
# Periksa log kontena
azd logs api --tail 100

# Sahkan binaan imej Docker secara tempatan
docker build -t test ./src
```

### API Tidak Dapat Diakses

```bash
# Sahkan ingress adalah luaran
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Masa Respons Tinggi

```bash
# Periksa penggunaan CPU/Memori
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Tingkatkan sumber jika diperlukan
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Pembersihan

```bash
# Padam semua sumber
azd down --force --purge
```

## Langkah Seterusnya

### Kembangkan Contoh Ini

1. **Tambah Pangkalan Data** - Integrasi Azure Cosmos DB atau SQL Database
   ```bash
   # Tambah modul Cosmos DB ke infra/main.bicep
   # Kemas kini app.py dengan sambungan pangkalan data
   ```

2. **Tambah Pengesahan** - Laksanakan Azure AD atau kunci API
   ```python
   # Tambah middleware pengesahan ke app.py
   from functools import wraps
   ```

3. **Tetapkan CI/CD** - Alur kerja GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Tambah Identiti Terurus** - Akses selamat ke perkhidmatan Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Contoh Berkaitan

- **[Aplikasi Pangkalan Data](../../../../../examples/database-app)** - Contoh lengkap dengan SQL Database
- **[Mikroservis](../../../../../examples/container-app/microservices)** - Seni bina pelbagai perkhidmatan
- **[Panduan Utama Container Apps](../README.md)** - Semua corak kontena

### Sumber Pembelajaran

- 📚 [Kursus AZD Untuk Pemula](../../../README.md) - Halaman utama kursus
- 📚 [Corak Container Apps](../README.md) - Lebih banyak corak penerapan
- 📚 [Galeri Templat AZD](https://azure.github.io/awesome-azd/) - Templat komuniti

## Sumber Tambahan

### Dokumentasi
- **[Dokumentasi Flask](https://flask.palletsprojects.com/)** - Panduan rangka kerja Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Dokumentasi rasmi Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Rujukan perintah azd

### Tutorial
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Terapkan aplikasi pertama anda
- **[Python di Azure](https://learn.microsoft.com/azure/developer/python/)** - Panduan pembangunan Python
- **[Bahasa Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur sebagai kod

### Alat
- **[Azure Portal](https://portal.azure.com)** - Urus sumber secara visual
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrasi IDE

---

**🎉 Tahniah!** Anda telah menerapkan API Flask siap produksi ke Azure Container Apps dengan penskalaan automatik dan pemantauan.

**Ada soalan?** [Buka isu](https://github.com/microsoft/AZD-for-beginners/issues) atau semak [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->