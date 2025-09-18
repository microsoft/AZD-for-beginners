<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-18T11:53:01+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "sr"
}
-->
# Команда Чит Лист - Основне AZD Команде

**Брзи референтни водич за сва поглавља**
- **📚 Почетна страна курса**: [AZD за почетнике](../README.md)
- **📖 Брзи почетак**: [Поглавље 1: Основе и брзи почетак](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Команде**: [Поглавље 2: Развој са AI у фокусу](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Напредно**: [Поглавље 4: Инфраструктура као код](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Увод

Овај свеобухватни чит лист пружа брзи референтни водич за најчешће коришћене Azure Developer CLI команде, организоване по категоријама са практичним примерима. Савршен за брзо претраживање током развоја, решавања проблема и свакодневног рада са azd пројектима.

## Циљеви учења

Коришћењем овог чит листа, моћи ћете:
- Да имате тренутни приступ основним Azure Developer CLI командама и синтакси
- Да разумете организацију команди по функционалним категоријама и случајевима употребе
- Да се позовете на практичне примере за уобичајене сценарије развоја и имплементације
- Да приступите командама за решавање проблема ради брзог отклањања грешака
- Да ефикасно пронађете напредне опције конфигурације и прилагођавања
- Да лоцирате команде за управљање окружењем и рад са више окружења

## Исходи учења

Редовним коришћењем овог чит листа, бићете у могућности да:
- Са самопоуздањем извршавате azd команде без потребе за комплетном документацијом
- Брзо решавате уобичајене проблеме коришћењем одговарајућих дијагностичких команди
- Ефикасно управљате више окружења и сценарија имплементације
- Примените напредне azd функције и опције конфигурације по потреби
- Решавате проблеме са имплементацијом коришћењем систематских секвенци команди
- Оптимизујете радне токове кроз ефикасно коришћење azd пречица и опција

## Команде за почетак

### Аутентификација
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Иницијализација пројекта
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Основне команде за имплементацију

### Комплетан радни ток имплементације
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Само инфраструктура
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Само апликација
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Изградња и паковање
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

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

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Променљиве окружења
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Команде за конфигурацију

### Глобална конфигурација
```bash
# List all configuration
azd config list

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
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Надгледање и логови

### Логови апликације
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### Надгледање
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Команде за одржавање

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
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Напредне команде

### Пипелини и CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Управљање инфраструктуром
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Управљање сервисима
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Брзи радни токови

### Радни ток развоја
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### Радни ток са више окружења
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

### Радни ток за решавање проблема
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Команде за дебаговање

### Информације за дебаговање
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Дебаговање шаблона
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Команде за фајлове и директоријуме

### Структура пројекта
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Форматирање излаза

### JSON излаз
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Табеларни излаз
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Уобичајене комбинације команди

### Скрипта за проверу здравља
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Валидација имплементације
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Поређење окружења
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Скрипта за чишћење ресурса
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Променљиве окружења

### Уобичајене променљиве окружења
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Хитне команде

### Брза решења
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Команде за опоравак
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Савети за професионалце

### Алијаси за бржи радни ток
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Пречице за функције
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
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

**Савет**: Сачувајте овај чит лист у обележиваче и користите `Ctrl+F` за брзо проналажење команди које су вам потребне!

---

**Навигација**
- **Претходна лекција**: [Провере пре имплементације](../docs/pre-deployment/preflight-checks.md)
- **Следећа лекција**: [Речник](glossary.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.