# Ръководство за внедряване - Майсторство в AZD внедряванията

**Chapter Navigation:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 4 - Инфраструктура като код и внедряване
- **⬅️ Предишна глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)
- **➡️ Следваща**: [Осигуряване на ресурси](provisioning.md)
- **🚀 Следваща глава**: [Глава 5: Многоагентни AI решения](../../examples/retail-scenario.md)

## Въведение

Това## Разбиране на процеса на внедряване всеобхватно ръководство обхваща всичко, което трябва да знаете за внедряване на приложения с Azure Developer CLI, от базови внедрявания с една команда до напреднали продукционни сценарии с персонализирани hooks, множество среди и интеграция с CI/CD. Овладейте целия жизнен цикъл на внедряване с практични примери и най-добри практики.

## Цели на обучението

След като завършите това ръководство, ще:
- Овладейте всички команди и работни потоци за внедряване на Azure Developer CLI
- Разберете целия жизнен цикъл на внедряване от осигуряване на ресурси до наблюдение
- Реализирате персонализирани hooks за автоматизация преди и след внедряването
- Конфигурирате множество среди с параметри, специфични за средата
- Настройте напреднали стратегии за внедряване, включително blue-green и canary внедрявания
- Интегрирате azd внедряванията с CI/CD конвейери и DevOps работни потоци

## Резултати от обучението

След приключване ще можете да:
- Изпълнявате и отстранявате проблеми във всички работни потоци за внедряване с azd самостоятелно
- Проектирате и прилагате персонализирана автоматизация на внедряването чрез hooks
- Конфигурирате готови за продукция внедрявания с подходяща сигурност и мониторинг
- Управлявате сложни сценарии за внедряване в множество среди
- Оптимизирате производителността на внедряването и прилагате стратегии за връщане назад
- Интегрирате azd внедряванията в корпоративни DevOps практики

## Преглед на внедряването

Azure Developer CLI предоставя няколко команди за внедряване:
- `azd up` - Пълен работен поток (осигуряване + внедряване)
- `azd provision` - Създава/актуализира само Azure ресурси
- `azd deploy` - Внедрява само код на приложението
- `azd package` - Компилира и пакетира приложения

## Основни работни потоци за внедряване

### Пълно внедряване (azd up)
The most common workflow for new projects:
```bash
# Разгърнете всичко от нулата
azd up

# Разгърнете в конкретна среда
azd up --environment production

# Разгърнете с персонализирани параметри
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Внедряване само на инфраструктурата
When you only need to update Azure resources:
```bash
# Осигуряване/актуализиране на инфраструктурата
azd provision

# Осигуряване с тестово изпълнение (dry-run) за преглед на промените
azd provision --preview

# Осигуряване на конкретни услуги
azd provision --service database
```

### Внедряване само на кода
For quick application updates:
```bash
# Разположете всички услуги
azd deploy

# Очакван изход:
# Разполагане на услуги (azd deploy)
# - web: Разполагане... Готово
# - api: Разполагане... Готово
# УСПЕХ: Вашето разполагане завърши за 2 минути и 15 секунди

# Разположете конкретна услуга
azd deploy --service web
azd deploy --service api

# Разполагане с персонализирани аргументи за изграждане
azd deploy --service api --build-arg NODE_ENV=production

# Проверете разполагането
azd show --output json | jq '.services'
```

### ✅ Проверка на внедряването

След всяко внедряване, проверете успеха:

```bash
# Проверете дали всички услуги работят
azd show

