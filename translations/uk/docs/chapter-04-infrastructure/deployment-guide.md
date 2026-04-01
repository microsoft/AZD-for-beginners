# Посібник з розгортання - Майстерність розгортання AZD

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 4 - Інфраструктура як код і розгортання
- **⬅️ Попередній розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)
- **➡️ Далі**: [Налаштування ресурсів](provisioning.md)
- **🚀 Наступний розділ**: [Розділ 5: Багатоагентні AI-рішення](../../examples/retail-scenario.md)

## Вступ

Цей комплексний посібник охоплює все, що вам потрібно знати про розгортання застосунків за допомогою Azure Developer CLI, від базових розгортань одною командою до складних виробничих сценаріїв з користувацькими хуками, кількома середовищами та інтеграцією CI/CD. Опановуйте повний життєвий цикл розгортання з практичними прикладами та найкращими практиками.

## Освітні цілі

Виконавши цей посібник, ви:
- Опануєте всі команди й робочі процеси розгортання Azure Developer CLI
- Зрозумієте повний життєвий цикл розгортання від налаштування до моніторингу
- Реалізуєте користувацькі хуки для автоматизації до і після розгортання
- Налаштуєте кілька середовищ з параметрами, специфічними для кожного середовища
- Впровадите передові стратегії розгортання, включаючи синьо-зелені та канаркові розгортання
- Інтегруєте розгортання azd у CI/CD пайплайни та DevOps робочі процеси

## Очікувані результати навчання

Після завершення ви зможете:
- Виконувати й усувати неполадки у всіх робочих процесах розгортання azd самостійно
- Проектувати й реалізувати автоматизацію розгортання за допомогою хуків
- Налаштовувати промислові розгортання з відповідним рівнем безпеки й моніторингу
- Керувати складними сценаріями розгортання в кількох середовищах
- Оптимізувати продуктивність розгортання та впроваджувати стратегії відкату
- Інтегрувати розгортання azd у корпоративні DevOps практики

## Огляд розгортання

Azure Developer CLI надає кілька команд розгортання:
- `azd up` - повний робочий процес (налаштування + розгортання)
- `azd provision` - лише створення/оновлення ресурсів Azure
- `azd deploy` - лише розгортання коду застосунку
- `azd package` - збірка і пакування застосунків

## Базові робочі процеси розгортання

### Повне розгортання (azd up)
Найпоширеніший робочий процес для нових проєктів:
```bash
# Розгорнути все з нуля
azd up

# Розгорнути з конкретним середовищем
azd up --environment production

# Розгорнути з власними параметрами
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Розгортання лише інфраструктури
Якщо потрібно лише оновити ресурси Azure:
```bash
# Забезпечення/оновлення інфраструктури
azd provision

# Забезпечення з тестовим запуском для перегляду змін
azd provision --preview

# Забезпечення конкретних служб
azd provision --service database
```

### Розгортання лише коду
Для швидких оновлень застосунку:
```bash
# Розгорнути всі сервіси
azd deploy

# Очікуваний результат:
# Розгортання сервісів (azd deploy)
# - web: Розгортається... Готово
# - api: Розгортається... Готово
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

Після будь-якого розгортання перевірте успіх:

```bash
# Перевірте, що всі служби працюють
azd show

# Протестуйте кінцеві точки здоров'я
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Слідкуйте за помилками (за замовчуванням відкривається у браузері)
azd monitor --logs
```

**Критерії успіху:**
- ✅ Усі служби мають статус "Запущено"
- ✅ Ендпоїнти здоров’я повертають HTTP 200
- ✅ Немає помилок у логах за останні 5 хвилин
- ✅ Застосунок відповідає на тестові запити

## 🏗️ Розуміння процесу розгортання

### Фаза 1: Хуки до налаштування
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

### Фаза 2: Налаштування інфраструктури
- Читає шаблони інфраструктури (Bicep/Terraform)
- Створює або оновлює ресурси Azure
- Налаштовує мережу і безпеку
- Налаштовує моніторинг і логування

### Фаза 3: Хуки після налаштування
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
- Збирає код застосунку
- Створює артефакти розгортання
- Пакує для цільової платформи (контейнери, ZIP-файли тощо)

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
- Розгортає упаковані застосунки у сервіси Azure
- Оновлює конфігурації
- Запускає/перезапускає служби

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

## 🎛️ Конфігурація розгортання

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

### Конфігурації, специфічні для середовищ
```bash
# Середовище розробки
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Проміжне середовище
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

### Синьо-зелені розгортання
```bash
# Створити синє середовище
azd env new production-blue
azd up --environment production-blue

# Протестувати синє середовище
./scripts/test-environment.sh production-blue

# Перемкнути трафік на синє (ручне оновлення DNS/балансувальника навантаження)
./scripts/switch-traffic.sh production-blue

# Очистити зелене середовище
azd env select production-green
azd down --force
```

### Канаркові розгортання
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

### Розгортання з етапами
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

### Розгортання контейнерних застосунків
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

### Оптимізація Dockerfile з багатьма етапами
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
# Розгорнути конкретний сервіс для швидшої ітерації
azd deploy --service web
azd deploy --service api

# Розгорнути всі сервіси
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
# Це пропускає розгортання інфраструктури і значно швидше
azd deploy

# Розгорніть конкретну службу для найшвидшої ітерації
azd deploy --service api
```

