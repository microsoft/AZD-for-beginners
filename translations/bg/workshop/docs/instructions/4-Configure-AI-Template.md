# 4. Конфигуриране на шаблон

!!! tip "До края на този модул ще можете"

    - [ ] Разберете целта на `azure.yaml`
    - [ ] Разберете структурата на `azure.yaml`
    - [ ] Разберете значението на lifecycle `hooks` в azd
    - [ ] **Лаборатория 4:** Проучете и модифицирайте променливите на средата

---

!!! prompt "Какво прави файлът `azure.yaml`? Използвайте блок с код и обяснете ред по ред"

      Файлът `azure.yaml` е **конфигурационният файл за Azure Developer CLI (azd)**. Той определя как вашето приложение трябва да бъде разположено в Azure, включително инфраструктура, услуги, hook-ове за разгръщане и променливи на средата.

---

## 1. Цел и функционалност

Този `azure.yaml` файл служи като **план за разгръщане** за приложение с AI агент, което:

1. **Проверява средата** преди разгръщане
2. **Създава ресурси на Azure AI** (AI Hub, AI Project, Search и др.)
3. **Разгръща Python приложение** в Azure Container Apps
4. **Конфигурира AI модели** както за чат, така и за embedding функционалност
5. **Настройва наблюдение и проследяване** за AI приложението
6. **Поддържа както нови, така и съществуващи** сценарии на Azure AI проект

Файлът позволява **разгръщане с една команда** (`azd up`) на пълно AI агентно решение с правилна проверка, създаване на ресурси и последваща конфигурация след разгръщане.

??? info "Разгънете, за да видите: `azure.yaml`"

      Файлът `azure.yaml` определя как Azure Developer CLI да разгръща и управлява това приложение с AI агент в Azure. Нека го разгледаме ред по ред.

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

## 2. Разглобяване на файла

Нека преминем през файла секция по секция, за да разберем какво прави — и защо.

### 2.1 **Хедър и схема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Ред 1**: Осигурява схема за валидиране от YAML language server за поддръжка в IDE и IntelliSense

### 2.2 Проектни метаданни (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Ред 5**: Дефинира името на проекта, използвано от Azure Developer CLI
- **Редове 6-7**: Посочва, че е базиран на шаблон версия 1.0.2
- **Редове 8-9**: Изисква Azure Developer CLI версия 1.14.0 или по-нова

### 2.3 Hook-ове за разгръщане (11-40)

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

- **Редове 11-20**: **Hook преди разгръщане (pre-deployment)** - изпълнява се преди `azd up`

      - На Unix/Linux: Прави валидационния скрипт изпълним и го стартира
      - В Windows: Изпълнява PowerShell валидационния скрипт
      - И в двата случая са интерактивни и ще спрат разгръщането, ако не успеят

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
- **Редове 21-30**: **Hook след осигуряване на ресурси (post-provision)** - изпълнява се след като Azure ресурсите са създадени

  - Изпълнява скриптове за записване на променливите на средата
  - Продължава разгръщането дори ако тези скриптове се провалят (`continueOnError: true`)

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
- **Редове 31-40**: **Hook след разгръщане (post-deploy)** - изпълнява се след разгръщането на приложението

  - Изпълнява финални скриптове за настройка
  - Продължава дори ако скриптовете се провалят

### 2.4 Конфигурация на услугата (41-48)

Това конфигурира услугата на приложението, която разгръщате.

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

- **Ред 42**: Дефинира услуга с име "api_and_frontend"
- **Ред 43**: Посочва директорията `./src` за изходния код
- **Ред 44**: Определя Python като програмния език
- **Ред 45**: Използва Azure Container Apps като хостинг платформа
- **Редове 46-48**: Docker конфигурация

      - Използва "api_and_frontend" като име на изображение
      - Компилира Docker изображението отдалечено в Azure (не локално)

### 2.5 Променливи на pipeline-а (49-76)

Това са променливи, които помагат при изпълнението на `azd` в CI/CD pipeline-и за автоматизация

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

Този раздел дефинира променливи на средата, използвани **по време на разгръщане**, организирани по категории:

- **Имена на Azure ресурси (Редове 51-60)**:
      - Основните имена на Azure услуги, напр., Resource Group, AI Hub, AI Project и др.
- **Флагове за функции (Редове 61-63)**:
      - Булеви променливи за включване/изключване на конкретни Azure услуги
