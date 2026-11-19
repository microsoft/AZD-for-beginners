# Шпаргалка команд - Основні команди AZD

**Швидкий довідник по всіх розділах**
- **📚 Головна сторінка курсу**: [AZD Для початківців](../README.md)
- **📖 Швидкий старт**: [Розділ 1: Основи та швидкий старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Команди ШІ**: [Розділ 2: Розробка з пріоритетом ШІ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Просунуті**: [Розділ 4: Інфраструктура як код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Вступ

Ця комплексна шпаргалка надає швидкий довідник з найбільш використовуваних команд Azure Developer CLI, організованих за категоріями з практичними прикладами. Ідеально підходить для швидкого пошуку під час розробки, діагностики та щоденних операцій з проєктами azd.

## Цілі навчання

Використовуючи цю шпаргалку, ви зможете:
- Мати миттєвий доступ до основних команд Azure Developer CLI та синтаксису
- Розуміти організацію команд за функціональними категоріями та випадками використання
- Посилатися на практичні приклади для типових сценаріїв розробки та розгортання
- Отримувати доступ до команд усунення несправностей для швидкого вирішення проблем
- Знаходити опції розширених налаштувань та кастомізації ефективно
- Керувати командами для управління середовищем та робочими процесами в кількох середовищах

## Результати навчання

Регулярно посилаючись на цю шпаргалку, ви зможете:
- Виконувати команди azd впевнено, не звертаючись до повної документації
- Швидко вирішувати типові проблеми за допомогою відповідних діагностичних команд
- Ефективно керувати кількома середовищами та сценаріями розгортання
- Застосовувати розширені функції та параметри azd за потреби
- Вирішувати проблеми з розгортанням за допомогою систематичних послідовностей команд
- Оптимізувати робочі процеси за допомогою ефективного використання скорочень та опцій azd

## Команди для початку роботи

### Аутентифікація
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

### Ініціалізація проєкту
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

## Основні команди розгортання

### Повний робочий процес розгортання
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

### Лише інфраструктура
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Лише застосунок
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Збірка та пакування
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

> **`azd restore`** завантажує залежності вашого застосунку (npm, pip, NuGet, Maven тощо). Він запускається автоматично під час `azd package` та `azd deploy`, тож ви рідко викликаєте його безпосередньо — запускайте вручну для попереднього завантаження залежностей (наприклад, щоб прогріти кеш CI або працювати офлайн згодом).

> **`azd package`** готує артефакт для розгортання без самого розгортання сервісу застосунку. Поведінка залежить від мови та середовища: пакування контейнера може використовувати віддалені збірки Azure і публікувати образи в реєстр, тож це не обов’язково офлайн або вільно від записів Azure. `azd deploy` може пакувати автоматично; використовуйте окремий крок пакування, коли потрібен артефакт або перевірка збірки.


## 🌍 Керування середовищем

### Операції зі середовищем
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

### Змінні середовища
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

Файли середовищ – це звичайний текст. Не розглядайте `azd env set` як сховище секретів; використовуйте посилання на Key Vault або керовану ідентичність за потреби.

## ⚙️ Команди конфігурації

### Глобальна конфігурація
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

### Конфігурація проєкту
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Моніторинг і діагностика

### Панель моніторингу
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

Application Insights має бути налаштовано шаблоном. Опція Live Metrics AZD наразі не підтримується для Python-застосунків; замість неї використовуйте огляд, логи або документований робочий процес трасування з прикладу.

### Перегляд логів контейнера
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Запити Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команди обслуговування

### Очищення
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

### Оновлення
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Просунуті команди

### Конвеєр та CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Управління інфраструктурою
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

### Інформація про проєкт
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Команди ШІ та розширень

### Розширення AZD

Оновлення посилання Foundry GA 2026-11-09: `microsoft.foundry` bundle 1.0, анонсовано [5 листопада 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Використовуйте `azd >= 1.37.0`; компоненти мають незалежне версіонування і попередні функції зберігають власний статус.

```bash
# List all available extensions (including AI)
azd extension list

# Check/update the core CLI before updating extensions
azd version
azd update

# Install the GA bundle (agents, connections, inspector, projects,
# routines, skills, and toolboxes)
azd ext install microsoft.foundry

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Inspect installed versions and upgrade the bundle
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Пакет не включає оцінювання, набори даних, додаткове налаштування або кастомні моделі. Встановлення окремих основних розширень залишається підтримуваним. Виконуйте [покроковий посібник з GA hosted-agent](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) для запуску прикладу з Python 3.13+, поточним uv, дозволами та квотою моделей.

### Команди Агента ШІ
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# For a code-based hosted agent, add --deploy-mode code during init
# Review azure.yaml, then provision before running locally
azd provision
azd ai agent run

# In a second terminal in the same project directory
azd ai agent invoke --local "Explain how this agent is deployed."

# Upload source for a remote Foundry build (code mode)
azd deploy

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Review hosted-agent changes, stream logs, or diagnose permissions
azd deploy --preview
azd ai agent monitor --follow
azd ai agent doctor

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` замінює застаріле написання `--manifest`/`-m`; потрібно міграція старих манифестів. Поточної опції agent-init `--host containerapp` немає. Managed-harness, голосові та довготривалі попередні перегляди потребують окремих підключень у оболонці/CI-середовищі; див. [довідник AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Локальне тестування все ще використовує розгортання моделей Azure і має відповідні витрати. Для очищення `azd down` видаляє групу ресурсів нещодавно створеного проєкту Foundry, але залишає ресурси повторно використовуваних проєктів; видаляйте небажані ресурси, що належать вам, окремо.

### Оцінювання ШІ та оптимізація
```bash
# Generate and review a draft dataset and rubric (Dataset and evaluator / Turn)
azd ai eval generate

# In the initialized agent project, select those assets and a judge model
azd ai eval init --name quality

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --eval quality --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Агент beta.22 замінив старі команди оцінювання на `azd ai eval` від `azure.ai.evaluations`. Нова конфігурація оцінювання використовує camelCase ключі. Оптимізація `--config` вимагає окремого запиту API оптимізації, **не** старого `eval.yaml` або нового `azure.eval.yaml`; використовуйте `--eval`/`--eval-config` для повторного використання оцінювання. Див. [налаштування оцінювання](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) та [міграція оптимізації](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### CI/CD Foundry
```bash
# After a successful local deployment, generate and review the pipeline
azd up
azd pipeline config

# Runner steps: install extensions, authenticate, then deploy
azd ext install microsoft.foundry azure.ai.evaluations
# Keep the generated OIDC sign-in and environment settings here
azd up --no-prompt
azd ai eval run start --eval quality --wait --no-prompt --fail-on "pass-rate=0.9"
```

Фрагмент раннера не є повним робочим процесом. Зафіксуйте перевірену конфігурацію оцінювання та не секретні активи, надайте доступ до наборів даних/оціночних модулів/моделей, і використовуйте окреме середовище для кожного етапу. Див. [приклад автентифікованого CI/CD](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### Сервер MCP (Альфа)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Генерація інфраструктури
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Швидкі робочі процеси

### Робочий процес розробки
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

### Робочий процес для кількох середовищ
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

### Робочий процес усунення несправностей
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

## 🔍 Команди для відлагодження

### Інформація для відлагодження
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

### Відлагодження шаблонів
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Команди для файлів і директорій

### Структура проєкту
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Форматування виводу

### Вивід у форматі JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Вивід у форматі таблиці
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Звичайні комбінації команд

### Скрипт перевірки здоров’я
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Перевірка валідності розгортання
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Порівняння середовищ
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Скрипт очищення ресурсів
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Змінні середовища

### Загальні змінні середовища
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

## 🚨 Аварійні команди

### Швидкі виправлення
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

### Команди відновлення
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Поради професіоналів

### Аліаси для швидшої роботи
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Скорочення для функцій
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

## 📖 Допомога та документація

### Отримання допомоги
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

### Посилання на документацію
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Порада**: Додайте цю шпаргалку в закладки та використовуйте `Ctrl+F`, щоб швидко знаходити потрібні команди!

---

**Навігація**
- **Попередній урок**: [Перевірка перед польотом](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Наступний урок**: [Глосарій](glossary.md)

---

> **💡 Хочете допомогу з командами Azure у вашому редакторі?** Встановіть [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) з `npx skills add microsoft/github-copilot-for-azure` — 37 навичок для ШІ, Foundry, розгортання, діагностики та іншого.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->