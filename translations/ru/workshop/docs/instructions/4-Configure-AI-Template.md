# 4. Настройка шаблона

!!! tip "К КОНЦУ ЭТОГО МОДУЛЯ ВЫ СМОЖЕТЕ"

    - [ ] Понять назначение `azure.yaml`
    - [ ] Понять структуру `azure.yaml`
    - [ ] Понять значение жизненного цикла azd `hooks`
    - [ ] **Лабораторная работа 4:** Исследовать и изменить переменные окружения

---

!!! prompt "Что делает файл `azure.yaml`? Используйте кодовый блок и объясните строку за строкой"

      Файл `azure.yaml` — это **файл конфигурации для Azure Developer CLI (azd)**. Он определяет, как ваше приложение должно развертываться в Azure, включая инфраструктуру, сервисы, хуки для развертывания и переменные окружения.

---

## 1. Назначение и функциональность

Этот файл `azure.yaml` служит **планом развертывания** для приложения AI-агента, которое:

1. **Проверяет окружение** перед развертыванием
2. **Создаёт Azure AI сервисы** (AI Hub, AI Project, Search и др.)
3. **Разворачивает Python-приложение** в Azure Container Apps
4. **Настраивает AI модели** как для чат-функционала, так и для встраивания (embedding)
5. **Настраивает мониторинг и трассировку** для AI-приложения
6. **Обрабатывает как новые, так и существующие** сценарии Azure AI проектов

Файл позволяет выполнить **развертывание одним вызовом** (`azd up`) полного решения AI-агента с правильной проверкой, созданием ресурсов и пост-конфигурацией.

??? info "Развернуть для просмотра: `azure.yaml`"

      Файл `azure.yaml` определяет, как Azure Developer CLI должен развернуть и управлять этим приложением AI-агента в Azure. Давайте разберём его построчно.

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

Давайте пройдемся по файлу по разделам, чтобы понять, что он делает и почему.

### 2.1 **Заголовок и схема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Строка 1**: Обеспечивает валидацию схемы YAML для поддержки IDE и IntelliSense

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

- **Строки 11-20**: **Хук перед развертыванием** — выполняется перед `azd up`

      - В Unix/Linux: делает скрипт проверки переменных окружения исполняемым и запускает его
      - В Windows: запускает PowerShell скрипт проверки
      - Оба интерактивны и остановят развертывание при ошибке

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
- **Строки 21-30**: **Хук после создания ресурсов** — выполняется после создания Azure ресурсов

  - Запускает скрипты записи переменных окружения
  - Продолжает развертывание даже при ошибке (`continueOnError: true`)

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
- **Строки 31-40**: **Хук после развертывания приложения** — выполняется после завершения развертывания

  - Запускает финальные скрипты настройки
  - Продолжает даже при ошибках в скриптах

### 2.4 Конфигурация сервиса (41-48)

Здесь настраивается сервис приложения, который вы развертываете.

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
- **Строка 44**: Задает Python как язык программирования
- **Строка 45**: Использует Azure Container Apps в качестве платформы хостинга
- **Строки 46-48**: Конфигурация Docker

      - Использует имя образа "api_and_frontend"
      - Строит Docker-образ удаленно в Azure (не локально)

### 2.5 Переменные pipeline (49-76)

Это переменные, которые помогут запускать `azd` в CI/CD пайплайнах для автоматизации

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
      - Основные имена ресурсов Azure, например группа ресурсов, AI Hub, AI Project и др.
- **Флаги функций (строки 61-63)**:
      - Булевы переменные для включения/отключения конкретных Azure сервисов
- **Конфигурация AI агента (строки 64-71)**:
      - Настройки главного AI агента, включая имя, ID, параметры развертывания, модели
- **Конфигурация AI встраивания (embedding) (строки 72-79)**:
      - Настройки для модели встраивания, используемой для векторного поиска
- **Поиск и мониторинг (строки 80-84)**:
      - Имя индекса поиска, ID существующих ресурсов, настройки мониторинга и трассировки

---

## 3. Знакомство с переменными окружения
Следующие переменные окружения контролируют конфигурацию и поведение вашего развертывания, организованы в зависимости от основной цели. Большинство переменных имеют разумные значения по умолчанию, но вы можете настроить их под ваши конкретные требования или существующие ресурсы Azure.

### 3.1 Обязательные переменные

```bash title="" linenums="0"
# Основная конфигурация Azure
AZURE_ENV_NAME                    # Имя окружения (используется в именах ресурсов)
AZURE_LOCATION                    # Регион развертывания
AZURE_SUBSCRIPTION_ID             # Целевая подписка
AZURE_RESOURCE_GROUP              # Имя группы ресурсов
AZURE_PRINCIPAL_ID                # Учетная запись пользователя для RBAC

# Имена ресурсов (генерируются автоматически, если не указаны)
AZURE_AIHUB_NAME                  # Имя хаба Microsoft Foundry
AZURE_AIPROJECT_NAME              # Имя проекта ИИ
AZURE_AISERVICES_NAME             # Имя учетной записи сервисов ИИ
AZURE_STORAGE_ACCOUNT_NAME        # Имя учетной записи хранилища
AZURE_CONTAINER_REGISTRY_NAME     # Имя реестра контейнеров
AZURE_KEYVAULT_NAME               # Имя Key Vault (если используется)
```

### 3.2 Конфигурация модели
```bash title="" linenums="0"
# Конфигурация модели чата
AZURE_AI_AGENT_MODEL_NAME         # По умолчанию: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # По умолчанию: OpenAI (или Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # По умолчанию: последняя доступная версия
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Имя развертывания модели чата
AZURE_AI_AGENT_DEPLOYMENT_SKU     # По умолчанию: Стандарт
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # По умолчанию: 80 (тысяч TPM)

# Конфигурация модели встраивания
AZURE_AI_EMBED_MODEL_NAME         # По умолчанию: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # По умолчанию: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # По умолчанию: последняя доступная версия
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Имя развертывания для встраиваний
AZURE_AI_EMBED_DEPLOYMENT_SKU     # По умолчанию: Стандарт
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # По умолчанию: 50 (тысяч TPM)

# Конфигурация агента
AZURE_AI_AGENT_NAME               # Отображаемое имя агента
AZURE_EXISTING_AGENT_ID           # Использовать существующего агента (необязательно)
```

### 3.3 Переключатели функций
```bash title="" linenums="0"
# Опциональные услуги
USE_APPLICATION_INSIGHTS         # По умолчанию: true
USE_AZURE_AI_SEARCH_SERVICE      # По умолчанию: false
USE_CONTAINER_REGISTRY           # По умолчанию: true

# Мониторинг и трассировка
ENABLE_AZURE_MONITOR_TRACING     # По умолчанию: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # По умолчанию: false

# Конфигурация поиска
AZURE_AI_SEARCH_INDEX_NAME       # Имя индекса поиска
AZURE_SEARCH_SERVICE_NAME        # Имя службы поиска
```

### 3.4 Конфигурация AI проекта
```bash title="" linenums="0"
# Использовать существующие ресурсы
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Полный идентификатор ресурса существующего AI проекта
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL конечной точки существующего проекта
```

### 3.5 Проверьте ваши переменные

Используйте Azure Developer CLI для просмотра и управления переменными окружения:

```bash title="" linenums="0"
# Просмотреть все переменные окружения для текущей среды
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
Этот документ был переведен с использованием сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, пожалуйста, учитывайте, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать официальным и достоверным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному переводу, выполненному человеком. Мы не несем ответственности за любые недоразумения или неправильное толкование, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->