- **Конфигурация на AI агента (Редове 64-71)**:
      - Конфигурация за основния AI агент, включително име, ID, настройки за разгръщане, подробности за модела
- **Конфигурация на AI embedding (Редове 72-79)**:
      - Конфигурация за модела за embedding, използван за векторно търсене
- **Търсене и наблюдение (Редове 80-84)**:
      - Име на индекс за търсене, ID-та на съществуващи ресурси и настройки за наблюдение/проследяване

---

## 3. Запознайте се с променливите на средата
Следните променливи на средата контролират конфигурацията и поведението на вашето разгръщане, организирани според тяхното основно предназначение. Повечето променливи имат разумни стойности по подразбиране, но можете да ги персонализирате, за да съответстват на вашите конкретни изисквания или съществуващи Azure ресурси.

### 3.1 Задължителни променливи 

```bash title="" linenums="0"
# Основна конфигурация на Azure
AZURE_ENV_NAME                    # Име на средата (използва се при именуване на ресурси)
AZURE_LOCATION                    # Регион за разполагане
AZURE_SUBSCRIPTION_ID             # Целеви абонамент
AZURE_RESOURCE_GROUP              # Име на ресурсна група
AZURE_PRINCIPAL_ID                # Потребителски принципал за RBAC

# Имена на ресурси (генерират се автоматично, ако не са посочени)
AZURE_AIHUB_NAME                  # Име на хъб на Microsoft Foundry
AZURE_AIPROJECT_NAME              # Име на проект за ИИ
AZURE_AISERVICES_NAME             # Име на акаунт за ИИ услуги
AZURE_STORAGE_ACCOUNT_NAME        # Име на акаунт за съхранение
AZURE_CONTAINER_REGISTRY_NAME     # Име на регистър за контейнери
AZURE_KEYVAULT_NAME               # Име на Key Vault (ако се използва)
```

### 3.2 Конфигурация на модела 
```bash title="" linenums="0"
# Конфигурация на чат модел
AZURE_AI_AGENT_MODEL_NAME         # По подразбиране: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # По подразбиране: OpenAI (или Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # По подразбиране: най-новата налична
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Име на разгръщане за чат модела
AZURE_AI_AGENT_DEPLOYMENT_SKU     # По подразбиране: Стандартен
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # По подразбиране: 80 (хиляди TPM)

# Конфигурация на модел за вграждане
AZURE_AI_EMBED_MODEL_NAME         # По подразбиране: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # По подразбиране: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # По подразбиране: най-новата налична
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Име на разгръщане за вграждания
AZURE_AI_EMBED_DEPLOYMENT_SKU     # По подразбиране: Стандартен
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # По подразбиране: 50 (хиляди TPM)

# Конфигурация на агент
AZURE_AI_AGENT_NAME               # Показвано име на агента
AZURE_EXISTING_AGENT_ID           # Използвайте съществуващ агент (по избор)
```

### 3.3 Флагове за функции
```bash title="" linenums="0"
# Незадължителни услуги
USE_APPLICATION_INSIGHTS         # По подразбиране: включено
USE_AZURE_AI_SEARCH_SERVICE      # По подразбиране: изключено
USE_CONTAINER_REGISTRY           # По подразбиране: включено

# Наблюдение и проследяване
ENABLE_AZURE_MONITOR_TRACING     # По подразбиране: изключено
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # По подразбиране: изключено

# Конфигурация за търсене
AZURE_AI_SEARCH_INDEX_NAME       # Име на индекса за търсене
AZURE_SEARCH_SERVICE_NAME        # Име на услугата за търсене
```

### 3.4 Конфигурация на AI проекта 
```bash title="" linenums="0"
# Използване на съществуващи ресурси
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Пълен идентификатор на ресурса на съществуващ AI проект
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL на крайна точка на съществуващ проект
```

### 3.5 Проверете вашите променливи

Използвайте Azure Developer CLI, за да прегледате и управлявате променливите на средата си:

```bash title="" linenums="0"
# Преглед на всички променливи на средата в текущата среда
azd env get-values

# Получаване на конкретна променлива на средата
azd env get-value AZURE_ENV_NAME

# Задаване на променлива на средата
azd env set AZURE_LOCATION eastus

# Задаване на множество променливи от .env файл
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не поемаме отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->