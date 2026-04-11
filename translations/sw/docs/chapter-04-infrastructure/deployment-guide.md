# Mwongozo wa Uwekaji - Utaalamu wa Uwekaji wa AZD

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanziaji](../../README.md)
- **📖 Sura ya Sasa**: Sura 4 - Miundombinu kama Msimbo & Uwekaji
- **⬅️ Sura Iliyotangulia**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)
- **➡️ Ifuatayo**: [Utayarishaji wa Rasilimali](provisioning.md)
- **🚀 Sura Ifuatayo**: [Sura 5: Suluhisho za AI zenye Wakala Wengi](../../examples/retail-scenario.md)

## Utangulizi

Mwongozo huu wa kina unashughulikia kila kitu unachohitaji kujua kuhusu kuweka programu ukitumia Azure Developer CLI, kutoka kwa uwekaji wa amri moja rahisi hadi hali za uzalishaji za juu zenye hooks zilizobinafsishwa, mazingira mengi, na uunganisho wa CI/CD. Kuwa mtaalamu wa mzunguko mzima wa uwekaji kwa mifano ya vitendo na mbinu bora.

## Malengo ya Kujifunza

Kwa kumaliza mwongozo huu, utakuwa:
- Umejifunza amri na mitiririko yote ya uwekaji ya Azure Developer CLI
- Unaelewa mzunguko mzima wa uwekaji kutoka utayarishaji hadi ufuatiliaji
- Umetekeleza hooks za uwekaji zilizobinafsishwa kwa otomatiki kabla na baada ya uwekaji
- Umesanidi mazingira mengi na vigezo maalum kwa kila mazingira
- Umeweka mikakati ya juu ya uwekaji ikijumuisha blue-green na canary deployments
- Umeunganisha uwekaji wa azd na miradi ya CI/CD na mitiririko ya DevOps

## Matokeo ya Kujifunza

Baada ya kumaliza, utaweza:
- Kutekeleza na kutatua matatizo ya mitiririko yote ya uwekaji wa azd kwa uhuru
- Kubuni na kutekeleza uendeshaji wa otomatiki wa uwekaji uliobinafsishwa kwa kutumia hooks
- Kusanidi uwekaji unaofaa kwa uzalishaji pamoja na usalama na ufuatiliaji sahihi
- Kusimamia matukio changamano ya uwekaji kwenye mazingira mengi
- Kuboresha utendaji wa uwekaji na kutekeleza mikakati ya kurudisha (rollback)
- Kuingiza uwekaji wa azd katika mbinu za DevOps za hali ya kampuni

## Muhtasari wa Uwekaji

Azure Developer CLI inatoa amri kadhaa za uwekaji:
- `azd up` - Mtiririko kamili (utayarishaji + uwekaji)
- `azd provision` - Tengeneza/boresha rasilimali za Azure pekee
- `azd deploy` - Weka msimbo wa programu pekee
- `azd package` - Jenga na pakia programu

## Mtiririko Msingi wa Uwekaji

### Uwekaji Kamili (azd up)
Mtiririko unaotumika zaidi kwa miradi mipya:
```bash
# Sambaza kila kitu kutoka mwanzo
azd up

# Sambaza kwa mazingira maalum
azd up --environment production

# Sambaza kwa vigezo vilivyobinafsishwa
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Uwekaji wa Miundombinu Pekee
Unapohitaji tu kusasisha rasilimali za Azure:
```bash
# Toa/sasisha miundombinu
azd provision

# Toa kwa jaribio kavu ili kuangalia mabadiliko
azd provision --preview

# Toa huduma maalum
azd provision --service database
```

### Uwekaji wa Msimbo Pekee
Kwa masasisho ya haraka ya programu:
```bash
# Sambaza huduma zote
azd deploy

# Matokeo yanayotarajiwa:
# Kusambaza huduma (azd deploy)
# - web: Inasambazwa... Imekamilika
# - api: Inasambazwa... Imekamilika
# MAFANIKIO: Usambazaji wako ulimalizika kwa dakika 2 na sekunde 15

