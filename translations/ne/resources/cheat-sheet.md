# कमाण्ड चीट शीट - आवश्यक AZD कमाण्डहरू

**सबै अध्यायहरूको लागि छिटो संदर्भ**
- **📚 कोर्स होम**: [AZD For Beginners](../README.md)
- **📖 छिटो सुरु**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI कमाण्डहरू**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 उन्नत**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## परिचय

यो व्यापक चीट शीटले सबैभन्दा सामान्य प्रयोग गरिने Azure Developer CLI कमाण्डहरूको छिटो संदर्भ प्रदान गर्दछ, व्यावहारिक उदाहरणहरूसहित वर्गीकृत गरिएको छ। azd परियोजनाहरूको साथ विकास, समस्या समाधान, र दैनिक अपरेसनहरूमा छिटो हेर्नका लागि उपयुक्त।

## सिकाइका लक्ष्यहरू

यो चीट शीट प्रयोग गरेर, तपाईं:
- आवश्यक Azure Developer CLI कमाण्डहरू र सिन्ट्याक्समा तत्पर पहुँच पाउनु हुनेछ
- कार्यात्मक वर्गहरू र प्रयोग केसहरूद्वारा कमाण्ड संगठन बुझ्नुहुनेछ
- सामान्य विकास र परिनियोजन परिदृश्यहरूको लागि व्यावहारिक उदाहरणहरू सन्दर्भ गर्नुहोस्
- छिटो समस्या समाधानको लागि समस्या समाधान कमाण्डहरू पहुँच गर्नुहोस्
- उन्नत कन्फिगरेसन र अनुकूलन विकल्पहरू प्रभावकारी रूपमा पत्ता लगाउनुहोस्
- वातावरण व्यवस्थापन र बहु-वातावरण कार्यप्रवाह कमाण्डहरू फेला पार्नुहोस्

## सिकाइ नतिजाहरू

यस चीट शीटलाई नियमित रूपमा सन्दर्भ गरेर, तपाईं सक्षम हुनुहुनेछ:
- पूर्ण कागजात नहेरी azd कमाण्डहरू विश्वासपूर्वक चलाउन
- उपयुक्त डायग्नोस्टिक कमाण्डहरू प्रयोग गरेर सामान्य समस्याहरू छिटो समाधान गर्न
- बहु वातावरण र परिनियोजन परिदृश्यहरू प्रभावकारी रूपमा व्यवस्थापन गर्न
- आवश्यक पर्दा उन्नत azd सुविधाहरू र कन्फिगरेसन विकल्पहरू लागू गर्न
- प्रणालीगत कमाण्ड अनुक्रमहरू प्रयोग गरी परिनियोजन समस्याहरू समाधान गर्न
- azd छोटोकेस र विकल्पहरूको प्रभावकारी प्रयोगबाट कार्यप्रवाहहरू अनुकूलित गर्न

## प्रारम्भिक कमाण्डहरू

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

### परियोजना प्रारम्भ
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

## कोर परिनियोजन कमाण्डहरू

### पूर्ण परिनियोजन कार्यप्रवाह
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

### केवल पूर्वाधार
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

### निर्माण र प्याकेज
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

> **`azd restore`** तपाईंको एपको निर्भरता (npm, pip, NuGet, Maven, आदि) डाउनलोड गर्दछ। यो स्वतः `azd package` र `azd deploy` दौरान चल्छ, त्यसैले तपाईंले प्रायः यसलाई सिधै कल गर्नु हुँदैन—म्यानुअल रूपमा चलाएर निर्भरता पहिले देखि ल्याउनसक्नुहुन्छ (जस्तै, CI क्यास तताउने वा पछि अफलाइन काम गर्नको लागि)।

> **`azd package`** एक परिनियोजनयोग्य आर्टिफ्याक्ट तयार पार्छ एप सेवा परिनियोजन नगरीकन। व्यवहार भाषा र होस्टमा निर्भर हुन्छ: कन्टेनर प्याकेजिङले Azure दूरस्थ निर्माण प्रयोग गर्न सक्छ र प्रतिमा रजिस्ट्रीमा प्रकाशन गर्न सक्छ, त्यसैले यो अनिवार्य रूपमा अफलाइन वा Azure लेखाइबाट मुक्त छैन। `azd deploy` स्वतः प्याकेज गर्न सक्छ; आर्टिफ्याक्ट वा निर्माण जाँच आवश्यक हुँदा अलग प्याकेज चरण प्रयोग गर्नुहोस्।


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

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### वातावरण भेरिएबलहरू
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

