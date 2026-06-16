# Руководство по настройке

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD For Beginners](../../README.md)
- **📖 Текущая глава**: Глава 3 - Конфигурация и аутентификация
- **⬅️ Предыдущая**: [Ваш первый проект](first-project.md)
- **➡️ Следующая**: [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Следующая глава**: [Глава 4: Инфраструктура как код](../chapter-04-infrastructure/deployment-guide.md)

## Введение

Это всестороннее руководство охватывает все аспекты настройки Azure Developer CLI для оптимальных рабочих процессов разработки и развертывания. Вы узнаете о иерархии конфигураций, управлении окружениями, методах аутентификации и продвинутых паттернах конфигурации, которые обеспечивают эффективные и безопасные развертывания в Azure.

## Цели обучения

К концу этого урока вы:
- Овладеете иерархией конфигурации azd и поймёте, как приоритизируются настройки
- Эффективно настроите глобальные и проект-специфичные параметры
- Управляете несколькими окружениями с разными конфигурациями
- Реализуете безопасные схемы аутентификации и авторизации
- Поймёте продвинутые паттерны конфигурации для сложных сценариев

## Результаты обучения

После завершения этого урока вы сможете:
- Настроить azd для оптимальных рабочих процессов разработки
- Создавать и управлять несколькими окружениями для развертывания
- Внедрять лучшие практики безопасного управления конфигурацией
- Устранять проблемы, связанные с конфигурацией
- Кастомизировать поведение azd под конкретные требования организации

Это всестороннее руководство охватывает все аспекты настройки Azure Developer CLI для оптимальных рабочих процессов разработки и развертывания.

## Понимание AI-агентов в проекте azd

Если вы новичок в AI-агентах, вот простой способ понять их роль в мире azd.

### Что такое агент?

Агент — это программное обеспечение, которое может принимать запрос, обдумывать его и предпринимать действия — часто вызывая модель AI, запрашивая данные или обращаясь к другим сервисам. В проекте azd агент — это просто ещё один **сервис** наряду с вашим веб-фронтендом или API-бэкендом.

### Как агенты вписываются в структуру проекта azd

Проект azd состоит из трёх слоёв: **инфраструктура**, **код** и **конфигурация**. Агенты интегрируются в эти слои так же, как и любой другой сервис:

| Слой | Что делает для традиционного приложения | Что делает для агента |
|-------|-----------------------------------------|----------------------|
| **Инфраструктура** (`infra/`) | Развёртывает веб-приложение и базу данных | Развёртывает конечную точку модели AI, индекс поиска или хостинг агента |
| **Код** (`src/`) | Содержит исходный код фронтенда и API | Содержит логику агента и определения подсказок |
| **Конфигурация** (`azure.yaml`) | Перечисляет ваши сервисы и их цели хостинга | Перечисляет агента как сервис, указывая на его код и хост |

### Роль `azure.yaml`

Вам не нужно сейчас запоминать синтаксис. В концепции, `azure.yaml` — это файл, в котором вы говорите azd: *"Вот сервисы, которые составляют мое приложение, и вот где находится их код."*

Когда в вашем проекте есть AI-агент, `azure.yaml` просто перечисляет этот агент как один из сервисов. azd затем знает, какую инфраструктуру нужно развёртывать (например, конечную точку Microsoft Foundry Models или Container App для хостинга агента) и развёртывает код агента — так же, как для веб-приложения или API.

Это значит, что ничего принципиально нового учить не нужно. Если вы понимаете, как azd управляет веб-сервисом, вы уже понимаете, как он управляет агентом.

## Иерархия конфигурации

azd использует иерархическую систему конфигураций:
1. **Флаги командной строки** (наивысший приоритет)
2. **Переменные окружения**
3. **Локальная конфигурация проекта** (`.azd/config.json`)
4. **Глобальная конфигурация пользователя** (`~/.azd/config.json`)
5. **Значения по умолчанию** (наинизший приоритет)

## Глобальная конфигурация

### Установка глобальных значений по умолчанию
```bash
# Установить подписку по умолчанию
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Установить расположение по умолчанию
azd config set defaults.location "eastus2"

# Установить соглашение об именах группы ресурсов по умолчанию
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Просмотреть всю глобальную конфигурацию
azd config show

# Удалить конфигурацию
azd config unset defaults.location
```

### Общие глобальные настройки
```bash
# Предпочтения разработки
azd config set alpha.enable true                    # Включить альфа-функции
azd config set telemetry.enabled false             # Отключить телеметрию
azd config set output.format json                  # Установить формат вывода

# Настройки безопасности
azd config set auth.useAzureCliCredential true     # Использовать Azure CLI для аутентификации
azd config set tls.insecure false                  # Принудительная проверка TLS

# Настройка производительности
azd config set provision.parallelism 5             # Параллельное создание ресурсов
azd config set deploy.timeout 30m                  # Тайм-аут развертывания
```

## 🏗️ Конфигурация проекта

### Структура azure.yaml
Файл `azure.yaml` — это сердце вашего проекта azd:

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

### Опции настройки сервисов

#### Типы хостинга
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

#### Настройки, специфичные для языков
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

## 🌟 Управление окружениями

### Создание окружений
```bash
# Создать новую среду
azd env new development

# Создать с определённым расположением
azd env new staging --location "westus2"

# Создать из шаблона
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Конфигурация окружения
Каждое окружение имеет свою конфигурацию в `.azure/<env-name>/config.json`:

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

### Переменные окружения
```bash
# Установить переменные, специфичные для среды
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Просмотреть переменные среды
azd env get-values

# Ожидаемый вывод:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=секретный-api-ключ
# DEBUG=true

# Удалить переменную среды
azd env unset DEBUG

# Проверить удаление
azd env get-values | grep DEBUG
# (должно ничего не возвращать)
```

### Шаблоны окружений
Создайте `.azure/env.template` для единообразной настройки окружения:
```bash
# Требуемые переменные
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Настройки приложения
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Необязательные настройки разработки
DEBUG=false
LOG_LEVEL=info
```

### Совместное использование окружений в команде

Когда над проектом работают несколько человек, нужно договориться, **что хранится в репозитории, а что остаётся локальным**. azd хранит каждое окружение в папке `.azure/`, и не всё из неё следует коммитить.

**Что содержится в `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Что нужно игнорировать в git.** Стандартный `.gitignore` azd уже исключает `.azure/`. Оставляйте так — `.env` файлы могут содержать секреты, а идентификаторы ресурсов специфичны для того, кто их создал. Каждый участник создаёт своё **локальное** окружение:

```bash
# Каждый разработчик запускает это один раз, чтобы получить свою собственную изолированную среду
azd env new dev-alice
azd up
```

**Переключение между окружениями.** Разработчик, управляющий несколькими окружениями, выбирает активное перед выполнением команд:

```bash
azd env list                 # посмотреть все локальные окружения и какое из них по умолчанию
azd env select staging       # сделать 'staging' активным окружением
azd env get-values           # подтвердить, что вы выбрали правильное окружение
```

**Предоставление незащищённых значений команде.** Коммитьте шаблон (такой, как `.azure/env.template`, приведённый выше), чтобы все знали, какие переменные нужно задавать — но никогда не коммитьте заполненные значения. Новые участники копируют шаблон и заполняют свои собственные данные.

**Окружения в CI/CD.** Пайплайны не читают локальную папку `.azure/`. Вместо этого задайте значения окружения как переменные/секреты в пайплайне, и azd считает их из системного окружения процесса:

```bash
# В CI azd читает эти значения из окружения, а не из .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Правило:** код инфраструктуры (`infra/`, `azure.yaml`) хранится в Git; состояние и секреты окружения (`.azure/`) — на каждого разработчика и пайплайн. `azd pipeline config` настраивает переменные пайплайна автоматически.

## 🔐 Настройка аутентификации

### Интеграция с Azure CLI
```bash
# Используйте учетные данные Azure CLI (по умолчанию)
azd config set auth.useAzureCliCredential true

# Вход с определенным арендатором
az login --tenant <tenant-id>

# Установить подписку по умолчанию
az account set --subscription <subscription-id>
```

### Аутентификация с помощью сервисного принципала
Для CI/CD пайплайнов:
```bash
# Установить переменные окружения
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Или настроить напрямую
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Управляемая идентичность
Для окружений, размещённых в Azure:
```bash
# Включить аутентификацию с использованием управляемой идентичности
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Конфигурация инфраструктуры

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
Для проектов Terraform настройте в `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Конфигурация развертывания

### Настройки сборки
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

### Конфигурация Docker
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
Пример `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Продвинутая конфигурация

### Кастомизация имён ресурсов
```bash
# Установить соглашения об именовании
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Конфигурация сети
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Конфигурация мониторинга
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

## 🎯 Конфигурации для конкретных окружений

### Окружение разработки
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Тестовое (staging) окружение
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Продакшн окружение
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Валидация конфигурации

### Проверка конфигурации
```bash
# Проверить синтаксис конфигурации
azd config validate

# Проверить переменные окружения
azd env get-values

# Проверить инфраструктуру
azd provision --dry-run
```

### Скрипты конфигурации
Создавайте скрипты в папке `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Проверить необходимые переменные окружения
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Проверить синтаксис azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
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

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Организуйте конфигурационные файлы
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

### 3. Учитывайте контроль версий
```bash
# .gitignore
.azure/*/config.json         # Конфигурации окружения (содержат идентификаторы ресурсов)
.azure/*/.env               # Переменные окружения (могут содержать секреты)
.env                        # Локальный файл окружения
```

### 4. Документирование конфигураций
Документируйте настройки в `CONFIG.md`:
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

### Упражнение 1: Конфигурация для нескольких окружений (15 минут)

**Цель**: Создать и настроить три окружения с разными настройками

```bash
# Создать среду разработки
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Создать промежуточную среду
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Создать производственную среду
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Проверить каждую среду
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Критерии успеха:**
- [ ] Три окружения успешно созданы
- [ ] Каждое окружение имеет уникальную конфигурацию
- [ ] Переключение между окружениями проходит без ошибок
- [ ] `azd env list` показывает все три окружения

### Упражнение 2: Управление секретами (10 минут)

**Цель**: Практиковаться в безопасном управлении чувствительными данными

```bash
# Установить секреты (не отображаются в выводе)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Установить конфигурацию без секретов
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Просмотр окружения (секреты должны быть скрыты)
azd env get-values

# Проверить, что секреты сохранены
azd env get DB_PASSWORD  # Должно отображать реальное значение
```

**Критерии успеха:**
- [ ] Секреты сохранены без отображения в терминале
- [ ] `azd env get-values` показывает скрытые секреты
- [ ] Отдельная команда `azd env get <SECRET_NAME>` возвращает реальное значение

## Следующие шаги

- [Ваш первый проект](first-project.md) — примените настройку на практике
- [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) — используйте конфигурацию для развертывания
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) — конфигурации для производственной среды

## Ссылки

- [Справочник по конфигурации azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Схема azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Переменные окружения](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD For Beginners](../../README.md)
- **📖 Текущая глава**: Глава 3 - Конфигурация и аутентификация
- **⬅️ Предыдущая**: [Ваш первый проект](first-project.md)
- **➡️ Следующая глава**: [Глава 4: Инфраструктура как код](../chapter-04-infrastructure/deployment-guide.md)
- **Следующий урок**: [Ваш первый проект](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->