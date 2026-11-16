# Příručka příkazů - Základní příkazy AZD

**Rychlá reference ke všem kapitolám**
- **📚 Domov kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Rychlý start**: [Kapitola 1: Základy a rychlý start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI příkazy**: [Kapitola 2: AI-First vývoj](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infrastruktura jako kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tato ucelená příručka nabízí rychlou referenci nejčastěji používaných příkazů Azure Developer CLI, uspořádaných podle kategorií s praktickými příklady. Ideální pro rychlé vyhledávání během vývoje, řešení problémů a každodenních operací s projekty azd.

## Cíle učení

Používáním této příručky:
- Budete mít okamžitý přístup k základním příkazům a syntaxi Azure Developer CLI
- Pochopíte organizaci příkazů podle funkčních kategorií a použití
- Najdete praktické příklady pro běžné vývojové a deploy scénáře
- Budete mít k dispozici příkazy pro řešení problémů pro rychlé odstranění potíží
- Snadno najdete pokročilé možnosti konfigurace a přizpůsobení
- Objevíte příkazy pro správu prostředí a multi-prostředí workflow

## Výsledky učení

Pravidelným odkazováním na tuto příručku budete schopni:
- Provádět příkazy azd s jistotou bez nutnosti plné dokumentace
- Rychle řešit běžné problémy pomocí vhodných diagnostických příkazů
- Efektivně spravovat více prostředí a scénáře nasazení
- Používat pokročilé funkce azd a možnosti konfigurace podle potřeby
- Řešit problémy s nasazením pomocí systematických sekvencí příkazů
- Optimalizovat workflow efektivním používáním zkratek a možností azd

## Začátečnické příkazy

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

## Hlavní příkazy nasazení

### Kompletní workflow nasazení
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

### Sestavení a balení
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

> **`azd restore`** stahuje závislosti vaší aplikace (npm, pip, NuGet, Maven atd.). Běží automaticky během `azd package` a `azd deploy`, takže jej zřídka voláte přímo — spusťte jej ručně pro předběžné stažení závislostí (například pro zahřátí CI cache nebo pozdější offline použití).

> **`azd package`** připraví nasaditelný artefakt bez nasazení aplikační služby. Chování závisí na jazyce a hostiteli: balení kontejneru může využít Azure vzdálené sestavení a publikování imagí do registry, takže nemusí být nutně offline nebo bez zápisů do Azure. `azd deploy` může balit automaticky; použijte samostatný krok balení, když potřebujete artefakt nebo kontrolu sestavení.


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

Soubory prostředí jsou v prostém textu. Neukládejte `azd env set` jako úložiště tajemství; použijte odkazy na Key Vault nebo spravovanou identitu dle potřeby.

## ⚙️ Konfigurační příkazy

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

### Monitorovací dashboard
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

Application Insights musí být nakonfigurován šablonou. Možnost Live Metrics v AZD aktuálně není podporována pro Python aplikace; použijte přehled, logy nebo dokumentovaný trasovací workflow vzorku.

### Zobrazení logů kontejneru
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Dotazy do Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Údržbové příkazy

### Čištění
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

## 🤖 AI & rozšíření

### Rozšíření AZD

Referenční AI CLI přezkoumáno 2026-11-04: `azd 1.37.2`, agenti `1.0.0-beta.23`, vyhodnocení `1.0.0-beta.2`. Používejte `azd >= 1.37.0` pro kombinovaný workflow; aktualizujte základní CLI před nekompatibilními rozšířeními.

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

### AI příkazy agentů
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

`--template`/`-t` nahrazuje zastaralý pravopis `--manifest`/`-m`; dědictví manifestů vyžaduje migraci. Momentálně není k dispozici agent-init `--host containerapp` možnost. Managed-harness, hlasové a dlouhotrvající preview vyžadují nezávislé povolení v shell/CI prostředí; viz [AI CLI reference](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### AI vyhodnocení a optimalizace
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

Agenti beta.22 nahradili staré evaluační příkazy `azd ai eval` z `azure.ai.evaluations`. Nová konfigurace vyhodnocení používá camelCase klíče. Optimalizace `--config` probíhá samostatným API požadavkem, **nikoli** starým `eval.yaml` nebo novým `azure.eval.yaml`; pro znovupoužití vyhodnocení použijte `--eval`/`--eval-config`. Viz [nastavení vyhodnocení](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) a [migrace optimalizace](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP Server (alfa)
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

## 🎯 Rychlé workflow

### Vývojové workflow
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

### Víceprostřední workflow
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

### Workflow řešení potíží
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

## 🔍 Příkazy pro ladění

### Ladící informace
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

### Ladění šablon
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Příkazy pro soubory a adresáře

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

### Výstup ve formátu JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Výstup ve formátu tabulky
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

### Skript pro čištění zdrojů
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

### Obnovovací příkazy
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Tipy profesionálů

### Aliasy pro rychlejší workflow
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

**Tip**: Přidejte si tuto příručku do záložek a použijte `Ctrl+F` pro rychlé nalezení potřebných příkazů!

---

**Navigace**
- **Předchozí lekce**: [Předletové kontroly](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Další lekce**: [Glosář](glossary.md)

---

> **💡 Chcete pomoc s Azure příkazy přímo ve svém editoru?** Nainstalujte [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) s `npx skills add microsoft/github-copilot-for-azure` — 37 dovedností pro AI, Foundry, nasazení, diagnostiku a další.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->