## 🔍 Моніторинг розгортання

### Моніторинг розгортання в реальному часі
```bash
# Моніторинг застосунку в режимі реального часу
azd monitor --live

# Переглянути журнали застосунку
azd monitor --logs

# Перевірити стан розгортання
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

# Перевірити стан додатку
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
# Безпечно зберігайте секрети
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Посилання на секрети в azure.yaml
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

### Мережна безпека
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
# AZD не має вбудованого відкату. Рекомендовані підходи:

# Варіант 1: Повторне розгортання з Git (рекомендується)
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
# Перегляньте зміни інфраструктури перед застосуванням
azd provision --preview

# Для відкату інфраструктури використовуйте контроль версій:
git revert HEAD  # Відкотіть зміни інфраструктури
azd provision    # Застосуйте попередній стан інфраструктури
```

### Відкат міграцій бази даних
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Метрики розгортання

### Відстеження продуктивності розгортання
```bash
# Переглянути поточний статус розгортання
azd show

# Моніторинг застосунку за допомогою Application Insights
azd monitor --overview

# Переглянути показники в реальному часі
azd monitor --live
```

### Збір користувацьких метрик
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

## 🎯 Кращі практики

### 1. Узгодженість середовищ
```bash
# Використовуйте послідовне найменування
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Підтримуйте паритет середовища
./scripts/sync-environments.sh
```

### 2. Валідація інфраструктури
```bash
# Переглянути зміни інфраструктури перед розгортанням
azd provision --preview

# Використовуйте лінтинг ARM/Bicep
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
# Документувати процедури розгортання
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Наступні кроки

- [Налаштування ресурсів](provisioning.md) - Глибоке занурення в управління інфраструктурою
- [Планування перед розгортанням](../chapter-06-pre-deployment/capacity-planning.md) - Плануйте свою стратегію розгортання
- [Поширені проблеми](../chapter-07-troubleshooting/common-issues.md) - Вирішення проблем розгортання
- [Кращі практики](../chapter-07-troubleshooting/debugging.md) - Стратегії розгортання готових до виробництва

## 🎯 Практичні вправи з розгортання

### Вправа 1: Інкрементний робочий процес розгортання (20 хвилин)
**Мета**: Опанувати відмінності між повним і інкрементним розгортанням

```bash
# Початкове розгортання
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Записати час початкового розгортання
echo "Full deployment: $(date)" > deployment-log.txt

# Внести зміну в код
echo "// Updated $(date)" >> src/api/src/server.js

# Розгорнути лише код (швидко)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Порівняти часи
cat deployment-log.txt

# Прибрати за собою
azd down --force --purge
```

**Критерії успіху:**
- [ ] Повне розгортання займає 5-15 хвилин
- [ ] Розгортання лише коду займає 2-5 хвилин
- [ ] Зміни коду відображаються в розгорнутому застосунку
- [ ] Інфраструктура не змінюється після `azd deploy`

**Очікуваний результат**: `azd deploy` працює на 50-70% швидше за `azd up` при зміні коду

### Вправа 2: Користувацькі хуки розгортання (30 хвилин)
**Мета**: Реалізувати автоматизацію до і після розгортання

```bash
# Створити скрипт валідації перед розгортанням
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

# Створити скрипт "smoke test" після розгортання
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

# Тестувати розгортання з хуками
azd deploy
```

**Критерії успіху:**
- [ ] Скрипт до розгортання запускається перед розгортанням
- [ ] Розгортання припиняється, якщо тести не проходять
- [ ] Після розгортання проходить smoke-тест здоров’я
- [ ] Хуки виконуються у правильному порядку

### Вправа 3: Стратегія розгортання в кількох середовищах (45 хвилин)
**Мета**: Реалізувати покроковий робочий процес розгортання (dev → staging → production)

```bash
# Створити скрипт розгортання
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Крок 1: Розгорнути на розробку
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Крок 2: Розгорнути на тестове середовище
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Крок 3: Ручне схвалення для продакшена
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

# Запустити поетапне розгортання
./deploy-staged.sh
```

**Критерії успіху:**
- [ ] Середовище розробки розгортається успішно
- [ ] Середовище тестування розгортається успішно
- [ ] Для продакшн потрібне ручне схвалення
- [ ] Усі середовища мають працюючі перевірки здоров’я
- [ ] Можливість відкату при необхідності

### Вправа 4: Стратегія відкату (25 хвилин)
**Мета**: Реалізувати і протестувати відкат розгортання за допомогою Git

```bash
# Розгортання v1
azd env set APP_VERSION "1.0.0"
azd up

# Зберегти хеш коміту v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Розгортання v2 з критичною зміною
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Виявити помилку та відкотити зміни
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Відкотитися за допомогою git
    git revert HEAD --no-edit
    
    # Відкат середовища
    azd env set APP_VERSION "1.0.0"
    
    # Повторне розгортання v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критерії успіху:**
- [ ] Можна виявити збої розгортання
- [ ] Скрипт відкату виконується автоматично
- [ ] Застосунок повертається у робочий стан
- [ ] Перевірки здоров’я проходять після відкату

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Логувати у файл
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Використовуйте це
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

- [Довідник з розгортання Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Розгортання Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Розгортання Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Розгортання Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навігація**
- **Попередній урок**: [Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **Наступний урок**: [Налаштування ресурсів](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будьте уважні, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ його рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується звертатися до професійного людського перекладу. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->