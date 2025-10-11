<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-10-11T15:48:27+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "et"
}
-->
# Käskude spikker - Olulised AZD käsud

**Kiirviide kõigile peatükkidele**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Kiire alustamine**: [Peatükk 1: Alused ja kiire alustamine](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI käsud**: [Peatükk 2: AI-põhine arendus](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Täiustatud**: [Peatükk 4: Infrastruktuur kui kood](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Sissejuhatus

See põhjalik spikker pakub kiiret viidet kõige sagedamini kasutatavatele Azure Developer CLI käskudele, mis on organiseeritud kategooriate kaupa koos praktiliste näidetega. Ideaalne kiireks otsimiseks arenduse, tõrkeotsingu ja igapäevaste AZD projektide toimingute ajal.

## Õpieesmärgid

Selle spikri kasutamisega:
- Saate kohese juurdepääsu olulistele Azure Developer CLI käskudele ja süntaksile
- Mõistate käskude organiseerimist funktsionaalsete kategooriate ja kasutusjuhtude järgi
- Leiate praktilisi näiteid tavapäraste arendus- ja juurutamissituatsioonide kohta
- Juurdepääs tõrkeotsingu käskudele kiireks probleemide lahendamiseks
- Leiate tõhusalt täiustatud konfiguratsiooni ja kohandamise võimalusi
- Otsite keskkonna haldamise ja mitme keskkonna töövoo käske

## Õpitulemused

Selle spikri regulaarse viitamisega saate:
- Täita AZD käske enesekindlalt ilma täielikku dokumentatsiooni viitamata
- Lahendada kiiresti tavapäraseid probleeme sobivate diagnostikakäskudega
- Tõhusalt hallata mitut keskkonda ja juurutamissituatsioone
- Rakendada vajadusel täiustatud AZD funktsioone ja konfiguratsioonivõimalusi
- Lahendada juurutamisprobleeme süsteemsete käsujadade abil
- Optimeerida töövooge AZD otseteede ja valikute tõhusa kasutamise kaudu

## Alustamise käsud

### Autentimine
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Projekti initsialiseerimine
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

## Põhijuurutamise käsud

### Täielik juurutamise töövoog
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

### Ainult infrastruktuur
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Ainult rakendus
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Ehitamine ja pakendamine
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Keskkonna haldamine

### Keskkonna toimingud
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

### Keskkonnamuutujad
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

## ⚙️ Konfiguratsioonikäsud

### Globaalne konfiguratsioon
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

### Projekti konfiguratsioon
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Jälgimine ja logid

### Rakenduse logid
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

### Jälgimine
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Hoolduskäsud

### Puhastamine
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

### Uuendused
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Täiustatud käsud

### Töövood ja CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Infrastruktuuri haldamine
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Teenuse haldamine
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Kiired töövood

### Arenduse töövoog
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

### Mitme keskkonna töövoog
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

### Tõrkeotsingu töövoog
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

## 🔍 Silumiskäsud

### Silumisinfo
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

### Mallide silumine
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Faili- ja kataloogikäsud

### Projekti struktuur
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Väljundi vormindamine

### JSON-väljund
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeliväljund
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Tavalised käsukombinatsioonid

### Tervisekontrolli skript
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Juurutamise valideerimine
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Keskkondade võrdlus
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Ressursside puhastamise skript
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Keskkonnamuutujad

### Tavalised keskkonnamuutujad
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

## 🚨 Hädaolukorra käsud

### Kiired parandused
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

### Taastamiskäsud
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Kasulikud näpunäited

### Aliased kiireks töövooguks
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktsiooni otseteed
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

## 📖 Abi ja dokumentatsioon

### Abi saamine
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

### Dokumentatsiooni lingid
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Näpunäide**: Salvestage see spikker järjehoidjatesse ja kasutage `Ctrl+F`, et kiiresti leida vajalikke käske!

---

**Navigeerimine**
- **Eelmine õppetund**: [Eelkontrollid](../docs/pre-deployment/preflight-checks.md)
- **Järgmine õppetund**: [Sõnastik](glossary.md)

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.