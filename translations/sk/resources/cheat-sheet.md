# Príkazový prehľad - Základné príkazy AZD

**Rýchly prehľad pre všetky kapitoly**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Rýchly štart**: [Kapitola 1: Základy a rýchly štart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Príkazy AI**: [Kapitola 2: Vývoj s AI na prvom mieste](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Pokročilé**: [Kapitola 4: Infraštruktúra ako kód](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Úvod

Tento komplexný prehľad príkazov poskytuje rýchly prístup k najpoužívanejším príkazom Azure Developer CLI, zoradených podľa kategórií s praktickými príkladmi. Perfektné na rýchle vyhľadávanie počas vývoja, riešenia problémov a každodennej práce s projektmi azd.

## Ciele učenia

Použitím tohto prehľadu budete:
- Mať okamžitý prístup k základným príkazom a syntaxu Azure Developer CLI
- Rozumieť organizácii príkazov podľa funkčných kategórií a prípadov použitia
- Odkazovať na praktické príklady pre bežné scenáre vývoja a nasadenia
- Mať prístup k príkazom na riešenie problémov pre rýchle vyriešenie problémov
- Nájsť efektívne pokročilé možnosti konfigurácie a prispôsobenia
- Lokalizovať príkazy na správu prostredí a pracovné postupy s viacerými prostrediami

## Výsledky učenia

Pravidelným odkazovaním na tento prehľad budete schopní:
- Spúšťať príkazy azd sebavedome bez potreby plnej dokumentácie
- Rýchlo riešiť bežné problémy pomocou vhodných diagnostických príkazov
- Efektívne spravovať viaceré prostredia a scenáre nasadenia
- Používať pokročilé funkcie azd a možnosti konfigurácie podľa potreby
- Riešiť problémy s nasadením pomocou systematických sekvencií príkazov
- Optimalizovať pracovné postupy účinným využitím skratiek a možností azd

## Začiatočné príkazy

### Overenie identity
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

### Inicializácia projektu
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

## Základné príkazy nasadenia

### Kompletný pracovný tok nasadenia
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

### Iba infraštruktúra
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Iba aplikácia
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Kompilácia a balenie
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

> **`azd restore`** sťahuje závislosti vašej aplikácie (npm, pip, NuGet, Maven atď.). Spúšťa sa automaticky počas `azd package` a `azd deploy`, takže ho zriedka voláte priamo — spustite ho manuálne na predvyhľadávanie závislostí (napríklad na predhrievanie cache CI alebo prácu offline neskôr).

> **`azd package`** pripraví nasaditeľný artefakt bez nasadenia aplikácie. Správanie závisí od jazyka a hostiteľa: balenie kontajnera môže využiť vzdialené zostavovanie Azure a publikovať obrázky do registru, takže nemusí byť nevyhnutne offline alebo bez zápisov do Azure. `azd deploy` môže balíčkovať automaticky; použite samostatný krok balenia, keď potrebujete artefakt alebo kontrolu zostavenia.


## 🌍 Správa prostredí

### Operácie s prostrediami
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

### Premenné prostredia
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

Súbory prostredia sú obyčajný text. Nezaobchádzajte s `azd env set` ako s úložiskom tajomstiev; použite odkazy na Key Vault alebo spravovanú identitu podľa potreby.

## ⚙️ Konfiguračné príkazy

### Globálna konfigurácia
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

### Konfigurácia projektu
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitorovanie a diagnostika

### Monitorovací panel
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

Application Insights musí byť nakonfigurovaný šablónou. Funkcia Live Metrics AZD zatiaľ nie je podporovaná pre Python aplikácie; namiesto toho použite prehľad, logy alebo zdokumentovaný priebeh trasovania vzorového projektu.

### Zobrazenie logov kontajnera
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

## 🛠️ Príkazy údržby

### Čistenie
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

### Aktualizácie
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Pokročilé príkazy

### Pipeline a CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Správa infraštruktúry
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

### Informácie o projekte
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI a rozšírenia

### Rozšírenia AZD

Referencia AI CLI aktualizovaná 2026-11-04: `azd 1.37.2`, agenti `1.0.0-beta.23`, hodnotenia `1.0.0-beta.2`. Používajte `azd >= 1.37.0` na zjednotený pracovný tok; najskôr aktualizujte jadro CLI pred nekompatibilnými rozšíreniami.

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

### Príkazy AI agentov
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

`--template`/`-t` nahrádza zastarané `--manifest`/`-m` pravopisné varianty; staré manifesty je potrebné migrovať. Momentálne nie je k dispozícii agent-init `--host containerapp` voľba. Náhľady spravovaného rámca, hlasové a dlhodobé náhľady vyžadujú nezávislé zapnutí v shell/CI prostredí; pozrite si [AI CLI referenciu](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Hodnotenia a optimalizácia AI
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

Agenti beta.22 nahradili staré príkazy hodnotenia `azd ai eval` z `azure.ai.evaluations`. Nová konfigurácia hodnotenia používa camelCase kľúče. Optimalizačný `--config` vyžaduje samostatný optimalizačný API požiadavok, **nie** starý `eval.yaml` alebo nový `azure.eval.yaml`; použite `--eval`/`--eval-config` na opätovné využitie hodnotenia. Viď [nastavenie hodnotenia](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) a [migrácia optimalizácie](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP Server (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generovanie infraštruktúry
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Rýchle pracovné postupy

### Vývojový pracovný tok
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

### Pracovný tok s viacerými prostrediami
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

### Pracovný tok riešenia problémov
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

## 🔍 Príkazy ladenia

### Informácie o ladení
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

### Ladenie šablón
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Príkazy pre súbory a adresáre

### Štruktúra projektu
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formátovanie výstupu

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

### Výstup tabuľky
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Bežné kombinácie príkazov

### Skript kontroly stavu
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Overenie nasadenia
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Porovnanie prostredí
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skript na čistenie zdrojov
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Premenné prostredia

### Bežné premenné prostredia
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

## 🚨 Núdzové príkazy

### Rýchle opravy
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

### Príkazy na obnovu
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profesionálne tipy

### Alias pre rýchlejší pracovný tok
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Skratky funkcií
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

## 📖 Pomoc a dokumentácia

### Získanie pomoci
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

### Odkazy na dokumentáciu
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Tip**: Pridajte si tento prehľad do záložiek a používajte `Ctrl+F` na rýchle vyhľadanie potrebných príkazov!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Pre-flight kontroly](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Nasledujúca lekcia**: [Glosár](glossary.md)

---

> **💡 Chcete pomoc s Azure príkazmi vo svojom editore?** Nainštalujte si [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) s `npx skills add microsoft/github-copilot-for-azure` — 37 zručností pre AI, Foundry, nasadenie, diagnostiku a ďalšie.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->