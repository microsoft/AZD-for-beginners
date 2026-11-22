# ជាផ្ទាំងបញ្ជា Command Cheat Sheet - ពាក្យបញ្ជា AZD សំខាន់ៗ

**យោងយ៉ាងរហ័សសម្រាប់គ្រប់ជំពូក**
- **📚 ផ្ទះវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../README.md)
- **📖 ចាប់ផ្ដើមរហ័ស**: [ជំពូក 1៖ គ្រឹះមូល និងចាប់ផ្ដើមយ៉ាងរហ័ស](../README.md#-chapter-1-foundation--quick-start)
- **🤖 ពាក្យបញ្ជា AI**: [ជំពូក 2៖ ការអភិវឌ្ឍ AI ជាទី១](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 កម្រិតខ្ពស់**: [ជំពូក 4៖ រចនាសម្ព័ន្ធជាកូដ](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## ទិដ្ឋភាពទូទៅ

ផ្ទាំងបញ្ជានេះផ្តល់ជារូបមន្តយោងយ៉ាងរហ័សសម្រាប់ពាក្យបញ្ជា Azure Developer CLI ដែលប្រើប្រាស់ជាញឹកញាប់បំផុត ដោយបែងចែកតាមប្រភេទជាមួយឧទាហរណ៍ប្រតិបត្តិ។ ល្អឥតខ្ចោះសម្រាប់មើលយ៉ាងរហ័សពេលពិវត្តន៍ ការជួសជុលកំហុស និងប្រតិបត្តិការប្រចាំថ្ងៃឆន្ទៈជាមួយគម្រោង azd។

## គោលបំណងរៀន

ដោយប្រើផ្ទាំងបញ្ជានេះ អ្នកនឹង:
- មានការចូលដំណើរការពាក្យបញ្ជា Azure Developer CLI និងវាក្យអក្សរសំខាន់ៗភ្លាមៗ
- យល់ដឹងពីរបៀបបែងចែកពាក្យបញ្ជាតាមប្រភេទមុខងារ និងករណីប្រើប្រាស់
- យោងទៅឧទាហរណ៍ប្រតិបត្តិដែលជាក់ស្តែងសម្រាប់សេណារីយ៉ូអភិវឌ្ឍន៍ និងដាក់ឲ្យដំណើរការ
- ចូលដំណើរការពាក្យបញ្ជាជួសជុលកំហុសសម្រាប់ដោះស្រាយបញ្ហាយ៉ាងរហ័ស
- រកមើលជម្រើសកំណត់កំរិតខ្ពស់ និងប្ដូរតាមតម្រូវការយ៉ាងមានប្រសិទ្ធិភាព
- បង្ហាញពាក្យបញ្ជា​គ្រប់គ្រងបរិយាកាស និងវគ្គបញ្ចូលការងារពហុបរិយាកាស

## លទ្ធផលការរៀន

ជាមួយការយោងស្រួលទៅផ្ទាំងបញ្ជានេះ អ្នកនឹងអាច:
- បញ្ចេញពាក្យបញ្ជា azd ជាមោទនភាពដោយគ្មានការយោងឯកសារពេញលេញ
- ដោះស្រាយបញ្ហាជាទៀងទាត់ដោយការប្រើប្រាស់ពាក្យបញ្ជាចាំបាច់សម្រាប់ចាប់អារម្មណ៍វិនិច្ឆ័យ
- គ្រប់គ្រងបរិយាកាស និងសេណារីយ៉ូនួចដាក់ចេញបានយ៉ាងមានប្រសិទ្ធភាព
- ប្រើប្រាស់មុខងារ azd កម្រិតខ្ពស់ និងជម្រើសកំណត់តម្លៃដូចតម្រូវការ
- ជួសជុលបញ្ហាការដាក់ចេញដោយប្រើលំដាប់ពាក្យបញ្ជាយ៉ាងមានប្រព័ន្ធ
- បង្កើនប្រសិទ្ធភាពនៃវគ្គការងារដោយប្រើប្រាស់ជម្រើស និងផ្លូវកាត់ azd បានយ៉ាងមានប្រសិទ្ធិភាព

## ពាក្យបញ្ជាចាប់ផ្ដើម

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

### ការចាប់ផ្ដើមគម្រោង
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

## ពាក្យបញ្ជាដាក់ចេញសំខាន់ៗ

### របៀបដំណើរការដាក់ចេញពេញលេញ
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

### រចនាសម្ព័ន្ធតែមួយ
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### កម្មវិធីតែមួយ
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### សង់ និងកញ្ចប់
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

> **`azd restore`** ទាញយកការពឹងផ្អែក​អំពីកម្មវិធីរបស់អ្នក (npm, pip, NuGet, Maven, ល។)។ វាដំណើរការដោយស្វ័យប្រវត្តិពេល`azd package` និង`azd deploy` ដូច្នេះអ្នកភាគច្រើនមិនហៅវាជាមុខងារផ្ទាល់ទេ— អ្នកអាចដំណើរការដោយដៃដើម្បីទាញមុនការពឹងផ្អែក (ឧ. ដើម្បីកំដៅបន្ទះ CI ឬធ្វើការក្រោយក្រោយក្រៅបណ្តាញ)។

> **`azd package`** រៀបចំបណ្តាញឯកសារដាក់ចេញដោយគ្មានការដាក់សេវាកម្មកម្មវិធី។ ប្រតិបត្តិការផ្អែកលើភាសា និងម៉ាស៊ីនផ្ទះ: ការវេចខ្ចប់កុងតឺន័រអាចប្រើការសាងសង់រ៉ឹមផ្សេងៗ និងបោះពុម្ពរូបភាពទៅក្នុងឃ្លាំង, ដូច្នេះវាមិនចាំបាច់ជាផ្លូវដាច់ឬគ្មានការសរសេរ Azure។ `azd deploy` អាចវេចខ្ចប់ដោយស្វ័យប្រវត្តិ; ប្រើជំហានកញ្ចប់ផ្សេងមួយនៅពេលអ្នកចាំបាច់បណ្តាញឯកសារ ឬត្រួតពិនិត្យការសាងសង់។


## 🌍 ការគ្រប់គ្រងបរិយាកាស

### ប្រតិបត្តិការបរិយាកាស
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

### អថេរបរិយាកាស
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

ឯកសារបរិយាកាសជាឯកសារលេខអក្សរ។ កុំគិត `azd env set` ជាគន្លងផ្ទុកសម្ងាត់; ប្រើឯកសារយោង Key Vault ឬអត្តសញ្ញាណគ្រប់គ្រងតាមការភ្ជាប់។

## ⚙️ ពាក្យបញ្ជាកំណត់

### កំណត់ទូទៅលើលោក
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

### កំណត់គម្រោង
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 ការត្រួតពិនិត្យ និងវិភាគ

### ផ្ទាំងត្រួតពិនិត្យ
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

Application Insights ត្រូវបានកំណត់ដោយទំព័រគំរូ។ ជម្រើស Live Metrics របស់ AZD គ្មានការគាំទ្រសម្រាប់កម្មវិធី Python; ប្រើផ្ទាំងទិដ្ឋភាពទូទៅ កំណត់ហេតុ ឬសំណុំបទច្បាប់នៃការតាមដានឧទាហរណ៍។

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

## 🛠️ ពាក្យបញ្ជា பரំរូងសំអាត

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

### អាប់ដេត
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 ពាក្យបញ្ជាកម្រិតខ្ពស់

### Pipeline និង CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### ការគ្រប់គ្រងរចនាសម្ព័ន្ធ
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

### ព័ត៌មានគម្រោង
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 ពាក្យបញ្ជា AI និងការពង្រីក

### ការពង្រីក AZD

ទាញយក Foundry GA កំណែ 2026-11-09: `microsoft.foundry` ចលនាសំណុំ 1.0, ប្រកាស [ចាន់ធើ 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/)។ ប្រើ `azd >= 1.37.0`; បញ្ជា​បណ្ដុំ​ត្រូវបានកំណត់កំណែជាឯករាជ្យ និងមុខងារ​ពិន្ទុXមុខមួយរៀងៗខ្លួនមានសភាពជាវគ្គជាមុន។

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

បណ្ដុំនេះមិនរួមបញ្ចូលការវាយតម្លៃ ទិន្នន័យ ការប្រូម៉ាស៊ីនលំអ ឬម៉ូដែលផ្ទាល់ខ្លួនទេ។ ការតំឡើងការ៉េមុខងារសំខាន់ៗនៅតែគាំទ្រ។ អនុវត្តតាម [GA hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) សម្រាប់ឧទាហរណ៍ដំណើរការជាមួយ Python 3.13+ មាន uv បច្ចុប្បន្ន សិទ្ធិ និងកម្រិតម៉ូដែល។

### ពាក្យបញ្ជា AI Agent
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

`--template`/`-t` ជំនួសអក្សរកាត់ដែលមិនគាំទ្ររបស់ពាក្យបញ្ជា `--manifest`/`-m`; មុខងារចាស់ត្រូវការផ្ទេរទីតាំង។ គ្មានជម្រើស agent-init `--host containerapp` នៅពេលនេះទេ។ ចំណត់ជាលក្ខណៈ‌មេណែជឺ រំលឹកសំឡេង និងផ្នែកមើលជាបន្តពេលវែងត្រូវការជម្រើសបរិស្ថាន shell/CI ផ្ទាល់ខ្លួន; មើល [AI CLI reference](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features)។

ការធ្វើតេស្តក្នុងទីតាំងនៅតែប្រើប្រាស់ការដាក់ម៉ូដែល Azure ហើយមានកម្រៃ។ សម្រាប់សម្អាត, `azd down` លុបក្រុមធនធានគម្រោង Foundry ថ្មី ប៉ុន្តែលុបធនធានគម្រោងដែលបានប្រើឡើងវិញជាឯករាជ្យ; លុបតែធនធានមិនចង់បានដែលអ្នកជាម្ចាស់នៅផ្ទាល់។

### ការវាយតម្លៃ និងបុព្វហេតុ AI
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

អេជិន beta.22 បានជំនួសពាក្យបញ្ជាវាយតម្លៃចាស់ជាមួយ `azd ai eval` ពី `azure.ai.evaluations`។ កំណត់រចនាសម្ព័ន្ធវាយតម្លៃថ្មីប្រើកូនសោ camelCase។ បុព្វហេតុ `--config` ទទួលការស្នើសុំ API បុព្វហេតុផ្តាច់មុខមួយ, **មិន** ដូច `eval.yaml` ចាស់ ឬ `azure.eval.yaml` ថ្មី; ប្រើ `--eval`/`--eval-config` សម្រាប់ការប្រើប្រាស់បុព្វហេតុឡើងវិញ។ មើល [setting evaluation](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) និង [migration optimization](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration)។

### Foundry CI/CD
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

ស្លាបរត់មិនមែនជារបៀបការងារសំរាប់ពេញលេញទេ។ ផ្ដល់ការត្រួតពិនិត្យកំណត់រចនាសម្ព័ន្ធ និងទ្រព្យសម្បត្តិនៅក្រៅសម្ងាត់; អនុញ្ញាតការចូលប្រើទិន្នន័យ/អ្នកវាយតម្លៃ/ម៉ូដែល, និងប្រើបរិយាកាសពិសេសសម្រាប់មួយដំណាក់កាល។ មើល [authenticated CI/CD example](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration)។

### MCP Server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### ការបង្កើតរចនាសម្ព័ន្ធ
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 វគ្គការងារយ៉ាងរហ័ស

### វគ្គការងារអភិវឌ្ឍន៍
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

### វគ្គការងារពហុបរិយាកាស
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

### វគ្គជួសជុលកំហុស
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

## 🔍 ពាក្យបញ្ជាចាប់កំហុស

### ព័ត៌មានចាប់កំហុស
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

### ជំនួយចាប់កំហុសគំរូ
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

## 🎨 ទ្រង់ទ្រាយលទ្ធផល

### លទ្ធផល JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### លទ្ធផលតារាង
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 ការរួមបញ្ចូលពាក្យបញ្ជាធម្មតា

### ស្គ្រីបត្រួតពិនិត្យសុខភាព
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### ការត្រួតពិនិត្យការដាក់ចេញ
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### ការប្រៀបធៀបទីតាំងបរិយាកាស
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### ស្គ្រីបសម្អាតធនធាន
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 អថេរបរិយាកាស

### អថេរបរិយាកាសធម្មតា
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

## 🚨 ពាក្យបញ្ជារញ្ជួយជ្រាប

### ការកែតម្រូវរហ័ស
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

### ពាក្យបញ្ជាការស្ដារឡើង
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 គន្លឹះដ៏ល្អ

### ឈ្មោះជាបន្ទាន់សម្រាប់សម្រួលវគ្គការងារ
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ផ្លូវកាត់មុខងារ
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

## 📖 ជំនួយ និងឯកសារយោង

### ទទួលបានជំនួយ
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

### តំណភ្ជាប់ឯកសារ
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**គន្លឹះ**៖ បន្ថែមផ្ទាំងបញ្ជានេះទៅនៅក្នុងបំណែកចំណាំរបស់អ្នក ហើយប្រើ `Ctrl+F` ដើម្បីស្វែងរកពាក្យបញ្ជាដែលអ្នកត្រូវការយ៉ាងរហ័ស!

---

**ចរចារណ៍**
- **មុខមួយមុន**: [ការត្រួតពិនិត្យមុនហោះហើរ](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **មុខមួយបន្តិច**: [ពាក្យវិភាគ](glossary.md)

---

> **💡 ចង់បានជំនួយពាក្យបញ្ជា Azure នៅក្នុងកម្មវិធីរបស់អ្នក?** តំឡើង [ជំនាញ Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ជាមួយ `npx skills add microsoft/github-copilot-for-azure` — មានជំនាញ ៣៧ ប្រភេទសម្រាប់ AI, Foundry, ដាក់ចេញ, វិភាគ និងផ្សេងៗទៀត។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->