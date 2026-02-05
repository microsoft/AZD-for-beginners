# Посібник з налаштування

**Навігація по розділу:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 3 - Налаштування та автентифікація
- **⬅️ Попередній**: [Ваш перший проєкт](first-project.md)
- **➡️ Наступний**: [Посібник з розгортання](../deployment/deployment-guide.md)
- **🚀 Наступний розділ**: [Розділ 4: Інфраструктура як код](../deployment/deployment-guide.md)

## Вступ

Цей детальний посібник охоплює всі аспекти налаштування Azure Developer CLI для оптимальних робочих процесів розробки та розгортання. Ви дізнаєтеся про ієрархію налаштувань, управління середовищами, методи автентифікації та розширені шаблони налаштувань, які забезпечують ефективне та безпечне розгортання в Azure.

## Цілі навчання

До кінця цього уроку ви:
- Опануєте ієрархію налаштувань azd і зрозумієте, як пріоритизуються параметри
- Ефективно налаштуєте глобальні та проєктні параметри
- Керуватимете кількома середовищами з різними конфігураціями
- Реалізуєте безпечні шаблони автентифікації та авторизації
- Зрозумієте розширені шаблони налаштувань для складних сценаріїв

## Результати навчання

Після завершення цього уроку ви зможете:
- Налаштувати azd для оптимальних робочих процесів розробки
- Налаштувати та керувати кількома середовищами розгортання
- Реалізувати безпечні практики управління конфігурацією
- Вирішувати проблеми, пов'язані з налаштуванням
- Налаштовувати поведінку azd відповідно до специфічних вимог організації

Цей детальний посібник охоплює всі аспекти налаштування Azure Developer CLI для оптимальних робочих процесів розробки та розгортання.

## Ієрархія налаштувань

azd використовує ієрархічну систему налаштувань:
1. **Прапорці командного рядка** (найвищий пріоритет)
2. **Змінні середовища**
3. **Локальна конфігурація проєкту** (`.azd/config.json`)
4. **Глобальна конфігурація користувача** (`~/.azd/config.json`)
5. **Значення за замовчуванням** (найнижчий пріоритет)

## Глобальна конфігурація

### Встановлення глобальних значень за замовчуванням
```bash
# Встановити підписку за замовчуванням
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Встановити місцезнаходження за замовчуванням
azd config set defaults.location "eastus2"

# Встановити стандартну схему іменування груп ресурсів
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Переглянути всі глобальні налаштування
azd config list

# Видалити налаштування
azd config unset defaults.location
```

### Загальні глобальні налаштування
```bash
# Налаштування розробки
azd config set alpha.enable true                    # Увімкнути альфа-функції
azd config set telemetry.enabled false             # Вимкнути телеметрію
azd config set output.format json                  # Встановити формат виводу

# Налаштування безпеки
azd config set auth.useAzureCliCredential true     # Використовувати Azure CLI для автентифікації
azd config set tls.insecure false                  # Забезпечити перевірку TLS

# Налаштування продуктивності
azd config set provision.parallelism 5             # Паралельне створення ресурсів
azd config set deploy.timeout 30m                  # Тайм-аут розгортання
```

## 🏗️ Конфігурація проєкту

### Структура azure.yaml
Файл `azure.yaml` є основою вашого проєкту azd:

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

### Опції конфігурації сервісу

#### Типи хостів
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

#### Налаштування для конкретних мов
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

## 🌟 Управління середовищами

### Створення середовищ
```bash
# Створити нове середовище
azd env new development

# Створити з конкретним розташуванням
azd env new staging --location "westus2"

# Створити з шаблону
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфігурація середовища
Кожне середовище має власну конфігурацію в `.azure/<env-name>/config.json`:

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

### Змінні середовища
```bash
# Встановити змінні, специфічні для середовища
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Переглянути змінні середовища
azd env get-values

# Очікуваний результат:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Видалити змінну середовища
azd env unset DEBUG

# Перевірити видалення
azd env get-values | grep DEBUG
# (має нічого не повернути)
```

### Шаблони середовищ
Створіть `.azure/env.template` для узгодженого налаштування середовищ:
```bash
# Необхідні змінні
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Налаштування додатка
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Додаткові налаштування для розробки
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Конфігурація автентифікації

