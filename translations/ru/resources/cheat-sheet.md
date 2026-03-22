# Справочник по командам - Основные команды AZD

**Быстрый справочник по всем главам**
- **📚 Главная страница курса**: [AZD для начинающих](../README.md)
- **📖 Быстрый старт**: [Глава 1: Основы и Быстрый старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-команды**: [Глава 2: Разработка с приоритетом на ИИ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Продвинутые**: [Глава 4: Инфраструктура как код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Введение

Этот комплексный справочник предоставляет быстрый доступ к наиболее часто используемым командам Azure Developer CLI, организованным по категориям с практическими примерами. Идеально подходит для быстрой проверки во время разработки, устранения неполадок и ежедневных операций с проектами azd.

## Цели обучения

Используя этот справочник, вы сможете:
- Мгновенно получить доступ к основным командам и синтаксису Azure Developer CLI
- Понять организацию команд по функциональным категориям и вариантам использования
- Обратиться к практическим примерам типичных сценариев разработки и развертывания
- Использовать команды для устранения неполадок для быстрого решения проблем
- Эффективно находить расширенные настройки и варианты кастомизации
- Управлять окружениями и рабочими процессами с несколькими средами

## Результаты обучения

Регулярное обращение к этому справочнику позволит вам:
- Уверенно выполнять команды azd без необходимости обращения к полной документации
- Быстро устранять распространённые проблемы с помощью подходящих диагностических команд
- Эффективно управлять несколькими средами и сценариями развертывания
- Применять продвинутые возможности и настройки azd по мере необходимости
- Диагностировать проблемы развертывания, используя систематические последовательности команд
- Оптимизировать рабочие процессы посредством эффективного использования ярлыков и опций azd

## Команды для начала работы

### Аутентификация
```bash
# Вход в Azure через AZD
azd auth login

# Вход в Azure CLI (AZD использует это под капотом)
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

# Инициализировать в текущей директории
azd init .

# Инициализировать с пользовательским именем
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основные команды развертывания

### Полный рабочий процесс развертывания
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

### Только инфраструктура
```bash
# Предоставить ресурсы Azure
azd provision

# 🧪 Предварительный просмотр изменений инфраструктуры
azd provision --preview
# Показывает имитацию того, какие ресурсы будут созданы/изменены/удалены
# Аналогично 'terraform plan' или 'bicep what-if' — безопасно запускать, изменения не применяются
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
# Создавайте приложения
azd package

# Создайте конкретный сервис
azd package --service api
```

## 🌍 Управление окружением

### Операции с окружениями
```bash
# Перечислить все окружения
azd env list

# Создать новое окружение
azd env new development
azd env new staging --location westus2

# Выбрать окружение
azd env select production

# Показать текущее окружение
azd env show

# Обновить состояние окружения
azd env refresh
```

### Переменные окружения
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
# Список всех конфигураций
azd config list

# Установить глобальные настройки по умолчанию
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Удалить конфигурацию
azd config unset defaults.location

# Сбросить все настройки конфигурации
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

# Открыть метрики в реальном времени Application Insights
azd monitor --live

# Открыть вкладку журналов Application Insights
azd monitor --logs

# Открыть обзор Application Insights
azd monitor --overview
```

### Просмотр логов контейнеров
```bash
# Просмотр логов через Azure CLI (для Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Отслеживание логов в реальном времени
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Просмотр логов через Azure Portal
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

## 🛠️ Команды обслуживания

### Очистка
```bash
# Удалить все ресурсы Azure
azd down

# Принудительно удалить без подтверждения
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
azd config list
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
# Генерация шаблонов инфраструктуры
azd infra generate

# 🧪 Предварительный просмотр и планирование инфраструктуры
azd provision --preview
# Симуляция развертывания инфраструктуры без фактической установки
# Анализирует шаблоны Bicep/Terraform и показывает:
# - Ресурсы, которые будут добавлены (зеленый +)
# - Ресурсы, которые будут изменены (желтый ~)
# - Ресурсы, которые будут удалены (красный -)
# Безопасно для запуска - фактические изменения в среде Azure не вносятся

# Синтезирует инфраструктуру из azure.yaml
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
# Список всех доступных расширений (включая AI)
azd extension list

# Установить расширение агентов Foundry
azd extension install azure.ai.agents

# Установить расширение для тонкой настройки
azd extension install azure.ai.finetune

# Установить расширение пользовательских моделей
azd extension install azure.ai.models

# Обновить все установленные расширения
azd extension upgrade --all
```

### AI-агенты
```bash
# Инициализировать проект агента из манифеста
azd ai agent init -m <manifest-path-or-uri>

# Выбрать конкретный проект Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Указать исходный каталог агента
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Выбрать целевую платформу размещения
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP-сервер (альфа)
```bash
# Запустите MCP сервер для вашего проекта
azd mcp start

# Управляйте согласием на использование инструментов для операций MCP
azd mcp consent
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

# Развернуть для разработки
azd env new dev
azd up

# Внести изменения и развернуть снова
azd deploy

# Открыть панель мониторинга
azd monitor --live
```

### Мультисредовой рабочий процесс
```bash
# Настроить окружения
azd env new dev
azd env new staging  
azd env new production

# Развернуть на дев
azd env select dev
azd up

# Тестировать и продвинуть на стейджинг
azd env select staging
azd up

# Развернуть на продакшн
azd env select production
azd up
```

### Рабочий процесс устранения неполадок
```bash
# Включить режим отладки
export AZD_DEBUG=true

# Проверить статус развертывания
azd show

# Проверить конфигурацию
azd config list

# Открыть панель мониторинга для просмотра журналов
azd monitor --logs

# Проверить состояние ресурсов
azd show --output json
```

## 🔍 Команды отладки

### Отладочная информация
```bash
# Включить вывод отладки
export AZD_DEBUG=true
azd <command> --debug

# Отключить телеметрию для более чистого вывода
export AZD_DISABLE_TELEMETRY=true

# Проверить текущую конфигурацию
azd config list

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

## 📁 Команды для файлов и директорий

### Структура проекта
```bash
# Показать текущую структуру каталога
tree /f  # Windows
find . -type f  # Linux/macOS

# Перейти в корневую папку проекта azd
cd $(azd root)

# Показать каталог конфигурации azd
echo $AZD_CONFIG_DIR  # Обычно ~/.azd
```

## 🎨 Форматирование вывода

### Вывод в формате JSON
```bash
# Получить JSON-вывод для скриптинга
azd show --output json
azd env list --output json
azd config list --output json

# Разобрать с помощью jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Вывод в табличном формате
```bash
# Форматировать как таблицу
azd env list --output table

# Просмотреть развернутые сервисы
azd show --output json | jq '.services | keys'
```

## 🔧 Часто используемые комбинации команд

### Скрипт проверки здоровья
```bash
#!/bin/bash
# Быстрая проверка состояния системы
azd show
azd env show
azd monitor --logs
```

### Проверка развертывания
```bash
#!/bin/bash
# Предварительная проверка перед развертыванием
azd show
azd provision --preview  # Предварительный просмотр изменений перед развертыванием
az account show
```

### Сравнение окружений
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
# Очистка старых окружений
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Переменные окружения

### Распространённые переменные окружения
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

### Быстрые исправления
```bash
# Сбросить аутентификацию
az account clear
az login

# Принудительно обновить окружение
azd env refresh

# Повторно развернуть все сервисы
azd deploy

# Проверить статус развертывания
azd show --output json
```

### Команды восстановления
```bash
# Восстановление после неудачного развертывания - очистка и повторное развертывание
azd down --force --purge
azd up

# Только повторное обеспечение инфраструктуры
azd provision

# Только повторное развертывание приложения
azd deploy
```

## 💡 Полезные советы

### Псевдонимы для ускорения работы
```bash
# Добавьте в ваш .bashrc или .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Ярлыки функций
```bash
# Быстрое переключение окружения
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
    azd env show
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

# Показать документацию шаблона
azd template show <template-name> --docs
```

---

**Совет**: Добавьте этот справочник в закладки и используйте `Ctrl+F`, чтобы быстро найти нужные команды!

---

**Навигация**
- **Предыдущий урок**: [Проверки перед развертыванием](../docs/pre-deployment/preflight-checks.md)
- **Следующий урок**: [Глоссарий](glossary.md)

---

> **💡 Хотите помощь с командами Azure прямо в вашем редакторе?** Установите [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) через `npx skills add microsoft/github-copilot-for-azure` — 37 навыков для ИИ, Foundry, развертывания, диагностики и многого другого.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется обратиться к профессиональному переводу, выполненному человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->