# Vodič za implementaciju - Savladavanje AZD implementacija

**Навигација поглавља:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 4 - Инфраструктура као код и имплементација
- **⬅️ Претходно поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)
- **➡️ Следеће**: [Провизионисање ресурса](provisioning.md)
- **🚀 Следеће поглавље**: [Поглавље 5: Вишeагентска AI решења](../../examples/retail-scenario.md)

## Увод

Ова обимна упутства обухватају све што треба да знате о размештању апликација помоћу Azure Developer CLI, од једноставних команда за размештање до напредних продукционих сценарија са прилагођеним hook-овима, више окружења и интеграцијом у CI/CD. Савладајте цео животни циклус размештања уз практичне примере и најбоље праксе.

## Циљеви учења

Завршетком овог водича бићете у стању да:
- Савладате све Azure Developer CLI команде и токове рада за размештање
- Разумете цео животни циклус размештања од провизионисања до надзора
- Имплементирате прилагођене hook-ове за аутоматизацију пре и после размештања
- Конфигуришете више окружења са параметрима специфичним за окружење
- Подесите напредне стратегије размештања укључујући blue-green и canary размештања
- Интегришете azd размештања у CI/CD pipeline-ове и DevOps токове рада

## Испоставни резултати учења

По завршетку, бићете у стању да:
- Самостално извршавате и решавате проблеме у свим azd токовима размештања
- Дизајнирате и имплементирате прилагођену аутоматизацију размештања користећи hook-ове
- Конфигуришете продукциона размештања са адекватном безбедношћу и надзором
- Управљате сложеним сценаријима размештања са више окружења
- Оптимизујете перформансе размештања и имплементирате стратегије повратка (rollback)
- Интегришете azd размештања у предузетничке DevOps праксе

## Преглед размештања

Azure Developer CLI пружа неколико команди за размештање:
- `azd up` - Комплетан ток рада (provision + deploy)
- `azd provision` - Креира/ажурира само Azure ресурсе
- `azd deploy` - Размешта само апликациони код
- `azd package` - Гради и пакује апликације

## Основни токови размештања

### Комплетно размештање (azd up)
Најчешћи ток рада за нове пројекте:
```bash
# Разместити све од нуле
azd up

# Разместити у одређеном окружењу
azd up --environment production

# Разместити са прилагођеним параметрима
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Само провизионисање инфраструктуре
Када је потребно само ажурирати Azure ресурсе:
```bash
# Постављање/ажурирање инфраструктуре
azd provision

# Постављање са пробним извођењем (dry-run) за преглед промена
azd provision --preview

# Постављање одређених услуга
azd provision --service database
```

### Само размештање кода
За брза ажурирања апликације:
```bash
# Деплојирајте све сервисе
azd deploy

# Очекујани излаз:
# Деплојирање сервиса (azd deploy)
# - web: Деплојирање... Готово
# - api: Деплојирање... Готово
# УСПЕХ: Ваше деплојирање је завршено за 2 минута и 15 секунди

# Деплојирајте одређени сервис
azd deploy --service web
azd deploy --service api

# Деплојирајте са прилагођеним аргументима за изградњу
azd deploy --service api --build-arg NODE_ENV=production

# Проверите деплојирање
azd show --output json | jq '.services'
```

### ✅ Верификација размештања

Након сваког размештања, проверите успех:

```bash
# Проверите да ли су сви сервиси покренути
azd show

