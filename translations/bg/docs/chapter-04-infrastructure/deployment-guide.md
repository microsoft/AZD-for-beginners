# Ръководство за внедряване - Овладяване на AZD внедряванията

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ Previous Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🧩 Also in this chapter**: [Authoring Your Own Template](custom-templates.md)
- **🚀 Next Chapter**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Introduction

Това изчерпателно ръководство обхваща всичко, което трябва да знаете за внедряването на приложения с помощта на Azure Developer CLI — от основни еднокомандни внедрявания до напреднали продукционни сценарии с персонализирани hooks, множество среди и интеграция с CI/CD. Овладейте целия жизнен цикъл на внедряване с практични примери и добри практики.

## Learning Goals

След като завършите това ръководство, вие ще:
- Овладеете всички команди и работни потоци за внедряване на Azure Developer CLI
- Разберете целия жизнен цикъл на внедряване — от провизиране до мониторинг
- Имплементирате персонализирани deployment hooks за автоматизация преди и след внедряване
- Конфигурирате множество среди с параметри, специфични за всяка среда
- Настроите напреднали стратегии за внедряване, включително blue-green и canary внедрявания
- Интегрирате azd внедряванията с CI/CD пайплайни и DevOps работни потоци

## Learning Outcomes

След завършване ще можете да:
- Изпълнявате и отстранявате проблеми с всички azd deployment работни потоци самостоятелно
- Дизайнирате и имплементирате персонализирана автоматизация на внедряване чрез hooks
- Конфигурирате продукционно готови внедрявания с правилна сигурност и наблюдение
- Управлявате сложни многосрередни сценарии за внедряване
- Оптимизирате производителността на внедряването и прилагате стратегии за връщане назад
- Интегрирате azd внедряванията в корпоративни DevOps практики

## Deployment Overview

Azure Developer CLI предоставя няколко команди за внедряване:
- `azd up` - Пълен работен поток (provision + deploy)
- `azd provision` - Създаване/актуализиране само на Azure ресурси
- `azd deploy` - Внедряване само на приложенческия код
- `azd package` - Сглобяване и пакетиране на приложения

## Basic Deployment Workflows

### Complete Deployment (azd up)
Най-често срещаният работен поток за нови проекти:
```bash
# Разгръщане на всичко от нулата
azd up

# Разгръщане в конкретна среда
azd up --environment production

# Разгръщане с персонализирани параметри
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
Когато трябва само да актуализирате Azure ресурсите:
```bash
# Осигуряване/актуализиране на инфраструктурата
azd provision

# Осигуряване в режим 'dry-run' за предварителен преглед на промените
azd provision --preview

# Осигуряване на конкретни услуги
azd provision --service database
```

### Code-Only Deployment
За бързи актуализации на приложението:
```bash
# Разположи всички услуги
azd deploy

# Очакван изход:
# Разполагане на услуги (azd deploy)
# - web: Разполагане... Готово
# - api: Разполагане... Готово
# УСПЕХ: Вашето разполагане приключи за 2 минути и 15 секунди

# Разположи конкретна услуга
azd deploy --service web
azd deploy --service api

# Разположи с персонализирани аргументи за изграждане
azd deploy --service api --build-arg NODE_ENV=production

# Провери разполагането
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

След всяко внедряване, проверете успеха:

```bash
# Проверете дали всички услуги работят
azd show

# Тествайте здравните крайни точки
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Наблюдавайте за грешки (по подразбиране се отваря в браузъра)
azd monitor --logs
```

**Success Criteria:**
- ✅ Всички услуги показват статус "Running"
- ✅ Health endpoint-и връщат HTTP 200
- ✅ Няма грешки в логовете за последните 5 минути
- ✅ Приложението отговаря на тестови заявки

## 🏗️ Understanding the Deployment Process

### New to hooks? Start here

A **hook** е команда, която azd изпълнява автоматично в определен момент от процеса на внедряване — преди или след провизирането, и преди или след внедряването на вашия код. Те ви позволяват да автоматизирате малките задачи, които винаги съпътстват внедряването: зареждане на данни в база, изпълнение на миграции, изграждане на assets или smoke-тест на работещото приложение.

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | Преди създаването на ресурсите | Проверка на предварителни условия, влизане в регистър |
| `postprovision` | След като ресурсите съществуват | Конфигуриране на ресурси, настройка на базата данни |
| `predeploy` | Преди кода да бъде внедрен | Изграждане на front-end assets, изпълнение на модулни тестове |
| `postdeploy` | След като кодът е жив | Изпълнение на DB миграции, smoke-тест на крайна точка |

Hooks се намират във вашия `azure.yaml`. Ето най-малкият възможен пример — той просто отпечатва съобщение след внедряване:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Това е всичко — следващия път когато стартирате `azd up`, съобщението ще се отпечата автоматично. Можете също така да стартирате hook самостоятелно, без пълно внедряване, което е чудесно за тестване:

```bash
azd hooks run postdeploy
```

Фазите по-долу показват реални hooks (миграции, тестове, валидация) за всеки етап.

### Phase 1: Pre-Provision Hooks
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

### Phase 2: Infrastructure Provisioning
- Чете инфраструктурни шаблони (Bicep/Terraform)
- Създава или актуализира Azure ресурси
- Конфигурира мрежа и сигурност
- Настройва мониторинг и логиране

### Phase 3: Post-Provision Hooks
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

### Phase 4: Application Packaging
- Сглобява приложенческия код
- Създава артефакти за внедряване
- Пакетира за целевата платформа (контейнери, ZIP файлове и др.)

### Phase 5: Pre-Deploy Hooks
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

### Phase 6: Application Deployment
- Внедрява пакетирани приложения в Azure услуги
- Актуализира конфигурационни настройки
- Стартира/рестартира услуги

### Phase 7: Post-Deploy Hooks
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

### Handling Hook Errors

По подразбиране, **ако команда на hook приключи с ненулев код на изхода, azd спира цялата операция.** Това обикновено е желаното поведение — неуспешна миграция трябва да спре внедряването, а не да достави дефектно приложение. Но това означава, че hook-овете трябва да са написани внимателно.

**1. Make failures loud and intentional.** Hook се проваля, когато последната му команда върне ненулев exit код. В shell скриптове добавете `set -e`, за да спре hook при първата неуспешна команда вместо да продължава мълчаливо:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Allow a hook to fail without stopping azd.** За некритични стъпки (опционално затопляне на кеш, уведомление по принцип на добри намерения), задайте `continueOnError: true`. azd логва неуспеха, но продължава:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Test hooks in isolation before a full run.** Не е нужно да стартирате `azd up`, за да дебъгнете hook — стартирайте го самостоятелно и итерайте бързо:

```bash
azd hooks run predeploy          # изпълнява само хука predeploy
azd hooks run postdeploy --service api
```

**4. Watch for OS-specific shells.** Hook, използващ `shell: pwsh` изисква PowerShell да е инсталиран на машината, която го изпълнява (включително CI агенти). Използвайте `shell: sh` за най-голяма преносимост, или предоставете както `windows`, така и `posix` варианти:

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

> **Debugging tip:** стартирайте която и да е azd команда с `--debug`, за да видите точната командна линия на hook и пълния му изход — безценна информация, когато hook работи локално, но се проваля в CI.

## 🎛️ Deployment Configuration

### Service-Specific Deployment Settings
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

### Environment-Specific Configurations
```bash
# Среда за разработка
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Стейджинг среда
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Продукционна среда
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Advanced Deployment Scenarios

### Multi-Service Applications
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

### Blue-Green Deployments
```bash
# Създаване на синя среда
azd env new production-blue
azd up --environment production-blue

# Тестване на синя среда
./scripts/test-environment.sh production-blue

# Пренасочване на трафика към синя среда (ръчно обновяване на DNS/балансировчик на натоварване)
./scripts/switch-traffic.sh production-blue

# Почистване на зелена среда
azd env select production-green
azd down --force
```

### Canary Deployments
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

### Staged Deployments
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

## 🐳 Container Deployments

### Container App Deployments
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

### Multi-Stage Dockerfile Optimization
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

## ⚡ Performance Optimization

### Service-Specific Deployments
```bash
# Разположете конкретна услуга за по-бърза итерация
azd deploy --service web
azd deploy --service api

# Разположете всички услуги
azd deploy
```

### Build Caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Efficient Code Deployments
```bash
# Използвайте azd deploy (не azd up) за промени само в кода
# Това пропуска осигуряването на инфраструктурата и е много по-бързо
azd deploy

# Разгръщайте конкретна услуга за най-бърза итерация
azd deploy --service api
```

## 🔍 Deployment Monitoring

### Real-Time Deployment Monitoring
```bash
# Наблюдавайте приложението в реално време
azd monitor --live

# Прегледайте логовете на приложението
azd monitor --logs

# Проверете състоянието на разгръщането
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

### Post-Deployment Validation
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Провери здравето на приложението
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

## 🔐 Security Considerations

### Secrets Management
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

### Network Security
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity and Access Management
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

## 🚨 Rollback Strategies

### Quick Rollback
```bash
# AZD няма вграден механизъм за отмяна. Препоръчани подходи:

# Опция 1: Повторно разгръщане от Git (препоръчително)
git revert HEAD  # Отменете проблемния комит
git push
azd deploy

# Опция 2: Повторно разгръщане на конкретен комит
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# Прегледайте промените в инфраструктурата преди прилагането им
azd provision --preview

# За връщане на инфраструктурата използвайте контрол на версиите:
git revert HEAD  # Върнете промените в инфраструктурата
azd provision    # Приложете предишното състояние на инфраструктурата
```

