# Kommandosschema - Viktiga AZD-kommandon

**Snabbreferens för alla kapitel**
- **📚 Kurshemsida**: [AZD För Nybörjare](../README.md)
- **📖 Kom igång snabbt**: [Kapitel 1: Grundläggande & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandon**: [Kapitel 2: AI-Först Utveckling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancerat**: [Kapitel 4: Infrastruktur som Kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduktion

Detta omfattande kommandosschema ger snabb referens för de mest använda Azure Developer CLI-kommandona, organiserade efter kategori med praktiska exempel. Perfekt för snabba uppslag under utveckling, felsökning och daglig hantering av azd-projekt.

## Läromål

Genom att använda detta kommandosschema kommer du att:
- Ha omedelbar tillgång till viktiga Azure Developer CLI-kommandon och syntax
- Förstå kommandosorganisering efter funktionella kategorier och användningsfall
- Ha referens till praktiska exempel för vanliga utvecklings- och distributionsscenarier
- Få tillgång till felsökningskommandon för snabb problemlösning
- Hitta avancerade konfigurations- och anpassningsalternativ effektivt
- Lokalisera kommandon för miljöhantering och flermiljöarbetsflöden

## Inlärningsresultat

Med regelbunden användning av detta kommandosschema kommer du kunna:
- Utföra azd-kommandon självsäkert utan att behöva full dokumentation
- Snabbt lösa vanliga problem med rätt diagnoskommandon
- Effektivt hantera flera miljöer och distributionsscenarier
- Använda avancerade azd-funktioner och konfigurationsalternativ vid behov
- Felsöka distributionsproblem med systematiska kommando-sekvenser
- Optimera arbetsflöden genom effektiv användning av azd-snabbkommandon och inställningar

## Kom igång-kommandon

### Autentisering
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

### Projektinitiering
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

## Kärndistributionskommandon

### Komplett distributionsarbetsflöde
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

### Endast Infrastruktur
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Endast Applikation
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Bygg och Paketera
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

> **`azd restore`** laddar ner appens beroenden (npm, pip, NuGet, Maven, etc.). Det körs automatiskt under `azd package` och `azd deploy`, så det kallar du sällan direkt – kör det manuellt för att förhämta beroenden (till exempel för att värma en CI-cache eller arbeta offline senare).

> **`azd package`** förbereder en deploybar artefakt utan att distribuera applikationstjänsten. Beteendet beror på språk och värd: containerpaketering kan använda Azure-fjärrbyggen och publicera bilder till ett register, så det är inte nödvändigtvis offline eller utan Azure-skrivningar. `azd deploy` kan paketera automatiskt; använd ett separat paketsteg när du behöver en artefakt eller en byggkontroll.


## 🌍 Miljöhantering

### Miljöoperationer
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

### Miljövariabler
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

Miljöfiler är ren text. Behandla inte `azd env set` som säker lagring; använd Key Vault-referenser eller hanterad identitet vid behov.

## ⚙️ Konfigurationskommandon

### Global Konfiguration
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

## 📊 Övervakning och Diagnostik

### Övervakningsdashboard
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

Application Insights måste konfigureras av mallen. AZD:s Live Metrics-alternativ stöds inte för närvarande för Python-applikationer; använd istället översikten, loggar eller exempelns dokumenterade spårningsarbetsflöde.

### Visa containerloggar
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics-frågor
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Underhållskommandon

### Rensning
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

### Uppdateringar
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Avancerade Kommandon

### Pipeline och CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastrukturhantering
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

### Projektinformation
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI & Tilläggskommandon

### AZD Tillägg

AI CLI-referens granskat 2026-11-04: `azd 1.37.2`, agenter `1.0.0-beta.23`, utvärderingar `1.0.0-beta.2`. Använd `azd >= 1.37.0` för den sammansatta arbetsflödet; uppgradera kärn-CLI innan inkompatibla tillägg.

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

### AI-agentkommandon
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

`--template`/`-t` ersätter den föråldrade `--manifest`/`-m` stavningen; äldre manifest behöver migreras. Det finns inget aktuellt agent-init `--host containerapp` alternativ. Hanterad-harnes, röst och långvariga förhandsvisningar behöver självständigt shell-/CI-miljögodkännande; se [AI CLI-referensen](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### AI-utvärderingar och optimering
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

Agenter beta.22 ersatte äldre utvärderingskommandon med `azd ai eval` från `azure.ai.evaluations`. Ny utvärderingskonfiguration använder camelCase-nycklar. Optimering `--config` tar en fristående optimerings-API-förfrågan, **inte** äldre `eval.yaml` eller nya `azure.eval.yaml`; använd `--eval`/`--eval-config` för återanvändning av utvärdering. Se [utvärderingsinställning](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) och [optimeringsmigrering](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP Server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Infrastrukturgenerering
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Snabba Arbetsflöden

### Utvecklingsarbetsflöde
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

### Flermiljöarbetsflöde
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

### Felsökningsarbetsflöde
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

## 🔍 Felsökningskommandon

### Felsökningsinformation
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

### Mallfelsökning
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Fil- och katalogkommandon

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

## 🎨 Utdataformatering

### JSON-utdata
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabellutdata
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Vanliga Kommando-kombinationer

### Hälsokontroll-skript
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Distributionsvalidering
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Miljöjämförelse
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Resursrensningsskript
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Miljövariabler

### Vanliga Miljövariabler
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

## 🚨 Akutkommandon

### Snabba fixar
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

### Återställningskommandon
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Proffstips

### Alias för snabbare arbetsflöde
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktionsgenvägar
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

## 📖 Hjälp och Dokumentation

### Få hjälp
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

### Dokumentationslänkar
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tips**: Bokmärk detta kommandosschema och använd `Ctrl+F` för att snabbt hitta de kommandon du behöver!

---

**Navigering**
- **Föregående lektion**: [Förhandskontroller](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Nästa lektion**: [Ordlista](glossary.md)

---

> **💡 Vill du ha Azure-kommandohjälp i din editor?** Installera [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 färdigheter för AI, Foundry, distribution, diagnostik med mera.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->