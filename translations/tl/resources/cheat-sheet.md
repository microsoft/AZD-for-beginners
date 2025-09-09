<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "04291031a6a1cc0dc4064dcb9c543584",
  "translation_date": "2025-09-09T22:47:03+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "tl"
}
-->
# Command Cheat Sheet - Mahahalagang AZD Commands

## Panimula

Ang komprehensibong cheat sheet na ito ay nagbibigay ng mabilisang sanggunian para sa mga pinakaginagamit na Azure Developer CLI commands, inayos ayon sa kategorya na may mga praktikal na halimbawa. Perpekto para sa mabilisang pagtingin habang nasa development, troubleshooting, at pang-araw-araw na operasyon gamit ang mga azd project.

## Mga Layunin sa Pag-aaral

Sa paggamit ng cheat sheet na ito, ikaw ay:
- Magkakaroon ng agarang access sa mahahalagang Azure Developer CLI commands at syntax
- Maiintindihan ang organisasyon ng mga command ayon sa mga functional na kategorya at mga use case
- Makakahanap ng mga praktikal na halimbawa para sa mga karaniwang development at deployment na senaryo
- Makakagamit ng mga troubleshooting commands para sa mabilisang pagresolba ng mga isyu
- Makakahanap ng mga advanced na opsyon para sa configuration at customization
- Makakahanap ng mga command para sa pamamahala ng environment at multi-environment workflow

## Mga Resulta ng Pag-aaral

Sa regular na paggamit ng cheat sheet na ito, ikaw ay magiging:
- Kumpiyansa sa pag-execute ng azd commands nang hindi kailangang tumingin sa buong dokumentasyon
- Mabilis na makakapagresolba ng mga karaniwang isyu gamit ang tamang diagnostic commands
- Epektibong makakapamahala ng maraming environment at deployment na senaryo
- Makakapag-apply ng mga advanced na azd features at configuration options kung kinakailangan
- Makakapag-troubleshoot ng mga deployment issues gamit ang sistematikong command sequences
- Makakapag-optimize ng workflows sa pamamagitan ng epektibong paggamit ng azd shortcuts at options

## Mga Pangunahing Command sa Pagsisimula

### Authentication
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Pag-initialize ng Project
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

## Mga Pangunahing Deployment Command

### Kumpletong Deployment Workflow
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

### Infrastructure Lamang
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Application Lamang
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Build at Package
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Pamamahala ng Environment

### Mga Operasyon sa Environment
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

### Mga Variable ng Environment
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

## ⚙️ Mga Command sa Configuration

### Global Configuration
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

### Configuration ng Project
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoring at Logs

### Application Logs
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

## 🛠️ Mga Command sa Maintenance

### Cleanup
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

## 🔧 Mga Advanced na Command

### Pipeline at CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Pamamahala ng Infrastructure
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Pamamahala ng Serbisyo
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Mabilisang Workflows

### Development Workflow
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

### Multi-Environment Workflow
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

### Troubleshooting Workflow
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

## 🔍 Mga Command sa Debugging

### Debug Information
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

## 📁 Mga Command sa File at Directory

### Estruktura ng Project
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Pag-format ng Output

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

### Table Output
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Karaniwang Kombinasyon ng Command

### Health Check Script
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Deployment Validation
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Paghahambing ng Environment
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Cleanup Script
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Mga Variable ng Environment

### Karaniwang Mga Variable ng Environment
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

## 🚨 Mga Emergency Command

### Mabilisang Pag-aayos
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

### Mga Recovery Command
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Mga Pro Tips

### Mga Alias para sa Mas Mabilis na Workflow
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Mga Shortcut sa Function
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

## 📖 Tulong at Dokumentasyon

### Pagkuha ng Tulong
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

### Mga Link sa Dokumentasyon
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tip**: I-bookmark ang cheat sheet na ito at gamitin ang `Ctrl+F` para mabilis na mahanap ang mga command na kailangan mo!

---

**Navigation**
- **Nakaraang Aralin**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Susunod na Aralin**: [Glossary](glossary.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.