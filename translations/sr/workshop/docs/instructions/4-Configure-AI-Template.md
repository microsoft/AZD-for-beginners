# 4. Конфигуришите шаблон

!!! tip "НА КРАЈУ ОВОГ МОДУЛА МОЋИ ЋЕТЕ"

    - [ ] Разумети сврху `azure.yaml`
    - [ ] Разумети структуру `azure.yaml`
    - [ ] Разумети вредност azd lifecycle `hooks`
    - [ ] **Лаб 4:** Истражити и изменити променљиве окружења

---

!!! prompt "Шта ради датотека `azure.yaml`? Користите блок кода и објасните је ред по реду"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. Сврха и функционалност

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **Проверава окружење** пре распоређивања
2. **Обезбеђује Azure AI сервисе** (AI Hub, AI Project, Search, итд.)
3. **Распоређује Python апликацију** на Azure Container Apps
4. **Конфигурише AI моделе** за ћаскање и embedding функционалност
5. **Поставља праћење и трасирање** за AI апликацију
6. **Обрађује и нове и постојеће** сценарије Azure AI пројекта

The file enables **one-command deployment** (`azd up`) of a complete AI agent solution with proper validation, provisioning, and post-deployment configuration.

??? info "Проширите за преглед: `azure.yaml`"

      The `azure.yaml` file defines how Azure Developer CLI should deploy and manage this AI Agent application in Azure. Let's break it down line-by-line.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

## 2. Разлагање датотеке

Проћи ћемо кроз датотеку секцију по секцију, да бисмо разумели шта ради - и зашто.

### 2.1 **Заглавље и шема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Ред 1**: Обезбеђује валидацију шеме за YAML language server ради подршке у IDE-у и IntelliSense-у

### 2.2 Мета-подаци пројекта (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Ред 5**: Дефинише име пројекта које користи Azure Developer CLI
- **Редови 6-7**: Наводи да је засновано на шаблону верзије 1.0.2
- **Редови 8-9**: Захтева Azure Developer CLI верзију 1.14.0 или новију

### 2.3 Hooks за распоређивање (11-40)

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

- **Редови 11-20**: **Hook пре распоређивања** - покреће се пре `azd up`

      - На Unix/Linux: Чини валидациони скрипт извршним и покреће га
      - На Windows: Покреће PowerShell валидациони скрипт
      - Оба су интерактивна и зауставиће распоређивање ако не успеју

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
- **Редови 21-30**: **Hook после провизионисања** - покреће се након што су Azure ресурси креирани

  - Извршава скрипте које уписују променљиве окружења
  - Наставља распоређивање чак и ако ти скриптови не успеју (`continueOnError: true`)

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
- **Редови 31-40**: **Hook после деплоја** - покреће се након распоређивања апликације

  - Извршава финалне скрипте за подешавање
  - Наставља чак и ако скриптови не успеју

### 2.4 Конфигурација сервиса (41-48)

Ово конфигурише сервис апликације који распоређујете.

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

- **Ред 42**: Дефинише сервис именован "api_and_frontend"
- **Ред 43**: Указује на директоријум `./src` за изворни код
- **Ред 44**: Одређује Python као програмски језик
- **Ред 45**: Користи Azure Container Apps као платформу за хостовање
- **Редови 46-48**: Docker конфигурација

      - Користи "api_and_frontend" као име слике
      - Гради Docker слику удаљено у Azure-у (не локално)

### 2.5 Променљиве pipeline-а (49-76)

Ово су променљиве које вам помажу да покренете `azd` у CI/CD pipeline-има за аутоматизацију

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

- **Имена Azure ресурса (Редови 51-60)**:
      - Основна имена Azure сервиса нпр. Resource Group, AI Hub, AI Project, итд.- 
- **Флагови функција (Редови 61-63)**:
      - Булове променљиве за омогућавање/онемогућавање одређених Azure сервиса
- **Конфигурација AI агента (Редови 64-71)**:
      - Конфигурација за главни AI агент укључујући име, ID, подешавања деплоя, детаље о моделу- 
- **Конфигурација AI ембедовања (Редови 72-79)**:
      - Конфигурација модела за embedding који се користи за векторску претрагу
