# Comandi Rapidi - Comandi Essenziali AZD

**Riferimento Rapido per Tutti i Capitoli**
- **📚 Home del Corso**: [AZD For Beginners](../README.md)
- **📖 Avvio Rapido**: [Capitolo 1: Fondazioni e Avvio Rapido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandi AI**: [Capitolo 2: Sviluppo AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzato**: [Capitolo 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduzione

Questa guida rapida completa fornisce un riferimento veloce per i comandi più comunemente usati dell'Azure Developer CLI, organizzati per categoria con esempi pratici. Perfetta per consultazioni rapide durante lo sviluppo, il troubleshooting e le operazioni giornaliere con i progetti azd.

## Obiettivi di Apprendimento

Utilizzando questa guida rapida, potrai:
- Avere accesso immediato ai comandi e sintassi essenziali di Azure Developer CLI
- Comprendere l'organizzazione dei comandi per categorie funzionali e casi d'uso
- Fare riferimento a esempi pratici per scenari comuni di sviluppo e distribuzione
- Accedere ai comandi di troubleshooting per una rapida risoluzione dei problemi
- Trovare efficientemente opzioni avanzate di configurazione e personalizzazione
- Individuare comandi per la gestione degli ambienti e workflow multi-ambiente

## Risultati di Apprendimento

Facendo riferimento regolarmente a questa guida rapida, sarai in grado di:
- Eseguire comandi azd con sicurezza senza consultare la documentazione completa
- Risolvere rapidamente problemi comuni usando comandi diagnostici appropriati
- Gestire efficientemente ambienti multipli e scenari di distribuzione
- Applicare funzionalità avanzate di azd e opzioni di configurazione secondo necessità
- Effettuare il troubleshooting di problemi di distribuzione usando sequenze di comandi sistematiche
- Ottimizzare i flussi di lavoro tramite un uso efficace di scorciatoie e opzioni azd

## Comandi di Avvio

### Autenticazione
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

### Inizializzazione Progetto
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

## Comandi Principali di Distribuzione

### Flusso Completo di Distribuzione
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

### Solo Infrastruttura
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Solo Applicazione
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Build e Packaging
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

> **`azd restore`** scarica le dipendenze della tua app (npm, pip, NuGet, Maven, ecc.). Si avvia automaticamente durante `azd package` e `azd deploy`, quindi raramente lo esegui direttamente—lancialo manualmente per pre-scaricare le dipendenze (ad esempio, per riscaldare una cache CI o lavorare offline successivamente).

> **`azd package`** prepara un artefatto distribuibile senza distribuire il servizio applicativo. Il comportamento dipende dal linguaggio e host: il packaging dei container può usare build remote Azure e pubblicare immagini in un registry, quindi non è necessariamente offline o privo di scritture su Azure. `azd deploy` può eseguire automaticamente il packaging; usa un passaggio di packaging separato quando ti serve un artefatto o un controllo di build.


## 🌍 Gestione Ambiente

### Operazioni Ambiente
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

### Variabili Ambiente
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

I file di ambiente sono in testo semplice. Non trattare `azd env set` come archiviazione segreta; usa riferimenti Key Vault o identità gestita come appropriato.

## ⚙️ Comandi di Configurazione

### Configurazione Globale
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

### Configurazione Progetto
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoraggio e Diagnostica

### Dashboard di Monitoraggio
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

Application Insights deve essere configurato dal template. L’opzione Live Metrics di AZD non è attualmente supportata per applicazioni Python; utilizza la panoramica, i log o il flusso di tracciamento documentato del campione.

### Visualizzazione Log Container
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Query Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comandi di Manutenzione

### Pulizia
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

### Aggiornamenti
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Comandi Avanzati

### Pipeline e CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Gestione Infrastruttura
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

### Informazioni sul Progetto
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Comandi AI & Estensioni

### Estensioni AZD

Riferimento AI CLI rivisto 2026-11-04: `azd 1.37.2`, agenti `1.0.0-beta.23`, valutazioni `1.0.0-beta.2`. Usa `azd >= 1.37.0` per il flusso combinato; aggiorna il core CLI prima delle estensioni incompatibili.

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

### Comandi Agente AI
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

`--template`/`-t` sostituisce l'ortografia deprecata `--manifest`/`-m`; i manifest legacy richiedono la migrazione. Attualmente non esiste opzione agente-init `--host containerapp`. Le anteprime managed-harness, voice e long-running necessitano l’adesione individuale all’ambiente shell/CI; consulta il [riferimento AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Valutazioni e Ottimizzazione AI
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

Agenti beta.22 ha sostituito i comandi di valutazione legacy con `azd ai eval` da `azure.ai.evaluations`. La nuova configurazione di valutazione usa chiavi camelCase. L'ottimizzazione `--config` richiede una richiesta API di ottimizzazione standalone, **non** il vecchio `eval.yaml` o il nuovo `azure.eval.yaml`; usa `--eval`/`--eval-config` per il riutilizzo della valutazione. Vedi [configurazione valutazione](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) e [migrazione ottimizzazione](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Server MCP (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generazione Infrastruttura
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Flussi di Lavoro Rapidi

### Flusso di Lavoro di Sviluppo
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

### Flusso Multi-Ambiente
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

### Flusso di Troubleshooting
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

## 🔍 Comandi di Debugging

### Informazioni di Debug
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

### Debug del Template
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Comandi File e Directory

### Struttura Progetto
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formattazione Output

### Output JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Tabella
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Combinazioni Comuni di Comandi

### Script di Health Check
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validazione Distribuzione
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Confronto Ambienti
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Script di Pulizia Risorse
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Variabili di Ambiente

### Variabili Ambiente Comuni
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

## 🚨 Comandi di Emergenza

### Correzioni Veloci
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

### Comandi di Recupero
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Consigli Pro

### Alias per Flussi di Lavoro più Veloci
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scorciatoie Funzione
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

## 📖 Aiuto e Documentazione

### Ottenere Aiuto
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

### Link alla Documentazione
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Suggerimento**: Metti tra i preferiti questa guida rapida e usa `Ctrl+F` per trovare velocemente i comandi che ti servono!

---

**Navigazione**
- **Lezione Precedente**: [Controlli Preliminari](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Prossima Lezione**: [Glossario](glossary.md)

---

> **💡 Vuoi aiuto sui comandi Azure nel tuo editor?** Installa [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) con `npx skills add microsoft/github-copilot-for-azure` — 37 skill per AI, Foundry, distribuzione, diagnostica e altro.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->