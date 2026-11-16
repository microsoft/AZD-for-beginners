# Руководство по развертыванию - Мастерство AZD Deployments

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 4 - Инфраструктура как код и развертывание
- **⬅️ Предыдущая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)
- **➡️ Следующая**: [Provisioning Resources](provisioning.md)
- **🧩 Также в этой главе**: [Создание собственного шаблона](custom-templates.md)
- **🚀 Следующая глава**: [Глава 5: Многоагентные AI решения](../../examples/retail-scenario.md)

## Введение

> Проверено с использованием `azd 1.37.2` (ноябрь 2026). Команды используют Bash; примеры JSON требуют `jq`. За исключением явно инициализированного упражнения todo, продвинутые примеры — это **фрагменты интеграции**: предоставьте собственные исходники, инфраструктуру, тесты и скрипты. Во время проверки развертывания в Azure не выполнялись.

Это комплексное руководство охватывает все, что нужно знать о развертывании приложений с помощью Azure Developer CLI: от простых однокомандных развертываний до сложных продакшн-сценариев с пользовательскими хуками, множественными окружениями и интеграцией CI/CD. Освойте полный жизненный цикл развертывания с практическими примерами и лучшими практиками.

## Цели обучения

После прохождения руководства вы сможете:
- Освоить все команды и рабочие процессы развертывания Azure Developer CLI
- Понять полный жизненный цикл развертывания от provision до мониторинга
- Реализовать пользовательские хуки для автоматизации до и после развертывания
- Конфигурировать множественные окружения с параметрами, специфичными для окружения
- Настроить продвинутые стратегии развертывания, включая blue-green и canary deployment
- Интегрировать azd развертывания с pipeline CI/CD и DevOps процессами

## Ожидаемые результаты обучения

По завершении вы сможете:
- Самостоятельно выполнять и устранять неполадки всех рабочих процессов azd развертывания
- Проектировать и реализовывать пользовательскую автоматизацию развертывания с использованием хуков
- Конфигурировать production-ready развертывания с надлежащей безопасностью и мониторингом
- Управлять сложными сценариями развертывания с несколькими окружениями
- Оптимизировать производительность развертывания и реализовывать стратегии отката
- Интегрировать azd развертывания в корпоративные DevOps практики

## Обзор развертывания

Azure Developer CLI предоставляет несколько команд для развертывания:
- `azd up` - Полный рабочий процесс (provision + deploy)
- `azd provision` - Создание/обновление только ресурсов Azure
- `azd deploy` - Развертывание только кода приложения
- `azd package` - Сборка и упаковка приложений

## Основные рабочие процессы развертывания

### Полное развертывание (azd up)
Самый распространенный рабочий процесс для новых проектов:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Развертывание только инфраструктуры
Когда нужно обновить только ресурсы Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Развертывание только кода
Для быстрого обновления приложения:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Проверка развертывания

После любого развертывания проверьте успешность:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Критерии успешности:**
- ✅ `azd show` разрешается к ожидаемым сервисным целям/URL
- ✅ Запросы к реальным маршрутам приложения возвращают ожидаемый статус и тело
- ✅ За последние 5 минут нет логов с ошибками
- ✅ Приложение отвечает на тестовые запросы

## 🏗️ Понимание процесса развертывания

### Новичок в хуках? Начните здесь

**Хук** — это команда, которую azd автоматически запускает в определенный момент развертывания — до или после provision, а также до или после деплоя кода. Они позволяют автоматизировать мелкие задачи, которые всегда сопровождают развертывание: инициализацию базы данных, миграции, сборку ассетов или базовое тестирование живого приложения.

| Хук | Запускается… | Обычно используется для |
|------|-------|------------|
| `preprovision` | Перед созданием ресурсов | Проверка предусловий, вход в реестр |
| `postprovision` | После создания ресурсов | Конфигурация ресурсов, настройка базы данных |
| `predeploy` | Перед деплоем кода | Сборка фронтенд ассетов, запуск unit-тестов |
| `postdeploy` | После запуска кода | Запуск миграций БД, базовое тестирование endpoint |

Хуки живут в вашем `azure.yaml`. Вот самый маленький возможный пример — просто выводит сообщение после развертывания:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Вот и всё — в следующий раз при запуске `azd up` сообщение будет автоматически выводиться. Вы также можете запускать хук отдельно, без полного развертывания, что отлично подходит для тестирования:

```bash
azd hooks run postdeploy
```

Ниже показаны реальные хуки (миграции, тесты, валидация) для каждой фазы.

### Фаза 1: Хуки до provision
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### Фаза 2: Provision инфраструктуры
- Чтение шаблонов инфраструктуры (Bicep/Terraform)
- Создание или обновление ресурсов Azure
- Настройка сетей и безопасности
- Настройка мониторинга и логирования

