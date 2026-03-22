# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Kabanata 4 - Imprastruktura bilang Code at Pag-deploy
- **⬅️ Previous Chapter**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Paglalaan ng Mga Resource](provisioning.md)
- **🚀 Next Chapter**: [Kabanata 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Panimula

Ang komprehensibong gabay na ito ay sumasaklaw sa lahat ng kailangan mong malaman tungkol sa pag-deploy ng mga aplikasyon gamit ang Azure Developer CLI, mula sa mga simpleng single-command deployment hanggang sa mga advanced na production scenario na may custom hooks, maramihang kapaligiran, at CI/CD integration. Pag-masterin ang buong lifecycle ng pag-deploy gamit ang praktikal na mga halimbawa at pinakamahusay na mga kasanayan.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, ikaw ay:
- Magmamaster ng lahat ng Azure Developer CLI deployment commands at workflows
- Mauunawaan ang buong lifecycle ng pag-deploy mula provisioning hanggang monitoring
- Makakapagpatupad ng custom deployment hooks para sa pre at post-deployment automation
- Makakapag-configure ng maramihang kapaligiran na may mga parameter na espesipiko sa kapaligiran
- Makakapag-set up ng advanced deployment strategies kabilang ang blue-green at canary deployments
- Maiintegrate ang azd deployments sa CI/CD pipelines at DevOps workflows

## Mga Resulta ng Pagkatuto

Pagkatapos makumpleto, magagawa mong:
- Ipatupad at i-troubleshoot ang lahat ng azd deployment workflows nang mag-isa
- Magdisenyo at magpatupad ng custom deployment automation gamit ang hooks
- Mag-configure ng production-ready deployments na may tamang seguridad at monitoring
- Pamahalaan ang kumplikadong mga senaryo ng pag-deploy para sa maramihang kapaligiran
- I-optimize ang performance ng pag-deploy at magpatupad ng rollback strategies
- I-integrate ang azd deployments sa enterprise DevOps practices

## Pangkalahatang-ideya ng Pag-deploy

Nagbibigay ang Azure Developer CLI ng ilang mga deployment command:
- `azd up` - Kumpletong workflow (paglalaan + pag-deploy)
- `azd provision` - Lumikha/i-update lamang ang mga Azure resource
- `azd deploy` - I-deploy lamang ang application code
- `azd package` - I-build at i-package ang mga aplikasyon

## Mga Pangunahing Workflow ng Pag-deploy

### Kumpletong Pag-deploy (azd up)
Ang pinakakaraniwang workflow para sa mga bagong proyekto:
```bash
# I-deploy ang lahat mula sa simula
azd up

# I-deploy gamit ang tinukoy na kapaligiran
azd up --environment production

# I-deploy gamit ang mga pasadyang parameter
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Pag-deploy ng Imprastruktura Lamang
Kapag kailangan mo lamang i-update ang mga Azure resource:
```bash
# Maglaan/i-update ang imprastruktura
azd provision

# Maglaan gamit ang dry-run upang makita ang mga pagbabago
azd provision --preview

# Maglaan ng partikular na mga serbisyo
azd provision --service database
```

### Pag-deploy ng Code Lamang
Para sa mabilisang mga update ng aplikasyon:
```bash
# I-deploy ang lahat ng serbisyo
azd deploy

# Inaasahang output:
# Nagde-deploy ng mga serbisyo (azd deploy)
# - web: Nagde-deploy... Tapos na
# - api: Nagde-deploy... Tapos na
# TAGUMPAY: Nakumpleto ang iyong deployment sa loob ng 2 minuto 15 segundo

# I-deploy ang partikular na serbisyo
azd deploy --service web
azd deploy --service api

# I-deploy gamit ang pasadyang mga argumento ng build
azd deploy --service api --build-arg NODE_ENV=production

# Beripikahin ang deployment
azd show --output json | jq '.services'
```

### ✅ Pag-beripika ng Pag-deploy

Pagkatapos ng anumang pag-deploy, tiyakin ang tagumpay:

```bash
# Suriin na tumatakbo ang lahat ng serbisyo
azd show

# Subukan ang mga health endpoint
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# I-monitor ang mga error (bubukas sa browser bilang default)
azd monitor --logs
```

**Pamantayan ng Tagumpay:**
- ✅ Lahat ng serbisyo ay nagpapakita ng status na "Tumatakbo"
- ✅ Nagbabalik ang mga health endpoint ng HTTP 200
- ✅ Walang mga error log sa nakaraang 5 minuto
- ✅ Tumugon ang aplikasyon sa mga test request

## 🏗️ Pag-unawa sa Proseso ng Pag-deploy

### Yugto 1: Mga Hook bago ang Paglalaan
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

### Yugto 2: Paglalaan ng Imprastruktura
- Binabasa ang mga template ng imprastruktura (Bicep/Terraform)
- Lumilikha o nag-a-update ng mga Azure resource
- Nagko-configure ng networking at seguridad
- Nagse-set up ng monitoring at logging

### Yugto 3: Mga Hook pagkatapos ng Paglalaan
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

### Yugto 4: Pagpapakete ng Aplikasyon
- Ibinubuo ang application code
- Gumagawa ng mga deployment artifact
- Nagpa-package para sa target na platform (containers, ZIP files, atbp.)

### Yugto 5: Mga Hook bago i-Deploy
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

### Yugto 6: Pag-deploy ng Aplikasyon
- Ina-deploy ang mga packaged application sa Azure services
- Ina-update ang mga configuration setting
- Sinisimulan/muli sinisimulan ang mga serbisyo

### Yugto 7: Mga Hook pagkatapos ng Pag-deploy
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

## 🎛️ Konfigurasyon ng Pag-deploy

### Mga Setting ng Pag-deploy na Espesipiko sa Serbisyo
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

### Mga Konfigurasyon na Espesipiko sa Kapaligiran
```bash
# Kapaligiran ng pag-unlad
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Kapaligiran ng paghahanda
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Kapaligiran ng produksyon
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Mga Advanced na Senaryo ng Pag-deploy

### Mga Aplikasyong Maramihang Serbisyo
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

### Blue-Green na Pag-deploy
```bash
# Lumikha ng asul na kapaligiran
azd env new production-blue
azd up --environment production-blue

# Subukan ang asul na kapaligiran
./scripts/test-environment.sh production-blue

# Ilipat ang trapiko sa asul (manwal na pag-update ng DNS/load balancer)
./scripts/switch-traffic.sh production-blue

# Linisin ang berdeng kapaligiran
azd env select production-green
azd down --force
```

### Canary na Pag-deploy
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

### Yugtong Pag-deploy
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

## 🐳 Pag-deploy ng Container

### Pag-deploy ng Container App
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

### Pag-optimize ng Multi-Stage Dockerfile
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

## ⚡ Pag-optimize ng Pagganap

### Mga Pag-deploy na Espesipiko sa Serbisyo
```bash
# I-deploy ang isang partikular na serbisyo para sa mas mabilis na iterasyon
azd deploy --service web
azd deploy --service api

# I-deploy ang lahat ng serbisyo
azd deploy
```

### Caching ng Build
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Mabisang Pag-deploy ng Code
```bash
# Gamitin ang azd deploy (hindi azd up) para sa mga pagbabago lamang sa code
# Nilalaktawan nito ang provisioning ng imprastruktura at mas mabilis ito
azd deploy

# I-deploy ang partikular na serbisyo para sa pinakamabilis na iterasyon
azd deploy --service api
```

## 🔍 Pagmomonitor ng Pag-deploy

### Real-time na Pagmomonitor ng Pag-deploy
```bash
# Subaybayan ang aplikasyon nang real-time
azd monitor --live

# Tingnan ang mga log ng aplikasyon
azd monitor --logs

# Suriin ang katayuan ng deployment
azd show
```

### Pagsusuri ng Kalusugan
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

### Pagpapatunay Pagkatapos ng Pag-deploy
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Suriin ang kalusugan ng aplikasyon
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

## 🔐 Mga Pagsasaalang-alang sa Seguridad

### Pamamahala ng Mga Lihim
```bash
# I-imbak nang ligtas ang mga lihim
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Itukoy ang mga lihim sa azure.yaml
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

### Seguridad ng Network
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Pamamahala ng Identidad at Access
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

## 🚨 Mga Estratehiya sa Rollback

### Mabilis na Rollback
```bash
# Walang built-in na rollback ang AZD. Mga inirerekomendang paraan:

# Opsyon 1: Muling i-deploy mula sa Git (inirerekomenda)
git revert HEAD  # I-revert ang problemadong commit
git push
azd deploy

# Opsyon 2: Muling i-deploy ang partikular na commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback ng Imprastruktura
```bash
# I-preview ang mga pagbabago sa imprastruktura bago ilapat
azd provision --preview

# Para sa pag-rollback ng imprastruktura, gamitin ang kontrol ng bersyon:
git revert HEAD  # Ibalik ang mga pagbabago sa imprastruktura
azd provision    # Ilapat ang naunang estado ng imprastruktura
```

### Rollback ng Database Migration
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Mga Metro ng Pag-deploy

### Subaybayan ang Pagganap ng Pag-deploy
```bash
# Tingnan ang kasalukuyang katayuan ng deployment
azd show

# Subaybayan ang aplikasyon gamit ang Application Insights
azd monitor --overview

# Tingnan ang mga live na sukatan
azd monitor --live
```

### Pagkolekta ng Pasadyang Metrics
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

## 🎯 Mga Pinakamahusay na Praktis

### 1. Konsistensi ng Kapaligiran
```bash
# Gumamit ng pare-parehong pangalan
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Panatilihin ang pagkakapareho ng mga kapaligiran
./scripts/sync-environments.sh
```

### 2. Pagpapatunay ng Imprastruktura
```bash
# I-preview ang mga pagbabago sa imprastruktura bago i-deploy
azd provision --preview

# Gumamit ng linting para sa ARM/Bicep
az bicep lint --file infra/main.bicep

# I-validate ang sintaks ng Bicep
az bicep build --file infra/main.bicep
```

### 3. Integrasyon ng Pagsusuri
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

### 4. Dokumentasyon at Pag-log
```bash
# Idokumento ang mga pamamaraan ng pag-deploy.
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Mga Susunod na Hakbang

- [Paglalaan ng Mga Resource](provisioning.md) - Mas malalim na pagtalakay sa pamamahala ng imprastruktura
- [Pagpaplano Bago ang Pag-deploy](../chapter-06-pre-deployment/capacity-planning.md) - Planuhin ang iyong deployment strategy
- [Mga Karaniwang Isyu](../chapter-07-troubleshooting/common-issues.md) - Lutasin ang mga isyu sa pag-deploy
- [Pinakamahusay na Praktis](../chapter-07-troubleshooting/debugging.md) - Mga production-ready na estratehiya sa pag-deploy

## 🎯 Mga Praktikal na Ehersisyo sa Pag-deploy

### Ehersisyo 1: Incremental Deployment Workflow (20 minuto)
**Layunin**: Masanay sa pagkakaiba sa pagitan ng kumpletong at incremental na pag-deploy

```bash
# Paunang pag-deploy
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Itala ang oras ng paunang pag-deploy
echo "Full deployment: $(date)" > deployment-log.txt

# Gumawa ng pagbabago sa kodigo
echo "// Updated $(date)" >> src/api/src/server.js

# I-deploy lamang ang kodigo (mabilis)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Ihambing ang mga oras
cat deployment-log.txt

# Linisin
azd down --force --purge
```

**Pamantayan ng Tagumpay:**
- [ ] Ang kumpletong pag-deploy ay tumatagal ng 5-15 minuto
- [ ] Ang code-only na pag-deploy ay tumatagal ng 2-5 minuto
- [ ] Ang mga pagbabago sa code ay makikita sa naka-deploy na app
- [ ] Hindi nagbago ang imprastruktura pagkatapos ng `azd deploy`

**Resulta ng Pagkatuto**: `azd deploy` ay 50-70% mas mabilis kaysa sa `azd up` para sa mga pagbabago sa code

### Ehersisyo 2: Custom Deployment Hooks (30 minuto)
**Layunin**: Ipatupad ang pre at post-deployment automation

```bash
# Gumawa ng script para sa pag-validate bago mag-deploy
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Suriin kung pumapasa ang mga test
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Suriin kung may hindi pa naka-commit na pagbabago
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Gumawa ng smoke test pagkatapos ng pag-deploy
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

# Magdagdag ng hooks sa azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Subukan ang pag-deploy gamit ang mga hooks
azd deploy
```

**Pamantayan ng Tagumpay:**
- [ ] Nagpapatakbo ang pre-deploy script bago ang deployment
- [ ] Humihinto ang deployment kung may pumalpak na tests
- [ ] Nagva-validate ang post-deploy smoke test ng kalusugan
- [ ] Naaayon ang pagkakasunod-sunod ng pag-execute ng mga hooks

### Ehersisyo 3: Estratehiya ng Pag-deploy para sa Maramihang Kapaligiran (45 minuto)
**Layunin**: Ipatupad ang staged na workflow ng pag-deploy (dev → staging → production)

```bash
# Gumawa ng script ng deployment
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Hakbang 1: I-deploy sa dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hakbang 2: I-deploy sa staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Hakbang 3: Manwal na pag-apruba para sa produksyon
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

# Gumawa ng mga environment
azd env new dev
azd env new staging
azd env new production

# Patakbuhin ang staged deployment
./deploy-staged.sh
```

**Pamantayan ng Tagumpay:**
- [ ] Matagumpay na nade-deploy ang dev environment
- [ ] Matagumpay na nade-deploy ang staging environment
- [ ] Kinakailangan ang manual approval para sa production
- [ ] May gumaganang health checks ang lahat ng kapaligiran
- [ ] Maaaring mag-roll back kung kinakailangan

### Ehersisyo 4: Estratehiya sa Rollback (25 minuto)
**Layunin**: Ipatupad at subukan ang rollback ng pag-deploy gamit ang Git

```bash
# I-deploy ang v1
azd env set APP_VERSION "1.0.0"
azd up

# I-save ang commit hash ng v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# I-deploy ang v2 na may breaking change
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Tuklasin ang pagkabigo at i-rollback
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # I-rollback gamit ang git
    git revert HEAD --no-edit
    
    # I-rollback ang environment
    azd env set APP_VERSION "1.0.0"
    
    # Muling i-deploy ang v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Pamantayan ng Tagumpay:**
- [ ] Kayang matukoy ang mga pagkabigo sa pag-deploy
- [ ] Awtomatikong nagpapatakbo ang rollback script
- [ ] Bumabalik ang aplikasyon sa gumaganang estado
- [ ] Pumapasa ang health checks pagkatapos ng rollback

## 📊 Pagsubaybay ng Mga Metro ng Pag-deploy

### Subaybayan ang Pagganap ng Iyong Pag-deploy

```bash
# Gumawa ng script para sa mga metric ng deployment
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

# I-log sa file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Gamitin ito
./track-deployment.sh
```

**Suriin ang iyong mga metric:**
```bash
# Tingnan ang kasaysayan ng pag-deploy
cat deployment-metrics.csv

# Kalkulahin ang karaniwang oras ng pag-deploy
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Karagdagang Mga Mapagkukunan

- [Sanggunian sa Pag-deploy ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Pag-deploy ng Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Pag-deploy ng Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Pag-deploy ng Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigation**
- **Nakaraang Aralin**: [Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **Susunod na Aralin**: [Paglalaan ng Mga Resource](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI para sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o pagkukulang sa katumpakan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->