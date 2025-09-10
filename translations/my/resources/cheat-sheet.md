<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "04291031a6a1cc0dc4064dcb9c543584",
  "translation_date": "2025-09-10T07:44:20+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "my"
}
-->
# Command Cheat Sheet - AZD အရေးကြီးသော Commands

## အကျဉ်းချုပ်

ဒီ cheat sheet က Azure Developer CLI မှာ အများဆုံးအသုံးပြုတဲ့ commands တွေကို အမျိုးအစားအလိုက် စီစဉ်ပြီး လက်တွေ့နမူနာများနဲ့အတူ အမြန်ရယူနိုင်အောင် ပြုလုပ်ပေးထားပါတယ်။ Development, troubleshooting, နေ့စဉ် operations တွေမှာ အမြန်ရှာဖွေဖို့ အထူးသင့်တော်ပါတယ်။

## သင်ယူရမည့်ရည်ရွယ်ချက်များ

ဒီ cheat sheet ကို အသုံးပြုခြင်းအားဖြင့် သင်သည်:
- Azure Developer CLI commands နဲ့ syntax ကို အမြန်ရယူနိုင်မည်
- Commands တွေကို အလုပ်လုပ်ပုံအလိုက် စီစဉ်ထားတဲ့အရာကို နားလည်နိုင်မည်
- Development နဲ့ deployment အခြေအနေများအတွက် လက်တွေ့နမူနာများကို ရှာဖွေနိုင်မည်
- Troubleshooting commands တွေကို အမြန်ပြုပြင်နိုင်မည်
- Advanced configuration နဲ့ customization options တွေကို အလွယ်တကူ ရှာဖွေနိုင်မည်
- Environment management နဲ့ multi-environment workflow commands တွေကို ရှာဖွေနိုင်မည်

## သင်ယူရမည့်ရလဒ်များ

ဒီ cheat sheet ကို အကြိမ်ကြိမ် အသုံးပြုခြင်းအားဖြင့် သင်သည်:
- azd commands တွေကို documentation အပြည့်အစုံကို မကြည့်ဘဲ ယုံကြည်စိတ်ချစွာ အသုံးပြုနိုင်မည်
- အများဆုံးဖြစ်လေ့ရှိတဲ့ပြဿနာတွေကို diagnostic commands တွေကို အသုံးပြုပြီး အမြန်ဖြေရှင်းနိုင်မည်
- အမျိုးမျိုးသော environments နဲ့ deployment အခြေအနေများကို ထိရောက်စွာ စီမံနိုင်မည်
- azd ရဲ့ advanced features နဲ့ configuration options တွေကို လိုအပ်သလို အသုံးပြုနိုင်မည်
- Deployment ပြဿနာတွေကို systematic command sequences တွေကို အသုံးပြုပြီး Troubleshoot လုပ်နိုင်မည်
- azd ရဲ့ shortcuts နဲ့ options တွေကို ထိရောက်စွာ အသုံးပြုပြီး workflows တွေကို အကောင်းဆုံး ပြုလုပ်နိုင်မည်

## စတင်အသုံးပြုရန် Commands

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

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
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

## 📊 Monitoring and Logs

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
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
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
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Service Management
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
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

## 🔍 Debugging Commands

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
azd service list --output table
```

## 🔧 Common Command Combinations

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
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Recovery Commands
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Pro Tips

### Aliases for Faster Workflow
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Function Shortcuts
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

**အကြံပြုချက်**: ဒီ cheat sheet ကို Bookmark လုပ်ထားပြီး `Ctrl+F` ကို အသုံးပြုပြီး သင့်လိုအပ်တဲ့ commands တွေကို အမြန်ရှာဖွေပါ။

---

**Navigation**
- **Previous Lesson**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Glossary](glossary.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာတရ အရင်းအမြစ်အဖြစ် ရှုလေ့လာသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။