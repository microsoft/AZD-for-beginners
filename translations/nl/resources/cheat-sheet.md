<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-18T07:02:11+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "nl"
}
-->
# Command Cheat Sheet - Essentiële AZD-commando's

**Snelle Referentie voor Alle Hoofdstukken**
- **📚 Cursus Home**: [AZD Voor Beginners](../README.md)
- **📖 Snelle Start**: [Hoofdstuk 1: Basis & Snelle Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-commando's**: [Hoofdstuk 2: AI-First Ontwikkeling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Geavanceerd**: [Hoofdstuk 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introductie

Dit uitgebreide overzicht biedt een snelle referentie voor de meest gebruikte Azure Developer CLI-commando's, georganiseerd per categorie met praktische voorbeelden. Perfect voor snelle opzoekingen tijdens ontwikkeling, probleemoplossing en dagelijkse werkzaamheden met azd-projecten.

## Leerdoelen

Door gebruik te maken van dit overzicht, kun je:
- Direct toegang krijgen tot essentiële Azure Developer CLI-commando's en syntaxis
- Begrijpen hoe commando's zijn georganiseerd op basis van functionele categorieën en gebruiksscenario's
- Praktische voorbeelden raadplegen voor veelvoorkomende ontwikkelings- en implementatiescenario's
- Probleemoplossingscommando's vinden voor snelle probleemoplossing
- Efficiënt geavanceerde configuratie- en aanpassingsopties vinden
- Commando's voor omgevingsbeheer en workflows met meerdere omgevingen lokaliseren

## Leerresultaten

Door regelmatig naar dit overzicht te verwijzen, kun je:
- AZD-commando's zelfverzekerd uitvoeren zonder volledige documentatie te raadplegen
- Veelvoorkomende problemen snel oplossen met de juiste diagnostische commando's
- Meerdere omgevingen en implementatiescenario's efficiënt beheren
- Geavanceerde AZD-functies en configuratieopties toepassen wanneer nodig
- Implementatieproblemen oplossen met systematische commando-reeksen
- Workflows optimaliseren door effectief gebruik van AZD-sneltoetsen en opties

## Aan de slag met commando's

### Authenticatie
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Project Initialisatie
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

## Kernimplementatiecommando's

### Complete Implementatieworkflow
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

### Alleen Infrastructuur
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Alleen Applicatie
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Build en Package
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Omgevingsbeheer

### Omgevingsbewerkingen
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

### Omgevingsvariabelen
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

## ⚙️ Configuratiecommando's

### Globale Configuratie
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

### Projectconfiguratie
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoring en Logs

### Applicatielogs
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

## 🛠️ Onderhoudscommando's

### Opschonen
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

### Updates
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Geavanceerde commando's

### Pipeline en CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Infrastructuurbeheer
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Servicebeheer
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Snelle Workflows

### Ontwikkelingsworkflow
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

### Workflow met Meerdere Omgevingen
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

### Probleemoplossingsworkflow
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

## 🔍 Debuggingcommando's

### Debuginformatie
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

### Template Debugging
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Bestands- en Directorycommando's

### Projectstructuur
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabel Output
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Veelvoorkomende Commandocombinaties

### Health Check Script
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Implementatievalidatie
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Omgevingsvergelijking
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Opschoonscript
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Omgevingsvariabelen

### Veelvoorkomende Omgevingsvariabelen
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

## 🚨 Noodcommando's

### Snelle Oplossingen
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

### Herstelcommando's
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Pro Tips

### Aliassen voor Snellere Workflows
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Functie Sneltoetsen
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

## 📖 Hulp en Documentatie

### Hulp Krijgen
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

### Documentatielinks
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tip**: Maak een bladwijzer van dit overzicht en gebruik `Ctrl+F` om snel de commando's te vinden die je nodig hebt!

---

**Navigatie**
- **Vorige Les**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Volgende Les**: [Glossary](glossary.md)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.