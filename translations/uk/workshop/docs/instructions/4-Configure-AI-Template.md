# 4. Налаштування шаблону

!!! tip "НА КІНЕЦЬ ЦЬОГО МОДУЛЮ ВИ ЗМОЖЕТЕ"

    - [ ] Зрозуміти призначення файлу `azure.yaml`
    - [ ] Зрозуміти структуру файлу `azure.yaml`
    - [ ] Зрозуміти цінність життєвого циклу azd `hooks`
    - [ ] **Лабораторна робота 4:** Вивчення та модифікація змінних середовища

---

!!! prompt "Що робить файл `azure.yaml`? Використайте кодове поле і поясніть його рядок за рядком"

      Файл `azure.yaml` є **файлом конфігурації для Azure Developer CLI (azd)**, у якому визначено, як повинна бути розгорнута ваша програма в Azure, включно з інфраструктурою, сервісами, хуками розгортання та змінними середовища.

---

## 1. Призначення та функціональність

Файл `azure.yaml` слугує як **план розгортання** додатка AI-агента, який:

1. **Перевіряє середовище** перед розгортанням
2. **Створює служби Azure AI** (AI Hub, AI Project, Search тощо)
3. **Розгортає Python-додаток** в Azure Container Apps
4. **Налаштовує AI-моделі** для чатів і функції embedding
5. **Налаштовує моніторинг і трасування** для AI-додатка
6. **Підтримує як нові, так і існуючі** сценарії Azure AI проекту

Файл дозволяє здійснити **розгортання одним рядком** (`azd up`) повного рішення AI-агента з коректною перевіркою, створенням ресурсів і післярозгортковою конфігурацією.

??? info "Розгорнути для перегляду: `azure.yaml`"

      Файл `azure.yaml` визначає, як Azure Developer CLI має розгортати та керувати цим AI-Агент додатком в Azure. Розберімо його рядок за рядком.

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

## 2. Розбір файлу

Пройдемося по секціях файлу, щоб зрозуміти що і чому він робить.

### 2.1 **Заголовок та схема (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Рядок 1**: Забезпечує валідацію схеми для YAML language server, підтримку IDE та IntelliSense

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

- **Рядки 11-20**: **Хук перед розгортанням** – виконується перед `azd up`

      - На Unix/Linux: робить скрипт перевірки змінних середовища виконуваним і запускає його
      - На Windows: запускає PowerShell-скрипт перевірки
      - Обидва інтерактивні та припиняють розгортання у разі відмови

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
- **Рядки 21-30**: **Хук після створення ресурсів** – виконується після створення ресурсів Azure

  - Виконує скрипти запису змінних середовища
  - Продовжує розгортання, навіть якщо скрипти не вдаються (`continueOnError: true`)

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
- **Рядки 31-40**: **Хук після розгортання** – виконується після розгортання додатка

  - Виконує фінальні налаштувальні скрипти
  - Продовжує, навіть якщо скрипти зазнають помилки

### 2.4 Конфігурація сервісу (41-48)

Це конфігурує сервіс додатку, який ви розгортаєте.

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

- **Рядок 42**: Визначає сервіс з ім'ям "api_and_frontend"
- **Рядок 43**: Вказує директорію `./src` зі вихідним кодом
- **Рядок 44**: Вказує мову програмування Python
- **Рядок 45**: Використовує Azure Container Apps як платформу хостингу
- **Рядки 46-48**: Конфігурація Docker

      - Використовується ім'я образу "api_and_frontend"
      - Збірка Docker-образу відбувається на віддаленому сервері Azure (не локально)

### 2.5 Змінні пайплайну (49-76)

Ці змінні допомагають запускати `azd` у CI/CD пайплайнах для автоматизації

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

Цей розділ визначає змінні середовища, які використовуються **під час розгортання**, організовані за категоріями:

- **Назви ресурсів Azure (рядки 51-60)**:
      - Назви основних ресурсів Azure, напр. Resource Group, AI Hub, AI Project і т.д.
- **Фічеві прапорці (рядки 61-63)**:
      - Булеві змінні для ввімкнення/вимкнення конкретних сервісів Azure
