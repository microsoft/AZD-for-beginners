# Penyelesaian Multi-Ejen Runcit - Templat Infrastruktur

**Bab 5: Pakej Pengeluaran**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Berkaitan**: [Bab 5: Penyelesaian AI Multi-Ejen](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Panduan Senario**: [Seni Bina Lengkap](../retail-scenario.md)
- **🎯 Pemasangan Pantas**: [Pemasangan Sekali Klik](../../../../examples/retail-multiagent-arm-template)

> **⚠️ HANYA UNTUK TEMPLAT INFRASTRUKTUR**  
> Templat ARM ini memasang **sumber Azure** untuk sistem multi-ejen.  
>  
> **Apa yang akan dipasang (15-25 minit):**
> - ✅ Azure OpenAI (GPT-4o, GPT-4o-mini, embeddings di 3 rantau)
> - ✅ Perkhidmatan Carian AI (kosong, sedia untuk penciptaan indeks)
> - ✅ Aplikasi Kontena (imej sementara, sedia untuk kod anda)
> - ✅ Storan, Cosmos DB, Key Vault, Application Insights
>  
> **Apa yang TIDAK termasuk (memerlukan pembangunan):**
> - ❌ Kod pelaksanaan ejen (Ejen Pelanggan, Ejen Inventori)
> - ❌ Logik penghalaan dan titik akhir API
> - ❌ UI sembang hadapan
> - ❌ Skema indeks carian dan saluran data
> - ❌ **Anggaran usaha pembangunan: 80-120 jam**
>  
> **Gunakan templat ini jika:**
> - ✅ Anda ingin menyediakan infrastruktur Azure untuk projek multi-ejen
> - ✅ Anda merancang untuk membangunkan pelaksanaan ejen secara berasingan
> - ✅ Anda memerlukan asas infrastruktur sedia pengeluaran
>  
> **Jangan gunakan jika:**
> - ❌ Anda mengharapkan demo multi-ejen yang berfungsi dengan segera
> - ❌ Anda mencari contoh kod aplikasi lengkap

## Gambaran Keseluruhan

Direktori ini mengandungi templat Azure Resource Manager (ARM) yang komprehensif untuk memasang **asas infrastruktur** sistem sokongan pelanggan multi-ejen. Templat ini menyediakan semua perkhidmatan Azure yang diperlukan, dikonfigurasi dan disambungkan dengan betul, sedia untuk pembangunan aplikasi anda.

**Selepas pemasangan, anda akan mempunyai:** Infrastruktur Azure sedia pengeluaran  
**Untuk melengkapkan sistem, anda perlukan:** Kod ejen, UI hadapan, dan konfigurasi data (lihat [Panduan Seni Bina](../retail-scenario.md))

## 🎯 Apa Yang Dipasang

### Infrastruktur Teras (Status Selepas Pemasangan)

✅ **Perkhidmatan Azure OpenAI** (Sedia untuk panggilan API)
  - Rantau utama: Pemasangan GPT-4o (kapasiti 20K TPM)
  - Rantau sekunder: Pemasangan GPT-4o-mini (kapasiti 10K TPM)
  - Rantau tertiari: Model embeddings teks (kapasiti 30K TPM)
  - Rantau penilaian: Model grader GPT-4o (kapasiti 15K TPM)
  - **Status:** Berfungsi sepenuhnya - boleh membuat panggilan API dengan segera

✅ **Azure AI Search** (Kosong - sedia untuk konfigurasi)
  - Keupayaan carian vektor diaktifkan
  - Tahap standard dengan 1 partisi, 1 replika
  - **Status:** Perkhidmatan berjalan, tetapi memerlukan penciptaan indeks
  - **Tindakan diperlukan:** Cipta indeks carian dengan skema anda

✅ **Akaun Storan Azure** (Kosong - sedia untuk muat naik)
  - Kontena blob: `documents`, `uploads`
  - Konfigurasi selamat (HTTPS sahaja, tiada akses awam)
  - **Status:** Sedia untuk menerima fail
  - **Tindakan diperlukan:** Muat naik data produk dan dokumen anda

⚠️ **Persekitaran Aplikasi Kontena** (Imej sementara dipasang)
  - Aplikasi penghala ejen (imej lalai nginx)
  - Aplikasi hadapan (imej lalai nginx)
  - Penskalaan automatik dikonfigurasi (0-10 instans)
  - **Status:** Menjalankan kontena sementara
  - **Tindakan diperlukan:** Bina dan pasang aplikasi ejen anda

✅ **Azure Cosmos DB** (Kosong - sedia untuk data)
  - Pangkalan data dan kontena telah dikonfigurasi
  - Dioptimumkan untuk operasi latensi rendah
  - TTL diaktifkan untuk pembersihan automatik
  - **Status:** Sedia untuk menyimpan sejarah sembang

✅ **Azure Key Vault** (Pilihan - sedia untuk rahsia)
  - Penghapusan lembut diaktifkan
  - RBAC dikonfigurasi untuk identiti terurus
  - **Status:** Sedia untuk menyimpan kunci API dan rentetan sambungan

✅ **Application Insights** (Pilihan - pemantauan aktif)
  - Disambungkan ke ruang kerja Log Analytics
  - Metrik dan amaran tersuai dikonfigurasi
  - **Status:** Sedia untuk menerima telemetri daripada aplikasi anda

✅ **Document Intelligence** (Sedia untuk panggilan API)
  - Tahap S0 untuk beban kerja pengeluaran
  - **Status:** Sedia untuk memproses dokumen yang dimuat naik

✅ **Bing Search API** (Sedia untuk panggilan API)
  - Tahap S1 untuk carian masa nyata
  - **Status:** Sedia untuk pertanyaan carian web

### Mod Pemasangan

| Mod | Kapasiti OpenAI | Instans Kontena | Tahap Carian | Redundansi Storan | Terbaik Untuk |
|------|-----------------|-----------------|--------------|-------------------|---------------|
| **Minimal** | 10K-20K TPM | 0-2 replika | Basic | LRS (Lokal) | Dev/test, pembelajaran, bukti konsep |
| **Standard** | 30K-60K TPM | 2-5 replika | Standard | ZRS (Zon) | Pengeluaran, trafik sederhana (<10K pengguna) |
| **Premium** | 80K-150K TPM | 5-10 replika, zon-redundant | Premium | GRS (Geo) | Enterprise, trafik tinggi (>10K pengguna), SLA 99.99% |

**Kesan Kos:**
- **Minimal → Standard:** ~4x peningkatan kos ($100-370/bulan → $420-1,450/bulan)
- **Standard → Premium:** ~3x peningkatan kos ($420-1,450/bulan → $1,150-3,500/bulan)
- **Pilih berdasarkan:** Beban yang dijangka, keperluan SLA, kekangan bajet

**Perancangan Kapasiti:**
- **TPM (Token Per Minit):** Jumlah keseluruhan untuk semua pemasangan model
- **Instans Kontena:** Julat penskalaan automatik (replika min-maks)
- **Tahap Carian:** Mempengaruhi prestasi pertanyaan dan had saiz indeks

## 📋 Prasyarat

### Alat Diperlukan
1. **Azure CLI** (versi 2.50.0 atau lebih tinggi)
   ```bash
   az --version  # Semak versi
   az login      # Sahkan
   ```

2. **Langganan Azure aktif** dengan akses Pemilik atau Penyumbang
   ```bash
   az account show  # Sahkan langganan
   ```

### Kuota Azure Diperlukan

Sebelum pemasangan, pastikan kuota mencukupi di rantau sasaran anda:

```bash
# Periksa ketersediaan Azure OpenAI di rantau anda
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus2

# Sahkan kuota OpenAI (contoh untuk gpt-4o)
az cognitiveservices usage list \
  --location eastus2 \
  --query "[?name.value=='OpenAI.Standard.gpt-4o']"

# Periksa kuota Aplikasi Kontena
az provider show \
  --namespace Microsoft.App \
  --query "resourceTypes[?resourceType=='managedEnvironments'].locations"
```

**Kuota Minimum Diperlukan:**
- **Azure OpenAI:** 3-4 pemasangan model di seluruh rantau
  - GPT-4o: 20K TPM (Token Per Minit)
  - GPT-4o-mini: 10K TPM
  - text-embedding-ada-002: 30K TPM
  - **Nota:** GPT-4o mungkin dalam senarai menunggu di beberapa rantau - periksa [ketersediaan model](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- **Aplikasi Kontena:** Persekitaran terurus + 2-10 instans kontena
- **AI Search:** Tahap standard (Basic tidak mencukupi untuk carian vektor)
- **Cosmos DB:** Throughput standard yang diperuntukkan

**Jika kuota tidak mencukupi:**
1. Pergi ke Portal Azure → Kuota → Minta peningkatan
2. Atau gunakan Azure CLI:
   ```bash
   az support tickets create \
     --ticket-name "OpenAI-Quota-Increase" \
     --severity "minimal" \
     --description "Request quota increase for Azure OpenAI GPT-4o in eastus2"
   ```
3. Pertimbangkan rantau alternatif dengan ketersediaan

## 🚀 Pemasangan Pantas

### Pilihan 1: Menggunakan Azure CLI

```bash
# Klon atau muat turun fail templat
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Jadikan skrip penyebaran boleh laku
chmod +x deploy.sh

# Sebarkan dengan tetapan lalai
./deploy.sh -g myResourceGroup

# Sebarkan untuk pengeluaran dengan ciri premium
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Pilihan 2: Menggunakan Portal Azure

[![Pasang ke Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Pilihan 3: Menggunakan Azure CLI secara langsung

```bash
# Cipta kumpulan sumber
az group create --name myResourceGroup --location eastus2

# Sebarkan templat
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⏱️ Garis Masa Pemasangan

### Apa Yang Dijangka

| Fasa | Tempoh | Apa Yang Berlaku |
|------|--------|------------------||
| **Pengesahan Templat** | 30-60 saat | Azure mengesahkan sintaks templat ARM dan parameter |
| **Penyediaan Kumpulan Sumber** | 10-20 saat | Mencipta kumpulan sumber (jika diperlukan) |
| **Penyediaan OpenAI** | 5-8 minit | Mencipta 3-4 akaun OpenAI dan memasang model |
| **Aplikasi Kontena** | 3-5 minit | Mencipta persekitaran dan memasang kontena sementara |
| **Carian & Storan** | 2-4 minit | Menyediakan perkhidmatan AI Search dan akaun storan |
| **Cosmos DB** | 2-3 minit | Mencipta pangkalan data dan mengkonfigurasi kontena |
| **Penyediaan Pemantauan** | 2-3 minit | Menyediakan Application Insights dan Log Analytics |
| **Konfigurasi RBAC** | 1-2 minit | Mengkonfigurasi identiti terurus dan kebenaran |
| **Jumlah Pemasangan** | **15-25 minit** | Infrastruktur lengkap sedia |

**Selepas Pemasangan:**
- ✅ **Infrastruktur Sedia:** Semua perkhidmatan Azure disediakan dan berjalan
- ⏱️ **Pembangunan Aplikasi:** 80-120 jam (tanggungjawab anda)
- ⏱️ **Konfigurasi Indeks:** 15-30 minit (memerlukan skema anda)
- ⏱️ **Muat Naik Data:** Berbeza mengikut saiz set data
- ⏱️ **Ujian & Pengesahan:** 2-4 jam

---

## ✅ Sahkan Kejayaan Pemasangan

### Langkah 1: Periksa Penyediaan Sumber (2 minit)

```bash
# Sahkan semua sumber berjaya dikerahkan
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

**Dijangka:** Jadual kosong (semua sumber menunjukkan status "Berjaya")

### Langkah 2: Sahkan Pemasangan Azure OpenAI (3 minit)

```bash
# Senaraikan semua akaun OpenAI
az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'].{Name:name, Location:location, Status:properties.provisioningState}" \
  --output table

# Semak penyebaran model untuk wilayah utama
OPENAI_NAME=$(az cognitiveservices account list \
  --resource-group myResourceGroup \
  --query "[?kind=='OpenAI'] | [0].name" -o tsv)

az cognitiveservices account deployment list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --output table
```

**Dijangka:** 
- 3-4 akaun OpenAI (rantau utama, sekunder, tertiari, penilaian)
- 1-2 pemasangan model setiap akaun (gpt-4o, gpt-4o-mini, text-embedding-ada-002)

### Langkah 3: Uji Titik Akhir Infrastruktur (5 minit)

```bash
# Dapatkan URL Aplikasi Kontena
az containerapp list \
  --resource-group myResourceGroup \
  --query "[].{Name:name, URL:properties.configuration.ingress.fqdn, Status:properties.runningStatus}" \
  --output table

# Uji titik akhir router (imej pemegang tempat akan memberi respons)
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

echo "Testing: https://$ROUTER_URL"
curl -I https://$ROUTER_URL || echo "Container running (placeholder image - expected)"
```

**Dijangka:** 
- Aplikasi Kontena menunjukkan status "Berjalan"
- Nginx sementara memberi respons dengan HTTP 200 atau 404 (tiada kod aplikasi lagi)

### Langkah 4: Sahkan Akses API Azure OpenAI (3 minit)

```bash
# Dapatkan titik akhir OpenAI dan kunci
OPENAI_ENDPOINT=$(az cognitiveservices account show \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "properties.endpoint" -o tsv)

OPENAI_KEY=$(az cognitiveservices account keys list \
  --name $OPENAI_NAME \
  --resource-group myResourceGroup \
  --query "key1" -o tsv)

# Uji pengedaran GPT-4o
curl "${OPENAI_ENDPOINT}openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello"}],
    "max_tokens": 10
  }'
