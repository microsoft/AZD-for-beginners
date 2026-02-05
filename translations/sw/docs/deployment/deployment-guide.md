# Mwongozo wa Utekelezaji - Kuweza AZD Deployments

**Ukurasa wa Sehemu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Wanaoanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 4 - Miundombinu kama Nambari & Utekelezaji
- **⬅️ Sura Iliyopita**: [Sura ya 3: Usanidi](../getting-started/configuration.md)
- **➡️ Inayofuata**: [Kuandaa Rasilimali](provisioning.md)
- **🚀 Sura Inayofuata**: [Sura ya 5: Suluhisho za AI za Wakala Wengi](../../examples/retail-scenario.md)

## Utangulizi

Mwongozo huu wa kina unashughulikia kila kitu unachohitaji kujua kuhusu kupeleka programu kwa kutumia Azure Developer CLI, kuanzia utekelezaji wa amri moja hadi hali za juu za uzalishaji zenye hooks maalum, mazingira mengi, na ujumuishaji wa CI/CD. Jifunze mzunguko mzima wa utekelezaji kwa mifano ya vitendo na mbinu bora.

## Malengo ya Kujifunza

Kwa kukamilisha mwongozo huu, utaweza:
- Kuweza amri zote za utekelezaji wa Azure Developer CLI na mtiririko wa kazi
- Kuelewa mzunguko mzima wa utekelezaji kuanzia kuandaa hadi kufuatilia
- Kutekeleza hooks maalum za utekelezaji kwa ajili ya otomatiki kabla na baada ya utekelezaji
- Kuseti mazingira mengi na vigezo maalum vya mazingira
- Kuanzisha mikakati ya juu ya utekelezaji ikiwa ni pamoja na blue-green na canary deployments
- Kujumuisha utekelezaji wa azd na CI/CD pipelines na mtiririko wa kazi wa DevOps

## Matokeo ya Kujifunza

Baada ya kukamilisha, utaweza:
- Kutekeleza na kutatua matatizo ya mtiririko wa kazi wa utekelezaji wa azd kwa uhuru
- Kubuni na kutekeleza otomatiki ya utekelezaji maalum kwa kutumia hooks
- Kuseti utekelezaji wa kiwango cha uzalishaji na usalama sahihi na ufuatiliaji
- Kusimamia hali ngumu za utekelezaji wa mazingira mengi
- Kuboresha utendaji wa utekelezaji na kutekeleza mikakati ya kurudisha nyuma
- Kujumuisha utekelezaji wa azd katika mazoea ya DevOps ya biashara

## Muhtasari wa Utekelezaji

Azure Developer CLI inatoa amri kadhaa za utekelezaji:
- `azd up` - Mtiririko kamili (kuandaa + kutekeleza)
- `azd provision` - Kuunda/kusasisha rasilimali za Azure pekee
- `azd deploy` - Kuweka msimbo wa programu pekee
- `azd package` - Kujenga na kufunga programu

## Mitiririko ya Msingi ya Utekelezaji

### Utekelezaji Kamili (azd up)
Mtiririko wa kawaida kwa miradi mipya:
```bash
# Weka kila kitu kutoka mwanzo
azd up

# Weka na mazingira maalum
azd up --environment production

# Weka na vigezo maalum
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Utekelezaji wa Miundombinu Pekee
Wakati unahitaji tu kusasisha rasilimali za Azure:
```bash
# Kutoa/kusasisha miundombinu
azd provision

# Kutoa kwa dry-run ili kuonyesha mabadiliko
azd provision --preview

# Kutoa huduma maalum
azd provision --service database
```

### Utekelezaji wa Msimbo Pekee
Kwa masasisho ya haraka ya programu:
```bash
# Weka huduma zote
azd deploy

# Matokeo yanayotarajiwa:
# Kuweka huduma (azd deploy)
# - wavuti: Inapelekwa... Imekamilika
# - api: Inapelekwa... Imekamilika
# MAFANIKIO: Uwekaji wako umekamilika kwa dakika 2 sekunde 15

# Weka huduma maalum
azd deploy --service web
azd deploy --service api

# Weka na hoja za ujenzi maalum
azd deploy --service api --build-arg NODE_ENV=production

# Thibitisha uwekaji
azd show --output json | jq '.services'
```

### ✅ Uthibitishaji wa Utekelezaji

Baada ya utekelezaji wowote, hakikisha mafanikio:

```bash
# Hakikisha huduma zote zinafanya kazi
azd show

