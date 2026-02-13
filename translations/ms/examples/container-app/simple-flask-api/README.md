# Simple Flask API - Contoh Aplikasi Kontena

**Laluan Pembelajaran:** Pemula ⭐ | **Masa:** 25-35 minit | **Kos:** $0-15/bulan

Satu API REST Python Flask yang lengkap dan berfungsi telah dideploy ke Azure Container Apps menggunakan Azure Developer CLI (azd). Contoh ini menunjukkan asas penyebaran kontena, penskalaan auto, dan pemantauan.

## 🎯 Apa Yang Akan Anda Pelajari

- Menyebarkan aplikasi Python yang dikontena ke Azure  
- Mengkonfigurasi penskalaan auto dengan skala-ke-nol  
- Melaksanakan probe kesihatan dan pemeriksaan kesediaan  
- Memantau log dan metrik aplikasi  
- Menggunakan Azure Developer CLI untuk penyebaran cepat

## 📦 Apa Yang Termasuk

✅ **Aplikasi Flask** - REST API lengkap dengan operasi CRUD (`src/app.py`)  
✅ **Dockerfile** - Konfigurasi kontena sedia produksi  
✅ **Infrastruktur Bicep** - Persekitaran Container Apps dan penyebaran API  
✅ **Konfigurasi AZD** - Satu arahan untuk penyediaan penyebaran  
✅ **Probe Kesihatan** - Pemeriksaan liveness dan readiness telah disediakan  
✅ **Penskalaan Auto** - 0-10 replika berdasarkan beban HTTP  

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
# Semak versi azd (perlu 1.5.0 atau lebih tinggi)
azd version

# Sahkan log masuk Azure
azd auth login

# Semak Docker (pilihan, untuk ujian tempatan)
docker --version
```

## ⏱️ Garis Masa Penyebaran

| Fasa | Tempoh | Apa Yang Berlaku |
|-------|----------|--------------||
| Penyediaan persekitaran | 30 saat | Membuat persekitaran azd |
| Bina kontena | 2-3 minit | Docker bina aplikasi Flask |
| Sediakan infrastruktur | 3-5 minit | Membuat Container Apps, registry, pemantauan |
| Sebarkan aplikasi | 2-3 minit | Tekan imej dan sebar ke Container Apps |
| **Jumlah** | **8-12 minit** | Penyebaran lengkap sedia |

## Mula Pantas

```bash
# Navigasi ke contoh
cd examples/container-app/simple-flask-api

# Inisialisasi persekitaran (pilih nama unik)
azd env new myflaskapi

# Terapkan semuanya (infrastruktur + aplikasi)
azd up
# Anda akan diminta untuk:
# 1. Pilih langganan Azure
# 2. Pilih lokasi (contoh, eastus2)
# 3. Tunggu 8-12 minit untuk penerapan

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

## ✅ Sahkan Penyebaran

### Langkah 1: Semak Status Penyebaran

```bash
# Lihat perkhidmatan yang telah disebarkan
azd show

# Output yang dijangka menunjukkan:
# - Perkhidmatan: api
# - Titik hujung: https://ca-api-[env].xxx.azurecontainerapps.io
# - Status: Sedang Berjalan
```

### Langkah 2: Uji Endpoint API

```bash
# Dapatkan titik akhir API
API_URL=$(azd env get-value API_ENDPOINT)

# Ujian kesihatan
curl $API_URL/health

# Ujian titik akhir akar
curl $API_URL/

# Buat satu item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Dapatkan semua item
curl $API_URL/api/items
```

**Kriteria Kejayaan:**
- ✅ Endpoint kesihatan pulangkan HTTP 200  
- ✅ Endpoint root tunjuk maklumat API  
- ✅ POST buat item dan pulangkan HTTP 201  
- ✅ GET pulangkan item yang dibuat

### Langkah 3: Lihat Log