### Фаза 3: Хуки после provision
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### Фаза 4: Упаковка приложения
- Сборка кода приложения
- Создание артефактов развертывания
- Упаковка для целевой платформы (контейнеры, ZIP-файлы и т.д.)

### Фаза 5: Хуки перед деплоем
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### Фаза 6: Деплой приложения
- Развертывание упакованных приложений в сервисы Azure
- Обновление конфигурационных настроек
- Запуск/перезапуск сервисов

### Фаза 7: Хуки после деплоя
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Обработка ошибок хуков

По умолчанию, **если команда хука завершается с ненулевым кодом, azd прекращает всю операцию.** Это обычно желательное поведение — неудачная миграция должна останавливать развертывание, а не выпускать сломанное приложение. Но это требует аккуратного написания хуков.

**1. Делайте сбои громкими и намеренными.** Хук считается неуспешным, если его последняя команда возвращает ненулевой код выхода. В shell-скриптах добавьте `set -e`, чтобы хук прекращался при первой ошибке, а не продолжал молча:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Позвольте хуку завершиться с ошибкой, не останавливая azd.** Для некритичных шагов (опциональный разогрев кеша, уведомление best-effort) установите `continueOnError: true`. azd залогирует ошибку, но продолжит выполнение:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Тестируйте хуки по отдельности перед полным запуском.** Для отладки не обязательно запускать `azd up` — запустите хук отдельно и быстро вносите изменения:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Учитывайте особенности shell в ОС.** Хук, использующий `shell: pwsh`, требует установленного PowerShell на машине, запускающей его (включая CI-агентов). Используйте `shell: sh` для максимальной переносимости или предусмотрите обе версии `windows` и `posix`:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **Совет по отладке:** Запускайте любую azd команду с `--debug`, чтобы увидеть точную команду хука и полный вывод — бесценно, когда хук работает локально, но падает в CI.

## 🎛️ Конфигурация развертывания

### Настройки развертывания для конкретных сервисов
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Конфигурации, специфичные для окружения

Это локальные значения azd. Явно сопоставьте их с конфигурацией инфраструктуры/рантайма. `NODE_ENV` обычно `production` для развернутого Node приложения, включая staging; используйте отдельную переменную, чтобы различать стадии развертывания.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Продвинутые сценарии развертывания

### Много-сервисные приложения
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### Blue-Green развертывания

**Иллюстративная схема операции:** вы должны предоставить оба окружения, общий слой маршрутизации трафика и два скрипта ниже. azd не переключает трафик и не проверяет готовность к откату автоматически. Оставляйте зеленое окружение до тех пор, пока синее не пройдет тестирование и откат не понадобится.

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### Canary развертывания
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Разделение трафика относится к конфигурации Container Apps (Bicep или Azure CLI), а не к свойству `azure.yaml` `trafficSplit`. Превью/Provision и последующие деплои должны сохранять выбранный режим ревизии и правила маршрутизации.

### Пошаговые развертывания
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Развертывания контейнеров

### Развертывания Container App
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Конфигурируйте runtime секреты с помощью `configuration.secrets`/`secretRef` (или ссылок Key Vault) и масштабирование с помощью `template.scale` в инфраструктуре Container App. Не создавайте сервисные свойства `secrets` или `scale` в `azure.yaml`.

### Оптимизация многоэтапного Dockerfile
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Оптимизация производительности

### Развертывания для отдельных сервисов
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Кэширование сборки
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Стандартный Node workflow использует скрипты пакетов; service `prepackage` хуки могут добавлять необходимые шаги. Кэширование Docker слоев отдельно от определения команды сборки сервиса.

### Эффективные развертывания кода
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Мониторинг развертывания

### Мониторинг развертывания в реальном времени
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Проверки здоровья
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Ваше приложение должно реализовать `/health`; оно не поставляется автоматически с azd. Нет общего сервисного свойства `azure.yaml` `healthCheck`.

### Валидация после развертывания
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Вопросы безопасности

