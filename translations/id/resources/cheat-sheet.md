# Daftar Perintah - Perintah AZD Esensial

**Referensi Cepat untuk Semua Bab**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mulai Cepat**: [Bab 1: Dasar & Mulai Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Perintah AI**: [Bab 2: Pengembangan AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Lanjutan**: [Bab 4: Infrastruktur sebagai Kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Pendahuluan

Daftar perintah komprehensif ini menyediakan referensi cepat untuk perintah Azure Developer CLI yang paling sering digunakan, diatur berdasarkan kategori dengan contoh praktis. Sempurna untuk pencarian cepat selama pengembangan, pemecahan masalah, dan operasi harian dengan proyek azd.

## Tujuan Pembelajaran

Dengan menggunakan daftar ini, Anda akan:
- Memiliki akses instan ke perintah dan sintaks Azure Developer CLI yang penting
- Memahami organisasi perintah berdasarkan kategori fungsional dan kasus penggunaan
- Menjadikan contoh praktis sebagai referensi untuk skenario pengembangan dan deployment umum
- Mengakses perintah pemecahan masalah untuk resolusi cepat masalah
- Menemukan opsi konfigurasi dan kustomisasi lanjutan secara efisien
- Menemukan perintah manajemen lingkungan dan workflow multi-lingkungan

## Hasil Pembelajaran

Dengan sering merujuk daftar perintah ini, Anda akan dapat:
- Menjalankan perintah azd dengan percaya diri tanpa harus merujuk dokumentasi lengkap
- Cepat menyelesaikan masalah umum menggunakan perintah diagnostik yang sesuai
- Efisien mengelola berbagai lingkungan dan skenario deployment
- Menerapkan fitur dan opsi konfigurasi azd lanjutan sesuai kebutuhan
- Memecahkan masalah deployment dengan urutan perintah sistematis
- Mengoptimalkan workflow melalui penggunaan pintasan dan opsi azd yang efektif

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

## Perintah Core Deployment

### Workflow Deployment Lengkap
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

### Build dan Paket
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

> **`azd restore`** mengunduh dependensi aplikasi Anda (npm, pip, NuGet, Maven, dll.). Ini berjalan otomatis selama `azd package` dan `azd deploy`, jadi jarang dipanggil secara langsung — jalankan secara manual untuk pra-mengambil dependensi (misal, untuk menghangatkan cache CI atau bekerja offline setelahnya).

> **`azd package`** menyiapkan artefak yang dapat di-deploy tanpa melakukan deploy layanan aplikasi. Perilaku tergantung bahasa dan host: kemasan kontainer bisa menggunakan build jarak jauh Azure dan mempublikasikan image ke registry, jadi tidak selalu offline atau tanpa penulisan ke Azure. `azd deploy` dapat melakukan paket otomatis; gunakan langkah paket terpisah saat Anda memerlukan artefak atau pengecekan build.


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

Berkas lingkungan adalah teks biasa. Jangan perlakukan `azd env set` sebagai penyimpanan rahasia; gunakan referensi Key Vault atau managed identity sesuai kebutuhan.

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

Application Insights harus dikonfigurasi oleh template. Opsi Live Metrics AZD saat ini tidak didukung untuk aplikasi Python; gunakan overview, logs, atau workflow pelacakan yang didokumentasikan pada contoh.

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

Referensi GA Foundry diperbarui 2026-11-09: bundle `microsoft.foundry` 1.0, diumumkan [5 November 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Gunakan `azd >= 1.37.0`; komponen versi independen dan fitur preview opsional mempertahankan statusnya sendiri.

```bash
# List all available extensions (including AI)
azd extension list

# Check/update the core CLI before updating extensions
azd version
azd update

# Install the GA bundle (agents, connections, inspector, projects,
# routines, skills, and toolboxes)
azd ext install microsoft.foundry

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Inspect installed versions and upgrade the bundle
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Bundle ini tidak termasuk evaluasi, dataset, fine-tuning, atau model kustom. Instalasi ekstensi inti individual tetap didukung. Ikuti [panduan hosted-agent GA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) untuk contoh berjalan dengan Python 3.13+, uv saat ini, perizinan, dan kuota model.

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

# For a code-based hosted agent, add --deploy-mode code during init
# Review azure.yaml, then provision before running locally
azd provision
azd ai agent run

# In a second terminal in the same project directory
azd ai agent invoke --local "Explain how this agent is deployed."

# Upload source for a remote Foundry build (code mode)
azd deploy

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Review hosted-agent changes, stream logs, or diagnose permissions
azd deploy --preview
azd ai agent monitor --follow
azd ai agent doctor

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` menggantikan ejaan deprecated `--manifest`/`-m`; manifes lama perlu migrasi. Tidak ada opsi agent-init `--host containerapp` saat ini. Preview managed-harness, voice, dan long-running memerlukan opt-in shell/CI lingkungan independen; lihat [referensi AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Pengujian lokal masih menggunakan deployment model Azure dan dikenai biaya. Untuk pembersihan, `azd down` menghapus resource group proyek Foundry yang baru dibuat, tapi meninggalkan resource proyek yang digunakan ulang; hapus hanya resource yang tidak diinginkan milik Anda secara terpisah.

### Evaluasi dan Optimasi AI
```bash
# Generate and review a draft dataset and rubric (Dataset and evaluator / Turn)
azd ai eval generate

# In the initialized agent project, select those assets and a judge model
azd ai eval init --name quality

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --eval quality --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Agen beta.22 menggantikan perintah evaluasi legacy dengan `azd ai eval` dari `azure.ai.evaluations`. Konfigurasi evaluasi baru menggunakan kunci camelCase. Optimasi `--config` mengambil permintaan API optimasi mandiri, **bukan** legacy `eval.yaml` atau baru `azure.eval.yaml`; gunakan `--eval`/`--eval-config` untuk penggunaan ulang evaluasi. Lihat [penyiapan evaluasi](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) dan [migrasi optimasi](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Foundry CI/CD
```bash
# After a successful local deployment, generate and review the pipeline
azd up
azd pipeline config

# Runner steps: install extensions, authenticate, then deploy
azd ext install microsoft.foundry azure.ai.evaluations
# Keep the generated OIDC sign-in and environment settings here
azd up --no-prompt
azd ai eval run start --eval quality --wait --no-prompt --fail-on "pass-rate=0.9"
```

Fragmen runner bukanlah sebuah workflow lengkap. Komit konfigurasi evaluasi yang telah direview dan aset nonrahasia, berikan akses dataset/evaluator/model, dan gunakan satu lingkungan per tahap. Lihat [contoh CI/CD yang diautentikasi](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Pembuatan Infrastruktur
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Workflow Cepat

### Workflow Pengembangan
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

### Workflow Multi-Lingkungan
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

### Workflow Pemecahan Masalah
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

### Debugging Template
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Perintah Berkas dan Direktori

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

### Alias untuk Workflow Lebih Cepat
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

**Tip**: Tandai lembar contekan ini dan gunakan `Ctrl+F` untuk menemukan perintah yang Anda butuhkan dengan cepat!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Pemeriksaan Pra-penerbangan](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Pelajaran Berikutnya**: [Glosarium](glossary.md)

---

> **💡 Ingin bantuan perintah Azure di editor Anda?** Pasang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) dengan `npx skills add microsoft/github-copilot-for-azure` — 37 keterampilan untuk AI, Foundry, deployment, diagnostik, dan lainnya.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->