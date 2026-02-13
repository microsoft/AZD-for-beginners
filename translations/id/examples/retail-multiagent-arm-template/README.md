# Solusi Multi-Agent Retail - Template Infrastruktur

**Bab 5: Paket Penerapan Produksi**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Terkait**: [Bab 5: Solusi AI Multi-Agent](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Panduan Skenario**: [Arsitektur Lengkap](../retail-scenario.md)
- **🎯 Penerapan Cepat**: [Penerapan Satu Klik](../../../../examples/retail-multiagent-arm-template)

> **⚠️ HANYA TEMPLATE INFRASTRUKTUR**  
> Template ARM ini menerapkan **sumber daya Azure** untuk sistem multi-agent.  
>  
> **Apa yang diterapkan (15-25 menit):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings di 3 wilayah)
> - ✅ Layanan Pencarian AI (kosong, siap untuk pembuatan indeks)
> - ✅ Container Apps (gambar placeholder, siap untuk kode Anda)
> - ✅ Storage, Cosmos DB, Key Vault, Application Insights
>  
> **Apa yang TIDAK termasuk (memerlukan pengembangan):**
> - ❌ Kode implementasi agen (Customer Agent, Inventory Agent)
> - ❌ Logika routing dan endpoint API
> - ❌ UI obrolan frontend
> - ❌ Skema indeks pencarian dan pipeline data
> - ❌ **Perkiraan usaha pengembangan: 80-120 jam**
>  
> **Gunakan template ini jika:**
> - ✅ Anda ingin menyediakan infrastruktur Azure untuk proyek multi-agent
> - ✅ Anda berencana mengembangkan implementasi agen secara terpisah
> - ✅ Anda membutuhkan baseline infrastruktur yang siap produksi
>  
> **Jangan gunakan jika:**
> - ❌ Anda mengharapkan demo multi-agent yang berfungsi segera
> - ❌ Anda mencari contoh kode aplikasi lengkap

## Ikhtisar

Direktori ini berisi template Azure Resource Manager (ARM) yang komprehensif untuk menerapkan **fondasi infrastruktur** sistem dukungan pelanggan multi-agent. Template ini menyediakan semua layanan Azure yang diperlukan, dikonfigurasi dan saling terhubung dengan baik, siap untuk pengembangan aplikasi Anda.

**Setelah penerapan, Anda akan memiliki:** Infrastruktur Azure yang siap produksi  
**Untuk melengkapi sistem, Anda membutuhkan:** Kode agen, UI frontend, dan konfigurasi data (lihat [Panduan Arsitektur](../retail-scenario.md))

## 🎯 Apa yang Diterapkan

### Infrastruktur Inti (Status Setelah Penerapan)

✅ **Layanan Azure OpenAI** (Siap untuk panggilan API)
  - Wilayah utama: Penerapan GPT-4o (kapasitas 20K TPM)
  - Wilayah sekunder: Penerapan GPT-4o-mini (kapasitas 10K TPM)
  - Wilayah tersier: Model embeddings teks (kapasitas 30K TPM)
  - Wilayah evaluasi: Model grader GPT-4o (kapasitas 15K TPM)
  - **Status:** Berfungsi penuh - dapat melakukan panggilan API segera

✅ **Azure AI Search** (Kosong - siap untuk konfigurasi)
  - Kemampuan pencarian vektor diaktifkan
  - Tier standar dengan 1 partisi, 1 replika
  - **Status:** Layanan berjalan, tetapi memerlukan pembuatan indeks
  - **Tindakan yang diperlukan:** Buat indeks pencarian dengan skema Anda

✅ **Azure Storage Account** (Kosong - siap untuk unggahan)
  - Kontainer blob: `documents`, `uploads`
  - Konfigurasi aman (HTTPS-only, tanpa akses publik)
  - **Status:** Siap menerima file
  - **Tindakan yang diperlukan:** Unggah data produk dan dokumen Anda

⚠️ **Container Apps Environment** (Gambar placeholder diterapkan)
  - Aplikasi router agen (gambar default nginx)
  - Aplikasi frontend (gambar default nginx)
  - Auto-scaling dikonfigurasi (0-10 instance)
  - **Status:** Menjalankan kontainer placeholder
  - **Tindakan yang diperlukan:** Bangun dan terapkan aplikasi agen Anda

