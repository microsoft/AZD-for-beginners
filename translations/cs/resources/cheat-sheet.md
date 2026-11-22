# Rychlý přehled příkazů - Základní příkazy AZD

**Rychlá referencia ke všem kapitolám**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Rychlý start**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Příkazy AI**: [Kapitola 2: AI-převládající vývoj](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infrastrukturou jako kódem](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tento komplexní rychlý přehled poskytuje rychlou referenci nejčastěji používaných příkazů Azure Developer CLI, uspořádaných podle kategorií s praktickými příklady. Perfektní pro rychlé dohledání během vývoje, řešení problémů a každodenních operací s projekty azd.

## Cíle učení

Používáním tohoto rychlého přehledu budete:
- Mít okamžitý přístup k základním příkazům a syntaxi Azure Developer CLI
- Chápat organizaci příkazů podle funkčních kategorií a případů použití
- Odkazovat na praktické příklady běžných scénářů vývoje a nasazení
- Přistupovat k příkazům pro řešení problémů pro rychlé odstranění potíží
- Efektivně najít pokročilé možnosti konfigurace a přizpůsobení
- Najít příkazy pro správu prostředí a vícenásobný workflow prostředí

## Výsledky učení

Při pravidelném používání tohoto přehledu budete schopni:
- Provádět příkazy azd sebevědomě bez nutnosti plné dokumentace
- Rychle řešit běžné problémy pomocí vhodných diagnostických příkazů
- Efektivně spravovat vícenásobná prostředí a scénáře nasazení
- Používat pokročilé funkce azd a možnosti konfigurace dle potřeby
- Řešit nasazovací potíže pomocí systematických sekvencí příkazů
- Optimalizovat pracovní postupy efektivním použitím zkratek a možností azd

## Začínající příkazy

### Autentizace
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

### Inicializace projektu
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

## Základní příkazy nasazení

### Kompletní pracovní postup nasazení
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

### Pouze infrastruktura
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Pouze aplikace
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Sestavení a balíčkování
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

> **`azd restore`** stáhne závislosti vaší aplikace (npm, pip, NuGet, Maven atd.). Probíhá automaticky během `azd package` a `azd deploy`, takže jej zřídka voláte přímo — spusťte jej ručně k přednačtení závislostí (například k "zahřátí" cache CI nebo práce offline později).

> **`azd package`** připraví nasaditelný artefakt, aniž by nasadil aplikační službu. Chování závisí na jazyce a hostiteli: balení kontejneru může používat vzdálené sestavení Azure a publikovat obrazy do registru, takže není nutně offline nebo bez zápisů do Azure. `azd deploy` může balit automaticky; použijte samostatný krok balení, pokud potřebujete artefakt nebo kontrolu sestavení.


## 🌍 Správa prostředí

### Operace s prostředím
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

### Proměnné prostředí
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

Soubor prostředí je prostý text. Netrapte se s `azd env set` jako se skladováním tajemství; použijte odkazy Key Vault nebo spravovanou identitu podle potřeby.

## ⚙️ Příkazy konfigurace

### Globální konfigurace
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

### Konfigurace projektu
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitorování a diagnostika

### Dashboard monitorování
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

Application Insights musí být nakonfigurován šablonou. Volba Live Metrics v AZD momentálně není podporována pro Python aplikace; použijte místo toho přehled, logy nebo dokumentovaný sledovací workflow vzorku.

### Prohlížení logů kontejneru
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Dotazy Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Příkazy údržby

### Úklid
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

### Aktualizace
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Pokročilé příkazy

### Pipeline a CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Správa infrastruktury
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

### Informace o projektu
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Příkazy AI a rozšíření

### Rozšíření AZD

Referenční GA Foundry aktualizováno 2026-11-09: `microsoft.foundry` balík 1.0, oznámený [5. listopadu 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Používejte `azd >= 1.37.0`; komponenty jsou samostatně verzovány a volitelné funkce ve výhledu si ponechávají svůj vlastní status.

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

Balík neobsahuje vyhodnocení, datové sady, ladění ani vlastní modely. Instalace jednotlivých základních rozšíření je nadále podporována. Postupujte podle [GA hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) pro spustitelný příklad s Python 3.13+, aktuální uv, oprávněními a kvótou modelů.

### Příkazy AI agenta
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

`--template`/`-t` nahrazuje zastaralý `--manifest`/`-m` zápis; staré manifesty je třeba migrovat. Momentálně není agent-init `--host containerapp` možnost. Managed-harness, hlasové a dlouhodobé náhledy vyžadují samostatné shell/CI environment opt-in; viz [AI CLI reference](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Lokální testování stále používá nasazení Azure modelů a je zpoplatněno. K úklidu, `azd down` smaže nově vytvořenou resource group Foundry projektu, ale ponechá opakovaně použití projekční zdroje na místě; odstraňujte ručně jen nechtěné zdroje, které vlastníte.

### Vyhodnocování AI a optimalizace
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

Agenti beta.22 nahradili staré vyhodnocovací příkazy `azd ai eval` z `azure.ai.evaluations`. Nová konfigurace vyhodnocení používá camelCase klíče. Optimalizace `--config` bere samostatný požadavek na API optimalizace, **nikoli** starý `eval.yaml` nebo nový `azure.eval.yaml`; používejte `--eval`/`--eval-config` pro opětovné použití vyhodnocení. Viz [nastavení vyhodnocení](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) a [migrace optimalizace](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Fragment runneru není úplný pracovní postup. Commitujte revidovanou konfiguraci vyhodnocení a ne tajná aktiva, povolte přístupy k datovým sadám/evaluatorům/modelům, a používejte jedno prostředí pro každou fázi. Viz [příklad autentizovaného CI/CD](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Server (alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generování infrastruktury
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Rychlé pracovní postupy

### Vývojový workflow
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

### Více prostředí workflow
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

### Workflow řešení problémů
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

## 🔍 Příkazy ladění

### Ladicí informace
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

### Ladění šablony
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Příkazy souborů a adresářů

### Struktura projektu
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formátování výstupu

### Výstup JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Výstup tabulky
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Běžné kombinace příkazů

### Skript kontroly stavu
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validace nasazení
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Porovnání prostředí
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skript pro úklid zdrojů
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Proměnné prostředí

### Běžné proměnné prostředí
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

## 🚨 Nouzové příkazy

### Rychlé opravy
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

### Příkazy zotavení
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profesionální tipy

### Alias pro rychlejší workflow
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Zkratky funkcí
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

## 📖 Nápověda a dokumentace

### Získání nápovědy
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

### Odkazy na dokumentaci
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tip**: Přidejte si tento rychlý přehled do záložek a používejte `Ctrl+F` pro rychlé nalezení potřebných příkazů!

---

**Navigace**
- **Předchozí lekce**: [Kontroly před startem](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Další lekce**: [Slovníček pojmů](glossary.md)

---

> **💡 Chcete pomoc s příkazy Azure přímo ve vašem editoru?** Nainstalujte si [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) s `npx skills add microsoft/github-copilot-for-azure` — 37 dovedností pro AI, Foundry, nasazení, diagnostiku a další.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->