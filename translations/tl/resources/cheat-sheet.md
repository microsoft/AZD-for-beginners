# Cheat Sheet ng Command - Mahahalagang Utos ng AZD

**Mabilisang Sanggunian para sa Lahat ng Kabanata**
- **📚 Home ng Kurso**: [AZD For Beginners](../README.md)
- **📖 Mabilisang Pagsisimula**: [Kabanata 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Mga Utos ng AI**: [Kabanata 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Kabanata 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Panimula

Ang komprehensibong cheat sheet na ito ay nagbibigay ng mabilisang sanggunian para sa mga pinaka-karaniwang ginagamit na Azure Developer CLI na utos, na inayos ayon sa kategorya na may mga praktikal na halimbawa. Perpekto para sa mabilisang pagsilip habang nagde-develop, nag-aayos ng problema, at sa pang-araw-araw na operasyon sa mga azd na proyekto.

## Mga Layunin sa Pag-aaral

Sa paggamit ng cheat sheet na ito, magagawa mong:
- Magkaroon ng agarang access sa mahahalagang Azure Developer CLI na utos at syntax
- Maunawaan ang organisasyon ng mga utos ayon sa functional na mga kategorya at mga gamit
- Mag-refer sa mga praktikal na halimbawa para sa mga karaniwang senaryo ng pag-unlad at deployment
- Mag-access ng mga utos para sa pag-aayos ng problema para sa mabilisang resolusyon ng isyu
- Maghanap ng mga advanced na opsyon sa konfigurasyon at customisasyon nang epektibo
- Matukoy ang mga utos para sa pamamahala ng kapaligiran at workflow para sa maramihang mga kapaligiran

## Mga Kinalabasan ng Pagkatuto

Sa regular na paggamit ng cheat sheet na ito, magagawa mong:
- Patakbuhin ang mga azd na utos nang may kumpiyansa nang hindi kinakailangang tingnan ang buong dokumentasyon
- Mabilisang ayusin ang mga karaniwang problema gamit ang tamang mga diagnostic na utos
- Epektibong pamahalaan ang maramihang mga kapaligiran at senaryo ng deployment
- Ilapat ang mga advanced na feature at opsyon sa konfigurasyon ng azd kung kinakailangan
- Ayusin ang mga problema sa deployment gamit ang sistematikong mga sunod-sunod na utos
- Optimizahin ang mga workflow sa pamamagitan ng epektibong paggamit ng mga shortcut at opsyon ng azd

## Mga Utos para sa Pagsisimula

### Pagpapatunay ng Katauhan
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

### Pag-umpisa ng Proyekto
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

## Pangunahing Mga Utos sa Deployment

### Kumpletong Workflow ng Deployment
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

### Para lamang sa Infrastructure
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Para lamang sa Aplikasyon
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Build at Package
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

> **`azd restore`** kinukuha ang mga dependencies ng iyong app (npm, pip, NuGet, Maven, atbp.). Awtomatikong pinapatakbo ito habang `azd package` at `azd deploy`, kaya bihira mo itong tawagin nang direkta—patakbuhin ito nang manu-mano upang maunang makuha ang dependencies (halimbawa, para painitin ang cache ng CI o magtrabaho offline pagkatapos).

> **`azd package`** naghahanda ng deployable artifact nang hindi dinideploy ang application service. Ang kilos nito ay depende sa wika at host: ang packaging ng container ay maaaring gumamit ng Azure remote builds at mag-publish ng mga imahe sa isang registry, kaya hindi ito palaging offline o walang pagsusulat sa Azure. Maaari awtomatikong mag-package ang `azd deploy`; gumamit ng hiwalay na hakbang sa package kapag kailangan mo ng artifact o pag-check sa build.


## 🌍 Pamamahala ng Kapaligiran

### Mga Operasyon sa Kapaligiran
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

### Mga Variable ng Kapaligiran
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

Ang mga file ng kapaligiran ay bersyon ng plain text. Huwag ituring ang `azd env set` bilang lihim na imbakan; gamitin ang mga Key Vault reference o managed identity ayon sa nararapat.

## ⚙️ Mga Utos sa Konfigurasyon

### Pangglobong Konfigurasyon
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

### Konfigurasyon ng Proyekto
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Pagsubaybay at Diagnostiko

### Dashboard sa Pagsubaybay
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

Dapat ayusin ng template ang Application Insights. Ang Live Metrics na opsyon ng AZD ay hindi pa suportado para sa mga aplikasyon ng Python; gamitin ang overview, logs, o ang dokumentadong tracing workflow ng sample bilang kapalit.

### Pagtingin sa Mga Log ng Container
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Mga Query sa Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Mga Utos sa Pagpapanatili

### Paglilinis
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

### Mga Update
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Advanced na Mga Utos

### Pipeline at CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Pamamahala ng Infrastructure
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

### Impormasyon ng Proyekto
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Mga Utos ng AI & mga Extension

### Mga Extension ng AZD

Nai-update ang reference ng Foundry GA noong 2026-11-09: `microsoft.foundry` bundle 1.0, inianunsyo noong [Nobyembre 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Gamitin ang `azd >= 1.37.0`; ang mga bahagi ay independiyenteng may sariling bersyon at ang mga opsyonal na preview na feature ay nananatili ang kani-kanilang status.

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

Hindi kasama sa bundle ang evaluations, datasets, fine-tuning, o mga custom na modelo. Ang pag-install ng mga indibidwal na pangunahing extension ay nananatiling suportado. Sundin ang [GA hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) para sa isang runnable na sample na may Python 3.13+, kasalukuyang uv, mga permiso, at quota ng modelo.

### Mga Utos ng AI Agent
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

`--template`/`-t` ay pumapalit sa deprecated na `--manifest`/`-m` na baybay; kailangan ng migration para sa mga legacy manifests. Walang kasalukuyang agent-init `--host containerapp` na opsyon. Managed-harness, voice, at long-running previews ay nangangailangan ng independiyenteng shell/CI environment opt-ins; tingnan ang [AI CLI reference](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Ang lokal na pagsubok ay gumagamit pa rin ng Azure model deployments at may kasamang singil. Para sa paglilinis, ang `azd down` ay nagtatanggal ng bagong likhang Foundry project resource group, ngunit iniiwan ang mga reused-project resources na nakaayos; alisin lamang ang hindi gustong resources na pag-aari mo nang hiwalay.

### Pagsusuri at Pag-optimize ng AI
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

Ang Agents beta.22 ay pinalitan ang legacy evaluation commands gamit ang `azd ai eval` mula sa `azure.ai.evaluations`. Ang bagong evaluation configuration ay gumagamit ng camelCase na mga susi. Ang optimization `--config` ay tumatanggap ng standalone optimization API request, **hindi** legacy `eval.yaml` o bagong `azure.eval.yaml`; gamitin ang `--eval`/`--eval-config` para sa pagsusulit na muling gamit. Tingnan ang [evaluation setup](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) at [optimization migration](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Ang runner fragment ay hindi kumpletong workflow. I-commit ang ni-review na evaluation configuration at mga nonsecret na asset, magbigay ng access sa dataset/evaluator/model, at gamitin ang isang environment para sa bawat yugto. Tingnan ang [authenticated CI/CD example](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Pagbuo ng Imprastruktura
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Mabilis na Mga Workflow

### Development Workflow
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

### Multi-Environment Workflow
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

### Troubleshooting Workflow
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

## 🔍 Mga Utos para sa Pag-debug

### Impormasyon sa Debug
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

### Pag-debug sa Template
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Mga Utos para sa File at Direktoryo

### Estruktura ng Proyekto
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Format ng Output

### JSON Output
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Table Output
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Karaniwang Kombinasyon ng Mga Utos

### Script para sa Health Check
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Pagpapatunay sa Deployment
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Paghahambing ng Environment
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Script para sa Paglilinis ng Resource
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Mga Environment Variable

### Karaniwang Mga Environment Variable
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

## 🚨 Mga Pang-emergensyang Utos

### Mabilisang Ayos
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

### Mga Utos sa Pag-recover
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Mga Pro Tip

### Mga Alias para sa Mas Mabilis na Workflow
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Mga Shortcut sa Function
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

## 📖 Tulong at Dokumentasyon

### Paano Humingi ng Tulong
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

### Mga Link sa Dokumentasyon
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tip**: I-bookmark ang cheat sheet na ito at gamitin ang `Ctrl+F` para mabilis na mahanap ang mga utos na kailangan mo!

---

**Pag-navigate**
- **Nakaraang Aralin**: [Preflight Checks](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Susunod na Aralin**: [Glossary](glossary.md)

---

> **💡 Gusto mo ba ng tulong sa Azure command sa iyong editor?** I-install ang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) gamit ang `npx skills add microsoft/github-copilot-for-azure` — 37 na kakayahan para sa AI, Foundry, deployment, diagnostics, at iba pa.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->