### Управление секретами
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` недействителен. Обычные значения окружения — локальный открытый текст; не рассчитывайте, что команды чтения их скрывают. Команды выше сохраняют ссылки на Key Vault, но инфраструктура/приложение всё равно должны потреблять секреты и предоставлять runtime identity доступ.

### Безопасность сети
Объявляйте и используйте сетевые параметры в Bicep и сопоставляйте их в `infra/main.parameters.json`. Нет общего сетевого оверлея `infra.parameters` в `azure.yaml`. Пример документации с диапазонами `203.0.113.0/24` и `198.51.100.0/24` не является настоящими офисными/VPN сетями; замените их на авторизованные адреса.

### Управление идентификацией и доступом
Включите `identity` Container App в Bicep и назначьте необходимую роль для доступа к Key Vault на уровне хранилища. Конфигурируйте именованные секреты на основе Key Vault и runtime ссылки в этом ресурсе; `identity` и `keyVault` не являются общими свойствами azd сервиса. См. [Аутентификация и управляемая идентичность](../chapter-03-configuration/authsecurity.md).

## 🚨 Стратегии отката

### Быстрый откат
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Откат инфраструктуры
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Откат миграции базы данных
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрики развертывания

### Отслеживание производительности развертывания
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Сбор пользовательских метрик
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 Лучшие практики

### 1. Последовательность окружений
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Валидация инфраструктуры
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Интеграция тестирования
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. Документирование и логирование
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следующие шаги

- [Provisioning Resources](provisioning.md) - Глубокий обзор управления инфраструктурой
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Планирование стратегии развертывания
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Решение проблем с развертыванием
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Стратегии развертывания, готовые для продакшна

## 🎯 Практические упражнения по развертыванию

### Упражнение 1: Инкрементальный рабочий процесс развертывания (20 минут)
**Цель**: освоить разницу между полным и инкрементальным развертываниями

**Стартовые условия:** Bash, Node.js 22, Git, вход в azd, подписка Azure с правами на развертывание. Запускайте в новой директории; ожидайте платные ресурсы App Service/Cosmos DB. Время работы зависит от региона и шаблона.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Критерии успешности:**
- [ ] Зафиксировать время выполнения обеих команд (гарантированного времени нет)
- [ ] Обе команды успешно завершаются
- [ ] API остается рабочим; изменение только комментария — не видимое изменение UI
- [ ] Инфраструктура не изменяется после `azd deploy`

**Результат обучения:** `azd deploy` пропускает provision инфраструктуры. Сравнивайте замеренное время, а не полагайтесь на фиксированный процент ускорения.

### Упражнение 2: Пользовательские хуки развертывания (30 минут)
**Цель**: реализовать автоматизацию до и после развертывания

**Стартовые условия:** инициализированный проект `deployment-practice` выше. Если вы его очистили, снова выполните `azd up` перед тестированием развертывания только кода. Валидация ниже использует реальный скрипт сборки API, а не несуществующий корневой `test:unit` скрипт. Тесты API шаблона требуют настроенный доступ к базе данных; это не изолированные юнит-тесты.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Критерии успешности:**
- [ ] Скрипт pre-deploy запускается перед развертыванием
- [ ] Развертывание прерывается при ошибке валидации сборки
- [ ] Скрипт post-deploy выполняет базовое тестирование работоспособности
- [ ] Хуки выполняются в правильном порядке

### Упражнение 3: Стратегия развертывания с несколькими окружениями (45 минут)
**Цель**: реализовать пошаговый рабочий процесс развертывания (dev → staging → production)

**Отправная точка:** тот же инициализированный проект todo с `jq`. Создайте приведённые ниже среды с реальными значениями подписки/локации (или установите `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` в каждой) **до** запуска рабочего процесса без запроса. Он намеренно завершится с ошибкой, а не будет придумывать отсутствующие значения. Используйте только временные тренировочные среды, а не реальную производственную подписку.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Критерии успеха:**
- [ ] Среда для разработки развёртывается успешно
- [ ] Среда для тестирования развёртывается успешно
- [ ] Для продакшена требуется ручное одобрение
- [ ] Во всех средах работают проверки состояния
- [ ] При необходимости можно выполнить откат

### Задание 4: Стратегия отката (25 минут)
**Цель**: Реализовать и протестировать откат развертывания с помощью Git

**Отправная точка:** изолированная тренировочная копия шаблона todo с зафиксированным исходным кодом, чистым рабочим деревом Git и настроенной временной средой. Никогда не вводите намеренные ошибки в реальном производственном проекте. `APP_VERSION` ниже используется только для бухгалтерии, если вы явно не включите её в приложение.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Критерии успеха:**
- [ ] Могут обнаруживать ошибки развертывания
- [ ] Скрипт отката выполняется автоматически
- [ ] Приложение возвращается в рабочее состояние
- [ ] После отката проверки состояния проходят успешно

## 📊 Отслеживание метрик развертывания

### Отслеживайте показатели своего развертывания

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Анализируйте свои метрики:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Дополнительные ресурсы

- [Справочник по развертыванию с Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Развертывание Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Развертывание Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Развертывание Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигация**
- **Предыдущий урок**: [Ваш первый проект](../chapter-01-foundation/first-project.md)
- **Следующий урок**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->