# Kratka zloženka ukazov - Osnovni AZD ukazi

**Hiter pregled za vse poglavja**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Hiter začetek**: [Poglavje 1: Osnove in hiter začetek](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI ukazi**: [Poglavje 2: AI-prvi razvoj](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredno**: [Poglavje 4: Infrastruktura kot koda](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ta obsežna zloženka ukazov nudi hiter pregled najpogosteje uporabljenih ukazov Azure Developer CLI, razvrščenih po kategorijah z uporabnimi primeri. Idealno za hitro iskanje med razvojem, odpravljanjem težav in vsakodnevnimi opravili z azd projekti.

## Cilji učenja

Z uporabo te zloženke boste:
- Imeli takojšen dostop do osnovnih ukazov Azure Developer CLI in sintakse
- Razumeli organizacijo ukazov po funkcionalnih kategorijah in primerih uporabe
- Imeli praktične primere za pogoste scenarije razvoja in nameščanja
- Dostopali do ukazov za odpravljanje težav za hitro rešitev problemov
- Učinkovito našli napredne nastavitve in možnosti prilagajanja
- Lokacijo ukazov za upravljanje okolja in delovne procese več okolj

## Pričakovani rezultati učenja

Z redno uporabo te zloženke boste sposobni:
- Zaupljivo izvajati azd ukaze brez sklicevanja na celotno dokumentacijo
- Hitro reševati pogoste težave z uporabo ustreznih diagnostičnih ukazov
- Učinkovito upravljati več okolij in scenarijev nameščanja
- Uporabljati napredne funkcije azd in nastavitvene možnosti po potrebi
- Odpravljati težave pri nameščanju z uporabo sistematičnih zaporedij ukazov
- Optimizirati delovne procese z učinkovito uporabo bližnjic in možnosti azd

## Začetni ukazi

### Avtorizacija
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

### Inicializacija projekta
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

## Osnovni ukazi za nameščanje

### Celoten delovni proces nameščanja
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

### Gradnja in pakiranje
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

> **`azd restore`** prenese odvisnosti vaše aplikacije (npm, pip, NuGet, Maven, itd.). Samodejno se zažene med `azd package` in `azd deploy`, zato ga redko kličete neposredno – zaženite ga ročno za predprenos odvisnosti (na primer za ogrevanje CI predpomnilnika ali delo brez povezave kasneje).

> **`azd package`** pripravi artefakt za nameščanje brez nameščanja aplikacijske storitve. Vednost je odvisna od jezika in gostitelja: pakiranje kontejnerjev lahko uporabi oddaljene Azure gradnje in objavi slike v registru, zato ni nujno brez povezave ali brez zapisov v Azure. `azd deploy` lahko samodejno pakira; uporabite ločen korak pakiranja, ko potrebujete artefakt ali preverjanje gradnje.


## 🌍 Upravljanje okolij

### Operacije z okolji
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

### Spremenljivke okolja
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

Datoteke okolja so v navadni besedilni obliki. Ne obravnavajte `azd env set` kot shrambo skrivnosti; uporabite Key Vault reference ali upravljano identiteto glede na potrebe.

## ⚙️ Ukazi za konfiguracijo

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

## 📊 Spremljanje in diagnostika

### Nadzorna plošča spremljanja
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

Application Insights mora biti konfiguriran s predlogo. Možnost AZD Live Metrics trenutno ni podprta za Python aplikacije; namesto tega uporabite pregled, dnevnike ali dokumentiran sledilni delovni proces vzorca.

### Ogled dnevnikov kontejnerjev
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Poizvedbe v Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Ukazi za vzdrževanje

### Čiščenje
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

### Posodobitve
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Napredni ukazi

### Cevovodi in CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Upravljanje infrastrukture
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

## 🤖 AI in Podaljški ukazi

### AZD podaljški

Referenca AI CLI pregledana 2026-11-04: `azd 1.37.2`, agenti `1.0.0-beta.23`, evalvacije `1.0.0-beta.2`. Uporabite `azd >= 1.37.0` za združeni delovni proces; nadgradite osnovni CLI pred nezdružljivimi podaljški.

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

### AI agent ukazi
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

`--template`/`-t` nadomešča zastarelo črkovanje `--manifest`/`-m`; stari manifesti potrebujejo migracijo. Trenutno ni možnosti agent-init `--host containerapp`. Managed-harness, glasovni in dolgotrajni predogledi zahtevajo neodvisno privolitev za okolje lupine/CI; glej [AI CLI referenco](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### AI evalvacije in optimizacija
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

Agenti beta.22 so nadomestili stare ukaze za evalvacijo z `azd ai eval` iz `azure.ai.evaluations`. Nova konfiguracija evalvacije uporablja camelCase ključe. Optimizacija `--config` zahteva samostojen API zahtevek za optimizacijo, **ne** starejši `eval.yaml` ali novi `azure.eval.yaml`; uporabite `--eval`/`--eval-config` za ponovno uporabo evalvacij. Glej [nastavitev evalvacije](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) in [migracijo optimizacije](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP strežnik (alfa)
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

## 🎯 Hitri delovni procesi

### Razvojni delovni proces
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

### Večokoljski delovni proces
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

### Delovni proces odpravljanja težav
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

## 🔍 Ukazi za odpravljanje napak

### Informacije za odpravljanje napak
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

### Odpravljanje napak pri predlogi
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Ukazi za datoteke in direktorije

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

## 🎨 Oblikovanje izhoda

### JSON izhod
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabelarični izhod
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Pogoste kombinacije ukazov

### Skripta za preverjanje stanja
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validacija nameščanja
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Primerjava okolij
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skripta za čiščenje virov
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Spremenljivke okolja

### Pogoste spremenljivke okolja
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

## 🚨 Nujni ukazi

### Hitre popravke
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

### Ukazi za obnovitev
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Strokovni nasveti

### Vezaji za hitrejši delovni proces
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Bližnjice funkcij
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

## 📖 Pomoč in dokumentacija

### Pridobitev pomoči
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

### Povezave do dokumentacije
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Nasvet**: Dodajte to zloženko med zaznamke in uporabite `Ctrl+F` za hitro iskanje potrebnih ukazov!

---

**Navigacija**
- **Prejšnja lekcija**: [Predhodni pregledi](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Naslednja lekcija**: [Slovarček](glossary.md)

---

> **💡 Želite pomoč pri Azure ukazih v vašem urejevalniku?** Namestite [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) z `npx skills add microsoft/github-copilot-for-azure` — 37 spretnosti za AI, Foundry, nameščanje, diagnostiko in še več.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->