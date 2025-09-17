<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-17T23:37:07+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "da"
}
-->
# Kommandooversigt - Vigtige AZD-kommandoer

**Hurtig reference for alle kapitler**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Hurtig Start**: [Kapitel 1: Fundament & Hurtig Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandoer**: [Kapitel 2: AI-First Udvikling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanceret**: [Kapitel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduktion

Denne omfattende oversigt giver en hurtig reference til de mest anvendte Azure Developer CLI-kommandoer, organiseret efter kategori med praktiske eksempler. Perfekt til hurtige opslag under udvikling, fejlfinding og daglige operationer med azd-projekter.

## Læringsmål

Ved at bruge denne oversigt vil du:
- Få øjeblikkelig adgang til essentielle Azure Developer CLI-kommandoer og syntaks
- Forstå kommandoernes organisering efter funktionelle kategorier og anvendelsesscenarier
- Referere til praktiske eksempler for almindelige udviklings- og implementeringsscenarier
- Finde fejlfinding-kommandoer til hurtig løsning af problemer
- Effektivt finde avancerede konfigurations- og tilpasningsmuligheder
- Lokalisere kommandoer til miljøstyring og workflows med flere miljøer

## Læringsresultater

Ved regelmæssig brug af denne oversigt vil du kunne:
- Udføre azd-kommandoer med selvtillid uden at skulle referere til fuld dokumentation
- Hurtigt løse almindelige problemer ved hjælp af passende diagnostiske kommandoer
- Effektivt administrere flere miljøer og implementeringsscenarier
- Anvende avancerede azd-funktioner og konfigurationsmuligheder efter behov
- Fejlsøge implementeringsproblemer ved hjælp af systematiske kommando-sekvenser
- Optimere workflows gennem effektiv brug af azd-genveje og muligheder

## Kom i gang med kommandoer

### Autentificering
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Projektinitialisering
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

## Kerneimplementeringskommandoer

### Komplet implementeringsworkflow
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

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Kun applikation
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Byg og pak
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Miljøstyring

### Miljøoperationer
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

## ⚙️ Konfigurationskommandoer

### Global konfiguration
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

### Projektkonfiguration
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Overvågning og logfiler

### Applikationslogfiler
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

### Overvågning
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Vedligeholdelseskommandoer

### Oprydning
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

### Opdateringer
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Avancerede kommandoer

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

## 🎯 Hurtige workflows

### Udviklingsworkflow
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

### Workflow med flere miljøer
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

### Fejlsøgningsworkflow
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

## 🔍 Fejlsøgningskommandoer

### Fejlsøgningsinformation
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

### Skabelonfejlsøgning
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Fil- og katalogkommandoer

### Projektstruktur
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Outputformatering

### JSON-output
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeloutput
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Almindelige kommandokombinationer

### Sundhedstjek-script
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Implementeringsvalidering
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
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

### Ressourceoprydningsscript
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

### Almindelige miljøvariabler
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

### Hurtige løsninger
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

### Gendannelseskommandoer
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Pro Tips

### Aliasser for hurtigere workflows
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktionsgenveje
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

## 📖 Hjælp og dokumentation

### Få hjælp
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

### Dokumentationslinks
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tip**: Bogmærk denne oversigt og brug `Ctrl+F` til hurtigt at finde de kommandoer, du har brug for!

---

**Navigation**
- **Forrige lektion**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Næste lektion**: [Glossary](glossary.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.