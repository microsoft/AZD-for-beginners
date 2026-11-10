# Сводка команд - Основные команды AZD

**Быстрая справка по всем главам**
- **📚 Главная страница курса**: [AZD для начинающих](../README.md)
- **📖 Быстрый старт**: [Глава 1: Основы и быстрый старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Команды ИИ**: [Глава 2: Разработка с ИИ в приоритете](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Продвинутые**: [Глава 4: Инфраструктура как код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Введение

Этот подробный справочник предоставляет быструю справку по наиболее часто используемым командам Azure Developer CLI, организованным по категориям с практическими примерами. Идеально подходит для быстрого поиска в процессе разработки, устранения неполадок и ежедневных операций с проектами azd.

## Цели обучения

Используя этот справочник, вы:
- Будете иметь мгновенный доступ к основным командам и синтаксису Azure Developer CLI
- Поймёте организацию команд по функциональным категориям и сценариям использования
- Сможете обращаться к практическим примерам для распространённых задач разработки и развертывания
- Получите доступ к командам для устранения неполадок для быстрого решения проблем
- Найдёте эффективные варианты расширенной настройки и конфигурации
- Обнаружите команды управления окружениями и для рабочих процессов с несколькими окружениями

## Результаты обучения

Регулярно используя этот справочник, вы сможете:
- Выполнять команды azd с уверенностью без необходимости обращения к полной документации
- Быстро решать распространённые проблемы с помощью соответствующих диагностических команд
- Эффективно управлять несколькими окружениями и сценариями развертывания
- Применять продвинутые функции и параметры конфигурации azd по мере необходимости
- Устранять неполадки развертывания с помощью систематических последовательностей команд
- Оптимизировать рабочие процессы с эффективным использованием ярлыков и опций azd

## Начальные команды

### Аутентификация
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### Инициализация проекта
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## Основные команды развертывания

### Полный рабочий процесс развертывания
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### Только инфраструктура
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Только приложение
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Сборка и упаковка
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** загружает зависимости вашего приложения (npm, pip, NuGet, Maven и т.д.). Он запускается автоматически во время `azd package` и `azd deploy`, поэтому вы редко вызываете его напрямую — запускать вручную имеет смысл для предварительной загрузки зависимостей (например, для разогрева кэша CI или работы в офлайн-режиме позже).

> **`azd package`** подготавливает артефакт для развертывания без развертывания службы приложения. Поведение зависит от языка и хоста: упаковка контейнера может использовать удалённые сборки Azure и публиковать изображения в реестр, поэтому это не обязательно офлайн или без записи в Azure. `azd deploy` может упаковывать автоматически; используйте отдельный этап упаковки, когда нужен артефакт или проверка сборки.


## 🌍 Управление окружениями

### Операции с окружениями
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### Переменные окружения
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

Файлы окружения — это обычный текст. Не используйте `azd env set` как хранилище секретов; используйте ссылки на Key Vault или управляемую идентичность по необходимости.

## ⚙️ Команды конфигурации

### Глобальная конфигурация
```bash
# List all configuration
azd config show

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Конфигурация проекта
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Мониторинг и диагностика

### Панель мониторинга
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

Application Insights должен быть настроен шаблоном. Функция Live Metrics в AZD в настоящее время не поддерживается для Python-приложений; используйте обзор, логи или документированный в примере рабочий процесс трассировки.

### Просмотр логов контейнеров
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Запросы Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команды обслуживания

### Очистка
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### Обновления
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Продвинутые команды

### Конвейер и CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Управление инфраструктурой
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### Информация о проекте
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Команды ИИ и расширения

### Расширения AZD

Справка по AI CLI проверена 2026-11-04: `azd 1.37.2`, агенты `1.0.0-beta.23`, оценки `1.0.0-beta.2`. Используйте `azd >= 1.37.0` для объединённого рабочего процесса; обновите основной CLI перед несовместимыми расширениями.

```bash
# List all available extensions (including AI)
azd extension list

# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the agent skills extension (preview)
azd extension install azure.ai.skills

# Install the Foundry connections extension (preview)
azd extension install azure.ai.connections

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Upgrade all installed extensions
azd extension upgrade --all
```

### Команды агентов ИИ
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` заменяет устаревшее написание `--manifest`/`-m`; старые манифесты требуют миграции. Текущей опции agent-init `--host containerapp` нет. Предварительные версии с управляемым окружением, голосом и долгой работой требуют отдельного включения в shell/CI; смотрите [справку AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Оценки и оптимизация ИИ
```bash
# In an initialized agent project, configure evaluation resources
azd ai eval init

# Optionally generate a rubric and dataset; review files and printed next steps
azd ai eval generate

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Агенты beta.22 заменили устаревшие команды оценки на `azd ai eval` из `azure.ai.evaluations`. Новая конфигурация оценки использует camelCase ключи. Оптимизация `--config` требует отдельного запроса к API оптимизации, **не** устаревшего `eval.yaml` или нового `azure.eval.yaml`; используйте `--eval`/`--eval-config` для повторного использования оценки. Смотрите [настройку оценки](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) и [миграцию оптимизации](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP Server (Альфа)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Генерация инфраструктуры
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Быстрые рабочие процессы

### Рабочий процесс разработки
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### Рабочий процесс с несколькими окружениями
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### Рабочий процесс устранения неполадок
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 Команды отладки

### Отладочная информация
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### Отладка шаблонов
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Команды для работы с файлами и каталогами

### Структура проекта
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Форматирование вывода

### Вывод JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Вывод таблицей
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Часто используемые комбинации команд

### Скрипт проверки состояния
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Проверка развертывания
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Сравнение окружений
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Скрипт очистки ресурсов
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Переменные окружения

### Распространённые переменные окружения
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Аварийные команды

### Быстрые исправления
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### Команды восстановления
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Полезные советы

### Алиасы для ускорения работы
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Ярлыки функций
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Справка и документация

### Получение помощи
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Ссылки на документацию
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Совет**: Добавьте эту сводку в закладки и используйте `Ctrl+F` для быстрого поиска нужных команд!

---

**Навигация**
- **Предыдущий урок**: [Предварительные проверки](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Следующий урок**: [Глоссарий](glossary.md)

---

> **💡 Хотите помощь по командам Azure в вашем редакторе?** Установите [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) с `npx skills add microsoft/github-copilot-for-azure` — 37 навыков для ИИ, Foundry, развертывания, диагностики и другого.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->