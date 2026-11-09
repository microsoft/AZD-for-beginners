# Посібник з налаштування

**Навігація по розділах:**
- **📚 Головна курсів**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 3 - Налаштування та автентифікація
- **⬅️ Попередній**: [Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **➡️ Наступний**: [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Наступний розділ**: [Розділ 4: Інфраструктура як код](../chapter-04-infrastructure/deployment-guide.md)

## Вступ

> Перевірено за версією `azd 1.37.2` (листопад 2026). Команди Bash припускають ініціалізований проєкт azd. Якщо не описано як повний файл, фрагменти YAML/Bicep є частинами, які потрібно об’єднати з відповідними файлами проєкту, а не автономними проєктами для запуску.

Цей комплексний посібник охоплює всі аспекти налаштування Azure Developer CLI для оптимізації робочих процесів розробки та розгортання. Ви дізнаєтеся про ієрархію налаштувань, управління середовищами, методи автентифікації та складні патерни конфігурації, які забезпечують ефективне та безпечне розгортання в Azure.

## Цілі навчання

По завершенню цього уроку ви:
- Оволодієте ієрархією налаштувань azd і зрозумієте, як пріоритетно застосовуються параметри
- Ефективно налаштуєте глобальні та проєктно-специфічні параметри
- Керуєте кількома середовищами з різними конфігураціями
- Впровадите безпечні патерни автентифікації та авторизації
- Зрозумієте складні патерни налаштувань для комплексних сценаріїв

## Результати навчання

Після завершення цього уроку ви зможете:
- Налаштовувати azd для оптимальних робочих процесів розробки
- Налаштовувати та управляти кількома середовищами розгортання
- Впроваджувати безпечні практики управління конфігурацією
- Вирішувати проблеми, пов’язані з налаштуваннями
- Налаштовувати поведінку azd відповідно до специфічних організаційних вимог

Цей комплексний посібник охоплює всі аспекти налаштування Azure Developer CLI для оптимізації робочих процесів розробки та розгортання.

## Розуміння AI агентів у проєкті azd

Якщо ви новачок в AI агентах, ось простий спосіб уявити їх у світі azd.

### Що таке агент?

Агент — це програмне забезпечення, яке може отримати запит, проаналізувати його та вжити дій — часто звертаючись до AI-моделі, шукаючи дані або викликаючи інші сервіси. У проєкті azd агент — це просто ще один **сервіс** нарівні з вашим веб-фронтендом або бекендом API.

### Як агенти вписуються у структуру проєкту azd

Проєкт azd складається з трьох шарів: **інфраструктура**, **код** та **конфігурація**. Агенти підключаються до цих шарів так само, як і будь-який інший сервіс:

| Шар | Що він робить для традиційного застосунку | Що він робить для агента |
|-------|-------------------------------------|---------------------------|
| **Інфраструктура** (`infra/`) | Забезпечує веб-застосунок і базу даних | Забезпечує кінцеву точку AI-моделі, індекс пошуку або хост для агента |
| **Код** (`src/`) | Містить вихідний код фронтенда та API | Містить логіку агента та визначення підказок |
| **Конфігурація** (`azure.yaml`) | Перелічує ваші сервіси та їхні цільові хости | Перелічує вашого агента як сервіс, вказуючи на його код та хост |

### Роль `azure.yaml`

Вам не потрібно зараз запам’ятовувати синтаксис. Концептуально, `azure.yaml` — це файл, у якому ви повідомляєте azd: *«Ось сервіси, які складають мою програму, і ось де знайти їхній код.»*

Коли ваш проєкт включає агента AI, `azure.yaml` просто перелічує цього агента як один із сервісів. azd тоді знає, що потрібно забезпечити правильну інфраструктуру (наприклад, кінцеву точку Microsoft Foundry Models або Container App для хостингу агента) і розгорнути код вашого агента — так само, як це було б для вебдодатку або API.

Це означає, що немає нічого принципово нового для вивчення. Якщо ви розумієте, як azd керує вебсервісом, ви вже розумієте, як керувати агентом.

## Ієрархія конфігурації

azd має окремі конфігураційні поверхні, а не один універсальний шар:
- **Глобальні налаштування користувача**: `~/.azd/config.json`, керується `azd config`.
- **Визначення проєкту**: `azure.yaml` визначає сервіси, інфраструктуру та хуки.
- **Вибір локального середовища**: `.azure/config.json`.
- **Значення для конкретного середовища**: `.azure/<name>/.env`, керується `azd env`; додаткові налаштування містяться у `config.json` відповідного середовища.
- **Флаги та змінні процесу**: перекривають лише налаштування, підтримувані конкретною командою/провайдером.

Будь-яке довільне значення `azd env set` не автоматично стає параметром інфраструктури або налаштуванням розгорнутої програми. Явно посилайтеся на нього у файлі параметрів, підтримуваній конфігурації сервісу чи хуці.

## Глобальна конфігурація

### Встановлення глобальних значень за замовчуванням
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

### Загальні глобальні налаштування
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

## 🏗️ Конфігурація проєкту

### Структура azure.yaml
Файл `azure.yaml` є серцем вашого проєкту azd:

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

Це **приклад визначення проєкту**, а не постачаний стартовий шаблон. Створіть зазначені теки з кодом, скрипти хуків, скрипти пакетів і відповідні `infra/main.bicep`/`main.parameters.json` перед запуском. Бази даних слід розміщувати в інфраструктурі; `postgres` не є вбудованим хостом сервісу. Параметри інфраструктури поміщаються у файл параметрів провайдера, а не в `infra.parameters`.

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

#### Побудова з урахуванням мови програмування (build hooks)

Наведені фрагменти сервісів ілюструють хуки; об’єднайте їх із реальними `project` і `host` кожного сервісу. `buildCommand` і `startCommand` не є універсальними властивостями сервісу azd. Конфігуруйте запуск в програмі, Dockerfile або інфраструктурі хосту.

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

## 🌟 Керування середовищами

### Створення середовищ
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфігурація середовища
Основні значення середовища зберігаються у `.azure/<env-name>/.env`, включно з `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` і `AZURE_LOCATION`. Використовуйте `azd env config get/set` для додаткових JSON-налаштувань середовища. Наступний JSON є **концептуальним станом застосунку**, а не схемою конфігурації azd; не копіюйте його у файли azd:

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

**Тільки демонстрація у відкритому тексті.** Звичайні значення `azd env set` записуються у `.azure/<name>/.env` і можуть бути виведені командами читання. Не використовуйте приклад ключа API як справжній обліковий запис. Для секретів використовуйте `azd env set-secret` і явне підключення під час виконання.

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

### Шаблони середовищ
Створіть **несекретний, вручну підтримуваний** `.env.example` у корені проєкту для узгодженого налаштування. azd не завантажує автоматично файл з іменем `env.template`:
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

### Спільне використання середовищ у команді

Коли над проєктом працює кілька людей, потрібно узгодити, **що слід тримати в репозиторії, а що — локально**. azd зберігає кожне середовище в теці `.azure/`, і не все з неї має бути зафіксоване в репозиторії.

**Що містить `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Що ігнорувати у git.** Стандартний `.gitignore` azd вже виключає `.azure/`. Залишайте так — файли `.env` можуть містити секрети, а ідентифікатори ресурсів специфічні для того, хто їх створив. Кожен учасник команди створює **своє** локальне середовище:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Перемикання між середовищами.** Розробник, який керує кількома середовищами, обирає активне перед запуском команд:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Надання команді неспецифічних значень за замовчуванням.** Зафіксуйте `.env.example` поза теки, яку ігнорує `.azure/`. Нові учасники копіюють його до локального ігнорованого файлу, заповнюють значення і явно імпортують через `azd env set --file <local-file>`. Ніколи не імпортуйте порожні заповнювачі поверх робочого середовища.

**Середовища у CI/CD.** Конвеєри не читають вашу локальну теку `.azure/`. Натомість передавайте значення середовища як змінні/секрети конвеєра, і azd зчитає їх із середовища процесу:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Золоте правило:** код інфраструктури (`infra/`, `azure.yaml`) ділиться через Git; *стан середовища та секрети* (`.azure/`) належать окремо кожному розробнику і конвеєру. `azd pipeline config` автоматично налаштовує змінні конвеєра для вас.

## 🔐 Конфігурація автентифікації

### Інтеграція Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Автентифікація через сервісний обліковий запис (Service Principal)
Для CI/CD конвеєрів:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Керована ідентичність (Managed Identity)
Для Azure-середовищ:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
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
Для проєктів Terraform azd замінює заповнювачі у `infra/main.tfvars.json`. Ці імена мають збігатися із оголошеними вхідними змінними Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Конфігурація розгортання

### Конфігурація збірки
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

### Конфігурація Docker
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
Шляхи відносні до проєкту сервісу. Dockerfile має оголошувати будь-які значення `ARG`, які він споживає. Для багатоступеневої збірки розмістіть стадію розгортання останньою або використайте власний процес пакетування; `docker.target` не підтримується в розглянутій схемі.

## 🔧 Розширена конфігурація

### Користувацьке іменування ресурсів
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Визначайте фактичні імена ресурсів у Bicep/Terraform і підтримуйте створення груп ресурсів узгодженим із цим налаштуванням. Не існує загальних ключів конфігурації `naming.storageAccount` або `naming.keyVault`.

### Конфігурація мережі
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Об’єднайте ці **ілюстративні записи параметрів** у `infra/main.parameters.json` під `parameters` та оголосіть і використовуйте відповідні параметри в Bicep. Вони самі по собі нічого не роблять.

### Конфігурація моніторингу
Забезпечте виділення Application Insights і Log Analytics в Bicep/Terraform і налаштуйте телеметрію застосунку у вашому SDK. Загального верхнього блоку `monitoring` у `azure.yaml`, що створює ці ресурси, немає. Дивіться [моніторинг інфраструктури](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Налаштування для конкретних середовищ

### Середовище розробки
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Середовище передпродакшену (стейджинг)
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
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Скрипти перевірки
Створюйте скрипти перевірки в `scripts/`:

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

## 🎓 Найкращі практики

### 1. Використовуйте змінні середовища
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Уникайте жорсткого кодування конфіденційних значень (окреме ілюстративне налаштування, а не другий ключ `database` у тому самому файлі):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Організуйте файли конфігурації
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

### 3. Питання контролю версій
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Документування конфігурації
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

### Вправа 1: Конфігурація з кількома середовищами (15 хвилин)

**Мета**: Створити та налаштувати три локальних середовища з різними значеннями. Працюйте у ініціалізованому проєкті; використовуйте невикористані імена, якщо такі вже існують. Ці значення специфічні для застосунку та не змінюють налаштування телеметрії/виконання, поки ваш шаблон їх не споживає.

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

**Критерії успішності:**
- [ ] Успішно створено три середовища
- [ ] Кожне середовище має унікальну конфігурацію
- [ ] Можна переключатися між середовищами без помилок
- [ ] `azd env list` показує всі три середовища

### Вправа 2: Посилання на секрети Key Vault (10-20 хвилин)

**Мета**: Зберегти посилання на Key Vault замість відкритого тексту. **Початкові умови:** ініціалізоване середовище, вхід в Azure та доступ до Key Vault із дозволами на створення/читання тестового секрету. Операції з Vault можуть коштувати грошей.

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

**Критерії успішності:**
- [ ] Інтерактивна команда повідомляє обраний сховок (vault) і посилання на секрет
- [ ] Локальний `.env` містить посилання замість тестового секрету
- [ ] Здатність пояснити, що ідентичність під час виконання/RBAC і споживання треба ще налаштувати

**Поширені проблеми:** помилка 403 вимагає правильну роль на рівні дата-плоту сховка і час на розповсюдження; `azd env set ... --secret` не є дійсною командою. Звичайний вивід `get-values`/`get-value` не треба вважати прихованим. Видаліть навчальне посилання командами `azd env unset TRAINING_API_KEY`; це не видаляє секрет сховка, який ви маєте видалити окремо, якщо створювали.

## Наступні кроки

- [Ваш перший проєкт](../chapter-01-foundation/first-project.md) - Практичне застосування конфігурації
- [Посібник з розгортання](../chapter-04-infrastructure/deployment-guide.md) - Використання конфігурації для розгортання
- [Створення ресурсів](../chapter-04-infrastructure/provisioning.md) - Конфігурації, готові до продуктиву

## Посилання

- [Довідник з конфігурації azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Змінні середовища](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Навігація розділу:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 3 - Конфігурація та автентифікація
- **⬅️ Попередній**: [Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **➡️ Наступний розділ**: [Розділ 4: Інфраструктура як код](../chapter-04-infrastructure/deployment-guide.md)
- **Наступний урок**: [Автентифікація та безпека](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->