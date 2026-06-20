# Водич за распоређивање - Савладавање AZD распоређивања

**Навигација поглавља:**
- **📚 Почетна курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 4 - Инфраструктура као код и распоређивање
- **⬅️ Претходно поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)
- **➡️ Следеће**: [Провизионисање ресурса](provisioning.md)
- **🧩 Такође у овом поглављу**: [Израда сопственог шаблона](custom-templates.md)
- **🚀 Следеће поглавље**: [Поглавље 5: Решења вештачке интелигенције са више агената](../../examples/retail-scenario.md)

## Увод

Ова свеобухватна упутства обухватају све што треба да знате о распоређивању апликација помоћу Azure Developer CLI, од једноставних распоређивања једном командом до напредних продукционих сценарија са прилагођеним хуковима, више окружења и интеграцијом CI/CD. Савладајте цео животни циклус распоређивања уз практичне примере и добре праксе.

## Циљеви учења

Завршетком овог водича ћете:
- Савладати све наредбе и токове рада за распоређивање у Azure Developer CLI
- Разумети цео животни циклус распоређивања од провизионисања до праћења
- Имплементирати прилагођене хукове за аутоматизацију пре и после распоређивања
- Конфигурисати више окружења са параметрима специфичним за окружење
- Подесити напредне стратегије распоређивања укључујући blue-green и canary
- Интегрисати azd распоређивања са CI/CD пипелинима и DevOps токовима рада

## Резултати учења

По завршетку, бићете способни да:
- Покрећете и решавате проблеме у свим azd токовима распоређивања самостално
- Дизајнирате и имплементирате прилагођену аутоматизацију распоређивања користећи хукове
- Конфигуришете продукциона распоређивања са одговарајућом безбедношћу и праћењем
- Управљате сложеним сценаријима распоређивања са више окружења
- Оптимизујете перформансе распоређивања и имплементирате стратегије враћања
- Интегришете azd распоређивања у предузетничке DevOps праксе

## Преглед распоређивања

Azure Developer CLI пружа неколико наредби за распоређивање:
- `azd up` - Комплетан ток рада (provision + deploy)
- `azd provision` - Креира/ажурира само Azure ресурсе
- `azd deploy` - Распоређује само код апликације
- `azd package` - Креира и пакетира апликације

## Основни токови распоређивања

### Потпуно распоређивање (azd up)
Најчешћи ток рада за нове пројекте:
```bash
# Разместити све од нуле
azd up

# Разместити у одређеном окружењу
azd up --environment production

# Разместити са прилагођеним параметрима
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Распоређивање само инфраструктуре
Када треба само да ажурирате Azure ресурсе:
```bash
# Обезбедити/ажурирати инфраструктуру
azd provision

# Пробно обезбеђивање (dry-run) за преглед промена
azd provision --preview

# Обезбедити одређене услуге
azd provision --service database
```

### Распоређивање само кода
За брза ажурирања апликације:
```bash
# Деплојирајте све сервисе
azd deploy

# Очекујани излаз:
# Деплојују се сервиси (azd deploy)
# - web: Деплојује се... Готово
# - api: Деплојује се... Готово
# УСПЕХ: Ваш деплој је завршен за 2 минута и 15 секунди

# Деплојирајте одређени сервис
azd deploy --service web
azd deploy --service api

# Деплојирајте са прилагођеним аргументима за билд
azd deploy --service api --build-arg NODE_ENV=production

# Проверите деплој
azd show --output json | jq '.services'
```

### ✅ Верификација распоређивања

Након сваког распоређивања, проверите успех:

```bash
# Проверите да ли су све услуге покренуте
azd show

