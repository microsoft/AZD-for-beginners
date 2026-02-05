# 4. Конфигуриране на шаблон

!!! tip "В КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕТЕ"

    - [ ] Да разберете предназначението на `azure.yaml`
    - [ ] Да разберете структурата на `azure.yaml`
    - [ ] Да разберете стойността на `hooks` в жизнения цикъл на azd
    - [ ] **Лаборатория 3:** 

---

!!! prompt "Какво прави файлът `azure.yaml`? Използвайте кодов блок и обяснете го ред по ред"

      Файлът `azure.yaml` е **конфигурационният файл за Azure Developer CLI (azd)**. Той определя как вашето приложение трябва да бъде разположено в Azure, включително инфраструктура, услуги, hooks за разполагане и променливи на средата.

---

## 1. Предназначение и функционалност

Файлът `azure.yaml` служи като **план за разполагане** на приложение за AI агент, което:

1. **Проверява средата** преди разполагане
2. **Осигурява Azure AI услуги** (AI Hub, AI Project, Search и др.)
3. **Разполага Python приложение** в Azure Container Apps
4. **Конфигурира AI модели** за чат и функционалност за вграждане
5. **Настройва мониторинг и проследяване** за AI приложението
6. **Работи както с нови, така и със съществуващи** сценарии за Azure AI проекти

Файлът позволява **разполагане с една команда** (`azd up`) на цялостно решение за AI агент с правилна проверка, осигуряване и конфигурация след разполагане.

??? info "Разгънете за преглед: `azure.yaml`"

      Файлът `azure.yaml` определя как Azure Developer CLI трябва да разположи и управлява това приложение за AI агент в Azure. Нека го разгледаме ред по ред.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: нуждаем ли се от hooks? 
      # TODO: нуждаем ли се от всички променливи?

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

## 2. Разглеждане на файла

Нека преминем през файла секция по секция, за да разберем какво прави - и защо.

### 2.1 **Заглавие и схема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Ред 1**: Осигурява схема за валидиране на YAML езиковия сървър за IDE поддръжка и IntelliSense

### 2.2 Метаданни на проекта (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Ред 5**: Определя името на проекта, използвано от Azure Developer CLI
- **Редове 6-7**: Указва, че това е базирано на шаблон версия 1.0.2
- **Редове 8-9**: Изисква версия на Azure Developer CLI 1.14.0 или по-нова

### 2.3 Hooks за разполагане (11-40)

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

- **Редове 11-20**: **Hook преди разполагане** - изпълнява се преди `azd up`

      - На Unix/Linux: Прави скрипта за валидиране изпълним и го стартира
      - На Windows: Стартира PowerShell скрипт за валидиране
      - И двете са интерактивни и ще спрат разполагането, ако се провалят

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
- **Редове 21-30**: **Hook след осигуряване** - изпълнява се след създаване на Azure ресурси

  - Изпълнява скриптове за запис на променливи на средата
  - Продължава разполагането, дори ако тези скриптове се провалят (`continueOnError: true`)

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
- **Редове 31-40**: **Hook след разполагане** - изпълнява се след разполагане на приложението

  - Изпълнява финални скриптове за настройка
  - Продължава, дори ако скриптовете се провалят

### 2.4 Конфигурация на услугата (41-48)

Това конфигурира услугата на приложението, което разполагате.

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

- **Ред 42**: Определя услуга с име "api_and_frontend"
- **Ред 43**: Посочва директорията `./src` за изходния код
- **Ред 44**: Указва Python като програмен език
- **Ред 45**: Използва Azure Container Apps като платформа за хостинг
- **Редове 46-48**: Конфигурация на Docker

      - Използва "api_and_frontend" като име на изображението
      - Изгражда Docker изображението дистанционно в Azure (не локално)

### 2.5 Променливи за pipeline (49-76)

Това са променливи, които помагат за автоматизацията на `azd` в CI/CD pipelines.

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

Тази секция дефинира променливи на средата, използвани **по време на разполагане**, организирани по категории:

- **Имена на Azure ресурси (Редове 51-60)**:
      - Основни имена на ресурси за Azure услуги, напр. Resource Group, AI Hub, AI Project и др.
- **Функционални флагове (Редове 61-63)**:
      - Булеви променливи за активиране/деактивиране на специфични Azure услуги
- **Конфигурация на AI агент (Редове 64-71)**:
      - Конфигурация за основния AI агент, включително име, ID, настройки за разполагане, детайли за модела
- **Конфигурация за вграждане на AI (Редове 72-79)**:
      - Конфигурация за модела за вграждане, използван за векторно търсене
- **Търсене и мониторинг (Редове 80-84)**:
      - Име на индекс за търсене, съществуващи ID на ресурси и настройки за мониторинг/проследяване

---

## 3. Познаване на променливите на средата
Следните променливи на средата контролират конфигурацията и поведението на вашето разполагане, организирани според основната им цел. Повечето променливи имат разумни стойности по подразбиране, но можете да ги персонализирате, за да съответстват на вашите специфични изисквания или съществуващи Azure ресурси.

### 3.1 Задължителни променливи 

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

### 3.2 Конфигурация на модела 
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

### 3.3 Функционални флагове
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

### 3.4 Конфигурация на AI проект 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Проверка на вашите променливи

Използвайте Azure Developer CLI, за да преглеждате и управлявате вашите променливи на средата:

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

