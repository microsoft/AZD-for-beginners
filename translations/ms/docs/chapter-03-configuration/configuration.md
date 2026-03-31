# Panduan Konfigurasi

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 3 - Konfigurasi & Pengesahan
- **⬅️ Sebelum**: [Projek Pertama Anda](first-project.md)
- **➡️ Seterusnya**: [Panduan Penempatan](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Bab Seterusnya**: [Bab 4: Infrastruktur sebagai Kod](../chapter-04-infrastructure/deployment-guide.md)

## Pengenalan

Panduan komprehensif ini merangkumi semua aspek konfigurasi Azure Developer CLI untuk aliran kerja pembangunan dan penempatan yang optimum. Anda akan mempelajari hierarki konfigurasi, pengurusan persekitaran, kaedah pengesahan, dan pola konfigurasi lanjutan yang membolehkan penempatan Azure yang cekap dan selamat.

## Matlamat Pembelajaran

Menjelang akhir pelajaran ini, anda akan:
- Menguasai hierarki konfigurasi azd dan memahami cara tetapan diprioritaskan
- Mengkonfigurasi tetapan global dan khusus projek dengan berkesan
- Menguruskan pelbagai persekitaran dengan konfigurasi berbeza
- Menerapkan pola pengesahan dan kebenaran yang selamat
- Memahami pola konfigurasi lanjutan untuk senario kompleks

## Hasil Pembelajaran

Selepas menyelesaikan pelajaran ini, anda akan dapat:
- Mengkonfigurasi azd untuk aliran kerja pembangunan yang optimum
- Menyediakan dan mengurus pelbagai persekitaran penempatan
- Menerapkan amalan pengurusan konfigurasi yang selamat
- Menyelesaikan masalah berkaitan konfigurasi
- Menyesuaikan tingkah laku azd mengikut keperluan organisasi tertentu

Panduan komprehensif ini merangkumi semua aspek konfigurasi Azure Developer CLI untuk aliran kerja pembangunan dan penempatan yang optimum.

## Memahami Ejen AI dalam Projek azd

Jika anda baru dengan ejen AI, ini adalah cara mudah untuk memikirkan mereka dalam dunia azd.

### Apakah Ejen?

Ejen ialah sejenis perisian yang boleh menerima permintaan, berfikir mengenainya, dan mengambil tindakan—sering dengan memanggil model AI, mencari data, atau menggunakan perkhidmatan lain. Dalam projek azd, ejen hanyalah **perkhidmatan** lain bersama frontend web atau API backend anda.

### Bagaimana Ejen Sesuai Dalam Struktur Projek azd

Projek azd terdiri daripada tiga lapisan: **infrastruktur**, **kod**, dan **konfigurasi**. Ejen disambungkan ke lapisan ini sama seperti mana-mana perkhidmatan lain:

| Lapisan | Fungsi Untuk Aplikasi Tradisional | Fungsi Untuk Ejen |
|-------|-------------------------------------|---------------------------|
| **Infrastruktur** (`infra/`) | Menyediakan aplikasi web dan pangkalan data | Menyediakan titik akhir model AI, indeks carian, atau hos ejen |
| **Kod** (`src/`) | Mengandungi kod sumber frontend dan API anda | Mengandungi logik ejen dan definisi arahan |
| **Konfigurasi** (`azure.yaml`) | Menyenaraikan perkhidmatan anda dan sasaran hosting mereka | Menyenaraikan ejen anda sebagai perkhidmatan, merujuk kepada kod dan hosnya |

### Peranan `azure.yaml`

Anda tidak perlu menghafal sintaks sekarang. Secara konsep, `azure.yaml` adalah fail di mana anda memberitahu azd: *"Ini adalah perkhidmatan yang membentuk aplikasi saya, dan ini tempat untuk mendapatkan kod mereka."*

Apabila projek anda termasuk ejen AI, `azure.yaml` hanya menyenaraikan ejen sebagai salah satu perkhidmatan. azd kemudian tahu untuk menyediakan infrastruktur yang betul (seperti titik akhir Microsoft Foundry Models atau Container App untuk menghos ejen) dan menempatkan kod ejen anda—sama seperti untuk aplikasi web atau API.

Ini bermakna tiada apa-apa yang benar-benar baru untuk dipelajari. Jika anda faham bagaimana azd menguruskan perkhidmatan web, anda sudah faham bagaimana ia menguruskan ejen.

## Hierarki Konfigurasi

azd menggunakan sistem konfigurasi berhierarki:
1. **Flag baris perintah** (keutamaan tertinggi)
2. **Pembolehubah persekitaran**
3. **Konfigurasi projek setempat** (`.azd/config.json`)
4. **Konfigurasi pengguna global** (`~/.azd/config.json`)
5. **Nilai lalai** (keutamaan terendah)

## Konfigurasi Global

### Menetapkan Lalai Global
```bash
# Tetapkan langganan lalai
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Tetapkan lokasi lalai
azd config set defaults.location "eastus2"

# Tetapkan konvensyen penamaan kumpulan sumber lalai
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Lihat semua konfigurasi global
azd config show

# Alih keluar konfigurasi
azd config unset defaults.location
```

### Tetapan Global Lazim
```bash
# Keutamaan pembangunan
azd config set alpha.enable true                    # Aktifkan ciri alpha
azd config set telemetry.enabled false             # Lumpuhkan telemetri
azd config set output.format json                  # Tetapkan format output

# Tetapan keselamatan
azd config set auth.useAzureCliCredential true     # Gunakan Azure CLI untuk pengesahan
azd config set tls.insecure false                  # Paksa pengesahan TLS

# Penalaan prestasi
azd config set provision.parallelism 5             # Penciptaan sumber secara selari
azd config set deploy.timeout 30m                  # Had masa penyebaran
```

## 🏗️ Konfigurasi Projek

### Struktur azure.yaml
Fail `azure.yaml` adalah teras projek azd anda:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### Pilihan Konfigurasi Perkhidmatan

#### Jenis Hos
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Tetapan Khusus Bahasa
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Pengurusan Persekitaran

### Membuat Persekitaran
```bash
# Cipta persekitaran baru
azd env new development

# Cipta dengan lokasi tertentu
azd env new staging --location "westus2"

# Cipta dari templat
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurasi Persekitaran
Setiap persekitaran mempunyai konfigurasi tersendiri di `.azure/<env-name>/config.json`:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Pembolehubah Persekitaran
```bash
# Tetapkan pembolehubah khusus persekitaran
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Lihat pembolehubah persekitaran
azd env get-values

# Jangkaan output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=kunci-api-rahsia
# DEBUG=benar

# Buang pembolehubah persekitaran
azd env unset DEBUG

# Sahkan pengeluaran
azd env get-values | grep DEBUG
# (sepatutnya tidak memulangkan apa-apa)
```

### Templat Persekitaran
Buat `.azure/env.template` untuk penetapan persekitaran yang konsisten:
```bash
# Pembolehubah yang diperlukan
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Tetapan aplikasi
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Tetapan pembangunan pilihan
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Konfigurasi Pengesahan

### Integrasi Azure CLI
```bash
# Gunakan kelayakan Azure CLI (default)
azd config set auth.useAzureCliCredential true

# Log masuk dengan penyewa tertentu
az login --tenant <tenant-id>

# Tetapkan langganan default
az account set --subscription <subscription-id>
```

### Pengesahan Principal Perkhidmatan
Untuk saluran CI/CD:
```bash
# Tetapkan pembolehubah persekitaran
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Atau konfigurasikan secara langsung
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identiti Terkawal
Untuk persekitaran hos Azure:
```bash
# Dayakan pengesahan identiti yang diuruskan
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfigurasi Infrastruktur

### Parameter Bicep
Konfigurasi parameter infrastruktur dalam `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Konfigurasi Terraform
Untuk projek Terraform, tetapkan dalam `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfigurasi Penempatan

### Konfigurasi Pembinaan
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Konfigurasi Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Contoh `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Konfigurasi Lanjutan

### Penamaan Sumber Tersuai
```bash
# Tetapkan konvensyen penamaan
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Konfigurasi Rangkaian
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Konfigurasi Pemantauan
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Konfigurasi Mengikut Persekitaran

### Persekitaran Pembangunan
```bash
# .azure/pembangunan/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Persekitaran Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Persekitaran Pengeluaran
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Pengesahan Konfigurasi

### Sahkan Konfigurasi
```bash
# Semak sintaks konfigurasi
azd config validate

# Uji pembolehubah persekitaran
azd env get-values

# Sahkan infrastruktur
azd provision --dry-run
```

### Skrip Konfigurasi
Buat skrip pengesahan dalam `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Semak pembolehubah persekitaran yang diperlukan
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Sahkan sintaks azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Amalan Terbaik

### 1. Gunakan Pembolehubah Persekitaran
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Atur Fail Konfigurasi
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Pertimbangan Kawalan Versi
```bash
# .gitignore
.azure/*/config.json         # Konfigurasi persekitaran (mengandungi ID sumber)
.azure/*/.env               # Pembolehubah persekitaran (mungkin mengandungi rahsia)
.env                        # Fail persekitaran tempatan
```

### 4. Dokumentasi Konfigurasi
Dokumentasikan konfigurasi anda dalam `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Latihan Amali

### Latihan 1: Konfigurasi Pelbagai Persekitaran (15 minit)

**Matlamat**: Cipta dan konfigurasi tiga persekitaran dengan tetapan berbeza

```bash
# Cipta persekitaran pembangunan
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Cipta persekitaran persediaan
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Cipta persekitaran pengeluaran
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Sahkan setiap persekitaran
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kriteria Kejayaan:**
- [ ] Tiga persekitaran berjaya dicipta
- [ ] Setiap persekitaran mempunyai konfigurasi unik
- [ ] Boleh bertukar antara persekitaran tanpa ralat
- [ ] `azd env list` menunjukkan ketiga-tiga persekitaran

### Latihan 2: Pengurusan Rahsia (10 minit)

**Matlamat**: Amalkan konfigurasi selamat dengan data sensitif

```bash
# Tetapkan rahsia (tidak dipaparkan dalam output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Tetapkan konfigurasi bukan rahsia
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Lihat persekitaran (rahsia harus disunting)
azd env get-values

# Sahkan rahsia disimpan
azd env get DB_PASSWORD  # Patut menunjukkan nilai sebenar
```

**Kriteria Kejayaan:**
- [ ] Rahsia disimpan tanpa dipaparkan di terminal
- [ ] `azd env get-values` menunjukkan rahsia yang disensor
- [ ] `azd env get <SECRET_NAME>` individu memaparkan nilai sebenar

## Langkah Seterusnya

- [Projek Pertama Anda](first-project.md) - Gunakan konfigurasi dalam praktik
- [Panduan Penempatan](../chapter-04-infrastructure/deployment-guide.md) - Gunakan konfigurasi untuk penempatan
- [Penyediaan Sumber](../chapter-04-infrastructure/provisioning.md) - Konfigurasi untuk sedia pengeluaran

## Rujukan

- [Rujukan Konfigurasi azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Skema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Pembolehubah Persekitaran](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 3 - Konfigurasi & Pengesahan
- **⬅️ Sebelum**: [Projek Pertama Anda](first-project.md)
- **➡️ Bab Seterusnya**: [Bab 4: Infrastruktur sebagai Kod](../chapter-04-infrastructure/deployment-guide.md)
- **Pelajaran Seterusnya**: [Projek Pertama Anda](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidakakuratan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber rujukan yang sah. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->