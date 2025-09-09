<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "04291031a6a1cc0dc4064dcb9c543584",
  "translation_date": "2025-09-09T18:02:13+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "hi"
}
-->
# कमांड चीट शीट - आवश्यक AZD कमांड्स

## परिचय

यह व्यापक चीट शीट सबसे अधिक उपयोग किए जाने वाले Azure Developer CLI कमांड्स का त्वरित संदर्भ प्रदान करती है, जो श्रेणी के अनुसार व्यवस्थित हैं और व्यावहारिक उदाहरणों के साथ आते हैं। विकास, समस्या निवारण, और azd प्रोजेक्ट्स के साथ दैनिक संचालन के दौरान त्वरित खोज के लिए आदर्श।

## सीखने के लक्ष्य

इस चीट शीट का उपयोग करके, आप:
- आवश्यक Azure Developer CLI कमांड्स और सिंटैक्स तक तुरंत पहुंच प्राप्त करेंगे
- कार्यात्मक श्रेणियों और उपयोग मामलों के अनुसार कमांड्स को समझेंगे
- सामान्य विकास और परिनियोजन परिदृश्यों के लिए व्यावहारिक उदाहरणों का संदर्भ देंगे
- त्वरित समस्या समाधान के लिए समस्या निवारण कमांड्स तक पहुंच प्राप्त करेंगे
- उन्नत कॉन्फ़िगरेशन और कस्टमाइज़ेशन विकल्पों को कुशलतापूर्वक ढूंढ पाएंगे
- पर्यावरण प्रबंधन और बहु-पर्यावरण वर्कफ़्लो कमांड्स का पता लगाएंगे

## सीखने के परिणाम

इस चीट शीट का नियमित रूप से संदर्भ लेने से, आप:
- azd कमांड्स को आत्मविश्वास के साथ बिना पूरी डॉक्यूमेंटेशन का संदर्भ लिए निष्पादित कर पाएंगे
- उपयुक्त डायग्नोस्टिक कमांड्स का उपयोग करके सामान्य समस्याओं को जल्दी हल कर पाएंगे
- कई पर्यावरणों और परिनियोजन परिदृश्यों को कुशलतापूर्वक प्रबंधित कर पाएंगे
- आवश्यकतानुसार उन्नत azd सुविधाओं और कॉन्फ़िगरेशन विकल्पों को लागू कर पाएंगे
- व्यवस्थित कमांड अनुक्रमों का उपयोग करके परिनियोजन समस्याओं का निवारण कर पाएंगे
- azd शॉर्टकट्स और विकल्पों का प्रभावी उपयोग करके वर्कफ़्लो को अनुकूलित कर पाएंगे

## आरंभ करने के लिए कमांड्स

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

### प्रोजेक्ट प्रारंभिककरण
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

## मुख्य परिनियोजन कमांड्स

### पूर्ण परिनियोजन वर्कफ़्लो
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

### केवल इंफ्रास्ट्रक्चर
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### केवल एप्लिकेशन
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### निर्माण और पैकेजिंग
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 पर्यावरण प्रबंधन

### पर्यावरण संचालन
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

### पर्यावरण वेरिएबल्स
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

## ⚙️ कॉन्फ़िगरेशन कमांड्स

### वैश्विक कॉन्फ़िगरेशन
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

### प्रोजेक्ट कॉन्फ़िगरेशन
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 मॉनिटरिंग और लॉग्स

### एप्लिकेशन लॉग्स
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

## 🛠️ रखरखाव कमांड्स

### सफाई
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

## 🔧 उन्नत कमांड्स

### पाइपलाइन और CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### इंफ्रास्ट्रक्चर प्रबंधन
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### सेवा प्रबंधन
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 त्वरित वर्कफ़्लो

### विकास वर्कफ़्लो
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

### बहु-पर्यावरण वर्कफ़्लो
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

### समस्या निवारण वर्कफ़्लो
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

## 🔍 डिबगिंग कमांड्स

### डिबग जानकारी
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

### टेम्पलेट डिबगिंग
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 फ़ाइल और डायरेक्टरी कमांड्स

### प्रोजेक्ट संरचना
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 आउटपुट स्वरूपण

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

### परिनियोजन मान्यता
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

### संसाधन सफाई स्क्रिप्ट
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 पर्यावरण वेरिएबल्स

### सामान्य पर्यावरण वेरिएबल्स
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

## 🚨 आपातकालीन कमांड्स

### त्वरित सुधार
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

### रिकवरी कमांड्स
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 प्रो टिप्स

### तेज़ वर्कफ़्लो के लिए उपनाम
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### फ़ंक्शन शॉर्टकट्स
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

## 📖 सहायता और डॉक्यूमेंटेशन

### सहायता प्राप्त करना
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

### डॉक्यूमेंटेशन लिंक
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**टिप**: इस चीट शीट को बुकमार्क करें और `Ctrl+F` का उपयोग करके आपको आवश्यक कमांड्स को जल्दी से खोजें!

---

**नेविगेशन**
- **पिछला पाठ**: [प्रीफ्लाइट चेक्स](../docs/pre-deployment/preflight-checks.md)
- **अगला पाठ**: [शब्दावली](glossary.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।