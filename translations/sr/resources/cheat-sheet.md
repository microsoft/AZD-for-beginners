# Претрага команди - Основне AZD команде

**Брзи преглед за све поглавља**
- **📚 Почетна страница курса**: [AZD за почетнике](../README.md)
- **📖 Брз почетак**: [Поглавље 1: Основа и брз почетак](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI команде**: [Поглавље 2: Развој са AI у првом плану](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Напредно**: [Поглавље 4: Инфраструктура као код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Увод

Ова свеобухватна прегледна листа пружа брз приступ најчешће коришћеним Azure Developer CLI командама, организованим по категоријама са практичним примерима. Савршена за брзи преглед током развоја, решавања проблема и свакодневних операција са azd пројектима.

## Циљеви учења

Коришћењем ове прегледне листе, ви ћете:
- Имати тренутни приступ основним Azure Developer CLI командама и синтакси
- Разумети организацију команда по функционалним категоријама и случајевима употребе
- Примати практичне примере за уобичајене сценарије развоја и имплементације
- Приступити командама за решавање проблема ради брзог отклањања кварова
- Пронаћи напредне опције конфигурације и прилагођавања ефикасно
- Лоцирати команде за управљање окружењем и мулти-окружни радни ток

## Резултати учења

Редовним коришћењем ове прегледне листе, моћи ћете да:
- Извршавате azd команде самоуверено без разматрања целокупне документације
- Брзо решавате уобичајене проблеме користећи одговарајуће дијагностичке команде
- Ефикасно управљате вишеструким окружењима и сценаријима имплементације
- Примењујете напредне azd функције и опције конфигурације по потреби
- Решавате проблеме са имплементацијом употребом систематских секвенци команди
- Оптимизујете радне токове кроз ефикасну употребу azd пречица и опција

## Команде за почетак рада

### Аутентификација
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

### Иницијализација пројекта
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

## Основне команде за имплементацију

### Комплетан ток радње имплементације
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

### Само апликација
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Саградити и упаковани
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

> **`azd restore`** преузима зависности ваше апликације (npm, pip, NuGet, Maven, итд.). Покреће се аутоматски током `azd package` и `azd deploy`, тако да га ретко позивате директно — покрените га ручно за претходно преузимање зависности (на пример, да бисте загрејали кеш CI-а или радили ван мреже након тога).

> **`azd package`** припрема артефакт спреман за имплементацију без развоја сервиса апликације. Понашање зависи од језика и хоста: паковање контејнера може користити Azure удаљене билде и објављивати слике у регистар, тако да није нужно ван мреже или без Azure уписа. `azd deploy` може аутоматски пакетирати; употребите посебан корак паковања када вам треба артефакт или проверa билда.


## 🌍 Управљање окружењем

### Операције са окружењем
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

### Променљиве окружења
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

Фајлови окружења су у обичном тексту. Не третирајте `azd env set` као складиште тајни; користите Key Vault референце или управљани идентитет према потреби.

## ⚙️ Конфигурацијске команде

### Глобална конфигурација
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

### Конфигурација пројекта
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Праћење и дијагностика

### Контролна табла за праћење
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

Application Insights мора бити конфигурисан шаблоном. AZD-ова опција Live Metrics још није подржана за Python апликације; користите преглед, логове или документовани радни ток трејсинга узорка.

### Проследивање логова контејнера
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Лог аналитићки упити
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Одржавање

### Чишћење
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

### Ажурирања
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Напредне команде

### Пипелин и CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Управљање инфраструктуром
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

### Информације о пројекту
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI и екстензије

### AZD екстензије

Foundry GA референца ажурирана 2026-11-09: `microsoft.foundry` пакет 1.0, објављен [5. новембар 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Користите `azd >= 1.37.0`; компоненте су независно верзионисане, а опционе preview функције задржавају свој статус.

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

Пакет не укључује евалуације, скупе података, фино подешавање нити прилагођене моделе. Инсталација појединачних језгрених екстензија и даље је подржана. Пратите [GA hosted-agent упутство](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) за покретни узорак са Python 3.13+, актуелним uv, дозволама и квотом модела.

### AI агенске команде
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

`--template`/`-t` замењује застарелу `--manifest`/`-m` форми; наслеђени манифести треба да се мигрирају. Тренутно нема agent-init `--host containerapp` опције. Managed-harness, voice и дуготрајни preview захтевају независно укључивање у shell/CI окружењима; видети [AI CLI референцу](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Локално тестирање и даље користи Azure имплементације модела и наплаћује се. За чишћење, `azd down` брише ново креирану Foundry resource group пројекта, али оставља ресурсе поновно коришћених пројеката; уклоните само непожељне ресурсе које поседујете посебно.

### AI евалуације и оптимизација
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

Agents beta.22 заменио је наслеђене евалуационе команде `azd ai eval` из `azure.ai.evaluations`. Нова конфигурација евалуације користи camelCase кључеве. Оптимизација `--config` захтева самосталан оптимизациони API захтев, **не** наслеђени `eval.yaml` или нови `azure.eval.yaml`; користите `--eval`/`--eval-config` за поновну употребу евалуације. Погледајте [поставку евалуације](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) и [миграцију оптимизације](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

Фрагмент рунера није комплетан ток радње. Потврдите прегледану конфигурацију евалуације и нетајне ресурсе, дајте приступ скупу података/евалутатору/моделу и користите окружење по фази. Погледајте [аутентификовани CI/CD пример](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP Сервер (Алфа)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Генерација инфраструктуре
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Брзи радни токови

### Развојни радни ток
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

### Мулти-окружни радни ток
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

### Радни ток решавања проблема
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

## 🔍 Команде за отклањање грешака

### Дијагностичке информације
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

### Темељно отклањање у шаблону
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Команде за рад са фајловима и фасциклама

### Структура пројекта
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Форматирање излаза

### JSON излаз
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Излаз у табели
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Честа комбиновања команда

### Скрипта за проверу здравља
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Валидација имплементације
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Поређење окружења
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Скрипта за чишћење ресурса
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Променљиве окружења

### Уобичајене променљиве окружења
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

## 🚨 Команде за хитне случајеве

### Брзе поправке
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

### Команде за опоравак
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Професионални савети

### Алијаси за бржи радни ток
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Пречице за функције
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

## 📖 Помоћ и документација

### Добијање помоћи
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

### Линкови ка документацији
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Савет**: Зачувајте ову прегледну листу и користите `Ctrl+F` да брзо пронађете команде које су вам потребне!

---

**Навигација**
- **Претходна лекција**: [Претходне провере](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Следећа лекција**: [Глосар](glossary.md)

---

> **💡 Желите помоћ о Azure командама у вашем уређивачу?** Инсталирајте [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) са `npx skills add microsoft/github-copilot-for-azure` — 37 вештина за AI, Foundry, имплементацију, дијагностику и још много тога.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->