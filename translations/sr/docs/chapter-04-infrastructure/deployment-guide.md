# Водич за распоредом - Мастеринг AZD распореда

**Навигација по поглављима:**
- **📚 Почетна курсa**: [AZD За почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 4 - Инфраструктура као код и распореде
- **⬅️ Претходно поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)
- **➡️ Следеће**: [Провајдер ресурса](provisioning.md)
- **🧩 Такође у овом поглављу**: [Писање вашег сопственог шаблона](custom-templates.md)
- **🚀 Следеће поглавље**: [Поглавље 5: Мулти-Агент AI решења](../../examples/retail-scenario.md)

## Увод

> Прегледано према `azd 1.37.2` (новембар 2026). Команде користе Баш; ЈСОН примери захтевају `jq`. Оссим за експлицитно иницијализован задатак листе, напредни примери су **фрагменти интеграције**: обезбедите свој извор, инфраструктуру, тестове и скрипте. Ниједан Azure распореде нису извршени у овом прегледу.

Овај свеобухватни водич обухвата све што треба да знате о распоређивању апликација користећи Azure Developer CLI, од основних једнокомандних распореда до напредних сценарија производње са прилагођеним кукама, више окружења и интеграцијом CI/CD. Савладајте комплетан животни циклус распореда са практичним примерима и најбољим праксама.

## Циљеви учења

Завршавајући овај водич, моћи ћете:
- Савладати све Azure Developer CLI команде и токове распореда
- Разумети комплетан животни циклус распореда од провајдеринга до надгледања
- Имплементирати прилагођене хукове распореда за аутоматизацију пре и после распореда
- Конфигурисати више окружења са специфичним параметрима за окружење
- Подесити напредне стратегије распореда укључујући blue-green и canary распореде
- Интегрисати azd распореде са CI/CD пипелинима и DevOps токовима рада

## Очекивани исходи учења

По завршетку, моћи ћете да:
- Самостално извршавате и решавате проблеме код свих azd токова распореда
- Дизајнирате и имплементирате прилагођену аутоматизацију распореда користећи хукове
- Конфигуришете распореде спремне за производњу са одговарајућом безбедношћу и надгледањем
- Управљате сложеним мулти-окружењским сценаријима распореда
- Оптимизујете перформансе распореда и имплементирате стратегије враћања
- Интегришете azd распореде у корпоративне DevOps праксе

## Преглед распореда

Azure Developer CLI пружа неколико команда за распореде:
- `azd up` - Комплетан ток (провајдер + распоред)
- `azd provision` - Само креирање/ажурирање Azure ресурса
- `azd deploy` - Само распоређивање апликацијског кода
- `azd package` - Прављење и паковање апликација

## Основни токови распореда

### Комплетан распоред (azd up)
Најчешћи ток за нове пројекте:
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

### Само инфраструктурни распоред
Када је потребно само ажурирати Azure ресурсе:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Само распоред кода
За брза ажурирања апликације:
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

### ✅ Верификација распореда

Након сваког распореда, проверите успешност:

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

**Критеријуми успеха:**
- ✅ `azd show` резолвује очекиване услуге/УРЛ-ове
- ✅ Захтеви ка стварним апликацијским рутирама враћају очекивани статус и тело
- ✅ Ниједан лог грешке у последњих 5 минута
- ✅ Апликација одговара на тест захтеве

## 🏗️ Разумевање процеса распореда

### Нов у хуковима? Почните овде

**Хук** је команда коју azd аутоматски извршава у одређеном тренутку током процеса распореда — пре или после провајдеринга и пре или после распореда вашег кода. Омогућавају вам аутоматизацију ситних задатака који увек праће распореде: пуњење базе, покретање миграција, прављење ресурса или димно тестирање живе апликације.

| Хук | Покреће се… | Уобичајена употреба |
|------|-------------|-----------------|
| `preprovision` | Пре креирања ресурса | Валидација предуслова, пријављивање у регистар |
| `postprovision` | Након постојања ресурса | Конфигурација ресурса, подешавање базе |
| `predeploy` | Пре распореда кода | Прављење front-end ресурса, покретање јединичних тестова |
| `postdeploy` | Након што је код уживо | Покретање DB миграција, димно тестирање ендпоинта |

Хукови се налазе у вашем `azure.yaml`. Ево најмањег примера — само исписује поруку након распореда:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

То је то — следећи пут када покренете `azd up`, порука се аутоматски исписује. Такође можете покренути хук самостално, без комплетног распореда, што је одлично за тестирање:

```bash
azd hooks run postdeploy
```

Фазе испод показују стварне хукове (миграције, тестове, валидацију) за сваки степен.

### Фаза 1: Хукови пре провајдеринга
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

