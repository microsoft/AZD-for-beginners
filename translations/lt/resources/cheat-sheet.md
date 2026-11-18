# Komandų Greita Santrauka – Pagrindinės AZD Komandos

**Greita Nuoroda Visoms Skyrams**
- **📚 Kurso Pagrindas**: [AZD Pradedantiesiems](../README.md)
- **📖 Greitas Pradžia**: [1 Skyrius: Pagrindai ir Greitas Pradžia](../README.md#-chapter-1-foundation--quick-start)
- **🤖 DI Komandos**: [2 Skyrius: DI-Pirmoji Plėtra](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pažengusieji**: [4 Skyrius: Infrastruktūra kaip Kodas](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Įvadas

Ši išsami greita santrauka suteikia greitą prieigą prie dažniausiai naudojamų Azure Developer CLI komandų, suskirstytų pagal kategorijas su praktiniais pavyzdžiais. Puikiai tinka greitam peržiūrėjimui vystymo, trikčių šalinimo ir kasdienių azd projektų operacijų metu.

## Mokymosi Tikslai

Naudodami šią santrauką, jūs:
- Turėsite momentinę prieigą prie būtinų Azure Developer CLI komandų ir sintaksės
- Suprasite komandų organizavimą pagal funkcines kategorijas ir naudojimo atvejus
- Turėsite praktinių pavyzdžių bendroms kūrimo ir diegimo situacijoms
- Turėsite prieigą prie trikčių šalinimo komandų greitam problemų sprendimui
- Efektyviai rasite pažangias konfigūravimo ir pritaikymo parinktis
- Surasite aplinkos valdymo ir kelių aplinkų darbo procesų komandas

## Mokymosi Rezultatai

Reguliariai naudodami šią santrauką galėsite:
- Užtikrintai vykdyti azd komandas be nuolatinio dokumentacijos tikrinimo
- Greitai spręsti dažnas problemas naudodami tinkamas diagnostikos komandas
- Efektyviai valdyti kelias aplinkas ir diegimo scenarijus
- Pritaikyti pažangias azd funkcijas ir konfigūravimo parinktis pagal poreikį
- Sistemiškai šalinti diegimo problemas naudojant komandų sekas
- Optimizuoti darbo procesus pasinaudojant azd nuorodomis ir parinktimis

## Pradžios Komandos

### Autentifikacija
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

### Projekto Inicijavimas
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

## Pagrindinės Diegimo Komandos

### Pilnas Diegimo Darbo Procesas
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

### Tik Infrastruktūra
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Tik Programėlė
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Kūrimas ir Pakavimas
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

> **`azd restore`** atsisiunčia jūsų programos priklausomybes (npm, pip, NuGet, Maven ir kt.). Ji automatiškai paleidžiama vykdant `azd package` ir `azd deploy`, todėl retai ją kviečiate tiesiogiai — paleiskite rankiniu būdu, jei norite iš anksto paruošti priklausomybes (pavyzdžiui, įkaitinti CI talpyklą arba vėliau dirbti neprisijungus).

> **`azd package`** paruošia diegimui tinkamą artefaktą, nediegdamas programos paslaugos. Elgesys priklauso nuo programavimo kalbos ir talpinimo: konteinerių pakavimas gali naudoti Azure nuotolinius kūrimus ir publikuoti vaizdus į registrą, tad nebūtinai yra neprisijungęs arba be įrašymo į Azure. `azd deploy` gali automatiškai pakuoti; naudokite atskirą pakavimo žingsnį, kai reikia artefakto ar kūrimo patikrinimo.


## 🌍 Aplinkos Valdymas

### Aplinkos Operacijos
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

### Aplinkos Kintamieji
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

Aplinkos failai yra paprasto teksto. Nenaudokite `azd env set` kaip slaptų duomenų saugyklos; naudokite Key Vault nuorodas arba valdomą identitetą pagal poreikį.

## ⚙️ Konfigūravimo Komandos

### Globinė Konfigūracija
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

### Projekto Konfigūracija
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Stebėsena ir Diagnostika

### Stebėjimo Skydelis
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

Application Insights turi būti sukonfigūruotas pagal šabloną. AZD Live Metrics parinktis šiuo metu nėra palaikoma Python programoms; vietoje jos naudokite apžvalgą, žurnalus ar pavyzdžio dokumentuotą sekimo darbo procesą.

### Talpyklų Žurnalų Peržiūra
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Žurnalų Analitikos Užklausos
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Priežiūros Komandos

### Valymas
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

### Atnaujinimai
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Pažangios Komandos

### Potekmių ir CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastruktūros Valdymas
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

### Projekto Informacija
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 DI ir Priedų Komandos

### AZD Priedai

Foundry GA nuoroda atnaujinta 2026-11-09: `microsoft.foundry` paketas 1.0, paskelbtas [2026 m. lapkričio 5 d.](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Naudokite `azd >= 1.37.0`; komponentai yra nepriklausomai versijuojami, o paruošiamojo peržiūros funkcijos turi savo statusą.

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

Paketas neapima įvertinimų, duomenų rinkinių, smulkaus kalibravimo arba individualių modelių. Vis dar palaikoma atskirų pagrindinių priedų diegimas. Vadovaukitės [GA hostingo agente demonstracija](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) dėl pavyzdžio, veikiančio su Python 3.13+, dabartine uv, leidimais ir modelių kvota.

### DI Agentų Komandos
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

`--template`/`-t` keičia pasenusį `--manifest`/`-m` rašybą; senieji manifestai turi būti migruoti. Šiuo metu nėra agent-init `--host containerapp` parinkties. Valdomas-apvalkalas, balso ir ilgai veikiančios peržiūros reikalauja atskirų shell/CI aplinkos sutikimų; žr. [DI CLI nuorodą](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Vietinis testavimas vis dar naudoja Azure modelių diegimus ir sąlyginai kainuoja. Valymui, `azd down` ištrina ką tik sukurtos Foundry projekto išteklių grupę, bet palieka pakartotinai naudojamus projekto išteklius; pašalinkite tik nepageidaujamus išteklius, kuriuos valdote atskirai.

### DI Įvertinimai ir Optimizavimas
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

Agentai beta.22 pakeitė senąsias įvertinimo komandas su `azd ai eval` iš `azure.ai.evaluations`. Nauja įvertinimo konfigūracija naudoja camelCase raktus. Optimizavimo `--config` reikalauja atskiro optimizavimo API užklausos, **ne** senosios `eval.yaml` arba naujos `azure.eval.yaml`; naudokite `--eval`/`--eval-config` įvertinimo pakartotiniam naudojimui. Žr. [įvertinimo sąranką](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ir [optimizavimo migraciją](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Paleidimo fragmentas nėra pilnas darbo procesas. Pateikite peržiūrėtą įvertinimo konfigūraciją ir neslaptinius išteklius, suteikite prieigą prie duomenų rinkinių/įvertintojų/modelių ir naudokite aplinką pagal etapą. Žr. [autentifikuoto CI/CD pavyzdį](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Serveris (Alfa)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Infrastruktūros Generavimas
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Greiti Darbo Procesai

### Vystymo Darbo Procesas
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

### Kelių Aplinkų Darbo Procesas
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

### Trikčių Šalinimo Darbo Procesas
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

## 🔍 Derinimo Komandos

### Derinimo Informacija
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

### Šablonų Derinimas
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Failų ir Katalogų Komandos

### Projekto Struktūra
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Išvesties Formatai

### JSON Išvestis
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Lentelės Išvestis
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Dažniausios Komandų Kombinacijos

### Būklės Patikros Skriptas
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Diegimo Patvirtinimas
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Aplinkos Palyginimas
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Išteklių Valymo Skriptas
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Aplinkos Kintamieji

### Dažniausiai Pasitaikantys Aplinkos Kintamieji
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

## 🚨 Skubios Komandos

### Greiti Pataisymai
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

### Atstatymo Komandos
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profesionalūs Patarimai

### Trumpiniai Greitesniam Darbui
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkcijų Nuorodos
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

## 📖 Pagalba ir Dokumentacija

### Kaip Gauti Pagalbą
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

### Dokumentacijos Nuorodos
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Patarimas**: Užsibrūkšnokite šią santrauką ir naudokite `Ctrl+F`, kad greitai rastumėte reikiamas komandas!

---

**Naršymas**
- **Ankstesnė Pamoka**: [Pradinių Patikrinimų](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Kita Pamoka**: [Žodynas](glossary.md)

---

> **💡 Norite Azure komandų pagalbos savo redaktoriuje?** Įdiekite [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) su `npx skills add microsoft/github-copilot-for-azure` — 37 įgūdžiai DI, Foundry, diegimui, diagnostikai ir dar daugiau.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->