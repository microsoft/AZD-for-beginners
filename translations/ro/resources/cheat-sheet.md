# Fișă de Comenzi - Comenzi esențiale AZD

**Referință rapidă pentru toate capitolele**
- **📚 Acasă curs**: [AZD Pentru Începători](../README.md)
- **📖 Început rapid**: [Capitolul 1: Fundamente și Început rapid](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comenzi AI**: [Capitolul 2: Dezvoltare AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansat**: [Capitolul 4: Infrastructură ca Cod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducere

Această fișă completă oferă o referință rapidă pentru cele mai utilizate comenzi Azure Developer CLI, organizate pe categorii cu exemple practice. Perfectă pentru căutări rapide în timpul dezvoltării, depanării și operațiunilor zilnice cu proiectele azd.

## Obiective de învățare

Folosind această fișă:
- Vei avea acces instantaneu la comenzi esențiale Azure Developer CLI și sintaxă
- Vei înțelege organizarea comenzilor pe categorii funcționale și cazuri de utilizare
- Vei consulta exemple practice pentru scenarii comune de dezvoltare și implementare
- Vei accesa comenzi de depanare pentru rezolvarea rapidă a problemelor
- Vei găsi eficient opțiuni avansate de configurare și personalizare
- Vei localiza comenzi de gestionare a mediilor și fluxuri de lucru multi-mediu

## Rezultate de învățare

Consultând regulat această fișă, vei putea să:
- Execuți comenzile azd cu încredere fără a consulta documentația completă
- Rezolvi rapid probleme comune folosind comenzile de diagnostic potrivite
- Gestionezi eficient medii multiple și scenarii de implementare
- Aplici funcționalități și opțiuni avansate azd după necesitate
- Depanezi problemele de implementare folosind secvențe sistematice de comenzi
- Optimizezi fluxurile de lucru prin utilizarea eficientă a scurtăturilor și opțiunilor azd

## Comenzi pentru începători

### Autentificare
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

### Inițializare proiect
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

## Comenzi principale de implementare

### Flux complet de implementare
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

### Doar infrastructură
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Doar aplicație
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Construire și împachetare
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

> **`azd restore`** descarcă dependențele aplicației tale (npm, pip, NuGet, Maven etc.). Se execută automat în timpul `azd package` și `azd deploy`, așa că rar este apelat direct — rulează-l manual pentru a preîncărca dependențele (de exemplu, pentru a încălzi o cache CI sau a lucra offline ulterior).

> **`azd package`** pregătește un artefact deployabil fără a implementa serviciul aplicației. Comportamentul depinde de limbaj și gazdă: împachetarea containerului poate folosi build-uri remote Azure și poate publica imagini într-un registru, deci nu este neapărat offline sau fără scrieri Azure. `azd deploy` poate împacheta automat; folosește un pas separat de împachetare când ai nevoie de un artefact sau o verificare de build.


## 🌍 Gestionarea mediului

### Operațiuni mediu
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

### Variabile de mediu
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

Fișierele de mediu sunt text simplu. Nu trata `azd env set` ca stocare secretă; folosește referințe Key Vault sau identitate gestionată după caz.

## ⚙️ Comenzi de configurare

### Configurare globală
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

### Configurare proiect
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitorizare și diagnostic

### Panou de monitorizare
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

Application Insights trebuie configurat de șablon. Opțiunea Live Metrics AZD nu este în prezent suportată pentru aplicațiile Python; folosește în schimb prezentarea generală, jurnalele sau fluxul de urmarire documentat al exemplului.

### Vizualizare jurnale container
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Interogări Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comenzi de întreținere

### Curățare
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

### Actualizări
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Comenzi avansate

### Pipeline și CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Gestionarea infrastructurii
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

### Informații proiect
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Comenzi AI & Extensii

### Extensii AZD

Referința AI CLI revizuită 2026-11-04: `azd 1.37.2`, agenți `1.0.0-beta.23`, evaluări `1.0.0-beta.2`. Folosește `azd >= 1.37.0` pentru fluxul de lucru combinat; actualizează CLI-ul de bază înainte de extensiile incompatibile.

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

### Comenzi agent AI
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

`--template`/`-t` înlocuiește ortografia învechită `--manifest`/`-m`; manifestele vechi necesită migrare. Nu există opțiune agent-init `--host containerapp` curentă. Harness gestionat, voce și previzualizări pe termen lung necesită opt-in independent pentru shell/mediu CI; vezi [referința AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Evaluări și optimizare AI
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

Agenți beta.22 a înlocuit comenzile de evaluare vechi cu `azd ai eval` din `azure.ai.evaluations`. Configurarea evaluării noi folosește chei camelCase. Optimizarea `--config` tratează o cerere API de optimizare independentă, **nu** pe vechiul `eval.yaml` sau noul `azure.eval.yaml`; folosește `--eval`/`--eval-config` pentru reutilizarea evaluării. Vezi [configurare evaluare](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) și [migrarea optimizării](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Server MCP (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generare infrastructură
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Fluxuri rapide

### Flux dezvoltare
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

### Flux multi-mediu
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

### Flux depanare
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

## 🔍 Comenzi de depanare

### Informații depanare
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

### Depanare șablon
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Comenzi fișiere și directoare

### Structura proiectului
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatare ieșire

### Ieșire JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Ieșire tabel
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Combinații comune de comenzi

### Script verificare sănătate
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validare implementare
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Comparare medii
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Script curățare resurse
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Variabile de mediu

### Variabile de mediu comune
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

## 🚨 Comenzi de urgență

### Remedieri rapide
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

### Comenzi recuperare
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Sfaturi profesionale

### Aliasuri pentru flux de lucru mai rapid
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scurtături pentru funcții
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

## 📖 Ajutor și documentație

### Obținere ajutor
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

### Linkuri documentație
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Sfat**: Salvează această fișă și folosește `Ctrl+F` pentru a găsi rapid comenzile de care ai nevoie!

---

**Navigare**
- **Lecția anterioară**: [Verificări pre zbor](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Următoarea lecție**: [Glosar](glossary.md)

---

> **💡 Vrei ajutor pentru comenzile Azure în editorul tău?** Instalează [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) cu `npx skills add microsoft/github-copilot-for-azure` — 37 de skill-uri pentru AI, Foundry, implementare, diagnosticare și altele.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->