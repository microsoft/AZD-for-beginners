# 4. Конфигуриране на шаблон

!!! tip "В КРАЯ НА ТОЗИ МОДУЛ ЩЕ МОЖЕТЕ"

    - [ ] Разберете предназначението на `azure.yaml`
    - [ ] Разберете структурата на `azure.yaml`
    - [ ] Разберете значението на `hooks` в жизнения цикъл на azd
    - [ ] **Lab 4:** Разгледайте и променете променливите на средата

---

!!! prompt "Какво прави файлът `azure.yaml`? Използвайте блок с код и обяснете ред по ред"

      Файлът `azure.yaml` е **файлът за конфигурация на Azure Developer CLI (azd)**. Той определя как вашето приложение трябва да бъде разположено в Azure, включително инфраструктура, услуги, deployment hooks и променливи на средата.

---

## 1. Цел и функционалност

Този файл `azure.yaml` служи като **план за разгръщане** за приложение на AI агент, което:

1. **Валидира средата** преди разгръщане
2. **Създава необходимите Azure AI услуги** (AI Hub, AI Project, Search и др.)
3. **Разгръща Python приложение** в Azure Container Apps
4. **Конфигурира AI модели** както за чат, така и за embedding функционалност
5. **Настройва мониторинг и трасировка** за AI приложението
6. **Обработва както нови, така и съществуващи** сценарии с Azure AI проект

Файлът позволява **разгръщане с една команда** (`azd up`) на цялостно AI агент решение с правилна валидация, провизиране на ресурси и пост-разгръщна конфигурация.

??? info "Разгънете за преглед: `azure.yaml`"

      Файлът `azure.yaml` определя как Azure Developer CLI трябва да разположи и управлява това AI Agent приложение в Azure. Нека го разгледаме ред по ред.

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

## 2. Разбор на файла

Нека преминем през файла секция по секция, за да разберем какво прави - и защо.

### 2.1 **Header and Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Ред 1**: Осигурява валидация на схема за YAML language server за поддръжка в IDE и IntelliSense

### 2.2 Метаданни на проекта (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Ред 5**: Дефинира името на проекта, използвано от Azure Developer CLI
- **Редове 6-7**: Посочва, че това е базирано на шаблон версия 1.0.2
- **Редове 8-9**: Изисква версия на Azure Developer CLI 1.14.0 или по-нова

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

- **Редове 11-20**: **Hook преди разгръщане** - се изпълнява преди `azd up`

      - На Unix/Linux: Прави скрипта за валидация изпълним и го стартира
      - На Windows: Стартира PowerShell скрипта за валидация
      - И двата са интерактивни и ще спрат разгръщането, ако не успеят

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
- **Редове 21-30**: **Hook след предоставяне** - се изпълнява след като Azure ресурсите са създадени

  - Изпълнява скриптове за записване на променливи на средата
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
- **Редове 31-40**: **Hook след разгръщане** - се изпълнява след разгръщането на приложението

  - Изпълнява финалните скриптове за настройка
  - Продължава дори ако скриптовете се провалят

### 2.4 Service Config (41-48)

Това конфигурира услугата на приложението, което разгръщате.

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
- **Ред 44**: Посочва Python като програмния език
- **Ред 45**: Използва Azure Container Apps като платформа за хостинг
- **Редове 46-48**: Docker конфигурация

      - Използва "api_and_frontend" като име на изображението
      - Сглобява Docker изображението отдалечено в Azure (не локално)

### 2.5 Pipeline Variables (49-76)

Това са променливи, които помагат при изпълнение на `azd` в CI/CD пайплайни за автоматизация

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
      - Основни имена на Azure ресурсите, напр., Resource Group, AI Hub, AI Project и др.
- **Флагове на функции (Редове 61-63)**:
      - Булеви променливи за включване/изключване на специфични Azure услуги
- **Конфигурация на AI агента (Редове 64-71)**:
      - Конфигурация за основния AI агент, включително име, ID, настройки за разгръщане, детайли за модела