# Sambaza huduma maalum
azd deploy --service web
azd deploy --service api

# Sambaza kwa hoja za kujenga zilizobinafsishwa
azd deploy --service api --build-arg NODE_ENV=production

# Thibitisha usambazaji
azd show --output json | jq '.services'
```

### ✅ Uthibitisho wa Uwekaji

Baada ya uwekaji wowote, thibitisha mafanikio:

```bash
# Hakikisha huduma zote zinafanya kazi
azd show

# Jaribu vituo vya afya
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Fuatilia makosa (hufunguka katika kivinjari kwa chaguo-msingi)
azd monitor --logs
```

**Vigezo vya Mafanikio:**
- ✅ Huduma zote zinaonyesha hali "Inafanya kazi"
- ✅ Endpoints za afya zinarudisha HTTP 200
- ✅ Hakuna rekodi za makosa katika dakika 5 zilizopita
- ✅ Programu inajibu maombi ya jaribio

## 🏗️ Kuelewa Mchakato wa Uwekaji

### Awamu 1: Hooks za Kabla ya Utayarishaji
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

### Awamu 2: Utayarishaji wa Miundombinu
- Inasoma templeti za miundombinu (Bicep/Terraform)
- Inaunda au kusasisha rasilimali za Azure
- Inasanidi mitandao na usalama
- Inapanga ufuatiliaji na uandishi wa kumbukumbu (logging)

### Awamu 3: Hooks za Baada ya Utayarishaji
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

### Awamu 4: Kupakia Programu
- Inajenga msimbo wa programu
- Inaunda artifacts za uwekaji
- Inapakia kwa jukwaa lengwa (kontena, faili za ZIP, n.k.)

### Awamu 5: Hooks za Kabla ya Uwekaji
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

### Awamu 6: Uwekaji wa Programu
- Inawaweka programu zilizopakiwa kwa huduma za Azure
- Inasasisha mipangilio ya usanidi
- Inaanzisha/kuanzisha tena huduma

### Awamu 7: Hooks za Baada ya Uwekaji
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

## 🎛️ Usanidi wa Uwekaji

### Mipangilio ya Uwekaji Maalum kwa Huduma
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

### Usanidi Maalum kwa Mazingira
```bash
# Mazingira ya maendeleo
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Mazingira ya maandalizi
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

## 🔧 Matukio ya Juu ya Uwekaji

### Programu za Huduma Nyingi
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

### Uwekaji wa Blue-Green
```bash
# Unda mazingira ya bluu
azd env new production-blue
azd up --environment production-blue

# Jaribu mazingira ya bluu
./scripts/test-environment.sh production-blue

# Elekeza trafiki kwa bluu (sasisha DNS/kisawazishi cha mzigo kwa mkono)
./scripts/switch-traffic.sh production-blue

# Safisha mazingira ya kijani
azd env select production-green
azd down --force
```

### Uwekaji wa Canary
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

### Uwekaji wa Hatua
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

## 🐳 Uwekaji wa Kontena

### Uwekaji wa Programu katika Kontena
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

### Uboreshaji wa Dockerfile kwa Hatua Nyingi
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

### Uwekaji Maalum kwa Huduma
```bash
# Sambaza huduma maalum kwa ajili ya mzunguko wa haraka
azd deploy --service web
azd deploy --service api

# Sambaza huduma zote
azd deploy
```

### Kuhifadhi Cache ya Ujenzi
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Uwekaji wa Msimbo kwa Ufanisi
```bash
# Tumia azd deploy (si azd up) kwa mabadiliko ya msimbo pekee
# Hii inaepuka utoaji wa miundombinu na ni kasi zaidi sana
azd deploy

# Peleka huduma maalum kwa mzunguko wa haraka zaidi
azd deploy --service api
```