# Тестирајте ендпоинт-ове за проверу здравља
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Пратите грешке (по подразумевању се отвара у прегледачу)
azd monitor --logs
```

**Критеријуми успеха:**
- ✅ Сви сервиси показују статус "Ради"
- ✅ Здравствени ендпоинти враћају HTTP 200
- ✅ Није било грешака у логовима у последњих 5 минута
- ✅ Апликација одговара на тест захтеве

## 🏗️ Разумевање процеса размештања

### Фаза 1: Pre-Provision Hooks
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

### Фаза 2: Провизионисање инфраструктуре
- Чита шаблоне инфраструктуре (Bicep/Terraform)
- Креира или ажурира Azure ресурсе
- Конфигурише мрежу и безбедност
- Поставља надзор и логовање

### Фаза 3: Post-Provision Hooks
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
- Гради апликациони код
- Креира артефакте за размештање
- Пакује за циљну платформу (контейнери, ZIP фајлови итд.)

### Фаза 5: Pre-Deploy Hooks
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

### Фаза 6: Размештање апликације
- Размешта упаковане апликације на Azure сервисе
- Ажурира подешавања конфигурације
- Покрета/рестартује сервисе

### Фаза 7: Post-Deploy Hooks
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

## 🎛️ Конфигурација размештања

### Поставке размештања по сервису
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

### Конфигурације специфичне за окружење
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

## 🔧 Напредни сценарији размештања

### Апликације са више сервиса
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

### Blue-Green размештања
```bash
# Креирај плаво окружење
azd env new production-blue
azd up --environment production-blue

# Тестирај плаво окружење
./scripts/test-environment.sh production-blue

# Пребаци саобраћај на плаво (ручна измена DNS-а/балансера оптерећења)
./scripts/switch-traffic.sh production-blue

# Очисти зелено окружење
azd env select production-green
azd down --force
```

### Canary размештања
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

### Степенована (staged) размештања
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

## 🐳 Размештање контејнера

### Размештање Container App-ова
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

### Оптимизација Multi-Stage Dockerfile
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

### Размештања специфична за сервис
```bash
# Распореди одређени сервис ради брже итерације
azd deploy --service web
azd deploy --service api

# Распореди све сервисе
azd deploy
```

### Кеширање при грађењу
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Ефикасна размештања кода
```bash
# Користите azd deploy (не azd up) за измене само у коду
# Ово прескаче постављање инфраструктуре и много је брже
azd deploy

# Разместите одређени сервис за најбржу итерацију
azd deploy --service api
```

## 🔍 Надзор размештања

### Надзор размештања у реалном времену
```bash
# Пратите апликацију у реалном времену
azd monitor --live

# Прегледајте логове апликације
azd monitor --logs

# Проверите статус деплоја
azd show
```

### Health Checks
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

### Валидација после размештања
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Провера здравља апликације
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

## 🔐 Безбедносне напомене

### Управљање тајнама
```bash
# Чувајте тајне сигурно
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Позивајте се на тајне у azure.yaml
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

### Иденитет и управљање приступом
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

### Брз повратак
```bash
# AZD нема уграђену функцију за враћање на претходну верзију. Препоручени приступи:

# Опција 1: Поновно деплојовање из Git-а (препоручено)
git revert HEAD  # Вратите проблематични комит
git push
azd deploy

# Опција 2: Поновно деплојовање одређеног комита
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Повратак инфраструктуре
```bash
# Прегледајте измене инфраструктуре пре примене
azd provision --preview

# За враћање инфраструктуре користите систем контроле верзија:
git revert HEAD  # Поништите измене инфраструктуре
azd provision    # Примените претходно стање инфраструктуре
```

### Повратак миграције базе података
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрике размештања

### Пратите перформансе размештања
```bash
# Погледајте тренутни статус распоређивања
azd show

# Надгледајте апликацију помоћу Application Insights
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

# Одржавајте паритет окружења
./scripts/sync-environments.sh
```

### 2. Валидација инфраструктуре
```bash
# Прегледајте измене инфраструктуре пре распоређивања
azd provision --preview

# Користите ARM/Bicep линтовање
az bicep lint --file infra/main.bicep

# Проверите синтаксу Bicep
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
# Документирајте процедуре размештања
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следећи кораци

- [Провизионисање ресурса](provisioning.md) - Детаљан увид у управљање инфраструктуром
- [Планирање пре размештања](../chapter-06-pre-deployment/capacity-planning.md) - Планирајте вашу стратегију размештања
- [Уобичајени проблеми](../chapter-07-troubleshooting/common-issues.md) - Решавање проблема са размештањем
- [Најбоље праксе](../chapter-07-troubleshooting/debugging.md) - Производне стратегије размештања

