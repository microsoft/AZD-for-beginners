# Водич за распоређивање - Савладавање AZD распоређивања

**Преглед поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 4 - Инфраструктура као код и распоређивање
- **⬅️ Претходно поглавље**: [Поглавље 3: Конфигурација](../getting-started/configuration.md)
- **➡️ Следеће**: [Обезбеђивање ресурса](provisioning.md)
- **🚀 Следеће поглавље**: [Поглавље 5: Вишеструка AI решења](../../examples/retail-scenario.md)

## Увод

Овај свеобухватни водич покрива све што треба да знате о распоређивању апликација користећи Azure Developer CLI, од основних распоређивања једном командом до напредних продукционих сценарија са прилагођеним скриптама, вишеструким окружењима и интеграцијом са CI/CD. Савладајте цео животни циклус распоређивања уз практичне примере и најбоље праксе.

## Циљеви учења

Завршетком овог водича, научићете да:
- Савладате све Azure Developer CLI команде и радне токове за распоређивање
- Разумете цео животни циклус распоређивања, од обезбеђивања до праћења
- Примените прилагођене скрипте за аутоматизацију пре и после распоређивања
- Конфигуришете вишеструка окружења са параметрима специфичним за окружење
- Поставите напредне стратегије распоређивања, укључујући blue-green и canary распоређивања
- Интегришете azd распоређивања са CI/CD процесима и DevOps радним токовима

## Исходи учења

По завршетку, бићете у могућности да:
- Самостално извршавате и решавате проблеме са свим azd радним токовима за распоређивање
- Дизајнирате и примените прилагођену аутоматизацију распоређивања користећи скрипте
- Конфигуришете продукциона распоређивања са одговарајућом безбедношћу и праћењем
- Управљате сложеним сценаријима распоређивања у више окружења
- Оптимизујете перформансе распоређивања и примените стратегије враћања
- Интегришете azd распоређивања у праксе предузетничког DevOps-а

## Преглед распоређивања

Azure Developer CLI пружа неколико команди за распоређивање:
- `azd up` - Комплетан радни ток (обезбеђивање + распоређивање)
- `azd provision` - Само креирање/ажурирање Azure ресурса
- `azd deploy` - Само распоређивање апликационог кода
- `azd package` - Изградња и паковање апликација

## Основни радни токови распоређивања

### Комплетно распоређивање (azd up)
Најчешћи радни ток за нове пројекте:
```bash
# Разместите све од почетка
azd up

# Разместите са специфичним окружењем
azd up --environment production

# Разместите са прилагођеним параметрима
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Само обезбеђивање инфраструктуре
Када је потребно ажурирати само Azure ресурсе:
```bash
# Обезбеди/ажурирај инфраструктуру
azd provision

# Обезбеди са dry-run да прегледаш промене
azd provision --preview

# Обезбеди одређене услуге
azd provision --service database
```

### Само распоређивање кода
За брза ажурирања апликације:
```bash
# Разместите све услуге
azd deploy

# Очекивани излаз:
# Размештање услуга (azd deploy)
# - веб: Размештање... Завршено
# - апи: Размештање... Завршено
# УСПЕХ: Ваше размештање је завршено за 2 минута и 15 секунди

# Разместите одређену услугу
azd deploy --service web
azd deploy --service api

# Разместите са прилагођеним аргументима за изградњу
azd deploy --service api --build-arg NODE_ENV=production

# Потврдите размештање
azd show --output json | jq '.services'
```

### ✅ Провера распоређивања

Након сваког распоређивања, проверите успех:

```bash
# Проверите да ли су све услуге покренуте
azd show

# Тестирајте здравствене крајње тачке
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Проверите дневнике за грешке
azd logs --service api --since 5m | grep -i error
```

**Критеријуми успеха:**
- ✅ Све услуге показују статус "Ради"
- ✅ Ендпоинти за здравствену проверу враћају HTTP 200
- ✅ Нема грешака у логовима у последњих 5 минута
- ✅ Апликација одговара на тест захтеве

## 🏗️ Разумевање процеса распоређивања

### Фаза 1: Скрипте пре обезбеђивања
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

### Фаза 2: Обезбеђивање инфраструктуре
- Чита шаблоне инфраструктуре (Bicep/Terraform)
- Креира или ажурира Azure ресурсе
- Конфигурише мрежу и безбедност
- Поставља праћење и логовање

### Фаза 3: Скрипте после обезбеђивања
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
- Креира артефакте за распоређивање
- Пакује за циљну платформу (контејнери, ZIP фајлови, итд.)

### Фаза 5: Скрипте пре распоређивања
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
- Распоређује упаковане апликације на Azure услуге
- Ажурира конфигурационе поставке
- Покреће/поново покреће услуге

### Фаза 7: Скрипте после распоређивања
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

### Поставке распоређивања специфичне за услугу
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

# Тестно окружење
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

### Апликације са више услуга
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
# Направите плаво окружење
azd env new production-blue
azd up --environment production-blue

# Тестирајте плаво окружење
./scripts/test-environment.sh production-blue

# Пребаците саобраћај на плаво (мануелно ажурирање DNS/балансера оптерећења)
./scripts/switch-traffic.sh production-blue

# Очистите зелено окружење
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

### Фазна распоређивања
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

## 🐳 Распоређивања контејнера

### Распоређивања апликација у контејнерима
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

### Оптимизација Dockerfile-а у више фаза
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

### Паралелна распоређивања
```bash
# Конфигуришите паралелно распоређивање
azd config set deploy.parallelism 5

# Распоредите услуге паралелно
azd deploy --parallel
```

### Кеширање изградње
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

### Инкрементална распоређивања
```bash
# Разместите само измењене услуге
azd deploy --incremental

