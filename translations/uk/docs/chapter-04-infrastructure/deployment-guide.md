# Посібник з розгортання - Освоєння розгортань AZD

**Навігація по розділах:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 4 - Інфраструктура як код та розгортання
- **⬅️ Попередній розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)
- **➡️ Наступний**: [Надання ресурсів](provisioning.md)
- **🧩 Також у цьому розділі**: [Створення власного шаблону](custom-templates.md)
- **🚀 Наступний розділ**: [Розділ 5: AI рішення з кількома агентами](../../examples/retail-scenario.md)

## Вступ

> Переглянуто за `azd 1.37.2` (листопад 2026). Команди використовують Bash; приклади JSON потребують `jq`. Крім явно ініціалізованого завдання todo, просунуті приклади — це **фрагменти інтеграції**: надайте власне джерело, інфраструктуру, тести та скрипти. Розгортання в Azure у цьому огляді не виконувалось.

Цей вичерпний посібник охоплює все, що потрібно знати про розгортання застосунків за допомогою Azure Developer CLI — від базового розгортання однією командою до складних виробничих сценаріїв з користувацькими хуками, кількома середовищами та інтеграцією CI/CD. Опануйте повний життєвий цикл розгортання з практичними прикладами та найкращими практиками.

## Цілі навчання

Завершивши цей посібник, ви зможете:
- Опанувати всі команди та робочі процеси розгортання Azure Developer CLI
- Зрозуміти повний життєвий цикл розгортання від надання ресурсів до моніторингу
- Реалізувати користувацькі хуки для автоматизації перед та після розгортання
- Налаштувати кілька середовищ з параметрами, специфічними для середовища
- Налаштувати просунуті стратегії розгортання, включно з blue-green та canary розгортаннями
- Інтегрувати розгортання azd з CI/CD конвеєрами та DevOps робочими процесами

## Результати навчання

Після завершення ви зможете:
- Виконувати та усувати проблеми у всіх робочих процесах розгортання azd самостійно
- Проєктувати та реалізувати користувацьку автоматизацію розгортання за допомогою хуків
- Налаштувати розгортання, готові до виробництва, з належною безпекою та моніторингом
- Керувати складними сценаріями розгортання з кількома середовищами
- Оптимізувати продуктивність розгортання та впроваджувати стратегії відкату
- Інтегрувати розгортання azd у корпоративні практики DevOps

## Огляд розгортання

Azure Developer CLI надає декілька команд розгортання:
- `azd up` - Повний робочий процес (надання + розгортання)
- `azd provision` - Створення/оновлення лише ресурсів Azure
- `azd deploy` - Розгортання лише коду застосунку
- `azd package` - Збірка та пакування застосунків

## Базові робочі процеси розгортання

### Повне розгортання (azd up)
Найпоширеніший робочий процес для нових проєктів:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Розгортання лише інфраструктури
Коли потрібно лише оновити ресурси Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Розгортання лише коду
Для швидких оновлень застосунку:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Перевірка розгортання

Після будь-якого розгортання переконайтеся у успіху:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Критерії успіху:**
- ✅ `azd show` вирішує очікувані цілі/URL сервісу
- ✅ Запити до реальних маршрутів застосунку повертають очікуваний статус і тіло
- ✅ Немає помилок у логах за останні 5 хвилин
- ✅ Застосунок відповідає на тестові запити

## 🏗️ Розуміння процесу розгортання

### Новачок у хуках? Почніть тут

**Хук** — це команда, яку azd автоматично виконує в певний момент процесу розгортання — до або після надання ресурсів, та до або після розгортання коду. Вони дозволяють автоматизувати дрібні завдання, що часто супроводжують розгортання: наповнення бази даних, запуск міграцій, збірка активів або первинне тестування живого застосунку.

| Хук | Виконується… | Звичайне використання |
|------|-------|------------|
| `preprovision` | До створення ресурсів | Перевірка попередніх умов, вхід в реєстр |
| `postprovision` | Після існування ресурсів | Налаштування ресурсів, підготовка бази даних |
| `predeploy` | До розгортання коду | Збірка фронтенд активів, запуск юніт-тестів |
| `postdeploy` | Після активації коду | Запуск міграцій БД, швидке тестування кінцевої точки |

Хуки знаходяться у вашому `azure.yaml`. Ось найменший можливий приклад — просто виводить повідомлення після розгортання:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Ось і все — наступного разу при запуску `azd up` повідомлення виводитиметься автоматично. Хук можна також запустити окремо, без повного розгортання, що зручно для тестування:

```bash
azd hooks run postdeploy
```

Нижче наведено реальні хуки (міграції, тести, перевірка) для кожного етапу.

### Фаза 1: Хуки перед наданням ресурсів
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