✅ **Azure Cosmos DB** (Kosong - siap untuk data)
  - Database dan kontainer telah dikonfigurasi
  - Dioptimalkan untuk operasi latensi rendah
  - TTL diaktifkan untuk pembersihan otomatis
  - **Status:** Siap menyimpan riwayat obrolan

✅ **Azure Key Vault** (Opsional - siap untuk rahasia)
  - Soft delete diaktifkan
  - RBAC dikonfigurasi untuk identitas terkelola
  - **Status:** Siap menyimpan kunci API dan string koneksi

✅ **Application Insights** (Opsional - pemantauan aktif)
  - Terhubung ke Log Analytics workspace
  - Metrik dan peringatan khusus dikonfigurasi
  - **Status:** Siap menerima telemetri dari aplikasi Anda

✅ **Document Intelligence** (Siap untuk panggilan API)
  - Tier S0 untuk beban kerja produksi
  - **Status:** Siap memproses dokumen yang diunggah

✅ **Bing Search API** (Siap untuk panggilan API)
  - Tier S1 untuk pencarian real-time
  - **Status:** Siap untuk kueri pencarian web

### Mode Penerapan

| Mode | Kapasitas OpenAI | Instance Kontainer | Tier Pencarian | Redundansi Penyimpanan | Terbaik Untuk |
|------|------------------|--------------------|----------------|------------------------|---------------|
| **Minimal** | 10K-20K TPM | 0-2 replika | Basic | LRS (Lokal) | Pengembangan, pembelajaran, proof-of-concept |
| **Standar** | 30K-60K TPM | 2-5 replika | Standar | ZRS (Zona) | Produksi, lalu lintas sedang (<10K pengguna) |
| **Premium** | 80K-150K TPM | 5-10 replika, redundansi zona | Premium | GRS (Geo) | Perusahaan, lalu lintas tinggi (>10K pengguna), SLA 99,99% |

**Dampak Biaya:**
- **Minimal → Standar:** ~4x peningkatan biaya ($100-370/bulan → $420-1,450/bulan)
- **Standar → Premium:** ~3x peningkatan biaya ($420-1,450/bulan → $1,150-3,500/bulan)
- **Pilih berdasarkan:** Beban yang diharapkan, persyaratan SLA, kendala anggaran

**Perencanaan Kapasitas:**
- **TPM (Token Per Menit):** Total di semua penerapan model
- **Instance Kontainer:** Rentang auto-scaling (min-max replika)
- **Tier Pencarian:** Mempengaruhi kinerja kueri dan batas ukuran indeks

## 📋 Prasyarat

### Alat yang Diperlukan
1. **Azure CLI** (versi 2.50.0 atau lebih tinggi)
   ```bash
   az --version  # Periksa versi
   az login      # Autentikasi
   ```

2. **Langganan Azure aktif** dengan akses Pemilik atau Kontributor
   ```bash
   az account show  # Verifikasi langganan
   ```

### Kuota Azure yang Diperlukan

Sebelum penerapan, verifikasi kuota yang cukup di wilayah target Anda:

```bash
# Periksa ketersediaan Azure OpenAI di wilayah Anda
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Verifikasi kuota OpenAI (contoh untuk gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Periksa kuota Container Apps
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Kuota Minimum yang Diperlukan:**
- **Azure OpenAI:** 3-4 penerapan model di berbagai wilayah
  - GPT-4o: 20K TPM (Token Per Menit)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Catatan:** GPT-4o mungkin memiliki daftar tunggu di beberapa wilayah - periksa [ketersediaan model](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Container Apps:** Lingkungan terkelola + 2-10 instance kontainer
- **AI Search:** Tier standar (Basic tidak cukup untuk pencarian vektor)
- **Cosmos DB:** Throughput standar yang telah disediakan

**Jika kuota tidak mencukupi:**
1. Pergi ke Azure Portal → Kuota → Minta peningkatan
2. Atau gunakan Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Pertimbangkan wilayah alternatif dengan ketersediaan

## 🚀 Penerapan Cepat

### Opsi 1: Menggunakan Azure CLI

```bash
# Klon atau unduh file template
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Jadikan skrip penyebaran dapat dieksekusi
chmod +x deploy.sh

# Sebarkan dengan pengaturan default
./deploy.sh -g myResourceGroup

# Sebarkan untuk produksi dengan fitur premium
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opsi 2: Menggunakan Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opsi 3: Menggunakan Azure CLI secara langsung

