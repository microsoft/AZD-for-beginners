# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD Untuk Pemula](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

Panduan komprehensif ini mencakup semua aspek mengonfigurasi Azure Developer CLI untuk alur kerja pengembangan dan penyebaran yang optimal. Anda akan mempelajari tentang hirarki konfigurasi, manajemen lingkungan, metode otentikasi, dan pola konfigurasi lanjutan yang memungkinkan penyebaran Azure yang efisien dan aman.

## Learning Goals

Pada akhir pelajaran ini, Anda akan:
- Menguasai hirarki konfigurasi azd dan memahami bagaimana pengaturan diprioritaskan
- Mengonfigurasi pengaturan global dan spesifik-proyek secara efektif
- Mengelola beberapa lingkungan dengan konfigurasi berbeda
- Menerapkan pola otentikasi dan otorisasi yang aman
- Memahami pola konfigurasi lanjutan untuk skenario kompleks

## Learning Outcomes

Setelah menyelesaikan pelajaran ini, Anda akan mampu:
- Mengonfigurasi azd untuk alur kerja pengembangan yang optimal
- Menyiapkan dan mengelola beberapa lingkungan penyebaran
- Menerapkan praktik manajemen konfigurasi yang aman
- Memecahkan masalah terkait konfigurasi
- Menyesuaikan perilaku azd untuk kebutuhan organisasi tertentu

Panduan komprehensif ini mencakup semua aspek mengonfigurasi Azure Developer CLI untuk alur kerja pengembangan dan penyebaran yang optimal.

## Understanding AI Agents in an azd Project

Jika Anda baru mengenal agen AI, berikut cara sederhana memahaminya dalam dunia azd.

### What Is an Agent?

Sebuah agen adalah perangkat lunak yang dapat menerima permintaan, berpikir tentangnya, dan mengambil tindakan—seringkali dengan memanggil model AI, mencari data, atau memanggil layanan lain. Dalam proyek azd, agen hanyalah sebuah **layanan** di samping frontend web atau backend API Anda.

### How Agents Fit Into the azd Project Structure

Sebuah proyek azd terdiri dari tiga lapisan: **infrastructure**, **code**, dan **configuration**. Agen terhubung ke lapisan-lapisan ini dengan cara yang sama seperti layanan lainnya:

| Lapisan | Apa yang Dilakukan untuk Aplikasi Tradisional | Apa yang Dilakukan untuk Agen |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Menyediakan sebuah aplikasi web dan database | Menyediakan endpoint model AI, indeks pencarian, atau host agen |
| **Code** (`src/`) | Berisi kode sumber frontend dan API Anda | Berisi logika agen dan definisi prompt |
| **Configuration** (`azure.yaml`) | Mendaftar layanan Anda dan target hostingnya | Mendaftarkan agen Anda sebagai layanan, menunjuk ke kode dan hostnya |

### The Role of `azure.yaml`

Anda tidak perlu menghafal sintaks sekarang. Secara konseptual, `azure.yaml` adalah file tempat Anda memberi tahu azd: *"Berikut layanan yang membentuk aplikasi saya, dan ini tempat menemukan kode mereka."*

Ketika proyek Anda menyertakan agen AI, `azure.yaml` hanya mencantumkan agen tersebut sebagai salah satu layanan. azd kemudian tahu untuk menyediakan infrastruktur yang tepat (seperti endpoint Microsoft Foundry Models atau Container App untuk menghosting agen) dan menerapkan kode agen Anda—seperti halnya untuk aplikasi web atau API.

Ini berarti tidak ada yang secara fundamental baru untuk dipelajari. Jika Anda memahami bagaimana azd mengelola layanan web, Anda sudah memahami bagaimana ia mengelola agen.

## Configuration Hierarchy

azd menggunakan sistem konfigurasi hirarkis:
1. **Command-line flags** (prioritas tertinggi)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (prioritas terendah)

## Global Configuration

### Setting Global Defaults
```bash
# Tetapkan langganan default
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Tetapkan lokasi default
azd config set defaults.location "eastus2"

# Tetapkan konvensi penamaan grup sumber daya default
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Lihat semua konfigurasi global
azd config show

# Hapus konfigurasi
azd config unset defaults.location
```

### Common Global Settings
```bash
# Preferensi pengembangan
azd config set alpha.enable true                    # Aktifkan fitur alfa
azd config set telemetry.enabled false             # Nonaktifkan telemetri
azd config set output.format json                  # Atur format keluaran

# Pengaturan keamanan
azd config set auth.useAzureCliCredential true     # Gunakan Azure CLI untuk otentikasi
azd config set tls.insecure false                  # Tegakkan verifikasi TLS

# Penalaan kinerja
azd config set provision.parallelism 5             # Pembuatan sumber daya paralel
azd config set deploy.timeout 30m                  # Waktu tunggu penyebaran
```