# Тествайте крайни точки за състоянието
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Наблюдавайте за грешки (по подразбиране се отваря в браузъра)
azd monitor --logs
```

**Критерии за успех:**
- ✅ Всички услуги показват статус "Running"
- ✅ Крайни точки за здраве връщат HTTP 200
- ✅ Няма записани грешки в логовете през последните 5 минути
- ✅ Приложението отговаря на тестови заявки

## 🏗️ Разбиране на процеса на внедряване

### Фаза 1: Hooks преди осигуряване на ресурси
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

### Фаза 2: Осигуряване на инфраструктурата
- Чете инфраструктурни шаблони (Bicep/Terraform)
- Създава или актуализира Azure ресурси
- Конфигурира мрежови настройки и сигурност
- Настройва мониторинг и логване

### Фаза 3: Hooks след осигуряване на ресурси
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

### Фаза 4: Пакетиране на приложението
- Компилира кода на приложението
- Създава артефакти за внедряване
- Пакетира за целевата платформа (контейнери, ZIP файлове и др.)

### Фаза 5: Hooks преди внедряване
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

### Фаза 6: Внедряване на приложението
- Внедрява пакетирани приложения в Azure услуги
- Актуализира конфигурационните настройки
- Стартира/рестартира услуги

### Фаза 7: Hooks след внедряване
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

### Настройки за внедряване специфични за услугата
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

### Конфигурации специфични за средата
```bash
# Среда за разработка
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Тестова среда
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

## 🔧 Напреднали сценарии за внедряване

### Многосервисни приложения
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
# Създай синя среда
azd env new production-blue
azd up --environment production-blue

# Тествай синята среда
./scripts/test-environment.sh production-blue

# Пренасочи трафика към синята среда (ръчна актуализация на DNS/балансьор за натоварване)
./scripts/switch-traffic.sh production-blue

# Почисти зелената среда
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

## 🐳 Внедрявания с контейнери

### Внедряване на контейнерни приложения
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

### Оптимизация на многостепенен Dockerfile
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

### Внедрявания, специфични за услугата
```bash
# Разгърнете конкретна услуга за по-бърза итерация
azd deploy --service web
azd deploy --service api

# Разгърнете всички услуги
azd deploy
```

### Кеширане на сборката
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Ефективни внедрявания на код
```bash
# Използвайте azd deploy (не azd up) за промени само в кода
# Това пропуска предоставянето на инфраструктура и е много по-бързо
azd deploy

# Разгръщайте конкретна услуга за най-бърза итерация
azd deploy --service api
```

## 🔍 Наблюдение на внедряването

### Наблюдение на внедряването в реално време
```bash
# Наблюдение на приложението в реално време
azd monitor --live

# Преглед на логовете на приложението
azd monitor --logs

# Проверка на състоянието на разгръщането
azd show
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

# Проверка на състоянието на приложението
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

## 🔐 Съображения за сигурността

### Управление на тайни
```bash
# Съхранявайте тайните сигурно
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Позовете се на тайните в azure.yaml
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

### Идентичност и управление на достъпа
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
# AZD няма вграден механизъм за връщане назад. Препоръчителни подходи:

# Опция 1: Повторно разполагане от Git (препоръчително)
git revert HEAD  # Отменете проблемния комит
git push
azd deploy

# Опция 2: Повторно разполагане на конкретен комит
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Връщане назад на инфраструктурата
```bash
# Прегледайте промените в инфраструктурата преди прилагане
azd provision --preview

# За връщане на инфраструктурата използвайте контрол на версиите:
git revert HEAD  # Върнете промените в инфраструктурата
azd provision    # Приложете предишното състояние на инфраструктурата
```

### Връщане назад на миграцията на базата данни
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрики на внедряването

### Следете производителността на внедряването
```bash
# Преглед на текущия статус на внедряването
azd show

# Наблюдение на приложението с Application Insights
azd monitor --overview

# Преглед на метрики в реално време
azd monitor --live
```

### Събиране на потребителски метрики
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

### 1. Консистентност на средите
```bash
# Използвайте последователно именуване
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Поддържайте съответствие между средите
./scripts/sync-environments.sh
```

### 2. Валидация на инфраструктурата
```bash
# Прегледайте промените в инфраструктурата преди внедряване
azd provision --preview

# Използвайте linting за ARM/Bicep
az bicep lint --file infra/main.bicep

# Проверете синтаксиса на Bicep
az bicep build --file infra/main.bicep
```

### 3. Интеграция на тестовете
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

