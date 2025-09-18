<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-18T11:42:48+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "sr"
}
-->
# Водич за Деплојмент - Савладавање AZD Деплојмента

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD За Почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 4 - Инфраструктура као Код & Деплојмент
- **⬅️ Претходно поглавље**: [Поглавље 3: Конфигурација](../getting-started/configuration.md)
- **➡️ Следеће**: [Обезбеђивање Ресурса](provisioning.md)
- **🚀 Следеће поглавље**: [Поглавље 5: Вишеструка AI Решења](../../examples/retail-scenario.md)

## Увод

Овај свеобухватни водич покрива све што треба да знате о деплојменту апликација користећи Azure Developer CLI, од основних деплојмента са једном командом до напредних продукционих сценарија са прилагођеним хуковима, више окружења и интеграцијом са CI/CD. Савладајте комплетан животни циклус деплојмента уз практичне примере и најбоље праксе.

## Циљеви учења

Завршетком овог водича, научићете:
- Како да савладате све команде и радне токове Azure Developer CLI деплојмента
- Како да разумете комплетан животни циклус деплојмента од обезбеђивања до мониторинга
- Како да имплементирате прилагођене хукове за аутоматизацију пре и после деплојмента
- Како да конфигуришете више окружења са параметрима специфичним за окружење
- Како да поставите напредне стратегије деплојмента, укључујући blue-green и canary деплојменте
- Како да интегришете azd деплојменте са CI/CD и DevOps радним токовима

## Резултати учења

По завршетку, бићете у могућности да:
- Самостално извршавате и решавате проблеме у свим azd радним токовима деплојмента
- Дизајнирате и имплементирате прилагођену аутоматизацију деплојмента користећи хукове
- Конфигуришете деплојменте спремне за продукцију уз одговарајућу безбедност и мониторинг
- Управљате сложеним сценаријима деплојмента са више окружења
- Оптимизујете перформансе деплојмента и имплементирате стратегије враћања на претходно стање
- Интегришете azd деплојменте у праксе DevOps-а на нивоу предузећа

## Преглед деплојмента

Azure Developer CLI пружа неколико команди за деплојмент:
- `azd up` - Комплетан радни ток (обезбеђивање + деплојмент)
- `azd provision` - Само креирање/ажурирање Azure ресурса
- `azd deploy` - Само деплојмент апликационог кода
- `azd package` - Изградња и паковање апликација

## Основни радни токови деплојмента

### Комплетан деплојмент (azd up)
Најчешћи радни ток за нове пројекте:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Само обезбеђивање инфраструктуре
Када је потребно ажурирати само Azure ресурсе:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Само деплојмент кода
За брза ажурирања апликација:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Разумевање процеса деплојмента

### Фаза 1: Хукови пре обезбеђивања
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
- Поставља мониторинг и логовање

### Фаза 3: Хукови после обезбеђивања
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
- Изграђује апликациони код
- Креира артефакте деплојмента
- Пакује за циљну платформу (контенери, ZIP фајлови, итд.)

### Фаза 5: Хукови пре деплојмента
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

### Фаза 6: Деплојмент апликације
- Деплојмент пакованих апликација на Azure сервисе
- Ажурира конфигурационе поставке
- Покреће/поново покреће сервисе

### Фаза 7: Хукови после деплојмента
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

## 🎛️ Конфигурација деплојмента

### Поставке деплојмента специфичне за сервис
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
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Напредни сценарији деплојмента

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

### Blue-Green деплојменти
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

### Canary деплојменти
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

### Фазни деплојменти
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

## 🐳 Деплојмент контенера

### Деплојмент апликација у контенерима
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

### Паралелни деплојменти
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
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

### Инкрементални деплојменти
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Мониторинг деплојмента

### Мониторинг деплојмента у реалном времену
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

### Валидација после деплојмента
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Check application health
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
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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

## 🚨 Стратегије враћања на претходно стање

### Брзо враћање
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Враћање инфраструктуре
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Враћање миграције базе података
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрике деплојмента

### Праћење перформанси деплојмента
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Валидација инфраструктуре
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следећи кораци

- [Обезбеђивање Ресурса](provisioning.md) - Детаљан преглед управљања инфраструктуром
- [Планирање пре деплојмента](../pre-deployment/capacity-planning.md) - Испланирајте своју стратегију деплојмента
- [Уобичајени проблеми](../troubleshooting/common-issues.md) - Решите проблеме са деплојментом
- [Најбоље праксе](../troubleshooting/debugging.md) - Стратегије деплојмента спремне за продукцију

## Додатни ресурси

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигација**
- **Претходни час**: [Ваш Први Пројекат](../getting-started/first-project.md)
- **Следећи час**: [Обезбеђивање Ресурса](provisioning.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да превод буде тачан, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.