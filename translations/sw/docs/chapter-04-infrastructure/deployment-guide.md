# Mwongozo wa Ueneaji - Kufanya Uwezo wa Ueneaji wa AZD

**Chapter Navigation:**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 4 - Miundombinu kama Msimbo & Ueneaji
- **⬅️ Sura Iliyopita**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)
- **➡️ Ifuatayo**: [Utayarishaji wa Rasilimali](provisioning.md)
- **🚀 Sura Ifuatayo**: [Sura 5: Suluhisho za AI Zenye Wawakilishi Wengi](../../examples/retail-scenario.md)

## Utangulizi

Mwongozo huu kamili unashughulikia kila kitu unachohitaji kujua kuhusu kueneza programu kwa kutumia Azure Developer CLI, kuanzia ueneaji wa msingi kwa amri moja hadi hali za uzalishaji zilizoendelea zinazo, hooks za kibinafsi, mazingira mengi, na uunganisho wa CI/CD. Jifunze mzunguko mzima wa ueneaji kwa mifano ya vitendo na mbinu bora.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa:
- Mtaalamu wa amri zote za ueneaji na mtiririko wa kazi za Azure Developer CLI
- Uelewa wa mzunguko mzima wa ueneaji kutoka utayarishaji hadi ufuatiliaji
- Utekelezaji wa hooks za ueneaji za kibinafsi kwa otomatiki kabla na baada ya ueneaji
- Kusanidi mazingira mengi na vigezo maalum kwa kila mazingira
- Kuanzisha mikakati ya ueneaji iliyosoma mfano kama blue-green na canary
- Kuingiza ueneaji wa azd katika pipelines za CI/CD na mtiririko wa kazi wa DevOps

## Matokeo ya Kujifunza

Mara baada ya kumaliza, utaweza:
- Kutekeleza na kutatua matatizo ya mtiririko wote wa ueneaji wa azd kwa kujitegemea
- Kubuni na kutekeleza otomatiki za ueneaji za kibinafsi kwa kutumia hooks
- Kusanidi ueneaji tayari kwa uzalishaji kwa usalama na ufuatiliaji sahihi
- Kusimamia mazingira tata za ueneaji nyingi
- Kuboresha utendaji wa ueneaji na kutekeleza mikakati ya kurejesha (rollback)
- Kuingiza ueneaji wa azd kwenye mbinu za DevOps za shirika

## Muhtasari wa Ueneaji

Azure Developer CLI inatoa amri kadhaa za ueneaji:
- `azd up` - Mtiririko kamili (provision + deploy)
- `azd provision` - Tengeneza/update rasilimali za Azure pekee
- `azd deploy` - Eneza nambari ya programu pekee
- `azd package` - Jenga na pakia programu

## Mtiririko Msingi wa Ueneaji

### Ueneaji Kamili (azd up)
Mtiririko wa kawaida kwa miradi mipya:
```bash
# Anzisha kila kitu kutoka mwanzo
azd up

# Anzisha kwa mazingira maalum
azd up --environment production

# Anzisha kwa vigezo maalum
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ueneaji wa Miundombinu Pekee
Wakati unahitaji tu kusasisha rasilimali za Azure:
```bash
# Kuandaa/sasisha miundombinu
azd provision

# Kuandaa kwa jaribio la kavu ili kutazama mabadiliko
azd provision --preview

# Kuandaa huduma maalum
azd provision --service database
```

### Ueneaji wa Msimbo Pekee
Kwa masasisho ya haraka ya programu:
```bash
# Sambaza huduma zote
azd deploy

# Matokeo yanayotarajiwa:
# Kusambaza huduma (azd deploy)
# - web: Inasambazwa... Imekamilika
# - api: Inasambazwa... Imekamilika
# MAFANIKIO: Utekelezaji wako ulikamilika kwa dakika 2 na sekunde 15

# Sambaza huduma maalum
azd deploy --service web
azd deploy --service api

