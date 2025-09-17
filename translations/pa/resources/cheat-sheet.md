<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-17T21:16:11+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "pa"
}
-->
# ਕਮਾਂਡ ਚੀਟ ਸ਼ੀਟ - ਮਹੱਤਵਪੂਰਨ AZD ਕਮਾਂਡਸ

**ਸਾਰੇ ਅਧਿਆਇਆਂ ਲਈ ਤੇਜ਼ ਸੰਦਰਭ**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਸ਼ੁਰੂਆਤੀ ਲਈ](../README.md)
- **📖 ਤੇਜ਼ ਸ਼ੁਰੂਆਤ**: [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ਕਮਾਂਡਸ**: [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ਉੱਚ-ਸਤਹ**: [ਅਧਿਆਇ 4: ਕੋਡ ਵਜੋਂ ਢਾਂਚਾ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਚੀਟ ਸ਼ੀਟ ਸਭ ਤੋਂ ਵਧੇਰੇ ਵਰਤੀਆਂ ਜਾਣ ਵਾਲੀਆਂ Azure Developer CLI ਕਮਾਂਡਾਂ ਲਈ ਤੇਜ਼ ਸੰਦਰਭ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ, ਜੋ ਸ਼੍ਰੇਣੀ ਅਨੁਸਾਰ ਵਿਵਸਥਿਤ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ ਅਤੇ ਵਿਹਾਰਕ ਉਦਾਹਰਣਾਂ ਨਾਲ। ਵਿਕਾਸ, ਸਮੱਸਿਆ ਹੱਲ ਕਰਨ, ਅਤੇ azd ਪ੍ਰੋਜੈਕਟਾਂ ਨਾਲ ਦਿਨ-ਰਾਤ ਦੇ ਕਾਰਜਾਂ ਦੌਰਾਨ ਤੇਜ਼ ਸੰਦਰਭ ਲਈ ਬਹੁਤ ਹੀ ਉਪਯੋਗ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਚੀਟ ਸ਼ੀਟ ਦੀ ਵਰਤੋਂ ਕਰਕੇ, ਤੁਸੀਂ:
- ਮਹੱਤਵਪੂਰਨ Azure Developer CLI ਕਮਾਂਡਾਂ ਅਤੇ ਸਿੰਟੈਕਸ ਤੱਕ ਤੁਰੰਤ ਪਹੁੰਚ ਪ੍ਰਾਪਤ ਕਰੋਗੇ
- ਕਮਾਂਡਾਂ ਨੂੰ ਕਾਰਜਕਾਰੀ ਸ਼੍ਰੇਣੀਆਂ ਅਤੇ ਵਰਤੋਂ ਦੇ ਕੇਸਾਂ ਅਨੁਸਾਰ ਸਮਝੋਗੇ
- ਆਮ ਵਿਕਾਸ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀਆਂ ਲਈ ਵਿਹਾਰਕ ਉਦਾਹਰਣਾਂ ਦਾ ਸੰਦਰਭ ਲਵੋਗੇ
- ਸਮੱਸਿਆ ਹੱਲ ਕਰਨ ਲਈ ਕਮਾਂਡਾਂ ਤੱਕ ਤੇਜ਼ ਪਹੁੰਚ ਪ੍ਰਾਪਤ ਕਰੋਗੇ
- ਉੱਚ-ਸਤਹ ਸੰਰਚਨਾ ਅਤੇ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ ਵਿਕਲਪਾਂ ਨੂੰ ਕੁਸ਼ਲਤਾਪੂਰਵਕ ਲੱਭੋਗੇ
- ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ ਅਤੇ ਬਹੁ-ਵਾਤਾਵਰਣ ਵਰਕਫਲੋ ਕਮਾਂਡਾਂ ਨੂੰ ਲੱਭਣਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਚੀਟ ਸ਼ੀਟ ਨੂੰ ਨਿਯਮਿਤ ਤੌਰ 'ਤੇ ਵਰਤ ਕੇ, ਤੁਸੀਂ:
- azd ਕਮਾਂਡਾਂ ਨੂੰ ਪੂਰੀ ਦਸਤਾਵੇਜ਼ੀ ਦੇ ਸੰਦਰਭ ਤੋਂ ਬਿਨਾਂ ਵਿਸ਼ਵਾਸ ਨਾਲ ਚਲਾਉਣਗੇ
- ਸਹੀ ਡਾਇਗਨੋਸਟਿਕ ਕਮਾਂਡਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਆਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਹੱਲ ਕਰੋਗੇ
- ਬਹੁ-ਵਾਤਾਵਰਣ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਸਥਿਤੀਆਂ ਨੂੰ ਕੁਸ਼ਲਤਾਪੂਰਵਕ ਪ੍ਰਬੰਧਿਤ ਕਰੋਗੇ
- ਜਰੂਰਤ ਪੜਨ 'ਤੇ ਉੱਚ-ਸਤਹ azd ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਅਤੇ ਸੰਰਚਨਾ ਵਿਕਲਪਾਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ
- ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਵਿਵਸਥਿਤ ਕਮਾਂਡ ਕ੍ਰਮਾਂ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਹੱਲ ਕਰੋਗੇ
- azd ਸ਼ਾਰਟਕਟ ਅਤੇ ਵਿਕਲਪਾਂ ਦੀ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਵਰਤੋਂ ਕਰਕੇ ਵਰਕਫਲੋਜ਼ ਨੂੰ ਅਨੁਕੂਲ ਬਣਾਓਗੇ

## ਸ਼ੁਰੂਆਤੀ ਕਮਾਂਡਾਂ

### ਪ੍ਰਮਾਣਿਕਤਾ
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂਆਤ
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

## ਮੁੱਖ ਡਿਪਲੌਇਮੈਂਟ ਕਮਾਂਡਾਂ

### ਪੂਰਾ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ
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

### ਸਿਰਫ ਢਾਂਚਾ
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### ਸਿਰਫ ਐਪਲੀਕੇਸ਼ਨ
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### ਬਿਲਡ ਅਤੇ ਪੈਕੇਜ
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ

### ਵਾਤਾਵਰਣ ਕਾਰਜ
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

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
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

## ⚙️ ਸੰਰਚਨਾ ਕਮਾਂਡਾਂ

### ਗਲੋਬਲ ਸੰਰਚਨਾ
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

### ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 ਨਿਗਰਾਨੀ ਅਤੇ ਲਾਗ

### ਐਪਲੀਕੇਸ਼ਨ ਲਾਗ
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

### ਨਿਗਰਾਨੀ
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ ਰਖ-ਰਖਾਅ ਕਮਾਂਡਾਂ

### ਸਫਾਈ
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

### ਅੱਪਡੇਟਸ
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 ਉੱਚ-ਸਤਹ ਕਮਾਂਡਾਂ

### ਪਾਈਪਲਾਈਨ ਅਤੇ CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### ਢਾਂਚਾ ਪ੍ਰਬੰਧਨ
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### ਸੇਵਾ ਪ੍ਰਬੰਧਨ
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 ਤੇਜ਼ ਵਰਕਫਲੋਜ਼

### ਵਿਕਾਸ ਵਰਕਫਲੋ
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

### ਬਹੁ-ਵਾਤਾਵਰਣ ਵਰਕਫਲੋ
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

### ਸਮੱਸਿਆ ਹੱਲ ਕਰਨ ਦਾ ਵਰਕਫਲੋ
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

## 🔍 ਡਿਬੱਗਿੰਗ ਕਮਾਂਡਾਂ

### ਡਿਬੱਗ ਜਾਣਕਾਰੀ
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

### ਟੈਂਪਲੇਟ ਡਿਬੱਗਿੰਗ
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 ਫਾਈਲ ਅਤੇ ਡਾਇਰੈਕਟਰੀ ਕਮਾਂਡਾਂ

### ਪ੍ਰੋਜੈਕਟ ਸਟ੍ਰਕਚਰ
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 ਆਉਟਪੁੱਟ ਫਾਰਮੈਟਿੰਗ

### JSON ਆਉਟਪੁੱਟ
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ਟੇਬਲ ਆਉਟਪੁੱਟ
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 ਆਮ ਕਮਾਂਡ ਸੰਯੋਜਨ

### ਹੈਲਥ ਚੈਕ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### ਡਿਪਲੌਇਮੈਂਟ ਵੈਰੀਫਿਕੇਸ਼ਨ
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### ਵਾਤਾਵਰਣ ਤੁਲਨਾ
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### ਰਿਸੋਰਸ ਸਫਾਈ ਸਕ੍ਰਿਪਟ
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ

### ਆਮ ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲ
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

## 🚨 ਐਮਰਜੈਂਸੀ ਕਮਾਂਡਾਂ

### ਤੇਜ਼ ਹੱਲ
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

### ਰਿਕਵਰੀ ਕਮਾਂਡਾਂ
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 ਪ੍ਰੋ ਟਿਪਸ

### ਤੇਜ਼ ਵਰਕਫਲੋ ਲਈ ਅਲੀਅਸ
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### ਫੰਕਸ਼ਨ ਸ਼ਾਰਟਕਟ
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

## 📖 ਮਦਦ ਅਤੇ ਦਸਤਾਵੇਜ਼

### ਮਦਦ ਪ੍ਰਾਪਤ ਕਰਨਾ
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

### ਦਸਤਾਵੇਜ਼ ਲਿੰਕਸ
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**ਟਿਪ**: ਇਸ ਚੀਟ ਸ਼ੀਟ ਨੂੰ ਬੁੱਕਮਾਰਕ ਕਰੋ ਅਤੇ `Ctrl+F` ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਜ਼ਰੂਰੀ ਕਮਾਂਡਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਲੱਭੋ!

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਪ੍ਰੀਫਲਾਈਟ ਚੈਕਸ](../docs/pre-deployment/preflight-checks.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸ਼ਬਦਾਵਲੀ](glossary.md)

---

**ਅਸਵੀਕਰਤੀ**:  
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀ ਹੋਣ ਦਾ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਦਿਓ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸੁੱਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੇ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਅਸੀਂ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।  