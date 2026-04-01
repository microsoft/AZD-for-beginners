# Command Cheat Sheet - Di Important AZD Commands

**Quick Reference Wey Cover All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

Dis complete cheat sheet dey give quick reference for di commands wey people dey use pass for Azure Developer CLI. Dem organize am by category and put practical examples. E perfect for quick lookups during development, troubleshooting, and everyday operations with azd projects.

## Learning Goals

By using dis cheat sheet, you go:
- Get instant access to di important Azure Developer CLI commands and di syntax
- Understand how commands dey organized by functional categories and use cases
- Get practical examples for common development and deployment scenarios
- Access troubleshooting commands to quickly fix wahala
- Find advanced configuration and customization options fast
- Locate environment management and multi-environment workflow commands

## Learning Outcomes

If you dey use dis cheat sheet regular, you go fit:
- Run azd commands with confidence without dey always check full documentation
- Quickly solve common problems using correct diagnostic commands
- Manage multiple environments and deployment scenarios well
- Apply advanced azd features and configuration options when you need am
- Troubleshoot deployment issues with systematic command steps
- Make your workflow better by using azd shortcuts and options well

## Getting Started Commands

### Authentication
```bash
# Sign in to Azure wit AZD
azd auth login

# Sign in to Azure CLI (AZD dey use am behind di scenes)
az login

# Check di current account
az account show

# Set di default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Comot from AZD
azd auth logout

# Comot from Azure CLI
az logout
```

### Project Initialization
```bash
# See all di templates wey dey
azd template list

# Set up from di template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Set up inside dis current folder
azd init .

# Set up wit custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Core Deployment Commands

### Complete Deployment Workflow
```bash
# Deploy evritin (set up + deploy)
azd up

# Deploy wey no go ask you to confirm
azd up --confirm-with-no-prompt

# Deploy go one particular environment
azd up --environment production

# Deploy wit custom parameters
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# Make Azure resources
azd provision

# 🧪 See wetin go change for infrastructure
azd provision --preview
# E dey show dry-run view of wetin resources dem go be created, changed or deleted
# E be like 'terraform plan' or 'bicep what-if' - e safe to run, no changes go apply
```

### Application Only
```bash
# Deploy di application code
azd deploy

# Deploy di particular service
azd deploy --service web
azd deploy --service api

# Deploy all di services
azd deploy --all
```

### Build and Package
```bash
# Make apps dem
azd package

# Make dat specific service
azd package --service api
```

## 🌍 Environment Management

### Environment Operations
```bash
# Make list of all environment dem
azd env list

# Make new environment
azd env new development
azd env new staging --location westus2

# Choose environment
azd env select production

# Show environment dem wey dey available
azd env list

# Refresh how environment dey
azd env refresh
```

### Environment Variables
```bash
# Set di environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get di environment variable
azd env get API_KEY

# Make list of all di environment variables
azd env get-values

# Comot di environment variable
azd env unset DEBUG
```

## ⚙️ Configuration Commands

### Global Configuration
```bash
# Show all configuration dem
azd config show

# Set di global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Comot di configuration
azd config unset defaults.location

# Reset all di configuration dem
azd config reset
```

### Project Configuration
```bash
# Confirm say azure.yaml dey valid
azd config validate

# Make e show project info
azd show

# Get di service endpoints
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
# See logs wit Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs as dem dey happen
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# See logs from inside Azure Portal
azd monitor --logs
```

### Log Analytics Queries
```bash
# Go open Log Analytics for Azure Portal
azd monitor --logs

# Run queries on logs wit Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Maintenance Commands

### Cleanup
```bash
# Comot all Azure resources dem
azd down

# Force delete no need confirm
azd down --force

# Comot finish all resource dem wey dem soft-delete
azd down --purge

# Cleanup don finish
azd down --force --purge
```

### Updates
```bash
# Check if azd get updates
azd version

# Get di current version
azd version

# See di current configuration
azd config show
```

## 🔧 Advanced Commands

### Pipeline and CI/CD
```bash
# Make GitHub Actions ready
azd pipeline config

# Make Azure DevOps ready
azd pipeline config --provider azdo

# Show how di pipeline dey set
azd pipeline show
```

