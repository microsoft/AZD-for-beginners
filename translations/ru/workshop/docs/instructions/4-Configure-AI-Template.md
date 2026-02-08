# 4. Настройка шаблона

!!! tip "К КОНЦУ ЭТОГО МОДУЛЯ ВЫ СМОЖЕТЕ"

    - [ ] Понять назначение `azure.yaml`
    - [ ] Понять структуру `azure.yaml`
    - [ ] Понять значение жизненного цикла azd `hooks`
    - [ ] **Лабораторная работа 4:** Изучить и изменить переменные окружения

---

!!! prompt "Что делает файл `azure.yaml`? Используйте блок кода и объясните построчно"

      Файл `azure.yaml` — это **конфигурационный файл для Azure Developer CLI (azd)**. Он определяет, как ваше приложение будет развернуто в Azure, включая инфраструктуру, сервисы, хуки развертывания и переменные окружения.

---

## 1. Назначение и функциональность

Этот файл `azure.yaml` служит в качестве **плана развертывания** для приложения AI агента, который:

1. **Проверяет окружение** перед развертыванием
2. **Создает службы Azure AI** (AI Hub, AI Project, Search и др.)
3. **Разворачивает Python-приложение** в Azure Container Apps
4. **Настраивает AI модели** для работы с чатом и функцией встраивания
5. **Настраивает мониторинг и трассировку** для AI приложения
6. **Поддерживает как новый, так и существующий** Azure AI проект

Файл позволяет выполнить **развертывание одной командой** (`azd up`) комплексного решения AI агента с проверкой, созданием ресурсов и пост-развертывательной конфигурацией.

??? info "Развернуть для просмотра: `azure.yaml`"

      Файл `azure.yaml` определяет, как Azure Developer CLI должен развертывать и управлять этим AI агентом в Azure. Давайте разберем его построчно.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: нужны ли хуки?
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

Пройдемся по файлу секция за секцией, чтобы понять, что он делает и зачем.

### 2.1 **Заголовок и схема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Строка 1**: Обеспечивает валидацию схемы для YAML сервера в IDE и IntelliSense

### 2.2 Метаданные проекта (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Строка 5**: Определяет имя проекта, используемое Azure Developer CLI
- **Строки 6-7**: Указывает, что используется шаблон версии 1.0.2
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

- **Строки 11-20**: **Хук перед развертыванием** — выполняется перед `azd up`

      - В Unix/Linux: делает скрипт проверки исполняемым и запускает его
      - В Windows: запускает PowerShell скрипт проверки
      - Оба интерактивные и остановят развертывание при неудаче

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
- **Строки 21-30**: **Хук после создания ресурсов** — выполняется после создания ресурсов Azure

  - Выполняет скрипты записи переменных окружения
  - Продолжает развертывание даже если скрипты завершились ошибкой (`continueOnError: true`)

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
- **Строки 31-40**: **Хук после развертывания** — выполняется после развёртывания приложения

  - Выполняет финальные скрипты настройки
  - Продолжает выполнение даже при ошибках

### 2.4 Конфигурация сервиса (41-48)

Здесь определяется сервис приложения, который вы развертываете.

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
- **Строка 43**: Указывает директорию `./src` с исходным кодом
- **Строка 44**: Указывает язык программирования – Python
- **Строка 45**: Хостинг на платформе Azure Container Apps
- **Строки 46-48**: Конфигурация Docker

      - Используется образ с именем "api_and_frontend"
      - Сборка Docker-образа происходит удаленно в Azure (не локально)

### 2.5 Переменные пайплайна (49-76)

Эти переменные помогают запускать `azd` в CI/CD пайплайнах для автоматизации

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

Этот раздел определяет переменные окружения, которые используются **во время развертывания**, организованные по категориям:

- **Имена ресурсов Azure (строки 51-60)**:
      - Имена основных ресурсов Azure, например, группа ресурсов, AI Hub, AI Project и т.д.
- **Флаги функций (строки 61-63)**:
      - Булевы переменные для включения/выключения конкретных сервисов Azure
- **Конфигурация AI агента (строки 64-71)**:
      - Настройки основного AI агента включая имя, ID, параметры развертывания, данные модели