## 🏗️ Project Configuration

### azure.yaml Structure
The `azure.yaml` file is the heart of your azd project:

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

### Service Configuration Options

#### Host Types
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

#### Language-Specific Settings
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

## 🌟 Environment Management

### Creating Environments
```bash
# Buat lingkungan baru
azd env new development

# Buat dengan lokasi tertentu
azd env new staging --location "westus2"

# Buat dari templat
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
Each environment has its own configuration in `.azure/<env-name>/config.json`:

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

### Environment Variables
```bash
# Tetapkan variabel lingkungan spesifik
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Lihat variabel lingkungan
azd env get-values

# Keluaran yang diharapkan:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Hapus variabel lingkungan
azd env unset DEBUG

# Verifikasi penghapusan
azd env get-values | grep DEBUG
# (seharusnya tidak mengembalikan apa pun)
```

### Environment Templates
Create `.azure/env.template` for consistent environment setup:
```bash
# Variabel yang diperlukan
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Pengaturan aplikasi
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Pengaturan pengembangan opsional
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Gunakan kredensial Azure CLI (bawaan)
azd config set auth.useAzureCliCredential true

# Masuk dengan tenant tertentu
az login --tenant <tenant-id>

# Tetapkan langganan bawaan
az account set --subscription <subscription-id>
```

### Service Principal Authentication
For CI/CD pipelines:
```bash
# Tetapkan variabel lingkungan
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Atau konfigurasikan langsung
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Untuk lingkungan yang dihosting di Azure:
```bash
# Aktifkan autentikasi identitas terkelola
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

### Bicep Parameters
Configure infrastructure parameters in `infra/main.parameters.json`:
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

### Terraform Configuration
For Terraform projects, configure in `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deployment Configuration

### Build Configuration
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

### Docker Configuration
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

## 🔧 Advanced Configuration

### Custom Resource Naming
```bash
# Tetapkan konvensi penamaan
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network Configuration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Configuration
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

## 🎯 Environment-Specific Configurations

### Development Environment
```bash
# .azure/pengembangan/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging Environment
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Production Environment
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuration Validation

### Validate Configuration
```bash
# Periksa sintaks konfigurasi
azd config validate

# Uji variabel lingkungan
azd env get-values

# Validasi infrastruktur
azd provision --dry-run
```

### Configuration Scripts
Create validation scripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Periksa variabel lingkungan yang diperlukan
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validasi sintaks azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Best Practices

### 1. Use Environment Variables
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organize Configuration Files
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

### 3. Version Control Considerations
```bash
# .gitignore
.azure/*/config.json         # Konfigurasi lingkungan (berisi ID sumber daya)
.azure/*/.env               # Variabel lingkungan (mungkin berisi rahasia)
.env                        # Berkas lingkungan lokal
```

### 4. Configuration Documentation
Document your configuration in `CONFIG.md`:
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

## 🎯 Hands-On Practice Exercises

### Exercise 1: Multi-Environment Configuration (15 minutes)

**Goal**: Create and configure three environments with different settings

```bash
# Buat lingkungan pengembangan
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Buat lingkungan staging
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Buat lingkungan produksi
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verifikasi setiap lingkungan
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] Tiga lingkungan berhasil dibuat
- [ ] Setiap lingkungan memiliki konfigurasi unik
- [ ] Dapat berpindah antar lingkungan tanpa kesalahan
- [ ] `azd env list` menampilkan ketiga lingkungan

### Exercise 2: Secret Management (10 minutes)

**Goal**: Practice secure configuration with sensitive data

```bash
# Tetapkan rahasia (tidak ditampilkan dalam keluaran)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Tetapkan konfigurasi non-rahasia
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Lihat lingkungan (rahasia harus disamarkan)
azd env get-values

# Verifikasi bahwa rahasia tersimpan
azd env get DB_PASSWORD  # Seharusnya menampilkan nilai sebenarnya
```

**Success Criteria:**
- [ ] Rahasia disimpan tanpa ditampilkan di terminal
- [ ] `azd env get-values` menunjukkan rahasia yang disamarkan
- [ ] Perintah individual `azd env get <SECRET_NAME>` mengambil nilai sebenarnya

## Next Steps

- [Your First Project](first-project.md) - Terapkan konfigurasi dalam praktik
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Gunakan konfigurasi untuk penyebaran
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Konfigurasi siap produksi

## References

- [Referensi Konfigurasi azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Skema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variabel Lingkungan](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD Untuk Pemula](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->