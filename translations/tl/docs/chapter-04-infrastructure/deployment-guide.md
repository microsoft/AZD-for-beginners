# Gabay sa Pag-deploy - Pagpapahusay sa AZD Deployments

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 4 - Imprastruktura bilang Code at Pag-deploy
- **⬅️ Nakaraang Kabanata**: [Kabanata 3: Konfigurasyon](../chapter-03-configuration/configuration.md)
- **➡️ Susunod**: [Pagpo-provision ng Mga Resource](provisioning.md)
- **🚀 Susunod na Kabanata**: [Kabanata 5: Mga Solusyon ng Multi-Agent AI](../../examples/retail-scenario.md)

## Panimula

Ang komprehensibong gabay na ito ay sumasaklaw sa lahat ng kailangan mong malaman tungkol sa pag-deploy ng mga aplikasyon gamit ang Azure Developer CLI, mula sa mga pangunahing pag-deploy na isang utos lamang hanggang sa mga advanced na senaryo sa produksyon na may custom hooks, maramihang kapaligiran, at integrasyon ng CI/CD. Masterin ang kumpletong lifecycle ng pag-deploy gamit ang mga praktikal na halimbawa at pinakamahuhusay na kasanayan.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng gabay na ito, magagawa mong:
- Masterin ang lahat ng Azure Developer CLI deployment commands at workflows
- Maunawaan ang kumpletong lifecycle ng pag-deploy mula provisioning hanggang pagmo-monitor
- Magpatupad ng custom deployment hooks para sa pre at post-deployment automation
- I-configure ang maramihang kapaligiran na may mga parameter na partikular sa kapaligiran
- Mag-set up ng mga advanced na estratehiya sa pag-deploy kabilang ang blue-green at canary deployments
- I-integrate ang azd deployments sa CI/CD pipelines at DevOps workflows

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto, magagawa mong:
- Magpatakbo at mag-troubleshoot ng lahat ng azd deployment workflows nang mag-isa
- Magdisenyo at magpatupad ng custom deployment automation gamit ang hooks
- I-configure ang production-ready na mga deployment na may tamang seguridad at monitoring
- Pamahalaan ang kumplikadong mga senaryo ng pag-deploy na may maramihang kapaligiran
- I-optimize ang performance ng pag-deploy at magpatupad ng mga estratehiya sa rollback
- I-integrate ang azd deployments sa enterprise DevOps practices

## Pangkalahatang-ideya ng Pag-deploy

Azure Developer CLI ay nagbibigay ng ilang deployment commands:
- `azd up` - Kumpletong daloy ng trabaho (provision + deploy)
- `azd provision` - Lumikha/i-update lamang ng mga resource ng Azure
- `azd deploy` - I-deploy lamang ang code ng aplikasyon
- `azd package` - I-build at i-package ang mga aplikasyon

## Mga Pangunahing Daloy ng Pag-deploy

### Kumpletong Pag-deploy (azd up)
Ang pinakakaraniwang daloy ng trabaho para sa mga bagong proyekto:
```bash
# I-deploy ang lahat mula sa simula
azd up

# I-deploy gamit ang partikular na kapaligiran
azd up --environment production

# I-deploy gamit ang mga pasadyang parameter
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Pag-deploy na Imprastruktura Lamang
Kapag kailangan mo lamang i-update ang mga resource ng Azure:
```bash
# Magtustos/i-update ang imprastruktura
azd provision

# Magtustos gamit ang dry-run upang matingnan ang mga pagbabago
azd provision --preview

# Magtustos ng mga tiyak na serbisyo
azd provision --service database
```

### Pag-deploy na Code Lamang
Para sa mabilisang pag-update ng aplikasyon:
```bash
# I-deploy ang lahat ng serbisyo
azd deploy

# Inaasahang output:
# Nagde-deploy ng mga serbisyo (azd deploy)
# - web: Nagde-deploy... Tapos
# - api: Nagde-deploy... Tapos
# TAGUMPAY: Nakumpleto ang iyong deployment sa loob ng 2 minuto at 15 segundo

# I-deploy ang partikular na serbisyo
azd deploy --service web
azd deploy --service api

# I-deploy gamit ang pasadyang mga argumento ng build
azd deploy --service api --build-arg NODE_ENV=production

# Suriin ang deployment
azd show --output json | jq '.services'
```

### ✅ Pagpapatunay ng Pag-deploy

Pagkatapos ng anumang pag-deploy, tiyakin ang tagumpay:

```bash
# Suriin na tumatakbo ang lahat ng serbisyo
azd show