वातावरण फाइलहरु प्लेनटेक्स्ट हुन्छन्। `azd env set` लाई गोप्य भण्डारणको रूपमा नलिनुहोस्; उपयुक्त रूपमा Key Vault सन्दर्भहरू वा प्रबन्धित पहिचान प्रयोग गर्नुहोस्।

## ⚙️ कन्फिगरेसन कमाण्डहरू

### वैश्विक कन्फिगरेसन
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

### परियोजना कन्फिगरेसन
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 अनुगमन र डायग्नोस्टिक्स

### अनुगमन ड्यासबोर्ड
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

एप्लिकेशन इन्साइट्स टेम्प्लेटद्वारा कन्फिगर गरिएको हुनुपर्छ। AZD को Live Metrics विकल्प हाल Python एप्लिकेशनहरूका लागि समर्थन छैन; यसको सट्टा अवलोकन, लगहरू, वा नमूनाको कागजात गरिएको ट्रेसिंग कार्यप्रवाह प्रयोग गर्नुहोस्।

### कन्टेनर लगहरू हेर्न
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### लग एनालिटिक्स क्वेरीहरू
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ मर्मतसम्भार कमाण्डहरू

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

### अपडेटहरू
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 उन्नत कमाण्डहरू

### पाइपलाइन र CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### पूर्वाधार व्यवस्थापन
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

### परियोजना जानकारी
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI र एक्सटेन्सनहरू कमाण्डहरू

### AZD एक्सटेन्सनहरू

Foundry GA सन्दर्भ अद्यावधिक 2026-11-09: `microsoft.foundry` बन्डल 1.0, घोषणा गरिएको [November 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/)। `azd >= 1.37.0` प्रयोग गर्नुहोस्; कम्पोनेन्टहरू स्वतन्त्र रूपमा संस्करण गरिएको र वैकल्पिक पूर्वावलोकन सुविधाहरू आफ्नो स्थिति राख्छन्।

```bash
# List all available extensions (including AI)
azd extension list

# Check/update the core CLI before updating extensions
azd version
azd update

# Install the GA bundle (agents, connections, inspector, projects,
# routines, skills, and toolboxes)
azd ext install microsoft.foundry

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Inspect installed versions and upgrade the bundle
azd ext list --installed
azd ext upgrade microsoft.foundry
```

बन्डलले मूल्यांकनहरू, डेटासेटहरू, सानो ट्युनिङ, वा अनुकूलित मोडेलहरू समावेश गर्दैन। व्यक्तिगत कोर एक्सटेन्सनहरू स्थापना जारी राखिएको छ। Python 3.13+ सँग चलाउन सकिने नमूना लागि [GA hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) पालन गर्नुहोस्, वर्तमान uv, अनुमति र मोडेल कोटा सहित।

### AI एजेन्ट कमाण्डहरू
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# For a code-based hosted agent, add --deploy-mode code during init
# Review azure.yaml, then provision before running locally
azd provision
azd ai agent run

# In a second terminal in the same project directory
azd ai agent invoke --local "Explain how this agent is deployed."

# Upload source for a remote Foundry build (code mode)
azd deploy

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Review hosted-agent changes, stream logs, or diagnose permissions
azd deploy --preview
azd ai agent monitor --follow
azd ai agent doctor

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` ले पुरानो `--manifest`/`-m` वर्तनी प्रतिस्थापन गर्दछ; पुराना म्यानिफेस्टहरू स्थानान्तरण आवश्यक छ। हाल एजेन्ट-इनिट `--host containerapp` विकल्प छैन। प्रबन्धित-हार्नेस, भ्वाइस, र लामो-समय पूर्वावलोकनहरूले स्वतन्त्र शेल/CI वातावरण ऑप्ट-इनहरू आवश्यक पर्छन्; [AI CLI सन्दर्भ](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features) हेर्नुहोस्।

स्थानीय परीक्षण अझै Azure मोडेल परिनियोजनहरू उपयोग गर्दछ र शुल्क लाग्छ। सफाईका लागि, `azd down` ले नयाँ सिर्जना गरेको Foundry परियोजनाको स्रोत समूह मेटाउँछ, तर पुन: प्रयोग गरिएको परियोजनाका स्रोतहरू त्यतै छाड्दछ; तपाईंले मात्रै चाहनुभएको स्रोतहरू अलगबाट हटाउनुहोस्।

### AI मूल्यांकन र अनुकूलन
```bash
# Generate and review a draft dataset and rubric (Dataset and evaluator / Turn)
azd ai eval generate

