# कमाण्ड चिट शीट - आवश्यक AZD कमाण्डहरू

**सबै अध्यायहरूको छिटो सन्दर्भ**
- **📚 कोर्स होम**: [AZD सुरुवातका लागि](../README.md)
- **📖 छिटो सुरु**: [अध्याय १: आधारभूत र छिटो सुरु](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमाण्डहरू**: [अध्याय २: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 उन्नत**: [अध्याय ४: कोडको रूपमा पूर्वाधार](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यो व्यापक चिट शीटले सबैभन्दा सामान्य प्रयोग गरिने Azure Developer CLI कमाण्डहरूको छिटो सन्दर्भ प्रदान गर्दछ, वर्गीकृत गरेर व्यावहारिक उदाहरणहरूसँग। विकास, समस्या समाधान, र दैनिक AZD परियोजनाहरूको सञ्चालनको समयमा छिटो सन्दर्भको लागि उपयुक्त।

## सिकाइका लक्ष्यहरू

यो चिट शीट प्रयोग गरेर, तपाईं:
- आवश्यक Azure Developer CLI कमाण्डहरू र सिन्ट्याक्समा तुरुन्त पहुँच पाउनुहुनेछ
- कार्यात्मक वर्गहरू र प्रयोगका केसहरूद्वारा कमाण्डहरूको संगठन बुझ्नुहुनेछ
- सामान्य विकास र परिनियोजन परिदृश्यहरूको लागि व्यावहारिक उदाहरणहरू सन्दर्भ गर्नुहुनेछ
- समस्या समाधानका लागि छिटो समाधानका कमाण्डहरू पहुँच गर्नुहुनेछ
- उन्नत कन्फिगरेसन र अनुकूलन विकल्पहरू कुशलतापूर्वक फेला पार्नुहुनेछ
- वातावरण व्यवस्थापन र बहु-वातावरण कार्यप्रवाह कमाण्डहरू पत्ता लगाउनुहुनेछ

## सिकाइका परिणामहरू

यो चिट शीटलाई नियमित रूपमा सन्दर्भ गरेर, तपाईं:
- पूर्ण दस्तावेजीकरण सन्दर्भ नगरी आत्मविश्वासका साथ AZD कमाण्डहरू कार्यान्वयन गर्न सक्नुहुनेछ
- उपयुक्त डायग्नोस्टिक कमाण्डहरू प्रयोग गरेर सामान्य समस्याहरू छिटो समाधान गर्न सक्नुहुनेछ
- बहु-वातावरण र परिनियोजन परिदृश्यहरू कुशलतापूर्वक व्यवस्थापन गर्न सक्नुहुनेछ
- आवश्यक परेमा उन्नत AZD सुविधाहरू र कन्फिगरेसन विकल्पहरू लागू गर्न सक्नुहुनेछ
- व्यवस्थित कमाण्ड अनुक्रमहरू प्रयोग गरेर परिनियोजन समस्याहरू समाधान गर्न सक्नुहुनेछ
- AZD सर्टकटहरू र विकल्पहरूको प्रभावकारी प्रयोग गरेर कार्यप्रवाहहरू अनुकूलित गर्न सक्नुहुनेछ

## सुरु गर्ने कमाण्डहरू

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

### परियोजना आरम्भ
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

## मुख्य परिनियोजन कमाण्डहरू

### पूर्ण परिनियोजन कार्यप्रवाह
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

### केवल पूर्वाधार
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

### केवल एप्लिकेसन
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### निर्माण र प्याकेज
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 वातावरण व्यवस्थापन

### वातावरण सञ्चालनहरू
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

### वातावरण चरहरू
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

## ⚙️ कन्फिगरेसन कमाण्डहरू

### विश्वव्यापी कन्फिगरेसन
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

### परियोजना कन्फिगरेसन
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 निगरानी र लगहरू

### एप्लिकेसन लगहरू
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

### निगरानी
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ मर्मत कमाण्डहरू

### सफाइ
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

### अपडेटहरू
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 उन्नत कमाण्डहरू

### पाइपलाइन र CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### पूर्वाधार व्यवस्थापन
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

### सेवा व्यवस्थापन
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 छिटो कार्यप्रवाहहरू

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

### बहु-वातावरण कार्यप्रवाह
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

### समस्या समाधान कार्यप्रवाह
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

## 🔍 डिबगिङ कमाण्डहरू

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

### टेम्प्लेट डिबगिङ
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 फाइल र डाइरेक्टरी कमाण्डहरू

### परियोजना संरचना
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

### तालिका आउटपुट
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 सामान्य कमाण्ड संयोजनहरू

### स्वास्थ्य जाँच स्क्रिप्ट
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
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### वातावरण तुलना
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### स्रोत सफाइ स्क्रिप्ट
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 वातावरण चरहरू

### सामान्य वातावरण चरहरू
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

## 🚨 आपतकालीन कमाण्डहरू

### छिटो समाधानहरू
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

### पुनःप्राप्ति कमाण्डहरू
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 प्रो टिप्स

### छिटो कार्यप्रवाहका लागि उपनामहरू
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### फङ्सन सर्टकटहरू
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

## 📖 सहायता र दस्तावेजीकरण

### सहायता प्राप्त गर्दै
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

### दस्तावेजीकरण लिङ्कहरू
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**टिप**: यो चिट शीटलाई बुकमार्क गर्नुहोस् र `Ctrl+F` प्रयोग गरेर तपाईंलाई चाहिने कमाण्डहरू छिटो फेला पार्नुहोस्!

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [प्रिफ्लाइट जाँचहरू](../docs/pre-deployment/preflight-checks.md)
- **अर्को पाठ**: [शब्दावली](glossary.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषामा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।