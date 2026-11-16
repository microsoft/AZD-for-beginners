# សន្លឹកបញ្ឆេទពាក្យបញ្ជា - ពាក្យបញ្ជា AZD សំខាន់ៗ

**ការប៉ាន់ប្រមាណរហ័សសម្រាប់ជំពូកទាំងអស់**
- **📚 ផ្ទះសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../README.md)
- **📖 ចាប់ផ្តើមយ៉ាងរហ័ស**: [ជំពូក ១៖ មូលដ្ឋាន & ចាប់ផ្តើមយ៉ាងរហ័ស](../README.md#-chapter-1-foundation--quick-start)
- **🤖 ពាក្យបញ្ជា AI**: [ជំពូក ២៖ ការអភិវឌ្ឍ AI ជាប្រភពដំបូង](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 កម្រិតកំពូល**: [ជំពូក ៤៖ បរិក្ខារជាកូដ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ការណែនាំ

សន្លឹកបញ្ឆេទពាក្យបញ្ជាជាច្រើននេះផ្តល់ជាការយោងយ៉ាងរហ័សសម្រាប់ពាក្យបញ្ជា Azure Developer CLI ដែលប្រើប្រាស់ជាទូទៅបំផុត ដែលត្រូវបានរៀបចំតាមប្រភេទរួមជាមួយឧទាហរណ៍អនុវត្តន៍។ មានសមត្ថភាពល្អបំផុតសម្រាប់ការស្វែងរកយ៉ាងរហ័ស ក្នុងអំឡុងពេលអភិវឌ្ឍន៍ ការដោះស្រាយបញ្ហា និងប្រតិបត្តិការប្រចាំថ្ងៃជាមួយគម្រោង azd។

## គោលបំណងសិក្សា

ដោយប្រើសន្លឹកបញ្ឆេទនេះ អ្នកនឹង:
- មានការចូលដំណើរការយ៉ាងភ្លាមៗទៅកាន់ពាក្យបញ្ជា Azure Developer CLI សំខាន់ៗ និង វ្យាករណ៍​វិភាគ
- យល់ដឹងពីការរៀបចំពាក្យបញ្ជាតាមប្រភេទមុខងារ និងករណីប្រើប្រាស់
- យោងទៅឧទាហរណ៍អនុវត្តន៍សម្រាប់សេណារីយ៉ូអភិវឌ្ឍន៍ និងដាក់ឱ្យដំណើរការជារឿយៗ
- ចូលដំណើរការពាក្យបញ្ជាសម្រាប់ដោះស្រាយបញ្ហាយ៉ាងរហ័ស
- រកមើលជម្រើសកំណត់តម្លៃ និងប្តូរតាមតម្រូវការកម្រិតកំពូលបានយ៉ាងមានប្រសិទ្ធភាព
- រកមើលពាក្យបញ្ជាចំពោះការគ្រប់គ្រងបរិបទ និងដំណើរការប្រព័ន្ធបរិបទច្រើន

## លទ្ធផលសិក្សា

ជាមួយការយោងជារឿយទៅសន្លឹកបញ្ឆេទនេះ អ្នកនឹងអាច:
- ប្រតិបត្តិពាក្យបញ្ជា azd ដោយទំនុកចិត្តដោយមិនចាំបាច់យោងឯកសារពេញលេញ
- ដោះស្រាយបញ្ហាទូទៅដោយប្រើពាក្យបញ្ជាកំណត់ជួសជុលបានយ៉ាងរហ័ស
- គ្រប់គ្រងបរិបទ និងសេណារីយ៉ូដាក់ឱ្យដំណើរការជាច្រើនបានយ៉ាងមានប្រសិទ្ធភាព
- អនុវត្តលក្ខណៈពិសេស azd កម្រិតកំពូល និងជម្រើសកំណត់តម្លៃតាមតម្រូវការ
- ដោះស្រាយបញ្ហាការដាក់ឱ្យដំណើរការដោយប្រើតម្រៀបពាក្យបញ្ជាដំណើរការ
- អុីម៉ែលសកម្មភាពធ្វើការ តាមរយៈការប្រើប្រាស់ពាក្យបញ្ជាសង្ខេប និងជម្រើស azd ដ៏មានប្រសិទ្ធភាព

## ពាក្យបញ្ជាចាប់ផ្តើម

### ការផ្ទៀងផ្ទាត់
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

### ការចាប់ផ្តើមគំរោង
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

## ពាក្យបញ្ជាផ្ទុកចម្បង

### ដំណើរការផ្ទុកចម្បងពេញលេញ
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

### មានតែបរិក្ខារប៉ុណ្ណោះ
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### មានតែកម្មវិធីប៉ុណ្ណោះ
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### សាងសង់ និង បំពាក់ជាបណ្ណៈ
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

> **`azd restore`** ទាញយកការពឹងផ្អែកនៃកម្មវិធីរបស់អ្នក (npm, pip, NuGet, Maven, ល។) វាដំណើរការដោយស្វ័យប្រវត្តិក្នុងអំឡុងពេល `azd package` និង `azd deploy` ដូច្នេះអ្នកក៏ប្រហែលជាមិនបានហៅវាដោយផ្ទាល់ញឹកញាប់ទេ — អ្នកអាចដំណើរការវាដោយដៃដើម្បីត្រៀមទាញយកការពឹងផ្អែកជាមុន (ឧទាហរណ៍ ដើម្បីកំដៅប្រព័ន្ធផ្ទុក CI ឬធ្វើការងារពេលក្រោយក្រៅបណ្តាញ)។

> **`azd package`** រៀបចំអត្ថបទដែលអាចដាក់ឲ្យដំណើរការបានដោយមិនបានដាក់ប្រើសេវាកម្មកម្មវិធី។ លទ្ធភាពនៃសកម្មភាពអាស្រ័យលើភាសា និងម៉ាស៊ីនបើកផ្ទះ៖ ការបំពាក់កូណតឺន័រអាចប្រើការសាងសង់ពីចម្ងាយរបស់ Azure និងផ្សព្វផ្សាយរូបភាពទៅឃ្លាំងរូបភាព ដូច្នេះវាមិនមានន័យថាជាការងារពេញលេញក្រៅបណ្តាញ ឬមិនមានការសរសេរទៅកាន់ Azure។ `azd deploy` អាចបំពាក់ដោយស្វ័យប្រវត្តិបាន; ប្រើជំហានបំពាក់ផ្សេងទៀតបើអ្នកត្រូវការអត្ថបទឬត្រួតពិនិត្យការសាងសង់។


## 🌍 ការគ្រប់គ្រងបរិបទ

### ប្រតិបត្តិការបរិបទ
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

### អថេរបរិបទ
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

សោបរិបទគឺជាឯកសារអត្ថបទជាងសាមញ្ញ។ កុំយក `azd env set` ជាកន្លែងផ្ទុកឯកជន; សូមប្រើយោង Key Vault ឬអត្តសញ្ញាណគ្រប់គ្រងតាមសម្រួល។

## ⚙️ ពាក្យបញ្ជាកំណត់តម្លៃ

### កំណត់តម្លៃសកល
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

### កំណត់តម្លៃគំរោង
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 ការត្រួតពិនិត្យ និងការវិភាគ

### ផ្ទាំងគ្រប់គ្រងការត្រួតពិនិត្យ
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

តម្រូវឲ្យមានការកំណត់ Application Insights ដោយប្លង់ខ្ទង់។ ជម្រើស Live Metrics របស់ AZD មិនគាំទ្រថ្ងៃនេះសម្រាប់កម្មវិធី Python ទេ; សូមប្រើការមើលទូទៅ កំណត់ហេតុ ឬដំណើរការឆ្លងកាត់ដែលមានឯកសារពិពណ៌នារបស់គំរូជំនួស។

### មើលកំណត់ហេតុកុងតឺន័រ
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### សំណួរវិភាគកំណត់ហេតុ
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ ពាក្យបញ្ជថែទាំ

### សម្អាត
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

### បច្ចុប្បន្នភាព
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 ពាក្យបញ្ជាកម្រិតកំពូល

### ប៊ីប្លាញ និង CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### ការគ្រប់គ្រងបរិក្ខារ
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

### ព័ត៌មានគំរោង
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 ពាក្យបញ្ជា AI និងកម្មវិធីបន្ថែម

### កម្មវិធីបន្ថែម AZD

យោង CLI AI បានពិនិត្យឡើងវិញថ្ងៃទី ០៤-១១-២០២៦ៈ `azd 1.37.2`, អ្នកប្រតិបត្តិការ `1.0.0-beta.23`, ការវាយតម្លៃ `1.0.0-beta.2`។ ប្រើ `azd >= 1.37.0` សម្រាប់ដំណើរការរួម; អាប់ដេត CLI ស្នូលមុនកម្មវិធីបន្ថែមដែលមិនសមរម្យ។

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

### ពាក្យបញ្ជាអ្នកប្រតិបត្តិការ AI
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

`--template`/`-t` ជំនួសចំណងជើងដែលបានលុបចោល `--manifest`/`-m`; តំណាងចាស់ទៀតត្រូវការផ្លាស់ប្តូរ។ ឥឡូវនេះមិនមានជម្រើស agent-init `--host containerapp` ទេ។ ការគ្រប់គ្រង-harness, សំឡេង និងមុនរយៈពេលវែងត្រូវការជ្រើសរើសបរិយាកាសសែល / CI ដាច់ដោយឡែក; មើល [យោង CLI AI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features)។

### ការវាយតម្លៃ និងការបង្កើនប្រសិទ្ធភាព AI
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

អេហ្សង់ beta.22 បានជំនួសពាក្យបញ្ជាបានប៉ាន់ស្មានដើមជាមួយ `azd ai eval` ពី `azure.ai.evaluations`។ ការកំណត់ការប៉ាន់ស្មានថ្មីប្រើកូនសោ camelCase។ ការប៊ិចត្បាញ `--config` គឺទទួលសំណើ API ប៊ិចត្បាញឯករាជ្យមួយ **មិន**មែន `eval.yaml` ដើមឬ `azure.eval.yaml` ថ្មីទេ; ប្រើ `--eval`/`--eval-config` សម្រាប់ការប្រើប្រាស់ឡើងវិញនៃការប៉ាន់ស្មាន។ មើល [ការកំណត់ការប៉ាន់ស្មាន](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) និង [ការផ្ទេរប៊ិចត្បាញ](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration)។

### ម៉ាស៊ីនមេ MCP (អាល់ហ្វា)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### ការបង្កើតហេដ្ឋារចនាសម្ព័ន្ធ
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 សកម្មភាពរហ័ស

### សកម្មភាពអភិវឌ្ឍន៍
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

### សកម្មភាពបរិដ្ឋានច្រើន
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

### សកម្មភាពដោះស្រាយបញ្ហា
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

## 🔍 ពាក្យបញ្ជាដើម្បីពិនិត្យកំហុស

### ព័ត៌មានពិនិត្យកំហុស
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

### ពិនិត្យកំហុសម៉ូដែល
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 ពាក្យបញ្ជាឯកសារ និងថត

### រចនាសម្ព័ន្ធគម្រោង
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 ទ្រង់ទ្រាយចេញ

### ចេញរាង JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ចេញរាងតារាង
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 ការរួមបញ្ចូលពាក្យបញ្ជារួម

### script ពិនិត្យសុខភាព
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### ការត្រួតពិនិត្យដំឡើង
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### ការប្រៀបធៀបទីតាំងបរិស្ថាន
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### script សំអាតធនធាន
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 អថេរបរិដ្ឋាន

### អថេរបរិដ្ឋានទូទៅ
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

## 🚨 ពាក្យបញ្ជាបន្ទាន់

### ការជួសជុលបន្ទាន់
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

### ពាក្យបញ្ជាការស្តារឡើងវិញ
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 គន្លឹះអាជីព

### ឈ្មោះខ្លីសម្រាប់សកម្មភាពរហ័ស
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ហ្វ៊ង់សិនរហ័ស
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

## 📖 ជំនួយ និងឯកសារ

### របៀបទទួលបានជំនួយ
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

### ឯកសារភ្ជាប់
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**គន្លឹះ**៖ ជៀសវាងហ្វាយ Cheat Sheet នេះ ហើយប្រើ `Ctrl+F` ដើម្បីស្វែងរកពាក្យបញ្ជាដោយរហ័ស!

---

**ការរុករក**
- **មេរៀនមុន**៖ [ពិនិត្យមុនហោះហើរ](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **មេរៀនបន្ទាប់**៖ [ពត៌មានពាក្យ](glossary.md)

---

> **💡 ចង់បានជំនួយពាក្យបញ្ជា Azure ក្នុងកម្មវិធីសម្រង់របស់អ្នកទេ?** តំឡើង [ជំនាញអេហ្សង់ Microsoft Azure](https://skills.sh/microsoft/github-copilot-for-azure) ជាមួយ `npx skills add microsoft/github-copilot-for-azure` — មានជំនាញ ៣៧ សម្រាប់ AI, Foundry, ដំឡើង, ផ្ទុកកំហុស និងជាច្រើនទៀត។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->