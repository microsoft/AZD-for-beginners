# Справочник команд - Основные команды AZD

**Быстрая справка для всех глав**
- **📚 Домашняя страница курса**: [AZD для новичков](../README.md)
- **📖 Быстрый старт**: [Глава 1: Основы и быстрый старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команды**: [Глава 2: Разработка с приоритетом на ИИ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Продвинутые**: [Глава 4: Инфраструктура как код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Введение

Этот комплексный справочник предоставляет быстрый доступ к наиболее часто используемым командам Azure Developer CLI, организованным по категориям с практическими примерами. Идеально подходит для быстрого поиска во время разработки, устранения неполадок и повседневной работы с проектами azd.

## Цели обучения

Используя этот справочник, вы:
- Получите мгновенный доступ к основным командам и синтаксису Azure Developer CLI
- Поймёте организацию команд по функциональным категориям и случаям использования
- Сможете обращаться к практическим примерам для типичных сценариев разработки и развертывания
- Получите команды для устранения неполадок для быстрого решения проблем
- Обнаружите эффективные параметры для продвинутой настройки и конфигурации
- Найдёте команды для управления средами и рабочих процессов с несколькими средами

## Результаты обучения

Регулярно обращаясь к этому справочнику, вы сможете:
- Уверенно выполнять команды azd без постоянного обращения к полной документации
- Быстро устранять распространённые проблемы с помощью подходящих диагностических команд
- Эффективно управлять несколькими средами и сценариями развертывания
- Применять продвинутые функции и параметры настройки azd по мере необходимости
- Решать проблемы развертывания, используя систематические последовательности команд
- Оптимизировать рабочие процессы через эффективное использование сокращений и опций azd

## Начальные команды

### Аутентификация
```bash
# Вход в Azure через AZD
azd auth login

# Вход в Azure CLI (AZD использует это внутри)
az login

# Проверить текущую учетную запись
az account show

# Установить подписку по умолчанию
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Выйти из AZD
azd auth logout

# Выйти из Azure CLI
az logout
```

### Инициализация проекта
```bash
# Просмотреть доступные шаблоны
azd template list

# Инициализировать из шаблона
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Инициализировать в текущем каталоге
azd init .

# Инициализировать с пользовательским именем
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основные команды развертывания

### Полный рабочий процесс развертывания
```bash
# Развернуть всё (подготовка + развертывание)
azd up

# Развернуть без запросов подтверждения
azd up --confirm-with-no-prompt

# Развернуть в определённой среде
azd up --environment production

# Развернуть с пользовательскими параметрами
azd up --parameter location=westus2
```

### Только инфраструктура
```bash
# Развертывание ресурсов Azure
azd provision

# 🧪 Предварительный просмотр изменений инфраструктуры
azd provision --preview
# Показывает предварительный просмотр, какие ресурсы будут созданы/изменены/удалены
# Аналогично 'terraform plan' или 'bicep what-if' - безопасно запускать, изменения не применяются
```

### Только приложение
```bash
# Развернуть код приложения
azd deploy

# Развернуть конкретный сервис
azd deploy --service web
azd deploy --service api

# Развернуть все сервисы
azd deploy --all
```

### Сборка и упаковка
```bash
# Восстановить (скачать) зависимости приложения
azd restore

# Восстановить конкретный сервис
azd restore --service api

# Построить развертываемый артефакт без развертывания
azd package

# Построить конкретный сервис
azd package --service api
```

> **`azd restore`** загружает зависимости вашего приложения (npm, pip, NuGet, Maven и др.). Она выполняется автоматически во время `azd package` и `azd deploy`, поэтому вы редко вызываете её напрямую — запуск вручную нужен для предварительной загрузки зависимостей (например, чтобы прогреть кеш CI или работать офлайн позже).

> **`azd package`** создаёт артефакт для развертывания (контейнерный образ или zip) **без** отправки в Azure. Используйте её отдельно, чтобы убедиться в успешности сборки, проверить результат или получить артефакт для развертывания отдельным процессом позже. `azd deploy` автоматически упаковывает, поэтому `azd package` нужен только если нужен артефакт без развертывания.

## 🌍 Управление средами

### Операции со средами
```bash
# Показать все окружения
azd env list

# Создать новое окружение
azd env new development
azd env new staging --location westus2

# Выбрать окружение
azd env select production

# Показать доступные окружения
azd env list

# Обновить состояние окружения
azd env refresh
```

### Переменные среды
```bash
# Установить переменную окружения
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Получить переменную окружения
azd env get API_KEY

# Список всех переменных окружения
azd env get-values

# Удалить переменную окружения
azd env unset DEBUG
```

## ⚙️ Конфигурационные команды

### Глобальная конфигурация
```bash
# Вывести все настройки
azd config show

# Установить глобальные параметры по умолчанию
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Удалить настройку
azd config unset defaults.location

# Сбросить все настройки
azd config reset
```

### Конфигурация проекта
```bash
# Проверить azure.yaml
azd config validate

# Показать информацию о проекте
azd show

# Получить конечные точки сервиса
azd show --output json
```

## 📊 Мониторинг и диагностика

### Панель мониторинга
```bash
# Открыть панель мониторинга портала Azure
azd monitor

# Открыть живые метрики Application Insights
azd monitor --live

# Открыть панель журналов Application Insights
azd monitor --logs

# Открыть обзор Application Insights
azd monitor --overview
```

### Просмотр логов контейнера
```bash
# Просмотр журналов через Azure CLI (для Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Просмотр журналов в реальном времени
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Просмотр журналов через портал Azure
azd monitor --logs
```

### Запросы Log Analytics
```bash
# Доступ к анализу журналов через портал Azure
azd monitor --logs

# Запрос журналов с помощью Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команды обслуживания

### Очистка
```bash
# Удалить все ресурсы Azure
azd down

# Принудительное удаление без подтверждения
azd down --force

# Очистить мягко удалённые ресурсы
azd down --purge

# Полная очистка
azd down --force --purge
```

### Обновления
```bash
# Проверить обновления azd
azd version

# Получить текущую версию
azd version

# Просмотреть текущую конфигурацию
azd config show
```

## 🔧 Продвинутые команды

### Конвейер и CI/CD
```bash
# Настроить GitHub Actions
azd pipeline config

# Настроить Azure DevOps
azd pipeline config --provider azdo

# Показать конфигурацию пайплайна
azd pipeline show
```

### Управление инфраструктурой
```bash
# Генерировать шаблоны инфраструктуры
azd infra generate

# 🧪 Предварительный просмотр и планирование инфраструктуры
azd provision --preview
# Имитирует развертывание инфраструктуры без фактического развертывания
# Анализирует шаблоны Bicep/Terraform и показывает:
# - Ресурсы, которые будут добавлены (зелёный +)
# - Ресурсы, которые будут изменены (жёлтый ~)
# - Ресурсы, которые будут удалены (красный -)
# Безопасно запускать - никаких фактических изменений в среде Azure не происходит

# Генерировать инфраструктуру из azure.yaml
azd infra synth
```

### Информация о проекте
```bash
# Показать статус проекта и конечные точки
azd show

# Показать подробную информацию о проекте в формате JSON
azd show --output json

# Получить конечные точки сервиса
azd show --output json | jq '.services'
```

## 🤖 AI и расширения

### Расширения AZD
```bash
# Список всех доступных расширений (включая ИИ)
azd extension list

# Установить расширение агентов Foundry
azd extension install azure.ai.agents

# Установить расширение навыков агентов (предварительный просмотр)
azd extension install azure.ai.skills

# Установить расширение подключений Foundry (предварительный просмотр)
azd extension install azure.ai.connections

# Установить расширение тонкой настройки
azd extension install azure.ai.finetune

# Установить расширение пользовательских моделей
azd extension install azure.ai.models

# Обновить все установленные расширения
azd extension upgrade --all
```

### AI агент команды
```bash
# Инициализировать проект агента из манифеста
azd ai agent init -m <manifest-path-or-uri>

# Указать конкретный проект Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Указать исходный каталог агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Выбрать цель размещения
azd ai agent init -m agent-manifest.yaml --host containerapp

# Протестировать развернутого агента (выводит задержку + время до первого байта)
azd ai agent invoke

# Показать конфигурацию живой конечной точки
azd ai agent endpoint show

# Сгенерировать набор данных для оценки, затем оптимизировать агента
azd ai agent eval generate
azd ai agent optimize

# Скачать развернутый исходный код хостинг-агента на основе кода
azd ai agent code download

# Удалить хостинг-агента и все его версии (--force завершает активные сессии)
azd ai agent delete --force
```

### MCP сервер (альфа)
```bash
# Запустите сервер MCP для вашего проекта
azd mcp start

# Управляйте согласием на использование инструментов для операций MCP
azd copilot consent list
```

### Генерация инфраструктуры
```bash
# Генерировать файлы IaC из определения вашего проекта
azd infra generate

# Синтезировать инфраструктуру из azure.yaml
azd infra synth
```

---

## 🎯 Быстрые рабочие процессы

### Рабочий процесс разработки
```bash
# Начать новый проект
azd init --template todo-nodejs-mongo
cd my-project

# Развернуть в среде разработки
azd env new dev
azd up

# Внести изменения и развернуть заново
azd deploy

# Открыть панель мониторинга
azd monitor --live
```

### Рабочий процесс с несколькими средами
```bash
# Настроить окружения
azd env new dev
azd env new staging  
azd env new production

# Развернуть на dev
azd env select dev
azd up

# Протестировать и продвинуть на staging
azd env select staging
azd up

# Развернуть в production
azd env select production
azd up
```

### Рабочий процесс устранения неполадок
```bash
# Включить режим отладки
export AZD_DEBUG=true

# Проверить состояние развертывания
azd show

# Проверить конфигурацию
azd config show

# Открыть панель мониторинга для журналов
azd monitor --logs

# Проверить состояние ресурсов
azd show --output json
```

## 🔍 Команды отладки

### Информация для отладки
```bash
# Включить отладочный вывод
export AZD_DEBUG=true
azd <command> --debug

# Отключить телеметрию для более чистого вывода
export AZD_DISABLE_TELEMETRY=true

# Проверить текущую конфигурацию
azd config show

# Проверить статус аутентификации
az account show
```

### Отладка шаблонов
```bash
# Список доступных шаблонов с деталями
azd template list --output json

# Показать информацию о шаблоне
azd template show <template-name>

# Проверить шаблон перед инициализацией
azd template validate <template-name>
```

## 📁 Команды работы с файлами и каталогами

### Структура проекта
```bash
# Показать текущую структуру каталогов
tree /f  # Windows
find . -type f  # Linux/macOS

# Перейти в корневой каталог проекта azd
cd $(azd root)

# Показать каталог конфигурации azd
echo $AZD_CONFIG_DIR  # Обычно ~/.azd
```

## 🎨 Форматирование вывода

### Вывод в формате JSON
```bash
# Получить JSON вывод для скриптов
azd show --output json
azd env list --output json
azd config show --output json

# Разобрать с помощью jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Вывод в виде таблицы
```bash
# Форматировать как таблицу
azd env list --output table

# Просмотреть развернутые сервисы
azd show --output json | jq '.services | keys'
```

## 🔧 Часто используемые комбинации команд

### Скрипт проверки состояния
```bash
#!/bin/bash
# Быстрая проверка состояния здоровья
azd show
azd env get-values
azd monitor --logs
```

### Проверка развертывания
```bash
#!/bin/bash
# Предварительная проверка перед развертыванием
azd show
azd provision --preview  # Просмотр изменений перед развертыванием
az account show
```

### Сравнение сред
```bash
#!/bin/bash
# Сравнить окружения
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Скрипт очистки ресурсов
```bash
#!/bin/bash
# Очистить старые окружения
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Переменные среды

### Общие переменные среды
```bash
# Конфигурация Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Конфигурация AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Конфигурация приложения
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Аварийные команды

### Быстрое исправление
```bash
# Сбросить аутентификацию
az account clear
az login

# Принудительное обновление окружения
azd env refresh

# Перезапустить все сервисы
azd deploy

# Проверить статус развертывания
azd show --output json
```

### Команды восстановления
```bash
# Восстановление после неудачного развертывания — очистка и повторное развертывание
azd down --force --purge
azd up

# Повторное предоставление только инфраструктуры
azd provision

# Повторное развертывание только приложения
azd deploy
```

## 💡 Полезные советы

### Алиасы для ускорения работы
```bash
# Добавьте в ваш .bashrc или .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Быстрые комбинации функций
```bash
# Быстрое переключение окружения
azd-env() {
    azd env select $1 && azd show
}

# Быстрая развертка с мониторингом
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Статус окружения
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Помощь и документация

### Получение помощи
```bash
# Общая помощь
azd --help
azd help

# Помощь по конкретной команде
azd up --help
azd env --help
azd config --help

# Показать версию и информацию о сборке
azd version
azd version --output json
```

### Ссылки на документацию
```bash
# Открыть документацию в браузере
azd docs

# Показать документацию по шаблону
azd template show <template-name> --docs
```

---

**Совет**: Добавьте этот справочник в закладки и используйте `Ctrl+F`, чтобы быстро находить нужные команды!

---

**Навигация**
- **Предыдущий урок**: [Предварительные проверки](../docs/pre-deployment/preflight-checks.md)
- **Следующий урок**: [Глоссарий](glossary.md)

---

> **💡 Хотите помощь с командами Azure в вашем редакторе?** Установите [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) с помощью `npx skills add microsoft/github-copilot-for-azure` — 37 скиллов для ИИ, Foundry, развертывания, диагностики и многого другого.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->