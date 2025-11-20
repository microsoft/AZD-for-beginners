<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-20T06:22:16+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ru"
}
-->
# Руководство по развертыванию - Освоение развертываний с AZD

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 4 - Инфраструктура как код и развертывание
- **⬅️ Предыдущая глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)
- **➡️ Далее**: [Создание ресурсов](provisioning.md)
- **🚀 Следующая глава**: [Глава 5: Многоагентные AI-решения](../../examples/retail-scenario.md)

## Введение

Этот подробный гид охватывает все, что вам нужно знать о развертывании приложений с использованием Azure Developer CLI, начиная с базовых развертываний одной командой и заканчивая сложными сценариями для продакшена с использованием пользовательских хуков, нескольких окружений и интеграции с CI/CD. Освойте полный жизненный цикл развертывания с помощью практических примеров и лучших практик.

## Цели обучения

Пройдя это руководство, вы:
- Освоите все команды и рабочие процессы развертывания Azure Developer CLI
- Поймете полный жизненный цикл развертывания от создания ресурсов до мониторинга
- Реализуете пользовательские хуки для автоматизации до и после развертывания
- Настроите несколько окружений с параметрами, специфичными для каждого окружения
- Освоите продвинутые стратегии развертывания, включая blue-green и canary развертывания
- Интегрируете развертывания azd с CI/CD пайплайнами и DevOps процессами

## Результаты обучения

После завершения вы сможете:
- Самостоятельно выполнять и устранять неполадки всех рабочих процессов развертывания azd
- Разрабатывать и внедрять пользовательскую автоматизацию развертывания с использованием хуков
- Настраивать развертывания, готовые к продакшену, с учетом безопасности и мониторинга
- Управлять сложными сценариями развертывания в нескольких окружениях
- Оптимизировать производительность развертывания и внедрять стратегии отката
- Интегрировать развертывания azd в корпоративные DevOps практики

## Обзор развертывания

Azure Developer CLI предоставляет несколько команд для развертывания:
- `azd up` - Полный рабочий процесс (создание ресурсов + развертывание)
- `azd provision` - Только создание/обновление ресурсов Azure
- `azd deploy` - Только развертывание кода приложения
- `azd package` - Сборка и упаковка приложений

## Базовые рабочие процессы развертывания

### Полное развертывание (azd up)
Наиболее распространенный рабочий процесс для новых проектов:
```bash
# Развернуть все с нуля
azd up

# Развернуть с конкретной средой
azd up --environment production

# Развернуть с пользовательскими параметрами
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Развертывание только инфраструктуры
Когда нужно обновить только ресурсы Azure:
```bash
# Обеспечение/обновление инфраструктуры
azd provision

# Обеспечение с предварительным запуском для просмотра изменений
azd provision --preview

# Обеспечение конкретных сервисов
azd provision --service database
```

### Развертывание только кода
Для быстрых обновлений приложения:
```bash
# Развернуть все сервисы
azd deploy

# Ожидаемый результат:
# Развёртывание сервисов (azd deploy)
# - web: Развёртывание... Готово
# - api: Развёртывание... Готово
# УСПЕХ: Ваше развёртывание завершено за 2 минуты 15 секунд

# Развернуть конкретный сервис
azd deploy --service web
azd deploy --service api

# Развернуть с пользовательскими аргументами сборки
azd deploy --service api --build-arg NODE_ENV=production

# Проверить развёртывание
azd show --output json | jq '.services'
```

### ✅ Проверка развертывания

После любого развертывания проверьте его успешность:

```bash
# Проверьте, работают ли все сервисы
azd show

