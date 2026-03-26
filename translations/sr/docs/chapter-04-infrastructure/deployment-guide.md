# Водиč за распоређивање - Савладавање AZD распоређивања

**Навигација кроз поглавља:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 4 - Инфраструктура као код и распоређивање
- **⬅️ Претходно поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)
- **➡️ Следеће**: [Обезбеђивање ресурса](provisioning.md)
- **🚀 Следеће поглавље**: [Поглавље 5: Више-agentна AI решења](../../examples/retail-scenario.md)

## Увод

Овај свеобухватни водич обухвата све што треба да знате о распоређивању апликација помоћу Azure Developer CLI, од основних једнокомандних распоређивања до напредних продукционих сценарија са прилагођеним hook-овима, више околина и интеграцијом CI/CD. Савладајте комплетан животни циклус распоређивања уз практичне примере и најбоље праксе.

## Циљеви учења

Након завршетка овог водича, бићете у стању да:
- Савладате све команде и токове рада за распоређивање у Azure Developer CLI
- Разумете комплетан животни циклус распоређивања од обезбеђивања до надгледања
- Имплементирате прилагођене hook-ове за аутоматизацију пре и после распоређивања
- Конфигуришете више околина са параметрима специфичним за околину
- Подесите напредне стратегије распоређивања укључујући blue-green и canary распоређивања
- Интегришете azd распоређивања са CI/CD пајплајновима и DevOps токовима рада

## Исходи учења

По завршетку, бићете способни да:
- Извршавате и решавате проблеме свих azd токова распоређивања независно
- Дизајнирате и имплементирате прилагођену аутоматизацију распоређивања користећи hook-ове
- Конфигуришете продукциона распоређивања са исправном безбедношћу и надгледањем
- Управљате комплексним сценаријима распоређивања за више околина
- Оптимизујете перформансе распоређивања и имплементирате стратегије повратка (rollback)
- Интегришете azd распоређивања у корпоративне DevOps практике

## Преглед распоређивања

Azure Developer CLI пружа неколико команди за распоређивање:
- `azd up` - Комплетан ток рада (provision + deploy)
- `azd provision` - Креира/ажурира само Azure ресурсе
- `azd deploy` - Распоређује само код апликације
- `azd package` - Гради и пакује апликације

## Основни токови распоређивања

### Комплетно распоређивање (azd up)
Најчешћи ток рада за нове пројекте:
```bash
# Деплојирај све од нуле
azd up

# Деплојирај у одређеном окружењу
azd up --environment production

# Деплојирај са прилагођеним параметрима
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Рaspоређивање само инфраструктуре
Када треба да ажурирате само Azure ресурсе:
```bash
# Обезбедити/ажурирати инфраструктуру
azd provision

# Обезбедити у пробном режиму (dry-run) за преглед промена
azd provision --preview

# Обезбедити конкретне услуге
azd provision --service database
```

### Рaspоређивање само кода
За брза ажурирања апликације:
```bash
# Деплојирајте све сервисе
azd deploy

# Очекивани излаз:
# Деплојирање сервиса (azd deploy)
# - web: Деплојирање... Завршено
# - api: Деплојирање... Завршено
# УСПЕХ: Ваше деплојирање је завршено за 2 минута 15 секунди

# Деплојирајте одређени сервис
azd deploy --service web
azd deploy --service api

# Деплојирајте са прилагођеним аргументима за изградњу
azd deploy --service api --build-arg NODE_ENV=production

# Проверите деплојирање
azd show --output json | jq '.services'
```

### ✅ Верификација распоређивања

Након било ког распоређивања, проверите успех:

```bash
# Проверите да ли су сви сервиси покренути
azd show

