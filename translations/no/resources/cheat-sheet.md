# Kommandojukselapp - Essensielle AZD-kommandoer

**Rask Referanse for Alle Kapitler**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **📖 Komme i Gang**: [Kapittel 1: Grunnlag & Komme i Gang](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Kommandoer**: [Kapittel 2: AI-Først Utvikling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansert**: [Kapittel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduksjon

Denne omfattende jukselappen gir rask referanse til de mest brukte Azure Developer CLI-kommandoene, organisert etter kategori med praktiske eksempler. Perfekt for raske oppslag under utvikling, feilsøking og daglige operasjoner med azd-prosjekter.

## Læringsmål

Ved å bruke denne jukselappen vil du:
- Ha øyeblikkelig tilgang til essensielle Azure Developer CLI-kommandoer og syntaks
- Forstå kommandoorganisering etter funksjonelle kategorier og bruksområder
- Referere til praktiske eksempler for vanlige utviklings- og distribusjonsscenarier
- Få tilgang til feilsøkingskommandoer for rask problemløsning
- Finne avanserte konfigurasjons- og tilpasningsmuligheter effektivt
- Lete opp miljøhåndtering og arbeidsflyt med flere miljøkommandoer

## Læringsresultater

Med regelmessig bruk av denne jukselappen vil du kunne:
- Utføre azd-kommandoer trygt uten å måtte referere til full dokumentasjon
- Raskt løse vanlige problemer med passende diagnostiske kommandoer
- Effektivt administrere flere miljøer og distribusjonsscenarier
- Bruke avanserte azd-funksjoner og konfigurasjonsalternativer ved behov
- Feilsøke distribusjonsproblemer med systematiske kommandosekvenser
- Optimalisere arbeidsflyter gjennom effektiv bruk av azd-snarveier og alternativer

## Kommandoer for å Komme i Gang

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

### Initialisering av Prosjekt
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

## Kjernekommandoer for Distribusjon

### Komplett Distribusjonsarbeidsflyt
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

### Kun Applikasjon
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Bygg og Pakk
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

> **`azd restore`** laster ned appens avhengigheter (npm, pip, NuGet, Maven, osv.). Den kjører automatisk under `azd package` og `azd deploy`, så du kaller den sjelden direkte — kjør den manuelt for å forhåndsinnhente avhengigheter (for eksempel for å varme en CI-cache eller jobbe offline etterpå).

> **`azd package`** forbereder en deployerbar artifact uten å distribuere applikasjonstjenesten. Oppførselen avhenger av språk og vert: container-pakking kan bruke Azure eksterne bygg og publiserer bilder til et register, så det er ikke nødvendigvis offline eller uten Azure-skrivinger. `azd deploy` kan pakke automatisk; bruk et eget pakketrinn når du trenger en artifact eller en bygge-sjekk.


## 🌍 Miljøhåndtering

### Miljøoperasjoner
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

Miljøfiler er ren tekst. Ikke bruk `azd env set` som hemmelig lagring; bruk Key Vault-referanser eller administrert identitet etter behov.

## ⚙️ Konfigurasjonskommandoer

### Global Konfigurasjon
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

### Prosjektkonfigurasjon
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Overvåking og Diagnostikk

### Overvåkingsdashbord
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

Application Insights må konfigureres av malen. AZDs Live Metrics-alternativ støttes ikke for øyeblikket for Python-applikasjoner; bruk oversikten, logger eller den dokumenterte sporingens arbeidsflyt for eksemplet i stedet.

### Vise containerlogger
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics-spørringer
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Vedlikeholdskommandoer

### Rydding
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

### Oppdateringer
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Avanserte Kommandoer

### Pipeline og CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastrukturhåndtering
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

### Prosjektinformasjon
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI & Ekstensionskommandoer

### AZD Ekstensions

Foundry GA-referanse oppdatert 2026-11-09: `microsoft.foundry` bundle 1.0, kunngjort [5. november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Bruk `azd >= 1.37.0`; komponenter er uavhengig versjonert, og valgfrie forhåndsvisningsfunksjoner beholder sin egen status.

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

Bunten inkluderer ikke evalueringer, datasett, finjustering eller tilpassede modeller. Installasjon av individuelle kjernekstillegg støttes fortsatt. Følg [GA hosted-agent gjennomgang](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) for et kjørbart eksempel med Python 3.13+, nåværende uv, tillatelser og modellkvote.

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

`--template`/`-t` erstatter den foreldede `--manifest`/`-m` stavemåten; gamle manifest må migreres. Det finnes ingen nåværende agent-init `--host containerapp` opsjon. Administrert-harness, stemme og langvarige forhåndsvisninger trenger uavhengige shell/CI-miljø-opt-ins; se [AI CLI referanse](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Lokal testing bruker fortsatt Azure-modellutplasseringer og medfører kostnader. For rydding sletter `azd down` nettopp opprettet Foundry-prosjekts ressursgruppe, men lar ressurser fra gjenbrukte prosjekter være på plass; fjern kun uønskede ressurser du eier separat.

### AI Evalueringer og Optimalisering
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

Agentene beta.22 erstattet gamle evalueringskommandoer med `azd ai eval` fra `azure.ai.evaluations`. Ny evalueringskonfigurasjon bruker camelCase-nøkler. Optimalisering `--config` tar en frittstående optimaliserings-API-forespørsel, **ikke** gamle `eval.yaml` eller nye `azure.eval.yaml`; bruk `--eval`/`--eval-config` for evalueringsgjenbruk. Se [evalueringsoppsett](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) og [optimaliseringsmigrasjon](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Kjørefragmentet er ikke en komplett arbeidsflyt. Bekreft gjennomsiktig evalueringskonfigurasjon og ikke-hemmelige ressurser, gi datasett/evaluator/modelltilgang, og bruk et miljø per trinn. Se [autentisert CI/CD-eksempel](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Server (Alfa)
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

## 🎯 Hurtige Arbeidsflyter

### Utviklingsarbeidsflyt
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

### Arbeidsflyt med Flere Miljøer
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

### Feilsøkingsarbeidsflyt
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

## 🔍 Feilsøkingskommandoer

### Feilsøkingsinformasjon
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

### Malfeilsøking
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Fil- og Katalogkommandoer

### Prosjektstruktur
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

## 🔧 Vanlige Kombinasjoner av Kommandoer

### Helsekontrollskript
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validering av Distribusjon
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Sammenligning av Miljøer
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skript for Ressursrydding
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Miljøvariabler

### Vanlige Miljøvariabler
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

## 🚨 Nødkontroller

### Hurtigreparasjoner
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

### Gjenopprettingskommandoer
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profftips

### Alias for Raskere Arbeidsflyt
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funksjonssnarveier
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

## 📖 Hjelp og Dokumentasjon

### Få Hjelp
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

### Dokumentasjonslenker
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tips**: Bokmerk denne jukselappen og bruk `Ctrl+F` for å raskt finne kommandoene du trenger!

---

**Navigering**
- **Forrige Leksjon**: [Preflight-sjekker](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Neste Leksjon**: [Begrepsliste](glossary.md)

---

> **💡 Vil du ha Azure-kommandohjelp i editoren din?** Installer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 ferdigheter for AI, Foundry, distribusjon, diagnostikk og mer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->