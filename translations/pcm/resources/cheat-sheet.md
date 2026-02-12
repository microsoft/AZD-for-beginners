# Command Cheat Sheet - Important AZD Commands

**Quick Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Dis complete cheat sheet na quick reference for the most common Azure Developer CLI commands, dem arrange by category plus practical examples. E good for quick look-up while you dey develop, dey troubleshoot, or dey do daily work wit azd projects.

## Learning Goals

If you dey use dis cheat sheet, you go:
- Get quick access to important Azure Developer CLI commands and syntax
- Sabi how commands dem dey organize by function and use case
- Get practical examples for common development and deployment scenarios
- Fit use troubleshooting commands make you quickly solve wahala
- Find advanced configuration and customization options sharply
- Sabi how to manage environment and multi-environment workflow

## Learning Outcomes

If you dey refer dis cheat sheet regularly, you go fit:
- Run azd commands with confidence without always to dey check full documentation
- Quickly fix common wahala using correct diagnostic commands
- Manage multiple environments and deployment scenarios well
- Use advanced azd features and configuration options when you need am
- Troubleshoot deployment problems with systematic command steps
- Make workflows better with correct use of azd shortcuts and options

## Getting Started Commands

### Authentication
```bash
# Log in go Azure with AZD
azd auth login

# Log in to Azure CLI (AZD dey use am for background)
az login

# Check which account you dey use now
az account show

# Set di default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Log out from AZD
azd auth logout

# Log out from Azure CLI
az logout
```

### Project Initialization
```bash
# See di templates wey dey
azd template list

# Start from di template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Set up inside di current folder
azd init .

# Start wit custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Core Deployment Commands

### Complete Deployment Workflow
```bash
# Deploy everytin (set up + deploy)
azd up

# Deploy wey confirmation prompts no dey
azd up --confirm-with-no-prompt

# Deploy go particular environment
azd up --environment production

# Deploy wit parameters wey you choose
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# Make Azure resources
azd provision

# 🧪 See wetin go change for infrastructure
azd provision --preview
# Show test-run view of which resources dem go create, modify, or delete
# Kain like 'terraform plan' or 'bicep what-if' - safe to run, no changes go happen
```

### Application Only
```bash
# Deploy di application code
azd deploy

# Deploy di spesifik service
azd deploy --service web
azd deploy --service api

# Deploy all di services
azd deploy --all
```

### Build and Package
```bash
# Make apps
azd package

# Make di particular service
azd package --service api
```

## 🌍 Environment Management

### Environment Operations
```bash
# List all environment dem
azd env list

# Make new environment
azd env new development
azd env new staging --location westus2

# Pick environment
azd env select production

# Show di environment wey dey now
azd env show

# Refresh di environment state
azd env refresh
```

### Environment Variables
```bash
# Set di environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get di environment variable
azd env get API_KEY

# Show all environment variable dem
azd env get-values

# Comot di environment variable
azd env unset DEBUG
```

## ⚙️ Configuration Commands

### Global Configuration
```bash
# Show all di configuration dem
azd config list

# Set di global defaults dem
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Comot di configuration
azd config unset defaults.location

# Reset all di configuration dem
azd config reset
```

### Project Configuration
```bash
# Check say azure.yaml correct
azd config validate

# Make e show project info
azd show

# Make e find service endpoints
azd show --output json
```

## 📊 Monitoring and Diagnostics

### Monitoring Dashboard
```bash
# Open di Azure portal monitoring dashboard
azd monitor

# Open di Application Insights live metrics
azd monitor --live

# Open di Application Insights logs blade
azd monitor --logs

# Open di Application Insights overview
azd monitor --overview
```

### Viewing Container Logs
```bash
# Use Azure CLI make you fit see logs (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs as dem dey come
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# See logs wey dey for Azure Portal
azd monitor --logs
```

### Log Analytics Queries
```bash
# Go open Log Analytics through di Azure Portal
azd monitor --logs

# Use Azure CLI to query di logs
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Maintenance Commands

### Cleanup
```bash
# Comot all Azure resources
azd down

# Delete am by force, no need confirm
azd down --force

# Comot finish resources wey dem soft-delete
azd down --purge

# Finish di cleanup
azd down --force --purge
```

### Updates
```bash
# Check if azd get update dem
azd version

# Get di current version
azd version

# See di current configuration
azd config list
```

## 🔧 Advanced Commands

### Pipeline and CI/CD
```bash
# Make GitHub Actions ready
azd pipeline config

# Make Azure DevOps ready
azd pipeline config --provider azdo

# Show di pipeline configuration
azd pipeline show
```