### Фаза 2: Надання інфраструктури
- Зчитує шаблони інфраструктури (Bicep/Terraform)
- Створює або оновлює ресурси Azure
- Налаштовує мережу та безпеку
- Налаштовує моніторинг та логування

### Фаза 3: Хуки після надання ресурсів
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
- Пакує для цільової платформи (контейнери, ZIP файли тощо)

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
- Розгортає паковані застосунки на сервіси Azure
- Оновлює налаштування конфігурації
- Запускає/перезапускає сервіси

### Фаза 7: Хуки після розгортання
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Обробка помилок хуків

За замовчуванням, **якщо команда хуку завершується з ненульовим кодом, azd припиняє всю операцію.** Зазвичай це саме те, що потрібно — провал міграції має зупинити розгортання, а не доставити поламаний застосунок. Але це означає, що хуки потрібно писати обережно.

**1. Робіть помилки явними і очевидними.** Хук зазнає невдачі, якщо остання команда повертає ненульовий код виходу. У скриптах shell додайте `set -e`, щоб хук припинився на першій помилці, а не продовжувався мовчки:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Дозвольте хук не вдались без зупинки azd.** Для не критичних кроків (необов’язкове прогрівання кешу, сповіщення з найкращим зусиллям) встановіть `continueOnError: true`. azd зафіксує помилку в логах, але продовжить роботу:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Тестуйте хуки окремо перед повним запуском.** Не обов’язково запускати `azd up` щоб відлагодити хук — запустіть його окремо і швидко ітеруйте:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Звертайте увагу на оболонки, специфічні для ОС.** Хук, що використовує `shell: pwsh`, потребує встановленого PowerShell на машині, де він запускається (у тому числі CI агенти). Використовуйте `shell: sh` для максимальної портативності або надайте обидва варіанти `windows` та `posix`:

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

> **Підказка для відлагодження:** запускайте будь-яку команду azd з `--debug`, щоб побачити точну команду хуку та її повний вивід — це безцінно, коли хук працює локально, але падає в CI.

## 🎛️ Конфігурація розгортання

### Налаштування розгортання для конкретного сервісу
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Конфігурації для конкретного середовища

Це лише локальні значення azd. Явно зіставляйте їх з конфігурацією інфраструктури/часу виконання. `NODE_ENV` зазвичай є `production` для розгорнутого Node-застосунку, включно з проміжним розгортанням; використовуйте окрему змінну, специфічну для застосунку, щоб розрізняти стадії розгортання.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Складніші сценарії розгортання

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

**Ілюстративний операційний сценарій:** ви маєте надати обидва середовища, спільний шар маршрутизації трафіку та два скрипти нижче. azd не переключає трафік і не перевіряє готовність до відкату автоматично. Тримайте green, доки blue не пройде тестування, і відкат більше не буде потрібен.

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

### Canary розгортання
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Розподіл трафіку належить до конфігурації Container Apps (Bicep або Azure CLI), а не до властивості `azure.yaml` `trafficSplit`. Попередній перегляд/надання та пізніші розгортання мають зберігати обраний вами режим ревізії та правила маршрутизації.

### Короткоступеневі розгортання
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
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
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Налаштуйте секрети часу виконання через `configuration.secrets`/`secretRef` (або посилання на Key Vault) і масштабування через `template.scale` в інфраструктурі Container App. Не вигадуйте на рівні сервісу властивості `secrets` або `scale` у `azure.yaml`.

### Оптимізація Dockerfile з кількома стадіями
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Оптимізація продуктивності

### Розгортання, специфічні для сервісу
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Кешування збірки
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Стандартний робочий процес Node використовує скрипти пакетів; хуки сервісу `prepackage` можуть додавати необхідні кроки. Кешування шарів Docker відокремлене від визначення команди збірки сервісу.

### Ефективне розгортання коду
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Моніторинг розгортання

### Моніторинг розгортання в реальному часі
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Перевірки здоров’я
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Ваш застосунок повинен реалізувати `/health`; azd його не постачає автоматично. Немає загальної властивості сервісу `azure.yaml` `healthCheck`.

### Перевірка після розгортання
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Міркування з безпеки

