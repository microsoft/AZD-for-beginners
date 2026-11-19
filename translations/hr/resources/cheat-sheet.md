# Komandni Kratki Priručnik - Osnovne AZD Komande

**Brzi Pregled za Sve Poglavlja**
- **📚 Početna Stranica Tečaja**: [AZD Za Početnike](../README.md)
- **📖 Brzi Početak**: [Poglavlje 1: Osnove i Brzi Početak](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Komande**: [Poglavlje 2: AI-Prvo Razvijanje](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Napredno**: [Poglavlje 4: Infrastruktura kao Kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Uvod

Ovaj sveobuhvatni kratki priručnik pruža brzi pregled najčešće korištenih Azure Developer CLI komandi, organiziranih po kategorijama s praktičnim primjerima. Savršeno za brza pretraživanja tijekom razvoja, otklanjanja poteškoća i svakodnevnog rada s azd projektima.

## Ciljevi Učenja

Koristeći ovaj kratki priručnik, moći ćete:
- Imati trenutni pristup osnovnim Azure Developer CLI komandama i sintaksi
- Razumjeti organizaciju komandi prema funkcionalnim kategorijama i slučajevima upotrebe
- Referencirati praktične primjere za uobičajene scenarije razvoja i implementacije
- Pristupiti komandama za otklanjanje poteškoća za brzo rješavanje problema
- Pronaći napredne opcije konfiguracije i prilagodbe učinkovito
- Lokalizirati komande za upravljanje okruženjima i višekružne radne tokove

## Ishodi Učenja

Redovitim korištenjem ovog kratkog priručnika, moći ćete:
- Izvršavati azd komande s povjerenjem bez potrebe za stalnim pogledom u kompletnu dokumentaciju
- Brzo rješavati uobičajene probleme koristeći odgovarajuće dijagnostičke komande
- Učinkovito upravljati višestrukim okruženjima i scenarijima implementacije
- Primijeniti napredne funkcije i opcije konfiguracije azd po potrebi
- Otklanjati probleme s implementacijom koristeći sistematske sekvence komandi
- Optimizirati radne tokove kroz efikasno korištenje azd prečaca i opcija

## Početne Komande

### Autentifikacija
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

### Inicijalizacija Projekta
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

## Osnovne Komande za Implementaciju

### Cjelokupni Proces Implementacije
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

### Samo Infrastruktura
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Samo Aplikacija
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Izgradnja i Pakiranje
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

> **`azd restore`** preuzima zavisnosti vaše aplikacije (npm, pip, NuGet, Maven itd.). Pokreće se automatski tijekom `azd package` i `azd deploy`, tako da ga rijetko pozivate izravno — pokrenite ga ručno kako biste prethodno preuzeli zavisnosti (na primjer, za zagrijavanje CI cache-a ili kasniji rad offline).

> **`azd package`** priprema deployabilni artefakt bez implementacije aplikacijske usluge. Ponašanje ovisi o jeziku i hostu: pakiranje containera može koristiti Azure udaljene buildove i objavljivati slike u registar, tako da nije nužno offline ili bez pisanih pristupa Azureu. `azd deploy` može automatski pakirati; koristi se poseban korak pakiranja kada vam treba artefakt ili provjera builda.


## 🌍 Upravljanje Okruženjem

### Operacije s Okruženjem
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

### Varijable Okruženja
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

Datoteke okruženja su običan tekst. Nemojte tretirati `azd env set` kao pohranu tajni; koristite Key Vault reference ili upravljani identitet prema potrebi.

## ⚙️ Komande za Konfiguraciju

### Globalna Konfiguracija
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

### Konfiguracija Projekta
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Nadgledanje i Dijagnostika

### Nadzorna Ploča
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

Application Insights mora biti konfiguriran putem predloška. AZD-ova opcija Live Metrics trenutno nije podržana za Python aplikacije; koristite pregled, zapise ili dokumentirani workflow praćenja iz primjera umjesto toga.

### Pregledavanje Zapisa Iz Conatinera
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Upiti u Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Komande za Održavanje

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

## 🔧 Napredne Komande

### Pipeline i CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Upravljanje Infrastrukturom
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

### Informacije o Projektu
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI & Ekstenzije Komande

### AZD Ekstenzije

Referenca Foundry GA ažurirana 2026-11-09: `microsoft.foundry` paket 1.0, najavljeno [5. studenog 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Koristite `azd >= 1.37.0`; komponente su verzionirane neovisno i opcionalne preview značajke zadržavaju vlastiti status.

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

Paket ne uključuje evaluacije, skupove podataka, fino podešavanje ili prilagođene modele. Instalacija pojedinačnih osnovnih ekstenzija ostaje podržana. Slijedite [GA walkthrough za hosted-agent](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) za pokretni primjer s Python 3.13+, trenutnim uvjetima, dozvolama i kvotom za modele.

### AI Agent Komande
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

`--template`/`-t` zamjenjuje zastarjeli `--manifest`/`-m` pravopis; stari manifesti trebaju migraciju. Trenutno nema agent-init `--host containerapp` opcije. Managed-harness, glasovne i dugotrajne preview verzije zahtijevaju nezavisno uključivanje u shell/CI okruženju; pogledajte [AI CLI referencu](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Lokalno testiranje još uvijek koristi Azure model deploymente i naplaćuje se. Za čišćenje, `azd down` briše novo kreiranu Foundry resource group, ali ostavlja resurse ponovno korištenih projekata na mjestu; brišite samo neželjene resurse koje sami posjedujete zasebno.

### AI Evaluacije i Optimizacija
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

Agents beta.22 zamijenio je stare komande evaluacije s `azd ai eval` iz `azure.ai.evaluations`. Nova konfiguracija evaluacije koristi camelCase ključeve. Optimizacija `--config` zahtjeva samostalni API za optimizaciju, **ne** stare `eval.yaml` ili nove `azure.eval.yaml`; koristite `--eval`/`--eval-config` za ponovnu upotrebu evaluacija. Pogledajte [postavljanje evaluacije](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) i [migraciju optimizacije](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Fragment runneša nije kompletan workflow. Commitajte pregledanu konfiguraciju evaluacije i ne-tajne resurse, dopuštajte pristup datasetu/evaluatoru/modelu i koristite zasebno okruženje po fazi. Pogledajte [primjer autentificiranog CI/CD](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generiranje Infrastrukture
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Brzi Radni Tokovi

### Radni Tok Razvoja
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

### Višekružno Upravljanje Okruženjima
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

### Radni Tok za Otklanjanje Problema
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

## 🔍 Komande za Debugging

### Informacije za Debugging
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

### Debugging Predložaka
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Komande za Datoteke i Direktorije

### Struktura Projekta
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatiranje Izlaza

### JSON Izlaz
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Izlaz u Tablici
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Uobičajene Kombinacije Komandi

### Skripta za Provjeru Zdravlja
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validacija Implementacije
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Usporedba Okruženja
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skripta za Čišćenje Resursa
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Varijable Okruženja

### Uobičajene Varijable Okruženja
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

## 🚨 Hitne Komande

### Brze Popravke
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

### Komande za Oporavak
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profesionalni Savjeti

### Alias-i za Brži Radni Tok
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Prečaci za Funkcije
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

## 📖 Pomoć i Dokumentacija

### Dobivanje Pomoći
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

### Linkovi za Dokumentaciju
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Savjet**: Označite ovu cheat sheet i koristite `Ctrl+F` za brzo pronalaženje potrebnih komandi!

---

**Navigacija**
- **Prethodni Lekcija**: [Preflight Provjere](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Sljedeća Lekcija**: [Rječnik](glossary.md)

---

> **💡 Želite pomoć za Azure komande u svom editoru?** Instalirajte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) s `npx skills add microsoft/github-copilot-for-azure` — 37 vještina za AI, Foundry, implementaciju, dijagnostiku i još mnogo toga.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->