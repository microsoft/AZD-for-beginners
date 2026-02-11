# Mwongozo wa Utekelezaji - Kufanikiwa na Usambazaji wa AZD

**Chapter Navigation:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura ya Sasa**: Sura 4 - Miundombinu kama Kanuni & Usambazaji
- **⬅️ Previous Chapter**: [Sura 3: Mipangilio](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Kuweka Rasilimali](provisioning.md)
- **🚀 Next Chapter**: [Sura 5: Suluhisho za AI kwa Wakala Wengi](../../examples/retail-scenario.md)

## Utangulizi

Huu## Understanding the Deployment Processmwongozo kamili unafunika kila unachohitaji kujua kuhusu kusambaza programu kwa kutumia Azure Developer CLI, kutoka usambazaji wa amri moja rahisi hadi matukio ya uzalishaji ya juu yenye hooks maalum, mazingira mengi, na muunganisho wa CI/CD. Fuzu mzunguko mzima wa usambazaji kwa mifano ya vitendo na mbinu bora.

## Malengo ya Kujifunza

By completing this guide, you will:
- Pata umiliki wa amri na mitiririko yote ya usambazaji ya Azure Developer CLI
- Elewa mzunguko mzima wa usambazaji kutoka utayarishaji (provisioning) hadi ufuatiliaji
- Tekeleza hooks maalum za usambazaji kwa automatisering kabla na baada ya usambazaji
- Sanidi mazingira mengi na vigezo maalum kwa kila mazingira
- Weka mikakati ya juu ya usambazaji ikijumuisha blue-green na canary usambazaji
- Unganisha azd deployments na mabomba ya CI/CD na mitiririko ya kazi ya DevOps

## Matokeo ya Kujifunza

Upon completion, you will be able to:
- Tekeleza na kutatua matatizo katika mitiririko yote ya usambazaji ya azd kwa uhuru
- Buni na tekeleza automatisering maalum ya usambazaji ukitumia hooks
- Sanidi usambazaji unaofaa uzalishaji kwa usalama sahihi na ufuatiliaji
- Dhibiti matukio changamano ya usambazaji kwa mazingira mengi
- Boresha utendaji wa usambazaji na tekeleza mikakati ya kurudisha (rollback)
- Unganisha usambazaji wa azd katika mbinu za DevOps za kampuni

## Muhtasari wa Usambazaji

Azure Developer CLI inatoa amri kadhaa za usambazaji:
- `azd up` - Complete workflow (provision + deploy)
- `azd provision` - Create/update Azure resources only
- `azd deploy` - Deploy application code only
- `azd package` - Build and package applications

## Mitiririko Msingi ya Usambazaji

### Usambazaji Kamili (azd up)
The most common workflow for new projects:
```bash
# Peleka kila kitu kutoka mwanzo
azd up

# Peleka kwa mazingira maalum
azd up --environment production

# Peleka kwa vigezo maalum
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Usambazaji wa Miundombinu Pekee
When you only need to update Azure resources:
```bash
# Tayarisha/sasisha miundombinu
azd provision

# Tayarisha kwa jaribio la kavu ili kutazama mabadiliko kabla ya kufanywa
azd provision --preview

# Tayarisha huduma maalum
azd provision --service database
```

### Usambazaji wa Msimbo Pekee
For quick application updates:
```bash
# Weka huduma zote
azd deploy

# Matokeo yanayotarajiwa:
# Inasambaza huduma (azd deploy)
# - web: Inasambazwa... Imekamilika
# - api: Inasambazwa... Imekamilika
# MAFANIKIO: Utekelezaji wako ulikamilika katika dakika 2 na sekunde 15

# Sambaza huduma maalum
azd deploy --service web
azd deploy --service api

# Sambaza kwa hoja za kujenga maalum
azd deploy --service api --build-arg NODE_ENV=production

# Thibitisha usambazaji
azd show --output json | jq '.services'
```

### ✅ Uhakiki wa Usambazaji

After any deployment, verify success:

```bash
# Angalia huduma zote zinaendesha
azd show