```

**Dijangka:** Respons JSON dengan penyelesaian sembang (mengesahkan OpenAI berfungsi)

### Apa Yang Berfungsi vs. Apa Yang Tidak

**✅ Berfungsi Selepas Pemasangan:**
- Model Azure OpenAI dipasang dan menerima panggilan API
- Perkhidmatan AI Search berjalan (kosong, tiada indeks lagi)
- Aplikasi Kontena berjalan (imej nginx sementara)
- Akaun storan boleh diakses dan sedia untuk muat naik
- Cosmos DB sedia untuk operasi data
- Application Insights mengumpul telemetri infrastruktur
- Key Vault sedia untuk penyimpanan rahsia

**❌ Belum Berfungsi (Memerlukan Pembangunan):**
- Titik akhir ejen (tiada kod aplikasi dipasang)
- Fungsi sembang (memerlukan pelaksanaan frontend + backend)
- Pertanyaan carian (tiada indeks carian dicipta lagi)
- Saluran pemprosesan dokumen (tiada data dimuat naik)
- Telemetri tersuai (memerlukan instrumentasi aplikasi)

**Langkah Seterusnya:** Lihat [Konfigurasi Selepas Pemasangan](../../../../examples/retail-multiagent-arm-template) untuk membangunkan dan memasang aplikasi anda

---

## ⚙️ Pilihan Konfigurasi

### Parameter Templat

| Parameter | Jenis | Lalai | Penerangan |
|-----------|-------|-------|------------|
| `projectName` | string | "retail" | Awalan untuk semua nama sumber |
| `location` | string | Lokasi kumpulan sumber | Rantau pemasangan utama |
| `secondaryLocation` | string | "westus2" | Rantau sekunder untuk pemasangan pelbagai rantau |
| `tertiaryLocation` | string | "francecentral" | Rantau untuk model embeddings |
| `environmentName` | string | "dev" | Penetapan persekitaran (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfigurasi pemasangan (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Aktifkan pemasangan pelbagai rantau |
| `enableMonitoring` | bool | true | Aktifkan Application Insights dan log |
| `enableSecurity` | bool | true | Aktifkan Key Vault dan keselamatan tambahan |

### Menyesuaikan Parameter

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

## 🏗️ Gambaran Keseluruhan Seni Bina

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

## 📖 Penggunaan Skrip Pemasangan

Skrip `deploy.sh` menyediakan pengalaman pemasangan interaktif:

```bash
# Tunjukkan bantuan
./deploy.sh --help

