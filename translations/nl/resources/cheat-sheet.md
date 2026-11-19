# Command Cheat Sheet - Essentiële AZD Commando's

**Snelle Referentie voor Alle Hoofdstukken**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../README.md)
- **📖 Snel Starten**: [Hoofdstuk 1: Fundament & Snel Starten](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commando's**: [Hoofdstuk 2: AI-First Ontwikkeling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Geavanceerd**: [Hoofdstuk 4: Infrastructuur als Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introductie

Dit uitgebreide cheat sheet biedt een snelle referentie voor de meest gebruikte Azure Developer CLI-commando's, georganiseerd per categorie met praktische voorbeelden. Perfect voor snelle opzoekingen tijdens ontwikkeling, probleemoplossing en dagelijkse werkzaamheden met azd projecten.

## Leerdoelen

Door dit cheat sheet te gebruiken, zult u:
- Direct toegang hebben tot essentiële Azure Developer CLI-commando's en syntax
- Begrijpen hoe commando's georganiseerd zijn per functionele categorieën en gebruiksscenario's
- Praktische voorbeelden raadplegen voor veelvoorkomende ontwikkel- en implementatiescenario's
- Toegang hebben tot probleemoplossingscommando's voor snelle oplossingsmethoden
- Geavanceerde configuratie- en aanpassingsopties efficiënt vinden
- Commando's vinden voor omgevingsbeheer en multi-omgeving workflows

## Leerresultaten

Bij regelmatige raadpleging van dit cheat sheet zult u in staat zijn om:
- azd-commando's vol vertrouwen uit te voeren zonder steeds de volledige documentatie te raadplegen
- Veelvoorkomende problemen snel op te lossen met geschikte diagnostische commando's
- Meerdere omgevingen en implementatiescenario's efficiënt te beheren
- Geavanceerde azd functies en configuratieopties toe te passen indien nodig
- Implementatieproblemen systematisch op te lossen met een reeks commando's
- Workflows te optimaliseren door effectief gebruik van azd snelkoppelingen en opties

## Commando's om te Beginnen

### Authenticatie
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

### Projectinitialisatie
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

## Kernimplementatiecommando's

### Complete Implementatieworkflow
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

### Alleen Infrastructuur
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Alleen Applicatie
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Builden en Verpakken
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

> **`azd restore`** downloadt de afhankelijkheden van uw app (npm, pip, NuGet, Maven, enz.). Het wordt automatisch uitgevoerd tijdens `azd package` en `azd deploy`, dus u hoeft het zelden rechtstreeks aan te roepen—voer het handmatig uit om afhankelijkheden voor te laden (bijvoorbeeld om een CI-caching te verwarmen of later offline te werken).

> **`azd package`** bereidt een implementeerbaar artefact voor zonder de applicatiedienst te implementeren. Het gedrag is afhankelijk van de taal en host: containerverpakking kan Azure remote builds gebruiken en afbeeldingen publiceren naar een register, dus het is niet per se offline of vrij van Azure-schrijfbewerkingen. `azd deploy` kan automatisch verpakken; gebruik een aparte package stap wanneer u een artefact of een buildcontrole nodig heeft.


## 🌍 Omgevingsbeheer

### Omgevingsoperaties
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

### Omgevingsvariabelen
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

Omgevingsbestanden zijn platte tekst. Behandel `azd env set` niet als opslag voor geheimen; gebruik Key Vault-verwijzingen of beheerde identiteit waar passend.

## ⚙️ Configuratiecommando's

### Globale Configuratie
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

### Projectconfiguratie
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoring en Diagnostiek

### Monitoring Dashboard
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

Application Insights moet geconfigureerd zijn door de template. De Live Metrics-optie van AZD wordt momenteel niet ondersteund voor Python-applicaties; gebruik in plaats daarvan het overzicht, logs, of de gedocumenteerde tracing workflow van het voorbeeld.

### Container Logs Bekijken
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics Query's
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Onderhoudscommando's

### Opschonen
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

## 🔧 Geavanceerde Commando's

### Pipeline en CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastructuurbeheer
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

### Projectinformatie
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI & Extensies Commando's

### AZD Extensies

Foundry GA verwijzing bijgewerkt 2026-11-09: `microsoft.foundry` bundel 1.0, aangekondigd op [5 november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Gebruik `azd >= 1.37.0`; componenten zijn onafhankelijk versiebeheer en optionele previewfuncties behouden hun eigen status.

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

De bundel bevat geen evaluaties, datasets, fine-tuning of aangepaste modellen. Het installeren van individuele kernextensies blijft ondersteund. Volg de [GA hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) voor een uitvoerbaar voorbeeld met Python 3.13+, huidige uv, permissies en modelquotum.

### AI Agent Commando's
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

`--template`/`-t` vervangt de verouderde `--manifest`/`-m` spelling; legacy manifests moeten worden gemigreerd. Er is momenteel geen agent-init `--host containerapp` optie. Managed-harness, voice en langlopende previews hebben onafhankelijke shell/CI omgeving opt-ins nodig; zie de [AI CLI referentie](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Lokale testen gebruikt nog steeds Azure modelimplementaties en brengt kosten met zich mee. Voor opschoning verwijdert `azd down` de resourcegroep van een pas aangemaakt Foundry-project, maar laat hergebruikte projectbronnen intact; verwijder alleen ongewenste bronnen die u apart bezit.

### AI Evaluaties en Optimalisatie
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

Agents beta.22 verving legacy evaluatiecommando's door `azd ai eval` van `azure.ai.evaluations`. Nieuwe evaluatieconfiguratie gebruikt camelCase keys. Optimalisatie `--config` neemt een zelfstandige optimalisatie API-aanroep, **niet** legacy `eval.yaml` of nieuwe `azure.eval.yaml`; gebruik `--eval`/`--eval-config` voor hergebruik van evaluaties. Zie [evaluatie-instelling](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) en [optimalisatie migratie](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

De runner-fragment is geen complete workflow. Commit geëvalueerde configuratie en niet-geheime assets, verleen dataset/evaluator/model toegang en gebruik een aparte omgeving per fase. Zie het [geauthenticeerde CI/CD voorbeeld](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Infrastructuurgeneratie
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Snelle Workflows

### Ontwikkelworkflow
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

### Multi-Omgevingsworkflow
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

### Probleemoplossingsworkflow
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

## 🔍 Debugcommando's

### Debuginformatie
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

### Template Debugging
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Bestands- en Mapcommando's

### Projectstructuur
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Output Formatting

### JSON Output
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabel Output
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Veelvoorkomende Combinaties van Commando's

### Health Check Script
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Implementatievalidatie
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Omgevingsvergelijking
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Resource Opschoningsscript
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Omgevingsvariabelen

### Veelvoorkomende Omgevingsvariabelen
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

## 🚨 Noodcommando's

### Snelle Oplossingen
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

### Herstelcommando's
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

### Aliassen voor Snellere Workflows
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Functiesnelkoppelingen
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

## 📖 Hulp en Documentatie

### Hulp Krijgen
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

### Documentatielinks
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tip**: Blader dit cheat sheet toe en gebruik `Ctrl+F` om snel de commando's te vinden die u nodig heeft!

---

**Navigatie**
- **Vorige Les**: [Preflight Checks](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Volgende Les**: [Glossarium](glossary.md)

---

> **💡 Wilt u Azure-commando hulp in uw editor?** Installeer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) met `npx skills add microsoft/github-copilot-for-azure` — 37 vaardigheden voor AI, Foundry, implementatie, diagnostiek en meer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->