### 4. Документация и логване
```bash
# Документирайте процедурите за внедряване
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следващи стъпки

- [Осигуряване на ресурси](provisioning.md) - Подробно разглеждане на управлението на инфраструктурата
- [Планиране преди внедряване](../chapter-06-pre-deployment/capacity-planning.md) - Планирайте вашата стратегия за внедряване
- [Чести проблеми](../chapter-07-troubleshooting/common-issues.md) - Разрешаване на проблеми при внедряване
- [Най-добри практики](../chapter-07-troubleshooting/debugging.md) - Стратегии за внедряване готови за продукция

## 🎯 Практически упражнения за внедряване

### Упражнение 1: Работен поток за инкрементално внедряване (20 минути)
**Цел**: Овладейте разликата между пълни и инкрементални внедрявания

```bash
# Първоначално внедряване
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Запишете времето на първоначалното внедряване
echo "Full deployment: $(date)" > deployment-log.txt

# Направете промяна в кода
echo "// Updated $(date)" >> src/api/src/server.js

# Внедряване само на кода (бързо)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Сравнете времената
cat deployment-log.txt

# Почистване
azd down --force --purge
```

**Критерии за успех:**
- [ ] Пълното внедряване отнема 5-15 минути
- [ ] Внедряване само на кода отнема 2-5 минути
- [ ] Промените в кода се отразяват в внедреното приложение
- [ ] Инфраструктурата остава непроменена след `azd deploy`

**Резултат от обучението**: `azd deploy` е 50-70% по-бърз от `azd up` за промени в кода

### Упражнение 2: Персонализирани hooks за внедряване (30 минути)
**Цел**: Реализирайте автоматизация преди и след внедряване

```bash
# Създайте скрипт за валидация преди внедряване
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Проверете дали тестовете минават
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Проверете за непотвърдени промени
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Създайте smoke тест след внедряване
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

# Добавете hooks в azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Тествайте внедряването с hooks
azd deploy
```

**Критерии за успех:**
- [ ] Скриптът преди внедряване се изпълнява преди внедряването
- [ ] Внедряването се прекратява, ако тестовете не са успешни
- [ ] Пост-внедрителният smoke тест валидира здравето
- [ ] Hooks се изпълняват в правилния ред

### Упражнение 3: Стратегия за внедряване в множество среди (45 минути)
**Цел**: Реализирайте етапен работен поток за внедряване (dev → staging → production)

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

# Стъпка 3: Ръчно одобрение за продукционна среда
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

# Изпълни поетапно разгръщане
./deploy-staged.sh
```

**Критерии за успех:**
- [ ] Средата dev се внедрява успешно
- [ ] Средата staging се внедрява успешно
- [ ] Ръчно одобрение е изисквано за production
- [ ] Всички среди имат работещи проверки на здравето
- [ ] Може да се върне назад при необходимост

### Упражнение 4: Стратегия за връщане назад (25 минути)
**Цел**: Реализирайте и тествайте връщане назад на внедряването с помощта на Git

```bash
# Разгръщане на v1
azd env set APP_VERSION "1.0.0"
azd up

# Запазване на хеша на комита за v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Разгръщане на v2 с несъвместима промяна
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Откриване на грешка и връщане назад
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Връщане назад чрез git
    git revert HEAD --no-edit
    
    # Възстановяване на средата
    azd env set APP_VERSION "1.0.0"
    
    # Повторно разгръщане на v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критерии за успех:**
- [ ] Може да открие провали при внедряване
- [ ] Скриптът за връщане назад се изпълнява автоматично
- [ ] Приложението се връща в работно състояние
- [ ] Проверките на здравето преминават след връщането назад

## 📊 Проследяване на метриките на внедряването

### Следете производителността на вашето внедряване

```bash
# Създаване на скрипт за метрики при внедряване
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

# Записване във файл
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Използвайте го
./track-deployment.sh
```

**Анализирайте вашите метрики:**
```bash
# Преглед на историята на внедряванията
cat deployment-metrics.csv

# Изчисляване на средното време за внедряване
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Допълнителни ресурси

- [Справочник за внедряване на Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Внедряване в Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Внедряване в Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Внедряване на Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигация**
- **Предишен урок**: [Вашият първи проект](../chapter-01-foundation/first-project.md)
- **Следващ урок**: [Осигуряване на ресурси](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на услуга за превод с изкуствен интелект Co-op Translator (https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от човек. Ние не носим отговорност за никакви недоразумения или погрешни тълкувания, възникнали в резултат на използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->