### Infrastructure Management
```bash
# Make infrastructure templates
azd infra generate

# 🧪 Infrastructure Peek & Plan
azd provision --preview
# E dey simulate how infrastructure go dey provision, but e no deploy anything
# E go analyze Bicep/Terraform templates come show:
# - Resources wey go add (green +)
# - Resources wey go change (yellow ~)
# - Resources wey go delete (red -)
# E safe to run - no real changes go happen for Azure environment

# Make infrastructure from azure.yaml
azd infra synth
```

### Project Information
```bash
# Show di project status an endpoints
azd show

# Show di detailed project info as JSON
azd show --output json

# Get di service endpoints
azd show --output json | jq '.services'
```

## 🎯 Quick Workflows

### Development Workflow
```bash
# Start new projek
azd init --template todo-nodejs-mongo
cd my-project

# Deploy go development
azd env new dev
azd up

# Make changes den redeploy
azd deploy

# Open di monitoring dashboard
azd monitor --live
```

### Multi-Environment Workflow
```bash
# Make di environments ready
azd env new dev
azd env new staging  
azd env new production

# Deploy go dev
azd env select dev
azd up

# Test an promote go staging
azd env select staging
azd up

# Deploy go production
azd env select production
azd up
```

### Troubleshooting Workflow
```bash
# Make debug mode dey on
export AZD_DEBUG=true

# Check how deployment dey
azd show

# Make sure say configuration correct
azd config list

# Open monitoring dashboard make you fit see logs
azd monitor --logs

# Check how resource dey
azd show --output json
```

## 🔍 Debugging Commands

### Debug Information
```bash
# Make debug output dey show
export AZD_DEBUG=true
azd <command> --debug

# Turn off telemetry make output dey clean
export AZD_DISABLE_TELEMETRY=true

# Check wetin the current configuration be
azd config list

# Check wetin authentication status be
az account show
```

### Template Debugging
```bash
# List di templates wey dey available wit details
azd template list --output json

# Show di template information
azd template show <template-name>

# Check di template before init
azd template validate <template-name>
```

## 📁 File and Directory Commands

### Project Structure
```bash
# Show di current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Waka go di azd project root
cd $(azd root)

# Show di azd config directory
echo $AZD_CONFIG_DIR  # Most times ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# Make e give JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Use jq take parse am
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# Format am like table
azd env list --output table

# See services wey dem don deploy
azd show --output json | jq '.services | keys'
```

## 🔧 Common Command Combinations

### Health Check Script
```bash
#!/bin/bash
# Small check make sure say everytin dey okay
azd show
azd env show
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# Validation wey dem dey do before dem deploy
azd show
azd provision --preview  # See di changes before dem deploy
az account show
```

### Environment Comparison
```bash
#!/bin/bash
# Compare di environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Cleanup Script
```bash
#!/bin/bash
# Clean up di old environment dem
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Environment Variables

### Common Environment Variables
```bash
# Azure konfigureshon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD konfigureshon
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application konfigureshon
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Emergency Commands

### Quick Fixes
```bash
# Reset di authentication
az account clear
az login

# Force make di environment refresh
azd env refresh

# Deploy all di services again
azd deploy

# Check how di deployment dey
azd show --output json
```

### Recovery Commands
```bash
# Fix deployment wey don fail - clean am and deploy again
azd down --force --purge
azd up

# Na only set up infrastructure again
azd provision

# Na only deploy application again
azd deploy
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# Put am inside your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
```bash
# Change environment quick-quick
azd-env() {
    azd env select $1 && azd show
}

# Deploy quick-quick wey dem dey monitor
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# How environment dey
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Help and Documentation

### Getting Help
```bash
# General help
azd --help
azd help

# Help wey specific to the command
azd up --help
azd env --help
azd config --help

# Show which version an how e bin build
azd version
azd version --output json
```

### Documentation Links
```bash
# Open di documentation for di browser
azd docs

# Show di template documentation
azd template show <template-name> --docs
```

---

**Tip**: Make bookmark dis cheat sheet and use `Ctrl+F` to quickly find di commands wey you need!

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Glossary](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis dokument don translate wit AI translation service [Co-op Translator] (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, make you sabi say automatic translations fit get mistakes or inaccuracies. Di original dokument for im native language na di authoritative source. For important information, make you use professional human translator. We no dey liable for any misunderstanding or wrong interpretation wey fit come from using dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->