# Lembaran Pantau Perintah - Perintah Azd Penting

**Rujukan Pantas untuk Semua Bab**
- **📚 Rumah Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mulakan Cepat**: [Bab 1: Asas & Mula Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Perintah AI**: [Bab 2: Pembangunan AI-Utama](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Lanjutan**: [Bab 4: Infrastruktur sebagai Kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Pengenalan

Lembaran pantau menyeluruh ini menyediakan rujukan pantas untuk perintah Azure Developer CLI yang paling sering digunakan, disusun mengikut kategori dengan contoh praktikal. Sesuai untuk rujukan pantas semasa pembangunan, penyelesaian masalah, dan operasi harian dengan projek azd.

## Matlamat Pembelajaran

Dengan menggunakan lembaran pantau ini, anda akan:
- Mendapatkan akses segera kepada perintah dan sintaks Azure Developer CLI penting
- Memahami organisasi perintah mengikut kategori fungsional dan kes penggunaan
- Merujuk contoh praktikal untuk scenario pembangunan dan penyebaran biasa
- Mengakses perintah penyelesaian masalah untuk penyelesaian isu cepat
- Mencari pilihan konfigurasi lanjutan dan penyesuaian dengan cekap
- Menemukan perintah pengurusan persekitaran dan aliran kerja pelbagai persekitaran

## Hasil Pembelajaran

Dengan rujukan kerap kepada lembaran pantau ini, anda akan dapat:
- Melaksanakan perintah azd dengan yakin tanpa merujuk dokumentasi penuh
- Menyelesaikan isu biasa dengan cepat menggunakan perintah diagnostik yang sesuai
- Mengurus pelbagai persekitaran dan scenario penyebaran dengan cekap
- Menerapkan ciri dan pilihan konfigurasi azd lanjutan bila perlu
- Menyelesaikan isu penyebaran menggunakan urutan perintah yang sistematik
- Mengoptimumkan aliran kerja melalui penggunaan pintasan dan pilihan azd yang berkesan

## Perintah Mula

### Pengesahan
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

### Inisialisasi Projek
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

## Perintah Penyebaran Teras

### Aliran Kerja Penyebaran Lengkap
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

### Infrastruktur Sahaja
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Aplikasi Sahaja
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Bina dan Pek
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

> **`azd restore`** memuat turun kebergantungan aplikasi anda (npm, pip, NuGet, Maven, dll.). Ia berjalan secara automatik semasa `azd package` dan `azd deploy`, jadi anda jarang memanggilnya secara langsung—jalankan secara manual untuk memuat awal kebergantungan (contohnya, untuk menghangatkan cache CI atau bekerja luar talian kemudian).

> **`azd package`** menyediakan artifak yang boleh disebarkan tanpa menyebarkan servis aplikasi. Tingkah laku bergantung pada bahasa dan hos: pembungkusan kontena boleh menggunakan binaan jarak jauh Azure dan menerbitkan imej ke registri, jadi ia tidak semestinya luar talian atau bebas daripada penulisan Azure. `azd deploy` boleh membungkus secara automatik; gunakan langkah pek berasingan apabila anda memerlukan artifak atau pemeriksaan bina.


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

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### Pembolehubah Persekitaran
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

Fail persekitaran adalah teks biasa. Jangan anggap `azd env set` sebagai storan rahsia; gunakan rujukan Key Vault atau identiti terurus mengikut kesesuaian.

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

### Konfigurasi Projek
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Pemantauan dan Diagnostik

### Papan Pemantauan
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

Application Insights mesti dikonfigurasikan oleh templat. Pilihan Metrik Langsung AZD tidak disokong buat masa ini untuk aplikasi Python; gunakan gambaran keseluruhan, log, atau aliran kerja pelacakan yang didokumentasikan dalam sampel sebaliknya.

### Melihat Log Kontena
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Pertanyaan Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
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
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Perintah Lanjutan

### Saluran dan CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Pengurusan Infrastruktur
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

### Maklumat Projek
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Perintah AI & Sambungan

### Sambungan AZD

Rujukan AI CLI dikaji semula 2026-11-04: `azd 1.37.2`, ejen `1.0.0-beta.23`, penilaian `1.0.0-beta.2`. Gunakan `azd >= 1.37.0` untuk aliran kerja gabungan; naik taraf CLI teras sebelum sambungan tidak serasi.

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

### Perintah Ejen AI
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

`--template`/`-t` menggantikan ejaan lama `--manifest`/`-m`; manifes legacy perlu migrasi. Tiada pilihan ejen-init `--host containerapp` sekarang. Pratonton managed-harness, suara, dan jangka panjang memerlukan pilihan persekitaran shell/CI bebas; lihat [rujukan AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Penilaian dan Pengoptimuman AI
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

Ejen beta.22 menggantikan arahan penilaian warisan dengan `azd ai eval` dari `azure.ai.evaluations`. Konfigurasi penilaian baru menggunakan kekunci camelCase. Pengoptimuman `--config` mengambil permintaan API pengoptimuman berdiri sendiri, **bukan** warisan `eval.yaml` atau `azure.eval.yaml` baru; gunakan `--eval`/`--eval-config` untuk penggunaan semula penilaian. Lihat [penyediaan penilaian](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) dan [pemindahan pengoptimuman](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Pelayan MCP (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Penjanaan Infrastruktur
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Aliran Kerja Pantas

### Aliran Kerja Pembangunan
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

### Aliran Kerja Multi-Persekitaran
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
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 Arahan Penyahpepijatan

### Maklumat Penyahpepijatan
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

### Penyahpepijatan Templat
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Arahan Fail dan Direktori

### Struktur Projek
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Pemformatan Output

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

### Output Jadual
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Gabungan Arahan Biasa

### Skrip Pemeriksaan Kesihatan
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Pengesahan Penyebaran
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Perbandingan Persekitaran
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skrip Pembersihan Sumber
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Pembolehubah Persekitaran

### Pembolehubah Persekitaran Biasa
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

## 🚨 Arahan Kecemasan

### Pembaikan Pantas
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

### Arahan Pemulihan
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Petua Profesional

### Alias untuk Aliran Kerja Lebih Cepat
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Pautan Pintasan Fungsi
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

### Pautan Dokumentasi
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Petua**: Tandakan helaian cheat ini dan gunakan `Ctrl+F` untuk mencari arahan yang anda perlukan dengan cepat!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Pemeriksaan Preflight](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Pelajaran Seterusnya**: [Glosari](glossary.md)

---

> **💡 Mahu bantuan arahan Azure dalam penyunting anda?** Pasang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) dengan `npx skills add microsoft/github-copilot-for-azure` — 37 kemahiran untuk AI, Foundry, penyebaran, diagnostik, dan banyak lagi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->