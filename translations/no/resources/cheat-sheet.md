# Kommandooversikt - Essensielle AZD-kommandoer

**Hurtigreferanse for alle kapitler**
- **📚 Kursoversikt**: [AZD For Nybegynnere](../README.md)
- **📖 Kom i gang raskt**: [Kapittel 1: Grunnlag & Kom i gang](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandoer**: [Kapittel 2: AI-First Utvikling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansert**: [Kapittel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduksjon

Dette omfattende oppslagsarket gir en rask referanse til de mest brukte Azure Developer CLI-kommandoene, organisert etter kategori med praktiske eksempler. Perfekt for raske oppslag under utvikling, feilsøking og daglige operasjoner med azd-prosjekter.

## Læringsmål

Ved å bruke dette oppslagsarket vil du:
- Ha umiddelbar tilgang til essensielle Azure Developer CLI-kommandoer og syntaks
- Forstå kommandoorganisering etter funksjonelle kategorier og bruksområder
- Referere til praktiske eksempler for vanlige utviklings- og distribusjonsscenarier
- Få tilgang til feilsøkingskommandoer for rask problemløsning
- Finne avanserte konfigurasjons- og tilpasningsalternativer effektivt
- Lokalisere kommandoer for miljøstyring og arbeidsflyt med flere miljøer

## Læringsutbytte

Med regelmessig bruk av dette oppslagsarket vil du kunne:
- Utføre azd-kommandoer med selvtillit uten å måtte referere til full dokumentasjon
- Raskt løse vanlige problemer ved hjelp av passende diagnostiske kommandoer
- Effektivt administrere flere miljøer og distribusjonsscenarier
- Bruke avanserte azd-funksjoner og konfigurasjonsalternativer etter behov
- Feilsøke distribusjonsproblemer ved hjelp av systematiske kommandoer
- Optimalisere arbeidsflyter gjennom effektiv bruk av azd-snarveier og alternativer

## Kom i gang-kommandoer

### Autentisering
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Prosjektinitialisering
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

## Kjernekommandoer for distribusjon

### Komplett distribusjonsarbeidsflyt
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

### Kun infrastruktur
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

### Kun applikasjon
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Bygg og pakk
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Miljøstyring

### Miljøoperasjoner
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

### Miljøvariabler
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

## ⚙️ Konfigurasjonskommandoer

### Global konfigurasjon
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

### Prosjektkonfigurasjon
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Overvåking og logger

### Applikasjonslogger
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

### Overvåking
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Vedlikeholdskommandoer

### Opprydding
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

### Oppdateringer
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Avanserte kommandoer

### Pipeline og CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Infrastrukturstyring
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

### Tjenestestyring
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Hurtige arbeidsflyter

### Utviklingsarbeidsflyt
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

### Arbeidsflyt med flere miljøer
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

### Feilsøkingsarbeidsflyt
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

## 🔍 Feilsøkingskommandoer

### Feilsøkingsinformasjon
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

### Malfeilsøking
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Fil- og katalogkommandoer

### Prosjektstruktur
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Utdataformatering

### JSON-utdata
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabellutdata
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Vanlige kommando-kombinasjoner

### Helsekontrollskript
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Validering av distribusjon
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### Miljøsammenligning
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Ressursoppryddingsskript
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Miljøvariabler

### Vanlige miljøvariabler
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

## 🚨 Nødkommandoer

### Rask løsning
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

### Gjenopprettingskommandoer
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Profftips

### Alias for raskere arbeidsflyt
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funksjonssnarveier
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

## 📖 Hjelp og dokumentasjon

### Få hjelp
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

### Dokumentasjonslenker
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tips**: Bokmerk dette oppslagsarket og bruk `Ctrl+F` for raskt å finne kommandoene du trenger!

---

**Navigasjon**
- **Forrige leksjon**: [Forhåndssjekk](../docs/pre-deployment/preflight-checks.md)
- **Neste leksjon**: [Ordliste](glossary.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.