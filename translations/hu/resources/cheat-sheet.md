# Parancs Gyorsreferencia – Alapvető AZD Parancsok

**Gyors Áttekintés Minden Fejezethez**
- **📚 Tanfolyam Kezdőoldal**: [AZD Kezdőknek](../README.md)
- **📖 Gyors Kezdés**: [1. fejezet: Alapok és Gyors Kezdés](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Parancsok**: [2. fejezet: AI-Először Fejlesztés](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Haladó**: [4. fejezet: Infrastrukturális Kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Bevezetés

Ez az átfogó gyorsreferencia a leggyakrabban használt Azure Developer CLI parancsokat tartalmazza, kategóriánként rendszerezve gyakorlati példákkal. Tökéletes gyors kereséshez fejlesztés, hibaelhárítás és napi műveletek során az azd projekteknél.

## Tanulási Célok

Ennek a gyorsreferenciának a használatával:
- Azonnal hozzáférsz az alapvető Azure Developer CLI parancsokhoz és szintaxisukhoz
- Megérted a parancsok szervezését funkcionális kategóriák és használati esetek szerint
- Gyakorlati példák alapján tudsz hivatkozni a gyakori fejlesztési és telepítési forgatókönyvekre
- Gyors hibamegoldáshoz hozzáférsz a hibaelhárító parancsokhoz
- Hatékonyan megtalálod a haladó konfigurációs és testreszabási lehetőségeket
- Megtalálod a környezetkezelési és több-környezetes munkafolyamat parancsokat

## Tanulási Eredmények

Rendszeres hivatkozással erre a gyorsreferenciára képes leszel:
- Magabiztosan végrehajtani az azd parancsokat dokumentáció nélkül
- Gyorsan megoldani a gyakori problémákat a megfelelő diagnosztikai parancsokkal
- Hatékonyan kezelni több környezetet és telepítési forgatókönyvet
- Alkalmazni a haladó azd funkciókat és konfigurációs beállításokat igény szerint
- Rendszeresen alapozni a telepítési hibák hibaelhárítását parancssorozatokkal
- Optimalizálni a munkafolyamatokat az azd gyorsbillentyűk és opciók használatával

## Kezdő Parancsok

### Hitelesítés
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

### Projekt Inicializálása
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

## Alapvető Telepítési Parancsok

### Teljes Telepítési Munkafolyamat
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

### Csak Infrastruktúra
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Csak Alkalmazás
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Építés és Csomagolás
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

> **`azd restore`** letölti az alkalmazás függőségeit (npm, pip, NuGet, Maven, stb.). Ez automatikusan fut a `azd package` és `azd deploy` alatt, ezért ritkán kell kézzel hívni – manuálisan futtasd a függőségek előtöltéséhez (például CI cache melegítéséhez vagy offline használathoz utólag).

> **`azd package`** előkészít egy telepíthető állományt anélkül, hogy letelepítené az alkalmazásszolgáltatást. A viselkedés a nyelvtől és a hosttól függ: konténer csomagolás Azure távoli build-et használhat, képeket publikál a registry-be, így nem feltétlenül offline vagy írásmentes Azure felé. Az `azd deploy` automatikusan csomagolhat; használj külön csomagolási lépést, ha szükséged van állományra vagy építési ellenőrzésre.


## 🌍 Környezetkezelés

### Környezet Műveletek
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

### Környezeti Változók
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

A környezeti fájlok egyszerű szövegesek. Ne kezeld `azd env set` titkos adattárolóként; használj Key Vault hivatkozásokat vagy kezelt identitást az adott helyzetnek megfelelően.

## ⚙️ Konfigurációs Parancsok

### Globális Konfiguráció
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

### Projekt Konfiguráció
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Megfigyelés és Diagnosztika

### Megfigyelési Irányítópult
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

Az Application Insights-ot a sablonnal kell konfigurálni. Az AZD élő metrikák opciója jelenleg nem támogatott Python alkalmazásokhoz; helyette használd az áttekintést, naplókat vagy a minta dokumentált követési munkafolyamatát.

### Konténer Naplók Megtekintése
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics Lekérdezések
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Karbantartási Parancsok

### Takarítás
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

### Frissítések
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Haladó Parancsok

### Pipeline és CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastruktúra Kezelés
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

### Projekt Információk
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI & Kiterjesztések Parancsai

### AZD Kiterjesztések

A Foundry GA referencia frissítve 2026-11-09: `microsoft.foundry` csomag 1.0, bejelentve [2026. november 5.](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Használd `azd >= 1.37.0`; az egyes komponensek külön verzióval rendelkeznek, és az opcionális előnézeti funkcióknak saját státuszuk van.

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

A csomag nem tartalmaz értékeléseket, adatkészleteket, finomhangolást vagy egyedi modelleket. Az egyéni alap kiterjesztések telepítése továbbra is támogatott. Kövesd a [GA hosted-agent bemutatót](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga), amely futtatható példát ad Python 3.13+, aktuális uv, jogosultságok és modellszám keret mellett.

### AI Ügynök Parancsok
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

`--template`/`-t` helyettesíti a korábbi `--manifest`/`-m` írásmódot; régi manifesteket migrálni kell. Jelenleg nincs agent-init `--host containerapp` opció. A managelt harness, hang és hosszú futású előnézetekhez külön shell/CI környezet opciók kellenek; lásd az [AI CLI hivatkozást](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

A helyi tesztelés továbbra is Azure modell telepítéseket használ és költséggel jár. Takarításhoz az `azd down` törli az újonnan létrehozott Foundry projekt erőforráscsoportját, de a többször használt projekt erőforrásait meghagyja; csak a nem kívánt, saját tulajdonú erőforrásokat távolítsd el külön.

### AI Értékelések és Optimalizáció
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

Az Agents beta.22 lecserélte a régi értékelési parancsokat az `azd ai eval`-ra az `azure.ai.evaluations`-ból. Az új értékelési konfiguráció camelCase kulcsokat használ. Az optimalizáció `--config` egy önálló optimalizációs API kérést vár, **nem** a régi `eval.yaml` vagy új `azure.eval.yaml`; az értékelés újrafelhasználáshoz használd `--eval`/`--eval-config`. Lásd az [értékelési beállítást](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) és az [optimalizációs migrációt](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

A futtató töredék nem teljes munkafolyamat. Kötelezd be az értékelt konfigurációt és nem titkos eszközöket, adj dataset/evaluator/model hozzáférést, és használj külön környezetet minden lépéshez. Lásd a [hitelesített CI/CD példát](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Szerver (Alfa)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Infrastruktúra Generálás
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Gyors Munkafolyamatok

### Fejlesztési Munkafolyamat
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

### Több-Környezetes Munkafolyamat
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

### Hibakeresési Munkafolyamat
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

## 🔍 Hibakeresési Parancsok

### Hibakeresési Információk
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

### Sablon Hibakeresés
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Fájl- és Könyvtárparancsok

### Projekt Struktúra
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Kimenetformázás

### JSON Kimenet
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Táblázatos Kimenet
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Gyakori Parancs Kombinációk

### Egészségügyi Ellenőrző Script
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Telepítési Érvényesítés
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Környezet Összehasonlítás
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Erőforrás Takarító Script
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Környezeti Változók

### Gyakori Környezeti Változók
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

## 🚨 Vészhelyzeti Parancsok

### Gyors Javítások
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

### Helyreállítási Parancsok
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profi Tippek

### Gyorsabb Munkafolyamat Aliasok
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Függvény Gyorsbillentyűk
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

## 📖 Segítség és Dokumentáció

### Segítségkérés
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

### Dokumentációs Linkek
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tipp**: Kövesd ezt a gyorsreferenciát és használd az `Ctrl+F` parancsot, hogy gyorsan megtaláld a szükséges parancsokat!

---

**Navigáció**
- **Előző Lecke**: [Előzetes Ellenőrzések](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Következő Lecke**: [Glosszárium](glossary.md)

---

> **💡 Szeretnél Azure parancs segítséget a szerkesztődben?** Telepítsd a [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) eszközt `npx skills add microsoft/github-copilot-for-azure` — 37 készség AI, Foundry, telepítés, diagnosztika és még sok más témában.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->