```bash
# Buat grup sumber daya
az group create --name myResourceGroup --location eastus2

# Terapkan template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Garis Waktu Penerapan

### Apa yang Diharapkan

| Fase | Durasi | Apa yang Terjadi |
|------|--------|-----------------||
| **Validasi Template** | 30-60 detik | Azure memvalidasi sintaks template ARM dan parameter |
| **Pengaturan Resource Group** | 10-20 detik | Membuat resource group (jika diperlukan) |
| **Penerapan OpenAI** | 5-8 menit | Membuat 3-4 akun OpenAI dan menerapkan model |
| **Container Apps** | 3-5 menit | Membuat lingkungan dan menerapkan kontainer placeholder |
| **Pencarian & Penyimpanan** | 2-4 menit | Menyediakan layanan AI Search dan akun penyimpanan |
| **Cosmos DB** | 2-3 menit | Membuat database dan mengonfigurasi kontainer |
| **Pengaturan Pemantauan** | 2-3 menit | Mengatur Application Insights dan Log Analytics |
| **Konfigurasi RBAC** | 1-2 menit | Mengonfigurasi identitas terkelola dan izin |
| **Total Penerapan** | **15-25 menit** | Infrastruktur lengkap siap |

**Setelah Penerapan:**
- ✅ **Infrastruktur Siap:** Semua layanan Azure disediakan dan berjalan
- ⏱️ **Pengembangan Aplikasi:** 80-120 jam (tanggung jawab Anda)
- ⏱️ **Konfigurasi Indeks:** 15-30 menit (memerlukan skema Anda)
- ⏱️ **Unggahan Data:** Bervariasi berdasarkan ukuran dataset
- ⏱️ **Pengujian & Validasi:** 2-4 jam

---

## ✅ Verifikasi Keberhasilan Penerapan

### Langkah 1: Periksa Penyediaan Sumber Daya (2 menit)

```bash
# Verifikasi semua sumber daya berhasil diterapkan
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Diharapkan:** Tabel kosong (semua sumber daya menunjukkan status "Succeeded")

### Langkah 2: Verifikasi Penerapan Azure OpenAI (3 menit)

```bash
# Daftar semua akun OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Periksa penyebaran model untuk wilayah utama
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Diharapkan:** 
- 3-4 akun OpenAI (wilayah utama, sekunder, tersier, evaluasi)
- 1-2 penerapan model per akun (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Langkah 3: Uji Endpoint Infrastruktur (5 menit)

```bash
# Dapatkan URL Aplikasi Kontainer
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Uji endpoint router (gambar placeholder akan merespons)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Diharapkan:** 
- Container Apps menunjukkan status "Running"
- Placeholder nginx merespons dengan HTTP 200 atau 404 (belum ada kode aplikasi)

### Langkah 4: Verifikasi Akses API Azure OpenAI (3 menit)

```bash
# Dapatkan endpoint dan kunci OpenAI
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Uji penerapan GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Diharapkan:** Respons JSON dengan penyelesaian obrolan (mengonfirmasi OpenAI berfungsi)

### Apa yang Berfungsi vs. Tidak Berfungsi

**✅ Berfungsi Setelah Penerapan:**
- Model Azure OpenAI diterapkan dan menerima panggilan API
- Layanan AI Search berjalan (kosong, belum ada indeks)
- Container Apps berjalan (gambar placeholder nginx)
- Akun penyimpanan dapat diakses dan siap untuk unggahan
- Cosmos DB siap untuk operasi data
- Application Insights mengumpulkan telemetri infrastruktur
- Key Vault siap untuk penyimpanan rahasia

**❌ Belum Berfungsi (Memerlukan Pengembangan):**
- Endpoint agen (belum ada kode aplikasi yang diterapkan)
- Fungsionalitas obrolan (memerlukan frontend + backend)
- Kueri pencarian (belum ada indeks pencarian yang dibuat)
- Pipeline pemrosesan dokumen (belum ada data yang diunggah)
- Telemetri khusus (memerlukan instrumentasi aplikasi)

**Langkah Selanjutnya:** Lihat [Konfigurasi Pasca-Penerapan](../../../../examples/retail-multiagent-arm-template) untuk mengembangkan dan menerapkan aplikasi Anda

---

## ⚙️ Opsi Konfigurasi

### Parameter Template

| Parameter | Tipe | Default | Deskripsi |
|-----------|------|---------|-----------|
| `projectName` | string | "retail" | Awalan untuk semua nama sumber daya |
| `location` | string | Lokasi resource group | Wilayah penerapan utama |
| `secondaryLocation` | string | "westus2" | Wilayah sekunder untuk penerapan multi-wilayah |
| `tertiaryLocation` | string | "francecentral" | Wilayah untuk model embeddings |
| `environmentName` | string | "dev" | Penunjukan lingkungan (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfigurasi penerapan (minimal/standar/premium) |
| `enableMultiRegion` | bool | true | Aktifkan penerapan multi-wilayah |
| `enableMonitoring` | bool | true | Aktifkan Application Insights dan logging |
| `enableSecurity` | bool | true | Aktifkan Key Vault dan keamanan yang ditingkatkan |

### Kustomisasi Parameter

Edit `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Ikhtisar Arsitektur

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Penggunaan Skrip Penerapan

