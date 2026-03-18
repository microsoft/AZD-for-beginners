# 4. Конфигуришите шаблон

!!! tip "НА КРАЈУ ОВОГ МОДУЛА МОЋИ ЋЕТЕ"

    - [ ] Разумети сврху `azure.yaml`
    - [ ] Разумети структуру `azure.yaml`
    - [ ] Разумети значај azd lifecycle `hooks`
    - [ ] **Лаб 4:** Истражите и измените променљиве окружења

---

!!! prompt "Шта ради датотека `azure.yaml`? Користите блок кода и објасните је ред по ред"

      Датотека `azure.yaml` је **датотека за конфигурацију Azure Developer CLI (azd)**. Она дефинише како ваша апликација треба да буде распоређена на Azure, укључујући инфраструктуру, услуге, скрипте за деплојмент и променљиве окружења.

---

## 1. Сврха и функционалност

Ова датотека `azure.yaml` служи као **план за распоређивање** за апликацију AI агента која:

1. **Валидира окружење** пре распоређивања
2. **Обезбеђује Azure AI услуге** (AI Hub, AI Project, Search, итд.)
3. **Распоређује Python апликацију** на Azure Container Apps
4. **Конфигурише AI моделе** и за функционалност разговора (chat) и за ембедовање (embedding)
5. **Поставља надгледање и праћење** за AI апликацију
6. **Подржава и нове и постојеће** Azure AI пројекте

Датотека омогућава **распоређивање једном командом** (`azd up`) потпуног AI агент решења са одговарајућом валидацијом, провизијом и пост-распоређивањем конфигурације.

??? info "Проширите за преглед: `azure.yaml`"

      Датотека `azure.yaml` одређује како Azure Developer CLI треба да распоређује и управља овом AI Agent апликацијом на Azure. Разложимо је линију по линију.

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

Проћи ћемо кроз датотеку одељак по одељак да бисмо разумели шта ради - и зашто.

### 2.1 **Заглавље и шема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Линија 1**: Обезбеђује валидацију шеме за YAML language server ради подршке у IDE-у и IntelliSense-у

### 2.2 Мета-подаци пројекта (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Линија 5**: Дефинише име пројекта које користи Azure Developer CLI
- **Линије 6-7**: Наводи да се ово заснива на шаблону верзије 1.0.2
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

- **Линије 11-20**: **Пре-распоређивачки хук** - покреће се пре `azd up`

      - На Unix/Linux: Чини скрипт за валидацију извршним и покреће га
      - На Windows: Покреће PowerShell скрипт за валидацију
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
- **Линије 21-30**: **Хук након провизије** - покреће се након што Azure ресурси буду креирани

  - Покреће скрипте које уписују променљиве окружења
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
- **Линије 31-40**: **Хук након деплоја** - покреће се након распоређивања апликације

  - Покреће финалне скрипте за подешавање
  - Наставља чак и ако скрипте не успеју

### 2.4 Конфигурација услуге (41-48)

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

- **Линија 42**: Дефинише сервис именован "api_and_frontend"
- **Линија 43**: Указује на директоријум `./src` за изворни код
- **Линија 44**: Наводи Python као програмски језик
- **Линија 45**: Користи Azure Container Apps као платформу за хостовање
- **Линије 46-48**: Docker конфигурација

      - Користи "api_and_frontend" као име слике
      - Гради Docker слику удаљено у Azure (не локално)

### 2.5 Променљиве pipeline-а (49-76)

Ово су променљиве које вам помажу да користите `azd` у CI/CD пипелинима за аутоматизацију

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

Овај одељак дефинише променљиве окружења које се користе **током распоређивања**, организоване по категоријама:

- **Имена Azure ресурса (Линије 51-60):**
      - Основна имена Azure сервисних ресурса, нпр. Resource Group, AI Hub, AI Project, итд.
- **Флагови функција (Линије 61-63):**
      - Булове променљиве које омогућавају/онемогућавају одређене Azure услуге
- **Конфигурација AI агента (Линије 64-71):**
      - Конфигурација за главни AI агент, укључујући име, ID, подешавања распоређивања и детаље о моделу
- **Конфигурација за AI ембедовање (Линије 72-79):**
      - Конфигурација модела за ембедовање који се користи за векторску претрагу
- **Претрага и надгледање (Линије 80-84):**
      - Име индекса за претрагу, постојећи ID-еви ресурса и подешавања за надгледање/трасирање

---

## 3. Познавање променљивих окружења
Следеће променљиве окружења контролишу конфигурацију и понашање вашег распоређивања, организоване по њиховој примарној сврси. Већина променљивих има разумне подразумеване вредности, али можете их прилагодити да одговарају вашим специфичним захтевима или постојећим Azure ресурсима.

### 3.1 Обавезне променљиве 

```bash title="" linenums="0"
# Основна конфигурација Azure-а
AZURE_ENV_NAME                    # Име окружења (користи се у именовању ресурса)
AZURE_LOCATION                    # Регион распоређивања
AZURE_SUBSCRIPTION_ID             # Циљна претплата
AZURE_RESOURCE_GROUP              # Име групе ресурса
AZURE_PRINCIPAL_ID                # Кориснички налог за RBAC

# Имена ресурса (аутоматски се генеришу ако нису наведена)
AZURE_AIHUB_NAME                  # Име Microsoft Foundry хаба
AZURE_AIPROJECT_NAME              # Име AI пројекта
AZURE_AISERVICES_NAME             # Име налога за AI услуге
AZURE_STORAGE_ACCOUNT_NAME        # Име налога за складиштење
AZURE_CONTAINER_REGISTRY_NAME     # Име регистара контејнера
AZURE_KEYVAULT_NAME               # Име Key Vault-а (ако се користи)
```

### 3.2 Конфигурација модела 
```bash title="" linenums="0"
# Конфигурација модела за ћаскање
AZURE_AI_AGENT_MODEL_NAME         # Подразумевано: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Подразумевано: OpenAI (или Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Подразумевано: најновије доступно
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Име распоређивања за модел ћаскања
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Подразумевано: Стандард
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Подразумевано: 80 (хиљада TPM)

# Конфигурација модела за ембединг
AZURE_AI_EMBED_MODEL_NAME         # Подразумевано: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Подразумевано: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Подразумевано: најновије доступно
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Име распоређивања за ембединг
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Подразумевано: Стандард
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Подразумевано: 50 (хиљада TPM)

# Конфигурација агента
AZURE_AI_AGENT_NAME               # Приказано име агента
AZURE_EXISTING_AGENT_ID           # Користи постојећег агента (опционо)
```

### 3.3 Укључивање функција
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
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Пуни идентификатор ресурса постојећег AI пројекта
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL крајње тачке постојећег пројекта
```

### 3.5 Проверите своје променљиве

Користите Azure Developer CLI за преглед и управљање променљивим окружења:

```bash title="" linenums="0"
# Прикажи све променљиве окружења за тренутно окружење
azd env get-values

# Добиј одређену променљиву окружења
azd env get-value AZURE_ENV_NAME

# Постави променљиву окружења
azd env set AZURE_LOCATION eastus

# Постави више променљивих из .env датотеке
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу услуге машинског превођења [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Изворни документ на свом матичном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране стручног преводиоца. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->