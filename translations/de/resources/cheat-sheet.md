# Befehls-Spickzettel - Wichtige AZD-Befehle

**Schnellreferenz für alle Kapitel**
- **📚 Kursstartseite**: [AZD für Anfänger](../README.md)
- **📖 Schnellstart**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 KI-Befehle**: [Kapitel 2: KI-First-Entwicklung](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Fortgeschritten**: [Kapitel 4: Infrastruktur als Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Einführung

Dieses umfassende Spickzettel bietet eine Schnellreferenz für die am häufigsten verwendeten Azure Developer CLI-Befehle, nach Kategorien mit praktischen Beispielen organisiert. Perfekt für schnelle Nachschläge während der Entwicklung, Fehlerbehebung und dem täglichen Betrieb mit azd-Projekten.

## Lernziele

Durch die Verwendung dieses Spickzettels wirst du:
- Sofortigen Zugriff auf wesentliche Azure Developer CLI-Befehle und Syntax haben
- Die Befehlsorganisation nach funktionalen Kategorien und Anwendungsfällen verstehen
- Praktische Beispiele für häufige Entwicklungs- und Bereitstellungsszenarien nachschlagen
- Fehlerbehebungsbefehle für schnelle Problemlösungen nutzen
- Effizient erweiterte Konfigurations- und Anpassungsoptionen finden
- Befehle für Umweltverwaltung und Multi-Umgebungs-Workflows lokalisieren

## Lernergebnisse

Mit regelmäßiger Nutzung dieses Spickzettels wirst du in der Lage sein:
- Azd-Befehle sicher auszuführen, ohne die vollständige Dokumentation zu konsultieren
- Häufige Probleme schnell mit passenden Diagnosebefehlen zu beheben
- Mehrere Umgebungen und Bereitstellungsszenarien effizient zu verwalten
- Erweiterte azd-Funktionen und Konfigurationsoptionen bei Bedarf anzuwenden
- Bereitstellungsprobleme systematisch mit Befehlsfolgen zu beheben
- Workflows durch effektive Nutzung von azd-Verknüpfungen und Optionen zu optimieren

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

## Kern-Bereitstellungsbefehle

### Komplett-Bereitstellungsworkflow
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

> **`azd restore`** lädt die Abhängigkeiten deiner App herunter (npm, pip, NuGet, Maven usw.). Es wird automatisch während `azd package` und `azd deploy` ausgeführt, daher rufst du es selten direkt auf – manuelles Ausführen dient zum Vorladen von Abhängigkeiten (z. B. zum Aufwärmen eines CI-Caches oder für Offlinearbeit danach).

> **`azd package`** bereitet ein deploybares Artefakt vor, ohne den Anwendungservice bereitzustellen. Das Verhalten hängt von Sprache und Host ab: Container-Packaging kann Azure-Remote-Builds verwenden und Images in ein Register veröffentlichen, es ist daher nicht zwingend offline oder frei von Azure-Schreibvorgängen. `azd deploy` kann automatisch paketieren; verwende einen separaten Verpackungsschritt, wenn du ein Artefakt oder einen Build-Check benötigst.


## 🌍 Umweltverwaltung

### Umweltoperationen
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

Umgebungsdateien sind Klartext. Behandle `azd env set` nicht als geheime Speicher; verwende Key Vault-Verweise oder verwaltete Identitäten je nach Bedarf.

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

## 📊 Überwachung und Diagnose

### Überwachungs-Dashboard
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

Application Insights muss durch die Vorlage konfiguriert werden. AZDs Live Metrics-Option wird aktuell für Python-Anwendungen nicht unterstützt; nutze stattdessen die Übersicht, Logs oder den dokumentierten Tracing-Workflow des Samples.

### Container-Logs anzeigen
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics-Abfragen
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

## 🔧 Erweiterte Befehle

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

## 🤖 KI- & Erweiterungsbefehle

### AZD-Erweiterungen

Foundry GA-Referenz aktualisiert 2026-11-09: `microsoft.foundry` Bundle 1.0, angekündigt am [5. November 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Verwende `azd >= 1.37.0`; Komponenten sind unabhängig versioniert und optionale Vorabfunktionen behalten ihren eigenen Status.

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

Das Bundle enthält keine Auswertungen, Datensätze, Feineinstellung oder benutzerdefinierte Modelle. Die Installation einzelner Korerweiterungen bleibt unterstützt. Folge dem [GA Hosted-Agent-Durchgang](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) für ein ausführbares Beispiel mit Python 3.13+, aktuellem uv, Berechtigungen und Modellkontingent.

### KI-Agentenbefehle
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

`--template`/`-t` ersetzt die veraltete `--manifest`/`-m` Schreibweise; Legacy-Manifeste müssen migriert werden. Es gibt aktuell keine agent-init `--host containerapp` Option. Managed Harness, Voice- und Langzeit-Vorabversionen benötigen unabhängige Shell/CI-Environment-Opt-Ins; siehe die [KI-CLI-Referenz](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Lokales Testen nutzt weiterhin Azure-Modellbereitstellungen und verursacht Kosten. Zum Aufräumen löscht `azd down` die neu erstellte Resource-Gruppe eines Foundry-Projekts, lässt aber Ressourcen von Wiederverwendungsprojekten bestehen; entferne nur unerwünschte Ressourcen, die du separat besitzt.

### KI-Auswertungen und Optimierung
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

Agenten beta.22 ersetzten Legacy-Auswertungsbefehle durch `azd ai eval` aus `azure.ai.evaluations`. Neue Auswertungskonfiguration nutzt camelCase-Schlüssel. Optimierung `--config` nimmt eine eigenständige Optimierungs-API-Anfrage entgegen, **nicht** Legacy `eval.yaml` oder neue `azure.eval.yaml`; verwende `--eval`/`--eval-config` zur Wiederverwendung von Auswertungen. Siehe [Auswertungseinrichtung](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) und [Optimierungs-Migration](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Das Runner-Fragment ist kein vollständiger Workflow. Übergebe überprüfte Auswertungskonfiguration und nicht geheime Assets, erteile Dataset-/Evaluator-/Modellzugriff und verwende pro Stufe eine Umgebung. Siehe das [authentifizierte CI/CD-Beispiel](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

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

## 🎯 Schnelle Workflows

### Entwicklungsworkflow
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

### Fehlerbehebungsworkflow
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

## 🔧 Häufige Befehlskombinationen

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

### Umgebung-Vergleich
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

### Häufige Umgebungsvariablen
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

### Schnelle Fehlerbehebungen
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
- **Vorige Lektion**: [Preflight Checks](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Nächste Lektion**: [Glossar](glossary.md)

---

> **💡 Möchtest du Azure-Befehle in deinem Editor?** Installiere [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) mit `npx skills add microsoft/github-copilot-for-azure` — 37 Skills für KI, Foundry, Bereitstellung, Diagnose und mehr.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->