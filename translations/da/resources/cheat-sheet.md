# Kommandovejledning - Væsentlige AZD-kommandoer

**Hurtig reference for alle kapitler**
- **📚 Kursusforside**: [AZD For Begyndere](../README.md)
- **📖 Kom Godt I Gang**: [Kapitel 1: Fundament & Kom Godt I Gang](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Kommandoer**: [Kapitel 2: AI-Først Udvikling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanceret**: [Kapitel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduktion

Denne omfattende kommandovejledning giver hurtig reference til de mest brugte Azure Developer CLI-kommandoer, organiseret efter kategori med praktiske eksempler. Perfekt til hurtige opslag under udvikling, fejlfinding og daglige operationer med azd-projekter.

## Læringsmål

Ved at bruge denne kommandovejledning vil du:
- Have øjeblikkelig adgang til væsentlige Azure Developer CLI-kommandoer og syntaks
- Forstå kommandosystematikken efter funktionelle kategorier og anvendelsestilfælde
- Kunne referere praktiske eksempler på almindelige udviklings- og udrulningsscenarier
- Få adgang til fejlfindingkommandoer til hurtig problemløsning
- Find avancerede konfigurations- og tilpasningsmuligheder effektivt
- Lokalisere miljøstyring og multi-miljø arbejdsflowkommandoer

## Læringsresultater

Ved regelmæssigt at referere til denne kommandovejledning vil du kunne:
- Udføre azd-kommandoer trygt uden at skulle konsultere fuld dokumentation
- Hurtigt løse almindelige problemer med passende diagnostiske kommandoer
- Effektivt administrere flere miljøer og udrulningsscenarier
- Anvende avancerede azd-funktioner og konfigurationsmuligheder efter behov
- Fejlsøge udrulningsproblemer med systematiske kommando-sekvenser
- Optimere arbejdsforløb gennem effektiv brug af azd-genveje og muligheder

## Begynd med Kommandoer

### Godkendelse
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

### Projektinitialisering
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

## Grundlæggende Udrulningskommandoer

### Fuld Udrulningsproces
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

### Kun Infrastruktur
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Kun Applikation
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Byg og Pak
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

> **`azd restore`** henter afhængigheder til din app (npm, pip, NuGet, Maven osv.). Den kører automatisk under `azd package` og `azd deploy`, så du kalder den sjældent direkte – kør den manuelt for at hente afhængigheder på forhånd (for eksempel til at varme en CI-cache op eller arbejde offline bagefter).

> **`azd package`** forbereder et deployérbart artefakt uden at udrulle applikationstjenesten. Adfærden afhænger af sproget og vært: containerpakning kan bruge Azure fjernbyg og publicere billeder til et register, så det er ikke nødvendigvis offline eller uden Azure-skrivelser. `azd deploy` kan pakke automatisk; brug et separat pakketrin, når du har brug for et artefakt eller en build-check.


## 🌍 Miljøstyring

### Miljøhandlinger
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

### Miljøvariabler
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

Miljøfiler er klartekst. Behandl ikke `azd env set` som hemmelig opbevaring; brug Key Vault-referencer eller administreret identitet efter behov.

## ⚙️ Konfigurationskommandoer

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

## 📊 Overvågning og Diagnostik

### Overvågningsdashboard
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

Application Insights skal være konfigureret af skabelonen. AZD's Live Metrics funktion understøttes indtil videre ikke for Python-applikationer; brug oversigten, logs eller eksemplets dokumenterede tracing-arbejdsflow i stedet.

### Visning af Container-Logs
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics Spørgsmål
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Vedligeholdelseskommandoer

### Oprydning
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

### Opdateringer
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Avancerede Kommandoer

### Pipeline og CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastrukturstyring
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

## 🤖 AI & Udvidelseskommandoer

### AZD Udvidelser

AI CLI-reference gennemgået 2026-11-04: `azd 1.37.2`, agenter `1.0.0-beta.23`, evalueringer `1.0.0-beta.2`. Brug `azd >= 1.37.0` til det samlede arbejdsflow; opgrader den centrale CLI før inkompatible udvidelser.

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

### AI Agent Kommandoer
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

`--template`/`-t` erstatter den forældede `--manifest`/`-m` stavemåde; gamle manifests skal flyttes. Der findes ikke et aktuelt agent-init `--host containerapp`-valg. Managed-harness, voice og langvarige forhåndsvisninger kræver uafhængig shell/CI miljø-tilmelding; se [AI CLI reference](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### AI Evalueringer og Optimering
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

Agenter beta.22 erstattede gamle evalueringskommandoer med `azd ai eval` fra `azure.ai.evaluations`. Ny evalueringskonfiguration bruger camelCase-nøgler. Optimerings-`--config` tager en selvstændig optimerings-API-anmodning, **ikke** gamle `eval.yaml` eller nye `azure.eval.yaml`; brug `--eval`/`--eval-config` til genbrug af evalueringer. Se [evalueringsopsætning](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) og [optimeringsmigration](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP Server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Infrastruktur Generering
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Hurtige Arbejdsflow

### Udviklingsarbejdsflow
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

### Multi-Miljø Arbejdsflow
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

### Fejlfinding Arbejdsflow
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

## 🔍 Debugging Kommandoer

### Debug Information
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

### Skabelon Debugging
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Fil- og Biblioteks Kommandoer

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

## 🎨 Outputformatering

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

## 🔧 Almindelige Kommando Kombinationer

### Health Check Script
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Udrulningsvalidering
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Miljøsammenligning
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Ressourceoprydningsscript
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Miljøvariabler

### Almindelige Miljøvariabler
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

## 🚨 Nødsituation Kommandoer

### Hurtige Rettelser
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

### Gendannelseskommandoer
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

### Aliaser for Hurtigere Arbejdsflow
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktionsgenveje
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

## 📖 Hjælp og Dokumentation

### Få Hjælp
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

**Tip**: Bogmærk denne kommandovejledning og brug `Ctrl+F` til hurtigt at finde de kommandoer, du har brug for!

---

**Navigation**
- **Forrige Lektion**: [Preflight Checks](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Næste Lektion**: [Ordlist](glossary.md)

---

> **💡 Vil du have Azure-kommando hjælp i din editor?** Installer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 færdigheder til AI, Foundry, udrulning, diagnostik og mere.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->