### Керування секретами
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` недійсна. Звичайні значення середовища — це локальний відкритий текст; не припускайте, що команди читання їх редагують. Команди вище зберігають посилання на Key Vault, але ваша інфраструктура/застосунок мають споживати секрети та надавати доступ ідентичності часу виконання.

### Мережева безпека
Задавайте та використовуйте мережеві параметри у Bicep і зіставляйте їх у `infra/main.parameters.json`. Немає загального накладання `infra.parameters` у `azure.yaml`. Приклад документації охоплює діапазони `203.0.113.0/24` і `198.51.100.0/24`, які не є реальними офісними/VPN мережами; замініть їх на авторизовані мережеві діапазони.

### Управління ідентичністю та доступом
Увімкніть `identity` Container App у Bicep і призначте необхідну роль на рівні Key Vault для операцій з даними. Налаштуйте іменовані секрети, що базуються на Key Vault, і посилання часу виконання у цьому ресурсі; `identity` і `keyVault` не є загальними властивостями azd сервісу. Детальніше див. [Автентифікація та керована ідентичність](../chapter-03-configuration/authsecurity.md).

## 🚨 Стратегії відкату

### Швидкий відкат
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Відкат інфраструктури
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Відкат міграції бази даних
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
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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

## 🎯 Найкращі практики

### 1. Узгодженість середовища
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Перевірка інфраструктури
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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

### 4. Документація та логування
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Наступні кроки

- [Надання ресурсів](provisioning.md) - Глибокий аналіз керування інфраструктурою
- [Планування перед розгортанням](../chapter-06-pre-deployment/capacity-planning.md) - Плануйте свою стратегію розгортання
- [Звичайні проблеми](../chapter-07-troubleshooting/common-issues.md) - Усунення проблем з розгортанням
- [Найкращі практики](../chapter-07-troubleshooting/debugging.md) - Стратегії розгортання, готові до виробництва

## 🎯 Практичні вправи з розгортання

### Вправа 1: Крокове розгортання (20 хвилин)
**Мета:** Опанувати різницю між повним і кроковим розгортанням

**Початкові умови:** Bash, Node.js 22, Git, вхід azd і підписка Azure з правами розгортання. Запускайте у новій теці; очікуйте на обліковувані ресурси App Service/Cosmos DB. Час залежить від регіону та шаблону.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Критерії успіху:**
- [ ] Записати час виконання обох команд (гарантій по тривалості немає)
- [ ] Обидві команди виконалися успішно
- [ ] API залишається функціональним; коментарі змін не видимі у UI
- [ ] Інфраструктура незмінна після `azd deploy`

**Очікуваний результат:** `azd deploy` пропускає надання інфраструктури. Порівнюйте виміряні часи, а не вважайте фіксовану відсоткову швидкість.

### Вправа 2: Користувацькі хуки розгортання (30 хвилин)
**Мета:** Реалізувати автоматизацію до і після розгортання

**Початкові умови:** ініціалізований проєкт `deployment-practice` вище. Якщо ви його очистили, повторно запустіть `azd up` перед тестуванням розгортання лише коду. Нижче перевірка використовує реальний скрипт збірки API, а не неіснуючий кореневий `test:unit` скрипт. Тести API шаблону вимагають налаштованого доступу до бази даних; це не ізольовані юніт-тести.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Критерії успіху:**
- [ ] Скрипт перед розгортанням виконується до розгортання
- [ ] Розгортання переривається, якщо перевірка збірки не вдається
- [ ] Построзгортовий тест підтверджує стан здоров’я
- [ ] Хуки виконуються у правильному порядку

### Вправа 3: Стратегія розгортання з кількома середовищами (45 хвилин)
**Мета:** Реалізувати кроковий робочий процес розгортання (розробка → проміжне середовище → виробництво)

**Початкова точка:** той самий ініціалізований проект todo з `jq`. Створіть наведені нижче середовища з реальними значеннями підписки/розташування (або встановіть `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` у кожному) **перед** запуском беззапитного робочого процесу. Він навмисно завершується з помилкою, а не вигадує відсутні значення. Використовуйте лише тимчасові навчальні середовища, а не справжню продукційну підписку.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Критерії успіху:**
- [ ] Середовище розробки успішно розгорнуто
- [ ] Середовище підготовки (Staging) успішно розгорнуто
- [ ] Для продукції потрібне ручне затвердження
- [ ] У всіх середовищах працюють перевірки здоров’я
- [ ] Можливість відкотитися за потреби

### Вправа 4: Стратегія відкату (25 хвилин)
**Мета**: Реалізувати та протестувати відкат розгортання за допомогою Git

**Початкова точка:** ізольована навчальна копія шаблону todo з усім базовим кодом у сховищі, чисте робоче дерево Git і налаштоване тимчасове середовище. Ніколи не вводьте навмисні помилки у справжньому продукційному проєкті. `APP_VERSION` нижче використовується лише для обліку, якщо ви явно не підключите це до додатку.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Критерії успіху:**
- [ ] Можливість виявляти помилки розгортання
- [ ] Скрипт відкату виконується автоматично
- [ ] Додаток повертається до робочого стану
- [ ] Перевірки здоров’я проходять після відкату

## 📊 Відстеження метрик розгортання

### Відстежуйте продуктивність вашого розгортання

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Аналізуйте ваші метрики:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Додаткові ресурси

- [Посилання на розгортання за допомогою Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Розгортання Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Розгортання Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Розгортання Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навігація**
- **Попередній урок**: [Ваш перший проєкт](../chapter-01-foundation/first-project.md)
- **Наступний урок**: [Провізія ресурсів](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->