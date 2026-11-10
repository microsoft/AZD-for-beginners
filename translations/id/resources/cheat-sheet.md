# Daftar Perintah - Perintah Penting AZD

**Referensi Cepat untuk Semua Bab**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Memulai Cepat**: [Bab 1: Dasar & Memulai Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Perintah AI**: [Bab 2: Pengembangan Berbasis AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Lanjutan**: [Bab 4: Infrastruktur sebagai Kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Pendahuluan

Cheat sheet komprehensif ini menyediakan referensi cepat untuk perintah Azure Developer CLI yang paling umum digunakan, diorganisir berdasarkan kategori dengan contoh praktis. Cocok untuk pencarian cepat selama pengembangan, pemecahan masalah, dan operasi harian dengan proyek azd.

## Tujuan Pembelajaran

Dengan menggunakan cheat sheet ini, Anda akan:
- Memiliki akses instan ke perintah dan sintaks Azure Developer CLI yang penting
- Memahami organisasi perintah berdasarkan kategori fungsional dan kasus penggunaan
- Merujuk contoh praktis untuk skenario pengembangan dan penerapan umum
- Mengakses perintah pemecahan masalah untuk penyelesaian masalah cepat
- Menemukan opsi konfigurasi dan kustomisasi lanjutan secara efisien
- Menemukan perintah manajemen lingkungan dan alur kerja multi-lingkungan

## Hasil Pembelajaran

Dengan sering merujuk cheat sheet ini, Anda akan mampu:
- Menjalankan perintah azd dengan percaya diri tanpa merujuk dokumentasi lengkap
- Cepat menyelesaikan masalah umum menggunakan perintah diagnostik yang sesuai
- Mengelola banyak lingkungan dan skenario penerapan dengan efisien
- Menerapkan fitur lanjutan azd dan opsi konfigurasi sesuai kebutuhan
- Memecahkan masalah penerapan menggunakan urutan perintah yang sistematis
- Mengoptimalkan alur kerja melalui penggunaan pintasan dan opsi azd secara efektif

## Perintah Memulai

### Autentikasi
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### Inisialisasi Proyek
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## Perintah Inti Penerapan

### Alur Kerja Penerapan Lengkap
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### Hanya Infrastruktur
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Hanya Aplikasi
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Bangun dan Paket
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** mengunduh dependensi aplikasi Anda (npm, pip, NuGet, Maven, dll.). Ini berjalan otomatis selama `azd package` dan `azd deploy`, jadi Anda jarang memanggilnya langsung—jalankan secara manual untuk mem-fetch dependensi sebelumnya (misalnya, untuk menghangatkan cache CI atau bekerja offline setelahnya).

> **`azd package`** menyiapkan artefak yang dapat diterapkan tanpa menerapkan layanan aplikasi. Perilakunya tergantung pada bahasa dan host: pengemasan kontainer bisa menggunakan build jarak jauh Azure dan mem-publish image ke registry, sehingga tidak selalu offline atau bebas dari penulisan Azure. `azd deploy` dapat mengemas secara otomatis; gunakan langkah paket terpisah saat Anda memerlukan artefak atau pemeriksaan build.


## 🌍 Manajemen Lingkungan

### Operasi Lingkungan
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### Variabel Lingkungan
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

File lingkungan berupa teks biasa. Jangan perlakukan `azd env set` sebagai penyimpanan rahasia; gunakan referensi Key Vault atau managed identity sesuai kebutuhan.

## ⚙️ Perintah Konfigurasi

### Konfigurasi Global
```bash
# List all configuration
azd config show

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Konfigurasi Proyek
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoring dan Diagnostik

### Dashboard Monitoring
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

Application Insights harus dikonfigurasi oleh template. Opsi Live Metrics AZD saat ini tidak didukung untuk aplikasi Python; gunakan overview, log, atau alur kerja tracing yang terdokumentasi dalam contoh.

### Melihat Log Kontainer
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Query Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Perintah Pemeliharaan

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

### Pembaruan
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Perintah Lanjutan

### Pipeline dan CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Manajemen Infrastruktur
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### Informasi Proyek
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Perintah AI & Ekstensi

### Ekstensi AZD

Referensi CLI AI ditinjau 2026-11-04: `azd 1.37.2`, agen `1.0.0-beta.23`, evaluasi `1.0.0-beta.2`. Gunakan `azd >= 1.37.0` untuk alur kerja gabungan; perbarui CLI inti sebelum ekstensi yang tidak kompatibel.

```bash
# List all available extensions (including AI)
azd extension list

# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the agent skills extension (preview)
azd extension install azure.ai.skills

# Install the Foundry connections extension (preview)
azd extension install azure.ai.connections

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Upgrade all installed extensions
azd extension upgrade --all
```

### Perintah Agen AI
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` menggantikan ejaan yang sudah usang `--manifest`/`-m`; manifest lama perlu migrasi. Saat ini tidak ada opsi agent-init `--host containerapp`. Preview managed-harness, suara, dan proses berjalan lama memerlukan opt-in independen pada shell/CI; lihat [referensi CLI AI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Evaluasi dan Optimasi AI
```bash
# In an initialized agent project, configure evaluation resources
azd ai eval init

# Optionally generate a rubric and dataset; review files and printed next steps
azd ai eval generate

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Agen beta.22 menggantikan perintah evaluasi warisan dengan `azd ai eval` dari `azure.ai.evaluations`. Konfigurasi evaluasi baru menggunakan kunci camelCase. Optimasi `--config` mengambil permintaan API optimasi mandiri, **bukan** warisan `eval.yaml` atau baru `azure.eval.yaml`; gunakan `--eval`/`--eval-config` untuk penggunaan ulang evaluasi. Lihat [pengaturan evaluasi](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) dan [migrasi optimasi](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Server MCP (Alfa)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generasi Infrastruktur
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Alur Kerja Cepat

### Alur Kerja Pengembangan
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### Alur Kerja Multi-Lingkungan
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

### Alur Kerja Pemecahan Masalah
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 Perintah Debugging

### Informasi Debug
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### Debug Template
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Perintah File dan Direktori

### Struktur Proyek
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Format Output

### Output JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Tabel
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Kombinasi Perintah Umum

### Skrip Pemeriksaan Kesehatan
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validasi Deployment
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Perbandingan Lingkungan
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skrip Pembersihan Sumber Daya
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Variabel Lingkungan

### Variabel Lingkungan Umum
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Perintah Darurat

### Perbaikan Cepat
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### Perintah Pemulihan
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Tips Profesional

### Alias untuk Alur Kerja Lebih Cepat
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Pintasan Fungsi
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
azd-status() {
    echo "Current environment:"
    azd env get-values
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

### Tautan Dokumentasi
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tip**: Tandai lembar contekan ini dan gunakan `Ctrl+F` untuk dengan cepat menemukan perintah yang Anda butuhkan!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Preflight Checks](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Pelajaran Selanjutnya**: [Glosarium](glossary.md)

---

> **💡 Ingin bantuan perintah Azure di editor Anda?** Pasang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) dengan `npx skills add microsoft/github-copilot-for-azure` — 37 keahlian untuk AI, Foundry, deployment, diagnostik, dan lainnya.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->