### Інтеграція з Azure CLI
```bash
# Використовуйте облікові дані Azure CLI (за замовчуванням)
azd config set auth.useAzureCliCredential true

# Увійдіть із конкретним орендодавцем
az login --tenant <tenant-id>

# Встановіть підписку за замовчуванням
az account set --subscription <subscription-id>
```

### Автентифікація через Service Principal
Для CI/CD конвеєрів:
```bash
# Встановіть змінні середовища
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Або налаштуйте безпосередньо
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Керована ідентичність
Для середовищ, розміщених в Azure:
```bash
# Увімкнути автентифікацію керованої ідентичності
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Конфігурація інфраструктури

### Параметри Bicep
Налаштуйте параметри інфраструктури у `infra/main.parameters.json`:
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

### Конфігурація Terraform
Для проєктів Terraform налаштуйте у `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Конфігурація розгортання

### Конфігурація збірки
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

### Конфігурація Docker
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
Приклад `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Розширена конфігурація

### Індивідуальні імена ресурсів
```bash
# Встановити правила іменування
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Конфігурація мережі
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Конфігурація моніторингу
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

## 🎯 Конфігурації для конкретних середовищ

### Середовище розробки
```bash
# .azure/розробка/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Середовище тестування
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Продуктивне середовище
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Перевірка конфігурації

### Перевірка конфігурації
```bash
# Перевірте синтаксис конфігурації
azd config validate

# Тестуйте змінні середовища
azd env get-values

# Перевірте інфраструктуру
azd provision --dry-run
```

### Скрипти конфігурації
Створіть скрипти перевірки у `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Перевірте необхідні змінні середовища
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Перевірте синтаксис azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Найкращі практики

### 1. Використовуйте змінні середовища
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Організуйте файли конфігурації
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

### 3. Розгляньте контроль версій
```bash
# .gitignore
.azure/*/config.json         # Конфігурації середовища (містять ідентифікатори ресурсів)
.azure/*/.env               # Змінні середовища (можуть містити секрети)
.env                        # Локальний файл середовища
```

### 4. Документуйте конфігурацію
Документуйте вашу конфігурацію у `CONFIG.md`:
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

## 🎯 Практичні вправи

### Вправа 1: Конфігурація кількох середовищ (15 хвилин)

**Мета**: Створити та налаштувати три середовища з різними параметрами

```bash
# Створити середовище розробки
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Створити середовище тестування
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Створити середовище виробництва
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Перевірити кожне середовище
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Критерії успіху:**
- [ ] Три середовища створені успішно
- [ ] Кожне середовище має унікальну конфігурацію
- [ ] Можна перемикатися між середовищами без помилок
- [ ] `azd env list` показує всі три середовища

### Вправа 2: Управління секретами (10 хвилин)

**Мета**: Практикувати безпечну конфігурацію з чутливими даними

```bash
# Встановити секрети (не відображаються у виводі)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Встановити конфігурацію без секретів
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Переглянути середовище (секрети повинні бути приховані)
azd env get-values

# Перевірити, чи секрети збережені
azd env get DB_PASSWORD  # Повинен показувати фактичне значення
```

**Критерії успіху:**
- [ ] Секрети збережені без відображення в терміналі
- [ ] `azd env get-values` показує приховані секрети
- [ ] Індивідуальна команда `azd env get <SECRET_NAME>` отримує фактичне значення

## Наступні кроки

- [Ваш перший проєкт](first-project.md) - Застосуйте конфігурацію на практиці
- [Посібник з розгортання](../deployment/deployment-guide.md) - Використовуйте конфігурацію для розгортання
- [Підготовка ресурсів](../deployment/provisioning.md) - Конфігурації для продуктивного середовища

## Посилання

- [Довідник з конфігурації azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Змінні середовища](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навігація по розділу:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 3 - Налаштування та автентифікація
- **⬅️ Попередній**: [Ваш перший проєкт](first-project.md)
- **➡️ Наступний розділ**: [Розділ 4: Інфраструктура як код](../deployment/deployment-guide.md)
- **Наступний урок**: [Ваш перший проєкт](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->