# Sambaza kwa hoja za kujenga zilizobinafsishwa
azd deploy --service api --build-arg NODE_ENV=production

# Thibitisha utekelezaji
azd show --output json | jq '.services'
```

### ✅ Uthibitisho wa Ueneaji

Baada ya ueneaji wowote, thibitisha mafanikio:

```bash
# Angalia huduma zote zinaendesha
azd show

# Jaribu endpoints za afya
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Fuatilia makosa (hufunguka kwenye kivinjari kwa chaguo-msingi)
azd monitor --logs
```

**Vigezo vya Mafanikio:**
- ✅ Huduma zote zinaonyesha hali ya "Running"
- ✅ Endpoints za afya zinarejesha HTTP 200
- ✅ Hakuna kumbukumbu za makosa katika dakika 5 zilizopita
- ✅ Programu inajibu maombi ya majaribio

## 🏗️ Kuelewa Mchakato wa Ueneaji

### Hatua 1: Hooks za Kabla ya Utayarishaji
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

### Hatua 2: Utayarishaji wa Miundombinu
- Inasoma templeti za miundombinu (Bicep/Terraform)
- Inaunda au kusasisha rasilimali za Azure
- Inasanidi mtandao na usalama
- Inaweka ufuatiliaji na uandishi wa kumbukumbu

### Hatua 3: Hooks za Baada ya Utayarishaji
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

### Hatua 4: Ufungashaji wa Programu
- Inajenga msimbo wa programu
- Inaunda artefakti za ueneaji
- Inafungasha kwa jukwaa lengwa (kontena, faili za ZIP, n.k.)

### Hatua 5: Hooks za Kabla ya Ueneaji
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

### Hatua 6: Ueneaji wa Programu
- Inaeza programu zilizofungashwa kwa huduma za Azure
- Inasasisha mipangilio ya usanidi
- Inaanzisha/kurejesha huduma

### Hatua 7: Hooks za Baada ya Ueneaji
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

## 🎛️ Usanidi wa Ueneaji

### Mipangilio ya Ueneaji Maalum kwa Huduma
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

### Mipangilio Maalum kwa Mazingira
```bash
# Mazingira ya maendeleo
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Mazingira ya majaribio
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Mazingira ya uzalishaji
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Senario Zinazoendelea za Ueneaji

### Programu zenye Huduma Nyingi
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

### Ueneaji wa Blue-Green
```bash
# Unda mazingira ya bluu
azd env new production-blue
azd up --environment production-blue

# Jaribu mazingira ya bluu
./scripts/test-environment.sh production-blue

# Badilisha trafiki kwenda bluu (sasisho la DNS/msawazishaji mzigo kwa mkono)
./scripts/switch-traffic.sh production-blue

# Safisha mazingira ya kijani
azd env select production-green
azd down --force
```

### Ueneaji wa Canary
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

### Ueneaji wa Hatua
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

## 🐳 Ueneaji wa Kontena

### Ueneaji wa Container App
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

### Uboreshaji wa Dockerfile wa Hatua Nyingi
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

## ⚡ Uboreshaji wa Utendaji

### Ueneaji Maalum kwa Huduma
```bash
# Peleka huduma maalumu ili kurahisisha mizunguko ya maendeleo
azd deploy --service web
azd deploy --service api

# Peleka huduma zote
azd deploy
```

### Caching ya Ujenzi
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Ueneaji wa Msimbo Ufanisi
```bash
# Tumia azd deploy (si azd up) kwa mabadiliko ya msimbo tu
# Hii inaepuka utoaji wa miundombinu na ni ya haraka zaidi
azd deploy

# Weka huduma maalum kwa mzunguko wa haraka zaidi
azd deploy --service api
```

## 🔍 Ufuatiliaji wa Ueneaji

### Ufuatiliaji wa Ueneaji kwa Wakati Halisi
```bash
# Fuatilia programu kwa wakati halisi
azd monitor --live

# Tazama rejista za programu
azd monitor --logs

# Angalia hali ya utoaji wa programu
azd show
```

