# Руководство по настройке

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 3 - Настройка и аутентификация
- **⬅️ Предыдущая**: [Ваш первый проект](../chapter-01-foundation/first-project.md)
- **➡️ Следующая**: [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Следующая глава**: [Глава 4: Инфраструктура как код](../chapter-04-infrastructure/deployment-guide.md)

## Введение

> Проверено на `azd 1.37.2` (ноябрь 2026). Bash-команды предполагают инициализированный проект azd. Если явно не указано, что это полный файл, фрагменты YAML/Bicep — это части для объединения с соответствующими файлами проекта, а не отдельные выполняемые проекты.

Это подробное руководство охватывает все аспекты настройки Azure Developer CLI для оптимизации рабочих процессов разработки и развертывания. Вы узнаете о иерархии настройки, управлении средами, методах аутентификации и передовых шаблонах конфигурации, которые обеспечивают эффективное и безопасное развертывание в Azure.

## Цели обучения

К концу урока вы:
- Овладеете иерархией настройки azd и поймёте, как приоритизируются настройки
- Эффективно настроите глобальные и проектно-специфичные параметры
- Управляете несколькими средами с разными конфигурациями
- Реализуете безопасные методы аутентификации и авторизации
- Поймёте передовые шаблоны настройки для сложных сценариев

## Результаты обучения

После завершения урока вы сможете:
- Настроить azd для оптимальных рабочих процессов разработки
- Настроить и управлять несколькими средами развертывания
- Реализовать безопасные практики управления конфигурацией
- Устранять проблемы, связанные с настройками
- Настраивать поведение azd под конкретные организационные требования

Это подробное руководство охватывает все аспекты настройки Azure Developer CLI для оптимизации рабочих процессов разработки и развертывания.

## Понимание AI-агентов в проекте azd

Если вы новичок в AI-агентах, вот простой способ представить их в рамках azd.

### Что такое агент?

Агент — это программный компонент, который может принимать запрос, анализировать его и предпринимать действия — часто вызывая AI-модель, запрашивая данные или вызывая другие сервисы. В проекте azd агент — это просто ещё один **сервис** наряду с вашим веб-фронтендом или API-бэкендом.

### Как агенты вписываются в структуру проекта azd

Проект azd состоит из трёх слоёв: **инфраструктуры**, **кода** и **настройки**. Агенты подключаются к этим слоям так же, как и любые другие сервисы:

| Слой | Что он делает для традиционного приложения | Что он делает для агента |
|-------|-------------------------------------|---------------------------|
| **Инфраструктура** (`infra/`) | Разворачивает веб-приложение и базу данных | Разворачивает конечную точку модели AI, индекс поиска или хост агента |
| **Код** (`src/`) | Содержит исходный код фронтенда и API | Содержит логику агента и определения подсказок |
| **Настройка** (`azure.yaml`) | Перечисляет ваши сервисы и их целевые хосты | Перечисляет агента как сервис, указывая на его код и хост |

### Роль `azure.yaml`

Вам не нужно сейчас запоминать синтаксис. Концептуально, `azure.yaml` — это файл, где вы говорите azd: *"Вот сервисы, которые составляют моё приложение, и здесь их код."*

Когда ваш проект включает AI-агента, `azure.yaml` просто перечисляет этого агента как один из сервисов. azd затем знает, какую инфраструктуру нужно развернуть (например, конечную точку Microsoft Foundry Models или контейнерное приложение для хоста агента) и как развернуть код агента — так же, как для веб-приложения или API.

Это значит, что здесь нет ничего принципиально нового. Если вы понимаете, как azd управляет веб-сервисом, вы уже понимаете, как он управляет агентом.

## Иерархия настройки

В azd есть отдельные поверхности настройки, а не один универсальный слой:
- **Глобальные пользовательские предпочтения**: `~/.azd/config.json`, управляемые `azd config`.
- **Определение проекта**: `azure.yaml` задаёт сервисы, инфраструктуру и хуки.
- **Выбор локальной среды**: `.azure/config.json`.
- **Значения для каждой среды**: `.azure/<name>/.env`, управляемые `azd env`; дополнительные настройки находятся в `config.json` этой среды.
- **Флаги и переменные процесса**: переопределяют только параметры, поддерживаемые конкретной командой/провайдером.

Произвольное значение `azd env set` не становится автоматически параметром инфраструктуры или настройкой развернутого приложения. Его нужно явно указать в параметрическом файле, поддерживаемой конфигурации сервиса или хуке.

## Глобальная конфигурация

### Установка глобальных значений по умолчанию
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

### Часто используемые глобальные настройки
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

## 🏗️ Конфигурация проекта

### Структура azure.yaml
Файл `azure.yaml` — это сердце вашего проекта azd:

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

Это **пример определения проекта**, а не исходный шаблон. Создайте указанные директории с исходным кодом, скрипты хуков, пакетные скрипты и соответствующие `infra/main.bicep`/`main.parameters.json` перед запуском. Базы данных относятся к инфраструктуре; `postgres` не является встроенным хостом сервиса. Параметры инфраструктуры должны идти в параметрический файл провайдера, а не в `infra.parameters`.

### Опции настройки сервисов

#### Типы хостов
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

#### Языко-специфичные хуки сборки

Следующие фрагменты сервисов показывают хуки; объедините их с настоящими `project` и `host` для каждого сервиса. `buildCommand` и `startCommand` не являются универсальными свойствами azd-сервисов. Настройте запуск в приложении, Dockerfile или хост-инфраструктуре.

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

## 🌟 Управление средами

### Создание сред
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфигурация среды
Основные значения среды живут в `.azure/<env-name>/.env`, включая `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` и `AZURE_LOCATION`. Используйте `azd env config get/set` для дополнительных настроек JSON среды. Следующий JSON — это **концептуальное состояние приложения**, а не схема конфигурации azd; не копируйте его в файлы azd:

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

### Переменные среды

**Только демонстрация в открытом виде.** Обычные значения `azd env set` записываются в `.azure/<name>/.env` и могут быть выведены с помощью команд чтения. Не используйте пример ключа API как реальные данные. Для секретов используйте `azd env set-secret` и явное подключение во время выполнения.

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

### Шаблоны сред
Создайте **ненарушаемый, вручную поддерживаемый** `.env.example` в корне проекта для согласованной настройки. azd не загружает автоматически файл с названием `env.template`:
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

### Совместное использование сред в команде

Когда над проектом работает несколько человек, важно договориться, **какие файлы идут в репозиторий, а какие остаются локальными**. azd хранит каждую среду в папке `.azure/`, и не всё из неё должно попадать в коммит.

**Что содержится в `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Что игнорировать в git.** Стандартный файл `.gitignore` azd уже исключает `.azure/`. Оставьте это так — файлы `.env` могут содержать секреты, а идентификаторы ресурсов специфичны для того, кто их развернул. Каждый член команды создаёт **свою собственную** локальную среду:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Переключение между средами.** Разработчик, управляющий несколькими средами, выбирает активную перед запуском команд:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Обеспечение ненарушаемых значений по умолчанию для команды.** Коммитьте `.env.example` вне игнорированной папки `.azure/`. Новые участники копируют его в локальный игнорируемый файл, заполняют значения и явно импортируют через `azd env set --file <local-file>`. Никогда не импортируйте пустые шаблоны поверх рабочей среды.

**Среды в CI/CD.** Пайплайны не читают ваш локальный каталог `.azure/`. Вместо этого передавайте значения среды как переменные/секреты пайплайна, и azd читает их из переменных процесса:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Общее правило:** код инфраструктуры (`infra/`, `azure.yaml`) хранится в Git; *состояние среды и секреты* (`.azure/`) принадлежат каждому разработчику и каждой конвейеру. `azd pipeline config` автоматически настраивает для вас переменные конвейера.

## 🔐 Настройка аутентификации

### Интеграция с Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Аутентификация через Service Principal
Для CI/CD конвейеров:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Управляемый идентификатор (Managed Identity)
Для сред, размещённых в Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Настройка инфраструктуры

### Параметры Bicep
Настройте параметры инфраструктуры в `infra/main.parameters.json`:
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

### Конфигурация Terraform
Для проектов Terraform azd подставляет значения в `infra/main.tfvars.json`. Эти имена должны совпадать с объявленными входными переменными Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Настройка развертывания

### Конфигурация сборки
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

### Конфигурация Docker
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
 Пути указаны относительно проекта сервиса. Dockerfile должен объявлять любые используемые им `ARG` значения. Для многослойной сборки поместите стадию для развертывания последней или используйте собственный Workflow упаковки; `docker.target` не поддерживается в рассматриваемой схеме.

## 🔧 Расширенная настройка

### Пользовательские имена ресурсов
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Определяйте реальные имена ресурсов в Bicep/Terraform и соблюдайте согласованность создания группы ресурсов с этой настройкой. Не существует универсальных ключей конфигурации `naming.storageAccount` или `naming.keyVault`.

### Настройка сети
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Объедините эти **иллюстративные параметры** в `infra/main.parameters.json` под `parameters`, а затем объявите и используйте соответствующие параметры в Bicep. Они сами по себе ничего не делают.

### Конфигурация мониторинга
Разверните Application Insights и Log Analytics в Bicep/Terraform и настройте телеметрию приложения в вашем SDK. Нет общего верхнеуровневого блока `monitoring` в `azure.yaml`, который создаёт эти ресурсы. См. [инфраструктура мониторинга](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Конфигурации для конкретных сред

### Среда разработки
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Среда предрелиза
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Производственная среда
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Проверка конфигурации

### Проверка конфигурации
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Скрипты конфигурации
Создайте скрипты проверки в `scripts/`:

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

## 🎓 Лучшие практики

### 1. Используйте переменные окружения
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Избегайте жёсткого кодирования чувствительных значений (отдельная иллюстративная конфигурация, а не второй `database` ключ в том же файле):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Организуйте конфигурационные файлы
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

### 3. Вопросы контроля версий
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Документация конфигурации
Задокументируйте вашу конфигурацию в `CONFIG.md`:
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

## 🎯 Практические упражнения

### Упражнение 1: Конфигурация для нескольких сред (15 минут)

**Цель**: Создать и настроить три локальных окружения с различными значениями. Начать в инициализированном проекте; использовать неиспользуемые имена, если эти уже существуют. Эти специфические для приложения значения не изменяют настройки телеметрии/времени выполнения, пока ваш шаблон их не использует.

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

**Критерии успеха:**
- [ ] Три окружения успешно созданы
- [ ] Каждое окружение имеет уникальную конфигурацию
- [ ] Можно переключаться между окружениями без ошибок
- [ ] `azd env list` показывает все три окружения

### Упражнение 2: Ссылки на секреты Key Vault (10-20 минут)

**Цель**: Хранить ссылку на Key Vault вместо открытого текста. **Исходная точка:** инициализированное окружение, вход в Azure и доступ к Key Vault с разрешениями на создание/чтение тестового секрета. Операции с хранилищем могут повлечь взимание платы.

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

**Критерии успеха:**
- [ ] Интерактивная команда сообщает выбранное хранилище и ссылку на секрет
- [ ] Локальный `.env` содержит ссылку, а не тестовый секрет
- [ ] Может объяснить, что идентичность времени выполнения/RBAC и потребление должны быть настроены

**Распространённые проблемы:** ошибка 403 требует правильной роли на уровне данных хранилища и времени распространения; `azd env set ... --secret` не является допустимой командой. Обычный вывод `get-values`/`get-value` не должен рассматриваться как скрытый. Удалите тренировочную ссылку с помощью `azd env unset TRAINING_API_KEY`; это не удаляет секрет хранилища, который нужно убирать отдельно, если вы его создали.

## Следующие шаги

- [Ваш первый проект](../chapter-01-foundation/first-project.md) - Практическое применение конфигурации
- [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) - Использование конфигурации для развертывания
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Конфигурации, готовые к производству

## Ссылки

- [Справочник по конфигурации azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Переменные окружения](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 3 - Конфигурация и аутентификация
- **⬅️ Предыдущая**: [Ваш первый проект](../chapter-01-foundation/first-project.md)
- **➡️ Следующая глава**: [Глава 4: Инфраструктура как код](../chapter-04-infrastructure/deployment-guide.md)
- **Следующий урок**: [Аутентификация и безопасность](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->