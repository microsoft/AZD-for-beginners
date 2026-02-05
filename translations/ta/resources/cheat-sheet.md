# கட்டளை குறிப்பு - முக்கிய AZD கட்டளைகள்

**அத்தியாயங்களுக்கான விரைவான குறிப்புகள்**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்கட்டம்](../README.md)
- **📖 விரைவான தொடக்கம்**: [அத்தியாயம் 1: அடித்தளம் & விரைவான தொடக்கம்](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI கட்டளைகள்**: [அத்தியாயம் 2: AI-முதன்மை மேம்பாடு](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 மேம்பட்டது**: [அத்தியாயம் 4: கோடாக் கட்டமைப்பு](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## அறிமுகம்

இந்த விரிவான குறிப்பு AZD திட்டங்களுடன் மேம்பாடு, பிழைதிருத்தம் மற்றும் தினசரி செயல்பாடுகளின் போது விரைவான தேடல்களுக்கு மிகவும் பயன்படும், பொதுவாக பயன்படுத்தப்படும் Azure Developer CLI கட்டளைகளுக்கான விரைவான குறிப்புகளை வழங்குகிறது.

## கற்றல் நோக்கங்கள்

இந்த குறிப்பு மூலம், நீங்கள்:
- முக்கிய Azure Developer CLI கட்டளைகள் மற்றும் வடிவமைப்புகளுக்கு உடனடி அணுகலை பெறுவீர்கள்
- செயல்பாட்டு பிரிவுகள் மற்றும் பயன்பாட்டு வழக்குகளின் அடிப்படையில் கட்டளைகளை புரிந்துகொள்வீர்கள்
- பொதுவான மேம்பாடு மற்றும் வெளியீட்டு சூழல்களுக்கு நடைமுறை உதாரணங்களை மேற்கோள் காட்டுவீர்கள்
- பிழைதிருத்த கட்டளைகளை விரைவாகப் பயன்படுத்தி பிரச்சினைகளை தீர்க்க உதவுவீர்கள்
- மேம்பட்ட கட்டமைப்பு மற்றும் தனிப்பயன் விருப்பங்களை எளிதாகக் கண்டறிவீர்கள்
- சூழல் மேலாண்மை மற்றும் பல சூழல் வேலைவழிகளை கண்டறிவீர்கள்

## கற்றல் முடிவுகள்

இந்த குறிப்பை அடிக்கடி பயன்படுத்துவதன் மூலம், நீங்கள்:
- முழுமையான ஆவணங்களைப் பார்க்காமல் AZD கட்டளைகளை நம்பகமாக செயல்படுத்த முடியும்
- சரியான பிழைதிருத்த கட்டளைகளைப் பயன்படுத்தி பொதுவான பிரச்சினைகளை விரைவாக தீர்க்க முடியும்
- பல சூழல்களை மற்றும் வெளியீட்டு சூழல்களை திறமையாக நிர்வகிக்க முடியும்
- தேவையான போது மேம்பட்ட AZD அம்சங்கள் மற்றும் அமைப்புகளைப் பயன்படுத்த முடியும்
- வெளியீட்டு பிரச்சினைகளை முறையான கட்டளை வரிசைகளைப் பயன்படுத்தி பிழைதிருத்த முடியும்
- AZD குறுக்குவழிகள் மற்றும் விருப்பங்களை திறமையாகப் பயன்படுத்தி வேலைவழிகளை மேம்படுத்த முடியும்

## தொடக்க கட்டளைகள்

### அங்கீகாரம்
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### திட்ட தொடக்கம்
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

## முக்கிய வெளியீட்டு கட்டளைகள்

### முழுமையான வெளியீட்டு வேலைவழி
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

### கட்டமைப்பு மட்டும்
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

### பயன்பாடு மட்டும்
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### கட்டமைப்பு மற்றும் தொகுப்பு
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 சூழல் மேலாண்மை

### சூழல் செயல்பாடுகள்
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

### சூழல் மாறிகள்
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

## ⚙️ அமைப்பு கட்டளைகள்

### உலகளாவிய அமைப்பு
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

### திட்ட அமைப்பு
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 கண்காணிப்பு மற்றும் பதிவுகள்

### பயன்பாட்டு பதிவுகள்
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

### கண்காணிப்பு
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ பராமரிப்பு கட்டளைகள்

### சுத்தம் செய்யல்
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

### புதுப்பிப்புகள்
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 மேம்பட்ட கட்டளைகள்

### குழாய் மற்றும் CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### கட்டமைப்பு மேலாண்மை
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

### சேவை மேலாண்மை
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 விரைவான வேலைவழிகள்

### மேம்பாட்டு வேலைவழி
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

### பல சூழல் வேலைவழி
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

### பிழைதிருத்த வேலைவழி
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

## 🔍 பிழைதிருத்த கட்டளைகள்

### பிழை தகவல்
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

### வார்ப்புரு பிழைதிருத்தம்
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 கோப்பு மற்றும் அடைவு கட்டளைகள்

### திட்ட அமைப்பு
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 வெளியீட்டு வடிவமைப்பு

### JSON வெளியீடு
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### அட்டவணை வெளியீடு
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 பொதுவான கட்டளை சேர்க்கைகள்

### ஆரோக்கிய சோதனை ஸ்கிரிப்ட்
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### வெளியீட்டு சரிபார்ப்பு
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### சூழல் ஒப்பீடு
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### வள சுத்தம் செய்யல் ஸ்கிரிப்ட்
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 சூழல் மாறிகள்

### பொதுவான சூழல் மாறிகள்
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

## 🚨 அவசர கட்டளைகள்

### விரைவான சரிசெய்தல்
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

### மீட்பு கட்டளைகள்
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 சிறந்த குறிப்புகள்

### வேகமான வேலைவழிக்கான மாற்றுப்பெயர்கள்
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### செயல்பாட்டு குறுக்குவழிகள்
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

## 📖 உதவி மற்றும் ஆவணங்கள்

### உதவி பெறுதல்
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

### ஆவண இணைப்புகள்
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**குறிப்பு**: இந்த குறிப்பை புக் மார்க் செய்து `Ctrl+F` பயன்படுத்தி உங்களுக்கு தேவையான கட்டளைகளை விரைவாக தேடுங்கள்!

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **அடுத்த பாடம்**: [Glossary](glossary.md)

---

**புறக்கணிப்பு**:  
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம், ஆனால் தானியக்க மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.