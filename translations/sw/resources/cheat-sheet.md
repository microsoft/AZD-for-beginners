<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a5f480ef9bf86e8f4dd1340d077fff3",
  "translation_date": "2025-10-24T17:50:11+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "sw"
}
-->
# Karatasi ya Msaada wa Amri - Amri Muhimu za AZD

**Marejeleo ya Haraka kwa Sura Zote**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../README.md)
- **📖 Mwanzo wa Haraka**: [Sura ya 1: Msingi & Mwanzo wa Haraka](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Amri za AI**: [Sura ya 2: Maendeleo ya Kwanza ya AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Ya Juu**: [Sura ya 4: Miundombinu kama Nambari](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Utangulizi

Karatasi hii ya msaada inatoa marejeleo ya haraka kwa amri za kawaida za Azure Developer CLI, zilizopangwa kwa makundi na mifano ya vitendo. Inafaa kwa marejeleo ya haraka wakati wa maendeleo, utatuzi wa matatizo, na shughuli za kila siku na miradi ya azd.

## Malengo ya Kujifunza

Kwa kutumia karatasi hii ya msaada, utaweza:
- Kupata amri muhimu za Azure Developer CLI na sintaksia kwa haraka
- Kuelewa mpangilio wa amri kulingana na makundi ya kazi na matumizi
- Kurejelea mifano ya vitendo kwa hali za kawaida za maendeleo na utekelezaji
- Kupata amri za utatuzi wa matatizo kwa haraka
- Kupata chaguzi za usanidi wa hali ya juu na ubinafsishaji kwa urahisi
- Kupata amri za usimamizi wa mazingira na mtiririko wa kazi wa mazingira mengi

## Matokeo ya Kujifunza

Kwa kutumia karatasi hii mara kwa mara, utaweza:
- Kutekeleza amri za azd kwa ujasiri bila kurejelea nyaraka kamili
- Kutatua matatizo ya kawaida kwa haraka kwa kutumia amri sahihi za uchunguzi
- Kusimamia kwa ufanisi mazingira mengi na hali za utekelezaji
- Kutumia vipengele vya hali ya juu vya azd na chaguzi za usanidi inapohitajika
- Kutatua matatizo ya utekelezaji kwa kutumia mfululizo wa amri za kimfumo
- Kuboresha mtiririko wa kazi kupitia matumizi bora ya njia za mkato na chaguzi za azd

## Amri za Kuanza

### Uthibitishaji
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Uanzishaji wa Mradi
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

## Amri za Msingi za Utekelezaji

### Mtiririko Kamili wa Utekelezaji
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

### Miundombinu Pekee
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

### Programu Pekee
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Kujenga na Kufunga
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Usimamizi wa Mazingira

### Operesheni za Mazingira
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

### Vigezo vya Mazingira
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

## ⚙️ Amri za Usanidi

### Usanidi wa Ulimwengu
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

### Usanidi wa Mradi
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Ufuatiliaji na Magogo

### Magogo ya Programu
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

### Ufuatiliaji
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Amri za Matengenezo

### Usafishaji
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

### Sasisho
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Amri za Juu

### Njia za Mkusanyiko na CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Usimamizi wa Miundombinu
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

### Usimamizi wa Huduma
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Mitiririko ya Haraka ya Kazi

### Mtiririko wa Maendeleo
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

### Mtiririko wa Mazingira Mengi
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

### Mtiririko wa Utatuzi wa Matatizo
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

## 🔍 Amri za Utatuzi wa Matatizo

### Taarifa za Utatuzi
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

### Utatuzi wa Violezo
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Amri za Faili na Saraka

### Muundo wa Mradi
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Uundaji wa Matokeo

### Matokeo ya JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Matokeo ya Jedwali
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Mchanganyiko wa Amri za Kawaida

### Script ya Ukaguzi wa Afya
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Uthibitishaji wa Utekelezaji
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### Ulinganisho wa Mazingira
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script ya Usafishaji wa Rasilimali
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Vigezo vya Mazingira

### Vigezo vya Kawaida vya Mazingira
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

## 🚨 Amri za Dharura

### Marekebisho ya Haraka
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

### Amri za Urejeshaji
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Vidokezo vya Wataalamu

### Majina ya Mkato kwa Mtiririko wa Haraka
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Njia za Mkato za Kazi
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

## 📖 Msaada na Nyaraka

### Kupata Msaada
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

### Viungo vya Nyaraka
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Kidokezo**: Weka alama karatasi hii ya msaada na tumia `Ctrl+F` kupata haraka amri unazohitaji!

---

**Urambazaji**
- **Somo la Awali**: [Ukaguzi wa Kabla ya Utekelezaji](../docs/pre-deployment/preflight-checks.md)
- **Somo Linalofuata**: [Kamusi](glossary.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.