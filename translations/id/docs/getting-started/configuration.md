# Panduan Konfigurasi

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 3 - Konfigurasi & Autentikasi
- **⬅️ Sebelumnya**: [Proyek Pertama Anda](first-project.md)
- **➡️ Selanjutnya**: [Panduan Deployment](../deployment/deployment-guide.md)
- **🚀 Bab Selanjutnya**: [Bab 4: Infrastruktur sebagai Kode](../deployment/deployment-guide.md)

## Pendahuluan

Panduan lengkap ini mencakup semua aspek konfigurasi Azure Developer CLI untuk alur kerja pengembangan dan deployment yang optimal. Anda akan mempelajari hierarki konfigurasi, manajemen lingkungan, metode autentikasi, dan pola konfigurasi lanjutan yang memungkinkan deployment Azure yang efisien dan aman.

## Tujuan Pembelajaran

Pada akhir pelajaran ini, Anda akan:
- Menguasai hierarki konfigurasi azd dan memahami bagaimana pengaturan diprioritaskan
- Mengonfigurasi pengaturan global dan spesifik proyek secara efektif
- Mengelola beberapa lingkungan dengan konfigurasi yang berbeda
- Menerapkan pola autentikasi dan otorisasi yang aman
- Memahami pola konfigurasi lanjutan untuk skenario kompleks

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan dapat:
- Mengonfigurasi azd untuk alur kerja pengembangan yang optimal
- Menyiapkan dan mengelola beberapa lingkungan deployment
- Menerapkan praktik manajemen konfigurasi yang aman
- Memecahkan masalah yang terkait dengan konfigurasi
- Menyesuaikan perilaku azd untuk kebutuhan organisasi tertentu

Panduan lengkap ini mencakup semua aspek konfigurasi Azure Developer CLI untuk alur kerja pengembangan dan deployment yang optimal.

## Hierarki Konfigurasi

azd menggunakan sistem konfigurasi hierarkis:
1. **Bendera baris perintah** (prioritas tertinggi)
2. **Variabel lingkungan**
3. **Konfigurasi proyek lokal** (`.azd/config.json`)
4. **Konfigurasi pengguna global** (`~/.azd/config.json`)
5. **Nilai default** (prioritas terendah)

## Konfigurasi Global

### Menetapkan Default Global
```bash
# Atur langganan default
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Atur lokasi default
azd config set defaults.location "eastus2"

# Atur konvensi penamaan grup sumber daya default
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Lihat semua konfigurasi global
azd config list

# Hapus sebuah konfigurasi
azd config unset defaults.location
```

### Pengaturan Global Umum
```bash
# Preferensi pengembangan
azd config set alpha.enable true                    # Aktifkan fitur alpha
azd config set telemetry.enabled false             # Nonaktifkan telemetri
azd config set output.format json                  # Atur format output

# Pengaturan keamanan
azd config set auth.useAzureCliCredential true     # Gunakan Azure CLI untuk autentikasi
azd config set tls.insecure false                  # Terapkan verifikasi TLS

# Penyesuaian kinerja
azd config set provision.parallelism 5             # Pembuatan sumber daya paralel
azd config set deploy.timeout 30m                  # Waktu habis penyebaran
```

## 🏗️ Konfigurasi Proyek

### Struktur azure.yaml
File `azure.yaml` adalah inti dari proyek azd Anda:

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

### Opsi Konfigurasi Layanan

#### Jenis Host
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

#### Pengaturan Spesifik Bahasa
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

## 🌟 Manajemen Lingkungan

### Membuat Lingkungan
```bash
# Buat lingkungan baru
azd env new development

# Buat dengan lokasi tertentu
azd env new staging --location "westus2"

# Buat dari template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurasi Lingkungan
Setiap lingkungan memiliki konfigurasi sendiri di `.azure/<env-name>/config.json`:

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

### Variabel Lingkungan
```bash
# Atur variabel khusus lingkungan
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Lihat variabel lingkungan
azd env get-values

# Output yang diharapkan:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Hapus variabel lingkungan
azd env unset DEBUG