# Тестирајте ендпоинт-ове за здравље
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Надгледајте грешке (по подразумевaњу се отвара у прегледачу)
azd monitor --logs
```

**Критеријуми успеха:**
- ✅ Сви сервиси приказују статус "Running"
- ✅ Health endpoint-и враћају HTTP 200
- ✅ Нема логова са грешкама у последњих 5 минута
- ✅ Апликација одговара на тест захтеве

## 🏗️ Разумевање процеса распоређивања

### Фаза 1: Pre-Provision hook-ови
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

### Фаза 2: Obezbeđивање инфраструктуре
- Чита шаблоне инфраструктуре (Bicep/Terraform)
- Креира или ажурира Azure ресурсе
- Конфигурише умрежавање и безбедност
- Подешава надгледање и логовање

### Фаза 3: Post-Provision hook-ови
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

### Фаза 4: Паковање апликације
- Гради код апликације
- Креира артефакте за распоређивање
- Пакује за циљну платформу (контейнери, ZIP фајлови, итд.)

### Фаза 5: Pre-Deploy hook-ови
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

### Фаза 6: Распоређивање апликације
- Распоређује упаковане апликације на Azure сервисе
- Ажурира конфигурационе поставке
- Покреће/поново покреће сервисе

### Фаза 7: Post-Deploy hook-ови
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

## 🎛️ Конфигурација распоређивања

### Подешавања распоређивања специфична за сервис
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

### Конфигурације специфичне за околину
```bash
# Развојно окружење
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Предпроизводно окружење
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Производно окружење
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Напредни сценарији распоређивања

### Aпликације са више сервиса
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

### Blue-Green распоређивања
```bash
# Креирај плаво окружење
azd env new production-blue
azd up --environment production-blue

# Тестирај плаво окружење
./scripts/test-environment.sh production-blue

# Преусмери саобраћај на плаво окружење (ручно ажурирање DNS-а/балансера оптерећења)
./scripts/switch-traffic.sh production-blue

# Очисти зелено окружење
azd env select production-green
azd down --force
```

### Canary распоређивања
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

### Постепена распоређивања
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

## 🐳 Рaspoređивање контејнера

### Распоређивања Container App-ова
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

### Оптимизација више-stage Dockerfile-а
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

## ⚡ Оптимизација перформанси

### Распоређивања специфична за сервис
```bash
# Деплојирати одређену услугу за брже итерације
azd deploy --service web
azd deploy --service api

# Деплојирати све услуге
azd deploy
```

### Keširanje build-а
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Ефикасна распоређивања кода
```bash
# Користите azd deploy (не azd up) за промене само у коду
# Ово прескаче провизионисање инфраструктуре и много је брже
azd deploy

# Деплојујте одређену услугу за најбржу итерацију
azd deploy --service api
```

## 🔍 Надгледање распоређивања

### Надгледање распоређивања у реалном времену
```bash
# Праћење апликације у реалном времену
azd monitor --live

# Преглед логова апликације
azd monitor --logs

# Провера статуса распоређивања
azd show
```

### Health check-ови
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

### Валидација након распоређивања
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Провери здравље апликације
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

## 🔐 Безбедносна разматрања

### Управљање тајнама
```bash
# Сачувајте тајне безбедно
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Референцирајте тајне у azure.yaml
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

### Мрежна безбедност
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Управљање идентитетом и приступом
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

## 🚨 Стратегије повратка (Rollback)

### Брзи rollback
```bash
# AZD нема уграђено враћање (rollback). Препоручени приступи:

# Опција 1: Поново распоредити из Git-а (препоручено)
git revert HEAD  # Поништите проблематични комит
git push
azd deploy

# Опција 2: Поново распоредити одређени комит
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback инфраструктуре
```bash
# Прегледајте измене инфраструктуре пре примене
azd provision --preview

# За повратак инфраструктуре, користите контролу верзија:
git revert HEAD  # Поништите измене инфраструктуре
azd provision    # Примените претходно стање инфраструктуре
```

### Rollback миграције базе података
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрике распоређивања

### Пратите перформансе распоређивања
```bash
# Погледајте тренутни статус распоређивања
azd show

# Надгледајте апликацију помоћу услуге Application Insights
azd monitor --overview

# Погледајте метрике у реалном времену
azd monitor --live
```

### Прикупљање прилагођених метрика
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

## 🎯 Најбоље праксе

### 1. Конзистентност окружења
```bash
# Користите доследно именовање
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Одржавајте усклађеност окружења
./scripts/sync-environments.sh
```

### 2. Валидација инфраструктуре
```bash
# Прегледајте промене инфраструктуре пре распоређивања
azd provision --preview

# Користите ARM/Bicep линтинг
az bicep lint --file infra/main.bicep

# Проверите синтаксу Bicep-а
az bicep build --file infra/main.bicep
```

### 3. Интеграција тестирања
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

