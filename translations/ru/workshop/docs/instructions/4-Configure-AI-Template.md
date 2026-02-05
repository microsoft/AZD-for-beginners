# 4. Настройка шаблона

!!! tip "ПОСЛЕ ПРОХОЖДЕНИЯ ЭТОГО МОДУЛЯ ВЫ СМОЖЕТЕ"

    - [ ] Понять назначение файла `azure.yaml`
    - [ ] Понять структуру файла `azure.yaml`
    - [ ] Осознать ценность жизненного цикла `hooks` в azd
    - [ ] **Лабораторная работа 3:** 

---

!!! prompt "Что делает файл `azure.yaml`? Используйте блок кода и объясните его построчно"

      Файл `azure.yaml` — это **файл конфигурации для Azure Developer CLI (azd)**. Он определяет, как ваше приложение должно быть развернуто в Azure, включая инфраструктуру, сервисы, хуки развертывания и переменные окружения.

---

## 1. Назначение и функциональность

Файл `azure.yaml` служит **планом развертывания** для приложения AI-агента, которое:

1. **Проверяет окружение** перед развертыванием
2. **Создает сервисы Azure AI** (AI Hub, AI Project, Search и др.)
3. **Развертывает Python-приложение** в Azure Container Apps
4. **Настраивает AI-модели** для чата и функций встраивания
5. **Устанавливает мониторинг и трассировку** для AI-приложения
6. **Работает как с новыми, так и с существующими** проектами Azure AI

Файл позволяет выполнить **развертывание в один шаг** (`azd up`) полного решения AI-агента с проверкой, созданием ресурсов и постразвертывательной настройкой.

??? info "Развернуть для просмотра: `azure.yaml`"

      Файл `azure.yaml` определяет, как Azure Developer CLI должен развернуть и управлять этим приложением AI-агента в Azure. Давайте разберем его построчно.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: нужны ли нам хуки? 
      # TODO: нужны ли все переменные?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. Разбор файла

Давайте рассмотрим файл по разделам, чтобы понять, что он делает и зачем.

### 2.1 **Заголовок и схема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Строка 1**: Указывает схему YAML для поддержки IDE и автодополнения

### 2.2 Метаданные проекта (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Строка 5**: Определяет имя проекта, используемое Azure Developer CLI
- **Строки 6-7**: Указывает, что проект основан на шаблоне версии 1.0.2
- **Строки 8-9**: Требует версию Azure Developer CLI 1.14.0 или выше

### 2.3 Хуки развертывания (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Строки 11-20**: **Хук перед развертыванием** - выполняется перед `azd up`

      - На Unix/Linux: делает скрипт проверки исполняемым и запускает его
      - На Windows: запускает PowerShell-скрипт проверки
      - Оба варианта интерактивны и остановят развертывание в случае ошибки

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Строки 21-30**: **Хук после создания ресурсов** - выполняется после создания ресурсов Azure

  - Запускает скрипты записи переменных окружения
  - Продолжает развертывание, даже если скрипты завершились с ошибкой (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Строки 31-40**: **Хук после развертывания** - выполняется после развертывания приложения

  - Запускает финальные скрипты настройки
  - Продолжает выполнение, даже если скрипты завершились с ошибкой

### 2.4 Конфигурация сервиса (41-48)

Этот раздел настраивает сервис приложения, которое вы развертываете.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Строка 42**: Определяет сервис с именем "api_and_frontend"
- **Строка 43**: Указывает на каталог `./src` для исходного кода
- **Строка 44**: Указывает Python как язык программирования
- **Строка 45**: Использует Azure Container Apps как платформу хостинга
- **Строки 46-48**: Конфигурация Docker

      - Использует "api_and_frontend" как имя образа
      - Создает образ Docker удаленно в Azure (не локально)

### 2.5 Переменные для конвейера (49-76)

Эти переменные помогают запускать `azd` в CI/CD конвейерах для автоматизации

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

Этот раздел определяет переменные окружения, используемые **во время развертывания**, организованные по категориям:

- **Имена ресурсов Azure (строки 51-60)**:
      - Основные имена ресурсов Azure, например, Resource Group, AI Hub, AI Project и др.
- **Флаги функций (строки 61-63)**:
      - Логические переменные для включения/отключения определенных сервисов Azure
- **Конфигурация AI-агента (строки 64-71)**:
      - Настройки основного AI-агента, включая имя, ID, параметры развертывания, детали модели
- **Конфигурация встраивания AI (строки 72-79)**:
      - Настройки модели встраивания для поиска вектора
- **Поиск и мониторинг (строки 80-84)**:
      - Имя индекса поиска, ID существующих ресурсов и настройки мониторинга/трассировки

---

## 3. Знание переменных окружения
Следующие переменные окружения управляют конфигурацией и поведением вашего развертывания, организованные по их основному назначению. Большинство переменных имеют разумные значения по умолчанию, но вы можете настроить их в соответствии с вашими конкретными требованиями или существующими ресурсами Azure.

### 3.1 Обязательные переменные 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 Конфигурация модели 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 Переключатели функций
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 Конфигурация AI-проекта 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Проверка переменных

Используйте Azure Developer CLI для просмотра и управления переменными окружения:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