## 🎯 Практичне вежбе размештања

### Вежба 1: Инкрементални ток размештања (20 минута)
**Циљ**: Савладати разлику између комплетног и инкременталног размештања

```bash
# Почетно постављање
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Забележи време почетног постављања
echo "Full deployment: $(date)" > deployment-log.txt

# Направи измену у коду
echo "// Updated $(date)" >> src/api/src/server.js

# Постави само код (брзо)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Упореди времена
cat deployment-log.txt

# Очисти
azd down --force --purge
```

**Критеријуми успеха:**
- [ ] Комплетно размештање траје 5-15 минута
- [ ] Само размештање кода траје 2-5 минута
- [ ] Промене у коду су видљиве у размештаној апликацији
- [ ] Инфраструктура остаје непромењена након `azd deploy`

**Исход учења**: `azd deploy` је 50-70% бржи од `azd up` за промене кода

### Вежба 2: Прилагођени hook-ови за размештање (30 минута)
**Циљ**: Имплементирати аутоматизацију пре и после размештања

```bash
# Креирати скрипту за валидацију пре деплоја
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Проверити да ли тестови пролазе
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Проверити да ли постоје некомитоване промене
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Креирати smoke тест након деплоја
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

# Додати hook-ове у azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Тестирати деплој са hook-овима
azd deploy
```

**Критеријуми успеха:**
- [ ] Скрипта пре размештања се покреће пре размештања
- [ ] Размештање се прекида ако тестови падну
- [ ] Post-deploy smoke тест валида здравље
- [ ] Hook-ови се извршавају у исправном редоследу

### Вежба 3: Стратегија размештања за више окружења (45 минута)
**Циљ**: Имплементирати степеновани ток размештања (dev → staging → production)

```bash
# Креирај скрипту за распоређивање
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Корак 1: Деплој на дев окружење
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Корак 2: Деплој на стејџинг окружење
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Корак 3: Ручно одобрење за продукционо окружење
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

# Покрени пофазно распоређивање
./deploy-staged.sh
```

**Критеријуми успеха:**
- [ ] Dev окружење је успешно размештано
- [ ] Staging окружење је успешно размештано
- [ ] За продукцију је потребно ручно одобрење
- [ ] Сва окружења имају функционишуће health чекове
- [ ] Могуће је вратити стање ако је неопходно

### Вежба 4: Стратегија повратка (25 минута)
**Циљ**: Имплементирати и тестирати повратак размештања користећи Git

```bash
# Распореди v1
azd env set APP_VERSION "1.0.0"
azd up

# Сачувај хеш комита за v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Распореди v2 са променом која крши уназадну компатибилност
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Откриј неуспех и врати на претходно стање
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Врати помоћу Гита
    git revert HEAD --no-edit
    
    # Врати окружење
    azd env set APP_VERSION "1.0.0"
    
    # Поново распореди v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критеријуми успеха:**
- [ ] Може да детектује неуспехе размештања
- [ ] Скрипта за повратак се покреће аутоматски
- [ ] Апликација се враћа у радно стање
- [ ] Health чекови пролазе након повратка

## 📊 Праћење метрика размештања

### Пратите перформансе вашег размештања

```bash
# Направите скрипту за метрике распоређивања
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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Записивање у датотеку
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Користите га
./track-deployment.sh
```

**Анализирајте ваше метрике:**
```bash
# Прикажи историју распорeђивања
cat deployment-metrics.csv

# Израчунај просечно време распорeђивања
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Додатни ресурси

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигација**
- **Претходна лекција**: [Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **Следећа лекција**: [Провизионисање ресурса](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен помоћу AI сервиса за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, имајте у виду да аутоматски преводи могу да садрже грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати коначним и ауторитетним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било какве неспоразуме или погрешне тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->