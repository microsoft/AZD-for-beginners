<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a5f480ef9bf86e8f4dd1340d077fff3",
  "translation_date": "2025-10-24T17:15:48+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "pl"
}
-->
# Skrócona lista poleceń - Kluczowe komendy AZD

**Szybki dostęp do wszystkich rozdziałów**
- **📚 Strona główna kursu**: [AZD dla początkujących](../README.md)
- **📖 Szybki start**: [Rozdział 1: Podstawy i szybki start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Polecenia AI**: [Rozdział 2: Rozwój zorientowany na AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Zaawansowane**: [Rozdział 4: Infrastruktura jako kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Wprowadzenie

Ten kompleksowy przewodnik zawiera szybki dostęp do najczęściej używanych poleceń Azure Developer CLI, zorganizowanych według kategorii i praktycznych przykładów. Idealny do szybkiego sprawdzania podczas programowania, rozwiązywania problemów i codziennej pracy z projektami azd.

## Cele nauki

Korzystając z tego przewodnika, będziesz:
- Mieć natychmiastowy dostęp do kluczowych poleceń i składni Azure Developer CLI
- Rozumieć organizację poleceń według kategorii funkcjonalnych i przypadków użycia
- Korzystać z praktycznych przykładów dla typowych scenariuszy programowania i wdrażania
- Mieć dostęp do poleceń diagnostycznych do szybkiego rozwiązywania problemów
- Łatwo znajdować zaawansowane opcje konfiguracji i dostosowywania
- Zarządzać środowiskami i przepływami pracy w wielu środowiskach

## Rezultaty nauki

Dzięki regularnemu korzystaniu z tego przewodnika będziesz w stanie:
- Pewnie wykonywać polecenia azd bez konieczności przeglądania pełnej dokumentacji
- Szybko rozwiązywać typowe problemy za pomocą odpowiednich poleceń diagnostycznych
- Efektywnie zarządzać wieloma środowiskami i scenariuszami wdrażania
- Wykorzystywać zaawansowane funkcje i opcje konfiguracji azd w razie potrzeby
- Rozwiązywać problemy z wdrażaniem za pomocą systematycznych sekwencji poleceń
- Optymalizować przepływy pracy dzięki skutecznemu wykorzystaniu skrótów i opcji azd

## Polecenia na start

### Uwierzytelnianie
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Inicjalizacja projektu
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kluczowe polecenia wdrażania

### Kompletny proces wdrażania
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Tylko infrastruktura
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes (NEW)
azd provision --preview
# Shows a dry-run view of what resources would be created/modified/deleted
# Similar to 'terraform plan' or 'bicep what-if' - safe to run, no changes applied

# Provision with what-if analysis
azd provision --what-if
```

### Tylko aplikacja
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Budowanie i pakowanie
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

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

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Zmienne środowiskowe
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Polecenia konfiguracji

### Konfiguracja globalna
```bash
# List all configuration
azd config list

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
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitorowanie i logi

### Logi aplikacji
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### Monitorowanie
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
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
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Zaawansowane polecenia

### Pipeline i CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Zarządzanie infrastrukturą
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate

# 🧪 Infrastructure Preview & Planning (NEW)
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Safe to run - no actual changes made to Azure environment
```

### Zarządzanie usługami
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Szybkie przepływy pracy

### Przepływ pracy programisty
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### Przepływ pracy w wielu środowiskach
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

### Przepływ pracy rozwiązywania problemów
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Polecenia debugowania

### Informacje debugowania
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Debugowanie szablonów
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Polecenia plików i katalogów

### Struktura projektu
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatowanie wyników

### Wynik w formacie JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Wynik w formacie tabeli
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Typowe kombinacje poleceń

### Skrypt sprawdzania stanu
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Walidacja wdrożenia
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### Porównanie środowisk
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skrypt czyszczenia zasobów
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Zmienne środowiskowe

### Typowe zmienne środowiskowe
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Polecenia awaryjne

### Szybkie naprawy
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Polecenia odzyskiwania
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Porady ekspertów

### Alias dla szybszego przepływu pracy
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Skróty funkcji
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
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

**Porada**: Dodaj ten przewodnik do zakładek i używaj `Ctrl+F`, aby szybko znaleźć potrzebne polecenia!

---

**Nawigacja**
- **Poprzednia lekcja**: [Kontrole wstępne](../docs/pre-deployment/preflight-checks.md)
- **Następna lekcja**: [Słowniczek](glossary.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.