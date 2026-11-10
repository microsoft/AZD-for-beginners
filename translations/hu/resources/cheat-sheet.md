# Parancs Gyorsútmutató - Alapvető AZD Parancsok

**Gyors hivatkozás minden fejezethez**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../README.md)
- **📖 Gyors indítás**: [1. fejezet: Alapok és Gyors Indítás](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Parancsok**: [2. fejezet: AI-első fejlesztés](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Haladó**: [4. fejezet: Infrastruktúra kód formájában](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Bevezetés

Ez a részletes gyorsútmutató az Azure Developer CLI leggyakrabban használt parancsainak gyors áttekintését nyújtja, kategóriák szerint rendezve, gyakorlati példákkal. Tökéletes gyors keresésekhez fejlesztés, hibakeresés és napi feladatok során az azd projektekkel.

## Tanulási célok

Ezzel a gyorsútmutatóval:
- Azonnali hozzáférést kapsz a legfontosabb Azure Developer CLI parancsokhoz és szintaxisukhoz
- Megérted a parancsok felosztását funkcionális kategóriák és felhasználási esetek szerint
- Gyakorlati példákra hivatkozhatsz a gyakori fejlesztési és telepítési helyzetekhez
- Hozzáférhetsz hibakeresési parancsokhoz gyors probléma megoldás érdekében
- Hatékonyan megtalálhatod a haladó beállítási és testreszabási lehetőségeket
- Környezetkezelési és többkörnyezetes munkafolyamat parancsokat is megtalálsz

## Tanulási eredmények

A gyorsútmutató rendszeres használatával képes leszel:
- Magabiztosan végrehajtani az azd parancsokat anélkül, hogy a teljes dokumentációt elő kellene venni
- Gyorsan megoldani gyakori problémákat a megfelelő diagnosztikai parancsok segítségével
- Hatékonyan kezelni több környezetet és telepítési forgatókönyvet
- Igény szerint alkalmazni az azd haladó funkcióit és konfigurációs lehetőségeit
- Rendszeres parancssorozatokkal hibákat elhárítani telepítés közben
- Optimalizálni a munkafolyamatokat az azd gyorsparancsok és opciók hatékony használatával

## Első parancsok

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

### Projekt inicializálás
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

## Alapvető telepítési parancsok

### Teljes telepítési munkafolyamat
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

### Csak infrastruktúra
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Csak alkalmazás
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Build és csomagolás
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

> **`azd restore`** letölti az alkalmazásod függőségeit (npm, pip, NuGet, Maven, stb.). Automatikusan fut az `azd package` és `azd deploy` alatt, így ritkán hívod meg közvetlenül – futtasd manuálisan, ha előre le akarod tölteni a függőségeket (például egy CI cache melegítésére vagy offline munkához utólag).

> **`azd package`** egy telepíthető artefaktumot készít elő, az alkalmazás szolgáltatás telepítése nélkül. A viselkedés nyelv- és hosztfüggő: konténer csomagolás használhat Azure távoli buildet és képet publikálhat egy registry-be, így nem feltétlenül offline vagy Azure-mentes művelet. Az `azd deploy` automatikusan csomagolhat; külön csomagolási lépést akkor használj, ha artefaktumra vagy build ellenőrzésre van szükség.


## 🌍 Környezetkezelés

### Környezet műveletek
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

### Környezeti változók
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

A környezeti fájlok egyszerű szövegesek. Ne használd `azd env set` titkos tárolásként; ehhez inkább Key Vault hivatkozásokat vagy menedzselt identitást használj, ahogy megfelelő.

## ⚙️ Konfigurációs parancsok

### Globális konfiguráció
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

### Projekt konfiguráció
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Megfigyelés és diagnosztika

### Megfigyelési műszerfal
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

Az Application Insights-ot a sablonnak kell beállítania. AZD Live Metrics opciója jelenleg nem támogatott Python alkalmazásokhoz; helyette az áttekintést, naplókat vagy a minta dokumentált nyomkövetési munkafolyamatát használd.

### Konténer naplók megtekintése
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics lekérdezések
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Karbantartási parancsok

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

## 🔧 Haladó parancsok

### Pipeline és CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastruktúra kezelése
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

### Projekt információ
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI és bővítmények parancsai

### AZD bővítmények

AI CLI referencia felülvizsgálat 2026-11-04: `azd 1.37.2`, ügynökök `1.0.0-beta.23`, értékelések `1.0.0-beta.2`. Használd a `azd >= 1.37.0` kombinált munkafolyamatot; frissítsd a core CLI-t az inkompatibilis bővítmények előtt.

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

### AI Ügynök parancsok
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

`--template`/`-t` lecseréli a elavult `--manifest`/`-m` helyesírást; a régi manifest-ek migrációt igényelnek. Jelenleg nincs agent-init `--host containerapp` opció. Menedzselt-harness, hangvezérlés és hosszú futású előzetes verziók külön shell/CI környezeti engedélyt igényelnek; lásd az [AI CLI referenciát](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### AI értékelések és optimalizáció
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

Az agents beta.22 lecserélte a régi értékelési parancsokat az `azd ai eval`-re az `azure.ai.evaluations`-ból. Az új értékelési konfiguráció camelCase kulcsokat használ. Az optimalizáció `--config` különálló API kérést igényel, **nem** a régi `eval.yaml` vagy az új `azure.eval.yaml`; használj `--eval`/`--eval-config` az értékelés újrahasznosításához. Lásd az [értékelési beállítást](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) és az [optimalizációs migrációt](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP szerver (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Infrastruktúra generálás
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Gyors munkafolyamatok

### Fejlesztési munkafolyamat
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

### Több-környezetes munkafolyamat
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

### Hibakeresési munkafolyamat
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

## 🔍 Hibakereső parancsok

### Hibakeresési információk
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

### Sablon hibakeresés
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Fájl- és könyvtár parancsok

### Projekt struktúra
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Kimenet formázás

### JSON kimenet
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Táblázatos kimenet
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Gyakori parancskombinációk

### Egészségellenőrző script
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Telepítés érvényesítés
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Környezet összehasonlítás
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Erőforrás tisztító script
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Környezeti változók

### Gyakori környezeti változók
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

## 🚨 Vészhelyzeti parancsok

### Gyors javítások
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

### Helyreállítási parancsok
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profi tippek

### Gyorsabb munkafolyamat aliasok
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Függvény rövidítések
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

## 📖 Segítség és dokumentáció

### Segítség kérése
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

### Dokumentációs hivatkozások
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tipp**: Könyvjelzőzd ezt a gyorsútmutatót, és használd az `Ctrl+F` parancsot a parancsok gyors megtalálásához!

---

**Navigáció**
- **Előző lecke**: [Preflight ellenőrzések](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Következő lecke**: [Szószedet](glossary.md)

---

> **💡 Szeretnél Azure parancstámogatást a szerkesztődben?** Telepítsd a [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) bővítményt `npx skills add microsoft/github-copilot-for-azure` segítségével — 37 képesség AI-hez, Foundry-hoz, telepítéshez, diagnosztikához és még sok más.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->