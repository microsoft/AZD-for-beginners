<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-23T17:31:32+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "bg"
}
-->
# Ръководство за внедряване - Овладяване на AZD внедрявания

**Навигация по глави:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 4 - Инфраструктура като код и внедряване
- **⬅️ Предишна глава**: [Глава 3: Конфигурация](../getting-started/configuration.md)
- **➡️ Следваща**: [Осигуряване на ресурси](provisioning.md)
- **🚀 Следваща глава**: [Глава 5: Мултиагентни AI решения](../../examples/retail-scenario.md)

## Въведение

Това изчерпателно ръководство обхваща всичко, което трябва да знаете за внедряването на приложения с помощта на Azure Developer CLI, от основни внедрявания с една команда до сложни производствени сценарии с персонализирани скриптове, множество среди и интеграция с CI/CD. Овладейте целия жизнен цикъл на внедряване с практически примери и най-добри практики.

## Цели на обучението

След завършване на това ръководство ще:
- Овладеете всички команди и работни процеси за внедряване с Azure Developer CLI
- Разберете целия жизнен цикъл на внедряване от осигуряване до мониторинг
- Реализирате персонализирани скриптове за автоматизация преди и след внедряване
- Конфигурирате множество среди със специфични за средата параметри
- Настроите сложни стратегии за внедряване, включително blue-green и canary внедрявания
- Интегрирате внедрявания с azd в CI/CD и DevOps работни процеси

## Резултати от обучението

След завършване ще можете:
- Самостоятелно да изпълнявате и отстранявате проблеми с всички работни процеси за внедряване с azd
- Проектирате и реализирате персонализирана автоматизация за внедряване с помощта на скриптове
- Конфигурирате внедрявания, готови за производство, с подходяща сигурност и мониторинг
- Управлявате сложни сценарии за внедряване в множество среди
- Оптимизирате производителността на внедряванията и реализирате стратегии за връщане назад
- Интегрирате внедрявания с azd в корпоративни DevOps практики

## Преглед на внедряването

Azure Developer CLI предоставя няколко команди за внедряване:
- `azd up` - Пълен работен процес (осигуряване + внедряване)
- `azd provision` - Създаване/актуализиране само на Azure ресурси
- `azd deploy` - Внедряване само на приложен код
- `azd package` - Създаване и пакетиране на приложения

## Основни работни процеси за внедряване

### Пълно внедряване (azd up)
Най-често използваният работен процес за нови проекти:
```bash
# Разгърнете всичко от нулата
azd up

# Разгърнете със специфична среда
azd up --environment production

# Разгърнете с персонализирани параметри
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Внедряване само на инфраструктура
Когато трябва да актуализирате само Azure ресурси:
```bash
# Осигуряване/актуализиране на инфраструктура
azd provision

# Осигуряване с dry-run за преглед на промените
azd provision --preview

# Осигуряване на конкретни услуги
azd provision --service database
```

### Внедряване само на код
За бързи актуализации на приложения:
```bash
# Разгърнете всички услуги
azd deploy

# Очакван изход:
# Разгръщане на услуги (azd deploy)
# - web: Разгръщане... Готово
# - api: Разгръщане... Готово
# УСПЕХ: Вашето разгръщане завърши за 2 минути и 15 секунди

# Разгърнете конкретна услуга
azd deploy --service web
azd deploy --service api

# Разгърнете с персонализирани аргументи за изграждане
azd deploy --service api --build-arg NODE_ENV=production

# Проверете разгръщането
azd show --output json | jq '.services'
```

### ✅ Проверка на внедряването

След всяко внедряване проверете успеха:

```bash
# Проверете дали всички услуги работят
azd show

