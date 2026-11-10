# Käskude abivihik - Olulised AZD käsud

**Kiire viide kõigile peatükkidele**
- **📚 Kursuse avaleht**: [AZD algajatele](../README.md)
- **📖 Kiire algus**: [1. peatükk: Alus ja kiire algus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI käsud**: [2. peatükk: AI-esmane arendus](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Täiustatud**: [4. peatükk: Infrastruktuur koodina](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Sissejuhatus

See põhjalik abivihik pakub kiiret viidet kõige sagedamini kasutatavatele Azure Developer CLI käskudele, korraldatud kategooriate kaupa praktiliste näidetega. Täiuslik kiireks otsimiseks arenduse, tõrkeotsingu ja igapäevaste azd projektide toimingute ajal.

## Õpieesmärgid

Selle abivihiku kasutamisel:
- Saad kohe ligipääsu olulistele Azure Developer CLI käskudele ja süntaksile
- Saad aru käskude korraldusest funktsionaalsete kategooriate ja kasutusjuhtumite järgi
- Viitad praktilistele näidetele tavapäraste arendus- ja juurutusstsenaariumite jaoks
- Kasutad tõrkeotsingu käske kiireks probleemide lahendamiseks
- Leiab tõhusalt täiustatud seadistuse ja kohandamise valikud
- Leiab keskkonna haldamise ja mitmekeskkondliku töövoo käsud

## Õpitulemused

Selle abivihiku regulaarsel kasutamisel oskad:
- Käitada azd käske kindlalt, ilma kogu dokumentatsiooni vaatamata
- Lahendada kiiresti tavalisi probleeme õige diagnostika käsu abil
- Hallata tõhusalt mitut keskkonda ja juurutusstsenaariume
- Rakendada vajaduse korral täiustatud azd funktsioone ja seadistusvalikuid
- Tõrkeotsingu juurutusprobleeme süstemaatiliste käskude järjestustega
- Optimeerida töövooge azd efektiivsete otseteede ja valikute kasutamisega

## Alustavad käsud

### Autentimine
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

### Projekti initsialiseerimine
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

## Tuumjuurutuse käsud

### Täielik juurutustöövoog
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

### Ainult infrastruktuur
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Ainult rakendus
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Koostamine ja pakkimine
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

> **`azd restore`** laadib alla sinu rakenduse sõltuvused (npm, pip, NuGet, Maven jne). See käib automaatselt uuendamise ajal `azd package` ja `azd deploy`, seega harva kutsud seda otse — käivita käsitsi sõltuvuste eelallalaadimiseks (näiteks CI vahemälu soojendamiseks või hilisemaks võrguvabaks tööks).

> **`azd package`** valmistab ette juurutatava artefakti ilma rakendusteenust juurutamata. Käitumine sõltub keelest ja hostist: konteineri pakkimine võib kasutada Azure kaugkoostamist ning avaldada pildid registrisse, seega see ei pruugi olla võrguvaba ega kirjutustest vaba. `azd deploy` saab automaatselt pakkida; eraldi paketietapp on vajalik artefakti või koostamise kontrolli jaoks.


## 🌍 Keskkonna haldamine

### Keskkonna toimingud
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

### Keskkonnamuutujad
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

Keskkonna failid on lihttekstis. Ärge käsitlege `azd env set` saladuste hoidla; kasutage vajadusel Key Vault viiteid või hallatud identiteeti.

## ⚙️ Seadistuse käsud

### Globaalne seadistus
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

### Projekti seadistus
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Jälgimine ja diagnostika

### Jälgimisdashboard
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

Application Insights peab olema malli poolt seadistatud. AZD Live Metrics valikut ei toetata hetkel Python rakenduste jaoks; küsi ülevaadet, logisid või proovimärgendatud jälgimistöövoogu.

### Konteineri logide vaatamine
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Logianalüüsi päringud
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Hooldus käsud

### Puhastamine
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

### Uuendused
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Täiustatud käsud

### Torujuhtme ja CI/CD käsud
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastruktuuri haldus
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

### Projekti info
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI ja laienduste käsud

### AZD laiendused

AI CLI viide ülevaatatud 2026-11-04: `azd 1.37.2`, agendid `1.0.0-beta.23`, hindamised `1.0.0-beta.2`. Kasuta `azd >= 1.37.0` kombineeritud töövoolu jaoks; täienda esmalt põhilist CLI-d enne ühilduvuse puudumisega laiendusi.

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

### AI agendi käsud
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

`--template`/`-t` asendab vananenud `--manifest`/`-m` õigekirja; vanad manifestid vajavad migratsiooni. Praegu puudub agent-init `--host containerapp` võimalus. Hallatud-harzi, hääl- ja pikaajalise eelvaate jaoks vajalikud sõltumatud kest-/CI keskkonna opt-inid; vaata [AI CLI viidet](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### AI hindamised ja optimeerimine
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

Agendid beta.22 asendasid vanad hindamiskäsud `azd ai eval`-ga `azure.ai.evaluations`-st. Uus hindamiskonfiguratsioon kasutab camelCase võtmeid. Optimeerimine `--config` võtab eraldi optimeerimise API päringu, **mitte** vana `eval.yaml` ega uut `azure.eval.yaml`; kasutage `--eval`/`--eval-config` hindamise korduskasutuseks. Vaata [hindamiskonfiguratsiooni](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ja [optimeerimise migratsiooni](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Infrastruktuuri genereerimine
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Kiired töövood

### Arenduse töövoog
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

### Mitmekeskkondlik töövoog
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

### Tõrkeotsingu töövoog
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

## 🔍 Silumine käsud

### Silumisinfo
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

### Mallide silumine
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Faili- ja kataloogikäsklused

### Projekti struktuur
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Väljundi vormindamine

### JSON väljund
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeli väljund
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Tavalised käskude kombinatsioonid

### Tervisekontrolli skript
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Juurutuse valideerimine
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Keskkondade võrdlus
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Ressursside puhastamise skript
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Keskkonnamuutujad

### Tavapärased keskkonnamuutujad
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

## 🚨 Hädaolukorra käsud

### Kiireparandused
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

### Taastamiskäsud
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Pro näpunäited

### Kiiremaks töövooguks aliased
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktsiooni otseteed
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

## 📖 Abi ja dokumentatsioon

### Abi saamine
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

### Dokumentatsiooni lingid
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Nipp**: Seo see abivihik järjehoidjaks ja kasuta `Ctrl+F`, et kiiresti leida vajalikke käske!

---

**Navigatsioon**
- **Eelmine tund**: [Ettevalmistuskontrollid](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Järgmine tund**: [Terminid](glossary.md)

---

> **💡 Tahad Azure käsuabi oma tekstiredaktoris?** Paigalda [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) koos `npx skills add microsoft/github-copilot-for-azure` — 37 oskust AI, Foundry, juurutuse, diagnostika ja muu jaoks.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->