# Penggunaan asas
./deploy.sh -g myResourceGroup

# Penggunaan lanjutan dengan tetapan tersuai
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Penggunaan pembangunan tanpa pelbagai wilayah
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Ciri Skrip

- ✅ **Pengesahan prasyarat** (Azure CLI, status log masuk, fail templat)
- ✅ **Pengurusan kumpulan sumber** (mencipta jika tiada)
- ✅ **Pengesahan templat** sebelum pemasangan
- ✅ **Pemantauan kemajuan** dengan output berwarna
- ✅ **Paparan output pemasangan**
- ✅ **Panduan selepas pemasangan**

## 📊 Memantau Pemasangan

### Periksa Status Pemasangan

```bash
# Senaraikan pengedaran
az deployment group list --resource-group myResourceGroup --output table

# Dapatkan butiran pengedaran
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Pantau kemajuan pengedaran
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Output Pemasangan

Selepas pemasangan berjaya, output berikut tersedia:

- **URL Hadapan**: Titik akhir awam untuk antara muka web
- **URL Router**: Titik akhir API untuk penghala ejen
- **Titik Akhir OpenAI**: Titik akhir perkhidmatan OpenAI utama dan sekunder
- **Perkhidmatan Carian**: Titik akhir perkhidmatan Azure AI Search
- **Akaun Storan**: Nama akaun storan untuk dokumen
- **Key Vault**: Nama Key Vault (jika diaktifkan)
- **Application Insights**: Nama perkhidmatan pemantauan (jika diaktifkan)

## 🔧 Selepas Pemasangan: Langkah Seterusnya
> **📝 Penting:** Infrastruktur telah dikerahkan, tetapi anda perlu membangunkan dan mengerahkan kod aplikasi.

### Fasa 1: Bangunkan Aplikasi Ejen (Tanggungjawab Anda)

Templat ARM mencipta **Container Apps kosong** dengan imej nginx sebagai pemegang tempat. Anda perlu:

**Pembangunan Diperlukan:**
1. **Pelaksanaan Ejen** (30-40 jam)
   - Ejen perkhidmatan pelanggan dengan integrasi GPT-4o
   - Ejen inventori dengan integrasi GPT-4o-mini
   - Logik penghalaan ejen

2. **Pembangunan Antara Muka Depan** (20-30 jam)
   - Antara muka sembang UI (React/Vue/Angular)
   - Fungsi muat naik fail
   - Pemaparan dan pemformatan respons

3. **Perkhidmatan Backend** (12-16 jam)
   - Router FastAPI atau Express
   - Middleware pengesahan
   - Integrasi telemetri

**Lihat:** [Panduan Seni Bina](../retail-scenario.md) untuk corak pelaksanaan dan contoh kod terperinci

### Fasa 2: Konfigurasi Indeks Carian AI (15-30 minit)

Cipta indeks carian yang sepadan dengan model data anda:

```bash
# Dapatkan butiran perkhidmatan carian
SEARCH_NAME=$(az search service list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

SEARCH_KEY=$(az search admin-key show \
  --service-name $SEARCH_NAME \
  --resource-group myResourceGroup \
  --query "primaryKey" -o tsv)

# Cipta indeks dengan skema anda (contoh)
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

**Sumber:**
- [Reka Bentuk Skema Indeks Carian AI](https://learn.microsoft.com/azure/search/search-what-is-an-index)
- [Konfigurasi Carian Vektor](https://learn.microsoft.com/azure/search/vector-search-how-to-create-index)

### Fasa 3: Muat Naik Data Anda (Masa berbeza-beza)

Setelah anda mempunyai data produk dan dokumen:

```bash
# Dapatkan butiran akaun storan
STORAGE_NAME=$(az storage account list \
  --resource-group myResourceGroup \
  --query "[0].name" -o tsv)

STORAGE_KEY=$(az storage account keys list \
  --account-name $STORAGE_NAME \
  --resource-group myResourceGroup \
  --query "[0].value" -o tsv)

# Muat naik dokumen anda
az storage blob upload-batch \
  --destination documents \
  --source /path/to/your/product/docs \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY

# Contoh: Muat naik fail tunggal
az storage blob upload \
  --container-name documents \
  --name "product-manual.pdf" \
  --file /path/to/product-manual.pdf \
  --account-name $STORAGE_NAME \
  --account-key $STORAGE_KEY
```

### Fasa 4: Bina dan Kerahkan Aplikasi Anda (8-12 jam)

Setelah anda membangunkan kod ejen anda:

```bash
# 1. Cipta Azure Container Registry (jika diperlukan)
az acr create \
  --name myregistry \
  --resource-group myResourceGroup \
  --sku Basic

# 2. Bina dan tolak imej agent router
docker build -t myregistry.azurecr.io/agent-router:v1 /path/to/your/router/code
az acr login --name myregistry
docker push myregistry.azurecr.io/agent-router:v1

# 3. Bina dan tolak imej frontend
docker build -t myregistry.azurecr.io/frontend:v1 /path/to/your/frontend/code
docker push myregistry.azurecr.io/frontend:v1

# 4. Kemas kini Container Apps dengan imej anda
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:v1

az containerapp update \
  --name retail-frontend \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/frontend:v1

# 5. Konfigurasikan pembolehubah persekitaran
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --set-env-vars \
    OPENAI_ENDPOINT=secretref:openai-endpoint \
    OPENAI_KEY=secretref:openai-key \
    SEARCH_ENDPOINT=secretref:search-endpoint \
    SEARCH_KEY=secretref:search-key
```

### Fasa 5: Uji Aplikasi Anda (2-4 jam)

```bash
# Dapatkan URL aplikasi anda
ROUTER_URL=$(az containerapp show \
  --name retail-router \
  --resource-group myResourceGroup \
  --query "properties.configuration.ingress.fqdn" -o tsv)

# Uji titik akhir ejen (setelah kod anda dikerahkan)
curl -X POST "https://${ROUTER_URL}/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'

# Semak log aplikasi
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow
```

### Sumber Pelaksanaan

**Seni Bina & Reka Bentuk:**
- 📖 [Panduan Seni Bina Lengkap](../retail-scenario.md) - Corak pelaksanaan terperinci
- 📖 [Corak Reka Bentuk Multi-Ejen](https://learn.microsoft.com/azure/architecture/ai-ml/guide/multi-agent-systems)

**Contoh Kod:**
- 🔗 [Contoh Sembang Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) - Corak RAG
- 🔗 [Kernel Semantik](https://github.com/microsoft/semantic-kernel) - Rangka kerja ejen (C#)
- 🔗 [LangChain Azure](https://github.com/langchain-ai/langchain) - Orkestrasi ejen (Python)
- 🔗 [AutoGen](https://github.com/microsoft/autogen) - Perbualan multi-ejen

**Anggaran Jumlah Usaha:**
- Pengerahan infrastruktur: 15-25 minit (✅ Selesai)
- Pembangunan aplikasi: 80-120 jam (🔨 Kerja anda)
- Ujian dan pengoptimuman: 15-25 jam (🔨 Kerja anda)

## 🛠️ Penyelesaian Masalah

### Isu Biasa

#### 1. Kuota Azure OpenAI Melebihi

```bash
# Semak penggunaan kuota semasa
az cognitiveservices usage list --location eastus2

# Memohon peningkatan kuota
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Pengerahan Container Apps Gagal

```bash
# Semak log aplikasi kontena
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Mulakan semula aplikasi kontena
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inisialisasi Perkhidmatan Carian

```bash
# Sahkan status perkhidmatan carian
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Uji kesambungan perkhidmatan carian
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Pengesahan Pengerahan

```bash
# Sahkan semua sumber telah dicipta
az resource list \
  --resource-group myResourceGroup \
  --output table

# Periksa kesihatan sumber
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Pertimbangan Keselamatan

### Pengurusan Kunci
- Semua rahsia disimpan dalam Azure Key Vault (jika diaktifkan)
- Container apps menggunakan identiti terurus untuk pengesahan
- Akaun storan mempunyai tetapan lalai selamat (HTTPS sahaja, tiada akses blob awam)

### Keselamatan Rangkaian
- Container apps menggunakan rangkaian dalaman jika boleh
- Perkhidmatan carian dikonfigurasi dengan pilihan titik akhir peribadi
- Cosmos DB dikonfigurasi dengan kebenaran minimum yang diperlukan

### Konfigurasi RBAC
```bash
# Tetapkan peranan yang diperlukan untuk identiti terurus
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Pengoptimuman Kos

### Anggaran Kos (Bulanan, USD)

| Mod | OpenAI | Container Apps | Carian | Storan | Jumlah Anggaran |
|-----|--------|----------------|--------|--------|-----------------|
| Minimum | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Pemantauan Kos

```bash
# Tetapkan amaran bajet
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Kemas Kini dan Penyelenggaraan

### Kemas Kini Templat
- Kawal versi fail templat ARM
- Uji perubahan dalam persekitaran pembangunan terlebih dahulu
- Gunakan mod pengerahan tambahan untuk kemas kini

### Kemas Kini Sumber
```bash
# Kemas kini dengan parameter baru
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Sandaran dan Pemulihan
- Sandaran automatik Cosmos DB diaktifkan
- Pemadaman lembut Key Vault diaktifkan
- Semakan aplikasi kontena dikekalkan untuk pemulihan

## 📞 Sokongan

- **Isu Templat**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Sokongan Azure**: [Portal Sokongan Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komuniti**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Sedia untuk mengerahkan penyelesaian multi-ejen anda?**

Mulakan dengan: `./deploy.sh -g myResourceGroup`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->