- **Претрага и мониторинг (Редови 80-84)**:
      - Име индекса за претрагу, постојећи ID-ови ресурса, и подешавања за мониторинг/трасирање

---

## 3. Променљиве окружења
Следеће променљиве окружења контролишу конфигурацију и понашање вашег распоређивања, организоване по њиховој примарној сврси. Већина променљивих има разумне подразумеване вредности, али их можете прилагодити да одговарају вашим специфичним захтевима или постојећим Azure ресурсима.

### 3.1 Обавезне променљиве 

```bash title="" linenums="0"
# Основна Azure конфигурација
AZURE_ENV_NAME                    # Име окружења (користи се у именовању ресурса)
AZURE_LOCATION                    # Регион за распоређивање
AZURE_SUBSCRIPTION_ID             # Циљна претплата
AZURE_RESOURCE_GROUP              # Име групе ресурса
AZURE_PRINCIPAL_ID                # Кориснички субјекат за RBAC

# Имена ресурса (аутоматски се генеришу ако нису наведена)
AZURE_AIHUB_NAME                  # Име Microsoft Foundry хаба
AZURE_AIPROJECT_NAME              # Име AI пројекта
AZURE_AISERVICES_NAME             # Име налога за AI услуге
AZURE_STORAGE_ACCOUNT_NAME        # Име налога за складиштење
AZURE_CONTAINER_REGISTRY_NAME     # Име регистра контејнера
AZURE_KEYVAULT_NAME               # Име Key Vault-а (ако се користи)
```

### 3.2 Конфигурација модела 
```bash title="" linenums="0"
# Конфигурација чат модела
AZURE_AI_AGENT_MODEL_NAME         # Подразумевано: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Подразумевано: OpenAI (или Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Подразумевано: најновије доступно
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Име распоређивања за чат модел
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Подразумевано: Стандард
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Подразумевано: 80 (хиљада TPM)

# Конфигурација модела уграђивања
AZURE_AI_EMBED_MODEL_NAME         # Подразумевано: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Подразумевано: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Подразумевано: најновије доступно
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Име распоређивања за модел уграђивања
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Подразумевано: Стандард
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Подразумевано: 50 (хиљада TPM)

# Конфигурација агента
AZURE_AI_AGENT_NAME               # Приказано име агента
AZURE_EXISTING_AGENT_ID           # Користи постојећег агента (опционо)
```

### 3.3 Укључивање/исклучивање функција
```bash title="" linenums="0"
# Опционалне услуге
USE_APPLICATION_INSIGHTS         # Подразумевано: укључено
USE_AZURE_AI_SEARCH_SERVICE      # Подразумевано: искључено
USE_CONTAINER_REGISTRY           # Подразумевано: укључено

# Надгледање и праћење
ENABLE_AZURE_MONITOR_TRACING     # Подразумевано: искључено
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Подразумевано: искључено

# Конфигурација претраге
AZURE_AI_SEARCH_INDEX_NAME       # Име индекса претраге
AZURE_SEARCH_SERVICE_NAME        # Име сервиса за претрагу
```

### 3.4 Конфигурација AI пројекта 
```bash title="" linenums="0"
# Користите постојеће ресурсе
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Пуни идентификатор ресурса постојећег пројекта вештачке интелигенције
AZURE_EXISTING_AIPROJECT_ENDPOINT       # УРЛ крајње тачке постојећег пројекта
```

### 3.5 Проверите своје променљиве

Користите Azure Developer CLI да прегледате и управљате променљивим окружења:

```bash title="" linenums="0"
# Прикажите све променљиве окружења за тренутно окружење
azd env get-values

# Добијте одређену променљиву окружења
azd env get-value AZURE_ENV_NAME

# Поставите променљиву окружења
azd env set AZURE_LOCATION eastus

# Поставите више променљивих из .env датотеке
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Одрицање одговорности:
Овај документ је преведен помоћу услуге за превођење која користи вештачку интелигенцију — Co-op Translator (https://github.com/Azure/co-op-translator). Иако се трудимо да преводи буду тачни, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произлазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->