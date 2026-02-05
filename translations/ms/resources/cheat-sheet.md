# Lembaran Rujukan Perintah - Perintah AZD Penting

**Rujukan Pantas untuk Semua Bab**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../README.md)
- **📖 Permulaan Pantas**: [Bab 1: Asas & Permulaan Pantas](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Perintah AI**: [Bab 2: Pembangunan Berasaskan AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Lanjutan**: [Bab 4: Infrastruktur sebagai Kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Pengenalan

Lembaran rujukan ini menyediakan rujukan pantas untuk perintah Azure Developer CLI yang paling kerap digunakan, disusun mengikut kategori dengan contoh praktikal. Sesuai untuk rujukan pantas semasa pembangunan, penyelesaian masalah, dan operasi harian dengan projek azd.

## Matlamat Pembelajaran

Dengan menggunakan lembaran rujukan ini, anda akan:
- Mempunyai akses segera kepada perintah dan sintaks Azure Developer CLI yang penting
- Memahami pengelompokan perintah mengikut kategori fungsi dan kes penggunaan
- Merujuk contoh praktikal untuk senario pembangunan dan penyebaran biasa
- Mengakses perintah penyelesaian masalah untuk penyelesaian isu dengan cepat
- Menemukan pilihan konfigurasi dan penyesuaian lanjutan dengan cekap
- Menemukan perintah pengurusan persekitaran dan aliran kerja pelbagai persekitaran

## Hasil Pembelajaran

Dengan rujukan kerap kepada lembaran rujukan ini, anda akan dapat:
- Melaksanakan perintah azd dengan yakin tanpa merujuk dokumentasi penuh
- Menyelesaikan isu biasa dengan cepat menggunakan perintah diagnostik yang sesuai
- Menguruskan pelbagai persekitaran dan senario penyebaran dengan cekap
- Menggunakan ciri dan pilihan konfigurasi azd lanjutan apabila diperlukan
- Menyelesaikan isu penyebaran menggunakan urutan perintah yang sistematik
- Mengoptimumkan aliran kerja melalui penggunaan pintasan dan pilihan azd yang efektif

## Perintah Permulaan

### Pengesahan
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Inisialisasi Projek
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Perintah Penyebaran Teras

### Aliran Kerja Penyebaran Lengkap
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Infrastruktur Sahaja
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes (NEW)
azd provision --preview
# Shows a dry-run view of what resources would be created/modified/deleted
# Similar to 'terraform plan' or 'bicep what-if' - safe to run, no changes applied

# Provision with what-if analysis
azd provision --what-if
```

### Aplikasi Sahaja
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Bina dan Pakej
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Pengurusan Persekitaran

### Operasi Persekitaran
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Pembolehubah Persekitaran
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Perintah Konfigurasi

### Konfigurasi Global
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Konfigurasi Projek
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Pemantauan dan Log

### Log Aplikasi
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### Pemantauan
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Perintah Penyelenggaraan

### Pembersihan
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### Kemas Kini
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Perintah Lanjutan

### Pipeline dan CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Pengurusan Infrastruktur
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate

# 🧪 Infrastructure Preview & Planning (NEW)
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Safe to run - no actual changes made to Azure environment
```

### Pengurusan Perkhidmatan
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Aliran Kerja Pantas

### Aliran Kerja Pembangunan
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### Aliran Kerja Pelbagai Persekitaran
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### Aliran Kerja Penyelesaian Masalah
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Perintah Debugging

### Maklumat Debug
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Debugging Templat
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Perintah Fail dan Direktori

### Struktur Projek
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Pemformatan Output

### Output JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Jadual
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Gabungan Perintah Biasa

### Skrip Pemeriksaan Kesihatan
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Pengesahan Penyebaran
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### Perbandingan Persekitaran
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skrip Pembersihan Sumber
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Pembolehubah Persekitaran

### Pembolehubah Persekitaran Biasa
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Perintah Kecemasan

### Penyelesaian Pantas
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Perintah Pemulihan
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Petua Profesional

### Alias untuk Aliran Kerja Lebih Pantas
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Pintasan Fungsi
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Bantuan dan Dokumentasi

### Mendapatkan Bantuan
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Pautan Dokumentasi
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Petua**: Tandakan lembaran rujukan ini dan gunakan `Ctrl+F` untuk mencari perintah yang anda perlukan dengan cepat!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Pemeriksaan Awal](../docs/pre-deployment/preflight-checks.md)
- **Pelajaran Seterusnya**: [Glosari](glossary.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.