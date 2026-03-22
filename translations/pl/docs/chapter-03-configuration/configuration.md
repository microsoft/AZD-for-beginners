# Przewodnik Konfiguracji

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD Dla Początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 3 - Konfiguracja i uwierzytelnianie
- **⬅️ Poprzedni**: [Twój pierwszy projekt](first-project.md)
- **➡️ Następny**: [Przewodnik wdrożenia](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Następny rozdział**: [Rozdział 4: Infrastruktura jako kod](../chapter-04-infrastructure/deployment-guide.md)

## Wprowadzenie

Ten kompleksowy przewodnik obejmuje wszystkie aspekty konfigurowania Azure Developer CLI dla optymalnych przepływów pracy związanych z tworzeniem i wdrażaniem. Dowiesz się o hierarchii konfiguracji, zarządzaniu środowiskami, metodach uwierzytelniania oraz zaawansowanych wzorcach konfiguracji umożliwiających wydajne i bezpieczne wdrożenia Azure.

## Cele nauki

Po zakończeniu tej lekcji:
- Opanujesz hierarchię konfiguracji azd i zrozumiesz, jak traktowane są priorytety ustawień
- Skutecznie skonfigurujesz ustawienia globalne i specyficzne dla projektu
- Będziesz zarządzać wieloma środowiskami o różnych konfiguracjach
- Wdrożysz bezpieczne wzorce uwierzytelniania i autoryzacji
- Zrozumiesz zaawansowane wzorce konfiguracji dla złożonych scenariuszy

## Efekty nauczania

Po ukończeniu lekcji będziesz potrafił:
- Konfigurować azd dla optymalnych przepływów pracy programistycznej
- Ustawiać i zarządzać wieloma środowiskami wdrożeniowymi
- Wdrażać bezpieczne praktyki zarządzania konfiguracją
- Rozwiązywać problemy związane z konfiguracją
- Dostosowywać zachowanie azd do wymagań organizacji

Ten kompleksowy przewodnik obejmuje wszystkie aspekty konfigurowania Azure Developer CLI dla optymalnych przepływów pracy związanych z tworzeniem i wdrażaniem.

## Zrozumienie agentów AI w projekcie azd

Jeśli jesteś nowicjuszem w kwestii agentów AI, oto prosty sposób, aby je sobie wyobrazić w kontekście azd.

### Czym jest agent?

Agent to oprogramowanie, które może otrzymać żądanie, przeanalizować je i podjąć działania — często wywołując model AI, wyszukując dane lub uruchamiając inne usługi. W projekcie azd agent jest po prostu kolejną **usługą** obok twojego frontend webowego lub backendu API.

### Jak agenci wpisują się w strukturę projektu azd

Projekt azd składa się z trzech warstw: **infrastruktury**, **kodu** i **konfiguracji**. Agenci podłączają się do tych warstw tak samo jak każda inna usługa:

| Warstwa | Co robi dla tradycyjnej aplikacji | Co robi dla agenta |
|---------|------------------------------------|--------------------|
| **Infrastruktura** (`infra/`) | Prowizjonuje aplikację webową i bazę danych | Prowizjonuje punkt końcowy modelu AI, indeks wyszukiwania lub host agenta |
| **Kod** (`src/`) | Zawiera kod źródłowy frontendu i API | Zawiera logikę agenta i definicje promptów |
| **Konfiguracja** (`azure.yaml`) | Wymienia usługi i ich cele hostingu | Wymienia agenta jako usługę, wskazując na jego kod i host |

### Rola `azure.yaml`

Nie musisz teraz zapamiętywać składni. Koncepcyjnie `azure.yaml` to plik, w którym mówisz azd: *„Oto usługi, które tworzą moją aplikację, i tutaj jest ich kod.”*

Gdy twój projekt zawiera agenta AI, `azure.yaml` po prostu wymienia tego agenta jako jedną z usług. azd wie wtedy, aby przygotować odpowiednią infrastrukturę (jak punkt końcowy Microsoft Foundry Models lub Container App do hostowania agenta) i wdrożyć twój kod agenta — tak jak zrobiłby to dla aplikacji webowej lub API.

Oznacza to, że nie ma nic zasadniczo nowego do nauczenia się. Jeśli rozumiesz, jak azd zarządza usługą internetową, już rozumiesz, jak zarządza agentem.

## Hierarchia konfiguracji

azd używa hierarchicznego systemu konfiguracji:
1. **Flagii wiersza poleceń** (najwyższy priorytet)
2. **Zmiennych środowiskowych**
3. **Lokalnej konfiguracji projektu** (`.azd/config.json`)
4. **Globalnej konfiguracji użytkownika** (`~/.azd/config.json`)
5. **Domyślnych wartości** (najniższy priorytet)

## Konfiguracja globalna

### Ustawianie globalnych wartości domyślnych
```bash
# Ustaw domyślną subskrypcję
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Ustaw domyślną lokalizację
azd config set defaults.location "eastus2"

# Ustaw domyślną konwencję nazewnictwa grup zasobów
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Wyświetl wszystkie globalne ustawienia
azd config list

# Usuń konfigurację
azd config unset defaults.location
```

### Najczęstsze ustawienia globalne
```bash
# Preferencje rozwojowe
azd config set alpha.enable true                    # Włącz funkcje alfa
azd config set telemetry.enabled false             # Wyłącz telemetrię
azd config set output.format json                  # Ustaw format wyjściowy

# Ustawienia bezpieczeństwa
azd config set auth.useAzureCliCredential true     # Użyj Azure CLI do uwierzytelniania
azd config set tls.insecure false                  # Wymuś weryfikację TLS

# Dostosowanie wydajności
azd config set provision.parallelism 5             # Równoległe tworzenie zasobów
azd config set deploy.timeout 30m                  # Limit czasu wdrożenia
```

## 🏗️ Konfiguracja projektu

### Struktura azure.yaml
Plik `azure.yaml` to serce twojego projektu azd:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

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
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

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

#### Ustawienia specyficzne dla języka
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Zarządzanie środowiskami

### Tworzenie środowisk
```bash
# Utwórz nowe środowisko
azd env new development

# Utwórz w określonej lokalizacji
azd env new staging --location "westus2"

# Utwórz z szablonu
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfiguracja środowiska
Każde środowisko ma własną konfigurację w `.azure/<nazwa-środowiska>/config.json`:

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
```bash
# Ustaw zmienne specyficzne dla środowiska
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Wyświetl zmienne środowiskowe
azd env get-values

# Oczekiwany wynik:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Usuń zmienną środowiskową
azd env unset DEBUG

# Zweryfikuj usunięcie
azd env get-values | grep DEBUG
# (nie powinno nic zwrócić)
```

### Szablony środowisk
Utwórz `.azure/env.template` dla spójnej konfiguracji środowiska:
```bash
# Wymagane zmienne
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Ustawienia aplikacji
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Opcjonalne ustawienia deweloperskie
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Konfiguracja uwierzytelniania

### Integracja z Azure CLI
```bash
# Użyj poświadczeń Azure CLI (domyślne)
azd config set auth.useAzureCliCredential true

# Zaloguj się z konkretnym dzierżawcą
az login --tenant <tenant-id>

# Ustaw domyślną subskrypcję
az account set --subscription <subscription-id>
```

### Uwierzytelnianie przy pomocy Service Principal
Dla pipeline’ów CI/CD:
```bash
# Ustaw zmienne środowiskowe
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Lub skonfiguruj bezpośrednio
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Tożsamość zarządzana
Dla środowisk hostowanych w Azure:
```bash
# Włącz uwierzytelnianie tożsamości zarządzanej
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
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
Dla projektów Terraform, konfigurowanie w `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Konfiguracja wdrożenia

### Konfiguracja budowania
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Konfiguracja Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Przykładowy plik `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Zaawansowana konfiguracja

### Niestandardowe nazewnictwo zasobów
```bash
# Ustaw konwencje nazewnictwa
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Konfiguracja sieci
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Konfiguracja monitoringu
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Konfiguracje specyficzne dla środowiska

### Środowisko deweloperskie
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Środowisko testowe
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
# Sprawdź składnię konfiguracji
azd config validate

# Przetestuj zmienne środowiskowe
azd env get-values

# Zweryfikuj infrastrukturę
azd provision --dry-run
```

### Skrypty konfiguracji
Twórz skrypty walidacyjne w katalogu `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Sprawdź wymagane zmienne środowiskowe
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Sprawdź składnię pliku azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
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

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organizuj pliki konfiguracyjne
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
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

### 3. Uwzględniaj kontrolę wersji
```bash
# .gitignore
.azure/*/config.json         # Konfiguracje środowiska (zawierają identyfikatory zasobów)
.azure/*/.env               # Zmienne środowiskowe (mogą zawierać sekrety)
.env                        # Lokalny plik środowiskowy
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

**Cel**: Utwórz i skonfiguruj trzy środowiska z różnymi ustawieniami

```bash
# Utwórz środowisko programistyczne
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Utwórz środowisko testowe
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Utwórz środowisko produkcyjne
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Zweryfikuj każde środowisko
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Kryteria sukcesu:**
- [ ] Utworzono trzy środowiska
- [ ] Każde środowisko ma unikalną konfigurację
- [ ] Można przełączać się między środowiskami bez błędów
- [ ] `azd env list` pokazuje wszystkie trzy środowiska

### Ćwiczenie 2: Zarządzanie sekretami (10 minut)

**Cel**: Ćwiczenie bezpiecznej konfiguracji z danymi wrażliwymi

```bash
# Ustaw tajne dane (nie wyświetlane w wyjściu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Ustaw konfigurację nie będącą tajną
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Wyświetl środowisko (tajne dane powinny być zanonimizowane)
azd env get-values

# Sprawdź, czy tajne dane są przechowywane
azd env get DB_PASSWORD  # Powinno pokazać rzeczywistą wartość
```

**Kryteria sukcesu:**
- [ ] Sekrety są przechowywane bez wyświetlania w terminalu
- [ ] `azd env get-values` pokazuje zredagowane sekrety
- [ ] Pojedyncze `azd env get <SECRET_NAME>` zwraca rzeczywistą wartość

## Następne kroki

- [Twój pierwszy projekt](first-project.md) - zastosuj konfigurację w praktyce
- [Przewodnik wdrożenia](../chapter-04-infrastructure/deployment-guide.md) - wykorzystaj konfigurację do wdrożenia
- [Prowizjonowanie zasobów](../chapter-04-infrastructure/provisioning.md) - konfiguracje gotowe do produkcji

## Odnośniki

- [Odnośnik konfiguracji azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schemat azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Zmiennych środowiskowe](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD Dla Początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 3 - Konfiguracja i uwierzytelnianie
- **⬅️ Poprzedni**: [Twój pierwszy projekt](first-project.md)
- **➡️ Następny rozdział**: [Rozdział 4: Infrastruktura jako kod](../chapter-04-infrastructure/deployment-guide.md)
- **Następna lekcja**: [Twój pierwszy projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Dokument ten został przetłumaczony przy użyciu usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mimo że dążymy do dokładności, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uznawany za źródło ostateczne. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->