- **Конфигурация за AI embedding (Редове 72-79)**:
      - Конфигурация за embedding модела, използван за векторно търсене
- **Търсене и мониторинг (Редове 80-84)**:
      - Име на search индекс, ID-та на съществуващи ресурси и настройки за мониторинг/трасировка

---

## 3. Запознайте се с променливите на средата
Следните променливи на средата контролират конфигурацията и поведението на вашето разгръщане, организирани по основната им цел. Повечето променливи имат разумни стойности по подразбиране, но можете да ги персонализирате, за да отговарят на вашите конкретни изисквания или съществуващи Azure ресурси.

### 3.1 Задължителни променливи 

```bash title="" linenums="0"
# Основна конфигурация на Azure
AZURE_ENV_NAME                    # Име на средата (използва се при именуване на ресурсите)
AZURE_LOCATION                    # Регион за внедряване
AZURE_SUBSCRIPTION_ID             # Целеви абонамент
AZURE_RESOURCE_GROUP              # Име на ресурсната група
AZURE_PRINCIPAL_ID                # Потребителски идентификатор (principal) за RBAC

# Имена на ресурси (Автоматично генерирани, ако не са посочени)
AZURE_AIHUB_NAME                  # Име на Microsoft Foundry хъб
AZURE_AIPROJECT_NAME              # Име на AI проекта
AZURE_AISERVICES_NAME             # Име на акаунт за AI услуги
AZURE_STORAGE_ACCOUNT_NAME        # Име на акаунта за съхранение
AZURE_CONTAINER_REGISTRY_NAME     # Име на контейнерния регистър
AZURE_KEYVAULT_NAME               # Име на Key Vault (ако се използва)
```

### 3.2 Конфигурация на модела 
```bash title="" linenums="0"
# Конфигурация на модел за чат
AZURE_AI_AGENT_MODEL_NAME         # По подразбиране: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # По подразбиране: OpenAI (или Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # По подразбиране: най-новото налично
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Име за разгръщане на чат модела
AZURE_AI_AGENT_DEPLOYMENT_SKU     # По подразбиране: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # По подразбиране: 80 (хиляди TPM)

# Конфигурация на модел за вграждане
AZURE_AI_EMBED_MODEL_NAME         # По подразбиране: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # По подразбиране: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # По подразбиране: най-новото налично
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Име за разгръщане на вградените представяния
AZURE_AI_EMBED_DEPLOYMENT_SKU     # По подразбиране: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # По подразбиране: 50 (хиляди TPM)

# Конфигурация на агент
AZURE_AI_AGENT_NAME               # Показвано име на агента
AZURE_EXISTING_AGENT_ID           # Използвайте съществуващ агент (по избор)
```

### 3.3 Превключване на функции
```bash title="" linenums="0"
# Опционални услуги
USE_APPLICATION_INSIGHTS         # По подразбиране: true
USE_AZURE_AI_SEARCH_SERVICE      # По подразбиране: false
USE_CONTAINER_REGISTRY           # По подразбиране: true

# Мониторинг и проследяване
ENABLE_AZURE_MONITOR_TRACING     # По подразбиране: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # По подразбиране: false

# Конфигурация на търсенето
AZURE_AI_SEARCH_INDEX_NAME       # Име на индекса за търсене
AZURE_SEARCH_SERVICE_NAME        # Име на услугата за търсене
```

### 3.4 Конфигурация на AI проекта 
```bash title="" linenums="0"
# Използване на съществуващи ресурси
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Пълен идентификатор на ресурса на съществуващ ИИ проект
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL на крайна точка на съществуващ проект
```

### 3.5 Проверете вашите променливи

Използвайте Azure Developer CLI, за да прегледате и управлявате вашите променливи на средата:

```bash title="" linenums="0"
# Прегледай всички променливи на средата за текущата среда
azd env get-values

# Вземи конкретна променлива на средата
azd env get-value AZURE_ENV_NAME

# Задай променлива на средата
azd env set AZURE_LOCATION eastus

# Задай няколко променливи от .env файл
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на първоначалния му език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->