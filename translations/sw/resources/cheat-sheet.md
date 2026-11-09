# Karatasi ya Amri ya Haraka - Amri Muhimu za AZD

**Marejeo ya Haraka kwa Sura Zote**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Waanzilishi](../README.md)
- **📖 Mwanzo wa Haraka**: [Sura 1: Msingi & Mwanzo wa Haraka](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Amri za AI**: [Sura 2: Maendeleo ya Kwanza ya AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Zaidi**: [Sura 4: Miundombinu kama Kanuni](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Utangulizi

Kadi hii ya kina ya amri hutoa marejeo ya haraka kwa amri zinazotumika sana za Azure Developer CLI, zimepangwa kwa vikundi kulingana na mifano ya vitendo. Inafaa kwa uangalizi wa haraka wakati wa maendeleo, utatuzi wa matatizo, na shughuli za kila siku na miradi ya azd.

## Malengo ya Kujifunza

Kwa kutumia kadi hii ya amri, utaweza:
- Kupata mara moja amri muhimu za Azure Developer CLI na sarufi
- Kuelewa muundo wa amri kwa vikundi vya kazi na matumizi
- Kutumia mifano ya vitendo kwa hali za kawaida za maendeleo na usambazaji
- Kupata amri za utatuzi kwa haraka wa matatizo
- Kupata chaguzi za usanidi wa hali ya juu kwa ufanisi
- Kupata amri za usimamizi wa mazingira na mchakato wa mazingira mengi

## Matokeo ya Kujifunza

Kwa matumizi ya mara kwa mara ya kadi hii ya amri, utaweza:
- Kutekeleza amri za azd kwa ujasiri bila kuangalia nyaraka kamili
- Kutatua matatizo ya kawaida kwa haraka kwa kutumia amri sahihi za uchunguzi
- Kusimamia kwa ufanisi mazingira mengi na hali za usambazaji
- Kutumia vipengele vya azd vya hali ya juu na chaguzi za usanidi ipasavyo
- Kutatua matatizo ya usambazaji kwa kutumia mfululizo wa amri ulio mpangiliwa
- Kuboresha michakato kupitia matumizi bora ya njia za mkato na chaguzi za azd

## Amri za Kuanzisha

### Uthibitishaji
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

### Uanzishaji wa Mradi
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

## Amri Muhimu za Usambazaji

### Mchakato Kamili wa Usambazaji
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

### Miundombinu Pekee
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Programu Pekee
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Kujenga na Kufunga
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

> **`azd restore`** hupakua utegemezi wa programu yako (npm, pip, NuGet, Maven, n.k.). Inaendeshwa moja kwa moja wakati wa `azd package` na `azd deploy`, kwa hivyo mara chache utaipigia simu moja kwa moja—ezaendesha mwenyewe kujipatia utegemezi mapema (kwa mfano, kuwasilisha cache ya CI au kufanya kazi bila mtandao baadaye).

> **`azd package`** huandaa kifurushi kinachoweza kusambazwa bila kuweka huduma ya programu. Mwelekeo unategemea lugha na mwenyeji: kufunga kontena kunaweza kutumia ujenzi wa mbali wa Azure na kuchapisha picha kwenye rejista, kwa hivyo si lazima iwe bila mtandao au isiyo na uandishi wa Azure. `azd deploy` inaweza kufunga moja kwa moja; tumia hatua ya kifurushi tofauti unaposhea kifurushi au ukaguzi wa ujenzi.


## 🌍 Usimamizi wa Mazingira

### Operesheni za Mazingira
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

### Vigezo vya Mazingira
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

Mafaili ya mazingira ni maandishi rahisi. Usitazame `azd env set` kama hifadhi ya siri; tumia marejeleo ya Key Vault au utambulisho ulioendeshwa ipasavyo.

## ⚙️ Amri za Usanidi

### Usanidi wa Ulimwengu
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

### Usanidi wa Mradi
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Ufuatiliaji na Uchunguzi

### Dashibodi ya Ufuatiliaji
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

Application Insights lazima iwekwe na kiolezo. Chaguo la AZD la Live Metrics kwa sasa halitegemezwi kwa programu za Python; tumia muhtasari, kumbukumbu, au mchakato wa kufuatilia uliodokumentwa wa sampuli badala yake.

### Kuangalia Kumbukumbu za Kontena
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Maswali ya Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Amri za Matengenezo

### Usafishaji
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

### Sasisho
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Amri za Juu

### Mchakato wa Pipeline na CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Usimamizi wa Miundombinu
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

### Taarifa za Mradi
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Amri za AI & Virutubisho

### Virutubisho vya AZD

Marejeo ya CLI ya AI yaliangaliwa 2026-11-04: `azd 1.37.2`, mawakala `1.0.0-beta.23`, tathmini `1.0.0-beta.2`. Tumia `azd >= 1.37.0` kwa mchakato wa pamoja; boresha CLI kuu kabla ya virutubisho visivyolingana.

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

### Amri za Wakala wa AI
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

`--template`/`-t` hubadilisha tahajia ya zamani `--manifest`/`-m`; hati za kale zinahitaji uhamishaji. Hakuna chaguo la wakala-init `--host containerapp` kwa sasa. Mtumizi wa mfululizo, sauti, na mapitio ya muda mrefu yanahitaji kujiunga na mazingira ya shell/CI peke yao; angalia [marejeo ya AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Tathmini na Uboreshaji wa AI
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

Mawakala beta.22 walibadilisha amri za zamani za tathmini na `azd ai eval` kutoka `azure.ai.evaluations`. Usanidi mpya wa tathmini hutumia funguo za camelCase. Uboreshaji `--config` unahitaji ombi la API la uboreshaji huru, **sio** amri za zamani za `eval.yaml` au mpya za `azure.eval.yaml`; tumia `--eval`/`--eval-config` kwa matumizi tena ya tathmini. Angalia [usanidi wa tathmini](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) na [uhamishaji wa uboreshaji](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Seva ya MCP (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Utoaji wa Miundombinu
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Michakato ya Haraka

### Mchakato wa Maendeleo
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

### Mchakato wa Mazingira Mengi
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

### Mchakato wa Utatuzi wa Matatizo
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

## 🔍 Amri za Kurekebisha Hitilafu

### Taarifa za Kurekebisha
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

### Kurekebisha Kiolezo
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Amri za Faili na Saraka

### Muundo wa Mradi
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Muundo wa Matokeo

### Matokeo ya JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Matokeo ya Jedwali
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Mchanganyiko ya Amri Zilizopo

### Skripti ya Ukaguzi wa Afya
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Uthibitishaji wa Usambazaji
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Ulinganifu wa Mazingira
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skripti ya Usafishaji wa Rasilimali
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Vigezo vya Mazingira

### Vigezo vya Mazingira Vinavyotumika Mara nyingi
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

## 🚨 Amri za Dharura

### Marekebisho ya Haraka
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

### Amri za Urejeshaji
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Vidokezo vya Mtaalamu

### Majina Mbadala kwa Mchakato wa Haraka
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Njia za Mkato za Kazi
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

## 📖 Msaada na Nyaraka

### Kupata Msaada
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

### Viungo vya Nyaraka
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Kidokezo**: Fanya alama ya kadi hii ya amri na tumia `Ctrl+F` kupata haraka amri unazozihitaji!

---

**Uchaguzi wa Usogezaji**
- **Somo lililopita**: [Uhakiki wa Awali](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Somo lijalo**: [Orodha ya Maneno](glossary.md)

---

> **💡 Unataka msaada wa amri za Azure katika mhariri wako?** Sakinisha [Ujuzi wa Wakala wa Microsoft Azure](https://skills.sh/microsoft/github-copilot-for-azure) na `npx skills add microsoft/github-copilot-for-azure` — ujuzi 37 kwa AI, Foundry, usambazaji, uchunguzi, na zaidi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->