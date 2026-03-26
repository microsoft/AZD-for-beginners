# 4. Налаштування шаблону

!!! tip "НА КІНЕЦЬ ЦЬОГО МОДУЛЯ ВИ БУДЕТЕ МОГТИ"

    - [ ] Зрозуміти призначення `azure.yaml`
    - [ ] Зрозуміти структуру `azure.yaml`
    - [ ] Зрозуміти цінність lifecycle `hooks` в azd
    - [ ] **Лабораторна робота 4:** Вивчити та модифікувати змінні середовища

---

!!! prompt "Що робить файл `azure.yaml`? Використайте кодову вставку та поясніть рядок за рядком"

      Файл `azure.yaml` — це **конфігураційний файл для Azure Developer CLI (azd)**. Він визначає, як ваша програма повинна бути розгорнута в Azure, включно з інфраструктурою, сервісами, хуками розгортання та змінними середовища.

---

## 1. Призначення та функціональність

Цей файл `azure.yaml` слугує як **план розгортання** для AI-агенту, який:

1. **Перевіряє середовище** перед розгортанням
2. **Створює ресурси Azure AI** (AI Hub, AI Project, Search тощо)
3. **Розгортає Python-застосунок** в Azure Container Apps
4. **Налаштовує AI-моделі** для чатового та вбудованого функціоналу
5. **Встановлює моніторинг і трасування** для AI-застосунку
6. **Обробляє як нові, так і існуючі** сценарії Azure AI проектів

Файл дає змогу здійснювати **розгортання в один крок** (`azd up`) повного рішення AI агента з належною перевіркою, створенням ресурсів та післярозгортковими налаштуваннями.

??? info "Розгорнутий перегляд: `azure.yaml`"

      Файл `azure.yaml` визначає, як Azure Developer CLI має розгортати та керувати цим додатком AI агенту в Azure. Розглянемо його рядок за рядком.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: чи потрібні нам хуки? 
      # TODO: чи потрібні всі змінні?

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

Розглянемо файл по секціях, щоб зрозуміти що він робить і навіщо.

### 2.1 **Заголовок та схема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Рядок 1**: Забезпечує валідацію схеми YAML для підтримки IDE та IntelliSense

### 2.2 Метадані проекту (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Рядок 5**: Визначає ім’я проекту, яке використовує Azure Developer CLI
- **Рядки 6-7**: Вказує, що цей файл базується на шаблоні версії 1.0.2
- **Рядки 8-9**: Вимагає версію Azure Developer CLI 1.14.0 або вище

### 2.3 Хуки розгортання (11-40)

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

- **Рядки 11-20**: **Прехук (pre-deployment hook)** – виконується перед `azd up`

      - В Unix/Linux: надає виконувані права для скрипту валідації і запускає його
      - В Windows: запускає PowerShell скрипт валідації
      - Обидва інтерактивні та зупиняють розгортання у разі помилки

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
- **Рядки 21-30**: **Пост-хук після створення ресурсів (post-provision hook)** – виконується після створення ресурсів Azure

  - Виконує скрипти для запису змінних середовища
  - Розгортання продовжується навіть у разі помилки скриптів (`continueOnError: true`)

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
- **Рядки 31-40**: **Пост-хук після розгортання (post-deploy hook)** – виконується після розгортання додатку

  - Виконує фінальні налаштувальні скрипти
  - Розгортання продовжується навіть при помилках у скриптах

### 2.4 Конфігурація сервісу (41-48)

Цей розділ налаштовує сервіс застосунку, який ви розгортаєте.

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

- **Рядок 42**: Визначає сервіс з ім’ям "api_and_frontend"
- **Рядок 43**: Вказує директорію `./src` для вихідного коду
- **Рядок 44**: Задає мову програмування Python
- **Рядок 45**: Використовує Azure Container Apps як платформу хостингу
- **Рядки 46-48**: Налаштування Docker

      - Вказано ім’я Docker-образу "api_and_frontend"
      - Збірка образу виконується віддалено в Azure (не локально)

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

Цей розділ визначає змінні середовища, які використовуються **під час розгортання**, організовані по категоріях:

- **Назви ресурсів Azure (рядки 51-60)**:
      - Основні назви сервісних ресурсів Azure, наприклад група ресурсів, AI Hub, AI Project тощо
- **Фічер-флаги (рядки 61-63)**:
      - Булеві змінні для увімкнення/вимкнення конкретних сервісів Azure
