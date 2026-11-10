# Ръководство за внедряване - Усвояване на AZD внедряванията

**Навигация в главите:**
- **📚 Начало на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 4 - Инфраструктура като код и внедряване
- **⬅️ Предишна глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)
- **➡️ Следваща**: [Осигуряване на ресурси](provisioning.md)
- **🧩 Също в тази глава**: [Създаване на собствен шаблон](custom-templates.md)
- **🚀 Следваща глава**: [Глава 5: Мултиагентски AI решения](../../examples/retail-scenario.md)

## Въведение

> Прегледано спрямо `azd 1.37.2` (ноември 2026). Командите използват Bash; JSON примерите изискват `jq`. С изключение на експлицитно инициализираното упражнение todo, разширените примери са **фрагменти за интеграция**: предоставете свой собствен код, инфраструктура, тестове и скриптове. Не са изпълнявани Azure внедрявания по време на този преглед.

Това обширно ръководство обхваща всичко, което трябва да знаете за внедряването на приложения с помощта на Azure Developer CLI, от базови внедрявания с една команда до напреднали производствени сценарии с персонализирани хук команди, множество среди и интеграция с CI/CD. Усвоете целия жизнен цикъл за внедряване с практически примери и най-добри практики.

## Цели за обучение

След завършване на това ръководство ще:
- Усвоите всички команди и работни потоци за внедряване с Azure Developer CLI
- Разберете пълния жизнен цикъл на внедряване от осигуряване до наблюдение
- Изпълнявате персонализирана автоматизация на внедряване чрез хук команди преди и след внедряването
- Конфигурирате множество среди с параметри специфични за средата
- Настроите напреднали стратегии за внедряване като blue-green и canary
- Интегрирате внедряванията на azd с CI/CD тръбопроводи и DevOps работни потоци

## Резултати от обучението

След завършване ще можете:
- Самостоятелно да изпълнявате и отстранявате проблеми с всички работни потоци за внедряване azd
- Да проектирате и внедрявате персонализирана автоматизация за внедряване с помощта на хук команди
- Да конфигурирате внедрявания готови за производство с подходяща сигурност и наблюдение
- Да управлявате сложни мулти-средови сценарии за внедряване
- Да оптимизирате производителността на внедряване и да прилагате стратегии за отмяна
- Да интегрирате внедряванията azd в корпоративни DevOps практики

## Преглед на внедряването

Azure Developer CLI предоставя няколко команди за внедряване:
- `azd up` - Пълен работен поток (осигуряване + внедряване)
- `azd provision` - Създаване/актуализация само на Azure ресурси
- `azd deploy` - Внедряване само на приложен код
- `azd package` - Компилиране и пакетиране на приложения

## Основни работни потоци за внедряване

### Пълно внедряване (azd up)
Най-често използваният работен поток за нови проекти:
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

### Внедряване само на инфраструктура
Когато трябва само да актуализирате Azure ресурсите:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Внедряване само на код
За бързи актуализации на приложението:
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

### ✅ Проверка на внедряването

След всяко внедряване проверете успеха:

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

**Критерии за успех:**
- ✅ `azd show` разрешава очакваните целеви услуги/URL-и
- ✅ Заявките към реални маршрути на приложението връщат очаквания статус и съдържание
- ✅ Няма грешки в логовете през последните 5 минути
- ✅ Приложението отговаря на тестови заявки

## 🏗️ Разбиране на процеса на внедряване

### Нови в хук командите? Започнете тук

**Хук** е команда, която azd изпълнява автоматично в определен момент от процеса на внедряване — преди или след осигуряване на ресурси и преди или след внедряване на кода. Те ви позволяват да автоматизирате дребните задачи, които винаги съпътстват внедряването: попълване на база данни, изпълнение на миграции, компилиране на активи или базово тестване на живото приложение.

| Хук | Изпълнява се… | Често използвано |
|------|-------|------------|
| `preprovision` | Преди създаването на ресурси | Проверка на изисквания, влизане в регистър |
| `postprovision` | След като ресурсите съществуват | Конфигуриране на ресурси, настройка на база данни |
| `predeploy` | Преди кодът да бъде внедрен | Компилиране на front-end активи, изпълнение на unit тестове |
| `postdeploy` | След като кодът е активен | Изпълнение на DB миграции, бързо тестване на крайна точка |

Хук командите живеят във вашия `azure.yaml`. Ето най-малкият възможен пример — просто отпечатва съобщение след внедряването:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Това е — следващия път когато стартирате `azd up`, съобщението ще се отпечата автоматично. Може също да изпълните хук команда самостоятелно, без пълно внедряване, което е чудесно за тестване:

```bash
azd hooks run postdeploy
```

Долу фазите показват реални хук команди (миграции, тестове, валидиране) за всеки етап.

### Фаза 1: Хук команди преди осигуряване
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

