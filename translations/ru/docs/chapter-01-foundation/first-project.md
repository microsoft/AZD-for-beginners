# Ваш первый проект - Практическое руководство

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Назад**: [Установка и настройка](installation.md)
- **➡️ Далее**: [Конфигурация](configuration.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Введение

Добро пожаловать в ваш первый проект с Azure Developer CLI! Это комплексное практическое руководство предоставляет полный обзор создания, развертывания и управления полнофункциональным приложением на Azure с использованием azd. Вы будете работать с реальным приложением todo, включающим React-фронтенд, Node.js API-бэкенд и базу данных MongoDB.

## Цели обучения

Выполнив это руководство, вы сможете:
- Освоить процесс инициализации проекта azd с использованием шаблонов
- Понять структуру проекта Azure Developer CLI и конфигурационные файлы
- Выполнить полное развертывание приложения в Azure с настройкой инфраструктуры
- Реализовать стратегии обновления приложения и повторного развертывания
- Управлять несколькими окружениями для разработки и тестирования
- Применять практики очистки ресурсов и управления затратами

## Результаты обучения

По завершении вы сможете:
- Независимо инициализировать и настраивать проекты azd из шаблонов
- Эффективно ориентироваться и изменять структуру проектов azd
- Разворачивать полнофункциональные приложения в Azure одной командой
- Устранять распространённые проблемы с развертыванием и аутентификацией
- Управлять несколькими окружениями Azure для разных этапов развертывания
- Реализовывать непрерывные рабочие процессы для обновления приложений

## Начало работы

### Проверочный список предварительных требований
- ✅ Установлен Azure Developer CLI ([Руководство по установке](installation.md))
- ✅ Аутентификация AZD выполнена через `azd auth login`
- ✅ Git установлен в вашей системе
- ✅ Node.js версии 16+ (для этого руководства)
- ✅ Visual Studio Code (рекомендуется)

Перед продолжением запустите валидатор настройки из корня репозитория:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Проверьте вашу настройку
```bash
# Проверить установку azd
azd version

# Проверить аутентификацию AZD
azd auth login --check-status
```

### Проверьте опциональную аутентификацию Azure CLI

```bash
az account show
```

### Проверьте версию Node.js
```bash
node --version
```

## Шаг 1: Выберите и инициализируйте шаблон

Начнем с популярного шаблона приложения todo, включающего React-фронтенд и Node.js API-бэкенд.

```bash
# Просмотреть доступные шаблоны
azd template list

# Инициализировать шаблон приложения todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Следуйте подсказкам:
# - Введите имя окружения: "dev"
# - Выберите подписку (если их несколько)
# - Выберите регион: "East US 2" (или предпочитаемый регион)
```

### Что только что произошло?
- Загружен код шаблона в вашу локальную директорию
- Создан файл `azure.yaml` с описанием сервисов
- Настроен код инфраструктуры в каталоге `infra/`
- Создана конфигурация окружения

## Шаг 2: Изучите структуру проекта

Рассмотрим, что создал azd:

```bash
# Просмотреть структуру проекта
tree /f   # Windows
# или
find . -type f | head -20   # macOS/Linux
```

Вы увидите:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Основные файлы для понимания

**azure.yaml** — сердце вашего проекта azd:
```bash
# Просмотреть конфигурацию проекта
cat azure.yaml
```

**infra/main.bicep** — определение инфраструктуры:
```bash
# Просмотреть код инфраструктуры
head -30 infra/main.bicep
```

## Шаг 3: Настройте ваш проект (опционально)

Перед развертыванием можно настроить приложение:

### Измените фронтенд
```bash
# Откройте компонент React приложения
code src/web/src/App.tsx
```

Сделайте простое изменение:
```typescript
// Найдите заголовок и измените его
<h1>My Awesome Todo App</h1>
```

### Настройте переменные окружения
```bash
# Установить пользовательские переменные окружения
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Просмотреть все переменные окружения
azd env get-values
```

## Шаг 4: Разверните в Azure

Теперь самое интересное — развернуть всё в Azure!

```bash
# Развернуть инфраструктуру и приложение
azd up

# Эта команда выполнит:
# 1. Поддержку ресурсов Azure (App Service, Cosmos DB и др.)
# 2. Сборку вашего приложения
# 3. Развертывание на подготовленные ресурсы
# 4. Отобразит URL приложения
```

### Что происходит во время развертывания?

Команда `azd up` выполняет следующие шаги:
1. **Provision** (`azd provision`) — создаёт ресурсы Azure
2. **Package** — собирает код вашего приложения
3. **Deploy** (`azd deploy`) — развёртывает код в ресурсах Azure

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

### Доступ к вашему приложению
Нажмите на URL, указанный в выводе развертывания, или получите его в любое время:
```bash
# Получить конечные точки приложения
azd show

# Откройте приложение в вашем браузере
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестирование приложения Todo
1. **Добавьте элемент** — нажмите "Add Todo" и введите задачу
2. **Отметьте как выполненное** — отметьте выполненные задачи
3. **Удалите элементы** — удалите ненужные задачи

### Мониторинг приложения
```bash
# Откройте портал Azure для ваших ресурсов
azd monitor

# Просмотр журналов приложений
azd monitor --logs

# Просмотр живых метрик
azd monitor --live
```

### ✅ Подтвердите корректность развертывания

Перед продолжением пройдите этот краткий чеклист, чтобы убедиться, что всё действительно работает — не полагайтесь на «развертывание прошло» как на «приложение работает»:

```bash
# 1. Подтвердите, что конечная точка существует и доступна
azd show

# 2. Выполните первичное тестирование конечной точки (ожидается HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Проверьте конечную точку состояния, если ваше приложение её предоставляет
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Развертывание считается подтверждённым, если:**
- ✅ `azd show` выводит URL доступной конечной точки
- ✅ URL открывается в браузере без ошибок
- ✅ Основные функции работают (добавление/выполнение/удаление задачи)
- ✅ `azd monitor --logs` показывает запросы без неожиданных ошибок

Если какой-либо пункт не выполнен, перейдите к [Главе 7: Устранение неполадок](../chapter-07-troubleshooting/README.md).

## Шаг 6: Внесите изменения и повторно разверните

Давайте внесем изменение и посмотрим, как легко обновить приложение:

### Измените API
```bash
# Редактировать код API
code src/api/src/routes/lists.js
```

Добавьте пользовательский заголовок в ответ:
```javascript
// Найдите обработчик маршрута и добавьте:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Разверните только изменения кода
```bash
# Развернуть только код приложения (пропустить инфраструктуру)
azd deploy

# Это гораздо быстрее, чем 'azd up', поскольку инфраструктура уже существует
```

## Шаг 7: Управление несколькими окружениями

Создайте тестовое окружение, чтобы проверить изменения перед продакшеном:

```bash
# Создать новую тестовую среду
azd env new staging

# Развернуть на тестовой среде
azd up

# Переключиться обратно на среду разработки
azd env select dev

# Перечислить все среды
azd env list
```

### Сравнение окружений
```bash
# Просмотр среды разработки
azd env select dev
azd show

# Просмотр промежуточной среды
azd env select staging
azd show
```

## Шаг 8: Очистка ресурсов

Когда закончите эксперименты, очистите ресурсы, чтобы не платить за них дальше:

```bash
# Удалить все ресурсы Azure для текущей среды
azd down

# Принудительное удаление без подтверждения и очистка мягко удалённых ресурсов
azd down --force --purge

# Удалить конкретную среду
azd env select staging
azd down --force --purge
```

## Классическое приложение vs. AI-приложение: одинаковый рабочий процесс

Вы только что развернули традиционное веб-приложение. А что если вы захотите развернуть AI-приложение — например, чат на основе Microsoft Foundry Models?

Хорошая новость: **рабочий процесс идентичен.**

| Шаг | Классическое приложение todo | AI-чат приложение |
|------|------------------------------|-------------------|
| Инициализация | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Аутентификация | `azd auth login` | `azd auth login` |
| Развертывание | `azd up` | `azd up` |
| Мониторинг | `azd monitor` | `azd monitor` |
| Очистка | `azd down --force --purge` | `azd down --force --purge` |

Единственное отличие — **шаблон**, с которого вы начинаете. AI-шаблон включает дополнительную инфраструктуру (например, ресурс Microsoft Foundry Models или индекс AI Search), но azd позаботится обо всём этом за вас. Нет необходимости изучать новые команды, использовать другой инструмент или менять подход к развертыванию.

Это основной принцип azd: **один рабочий процесс — любой тип нагрузки.** Навыки, отработанные в этом руководстве — инициализация, развертывание, мониторинг, повторное развертывание и очистка — применимы равно к AI-приложениям и агентам.

---

## Что вы узнали

Поздравляем! Вы успешно:
- ✅ Инициализировали проект azd из шаблона
- ✅ Изучили структуру проекта и ключевые файлы
- ✅ Развернули полнофункциональное приложение в Azure
- ✅ Внесли изменения в код и повторно развернули приложение
- ✅ Управляли несколькими окружениями
- ✅ Очистили ресурсы

## 🎯 Упражнения для закрепления навыков

### Упражнение 1: Разверните другой шаблон (15 минут)
**Цель**: Продемонстрировать уверенное владение инициализацией azd и процессом развертывания

```bash
# Попробуйте стек Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Проверьте развертывание
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Очистить
azd down --force --purge
```

**Критерии успеха:**
- [ ] Приложение развёрнуто без ошибок
- [ ] Доступ к URL приложения через браузер
- [ ] Приложение работает корректно (добавление/удаление задач)
- [ ] Все ресурсы успешно очищены

### Упражнение 2: Настройка конфигурации (20 минут)
**Цель**: Попрактиковаться в настройке переменных окружения

```bash
cd my-first-azd-app

# Создать пользовательскую среду
azd env new custom-config

# Установить пользовательские переменные
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Проверить переменные
azd env get-values | grep APP_TITLE

# Развернуть с пользовательской конфигурацией
azd up
```

**Критерии успеха:**
- [ ] Пользовательское окружение создано успешно
- [ ] Переменные окружения установлены и доступны
- [ ] Приложение развёрнуто с пользовательской конфигурацией
- [ ] Можно проверить настройки в развернутом приложении

### Упражнение 3: Рабочий процесс с несколькими окружениями (25 минут)
**Цель**: Освоить управление окружениями и стратегии развертывания

```bash
# Создать среду разработки
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Записать URL разработки
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Создать среду тестирования
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Записать URL тестирования
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Сравнить среды
azd env list

# Протестировать обе среды
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Очистить обе среды
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Критерии успеха:**
- [ ] Созданы два окружения с разными настройками
- [ ] Оба окружения успешно развернуты
- [ ] Можно переключаться между окружениями с помощью `azd env select`
- [ ] Переменные окружения отличаются между окружениями
- [ ] Оба окружения успешно очищены

## 📊 Ваш прогресс

**Затраченное время**: ~60-90 минут  
**Приобретённые навыки**:
- ✅ Инициализация проектов на основе шаблонов
- ✅ Настройка ресурсов Azure
- ✅ Рабочие процессы развертывания приложений
- ✅ Управление окружениями
- ✅ Управление конфигурацией
- ✅ Очистка ресурсов и управление затратами

**Следующий уровень**: Вы готовы к [Руководству по конфигурации](configuration.md) для изучения продвинутых паттернов настройки!

## Устранение распространённых проблем

### Ошибки аутентификации
```bash
# Повторно аутентифицируйтесь в Azure
az login

# Проверьте доступ к подписке
az account show
```

### Сбои развертывания
```bash
# Включить отладочное логирование
export AZD_DEBUG=true
azd up --debug

# Просмотр логов приложения в Azure
azd monitor --logs

# Для Container Apps используйте Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликты имён ресурсов
```bash
# Используйте уникальное имя среды
azd env new dev-$(whoami)-$(date +%s)
```

### Проблемы с портами/сетью
```bash
# Проверьте, доступны ли порты
netstat -an | grep :3000
netstat -an | grep :3100
```

## Следующие шаги

Теперь, когда вы завершили первый проект, изучите эти продвинутые темы:

### 1. Настройка инфраструктуры
- [Инфраструктура как код](../chapter-04-infrastructure/provisioning.md)
- [Добавление баз данных, хранилищ и других сервисов](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Настройка CI/CD
- [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) — полные рабочие процессы CI/CD
- [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) — настройка pipeline

### 3. Лучшие практики для продакшена
- [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) — безопасность, производительность и мониторинг

### 4. Изучите больше шаблонов
```bash
# Просматривайте шаблоны по категориям
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Попробуйте разные технологические стэки
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Дополнительные ресурсы

### Учебные материалы
- [Документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Сообщество и поддержка
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Сообщество разработчиков Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблоны и примеры
- [Официальная галерея шаблонов](https://azure.github.io/awesome-azd/)
- [Шаблоны сообщества](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Поздравляем с завершением вашего первого проекта azd!** Теперь вы готовы с уверенностью создавать и разворачивать удивительные приложения на Azure.

---

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 - Основы и быстрый старт
- **⬅️ Назад**: [Установка и настройка](installation.md)
- **➡️ Далее**: [Используйте свое собственное приложение](bring-your-own-app.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->