# Käsurea Pääsukomplekt - Olulised AZD Käsud

**Kiirviide Kõikide Peatükkide Jaoks**
- **📚 Kursuse Avaleht**: [AZD Algajatele](../README.md)
- **📖 Kiire Algus**: [1. Peatükk: Alused & Kiire Algus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Tehisintellekti Käsud**: [2. Peatükk: AI-Esmane Arendus](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Täiustatud**: [4. Peatükk: Infrastruktuur Koodi Kujul](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Sissejuhatus

See põhjalik käsurea pääsukomplekt pakub kiiret viidet kõige sagedamini kasutatavatele Azure Developer CLI käskudele, kategooriatesse organiseerituna praktiliste näidetega. Ideaalne kiireks viitamiseks arendamise, tõrkeotsingu ja igapäevaste tööde jooksul azd projektidega.

## Õpieesmärgid

Selle käsurea pääsukomplekti kasutades saad:
- Kohese juurdepääsu olulistele Azure Developer CLI käskudele ja süntaksile
- Mõista käskude organiseerimist funktsionaalsete kategooriate ja kasutusjuhtude järgi
- Viidata praktilistele näidetele tavaliste arendus- ja kasutuselevõtustsenaariumite jaoks
- Juurdepääsu tõrkeotsingu käskudele kiireks probleemide lahendamiseks
- Leidma tõhusalt täiustatud seadistus- ja kohandamisvalikuid
- Asukohad keskkonna haldamise ja mitmekeskkonnatöövoo käskude jaoks

## Õpitulemused

Selle pääsukomplekti regulaarsel kasutamisel suudad:
- Täita azd käske enesekindlalt ilma täielikku dokumentatsiooni viitamata
- Kiiresti lahendada tavalisi probleeme sobivate diagnostikakäskude abil
- Tõhusalt hallata mitut keskkonda ja kasutuselevõtustsenaariume
- Vajadusel rakendada täiustatud azd funktsioone ja seadistusvalikuid
- Tõrkeotsida kasutuselevõtuprobleeme süsteemsete käsujadade abil
- Optimeerida töövooge azd otseteede ja valikute tõhusa kasutamisega

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

### Projekti algatamine
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

## Põhilised kasutuselevõtu käsud

### Täielik kasutuselevõtu töövoog
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

### Koostamine ja paketistamine
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

> **`azd restore`** laadib alla sinu rakenduse sõltuvused (npm, pip, NuGet, Maven jne). See käivitub automaatselt `azd package` ja `azd deploy` ajal, seega kutsutakse seda harva otseselt – käivita see käsitsi, et eelnevalt sõltuvused üles laadida (näiteks CI vahemälu soojendamiseks või hiljem võrguühenduseta tööks).

> **`azd package`** valmistab ette kasutuselevõtmiseks sobiva artefakti ilma rakenduseteenust käivitamata. Käitumine sõltub keelest ja hostist: konteineri pakkimine võib kasutada Azure'i kaugkoostamist ja avaldada pilte registrisse, seega ei ole see tingimata võrguühenduseta ega Azure'i kirjutusvaba. `azd deploy` saab pakkida automaatselt; kasuta eraldi paketistamise sammu, kui vajad artefakti või koostamise kontrolli.


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

Keskkonna failid on tavatekstina. Ära käsitle `azd env set` salajase hoiuna; kasuta vastavalt Key Vault viiteid või hallatud identiteeti.

## ⚙️ Seadistuskäsud

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

### Jälgimise armatuurlaud
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

Application Insights peab olema malliga seadistatud. AZD Live Metrics valikut ei toetata hetkel Python rakenduste puhul; kasuta selle asemel üldvaadet, logisid või näite dokumenteeritud jälgimistöövoogu.

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

## 🛠️ Hoolduskäsud

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

### Infrastruktuuri haldamine
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

Foundry GA viite uuendus 2026-11-09: `microsoft.foundry` pakk 1.0, kuulutati välja [5. november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kasuta `azd >= 1.37.0`; komponendid on iseseisvalt versioonitud ja valikulised eelvaate funktsioonid säilitavad oma staatuse.

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

Komplekt ei sisalda hindamisi, andmesettekandeid, peenhäälestust ega kohandatud mudeleid. Üksikute põhilaienete installimine on jätkuvalt toetatud. Jälgi [GA hostitud agentide samm-sammult juhendit](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) töötava näite jaoks Python 3.13+, praeguse uv, õigustega ja mudelilimiidiga.

### AI Agendi käsud
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

`--template`/`-t` asendab aegunud `--manifest`/`-m` kirjaviisi; vanemaid manuseid tuleb migreerida. Praegu puudub agent-init `--host containerapp` valik. Hallatud sisu, hääl ja pikaajaliste eelvaadete jaoks on vajalikud iseseisvad shell/CI keskkonna nõusolekud; vaata [AI CLI viidet](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Kohalik testimine kasutab endiselt Azure mudeli kasutuselevõtteid ja tekitab kulusid. Puhastamiseks kustutab `azd down` värskelt loodud Foundry projekti ressursigrupi, kuid jätab alles taaskasutatud projekti ressursid; eemalda eraldi ainult soovimatud ressursid, mis sulle kuuluvad.

### AI Hindamised ja optimeerimine
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

Agendid beta.22 asendasid vanemad hindamiskäsud `azd ai eval` abil `azure.ai.evaluations`. Uus hindamiskonfiguratsioon kasutab camelCase võtmeid. Optimeerimine `--config` võtab vastu iseseisva optimeerimis-API päringu, **mitte** vanemat `eval.yaml` ega uut `azure.eval.yaml`; kasuta `--eval`/`--eval-config` hindamise taaskasutamiseks. Vaata [hindamise seadistust](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ja [optimeerimise migratsiooni](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Käivitaja fragment ei ole täielik töövoog. Kinnita üle vaadatud hindamiskonfiguratsioon ja mitte-saladusneed varad, anna andmestiku/hindaja/mudeli ligipääs ja kasuta iga etapi jaoks keskkonda. Vaata [autentitud CI/CD näidet](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Server (Alfa)
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

### Arendustöövoog
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

### Mitmekeskkonnatöövoog
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

## 🔍 Silumis- ehk debug käsud

### Silumise info
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

### Malli silumine
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Faili ja kataloogi käsud

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

## 🔧 Levinud käsukombinatsioonid

### Tervisekontrolli skript
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Kasutuselevõtu valideerimine
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

### Ressursside puhastus-skript
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Keskkonnamuutujad

### Levinud keskkonnamuutujad
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

### Kiired parandused
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

### Taastamise käsud
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

### Aliased kiiremaks töövooguks
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

**Nõuanne**: Lisa see käsurea pääsukomplekt järjehoidjasse ja kasuta `Ctrl+F`, et kiiresti leida vajalikud käsud!

---

**Navigeerimine**
- **Eelmine Õppetund**: [Preflight Kontrollid](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Järgmine Õppetund**: [Sõnastik](glossary.md)

---

> **💡 Tahad Azure käsuabi oma redaktoris?** Paigalda [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) koos `npx skills add microsoft/github-copilot-for-azure` — 37 oskust AI, Foundry, kasutuselevõtu, diagnostika ja muu jaoks.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->