### 4. Документација и логовање
```bash
# Документирајте процедуре за распоређивање.
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следећи кораци

- [Обезбеђивање ресурса](provisioning.md) - Детаљно управљање инфраструктуром
- [Планирање пре распоређивања](../chapter-06-pre-deployment/capacity-planning.md) - Планирајте стратегију распоређивања
- [Уобичајени проблеми](../chapter-07-troubleshooting/common-issues.md) - Решите проблеме при распоређивању
- [Најбоље праксе](../chapter-07-troubleshooting/debugging.md) - Стратегије за продукциона распоређивања

## 🎯 Практичне вежбе распоређивања

### Вежба 1: Инкрементални ток распоређивања (20 минута)
**Циљ**: Савладати разлику између потпуног и инкременталног распоређивања

```bash
# Почетно распоређивање
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Записати време почетног распоређивања
echo "Full deployment: $(date)" > deployment-log.txt

# Направити измену кода
echo "// Updated $(date)" >> src/api/src/server.js

# Распоредити само код (брзо)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Упоредити времена
cat deployment-log.txt

# Очистити
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Потпуно распоређивање траје 5-15 минута
- [ ] Рaspоређивање само кода траје 2-5 минута
- [ ] Измене кода видљиве у распоређеној апликацији
- [ ] Инфраструктура непромењена након `azd deploy`

**Исход учења**: `azd deploy` је 50-70% бржи од `azd up` за измене кода

### Вежба 2: Прилагођени hook-ови за распоређивање (30 минута)
**Циљ**: Имплементирати аутоматизацију пре и после распоређивања

```bash
# Креирај скрипту за валидацију пре распоређивања
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Провери да ли тестови пролазе
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Провери да ли постоје некомитоване промене
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Креирај основни тест након распоређивања
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

# Додај хукове у azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Тестирај распоређивање са хуковима
azd deploy
```

**Критеријуми успеха:**
- [ ] Pre-deploy скрипта се покреће пре распоређивања
- [ ] Рaspоређивање се прекида ако тестови не прођу
- [ ] Post-deploy smoke тест валидаује здравље
- [ ] Hook-ови се извршавају у исправном редоследу

### Вежба 3: Стратегија распоређивања за више околина (45 минута)
**Циљ**: Имплементирати постепени ток распоређивања (dev → staging → production)

```bash
# Креирај скрипт за размештање
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Корак 1: Размештање на развојно окружење
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Корак 2: Размештање на претпроизводно окружење
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Корак 3: Ручно одобрење за производно окружење
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

# Креирај окружења
azd env new dev
azd env new staging
azd env new production

# Покрени размештање по фазама
./deploy-staged.sh
```

**Критеријуми успеха:**
- [ ] Dev окружење се успешно распореди
- [ ] Staging окружење се успешно распореди
- [ ] За продукцију је потребно ручно одобрење
- [ ] Сва окружења имају радне health check-ове
- [ ] Могуће је вратити промене ако је потребно

### Вежба 4: Стратегија rollback-а (25 минута)
**Циљ**: Имплементирати и тестирати rollback распоређивања користећи Git

```bash
# Деплојирај v1
azd env set APP_VERSION "1.0.0"
azd up

# Сачувај хеш комита v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Деплојирај v2 са променом која нарушава уназадну компатибилност
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Откриј неуспех и врати претходну верзију
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Враћање помоћу git-а
    git revert HEAD --no-edit
    
    # Враћање окружења
    azd env set APP_VERSION "1.0.0"
    
    # Поново деплојирај v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критеријуми успеха:**
- [ ] Може да детектује неуспехе распоређивања
- [ ] Rollback скрипта се аутоматски извршава
- [ ] Апликација се враћа у радно стање
- [ ] Health check-ови пролазе након rollback-а

## 📊 Праћење метрика распоређивања

### Пратите перформансе вашег распоређивања

```bash
# Креирај скрипту за метрике размештања
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

# Запиши у датотеку
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Користи је
./track-deployment.sh
```

**Анализирајте своје метрике:**
```bash
# Прикажи историју распоређивања
cat deployment-metrics.csv

# Израчунај просечно време распоређивања
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Додатни ресурси

- [Reference за распоређивање Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Raspoređivanje Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Raspoređivanje Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Raspoređивање Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигација**
- **Претходна лекција**: [Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **Следећа лекција**: [Обезбеђивање ресурса](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен помоћу услуге за превођење засноване на вештачкој интелигенцији [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да будемо прецизни, имајте на уму да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешне тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->