# Тестирајте ендпоинте за проверу статуса
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Пратите грешке (по подразумеваној поставци се отвара у прегледачу)
azd monitor --logs
```

**Критеријуми успеха:**
- ✅ Све услуге показују статус „покренуте”
- ✅ Ендпоинти за здравље враћају HTTP 200
- ✅ Нема записа о грешкама у последњих 5 минута
- ✅ Апликација одговара на тест захтеве

## 🏗️ Разумевање процеса распоређивања

### Нисте упознати са хуковима? Почните овде

Хук је наредба коју azd покреће аутоматски у одређеном тренутку током процеса распоређивања — пре или после провизионисања, и пре или после распоређивања вашег кода. Они вам омогућавају да аутоматизујете ситне задатке који увек окружују распоређивање: убацивање података у базу, покретање миграција, изградњу ресурса или брзо тестирање уживо апликације.

| Хук | Покреће се… | Уобичајена употреба |
|------|-------|------------|
| `preprovision` | Пре него што се ресурси креирају | Валидација предуслова, пријава у регистар |
| `postprovision` | Након што ресурси буду креирани | Конфигурација ресурса, подешавање базе података |
| `predeploy` | Пре распоређивања кода | Изградња front-end ресурса, покретање unit тестова |
| `postdeploy` | Након распоређивања кода | Покретање DB миграција, smoke-тест ендпоинта |

Хукови се налазе у вашем `azure.yaml`. Ево најмањег могућег примера — само исписује поруку после распоређивања:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

То је то — следећи пут када покренете `azd up`, порука се аутоматски исписује. Хук можете покренути и самостално, без целог распоређивања, што је одлично за тестирање:

```bash
azd hooks run postdeploy
```

Фазе испод показују реалне хукове (миграције, тестове, валидацију) за сваку фазу.

### Фаза 1: Хукови пре провизионисања
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
- Чита инфраструктурне шаблоне (Bicep/Terraform)
- Креира или ажурира Azure ресурсе
- Конфигурише мрежу и безбедност
- Подешава мониторинг и логовање

### Фаза 3: Хукови после провизионисања
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

### Фаза 4: Пакетирање апликације
- Гради код апликације
- Креира артефакте за распоређивање
- Пакетује за циљну платформу (контејнери, ZIP фајлови итд.)

### Фаза 5: Хукови пре распоређивања
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
- Распоређује пакетиране апликације на Azure сервисе
- Ажурира подешавања конфигурације
- Почиње/рестартује сервисе

### Фаза 7: Хукови после распоређивања
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

### Обрада грешака у хуковима

По подразумеваној вредности, **ако команда хука изађе са кодом различитим од нуле, azd зауставља целу операцију.** То је обично оно што желите — неуспела миграција треба да заустави распоређивање, а не да пошаље покварену апликацију. Међутим, то значи да хукови морају бити написани пажљиво.

**1. Учините неуспехе гласним и намерним.** Хук не успева када последња команда врати ненулти излазни код. У shell скриптама додајте `set -e` да би хук стао на првој неуспелој команди уместо да тихо настави:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Допустите да хук не успе без заустављања azd.** За некритичне кораке (опционално загревање кеша, нотификација по најбољем напору), подесите `continueOnError: true`. azd евидентира неуспех али наставља:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. Тестирајте хукове у изолацији пре пуне извршења.** Не морате да покрећете `azd up` да бисте дебаговали хук — покрените га самостално и брзо итерајте:

```bash
azd hooks run predeploy          # покреће само predeploy hook
azd hooks run postdeploy --service api
```

**4. Пазите на shell-ове специфичне за ОС.** Хук који користи `shell: pwsh` захтева PowerShell инсталиран на машини која га покреће (укључујући CI агенте). Користите `shell: sh` за најширу преносивост, или обезбедите и `windows` и `posix` варијанте:

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

> **Савет за дебаговање:** покрените било коју azd команду са `--debug` да бисте видели тачну командну линију хука и њен цео излаз — незаменљиво када хук ради локално али не успева у CI.

## 🎛️ Конфигурација распоређивања

### Подешавања распоређивања специфична за услугу
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
# Креирај плаво окружење
azd env new production-blue
azd up --environment production-blue

# Тестирај плаво окружење
./scripts/test-environment.sh production-blue

# Преусмери саобраћај на плаво (ручна измена DNS-а/балансера оптерећења)
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

### Стадирана распоређивања
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

### Оптимизација мулти-степ Dockerfile-а
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

### Распоређивања специфична за услугу
```bash
# Деплојирати одређени сервис за брже итерације
azd deploy --service web
azd deploy --service api

# Деплојирати све сервисе
azd deploy
```

### Кеширање изградње
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
# Користите azd deploy (не azd up) за промене које се односе само на код
# Ово прескаче постављање инфраструктуре и много је брже
azd deploy

# Деплојујте одређену услугу за најбржу итерацију
azd deploy --service api
```

## 🔍 Праћење распоређивања

### Праћење распоређивања у реалном времену
```bash
# Надгледајте апликацију у реалном времену
azd monitor --live

# Погледајте логове апликације
azd monitor --logs

# Проверите статус распоређивања
azd show
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

### Валидација после распоређивања
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

## 🔐 Безбедносна разматрања

### Управљање тајнама
```bash
# Сачувајте тајне безбедно
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# У azure.yaml упутите се на тајне
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

### Идентификација и управљање приступом
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
# AZD нема уграђену подршку за повратак. Препоручени приступи:

# Опција 1: Поново распоређивање из Git-а (препоручено)
git revert HEAD  # Поништи проблематични комит
git push
azd deploy