### Фаза 2: Провајдеринг инфраструктуре
- Учитава шаблоне инфраструктуре (Bicep/Terraform)
- Креира или ажурира Azure ресурсе
- Конфигурише мрежу и безбедност
- Подешава праћење и логовање

### Фаза 3: Хукови после провајдеринга
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
- Прави апликацијски код
- Креира артефакте распореда
- Пакује за циљну платформу (контенере, ZIP фајлове и сл.)

### Фаза 5: Хукови пре распореда
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

### Фаза 7: Хукови после распореда
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

### Руководство за грешке у хуковима

По дифолту, **ако команда хука заврши са кодом излаза различитим од нуле, azd зауставља целу операцију.** Ово је углавном оно што желите — неуспех миграције треба да прекине распоред, а не да испоручи неисправну апликацију. Али значи да хукови морају бити пажљиво написани.

**1. Учините грешке гласним и намерним.** Хук не успева када његова последња команда врати код излаза различит од нуле. У шеловским скриптама додајте `set -e` тако да се хук заустави при првој неуспешној команди уместо да тихо настави:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Дозволите хукy да не успе без заустављања azd.** За не-критичне кораке (опциони загревање кеша, обавештење најбољих напора), поставите `continueOnError: true`. azd ће забележити неуспех али наставити даље:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Тестирајте хукове изоловано пре пуног покретања.** Не морате да покрећете `azd up` да бисте дебаговали хук — покрените га самог и брзо итерајте:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Пазите на шелове специфичне за оперативни систем.** Хук који користи `shell: pwsh` захтева PowerShell инсталиран на машини која га покреће (укључујући CI агенте). Користите `shell: sh` за најширу преносивост или обезбедите и варијанте `windows` и `posix`:

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

> **Савет за дебаговање:** покрените било коју azd команду са `--debug` да бисте видели тачну наредбену линију хука и његов пун излаз — непроцењиво када хук ради локално, али не успева у CI.

## 🎛️ Конфигурација распореда

### Подешавања распореда специфична за услуге
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

### Конфигурације специфичне за окружење

Ово су само локалне azd вредности. Јасно их мапирајте на инфраструктуру/подешавања времена извршења. `NODE_ENV` је обично `production` за распоређену Node апликацију, укључујући и стаге распореде; користите посебну апликацијски зависну променљиву за разликовање стадјума распореда.

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

## 🔧 Напредни сценарији распореда

### Мулти-услужне апликације
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

### Blue-Green распореди

**Илустративни оперативни нацрт:** морате обезбедити оба окружења, заједнички слој усмеравања саобраћаја и два скрипта испод. azd не мења саобраћај нити аутоматски валида ради спремности за враћање. Чувајте green све док blue не прође тестирање и враћање више није потребно.

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

### Canary распореди
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Подела саобраћаја спада у конфигурацију Container Apps (Bicep или Azure CLI), а не као `azure.yaml` `trafficSplit` својство. Преглед/провајдеринг и каснији распореди морају сачувати ваш изабрани режим ревизије и правила усмеравања.

### Распоред у фазама
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

## 🐳 Распоред контејнера

### Распоред Container App
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

Конфигуришите тајне времена извршења са `configuration.secrets`/`secretRef` (или прецедентима Key Vault) и скалирање са `template.scale` у инфраструктури Container App. Не измишљајте својства услуге попут `secrets` или `scale` у `azure.yaml`.

### Оптимизација мулти-фазног Dockerfile
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

## ⚡ Оптимизација перформанси

### Рasporedi специфични за услугу
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Кеширање изградње
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Стандардни Node ток користи скрипте пакета; хукови услуге `prepackage` могу додати обавезне кораке. Кеширање Docker слојева је одвојено од дефинисања команде за изградњу услуге.

### Ефикасно распоређивање кода
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Надгледање распореда

### Надгледање распореда у реалном времену
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Провере здравља
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

Ваша апликација мора имплементирати `/health`; она није аутоматски обезбеђена од стране azd. Нема општег `azure.yaml` `healthCheck` својства услуге.

### Валидација након распореда
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

## 🔐 Безбедносне напомене