# Jaribu sehemu za afya
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Angalia kumbukumbu kwa makosa
azd logs --service api --since 5m | grep -i error
```

**Vigezo vya Mafanikio:**
- ✅ Huduma zote zinaonyesha hali ya "Running"
- ✅ Endpoints za afya zinarejesha HTTP 200
- ✅ Hakuna logi za makosa katika dakika 5 zilizopita
- ✅ Programu inajibu maombi ya majaribio

## 🏗️ Kuelewa Mchakato wa Utekelezaji

### Awamu ya 1: Hooks Kabla ya Kuandaa
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

### Awamu ya 2: Kuandaa Miundombinu
- Inasoma templates za miundombinu (Bicep/Terraform)
- Inaunda au kusasisha rasilimali za Azure
- Inasanidi mitandao na usalama
- Inaseti ufuatiliaji na kurekodi

### Awamu ya 3: Hooks Baada ya Kuandaa
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

### Awamu ya 4: Kufunga Programu
- Inajenga msimbo wa programu
- Inaunda nyaraka za utekelezaji
- Inafunga kwa jukwaa lengwa (containers, faili za ZIP, nk.)

### Awamu ya 5: Hooks Kabla ya Utekelezaji
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

### Awamu ya 6: Utekelezaji wa Programu
- Inapeleka programu zilizofungwa kwenye huduma za Azure
- Inasasisha mipangilio ya usanidi
- Inaanza/kusimamisha huduma

### Awamu ya 7: Hooks Baada ya Utekelezaji
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

## 🎛️ Usanidi wa Utekelezaji

### Mipangilio Maalum ya Huduma
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

### Usanidi Maalum wa Mazingira
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

## 🔧 Hali za Juu za Utekelezaji

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

### Utekelezaji wa Blue-Green
```bash
# Unda mazingira ya bluu
azd env new production-blue
azd up --environment production-blue

# Jaribu mazingira ya bluu
./scripts/test-environment.sh production-blue

# Hamisha trafiki kwa bluu (sasisho la DNS/kibali cha mzigo kwa mkono)
./scripts/switch-traffic.sh production-blue

# Safisha mazingira ya kijani
azd env select production-green
azd down --force
```

### Utekelezaji wa Canary
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

### Utekelezaji wa Hatua
```bash
#!/bin/bash
# peleka-iliyopangwa.sh

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

## 🐳 Utekelezaji wa Containers

### Utekelezaji wa Programu za Container
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

### Utekelezaji Sambamba
```bash
# Sanidi upelekaji sambamba
azd config set deploy.parallelism 5

# Peleka huduma kwa sambamba
azd deploy --parallel
```

### Caching ya Kujenga
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### Utekelezaji wa Kiongezo
```bash
# Peleka huduma zilizobadilishwa tu
azd deploy --incremental

# Peleka kwa kugundua mabadiliko
azd deploy --detect-changes
```

## 🔍 Ufuatiliaji wa Utekelezaji

### Ufuatiliaji wa Utekelezaji wa Wakati Halisi
```bash
# Fuatilia maendeleo ya usambazaji
azd deploy --follow

# Tazama kumbukumbu za usambazaji
azd logs --follow --service api

# Angalia hali ya usambazaji
azd show --service api
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

### Uthibitishaji Baada ya Utekelezaji
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Angalia afya ya programu
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

## 🔐 Masuala ya Usalama

### Usimamizi wa Siri
```bash
# Hifadhi siri kwa usalama
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Rejelea siri katika azure.yaml
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

### Utambulisho na Usimamizi wa Ufikiaji
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

## 🚨 Mikakati ya Kurudisha Nyuma

### Kurudisha Nyuma Haraka
```bash
# Rudisha nyuma hadi utoaji wa awali
azd deploy --rollback

# Rudisha nyuma huduma maalum
azd deploy --service api --rollback

# Rudisha nyuma hadi toleo maalum
azd deploy --service api --version v1.2.3
```

### Kurudisha Nyuma Miundombinu
```bash
# Rudisha mabadiliko ya miundombinu
azd provision --rollback

# Onyesha hakikisho la mabadiliko ya kurudisha nyuma
azd provision --rollback --preview
```

### Kurudisha Nyuma Uhamishaji wa Hifadhidata
```bash
#!/bin/bash
# maandiko/kurudisha-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Vipimo vya Utekelezaji

### Fuatilia Utendaji wa Utekelezaji
```bash
# Washa vipimo vya upelekaji
azd config set telemetry.deployment.enabled true

# Tazama historia ya upelekaji
azd history

# Pata takwimu za upelekaji
azd metrics --type deployment
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

### 1. Uthabiti wa Mazingira
```bash
# Tumia majina yanayofanana
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Dumisha usawa wa mazingira
./scripts/sync-environments.sh
```

### 2. Uthibitishaji wa Miundombinu
```bash
# Thibitisha kabla ya kupeleka
azd provision --preview
azd provision --what-if

# Tumia ukaguzi wa ARM/Bicep
az bicep lint --file infra/main.bicep
```

### 3. Muunganiko wa Upimaji
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

