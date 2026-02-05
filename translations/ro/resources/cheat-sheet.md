# Foaie de parcurs a comenzilor - Comenzi esențiale AZD

**Referință rapidă pentru toate capitolele**
- **📚 Acasă curs**: [AZD Pentru Începători](../README.md)
- **📖 Start Rapid**: [Capitolul 1: Fundamente & Start Rapid](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comenzi AI**: [Capitolul 2: Dezvoltare AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansat**: [Capitolul 4: Infrastructură ca Cod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducere

Această foaie de parcurs cuprinzătoare oferă o referință rapidă pentru cele mai utilizate comenzi Azure Developer CLI, organizate pe categorii cu exemple practice. Perfectă pentru consultări rapide în timpul dezvoltării, depanării și operațiunilor zilnice cu proiectele azd.

## Obiective de învățare

Prin utilizarea acestei foi de parcurs, vei:
- Avea acces instant la comenzile esențiale Azure Developer CLI și sintaxa acestora
- Înțelege organizarea comenzilor pe categorii funcționale și cazuri de utilizare
- Consulta exemple practice pentru scenarii comune de dezvoltare și implementare
- Accesa comenzi de depanare pentru rezolvarea rapidă a problemelor
- Găsi opțiuni avansate de configurare și personalizare eficient
- Localiza comenzi pentru gestionarea mediului și fluxuri de lucru multi-mediu

## Rezultate de învățare

Cu referințe regulate la această foaie de parcurs, vei putea:
- Executa comenzi azd cu încredere fără a consulta documentația completă
- Rezolva rapid problemele comune utilizând comenzi de diagnostic adecvate
- Gestiona eficient mai multe medii și scenarii de implementare
- Aplica funcționalități avansate azd și opțiuni de configurare după necesitate
- Depana problemele de implementare utilizând secvențe sistematice de comenzi
- Optimiza fluxurile de lucru prin utilizarea eficientă a scurtăturilor și opțiunilor azd

## Comenzi de început

### Autentificare
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Inițializarea proiectului
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

## Comenzi principale de implementare

### Flux complet de implementare
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

### Doar infrastructura
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

### Doar aplicația
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Construire și pachetare
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Gestionarea mediului

### Operațiuni de mediu
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

### Variabile de mediu
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

## ⚙️ Comenzi de configurare

### Configurare globală
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

### Configurare proiect
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitorizare și jurnale

### Jurnale aplicație
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

### Monitorizare
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Comenzi de întreținere

### Curățare
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

### Actualizări
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Comenzi avansate

### Pipeline și CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Gestionarea infrastructurii
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

### Gestionarea serviciilor
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Fluxuri rapide de lucru

### Flux de lucru pentru dezvoltare
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

### Flux de lucru multi-mediu
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

### Flux de lucru pentru depanare
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

## 🔍 Comenzi de depanare

### Informații de depanare
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

### Depanare șabloane
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Comenzi pentru fișiere și directoare

### Structura proiectului
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatarea ieșirii

### Ieșire JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Ieșire tabel
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Combinații comune de comenzi

### Script de verificare a sănătății
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Validarea implementării
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### Compararea mediilor
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de curățare a resurselor
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variabile de mediu

### Variabile de mediu comune
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

## 🚨 Comenzi de urgență

### Soluții rapide
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

### Comenzi de recuperare
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Sfaturi utile

### Aliasuri pentru fluxuri de lucru mai rapide
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scurtături funcționale
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

## 📖 Ajutor și documentație

### Obținerea ajutorului
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

### Linkuri documentație
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Sfaturi**: Salvează această foaie de parcurs și folosește `Ctrl+F` pentru a găsi rapid comenzile de care ai nevoie!

---

**Navigare**
- **Lecția anterioară**: [Verificări preliminare](../docs/pre-deployment/preflight-checks.md)
- **Lecția următoare**: [Glosar](glossary.md)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.