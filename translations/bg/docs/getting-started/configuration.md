<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "71971408c9d2c3ed2357433ec9bc72b5",
  "translation_date": "2025-09-10T06:08:49+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "bg"
}
-->
# Ръководство за конфигурация

## Въведение

Това изчерпателно ръководство обхваща всички аспекти на конфигурирането на Azure Developer CLI за оптимални работни процеси при разработка и внедряване. Ще научите за йерархията на конфигурацията, управлението на среди, методите за удостоверяване и усъвършенствани модели за конфигурация, които позволяват ефективни и сигурни внедрения в Azure.

## Цели на обучението

До края на този урок ще:
- Овладеете йерархията на конфигурацията на azd и ще разберете как се приоритизират настройките
- Конфигурирате глобални и специфични за проект настройки ефективно
- Управлявате множество среди с различни конфигурации
- Прилагате сигурни модели за удостоверяване и авторизация
- Разберете усъвършенствани модели за конфигурация за сложни сценарии

## Резултати от обучението

След завършване на този урок ще можете:
- Да конфигурирате azd за оптимални работни процеси при разработка
- Да настроите и управлявате множество среди за внедряване
- Да прилагате сигурни практики за управление на конфигурацията
- Да отстранявате проблеми, свързани с конфигурацията
- Да персонализирате поведението на azd според специфичните изисквания на организацията

Това изчерпателно ръководство обхваща всички аспекти на конфигурирането на Azure Developer CLI за оптимални работни процеси при разработка и внедряване.

## Йерархия на конфигурацията

azd използва йерархична система за конфигурация:
1. **Флагове на командния ред** (най-висок приоритет)
2. **Променливи на средата**
3. **Локална конфигурация на проекта** (`.azd/config.json`)
4. **Глобална конфигурация на потребителя** (`~/.azd/config.json`)
5. **Стойности по подразбиране** (най-нисък приоритет)

## Глобална конфигурация

### Настройка на глобални стойности по подразбиране
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

### Често срещани глобални настройки
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

## 🏗️ Конфигурация на проекта

### Структура на azure.yaml
Файлът `azure.yaml` е сърцето на вашия azd проект:

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

### Опции за конфигурация на услугите

#### Типове хостове
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

#### Настройки, специфични за езика
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

## 🌟 Управление на среди

### Създаване на среди
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфигурация на среда
Всяка среда има собствена конфигурация в `.azure/<env-name>/config.json`:

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

### Променливи на средата
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

### Шаблони на среда
Създайте `.azure/env.template` за последователна настройка на средата:
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

## 🔐 Конфигурация на удостоверяване

### Интеграция с Azure CLI
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### Удостоверяване чрез Service Principal
За CI/CD процеси:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Управлявана идентичност
За среди, хоствани в Azure:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Конфигурация на инфраструктурата

### Параметри на Bicep
Конфигурирайте параметрите на инфраструктурата в `infra/main.parameters.json`:
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

### Конфигурация на Terraform
За проекти с Terraform, конфигурирайте в `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Конфигурация на внедряване

### Конфигурация на изграждане
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

### Конфигурация на Docker
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

## 🔧 Усъвършенствана конфигурация

### Персонализирано именуване на ресурси
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Конфигурация на мрежата
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Конфигурация на мониторинга
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

## 🎯 Конфигурации, специфични за средата

### Среда за разработка
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Среда за тестване
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Производствена среда
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Валидиране на конфигурацията

### Валидиране на конфигурацията
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### Скриптове за конфигурация
Създайте скриптове за валидиране в `scripts/`:

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

## 🎓 Най-добри практики

### 1. Използвайте променливи на средата
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Организирайте конфигурационните файлове
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

### 3. Съображения за контрол на версиите
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Документация на конфигурацията
Документирайте конфигурацията си в `CONFIG.md`:
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

## Следващи стъпки

- [Вашият първи проект](first-project.md) - Приложете конфигурацията на практика
- [Ръководство за внедряване](../deployment/deployment-guide.md) - Използвайте конфигурацията за внедряване
- [Осигуряване на ресурси](../deployment/provisioning.md) - Конфигурации, готови за производство

## Референции

- [Референция за конфигурация на azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема на azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Променливи на средата](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навигация**
- **Предишен урок**: [Инсталация и настройка](installation.md)
- **Следващ урок**: [Вашият първи проект](first-project.md)

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.