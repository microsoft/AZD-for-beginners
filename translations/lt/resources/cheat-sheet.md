# Komandų atmintinė - Pagrindiniai AZD komandos

**Greita nuoroda visiems skyriams**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../README.md)
- **📖 Greitas startas**: [1 skyrius: Pagrindai ir greitas startas](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI komandos**: [2 skyrius: AI-pirmoji plėtra](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pažengusiems**: [4 skyrius: Infrastruktūra kaip kodas](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Įvadas

Ši išsami atmintinė suteikia greitą prieigą prie dažniausiai naudojamų Azure Developer CLI komandų, suskirstytų pagal kategorijas su praktiniais pavyzdžiais. Puikiai tinka greitam peržiūrėjimui plėtros, trikčių šalinimo ir kasdienės veiklos su azd projektais metu.

## Mokymosi tikslai

Naudodamiesi šia atmintine, jūs:
- Turėsite greitą prieigą prie pagrindinių Azure Developer CLI komandų ir sintaksės
- Suprasite komandų organizavimą pagal funkcines kategorijas ir naudojimo atvejus
- Galėsite remtis praktiniais pavyzdžiais dažniausiai pasitaikančiose plėtros ir diegimo situacijose
- Rasite trikčių šalinimo komandas greitam problemų sprendimui
- Efektyviai surasite pažangias konfigūracijos ir pritaikymo galimybes
- Naudosite aplinkos valdymo ir daugiaplinkės darbo eigos komandas

## Mokymosi rezultatai

Reguliariai naudodami šią atmintinę, jūs galėsite:
- Pasitikėdami vykdyti azd komandas be pilnos dokumentacijos peržiūros
- Greitai spręsti dažniausiai pasitaikančias problemas naudodami tinkamas diagnostikos komandas
- Efektyviai valdyti kelias aplinkas ir diegimo scenarijus
- Taikyti pažangias azd funkcijas ir konfigūracijos galimybes, kai to reikia
- Sistemingai spręsti diegimo problemas naudodami komandų sekas
- Optimizuoti darbo eigas efektyviai naudojant azd trumpinius ir parinktis

## Pradžios komandos

### Autentifikacija
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Projekto inicijavimas
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

## Pagrindinės diegimo komandos

### Pilnas diegimo procesas
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

### Tik infrastruktūra
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

### Tik aplikacija
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Kūrimas ir paketavimas
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Aplinkos valdymas

### Aplinkos operacijos
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

### Aplinkos kintamieji
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

## ⚙️ Konfigūracijos komandos

### Globali konfigūracija
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

### Projekto konfigūracija
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Stebėjimas ir žurnalai

### Aplikacijos žurnalai
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

### Stebėjimas
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Priežiūros komandos

### Valymas
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

### Atnaujinimai
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Pažangios komandos

### Vamzdynai ir CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Infrastruktūros valdymas
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

### Paslaugų valdymas
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Greitos darbo eigos

### Plėtros darbo eiga
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

### Daugiaplinkės darbo eiga
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

### Trikčių šalinimo darbo eiga
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

## 🔍 Derinimo komandos

### Derinimo informacija
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

### Šablonų derinimas
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Failų ir katalogų komandos

### Projekto struktūra
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Išvesties formatavimas

### JSON išvestis
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Lentelės išvestis
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Dažniausiai naudojamų komandų deriniai

### Sveikatos patikrinimo scenarijus
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Diegimo patvirtinimas
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### Aplinkos palyginimas
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Išteklių valymo scenarijus
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Aplinkos kintamieji

### Dažniausiai naudojami aplinkos kintamieji
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

## 🚨 Avarinės komandos

### Greiti sprendimai
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

### Atkūrimo komandos
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Naudingi patarimai

### Trumpiniai greitesnei darbo eigai
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkcijų trumpiniai
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

## 📖 Pagalba ir dokumentacija

### Pagalbos gavimas
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

### Dokumentacijos nuorodos
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Patarimas**: Pažymėkite šią atmintinę ir naudokite `Ctrl+F`, kad greitai rastumėte reikalingas komandas!

---

**Navigacija**
- **Ankstesnė pamoka**: [Priešdieginiai patikrinimai](../docs/pre-deployment/preflight-checks.md)
- **Kita pamoka**: [Žodynas](glossary.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus aiškinimus, atsiradusius dėl šio vertimo naudojimo.