# Ваш первый проект — Практическое руководство

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Предыдущая**: [Установка и настройка](installation.md)
- **➡️ Следующая**: [Принесите собственное приложение](bring-your-own-app.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом на ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Введение

Добро пожаловать в ваш первый проект с Azure Developer CLI! Вы развернете приложение для списка дел с фронтендом на React, API на Node.js и базой данных Azure Cosmos DB. Шаблон сохраняет историческое имя `todo-nodejs-mongo`; его текущая инфраструктура использует Cosmos DB для NoSQL, поэтому изучайте загруженные README и `infra/` вместо того, чтобы делать выводы об API базы данных по имени.

> Проверено на соответствие с `azd 1.37.2` и публичным шаблоном в ноябре 2026 года. Примеры ниже используют Bash; для извлечения JSON также требуется `jq`. Развертывания в Azure оплачиваются и не выполнялись при проверке.

## Цели обучения

Пройдя этот урок, вы:
- Освоите процесс инициализации проекта azd с использованием шаблонов
- Поймете структуру проектов Azure Developer CLI и файлы конфигурации
- Выполните полное развертывание приложения в Azure с созданием инфраструктуры
- Реализуете стратегии обновления приложения и повторного развертывания
- Научитесь управлять несколькими окружениями для разработки и тестирования
- Примените практики очистки ресурсов и управления затратами

## Результаты обучения

После завершения вы сможете:
- Самостоятельно инициализировать и настраивать проекты azd из шаблонов
- Эффективно ориентироваться и изменять структуру проектов azd
- Разворачивать полнофункциональные приложения в Azure одной командой
- Устранять распространённые проблемы с развертыванием и аутентификацией
- Управлять несколькими Azure-окружениями для разных этапов развертывания
- Реализовывать непрерывные workflows для обновления приложений

## Начало работы

### Список требований
- ✅ Установлен Azure Developer CLI ([Руководство по установке](installation.md))
- ✅ Аутентификация AZD выполнена через `azd auth login`
- ✅ Git установлен в вашей системе
- ✅ Node.js 22 LTS (или поддерживаемая версия, требуемая шаблоном)
- ✅ Visual Studio Code (рекомендуется)

Перед продолжением запустите проверку настройки из корня репозитория:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Проверьте свою установку
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Проверьте необязательную аутентификацию Azure CLI

```bash
az account show
```

### Проверьте версию Node.js
```bash
node --version
```

## Шаг 1: Выберите и инициализируйте шаблон

Начнем с популярного шаблона приложения для списка дел с фронтендом на React и API на Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Что только что произошло?
- Скачан код шаблона в локальный каталог
- Создан файл `azure.yaml` с определениями сервисов
- Настроен код инфраструктуры в каталоге `infra/`
- Создана конфигурация окружения

## Шаг 2: Изучите структуру проекта

Давайте посмотрим, что azd создал для нас:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Вы должны увидеть:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Основные файлы для понимания

**azure.yaml** – Сердце вашего проекта azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** – Определение инфраструктуры:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Шаг 3: Настройте проект (по желанию)

Перед развертыванием вы можете настроить приложение:

### Измените фронтенд
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Сделайте простое изменение:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Настройте переменные окружения
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Эти два пользовательских значения демонстрируют только локальное хранение. Шаблон по умолчанию не использует `WEBSITE_TITLE` или `API_VERSION`, поэтому они не изменяют приложение. Явное редактирование исходника выше изменяет отображаемый заголовок.

## Шаг 4: Разверните в Azure

Пора к интересному — разверните всё в Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Что происходит во время развертывания?

Workflow создает инфраструктуру и упаковывает/разворачивает код. Точный порядок можно настроить через `workflows.up` в `azure.yaml`; этот шаблон указывает сначала provision, затем deploy. Не полагайтесь на универсальный порядок для всех шаблонов.

### Ожидаемый вывод
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Шаг 5: Проверьте ваше приложение

### Доступ к приложению
Нажмите на URL из вывода развертывания или получите его в любое время:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Проверьте приложение списка дел
1. **Добавьте задачу** — нажмите "Add Todo" и введите задание
2. **Отметьте выполненное** — отметьте завершенные задачи
3. **Удалите задачи** — удаляйте ненужные дела

### Мониторинг приложения
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Подтвердите развертывание

Перед продолжением быстро проверьте, что всё действительно работает — не считайте "deploy succeeded" равным "приложение работает":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Развертывание подтверждается, если:**
- ✅ `azd show` показывает достижимый URL-эндпоинта
- ✅ URL открывается в браузере без ошибок
- ✅ Основные функции работают (добавление/завершение/удаление задачи)
- ✅ `azd monitor --logs` показывает приходящие запросы без неожиданных ошибок

Если что-то не так, перейдите к [Главе 7: Устранение неполадок](../chapter-07-troubleshooting/README.md).

## Шаг 6: Внесите изменения и повторно разверните

Давайте внесем изменение и посмотрим, как легко обновить:

### Измените API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Добавьте пользовательский заголовок ответа:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Разверните только изменения кода
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Шаг 7: Управление несколькими окружениями

Создайте staging-окружение для тестирования изменений перед продакшеном:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Сравнение окружений
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Шаг 8: Очистка ресурсов

Когда закончите эксперименты, очиститесь, чтобы избежать постоянных затрат:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Классическое приложение vs. приложение с ИИ: один и тот же рабочий процесс

Вы только что развернули традиционное веб-приложение. А что если вы захотите развернуть приложение с ИИ — например, чат с поддержкой Microsoft Foundry Models?

Хорошая новость: **рабочий процесс идентичен.**

| Шаг | Классическое приложение Todo | AI чат-приложение |
|------|-----------------|-------------|
| Инициализация (пустой каталог) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Аутентификация | `azd auth login` | `azd auth login` |
| Развертывание | `azd up` | `azd up` |
| Мониторинг | `azd monitor` | `azd monitor` |
| Очистка | `azd down --force --purge` | `azd down --force --purge` |

Команды жизненного цикла одинаковы, но требования различаются. Шаблон AI может требовать доступа к моделям, региональных квот, ввода данных и дополнительной настройки. Перед развертыванием прочитайте README шаблона; `azd up` не может предоставить недостающие разрешения или квоты.

Это главный принцип azd: **один workflow — любые нагрузки.** Навыки, отработанные в этом уроке — инициализация, развертывание, мониторинг, повторное развертывание и очистка — применимы одинаково к приложениям с ИИ и агентам.

---

## Что вы узнали

Поздравляем! Вы успешно:
- ✅ Инициализировали проект azd из шаблона
- ✅ Изучили структуру проекта и основные файлы
- ✅ Развернули полнофункциональное приложение в Azure
- ✅ Внесли изменения в код и повторно развернули
- ✅ Управляли несколькими окружениями
- ✅ Очистили ресурсы

## 🎯 Упражнения для проверки навыков

### Упражнение 1: Разверните другой шаблон (15 минут)
**Цель:** Продемонстрировать владение azd init и workflow развертывания

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Критерии успеха:**
- [ ] Приложение развернулось без ошибок
- [ ] Есть доступ к URL приложения в браузере
- [ ] Приложение работает корректно (добавление/удаление задач)
- [ ] Все ресурсы успешно очищены

### Упражнение 2: Настройка конфигурации (20 минут)
**Цель:** Практиковать хранение значений локального окружения без путаницы с настройками времени выполнения

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Критерии успеха:**
- [ ] Пользовательское окружение создано успешно
- [ ] Переменные окружения установлены и доступны
- [ ] `azd env get-value APP_TITLE` выводит `My Custom Todo App`
- [ ] Может объяснить, почему эти значения не изменяют стандартное приложение без использования кода/инфраструктуры

### Упражнение 3: Рабочий процесс с несколькими окружениями (25 минут)
**Цель:** Освоить управление окружениями и стратегии развертывания

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критерии успеха:**
- [ ] Созданы два окружения с разными конфигурациями
- [ ] Оба окружения успешно развернуты
- [ ] Можно переключаться между окружениями с помощью `azd env select`
- [ ] Переменные окружения различаются между окружениями
- [ ] Оба окружения успешно очищены

## 📊 Ваш прогресс

**Потраченное время**: ~60-90 минут  
**Освоенные навыки**:
- ✅ Инициализация проекта на основе шаблона
- ✅ Создание ресурсов Azure
- ✅ Workflow развертывания приложений
- ✅ Управление окружениями
- ✅ Управление конфигурацией
- ✅ Очистка ресурсов и управление затратами

**Следующий уровень**: Вы готовы к [Руководству по конфигурации](../chapter-03-configuration/configuration.md) для изучения продвинутых паттернов настройки!

## Устранение распространенных проблем

### Ошибки аутентификации
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Сбои развертывания
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликты имён ресурсов
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Проблемы с портами/сетью
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следующие шаги

Теперь, когда вы завершили первый проект, изучите эти продвинутые темы:

### 1. Настройка инфраструктуры
- [Инфраструктура как код](../chapter-04-infrastructure/provisioning.md)
- [Добавление базы данных](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Настройка CI/CD
- [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) — Полные рабочие процессы CI/CD
- [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) — Конфигурация pipeline

### 3. Лучшие практики продакшена
- [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) — Безопасность, производительность и мониторинг

### 4. Исследуйте больше шаблонов
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Дополнительные ресурсы

### Учебные материалы
- [Документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Хорошо спроектированная архитектура Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Сообщество и поддержка
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Сообщество разработчиков Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow — azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблоны и примеры
- [Официальная галерея шаблонов](https://azure.github.io/awesome-azd/)
- [Вклад сообщества в шаблоны](https://github.com/Azure/awesome-azd)
- [Исходный код шаблона Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Поздравляем с завершением вашего первого проекта azd!** Теперь вы готовы с уверенностью создавать и разворачивать потрясающие приложения в Azure.

---

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Предыдущая**: [Установка и настройка](installation.md)
- **➡️ Следующая**: [Принесите собственное приложение](bring-your-own-app.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом на ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->