# Проверьте конечные точки здоровья
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Проверьте журналы на наличие ошибок
azd logs --service api --since 5m | grep -i error
```

**Критерии успеха:**
- ✅ Все сервисы имеют статус "Running"
- ✅ Конечные точки здоровья возвращают HTTP 200
- ✅ Нет ошибок в логах за последние 5 минут
- ✅ Приложение отвечает на тестовые запросы

## 🏗️ Понимание процесса развертывания

### Фаза 1: Хуки до создания ресурсов
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

### Фаза 2: Создание инфраструктуры
- Чтение шаблонов инфраструктуры (Bicep/Terraform)
- Создание или обновление ресурсов Azure
- Настройка сетей и безопасности
- Настройка мониторинга и логирования

### Фаза 3: Хуки после создания ресурсов
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

### Фаза 5: Хуки перед развертыванием
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

### Фаза 6: Развертывание приложения
- Развертывание упакованных приложений в сервисах Azure
- Обновление настроек конфигурации
- Запуск/перезапуск сервисов

### Фаза 7: Хуки после развертывания
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

## 🎛️ Конфигурация развертывания

### Настройки развертывания для конкретных сервисов
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### Конфигурации для конкретных окружений
```bash
# Среда разработки
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Среда тестирования
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Рабочая среда
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Продвинутые сценарии развертывания

### Приложения с несколькими сервисами
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
```bash
# Создать синюю среду
azd env new production-blue
azd up --environment production-blue

# Тестировать синюю среду
./scripts/test-environment.sh production-blue

# Переключить трафик на синюю (ручное обновление DNS/балансировщика нагрузки)
./scripts/switch-traffic.sh production-blue

# Очистить зеленую среду
azd env select production-green
azd down --force
```

### Canary развертывания
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### Постепенные развертывания
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Развертывания контейнеров

### Развертывания приложений в контейнерах
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### Оптимизация многоэтапных Dockerfile
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Оптимизация производительности

### Параллельные развертывания
```bash
# Настроить параллельное развертывание
azd config set deploy.parallelism 5

# Развернуть сервисы параллельно
azd deploy --parallel
```

### Кэширование сборки
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### Инкрементальные развертывания
```bash
# Развертывать только измененные сервисы
azd deploy --incremental

# Развертывать с обнаружением изменений
azd deploy --detect-changes
```

## 🔍 Мониторинг развертывания

### Мониторинг развертывания в реальном времени
```bash
# Отслеживать прогресс развертывания
azd deploy --follow

# Просмотреть журналы развертывания
azd logs --follow --service api

# Проверить статус развертывания
azd show --service api
```

### Проверки здоровья
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### Валидация после развертывания
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Проверить состояние приложения
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Соображения безопасности

### Управление секретами
```bash
# Храните секреты безопасно
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Ссылайтесь на секреты в azure.yaml
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### Сетевая безопасность
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Управление идентификацией и доступом
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 Стратегии отката

### Быстрый откат
```bash
# Откат к предыдущему развертыванию
azd deploy --rollback

# Откат конкретного сервиса
azd deploy --service api --rollback

# Откат к конкретной версии
azd deploy --service api --version v1.2.3
```

### Откат инфраструктуры
```bash
# Откат изменений инфраструктуры
azd provision --rollback

# Предварительный просмотр изменений отката
azd provision --rollback --preview
```

### Откат миграции базы данных
```bash
#!/bin/bash
# scripts/откат-базы-данных.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрики развертывания

### Отслеживание производительности развертывания
```bash
# Включить метрики развертывания
azd config set telemetry.deployment.enabled true

# Просмотреть историю развертывания
azd history

# Получить статистику развертывания
azd metrics --type deployment
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

### 1. Консистентность окружений
```bash
# Используйте согласованное именование
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Поддерживайте паритет среды
./scripts/sync-environments.sh
```

### 2. Валидация инфраструктуры
```bash
# Проверить перед развертыванием
azd provision --preview
azd provision --what-if

# Использовать линтинг ARM/Bicep
az bicep lint --file infra/main.bicep
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