```bash
# Alirkan log secara langsung menggunakan azd monitor
azd monitor --logs

# Atau gunakan Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

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
|----------|--------|-------------|
| `/health` | GET | Pemeriksaan kesihatan |
| `/api/items` | GET | Senaraikan semua item |
| `/api/items` | POST | Buat item baru |
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

API secara automatik menyesuaikan skala berdasarkan trafik HTTP:  
- **Replika Minimum**: 0 (skala ke sifar apabila menganggur)  
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

# Uji secara setempat
curl http://localhost:8000/health
```

### Bina dan Uji Kontena

```bash
# Bina imej Docker
docker build -t flask-api:local ./src

# Jalankan bekas secara tempatan
docker run -p 8000:8000 flask-api:local

# Uji bekas
curl http://localhost:8000/health
```

## Penyebaran

### Penyebaran Penuh

```bash
# Sediakan infrastruktur dan aplikasi
azd up
```

### Penyebaran Hanya Kod

```bash
# Hanya gunakan kod aplikasi sahaja (infrastruktur tidak berubah)
azd deploy api
```

### Kemas Kini Konfigurasi

```bash
# Kemas kini pemboleh ubah persekitaran
azd env set API_KEY "new-api-key"

# Pasang semula dengan konfigurasi baru
azd deploy api
```

## Pemantauan

### Lihat Log

```bash
# Alirkan log langsung menggunakan azd monitor
azd monitor --logs

# Atau gunakan Azure CLI untuk Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Lihat 100 baris terakhir
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
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

## Pengoptimuman Kos

Penyebaran ini menggunakan skala-ke-nol, jadi anda hanya membayar apabila API memproses permintaan:

- **Kos menganggur**: ~ $0/bulan (diskala ke sifar)  
- **Kos aktif**: ~ $0.000024/saat setiap replika  
- **Kos bulanan dijangka** (penggunaan ringan): $5-15  

### Kurangkan Kos Lagi

```bash
# Kurangkan skala maksimum replika untuk pembangunan
azd env set MAX_REPLICAS 3

# Gunakan masa tamat tidak aktif yang lebih pendek
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minit
```

## Penyelesaian Masalah

### Kontena Tidak Mula

```bash
# Semak log kontena menggunakan Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Sahkan binaan imej Docker secara tempatan
docker build -t test ./src
```

### API Tidak Boleh Diakses

```bash
# Sahkan ingress adalah luaran
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Masa Respons Tinggi

```bash
# Semak penggunaan CPU/Memori
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Tingkatkan sumber jika perlu
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Bersihkan

```bash
# Padamkan semua sumber daya
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

3. **Sediakan CI/CD** - Aliran kerja GitHub Actions  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Tambah Identiti Terurus** - Akses selamat kepada perkhidmatan Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Contoh Berkaitan

- **[Aplikasi Pangkalan Data](../../../../../examples/database-app)** - Contoh lengkap dengan SQL Database  
- **[Mikroservis](../../../../../examples/container-app/microservices)** - Seni bina pelbagai perkhidmatan  
- **[Panduan Utama Container Apps](../README.md)** - Semua corak kontena

### Sumber Pembelajaran

- 📚 [Kursus AZD Untuk Pemula](../../../README.md) - Rumah kursus utama  
- 📚 [Corak Container Apps](../README.md) - Lebih banyak corak penyebaran  
- 📚 [Galeri Templat AZD](https://azure.github.io/awesome-azd/) - Templat komuniti

## Sumber Tambahan

### Dokumentasi
- **[Dokumentasi Flask](https://flask.palletsprojects.com/)** - Panduan rangka kerja Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Dokumen rasmi Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Rujukan arahan azd

### Tutorial
- **[Permulaan Pantas Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Sebarkan aplikasi pertama anda  
- **[Python di Azure](https://learn.microsoft.com/azure/developer/python/)** - Panduan pembangunan Python  
- **[Bahasa Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastruktur sebagai kod

### Alat
- **[Portal Azure](https://portal.azure.com)** - Urus sumber secara visual  
- **[Sambungan VS Code Azure](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integrasi IDE

---

**🎉 Tahniah!** Anda telah menyebarkan API Flask yang sedia produksi ke Azure Container Apps dengan penskalaan auto dan pemantauan.

**Ada soalan?** [Buka isu](https://github.com/microsoft/AZD-for-beginners/issues) atau semak [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->