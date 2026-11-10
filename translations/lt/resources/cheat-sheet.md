# Komandų Santrauka – Esminės AZD Komandos

**Greita Nuoroda Visoms Pamokoms**
- **📚 Kurso Pradžia**: [AZD Pradedantiesiems](../README.md)
- **📖 Greitas Pradėjimas**: [1 skyrius: Pagrindai ir Greitas Pradėjimas](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Komandos**: [2 skyrius: AI-Pirmoji Plėtra](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pažengusieji**: [4 skyrius: Infrastruktūra kaip Kodeksas](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Įvadas

Ši išsami santrauka suteikia greitą prieigą prie dažniausiai naudojamų Azure Developer CLI komandų, suskirstytų pagal kategorijas su praktiškais pavyzdžiais. Puikiai tinka greitiems užklausimams plėtros, trikčių šalinimo ir kasdienės veiklos metu su azd projektais.

## Mokymosi Tikslai

Naudodami šią santrauką, jūs:
- Turėsite momentinę prieigą prie esminių Azure Developer CLI komandų ir sintaksės
- Suprasite komandų organizavimą pagal funkcines kategorijas ir naudojimo atvejus
- Turėsite nuorodas į praktinius pavyzdžius dažnuose kūrimo ir diegimo scenarijuose
- Galėsite naudoti trikčių šalinimo komandas greitam problemų sprendimui
- Lengvai rasite pažangias konfigūracijos ir pritaikymo parinktis
- Susikursite aplinkos valdymo ir daugialypės aplinkos darbo su komandomis schemą

## Mokymosi Rezultatai

Reguliariai naudodamiesi šia santrauka, jūs sugebėsite:
- Užtikrintai vykdyti azd komandas be pilnų dokumentacijų nuorodų
- Greitai išspręsti dažniausias problemas naudodami tinkamas diagnostikos komandas
- Efektyviai valdyti kelias aplinkas ir diegimo scenarijus
- Taikyti pažangias azd funkcijas ir konfigūracijos parinktis pagal poreikį
- Trikčių šalinimą atlikti sistemingai sekant komandų eilę
- Optimizuoti darbo eigas efektyviai naudodami azd trumpinius ir parinktis

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

### Projekto Inicializavimas
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

### Pilna Diegimo Darbo Eiga
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

### Kūrimas ir Paketavimas
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

> **`azd restore`** atsisiunčia jūsų programos priklausomybes (npm, pip, NuGet, Maven ir kt.). Ji vykdoma automatiškai vykdant `azd package` ir `azd deploy`, todėl retai reikia ją kviesti tiesiogiai – naudokite rankiniu būdu, kad iš anksto atsisiųstumėte priklausomybes (pavyzdžiui, tam, kad apšiltintumėte CI talpyklą arba dirbtumėte be interneto vėliau).

> **`azd package`** paruošia diegimui tinkamą artefaktą, neįdiegdamas programėlės paslaugos. Elgesys priklauso nuo kalbos ir hostingo: konteinerių pakuotės gali naudoti Azure nuotolinius kūrimus ir paskelbti paveikslėlius registrui, tad tai nebūtinai yra neprisijungęs ar be rašymo į Azure. `azd deploy` gali automatiškai pakuoti; naudokite atskirą pakavimo žingsnį, kai reikia artefakto ar kūrimo patikros.


## 🌍 Aplinkos Valdymas

### Aplinkos Veiksmai
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

Aplinkos failai yra paprasto teksto. Nenaudokite `azd env set` kaip slaptos saugyklos; naudokite Key Vault nuorodas arba valdomą identitetą pagal poreikį.

## ⚙️ Konfigūracijos Komandos

### Globali Konfigūracija
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

### Stebėjimo Informacinė Sritis
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

Application Insights turi būti sukonfigūruota šablono. AZD gyvoji metrikų parinktis šiuo metu nepalaiko Python programėlių; vietoje to naudokite apžvalgą, žurnalus arba dokumentuoto pavyzdžio susijusį sekimą.

### Konteinerių Žurnalų Peržiūra
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics Užklausos
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

## 🔧 Pažangiosios Komandos

### Vamzdynas ir CI/CD
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

## 🤖 AI ir Priedų Komandos

### AZD Priedai

AI CLI nuoroda peržiūrėta 2026-11-04: `azd 1.37.2`, agentai `1.0.0-beta.23`, vertinimai `1.0.0-beta.2`. Naudokite `azd >= 1.37.0` kombinuotai darbo eigai; prieš nekompatibilius priedus atnaujinkite pagrindinį CLI.

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

### AI Agentų Komandos
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

`--template`/`-t` pakeičia pasenusią `--manifest`/`-m` rašybą; reikalinga atnaujinti senus manifestus. Šiuo metu nėra agent-init `--host containerapp` parinkties. Valdomos paleisties, balso ir ilgalaikės peržiūros reikalauja nepriklausomų apvalkalo/CI aplinkų patvirtinimų; žiūrėkite [AI CLI nuorodą](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### AI Vertinimai ir Optimizavimas
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

Agentai beta.22 pakeitė senas vertinimo komandas su `azd ai eval` iš `azure.ai.evaluations`. Naujoji vertinimo konfigūracija naudoja camelCase raktus. Optimizavimo `--config` reikalauja atskiro optimizavimo API užklausos, **ne** senos `eval.yaml` ar naujos `azure.eval.yaml`; naudokite `--eval`/`--eval-config` vertinimui pakartotinai. Žiūrėkite [vertinimo nustatymą](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ir [optimizavimo migraciją](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

## 🎯 Greitosios Darbo Eigos

### Plėtros Darbo Eiga
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

### Daugiaaplinkės Darbo Eiga
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

### Trikčių Šalinimo Darbo Eiga
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

### Šablono Derinimas
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

## 🎨 Išvesties Formavimas

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

## 🔧 Dažnai Derinamos Komandų Kombinacijos

### Sveikatos Patikrinimo Skriptas
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Diegimo Validacija
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Aplinkų Palyginimas
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

### Dažnai Naudojami Aplinkos Kintamieji
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

## 🚨 Skubių Situacijų Komandos

### Greitieji Pataisymai
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

### Trumpiniai Greitesnei Darbo Eigai
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funkcijų Trumpiniai
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

### Pagalbos Gavimas
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

**Patarimas**: Užsirašykite šią santrauką ir naudokite `Ctrl+F` greitai surasti jums reikalingas komandas!

---

**Naršymas**
- **Ankstesnė Pamoka**: [Išankstiniai Patikrinimai](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Kita Pamoka**: [Žodynas](glossary.md)

---

> **💡 Norite „Azure“ komandų pagalbos savo redaktoriuje?** Įdiekite [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) su `npx skills add microsoft/github-copilot-for-azure` — 37 įgūdžiai AI, Foundry, diegimui, diagnostikai ir kt.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->