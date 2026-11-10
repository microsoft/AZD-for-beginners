# Przewodnik Konfiguracji

**Nawigacja po rozdziałach:**
- **📚 Strona kursu głównego**: [AZD Dla Początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 3 - Konfiguracja i uwierzytelnianie
- **⬅️ Poprzedni**: [Twój Pierwszy Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Następny**: [Przewodnik Wdrażania](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Następny rozdział**: [Rozdział 4: Infrastruktura jako Kod](../chapter-04-infrastructure/deployment-guide.md)

## Wprowadzenie

> Zweryfikowano względem `azd 1.37.2` (listopad 2026). Polecenia bash zakładają zainicjowany projekt azd. O ile nie opisano inaczej jako pełny plik, fragmenty YAML/Bicep są fragmentami do scalania z odpowiadającymi plikami projektu, a nie samodzielnymi uruchamialnymi projektami.

Ten kompleksowy przewodnik obejmuje wszystkie aspekty konfigurowania Azure Developer CLI dla optymalnych przepływów pracy rozwojowych i wdrożeń. Nauczysz się o hierarchii konfiguracji, zarządzaniu środowiskami, metodach uwierzytelniania oraz zaawansowanych wzorcach konfiguracyjnych umożliwiających efektywne i bezpieczne wdrożenia w Azure.

## Cele nauki

Po zakończeniu tej lekcji będziesz potrafić:
- Opanować hierarchię konfiguracji azd i zrozumieć, jak priorytetyzowane są ustawienia
- Skutecznie konfigurować ustawienia globalne i specyficzne dla projektu
- Zarządzać wieloma środowiskami o różnych konfiguracjach
- Wdrażać bezpieczne wzorce uwierzytelniania i autoryzacji
- Zrozumieć zaawansowane wzorce konfiguracyjne dla złożonych scenariuszy

## Rezultaty nauki

Po ukończeniu tej lekcji będziesz w stanie:
- Konfigurować azd dla optymalnych przepływów pracy rozwojowej
- Zakładać i zarządzać wieloma środowiskami wdrożeniowymi
- Wdrażać bezpieczne praktyki zarządzania konfiguracją
- Rozwiązywać problemy związane z konfiguracją
- Dostosowywać zachowanie azd do konkretnych wymagań organizacyjnych

Ten kompleksowy przewodnik obejmuje wszystkie aspekty konfigurowania Azure Developer CLI dla optymalnych przepływów pracy rozwojowych i wdrożeń.

## Zrozumienie agentów AI w projekcie azd

Jeśli jesteś nowy w agentach AI, oto prosty sposób, aby je zrozumieć w świecie azd.

### Czym jest agent?

Agent to fragment oprogramowania, który może otrzymać żądanie, przemyśleć je i podjąć działania—często wywołując model AI, wyszukując dane lub odwołując się do innych usług. W projekcie azd agent jest po prostu kolejnym **serwisem** obok frontendowej aplikacji webowej lub backendu API.

### Jak agenci wpisują się w strukturę projektu azd

Projekt azd składa się z trzech warstw: **infrastruktury**, **kodu** i **konfiguracji**. Agenci podłączają się do tych warstw tak samo jak inne usługi:

| Warstwa | Co robi dla tradycyjnej aplikacji | Co robi dla agenta |
|-------|-------------------------------------|---------------------------|
| **Infrastruktura** (`infra/`) | Uruchamia aplikację webową i bazę danych | Uruchamia punkt końcowy modelu AI, indeks wyszukiwania lub host agenta |
| **Kod** (`src/`) | Zawiera kod źródłowy frontendu i API | Zawiera logikę agenta i definicje promptów |
| **Konfiguracja** (`azure.yaml`) | Wymienia usługi i ich docelowe hosty | Wymienia twojego agenta jako usługę, wskazując na jego kod i host |

### Rola `azure.yaml`

Nie musisz teraz zapamiętywać składni. Koncepcyjnie, `azure.yaml` to plik, w którym mówisz azd: *"Oto usługi budujące moją aplikację i tu znajdziesz ich kod."*

Gdy projekt zawiera agenta AI, `azure.yaml` po prostu wymienia agent jako jedną z usług. azd wie wtedy, aby uruchomić odpowiednią infrastrukturę (np. punkt końcowy Microsoft Foundry Models lub Container App do hostowania agenta) i wdrożyć kod agenta—tak jak dla aplikacji webowej czy API.

To oznacza, że nie ma niczego zasadniczo nowego do nauki. Jeśli rozumiesz, jak azd zarządza usługą webową, już rozumiesz, jak zarządza agentem.

## Hierarchia konfiguracji

azd posiada odrębne powierzchnie konfiguracji, a nie uniwersalną nakładkę:
- **Globalne preferencje użytkownika**: `~/.azd/config.json`, zarządzane przez `azd config`.
- **Definicja projektu**: `azure.yaml` określa usługi, infrastrukturę i hooki.
- **Wybór lokalnego środowiska**: `.azure/config.json`.
- **Wartości specyficzne dla środowiska**: `.azure/<name>/.env`, zarządzane przez `azd env`; dodatkowe ustawienia znajdują się w `config.json` odpowiedniego środowiska.
- **Flag i zmienne procesów**: nadpisują jedynie ustawienia obsługiwane przez konkretne polecenie/dostawcę.

Dowolna wartość `azd env set` nie staje się automatycznie parametrem infrastruktury ani ustawieniem wdrożonej aplikacji. Należy ją jednoznacznie wskazać w pliku parametrów, obsługiwanej konfiguracji usługi lub hooku.

## Globalna konfiguracja

### Ustawianie globalnych wartości domyślnych
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Typowe ustawienia globalne
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Konfiguracja projektu

### Struktura pliku azure.yaml
Plik `azure.yaml` to serce twojego projektu azd:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

To jest **przykład definicji projektu**, nie dostarczony starter. Utwórz odwołane katalogi źródłowe, skrypty hook i pakietów oraz dopasowane `infra/main.bicep`/`main.parameters.json` zanim go uruchomisz. Bazy danych należą do infrastruktury; `postgres` nie jest wbudowanym hostem usługi. Parametry infrastruktury umieszczaj w pliku parametrów dostawcy, nie w `infra.parameters`.

### Opcje konfiguracji usług

#### Typy hostów
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Hooki specyficzne dla języka

Następujące fragmenty usług ilustrują hooki; scal je z prawdziwymi `project` i `host` każdej usługi. `buildCommand` i `startCommand` nie są uniwersalnymi właściwościami usługi azd. Konfiguruj start w aplikacji, Dockerfile lub infrastrukturze hosta.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Zarządzanie środowiskami

### Tworzenie środowisk
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfiguracja środowiska
Podstawowe wartości środowiska znajdują się w `.azure/<env-name>/.env`, w tym `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` i `AZURE_LOCATION`. Używaj `azd env config get/set` dla dodatkowych ustawień JSON środowiska. Poniższy JSON jest **koncepcyjnym stanem aplikacji**, nie schematem konfiguracji azd; nie kopiuj go do plików azd:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Zmienne środowiskowe

**Tylko demonstracja w postaci jawnego tekstu.** Zwykłe wartości `azd env set` są zapisywane w `.azure/<name>/.env` i mogą być wyświetlone przez polecenia odczytu. Nie używaj przykładowego klucza API jako prawdziwego poświadczenia. Dla sekretów używaj `azd env set-secret` i jawnego wiązania w czasie działania.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Szablony środowisk
Utwórz **niezastrzeżony, ręcznie utrzymywany** `.env.example` w katalogu głównym projektu dla spójnej konfiguracji. azd nie ładuje automatycznie pliku o nazwie `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Udostępnianie środowisk w zespole

Gdy nad projektem pracuje więcej niż jedna osoba, trzeba uzgodnić **co jest przechowywane w repozytorium, a co zostaje lokalne**. azd trzyma każde środowisko pod folderem `.azure/` i nie wszystko powinno być zatwierdzane.

**Co jest w `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Co ignorować w git.** Domyślny `.gitignore` azd wyklucza już `.azure/`. Zachowaj to tak—pliki `.env` mogą zawierać sekrety, a identyfikatory zasobów są specyficzne dla osoby, która je utworzyła. Każdy współpracownik tworzy **własne** środowisko lokalnie:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Przełączanie pomiędzy środowiskami.** Programista zarządzający kilkoma środowiskami wybiera aktywne przed uruchomieniem poleceń:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Dostarczanie zespołowi niezastrzeżonych wartości domyślnych.** Zatwierdzaj `.env.example` poza ignorowanym katalogiem `.azure/`. Nowi współpracownicy kopiują go do lokalnego ignorowanego pliku, wypełniają wartości i jawnie importują poleceniem `azd env set --file <local-file>`. Nigdy nie importuj pustych zastępczych wartości nad działające środowisko.

**Środowiska w CI/CD.** Pipelines nie czytają twojego lokalnego folderu `.azure/`. Zamiast tego dostarcz zmienne/sekrety środowiska jako zmienne pipelines, a azd odczytuje je ze środowiska procesu:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Zasada ogólna:** kod infrastruktury (`infra/`, `azure.yaml`) jest współdzielony w Git; *stan i sekrety środowiska* (`.azure/`) są per programista i per pipeline. `azd pipeline config` ustawia zmienne pipeline dla ciebie automatycznie.

## 🔐 Konfiguracja uwierzytelniania

### Integracja Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Uwierzytelnianie Service Principal
Dla pipeline CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Managed Identity
Dla środowisk hostowanych w Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Konfiguracja infrastruktury

### Parametry Bicep
Konfiguruj parametry infrastruktury w `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Konfiguracja Terraform
Dla projektów Terraform, azd podstawia zastępniki w `infra/main.tfvars.json`. Nazwy muszą odpowiadać zadeklarowanym zmiennym wejściowym Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Konfiguracja wdrożenia

### Konfiguracja budowy
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Konfiguracja Dockera
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
Ścieżki są względem projektu usługi. Dockerfile musi zadeklarować wszelkie wartości `ARG`, których używa. Dla budowy wieloetapowej umieść etap wdrożeniowy na końcu lub użyj niestandardowego przepływu pakowania; `docker.target` nie jest wspieraną właściwością w ocenianym schemacie.

## 🔧 Zaawansowana konfiguracja

### Niestandardowe nazewnictwo zasobów
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definiuj faktyczne nazwy zasobów w Bicep/Terraform i utrzymuj tworzenie grup zasobów spójne z tym ustawieniem. Nie ma ogólnych kluczy konfiguracyjnych `naming.storageAccount` lub `naming.keyVault`.

### Konfiguracja sieci
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Scal te **ilustracyjne wpisy parametrów** do `infra/main.parameters.json` pod `parameters`, deklaruj i konsumuj odpowiadające parametry w Bicep. Same z siebie nie mają efektu.

### Konfiguracja monitoringu
Uruchom Application Insights i Log Analytics w Bicep/Terraform i skonfiguruj telemetrię aplikacji w SDK. Nie ma ogólnego bloku najwyższego poziomu `monitoring` w `azure.yaml` tworzącego te zasoby. Zobacz [infrastrukturę monitorującą](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Konfiguracje specyficzne dla środowiska

### Środowisko deweloperskie
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Środowisko stagingowe
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Środowisko produkcyjne
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Walidacja konfiguracji

### Waliduj konfigurację
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Skrypty konfiguracyjne
Twórz skrypty walidacyjne w `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Najlepsze praktyki

### 1. Używaj zmiennych środowiskowych
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Unikaj twardego kodowania wrażliwych wartości (oddziel ilustracyjną konfigurację, nie drugi klucz `database` w tym samym pliku):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizuj pliki konfiguracyjne
```
.azure/
├── config.json              # Global project config
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Rozważania dotyczące kontroli wersji
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Dokumentacja konfiguracji
Dokumentuj konfigurację w `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Ćwiczenia praktyczne

### Ćwiczenie 1: Konfiguracja wielośrodowiskowa (15 minut)

**Cel**: Utwórz i skonfiguruj trzy lokalne środowiska z różnymi wartościami. Zacznij od zainicjowanego projektu; użyj nieużywanych nazw, jeśli już istnieją. Te wartości specyficzne dla aplikacji nie zmieniają ustawień telemetrycznych ani czasu działania, dopóki twój szablon ich nie wykorzysta.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kryteria sukcesu:**
- [ ] Trzy środowiska pomyślnie utworzone
- [ ] Każde środowisko ma unikatową konfigurację
- [ ] Możliwość przełączania między środowiskami bez błędów
- [ ] `azd env list` pokazuje wszystkie trzy środowiska

### Ćwiczenie 2: Odwołania do tajemnic Key Vault (10-20 minut)

**Cel**: Przechowuj odniesienie do Key Vault zamiast jawnego tekstu. **Punkt startowy:** zainicjowane środowisko, zalogowanie do Azure i dostęp do Key Vault z pozwoleniami na tworzenie/odczyt fikcyjnego sekretu. Operacje na vault mogą generować opłaty.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Kryteria sukcesu:**
- [ ] Interaktywne polecenie raportuje wybrany vault i odniesienie do sekretu
- [ ] Lokalny `.env` zawiera odniesienie, a nie fikcyjny sekret
- [ ] Potrafi wyjaśnić, że tożsamość wykonawcza/RBAC i konsumpcja muszą być nadal skonfigurowane

**Typowe problemy:** błąd 403 wymaga poprawnej roli na poziomie danych vault i czasu propagacji; `azd env set ... --secret` nie jest poprawnym poleceniem. Zwykły output `get-values`/`get-value` nie powinien być uznawany za zredagowany. Usuń odniesienie treningowe poleceniem `azd env unset TRAINING_API_KEY`; nie usuwa to sekretu vault, który musisz osobno wyczyścić, jeśli go utworzyłeś.

## Kolejne kroki

- [Twój Pierwszy Projekt](../chapter-01-foundation/first-project.md) - Zastosuj konfigurację w praktyce
- [Przewodnik Wdrażania](../chapter-04-infrastructure/deployment-guide.md) - Użyj konfiguracji do wdrożenia
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Konfiguracje gotowe do produkcji

## Źródła

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Environment Variables](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Nawigacja po rozdziałach:**
- **📚 Strona kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 3 - Konfiguracja i uwierzytelnianie
- **⬅️ Poprzedni**: [Twój pierwszy projekt](../chapter-01-foundation/first-project.md)
- **➡️ Następny rozdział**: [Rozdział 4: Infrastruktura jako kod](../chapter-04-infrastructure/deployment-guide.md)
- **Następna lekcja**: [Uwierzytelnianie i bezpieczeństwo](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->