# Посібник з налаштування

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 3 - Налаштування та автентифікація
- **⬅️ Попередній**: [Ваш перший проєкт](first-project.md)
- **➡️ Наступний**: [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Наступний розділ**: [Розділ 4: Інфраструктура як код](../chapter-04-infrastructure/deployment-guide.md)

## Вступ

Цей детальний посібник охоплює всі аспекти налаштування Azure Developer CLI для оптимізації робочих процесів розробки та розгортання. Ви дізнаєтесь про ієрархію налаштувань, управління середовищами, методи автентифікації та розвинуті схеми конфігурації, які забезпечують ефективне та безпечне розгортання в Azure.

## Цілі навчання

Після завершення цього уроку ви:
- Опануєте ієрархію налаштувань azd та зрозумієте, як пріоритетізуються параметри
- Ефективно налаштуєте глобальні та проєктні параметри
- Керуєте кількома середовищами з різними налаштуваннями
- Реалізуєте безпечні схеми автентифікації та авторизації
- Зрозумієте просунуті схеми конфігурації для складних сценаріїв

## Результати навчання

Після завершення уроку ви зможете:
- Налаштовувати azd для оптимальних робочих процесів розробки
- Створювати та керувати кількома середовищами розгортання
- Впроваджувати практики безпечного управління конфігураціями
- Вирішувати проблеми, пов’язані з конфігурацією
- Налаштовувати поведінку azd відповідно до конкретних вимог організації

Цей детальний посібник охоплює всі аспекти налаштування Azure Developer CLI для оптимальних робочих процесів розробки та розгортання.

## Розуміння AI-агентів у проєкті azd

Якщо ви новачок щодо AI-агентів, ось просте пояснення їх ролі у світі azd.

### Що таке агент?

Агент — це програмне забезпечення, яке може приймати запити, осмислювати їх та виконувати дії — часто звертаючись до AI-моделі, шукаючи дані або викликаючи інші служби. У проєкті azd агент — це ще одна **служба** поруч із вашим веб-фронтендом або бекендом API.

### Як агенти вписуються в структуру проєкту azd

Проєкт azd складається з трьох шарів: **інфраструктура**, **код** та **налаштування**. Агенти підключаються до цих шарів так само, як і будь-яка інша служба:

| Шар | Що він робить для традиційного додатка | Що робить для агента |
|-------|-----------------------------------------|------------------------|
| **Інфраструктура** (`infra/`) | Проводить розгортання вебдодатка та бази даних | Проводить розгортання кінцевої точки AI-моделі, індексу пошуку або хоста агента |
| **Код** (`src/`) | Містить ваш код фронтенда та API | Містить логіку агента та визначення підказок |
| **Налаштування** (`azure.yaml`) | Перелік ваших служб і їхніх хостинг-таргетів | Перелік агента як служби з посиланням на його код і хост |

### Роль файлу `azure.yaml`

Вам зараз не потрібно запам’ятовувати синтаксис. Концептуально, `azure.yaml` — це файл, у якому ви повідомляєте azd: *"Ось які служби складають мій додаток, і ось де знаходиться їхній код."*

Коли ваш проєкт містить AI-агента, `azure.yaml` просто перераховує його як одну зі служб. azd тоді знає, що треба розгорнути потрібну інфраструктуру (наприклад, кінцеву точку Microsoft Foundry Models або контейнерний додаток для хостингу агента) і деплоїти ваш код агента — так само, як це робить для вебдодатка чи API.

Це означає, що тут немає нічого принципово нового. Якщо ви розумієте, як azd керує вебслужбою, ви вже розумієте, як управляти агентом.

## Ієрархія налаштувань

azd використовує ієрархічну систему конфігурації:
1. **Параметри командного рядка** (найвищий пріоритет)
2. **Змінні середовища**
3. **Локальна конфігурація проєкту** (`.azd/config.json`)
4. **Глобальна конфігурація користувача** (`~/.azd/config.json`)
5. **Значення за замовчуванням** (найнижчий пріоритет)

## Глобальна конфігурація

### Встановлення глобальних значень за замовчуванням
```bash
# Встановити підписку за замовчуванням
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Встановити місце розташування за замовчуванням
azd config set defaults.location "eastus2"

# Встановити стандартну конвенцію іменування групи ресурсів
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Переглянути всю глобальну конфігурацію
azd config list

# Видалити конфігурацію
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
azd config set deploy.timeout 30m                  # Час очікування розгортання
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

### Параметри налаштування служби

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

#### Налаштування за мовою
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

# Створити з певним розташуванням
azd env new staging --location "westus2"

# Створити з шаблону
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфігурація середовища
Кожне середовище має власну конфігурацію у `.azure/<ім'я-середовища>/config.json`:

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

# Очікуваний вивід:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=секретний-ключ-api
# DEBUG=істина

# Видалити змінну середовища
azd env unset DEBUG

# Перевірити видалення
azd env get-values | grep DEBUG
# (повинно повернути порожнє значення)
```

### Шаблони середовищ
Створіть `.azure/env.template` для послідовного налаштування середовищ:
```bash
# Необхідні змінні
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Налаштування застосунку
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Додаткові налаштування розробки
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Налаштування автентифікації

### Інтеграція з Azure CLI
```bash
# Використовуйте облікові дані Azure CLI (за замовчуванням)
azd config set auth.useAzureCliCredential true

# Увійти з конкретним орендарем
az login --tenant <tenant-id>

# Встановити підписку за замовчуванням
az account set --subscription <subscription-id>
```

### Автентифікація за допомогою Service Principal
Для CI/CD конвеєрів:
```bash
# Встановити змінні оточення
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
# Увімкнути автентифікацію з керованою ідентичністю
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Налаштування інфраструктури

### Параметри Bicep
Налаштуйте інфраструктурні параметри у `infra/main.parameters.json`:
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
Для проєктів Terraform, налаштування у `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Налаштування розгортання

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
Приклад `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Розширені налаштування

### Індивідуальні імена ресурсів
```bash
# Встановити правила найменувань
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
# .azure/розробка/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Тестове середовище
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

### Перевірити конфігурацію
```bash
# Перевірити синтаксис конфігурації
azd config validate

# Тестувати змінні середовища
azd env get-values

# Перевірити інфраструктуру
azd provision --dry-run
```

### Скрипти перевірки
Створіть скрипти перевірки у папці `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Перевірка необхідних змінних оточення
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Перевірка синтаксису azure.yaml
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

### 3. Урахування контролю версій
```bash
# .gitignore
.azure/*/config.json         # Конфігурації оточення (містять ідентифікатори ресурсів)
.azure/*/.env               # Змінні оточення (можуть містити секрети)
.env                        # Локальний файл оточення
```

### 4. Документація конфігурації
Документуйте вашу конфігурацію в `CONFIG.md`:
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

### Вправа 1: Конфігурація для кількох середовищ (15 хвилин)

**Мета**: Створити і налаштувати три середовища з різними налаштуваннями

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

# Створити промислове середовище
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
- [ ] Можна переключатися між середовищами без помилок
- [ ] `azd env list` показує всі три середовища

### Вправа 2: Управління секретами (10 хвилин)

**Мета**: Попрактикуватися у безпечній конфігурації чутливих даних

```bash
# Встановити секрети (не відображаються у виводі)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Встановити неконфіденційну конфігурацію
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Переглянути оточення (секрети мають бути приховані)
azd env get-values

# Перевірити, що секрети збережені
azd env get DB_PASSWORD  # Має показувати фактичне значення
```

**Критерії успіху:**
- [ ] Секрети збережені без відображення у терміналі
- [ ] `azd env get-values` показує захищені секрети
- [ ] Окремий `azd env get <SECRET_NAME>` повертає фактичне значення

## Наступні кроки

- [Ваш перший проєкт](first-project.md) — практичне застосування конфігурації
- [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) — використання конфігурації для розгортання
- [Надання ресурсів](../chapter-04-infrastructure/provisioning.md) — конфігурації, готові до продуктивного використання

## Посилання

- [Довідник з налаштування azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Змінні середовища](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 3 - Налаштування та автентифікація
- **⬅️ Попередній**: [Ваш перший проєкт](first-project.md)
- **➡️ Наступний розділ**: [Розділ 4: Інфраструктура як код](../chapter-04-infrastructure/deployment-guide.md)
- **Наступний урок**: [Ваш перший проєкт](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ був перекладений за допомогою AI-сервісу перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний переклад людиною. Ми не несемо відповідальність за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->