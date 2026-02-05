# 4. Налаштування шаблону

!!! tip "ПІСЛЯ ЗАВЕРШЕННЯ ЦЬОГО МОДУЛЯ ВИ ЗМОЖЕТЕ"

    - [ ] Зрозуміти призначення `azure.yaml`
    - [ ] Зрозуміти структуру `azure.yaml`
    - [ ] Зрозуміти цінність життєвого циклу `hooks` в azd
    - [ ] **Лабораторія 3:** 

---

!!! prompt "Що робить файл `azure.yaml`? Використовуйте блок коду та поясніть його рядок за рядком"

      Файл `azure.yaml` є **файлом конфігурації для Azure Developer CLI (azd)**. Він визначає, як ваш додаток має бути розгорнутий в Azure, включаючи інфраструктуру, сервіси, гачки розгортання та змінні середовища.

---

## 1. Призначення та функціональність

Файл `azure.yaml` слугує **планом розгортання** для додатку AI-агента, який:

1. **Перевіряє середовище** перед розгортанням
2. **Забезпечує сервіси Azure AI** (AI Hub, AI Project, Search тощо)
3. **Розгортає Python-додаток** в Azure Container Apps
4. **Налаштовує AI-моделі** для функціональності чату та вбудовування
5. **Встановлює моніторинг та трасування** для AI-додатку
6. **Працює як з новими, так і з існуючими** сценаріями проектів Azure AI

Файл дозволяє **розгортання за однією командою** (`azd up`) повного рішення AI-агента з правильною перевіркою, забезпеченням та постконфігурацією.

??? info "Розгорнути для перегляду: `azure.yaml`"

      Файл `azure.yaml` визначає, як Azure Developer CLI має розгортати та управляти цим додатком AI-агента в Azure. Розглянемо його рядок за рядком.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: чи потрібні нам гачки? 
      # TODO: чи потрібні нам усі змінні?

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

## 2. Розбір файлу

Розглянемо файл секція за секцією, щоб зрозуміти, що він робить і чому.

### 2.1 **Заголовок і схема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Рядок 1**: Забезпечує перевірку схеми YAML для підтримки IDE та IntelliSense

### 2.2 Метадані проекту (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Рядок 5**: Визначає назву проекту, яку використовує Azure Developer CLI
- **Рядки 6-7**: Вказує, що це базується на шаблоні версії 1.0.2
- **Рядки 8-9**: Вимагає версію Azure Developer CLI 1.14.0 або новішу

### 2.3 Гачки розгортання (11-40)

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

- **Рядки 11-20**: **Гачок перед розгортанням** - виконується перед `azd up`

      - На Unix/Linux: Робить скрипт перевірки виконуваним і запускає його
      - На Windows: Запускає скрипт перевірки PowerShell
      - Обидва є інтерактивними і зупинять розгортання, якщо вони не пройдуть

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
- **Рядки 21-30**: **Гачок після забезпечення** - виконується після створення ресурсів Azure

  - Виконує скрипти запису змінних середовища
  - Продовжує розгортання, навіть якщо ці скрипти не пройшли (`continueOnError: true`)

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
- **Рядки 31-40**: **Гачок після розгортання** - виконується після розгортання додатку

  - Виконує фінальні налаштування скриптів
  - Продовжує, навіть якщо скрипти не пройшли

### 2.4 Конфігурація сервісу (41-48)

Це налаштовує сервіс додатку, який ви розгортаєте.

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

- **Рядок 42**: Визначає сервіс з назвою "api_and_frontend"
- **Рядок 43**: Вказує на каталог `./src` для вихідного коду
- **Рядок 44**: Вказує Python як мову програмування
- **Рядок 45**: Використовує Azure Container Apps як платформу хостингу
- **Рядки 46-48**: Конфігурація Docker

      - Використовує "api_and_frontend" як назву образу
      - Будує образ Docker віддалено в Azure (не локально)

### 2.5 Змінні конвеєра (49-76)

Це змінні, які допомагають запускати `azd` в CI/CD конвеєрах для автоматизації

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

Ця секція визначає змінні середовища, які використовуються **під час розгортання**, організовані за категоріями:

- **Назви ресурсів Azure (Рядки 51-60)**:
      - Назви основних ресурсів Azure, наприклад, Resource Group, AI Hub, AI Project тощо
- **Прапорці функцій (Рядки 61-63)**:
      - Булеві змінні для увімкнення/вимкнення певних сервісів Azure
- **Конфігурація AI-агента (Рядки 64-71)**:
      - Налаштування основного AI-агента, включаючи назву, ID, параметри розгортання, деталі моделі
- **Конфігурація вбудовування AI (Рядки 72-79)**:
      - Налаштування моделі вбудовування для пошуку вектора
- **Пошук і моніторинг (Рядки 80-84)**:
      - Назва індексу пошуку, існуючі ID ресурсів та налаштування моніторингу/трасування

---

## 3. Знання змінних середовища
Наступні змінні середовища контролюють конфігурацію та поведінку вашого розгортання, організовані за їх основним призначенням. Більшість змінних мають розумні значення за замовчуванням, але ви можете налаштувати їх відповідно до ваших конкретних вимог або існуючих ресурсів Azure.

### 3.1 Обов'язкові змінні 

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

### 3.2 Конфігурація моделі 
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

### 3.3 Перемикач функцій
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

### 3.4 Конфігурація AI-проекту 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Перевірте ваші змінні

Використовуйте Azure Developer CLI для перегляду та управління вашими змінними середовища:

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

