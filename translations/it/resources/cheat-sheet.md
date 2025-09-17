<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-17T21:48:07+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "it"
}
-->
# Command Cheat Sheet - Comandi Essenziali AZD

**Riferimento Rapido per Tutti i Capitoli**
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)
- **📖 Avvio Rapido**: [Capitolo 1: Fondamenti e Avvio Rapido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandi AI**: [Capitolo 2: Sviluppo AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanzato**: [Capitolo 4: Infrastruttura come Codice](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduzione

Questo cheat sheet completo offre un riferimento rapido ai comandi più utilizzati della CLI per sviluppatori Azure, organizzati per categoria con esempi pratici. Perfetto per consultazioni rapide durante lo sviluppo, la risoluzione dei problemi e le operazioni quotidiane con progetti azd.

## Obiettivi di Apprendimento

Utilizzando questo cheat sheet, potrai:
- Accedere immediatamente ai comandi essenziali della CLI per sviluppatori Azure e alla loro sintassi
- Comprendere l'organizzazione dei comandi per categorie funzionali e casi d'uso
- Consultare esempi pratici per scenari comuni di sviluppo e distribuzione
- Accedere ai comandi di risoluzione dei problemi per una rapida soluzione
- Trovare opzioni avanzate di configurazione e personalizzazione in modo efficiente
- Localizzare comandi per la gestione degli ambienti e flussi di lavoro multi-ambiente

## Risultati di Apprendimento

Con un riferimento regolare a questo cheat sheet, sarai in grado di:
- Eseguire i comandi azd con sicurezza senza dover consultare la documentazione completa
- Risolvere rapidamente problemi comuni utilizzando i comandi diagnostici appropriati
- Gestire ambienti multipli e scenari di distribuzione in modo efficiente
- Applicare funzionalità avanzate di azd e opzioni di configurazione quando necessario
- Risolvere problemi di distribuzione utilizzando sequenze sistematiche di comandi
- Ottimizzare i flussi di lavoro attraverso un uso efficace di scorciatoie e opzioni azd

## Comandi per Iniziare

### Autenticazione
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Inizializzazione del Progetto
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comandi Principali di Distribuzione

### Flusso Completo di Distribuzione
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Solo Infrastruttura
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Solo Applicazione
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Build e Pacchetto
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Gestione degli Ambienti

### Operazioni sugli Ambienti
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Variabili di Ambiente
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Comandi di Configurazione

### Configurazione Globale
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Configurazione del Progetto
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoraggio e Log

### Log dell'Applicazione
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### Monitoraggio
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
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
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Comandi Avanzati

### Pipeline e CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Gestione dell'Infrastruttura
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Gestione dei Servizi
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Flussi di Lavoro Rapidi

### Flusso di Lavoro per lo Sviluppo
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### Flusso di Lavoro Multi-Ambiente
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

### Flusso di Lavoro per la Risoluzione dei Problemi
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Comandi di Debug

### Informazioni di Debug
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Debug dei Template
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Comandi per File e Directory

### Struttura del Progetto
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formattazione dell'Output

### Output JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Tabellare
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Combinazioni Comuni di Comandi

### Script di Controllo della Salute
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Validazione della Distribuzione
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Confronto tra Ambienti
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script di Pulizia delle Risorse
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variabili di Ambiente

### Variabili di Ambiente Comuni
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandi di Emergenza

### Soluzioni Rapide
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Comandi di Recupero
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Consigli Utili

### Alias per Flussi di Lavoro più Veloci
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Scorciatoie per Funzioni
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
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

**Consiglio**: Aggiungi questo cheat sheet ai segnalibri e usa `Ctrl+F` per trovare rapidamente i comandi di cui hai bisogno!

---

**Navigazione**
- **Lezione Precedente**: [Controlli Preliminari](../docs/pre-deployment/preflight-checks.md)
- **Prossima Lezione**: [Glossario](glossary.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.