- **Конфігурація AI Агенту (рядки 64-71)**:
      - Налаштування головного AI агенту, включно з іменем, ID, налаштуванням розгортання, моделями
- **Конфігурація AI Embedding (рядки 72-79)**:
      - Налаштування embedding-моделі для векторного пошуку
- **Пошук і моніторинг (рядки 80-84)**:
      - Назва індексу пошуку, ID існуючих ресурсів і налаштування моніторингу/трасування

---

## 3. Знайомство зі змінними середовища
Наступні змінні середовища контролюють конфігурацію та поведінку вашого розгортання, організовані за основною метою. Більшість змінних мають розумні значення за замовчуванням, але ви можете налаштувати їх відповідно до ваших потреб чи існуючих ресурсів Azure.

### 3.1 Обов’язкові змінні 

```bash title="" linenums="0"
# Основна конфігурація Azure
AZURE_ENV_NAME                    # Назва середовища (використовується в іменах ресурсів)
AZURE_LOCATION                    # Регіон розгортання
AZURE_SUBSCRIPTION_ID             # Цільова підписка
AZURE_RESOURCE_GROUP              # Назва групи ресурсів
AZURE_PRINCIPAL_ID                # Основний користувач для RBAC

# Назви ресурсів (генеруються автоматично, якщо не вказані)
AZURE_AIHUB_NAME                  # Назва хаба Microsoft Foundry
AZURE_AIPROJECT_NAME              # Назва AI-проєкту
AZURE_AISERVICES_NAME             # Назва облікового запису AI-сервісів
AZURE_STORAGE_ACCOUNT_NAME        # Назва облікового запису сховища
AZURE_CONTAINER_REGISTRY_NAME     # Назва реєстру контейнерів
AZURE_KEYVAULT_NAME               # Назва Key Vault (якщо використовується)
```

### 3.2 Конфігурація моделей 
```bash title="" linenums="0"
# Конфігурація моделі чатів
AZURE_AI_AGENT_MODEL_NAME         # За замовчуванням: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # За замовчуванням: OpenAI (або Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # За замовчуванням: остання доступна
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Назва розгортання для моделі чатів
AZURE_AI_AGENT_DEPLOYMENT_SKU     # За замовчуванням: Стандарт
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # За замовчуванням: 80 (тисяч TPM)

# Конфігурація моделі вбудовування
AZURE_AI_EMBED_MODEL_NAME         # За замовчуванням: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # За замовчуванням: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # За замовчуванням: остання доступна
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Назва розгортання для вбудовувань
AZURE_AI_EMBED_DEPLOYMENT_SKU     # За замовчуванням: Стандарт
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # За замовчуванням: 50 (тисяч TPM)

# Конфігурація агента
AZURE_AI_AGENT_NAME               # Відображуване ім'я агента
AZURE_EXISTING_AGENT_ID           # Використовувати існуючого агента (необов’язково)
```

### 3.3 Увімкнення/вимкнення функцій
```bash title="" linenums="0"
# Додаткові послуги
USE_APPLICATION_INSIGHTS         # За замовчуванням: так
USE_AZURE_AI_SEARCH_SERVICE      # За замовчуванням: ні
USE_CONTAINER_REGISTRY           # За замовчуванням: так

# Моніторинг і трасування
ENABLE_AZURE_MONITOR_TRACING     # За замовчуванням: ні
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # За замовчуванням: ні

# Конфігурація пошуку
AZURE_AI_SEARCH_INDEX_NAME       # Назва індексу пошуку
AZURE_SEARCH_SERVICE_NAME        # Назва служби пошуку
```

### 3.4 Конфігурація AI проекту 
```bash title="" linenums="0"
# Використовувати наявні ресурси
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Повний ідентифікатор ресурсу наявного AI проекту
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL кінцевої точки наявного проекту
```

### 3.5 Перевірте свої змінні

Використовуйте Azure Developer CLI для перегляду та керування змінними середовища:

```bash title="" linenums="0"
# Переглянути всі змінні середовища для поточного оточення
azd env get-values

# Отримати конкретну змінну середовища
azd env get-value AZURE_ENV_NAME

# Встановити змінну середовища
azd env set AZURE_LOCATION eastus

# Встановити декілька змінних з файлу .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або помилки, які виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->