# In the initialized agent project, select those assets and a judge model
azd ai eval init --name quality

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --eval quality --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

एजेन्टहरू beta.22 ले विरासत मूल्यांकन आदेशहरूलाई `azd ai eval` बाट प्रतिस्थापन गर्यो `azure.ai.evaluations`। नयाँ मूल्यांकन कन्फिगरेसनले camelCase कुञ्जीहरू प्रयोग गर्छ। अनुकूलन `--config` ले एक स्वतन्त्र अनुकूलन API अनुरोध लिन्छ, **हैन** विरासत `eval.yaml` वा नयाँ `azure.eval.yaml`; मूल्यांकन पुन: प्रयोगका लागि `--eval`/`--eval-config` प्रयोग गर्नुहोस्। हेर्नुहोस् [मूल्यांकन सेटअप](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) र [अनुकूलन माइग्रेशन](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration)।

### फाउन्ड्री CI/CD
```bash
# After a successful local deployment, generate and review the pipeline
azd up
azd pipeline config

# Runner steps: install extensions, authenticate, then deploy
azd ext install microsoft.foundry azure.ai.evaluations
# Keep the generated OIDC sign-in and environment settings here
azd up --no-prompt
azd ai eval run start --eval quality --wait --no-prompt --fail-on "pass-rate=0.9"
```

रनर फ्र्याग्मेन्ट पूर्ण वर्कफ्लो होइन। समीक्षा गरिएको मूल्यांकन कन्फिगरेसन र गैर-गोप्य साधनहरू प्रतिवद्ध गर्नुहोस्, डाटा सेट/मूल्यांकनकर्ता/मोडेल पहुँच प्रदान गर्नुहोस्, र प्रत्येक चरणका लागि वातावरण प्रयोग गर्नुहोस्। हेर्नुहोस् [प्रमाणिकृत CI/CD उदाहरण](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration)।

### MCP सर्भर (अल्फा)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### पूर्वाधार निर्माण
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 छिटो वर्कफ्लोहरू

### विकास वर्कफ्लो
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

### बहु-पर्यावरण वर्कफ्लो
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

### समस्यासमाधान वर्कफ्लो
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

## 🔍 डिबगिङ आदेशहरू

### डिबग सूचना
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

### टेम्पलेट डिबगिङ
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 फाइल र डिरेक्टरी आदेशहरू

### परियोजना संरचना
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 आउटपुट फर्म्याटिङ

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

## 🔧 सामान्य आदेश संयोजनहरू

### स्वास्थ्य जाँच स्क्रिप्ट
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### परिनियोजन प्रमाणिकरण
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### वातावरण तुलना
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### स्रोत सफाइ स्क्रिप्ट
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 वातावरण चरहरू

### सामान्य वातावरण चरहरू
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

## 🚨 आपतकालीन आदेशहरू

### छिटो सुधारहरू
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

### पुनः प्राप्ति आदेशहरू
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 प्रो सुझावहरू

### छिटो वर्कफ्लोका लागि उपनामहरू
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### फङ्सन छोटकरीहरू
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

## 📖 सहायता र दस्तावेजहरू

### सहायता प्राप्ति
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

### दस्तावेज लिङ्कहरू
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**सुझाव**: यो चिट सिट बुकमार्क गर्नुहोस् र आफ्नो आवश्यक आदेशहरू छिटो फेला पार्न `Ctrl+F` प्रयोग गर्नुहोस्!

---

**नाविगेसन**
- **पहिल्लो पाठ**: [प्रीफ्लाइट जाँचहरू](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **अर्को पाठ**: [शब्दावली](glossary.md)

---

> **💡 तपाईँको सम्पादकमा Azure आदेश सहायता चाहनुहुन्छ?** स्थापना गर्नुहोस् [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) संग `npx skills add microsoft/github-copilot-for-azure` — AI, फाउन्ड्री, परिनियोजन, डायग्नोस्टिक्स, र थपका लागि ३७ सीपहरू।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->