<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "71971408c9d2c3ed2357433ec9bc72b5",
  "translation_date": "2025-09-10T06:09:08+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "sr"
}
-->
# Водич за конфигурацију

## Увод

Овај свеобухватни водич покрива све аспекте конфигурисања Azure Developer CLI за оптималне токове развоја и примене. Научићете о хијерархији конфигурације, управљању окружењима, методама аутентификације и напредним обрасцима конфигурације који омогућавају ефикасне и безбедне Azure примене.

## Циљеви учења

До краја ове лекције, моћи ћете:
- Савладати хијерархију конфигурације azd и разумети како се поставке приоритизују
- Ефикасно конфигурисати глобалне и пројектно специфичне поставке
- Управљати више окружења са различитим конфигурацијама
- Применити безбедне обрасце аутентификације и ауторизације
- Разумети напредне обрасце конфигурације за сложене сценарије

## Резултати учења

Након завршетка ове лекције, моћи ћете:
- Конфигурисати azd за оптималне токове развоја
- Поставити и управљати више окружења за примену
- Применити безбедне праксе управљања конфигурацијом
- Решавати проблеме повезане са конфигурацијом
- Прилагодити понашање azd за специфичне организационе захтеве

Овај свеобухватни водич покрива све аспекте конфигурисања Azure Developer CLI за оптималне токове развоја и примене.

## Хијерархија конфигурације

azd користи хијерархијски систем конфигурације:
1. **Флагови командне линије** (највиши приоритет)
2. **Променљиве окружења**
3. **Локална конфигурација пројекта** (`.azd/config.json`)
4. **Глобална корисничка конфигурација** (`~/.azd/config.json`)
5. **Подразумеване вредности** (најнижи приоритет)

## Глобална конфигурација

### Постављање глобалних подразумеваних вредности
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

### Уобичајене глобалне поставке
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

## 🏗️ Конфигурација пројекта

### Структура azure.yaml
Фајл `azure.yaml` је срце вашег azd пројекта:

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

### Опције конфигурације сервиса

#### Типови хостова
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

#### Поставке специфичне за језик
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

## 🌟 Управљање окружењима

### Креирање окружења
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфигурација окружења
Сваки енвиронмент има своју конфигурацију у `.azure/<env-name>/config.json`:

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

### Променљиве окружења
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

### Шаблони окружења
Креирајте `.azure/env.template` за конзистентно подешавање окружења:
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

## 🔐 Конфигурација аутентификације

### Интеграција са Azure CLI
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### Аутентификација преко Service Principal
За CI/CD токове:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Управљани идентитет
За окружења хостована на Azure:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Конфигурација инфраструктуре

### Параметри Bicep-а
Конфигуришите параметре инфраструктуре у `infra/main.parameters.json`:
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

### Конфигурација Terraform-а
За Terraform пројекте, конфигуришите у `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Конфигурација примене

### Конфигурација изградње
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

### Конфигурација Docker-а
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

## 🔧 Напредна конфигурација

### Прилагођено именовање ресурса
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Конфигурација мреже
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Конфигурација мониторинга
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

## 🎯 Конфигурације специфичне за окружење

### Окружење за развој
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Окружење за тестирање
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Окружење за продукцију
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Валидација конфигурације

### Валидација конфигурације
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### Скрипте за конфигурацију
Креирајте скрипте за валидацију у `scripts/`:

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

## 🎓 Најбоље праксе

### 1. Користите променљиве окружења
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Организујте конфигурационе фајлове
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

### 3. Разматрања за контролу верзија
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Документација конфигурације
Документујте вашу конфигурацију у `CONFIG.md`:
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

## Следећи кораци

- [Ваш први пројекат](first-project.md) - Примените конфигурацију у пракси
- [Водич за примену](../deployment/deployment-guide.md) - Користите конфигурацију за примену
- [Обезбеђивање ресурса](../deployment/provisioning.md) - Конфигурације спремне за продукцију

## Референце

- [azd референца конфигурације](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml шема](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Променљиве окружења](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навигација**
- **Претходна лекција**: [Инсталација и подешавање](installation.md)
- **Следећа лекција**: [Ваш први пројекат](first-project.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.