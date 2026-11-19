# Kommandovejledning - Væsentlige AZD Kommandoer

**Hurtig Reference for Alle Kapitler**
- **📚 Kursushjem**: [AZD For Begyndere](../README.md)
- **📖 Hurtig Start**: [Kapitel 1: Grundlag & Hurtig Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Kommandoer**: [Kapitel 2: AI-Første Udvikling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanceret**: [Kapitel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduktion

Denne omfattende snydeark giver hurtig reference til de mest anvendte Azure Developer CLI-kommandoer, organiseret efter kategori med praktiske eksempler. Perfekt til hurtige opslag under udvikling, fejlfinding og daglige operationer med azd-projekter.

## Læringsmål

Ved at bruge dette snydeark vil du:
- Have øjeblikkelig adgang til væsentlige Azure Developer CLI-kommandoer og syntaks
- Forstå kommandoorganisering efter funktionelle kategorier og anvendelsestilfælde
- Referere til praktiske eksempler på almindelige udviklings- og deploymentscenarier
- Få adgang til fejlfindingkommandoer for hurtig løsning af problemer
- Efficient finde avancerede konfigurations- og tilpasningsmuligheder
- Lokalisere miljøstyring og multi-miljø workflow-kommandoer

## Læringsresultater

Ved regelmæssig reference til dette snydeark vil du kunne:
- Udføre azd-kommandoer sikkert uden at skulle slå op i fuld dokumentation
- Hurtigt løse almindelige problemer med passende diagnostiske kommandoer
- Effektivt styre flere miljøer og deploymentscenarier
- Anvende avancerede azd-funktioner og konfigurationsmuligheder efter behov
- Fejlfinding af deploymentsproblemer ved hjælp af systematiske kommando-sekvenser
- Optimere workflows gennem effektiv brug af azd-genveje og muligheder

## Kom godt i gang Kommandoer

### Autentificering
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

## Kerne-Deployment Kommandoer

### Fuldt Deployment Workflow
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

> **`azd restore`** downloader dine apps afhængigheder (npm, pip, NuGet, Maven osv.). Den kører automatisk under `azd package` og `azd deploy`, så du kalder den sjældent direkte – kør den manuelt for forhåndshentning af afhængigheder (for eksempel for at varme en CI-cache op eller arbejde offline bagefter).

> **`azd package`** forbereder en deployerbar artefakt uden at deploye applikationstjenesten. Adfærden afhænger af sprog og vært: containerpakning kan bruge Azure fjernbygninger og publicere billeder til et register, så det er ikke nødvendigvis offline eller uden Azure-skrivelser. `azd deploy` kan pakke automatisk; brug et separat pakketrin, når du har brug for en artefakt eller en byggesjek.


## 🌍 Miljøstyring

### Miljøoperationer
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

Miljøfiler er tekstfiler. Behandl ikke `azd env set` som hemmelig lagring; brug Key Vault-referencer eller administreret identitet efter behov.

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

Application Insights skal konfigureres af skabelonen. AZDs Live Metrics mulighed understøttes ikke aktuelt for Python-applikationer; brug oversigten, logs eller eksemplets dokumenterede sporing-workflow i stedet.

### Visning af Container-logs
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics Forespørgsler
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

Foundry GA reference opdateret 2026-11-09: `microsoft.foundry` bundle 1.0, annonceret [5. november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Brug `azd >= 1.37.0`; komponenter er uafhængigt versionerede, og valgfrie preview-funktioner beholder deres egen status.

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

Bundtet inkluderer ikke evalueringer, datasæt, finjustering eller tilpassede modeller. Installation af individuelle kerneudvidelser er fortsat understøttet. Følg [GA hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) for et køreklar eksempel med Python 3.13+, aktuelle uv, tilladelser og modelkvote.

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

`--template`/`-t` erstatter den udfasede `--manifest`/`-m` stavemåde; ældre manifests skal migreres. Der findes ikke en aktuel agent-init `--host containerapp` mulighed. Managed-harness, voice og langvarige previews kræver selvstændige shell/CI miljø opt-ins; se [AI CLI reference](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Lokal test bruger stadig Azure model-udrulninger og påfører omkostninger. Til oprydning sletter `azd down` en nyligt oprettet Foundry-projekts ressourcegruppe, men efterlader genbrugte projekt-ressourcer på plads; fjern kun uønskede ressourcer, du ejer separat.

### AI Evalueringer og Optimering
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

Agents beta.22 erstattede ældre evalueringskommandoer med `azd ai eval` fra `azure.ai.evaluations`. Ny evalueringskonfiguration bruger camelCase nøgler. Optimerings-`--config` tager en selvstændig optimerings-API anmodning, **ikke** ældre `eval.yaml` eller nye `azure.eval.yaml`; brug `--eval`/`--eval-config` til evaluering-genbrug. Se [evalueringsopsætning](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) og [optimeringsmigrering](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Runner-fragmentet er ikke et komplet workflow. Commit gennemgået evalueringskonfiguration og ikke-hemmelige aktiver, tildel datasæt/evaluator/model adgang, og brug et miljø per trin. Se [autentificeret CI/CD eksempel](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

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

## 🎯 Hurtige Workflows

### Udviklingsworkflow
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

### Multi-miljø Workflow
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

### Fejlfinding Workflow
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

## 🔍 Debug Kommandoer

### Debug Oplysninger
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

## 📁 Fil- og Bibliotekskommandoer

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

### Tabeloutput
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Almindelige Kommando Kombinationsmuligheder

### Sundhedstjek Script
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Deployment Validering
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Miljø Sammenligning
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Ressource Oprydningsscript
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

## 🚨 Nødkald

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

### Genopretningskommandoer
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

### Alias for Hurtigere Workflow
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

**Tip**: Bogmærk dette snydeark og brug `Ctrl+F` for hurtigt at finde de kommandoer, du har brug for!

---

**Navigation**
- **Forrige Lektion**: [Preflight Checks](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Næste Lektion**: [Ordliste](glossary.md)

---

> **💡 Ønsker du Azure kommandohjælp i din editor?** Installer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 færdigheder til AI, Foundry, deployment, diagnostik og mere.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->