## 🔍 Ufuatiliaji wa Uwekaji

### Ufuatiliaji wa Uwekaji kwa Wakati Halisi
```bash
# Fuatilia programu kwa wakati halisi
azd monitor --live

# Tazama kumbukumbu za programu
azd monitor --logs

# Angalia hali ya uanzishaji
azd show
```

### Uhakiki wa Afya
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

### Uthibitishaji wa Baada ya Uwekaji
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

## 🔐 Vizingiti vya Usalama

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

## 🚨 Mikakati ya Kurudisha (Rollback)

### Kurudisha Haraka
```bash
# AZD haina utaratibu wa kurudisha (rollback) uliojengwa. Njia zinazopendekezwa:

# Chaguo 1: Peleka tena kutoka Git (inapendekezwa)
git revert HEAD  # Rudisha commit iliyo na tatizo
git push
azd deploy

# Chaguo 2: Peleka tena commit maalum
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Kurudisha Miundombinu
```bash
# Angalia mabadiliko ya miundombinu kabla ya kuyatekeleza
azd provision --preview

# Kwa kurejesha hali ya miundombinu, tumia udhibiti wa matoleo:
git revert HEAD  # Rejesha mabadiliko ya miundombinu
azd provision    # Tekeleza hali ya awali ya miundombinu
```

### Kurudisha Uhamishaji wa Hifadhidata
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Vipimo vya Uwekaji

### Fuatilia Utendaji wa Uwekaji
```bash
# Tazama hali ya utekelezaji wa sasa
azd show

# Fuatilia programu kwa kutumia Application Insights
azd monitor --overview

# Tazama metriki za wakati halisi
azd monitor --live
```

### Ukusanyaji wa Vipimo Vilivyobinafsishwa
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

### 2. Uthibitishaji wa Miundombinu
```bash
# Angalia mabadiliko ya miundombinu kabla ya utekelezaji
azd provision --preview

# Tumia ukaguzi wa ARM/Bicep
az bicep lint --file infra/main.bicep

# Thibitisha sintaksia ya Bicep
az bicep build --file infra/main.bicep
```

### 3. Ujumuishaji wa Upimaji
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

### 4. Uandishi wa Nyaraka na Uandishi wa Kumbukumbu (Logging)
```bash
# Andika nyaraka za taratibu za utekelezaji
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Hatua Zinazofuata

- [Utayarishaji wa Rasilimali](provisioning.md) - Uchunguzi wa kina wa usimamizi wa miundombinu
- [Mipango ya Kabla ya Uwekaji](../chapter-06-pre-deployment/capacity-planning.md) - Panga mkakati wako wa uwekaji
- [Masuala ya Kawaida](../chapter-07-troubleshooting/common-issues.md) - Tatua matatizo ya uwekaji
- [Mbinu Bora](../chapter-07-troubleshooting/debugging.md) - Mikakati ya uwekaji tayari kwa uzalishaji

## 🎯 Mazoezi ya Kivitendo ya Uwekaji

### Mazoezi 1: Mtiririko wa Uwekaji wa Hatua-hatua (dakika 20)
**Lengo**: Jifunze tofauti kati ya uwekaji kamili na uwekaji wa hatua-hatua

```bash
# Utekelezaji wa awali
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rekodi wakati wa utekelezaji wa awali
echo "Full deployment: $(date)" > deployment-log.txt

# Fanya mabadiliko ya msimbo
echo "// Updated $(date)" >> src/api/src/server.js

# Peleka tu msimbo (kwa haraka)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Linganisha nyakati
cat deployment-log.txt

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Uwekaji kamili unachukua dakika 5-15
- [ ] Uwekaji wa msimbo pekee unachukua dakika 2-5
- [ ] Mabadiliko ya msimbo yanaonekana kwenye programu iliyowekwa
- [ ] Miundombinu haijabadilika baada ya `azd deploy`

**Matokeo ya Kujifunza**: `azd deploy` ni 50-70% haraka zaidi kuliko `azd up` kwa mabadiliko ya msimbo

### Mazoezi 2: Hooks za Uwekaji Zilizobinafsishwa (dakika 30)
**Lengo**: Tekeleza otomatiki kabla na baada ya uwekaji

```bash
# Tegeneza skripti ya uthibitishaji kabla ya kupeleka
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Angalia ikiwa majaribio yamefaulu
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Angalia kama kuna mabadiliko yasiyokomitiwa
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Tegeneza jaribio la 'smoke' baada ya kupeleka
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

