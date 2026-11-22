# Команден наръчник - Основни команди на AZD

**Бърз справочник за всички глави**
- **📚 Дом на курса**: [AZD за начинаещи](../README.md)
- **📖 Бърз старт**: [Глава 1: Основи и бърз старт](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команди**: [Глава 2: Разработване с приоритет AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Напреднали**: [Глава 4: Инфраструктура като код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Въведение

Този изчерпателен наръчник предоставя бърз справочник за най-често използваните команди на Azure Developer CLI, организирани по категории с практически примери. Перфектен за бързи справки по време на разработка, отстраняване на проблеми и ежедневни операции с проекти azd.

## Цели на обучението

Чрез използване на този наръчник ще:
- Имате мигновен достъп до основни команди и синтаксис на Azure Developer CLI
- Разбирате организацията на командите по функционални категории и сценарии на употреба
- Преглеждате практически примери за често срещани сценарии за разработка и внедряване
- Достъпвате команди за отстраняване на проблеми за бързо решаване на неизправности
- Намерите ефективно опции за напреднала конфигурация и персонализация
- Локализирате команди за управление на среди и работни процеси с множество среди

## Резултати от обучението

Редовното използване на този наръчник ще ви помогне да:
- Изпълнявате команди azd уверено без да се налага да се консултирате с пълната документация
- Бързо решавате често срещани проблеми с подходящи диагностични команди
- Ефективно управлявате множество среди и сценарии на внедряване
- Прилагате напреднали функции и опции на azd според нуждите
- Отстранявате проблеми с внедряването чрез систематични последователности от команди
- Оптимизирате работните процеси чрез ефективно използване на съкращения и опции на azd

## Команди за започване

### Удостоверяване
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

### Инициализация на проект
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

## Основни команди за внедряване

### Пълен работен процес за внедряване
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

### Само инфраструктура
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Само приложение
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Създаване и пакетиране
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

> **`azd restore`** изтегля зависимостите на вашето приложение (npm, pip, NuGet, Maven и др.). Работи автоматично по време на `azd package` и `azd deploy`, затова рядко се извиква директно — изпълнете го ръчно за предварително изтегляне на зависимостите (например за затопляне на кеш на CI или работа офлайн по-късно).

> **`azd package`** подготвя deployable артефакт без да внедрява услугата на приложението. Поведението зависи от езика и хоста: пакетиране на контейнер може да използва отдалечени изграждания в Azure и да публикува изображения в регистър, затова не винаги е офлайн или без записи в Azure. `azd deploy` може да пакетира автоматично; използвайте отделна стъпка за пакетиране, когато ви е нужен артефакт или проверка на изграждането.


## 🌍 Управление на среди

### Операции със среди
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

### Променливи на средата
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

Файловете на средата са текстови. Не третирайте `azd env set` като секретно хранилище; използвайте препратки към Key Vault или управлявана идентичност според случая.

## ⚙️ Команди за конфигурация

### Глобална конфигурация
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

### Конфигурация на проект
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Мониторинг и диагностика

### Табло за мониторинг
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

Application Insights трябва да бъде конфигуриран от шаблона. Опцията Live Metrics на AZD в момента не се поддържа за Python приложения; вместо това използвайте прегледа, логовете или документирания работен процес за проследяване в примера.

### Преглед на логове от контейнери
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Запитвания в Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Команди за поддръжка

### Почистване
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

### Актуализации
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Напреднали команди

### Pipeline и CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Управление на инфраструктурата
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

### Информация за проект
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI и разширения

### Разширения на AZD

Актуализация на справката за Foundry GA 2026-11-09: пакет `microsoft.foundry` 1.0, обявен на [5 ноември 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Използвайте `azd >= 1.37.0`; компонентите имат независимо версиониране и опционалните функции в предварителен преглед запазват своя статус.

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

Пакетът не включва оценки, набори от данни, фино настройване или персонализирани модели. Инсталирането на отделни основни разширения остава поддържано. Следвайте [ръководството за GA hosted-agent](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) за изпълним пример с Python 3.13+, актуален uv, разрешения и квота за модели.

### AI агентски команди
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

`--template`/`-t` замества остарялото `--manifest`/`-m` изписване; наследствените manifest-и трябва да се мигрират. В момента няма agent-init `--host containerapp` опция. Управлявани harness, гласови и дълготрайни предварителни прегледи изискват отделни опции за shell/CI среди; вижте [справката AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Локалното тестване все още използва Azure разгръщания на модели и носи разходи. За почистване `azd down` изтрива ресурсната група на новосъздаден Foundry проект, но оставя ресурсите на повторно използван проект на място; премахвайте само нежелани ресурси, които притежавате отделно.

### Оценки и оптимизация на AI
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

Агентите beta.22 замениха наследствените оценъчни команди с `azd ai eval` от `azure.ai.evaluations`. Новата конфигурация на оценката използва camelCase ключове. Оптимизацията `--config` приема отделна заявка към API за оптимизация, **не** наследствените `eval.yaml` или новите `azure.eval.yaml`; използвайте `--eval`/`--eval-config` за повторна употреба на оценка. Вижте [настройка на оценка](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) и [миграция на оптимизация](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Foundry CI/CD
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

Фрагментът на runner не е пълен работен процес. Качете проверена конфигурация за оценка и не-секретни активи, предоставете достъп до набори от данни/оценяващи/модели и използвайте по една среда за всеки етап. Вижте [пример за удостоверено CI/CD](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP сървър (Алфа)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Генериране на инфраструктура
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Бързи работни процеси

### Работен процес за разработка
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

### Работен процес с множество среди
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

### Работен процес за отстраняване на проблеми
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

## 🔍 Команди за дебъгинг

### Информация за дебъгинг
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

### Дебъгинг на шаблони
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Команди за файлове и директории

### Структура на проект
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Форматиране на изход

### JSON изход
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Табличен изход
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Често използвани комбинации от команди

### Скрипт за проверка на здравето
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Валидация на внедряване
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Сравнение на среди
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Скрипт за почистване на ресурси
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Променливи на средата

### Често срещани променливи на средата
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

## 🚨 Аварийни команди

### Бързи поправки
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

### Команди за възстановяване
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Професионални съвети

### Псевдоними за по-бърз работен процес
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Преки пътища за функции
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

## 📖 Помощ и документация

### Получаване на помощ
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

### Връзки към документация
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Съвет**: Добавете този наръчник в отметки и използвайте `Ctrl+F`, за да намерите бързо нужните команди!

---

**Навигация**
- **Предишен урок**: [Проверки преди стартиране](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Следващ урок**: [Речник](glossary.md)

---

> **💡 Искате помощ за Azure команди във вашия редактор?** Инсталирайте [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) с `npx skills add microsoft/github-copilot-for-azure` — 37 умения за AI, Foundry, внедряване, диагностика и още.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->