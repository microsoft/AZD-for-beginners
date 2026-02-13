# Руководство по развертыванию - Освоение развертываний AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD для начинающих](../../README.md)
- **📖 Current Chapter**: Глава 4 - Инфраструктура как код и развертывание
- **⬅️ Previous Chapter**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Подготовка ресурсов](provisioning.md)
- **🚀 Next Chapter**: [Глава 5: Мультиагентные AI-решения](../../examples/retail-scenario.md)

## Введение

Это## Понимание процесса развертываниявсеобъемлющее руководство охватывает все, что вам нужно знать о развертывании приложений с помощью Azure Developer CLI, от простых однокомандных развертываний до сложных производственных сценариев с пользовательскими хуками, несколькими средами и интеграцией CI/CD. Освойте полный цикл развертывания с практическими примерами и лучшими практиками.

## Цели обучения

Пройдя это руководство, вы:
- Овладеете всеми командами и рабочими процессами развертывания Azure Developer CLI
- Поймете полный жизненный цикл развертывания — от подготовки ресурсов до мониторинга
- Реализуете пользовательские хуки развертывания для автоматизации до- и пост-развертывания
- Настроите несколько сред с параметрами, специфичными для среды
- Настроите продвинутые стратегии развертывания, включая blue-green и canary
- Интегрируете развертывания azd с конвейерами CI/CD и DevOps-процессами

## Результаты обучения

По завершении вы сможете:
- Выполнять и отлаживать все рабочие процессы развертывания azd самостоятельно
- Проектировать и реализовывать пользовательскую автоматизацию развертывания с использованием хуков
- Настраивать готовые к продакшену развертывания с надлежащей безопасностью и мониторингом
- Управлять сложными сценариями развертывания с несколькими средами
- Оптимизировать производительность развертывания и реализовывать стратегии отката
- Интегрировать развертывания azd в корпоративные DevOps-практики

## Обзор развертывания

Azure Developer CLI предоставляет несколько команд для развертывания:
- `azd up` - Полный рабочий процесс (provision + deploy)
- `azd provision` - Только создание/обновление ресурсов Azure
- `azd deploy` - Только развертывание кода приложения
- `azd package` - Сборка и упаковка приложений

## Основные рабочие процессы развертывания

### Полное развертывание (azd up)
Наиболее распространенный рабочий процесс для новых проектов:
```bash
# Развернуть всё с нуля
azd up

# Развернуть в конкретной среде
azd up --environment production

# Развернуть с пользовательскими параметрами
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Только инфраструктура
Когда нужно обновить только ресурсы Azure:
```bash
# Развернуть/обновить инфраструктуру
azd provision

# Развернуть в режиме пробного запуска для предварительного просмотра изменений
azd provision --preview

# Развернуть конкретные сервисы
azd provision --service database
```

### Только код
Для быстрых обновлений приложения:
```bash
# Развернуть все сервисы
azd deploy

# Ожидаемый вывод:
# Развертывание сервисов (azd deploy)
# - web: Развертывание... Готово
# - api: Развертывание... Готово
# УСПЕХ: Ваше развертывание завершилось за 2 минуты 15 секунд

# Развернуть конкретный сервис
azd deploy --service web
azd deploy --service api

# Развернуть с пользовательскими аргументами сборки
azd deploy --service api --build-arg NODE_ENV=production

# Проверить развертывание
azd show --output json | jq '.services'
```

### ✅ Проверка развертывания

После любого развертывания проверьте успешность:

```bash
# Проверьте, что все сервисы запущены
azd show

# Проверьте конечные точки состояния
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Следите за ошибками (по умолчанию открывается в браузере)
azd monitor --logs
```

**Критерии успеха:**
- ✅ Все сервисы показывают "Запущено" статус
- ✅ Эндпоинты состояния возвращают HTTP 200
- ✅ Нет записей об ошибках в логах за последние 5 минут
- ✅ Приложение отвечает на тестовые запросы

## 🏗️ Понимание процесса развертывания

### Фаза 1: хуки перед подготовкой ресурсов
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

### Фаза 2: подготовка инфраструктуры
- Читает шаблоны инфраструктуры (Bicep/Terraform)
- Создает или обновляет ресурсы Azure
- Настраивает сетевое взаимодействие и безопасность
- Настраивает мониторинг и логирование

### Фаза 3: хуки после подготовки ресурсов
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
- Собирает код приложения
- Создает артефакты для развертывания
- Упаковывает для целевой платформы (контейнеры, ZIP и т.д.)

### Фаза 5: хуки перед развертыванием
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
- Развертывает упакованные приложения в сервисы Azure
- Обновляет конфигурационные настройки
- Запускает/перезапускает сервисы

### Фаза 7: хуки после развертывания
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

### Параметры развертывания для конкретного сервиса
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

### Конфигурации, специфичные для среды
```bash
# Среда разработки
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Тестовая среда
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Производственная среда
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Расширенные сценарии развертывания

### Мультисервисные приложения
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
# Создать синее окружение
azd env new production-blue
azd up --environment production-blue

# Протестировать синее окружение
./scripts/test-environment.sh production-blue

# Переключить трафик на синее окружение (ручное обновление DNS/балансировщика нагрузки)
./scripts/switch-traffic.sh production-blue

# Очистить зеленое окружение
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

### Поэтапные развертывания
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

## 🐳 Развертывание контейнеров

### Развертывания Container App
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

### Оптимизация многоступенчатого Dockerfile
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

### Развертывания для конкретных сервисов
```bash
# Развернуть конкретный сервис для более быстрой итерации
azd deploy --service web
azd deploy --service api

# Развернуть все сервисы
azd deploy
```