### Infrastructure Management
```bash
# Make infrastructure template dem
azd infra generate

# 🧪 Preview and planning for infrastructure
azd provision --preview
# E dey simulate infrastructure provisioning without deploying
# E dey analyze Bicep/Terraform template dem and show:
# - Resources wey dem go add (green +)
# - Resources wey dem go change (yellow ~)
# - Resources wey dem go delete (red -)
# E safe to run - no real change go happen for Azure environment

# Make infrastructure from azure.yaml
azd infra synth
```

### Project Information
```bash
# Make e show how project dey and di endpoints
azd show

# Make e show di detailed project info as JSON
azd show --output json

# Make e get di service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI & Extensions Commands

### AZD Extensions
```bash
# List all extensions wey dey available (including AI)
azd extension list

# Install di Foundry agents extension
azd extension install azure.ai.agents

# Install di fine-tuning extension
azd extension install azure.ai.finetune

# Install di custom models extension
azd extension install azure.ai.models

# Upgrade all di extensions wey don install
azd extension upgrade --all
```

### AI Agent Commands
```bash
# Start wan agent project from manifest
azd ai agent init -m <manifest-path-or-uri>

# Target one specific Foundry project
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Set which folder be the agent source
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pick where to host
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Start di MCP server for your project
azd mcp start

# Manage di tool permission for MCP operations
azd copilot consent list
```

### Infrastructure Generation
```bash
# Make IaC files from di way wey you define your project
azd infra generate

# Make di infrastructure from azure.yaml
azd infra synth
```

---

## 🎯 Quick Workflows

### Development Workflow
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy go di development
azd env new dev
azd up

# Make changes den deploy again
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

# Test den promote go staging
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

# Check say configuration dey correct
azd config show

# Open monitoring dashboard make you fit see logs
azd monitor --logs

# Check how resource dey
azd show --output json
```

## 🔍 Debugging Commands

### Debug Information
```bash
# Turn on debug output
export AZD_DEBUG=true
azd <command> --debug

# Turn off telemetry so output go clean
export AZD_DISABLE_TELEMETRY=true

# Check di current configuration
azd config show

# Check di authentication status
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
# Show how di current directory structure be
tree /f  # Windows
find . -type f  # Linux/macOS

# Go reach di azd project root
cd $(azd root)

# Show where di azd configuration dey
echo $AZD_CONFIG_DIR  # Most times na ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# Make e produce JSON output wey you fit use for scripts
azd show --output json
azd env list --output json
azd config show --output json

# Use jq take parse am
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# Put am like table
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
azd env get-values
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# Check bifo you deploy
azd show
azd provision --preview  # See di changes bifo you deploy
az account show
```

### Environment Comparison
```bash
#!/bin/bash
# Compare di environment dem
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource Cleanup Script
```bash
#!/bin/bash
# Comot di old environment dem
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Environment Variables

### Common Environment Variables
```bash
# Azure setup
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD setup
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application setup
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

# Make all services deploy again
azd deploy

# Check di deployment status
azd show --output json
```

### Recovery Commands
```bash
# Fix deployment wey don fail - clean am, then deploy again
azd down --force --purge
azd up

# Na only set up di infrastructure again
azd provision

# Na only deploy di application again
azd deploy
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# Add am for your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
```bash
# Switch between environments quick-quick
azd-env() {
    azd env select $1 && azd show
}

# Deploy quick-quick wit monitoring
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# How environment dey
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Help and Documentation

### Getting Help
```bash
# Help wey general
azd --help
azd help

# Help wey special for particular command
azd up --help
azd env --help
azd config --help

# Show which version dey and how dem build am
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

**Tip**: Bookmark dis cheat sheet and use `Ctrl+F` to quickly find di commands wey you need!

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Glossary](glossary.md)

---

> **💡 You wan make editor help you with Azure commands?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — 37 skills for AI, Foundry, deployment, diagnostics, and more.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg sabi say automated translations fit get errors or inaccuracies. The original document for im native language suppose be the authoritative source. For critical information, professional human translation dey recommended. We no dey liable for any misunderstandings or misinterpretations wey fit come from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->