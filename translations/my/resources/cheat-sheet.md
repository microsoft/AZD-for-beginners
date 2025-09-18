<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-18T13:34:40+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "my"
}
-->
# အမိန့်များအတွက် Cheat Sheet - AZD Commands အရေးကြီးများ

**အခန်းအားလုံးအတွက် အမြန်ရယူရန်**
- **📚 သင်ခန်းစာ မူလစာမျက်နှာ**: [AZD For Beginners](../README.md)
- **📖 အမြန်စတင်ရန်**: [အခန်း ၁: အခြေခံနှင့် အမြန်စတင်ရန်](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [အခန်း ၂: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 အဆင့်မြင့်**: [အခန်း ၄: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## နိဒါန်း

ဒီ cheat sheet သည် Azure Developer CLI အမိန့်များအတွက် အရေးကြီးသော အမြန်ရယူနိုင်စရာကို အမျိုးအစားအလိုက် စီစဉ်ထားပြီး လက်တွေ့နမူနာများနှင့်အတူ ပေးထားသည်။ AZD project များတွင် ဖွံ့ဖြိုးတိုးတက်မှု၊ ပြဿနာဖြေရှင်းမှုနှင့် နေ့စဉ်လုပ်ငန်းစဉ်များအတွက် အမြန်ကြည့်ရှုရန် အထူးသင့်တော်သည်။

## သင်ယူရည်မှန်းချက်များ

ဒီ cheat sheet ကို အသုံးပြုခြင်းဖြင့် သင်သည်:
- Azure Developer CLI အမိန့်များနှင့် syntax ကို အမြန်ရယူနိုင်မည်
- အမိန့်များကို လုပ်ဆောင်မှုအမျိုးအစားနှင့် အသုံးပြုမှုအခြေအနေအလိုက် စီစဉ်ထားမှုကို နားလည်မည်
- ဖွံ့ဖြိုးတိုးတက်မှုနှင့် deployment အခြေအနေများအတွက် လက်တွေ့နမူနာများကို ရည်ညွှန်းနိုင်မည်
- ပြဿနာများကို အမြန်ဖြေရှင်းရန် troubleshooting အမိန့်များကို ရှာဖွေနိုင်မည်
- အဆင့်မြင့် configuration နှင့် customization ရွေးချယ်မှုများကို ထိရောက်စွာ ရှာဖွေနိုင်မည်
- ပတ်ဝန်းကျင်စီမံခန့်ခွဲမှုနှင့် multi-environment workflow အမိန့်များကို ရှာဖွေနိုင်မည်

## သင်ယူရလဒ်များ

ဒီ cheat sheet ကို အမြဲရည်ညွှန်းခြင်းဖြင့် သင်သည်:
- အပြည့်အစုံသော documentation ကို မကြည့်ဘဲ azd အမိန့်များကို ယုံကြည်စွာ အသုံးပြုနိုင်မည်
- သင့်လျော်သော diagnostic အမိန့်များကို အသုံးပြု၍ ပုံမှန်ပြဿနာများကို အမြန်ဖြေရှင်းနိုင်မည်
- ပတ်ဝန်းကျင်များစွာနှင့် deployment အခြေအနေများကို ထိရောက်စွာ စီမံနိုင်မည်
- azd ၏ အဆင့်မြင့် features နှင့် configuration ရွေးချယ်မှုများကို လိုအပ်သလို အသုံးပြုနိုင်မည်
- deployment ပြဿနာများကို စနစ်တကျ အမိန့်များဖြင့် troubleshooting ပြုလုပ်နိုင်မည်
- azd ၏ shortcut များနှင့် ရွေးချယ်မှုများကို ထိရောက်စွာ အသုံးပြု၍ workflow များကို အကောင်းဆုံးလုပ်ဆောင်နိုင်မည်

## စတင်ရန် အမိန့်များ

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

## အဓိက Deployment အမိန့်များ

### အပြည့်အစုံ Deployment Workflow
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

### Infrastructure သီးသန့်
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Application သီးသန့်
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Build နှင့် Package
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု

### ပတ်ဝန်းကျင် လုပ်ဆောင်မှုများ
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

### ပတ်ဝန်းကျင် Variables
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

## ⚙️ Configuration အမိန့်များ

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

## 📊 Monitoring နှင့် Logs

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

## 🛠️ ပြုပြင်ထိန်းသိမ်းမှု အမိန့်များ

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

## 🔧 အဆင့်မြင့် အမိန့်များ

### Pipeline နှင့် CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Infrastructure စီမံခန့်ခွဲမှု
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Service စီမံခန့်ခွဲမှု
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 အမြန် Workflow များ

### ဖွံ့ဖြိုးတိုးတက်မှု Workflow
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

## 🔍 Debugging အမိန့်များ

### Debug အချက်အလက်
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

## 📁 ဖိုင်နှင့် ဒိုင်ရက်ထရီ အမိန့်များ

### Project ဖွဲ့စည်းမှု
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

## 🔧 ပုံမှန် Command တွဲများ

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

## 📝 ပတ်ဝန်းကျင် Variables

### ပုံမှန် ပတ်ဝန်းကျင် Variables
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

## 🚨 အရေးပေါ် အမိန့်များ

### အမြန် ပြုပြင်မှုများ
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

### Recovery အမိန့်များ
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Pro Tips

### Workflow အမြန်လုပ်ဆောင်ရန် Aliases
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

## 📖 အကူအညီနှင့် Documentation

### အကူအညီရယူခြင်း
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

**အကြံပြုချက်**: ဒီ cheat sheet ကို Bookmark လုပ်ပြီး `Ctrl+F` ကို အသုံးပြု၍ သင့်လိုအမိန့်များကို အမြန်ရှာဖွေပါ။

---

**Navigation**
- **ယခင် သင်ခန်းစာ**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **နောက်သင်ခန်းစာ**: [Glossary](glossary.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။