### 4. Документация и логирование
```bash
# Задокументировать процедуры развертывания
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следующие шаги

- [Создание ресурсов](provisioning.md) - Подробное изучение управления инфраструктурой
- [Планирование перед развертыванием](../pre-deployment/capacity-planning.md) - Планирование стратегии развертывания
- [Общие проблемы](../troubleshooting/common-issues.md) - Решение проблем с развертыванием
- [Лучшие практики](../troubleshooting/debugging.md) - Стратегии развертывания для продакшена

## 🎯 Практические упражнения по развертыванию

### Упражнение 1: Инкрементальный рабочий процесс развертывания (20 минут)
**Цель**: Освоить разницу между полным и инкрементальным развертыванием

```bash
# Первоначальное развертывание
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Записать время первоначального развертывания
echo "Full deployment: $(date)" > deployment-log.txt

# Внести изменения в код
echo "// Updated $(date)" >> src/api/src/server.js

# Развернуть только код (быстро)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Сравнить времена
cat deployment-log.txt

# Очистить
azd down --force --purge
```

**Критерии успеха:**
- [ ] Полное развертывание занимает 5-15 минут
- [ ] Развертывание только кода занимает 2-5 минут
- [ ] Изменения в коде отражены в развернутом приложении
- [ ] Инфраструктура не изменяется после `azd deploy`

**Результат обучения**: `azd deploy` на 50-70% быстрее, чем `azd up` для изменений в коде

### Упражнение 2: Пользовательские хуки развертывания (30 минут)
**Цель**: Реализовать автоматизацию до и после развертывания

```bash
# Создать скрипт проверки перед развертыванием
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Проверить, проходят ли тесты
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Проверить наличие несохраненных изменений
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Создать тест проверки после развертывания
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Добавить хуки в azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Проверить развертывание с хуками
azd deploy
```

**Критерии успеха:**
- [ ] Скрипт перед развертыванием выполняется до развертывания
- [ ] Развертывание прерывается, если тесты не проходят
- [ ] Постразвертывательный тест проверяет работоспособность
- [ ] Хуки выполняются в правильном порядке

### Упражнение 3: Стратегия развертывания в нескольких окружениях (45 минут)
**Цель**: Реализовать поэтапный рабочий процесс развертывания (dev → staging → production)

```bash
# Создать скрипт развертывания
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Шаг 1: Развернуть на dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Шаг 2: Развернуть на staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Шаг 3: Ручное подтверждение для production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Создать окружения
azd env new dev
azd env new staging
azd env new production

# Выполнить поэтапное развертывание
./deploy-staged.sh
```

**Критерии успеха:**
- [ ] Окружение dev успешно развернуто
- [ ] Окружение staging успешно развернуто
- [ ] Для production требуется ручное одобрение
- [ ] Все окружения имеют работающие проверки здоровья
- [ ] Возможен откат при необходимости

### Упражнение 4: Стратегия отката (25 минут)
**Цель**: Реализовать и протестировать откат развертывания

```bash
# Развернуть v1
azd env set APP_VERSION "1.0.0"
azd up

# Сохранить конфигурацию v1
cp -r .azure/production .azure/production-v1-backup

# Развернуть v2 с критическим изменением
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Обнаружить сбой
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Откатить код
    git checkout src/api/src/server.js
    
    # Откатить окружение
    azd env set APP_VERSION "1.0.0"
    
    # Повторно развернуть v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критерии успеха:**
- [ ] Возможность обнаружения сбоев развертывания
- [ ] Скрипт отката выполняется автоматически
- [ ] Приложение возвращается в рабочее состояние
- [ ] Проверки здоровья проходят после отката

## 📊 Отслеживание метрик развертывания

### Отслеживайте производительность развертывания

```bash
# Создать скрипт метрик развертывания
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Запись в файл
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Использовать это
./track-deployment.sh
```

**Анализируйте свои метрики:**
```bash
# Просмотреть историю развертывания
cat deployment-metrics.csv

# Рассчитать среднее время развертывания
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Дополнительные ресурсы

- [Справочник по развертыванию Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Развертывание Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Развертывание Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Развертывание Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигация**
- **Предыдущий урок**: [Ваш первый проект](../getting-started/first-project.md)
- **Следующий урок**: [Создание ресурсов](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с использованием сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->