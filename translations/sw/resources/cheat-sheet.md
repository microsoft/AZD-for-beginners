# Kivinjari cha Amri - Amri Muhimu za AZD

**Marejeleo ya Haraka kwa Sura Zote**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../README.md)
- **📖 Anza Haraka**: [Sura ya 1: Msingi & Anza Haraka](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Amri za AI**: [Sura ya 2: Maendeleo Ya Kwanza AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Mtaalam**: [Sura ya 4: Miundombinu Kama Msimbo](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Utangulizi

Kivinjari hiki kamili cha amri kinatoa marejeleo ya haraka kwa amri za CLI za Azure Developer zinazotumiwa mara nyingi, zilizopangwa kwa makundi pamoja na mifano ya vitendo. Ni bora kwa kutafuta haraka wakati wa maendeleo, utatuzi wa matatizo, na shughuli za kila siku na miradi ya azd.

## Malengo ya Kujifunza

Kwa kutumia kivinjari hiki, utakuwa na uwezo wa:
- Kupata mara moja amri muhimu za Azure Developer CLI na muundo wake
- Kuelewa upangaji wa amri kwa makundi ya kazi na matumizi
- Kurejelea mifano ya vitendo kwa hali za kawaida za maendeleo na uenezaji
- Kupata amri za kutatua matatizo kwa haraka
- Kupata kwa ufanisi chaguzi za usanidi wa juu na ubinafsishaji
- Kupata amri za usimamizi wa mazingira na mtiririko wa kazi wa mazingira mengi

## Matokeo ya Kujifunza

Kwa marejeleo ya mara kwa mara ya kivinjari hiki, utaweza:
- Kutekeleza amri za azd kwa ujasiri bila kurejelea nyaraka kamili
- Kutatua matatizo ya kawaida haraka kwa kutumia amri sahihi za uchunguzi
- Kusimamia mazingira mengi na hali za uenezaji kwa ufanisi
- Kutumia vipengele vya juu vya azd na chaguzi za usanidi kama inavyohitajika
- Kutatua matatizo ya uzalishaji kwa kutumia mfululizo wa amri kwa utaratibu
- Kuboresha mtiririko wa kazi kwa kutumia njia za mkato na chaguzi za azd kwa ufanisi

## Amri za Kuanzia

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

### Mwanzo wa Mradi
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

## Amri Muhimu za Uenezaji

### Mtiririko Kamili wa Uenezaji
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

> **`azd restore`** hupakua utegemezi wa programu yako (npm, pip, NuGet, Maven, n.k.). Inaendesha moja kwa moja wakati wa `azd package` na `azd deploy`, kwa hiyo mara chache huipigia simu moja kwa moja—itelekeza binafsi ili kupakia utegemezi mapema (kwa mfano, kuoanisha cache ya CI au kufanya kazi bila mtandao baadaye).

> **`azd package`** huandaa kifurushi cha kuenezwa bila kueneza huduma ya programu. Tabia hutegemea lugha na mwenyeji: kufunga kontena kunaweza kutumia ujenzi wa mbali wa Azure na kuchapisha picha kwenye rejista, hivyo si lazima iwe offline au isiyo na maandishi ya Azure. `azd deploy` inaweza kufunga moja kwa moja; tumia hatua tofauti ya kufunga wakati unahitaji kifurushi au ukaguzi wa ujenzi.


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

### Mabadiliko ya Mazingira
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

Faili za mazingira ni maandishi wazi. Usihesabu `azd env set` kama hifadhi ya siri; tumia rejeleo za Key Vault au utambulisho ulioendeshwa kama inavyofaa.

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

## 📊 Ufuatiliaji na Utambuzi

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

Application Insights lazima iwe imesanidiwa na kiolezo. Chaguo la Live Metrics la AZD halijaungwa mkono kwa sasa kwa programu za Python; tumia muhtasari, kumbukumbu, au mtiririko wa kutambua wa sampuli uliodhibitishwa badala yake.

### Kutazama Kumbukumbu za Kontena
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Maswali ya Uchambuzi wa Kumbukumbu
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

## 🔧 Amri za Kitaalamu

### Mlolongo wa Mabomba na CI/CD
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

## 🤖 AI & Amri za Virutubisho

### Virutubisho vya AZD

Marejeleo ya Foundry GA yameboreshwa 2026-11-09: `microsoft.foundry` kifurushi 1.0, kilitangazwa [Novemba 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Tumia `azd >= 1.37.0`; vipengele hupewa toleo tofauti peke yao na vipengele vya utangulizi wa hiari vinaendelea kuwa na hadhi zao.

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

Kifurushi hakijajumuisha tathmini, seti za data, uboreshaji, au mifano maalum. Kusakinisha virutubisho vya msingi kwa mtu binafsi bado kunaungwa mkono. Fuata [maelekezo ya wakala wa GA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) kwa sampuli inayoweza kutekelezwa na Python 3.13+, uv wa sasa, ruhusa, na kikomo cha mfano.

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

`--template`/`-t` hudhoofisha tahajia ya zamani ya `--manifest`/`-m`; faili za kale zina hitaji kuhamishwa. Hakuna chaguo la sasa la wakala-init `--host containerapp`. Maonekano yaliyodhibitiwa, sauti, na marejeleo marefu yanahitaji kujisajili kwa mazingira ya shell/CI peke yao; angalia [marejeleo ya AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Jaribio la ndani bado linatumia uenezaji wa mfano wa Azure na husababisha ada. Kwa usafishaji, `azd down` hurudisha kundi la rasilimali la mradi mpya wa Foundry, lakini linaliacha rasilimali zilizo tumika tena; toa tu rasilimali usizotaka uliweke umebia kwa njia tofauti.

### Tathmini na Uboreshaji wa AI
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

Wakala beta.22 walibadilisha amri za tathmini za zamani na `azd ai eval` kutoka `azure.ai.evaluations`. Usanidi mpya wa tathmini hutumia funguo za camelCase. Uboreshaji `--config` unahitaji ombi la API la uboreshaji mtawaliwa, **si** zamani `eval.yaml` au mpya `azure.eval.yaml`; tumia `--eval`/`--eval-config` kwa kutumia tena tathmini. Angalia [usanidi wa tathmini](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) na [uhamisho wa uboreshaji](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Kipande cha mchezaji si mtiririko kamili wa kazi. Wahakiki wanaangalia usanidi wa tathmini na mali zisizo za siri, wanatoa ruhusa ya seti ya data/mtathmini/mfano, na hutumia mazingira kwa kila hatua. Angalia [mfano wa CI/CD ulio thibitishwa](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### Server ya MCP (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Uzalishaji wa Miundombinu
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Mitiririko ya Haraka

### Mtiririko wa Maendeleo
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

### Mtiririko wa Mazingira Mengi
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

### Mtiririko wa Utatuzi wa Matatizo
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

## 🔍 Amri za Utatuzi

### Taarifa za Utatuzi
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

### Utatuzi wa Violezo
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

## 🔧 Mchanganyiko wa Amri Zilizopo

### Skripti ya Ukaguzi wa Afya
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Uthibitishaji wa Uenezaji
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Ulinganisho wa Mazingira
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

## 📝 Mabadiliko ya Mazingira

### Mabadiliko ya Mazingira ya Kawaida
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

### Amri za Urekebishaji
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

### Majina ya Kuingiza kwa Mtiririko Haraka
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

**Kidokezo**: Weka alama ya kivinjari hiki na tumia `Ctrl+F` ili kupata amri unazohitaji kwa haraka!

---

**Uelekezaji**
- **Somo lililopita**: [Tathmini za Awali](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Somo lijalo**: [Kamusi](glossary.md)

---

> **💡 Unataka msaada wa amri za Azure katika mhariri wako?** Sakinisha [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) na `npx skills add microsoft/github-copilot-for-azure` — ujuzi 37 kwa AI, Foundry, uenezaji, utambuzi, na zaidi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->