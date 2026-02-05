# Parancsok Gyorssegédlet - Alapvető AZD Parancsok

**Gyors áttekintés az összes fejezethez**
- **📚 Kurzus kezdőlapja**: [AZD Kezdőknek](../README.md)
- **📖 Gyors kezdés**: [1. fejezet: Alapok és gyors kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Parancsok**: [2. fejezet: AI-első fejlesztés](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Haladó**: [4. fejezet: Infrastruktúra mint kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Bevezetés

Ez az átfogó gyorssegédlet gyors hozzáférést biztosít a leggyakrabban használt Azure Developer CLI parancsokhoz, kategóriák szerint rendszerezve, gyakorlati példákkal. Tökéletes gyors keresésekhez fejlesztés, hibakeresés és az azd projektek napi működése során.

## Tanulási célok

Ezzel a gyorssegédlettel:
- Azonnali hozzáférést kap az alapvető Azure Developer CLI parancsokhoz és szintaxisokhoz
- Megérti a parancsok kategóriák szerinti szervezését és felhasználási eseteit
- Gyakorlati példákat talál a gyakori fejlesztési és telepítési forgatókönyvekhez
- Hibakeresési parancsokat talál gyors problémamegoldáshoz
- Hatékonyan megtalálja a fejlett konfigurációs és testreszabási lehetőségeket
- Környezetkezelési és többkörnyezetes munkafolyamat-parancsokat talál

## Tanulási eredmények

A gyorssegédlet rendszeres használatával képes lesz:
- Magabiztosan végrehajtani az azd parancsokat teljes dokumentáció nélkül
- Gyorsan megoldani a gyakori problémákat megfelelő diagnosztikai parancsokkal
- Hatékonyan kezelni több környezetet és telepítési forgatókönyveket
- Szükség esetén alkalmazni az azd fejlett funkcióit és konfigurációs lehetőségeit
- Telepítési problémákat szisztematikus parancssorozatokkal elhárítani
- Optimalizálni a munkafolyamatokat az azd gyorsbillentyűk és opciók hatékony használatával

## Kezdő parancsok

### Hitelesítés
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Projekt inicializálása
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

## Alapvető telepítési parancsok

### Teljes telepítési munkafolyamat
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

### Csak infrastruktúra
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

### Csak alkalmazás
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Build és csomagolás
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Környezetkezelés

### Környezet műveletek
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

### Környezeti változók
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

## ⚙️ Konfigurációs parancsok

### Globális konfiguráció
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

### Projekt konfiguráció
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoring és naplók

### Alkalmazásnaplók
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

### Monitoring
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Karbantartási parancsok

### Tisztítás
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

### Frissítések
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Haladó parancsok

### Pipeline és CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Infrastruktúra kezelése
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

### Szolgáltatás kezelése
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Gyors munkafolyamatok

### Fejlesztési munkafolyamat
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

### Többkörnyezetes munkafolyamat
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

### Hibakeresési munkafolyamat
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

## 🔍 Hibakeresési parancsok

### Hibakeresési információk
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

### Sablon hibakeresés
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Fájl- és könyvtárparancsok

### Projektstruktúra
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Kimenet formázása

### JSON kimenet
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Táblázatos kimenet
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Gyakori parancskombinációk

### Egészségügyi ellenőrző szkript
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Telepítési validáció
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### Környezet összehasonlítás
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Erőforrás-tisztító szkript
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Környezeti változók

### Gyakori környezeti változók
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

## 🚨 Vészhelyzeti parancsok

### Gyors javítások
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

### Helyreállítási parancsok
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Profi tippek

### Gyorsbillentyűk a gyorsabb munkafolyamathoz
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkció rövidítések
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

## 📖 Súgó és dokumentáció

### Súgó kérése
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

### Dokumentációs linkek
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tipp**: Jelölje meg könyvjelzővel ezt a gyorssegédletet, és használja a `Ctrl+F` billentyűkombinációt a szükséges parancsok gyors megtalálásához!

---

**Navigáció**
- **Előző lecke**: [Előzetes ellenőrzések](../docs/pre-deployment/preflight-checks.md)
- **Következő lecke**: [Szójegyzék](glossary.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.