# Jaribu endpoints za afya
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Fuatilia makosa (hufunguka katika kivinjari kwa chaguo-msingi)
azd monitor --logs
```

**Vigezo vya Mafanikio:**
- ✅ Huduma zote zinaonyesha hali "Inakimbia"
- ✅ Endpoints za afya zinarejesha HTTP 200
- ✅ Hakuna rekodi za makosa katika dakika 5 zilizopita
- ✅ Programu inajibu maombi ya mtihani

## 🏗️ Kuelewa Mchakato wa Usambazaji

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
- Inasoma template za miundombinu (Bicep/Terraform)
- Inaunda au kusasisha rasilimali za Azure
- Inasanidi mtandao na usalama
- Inaanzisha ufuatiliaji na kurekodi kumbukumbu

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

### Awamu 4: Ufungashaji wa Programu
- Inajenga msimbo wa programu
- Inaunda vitu vya usambazaji
- Inafunga kwa jukwaa lengwa (containers, faili za ZIP, n.k.)

### Awamu 5: Hooks za Kabla ya Usambazaji
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

### Awamu 6: Usambazaji wa Programu
- Inasambaza programu zilizofungwa kwa huduma za Azure
- Inasasisha mipangilio ya usanidi
- Inaanzisha/kuanzisha upya huduma

### Awamu 7: Hooks za Baada ya Usambazaji
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

## 🎛️ Usanidi wa Usambazaji

### Mipangilio ya Usambazaji Maalum kwa Huduma
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

## 🔧 Matukio ya Juu ya Usambazaji

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

### Usambazaji wa Blue-Green
```bash
# Unda mazingira ya bluu
azd env new production-blue
azd up --environment production-blue

# Jaribu mazingira ya bluu
./scripts/test-environment.sh production-blue

# Hamisha trafiki kwa bluu (sasisha DNS/kigawaji mzigo kwa mkono)
./scripts/switch-traffic.sh production-blue

# Safisha mazingira ya kijani
azd env select production-green
azd down --force
```

### Usambazaji wa Canary
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

### Usambazaji Kwa Hatua
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

## 🐳 Usambazaji wa Containers

### Usambazaji wa Programu za Container
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

### Usambazaji Maalum kwa Huduma
```bash
# Weka huduma maalum ili kurudia kwa haraka
azd deploy --service web
azd deploy --service api

# Weka huduma zote
azd deploy
```

### Uhifadhi wa Ujenzi
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Usambazaji wa Msimbo kwa Ufanisi
```bash
# Tumia azd deploy (si azd up) kwa mabadiliko ya msimbo pekee
# Hii inaepuka utoaji wa miundombinu na ni kasi zaidi sana
azd deploy

# Weka huduma maalum kwa mzunguko wa haraka zaidi
azd deploy --service api
```

## 🔍 Ufuatiliaji wa Usambazaji

### Ufuatiliaji wa Usambazaji kwa Wakati Halisi
```bash
# Fuatilia programu kwa wakati halisi
azd monitor --live

# Tazama kumbukumbu za programu
azd monitor --logs

# Angalia hali ya uwekaji
azd show
```

### Ukaguzi wa Afya
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

### Uthibitisho Baada ya Usambazaji
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

### Usimamizi wa Utambulisho na Ufikiaji
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
# AZD haina uwezo wa kurejesha toleo (rollback) uliojengwa ndani. Mbinu zilizopendekezwa:

# Chaguo 1: Tuma tena kutoka kwa Git (inayopendekezwa)
git revert HEAD  # Rudisha commit yenye tatizo
git push
azd deploy

# Chaguo 2: Tuma tena commit maalum
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Kurudisha Miundombinu
```bash
# Angalia mabadiliko ya miundombinu kabla ya kuyatekeleza
azd provision --preview

# Kwa marejesho ya miundombinu, tumia udhibiti wa matoleo:
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

## 📊 Metriki za Usambazaji

### Fuatilia Utendaji wa Usambazaji
```bash
# Tazama hali ya sasa ya uenezaji
azd show

# Fuatilia programu kwa Application Insights
azd monitor --overview

# Tazama takwimu za wakati halisi
azd monitor --live
```

### Ukusanyaji wa Metriki Maalum
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
# Pitia mabadiliko ya miundombinu kabla ya utekelezaji
azd provision --preview

# Tumia ukaguzi wa ARM/Bicep
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

### 4. Nyaraka na Urekodi (Logging)
```bash
# Andika nyaraka za taratibu za uwekaji
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Hatua Zifuatazo

- [Kuweka Rasilimali](provisioning.md) - Uchunguzi wa kina wa usimamizi wa miundombinu
- [Mipango ya Kabla ya Usambazaji](../chapter-06-pre-deployment/capacity-planning.md) - Panga mkakati wako wa usambazaji
- [Masuala ya Kawaida](../chapter-07-troubleshooting/common-issues.md) - Tatua matatizo ya usambazaji
- [Mbinu Bora](../chapter-07-troubleshooting/debugging.md) - Mikakati ya usambazaji tayari kwa uzalishaji

## 🎯 Mazoezi ya Vitendo ya Usambazaji

### Zoezi 1: Mtiririko wa Usambazaji wa Hatua-Hatua (dakika 20)
**Lengo**: Tumia tofauti kati ya usambazaji kamili na hatua-hatua

```bash
# Utoaji wa awali
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rekodi wakati wa utoaji wa awali
echo "Full deployment: $(date)" > deployment-log.txt

