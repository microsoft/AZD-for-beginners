# 4. Конфигурисање шаблона

!!! tip "НА КРАЈУ ОВОГ МОДУЛА БИЋЕТЕ У МОГУЋНОСТИ ДА"

    - [ ] Разумете сврху `azure.yaml`
    - [ ] Разумете структуру `azure.yaml`
    - [ ] Разумете вредност azd животног циклуса `hooks`
    - [ ] **Лабораторија 3:** 

---

!!! prompt "Шта ради `azure.yaml` фајл? Користите код блок и објасните га линију по линију"

      Фајл `azure.yaml` је **конфигурациони фајл за Azure Developer CLI (azd)**. Он дефинише како ваша апликација треба да се распореди на Azure, укључујући инфраструктуру, услуге, deployment hooks и променљиве окружења.

---

## 1. Сврха и функционалност

Овај `azure.yaml` фајл служи као **план за распоређивање** апликације AI агента који:

1. **Проверава окружење** пре распоређивања
2. **Обезбеђује Azure AI услуге** (AI Hub, AI Project, Search, итд.)
3. **Распоређује Python апликацију** на Azure Container Apps
4. **Конфигурише AI моделе** за функције ћаскања и уграђивања
5. **Поставља праћење и мониторинг** за AI апликацију
6. **Руковање новим и постојећим** Azure AI пројектима

Фајл омогућава **распоређивање једном командом** (`azd up`) комплетног решења AI агента са одговарајућом валидацијом, обезбеђивањем и конфигурацијом након распоређивања.

??? info "Проширите за приказ: `azure.yaml`"

      Фајл `azure.yaml` дефинише како Azure Developer CLI треба да распореди и управља овом AI Agent апликацијом на Azure. Хајде да га анализирамо линију по линију.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: да ли су нам потребни hooks? 
      # TODO: да ли су нам потребне све променљиве?

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

## 2. Анализа фајла

Хајде да прођемо кроз фајл секцију по секцију, како бисмо разумели шта ради - и зашто.

### 2.1 **Заглавље и шема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Линија 1**: Обезбеђује валидацију шеме YAML језика за подршку у IDE-у и IntelliSense

### 2.2 Метаподаци пројекта (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Линија 5**: Дефинише име пројекта које користи Azure Developer CLI
- **Линије 6-7**: Спецификује да је заснован на верзији шаблона 1.0.2
- **Линије 8-9**: Захтева Azure Developer CLI верзију 1.14.0 или новију

### 2.3 Deploy Hooks (11-40)

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

- **Линије 11-20**: **Hook пре распоређивања** - извршава се пре `azd up`

      - На Unix/Linux: Чини скрипту за валидацију извршивом и покреће је
      - На Windows: Покреће PowerShell скрипту за валидацију
      - Обе су интерактивне и заустављају распоређивање ако не успеју

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
- **Линије 21-30**: **Hook након обезбеђивања** - извршава се након креирања Azure ресурса

  - Извршава скрипте за писање променљивих окружења
  - Наставља распоређивање чак и ако ове скрипте не успеју (`continueOnError: true`)

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
- **Линије 31-40**: **Hook након распоређивања** - извршава се након распоређивања апликације

  - Извршава завршне скрипте за подешавање
  - Наставља чак и ако скрипте не успеју

### 2.4 Конфигурација услуге (41-48)

Ово конфигурише услугу апликације коју распоређујете.

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

- **Линија 42**: Дефинише услугу под именом "api_and_frontend"
- **Линија 43**: Указује на директоријум `./src` за изворни код
- **Линија 44**: Спецификује Python као програмски језик
- **Линија 45**: Користи Azure Container Apps као платформу за хостовање
- **Линије 46-48**: Docker конфигурација

      - Користи "api_and_frontend" као име слике
      - Гради Docker слику даљински у Azure (не локално)

### 2.5 Променљиве за CI/CD (49-76)

Ово су променљиве које помажу у покретању `azd` у CI/CD окружењима за аутоматизацију

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

Ова секција дефинише променљиве окружења које се користе **током распоређивања**, организоване по категоријама:

- **Имена Azure ресурса (Линије 51-60)**:
      - Имена основних Azure услуга, нпр. Resource Group, AI Hub, AI Project, итд.
- **Функционалне заставице (Линије 61-63)**:
      - Булове променљиве за омогућавање/онемогућавање одређених Azure услуга
- **Конфигурација AI агента (Линије 64-71)**:
      - Конфигурација за главни AI агент укључујући име, ID, подешавања распоређивања, детаље модела
- **Конфигурација уграђивања AI (Линије 72-79)**:
      - Конфигурација за модел уграђивања који се користи за претрагу вектора
- **Претрага и мониторинг (Линије 80-84)**:
      - Име индекса претраге, ID-ови постојећих ресурса и подешавања за праћење

---

## 3. Познавање променљивих окружења
Следеће променљиве окружења контролишу конфигурацију и понашање вашег распоређивања, организоване према њиховој примарној сврси. Већина променљивих има подразумеване вредности, али их можете прилагодити како би одговарале вашим специфичним захтевима или постојећим Azure ресурсима.

### 3.1 Обавезне променљиве 

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

### 3.2 Конфигурација модела 
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

### 3.3 Функционалне заставице
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

### 3.4 Конфигурација AI пројекта 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Провера ваших променљивих

Користите Azure Developer CLI за преглед и управљање вашим променљивим окружења:

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