- **Конфігурація AI агента (рядки 64-71)**:
      - Налаштування основного AI агента включно з іменем, ідентифікатором, параметрами розгортання, деталями моделі
- **Конфігурація вбудованої моделі (рядки 72-79)**:
      - Конфігурація для вбудованої моделі, яка використовується для векторного пошуку
- **Пошук і моніторинг (рядки 80-84)**:
      - Назва індексу пошуку, ідентифікатори існуючих ресурсів, а також налаштування моніторингу/трасування

---

## 3. Ознайомлення зі змінними середовища
Наступні змінні середовища керують конфігурацією та поведінкою вашого розгортання, організовані за основним призначенням. Більшість змінних мають сенсові значення за замовчуванням, але ви можете налаштувати їх під ваші конкретні потреби або існуючі ресурси Azure.

### 3.1 Обов’язкові змінні 

```bash title="" linenums="0"
# Основна конфігурація Azure
AZURE_ENV_NAME                    # Назва середовища (використовується у найменуванні ресурсів)
AZURE_LOCATION                    # Регіон розгортання
AZURE_SUBSCRIPTION_ID             # Цільова підписка
AZURE_RESOURCE_GROUP              # Назва групи ресурсів
AZURE_PRINCIPAL_ID                # Користувацький обліковий запис для RBAC

# Імена ресурсів (генеруються автоматично, якщо не вказані)
AZURE_AIHUB_NAME                  # Назва хаба Microsoft Foundry
AZURE_AIPROJECT_NAME              # Назва проекту AI
AZURE_AISERVICES_NAME             # Назва облікового запису сервісів AI
AZURE_STORAGE_ACCOUNT_NAME        # Назва облікового запису зберігання
AZURE_CONTAINER_REGISTRY_NAME     # Назва контейнерного реєстру
AZURE_KEYVAULT_NAME               # Назва Key Vault (якщо використовується)
```

### 3.2 Конфігурація моделі 
```bash title="" linenums="0"
# Конфігурація моделі чату
AZURE_AI_AGENT_MODEL_NAME         # За замовчуванням: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # За замовчуванням: OpenAI (або Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # За замовчуванням: остання доступна
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Назва розгортання для моделі чату
AZURE_AI_AGENT_DEPLOYMENT_SKU     # За замовчуванням: Стандарт
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # За замовчуванням: 80 (тисяч TPM)

# Конфігурація моделі ембеддінгу
AZURE_AI_EMBED_MODEL_NAME         # За замовчуванням: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # За замовчуванням: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # За замовчуванням: остання доступна
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Назва розгортання для ембеддінгів
AZURE_AI_EMBED_DEPLOYMENT_SKU     # За замовчуванням: Стандарт
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # За замовчуванням: 50 (тисяч TPM)

# Конфігурація агента
AZURE_AI_AGENT_NAME               # Відображуване ім’я агента
AZURE_EXISTING_AGENT_ID           # Використовувати існуючого агента (опційно)
```

### 3.3 Перемикач функцій
```bash title="" linenums="0"
# Необов’язкові служби
USE_APPLICATION_INSIGHTS         # За замовчуванням: true
USE_AZURE_AI_SEARCH_SERVICE      # За замовчуванням: false
USE_CONTAINER_REGISTRY           # За замовчуванням: true

# Моніторинг і трасування
ENABLE_AZURE_MONITOR_TRACING     # За замовчуванням: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # За замовчуванням: false

# Конфігурація пошуку
AZURE_AI_SEARCH_INDEX_NAME       # Назва індексу пошуку
AZURE_SEARCH_SERVICE_NAME        # Назва служби пошуку
```

### 3.4 Конфігурація AI проекту 
```bash title="" linenums="0"
# Використання існуючих ресурсів
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Повний ідентифікатор ресурсу існуючого AI-проєкту
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL кінцевої точки існуючого проєкту
```

### 3.5 Перевірте свої змінні

Використовуйте Azure Developer CLI для перегляду та керування змінними середовища:

```bash title="" linenums="0"
# Переглянути всі змінні середовища для поточного середовища
azd env get-values

# Отримати конкретну змінну середовища
azd env get-value AZURE_ENV_NAME

# Встановити змінну середовища
azd env set AZURE_LOCATION eastus

# Встановити кілька змінних зі файлу .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ його рідною мовою слід вважати авторитетним джерелом. Для важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають у результаті використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->