### Управљање тајнама
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` је неважећи. Обичне вредности окружења су локални обичан текст; немојте претпостављати да команде за читање сакривају ове вредности. Команде изнад чувају прецеденте из Key Vault-а, али ваша инфраструктура/апликација ипак мора користити тајне и омогућити приступ идентитету у време извршења.

### Мрежна безбедност
Декларишите и користите мрежне параметре у Bicep-у, и мапирајте их у `infra/main.parameters.json`. Нема опште `infra.parameters` преклопне мреже у `azure.yaml`. Пример документације са опсегом `203.0.113.0/24` и `198.51.100.0/24` нису стварне офис/ВПН мреже; замените их овлашћеним мрежним опсезима.

### Управљање идентитетом и приступом
Омогућите `identity` Container App-а у Bicep-у и доделите потребну улогу Key Vault data-plane-а на нивоу Vault-а. Конфигуришите именоване Key Vault-ом обезбеђене тајне и референце времена извршења у том ресурсу; `identity` и `keyVault` нису општа azd својства услуге. Погледајте [Аутентификација и Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Стратегије враћања

### Брзо враћање
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

### Враћање инфраструктуре
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

## 📊 Метрике распореда

### Пратите перформансе распореда
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Валидација инфраструктуре
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Следећи кораци

- [Провајдеринг ресурса](provisioning.md) - Детаљан увид у управљање инфраструктуром
- [Планирање пре распореда](../chapter-06-pre-deployment/capacity-planning.md) - Испланирајте стратегију распореда
- [Уобичајени проблеми](../chapter-07-troubleshooting/common-issues.md) - Решавање проблема распореда
- [Најбоље праксе](../chapter-07-troubleshooting/debugging.md) - Стратегије распореда спремних за производњу

## 🎯 Практичне вежбе распореда

### Вежба 1: Инкрементални ток распореда (20 минута)
**Циљ**: Савладати разлику између потпуног и инкременталног распореда

**Почетна тачка:** Баш, Node.js 22, Git, azd пријава и Azure претплата са дозволама за распоред. Покрените у новом директоријуму; очекујте наплаћиване App Service/Cosmos DB ресурсе. Времена зависе од региона и шаблона.

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

**Критеријуми успеха:**
- [ ] Запишите протекло време за обе команде (нема гаранције трајања)
- [ ] Обе команде се успешно изврше
- [ ] API остаје функционалан; измена само коментара није видљива промена UI-ја
- [ ] Инфраструктура остала непромењена након `azd deploy`

**Исход учења**: `azd deploy` прескаче провајдеринг инфраструктуре. Упоредите измерена времена уместо да претпостављате фиксни проценат убрзања.

### Вежба 2: Прилагођени хукови распореда (30 минута)
**Циљ**: Имплементирати аутоматизацију пре и после распореда

**Почетна тачка:** иницијализовани `deployment-practice` пројекат изнад. Ако сте га очистили, покрените `azd up` поново пре тестирања распореда само кода. Валидација испод користи стварну скрипту изградње API-ја, а не не-постојећу root `test:unit` скрипту. API тестови шаблона захтевају конфигурисан приступ бази; они нису изоловани јединични тестови.

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

**Критеријуми успеха:**
- [ ] Скрипта пре распореда се извршава пре распореда
- [ ] Распоред се прекида ако валидација изградње не успе
- [ ] Димни тест после распореда потврђује здравље
- [ ] Хукови се извршавају у исправном редоследу

### Вежба 3: Стратегија мулти-окружењског распореда (45 минута)
**Циљ**: Имплементирати ток распореда у фазама (dev → staging → production)

**Polazna tačka:** isti inicijalizovani todo projekat sa `jq`. Kreirajte okruženja ispod sa stvarnim vrednostima pretplate/lokacije (ili podesite `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` u svakom) **pre** pozivanja workflow-a bez upita. Namerno ne uspeva umesto da izmišljava nedostajuće vrednosti. Koristite samo privremena trening okruženja, ne stvarnu produkcionu pretplatu.

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

**Kriterijumi uspeha:**
- [ ] Dev okruženje se uspešno implementira
- [ ] Staging okruženje se uspešno implementira
- [ ] Za produkciju je potrebna ručna odobrenja
- [ ] Sva okruženja imaju funkcionalne health chekove
- [ ] Moguće je izvršiti rollback po potrebi

### Vežba 4: Strategija vraćanja (25 minuta)
**Cilj**: Implementirati i testirati rollback implementacije koristeći Git

**Polazna tačka:** izolovani trening checkout todo šablona sa svim osnovnim izvorima ucommittovanim, čist Git radni prostor i privremeno konfigurisano okruženje. Nikada ne uvodite namerne greške u stvarnom produkcionom projektu. `APP_VERSION` ispod služi samo za vođenje evidencije osim ako eksplicitno ne povežete u aplikaciju.

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

**Kriterijumi uspeha:**
- [ ] Može da detektuje neuspehe implementacije
- [ ] Rollback skripta se izvršava automatski
- [ ] Aplikacija se vraća u radno stanje
- [ ] Health checkovi prolaze nakon rollback-a

## 📊 Praćenje metrika implementacije

### Pratite performanse vaše implementacije

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

**Analizirajte vaše metrike:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Dodatni resursi

- [Referenca za Azure Developer CLI Deployment](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Implementacija Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Implementacija Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Implementacija Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigacija**
- **Prethodna lekcija**: [Vaš prvi projekat](../chapter-01-foundation/first-project.md)
- **Sledeća lekcija**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->