# Subukan ang mga endpoint ng kalusugan
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Bantayan ang mga error (bubukas sa browser bilang default)
azd monitor --logs
```

**Pamantayan ng Tagumpay:**
- ✅ Lahat ng serbisyo ay nagpapakita ng status na "Running"
- ✅ Ang mga health endpoint ay nagbabalik ng HTTP 200
- ✅ Walang error logs sa huling 5 minuto
- ✅ Tumutugon ang aplikasyon sa mga test request

## 🏗️ Pag-unawa sa Proseso ng Pag-deploy

### Yugto 1: Pre-Provision Hooks
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

### Yugto 2: Pagpo-provision ng Imprastruktura
- Nagbabasa ng mga template ng imprastruktura (Bicep/Terraform)
- Lumilikha o nag-a-update ng mga resource ng Azure
- Nagko-configure ng networking at seguridad
- Nagse-set up ng monitoring at logging

### Yugto 3: Post-Provision Hooks
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

### Yugto 4: Pagba-package ng Aplikasyon
- Binubuild ang code ng aplikasyon
- Lumilikha ng mga deployment artifact
- Nagpa-package para sa target na platform (containers, ZIP files, atbp.)

### Yugto 5: Pre-Deploy Hooks
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
- Ina-deploy ang mga na-package na aplikasyon sa mga serbisyo ng Azure
- Ina-update ang mga setting ng konfigurasyon
- Sinisimulan/muling sinisimulan ang mga serbisyo

### Yugto 7: Post-Deploy Hooks
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

### Mga Setting ng Pag-deploy para sa Tiyak na Serbisyo
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

### Mga Konfigurasyong Partikular sa Kapaligiran
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

### Mga Aplikasyong Multi-Serbisyo
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
# Gumawa ng asul na kapaligiran
azd env new production-blue
azd up --environment production-blue

# Subukan ang asul na kapaligiran
./scripts/test-environment.sh production-blue

# Ilipat ang trapiko sa asul na kapaligiran (manwal na pag-update ng DNS/load balancer)
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

### Staged na Pag-deploy
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

### Pag-deploy para sa Tiyak na Serbisyo
```bash
# I-deploy ang isang partikular na serbisyo para sa mas mabilis na iterasyon
azd deploy --service web
azd deploy --service api

# I-deploy ang lahat ng serbisyo
azd deploy
```

### Build Caching
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
# Gamitin ang azd deploy (huwag ang azd up) para sa mga pagbabago na puro code lang
# Nilalaktawan nito ang pag-set up ng imprastruktura at mas mabilis
azd deploy

# I-deploy ang partikular na serbisyo para sa pinakamabilis na pag-uulit
azd deploy --service api
```

## 🔍 Pagmo-monitor ng Pag-deploy

### Real-Time na Pagmo-monitor ng Pag-deploy
```bash
# Subaybayan ang aplikasyon nang real-time
azd monitor --live

# Tingnan ang mga log ng aplikasyon
azd monitor --logs

# Suriin ang katayuan ng pag-deploy
azd show
```

### Mga Health Check
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

### Pamamahala ng Mga Sekreto
```bash
# Mag-imbak ng mga lihim nang ligtas
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Tukuyin ang mga lihim sa azure.yaml
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

### Pamamahala ng Pagkakakilanlan at Access
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

## 🚨 Mga Estratehiya para sa Rollback

### Mabilis na Rollback
```bash
# Walang built-in na rollback ang AZD. Inirerekomendang mga paraan:

# Opsyon 1: I-deploy muli mula sa Git (inirerekomenda)
git revert HEAD  # I-revert ang problemadong commit
git push
azd deploy

# Opsyon 2: I-deploy muli ang partikular na commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Rollback ng Imprastruktura
```bash
# Suriin muna ang mga pagbabago sa imprastruktura bago ipatupad
azd provision --preview

# Para sa pagbabalik ng imprastruktura, gamitin ang kontrol ng bersyon:
git revert HEAD  # Ibalik ang mga pagbabago sa imprastruktura
azd provision    # Ipatupad ang naunang estado ng imprastruktura
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

## 📊 Mga Sukatan ng Pag-deploy

### Subaybayan ang Pagganap ng Pag-deploy
```bash
# Tingnan ang kasalukuyang katayuan ng deployment
azd show

# Subaybayan ang aplikasyon gamit ang Application Insights
azd monitor --overview

# Tingnan ang mga live na sukatan
azd monitor --live
```

### Pagtitipon ng Mga Pasadyang Sukatan
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

## 🎯 Mga Pinakamahusay na Kasanayan

### 1. Konsistensi ng Kapaligiran
```bash
# Gumamit ng pare-parehong pagpapangalan
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Panatilihin ang pagkakapareho ng mga environment
./scripts/sync-environments.sh
```

### 2. Pagpapatunay ng Imprastruktura
```bash
# Suriin ang mga pagbabago sa imprastruktura bago i-deploy
azd provision --preview

# Gumamit ng linting para sa ARM/Bicep
az bicep lint --file infra/main.bicep

