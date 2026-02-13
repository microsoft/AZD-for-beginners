# Command Cheat Sheet - Essential AZD Commands

**Quick Reference for All Chapters**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Quick Start**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduction

This comprehensive cheat sheet provides quick reference for the most commonly used Azure Developer CLI commands, organized by category with practical examples. Perfect for quick lookups during development, troubleshooting, and daily operations with azd projects.

## Learning Goals

By using this cheat sheet, you will:
- Have instant access to essential Azure Developer CLI commands and syntax
- Understand command organization by functional categories and use cases
- Reference practical examples for common development and deployment scenarios
- Access troubleshooting commands for quick issue resolution
- Find advanced configuration and customization options efficiently
- Locate environment management and multi-environment workflow commands

## Learning Outcomes

With regular reference to this cheat sheet, you will be able to:
- Execute azd commands confidently without referencing full documentation
- Quickly resolve common issues using appropriate diagnostic commands
- Efficiently manage multiple environments and deployment scenarios
- Apply advanced azd features and configuration options as needed
- Troubleshoot deployment issues using systematic command sequences
- Optimize workflows through effective use of azd shortcuts and options

## Getting Started Commands

### Authentication
```bash
# Login to Azure via AZD
azd auth login

# Login to Azure CLI (AZD uses this under the hood)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### Project Initialization
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

## Core Deployment Commands

### Complete Deployment Workflow
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

### Infrastructure Only
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Shows a dry-run view of what resources would be created/modified/deleted
# Similar to 'terraform plan' or 'bicep what-if' - safe to run, no changes applied
```

### Application Only
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Build and Package
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Environment Management

### Environment Operations
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

### Environment Variables
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

## ⚙️ Configuration Commands

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

### Project Configuration
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoring and Diagnostics

### Monitoring Dashboard
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

### Viewing Container Logs
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics Queries
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Maintenance Commands

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
azd version

# Get current version
azd version

# View current configuration
azd config list
```

## 🔧 Advanced Commands

### Pipeline and CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Infrastructure Management
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~)
# - Resources to be deleted (red -)
# Safe to run - no actual changes made to Azure environment

# Synthesize infrastructure from azure.yaml
azd infra synth
```

### Project Information
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🎯 Quick Workflows

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

# Open monitoring dashboard
azd monitor --live
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

# Check deployment status
azd show

# Validate configuration
azd config list

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 Debugging Commands

### Debug Information
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Check current configuration
azd config list

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

## 📁 File and Directory Commands

### Project Structure
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

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Common Command Combinations

### Health Check Script
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd monitor --logs
```

### Deployment Validation
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Environment Comparison
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

### Common Environment Variables
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

## 🚨 Emergency Commands

### Quick Fixes
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### Recovery Commands
```bash
# Recover from failed deployment - clean and redeploy
azd down --force --purge
azd up

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Environment status
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

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Documentation Links
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tip**: Bookmark this cheat sheet and use `Ctrl+F` to quickly find the commands you need!

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Glossary](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->