### Uchunguzi wa Afya
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

### Uhakiki Baada ya Ueneaji
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Kagua afya ya programu
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

## 🔐 Mambo ya Usalama

### Usimamizi wa Siri
```bash
# Hifadhi siri kwa usalama
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Rejea siri katika azure.yaml
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

### Usalama wa Mtandao
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Usimamizi wa Utambulisho na Upatikanaji
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

## 🚨 Mikakati ya Kurudisha

### Kurudisha Haraka
```bash
# AZD haina uwezo wa kurejesha hali ya awali uliojengwa ndani. Mbinu zinazopendekezwa:

# Chaguo 1: Weka upya kutoka Git (inayopendekezwa)
git revert HEAD  # Rudisha commit yenye shida
git push
azd deploy

# Chaguo 2: Weka upya commit maalum
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Kurudisha Miundombinu
```bash
# Kagua mabadiliko ya miundombinu kabla ya kuyatekeleza
azd provision --preview

# Kwa kurejesha miundombinu, tumia udhibiti wa matoleo:
git revert HEAD  # Rejesha mabadiliko ya miundombinu
azd provision    # Tekeleza hali ya awali ya miundombinu
```

### Kurudisha Uhamisho wa Hifadhidata
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Vipimo vya Ueneaji

### Fuata Utendaji wa Ueneaji
```bash
# Tazama hali ya sasa ya uzinduzi
azd show

# Fuatilia programu kwa kutumia Application Insights
azd monitor --overview

# Tazama takwimu za moja kwa moja
azd monitor --live
```

### Ukusanyaji wa Vipimo Maalum
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

## 🎯 Mbinu Bora

### 1. Ulinganifu wa Mazingira
```bash
# Tumia majina thabiti
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Dumisha ulinganifu wa mazingira
./scripts/sync-environments.sh
```

### 2. Uhakiki wa Miundombinu
```bash
# Angalia mabadiliko ya miundombinu kabla ya kupeleka
azd provision --preview

# Tumia linting ya ARM/Bicep
az bicep lint --file infra/main.bicep

# Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep
```

### 3. Uunganishaji wa Upimaji
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

### 4. Uandishi wa Nyaraka na Uandishi wa Kumbukumbu
```bash
# Andika nyaraka za taratibu za usambazaji
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Hatua Zifuatazo

- [Utayarishaji wa Rasilimali](provisioning.md) - Uchunguzi wa kina wa usimamizi wa miundombinu
- [Mipango ya Kabla ya Ueneaji](../chapter-06-pre-deployment/capacity-planning.md) - Panga mkakati wako wa ueneaji
- [Masuala ya Kawaida](../chapter-07-troubleshooting/common-issues.md) - Suluhisha masuala ya ueneaji
- [Mbinu Bora](../chapter-07-troubleshooting/debugging.md) - Mikakati ya ueneaji tayari kwa uzalishaji

## 🎯 Mafunzo ya Vitendo ya Ueneaji

### Mazoezi 1: Mtiririko wa Ueneaji wa Hatua-hatua (20 dakika)
**Lengo**: Elewa tofauti kati ya ueneaji kamili na ueneaji wa hatua-hatua

```bash
# Utekelezaji wa awali
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rekodi wakati wa utekelezaji wa awali
echo "Full deployment: $(date)" > deployment-log.txt

# Fanya mabadiliko ya msimbo
echo "// Updated $(date)" >> src/api/src/server.js

# Weka tu msimbo (haraka)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Linganisisha nyakati
cat deployment-log.txt

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Ueneaji kamili unachukua dakika 5-15
- [ ] Ueneaji wa msimbo pekee unachukua dakika 2-5
- [ ] Mabadiliko ya msimbo yanaonekana katika programu iliyowekwa
- [ ] Miundombinu haijabadilika baada ya `azd deploy`

