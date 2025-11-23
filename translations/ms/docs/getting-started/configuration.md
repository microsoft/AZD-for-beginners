<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-22T09:50:30+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "ms"
}
-->
# Panduan Konfigurasi

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 3 - Konfigurasi & Pengesahan
- **⬅️ Sebelumnya**: [Projek Pertama Anda](first-project.md)
- **➡️ Seterusnya**: [Panduan Penerapan](../deployment/deployment-guide.md)
- **🚀 Bab Seterusnya**: [Bab 4: Infrastruktur sebagai Kod](../deployment/deployment-guide.md)

## Pengenalan

Panduan lengkap ini merangkumi semua aspek konfigurasi Azure Developer CLI untuk aliran kerja pembangunan dan penerapan yang optimum. Anda akan mempelajari hierarki konfigurasi, pengurusan persekitaran, kaedah pengesahan, dan corak konfigurasi lanjutan yang membolehkan penerapan Azure yang cekap dan selamat.

## Matlamat Pembelajaran

Pada akhir pelajaran ini, anda akan:
- Menguasai hierarki konfigurasi azd dan memahami bagaimana tetapan diprioritaskan
- Mengkonfigurasi tetapan global dan spesifik projek dengan berkesan
- Menguruskan pelbagai persekitaran dengan konfigurasi yang berbeza
- Melaksanakan corak pengesahan dan kebenaran yang selamat
- Memahami corak konfigurasi lanjutan untuk senario kompleks

## Hasil Pembelajaran

Selepas menyelesaikan pelajaran ini, anda akan dapat:
- Mengkonfigurasi azd untuk aliran kerja pembangunan yang optimum
- Menyediakan dan menguruskan pelbagai persekitaran penerapan
- Melaksanakan amalan pengurusan konfigurasi yang selamat
- Menyelesaikan masalah berkaitan konfigurasi
- Menyesuaikan tingkah laku azd untuk keperluan organisasi tertentu

Panduan lengkap ini merangkumi semua aspek konfigurasi Azure Developer CLI untuk aliran kerja pembangunan dan penerapan yang optimum.

## Hierarki Konfigurasi

azd menggunakan sistem konfigurasi hierarki:
1. **Bendera baris perintah** (keutamaan tertinggi)
2. **Pembolehubah persekitaran**
3. **Konfigurasi projek tempatan** (`.azd/config.json`)
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
azd config list

# Alihkan konfigurasi
azd config unset defaults.location
```

### Tetapan Global Biasa
```bash
# Keutamaan pembangunan
azd config set alpha.enable true                    # Aktifkan ciri alpha
azd config set telemetry.enabled false             # Lumpuhkan telemetri
azd config set output.format json                  # Tetapkan format output

# Tetapan keselamatan
azd config set auth.useAzureCliCredential true     # Gunakan Azure CLI untuk pengesahan
azd config set tls.insecure false                  # Paksa pengesahan TLS

# Penalaan prestasi
azd config set provision.parallelism 5             # Penciptaan sumber selari
azd config set deploy.timeout 30m                  # Tamat masa pelaksanaan
```

## 🏗️ Konfigurasi Projek

### Struktur azure.yaml
Fail `azure.yaml` adalah inti projek azd anda:

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

### Mewujudkan Persekitaran
```bash
# Buat persekitaran baru
azd env new development

# Buat dengan lokasi tertentu
azd env new staging --location "westus2"

# Buat dari templat
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurasi Persekitaran
Setiap persekitaran mempunyai konfigurasi sendiri dalam `.azure/<env-name>/config.json`:

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

# Output yang dijangka:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Alihkan pembolehubah persekitaran
azd env unset DEBUG

# Sahkan pengalihan
azd env get-values | grep DEBUG
# (sepatutnya tidak mengembalikan apa-apa)
```

### Templat Persekitaran
Cipta `.azure/env.template` untuk penyediaan persekitaran yang konsisten:
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
# Gunakan kelayakan Azure CLI (lalai)
azd config set auth.useAzureCliCredential true

# Log masuk dengan penyewa tertentu
az login --tenant <tenant-id>

# Tetapkan langganan lalai
az account set --subscription <subscription-id>
```

### Pengesahan Service Principal
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

### Identiti Terurus
Untuk persekitaran yang dihoskan Azure:
```bash
# Aktifkan pengesahan identiti terurus
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
Untuk projek Terraform, konfigurasi dalam `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfigurasi Penerapan

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

## 🎯 Konfigurasi Khusus Persekitaran

### Persekitaran Pembangunan
```bash
# .azure/pembangunan/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Persekitaran Pementasan
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Persekitaran Pengeluaran
```bash
# .azure/pengeluaran/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Pengesahan Konfigurasi

### Mengesahkan Konfigurasi
```bash
# Periksa sintaks konfigurasi
azd config validate

# Uji pembolehubah persekitaran
azd env get-values

# Sahkan infrastruktur
azd provision --dry-run
```

### Skrip Konfigurasi
Cipta skrip pengesahan dalam `scripts/`:

```bash
#!/bin/bash
# skrip/validate-config.sh

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

### 2. Susun Fail Konfigurasi
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

## 🎯 Latihan Praktikal

### Latihan 1: Konfigurasi Pelbagai Persekitaran (15 minit)

**Matlamat**: Cipta dan konfigurasi tiga persekitaran dengan tetapan berbeza

```bash
# Cipta persekitaran pembangunan
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Cipta persekitaran pementasan
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

**Matlamat**: Berlatih konfigurasi selamat dengan data sensitif

```bash
# Tetapkan rahsia (tidak dipaparkan dalam output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Tetapkan konfigurasi bukan rahsia
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Lihat persekitaran (rahsia harus disembunyikan)
azd env get-values

# Sahkan rahsia disimpan
azd env get DB_PASSWORD  # Harus menunjukkan nilai sebenar
```

**Kriteria Kejayaan:**
- [ ] Rahsia disimpan tanpa dipaparkan di terminal
- [ ] `azd env get-values` menunjukkan rahsia yang disunting
- [ ] Individu `azd env get <SECRET_NAME>` mendapatkan nilai sebenar

## Langkah Seterusnya

- [Projek Pertama Anda](first-project.md) - Terapkan konfigurasi dalam amalan
- [Panduan Penerapan](../deployment/deployment-guide.md) - Gunakan konfigurasi untuk penerapan
- [Penyediaan Sumber](../deployment/provisioning.md) - Konfigurasi bersedia untuk pengeluaran

## Rujukan

- [Rujukan Konfigurasi azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Skema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Pembolehubah Persekitaran](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 3 - Konfigurasi & Pengesahan
- **⬅️ Sebelumnya**: [Projek Pertama Anda](first-project.md)
- **➡️ Bab Seterusnya**: [Bab 4: Infrastruktur sebagai Kod](../deployment/deployment-guide.md)
- **Pelajaran Seterusnya**: [Projek Pertama Anda](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->