# Посібник із розгортання - Майстерність розгортань AZD

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD Для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 4 - Інфраструктура як код та розгортання
- **⬅️ Попередній розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)
- **➡️ Наступний**: [Провізування ресурсів](provisioning.md)
- **🚀 Наступний розділ**: [Розділ 5: Багатоагентні AI рішення](../../examples/retail-scenario.md)

## Вступ

Цей комплексний посібник охоплює все, що потрібно знати про розгортання застосунків за допомогою Azure Developer CLI, від базових розгортань однією командою до складних виробничих сценаріїв з кастомними хуками, кількома середовищами та інтеграцією CI/CD. Опануйте повний життєвий цикл розгортання з практичними прикладами й найкращими практиками.

## Цілі навчання

Пройшовши цей посібник, ви:
- Опануєте всі команди та робочі процеси розгортання Azure Developer CLI
- Зрозумієте повний життєвий цикл розгортання від провізування до моніторингу
- Реалізуєте кастомні хуки для автоматизації до та після розгортання
- Налаштуєте кілька середовищ зі специфічними параметрами середовища
- Запровадите складні стратегії розгортання, включно з blue-green та canary
- Інтегруєте розгортання azd у CI/CD пайплайни та DevOps робочі процеси

## Результати навчання

Після завершення ви зможете:
- Самостійно виконувати та усувати неполадки в усіх робочих процесах розгортання azd
- Проєктувати та впроваджувати автоматизацію розгортання за допомогою хуків
- Налаштувати готові до виробництва розгортання з відповідним рівнем безпеки та моніторингу
- Керувати складними сценаріями розгортання з кількома середовищами
- Оптимізувати продуктивність розгортання та реалізовувати стратегії відкату
- Інтегрувати розгортання azd у корпоративні практики DevOps

## Огляд розгортання

Azure Developer CLI надає кілька команд для розгортання:
- `azd up` - Повний робочий процес (провізування + розгортання)
- `azd provision` - Лише створення/оновлення ресурсів Azure
- `azd deploy` - Лише розгортання коду застосунку
- `azd package` - Побудова та упаковка застосунків

## Базові робочі процеси розгортання

### Повне розгортання (azd up)
Найпоширеніший робочий процес для нових проєктів:
```bash
# Розгорнути все з нуля
azd up

# Розгорнути з конкретним середовищем
azd up --environment production

# Розгорнути з користувацькими параметрами
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Розгортання лише інфраструктури
Коли потрібно лише оновити ресурси Azure:
```bash
# Забезпечення/оновлення інфраструктури
azd provision

# Забезпечення з тестовим прогоном для попереднього перегляду змін
azd provision --preview

# Забезпечення конкретних служб
azd provision --service database
```

### Розгортання лише коду
Для швидкого оновлення застосунку:
```bash
# Розгорнути всі сервіси
azd deploy

# Очікуваний результат:
# Розгортання сервісів (azd deploy)
# - веб: Розгортання... Готово
# - api: Розгортання... Готово
# УСПІХ: Ваше розгортання завершено за 2 хвилини 15 секунд

# Розгорнути конкретний сервіс
azd deploy --service web
azd deploy --service api

# Розгорнути з користувацькими аргументами збірки
azd deploy --service api --build-arg NODE_ENV=production

# Перевірити розгортання
azd show --output json | jq '.services'
```

### ✅ Перевірка розгортання

Після будь-якого розгортання перевірте успішність:

```bash
# Перевірте, що всі служби працюють
azd show

