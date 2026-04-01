# Посібник з налаштування

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD Для Початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 3 - Налаштування та автентифікація
- **⬅️ Попередній**: [Ваш перший проєкт](first-project.md)
- **➡️ Наступний**: [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Наступний розділ**: [Розділ 4: Інфраструктура як Код](../chapter-04-infrastructure/deployment-guide.md)

## Вступ

Цей всебічний посібник охоплює всі аспекти налаштування Azure Developer CLI для оптимальних робочих процесів розробки та розгортання. Ви дізнаєтесь про ієрархію налаштувань, керування середовищами, методи автентифікації та розширені патерни конфігурації, що дозволяють ефективно і безпечно розгортати Azure.

## Цілі навчання

До кінця цього уроку ви:
- Оволодієте ієрархією конфігурації azd і зрозумієте, як налаштування пріоритетизуються
- Ефективно налаштуєте глобальні та специфічні для проєкту параметри
- Керуєте кількома середовищами з різними конфігураціями
- Впровадите безпечні патерни автентифікації та авторизації
- Зрозумієте розширені патерни конфігурації для складних сценаріїв

## Результати навчання

Після завершення уроку ви зможете:
- Налаштовувати azd для оптимальних робочих процесів розробки
- Налаштувати та керувати кількома середовищами розгортання
- Впроваджувати безпечні практики управління конфігурацією
- Вирішувати проблеми, пов’язані з конфігурацією
- Налаштовувати поведінку azd для конкретних вимог організації

Цей всебічний посібник охоплює всі аспекти налаштування Azure Developer CLI для оптимальних робочих процесів розробки та розгортання.

## Розуміння AI-агентів у проєкті azd

Якщо ви новачок у сфері AI-агентів, ось просте пояснення, як вони працюють у світі azd.

### Що таке агент?

Агент — це програмне забезпечення, яке може отримувати запити, аналізувати їх і виконувати дії — часто викликаючи AI-модель, шукаючи дані або звертаючись до інших сервісів. У проєкті azd агент — це просто ще один **сервіс** поряд із вашим веб-фронтендом або бекендом API.

### Як агенти вписуються у структуру проєкту azd

Проєкт azd складається з трьох шарів: **інфраструктура**, **код** та **конфігурація**. Агенти інтегруються в ці шари так само, як і будь-який інший сервіс:

| Шар | Що він робить для традиційного додатку | Що він робить для агента |
|-------|-------------------------------------|---------------------------|
| **Інфраструктура** (`infra/`) | Забезпечує вебдодаток і базу даних | Забезпечує endpoint моделей Microsoft Foundry, пошуковий індекс або хост агента |
| **Код** (`src/`) | Містить вихідний код фронтенду та API | Містить логіку агента та визначення запитів |
| **Конфігурація** (`azure.yaml`) | Перелічує ваші сервіси та цілі хостингу | Перелічує вашого агента як сервіс із вказівкою коду та середовища розміщення |

### Роль `azure.yaml`

Не потрібно зараз запам’ятовувати синтаксис. Концептуально, `azure.yaml` — це файл, де ви кажете azd: *"Ось сервіси, які складають мою програму, і ось де їх код."*

Коли ваш проєкт включає AI-агента, `azure.yaml` просто перераховує цього агента як один із сервісів. Azd знає, що потрібно забезпечити відповідну інфраструктуру (наприклад, endpoint моделей Microsoft Foundry або Container App для хостингу агента) і розгорнути код агента — так само, як це було б для вебдодатку чи API.

Це означає, що вивчати щось принципово нове не потрібно. Якщо ви розумієте, як azd керує вебсервісом, ви вже розумієте, як він керує агентом.

## Ієрархія налаштувань

azd використовує ієрархічну систему налаштувань:
1. **Прапорці командного рядка** (найвищий пріоритет)
2. **Змінні оточення**
3. **Локальна конфігурація проєкту** (`.azd/config.json`)
4. **Глобальна конфігурація користувача** (`~/.azd/config.json`)
5. **Значення за замовчуванням** (найнижчий пріоритет)

## Глобальні налаштування

### Встановлення глобальних значень за замовчуванням
```bash
# Встановити підписку за замовчуванням
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Встановити розташування за замовчуванням
azd config set defaults.location "eastus2"

# Встановити стандартну конвенцію іменування груп ресурсів
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Переглянути всі глобальні налаштування
azd config show

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
azd config set tls.insecure false                  # Примусова перевірка TLS

# Налаштування продуктивності
azd config set provision.parallelism 5             # Паралельне створення ресурсів
azd config set deploy.timeout 30m                  # Тайм-аут розгортання
```

## 🏗️ Конфігурація проєкту

### Структура azure.yaml
Файл `azure.yaml` — це серце вашого проєкту azd:

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

### Опції налаштування сервісу

#### Типи хостингу
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

#### Налаштування для конкретної мови програмування
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

## 🌟 Керування середовищами

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
Кожне середовище має власну конфігурацію у `.azure/<назва-середовища>/config.json`:

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
# Встановити змінні, специфічні для оточення
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Переглянути змінні оточення
azd env get-values

# Очікуваний результат:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=секретний-ключ-api
# DEBUG=true

# Видалити змінну оточення
azd env unset DEBUG

# Перевірити видалення
azd env get-values | grep DEBUG
# (повинно нічого не повертати)
```

### Шаблони середовищ
Створіть `.azure/env.template` для узгодженого налаштування середовищ:
```bash
# Необхідні змінні
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Налаштування додатку
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

# Увійти з конкретним орендарем
az login --tenant <tenant-id>

# Встановити підписку за замовчуванням
az account set --subscription <subscription-id>
```

### Автентифікація через службовий обліковий запис
Для CI/CD конвеєрів:
```bash
# Встановити змінні середовища
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Або налаштувати безпосередньо
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Керована ідентичність
Для середовищ, розміщених в Azure:
```bash
# Увімкнути автентифікацію з використанням керованої ідентичності
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Конфігурація інфраструктури

### Параметри Bicep
Налаштуйте параметри інфраструктури в `infra/main.parameters.json`:
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
Для проєктів Terraform налаштуйте в `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Конфігурація розгортання

### Налаштування збірки
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

### Налаштування Docker
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
Приклад файлу `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Розширене налаштування

### Користувацьке іменування ресурсів
```bash
# Встановити конвенції найменування
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Налаштування мережі
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Налаштування моніторингу
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

## 🎯 Налаштування для конкретних середовищ

### Середовище розробки
```bash
# .azure/development/.env
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
# Перевірка синтаксису конфігурації
azd config validate

# Тестування змінних середовища
azd env get-values

# Перевірка інфраструктури
azd provision --dry-run
```

### Скрипти для конфігурації
Створіть скрипти перевірки у `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Перевірка обов’язкових змінних середовища
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Перевірити синтаксис azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Кращі практики

### 1. Використання змінних середовища
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Організація файлів конфігурації
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

### 3. Особливості контролю версій
```bash
# .gitignore
.azure/*/config.json         # Конфігурації середовища (містять ідентифікатори ресурсів)
.azure/*/.env               # Змінні середовища (можуть містити секрети)
.env                        # Локальний файл середовища
```

### 4. Документування конфігурації
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

### Вправа 1: Конфігурація з багатьма середовищами (15 хвилин)

**Мета**: Створити та налаштувати три середовища з різними параметрами

```bash
# Створити середовище розробки
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Створити тестове середовище
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Створити продуктивне середовище
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
- [ ] Створено три середовища успішно
- [ ] Кожне середовище має унікальну конфігурацію
- [ ] Можна переключатися між середовищами без помилок
- [ ] Команда `azd env list` показує всі три середовища

### Вправа 2: Управління секретами (10 хвилин)

**Мета**: Практика безпечного налаштування конфігурації з конфіденційними даними

```bash
# Встановити секрети (не відображаються у виводі)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Встановити неконфіденційну конфігурацію
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Переглянути середовище (секрети повинні бути приховані)
azd env get-values

# Перевірити, що секрети збережені
azd env get DB_PASSWORD  # Має показувати реальне значення
```

**Критерії успіху:**
- [ ] Секрети зберігаються без відображення у терміналі
- [ ] Команда `azd env get-values` показує засекречені значення
- [ ] Окремо `azd env get <SECRET_NAME>` повертає фактичне значення

## Наступні кроки

- [Ваш перший проєкт](first-project.md) - Застосування конфігурації на практиці
- [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) - Використання конфігурації для розгортання
- [Розгортання ресурсів](../chapter-04-infrastructure/provisioning.md) - Конфігурації, готові до продуктивного використання

## Посилання

- [Документація конфігурації azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Змінні середовища](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD Для Початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 3 - Налаштування та автентифікація
- **⬅️ Попередній**: [Ваш перший проєкт](first-project.md)
- **➡️ Наступний розділ**: [Розділ 4: Інфраструктура як Код](../chapter-04-infrastructure/deployment-guide.md)
- **Наступний урок**: [Ваш перший проєкт](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для важливої інформації рекомендується звертатися до професійного перекладача. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->