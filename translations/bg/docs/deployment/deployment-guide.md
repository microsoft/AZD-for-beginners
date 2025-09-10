<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-10T06:18:06+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "bg"
}
-->
# Ръководство за внедряване - Овладяване на AZD внедрявания

## Въведение

Това изчерпателно ръководство обхваща всичко, което трябва да знаете за внедряването на приложения с помощта на Azure Developer CLI - от основни внедрявания с една команда до сложни производствени сценарии с персонализирани куки, множество среди и интеграция с CI/CD. Овладейте целия жизнен цикъл на внедряване с практически примери и добри практики.

## Цели на обучението

След завършване на това ръководство ще:
- Овладеете всички команди и работни процеси за внедряване на Azure Developer CLI
- Разберете целия жизнен цикъл на внедряване - от създаване на ресурси до мониторинг
- Реализирате персонализирани куки за автоматизация преди и след внедряване
- Конфигурирате множество среди със специфични за средата параметри
- Настроите сложни стратегии за внедряване, включително blue-green и canary внедрявания
- Интегрирате внедрявания с azd в CI/CD и DevOps работни процеси

## Резултати от обучението

След завършване ще можете:
- Самостоятелно да изпълнявате и отстранявате проблеми във всички работни процеси за внедряване с azd
- Проектирате и реализирате персонализирана автоматизация на внедрявания с помощта на куки
- Конфигурирате внедрявания, готови за производство, с подходяща сигурност и мониторинг
- Управлявате сложни сценарии за внедряване в множество среди
- Оптимизирате производителността на внедряванията и реализирате стратегии за връщане назад
- Интегрирате внедрявания с azd в корпоративни DevOps практики

## Преглед на внедряването

Azure Developer CLI предоставя няколко команди за внедряване:
- `azd up` - Пълен работен процес (създаване на ресурси + внедряване)
- `azd provision` - Създаване/актуализиране само на Azure ресурси
- `azd deploy` - Внедряване само на приложен код
- `azd package` - Създаване и пакетиране на приложения

## Основни работни процеси за внедряване

### Пълно внедряване (azd up)
Най-често използваният работен процес за нови проекти:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Внедряване само на инфраструктура
Когато трябва да актуализирате само Azure ресурси:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Внедряване само на код
За бързи актуализации на приложения:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Разбиране на процеса на внедряване

### Фаза 1: Куки преди създаване на ресурси
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

### Фаза 2: Създаване на инфраструктура
- Чете шаблони за инфраструктура (Bicep/Terraform)
- Създава или актуализира Azure ресурси
- Конфигурира мрежи и сигурност
- Настройва мониторинг и логване

### Фаза 3: Куки след създаване на ресурси
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

### Фаза 5: Куки преди внедряване
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

### Фаза 7: Куки след внедряване
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

### Настройки за внедряване, специфични за услугата
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

## 🐳 Внедряване на контейнери

### Внедряване на приложения в контейнери
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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Кеширане на билдове
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
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Мониторинг на внедряването

### Мониторинг в реално време
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

## 🔐 Съображения за сигурност

### Управление на тайни
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

### Управление на идентичности и достъп
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
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Връщане назад на инфраструктурата
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Връщане назад на миграции на бази данни
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрики за внедряване

### Проследяване на производителността на внедряването
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
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

## 🎯 Добри практики

### 1. Консистентност на средата
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Валидация на инфраструктурата
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Интеграция на тестването
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следващи стъпки

- [Създаване на ресурси](provisioning.md) - Подробно разглеждане на управлението на инфраструктурата
- [Планиране преди внедряване](../pre-deployment/capacity-planning.md) - Планирайте стратегията си за внедряване
- [Чести проблеми](../troubleshooting/common-issues.md) - Решаване на проблеми с внедряването
- [Добри практики](../troubleshooting/debugging.md) - Стратегии за внедряване, готови за производство

## Допълнителни ресурси

- [Референция за внедряване с Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Внедряване на Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Внедряване на Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Внедряване на Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигация**
- **Предишен урок**: [Вашият първи проект](../getting-started/first-project.md)
- **Следващ урок**: [Създаване на ресурси](provisioning.md)

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматичните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия изходен език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от човек. Ние не носим отговорност за каквито и да е недоразумения или погрешни интерпретации, произтичащи от използването на този превод.