Skrip `deploy.sh` menyediakan pengalaman penerapan interaktif:

```bash
# Tampilkan bantuan
./deploy.sh --help

# Penerapan dasar
./deploy.sh -g myResourceGroup

# Penerapan lanjutan dengan pengaturan khusus
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Penerapan pengembangan tanpa multi-wilayah
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Fitur Skrip

- ✅ **Validasi prasyarat** (Azure CLI, status login, file template)
- ✅ **Manajemen resource group** (membuat jika belum ada)
- ✅ **Validasi template** sebelum penerapan
- ✅ **Pemantauan progres** dengan output berwarna
- ✅ **Tampilan output penerapan**
- ✅ **Panduan pasca-penerapan**

## 📊 Pemantauan Penerapan

### Periksa Status Penerapan

```bash
# Daftar penyebaran
az deployment group list --resource-group myResourceGroup --output table

# Dapatkan detail penyebaran
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Pantau kemajuan penyebaran
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Output Penerapan

Setelah penerapan berhasil, output berikut tersedia:

- **URL Frontend**: Endpoint publik untuk antarmuka web
- **URL Router**: Endpoint API untuk router agen
- **Endpoint OpenAI**: Endpoint layanan OpenAI utama dan sekunder
- **Layanan Pencarian**: Endpoint layanan AI Search Azure
- **Akun Penyimpanan**: Nama akun penyimpanan untuk dokumen
- **Key Vault**: Nama Key Vault (jika diaktifkan)
- **Application Insights**: Nama layanan pemantauan (jika diaktifkan)

## 🔧 Pasca-Penerapan: Langkah Selanjutnya
> **📝 Penting:** Infrastruktur telah diterapkan, tetapi Anda perlu mengembangkan dan menerapkan kode aplikasi.

### Fase 1: Kembangkan Aplikasi Agen (Tanggung Jawab Anda)

Template ARM membuat **Container Apps kosong** dengan gambar placeholder nginx. Anda harus:

**Pengembangan yang Diperlukan:**
1. **Implementasi Agen** (30-40 jam)
   - Agen layanan pelanggan dengan integrasi GPT-4o
   - Agen inventaris dengan integrasi GPT-4o-mini
   - Logika pengaturan agen

2. **Pengembangan Frontend** (20-30 jam)
   - UI antarmuka chat (React/Vue/Angular)
   - Fitur unggah file
   - Pemformatan dan rendering respons

3. **Layanan Backend** (12-16 jam)
   - Router FastAPI atau Express
   - Middleware autentikasi
   - Integrasi telemetri

**Lihat:** [Panduan Arsitektur](../retail-scenario.md) untuk pola implementasi dan contoh kode yang lebih rinci

### Fase 2: Konfigurasi Indeks Pencarian AI (15-30 menit)

Buat indeks pencarian yang sesuai dengan model data Anda:

```bash
# Dapatkan detail layanan pencarian
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Buat indeks dengan skema Anda (contoh)
curl -X POST "https://${SEARCH_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_KEY}" \
  -d '{
    "name": "products",
    "fields": [
      {"name": "id", "type": "Edm.String", "key": true},
      {"name": "title", "type": "Edm.String", "searchable": true},
      {"name": "content", "type": "Edm.String", "searchable": true},
      {"name": "category", "type": "Edm.String", "filterable": true},
      {"name": "content_vector", "type": "Collection(Edm.Single)", 
       "searchable": true, "dimensions": 1536, "vectorSearchProfile": "default"}
    ],
    "vectorSearch": {
      "algorithms": [{"name": "default", "kind": "hnsw"}],
      "profiles": [{"name": "default", "algorithm": "default"}]
    }
  }'
```

