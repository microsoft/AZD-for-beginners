# Командный Шпаргалка - Основные Команды AZD

**Быстрая Справка по Всем Главам**
- **📚 Главная Курса**: [AZD Для Начинающих](../README.md)
- **📖 Быстрый Старт**: [Глава 1: Основы и Быстрый Старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Команды**: [Глава 2: Разработка с Приоритетом на ИИ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Дополнительно**: [Глава 4: Инфраструктура как Код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Введение

Эта обширная шпаргалка предоставляет быструю справку по наиболее часто используемым командам Azure Developer CLI, организованным по категориям с практическими примерами. Отлично подходит для быстрого поиска во время разработки, устранения неполадок и повседневной работы с проектами azd.

## Цели Обучения

Используя эту шпаргалку, вы:
- Будете иметь мгновенный доступ к основным командам и синтаксису Azure Developer CLI
- Поймете организацию команд по функциональным категориям и сценариям использования
- Получите ссылки на практические примеры для типичных сценариев разработки и развертывания
- Достанете команды для устранения неполадок для быстрого решения проблем
- Найдете расширенные опции настройки и конфигурации эффективно
- Обнаружите команды для управления средами и много-средовых рабочих процессов

## Результаты Обучения

Регулярно обращаясь к этой шпаргалке, вы сможете:
- Уверенно выполнять команды azd без обращения к полной документации
- Быстро решать распространенные проблемы с помощью соответствующих диагностических команд
- Эффективно управлять несколькими средами и сценариями развертывания
- Применять продвинутые функции azd и параметры конфигурации по мере необходимости
- Устранять проблемы развертывания с использованием систематических последовательностей команд
- Оптимизировать рабочие процессы через эффективное использование сокращений и опций azd

## Команды Для Начала Работы

### Аутентификация
```bash
# Войти в Azure через AZD
azd auth login

# Войти в Azure CLI (AZD использует это в основе)
az login

# Проверить текущий аккаунт
az account show

# Установить подписку по умолчанию
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Выйти из AZD
azd auth logout

# Выйти из Azure CLI
az logout
```

### Инициализация Проекта
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

## Основные Команды Развертывания

### Полный Рабочий Процесс Развертывания
```bash
# Развернуть всё (подготовка + развертывание)
azd up

# Развернуть с отключёнными запросами подтверждения
azd up --confirm-with-no-prompt

# Развернуть в конкретную среду
azd up --environment production

# Развернуть с пользовательскими параметрами
azd up --parameter location=westus2
```

### Только Инфраструктура
```bash
# Предоставить ресурсы Azure
azd provision

# 🧪 Предварительный просмотр изменений инфраструктуры
azd provision --preview
# Показывает предварительный просмотр того, какие ресурсы будут созданы/изменены/удалены
# Аналогично 'terraform plan' или 'bicep what-if' - безопасно запускать, изменения не применяются
```

### Только Приложение
```bash
# Развернуть код приложения
azd deploy

# Развернуть конкретный сервис
azd deploy --service web
azd deploy --service api

# Развернуть все сервисы
azd deploy --all
```

### Сборка и Упаковка
```bash
# Создавать приложения
azd package

# Создавать конкретный сервис
azd package --service api
```

## 🌍 Управление Средой

### Операции со Средой
```bash
# Перечислить все окружения
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

### Переменные Окружения
```bash
# Установить переменную окружения
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Получить переменную окружения
azd env get API_KEY

# Перечислить все переменные окружения
azd env get-values

# Удалить переменную окружения
azd env unset DEBUG
```

## ⚙️ Конфигурационные Команды

### Глобальная Конфигурация
```bash
# Показать всю конфигурацию
azd config show

# Установить глобальные значения по умолчанию
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Удалить конфигурацию
azd config unset defaults.location

# Сбросить всю конфигурацию
azd config reset
```

### Конфигурация Проекта
```bash
# Проверить azure.yaml
azd config validate

# Показать информацию о проекте
azd show

# Получить конечные точки сервиса
azd show --output json
```

## 📊 Мониторинг и Диагностика

### Панель Мониторинга
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

### Просмотр Логов Контейнера
```bash
# Просмотр журналов через Azure CLI (для Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Отслеживание журналов в реальном времени
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Просмотр журналов из Azure Portal
azd monitor --logs
```

### Запросы Log Analytics
```bash
# Доступ к аналитике журналов через портал Azure
azd monitor --logs

# Запрос журналов с помощью Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команды Обслуживания

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

## 🔧 Продвинутые Команды

### Pipeline и CI/CD
```bash
# Настроить GitHub Actions
azd pipeline config

# Настроить Azure DevOps
azd pipeline config --provider azdo

# Показать конфигурацию пайплайна
azd pipeline show
```

### Управление Инфраструктурой
```bash
# Генерировать шаблоны инфраструктуры
azd infra generate

# 🧪 Предварительный просмотр и планирование инфраструктуры
azd provision --preview
# Имитирует предоставление инфраструктуры без развертывания
# Анализирует шаблоны Bicep/Terraform и показывает:
# - Ресурсы для добавления (зелёный +)
# - Ресурсы для изменения (жёлтый ~)
# - Ресурсы для удаления (красный -)
# Безопасно запускать — фактические изменения в среде Azure не вносятся

# Синтезировать инфраструктуру из azure.yaml
azd infra synth
```

### Информация о Проекте
```bash
# Показать статус проекта и конечные точки
azd show

# Показать подробную информацию о проекте в формате JSON
azd show --output json

# Получить конечные точки сервиса
azd show --output json | jq '.services'
```

## 🤖 Команды AI и Расширений

### Расширения AZD
```bash
# Перечислить все доступные расширения (включая ИИ)
azd extension list

# Установить расширение агентов Foundry
azd extension install azure.ai.agents

# Установить расширение тонкой настройки
azd extension install azure.ai.finetune

# Установить расширение пользовательских моделей
azd extension install azure.ai.models

# Обновить все установленные расширения
azd extension upgrade --all
```

### Команды AI Агента
```bash
# Инициализировать проект агента из манифеста
azd ai agent init -m <manifest-path-or-uri>

# Выбрать конкретный проект Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Указать исходный каталог агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Выбрать целевую платформу для размещения
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Альфа)
```bash
# Запустите MCP сервер для вашего проекта
azd mcp start

# Управляйте согласием на использование инструментов для операций MCP
azd copilot consent list
```

### Генерация Инфраструктуры
```bash
# Генерировать файлы IaC из определения вашего проекта
azd infra generate

# Синтезировать инфраструктуру из azure.yaml
azd infra synth
```

---

## 🎯 Быстрые Рабочие Процессы

### Рабочий Процесс Разработки
```bash
# Начать новый проект
azd init --template todo-nodejs-mongo
cd my-project

# Развернуть на разработку
azd env new dev
azd up

# Внести изменения и развернуть заново
azd deploy

# Открыть панель мониторинга
azd monitor --live
```

### Много-Средовой Рабочий Процесс
```bash
# Настроить окружения
azd env new dev
azd env new staging  
azd env new production

# Развернуть на dev
azd env select dev
azd up

# Тестировать и продвинуть на staging
azd env select staging
azd up

# Развернуть на production
azd env select production
azd up
```

### Рабочий Процесс Устранения Неполадок
```bash
# Включить режим отладки
export AZD_DEBUG=true

# Проверить статус развертывания
azd show

# Проверить конфигурацию
azd config show

# Открыть панель мониторинга для журналов
azd monitor --logs

# Проверить статус ресурсов
azd show --output json
```

## 🔍 Команды Отладки

### Отладочная Информация
```bash
# Включить вывод отладки
export AZD_DEBUG=true
azd <command> --debug

# Отключить телеметрию для более чистого вывода
export AZD_DISABLE_TELEMETRY=true

# Проверить текущую конфигурацию
azd config show

# Проверить статус аутентификации
az account show
```

### Отладка Шаблонов
```bash
# Список доступных шаблонов с подробностями
azd template list --output json

# Показать информацию о шаблоне
azd template show <template-name>

# Проверить шаблон перед инициализацией
azd template validate <template-name>
```

## 📁 Команды Файлов и Директорий

### Структура Проекта
```bash
# Показать структуру текущего каталога
tree /f  # Windows
find . -type f  # Linux/macOS

# Перейти к корню проекта azd
cd $(azd root)

# Показать каталог конфигурации azd
echo $AZD_CONFIG_DIR  # Обычно ~/.azd
```

## 🎨 Форматирование Вывода

### Вывод JSON
```bash
# Получить вывод в формате JSON для скриптинга
azd show --output json
azd env list --output json
azd config show --output json

# Разобрать с помощью jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Вывод в Таблице
```bash
# Отформатировать как таблицу
azd env list --output table

# Просмотреть развернутые сервисы
azd show --output json | jq '.services | keys'
```

## 🔧 Часто Используемые Комбинации Команд

### Скрипт Проверки Здоровья
```bash
#!/bin/bash
# Быстрая проверка состояния системы
azd show
azd env get-values
azd monitor --logs
```

### Проверка Развертывания
```bash
#!/bin/bash
# Предварительная проверка перед развертыванием
azd show
azd provision --preview  # Просмотр изменений перед развертыванием
az account show
```

### Сравнение Сред
```bash
#!/bin/bash
# Сравнить окружения
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Скрипт Очистки Ресурсов
```bash
#!/bin/bash
# Очистка старых окружений
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Переменные Окружения

### Общие Переменные Окружения
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

## 🚨 Аварийные Команды

### Быстрые Исправления
```bash
# Сбросить аутентификацию
az account clear
az login

# Принудительное обновление окружения
azd env refresh

# Повторно развернуть все сервисы
azd deploy

# Проверить статус развертывания
azd show --output json
```

### Команды Восстановления
```bash
# Восстановление после неудачного развертывания - очистка и повторное развертывание
azd down --force --purge
azd up

# Только повторное предоставление инфраструктуры
azd provision

# Только повторное развертывание приложения
azd deploy
```

## 💡 Полезные Советы

### Псевдонимы для Быстрого Рабочего Процесса
```bash
# Добавьте в ваш .bashrc или .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Сокращения Функций
```bash
# Быстрое переключение окружений
azd-env() {
    azd env select $1 && azd show
}

# Быстрое развёртывание с мониторингом
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

## 📖 Помощь и Документация

### Получение Помощи
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

### Ссылки на Документацию
```bash
# Открыть документацию в браузере
azd docs

# Показать документацию шаблона
azd template show <template-name> --docs
```

---

**Совет**: Добавьте эту шпаргалку в закладки и используйте `Ctrl+F`, чтобы быстро находить нужные команды!

---

**Навигация**
- **Предыдущий Урок**: [Проверки Перед Развертыванием](../docs/pre-deployment/preflight-checks.md)
- **Следующий Урок**: [Глоссарий](glossary.md)

---

> **💡 Хотите помощь по командам Azure в вашем редакторе?** Установите [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) с помощью `npx skills add microsoft/github-copilot-for-azure` — 37 скиллов для AI, Foundry, развертывания, диагностики и многого другого.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->