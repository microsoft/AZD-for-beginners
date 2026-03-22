# Command Cheat Sheet - Di Main AZD Commands

**Quick Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

This comprehensive cheat sheet provides quick reference for the most commonly used Azure Developer CLI commands, organized by category with practical examples. Perfect for quick lookups during development, troubleshooting, and daily operations with azd projects.

## Learning Goals

By using this cheat sheet, you will:
- Get quick access to the important Azure Developer CLI commands and syntax
- Understand how commands dem dey organized by function and use case
- See practical examples for common development and deployment waka
- Find troubleshooting commands wey go help quick solve wahala
- Discover advanced configuration and customization options sharp-sharp
- Manage environment dem and multi-environment workflow easier

## Learning Outcomes

With regular reference to this cheat sheet, you will be able to:
- Run azd commands with confidence without dey check full documentation every time
- Quickly clear common problems using the right diagnostic commands
- Manage multiple environments and deployment scenarios well
- Use advanced azd features and configuration options when you need am
- Troubleshoot deployment gbege via systematic command steps
- Make your workflow better using azd shortcuts and options

## Getting Started Commands

### Authentication
```bash
# Log in go Azure wit AZD
azd auth login

# Log in go Azure CLI (AZD dey use am for background)
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
# Browse di templates wey dey
azd template list

# Start from di template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Start inside di current folder
azd init .

# Start wit di name wey you choose
azd init --template todo-nodejs-mongo my-awesome-app
```

## Core Deployment Commands

### Complete Deployment Workflow
```bash
# Deploy everytin (provision + deploy)
azd up

# Deploy wey confirmation prompts don disable
azd up --confirm-with-no-prompt

# Deploy go specific environment
azd up --environment production

# Deploy wit custom parameters
azd up --parameter location=westus2
```

### Infrastructure Only
```bash
# Make Azure resources ready
azd provision

# 🧪 See wetin go change for infrastructure
azd provision --preview
# E dey show test-run view of which resources dem go create, modify or delete
# Like 'terraform plan' or 'bicep what-if' - e safe to run, no changes go apply
```

### Application Only
```bash
# Deploy di app code
azd deploy

# Deploy di service wey you want
azd deploy --service web
azd deploy --service api

# Deploy all di services
azd deploy --all
```

### Build and Package
```bash
# Make app dem
azd package

# Make di specific service
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

# Show di current environment
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

# Show all di environment variables
azd env get-values

# Comot di environment variable
azd env unset DEBUG
```

## ⚙️ Configuration Commands

### Global Configuration
```bash
# List all di configuration dem
azd config list

# Set di global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove di configuration
azd config unset defaults.location

# Reset all di configuration dem
azd config reset
```

### Project Configuration
```bash
# Check say azure.yaml dey correct
azd config validate

# Show di project info
azd show

# Find di service endpoints
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
# See logs with Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow di logs as dem dey happen
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# See logs from Azure Portal
azd monitor --logs
```

### Log Analytics Queries
```bash
# Open Log Analytics through di Azure Portal
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

# Comot by force, no confirmation
azd down --force

# Comot finish all resources wey dem soft-delete
azd down --purge

# Finish di cleanup
azd down --force --purge
```

### Updates
```bash
# Check if azd get updates
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

# 🧪 Preview & plan how infrastructure go be
azd provision --preview
# E dey simulate infrastructure provisioning but e no dey deploy anything
# E dey analyze Bicep/Terraform templates and go show:
# - Resources wey dem go add (green +)
# - Resources wey dem go change (yellow ~)
# - Resources wey dem go delete (red -)
# Safe to run - e no go make any real changes for Azure environment

# Make infrastructure from azure.yaml
azd infra synth
```

### Project Information
```bash
# Show di project status and endpoints dem
azd show

# Show di full project info as JSON
azd show --output json

# Get di service endpoints dem
azd show --output json | jq '.services'
```

## 🤖 AI & Extensions Commands

### AZD Extensions
```bash
# Make list of all di extensions wey dey (including AI)
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
# Make one agent project from di manifest
azd ai agent init -m <manifest-path-or-uri>

# Point am to one particular Foundry project
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Show where di agent source directory dey
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pick where to host am
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Start di MCP server for your project
azd mcp start

# Manage di tool consent wey MCP operations need
azd mcp consent
```

### Infrastructure Generation
```bash
# Make IaC file dem from di project definition wey you don write
azd infra generate

# Make di infrastructure from azure.yaml
azd infra synth
```

---

## 🎯 Quick Workflows

### Development Workflow
```bash
# Make we start di new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy go di development
azd env new dev
azd up

# Change tins den deploy again
azd deploy

# Open di monitoring dashboard
azd monitor --live
```

### Multi-Environment Workflow
```bash
# Prepare di environment dem
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

# Confirm say configuration correct
azd config list

# Open monitoring dashboard make you fit see logs
azd monitor --logs

# Check how resource dey
azd show --output json
```

## 🔍 Debugging Commands

### Debug Information
```bash
# Make debug output dey on
export AZD_DEBUG=true
azd <command> --debug

# Turn telemetry off so output go clean
export AZD_DISABLE_TELEMETRY=true

# Check how configuration dey now
azd config list

# Check if authentication don happen
az account show
```

### Template Debugging
```bash
# Show di templates wey dey available wit details
azd template list --output json

# Show di template information
azd template show <template-name>

# Make sure say template correct before init
azd template validate <template-name>
```

## 📁 File and Directory Commands

### Project Structure
```bash
# Show di current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Waka go azd project root
cd $(azd root)

# Show di azd configuration directory
echo $AZD_CONFIG_DIR  # Normally na ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# Comot JSON output make script fit use am
azd show --output json
azd env list --output json
azd config list --output json

# Use jq take parse am
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# Arrange am as table
azd env list --output table

# See di services wey dem don deploy
azd show --output json | jq '.services | keys'
```

## 🔧 Common Command Combinations

### Health Check Script
```bash
#!/bin/bash
# Small check make we see say everytin dey ok
azd show
azd env show
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# Check wey you dey do bifo deployment
azd show
azd provision --preview  # See di changes bifo you deploy dem
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
# Comot old environment dem
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Environment Variables

### Common Environment Variables
```bash
# Azure konfig
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD konfig
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Aplikeshon konfig
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Emergency Commands

### Quick Fixes
```bash
# Reset di authentication
az account clear
az login

# Force refresh di environment
azd env refresh

# Redeploy all di services
azd deploy

# Check di deployment status
azd show --output json
```

### Recovery Commands
```bash
# Make we recover from failed deployment - clean everything and redeploy
azd down --force --purge
azd up

# Just set up infrastructure again
azd provision

# Just redeploy the application
azd deploy
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# Put am for your .bashrc or .zshrc
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

# Deploy quick-quick wit monitoring
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

# Help wey dey for di specific command
azd up --help
azd env --help
azd config --help

# Show di version and how e bin build
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

**Tip**: Bookmark this cheat sheet and use `Ctrl+F` to quickly find the commands you need!

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Glossary](glossary.md)

---

> **💡 Want Azure command help in your editor?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — 37 skills for AI, Foundry, deployment, diagnostics, and more.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automatic translations fit get mistakes or inaccuracies. Di original document for im native language suppose be di official source. If na important/critical information, you suppose use professional human translator. We no go responsible for any misunderstanding or wrong interpretation wey fit come from dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->