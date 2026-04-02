# Ваш первый проект — практическое руководство

**Навигация по главам:**  
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)  
- **📖 Текущая глава**: Глава 1 — Основы и быстрый старт  
- **⬅️ Предыдущая**: [Установка и настройка](installation.md)  
- **➡️ Следующая**: [Конфигурация](configuration.md)  
- **🚀 Следующая глава**: [Глава 2: Разработка с акцентом на ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Введение

Добро пожаловать в ваш первый проект с Azure Developer CLI! Это комплексное практическое руководство проведет вас через весь процесс создания, развертывания и управления полнофункциональным приложением на Azure с использованием azd. Вы будете работать с реальным приложением todo, включающим React-фронтенд, Node.js API-бэкенд и базу данных MongoDB.

## Цели обучения

Выполнив это руководство, вы:  
- Овладеете процессом инициализации проекта azd с использованием шаблонов  
- Поймете структуру и конфигурационные файлы проекта Azure Developer CLI  
- Выполните полное развертывание приложения на Azure с подготовкой инфраструктуры  
- Научитесь внедрять обновления и стратегии повторного развертывания приложения  
- Управлять несколькими средами для разработки и предварительного тестирования  
- Применять методы очистки ресурсов и управления затратами

## Результаты обучения

По завершении вы сможете:  
- Независимо инициализировать и настраивать проекты azd из шаблонов  
- Эффективно ориентироваться и модифицировать структуру проекта azd  
- Развёртывать полнофункциональные приложения на Azure одной командой  
- Устранять распространённые ошибки развертывания и проблемы аутентификации  
- Управлять несколькими средами Azure для различных стадий развертывания  
- Реализовывать процессы непрерывного развертывания обновлений приложения

## Начало работы

### Список требований  
- ✅ Установлен Azure Developer CLI ([Руководство по установке](installation.md))  
- ✅ Завершена аутентификация azd с помощью `azd auth login`  
- ✅ Установлен Git на вашем устройстве  
- ✅ Node.js версии 16 и выше (для данного руководства)  
- ✅ Рекомендуется Visual Studio Code

Перед продолжением запустите валидатор установки из корня репозитория:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Проверка вашей установки  
```bash
# Проверить установку azd
azd version

# Проверить аутентификацию AZD
azd auth login --check-status
```
  
### Проверка дополнительной аутентификации Azure CLI

```bash
az account show
```
  
### Проверка версии Node.js  
```bash
node --version
```
  
## Шаг 1: Выберите и инициализируйте шаблон

Начнем с популярного шаблона приложения todo, который включает React-фронтенд и Node.js бэкенд API.

```bash
# Просмотреть доступные шаблоны
azd template list

# Инициализировать шаблон приложения todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Следуйте подсказкам:
# - Введите имя среды: "dev"
# - Выберите подписку (если у вас несколько)
# - Выберите регион: "East US 2" (или предпочитаемый вами регион)
```
  
### Что только что произошло?  
- Загружен код шаблона в вашу локальную папку  
- Создан файл `azure.yaml` с описанием сервисов  
- Настроен код инфраструктуры в папке `infra/`  
- Создан конфигурационный файл среды

## Шаг 2: Изучите структуру проекта

Давайте посмотрим, что azd создал для нас:

```bash
# Просмотр структуры проекта
tree /f   # Windows
# или
find . -type f | head -20   # macOS/Linux
```
  
Вы должны увидеть:  
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
# Просмотр кода инфраструктуры
head -30 infra/main.bicep
```
  
## Шаг 3: Настройте проект (опционально)

Перед развертыванием вы можете настроить приложение:

### Изменение фронтенда  
```bash
# Откройте компонент приложения React
code src/web/src/App.tsx
```
  
Сделайте простое изменение:  
```typescript
// Найдите заголовок и измените его
<h1>My Awesome Todo App</h1>
```
  
### Настройка переменных среды  
```bash
# Установить пользовательские переменные окружения
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Просмотреть все переменные окружения
azd env get-values
```
  
## Шаг 4: Развертывание в Azure

Теперь самое интересное — развернем всё приложение в Azure!

```bash
# Развернуть инфраструктуру и приложение
azd up

# Эта команда выполнит:
# 1. Создание ресурсов Azure (App Service, Cosmos DB и т.д.)
# 2. Сборку вашего приложения
# 3. Развертывание на созданных ресурсах
# 4. Отобразить URL приложения
```
  
### Что происходит во время развертывания?

Команда `azd up` выполняет следующие шаги:  
1. **Provision** (`azd provision`) — создаёт ресурсы Azure  
2. **Package** — собирает код приложения  
3. **Deploy** (`azd deploy`) — развёртывает код на ресурсы Azure

### Ожидаемый результат  
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```
  
## Шаг 5: Тестирование приложения

### Доступ к вашему приложению  
Кликните по URL, предоставленному в выводе развертывания, или получите его в любое время:  
```bash
# Получить конечные точки приложения
azd show

# Откройте приложение в вашем браузере
azd show --output json | jq -r '.services.web.endpoint'
```
  
### Тестирование приложения Todo  
1. **Добавить задачу** — нажмите «Add Todo» и введите задание  
2. **Отметить выполнение** — отметьте выполненные задачи  
3. **Удалить задачу** — удалите ненужные задачи

### Мониторинг приложения  
```bash
# Откройте портал Azure для ваших ресурсов
azd monitor

# Просмотр журналов приложения
azd monitor --logs

# Просмотр живых метрик
azd monitor --live
```
  
## Шаг 6: Внесите изменения и повторно разверните

Давайте внесем изменение и посмотрим, как просто обновить приложение:

### Изменение API  
```bash
# Редактировать код API
code src/api/src/routes/lists.js
```
  
Добавьте собственный заголовок ответа:  
```javascript
// Найдите обработчик маршрута и добавьте:
res.header('X-Powered-By', 'Azure Developer CLI');
```
  
### Развертывание только изменений кода  
```bash
# Развертывайте только код приложения (пропустите инфраструктуру)
azd deploy

# Это гораздо быстрее, чем 'azd up', так как инфраструктура уже существует
```
  
## Шаг 7: Управление несколькими средами

Создайте промежуточную среду для тестирования изменений перед продакшеном:

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

Когда закончите эксперименты, очистите ресурсы, чтобы избежать дополнительных расходов:

```bash
# Удалить все ресурсы Azure для текущей среды
azd down

# Принудительно удалить без подтверждения и очистить мягко удалённые ресурсы
azd down --force --purge

# Удалить определённую среду
azd env select staging
azd down --force --purge
```
  
## Классическое приложение против приложения с искусственным интеллектом: одинаковый процесс

Вы только что развернули традиционное веб-приложение. А что, если бы вы захотели развернуть приложение с ИИ — например, чат на основе моделей Microsoft Foundry?

Хорошая новость: **процесс абсолютно одинаков.**

| Шаг | Классическое приложение todo | Чат с ИИ |  
|------|-----------------------------|----------|  
| Инициализация | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |  
| Аутентификация | `azd auth login` | `azd auth login` |  
| Развертывание | `azd up` | `azd up` |  
| Мониторинг | `azd monitor` | `azd monitor` |  
| Очистка | `azd down --force --purge` | `azd down --force --purge` |

Единственное отличие — **исходный шаблон**. В шаблоне с ИИ есть дополнительная инфраструктура (например, ресурс Microsoft Foundry Models или индекс AI Search), но azd берёт это на себя. Вам не нужно изучать новые команды, использовать другие инструменты или менять подход к развертыванию.

Это основополагающий принцип azd: **один процесс — любое приложение.** Навыки, которые вы отработали в этом руководстве — инициализация, развертывание, мониторинг, повторное развертывание и очистка — одинаково применимы к приложениям и агентам с искусственным интеллектом.

---

## Что вы узнали

Поздравляем! Вы успешно:  
- ✅ Инициализировали проект azd из шаблона  
- ✅ Изучили структуру проекта и основные файлы  
- ✅ Развернули полнофункциональное приложение на Azure  
- ✅ Внесли изменения в код и повторно развернули  
- ✅ Управляли несколькими средами  
- ✅ Очистили ресурсы

## 🎯 Упражнения для проверки навыков

### Упражнение 1: Разверните другой шаблон (15 минут)  
**Цель**: Продемонстрировать владение процессом инициализации и развертывания azd

```bash
# Попробуйте стек Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Проверить развертывание
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Очистить
azd down --force --purge
```
  
**Критерии успеха:**  
- [ ] Приложение развернулось без ошибок  
- [ ] Можно открыть URL приложения в браузере  
- [ ] Приложение работает корректно (добавление/удаление задач)  
- [ ] Ресурсы очищены успешно

### Упражнение 2: Настройте конфигурацию (20 минут)  
**Цель**: Практика настройки переменных среды

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
- [ ] Создана пользовательская среда  
- [ ] Переменные среды заданы и доступны  
- [ ] Приложение развернуто с пользовательской конфигурацией  
- [ ] Можно проверить настройки в развернутом приложении

### Упражнение 3: Работа с несколькими средами (25 минут)  
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

# Создать промежуточную среду
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Записать URL промежуточной среды
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
- [ ] Можно переключаться между средами через `azd env select`  
- [ ] Переменные среды различаются между средами  
- [ ] Очищены обе среды успешно

## 📊 Ваш прогресс

**Время потрачено**: ~60-90 минут  
**Приобретённые навыки**:  
- ✅ Инициализация проекта из шаблона  
- ✅ Подготовка ресурсов Azure  
- ✅ Процессы развертывания приложения  
- ✅ Управление средами  
- ✅ Управление конфигурацией  
- ✅ Очистка ресурсов и управление затратами

**Следующий уровень**: Вы готовы к [Руководству по конфигурации](configuration.md) для изучения продвинутых шаблонов настройки!

## Устранение распространённых проблем

### Ошибки аутентификации  
```bash
# Повторно аутентифицируйтесь с Azure
az login

# Проверьте доступ к подписке
az account show
```
  
### Неудачи при развертывании  
```bash
# Включить ведение журнала отладки
export AZD_DEBUG=true
azd up --debug

# Просмотр журналов приложения в Azure
azd monitor --logs

# Для Container Apps используйте Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```
  
### Конфликты имён ресурсов  
```bash
# Используйте уникальное имя окружения
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
- [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md) — полные процессы CI/CD  
- [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) — настройка пайплайна

### 3. Лучшие практики продакшена  
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
- [Корпоративные шаблоны](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Поздравляем с завершением вашего первого проекта azd!** Теперь вы готовы уверенно создавать и развёртывать потрясающие приложения на Azure.

---

**Навигация по главам:**  
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)  
- **📖 Текущая глава**: Глава 1 — Основы и быстрый старт  
- **⬅️ Предыдущая**: [Установка и настройка](installation.md)  
- **➡️ Следующая**: [Конфигурация](configuration.md)  
- **🚀 Следующая глава**: [Глава 2: Разработка с акцентом на ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)  
- **Следующий урок**: [Руководство по развертыванию](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с использованием AI-сервиса перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, пожалуйста, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется воспользоваться услугами профессионального человеческого переводчика. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->