**Matokeo ya Kujifunza**: `azd deploy` ni 50-70% ya haraka kuliko `azd up` kwa mabadiliko ya msimbo

### Mazoezi 2: Hooks Maalum za Ueneaji (30 dakika)
**Lengo**: Tekeleza otomatiki za kabla na baada ya ueneaji

```bash
# Tegeneza skripti ya uhakiki kabla ya kupeleka
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Angalia kama majaribio yanapita
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Angalia mabadiliko ambayo hayajakomitiwa
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Tegeneza mtihani mfupi baada ya kupeleka
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

# Ongeza hooks katika azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Jaribu upeleka kwa kutumia hooks
azd deploy
```

**Vigezo vya Mafanikio:**
- [ ] Skripti ya kabla ya ueneaji inakimbia kabla ya ueneaji
- [ ] Ueneaji unakatizwa ikiwa majaribio yanashindwa
- [ ] Jaribio la uchujaji baada ya ueneaji linathibitisha afya
- [ ] Hooks zinafanywa kwa mpangilio sahihi

### Mazoezi 3: Mkakati wa Ueneaji kwa Mazingira Nyingi (45 dakika)
**Lengo**: Tekeleza mtiririko wa ueneaji wa hatua (dev → staging → production)

```bash
# Tengeneza skripti ya uzinduzi
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Hatua 1: Peleka kwenye dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hatua 2: Peleka kwenye staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hatua 3: Idhini ya mtu kwa uzalishaji
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

# Tengeneza mazingira
azd env new dev
azd env new staging
azd env new production

# Endesha uzinduzi kwa awamu
./deploy-staged.sh
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira ya Dev yanaweka kwa mafanikio
- [ ] Mazingira ya Staging yanaweka kwa mafanikio
- [ ] Uidhinishaji wa mkono unahitajika kwa Production
- [ ] Mazingira yote yana ukaguzi wa afya unaofanya kazi
- [ ] Inawezekana kurudisha ikiwa inahitajika

### Mazoezi 4: Mkakati wa Kurudisha (25 dakika)
**Lengo**: Tekeleza na kujaribu kurudisha ueneaji kwa kutumia Git

```bash
# Zindua v1
azd env set APP_VERSION "1.0.0"
azd up

# Hifadhi hash ya commit ya v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Zindua v2 yenye mabadiliko yanayovunja utangamano
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Gundua hitilafu na rudi nyuma
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rudi nyuma ukitumia git
    git revert HEAD --no-edit
    
    # Rudisha mazingira
    azd env set APP_VERSION "1.0.0"
    
    # Zindua tena v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Vigezo vya Mafanikio:**
- [ ] Inaweza kugundua kushindwa kwa ueneaji
- [ ] Skripti ya kurudisha inatekelezwa moja kwa moja
- [ ] Programu inarudi katika hali ya kazi
- [ ] Ukaguzi wa afya unapita baada ya kurudisha

## 📊 Ufuatiliaji wa Vipimo vya Ueneaji

### Fuata Utendaji wa Ueneaji Wako

```bash
# Unda skripti ya vipimo vya uwekaji
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

# Andika kumbukumbu kwenye faili
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Itumie
./track-deployment.sh
```

**Chambua vipimo vyako:**
```bash
# Tazama historia ya usambazaji
cat deployment-metrics.csv

# Hesabu muda wa wastani wa usambazaji
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Rasilimali Zingine

- [Rejea ya Ueneaji ya Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Ueneaji wa Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Ueneaji wa Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Ueneaji wa Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Uelekeo**
- **Somo Lililopita**: [Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **Somo Linalofuata**: [Utayarishaji wa Rasilimali](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Angalizo**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Wakati tunajitahidi kufikia usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au zisizo sahihi. Nyaraka ya asili kwa lugha yake ya asili inapaswa kutambulika kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na mtafsiri wa binadamu inashauriwa. Hatuwezi kuwajibishwa kwa kutoelewana au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->