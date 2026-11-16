# कमांड चीट शीट - आवश्यक AZD कमांड्स

**सभी अध्यायों के लिए त्वरित संदर्भ**
- **📚 कोर्स होम**: [शुरुआती के लिए AZD](../README.md)
- **📖 त्वरित प्रारंभ**: [अध्याय 1: आधार और त्वरित प्रारंभ](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमांड्स**: [अध्याय 2: AI-प्रथम विकास](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 उन्नत**: [अध्याय 4: इन्फ्रास्ट्रक्चर एस कोड](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यह व्यापक चीट शीट सबसे अधिक उपयोग किए जाने वाले Azure Developer CLI कमांड्स का त्वरित संदर्भ प्रदान करता है, जिन्हें श्रेणी के अनुसार और व्यावहारिक उदाहरणों के साथ व्यवस्थित किया गया है। यह azd प्रोजेक्ट्स के साथ विकास, समस्या निवारण, और दैनिक कार्यों के दौरान त्वरित खोजों के लिए उत्तम है।

## सीखने के लक्ष्य

इस चीट शीट का उपयोग करके, आप:
- आवश्यक Azure Developer CLI कमांड्स और सिंटैक्स तक त्वरित पहुंच पाएंगे
- कमांड को कार्यात्मक श्रेणियों और उपयोग मामलों के आधार पर समझेंगे
- सामान्य विकास और तैनाती परिदृश्यों के लिए व्यावहारिक उदाहरण संदर्भित करेंगे
- त्वरित समस्या समाधान के लिए समस्या निवारण कमांड्स तक पहुँचेंगे
- उन्नत कॉन्फ़िगरेशन और अनुकूलन विकल्पों को कुशलता से पाएंगे
- पर्यावरण प्रबंधन और बहु-पर्यावरण कार्यप्रवाह कमांड्स खोजेंगे

## सीखने के परिणाम

इस चीट शीट को नियमित रूप से संदर्भित करके, आप सक्षम होंगे:
- पूर्ण दस्तावेज़ीकरण के संदर्भ के बिना AZD कमांड्स का आत्मविश्वास से निष्पादन करें
- उपयुक्त डायग्नोस्टिक कमांड्स का उपयोग करते हुए आम समस्याओं को त्वरित रूप से हल करें
- कई पर्यावरण और तैनाती परिदृश्यों का कुशल प्रबंधन करें
- जब आवश्यक हो, तो उन्नत azd सुविधाओं और कॉन्फ़िगरेशन विकल्पों को लागू करें
- तैनाती समस्याओं का व्यवस्थित कमांड अनुक्रमों के माध्यम से निवारण करें
- azd शॉर्टकट्स और विकल्पों के प्रभावी उपयोग के माध्यम से कार्यप्रवाहों को अनुकूलित करें

## आरंभ करने वाले कमांड्स

### प्रमाणीकरण
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### प्रोजेक्ट प्रारंभिकीकरण
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## मुख्य तैनाती कमांड्स

### पूर्ण तैनाती कार्यप्रवाह
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### केवल इन्फ्रास्ट्रक्चर
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### केवल एप्लिकेशन
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### बिल्ड और पैकेज
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** आपके ऐप की निर्भरताओं (npm, pip, NuGet, Maven, आदि) को डाउनलोड करता है। यह स्वचालित रूप से `azd package` और `azd deploy` के दौरान चलता है, इसलिए आप इसे सीधे चलाते नहीं हैं—इसे मैन्युअली चलाएँ यदि आप निर्भरताएँ पहले से प्राप्त करना चाहते हैं (उदाहरण के तौर पर, CI कैश को गर्म करने या बाद में ऑफ़लाइन काम करने के लिए)।

> **`azd package`** तैनाती से पहले एक डिप्लॉयबल आर्टिफैक्ट तैयार करता है बिना एप्लिकेशन सेवा को डिप्लॉय किए। व्यवहार भाषा और होस्ट पर निर्भर करता है: कंटेनर पैकेजिंग Azure रिमोट बिल्ड्स का उपयोग कर सकती है और इमेजेस को रजिस्ट्री में प्रकाशित कर सकती है, इसलिए यह जरूरी नहीं कि ऑफ़लाइन या Azure लेखन से मुक्त हो। `azd deploy` स्वतः पैकेज कर सकता है; जब आप एक आर्टिफैक्ट या बिल्ड जांच की जरूरत हो तब अलग पैकेज चरण का उपयोग करें।


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

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### पर्यावरण चर
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

पर्यावरण फ़ाइलें पठन-साधारण होती हैं। `azd env set` को गुप्त संग्रहण के रूप में न लें; उपयुक्तता के अनुसार Key Vault संदर्भ या प्रबंधित पहचान का उपयोग करें।

## ⚙️ कॉन्फ़िगरेशन कमांड्स

### वैश्विक कॉन्फ़िगरेशन
```bash
# List all configuration
azd config show

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
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 निगरानी और निदान

### मॉनिटरिंग डैशबोर्ड
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

एप्लिकेशन इनसाइट्स टेम्पलेट द्वारा कॉन्फ़िगर किया जाना चाहिए। AZD के लाइव मेट्रिक्स विकल्प वर्तमान में Python एप्लिकेशन के लिए समर्थित नहीं हैं; इसके बजाय अवलोकन, लॉग्स या सैंपल की दस्तावेजीकृत ट्रेसिंग वर्कफ़्लो का उपयोग करें।

### कंटेनर लॉग्स देखना
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### लॉग एनालिटिक्स क्वेरीज
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
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
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 उन्नत कमांड्स

### पाइपलाइन और CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### इन्फ्रास्ट्रक्चर प्रबंधन
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
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### प्रोजेक्ट जानकारी
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI और एक्सटेंशंस कमांड्स

### AZD एक्सटेंशंस

AI CLI संदर्भ समीक्षा 2026-11-04: `azd 1.37.2`, एजेंट्स `1.0.0-beta.23`, मूल्यांकन `1.0.0-beta.2`। संयुक्त कार्यप्रवाह के लिए `azd >= 1.37.0` का उपयोग करें; असंगत एक्सटेंशंस से पहले कोर CLI को अपग्रेड करें।

```bash
# List all available extensions (including AI)
azd extension list

# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the agent skills extension (preview)
azd extension install azure.ai.skills

# Install the Foundry connections extension (preview)
azd extension install azure.ai.connections

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Upgrade all installed extensions
azd extension upgrade --all
```

### AI एजेंट कमांड्स
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` पुरानी `--manifest`/`-m` स्पेलिंग को प्रतिस्थापित करता है; पुराने मैनिफेस्ट्स को माइग्रेट करना आवश्यक है। वर्तमान में कोई एजेंट-इनिट `--host containerapp` विकल्प नहीं है। मैनेज्ड-हार्नेस, वॉइस, और लंबी अवधि के पूर्वावलोकन में स्वतंत्र शेल/CI पर्यावरण ऑप्ट-इन की आवश्यकता होती है; देखें [AI CLI संदर्भ](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features)।

### AI मूल्यांकन और अनुकूलन
```bash
# In an initialized agent project, configure evaluation resources
azd ai eval init

# Optionally generate a rubric and dataset; review files and printed next steps
azd ai eval generate

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

एजेंट्स beta.22 ने पुराने मूल्यांकन कमांड्स को `azd ai eval` से बदल दिया जो `azure.ai.evaluations` से आते हैं। नया मूल्यांकन कॉन्फ़िगरेशन camelCase कुंजियां उपयोग करता है। अनुकूलन `--config` एक स्वतंत्र अनुकूलन API अनुरोध लेता है, **न कि** पुराना `eval.yaml` या नया `azure.eval.yaml`; पुन: उपयोग के लिए `--eval`/`--eval-config` का उपयोग करें। देखें [मूल्यांकन सेटअप](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) और [अनुकूलन माइग्रेशन](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration)।

### MCP सर्वर (अल्फा)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### इन्फ्रास्ट्रक्चर जेनरेशन
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 त्वरित कार्यप्रवाह

### विकास कार्यप्रवाह
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### बहु-पर्यावरण कार्यप्रवाह
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

### समस्या निवारण कार्यप्रवाह
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 डिबगिंग कमांड्स

### डिबग जानकारी
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### टेम्पलेट डिबगिंग
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 फ़ाइल और निर्देशिका कमांड्स

### प्रोजेक्ट संरचना
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 आउटपुट फॉर्मेटिंग

### JSON आउटपुट
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### तालिका आउटपुट
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 सामान्य कमांड संयोजन

### स्वास्थ्य जांच स्क्रिप्ट
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### तैनाती सत्यापन
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### पर्यावरण तुलना
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### संसाधन सफाई स्क्रिप्ट
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 पर्यावरण चर

### सामान्य पर्यावरण चर
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 आपातकालीन कमांड्स

### त्वरित समाधान
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### पुनर्प्राप्ति कमांड्स
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 प्रो टिप्स

### तेज़ कार्यप्रवाह के लिए उपनाम
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फ़ंक्शन शॉर्टकट्स
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 सहायता और दस्तावेज़ीकरण

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

### दस्तावेज़ीकरण लिंक
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**संकेत**: इस चीट शीट को बुकमार्क करें और आवश्यक कमांड्स को जल्दी खोजने के लिए `Ctrl+F` का उपयोग करें!

---

**नेविगेशन**
- **पिछला पाठ**: [प्रिफ़्लाइट चेक्स](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **अगला पाठ**: [शब्दावली](glossary.md)

---

> **💡 अपने संपादक में Azure कमांड सहायता चाहते हैं?** 37 AI, Foundry, तैनाती, निदान, और अधिक कौशलों के साथ [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) को `npx skills add microsoft/github-copilot-for-azure` के साथ स्थापित करें।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->