### Кеширование сборки
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Эффективные развертывания кода
```bash
# Используйте azd deploy (не azd up) для изменений только в коде
# Это пропускает развертывание инфраструктуры и намного быстрее
azd deploy

# Развертывайте конкретный сервис для максимально быстрой итерации
azd deploy --service api
```

## 🔍 Мониторинг развертывания

### Мониторинг развертывания в реальном времени
```bash
# Отслеживать приложение в режиме реального времени
azd monitor --live

# Просматривать журналы приложения
azd monitor --logs

# Проверять статус развертывания
azd show
```

### Проверки состояния
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

# Проверить работоспособность приложения
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

## 🔐 Соображения по безопасности

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
# AZD не имеет встроенного отката. Рекомендуемые подходы:

# Вариант 1: повторно развернуть из Git (рекомендуется)
git revert HEAD  # Откатить проблемный коммит
git push
azd deploy

# Вариант 2: развернуть конкретный коммит
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Откат инфраструктуры
```bash
# Просмотреть изменения инфраструктуры перед применением
azd provision --preview

# Для отката инфраструктуры используйте систему контроля версий:
git revert HEAD  # Откатить изменения в инфраструктуре
azd provision    # Применить предыдущее состояние инфраструктуры
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
# Просмотреть текущий статус развертывания
azd show

# Отслеживать приложение с помощью Application Insights
azd monitor --overview

# Просмотреть метрики в реальном времени
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

### 1. Согласованность среды
```bash
# Используйте единообразные имена
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Поддерживайте соответствие окружений
./scripts/sync-environments.sh
```

### 2. Валидация инфраструктуры
```bash
# Просмотреть изменения инфраструктуры перед развертыванием
azd provision --preview

# Использовать линтинг ARM/Bicep
az bicep lint --file infra/main.bicep

# Проверить синтаксис Bicep
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

### 4. Документация и логирование
```bash
# Задокументируйте процедуры развертывания
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следующие шаги

- [Подготовка ресурсов](provisioning.md) - Глубокое погружение в управление инфраструктурой
- [Планирование перед развертыванием](../chapter-06-pre-deployment/capacity-planning.md) - Планируйте стратегию развертывания
- [Распространенные проблемы](../chapter-07-troubleshooting/common-issues.md) - Решение проблем развертывания
- [Лучшие практики](../chapter-07-troubleshooting/debugging.md) - Стратегии развертывания для продакшена

## 🎯 Практические упражнения по развертыванию

### Упражнение 1: Инкрементальный рабочий процесс развертывания (20 минут)
**Цель**: Освоить разницу между полными и инкрементальными развертываниями

```bash
# Первоначальное развертывание
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Зафиксировать время первоначального развертывания
echo "Full deployment: $(date)" > deployment-log.txt

# Внести изменение в код
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
- [ ] Изменения в коде отражаются в развернутом приложении
- [ ] Инфраструктура не меняется после `azd deploy`

**Результат обучения**: `azd deploy` на 50-70% быстрее, чем `azd up` для изменений в коде

### Упражнение 2: Пользовательские хуки развертывания (30 минут)
**Цель**: Реализовать автоматизацию до- и пост-развертывания

```bash
# Создать скрипт валидации перед развёртыванием
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Проверить, проходят ли тесты
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Проверить наличие незафиксированных изменений
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Создать smoke-тест после развёртывания
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

# Протестировать развёртывание с хуками
azd deploy
```

**Критерии успеха:**
- [ ] Скрипт перед развертыванием выполняется до начала развертывания
- [ ] Развертывание прерывается, если тесты завершаются неудачей
- [ ] Пост-развертывочный smoke-тест проверяет работоспособность
- [ ] Хуки выполняются в правильном порядке

### Упражнение 3: Стратегия развертывания для нескольких сред (45 минут)
**Цель**: Реализовать поэтапный рабочий процесс развертывания (dev → staging → production)

```bash
# Создать скрипт развертывания
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Шаг 1: Развернуть в dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Шаг 2: Развернуть в staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Шаг 3: Ручное одобрение для production
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

# Запустить поэтапное развертывание
./deploy-staged.sh
```

**Критерии успеха:**
- [ ] Среда dev развертывается успешно
- [ ] Среда staging развертывается успешно
- [ ] Для production требуется ручное подтверждение
- [ ] Во всех средах работают проверки состояния
- [ ] Можно выполнить откат при необходимости

### Упражнение 4: Стратегия отката (25 минут)
**Цель**: Реализовать и протестировать откат развертывания с использованием Git

```bash
# Развернуть v1
azd env set APP_VERSION "1.0.0"
azd up

# Сохранить хэш коммита v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Развернуть v2 с несовместимым изменением
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Обнаружить сбой и выполнить откат
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Откат с помощью git
    git revert HEAD --no-edit
    
    # Откатить окружение
    azd env set APP_VERSION "1.0.0"
    
    # Повторно развернуть v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критерии успеха:**
- [ ] Умеет обнаруживать сбои развертывания
- [ ] Скрипт отката выполняется автоматически
- [ ] Приложение возвращается в рабочее состояние
- [ ] Проверки состояния проходят после отката

## 📊 Отслеживание метрик развертывания

### Отслеживайте производительность развертывания

```bash
# Создать скрипт сбора метрик развертывания
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

# Записывать в файл
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Используйте его
./track-deployment.sh
```

**Анализируйте ваши метрики:**
```bash
# Просмотреть историю развёртываний
cat deployment-metrics.csv

# Рассчитать среднее время развёртывания
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Дополнительные ресурсы

- [Справочник по развертыванию Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Развертывание Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Развертывание Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Развертывание Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Ваш первый проект](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Подготовка ресурсов](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от ответственности:
Этот документ был переведён с помощью сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, просим учитывать, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется профессиональный перевод, выполненный человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->