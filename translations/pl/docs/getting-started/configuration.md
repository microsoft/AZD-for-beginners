# Przewodnik Konfiguracji

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 3 - Konfiguracja i uwierzytelnianie
- **⬅️ Poprzedni**: [Twój pierwszy projekt](first-project.md)
- **➡️ Następny**: [Przewodnik wdrożeniowy](../deployment/deployment-guide.md)
- **🚀 Następny rozdział**: [Rozdział 4: Infrastruktura jako kod](../deployment/deployment-guide.md)

## Wprowadzenie

Ten kompleksowy przewodnik obejmuje wszystkie aspekty konfiguracji Azure Developer CLI, aby zoptymalizować procesy rozwoju i wdrożenia. Dowiesz się o hierarchii konfiguracji, zarządzaniu środowiskami, metodach uwierzytelniania oraz zaawansowanych wzorcach konfiguracji, które umożliwiają efektywne i bezpieczne wdrożenia w Azure.

## Cele nauki

Po ukończeniu tej lekcji będziesz:
- Mistrzowsko zarządzać hierarchią konfiguracji azd i rozumieć, jak priorytetyzowane są ustawienia
- Skutecznie konfigurować ustawienia globalne i specyficzne dla projektu
- Zarządzać wieloma środowiskami z różnymi konfiguracjami
- Wdrażać bezpieczne wzorce uwierzytelniania i autoryzacji
- Rozumieć zaawansowane wzorce konfiguracji dla złożonych scenariuszy

## Rezultaty nauki

Po ukończeniu tej lekcji będziesz w stanie:
- Skonfigurować azd dla optymalnych procesów rozwoju
- Ustawić i zarządzać wieloma środowiskami wdrożeniowymi
- Wdrażać praktyki bezpiecznego zarządzania konfiguracją
- Rozwiązywać problemy związane z konfiguracją
- Dostosowywać zachowanie azd do specyficznych wymagań organizacyjnych

Ten kompleksowy przewodnik obejmuje wszystkie aspekty konfiguracji Azure Developer CLI, aby zoptymalizować procesy rozwoju i wdrożenia.

## Hierarchia konfiguracji

azd korzysta z hierarchicznego systemu konfiguracji:
1. **Flagi wiersza poleceń** (najwyższy priorytet)
2. **Zmienne środowiskowe**
3. **Lokalna konfiguracja projektu** (`.azd/config.json`)
4. **Globalna konfiguracja użytkownika** (`~/.azd/config.json`)
5. **Wartości domyślne** (najniższy priorytet)

## Konfiguracja globalna

### Ustawianie domyślnych wartości globalnych
```bash
# Ustaw domyślną subskrypcję
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Ustaw domyślną lokalizację
azd config set defaults.location "eastus2"

# Ustaw domyślną konwencję nazewnictwa grup zasobów
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Wyświetl całą globalną konfigurację
azd config list

# Usuń konfigurację
azd config unset defaults.location
```

### Typowe ustawienia globalne
```bash
# Preferencje rozwoju
azd config set alpha.enable true                    # Włącz funkcje alfa
azd config set telemetry.enabled false             # Wyłącz telemetrię
azd config set output.format json                  # Ustaw format wyjściowy

# Ustawienia bezpieczeństwa
azd config set auth.useAzureCliCredential true     # Użyj Azure CLI do uwierzytelniania
azd config set tls.insecure false                  # Wymuś weryfikację TLS

# Optymalizacja wydajności
azd config set provision.parallelism 5             # Równoległe tworzenie zasobów
azd config set deploy.timeout 30m                  # Limit czasu wdrożenia
```

## 🏗️ Konfiguracja projektu

### Struktura azure.yaml
Plik `azure.yaml` jest sercem Twojego projektu azd:

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

# Utwórz z określoną lokalizacją
azd env new staging --location "westus2"

# Utwórz z szablonu
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfiguracja środowisk
Każde środowisko ma własną konfigurację w `.azure/<env-name>/config.json`:

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
# (powinno nic nie zwrócić)
```

### Szablony środowisk
Utwórz `.azure/env.template` dla spójnego ustawienia środowiska:
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

# Zaloguj się z określonym dzierżawcą
az login --tenant <tenant-id>

# Ustaw domyślną subskrypcję
az account set --subscription <subscription-id>
```

### Uwierzytelnianie za pomocą Service Principal
Dla potoków CI/CD:
```bash
# Ustaw zmienne środowiskowe
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Lub skonfiguruj bezpośrednio
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Zarządzana tożsamość
Dla środowisk hostowanych w Azure:
```bash
# Włącz uwierzytelnianie za pomocą zarządzanej tożsamości
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
Dla projektów Terraform, konfiguruj w `infra/terraform.tfvars`:
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
Przykładowy `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

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

### Konfiguracja monitorowania
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
# .azure/rozwój/.env
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

### Walidacja konfiguracji
```bash
# Sprawdź składnię konfiguracji
azd config validate

# Przetestuj zmienne środowiskowe
azd env get-values

# Zweryfikuj infrastrukturę
azd provision --dry-run
```

### Skrypty konfiguracji
Twórz skrypty walidacyjne w `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Sprawdź wymagane zmienne środowiskowe
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Sprawdź składnię azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Najlepsze praktyki

### 1. Korzystaj ze zmiennych środowiskowych
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

### 3. Rozważania dotyczące kontroli wersji
```bash
# .gitignore
.azure/*/config.json         # Konfiguracje środowiska (zawierają identyfikatory zasobów)
.azure/*/.env               # Zmienne środowiskowe (mogą zawierać tajne dane)
.env                        # Plik lokalnego środowiska
```

### 4. Dokumentacja konfiguracji
Dokumentuj swoją konfigurację w `CONFIG.md`:
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
# Utwórz środowisko deweloperskie
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
- [ ] Trzy środowiska utworzone pomyślnie
- [ ] Każde środowisko ma unikalną konfigurację
- [ ] Można przełączać się między środowiskami bez błędów
- [ ] `azd env list` pokazuje wszystkie trzy środowiska

### Ćwiczenie 2: Zarządzanie sekretami (10 minut)

**Cel**: Praktyka bezpiecznej konfiguracji z danymi wrażliwymi

```bash
# Ustaw tajne dane (nie wyświetlane w wyjściu)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Ustaw konfigurację nie-tajną
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Wyświetl środowisko (tajne dane powinny być ukryte)
azd env get-values

# Zweryfikuj, czy tajne dane są przechowywane
azd env get DB_PASSWORD  # Powinno pokazać rzeczywistą wartość
```

**Kryteria sukcesu:**
- [ ] Sekrety przechowywane bez wyświetlania w terminalu
- [ ] `azd env get-values` pokazuje ukryte sekrety
- [ ] Indywidualne `azd env get <SECRET_NAME>` pobiera rzeczywistą wartość

## Kolejne kroki

- [Twój pierwszy projekt](first-project.md) - Zastosowanie konfiguracji w praktyce
- [Przewodnik wdrożeniowy](../deployment/deployment-guide.md) - Wykorzystanie konfiguracji do wdrożenia
- [Provisioning Resources](../deployment/provisioning.md) - Konfiguracje gotowe do produkcji

## Źródła

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 3 - Konfiguracja i uwierzytelnianie
- **⬅️ Poprzedni**: [Twój pierwszy projekt](first-project.md)
- **➡️ Następny rozdział**: [Rozdział 4: Infrastruktura jako kod](../deployment/deployment-guide.md)
- **Następna lekcja**: [Twój pierwszy projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->