# Перевірте стан кінцевих точок
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Моніторинг помилок (за замовчуванням відкривається в браузері)
azd monitor --logs
```

**Критерії успішності:**
- ✅ Усі сервіси мають статус "Running"
- ✅ Точки перевірки стану повертають HTTP 200
- ✅ Відсутні записи помилок за останні 5 хвилин
- ✅ Застосунок відповідає на тестові запити

## 🏗️ Розуміння процесу розгортання

### Фаза 1: Хуки перед провізуванням
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

### Фаза 2: Провізування інфраструктури
- Зчитування шаблонів інфраструктури (Bicep/Terraform)
- Створення або оновлення ресурсів Azure
- Налаштування мережі та безпеки
- Впровадження моніторингу та логування

### Фаза 3: Хуки після провізування
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

### Фаза 4: Пакування застосунку
- Побудова коду застосунку
- Створення артефактів для розгортання
- Упаковка для цільової платформи (контейнери, ZIP-файли тощо)

### Фаза 5: Хуки перед розгортанням
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

### Фаза 6: Розгортання застосунку
- Розгортання упакованих застосунків у сервіси Azure
- Оновлення налаштувань конфігурації
- Запуск/перезапуск сервісів

### Фаза 7: Хуки після розгортання
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

## 🎛️ Налаштування розгортання

### Налаштування розгортання для конкретних сервісів
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

### Налаштування для конкретних середовищ
```bash
# Середовище розробки
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Середовище тестування
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Продуктивне середовище
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Складні сценарії розгортання

### Багатосервісні застосунки
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

### Blue-Green розгортання
```bash
# Створити синє середовище
azd env new production-blue
azd up --environment production-blue

# Протестувати синє середовище
./scripts/test-environment.sh production-blue

# Переключити трафік на синє (ручне оновлення DNS/балансувальника навантаження)
./scripts/switch-traffic.sh production-blue

# Очистити зелене середовище
azd env select production-green
azd down --force
```

### Canary розгортання
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

### Послідовні розгортання
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

## 🐳 Розгортання контейнерів

### Розгортання Container App
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

### Оптимізація Dockerfile з кількома етапами
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

## ⚡ Оптимізація продуктивності

### Розгортання для конкретних сервісів
```bash
# Розгорнути конкретну службу для швидшої ітерації
azd deploy --service web
azd deploy --service api

# Розгорнути всі служби
azd deploy
```

### Кешування збірки
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Ефективне розгортання коду
```bash
# Використовуйте azd deploy (не azd up) для змін лише в коді
# Це пропускає розгортання інфраструктури і є набагато швидшим
azd deploy

# Розгортайте конкретний сервіс для найшвидшої ітерації
azd deploy --service api
```

## 🔍 Моніторинг розгортання

### Моніторинг розгортання в режимі реального часу
```bash
# Моніторинг додатку в режимі реального часу
azd monitor --live

# Перегляд журналів додатку
azd monitor --logs

# Перевірка статусу розгортання
azd show
```

### Перевірки стану
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

### Валідація після розгортання
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Перевірка стану застосунку
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

## 🔐 Питання безпеки

### Управління секретами
```bash
# Надійно зберігати секрети
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Посилатися на секрети в azure.yaml
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

### Безпека мережі
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Ідентифікація та управління доступом
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

## 🚨 Стратегії відкату

### Швидкий відкат
```bash
# AZD не має вбудованої функції відкату. Рекомендовані підходи:

# Варіант 1: Повторне розгортання з Git (рекомендовано)
git revert HEAD  # Відкотити проблемний коміт
git push
azd deploy

# Варіант 2: Повторне розгортання конкретного коміту
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Відкат інфраструктури
```bash
# Попередній перегляд змін інфраструктури перед застосуванням
azd provision --preview

# Для відкату інфраструктури використовуйте контроль версій:
git revert HEAD  # Скасувати зміни інфраструктури
azd provision    # Застосувати попередній стан інфраструктури
```

### Відкат міграції бази даних
```bash
#!/bin/bash
# скрипти/відкат-бази-даних.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрики розгортання

### Відстеження продуктивності розгортання
```bash
# Переглянути поточний стан розгортання
azd show

# Моніторинг застосунку з Application Insights
azd monitor --overview

# Переглянути живі метрики
azd monitor --live
```

### Збір кастомних метрик
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

## 🎯 Найкращі практики

### 1. Узгодженість середовищ
```bash
# Використовуйте послідовне іменування
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Підтримуйте однаковість середовища
./scripts/sync-environments.sh
```

### 2. Перевірка інфраструктури
```bash
# Переглянути зміни інфраструктури перед розгортанням
azd provision --preview

# Використовувати перевірку стилю ARM/Bicep
az bicep lint --file infra/main.bicep

# Перевірити синтаксис Bicep
az bicep build --file infra/main.bicep
```

### 3. Інтеграція тестування
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

### 4. Документування та логування
```bash
# Документуйте процедури розгортання
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Наступні кроки