# Verifikasi penghapusan
azd env get-values | grep DEBUG
# (seharusnya tidak mengembalikan apa-apa)
```

### Template Lingkungan
Buat `.azure/env.template` untuk pengaturan lingkungan yang konsisten:
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

## 🔐 Konfigurasi Autentikasi

### Integrasi Azure CLI
```bash
# Gunakan kredensial Azure CLI (default)
azd config set auth.useAzureCliCredential true

# Masuk dengan penyewa tertentu
az login --tenant <tenant-id>

# Atur langganan default
az account set --subscription <subscription-id>
```

### Autentikasi Service Principal
Untuk pipeline CI/CD:
```bash
# Atur variabel lingkungan
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Atau konfigurasikan langsung
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Untuk lingkungan yang di-host di Azure:
```bash
# Aktifkan autentikasi identitas terkelola
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Konfigurasi Infrastruktur

### Parameter Bicep
Konfigurasikan parameter infrastruktur di `infra/main.parameters.json`:
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
Untuk proyek Terraform, konfigurasikan di `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfigurasi Deployment

### Konfigurasi Build
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

### Penamaan Sumber Daya Kustom
```bash
# Tetapkan konvensi penamaan
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Konfigurasi Jaringan
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Konfigurasi Monitoring
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

## 🎯 Konfigurasi Spesifik Lingkungan

### Lingkungan Pengembangan
```bash
# .azure/pengembangan/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Lingkungan Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Lingkungan Produksi
```bash
# .azure/produksi/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validasi Konfigurasi

### Validasi Konfigurasi
```bash
# Periksa sintaks konfigurasi
azd config validate

# Uji variabel lingkungan
azd env get-values

# Validasi infrastruktur
azd provision --dry-run
```

### Skrip Konfigurasi
Buat skrip validasi di `scripts/`:

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

## 🎓 Praktik Terbaik

### 1. Gunakan Variabel Lingkungan
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Atur File Konfigurasi
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

### 3. Pertimbangan Kontrol Versi
```bash
# .gitignore
.azure/*/config.json         # Konfigurasi lingkungan (mengandung ID sumber daya)
.azure/*/.env               # Variabel lingkungan (mungkin mengandung rahasia)
.env                        # File lingkungan lokal
```

### 4. Dokumentasi Konfigurasi
Dokumentasikan konfigurasi Anda di `CONFIG.md`:
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

## 🎯 Latihan Praktik

### Latihan 1: Konfigurasi Multi-Lingkungan (15 menit)

**Tujuan**: Membuat dan mengonfigurasi tiga lingkungan dengan pengaturan yang berbeda

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

**Kriteria Keberhasilan:**
- [ ] Tiga lingkungan berhasil dibuat
- [ ] Setiap lingkungan memiliki konfigurasi unik
- [ ] Dapat beralih antar lingkungan tanpa kesalahan
- [ ] `azd env list` menampilkan ketiga lingkungan

### Latihan 2: Manajemen Rahasia (10 menit)

**Tujuan**: Berlatih konfigurasi aman dengan data sensitif

```bash
# Atur rahasia (tidak ditampilkan dalam output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Atur konfigurasi non-rahasia
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Lihat lingkungan (rahasia harus disembunyikan)
azd env get-values

# Verifikasi rahasia disimpan
azd env get DB_PASSWORD  # Harus menunjukkan nilai sebenarnya
```

**Kriteria Keberhasilan:**
- [ ] Rahasia disimpan tanpa ditampilkan di terminal
- [ ] `azd env get-values` menampilkan rahasia yang disembunyikan
- [ ] `azd env get <SECRET_NAME>` secara individual mengambil nilai sebenarnya

## Langkah Selanjutnya

- [Proyek Pertama Anda](first-project.md) - Terapkan konfigurasi dalam praktik
- [Panduan Deployment](../deployment/deployment-guide.md) - Gunakan konfigurasi untuk deployment
- [Penyediaan Sumber Daya](../deployment/provisioning.md) - Konfigurasi siap produksi

## Referensi

- [Referensi Konfigurasi azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Skema azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variabel Lingkungan](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 3 - Konfigurasi & Autentikasi
- **⬅️ Sebelumnya**: [Proyek Pertama Anda](first-project.md)
- **➡️ Bab Selanjutnya**: [Bab 4: Infrastruktur sebagai Kode](../deployment/deployment-guide.md)
- **Pelajaran Selanjutnya**: [Proyek Pertama Anda](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan terjemahan yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa terjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->