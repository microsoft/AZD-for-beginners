# Fișă cu Comenzi - Comenzi Esențiale AZD

**Referință Rapidă pentru Toate Capitolele**
- **📚 Acasă Curs**: [AZD Pentru Începători](../README.md)
- **📖 Start Rapid**: [Capitolul 1: Fundamente & Start Rapid](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comenzi AI**: [Capitolul 2: Dezvoltare AI-Primar](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansat**: [Capitolul 4: Infrastructura ca și Cod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introducere

Această fișă cu comenzi cuprinzătoare oferă o referință rapidă pentru cele mai utilizate comenzi Azure Developer CLI, organizate pe categorii cu exemple practice. Perfectă pentru căutări rapide în timpul dezvoltării, depanării și operațiunilor zilnice cu proiecte azd.

## Obiective de Învățare

Folosind această fișă cu comenzi, veți:
- Avea acces instantaneu la comenzile și sintaxa esențială Azure Developer CLI
- Înțelege organizarea comenzilor pe categorii funcționale și cazuri de utilizare
- Consulta exemple practice pentru scenarii comune de dezvoltare și implementare
- Accesa comenzi pentru depanare pentru rezolvarea rapidă a problemelor
- Găsi opțiuni avansate de configurare și personalizare eficient
- Localiza comenzi pentru managementul mediilor și fluxuri de lucru multi-mediu

## Rezultate de Învățare

Consultând regulat această fișă cu comenzi, veți putea:
- Executa comenzi azd cu încredere fără a consulta documentația completă
- Rezolva rapid probleme comune folosind comenzile diagnostice adecvate
- Gestiona eficient mai multe medii și scenarii de implementare
- Aplica funcții și opțiuni avansate azd după nevoie
- Depana probleme de implementare folosind secvențe sistematice de comenzi
- Optimiza fluxurile de lucru folosind eficient scurtăturile și opțiunile azd

## Comenzi Începătoare

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

### Inițializare Proiect
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

## Comenzi de Bază pentru Implementare

### Flux Complet de Implementare
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

### Doar Infrastructură
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Doar Aplicație
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Compilare și Pachetare
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

> **`azd restore`** descarcă dependențele aplicației tale (npm, pip, NuGet, Maven etc.). Se execută automat în timpul `azd package` și `azd deploy`, deci rar trebuie să-l rulezi direct — rulează-l manual pentru a preîncărca dependențele (de exemplu, pentru a încălzi un cache CI sau pentru a lucra offline ulterior).

> **`azd package`** pregătește un artefact care poate fi implementat fără a implementa serviciul aplicației. Comportamentul depinde de limbaj și gazdă: ambalarea containerului poate folosi build-uri la distanță Azure și poate publica imagini într-un registru, deci nu este neapărat offline sau fără operații pe Azure. `azd deploy` poate ambala automat; folosește un pas separat de pachet când ai nevoie de un artefact sau de o verificare a build-ului.


## 🌍 Managementul Mediului

### Operațiuni cu Mediul
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

### Variabile de Mediu
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

Fișierele de mediu sunt text simplu. Nu trata `azd env set` ca depozit de secrete; folosește referințe Key Vault sau identitate administrată după caz.

## ⚙️ Comenzi de Configurare

### Configurare Globală
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

### Configurare Proiect
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitorizare și Diagnosticare

### Panou de Monitorizare
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

Application Insights trebuie configurat prin șablon. Opțiunea Live Metrics din AZD nu este susținută momentan pentru aplicații Python; folosește în schimb overview, jurnalele sau fluxul de trasare documentat al exemplului.

### Vizualizarea Jurnalelor Containerelor
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

## 🛠️ Comenzi de Mentenanță

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

## 🔧 Comenzi Avansate

### Pipeline și CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Managementul Infrastructurii
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

### Informații Proiect
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

Referință Foundry GA actualizată 2026-11-09: `microsoft.foundry` bundle 1.0, anunțat pe [5 noiembrie 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Folosește `azd >= 1.37.0`; componentele sunt versiuni independente, iar funcțiile preview opționale își păstrează propriul status.

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

Pachetul nu include evaluări, seturi de date, fine-tuning sau modele personalizate. Instalarea extensiilor de bază individuale rămâne susținută. Urmează [ghidul pentru agentul găzduit GA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) pentru un exemplu rulabil cu Python 3.13+, uv curent, permisiuni și cotă de modele.

### Comenzi Agent AI
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

`--template`/`-t` înlocuiește ortografia învechită `--manifest`/`-m`; manifestele legacy necesită migrare. Nu există momentan opțiune agent-init `--host containerapp`. Previev-urile managed-harness, voice și cele de durată lungă necesită opt-in separat în shell/mediul CI; vezi [referința AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Testarea locală folosește în continuare implementări de modele Azure și implică costuri. Pentru curățare, `azd down` șterge grupul de resurse al unui proiect Foundry nou creat, dar lasă resursele reutilizate; șterge separat numai resursele nedorite care sunt în proprietatea ta.

### Evaluări și Optimizare AI
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

Agents beta.22 a înlocuit comenzile legacy de evaluare cu `azd ai eval` de la `azure.ai.evaluations`. Noua configurare de evaluare folosește chei camelCase. Optimizarea `--config` este o solicitare API de optimizare independentă, **nu** legacy `eval.yaml` sau nou `azure.eval.yaml`; folosește `--eval`/`--eval-config` pentru reutilizarea evaluărilor. Vezi [configurare evaluare](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) și [migrare optimizare](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### CI/CD Foundry
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

Fragmentul runner nu este un flux de lucru complet. Comite configurația evaluării revizuite și activele non-secrete, acordă acces dataset/evaluator/model, și folosește un mediu per etapă. Vezi [exemplul CI/CD autentificat](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### Server MCP (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generare Infrastructură
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Fluxuri de Lucru Rapide

### Flux de Lucru pentru Dezvoltare
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

### Flux Multi-Mediu
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

### Flux de Lucru pentru Depanare
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

## 🔍 Comenzi pentru Debugging

### Informații de Debugging
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

### Debugging Șabloane
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Comenzi pentru Fișiere și Directoare

### Structura Proiectului
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatarea Ieșirii

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

### Ieșire Tabel
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Combinații Comune de Comenzi

### Script de Verificare a Sănătății
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validare Implementare
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Comparare Medii
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Script Curățare Resurse
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Variabile de Mediu

### Variabile Comune de Mediu
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

## 🚨 Comenzi de Urgență

### Remedieri Rapide
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

### Comenzi de Recuperare
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Sfaturi Profesionale

### Aliasuri pentru Flux de Lucru Mai Rapid
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scurtături Funcții
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

## 📖 Ajutor și Documentație

### Obținerea Ajutorului
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

### Linkuri Documentație
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Sfat**: Marchează această fișă cu comenzi și folosește `Ctrl+F` pentru a găsi rapid comenzile de care ai nevoie!

---

**Navigare**
- **Lecția Anterioară**: [Verificări Preliminare](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Lecția Următoare**: [Glosar](glossary.md)

---

> **💡 Vrei ajutor pentru comenzile Azure în editor?** Instalează [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) cu `npx skills add microsoft/github-copilot-for-azure` — 37 de skill-uri pentru AI, Foundry, implementare, diagnosticare și altele.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->