# Опција 2: Поново распоређивање одређеног комита
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Враћање инфраструктуре
```bash
# Прегледајте промене инфраструктуре пре примене
azd provision --preview

# За враћање инфраструктуре, користите систем за контролу верзија:
git revert HEAD  # Поништите промене инфраструктуре
azd provision    # Примените претходно стање инфраструктуре
```

### Враћање миграција базе података
```bash
#!/бин/баш
# скрипте/повраћање-базе-података.sh

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

# Пратите апликацију помоћу Application Insights
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
# Користите доследна имена
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Одржавајте усклађеност окружења
./scripts/sync-environments.sh
```

### 2. Валидација инфраструктуре
```bash
# Прегледајте промене у инфраструктури пре примене
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
# Документујте процедуре за распоређивање
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следећи кораци

- [Провизионисање ресурса](provisioning.md) - Детаљнији увид у управљање инфраструктуром
- [Планирање пре распоређивања](../chapter-06-pre-deployment/capacity-planning.md) - Планирајте своју стратегију распоређивања
- [Чести проблеми](../chapter-07-troubleshooting/common-issues.md) - Решавање проблема са распоређивањем
- [Најбоље праксе](../chapter-07-troubleshooting/debugging.md) - Стратегије распоређивања спремне за продукцију

## 🎯 Практичне вежбе распоређивања

### Вежба 1: Инкрементални ток распоређивања (20 минута)
**Циљ**: Савладати разлику између потпуних и инкременталних распоређивања

```bash
# Почетно распоређивање
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Забележи време почетног распоређивања
echo "Full deployment: $(date)" > deployment-log.txt

# Направи измену кода
echo "// Updated $(date)" >> src/api/src/server.js

# Распореди само код (брзо)
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
- [ ] Промене кода су видљиве у распоређеној апликацији
- [ ] Инфраструктура не промени након `azd deploy`

**Резултат учења**: `azd deploy` је 50-70% бржи од `azd up` за промене у коду

### Вежба 2: Прилагођени хукови за распоређивање (30 минута)
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

# Провери да ли има некомитованих измена
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Креирај smoke тест након распоређивања
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

# Додај hook-ове у azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Тестирај распоређивање са hook-овима
azd deploy
```

**Критеријуми успеха:**
- [ ] Скрипта пре распоређивања се извршава пре распоређивања
- [ ] Распоређивање се прекида ако тестови не успеју
- [ ] Пост-деплој smoke тест валида здравље
- [ ] Хукови се извршавају у исправном редоследу

### Вежба 3: Стратегија распоређивања за више окружења (45 минута)
**Циљ**: Имплементирати стадирани ток распоређивања (dev → staging → production)

```bash
# Креирај скрипту за распоређивање
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Корак 1: Распореди на развојно окружење (dev)
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Корак 2: Распореди на окружење за тестирање (staging)
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

# Покрени распоређивање у фазама
./deploy-staged.sh
```

**Критеријуми успеха:**
- [ ] Dev окружење се успешно распоређује
- [ ] Staging окружење се успешно распоређује
- [ ] Ручно одобрење је потребно за production
- [ ] Сва окружења имају радиони провере здравља
- [ ] Могуће је вратити промене ако је потребно

### Вежба 4: Стратегија враћања (25 минута)
**Циљ**: Имплементирати и тестирати враћање распоређивања користећи Git

```bash
# Распореди v1
azd env set APP_VERSION "1.0.0"
azd up

# Сачувај хеш комита v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Распореди v2 са променом која крши уназадну компатибилност
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Откриј неуспех и изврши повратак
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Повратак помоћу git-а
    git revert HEAD --no-edit
    
    # Враћање окружења
    azd env set APP_VERSION "1.0.0"
    
    # Поново распореди v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Критеријуми успеха:**
- [ ] Могуће је детектовати неуспехе у распоређивању
- [ ] Скрипта за враћање се аутоматски извршава
- [ ] Апликација се враћа у радно стање
- [ ] Провере здравља пролазе након враћања

## 📊 Праћење метрика распоређивања

### Пратите перформансе вашег распоређивања

```bash
# Креирај скрипту за метрике деплоја
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

# Запиши у датотеку
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Користи је
./track-deployment.sh
```

**Анализирајте своје метрике:**
```bash
# Погледајте историју распоређивања
cat deployment-metrics.csv

# Израчунајте просечно време распоређивања
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Додатни ресурси

- [Референца за распоређивање Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Распоређивање у Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Распоређивање у Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Распоређивање Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Навигација**
- **Претходна лекција**: [Ваш први пројекат](../chapter-01-foundation/first-project.md)
- **Следећа лекција**: [Провизионисање ресурса](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->