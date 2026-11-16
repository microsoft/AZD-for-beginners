# Podsumowanie poleceń - Podstawowe polecenia AZD

**Szybkie odniesienie do wszystkich rozdziałów**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **📖 Szybki start**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Polecenia AI**: [Rozdział 2: Rozwój z myślą o AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Zaawansowane**: [Rozdział 4: Infrastruktura jako kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Wprowadzenie

To kompleksowe podsumowanie dostarcza szybkiego odniesienia do najczęściej używanych poleceń Azure Developer CLI, zorganizowanych według kategorii wraz z praktycznymi przykładami. Idealne do szybkiego sprawdzania podczas tworzenia, rozwiązywania problemów oraz codziennej pracy z projektami azd.

## Cele nauki

Korzystając z tego podsumowania, będziesz:
- Miał natychmiastowy dostęp do podstawowych poleceń i składni Azure Developer CLI
- Rozumiał organizację poleceń według kategorii funkcjonalnych i przypadków użycia
- Odnosił się do praktycznych przykładów dla typowych scenariuszy tworzenia i wdrażania
- Korzystał z poleceń do rozwiązywania problemów w celu szybkiego usuwania usterek
- Efektywnie znajdował zaawansowane opcje konfiguracyjne i dostosowania
- Lokalizował polecenia do zarządzania środowiskami i wielośrodowiskowych workflow

## Efekty nauki

Regularne korzystanie z tego podsumowania pozwoli Ci:
- Pewnie wykonywać polecenia azd bez konieczności odwoływania się do pełnej dokumentacji
- Szybko rozwiązywać typowe problemy używając odpowiednich poleceń diagnostycznych
- Efektywnie zarządzać wieloma środowiskami i scenariuszami wdrożeń
- Stosować zaawansowane funkcje i opcje konfiguracyjne azd według potrzeb
- Rozwiązywać problemy z wdrożeniem stosując systematyczne sekwencje poleceń
- Optymalizować przepływy pracy dzięki skutecznemu wykorzystaniu skrótów i opcji azd

## Polecenia wstępne

### Uwierzytelnianie
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

### Inicjalizacja projektu
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

## Główne polecenia wdrażania

### Kompletny workflow wdrożenia
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

### Tylko infrastruktura
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Tylko aplikacja
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Budowanie i pakowanie
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

> **`azd restore`** pobiera zależności Twojej aplikacji (npm, pip, NuGet, Maven itd.). Uruchamia się automatycznie podczas `azd package` oraz `azd deploy`, więc rzadko wywołuje się je bezpośrednio — uruchom je ręcznie, by wstępnie pobrać zależności (np. aby rozgrzać cache CI lub pracować offline później).

> **`azd package`** przygotowuje gotowy do wdrożenia artefakt bez wdrażania usługi aplikacji. Zachowanie zależy od języka i hosta: pakowanie kontenerów może używać zdalnych budów Azure i przesyłać obrazy do rejestru, więc nie musi być operacją offline lub pozbawioną zapisu w Azure. `azd deploy` może automatycznie pakować; użyj osobnego kroku pakowania, gdy potrzebujesz artefaktu lub weryfikacji budowy.


## 🌍 Zarządzanie środowiskami

### Operacje na środowiskach
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

### Zmienne środowiskowe
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

Pliki środowiskowe są w formacie tekstowym. Nie traktuj `azd env set` jako magazynu sekretów; stosuj odwołania do Key Vault lub zarządzane tożsamości, jeśli to właściwe.

## ⚙️ Polecenia konfiguracyjne

### Konfiguracja globalna
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

### Konfiguracja projektu
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitorowanie i diagnostyka

### Panel monitorowania
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

Application Insights musi być skonfigurowany przez szablon. Opcja Live Metrics AZD nie jest obecnie wspierana dla aplikacji Python; zamiast tego korzystaj z przeglądu, logów lub udokumentowanego workflow śledzenia próbki.

### Przeglądanie logów kontenerów
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Zapytania Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Polecenia konserwacyjne

### Czyszczenie
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

### Aktualizacje
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Polecenia zaawansowane

### Pipeline i CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Zarządzanie infrastrukturą
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

### Informacje o projekcie
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Polecenia AI i rozszerzenia

### Rozszerzenia AZD

Odniesienie AI CLI z dnia 2026-11-04: `azd 1.37.2`, agenci `1.0.0-beta.23`, oceny `1.0.0-beta.2`. Używaj `azd >= 1.37.0` dla połączonych workflow; zaktualizuj najpierw podstawowe CLI przed niekompatybilnymi rozszerzeniami.

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

### Polecenia agentów AI
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

`--template`/`-t` zastępuje przestarzałą składnię `--manifest`/`-m`; konieczna jest migracja starszych manifestów. Obecnie nie ma opcji agent-init `--host containerapp`. Zarządzane środowisko, głos i długotrwałe wersje zapoznawcze wymagają niezależnego potwierdzenia shellem/CI; zobacz [odniesienie AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Oceny i optymalizacja AI
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

Agenci beta.22 zastąpili stare polecenia ocen `azd ai eval` z `azure.ai.evaluations`. Nowa konfiguracja oceny używa kluczy camelCase. Optymalizacja `--config` to osobne żądanie API optymalizacyjnego, **nie** przestarzałe `eval.yaml` ani nowe `azure.eval.yaml`; do ponownego użycia oceny stosuj `--eval`/`--eval-config`. Zobacz [konfigurację oceny](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) i [migrację optymalizacji](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Serwer MCP (Alfa)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Generowanie infrastruktury
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Szybkie workflow

### Workflow rozwojowy
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

### Workflow wielośrodowiskowy
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

### Workflow rozwiązywania problemów
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

## 🔍 Polecenia debugowania

### Informacje debugowania
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

### Debugowanie szablonów
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Polecenia plików i katalogów

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

## 🎨 Formatowanie wyjścia

### Wyjście JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Wyjście tabelaryczne
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Popularne kombinacje poleceń

### Skrypt sprawdzania stanu
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Walidacja wdrożenia
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Porównanie środowisk
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Skrypt czyszczenia zasobów
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Zmienne środowiskowe

### Typowe zmienne środowiskowe
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

## 🚨 Polecenia awaryjne

### Szybkie poprawki
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

### Polecenia odzyskiwania
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Profesjonalne wskazówki

### Aliasy przyspieszające workflow
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Skróty funkcji
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

## 📖 Pomoc i dokumentacja

### Uzyskiwanie pomocy
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

### Linki do dokumentacji
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Wskazówka**: Dodaj to podsumowanie do zakładek i używaj `Ctrl+F`, aby szybko znaleźć potrzebne polecenia!

---

**Nawigacja**
- **Poprzednia lekcja**: [Preflight Checks](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Następna lekcja**: [Glosariusz](glossary.md)

---

> **💡 Chcesz pomocy z poleceniami Azure w swoim edytorze?** Zainstaluj [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) z `npx skills add microsoft/github-copilot-for-azure` — 37 umiejętności dla AI, Foundry, wdrażania, diagnostyki i innych.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->