**Sumber Daya:**
- [Desain Skema Indeks Pencarian AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Konfigurasi Pencarian Vektor](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fase 3: Unggah Data Anda (Waktu bervariasi)

Setelah Anda memiliki data produk dan dokumen:

```bash
# Dapatkan detail akun penyimpanan
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Unggah dokumen Anda
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Contoh: Unggah file tunggal
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fase 4: Bangun dan Terapkan Aplikasi Anda (8-12 jam)

Setelah Anda mengembangkan kode agen Anda:

```bash
# 1. Buat Azure Container Registry (jika diperlukan)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Bangun dan dorong gambar agen router
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Bangun dan dorong gambar frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Perbarui Container Apps dengan gambar Anda
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Konfigurasi variabel lingkungan
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fase 5: Uji Aplikasi Anda (2-4 jam)

```bash
# Dapatkan URL aplikasi Anda
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Uji endpoint agen (setelah kode Anda diterapkan)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Periksa log aplikasi
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Sumber Daya Implementasi

**Arsitektur & Desain:**
- 📖 [Panduan Arsitektur Lengkap](../retail-scenario.md) - Pola implementasi yang rinci
- 📖 [Pola Desain Multi-Agen](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Contoh Kode:**
- 🔗 [Contoh Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Pola RAG
- 🔗 [Semantic Kernel](https://github.com/microsoft/semantic-kernel) - Kerangka kerja agen (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orkestrasi agen (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Percakapan multi-agen

**Perkiraan Total Waktu:**
- Penerapan infrastruktur: 15-25 menit (✅ Selesai)
- Pengembangan aplikasi: 80-120 jam (🔨 Tugas Anda)
- Pengujian dan optimasi: 15-25 jam (🔨 Tugas Anda)

## 🛠️ Pemecahan Masalah

### Masalah Umum

#### 1. Kuota Azure OpenAI Terlampaui

```bash
# Periksa penggunaan kuota saat ini
az cognitiveservices usage list --location eastus2

# Meminta peningkatan kuota
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Penerapan Container Apps Gagal

```bash
# Periksa log aplikasi kontainer
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Mulai ulang aplikasi kontainer
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inisialisasi Layanan Pencarian

```bash
# Verifikasi status layanan pencarian
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Uji konektivitas layanan pencarian
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validasi Penerapan

```bash
# Validasi semua sumber daya telah dibuat
az resource list \
  --resource-group myResourceGroup \
  --output table

# Periksa kesehatan sumber daya
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Pertimbangan Keamanan

### Pengelolaan Kunci
- Semua rahasia disimpan di Azure Key Vault (jika diaktifkan)
- Container apps menggunakan identitas terkelola untuk autentikasi
- Akun penyimpanan memiliki pengaturan default yang aman (HTTPS saja, tidak ada akses blob publik)

### Keamanan Jaringan
- Container apps menggunakan jaringan internal jika memungkinkan
- Layanan pencarian dikonfigurasi dengan opsi endpoint privat
- Cosmos DB dikonfigurasi dengan izin minimum yang diperlukan

### Konfigurasi RBAC
```bash
# Tetapkan peran yang diperlukan untuk identitas terkelola
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimasi Biaya

### Perkiraan Biaya (Bulanan, USD)

| Mode | OpenAI | Container Apps | Pencarian | Penyimpanan | Total Est. |
|------|--------|----------------|-----------|-------------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standar | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Pemantauan Biaya

```bash
# Atur peringatan anggaran
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Pembaruan dan Pemeliharaan

### Pembaruan Template
- Kontrol versi file template ARM
- Uji perubahan di lingkungan pengembangan terlebih dahulu
- Gunakan mode penerapan bertahap untuk pembaruan

### Pembaruan Sumber Daya
```bash
# Perbarui dengan parameter baru
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Cadangan dan Pemulihan
- Cadangan otomatis Cosmos DB diaktifkan
- Penghapusan lunak Key Vault diaktifkan
- Revisi aplikasi container dipertahankan untuk rollback

## 📞 Dukungan

- **Masalah Template**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Dukungan Azure**: [Portal Dukungan Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komunitas**: [Discord Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ Siap menerapkan solusi multi-agen Anda?**

Mulai dengan: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan terjemahan yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemah manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang salah yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->