# Разместите са детекцијом промена
azd deploy --detect-changes
```

## 🔍 Праћење распоређивања

### Праћење распоређивања у реалном времену
```bash
# Пратите напредак распоређивања
azd deploy --follow

# Прегледајте записе распоређивања
azd logs --follow --service api

# Проверите статус распоређивања
azd show --service api
```

### Провере здравља
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

# Проверите здравље апликације
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

## 🔐 Безбедносни аспекти

### Управљање тајнама
```bash
# Чувајте тајне безбедно
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

## 🚨 Стратегије враћања

### Брзо враћање
```bash
# Врати се на претходно распоређивање
azd deploy --rollback

# Врати одређену услугу
azd deploy --service api --rollback

# Врати се на одређену верзију
azd deploy --service api --version v1.2.3
```

### Враћање инфраструктуре
```bash
# Вратите измене инфраструктуре
azd provision --rollback

# Прегледајте измене враћања
azd provision --rollback --preview
```

### Враћање миграције базе података
```bash
#!/bin/bash
# скриптови/повратак-базе-података.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрике распоређивања

### Праћење перформанси распоређивања
```bash
# Омогући метрике распоређивања
azd config set telemetry.deployment.enabled true

# Прикажи историју распоређивања
azd history

# Преузми статистику распоређивања
azd metrics --type deployment
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
# Користите доследна имена
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Одржавајте паритет окружења
./scripts/sync-environments.sh
```

### 2. Валидација инфраструктуре
```bash
# Потврдите пре примене
azd provision --preview
azd provision --what-if

# Користите ARM/Bicep linting
az bicep lint --file infra/main.bicep
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
# Документуј процедуре распоређивања
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следећи кораци

- [Обезбеђивање ресурса](provisioning.md) - Детаљан преглед управљања инфраструктуром
- [Планирање пре распоређивања](../pre-deployment/capacity-planning.md) - Испланирајте своју стратегију распоређивања
- [Уобичајени проблеми](../troubleshooting/common-issues.md) - Решите проблеме са распоређивањем
- [Најбоље праксе](../troubleshooting/debugging.md) - Стратегије за продукционо спремно распоређивање

## 🎯 Практичне вежбе за распоређивање

### Вежба 1: Радни ток инкременталног распоређивања (20 минута)
**Циљ**: Савладајте разлику између потпуног и инкременталног распоређивања

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
- [ ] Потпуно распоређивање траје 5-15 минута
- [ ] Распоређивање само кода траје 2-5 минута
- [ ] Промене у коду су видљиве у распоређеној апликацији
- [ ] Инфраструктура остаје непромењена након `azd deploy`

**Исход учења**: `azd deploy` је 50-70% бржи од `azd up` за промене у коду

### Вежба 2: Прилагођене скрипте за распоређивање (30 минута)
**Циљ**: Примените аутоматизацију пре и после распоређивања

```bash
# Направите скрипту за валидацију пре деплоја
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Проверите да ли тестови пролазе
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Проверите да ли постоје непредате измене
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Направите тест за проверу након деплоја
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

# Додајте хукс у azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Тестирајте деплојмент са хуксима
azd deploy
```

**Критеријуми успеха:**
- [ ] Скрипта пре распоређивања се извршава пре распоређивања
- [ ] Распоређивање се прекида ако тестови не успеју
- [ ] Скрипта после распоређивања проверава здравље
- [ ] Скрипте се извршавају у исправном редоследу

### Вежба 3: Стратегија распоређивања у више окружења (45 минута)
**Циљ**: Примените фазни радни ток распоређивања (развој → тестирање → продукција)

```bash
# Направи скрипт за распоређивање
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Корак 1: Распоређивање на развој
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Корак 2: Распоређивање на тестирање
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Корак 3: Ручно одобрење за продукцију
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

# Направи окружења
azd env new dev
azd env new staging
azd env new production

# Покрени фазно распоређивање
./deploy-staged.sh
```

**Критеријуми успеха:**
- [ ] Окружење за развој успешно распоређено
- [ ] Окружење за тестирање успешно распоређено
- [ ] Ручно одобрење потребно за продукцију
- [ ] Сва окружења имају функционалне провере здравља
- [ ] Могућност враћања у случају потребе

### Вежба 4: Стратегија враћања (25 минута)
**Циљ**: Примените и тестирајте враћање распоређивања

```bash
# Постави v1
azd env set APP_VERSION "1.0.0"
azd up

# Сачувај v1 конфигурацију
cp -r .azure/production .azure/production-v1-backup

# Постави v2 са променом која прекида
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Откриј неуспех
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Врати код на претходну верзију
    git checkout src/api/src/server.js
    
    # Врати окружење на претходну верзију
    azd env set APP_VERSION "1.0.0"
    
    # Поново постави v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критеријуми успеха:**
- [ ] Могућност детекције неуспеха распоређивања
- [ ] Скрипта за враћање се аутоматски извршава
- [ ] Апликација се враћа у функционално стање
- [ ] Провере здравља пролазе након враћања

## 📊 Праћење метрика распоређивања

### Праћење перформанси вашег распоређивања

```bash
# Направи скрипту за метрике распоређивања
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

# Логовање у датотеку
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Користи то
./track-deployment.sh
```

**Анализирајте своје метрике:**
```bash
# Прикажи историју постављања
cat deployment-metrics.csv

# Израчунај просечно време постављања
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Додатни ресурси

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигација**
- **Претходна лекција**: [Ваш први пројекат](../getting-started/first-project.md)
- **Следећа лекција**: [Обезбеђивање ресурса](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->