# Тествайте здравните крайни точки
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Проверете логовете за грешки
azd logs --service api --since 5m | grep -i error
```

**Критерии за успех:**
- ✅ Всички услуги показват статус "Running"
- ✅ Точките за проверка на здравето връщат HTTP 200
- ✅ Няма грешки в логовете през последните 5 минути
- ✅ Приложението отговаря на тестови заявки

## 🏗️ Разбиране на процеса на внедряване

### Фаза 1: Скриптове преди осигуряване
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

### Фаза 2: Осигуряване на инфраструктура
- Чете шаблони за инфраструктура (Bicep/Terraform)
- Създава или актуализира Azure ресурси
- Конфигурира мрежи и сигурност
- Настройва мониторинг и логове

### Фаза 3: Скриптове след осигуряване
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

### Фаза 4: Пакетиране на приложения
- Създава приложен код
- Създава артефакти за внедряване
- Пакетира за целевата платформа (контейнери, ZIP файлове и др.)

### Фаза 5: Скриптове преди внедряване
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

### Фаза 6: Внедряване на приложения
- Внедрява пакетирани приложения в Azure услуги
- Актуализира конфигурационни настройки
- Стартира/рестартира услуги

### Фаза 7: Скриптове след внедряване
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

## 🎛️ Конфигурация на внедряването

### Настройки за внедряване, специфични за услугите
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

### Конфигурации, специфични за средата
```bash
# Среда за разработка
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Среда за тестване
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Производствена среда
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Сложни сценарии за внедряване

### Приложения с множество услуги
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

### Blue-Green внедрявания
```bash
# Създайте синя среда
azd env new production-blue
azd up --environment production-blue

# Тествайте синята среда
./scripts/test-environment.sh production-blue

# Прехвърлете трафика към синята (ръчно обновяване на DNS/балансировач на натоварването)
./scripts/switch-traffic.sh production-blue

# Почистете зелената среда
azd env select production-green
azd down --force
```

### Canary внедрявания
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

### Етапни внедрявания
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

## 🐳 Внедрявания на контейнери

### Внедрявания на приложения в контейнери
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

### Оптимизация на Dockerfile с множество етапи
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

## ⚡ Оптимизация на производителността

### Паралелни внедрявания
```bash
# Конфигуриране на паралелно разгръщане
azd config set deploy.parallelism 5

# Разгръщане на услуги паралелно
azd deploy --parallel
```

### Кеширане на изграждането
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

### Инкрементални внедрявания
```bash
# Разгърнете само променените услуги
azd deploy --incremental

# Разгърнете с откриване на промени
azd deploy --detect-changes
```

## 🔍 Мониторинг на внедряването

### Мониторинг на внедряването в реално време
```bash
# Наблюдавайте напредъка на внедряването
azd deploy --follow

# Прегледайте логовете на внедряването
azd logs --follow --service api

# Проверете състоянието на внедряването
azd show --service api
```

### Проверки на здравето
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

### Валидация след внедряване
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Проверете здравето на приложението
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

## 🔐 Съображения за сигурност

### Управление на тайни
```bash
# Съхранявайте тайните сигурно
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Позовавайте се на тайните в azure.yaml
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

### Мрежова сигурност
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Управление на идентичност и достъп
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

## 🚨 Стратегии за връщане назад

### Бързо връщане назад
```bash
# Връщане към предишното внедряване
azd deploy --rollback

# Връщане на конкретна услуга
azd deploy --service api --rollback

# Връщане към конкретна версия
azd deploy --service api --version v1.2.3
```

### Връщане назад на инфраструктурата
```bash
# Възстановяване на инфраструктурни промени
azd provision --rollback

# Преглед на промените за възстановяване
azd provision --rollback --preview
```

### Връщане назад на миграция на база данни
```bash
#!/bin/bash
# scripts/възстановяване-база-данни.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрики за внедряване

### Проследяване на производителността на внедряването
```bash
# Активиране на метрики за разгръщане
azd config set telemetry.deployment.enabled true

# Преглед на историята на разгръщане
azd history

# Получаване на статистика за разгръщане
azd metrics --type deployment
```

### Събиране на персонализирани метрики
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

## 🎯 Най-добри практики

### 1. Консистентност на средата
```bash
# Използвайте последователно именуване
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Поддържайте паритет на средата
./scripts/sync-environments.sh
```

### 2. Валидация на инфраструктурата
```bash
# Валидирайте преди внедряване
azd provision --preview
azd provision --what-if

# Използвайте ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Интеграция на тестове
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

### 4. Документация и логове
```bash
# Документиране на процедурите за внедряване
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следващи стъпки

