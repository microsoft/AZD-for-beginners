# Command Cheat Sheet - Di Essential AZD Commands

**Quick Referens for All Chapter Dem**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

This full cheat sheet na quick referens wey show the most common Azure Developer CLI commands, dem arrange by category wit practical examples. E good for quick lookup when you dey develop, troubleshoot, or run daily operations for azd projects.

## Learning Goals

If you dey use this cheat sheet, you go:
- Get instant access to important Azure Developer CLI commands and syntax
- Sabi how commands dem take dey organized by function and use case
- See practical examples for common development and deployment situations
- Get troubleshooting commands to fix wahala quick
- Find advanced configuration and customization options sharp-sharp
- Locate environment management and multi-environment workflow commands

## Learning Outcomes

If you dey refer this cheat sheet steady, you go fit:
- Run azd commands confident without dey always check full docs
- Quick fix common problems using the correct diagnostic commands
- Manage multiple environments and deployment situations well
- Use advanced azd features and config options when e needed
- Troubleshoot deployment wahala with systematic command steps
- Make your workflow faster with correct azd shortcuts and options

## Getting Started Commands

### Authentication
```bash
# Sign in go Azure wit AZD
azd auth login

# Sign in go Azure CLI (AZD dey use am for background)
az login

# Check di current account
az account show

# Set di default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Sign out from AZD
azd auth logout

# Sign out from Azure CLI
az logout
```

### Project Initialization
```bash
# Find di templates wey dey
azd template list

# Start from di template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Set up inside di current folder
azd init .

# Set up wit di name wey you choose
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
# Make Azure resources
azd provision

# 🧪 See wetin go change for infrastructure
azd provision --preview
# Show test-run view of which resources dem go create, modify or delete
# Like 'terraform plan' or 'bicep what-if' - e safe to run, e no go change anything
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
# Bring back (download) di app dependencies
azd restore

# Bring back di specific service
azd restore --service api

# Make one deployable artifact but no deploy am
azd package

# Make di specific service
azd package --service api
```

> **`azd restore`** dey download your app dependencies (npm, pip, NuGet, Maven, etc.). E dey run automatically during `azd package` and `azd deploy`, so you no go dey call am much—run am manual make e pre-fetch dependencies (for example, to warm CI cache or make you fit work offline later).

> **`azd package`** dey build the deployable artifact (container image or zip) **without** pushing am go Azure. Use am alone to verify say build succeed, check the output, or produce artifact wey another process go deploy later. `azd deploy` dey package automatically, so you go only need `azd package` when you wan the artifact without deploying.

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

# Show environment dem wey dey available
azd env list

# Refresh environment status
azd env refresh
```

### Environment Variables
```bash
# Set wan environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Find di environment variable
azd env get API_KEY

# Show all di environment variables
azd env get-values

# Comot di environment variable
azd env unset DEBUG
```

## ⚙️ Configuration Commands

### Global Configuration
```bash
# Show all di configuration dem
azd config show

# Set global default dem
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Comot configuration
azd config unset defaults.location

# Reset all di configuration dem
azd config reset
```

### Project Configuration
```bash
# Make sure say azure.yaml correct
azd config validate

# Show di project info
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
# Make you fit see logs with Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs as dem dey happen
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# See logs from Azure Portal
azd monitor --logs
```

### Log Analytics Queries
```bash
# Open Log Analytics inside di Azure Portal
azd monitor --logs

# Use Azure CLI to run queries on di log dem
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Maintenance Commands

### Cleanup
```bash
# Comot all Azure resource dem
azd down

# Comot forcefully, no confirmation
azd down --force

# Comot finish resource dem wey dem soft-delete
azd down --purge

# Cleanup don finish
azd down --force --purge
```

### Updates
```bash
# Check if azd get any updates
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

# Show di pipeline configuration
azd pipeline show
```

### Infrastructure Management
```bash
# Make infrastructure templates
azd infra generate

# 🧪 See infrastructure before and plan am
azd provision --preview
# E dey simulate infrastructure provisioning without deploying am
# E go check Bicep/Terraform templates and show:
# - Resources wey go add (green +)
# - Resources wey go change (yellow ~)
# - Resources wey go delete (red -)
# E safe to run - no real changes go happen for Azure environment

# Build infrastructure from azure.yaml
azd infra synth
```