# Fanya mabadiliko ya msimbo
echo "// Updated $(date)" >> src/api/src/server.js

# Toa msimbo tu (haraka)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Linganishe nyakati
cat deployment-log.txt

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Usambazaji kamili unachukua dakika 5-15
- [ ] Usambazaji wa msimbo pekee unachukua dakika 2-5
- [ ] Mabadiliko ya msimbo yanaonekana katika programu iliyosambazwa
- [ ] Miundombinu haibadiliki baada ya `azd deploy`

**Matokeo ya Kujifunza**: `azd deploy` ni 50-70% haraka kuliko `azd up` kwa mabadiliko ya msimbo

### Zoezi 2: Hooks Maalum za Usambazaji (dakika 30)
**Lengo**: Tekeleza automatisering kabla na baada ya usambazaji

```bash
# Unda skripti ya uthibitishaji kabla ya kusambaza
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Angalia kama majaribio yanafaulu
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Angalia mabadiliko yasiyohifadhiwa
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Unda mtihani wa awali baada ya kusambaza
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

# Jaribu ueneaji kwa kutumia hooks
azd deploy
```

**Vigezo vya Mafanikio:**
- [ ] Script ya kabla ya usambazaji inaendeshwa kabla ya usambazaji
- [ ] Usambazaji unasitishwa ikiwa majaribio yanashindwa
- [ ] Mtihani wa haraka baada ya usambazaji unathibitisha afya
- [ ] Hooks zinafanywa kwa mpangilio sahihi

### Zoezi 3: Mkakati wa Usambazaji kwa Mazingira Nyingi (dakika 45)
**Lengo**: Tekeleza mtiririko wa usambazaji kwa hatua (dev → staging → production)

```bash
# Unda skripti ya kupeleka
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

# Hatua 3: Uidhinishaji wa mkono kwa uzalishaji
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

# Endesha utoaji uliopangwa
./deploy-staged.sh
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira ya Dev yanasambazwa kwa mafanikio
- [ ] Mazingira ya Staging yanasambazwa kwa mafanikio
- [ ] Uidhinishaji wa mkono unahitajika kwa uzalishaji
- [ ] Mazingira yote yana ukaguzi wa afya unaofanya kazi
- [ ] Inawezekana kurudisha kurudi ikiwa inahitajika

### Zoezi 4: Mkakati wa Kurudisha (dakika 25)
**Lengo**: Tekeleza na jaribu kurudisha usambazaji kwa kutumia Git

```bash
# Sambaza v1
azd env set APP_VERSION "1.0.0"
azd up

# Hifadhi hash ya commit ya v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Sambaza v2 yenye mabadiliko yanayovunja
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Gundua hitilafu na rudisha
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rudisha kwa kutumia git
    git revert HEAD --no-edit
    
    # Rudisha mazingira
    azd env set APP_VERSION "1.0.0"
    
    # Sambaza tena v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Vigezo vya Mafanikio:**
- [ ] Inaweza kugundua kushindwa kwa usambazaji
- [ ] Script ya kurudisha inaendeshwa kiotomatiki
- [ ] Programu inarudi kwenye hali inayofanya kazi
- [ ] Ukaguzi wa afya unafaulu baada ya kurudisha

## 📊 Ufuatiliaji wa Metriki za Usambazaji

### Fuatilia Utendaji wa Usambazaji Wako

```bash
# Tegeneza skiripti ya vipimo vya utoaji
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

# Tumia
./track-deployment.sh
```

**Chambua metrikia zako:**
```bash
# Tazama historia ya utoaji
cat deployment-metrics.csv

# Hesabu muda wa wastani wa utoaji
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Rasilimali Zaidi

- [Marejeo ya Usambazaji ya Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Usambazaji wa Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Usambazaji wa Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Usambazaji wa Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Uvinjari**
- **Somo lililopita**: [Mradi Wako wa Kwanza](../chapter-01-foundation/first-project.md)
- **Somo Lifuatao**: [Kuweka Rasilimali](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutokuwa na dhamana:

Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Wakati tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokukamilika kwa usahihi. Nyaraka ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu iliyofanywa na binadamu. Hatuwajibiki kwa kutokuelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->