# Ongeza hooks kwenye azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Jaribu kupeleka kwa kutumia hooks
azd deploy
```

**Vigezo vya Mafanikio:**
- [ ] Skripti ya kabla ya uwekaji inaendeshwa kabla ya uwekaji
- [ ] Uwekaji unakatizwa ikiwa majaribio yanashindwa
- [ ] Jaribio la smoke baada ya uwekaji linathibitisha afya
- [ ] Hooks zinafanyika kwa mpangilio sahihi

### Mazoezi 3: Mkakati wa Uwekaji kwa Mazingira Nyingi (dakika 45)
**Lengo**: Tekeleza mtiririko wa uwekaji kwa hatua (dev → staging → production)

```bash
# Unda skripti ya kupeleka
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Hatua 1: Peleka kwa dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hatua 2: Peleka kwa staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hatua 3: Idhinisho la mkono kwa uzalishaji
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

# Unda mazingira
azd env new dev
azd env new staging
azd env new production

# Endesha kupeleka uliopangwa
./deploy-staged.sh
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira ya Dev yanaweka kwa mafanikio
- [ ] Mazingira ya Staging yanaweka kwa mafanikio
- [ ] Uidhinishaji wa mkono unahitajika kwa production
- [ ] Mazingira yote yana uhakiki wa afya unaofanya kazi
- [ ] Inaweza kurudishwa ikiwa inahitajika

### Mazoezi 4: Mkakati wa Kurudisha (dakika 25)
**Lengo**: Tekeleza na jaribu kurudisha uwekaji ukitumia Git

```bash
# Sambaza v1
azd env set APP_VERSION "1.0.0"
azd up

# Hifadhi hash ya commit ya v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Sambaza v2 na mabadiliko yanayovunja
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Gundua hitilafu na rudi nyuma
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rudi nyuma kwa kutumia git
    git revert HEAD --no-edit
    
    # Rudisha mazingira
    azd env set APP_VERSION "1.0.0"
    
    # Sambaza tena v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Vigezo vya Mafanikio:**
- [ ] Inaweza kugundua kushindwa kwa uwekaji
- [ ] Skripti ya kurudisha inaendeshwa kwa otomatiki
- [ ] Programu inarudi katika hali inayofanya kazi
- [ ] Uhakiki wa afya unapita baada ya kurudisha

## 📊 Ufuatiliaji wa Vipimo vya Uwekaji

### Fuatilia Utendaji wa Uwekaji Wako

```bash
# Tengeneza skripti ya vipimo vya utekelezaji
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

# Andika kumbukumbu kwenye faili
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Tumia
./track-deployment.sh
```

**Chambua vipimo vyako:**
```bash
# Tazama historia ya utoaji
cat deployment-metrics.csv

# Hesabu wastani wa muda wa utoaji
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Rasilimali za Ziada

- [Marejeleo ya Uwekaji wa Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Uwekaji wa Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Uwekaji wa Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Uwekaji wa Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Uvinjari**
- **Somo lililopita**: [Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **Somo lijalo**: [Utayarishaji wa Rasilimali](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tamko la kutokuwajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali zingatia kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokukamilika. Nyaraka ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo rasmi. Kwa taarifa muhimu, inapendekezwa kutumia utafsiri wa kitaalamu uliofanywa na binadamu. Hatuwajibiki kwa mkanganyiko wowote au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->