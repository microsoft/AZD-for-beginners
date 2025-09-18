<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-18T13:11:45+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "sl"
}
-->
# Ukazna Kratka Lista - Osnovni AZD Ukazi

**Hitri Pregled za Vsa Poglavja**
- **📚 Domača Stran Tečaja**: [AZD Za Začetnike](../README.md)
- **📖 Hitri Začetek**: [Poglavje 1: Osnove & Hitri Začetek](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Ukazi**: [Poglavje 2: Razvoj z AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredno**: [Poglavje 4: Infrastruktura kot Koda](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ta obsežna kratka lista ponuja hiter pregled najpogosteje uporabljenih ukazov Azure Developer CLI, organiziranih po kategorijah s praktičnimi primeri. Idealno za hitre preglede med razvojem, odpravljanjem težav in vsakodnevnimi operacijami z azd projekti.

## Cilji Učenja

Z uporabo te kratke liste boste:
- Imeli takojšen dostop do ključnih ukazov in sintakse Azure Developer CLI
- Razumeli organizacijo ukazov po funkcionalnih kategorijah in primerih uporabe
- Referirali praktične primere za pogoste scenarije razvoja in uvajanja
- Dostopali do ukazov za odpravljanje težav za hitro reševanje težav
- Učinkovito našli napredne možnosti konfiguracije in prilagoditve
- Locirali ukaze za upravljanje okolij in delovne tokove z več okolji

## Rezultati Učenja

Z rednim sklicevanjem na to kratko listo boste lahko:
- Samozavestno izvajali azd ukaze brez potrebe po celotni dokumentaciji
- Hitro reševali pogoste težave z ustreznimi diagnostičnimi ukazi
- Učinkovito upravljali več okolij in scenarije uvajanja
- Po potrebi uporabljali napredne funkcije in možnosti konfiguracije azd
- Sistematično odpravljali težave pri uvajanju z zaporedjem ukazov
- Optimizirali delovne tokove z učinkovito uporabo bližnjic in možnosti azd

## Začetni Ukazi

### Avtentikacija
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Inicializacija Projekta
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

## Osnovni Ukazi za Uvajanje

### Celoten Delovni Tok Uvajanja
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

### Samo Infrastruktura
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Samo Aplikacija
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Gradnja in Pakiranje
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Upravljanje Okolja

### Operacije z Okoljem
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

### Spremenljivke Okolja
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

## ⚙️ Konfiguracijski Ukazi

### Globalna Konfiguracija
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

### Konfiguracija Projekta
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Spremljanje in Dnevniki

### Dnevniki Aplikacije
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

### Spremljanje
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Vzdrževalni Ukazi

### Čiščenje
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

### Posodobitve
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Napredni Ukazi

### Pipeline in CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Upravljanje Infrastrukture
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Upravljanje Storitev
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Hitri Delovni Toki

### Delovni Tok Razvoja
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

### Delovni Tok z Več Okolji
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

### Delovni Tok za Odpravljanje Težav
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

## 🔍 Ukazi za Odpravljanje Napak

### Informacije o Napakah
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

### Odpravljanje Napak v Predlogah
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Ukazi za Datoteke in Mape

### Struktura Projekta
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Oblikovanje Izhoda

### JSON Izhod
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabelni Izhod
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Pogoste Kombinacije Ukazov

### Skripta za Preverjanje Zdravja
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Validacija Uvajanja
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Primerjava Okolij
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skripta za Čiščenje Virov
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Spremenljivke Okolja

### Pogoste Spremenljivke Okolja
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

## 🚨 Nujni Ukazi

### Hitri Popravki
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

### Ukazi za Obnovitev
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Nasveti za Strokovnjake

### Bližnjice za Hitrejši Delovni Tok
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkcijske Bližnjice
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

## 📖 Pomoč in Dokumentacija

### Pridobivanje Pomoči
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

### Povezave do Dokumentacije
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Nasvet**: Označite to kratko listo med priljubljene in uporabite `Ctrl+F` za hitro iskanje potrebnih ukazov!

---

**Navigacija**
- **Prejšnja Lekcija**: [Preverjanje Pred Uvajanjem](../docs/pre-deployment/preflight-checks.md)
- **Naslednja Lekcija**: [Slovar](glossary.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.