### Database Migration Rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Deployment Metrics

### Track Deployment Performance
```bash
# Прегледайте текущия статус на разгръщането
azd show

# Наблюдавайте приложението с Application Insights
azd monitor --overview

# Прегледайте метриките в реално време
azd monitor --live
```

### Custom Metrics Collection
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

## 🎯 Best Practices

### 1. Environment Consistency
```bash
# Използвайте последователно именуване
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Поддържайте еднаквост между средите
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# Прегледайте промените в инфраструктурата преди внедряване
azd provision --preview

# Използвайте линтинг за ARM/Bicep
az bicep lint --file infra/main.bicep

# Проверете синтаксиса на Bicep
az bicep build --file infra/main.bicep
```

### 3. Testing Integration
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

### 4. Documentation and Logging
```bash
# Документирайте процедурите за внедряване
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Next Steps

- [Provisioning Resources](provisioning.md) - Дълбоко гмуркане в управлението на инфраструктурата
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - Планирайте вашата стратегия за внедряване
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - Разрешаване на проблеми при внедряване
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - Стратегии за продукционно готово внедряване

## 🎯 Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minutes)
**Goal**: Овладейте разликата между пълни и инкрементални внедрявания

```bash
# Първоначално внедряване
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Запишете времето на първоначалното внедряване
echo "Full deployment: $(date)" > deployment-log.txt

# Направете промяна в кода
echo "// Updated $(date)" >> src/api/src/server.js

# Разгръщане само на кода (бързо)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Сравнете времената
cat deployment-log.txt

# Почистете
azd down --force --purge
```

**Success Criteria:**
- [ ] Пълното внедряване отнема 5-15 минути
- [ ] Внедряването само на код отнема 2-5 минути
- [ ] Промените в кода са отразени в внедреното приложение
- [ ] Инфраструктурата остава непроменена след `azd deploy`

**Learning Outcome**: `azd deploy` е 50-70% по-бърз от `azd up` за промени в кода

### Exercise 2: Custom Deployment Hooks (30 minutes)
**Goal**: Имплементирайте автоматизация преди и след внедряване

```bash
# Създайте скрипт за валидация преди разгръщане
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Проверете дали тестовете преминават
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

# Създайте smoke тест след разгръщане
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

# Добавете hook-ове в azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Тествайте разгръщането с hook-ове
azd deploy
```

**Success Criteria:**
- [ ] Скриптът преди внедряване се изпълнява преди внедряването
- [ ] Внедряването се прекратява, ако тестовете се провалят
- [ ] Post-deploy smoke тест валида здравето
- [ ] Hooks се изпълняват в правилния ред

### Exercise 3: Multi-Environment Deployment Strategy (45 minutes)
**Goal**: Имплементирайте етапен работен поток за внедряване (dev → staging → production)

```bash
# Създайте скрипт за разгръщане
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

# Стъпка 3: Ръчно одобрение за продукционната среда
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

# Създайте среди
azd env new dev
azd env new staging
azd env new production

# Изпълнете поетапно разгръщане
./deploy-staged.sh
```

**Success Criteria:**
- [ ] Dev средата се внедрява успешно
- [ ] Staging средата се внедрява успешно
- [ ] За продукция се изисква ръчно одобрение
- [ ] Всички среди имат работещи health checks
- [ ] Възможно е връщане назад при нужда

### Exercise 4: Rollback Strategy (25 minutes)
**Goal**: Имплементирайте и тествайте rollback на внедряване чрез Git

```bash
# Разгръщане на v1
azd env set APP_VERSION "1.0.0"
azd up

# Запази хеша на комита за v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Разгръщане на v2 с обратно несъвместима промяна
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Откриване на неуспех и връщане към предишна версия
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Връщане към предишна версия чрез git
    git revert HEAD --no-edit
    
    # Възстановяване на средата
    azd env set APP_VERSION "1.0.0"
    
    # Повторно разгръщане на v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Success Criteria:**
- [ ] Може да се засече провал на внедряването
- [ ] Rollback скриптът се изпълнява автоматично
- [ ] Приложението се връща в работно състояние
- [ ] Health checks преминават след rollback

## 📊 Deployment Metrics Tracking

### Track Your Deployment Performance

```bash
# Създайте скрипт за метрики за внедряване
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

# Запис в лог файл
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Използвайте го
./track-deployment.sh
```

**Analyze your metrics:**
```bash
# Преглед на историята на внедряванията
cat deployment-metrics.csv

# Изчисляване на средното време за внедряване
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Additional Resources

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Previous Lesson**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->