- [Осигуряване на ресурси](provisioning.md) - Подробен преглед на управлението на инфраструктурата
- [Планиране преди внедряване](../pre-deployment/capacity-planning.md) - Планирайте стратегията си за внедряване
- [Чести проблеми](../troubleshooting/common-issues.md) - Решаване на проблеми с внедряването
- [Най-добри практики](../troubleshooting/debugging.md) - Стратегии за внедряване, готови за производство

## 🎯 Практически упражнения за внедряване

### Упражнение 1: Работен процес за инкрементално внедряване (20 минути)
**Цел**: Овладейте разликата между пълно и инкрементално внедряване

```bash
# Първоначално внедряване
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Запишете времето на първоначалното внедряване
echo "Full deployment: $(date)" > deployment-log.txt

# Направете промяна в кода
echo "// Updated $(date)" >> src/api/src/server.js

# Внедрете само кода (бързо)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Сравнете времената
cat deployment-log.txt

# Почистете
azd down --force --purge
```

**Критерии за успех:**
- [ ] Пълното внедряване отнема 5-15 минути
- [ ] Внедряването само на код отнема 2-5 минути
- [ ] Промените в кода се отразяват в внедреното приложение
- [ ] Инфраструктурата остава непроменена след `azd deploy`

**Резултат от обучението**: `azd deploy` е 50-70% по-бърз от `azd up` за промени в кода

### Упражнение 2: Персонализирани скриптове за внедряване (30 минути)
**Цел**: Реализирайте автоматизация преди и след внедряване

```bash
# Създайте скрипт за валидиране преди разгръщане
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Проверете дали тестовете преминават
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Проверете за непредадени промени
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Създайте тест за проверка след разгръщане
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

# Добавете куки към azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Тествайте разгръщането с куки
azd deploy
```

**Критерии за успех:**
- [ ] Скриптът преди внедряване се изпълнява преди внедряването
- [ ] Внедряването се прекратява, ако тестовете се провалят
- [ ] Тестът след внедряване валидира здравето
- [ ] Скриптовете се изпълняват в правилния ред

### Упражнение 3: Стратегия за внедряване в множество среди (45 минути)
**Цел**: Реализирайте етапен работен процес за внедряване (dev → staging → production)

```bash
# Създаване на скрипт за разгръщане
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Стъпка 1: Разгръщане в dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Стъпка 2: Разгръщане в staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Стъпка 3: Ръчно одобрение за production
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

# Създаване на среди
azd env new dev
azd env new staging
azd env new production

# Изпълнение на поетапно разгръщане
./deploy-staged.sh
```

**Критерии за успех:**
- [ ] Средата за разработка се внедрява успешно
- [ ] Средата за тестване се внедрява успешно
- [ ] Ръчно одобрение е необходимо за производствената среда
- [ ] Всички среди имат работещи проверки на здравето
- [ ] Може да се върне назад, ако е необходимо

### Упражнение 4: Стратегия за връщане назад (25 минути)
**Цел**: Реализирайте и тествайте връщане назад при внедряване

```bash
# Разгърни v1
azd env set APP_VERSION "1.0.0"
azd up

# Запази конфигурацията на v1
cp -r .azure/production .azure/production-v1-backup

# Разгърни v2 с промяна, която нарушава съвместимостта
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Открий неуспех
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Върни обратно кода
    git checkout src/api/src/server.js
    
    # Върни обратно средата
    azd env set APP_VERSION "1.0.0"
    
    # Разгърни отново v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критерии за успех:**
- [ ] Може да се откриват провали при внедряване
- [ ] Скриптът за връщане назад се изпълнява автоматично
- [ ] Приложението се връща в работещо състояние
- [ ] Проверки на здравето преминават след връщане назад

## 📊 Проследяване на метрики за внедряване

### Проследете производителността на вашето внедряване

```bash
# Създаване на скрипт за метрики на внедряване
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

# Запис в файл
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Използвай го
./track-deployment.sh
```

**Анализирайте вашите метрики:**
```bash
# Преглед на историята на внедряване
cat deployment-metrics.csv

# Изчисляване на средното време за внедряване
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Допълнителни ресурси

- [Референция за внедряване с Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Внедряване на Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Внедряване на Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Внедряване на Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигация**
- **Предишен урок**: [Вашият първи проект](../getting-started/first-project.md)
- **Следващ урок**: [Осигуряване на ресурси](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или погрешни интерпретации, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->