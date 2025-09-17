<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-17T19:53:49+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "mr"
}
-->
# कमांड चीट शीट - आवश्यक AZD कमांड्स

**सर्व अध्यायांसाठी जलद संदर्भ**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../README.md)
- **📖 जलद सुरुवात**: [अध्याय 1: पाया आणि जलद सुरुवात](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमांड्स**: [अध्याय 2: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 प्रगत**: [अध्याय 4: कोड म्हणून इन्फ्रास्ट्रक्चर](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

ही सर्वसमावेशक चीट शीट सर्वात सामान्यपणे वापरल्या जाणाऱ्या Azure Developer CLI कमांड्ससाठी जलद संदर्भ प्रदान करते, श्रेणींनुसार व्यावहारिक उदाहरणांसह आयोजित केली आहे. विकास, समस्या सोडवणे आणि azd प्रकल्पांसह दैनंदिन ऑपरेशन्ससाठी जलद शोधासाठी योग्य.

## शिकण्याची उद्दिष्टे

या चीट शीटचा वापर करून, तुम्ही:
- आवश्यक Azure Developer CLI कमांड्स आणि सिंटॅक्ससाठी त्वरित प्रवेश मिळवा
- कार्यात्मक श्रेणी आणि वापर प्रकरणांनुसार कमांड्सचे आयोजन समजून घ्या
- सामान्य विकास आणि डिप्लॉयमेंट परिस्थितीसाठी व्यावहारिक उदाहरणे संदर्भित करा
- समस्या सोडवण्यासाठी जलद उपायांसाठी ट्रबलशूटिंग कमांड्स शोधा
- प्रगत कॉन्फिगरेशन आणि सानुकूलन पर्याय कार्यक्षमतेने शोधा
- पर्यावरण व्यवस्थापन आणि मल्टी-पर्यावरण कार्यप्रवाह कमांड्स शोधा

## शिकण्याचे परिणाम

या चीट शीटचा नियमित संदर्भ घेतल्याने तुम्ही:
- पूर्ण दस्तऐवजाचा संदर्भ न घेता आत्मविश्वासाने azd कमांड्स अंमलात आणू शकता
- योग्य निदान कमांड्स वापरून सामान्य समस्या जलद सोडवू शकता
- अनेक पर्यावरणे आणि डिप्लॉयमेंट परिस्थिती कार्यक्षमतेने व्यवस्थापित करू शकता
- आवश्यकतेनुसार प्रगत azd वैशिष्ट्ये आणि कॉन्फिगरेशन पर्याय लागू करू शकता
- डिप्लॉयमेंट समस्यांचे निराकरण करण्यासाठी प्रणालीबद्ध कमांड अनुक्रम वापरू शकता
- azd शॉर्टकट्स आणि पर्यायांचा प्रभावी वापर करून कार्यप्रवाह ऑप्टिमाइझ करू शकता

## सुरुवातीचे कमांड्स

### प्रमाणीकरण
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### प्रकल्प प्रारंभ
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

## मुख्य डिप्लॉयमेंट कमांड्स

### संपूर्ण डिप्लॉयमेंट कार्यप्रवाह
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

### फक्त इन्फ्रास्ट्रक्चर
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### फक्त अनुप्रयोग
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### बिल्ड आणि पॅकेज
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 पर्यावरण व्यवस्थापन

### पर्यावरण ऑपरेशन्स
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

### पर्यावरण व्हेरिएबल्स
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

## ⚙️ कॉन्फिगरेशन कमांड्स

### जागतिक कॉन्फिगरेशन
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

### प्रकल्प कॉन्फिगरेशन
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 मॉनिटरिंग आणि लॉग्स

### अनुप्रयोग लॉग्स
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

### मॉनिटरिंग
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ देखभाल कमांड्स

### क्लीनअप
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

### अपडेट्स
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 प्रगत कमांड्स

### पाइपलाइन आणि CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### इन्फ्रास्ट्रक्चर व्यवस्थापन
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### सेवा व्यवस्थापन
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 जलद कार्यप्रवाह

### विकास कार्यप्रवाह
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

### मल्टी-पर्यावरण कार्यप्रवाह
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

### समस्या सोडवण्याचा कार्यप्रवाह
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

## 🔍 डीबगिंग कमांड्स

### डीबग माहिती
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

### टेम्पलेट डीबगिंग
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 फाइल आणि डिरेक्टरी कमांड्स

### प्रकल्प संरचना
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 आउटपुट स्वरूपन

### JSON आउटपुट
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### टेबल आउटपुट
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 सामान्य कमांड संयोजन

### हेल्थ चेक स्क्रिप्ट
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### डिप्लॉयमेंट व्हॅलिडेशन
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### पर्यावरण तुलना
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### संसाधन क्लीनअप स्क्रिप्ट
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 पर्यावरण व्हेरिएबल्स

### सामान्य पर्यावरण व्हेरिएबल्स
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

## 🚨 आपत्कालीन कमांड्स

### जलद उपाय
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

### पुनर्प्राप्ती कमांड्स
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 प्रो टिप्स

### जलद कार्यप्रवाहासाठी उपनाम
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### फंक्शन शॉर्टकट्स
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

## 📖 मदत आणि दस्तऐवजीकरण

### मदत मिळवणे
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

### दस्तऐवजीकरण दुवे
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**टीप**: ही चीट शीट बुकमार्क करा आणि `Ctrl+F` वापरून तुम्हाला आवश्यक असलेल्या कमांड्स जलद शोधा!

---

**नेव्हिगेशन**
- **मागील धडा**: [प्रीफ्लाइट चेक्स](../docs/pre-deployment/preflight-checks.md)
- **पुढील धडा**: [शब्दकोश](glossary.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण होणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.