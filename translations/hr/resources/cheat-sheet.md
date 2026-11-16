# Prečac naredbi - Osnovne AZD naredbe

**Brzi referentni vodič za sve poglavlja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Brzi početak**: [Poglavlje 1: Osnove i brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI naredbe**: [Poglavlje 2: AI-prvi razvoj](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredno**: [Poglavlje 4: Infrastruktura kao kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ovaj detaljan prečac pruža brzi referentni vodič za najčešće korištene Azure Developer CLI naredbe, organizirane po kategorijama s praktičnim primjerima. Savršen za brze preglede tijekom razvoja, otklanjanja poteškoća i svakodnevnog rada s azd projektima.

## Ciljevi učenja

Korištenjem ovog prečaca, moći ćete:
- Imati trenutni pristup osnovnim Azure Developer CLI naredbama i sintaksi
- Razumjeti organizaciju naredbi prema funkcionalnim kategorijama i slučajevima uporabe
- Referencirati praktične primjere za uobičajene scenarije razvoja i implementacije
- Pristupiti naredbama za otklanjanje poteškoća za brzo rješavanje problema
- Pronaći napredne opcije konfiguracije i prilagodbe učinkovito
- Locirati naredbe za upravljanje okruženjima i radnim tijekovima za više okruženja

## Ishodi učenja

Redovitim korištenjem ovog prečaca, moći ćete:
- Izvoditi azd naredbe samouvjereno bez potrebe za potpuni dokumentacijom
- Brzo rješavati uobičajene probleme korištenjem odgovarajućih dijagnostičkih naredbi
- Učinkovito upravljati višestrukim okruženjima i scenarijima implementacije
- Primijeniti napredne azd značajke i konfiguracijske opcije prema potrebi
- Rješavati probleme s implementacijom pomoću sustavnih nizova naredbi
- Optimizirati radne tokove kroz učinkovitu uporabu azd prečaca i opcija

## Početne naredbe

### Autentikacija
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

### Inicijalizacija projekta
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

## Osnovne naredbe implementacije

### Cijeli tijek implementacije
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

### Samo infrastruktura
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Samo aplikacija
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Izgradnja i pakiranje
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

> **`azd restore`** preuzima ovisnosti vaše aplikacije (npm, pip, NuGet, Maven itd.). Pokreće se automatski tijekom `azd package` i `azd deploy`, pa ga rijetko pozivate izravno — pokrenite ga ručno za prethodno dohvaćanje ovisnosti (na primjer, za zagrijavanje CI cachea ili naknadni rad offline).

> **`azd package`** priprema spremni artefakt za implementaciju bez implementacije aplikacijskog servisa. Ponašanje ovisi o jeziku i hostu: pakiranje kontejnera može koristiti Azure udaljene izgradnje i objavljivati slike u registar, pa nije nužno offline ili bez zapisivanja u Azure. `azd deploy` može automatski pakirati; koristite zaseban korak pakiranja kada vam treba artefakt ili provjera izgradnje.


## 🌍 Upravljanje okolinom

### Operacije okoline
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

### Varijable okoline
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

Datoteke okoline su običan tekst. Nemojte tretirati `azd env set` kao spremište tajni; koristite reference na Key Vault ili upravljane identitete prema potrebi.

## ⚙️ Konfiguracijske naredbe

### Globalna konfiguracija
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

### Konfiguracija projekta
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Nadzor i dijagnostika

### Nadzorna ploča
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

Application Insights mora biti konfiguriran putem predloška. AZD-ova opcija Live Metrics trenutno nije podržana za Python aplikacije; koristite pregled, zapise ili dokumentirani trag radnog tijeka uzorka.

### Pregledavanje spremničkih zapisa
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Upiti u Log Analytics-u
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Održavanje

### Čišćenje
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

### Ažuriranja
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Napredne naredbe

### Pipeline i CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Upravljanje infrastrukturom
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

### Informacije o projektu
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI i proširenja

### AZD proširenja

AI CLI referenca pregledana 2026-11-04: `azd 1.37.2`, agenti `1.0.0-beta.23`, evaluacije `1.0.0-beta.2`. Koristite `azd >= 1.37.0` za spojeni tijek rada; nadogradite osnovni CLI prije nekompatibilnih proširenja.

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

### AI Agent naredbe
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

`--template`/`-t` zamjenjuje zastarjelo `--manifest`/`-m` pravopis; potrebna je migracija za naslijeđene manifeste. Trenutno nema agent-init `--host containerapp` opcije. Pregledi upravljani po naravi, glasovni i dugotrajni zahtijevaju zasebno uključivanje u školjku/CI okruženje; pogledajte [AI CLI referencu](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### AI evaluacije i optimizacija
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

Agenti beta.22 zamijenili su stare evalucijske naredbe `azd ai eval` iz `azure.ai.evaluations`. Nova konfiguracija evaluacije koristi camelCase ključeve. Optimizacija `--config` zahtijeva samostalni API zahtjev za optimizaciju, **ne** naslijeđene `eval.yaml` ili nove `azure.eval.yaml`; koristite `--eval`/`--eval-config` za ponovnu uporabu evaluacije. Pogledajte [postavljanje evaluacije](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) i [migraciju optimizacije](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP poslužitelj (Alfa)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generiranje infrastrukture
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Brzi radni tokovi

### Radni tok razvoja
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

### Radni tok za više okruženja
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

### Radni tok za otklanjanje poteškoća
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

## 🔍 Naredbe za ispravljanje pogrešaka

### Informacije o ispravljanju pogrešaka
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

### Ispravljanje predložaka
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Naredbe za datoteke i direktorije

### Struktura projekta
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatiranje izlaza

### JSON izlaz
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tablični izlaz
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Uobičajene kombinacije naredbi

### Skripta za provjeru zdravlja
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validacija implementacije
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Usporedba okoline
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skripta za čišćenje resursa
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Varijable okoline

### Uobičajene varijable okoline
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

## 🚨 Hitne naredbe

### Brza rješenja
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

### Naredbe za oporavak
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profesionalni savjeti

### Alias naredbe za brži radni tok
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Prečaci funkcija
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

## 📖 Pomoć i dokumentacija

### Dobivanje pomoći
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

### Linkovi na dokumentaciju
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Savjet**: Dodajte ovaj prečac u favorite i koristite `Ctrl+F` za brzo pronalaženje potrebnih naredbi!

---

**Navigacija**
- **Prethodna lekcija**: [Preflight provjere](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Sljedeća lekcija**: [Rječnik](glossary.md)

---

> **💡 Želite pomoć s Azure naredbama u vašem uređivaču?** Instalirajte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) s `npx skills add microsoft/github-copilot-for-azure` — 37 vještina za AI, Foundry, implementaciju, dijagnostiku i još mnogo toga.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->