### Project Information
```bash
# Show di project status an di endpoints
azd show

# Show di detailed project info as JSON
azd show --output json

# Get di service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI & Extensions Commands

### AZD Extensions
```bash
# List all di extensions wey dey (including AI)
azd extension list

# Install di Foundry agents extension
azd extension install azure.ai.agents

# Install di agent skills extension (preview)
azd extension install azure.ai.skills

# Install di Foundry connections extension (preview)
azd extension install azure.ai.connections

# Install di fine-tuning extension
azd extension install azure.ai.finetune

# Install di custom models extension
azd extension install azure.ai.models

# Upgrade all di extensions wey don install
azd extension upgrade --all
```

### AI Agent Commands
```bash
# Begin agent project from di manifest
azd ai agent init -m <manifest-path-or-uri>

# Choose one specific Foundry project
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Specify di agent source directory
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Choose di hosting target
azd ai agent init -m agent-manifest.yaml --host containerapp

# Test deployed agent (e go print latency + time-to-first-byte)
azd ai agent invoke

# Show di live endpoint configuration
azd ai agent endpoint show

# Create evaluation dataset, den optimize di agent
azd ai agent eval generate
azd ai agent optimize

# Download di deployed source for code-based hosted agent
azd ai agent code download

# Delete di hosted agent and all e versions (--force go end active sessions)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# Start di MCP server for your project
azd mcp start

# Manage di tool consent wey MCP operations need
azd copilot consent list
```

### Infrastructure Generation
```bash
# Make IaC files from di project definition wey you define
azd infra generate

# Build di infrastructure from azure.yaml
azd infra synth
```

---

## 🎯 Quick Workflows

### Development Workflow
```bash
# Make new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy am go development
azd env new dev
azd up

# Make changes then deploy again
azd deploy

# Open di monitoring dashboard
azd monitor --live
```

### Multi-Environment Workflow
```bash
# Set up di environment dem
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
azd config show

# Open monitoring dashboard make you see logs
azd monitor --logs

# Check how resource dey
azd show --output json
```

## 🔍 Debugging Commands

### Debug Information
```bash
# Make debug output dey
export AZD_DEBUG=true
azd <command> --debug

# Turn off telemetry make output clean
export AZD_DISABLE_TELEMETRY=true

# Check di current configuration
azd config show

# Check di authentication status
az account show
```

### Template Debugging
```bash
# List all di templates wey dey with details
azd template list --output json

# Show di information for di template
azd template show <template-name>

# Check say template valid before init
azd template validate <template-name>
```

## 📁 File and Directory Commands

### Project Structure
```bash
# Show di current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Go to di azd project root
cd $(azd root)

# Show di azd configuration directory
echo $AZD_CONFIG_DIR  # Normally e dey for ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# Make JSON output wey you fit use for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Use jq take parse am
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# Make e be table
azd env list --output table

# See services wey dem don deploy
azd show --output json | jq '.services | keys'
```

## 🔧 Common Command Combinations

### Health Check Script
```bash
#!/bin/bash
# Small check make sure say everytin dey kampe
azd show
azd env get-values
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# Check bifo dem deploy
azd show
azd provision --preview  # See wetin go change bifo dem deploy
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
# Comot old environments
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

# Aplikeshon konfigureshon
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

# Deploy all di services again
azd deploy

# Check di deployment status
azd show --output json
```

### Recovery Commands
```bash
# Recover deployment wey fail - clean everything, den redeploy
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
# Quick switch between environment dem
azd-env() {
    azd env select $1 && azd show
}

# Quick deploy wey get monitoring
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
# General help
azd --help
azd help

# Help wey specific to di command
azd up --help
azd env --help
azd config --help

# Show di version an build info
azd version
azd version --output json
```

### Documentation Links
```bash
# Open di documentation for browser
azd docs

# Show di template documentation
azd template show <template-name> --docs
```

---

**Tip**: Bookmark dis cheat sheet and use `Ctrl+F` make you quick find the commands wey you need!

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Glossary](glossary.md)

---

> **💡 You wan Azure command help for your editor?** Install [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — e get 37 skills for AI, Foundry, deployment, diagnostics, and more.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->