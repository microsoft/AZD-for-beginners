# Befehlsübersicht - Wichtige AZD-Befehle

**Schnellübersicht für alle Kapitel**
- **📚 Kursstartseite**: [AZD für Einsteiger](../README.md)
- **📖 Schnellstart**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 KI-Befehle**: [Kapitel 2: KI-First Entwicklung](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Fortgeschritten**: [Kapitel 4: Infrastruktur als Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Einführung

Dieses umfassende Spickzettel bietet eine schnelle Übersicht der am häufigsten verwendeten Azure Developer CLI-Befehle, nach Kategorien mit praktischen Beispielen geordnet. Perfekt für schnelles Nachschlagen während der Entwicklung, Fehlersuche und dem täglichen Betrieb mit azd-Projekten.

## Lernziele

Durch die Verwendung dieses Spickzettels werden Sie:
- Sofortigen Zugriff auf wichtige Azure Developer CLI-Befehle und Syntax haben
- Die Befehlsorganisation nach Funktionskategorien und Anwendungsfällen verstehen
- Praktische Beispiele für gängige Entwicklungs- und Bereitstellungsszenarien nachschlagen
- Fehlerbehebungsbefehle für schnelle Problemlösung nutzen
- Fortgeschrittene Konfigurations- und Anpassungsoptionen effizient finden
- Befehle zur Verwaltung von Umgebungen und Multi-Umgebungs-Workflows lokalisieren

## Lernergebnisse

Durch regelmäßige Nutzung dieses Spickzettels werden Sie in der Lage sein:
- Azd-Befehle sicher auszuführen, ohne die komplette Dokumentation zu benötigen
- Häufige Probleme schnell mit geeigneten Diagnosebefehlen zu lösen
- Mehrere Umgebungen und Bereitstellungsszenarien effizient zu verwalten
- Fortgeschrittene azd-Funktionen und Konfigurationsoptionen bei Bedarf anzuwenden
- Bereitstellungsprobleme mit systematischen Befehlsfolgen zu beheben
- Arbeitsabläufe durch den effektiven Einsatz von azd-Verknüpfungen und Optionen zu optimieren

## Erste Befehle zum Einstieg

### Authentifizierung
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

### Projektinitialisierung
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

## Kernbefehle zur Bereitstellung

### Vollständiger Bereitstellungs-Workflow
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

### Nur Infrastruktur
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Nur Anwendung
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Bauen und Verpacken
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

> **`azd restore`** lädt die Abhängigkeiten Ihrer App herunter (npm, pip, NuGet, Maven, etc.). Es wird automatisch während `azd package` und `azd deploy` ausgeführt, daher wird es selten direkt aufgerufen — führen Sie es manuell aus, um Abhängigkeiten vorab zu laden (z. B. um einen CI-Cache zu füllen oder später offline zu arbeiten).

> **`azd package`** bereitet ein bereitstellbares Artefakt vor, ohne den Anwendungsdienst bereitzustellen. Das Verhalten hängt von der Sprache und dem Host ab: Container-Packaging kann Azure Remote Builds nutzen und Images in ein Registry veröffentlichen, daher ist es nicht unbedingt offline oder Azure-schreibfrei. `azd deploy` kann automatisch verpacken; verwenden Sie einen separaten Verpackungsschritt, wenn Sie ein Artefakt oder eine Build-Prüfung benötigen.


## 🌍 Umgebung verwalten

### Umgebungsfunktionen
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

### Umgebungsvariablen
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

Umgebungsdateien sind Klartext. Behandeln Sie `azd env set` nicht als Geheimspeicher; verwenden Sie Key Vault-Verweise oder verwaltete Identität entsprechend.

## ⚙️ Konfigurationsbefehle

### Globale Konfiguration
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

### Projektkonfiguration
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoring und Diagnose

### Monitoring-Dashboard
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

Application Insights muss durch die Vorlage konfiguriert sein. AZDs Live-Metriken-Option wird derzeit für Python-Anwendungen nicht unterstützt; nutzen Sie stattdessen die Übersicht, Protokolle oder den dokumentierten Tracing-Workflow der Beispielanwendung.

### Container-Logs anzeigen
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics Queries
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Wartungsbefehle

### Aufräumen
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

### Updates
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Fortgeschrittene Befehle

### Pipeline und CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastrukturverwaltung
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

### Projektinformationen
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 KI- und Erweiterungsbefehle

### AZD-Erweiterungen

KI-CLI-Referenz geprüft am 2026-11-04: `azd 1.37.2`, Agenten `1.0.0-beta.23`, Auswertungen `1.0.0-beta.2`. Verwenden Sie `azd >= 1.37.0` für den kombinierten Workflow; aktualisieren Sie die Kern-CLI vor inkompatiblen Erweiterungen.

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

### KI-Agent-Befehle
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

`--template`/`-t` ersetzt die veraltete Schreibweise `--manifest`/`-m`; alte Manifeste müssen migriert werden. Es gibt derzeit keine agent-init `--host containerapp` Option. Managed-Harness, Voice- und langlaufende Vorschauen benötigen unabhängige Shell-/CI-Umgebungs-Opt-ins; siehe die [KI-CLI-Referenz](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### KI-Auswertungen und Optimierung
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

Agenten beta.22 haben veraltete Auswertungsbefehle durch `azd ai eval` von `azure.ai.evaluations` ersetzt. Neue Auswertungskonfiguration nutzt camelCase-Schlüssel. Optimierung `--config` erfordert eine eigenständige Optimierungs-API-Anfrage, **nicht** veraltete `eval.yaml` oder neue `azure.eval.yaml`; verwenden Sie `--eval`/`--eval-config` zur Wiederverwendung von Auswertungen. Siehe [Auswertungs-Setup](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) und [Optimierungs-Migration](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP-Server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Infrastrukturerstellung
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Schnell-Workflows

### Entwicklungs-Workflow
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

### Multi-Umgebungs-Workflow
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

### Fehlersuch-Workflow
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

## 🔍 Debugging-Befehle

### Debug-Informationen
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

### Template-Debugging
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Datei- und Verzeichnisbefehle

### Projektstruktur
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Ausgabeformatierung

### JSON-Ausgabe
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabellen-Ausgabe
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Häufig genutzte Befehlskombinationen

### Health-Check-Skript
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Bereitstellungsvalidierung
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Umgebungsvergleich
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Ressourcen-Aufräum-Skript
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Umgebungsvariablen

### Gängige Umgebungsvariablen
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

## 🚨 Notfallbefehle

### Schnelle Korrekturen
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

### Wiederherstellungsbefehle
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profi-Tipps

### Aliase für schnelleren Workflow
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktionsverknüpfungen
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

## 📖 Hilfe und Dokumentation

### Hilfe erhalten
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

### Dokumentationslinks
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tipp**: Lesezeichen für diesen Spickzettel setzen und `Ctrl+F` verwenden, um schnell die benötigten Befehle zu finden!

---

**Navigation**
- **Vorherige Lektion**: [Preflight Checks](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Nächste Lektion**: [Glossar](glossary.md)

---

> **💡 Möchten Sie Azure-Befehlshilfe in Ihrem Editor?** Installieren Sie [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) mit `npx skills add microsoft/github-copilot-for-azure` — 37 Skills für KI, Foundry, Bereitstellung, Diagnose und mehr.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->