### Фаза 2: Осигуряване на инфраструктура
- Четене на инфраструктурни шаблони (Bicep/Terraform)
- Създаване или актуализация на Azure ресурси
- Конфигуриране на мрежа и сигурност
- Настройка на наблюдение и логване

### Фаза 3: Хук команди след осигуряване
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
- Компилиране на код на приложението
- Създаване на артефакти за внедряване
- Пакетиране за целева платформа (контейнери, ZIP файлове и др.)

### Фаза 5: Хук команди преди внедряване
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
- Внедряване на пакетирани приложения в Azure услуги
- Актуализация на конфигурационни настройки
- Стартиране/рестартиране на услуги

### Фаза 7: Хук команди след внедряване
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

### Обработка на грешки в хук командите

По подразбиране, **ако хук команда приключи с код на грешка различен от 0, azd спира цялата операция.** Това обикновено е желаното поведение — неуспешната миграция трябва да прекрати внедряването, а не да пусне счупено приложение. Но това означава, че хук командите трябва да се пишат добре.

**1. Нека грешките да са очевидни и умишлени.** Хук неуспява, когато последната му команда върне код за изход, различен от 0. В шел скриптове добавете `set -e`, за да се прекрати изпълнението на хук командата при първата грешка, вместо да продължава тихо:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Позволете на хук команда да не успее без да спира azd.** За некритични стъпки (опционално затопляне на кеш, известяване по възможност), задайте `continueOnError: true`. azd ще регистрира неуспеха, но ще продължи:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Тествайте хук командите изолирано преди пълно изпълнение.** Не е нужно да стартирате `azd up`, за да дебъгнете хук — изпълнете го самостоятелно и итерайте бързо:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Внимавайте за специфични за ОС шел среди.** Хук команда с `shell: pwsh` изисква PowerShell инсталиран на машината, която я изпълнява (вкл. CI агенти). Използвайте `shell: sh` за максимална съвместимост, или осигурете и двете варианти `windows` и `posix`:

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

> **Съвет за дебъг:** стартирайте всяка azd команда с `--debug`, за да видите точната командна линия на хук и цялото му изходно съдържание — безценно, когато хук работи локално, но се проваля в CI.

## 🎛️ Конфигурация за внедряване

### Специфични настройки за услуги при внедряване
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

### Среда-специфични конфигурации

Това са локални стойности на azd. Ясно ги свържете с инфраструктурата/конфигурацията при изпълнение. `NODE_ENV` обикновено е `production` за разгърнато Node приложение, включително стейджинг внедряване; използвайте отделна променлива, специфична за приложението, за разграничаване на етапите.

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

## 🔧 Напреднали сценарии за внедряване

### Мулти-сервисни приложения
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

**Илюстративен оперативен план:** трябва да осигурите и двете среди, общ слой за маршрутизиране на трафик и двата долупосочени скрипта. azd не превключва трафика и не валидира готовността за отмяна автоматично. Дръжте зелената среда докато синята премине изпитания и отмяната вече не е нужна.

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
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Разделянето на трафика е част от конфигурацията на Container Apps (Bicep или Azure CLI), не е свойство на `azure.yaml` `trafficSplit`. Прегледът и осигуряването, а след това и внедряванията, трябва да запазват избрания режим на ревизия и правила за маршрутизиране.

### Степенувани внедрявания
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

## 🐳 Внедрявания на контейнери

### Внедряване на Container App
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

Конфигурирайте runtime тайни с `configuration.secrets`/`secretRef` (или препратки към Key Vault) и мащабиране с `template.scale` в инфраструктурата на Container App. Не измисляйте нива на услуги с `secrets` или `scale` свойства в `azure.yaml`.

### Оптимизация на многостепенен Dockerfile
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

## ⚡ Оптимизация на производителността

### Специфични внедрявания за услуги
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Кеширане на билдове
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Стандартният Node работен поток използва скриптове на пакети; `prepackage` хукове на услугата могат да добавят нужните стъпки. Кеширането на Docker слоеве е отделно от дефинирането на команда за билд на услуга.

### Ефективни внедрявания на код
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Наблюдение на внедряването

### Наблюдение на внедряването в реално време
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Проверки на здравословното състояние
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

Вашето приложение трябва да имплементира `/health`; това не се осигурява автоматично от azd. Няма общо `azure.yaml` `healthCheck` свойство на услугата.

### Валидация след внедряване
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

## 🔐 Съображения за сигурността