- **Конфигурация AI эмбеддинга (строки 72-79)**:
      - Настройки модели эмбеддинга, используемой для векторного поиска
- **Поиск и мониторинг (строки 80-84)**:
      - Имя поискового индекса, ID существующих ресурсов, настройки мониторинга и трассировки

---

## 3. Знакомство с переменными окружения
Следующие переменные окружения контролируют конфигурацию и поведение вашего развертывания, организованные по основной цели. Большинство переменных имеют разумные значения по умолчанию, но вы можете настроить их под свои конкретные требования или существующие ресурсы Azure.

### 3.1 Обязательные переменные 

```bash title="" linenums="0"
# Основная конфигурация Azure
AZURE_ENV_NAME                    # Имя окружения (используется в именах ресурсов)
AZURE_LOCATION                    # Регион развертывания
AZURE_SUBSCRIPTION_ID             # Целевая подписка
AZURE_RESOURCE_GROUP              # Имя группы ресурсов
AZURE_PRINCIPAL_ID                # Основной пользователь для RBAC

# Имена ресурсов (генерируются автоматически, если не указаны)
AZURE_AIHUB_NAME                  # Имя узла Microsoft Foundry
AZURE_AIPROJECT_NAME              # Имя AI-проекта
AZURE_AISERVICES_NAME             # Имя учетной записи AI-сервисов
AZURE_STORAGE_ACCOUNT_NAME        # Имя учетной записи хранилища
AZURE_CONTAINER_REGISTRY_NAME     # Имя реестра контейнеров
AZURE_KEYVAULT_NAME               # Имя Key Vault (если используется)
```

### 3.2 Конфигурация модели 
```bash title="" linenums="0"
# Конфигурация модели чата
AZURE_AI_AGENT_MODEL_NAME         # По умолчанию: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # По умолчанию: OpenAI (или Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # По умолчанию: самая последняя доступная
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Имя развертывания для модели чата
AZURE_AI_AGENT_DEPLOYMENT_SKU     # По умолчанию: Стандарт
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # По умолчанию: 80 (тысяч TPM)

# Конфигурация модели эмбеддингов
AZURE_AI_EMBED_MODEL_NAME         # По умолчанию: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # По умолчанию: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # По умолчанию: самая последняя доступная
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Имя развертывания для эмбеддингов
AZURE_AI_EMBED_DEPLOYMENT_SKU     # По умолчанию: Стандарт
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # По умолчанию: 50 (тысяч TPM)

# Конфигурация агента
AZURE_AI_AGENT_NAME               # Отображаемое имя агента
AZURE_EXISTING_AGENT_ID           # Использовать существующего агента (опционально)
```

### 3.3 Переключатели функций
```bash title="" linenums="0"
# Дополнительные услуги
USE_APPLICATION_INSIGHTS         # По умолчанию: true
USE_AZURE_AI_SEARCH_SERVICE      # По умолчанию: false
USE_CONTAINER_REGISTRY           # По умолчанию: true

# Мониторинг и трассировка
ENABLE_AZURE_MONITOR_TRACING     # По умолчанию: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # По умолчанию: false

# Конфигурация поиска
AZURE_AI_SEARCH_INDEX_NAME       # Имя поискового индекса
AZURE_SEARCH_SERVICE_NAME        # Имя поискового сервиса
```

### 3.4 Конфигурация AI проекта 
```bash title="" linenums="0"
# Использовать существующие ресурсы
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Полный идентификатор ресурса существующего проекта ИИ
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL конечной точки существующего проекта
```

### 3.5 Проверьте свои переменные

Используйте Azure Developer CLI, чтобы просмотреть и управлять переменными окружения:

```bash title="" linenums="0"
# Просмотреть все переменные окружения для текущего окружения
azd env get-values

# Получить конкретную переменную окружения
azd env get-value AZURE_ENV_NAME

# Установить переменную окружения
azd env set AZURE_LOCATION eastus

# Установить несколько переменных из файла .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, просим учитывать, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется использовать профессиональный перевод, выполненный человеком. Мы не несем ответственности за любые недоразумения или ошибки в толковании, возникающие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->