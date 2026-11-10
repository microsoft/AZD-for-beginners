# Ръководство за конфигурация

**Навигация в глави:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 3 - Конфигурация и автентикация
- **⬅️ Предишна**: [Вашият първи проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща**: [Ръководство за разгръщане](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Следваща глава**: [Глава 4: Инфраструктура като код](../chapter-04-infrastructure/deployment-guide.md)

## Въведение

> Прегледано спрямо `azd 1.37.2` (ноември 2026). Bash командите предполагат иницииран azd проект. Освен ако не е изрично описано като цял файл, YAML/Bicep фрагментите са фрагменти за сливане с отговарящи проектни файлове, а не самостоятелно изпълними проекти.

Това изчерпателно ръководство обхваща всички аспекти на конфигурирането на Azure Developer CLI за оптимални работни потоци при разработка и разгръщане. Ще научите за йерархията на конфигурацията, управлението на среди, методите за автентикация и напредналите конфигурационни модели, които позволяват ефективни и сигурни разгръщания в Azure.

## Цели на обучението

Към края на този урок вие ще:
- Усвоите йерархията на конфигурацията на azd и разберете как се приоритизират настройките
- Ефективно конфигурирате глобални и проектно специфични настройки
- Управлявате множество среди с различни конфигурации
- Прилагате сигурни модели за автентикация и авторизация
- Разбирате напреднали конфигурационни модели за сложни сценарии

## Резултати от обучението

След завършване на урока, ще можете да:
- Конфигурирате azd за оптимални работни потоци при разработка
- Настроите и управлявате множество среди за разгръщане
- Прилагате сигурни практики за управление на конфигурацията
- Отстранявате проблеми, свързани с конфигурацията
- Персонализирате поведението на azd за специфични организационни изисквания

Това изчерпателно ръководство обхваща всички аспекти на конфигурирането на Azure Developer CLI за оптимални работни потоци при разработка и разгръщане.

## Разбиране на AI агенти в azd проект

Ако сте нови в AI агентите, ето един прост начин да ги разберете в света на azd.

### Какво е агент?

Агентът е софтуерен компонент, който може да получава заявки, да ги анализира и да предприема действия — често чрез извикване на AI модел, търсене на данни или използване на други услуги. В azd проект агентът е просто още една **услуга** заедно с вашия уеб фронтенд или API бекенд.

### Как агентите се вписват в структурата на azd проект

azd проектът се състои от три слоя: **инфраструктура**, **код** и **конфигурация**. Агентите се включват в тези слоеве както всяка друга услуга:

| Слой | Какво прави за традиционно приложение | Какво прави за агент |
|-------|-------------------------------------|---------------------------|
| **Инфраструктура** (`infra/`) | Осигурява уеб приложение и база данни | Осигурява крайна точка за AI модел, индекс за търсене или хост за агент |
| **Код** (`src/`) | Съдържа вашия фронтенд и API изходен код | Съдържа логиката на агента и дефинициите за подканите |
| **Конфигурация** (`azure.yaml`) | Изброява вашите услуги и техните хостинг цели | Изброява вашия агент като услуга, сочейки към неговия код и хост |

### Ролята на `azure.yaml`

Не е нужно да запомняте синтаксиса сега. Концептуално, `azure.yaml` е файлът, в който казвате на azd: *"Тук са услугите, които съставят приложението ми, и ето къде да намерите техния код."*

Когато проектът ви включва AI агент, `azure.yaml` просто изброява този агент като една от услугите. След това azd знае да осигури правилната инфраструктура (като Microsoft Foundry Models крайна точка или контейнерно приложение за хостване на агента) и да разположи кода на агента — както би направил за уеб приложение или API.

Това означава, че няма фундаментално ново нещо за учене. Ако разбирате как azd управлява уеб услуга, вече разбирате как управлява агент.

## Йерархия на конфигурацията

azd има различни конфигурационни повърхности, не един универсален слой:
- **Глобални потребителски предпочитания**: `~/.azd/config.json`, управлявани от `azd config`.
- **Определение на проекта**: `azure.yaml` специфицира услуги, инфраструктура и куки.
- **Избор на локална среда**: `.azure/config.json`.
- **Стойности за всяка среда**: `.azure/<name>/.env`, управлявани от `azd env`; допълнителни настройки са в `config.json` на тази среда.
- **Флагове и променливи на процеса**: препокриват само настройките, поддържани от конкретната команда/доставчик.

Произволна стойност от `azd env set` не се превръща автоматично в параметър на инфраструктура или настройка на разположено приложение. Изрично я реферирайте в параметър файл, поддържана конфигурация на услуга или кука.

## Глобална конфигурация

### Задаване на глобални настройки по подразбиране
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

### Общи глобални настройки
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

## 🏗️ Конфигурация на проекта

### Структура на azure.yaml
Файлът `azure.yaml` е сърцето на вашия azd проект:

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

Това е **пример за дефиниция на проект**, а не доставен стартов пакет. Създайте препратените изходни директории, кукови скриптове, скриптове за пакети и съответни `infra/main.bicep`/`main.parameters.json` преди да го стартирате. Базите данни са част от инфраструктурата; `postgres` не е вградена хост услуга. Параметрите на инфраструктурата се вмъкват в параметричния файл на доставчика, а не в `infra.parameters`.

### Опции за конфигуриране на услуги

#### Типове хост
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

#### Езиково-специфични кукове за изграждане

Следните фрагменти на услуги илюстрират кукове; слейте ги с истинските `project` и `host` на всяка услуга. `buildCommand` и `startCommand` не са общи свойства на azd услуги. Конфигурирайте стартирането в приложението, Dockerfile или инфраструктурата на хоста.

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

### Конфигурация на средата
Основните стойности на средата се намират в `.azure/<env-name>/.env`, включително `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` и `AZURE_LOCATION`. Използвайте `azd env config get/set` за допълнителни JSON настройки на средата. Следният JSON е **концептуално състояние на приложението**, а не azd конфигурационна схема; не го копирайте в файловете на azd:

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

**Само демонстрация на обикновен текст.** Обикновените стойности на `azd env set` се записват в `.azure/<name>/.env` и могат да бъдат изведени от четящи команди. Не използвайте примерния API ключ като реален ключ. За тайни използвайте `azd env set-secret` и изрично свързване по време на изпълнение.

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

### Шаблони на среди
Създайте **несекретен, ръчно поддържан** `.env.example` в кореновата директория на проекта за последователна настройка. azd не зарежда автоматично файл на име `env.template`:
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

### Споделяне на среди в екип

Когато повече от един човек работи по проект, трябва да се споразумеете кое **се пътува с репото и кое остава локално**. azd държи всяка среда под папка `.azure/`, и не всичко от нея трябва да се комитва.

**Какво има в `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Какво да игнорирате в git.** По подразбиране `.gitignore` на azd вече изключва `.azure/`. Запазете това така—файловете в `.env` могат да съдържат тайни, а ресурсните ID-та са специфични за този, който ги е осигурил. Всеки член на екипа създава **собствената си** среда локално:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Превключване между среди.** Разработчик, управляващ няколко среди, избира активната преди да изпълни команди:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Осигуряване на нескретни настройки по подразбиране за екипа.** Комитвайте `.env.example` извън игнорирания `.azure/` директория. Нови членове копират файла локално, попълват стойности и изрично го импортират с `azd env set --file <local-file>`. Никога не импортирайте празни шаблони над работеща среда.

**Средите в CI/CD.** Пайплайни не четат вашата локална папка `.azure/`. Вместо това осигурете стойности на средата като променливи/тайни в пайплайна, и azd ги чете от средата на процеса:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Общо правило:** инфраструктурният код (`infra/`, `azure.yaml`) се споделя в Git; *състоянието на средата и тайните* (`.azure/`) са за всеки разработчик и всяка пайплайн поотделно. `azd pipeline config` автоматично конфигурира променливите на пайплайна за вас.

## 🔐 Конфигурация на удостоверяването

### Интеграция с Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Удостоверяване чрез Service Principal
За CI/CD пайплайни:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Управлявана идентичност
За хоствана в Azure среда:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
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
За проекти с Terraform, azd замества плейсхолдърите в `infra/main.tfvars.json`. Тези имена трябва да съвпадат с обявените входни променливи на Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Конфигурация на разгръщането

### Конфигурация на изграждането
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

### Docker Конфигурация
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
Пътищата са относителни спрямо проекта на услугата. Dockerfile трябва да декларира всякакви стойности `ARG`, които използва. За многостепенна конструкция, сложете етапа за разгръщане последен или използвайте персонализиран работен поток за опаковане; `docker.target` не е поддържано свойство в разглежданата схема.

## 🔧 Разширена конфигурация

### Персонализирано наименование на ресурси
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Дефинирайте реални имена на ресурси в Bicep/Terraform и поддържайте създаването на resource-group съвместимо с тази настройка. Няма универсални конфигурационни ключове `naming.storageAccount` или `naming.keyVault`.

### Мрежова конфигурация
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Обединете тези **илюстративни параметърни записи** в `infra/main.parameters.json` под `parameters` и декларирайте и използвайте съответстващите параметри в Bicep. Самите по себе си те не правят нищо.

### Конфигурация на мониторинг
Осигурете Application Insights и Log Analytics в Bicep/Terraform и конфигурирайте приложната телеметрия в своя SDK. Няма общ блок `monitoring` от най-горно ниво в `azure.yaml`, който създава тези ресурси. Вижте [инфраструктура за наблюдение](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Конфигурации, специфични за средата

### Развойна среда
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Предварителна среда (Staging)
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

## 🔍 Валидация на конфигурацията

### Провери конфигурацията
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Скриптове за конфигурация
Създайте скриптове за валидация в `scripts/`:

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

## 🎓 Най-добри практики

### 1. Използвайте променливи на средата
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Избягвайте твърдото кодиране на чувствителни стойности (отделна илюстративна конфигурация, а не втори `database` ключ в същия файл):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Организиране на конфигурационни файлове
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

### 3. Съображения за контрол на версиите
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Документация на конфигурацията
Документирайте своята конфигурация в `CONFIG.md`:
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

## 🎯 Практически упражнения

### Упражнение 1: Конфигурация за множество среди (15 минути)

**Цел**: Създайте и конфигурирайте три локални среди с различни стойности. Започнете в инициализиран проект; използвайте неизползвани имена, ако тези вече съществуват. Тези стойности, специфични за приложението, не променят настройките за телеметрия/време на изпълнение, докато вашият шаблон не ги използва.

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

**Критерии за успех:**
- [ ] Успешно са създадени три среди
- [ ] Всяка среда има уникална конфигурация
- [ ] Може да се превключва между среди без грешки
- [ ] `azd env list` показва всички три среди

### Упражнение 2: Препратки към Key Vault тайни (10-20 минути)

**Цел**: Запазете препратка към Key Vault вместо плътен текст. **Начална точка:** инициализирана среда, влизане в Azure и достъп до Key Vault с права за създаване/четене на тестова тайна. Операциите с Key Vault могат да бъдат тарифирани.

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

**Критерии за успех:**
- [ ] Интерактивната команда отчита избрания хранилище и препратката към тайната
- [ ] Локалният `.env` съдържа препратка, а не тестовата тайна
- [ ] Може да обясни, че идентичността по време на изпълнение/RBAC и потреблението все още трябва да бъдат конфигурирани

**Чести проблеми:** 403 изисква правилната роля в данните на хранилището и време за разпространение; `azd env set ... --secret` не е валидна команда. Обичайният изход на `get-values`/`get-value` не трябва да се приема за редактиран. Премахнете тренировъчната препратка с `azd env unset TRAINING_API_KEY`; това не изтрива тайната в хранилището, която трябва да почистите отделно, ако сте я създали.

## Следващи стъпки

- [Първият ви проект](../chapter-01-foundation/first-project.md) - Приложете конфигурацията на практика
- [Ръководство за деплоймент](../chapter-04-infrastructure/deployment-guide.md) - Използване на конфигурацията за деплоймент
- [Осигуряване на ресурси](../chapter-04-infrastructure/provisioning.md) - Конфигурации готови за продукция

## Референции

- [azd Референция за конфигурация](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема на azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Променливи на средата](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Навигация в главата:**
- **📚 Начална страница на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 3 - Конфигурация и удостоверяване
- **⬅️ Предишна**: [Първият ви проект](../chapter-01-foundation/first-project.md)
- **➡️ Следваща глава**: [Глава 4: Инфраструктура като код](../chapter-04-infrastructure/deployment-guide.md)
- **Следващ урок**: [Удостоверяване и сигурност](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->