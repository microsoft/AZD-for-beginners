# Cheat Sheet dei Comandi - Comandi AZD Essenziali

**Riferimento Rapido per Tutti i Capitoli**
- **📚 Home del Corso**: [AZD per Principianti](../README.md)
- **📖 Avvio Rapido**: [Capitolo 1: Fondamenti e Avvio Rapido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandi AI**: [Capitolo 2: Sviluppo AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzato**: [Capitolo 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduzione

Questo cheat sheet completo offre un riferimento rapido per i comandi più comunemente usati dell'Azure Developer CLI, organizzati per categoria con esempi pratici. Perfetto per consultazioni veloci durante lo sviluppo, il troubleshooting e le operazioni quotidiane con i progetti azd.

## Obiettivi di Apprendimento

Usando questo cheat sheet, potrai:
- Avere accesso immediato ai comandi essenziali e alla sintassi dell'Azure Developer CLI
- Comprendere l'organizzazione dei comandi per categorie funzionali e casi d'uso
- Fare riferimento a esempi pratici per scenari comuni di sviluppo e distribuzione
- Accedere ai comandi di troubleshooting per risoluzioni rapide dei problemi
- Trovare opzioni avanzate di configurazione e personalizzazione in modo efficiente
- Localizzare i comandi per la gestione degli ambienti e workflow multi-ambiente

## Risultati di Apprendimento

Con un riferimento regolare a questo cheat sheet, sarai in grado di:
- Eseguire i comandi azd con sicurezza senza dover consultare la documentazione completa
- Risolvere rapidamente problemi comuni utilizzando i comandi diagnostici appropriati
- Gestire efficacemente ambienti multipli e scenari di distribuzione
- Applicare funzionalità avanzate azd e opzioni di configurazione quando necessario
- Effettuare troubleshooting dei problemi di distribuzione usando sequenze di comandi sistematiche
- Ottimizzare i flussi di lavoro attraverso l'uso efficace di scorciatoie e opzioni azd

## Comandi per Iniziare

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

## Comandi Core di Distribuzione

### Workflow Completo di Distribuzione
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

### Compilazione e Pacchettizzazione
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

> **`azd restore`** scarica le dipendenze della tua app (npm, pip, NuGet, Maven, ecc.). Viene eseguito automaticamente durante `azd package` e `azd deploy`, quindi raramente lo esegui direttamente—eseguilo manualmente per pre-scaricare le dipendenze (ad esempio, per riscaldare una cache CI o lavorare offline in seguito).

> **`azd package`** prepara un artefatto distribuibile senza distribuire il servizio applicativo. Il comportamento dipende dal linguaggio e dall'host: il packaging del container può usare build remote Azure e pubblicare immagini su un registro, quindi non è necessariamente offline o privo di scritture Azure. `azd deploy` può pacchettizzare automaticamente; usa un passaggio package separato quando hai bisogno di un artefatto o di un controllo di build.


## 🌍 Gestione degli Ambienti

### Operazioni sull'Ambiente
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

### Variabili d'Ambiente
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

I file ambiente sono in testo in chiaro. Non trattare `azd env set` come archiviazione segreta; usa riferimenti a Key Vault o managed identity come appropriato.

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

Application Insights deve essere configurato dal template. L'opzione Live Metrics di AZD non è attualmente supportata per applicazioni Python; usa invece l'overview, i log o il workflow di tracciamento documentato del sample.

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

### Informazioni Progetto
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

Riferimento Foundry GA aggiornato 2026-11-09: bundle `microsoft.foundry` 1.0, annunciato il [5 novembre 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Usa `azd >= 1.37.0`; i componenti sono versionati indipendentemente e le funzionalità preview opzionali mantengono il proprio stato.

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

Il bundle non include valutazioni, dataset, fine-tuning o modelli personalizzati. L'installazione di estensioni core individuali rimane supportata. Segui il [walkthrough con agente ospitato GA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) per un esempio eseguibile con Python 3.13+, uv attuale, permessi e quota modello.

### Comandi Agent AI
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

`--template`/`-t` sostituisce la scrittura deprecata `--manifest`/`-m`; i manifest legacy necessitano migrazione. Non esiste attualmente l'opzione agent-init `--host containerapp`. Le preview managed-harness, voice e long-running necessitano opt-in indipendenti per shell/CI environment; consulta il [riferimento AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

I test locali utilizzano ancora deployment modelli Azure e comportano costi. Per la pulizia, `azd down` elimina il resource group di un progetto Foundry appena creato, ma lascia risorse di progetti riutilizzati in luogo; rimuovi separatamente solo le risorse indesiderate di tua proprietà.

### Valutazioni e Ottimizzazione AI
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

Agents beta.22 ha sostituito i comandi di valutazione legacy con `azd ai eval` da `azure.ai.evaluations`. La nuova configurazione di valutazione usa chiavi camelCase. L'ottimizzazione `--config` richiede una richiesta API di ottimizzazione standalone, **non** legacy `eval.yaml` o nuova `azure.eval.yaml`; usa `--eval`/`--eval-config` per il riutilizzo della valutazione. Vedi [configurazione valutazione](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) e [migrazione ottimizzazione](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Il frammento runner non è un workflow completo. Commit della configurazione valutazione revisionata e asset non segreti, concedi accesso a dataset/evaluator/modello e usa un ambiente per ogni stage. Consulta l'[esempio CI/CD autenticato](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Server (Alpha)
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

## 🎯 Workflow Rapidi

### Workflow di Sviluppo
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

### Workflow Multi-Ambiente
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

### Workflow di Risoluzione Problemi
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

## 🔍 Comandi di Debug

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

### Debug Template
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Comandi per File e Directory

### Struttura del Progetto
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

### Script di Controllo Salute
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

## 📝 Variabili d'Ambiente

### Variabili d'Ambiente Comuni
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

### Correzioni Rapide
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

## 💡 Pro Tips

### Alias per Workflow Più Veloce
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

**Suggerimento**: Aggiungi questa cheat sheet ai preferiti e usa `Ctrl+F` per trovare rapidamente i comandi che ti servono!

---

**Navigazione**
- **Lezione Precedente**: [Controlli Preliminari](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Lezione Successiva**: [Glossario](glossary.md)

---

> **💡 Vuoi aiuto con i comandi Azure nel tuo editor?** Installa [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) con `npx skills add microsoft/github-copilot-for-azure` — 37 skill per AI, Foundry, distribuzione, diagnostica e altro.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->