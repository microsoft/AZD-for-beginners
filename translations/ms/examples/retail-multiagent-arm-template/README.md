<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-18T08:44:39+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "ms"
}
-->
# Penyelesaian Multi-Ejen Runcit - Penerapan Templat ARM

**Bab 5: Pakej Penerapan Pengeluaran**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Berkaitan**: [Bab 5: Penyelesaian AI Multi-Ejen](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Panduan Senario**: [Pelaksanaan Lengkap](../retail-scenario.md)
- **🎯 Penerapan Pantas**: [Penerapan Satu Klik](../../../../examples/retail-multiagent-arm-template)

Direktori ini mengandungi templat Azure Resource Manager (ARM) lengkap untuk menerapkan Penyelesaian Sokongan Pelanggan Multi-Ejen Runcit, menyediakan infrastruktur sebagai kod untuk keseluruhan seni bina.

## 🎯 Apa Yang Akan Diterapkan

### Infrastruktur Teras
- **Perkhidmatan Azure OpenAI** (Multi-region untuk ketersediaan tinggi)
  - Wilayah utama: GPT-4o untuk ejen Pelanggan
  - Wilayah sekunder: GPT-4o-mini untuk ejen Inventori  
  - Wilayah tertiari: Model teks embeddings
  - Wilayah penilaian: Model GPT-4o grader
- **Azure AI Search** dengan keupayaan carian vektor
- **Azure Storage Account** dengan kontena blob untuk dokumen dan muat naik
- **Persekitaran Azure Container Apps** dengan auto-scaling
- **Container Apps** untuk penghala ejen dan frontend
- **Azure Cosmos DB** untuk penyimpanan sejarah sembang
- **Azure Key Vault** untuk pengurusan rahsia (pilihan)
- **Application Insights** dan Log Analytics untuk pemantauan (pilihan)
- **Document Intelligence** untuk pemprosesan dokumen
- **Bing Search API** untuk maklumat masa nyata

### Mod Penerapan

| Mod | Penerangan | Kes Penggunaan | Sumber |
|-----|------------|----------------|--------|
| **Minimal** | Penerapan asas yang dioptimumkan kos | Pembangunan, ujian | SKU asas, satu wilayah, kapasiti dikurangkan |
| **Standard** | Penerapan seimbang untuk beban kerja pengeluaran | Pengeluaran, skala sederhana | SKU standard, multi-region, kapasiti standard |
| **Premium** | Penerapan berprestasi tinggi, gred perusahaan | Perusahaan, skala tinggi | SKU premium, multi-region, kapasiti tinggi |

## 📋 Prasyarat

1. **Azure CLI** dipasang dan dikonfigurasi
2. **Langganan Azure aktif** dengan kuota mencukupi
3. **Kebenaran yang sesuai** untuk mencipta sumber dalam langganan sasaran
4. **Kuota sumber** untuk:
   - Azure OpenAI (semak ketersediaan wilayah)
   - Container Apps (berbeza mengikut wilayah)
   - AI Search (tier standard atau lebih tinggi disyorkan)

## 🚀 Penerapan Pantas

### Pilihan 1: Menggunakan Azure CLI

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

### Pilihan 2: Menggunakan Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Pilihan 3: Menggunakan Azure CLI secara langsung

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Pilihan Konfigurasi

### Parameter Templat

| Parameter | Jenis | Lalai | Penerangan |
|-----------|-------|-------|------------|
| `projectName` | string | "retail" | Awalan untuk semua nama sumber |
| `location` | string | Lokasi kumpulan sumber | Wilayah penerapan utama |
| `secondaryLocation` | string | "westus2" | Wilayah sekunder untuk penerapan multi-region |
| `tertiaryLocation` | string | "francecentral" | Wilayah untuk model embeddings |
| `environmentName` | string | "dev" | Penetapan persekitaran (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Konfigurasi penerapan (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Aktifkan penerapan multi-region |
| `enableMonitoring` | bool | true | Aktifkan Application Insights dan logging |
| `enableSecurity` | bool | true | Aktifkan Key Vault dan keselamatan yang dipertingkatkan |

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

## 📖 Penggunaan Skrip Penerapan

Skrip `deploy.sh` menyediakan pengalaman penerapan interaktif:

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

### Ciri Skrip

- ✅ **Pengesahan prasyarat** (Azure CLI, status log masuk, fail templat)
- ✅ **Pengurusan kumpulan sumber** (mencipta jika tidak wujud)
- ✅ **Pengesahan templat** sebelum penerapan
- ✅ **Pemantauan kemajuan** dengan output berwarna
- ✅ **Paparan output penerapan**
- ✅ **Panduan selepas penerapan**

## 📊 Pemantauan Penerapan

### Semak Status Penerapan

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

### Output Penerapan

Selepas penerapan berjaya, output berikut tersedia:

- **URL Frontend**: Titik akhir awam untuk antara muka web
- **URL Router**: Titik akhir API untuk penghala ejen
- **Titik Akhir OpenAI**: Titik akhir perkhidmatan OpenAI utama dan sekunder
- **Perkhidmatan Carian**: Titik akhir perkhidmatan Azure AI Search
- **Akaun Penyimpanan**: Nama akaun penyimpanan untuk dokumen
- **Key Vault**: Nama Key Vault (jika diaktifkan)
- **Application Insights**: Nama perkhidmatan pemantauan (jika diaktifkan)

## 🔧 Konfigurasi Selepas Penerapan

### 1. Konfigurasi Indeks Carian

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

### 2. Muat Naik Data Awal

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Uji Titik Akhir Ejen

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

Templat ARM menerapkan imej kontena placeholder. Untuk menerapkan kod ejen sebenar:

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

## 🛠️ Penyelesaian Masalah

### Isu Biasa

#### 1. Kuota Azure OpenAI Melebihi

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Penerapan Container Apps Gagal

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

#### 3. Permulaan Perkhidmatan Carian

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Pengesahan Penerapan

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

## 🔐 Pertimbangan Keselamatan

### Pengurusan Kunci
- Semua rahsia disimpan dalam Azure Key Vault (jika diaktifkan)
- Container apps menggunakan identiti terurus untuk pengesahan
- Akaun penyimpanan mempunyai tetapan lalai yang selamat (HTTPS sahaja, tiada akses blob awam)

### Keselamatan Rangkaian
- Container apps menggunakan rangkaian dalaman jika boleh
- Perkhidmatan carian dikonfigurasi dengan pilihan titik akhir peribadi
- Cosmos DB dikonfigurasi dengan kebenaran minimum yang diperlukan

### Konfigurasi RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Pengoptimuman Kos

### Anggaran Kos (Bulanan, USD)

| Mod | OpenAI | Container Apps | Search | Storage | Jumlah Anggaran |
|-----|--------|----------------|--------|---------|-----------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Pemantauan Kos

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

## 🔄 Kemas Kini dan Penyelenggaraan

### Kemas Kini Templat
- Kawal versi fail templat ARM
- Uji perubahan dalam persekitaran pembangunan terlebih dahulu
- Gunakan mod penerapan incremental untuk kemas kini

### Kemas Kini Sumber
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Sandaran dan Pemulihan
- Sandaran automatik Cosmos DB diaktifkan
- Soft delete Key Vault diaktifkan
- Revisi aplikasi kontena dikekalkan untuk rollback

## 📞 Sokongan

- **Isu Templat**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Sokongan Azure**: [Portal Sokongan Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Komuniti**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Sedia untuk menerapkan penyelesaian multi-ejen anda?**

Mulakan dengan: `./deploy.sh -g myResourceGroup`

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.