- [Провізування ресурсів](provisioning.md) - Детальний огляд управління інфраструктурою
- [Планування перед розгортанням](../chapter-06-pre-deployment/capacity-planning.md) - Плануйте стратегію розгортання
- [Поширені проблеми](../chapter-07-troubleshooting/common-issues.md) - Вирішення проблем розгортання
- [Найкращі практики](../chapter-07-troubleshooting/debugging.md) - Стратегії розгортання для виробництва

## 🎯 Практичні вправи з розгортання

### Вправа 1: Послідовне розгортання (20 хвилин)
**Мета**: Опанувати різницю між повним та інкрементальним розгортанням

```bash
# Початкове розгортання
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Записати час початкового розгортання
echo "Full deployment: $(date)" > deployment-log.txt

# Зробити зміну у коді
echo "// Updated $(date)" >> src/api/src/server.js

# Розгорнути тільки код (швидко)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Порівняти часи
cat deployment-log.txt

# Очистити
azd down --force --purge
```

**Критерії успіху:**
- [ ] Повне розгортання триває 5-15 хвилин
- [ ] Розгортання лише коду триває 2-5 хвилин
- [ ] Зміни коду відображаються в розгорнутому застосунку
- [ ] Інфраструктура не змінюється після `azd deploy`

**Результат навчання**: `azd deploy` на 50-70% швидше за `azd up` для змін у коді

### Вправа 2: Кастомні хуки розгортання (30 хвилин)
**Мета**: Реалізувати автоматизацію до та після розгортання

```bash
# Створити скрипт перевірки перед розгортанням
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Перевірити, чи проходять тести
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Перевірити наявність незакомічених змін
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Створити тест після розгортання
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

# Додати хуки до azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Протестувати розгортання з хуками
azd deploy
```

**Критерії успіху:**
- [ ] Скрипт перед розгортанням виконується перед розгортанням
- [ ] Розгортання припиняється, якщо тести не проходять
- [ ] Після розгортання провадиться перевірка "smoke test"
- [ ] Хуки виконуються у правильному порядку

### Вправа 3: Стратегія розгортання для кількох середовищ (45 хвилин)
**Мета**: Реалізувати послідовний робочий процес розгортання (dev → staging → production)

```bash
# Створити скрипт розгортання
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Крок 1: Розгорнути на dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Крок 2: Розгорнути на staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Крок 3: Ручне підтвердження для production
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

# Створити середовища
azd env new dev
azd env new staging
azd env new production

# Запустити покрокове розгортання
./deploy-staged.sh
```

**Критерії успіху:**
- [ ] Середовище розробки розгортається успішно
- [ ] Середовище тестування розгортається успішно
- [ ] Потрібне ручне затвердження для production
- [ ] Усі середовища мають працюючі перевірки стану
- [ ] Можливий відкат за потреби

### Вправа 4: Стратегія відкату (25 хвилин)
**Мета**: Реалізувати та протестувати відкат розгортання за допомогою Git

```bash
# Розгорнути v1
azd env set APP_VERSION "1.0.0"
azd up

# Зберегти хеш коміту v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Розгорнути v2 з критичною зміною
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Виявити помилку та відкотитися
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Відкотити за допомогою git
    git revert HEAD --no-edit
    
    # Відкотити середовище
    azd env set APP_VERSION "1.0.0"
    
    # Повторно розгорнути v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критерії успіху:**
- [ ] Можна виявити несправності розгортання
- [ ] Скрипт відкату виконується автоматично
- [ ] Застосунок повертається у робочий стан
- [ ] Перевірки стану проходять після відкату

## 📊 Відстеження метрик розгортання

### Відстежуйте продуктивність свого розгортання

```bash
# Створити скрипт метрик розгортання
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

# Запис у файл
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Використовуйте його
./track-deployment.sh
```

**Аналізуйте свої метрики:**
```bash
# Переглянути історію розгортання
cat deployment-metrics.csv

# Обчислити середній час розгортання
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Додаткові ресурси

- [Посилання на розгортання Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Розгортання Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Розгортання Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Розгортання Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навігація**
- **Попередній урок**: [Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **Наступний урок**: [Провізування ресурсів](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, просимо враховувати, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->