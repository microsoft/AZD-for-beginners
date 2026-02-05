# Command Cheat Sheet - Mahahalagang AZD Commands

**Mabilisang Gabay para sa Lahat ng Kabanata**
- **📚 Kurso Home**: [AZD Para sa Mga Baguhan](../README.md)
- **📖 Mabilisang Simula**: [Kabanata 1: Pundasyon at Mabilisang Simula](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Kabanata 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Kabanata 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Panimula

Ang komprehensibong cheat sheet na ito ay nagbibigay ng mabilisang gabay para sa mga karaniwang ginagamit na Azure Developer CLI commands, inayos ayon sa kategorya na may mga praktikal na halimbawa. Perpekto para sa mabilisang paghanap habang nagde-develop, nagtroubleshoot, at sa pang-araw-araw na operasyon gamit ang mga azd projects.

## Mga Layunin sa Pag-aaral

Sa paggamit ng cheat sheet na ito, ikaw ay:
- Magkakaroon ng instant na access sa mahahalagang Azure Developer CLI commands at syntax
- Maiintindihan ang organisasyon ng mga command ayon sa functional na kategorya at mga use case
- Makakahanap ng mga praktikal na halimbawa para sa karaniwang development at deployment scenarios
- Makakagamit ng troubleshooting commands para sa mabilisang pagresolba ng mga isyu
- Makakahanap ng advanced na configuration at customization options nang madali
- Makakagamit ng mga command para sa pamamahala ng environment at multi-environment workflow

## Mga Resulta ng Pag-aaral

Sa regular na paggamit ng cheat sheet na ito, magagawa mong:
- Magpatakbo ng mga azd commands nang may kumpiyansa nang hindi kinakailangang tingnan ang buong dokumentasyon
- Mabilisang maresolba ang mga karaniwang isyu gamit ang tamang diagnostic commands
- Epektibong pamahalaan ang maraming environment at deployment scenarios
- Magamit ang mga advanced na tampok at configuration options ng azd kung kinakailangan
- Magtroubleshoot ng mga isyu sa deployment gamit ang sistematikong sequence ng mga command
- Ma-optimize ang workflows sa pamamagitan ng epektibong paggamit ng azd shortcuts at options

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

### Pag-initialize ng Proyekto
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

## Mga Pangunahing Deployment Commands

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

# 🧪 Preview infrastructure changes (NEW)
azd provision --preview
# Shows a dry-run view of what resources would be created/modified/deleted
# Similar to 'terraform plan' or 'bicep what-if' - safe to run, no changes applied

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

### Mga Environment Variables
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

## ⚙️ Mga Configuration Commands

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

### Configuration ng Proyekto
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

## 🛠️ Mga Maintenance Commands

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

## 🔧 Mga Advanced na Commands

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

# 🧪 Infrastructure Preview & Planning (NEW)
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Safe to run - no actual changes made to Azure environment
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

### Workflow ng Development
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

### Workflow ng Multi-Environment
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

### Workflow ng Troubleshooting
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

## 🔍 Mga Debugging Commands

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

### Estruktura ng Proyekto
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
azd provision --preview  # 🧪 NEW: Preview changes before deploying
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

## 📝 Environment Variables

### Karaniwang Environment Variables
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

## 🚨 Mga Emergency Commands

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

### Mga Recovery Commands
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Mga Pro Tips

### Aliases para sa Mas Mabilis na Workflow
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Mga Shortcut ng Function
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

**Tip**: I-bookmark ang cheat sheet na ito at gamitin ang `Ctrl+F` para mabilisang mahanap ang mga command na kailangan mo!

---

**Pag-navigate**
- **Nakaraang Aralin**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Susunod na Aralin**: [Glossary](glossary.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na pinagmulan. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.