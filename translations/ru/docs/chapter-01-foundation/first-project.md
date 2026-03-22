# Ваш первый проект — практическое руководство

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 — Основы и быстрый старт
- **⬅️ Предыдущая**: [Установка и настройка](installation.md)
- **➡️ Следующая**: [Конфигурация](configuration.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Введение

Добро пожаловать в ваш первый проект с Azure Developer CLI! Это комплексное практическое руководство предоставляет полный поэтапный процесс создания, развертывания и управления полнофункциональным приложением на Azure с использованием azd. Вы будете работать с реальным приложением todo, включающим React-фронтенд, Node.js API-бэкенд и базу данных MongoDB.

## Цели обучения

Выполнив это руководство, вы:
- Овладеете процессом инициализации проекта azd с использованием шаблонов
- Поймете структуру проекта Azure Developer CLI и файлы конфигурации
- Освоите полный цикл развертывания приложения на Azure с обеспечением инфраструктуры
- Познакомитесь с реализацией обновлений приложения и стратегий повторного развертывания
- Научитесь управлять несколькими средами для разработки и тестирования
- Примените методы очистки ресурсов и управления затратами

## Результаты обучения

По завершении вы сможете:
- Самостоятельно инициализировать и настраивать проекты azd из шаблонов
- Эффективно ориентироваться и модифицировать структуру проектов azd
- Развертывать полнофункциональные приложения на Azure одной командой
- Устранять распространённые проблемы развертывания и аутентификации
- Управлять несколькими средами Azure для разных этапов развертывания
- Реализовывать процессы непрерывного развертывания обновлений приложения

## Начало работы

### Список необходимых условий
- ✅ Azure Developer CLI установлен ([Руководство по установке](installation.md))
- ✅ Azure CLI установлен и выполнена аутентификация
- ✅ Git установлен в вашей системе
- ✅ Node.js версии 16 и выше (для этого руководства)
- ✅ Visual Studio Code (рекомендуется)

### Проверьте вашу настройку
```bash
# Проверьте установку azd
azd version
```
### Проверка аутентификации Azure

```bash
az account show
```

### Проверка версии Node.js
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

# Следуйте инструкциям:
# - Введите имя среды: "dev"
# - Выберите подписку (если у вас несколько)
# - Выберите регион: "East US 2" (или ваш предпочтительный регион)
```

### Что только что произошло?
- Загружен код шаблона в локальный каталог
- Создан файл `azure.yaml` с определениями сервисов
- Настроены инфраструктурные файлы в каталоге `infra/`
- Создана конфигурация среды

## Шаг 2: Изучите структуру проекта

Давайте посмотрим, что создал azd:

```bash
# Просмотр структуры проекта
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

### Ключевые файлы для понимания

**azure.yaml** — основа вашего проекта azd:
```bash
# Просмотреть конфигурацию проекта
cat azure.yaml
```

**infra/main.bicep** — описание инфраструктуры:
```bash
# Просмотреть код инфраструктуры
head -30 infra/main.bicep
```

## Шаг 3: Настройте проект (по желанию)

Перед развертыванием вы можете настроить приложение:

### Измените фронтенд
```bash
# Откройте компонент приложения React
code src/web/src/App.tsx
```

Внесите простое изменение:
```typescript
// Найдите заголовок и измените его
<h1>My Awesome Todo App</h1>
```

### Настройка переменных окружения
```bash
# Установить пользовательские переменные окружения
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Просмотреть все переменные окружения
azd env get-values
```

## Шаг 4: Разверните на Azure

Теперь самое интересное — развернем всё на Azure!

```bash
# Развернуть инфраструктуру и приложение
azd up

# Эта команда выполнит:
# 1. Создаст ресурсы Azure (App Service, Cosmos DB и др.)
# 2. Соберет ваше приложение
# 3. Развернет на созданных ресурсах
# 4. Отобразит URL приложения
```

### Что происходит во время развертывания?

Команда `azd up` выполняет следующие шаги:
1. **Provision** (`azd provision`) — создает ресурсы Azure
2. **Package** — собирает ваш код приложения
3. **Deploy** (`azd deploy`) — разворачивает код в ресурсах Azure

### Ожидаемый результат
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Шаг 5: Протестируйте приложение

### Доступ к приложению
Кликните по URL, указанному в выводе развертывания, или получите его в любой момент:
```bash
# Получить конечные точки приложения
azd show

# Откройте приложение в вашем браузере
azd show --output json | jq -r '.services.web.endpoint'
```

### Тестирование приложения Todo
1. **Добавьте задачу** — нажмите «Add Todo» и введите задачу
2. **Отметьте как выполненное** — отметьте выполненные задачи
3. **Удалите задачи** — удалите ненужные задачи

### Мониторинг приложения
```bash
# Открыть портал Azure для ваших ресурсов
azd monitor

# Просмотреть журналы приложений
azd monitor --logs

# Просмотреть метрики в реальном времени
azd monitor --live
```

## Шаг 6: Внесите изменения и повторно разверните

Давайте внесем изменение и посмотрим, как просто обновить:

### Измените API
```bash
# Редактировать код API
code src/api/src/routes/lists.js
```

Добавьте пользовательский заголовок ответа:
```javascript
// Найдите обработчик маршрута и добавьте:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Разверните только изменения кода
```bash
# Развернуть только код приложения (пропустить инфраструктуру)
azd deploy

# Это намного быстрее, чем 'azd up', так как инфраструктура уже существует
```

## Шаг 7: Управление несколькими средами

Создайте тестовую среду для проверки изменений перед выводом в продакшен:

```bash
# Создать новую промежуточную среду
azd env new staging

# Развернуть на промежуточной среде
azd up

# Вернуться к среде разработки
azd env select dev

# Показать все среды
azd env list
```

### Сравнение сред
```bash
# Просмотр среды разработки
azd env select dev
azd show

# Просмотр промежуточной среды
azd env select staging
azd show
```

## Шаг 8: Очистка ресурсов

Когда закончите экспериментировать, очистите ресурсы, чтобы избежать дополнительных затрат:

```bash
# Удалить все ресурсы Azure для текущей среды
azd down

# Принудительное удаление без подтверждения и очистка мягко удалённых ресурсов
azd down --force --purge

# Удалить конкретную среду
azd env select staging
azd down --force --purge
```

## Классическое приложение против приложения с ИИ: тот же рабочий процесс

Вы только что развернули традиционное веб-приложение. А что если вы захотите развернуть приложение с ИИ, например чат, поддерживаемый моделями Microsoft Foundry?

Хорошие новости: **рабочий процесс идентичен.**

| Шаг | Классическое приложение Todo | Приложение AI-чат |
|------|-----------------------------|-------------------|
| Инициализация | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Аутентификация | `azd auth login` | `azd auth login` |
| Развертывание | `azd up` | `azd up` |
| Мониторинг | `azd monitor` | `azd monitor` |
| Очистка | `azd down --force --purge` | `azd down --force --purge` |

Единственное отличие — это **шаблон**, с которого вы начинаете. Шаблон ИИ включает дополнительную инфраструктуру (например, ресурс Microsoft Foundry Models или индекс AI Search), но azd справляется со всем этим автоматически. Вам не нужно изучать новые команды, использовать другие инструменты или менять подход к развертыванию.

Это ключевой принцип azd: **один рабочий процесс — любая нагрузка.** Навыки, которые вы освоили в этом руководстве — инициализация, развертывание, мониторинг, повторное развертывание и очистка — одинаково применимы к приложениям ИИ и агентам.

---

## Чему вы научились

Поздравляем! Вы успешно:
- ✅ Инициализировали проект azd из шаблона
- ✅ Ознакомились со структурой проекта и ключевыми файлами
- ✅ Развернули полнофункциональное приложение на Azure
- ✅ Внесли изменения в код и повторно развернули
- ✅ Управляли несколькими средами
- ✅ Очистили ресурсы

## 🎯 Проверочные задания

### Задание 1: Развертывание другого шаблона (15 минут)
**Цель**: Продемонстрировать владение командой azd init и процессом развертывания

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
- [ ] Приложение развертывается без ошибок
- [ ] Доступ к приложению по URL в браузере
- [ ] Приложение работает корректно (добавление/удаление задач)
- [ ] Все ресурсы успешно очищены

### Задание 2: Настройка конфигурации (20 минут)
**Цель**: Попрактиковаться с конфигурацией переменных окружения

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
- [ ] Пользовательская среда успешно создана
- [ ] Переменные окружения установлены и доступны
- [ ] Приложение развернуто с пользовательской конфигурацией
- [ ] Возможность проверить настройки в развернутом приложении

### Задание 3: Работа с несколькими средами (25 минут)
**Цель**: Освоить управление средами и стратегии развертывания

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
- [ ] Созданы две среды с разными конфигурациями
- [ ] Обе среды успешно развернуты
- [ ] Возможность переключаться между средами с помощью `azd env select`
- [ ] Переменные окружения различаются в разных средах
- [ ] Обе среды успешно очищены

## 📊 Ваш прогресс

**Затраченное время**: ~60-90 минут  
**Освоенные навыки**:
- ✅ Инициализация проектов на основе шаблонов
- ✅ Обеспечение ресурсов Azure
- ✅ Потоки развертывания приложений
- ✅ Управление средами
- ✅ Управление конфигурацией
- ✅ Очистка ресурсов и управление затратами

**Следующий уровень**: Вы готовы к [Руководству по конфигурации](configuration.md) для изучения продвинутых шаблонов настройки!

## Решение распространённых проблем

### Ошибки аутентификации
```bash
# Повторная аутентификация в Azure
az login

# Проверить доступ к подписке
az account show
```

### Ошибки развертывания
```bash
# Включить отладочное ведение журнала
export AZD_DEBUG=true
azd up --debug

# Просмотр журналов приложения в Azure
azd monitor --logs

# Для приложений контейнеров используйте Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Конфликты имён ресурсов
```bash
# Используйте уникальное имя окружения
azd env new dev-$(whoami)-$(date +%s)
```

### Проблемы с портами и сетью
```bash
# Проверьте, доступны ли порты
netstat -an | grep :3000
netstat -an | grep :3100
```

## Дальнейшие шаги

Теперь, когда вы завершили первый проект, изучите эти продвинутые темы:

### 1. Настройка инфраструктуры
- [Инфраструктура как код](../chapter-04-infrastructure/provisioning.md)
- [Добавление баз данных, хранилищ и других сервисов](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Настройка CI/CD
- [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) — комплексные процессы CI/CD
- [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) — конфигурация пайплайна

### 3. Лучшие практики для продакшена
- [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) — безопасность, производительность и мониторинг

### 4. Изучите больше шаблонов
```bash
# Просматривайте шаблоны по категориям
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Попробуйте разные технологические стеки
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Дополнительные ресурсы

### Образовательные материалы
- [Документация Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Центр архитектуры Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Фреймворк Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Сообщество и поддержка
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Сообщество разработчиков Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow — azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Шаблоны и примеры
- [Официальная галерея шаблонов](https://azure.github.io/awesome-azd/)
- [Шаблоны сообщества](https://github.com/Azure-Samples/azd-templates)
- [Корпоративные шаблоны](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Поздравляем с завершением вашего первого проекта azd!** Теперь вы готовы уверенно создавать и развертывать удивительные приложения на Azure.

---

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 1 — Основы и быстрый старт
- **⬅️ Предыдущая**: [Установка и настройка](installation.md)
- **➡️ Следующая**: [Конфигурация](configuration.md)
- **🚀 Следующая глава**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Следующий урок**: [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, пожалуйста, учитывайте, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неверные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->