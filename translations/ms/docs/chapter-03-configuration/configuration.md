# Panduan Konfigurasi

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 3 - Konfigurasi & Pengesahan
- **⬅️ Sebelumnya**: [Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Seterusnya**: [Panduan Penghantaran](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Bab Seterusnya**: [Bab 4: Infrastruktur sebagai Kod](../chapter-04-infrastructure/deployment-guide.md)

## Pengenalan

> Disemak mengikut `azd 1.37.2` (November 2026). Arahan Bash menganggap projek azd telah diinisialisasi. Melainkan dijelaskan secara eksplisit sebagai fail lengkap, petikan YAML/Bicep adalah serpihan untuk digabungkan ke dalam fail projek yang sepadan, bukan projek berdiri sendiri yang boleh dijalankan.

Panduan komprehensif ini meliputi semua aspek pengkonfigurasian Azure Developer CLI untuk aliran kerja pembangunan dan penghantaran yang optimum. Anda akan mempelajari hierarki konfigurasi, pengurusan persekitaran, kaedah pengesahan, dan corak konfigurasi lanjutan yang membolehkan penghantaran Azure yang cekap dan selamat.

## Matlamat Pembelajaran

Menjelang akhir pelajaran ini, anda akan:
- Menguasai hierarki konfigurasi azd dan memahami bagaimana tetapan diprioritaskan
- Mengkonfigurasi tetapan global dan khas projek dengan berkesan
- Menguruskan pelbagai persekitaran dengan konfigurasi berbeza
- Melaksanakan corak pengesahan dan kebenaran yang selamat
- Memahami corak konfigurasi lanjutan untuk senario kompleks

## Hasil Pembelajaran

Selepas melengkapkan pelajaran ini, anda akan dapat:
- Mengkonfigurasi azd untuk aliran kerja pembangunan yang optimum
- Menyediakan dan mengurus pelbagai persekitaran penghantaran
- Melaksanakan amalan pengurusan konfigurasi yang selamat
- Menyelesaikan masalah berkaitan konfigurasi
- Menyesuaikan tingkah laku azd untuk keperluan organisasi tertentu

Panduan komprehensif ini meliputi semua aspek pengkonfigurasian Azure Developer CLI untuk aliran kerja pembangunan dan penghantaran yang optimum.

## Memahami Ejen AI dalam Projek azd

Jika anda baru dalam ejen AI, ini adalah cara mudah untuk memikirkannya dalam dunia azd.

### Apakah Ejen?

Ejen adalah perisian yang boleh menerima permintaan, berfikir mengenainya, dan mengambil tindakan—selalunya dengan memanggil model AI, mencari data, atau menggunakan perkhidmatan lain. Dalam projek azd, ejen hanyalah satu lagi **perkhidmatan** bersama frontend web atau backend API anda.

### Bagaimana Ejen Sesuai Dalam Struktur Projek azd

Projek azd terdiri daripada tiga lapisan: **infrastruktur**, **kod**, dan **konfigurasi**. Ejen disambungkan ke lapisan ini sama seperti perkhidmatan lain:

| Lapisan | Apa Yang Dilakukan Untuk Aplikasi Tradisional | Apa Yang Dilakukan Untuk Ejen |
|-------|-------------------------------------|---------------------------|
| **Infrastruktur** (`infra/`) | Menyediakan aplikasi web dan pangkalan data | Menyediakan titik hujung model AI, indeks carian, atau hos ejen |
| **Kod** (`src/`) | Mengandungi kod sumber frontend dan API anda | Mengandungi logik ejen dan definisi prompt |
| **Konfigurasi** (`azure.yaml`) | Menyenaraikan perkhidmatan anda dan sasaran pengehosan mereka | Menyenaraikan ejen anda sebagai perkhidmatan, menunjuk kepada kod dan hosnya |

### Peranan `azure.yaml`

Anda tidak perlu menghafal sintaks sekarang. Secara konsep, `azure.yaml` adalah fail di mana anda memberitahu azd: *"Ini perkhidmatan yang membentuk aplikasi saya, dan ini tempat untuk mencari kod mereka."*

Apabila projek anda termasuk ejen AI, `azure.yaml` hanya menyenaraikan ejen itu sebagai salah satu perkhidmatan. azd kemudian tahu untuk menyediakan infrastruktur yang tepat (seperti titik hujung Microsoft Foundry Models atau Apl Kontena untuk menjadi hos ejen) dan menghantar kod ejen anda—sama seperti ia akan lakukan untuk aplikasi web atau API.

Ini bermakna tiada apa yang asasnya baru untuk dipelajari. Jika anda faham bagaimana azd mengurus perkhidmatan web, anda sudah faham bagaimana ia mengurus ejen.

## Hierarki Konfigurasi

azd mempunyai permukaan konfigurasi yang berbeza, bukan satu lapisan universal:
- **Keutamaan pengguna global**: `~/.azd/config.json`, diuruskan oleh `azd config`.
- **Definisi projek**: `azure.yaml` menentukan perkhidmatan, infrastruktur, dan hook.
- **Pemilihan persekitaran tempatan**: `.azure/config.json`.
- **Nilai bagi setiap persekitaran**: `.azure/<name>/.env`, diuruskan oleh `azd env`; tetapan tambahan ada di `config.json` persekitaran itu.
- **Bendera dan pembolehubah proses**: menimpa hanya tetapan yang disokong oleh perintah/provider tertentu.

Nilai `azd env set` secara sewenang-wenangnya tidak menjadi parameter infrastruktur atau tetapan aplikasi yang dihantar secara automatik. Rujuk secara eksplisit dalam fail parameter, konfigurasi perkhidmatan yang disokong, atau hook.

## Konfigurasi Global

### Menetapkan Lalai Global
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Tetapan Global Biasa
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Konfigurasi Projek

### Struktur azure.yaml
Fail `azure.yaml` adalah pusat projek azd anda:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

Ini adalah **contoh definisi projek**, bukan starter yang disediakan. Buat direktori sumber, skrip hook, skrip pakej yang dirujuk, dan `infra/main.bicep`/`main.parameters.json` yang sepadan sebelum menjalankannya. Pangkalan data letak dalam infrastruktur; `postgres` bukan hos perkhidmatan terbina dalam. Parameter infrastruktur letak dalam fail parameter provider, bukan `infra.parameters`.

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

#### Hook Bentuk Bahasa Tertentu

Fragmen perkhidmatan berikut menunjukkan hook; gabungkan dengan `project` dan `host` sebenar setiap perkhidmatan. `buildCommand` dan `startCommand` bukan sifat perkhidmatan azd generik. Konfigurasikan permulaan dalam aplikasi, Dockerfile, atau infrastruktur hos.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Pengurusan Persekitaran

### Membuat Persekitaran
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfigurasi Persekitaran
Nilai teras persekitaran ada dalam `.azure/<env-name>/.env`, termasuk `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, dan `AZURE_LOCATION`. Gunakan `azd env config get/set` untuk tetapan JSON persekitaran tambahan. JSON berikut adalah **keadaan aplikasi konsep**, bukan skema konfigurasi azd; jangan salin ke dalam fail azd:

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

**Hanya demonstrasi teks biasa.** Nilai `azd env set` biasa ditulis ke dalam `.azure/<name>/.env` dan boleh dicetak oleh arahan baca. Jangan gunakan contoh kunci API sebagai kredensial sebenar. Untuk rahsia, gunakan `azd env set-secret` dan pengkabelan runtime yang eksplisit.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Templat Persekitaran
Buat **bukan rahsia, dikendalikan secara manual** `.env.example` di akar projek untuk tetapan yang konsisten. azd tidak memuatkan secara automatik fail bernama `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Berkongsi Persekitaran Dalam Pasukan

Apabila lebih daripada seorang bekerja pada projek, anda perlu bersetuju tentang **apa yang dibawa bersama repo dan apa yang kekal tempatan**. azd menyimpan setiap persekitaran di bawah folder `.azure/`, dan tidak semuanya harus diserahkan.

**Apa yang ada dalam `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Apa yang perlu diabaikan oleh gitignore.** `.gitignore` lalai azd sudah mengecualikan `.azure/`. Kekalkannya begitu—fail `.env` boleh mengandungi rahsia, dan ID sumber adalah khusus kepada siapa yang menyediakannya. Setiap ahli pasukan mencipta persekitaran **sendiri** secara tempatan:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Bertukar antara persekitaran.** Seorang pembangun yang mengurus beberapa persekitaran memilih yang aktif sebelum menjalankan perintah:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Menyediakan nilai lalai bukan rahsia kepada pasukan.** Serahkan `.env.example` di luar direktori `.azure/` yang diabaikan. Ahli pasukan baru menyalinnya ke fail diabaikan tempatan, isikan nilai, dan import secara eksplisit dengan `azd env set --file <local-file>`. Jangan sekali-kali import tempat kosong kosong ke atas persekitaran yang berfungsi.

**Persekitaran dalam CI/CD.** Saluran paip tidak membaca folder `.azure/` tempatan anda. Sebaliknya, sediakan nilai persekitaran sebagai pembolehubah/rahsia saluran paip, dan azd membacanya dari persekitaran proses:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Peraturan am:** kod infrastruktur (`infra/`, `azure.yaml`) dikongsi dalam Git; *status persekitaran dan rahsia* (`.azure/`) adalah mengikut pembangun dan saluran paip. `azd pipeline config` menyediakan pembolehubah saluran paip secara automatik untuk anda.

## 🔐 Konfigurasi Pengesahan

### Integrasi Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Pengesahan Prinsipal Perkhidmatan
Untuk saluran paip CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Identiti Terurus
Untuk persekitaran yang dihoskan oleh Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Konfigurasi Infrastruktur

### Parameter Bicep
Konfigurasikan parameter infrastruktur dalam `infra/main.parameters.json`:
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
Untuk projek Terraform, azd menggantikan tempat letak nama dalam `infra/main.tfvars.json`. Nama-nama ini mesti sepadan dengan pembolehubah input Terraform yang diisytiharkan:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Konfigurasi Penyebaran

### Konfigurasi Pembinaan
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Konfigurasi Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
Jalur adalah relatif kepada projek perkhidmatan. Fail Dockerfile mesti mengisytiharkan sebarang nilai `ARG` yang digunakan. Untuk binaan berperingkat banyak, letakkan peringkat yang boleh dikerahkan terakhir atau gunakan aliran kerja pengepakan tersuai; `docker.target` bukanlah sifat yang disokong dalam skema yang disemak.

## 🔧 Konfigurasi Lanjutan

### Penamaan Sumber Tersuai
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Takrifkan nama sumber sebenar dalam Bicep/Terraform dan kekalkan konsistensi penciptaan kumpulan sumber dengan tetapan ini. Tiada kunci konfigurasi generik `naming.storageAccount` atau `naming.keyVault`.

### Konfigurasi Rangkaian
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Gabungkan **entri parameter ilustrasi** ini ke dalam `infra/main.parameters.json` di bawah `parameters`, dan isytihar serta guna parameter yang sepadan dalam Bicep. Ia tidak melakukan apa-apa dengan sendirinya.

### Konfigurasi Pemantauan
Sediakan Application Insights dan Log Analytics dalam Bicep/Terraform dan konfigurasikan telemetri aplikasi dalam SDK anda. Tiada blok peringkat atas `monitoring` generik dalam `azure.yaml` yang mencipta sumber ini. Lihat [infrastruktur pemantauan](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Konfigurasi Khusus Persekitaran

### Persekitaran Pembangunan
```bash
# .azure/development/.env
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
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Skrip Konfigurasi
Buat skrip pengesahan dalam `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
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

```

Elakkan memasukkan nilai sensitif secara keras (konfigurasi ilustrasi berasingan, bukan kunci `database` kedua dalam fail yang sama):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Susun Fail Konfigurasi
```
.azure/
├── config.json              # Global project config
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
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
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

**Matlamat**: Cipta dan konfigurasikan tiga persekitaran tempatan dengan nilai yang berbeza. Mula dalam projek yang telah diinisialisasi; gunakan nama yang belum digunakan jika nama tersebut sudah wujud. Nilai khusus aplikasi ini tidak mengubah tetapan telemetri/runtime sehingga templat anda menggunakannya.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kriteria Kejayaan:**
- [ ] Tiga persekitaran berjaya diwujudkan
- [ ] Setiap persekitaran mempunyai konfigurasi unik
- [ ] Boleh bertukar antara persekitaran tanpa ralat
- [ ] `azd env list` menunjukkan ketiga-tiga persekitaran

### Latihan 2: Rujukan Rahsia Key Vault (10-20 minit)

**Matlamat**: Simpan rujukan Key Vault daripada teks biasa. **Titik permulaan:** persekitaran yang diinisialisasi, log masuk Azure, dan akses ke Key Vault dengan kebenaran untuk mencipta/membaca rahsia dummy. Operasi vault mungkin dikenakan caj.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Kriteria Kejayaan:**
- [ ] Arahan interaktif melaporkan vault dan rujukan rahsia yang dipilih
- [ ] `.env` tempatan mengandungi rujukan dan bukan rahsia dummy
- [ ] Boleh menerangkan bahawa identiti runtime/RBAC dan penggunaan masih perlu dikonfigurasi

**Isu biasa:** 403 memerlukan peranan satah data vault yang betul dan masa penyebaran; `azd env set ... --secret` bukan arahan yang sah. Output biasa `get-values`/`get-value` tidak boleh dianggap disunting. Buang rujukan latihan dengan `azd env unset TRAINING_API_KEY`; ini tidak memadamkan rahsia vault, yang mesti anda bersihkan secara berasingan jika anda menciptanya.

## Langkah Seterusnya

- [Projek Pertama Anda](../chapter-01-foundation/first-project.md) - Gunakan konfigurasi dalam amalan
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) - Gunakan konfigurasi untuk penyebaran
- [Penyediaan Sumber](../chapter-04-infrastructure/provisioning.md) - Konfigurasi sedia produksi

## Rujukan

- [Rujukan Konfigurasi azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Skema azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Pembolehubah Persekitaran](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 3 - Konfigurasi & Pengesahan
- **⬅️ Sebelumnya**: [Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Bab Seterusnya**: [Bab 4: Infrastruktur sebagai Kod](../chapter-04-infrastructure/deployment-guide.md)
- **Pelajaran Seterusnya**: [Pengesahan & Keselamatan](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->