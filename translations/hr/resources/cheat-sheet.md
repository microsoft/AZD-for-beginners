<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "04291031a6a1cc0dc4064dcb9c543584",
  "translation_date": "2025-09-10T07:43:47+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "hr"
}
-->
# Popis naredbi - Osnovne AZD naredbe

## Uvod

Ovaj sveobuhvatni popis pruža brzi pregled najčešće korištenih naredbi Azure Developer CLI, organiziranih po kategorijama s praktičnim primjerima. Idealan za brze pretrage tijekom razvoja, otklanjanja poteškoća i svakodnevnog rada s azd projektima.

## Ciljevi učenja

Korištenjem ovog popisa, moći ćete:
- Imati trenutačan pristup ključnim naredbama i sintaksi Azure Developer CLI-a
- Razumjeti organizaciju naredbi prema funkcionalnim kategorijama i slučajevima upotrebe
- Referencirati praktične primjere za uobičajene scenarije razvoja i implementacije
- Pristupiti naredbama za otklanjanje poteškoća radi brzog rješavanja problema
- Učinkovito pronaći opcije za naprednu konfiguraciju i prilagodbu
- Locirati naredbe za upravljanje okruženjima i rad s više okruženja

## Ishodi učenja

Redovitim korištenjem ovog popisa, moći ćete:
- Samouvjereno izvršavati azd naredbe bez potrebe za potpunom dokumentacijom
- Brzo rješavati uobičajene probleme koristeći odgovarajuće dijagnostičke naredbe
- Učinkovito upravljati višestrukim okruženjima i scenarijima implementacije
- Primijeniti napredne značajke i opcije konfiguracije azd-a prema potrebi
- Sustavno rješavati probleme s implementacijom koristeći sekvence naredbi
- Optimizirati radne procese kroz učinkovito korištenje azd prečaca i opcija

## Početne naredbe

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

### Inicijalizacija projekta
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

## Osnovne naredbe za implementaciju

### Cjelokupni tijek implementacije
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

### Samo infrastruktura
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Samo aplikacija
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Izgradnja i pakiranje
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Upravljanje okruženjima

### Operacije s okruženjima
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

### Varijable okruženja
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

## ⚙️ Naredbe za konfiguraciju

### Globalna konfiguracija
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

### Konfiguracija projekta
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Praćenje i zapisnici

### Zapisnici aplikacije
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

### Praćenje
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Naredbe za održavanje

### Čišćenje
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

### Ažuriranja
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Napredne naredbe

### CI/CD i pipeline
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Upravljanje infrastrukturom
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Upravljanje uslugama
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Brzi radni procesi

### Radni proces razvoja
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

### Rad s više okruženja
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

### Radni proces za otklanjanje poteškoća
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

## 🔍 Naredbe za otklanjanje grešaka

### Informacije za otklanjanje grešaka
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

### Otklanjanje grešaka u predlošcima
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Naredbe za datoteke i direktorije

### Struktura projekta
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatiranje izlaza

### JSON izlaz
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tablični izlaz
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Uobičajene kombinacije naredbi

### Skripta za provjeru zdravlja
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Validacija implementacije
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Usporedba okruženja
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skripta za čišćenje resursa
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Varijable okruženja

### Uobičajene varijable okruženja
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

## 🚨 Hitne naredbe

### Brza rješenja
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

### Naredbe za oporavak
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Savjeti za profesionalce

### Alias za brži rad
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Prečaci za funkcije
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

## 📖 Pomoć i dokumentacija

### Dobivanje pomoći
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

### Poveznice na dokumentaciju
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Savjet**: Označite ovaj popis kao bookmark i koristite `Ctrl+F` za brzo pronalaženje potrebnih naredbi!

---

**Navigacija**
- **Prethodna lekcija**: [Preflight provjere](../docs/pre-deployment/preflight-checks.md)
- **Sljedeća lekcija**: [Pojmovnik](glossary.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane stručnjaka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.