# Suriin ang syntax ng Bicep
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
# Idokumento ang mga pamamaraan ng pag-deploy
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Susunod na Mga Hakbang

- [Pagpo-provision ng Mga Resource](provisioning.md) - Mas malalim na pagtalakay sa pamamahala ng imprastruktura
- [Pagpaplano Bago ang Pag-deploy](../chapter-06-pre-deployment/capacity-planning.md) - Planuhin ang iyong estratehiya sa pag-deploy
- [Mga Karaniwang Isyu](../chapter-07-troubleshooting/common-issues.md) - Lutasin ang mga isyu sa pag-deploy
- [Pinakamahusay na Kasanayan](../chapter-07-troubleshooting/debugging.md) - Mga estratehiya sa pag-deploy na handa para sa produksyon

## 🎯 Mga Gawain sa Pag-deploy na May Praktikal na Pagsasanay

### Ehersisyo 1: Incremental na Daloy ng Pag-deploy (20 minuto)
**Layunin**: Maging bihasa sa pagkakaiba ng kumpleto at incremental na pag-deploy

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
- [ ] Ang pag-deploy na code-lamang ay tumatagal ng 2-5 minuto
- [ ] Ang mga pagbabago sa code ay nakikita sa na-deploy na app
- [ ] Hindi nagbago ang imprastruktura pagkatapos ng `azd deploy`

**Kinalabasan ng Pagkatuto**: `azd deploy` ay 50-70% mas mabilis kaysa sa `azd up` para sa mga pagbabago sa code

### Ehersisyo 2: Mga Custom na Deployment Hook (30 minuto)
**Layunin**: Ipatupad ang pre at post-deployment automation

```bash
# Gumawa ng pre-deploy na validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Suriin kung pumasa ang mga pagsubok
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Suriin kung may hindi pa na-commit na mga pagbabago
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

# Magdagdag ng mga hook sa azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Subukan ang pag-deploy gamit ang mga hook
azd deploy
```

**Pamantayan ng Tagumpay:**
- [ ] Ang pre-deploy script ay tumatakbo bago ang pag-deploy
- [ ] Humihinto ang pag-deploy kung mabibigo ang mga test
- [ ] Ang post-deploy smoke test ay nagpapatunay ng kalusugan
- [ ] Ang mga hook ay tumatakbo sa tamang pagkakasunod-sunod

### Ehersisyo 3: Estratehiya ng Pag-deploy sa Maramihang Kapaligiran (45 minuto)
**Layunin**: Ipatupad ang staged na daloy ng pag-deploy (dev → staging → production)

```bash
# Gumawa ng script para sa deployment
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

# Hakbang 3: Manwal na pag-apruba para sa production
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
- [ ] Matagumpay na na-deploy ang dev environment
- [ ] Matagumpay na na-deploy ang staging environment
- [ ] Kinakailangan ang manu-manong pag-apruba para sa production
- [ ] Lahat ng environment ay may gumaganang health checks
- [ ] Maaaring mag-roll back kung kinakailangan

### Ehersisyo 4: Estratehiya ng Rollback (25 minuto)
**Layunin**: Ipatupad at subukan ang rollback ng pag-deploy gamit ang Git

```bash
# I-deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# I-save ang commit hash ng v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# I-deploy v2 na may breaking change
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Tukuyin ang pagkabigo at i-rollback
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # I-rollback gamit ang git
    git revert HEAD --no-edit
    
    # I-rollback ang environment
    azd env set APP_VERSION "1.0.0"
    
    # I-deploy muli ang v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Pamantayan ng Tagumpay:**
- [ ] Kayang matukoy ang mga pagkabigo ng pag-deploy
- [ ] Ang rollback script ay tumatakbo nang awtomatiko
- [ ] Bumabalik sa gumaganang estado ang aplikasyon
- [ ] Nagpapasa ang mga health check pagkatapos ng rollback

## 📊 Pagsubaybay ng Mga Sukatan ng Pag-deploy

### Subaybayan ang Pagganap ng Iyong Pag-deploy

```bash
# Gumawa ng script para sa mga sukatan ng deployment
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

# I-log sa file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Gamitin ito
./track-deployment.sh
```

**Suriin ang iyong mga sukatan:**
```bash
# Tingnan ang kasaysayan ng pag-deploy
cat deployment-metrics.csv

# Kalkulahin ang karaniwang oras ng pag-deploy
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Karagdagang Mga Mapagkukunan

- [Sanggunian para sa Pag-deploy ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Pag-deploy ng Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Pag-deploy ng Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Pag-deploy ng Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Navigasyon**
- **Nakaraang Aralin**: [Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **Susunod na Aralin**: [Pagpo-provision ng Mga Resource](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI na pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi tumpak na impormasyon. Dapat ituring na awtoritatibong sanggunian ang orihinal na dokumento sa katutubong wika nito. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin na ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->