### Управление на тайни
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` е невалидно. Обикновените стойности на средата са локални явен текст; не приемайте, че командите за четене ги цензурират. Командите по-горе запазват препратки към Key Vault, но вашата инфраструктура/приложение все пак трябва да консумира тайните и да осигури достъп на runtime идентичност.

### Мрежова сигурност
Декларирайте и използвайте мрежови параметри в Bicep, и ги свържете в `infra/main.parameters.json`. Няма общo `infra.parameters` накладка в `azure.yaml`. Примерните документационни диапазони `203.0.113.0/24` и `198.51.100.0/24` не са реални офис/ВПН мрежи; заменете ги с разрешени мрежови диапазони.

### Управление на идентичности и достъп
Активирайте `identity` на Container App в Bicep и задайте необходимата роля за Key Vault на ниво обект на сейфа. Конфигурирайте именувани тайни с Key Vault и препратки за runtime в този ресурс; `identity` и `keyVault` не са общи свойства на azd услуги. Вижте [Аутентикация и управлявана идентичност](../chapter-03-configuration/authsecurity.md).

## 🚨 Стратегии за отмяна

### Бърза отмяна
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

### Отмяна на инфраструктура
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Отмяна на миграция на база данни
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

### Следете производителността на внедряването
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Колекция на персонализирани метрики
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
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следващи стъпки

- [Осигуряване на ресурси](provisioning.md) - Подробен анализ на управлението на инфраструктура
- [Планиране преди внедряване](../chapter-06-pre-deployment/capacity-planning.md) - Планирайте своята стратегия за внедряване
- [Чести проблеми](../chapter-07-troubleshooting/common-issues.md) - Решавайте проблеми при внедряване
- [Най-добри практики](../chapter-07-troubleshooting/debugging.md) - Стратегии за производство на готови внедрявания

## 🎯 Практически упражнения за внедряване

### Упражнение 1: Инкрементален работен поток за внедряване (20 минути)
**Цел**: Усвоете разликата между пълни и частични внедрявания

**Начална точка:** Bash, Node.js 22, Git, azd вход и Azure абонамент с права за внедряване. Стартирайте в нова директория; очаквайте облагаеми App Service/Cosmos DB ресурси. Времето зависи от региона и шаблона.

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

**Критерии за успех:**
- [ ] Запишете изминалото време за двете команди (няма гарантирано време)
- [ ] Двете команди завършват успешно
- [ ] API остава функционален; редакцията само на коментар не е видима промяна в UI
- [ ] Инфраструктурата не се променя след `azd deploy`

**Резултат от обучението**: `azd deploy` пропуска осигуряването на инфраструктура. Сравнявайте измерените времена, а не приемайте фиксирано ускорение в проценти.

### Упражнение 2: Персонализирани хук команди за внедряване (30 минути)
**Цел**: Имплементирайте автоматизация преди и след внедряване

**Начална точка:** инициализирания по-горе `deployment-practice` проект. Ако сте го изчистили, изпълнете `azd up` отново преди да тествате внедряване само на код. Валидацията по-долу използва реалния build скрипт на API, а не несъществуващия root `test:unit` скрипт. Тестовете на шаблона за API изискват конфигуриран достъп до база данни; те не са изолирани unit тестове.

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

**Критерии за успех:**
- [ ] Скриптът преди внедряване стартира преди самото внедряване
- [ ] Внедряването се прекъсва, ако валидацията при билд се провали
- [ ] След внедряване се изпълнява бърз тест за здравословно състояние
- [ ] Хук командите се изпълняват в правилния ред

### Упражнение 3: Мулти-средовa стратегия за внедряване (45 минути)
**Цел**: Имплементирайте степенуван работен поток за внедряване (dev → staging → production)

**Начална точка:** същият инициализиран проект todo с `jq`. Създайте средите по-долу с реални стойности за абонамент/локация (или задайте `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` във всяка) **преди** да стартирате процеса без подкана. Той нарочно се проваля, вместо да измисля липсващи стойности. Използвайте само временни учебни среди, не реален производствен абонамент.

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

**Критерии за успех:**
- [ ] Средата за разработка да се разположи успешно
- [ ] Средата за предварително пускане да се разположи успешно
- [ ] Ръчно одобрение за продукция е необходимо
- [ ] Всички среди имат работещи проверки на състоянието
- [ ] Възможност за връщане назад при нужда

### Упражнение 4: Стратегия за връщане назад (25 минути)
**Цел**: Имплементиране и тестване на връщане на разгръщането с Git

**Начална точка:** изолирано учебно копие на todo шаблона с всичките начални изходни файлове, чисто Git работно дърво и конфигурирана временна среда. Никога не въвеждайте умишлени грешки в реален производствен проект. `APP_VERSION` по-долу е за сметка само, освен ако изрично не го свържете към приложението.

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

**Критерии за успех:**
- [ ] Може да открива грешки при разгръщане
- [ ] Скриптът за връщане назад се изпълнява автоматично
- [ ] Приложението се връща в работно състояние
- [ ] Проверките на здравето минават след връщането назад

## 📊 Проследяване на метрики за разгръщане

### Проследете представянето на разгръщането си

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

**Анализирайте метриките си:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Допълнителни ресурси

- [Референция за разгръщане с Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Разгръщане на Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Разгръщане на Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Разгръщане на Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигация**
- **Предишен урок**: [Вашият първи проект](../chapter-01-foundation/first-project.md)
- **Следващ урок**: [Осигуряване на ресурси](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->