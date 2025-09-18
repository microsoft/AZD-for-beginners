<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T08:44:13+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "id"
}
-->
# Solusi Multi-Agent Retail - Deployment Template ARM

**Bab 5: Paket Deployment Produksi**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Terkait**: [Bab 5: Solusi AI Multi-Agent](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Panduan Skenario**: [Implementasi Lengkap](../retail-scenario.md)
- **🎯 Deploy Cepat**: [Deployment Satu Klik](../../../../examples/retail-multiagent-arm-template)

Direktori ini berisi template Azure Resource Manager (ARM) lengkap untuk mendeply Solusi Dukungan Pelanggan Multi-Agent Retail, menyediakan infrastruktur sebagai kode untuk seluruh arsitektur.

## 🎯 Apa yang Dideploy

### Infrastruktur Inti
- **Azure OpenAI Services** (Multi-region untuk ketersediaan tinggi)
  - Wilayah utama: GPT-4o untuk agen Pelanggan
  - Wilayah sekunder: GPT-4o-mini untuk agen Inventori  
  - Wilayah tersier: Model embedding teks
  - Wilayah evaluasi: Model grader GPT-4o
- **Azure AI Search** dengan kemampuan pencarian vektor
- **Azure Storage Account** dengan blob container untuk dokumen dan unggahan
- **Lingkungan Azure Container Apps** dengan auto-scaling
- **Container Apps** untuk router agen dan frontend
- **Azure Cosmos DB** untuk penyimpanan riwayat obrolan
- **Azure Key Vault** untuk pengelolaan rahasia (opsional)
- **Application Insights** dan Log Analytics untuk pemantauan (opsional)
- **Document Intelligence** untuk pemrosesan dokumen
- **Bing Search API** untuk informasi real-time

### Mode Deployment

| Mode | Deskripsi | Use Case | Sumber Daya |
|------|-------------|----------|-----------|
| **Minimal** | Deployment dasar yang hemat biaya | Pengembangan, pengujian | SKU dasar, satu wilayah, kapasitas rendah |
| **Standar** | Deployment seimbang untuk beban kerja produksi | Produksi, skala sedang | SKU standar, multi-region, kapasitas standar |
| **Premium** | Deployment berkinerja tinggi, kelas enterprise | Enterprise, skala besar | SKU premium, multi-region, kapasitas tinggi |

## 📋 Prasyarat

1. **Azure CLI** terinstal dan dikonfigurasi
2. **Langganan Azure aktif** dengan kuota yang cukup
3. **Izin yang sesuai** untuk membuat sumber daya di langganan target
4. **Kuota sumber daya** untuk:
   - Azure OpenAI (periksa ketersediaan regional)
   - Container Apps (bervariasi berdasarkan wilayah)
   - AI Search (disarankan tier standar atau lebih tinggi)

## 🚀 Deployment Cepat

### Opsi 1: Menggunakan Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Opsi 2: Menggunakan Azure Portal

[![Deploy ke Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Opsi 3: Menggunakan Azure CLI secara langsung

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Opsi Konfigurasi

### Parameter Template

| Parameter | Tipe | Default | Deskripsi |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | Prefix untuk semua nama sumber daya |
| `location` | string | Lokasi grup sumber daya | Wilayah deployment utama |
| `secondaryLocation` | string | "westus2" | Wilayah sekunder untuk deployment multi-region |
| `tertiaryLocation` | string | "francecentral" | Wilayah untuk model embedding |
| `environmentName` | string | "dev" | Penunjukan lingkungan (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfigurasi deployment (minimal/standar/premium) |
| `enableMultiRegion` | bool | true | Aktifkan deployment multi-region |
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

## 🏗️ Gambaran Arsitektur

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

## 📖 Penggunaan Script Deployment

Script `deploy.sh` menyediakan pengalaman deployment interaktif:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Fitur Script

- ✅ **Validasi prasyarat** (Azure CLI, status login, file template)
- ✅ **Manajemen grup sumber daya** (membuat jika belum ada)
- ✅ **Validasi template** sebelum deployment
- ✅ **Pemantauan progres** dengan output berwarna
- ✅ **Tampilan output deployment**
- ✅ **Panduan pasca-deployment**

## 📊 Pemantauan Deployment

### Periksa Status Deployment

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Output Deployment

Setelah deployment berhasil, output berikut tersedia:

- **URL Frontend**: Endpoint publik untuk antarmuka web
- **URL Router**: Endpoint API untuk router agen
- **Endpoint OpenAI**: Endpoint layanan OpenAI utama dan sekunder
- **Layanan Pencarian**: Endpoint layanan Azure AI Search
- **Storage Account**: Nama akun penyimpanan untuk dokumen
- **Key Vault**: Nama Key Vault (jika diaktifkan)
- **Application Insights**: Nama layanan pemantauan (jika diaktifkan)

## 🔧 Konfigurasi Pasca-Deployment

### 1. Konfigurasi Indeks Pencarian

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Unggah Data Awal

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Uji Endpoint Agen

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Konfigurasi Container Apps

Template ARM mendeply gambar container placeholder. Untuk mendeply kode agen yang sebenarnya:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Pemecahan Masalah

### Masalah Umum

#### 1. Kuota Azure OpenAI Terlampaui

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Deployment Container Apps Gagal

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Inisialisasi Layanan Pencarian

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Validasi Deployment

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Pertimbangan Keamanan

### Manajemen Kunci
- Semua rahasia disimpan di Azure Key Vault (jika diaktifkan)
- Container apps menggunakan identitas terkelola untuk autentikasi
- Akun penyimpanan memiliki default aman (HTTPS saja, tidak ada akses blob publik)

### Keamanan Jaringan
- Container apps menggunakan jaringan internal jika memungkinkan
- Layanan pencarian dikonfigurasi dengan opsi endpoint privat
- Cosmos DB dikonfigurasi dengan izin minimum yang diperlukan

### Konfigurasi RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Optimasi Biaya

### Estimasi Biaya (Bulanan, USD)

| Mode | OpenAI | Container Apps | Pencarian | Penyimpanan | Total Est. |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standar | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Pemantauan Biaya

```bash
# Set up budget alerts
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
- Gunakan mode deployment incremental untuk pembaruan

### Pembaruan Sumber Daya
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Backup dan Pemulihan
- Backup otomatis Cosmos DB diaktifkan
- Soft delete Key Vault diaktifkan
- Revisi aplikasi container dipertahankan untuk rollback

## 📞 Dukungan

- **Masalah Template**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Dukungan Azure**: [Portal Dukungan Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komunitas**: [Discord Azure AI](https://discord.gg/microsoft-azure)

---

**⚡ Siap mendeply solusi multi-agent Anda?**

Mulai dengan: `./deploy.sh -g myResourceGroup`

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.