### 4. Uandishi wa Nyaraka na Kurekodi
```bash
# Andika taratibu za kupelekwa
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Hatua Zifuatazo

- [Kuandaa Rasilimali](provisioning.md) - Uchambuzi wa kina wa usimamizi wa miundombinu
- [Mipango Kabla ya Utekelezaji](../pre-deployment/capacity-planning.md) - Panga mkakati wako wa utekelezaji
- [Masuala ya Kawaida](../troubleshooting/common-issues.md) - Suluhisha masuala ya utekelezaji
- [Mbinu Bora](../troubleshooting/debugging.md) - Mikakati ya utekelezaji tayari kwa uzalishaji

## 🎯 Mazoezi ya Vitendo ya Utekelezaji

### Zoezi 1: Mtiririko wa Utekelezaji wa Kiongezo (Dakika 20)
**Lengo**: Kuelewa tofauti kati ya utekelezaji kamili na wa kiongezo

```bash
# Utekelezaji wa awali
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Rekodi muda wa utekelezaji wa awali
echo "Full deployment: $(date)" > deployment-log.txt

# Fanya mabadiliko ya msimbo
echo "// Updated $(date)" >> src/api/src/server.js

# Tekeleza msimbo pekee (haraka)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Linganisha nyakati
cat deployment-log.txt

# Safisha
azd down --force --purge
```

**Vigezo vya Mafanikio:**
- [ ] Utekelezaji kamili unachukua dakika 5-15
- [ ] Utekelezaji wa msimbo pekee unachukua dakika 2-5
- [ ] Mabadiliko ya msimbo yanaonekana kwenye programu iliyotekelezwa
- [ ] Miundombinu haijabadilika baada ya `azd deploy`

**Matokeo ya Kujifunza**: `azd deploy` ni haraka kwa 50-70% kuliko `azd up` kwa mabadiliko ya msimbo

### Zoezi 2: Hooks Maalum za Utekelezaji (Dakika 30)
**Lengo**: Tekeleza otomatiki kabla na baada ya utekelezaji

```bash
# Unda hati ya uthibitishaji kabla ya kupeleka
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Angalia kama majaribio yanapita
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Angalia mabadiliko ambayo hayajatumwa
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Unda jaribio la moshi baada ya kupeleka
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

# Ongeza ndoano kwenye azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Jaribu upelekaji na ndoano
azd deploy
```

**Vigezo vya Mafanikio:**
- [ ] Script ya kabla ya utekelezaji inaendeshwa kabla ya utekelezaji
- [ ] Utekelezaji unakatishwa ikiwa majaribio yanashindwa
- [ ] Jaribio la moshi baada ya utekelezaji linathibitisha afya
- [ ] Hooks zinaendeshwa kwa mpangilio sahihi

### Zoezi 3: Mkakati wa Utekelezaji wa Mazingira Mengi (Dakika 45)
**Lengo**: Tekeleza mtiririko wa utekelezaji wa hatua (dev → staging → production)

```bash
# Unda hati ya kupelekwa
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Hatua ya 1: Peleka kwa dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hatua ya 2: Peleka kwa staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hatua ya 3: Idhini ya mwongozo kwa uzalishaji
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

# Endesha upelekaji wa hatua kwa hatua
./deploy-staged.sh
```

**Vigezo vya Mafanikio:**
- [ ] Mazingira ya maendeleo yanatekelezwa kwa mafanikio
- [ ] Mazingira ya staging yanatekelezwa kwa mafanikio
- [ ] Idhini ya mwongozo inahitajika kwa uzalishaji
- [ ] Mazingira yote yana ukaguzi wa afya unaofanya kazi
- [ ] Inawezekana kurudisha nyuma ikiwa inahitajika

### Zoezi 4: Mkakati wa Kurudisha Nyuma (Dakika 25)
**Lengo**: Tekeleza na jaribu kurudisha nyuma utekelezaji

```bash
# Peleka v1
azd env set APP_VERSION "1.0.0"
azd up

# Hifadhi usanidi wa v1
cp -r .azure/production .azure/production-v1-backup

# Peleka v2 na mabadiliko yanayovunja
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Tambua kushindwa
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rudisha nyuma msimbo
    git checkout src/api/src/server.js
    
    # Rudisha nyuma mazingira
    azd env set APP_VERSION "1.0.0"
    
    # Peleka tena v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Vigezo vya Mafanikio:**
- [ ] Inaweza kugundua kushindwa kwa utekelezaji
- [ ] Script ya kurudisha nyuma inaendeshwa kiotomatiki
- [ ] Programu inarudi katika hali ya kufanya kazi
- [ ] Ukaguzi wa afya unafaulu baada ya kurudisha nyuma

## 📊 Ufuatiliaji wa Vipimo vya Utekelezaji

### Fuatilia Utendaji wa Utekelezaji Wako

```bash
# Unda hati ya vipimo vya upelekaji
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

# Ingiza kwenye faili
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Itumie
./track-deployment.sh
```

**Chambua vipimo vyako:**
```bash
# Tazama historia ya utekelezaji
cat deployment-metrics.csv

# Hesabu muda wa wastani wa utekelezaji
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Rasilimali za Ziada

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Ukurasa wa Sehemu**
- **Somo Lililopita**: [Mradi Wako wa Kwanza](../getting-started/first-project.md)
- **Somo Linalofuata**: [Kuandaa Rasilimali](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kwa usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->