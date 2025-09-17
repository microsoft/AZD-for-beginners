<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2268ee429553504f96f4571074bcbf84",
  "translation_date": "2025-09-17T16:41:18+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "pl"
}
-->
# Przewodnik Konfiguracji

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 3 - Konfiguracja i uwierzytelnianie
- **⬅️ Poprzedni**: [Twój pierwszy projekt](first-project.md)
- **➡️ Następny**: [Przewodnik wdrożeniowy](../deployment/deployment-guide.md)
- **🚀 Następny rozdział**: [Rozdział 4: Infrastruktura jako kod](../deployment/deployment-guide.md)

## Wprowadzenie

Ten kompleksowy przewodnik obejmuje wszystkie aspekty konfiguracji Azure Developer CLI, aby zoptymalizować procesy tworzenia i wdrażania. Dowiesz się o hierarchii konfiguracji, zarządzaniu środowiskami, metodach uwierzytelniania oraz zaawansowanych wzorcach konfiguracji, które umożliwiają efektywne i bezpieczne wdrożenia w Azure.

## Cele nauki

Po zakończeniu tej lekcji będziesz:
- Znać hierarchię konfiguracji azd i rozumieć, jak priorytetyzowane są ustawienia
- Skutecznie konfigurować ustawienia globalne i specyficzne dla projektu
- Zarządzać wieloma środowiskami z różnymi konfiguracjami
- Wdrażać bezpieczne wzorce uwierzytelniania i autoryzacji
- Rozumieć zaawansowane wzorce konfiguracji dla złożonych scenariuszy

## Rezultaty nauki

Po ukończeniu tej lekcji będziesz w stanie:
- Skonfigurować azd dla optymalnych procesów tworzenia
- Ustawić i zarządzać wieloma środowiskami wdrożeniowymi
- Wdrażać praktyki bezpiecznego zarządzania konfiguracją
- Rozwiązywać problemy związane z konfiguracją
- Dostosowywać działanie azd do specyficznych wymagań organizacyjnych

Ten kompleksowy przewodnik obejmuje wszystkie aspekty konfiguracji Azure Developer CLI, aby zoptymalizować procesy tworzenia i wdrażania.

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
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# Set default resource group naming convention
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# View all global configuration
azd config list

# Remove a configuration
azd config unset defaults.location
```

### Typowe ustawienia globalne
```bash
# Development preferences
azd config set alpha.enable true                    # Enable alpha features
azd config set telemetry.enabled false             # Disable telemetry
azd config set output.format json                  # Set output format

# Security settings
azd config set auth.useAzureCliCredential true     # Use Azure CLI for auth
azd config set tls.insecure false                  # Enforce TLS verification

# Performance tuning
azd config set provision.parallelism 5             # Parallel resource creation
azd config set deploy.timeout 30m                  # Deployment timeout
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
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Konfiguracja środowiska
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
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

### Szablony środowisk
Utwórz `.azure/env.template`, aby zapewnić spójne ustawienia środowiska:
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

## 🔐 Konfiguracja uwierzytelniania

### Integracja z Azure CLI
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### Uwierzytelnianie za pomocą Service Principal
Dla potoków CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Zarządzana tożsamość
Dla środowisk hostowanych w Azure:
```bash
# Enable managed identity authentication
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

## 🚀 Konfiguracja wdrożeniowa

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
# Set naming conventions
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

### Walidacja konfiguracji
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### Skrypty konfiguracji
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

# Validate azure.yaml syntax
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
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
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

## Kolejne kroki

- [Twój pierwszy projekt](first-project.md) - Zastosowanie konfiguracji w praktyce
- [Przewodnik wdrożeniowy](../deployment/deployment-guide.md) - Wykorzystanie konfiguracji do wdrożenia
- [Tworzenie zasobów](../deployment/provisioning.md) - Konfiguracje gotowe do produkcji

## Źródła

- [Referencja konfiguracji azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schemat azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Zmienne środowiskowe](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 3 - Konfiguracja i uwierzytelnianie
- **⬅️ Poprzedni**: [Twój pierwszy projekt](first-project.md)
- **➡️ Następny rozdział**: [Rozdział 4: Infrastruktura jako kod](../deployment/deployment-guide.md)
- **Następna lekcja**: [Twój pierwszy projekt](first-project.md)

---

**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, należy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego języku źródłowym powinien być uznawany za autorytatywne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.