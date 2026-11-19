# Podręczna ściąga poleceń - Niezbędne polecenia AZD

**Szybkie odniesienie dla wszystkich rozdziałów**
- **📚 Strona kursu**: [AZD dla początkujących](../README.md)
- **📖 Szybki start**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Polecenia AI**: [Rozdział 2: Rozwój w podejściu AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Zaawansowane**: [Rozdział 4: Infrastruktura jako kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Wprowadzenie

Ten kompleksowy cheat sheet zapewnia szybki dostęp do najczęściej używanych poleceń Azure Developer CLI, uporządkowanych wg kategorii z praktycznymi przykładami. Idealny do szybkiego odniesienia podczas tworzenia, rozwiązywania problemów i codziennych operacji z projektami azd.

## Cele nauki

Korzystając z tego cheat sheeta, będziesz:
- Miał natychmiastowy dostęp do podstawowych poleceń i składni Azure Developer CLI
- Rozumiał organizację poleceń wg kategorii funkcjonalnych i przypadków użycia
- Korzystał z przykładowych zastosowań dla typowych scenariuszy rozwoju i wdrożenia
- Miał dostęp do poleceń rozwiązywania problemów dla szybkiego usuwania usterek
- Efektywnie znajdował zaawansowane opcje konfiguracji i dostosowań
- Lokalizował polecenia zarządzania środowiskami i wielo-środowiskowe workflow

## Rezultaty nauki

Regularnie korzystając z tego cheat sheeta, będziesz potrafił:
- Wykonywać polecenia azd pewnie, bez konieczności sięgania do pełnej dokumentacji
- Szybko rozwiązywać typowe problemy przy użyciu odpowiednich poleceń diagnostycznych
- Efektywnie zarządzać wieloma środowiskami i scenariuszami wdrożenia
- Stosować zaawansowane funkcje i opcje konfiguracji azd w razie potrzeby
- Rozwiązywać problemy z wdrożeniem używając systematycznych sekwencji poleceń
- Optymalizować workflow poprzez efektywne użycie skrótów i opcji azd

## Polecenia rozpoczęcia pracy

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

## Podstawowe polecenia wdrożeniowe

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

### Kompilacja i pakowanie
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

> **`azd restore`** pobiera zależności Twojej aplikacji (npm, pip, NuGet, Maven itp.). Uruchamia się automatycznie podczas `azd package` i `azd deploy`, więc rzadko wołasz go bezpośrednio — uruchom ręcznie, aby wstępnie pobrać zależności (np. by rozgrzać pamięć podręczną CI lub pracować offline później).

> **`azd package`** przygotowuje artefakt gotowy do wdrożenia bez wdrażania usługi aplikacji. Zachowanie zależy od języka i środowiska: pakowanie kontenera może używać zdalnych buildów Azure i publikować obrazy do rejestru, więc nie jest to koniecznie operacja offline lub bez zapisów w Azure. `azd deploy` może pakować automatycznie; użyj oddzielnego kroku pakowania, gdy potrzebujesz artefaktu lub sprawdzenia builda.


## 🌍 Zarządzanie środowiskiem

### Operacje na środowisku
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

Pliki środowiskowe to zwykły tekst. Nie traktuj `azd env set` jako magazynu sekretów; używaj odwołań do Key Vault lub tożsamości zarządzanej wedle potrzeby.

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

Application Insights musi być skonfigurowane przez szablon. Opcja Live Metrics w AZD nie jest aktualnie wspierana dla aplikacji Python; zamiast tego użyj podsumowania, logów lub dokumentowanego workflow śledzenia przykładu.

### Przeglądanie logów kontenera
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

### Sprzątanie
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

Odniesienie do Foundry GA zaktualizowane 2026-11-09: `microsoft.foundry` bundle 1.0, ogłoszone [5 listopada 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Używaj `azd >= 1.37.0`; komponenty mają niezależne wersjonowanie, a opcje podglądu zachowują własny status.

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

Pakiet nie zawiera ocen, zestawów danych, dostrajania ani modeli niestandardowych. Instalacja pojedynczych rozszerzeń rdzenia jest nadal wspierana. Postępuj według [GA hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) dla przykładu z Python 3.13+, aktualnym uv, uprawnieniami i limitem modeli.

### Polecenia agenta AI
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

`--template`/`-t` zastępuje przestarzałą pisownię `--manifest`/`-m`; manifesty legacy wymagają migracji. Obecnie nie ma opcji agent-init `--host containerapp`. Zarządzany harness, głos i podglądy długotrwałe wymagają niezależnych zgód w powłoce/środowisku CI; patrz [AI CLI reference](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Lokalne testy nadal korzystają z wdrożeń modeli Azure i generują opłaty. Do sprzątania `azd down` usuwa grupę zasobów nowo utworzonego projektu Foundry, ale pozostawia zasoby z ponownego użycia; usuwaj osobno tylko niechciane zasoby, których jesteś właścicielem.

### Oceny AI i optymalizacja
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

Agenty beta.22 zastąpiły stare polecenia oceny `azd ai eval` z `azure.ai.evaluations`. Nowa konfiguracja oceny używa kluczy camelCase. Optymalizacja `--config` wymaga samodzielnego zapytania API optymalizacji, **nie** starych `eval.yaml` lub nowych `azure.eval.yaml`; do ponownego użycia oceny stosuj `--eval`/`--eval-config`. Patrz [konfiguracja oceny](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) i [migracja optymalizacji](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Fragment runnera nie jest pełnym workflow. Zatwierdź ocenioną konfigurację i zasoby niebędące sekretami, nadaj dostęp do zestawu danych/oceniającego/modelu, stosuj środowisko dla każdego etapu. Patrz [przykład uwierzytelnionego CI/CD](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### Serwer MCP (Alpha)
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

### Workflow developmentowy
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

### Workflow wielo-środowiskowy
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

### Skrypt sprzątający zasoby
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Zmienne środowiskowe

### Popularne zmienne środowiskowe
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

### Alias dla szybszej pracy
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

### Uzyskanie pomocy
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

**Wskazówka**: Dodaj ten cheat sheet do zakładek i użyj `Ctrl+F`, aby szybko znaleźć potrzebne polecenia!

---

**Nawigacja**
- **Poprzednia lekcja**: [Kontrole wstępne](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Następna lekcja**: [Słowniczek](glossary.md)

---

> **💡 Chcesz pomocy z poleceniami Azure w swoim edytorze?** Zainstaluj [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) z `npx skills add microsoft/github-copilot-for-azure` — 37 umiejętności dla AI, Foundry, wdrożeń, diagnostyki i nie tylko.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->