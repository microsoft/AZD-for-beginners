# Gabay sa Deployment - Pag-master ng AZD Deployments

**Pag-navigate sa Kabanata:**
- **📚 Kurso Home**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 4 - Infrastructure as Code & Deployment
- **⬅️ Nakaraang Kabanata**: [Kabanata 3: Configuration](../getting-started/configuration.md)
- **➡️ Susunod**: [Pag-provision ng Resources](provisioning.md)
- **🚀 Susunod na Kabanata**: [Kabanata 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## Panimula

Ang komprehensibong gabay na ito ay sumasaklaw sa lahat ng kailangan mong malaman tungkol sa pag-deploy ng mga application gamit ang Azure Developer CLI, mula sa simpleng single-command deployments hanggang sa mga advanced na production scenarios na may custom hooks, maraming environment, at CI/CD integration. Masterin ang buong deployment lifecycle gamit ang mga praktikal na halimbawa at pinakamahusay na mga kasanayan.

## Mga Layunin sa Pag-aaral

Sa pagtatapos ng gabay na ito, ikaw ay:
- Magiging bihasa sa lahat ng Azure Developer CLI deployment commands at workflows
- Maiintindihan ang buong deployment lifecycle mula sa provisioning hanggang sa monitoring
- Makakapagpatupad ng custom deployment hooks para sa pre at post-deployment automation
- Makakapag-configure ng maraming environment na may environment-specific parameters
- Makakapag-set up ng advanced deployment strategies kabilang ang blue-green at canary deployments
- Makakapag-integrate ng azd deployments sa CI/CD pipelines at DevOps workflows

## Mga Resulta ng Pag-aaral

Sa pagtatapos, magagawa mo:
- Magpatupad at mag-troubleshoot ng lahat ng azd deployment workflows nang mag-isa
- Magdisenyo at magpatupad ng custom deployment automation gamit ang hooks
- Mag-configure ng production-ready deployments na may tamang seguridad at monitoring
- Mag-manage ng kumplikadong multi-environment deployment scenarios
- Mag-optimize ng deployment performance at magpatupad ng rollback strategies
- Mag-integrate ng azd deployments sa enterprise DevOps practices

## Pangkalahatang Deployment

Ang Azure Developer CLI ay nagbibigay ng ilang deployment commands:
- `azd up` - Kumpletong workflow (provision + deploy)
- `azd provision` - Gumawa/mag-update ng Azure resources lamang
- `azd deploy` - Mag-deploy ng application code lamang
- `azd package` - Mag-build at mag-package ng applications

## Mga Pangunahing Deployment Workflow

### Kumpletong Deployment (azd up)
Ang pinakakaraniwang workflow para sa mga bagong proyekto:
```bash
# I-deploy ang lahat mula sa simula
azd up

# I-deploy gamit ang tiyak na kapaligiran
azd up --environment production

# I-deploy gamit ang pasadyang mga parameter
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
Kapag kailangan mo lang i-update ang Azure resources:
```bash
# Maglaan/mag-update ng imprastraktura
azd provision

# Maglaan gamit ang dry-run upang makita ang mga pagbabago
azd provision --preview

# Maglaan ng mga partikular na serbisyo
azd provision --service database
```

### Code-Only Deployment
Para sa mabilisang pag-update ng application:
```bash
# I-deploy ang lahat ng serbisyo
azd deploy

# Inaasahang output:
# I-dinedeploy ang mga serbisyo (azd deploy)
# - web: Dinedeploy... Tapos na
# - api: Dinedeploy... Tapos na
# TAGUMPAY: Ang iyong deployment ay natapos sa loob ng 2 minuto at 15 segundo

# I-deploy ang partikular na serbisyo
azd deploy --service web
azd deploy --service api

# I-deploy gamit ang custom na build arguments
azd deploy --service api --build-arg NODE_ENV=production

# I-verify ang deployment
azd show --output json | jq '.services'
```

### ✅ Pag-verify ng Deployment

Pagkatapos ng anumang deployment, i-verify ang tagumpay:

```bash
# Suriin kung lahat ng serbisyo ay tumatakbo
azd show

# Subukan ang mga health endpoints
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Suriin ang mga log para sa mga error
azd logs --service api --since 5m | grep -i error
```

**Mga Pamantayan ng Tagumpay:**
- ✅ Lahat ng serbisyo ay nagpapakita ng "Running" status
- ✅ Ang mga health endpoints ay nagbabalik ng HTTP 200
- ✅ Walang error logs sa huling 5 minuto
- ✅ Ang application ay tumutugon sa mga test requests

## 🏗️ Pag-unawa sa Proseso ng Deployment

### Phase 1: Pre-Provision Hooks
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

### Phase 2: Infrastructure Provisioning
- Binabasa ang mga infrastructure templates (Bicep/Terraform)
- Gumagawa o nag-a-update ng Azure resources
- Nagko-configure ng networking at seguridad
- Nagsa-set up ng monitoring at logging

### Phase 3: Post-Provision Hooks
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

### Phase 4: Application Packaging
- Binubuo ang application code
- Gumagawa ng deployment artifacts
- Nagpa-package para sa target platform (containers, ZIP files, atbp.)

### Phase 5: Pre-Deploy Hooks
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

### Phase 6: Application Deployment
- Nagde-deploy ng packaged applications sa Azure services
- Nag-a-update ng configuration settings
- Nag-i-start/restart ng mga serbisyo

### Phase 7: Post-Deploy Hooks
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

## 🎛️ Configuration ng Deployment

### Mga Setting ng Deployment na Specific sa Serbisyo
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

### Mga Configuration na Specific sa Environment
```bash
# Kapaligiran ng pag-unlad
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Kapaligiran ng pagsubok
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

## 🔧 Mga Advanced na Deployment Scenario

### Multi-Service Applications
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

### Blue-Green Deployments
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

### Canary Deployments
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

### Staged Deployments
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

## 🐳 Container Deployments

### Container App Deployments
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

### Multi-Stage Dockerfile Optimization
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

## ⚡ Pag-optimize ng Performance

### Parallel Deployments
```bash
# I-configure ang parallel deployment
azd config set deploy.parallelism 5

# I-deploy ang mga serbisyo nang sabay-sabay
azd deploy --parallel
```

### Build Caching
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

### Incremental Deployments
```bash
# I-deploy lamang ang mga nagbago na serbisyo
azd deploy --incremental

# I-deploy gamit ang pagtuklas ng pagbabago
azd deploy --detect-changes
```

## 🔍 Monitoring ng Deployment

### Real-Time Deployment Monitoring
```bash
# Subaybayan ang progreso ng deployment
azd deploy --follow

# Tingnan ang mga log ng deployment
azd logs --follow --service api

# Suriin ang status ng deployment
azd show --service api
```

### Health Checks
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

### Post-Deployment Validation
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

### Secrets Management
```bash
# Itago ang mga lihim nang ligtas
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Banggitin ang mga lihim sa azure.yaml
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

### Network Security
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity and Access Management
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

## 🚨 Mga Rollback Strategy

### Quick Rollback
```bash
# Ibalik sa nakaraang deployment
azd deploy --rollback

# Ibalik ang tiyak na serbisyo
azd deploy --service api --rollback

# Ibalik sa tiyak na bersyon
azd deploy --service api --version v1.2.3
```

### Infrastructure Rollback
```bash
# Ibalik ang mga pagbabago sa imprastraktura
azd provision --rollback

# I-preview ang mga pagbabagong ibabalik
azd provision --rollback --preview
```

### Database Migration Rollback
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Mga Deployment Metrics

### Subaybayan ang Performance ng Deployment
```bash
# Paganahin ang mga sukatan ng deployment
azd config set telemetry.deployment.enabled true

# Tingnan ang kasaysayan ng deployment
azd history

# Kunin ang mga istatistika ng deployment
azd metrics --type deployment
```

### Custom Metrics Collection
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

### 1. Konsistensya ng Environment
```bash
# Gumamit ng pare-parehong pangalan
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Panatilihin ang pagkakapareho ng kapaligiran
./scripts/sync-environments.sh
```

### 2. Validation ng Infrastructure
```bash
# I-validate bago ang deployment
azd provision --preview
azd provision --what-if

# Gumamit ng ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. Pagsasama ng Testing
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

### 4. Dokumentasyon at Logging
```bash
# Idokumento ang mga pamamaraan ng pag-deploy
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Mga Susunod na Hakbang

- [Pag-provision ng Resources](provisioning.md) - Malalim na pag-aaral sa pamamahala ng infrastructure
- [Pre-Deployment Planning](../pre-deployment/capacity-planning.md) - Planuhin ang iyong deployment strategy
- [Mga Karaniwang Isyu](../troubleshooting/common-issues.md) - Lutasin ang mga isyu sa deployment
- [Mga Pinakamahusay na Kasanayan](../troubleshooting/debugging.md) - Mga production-ready deployment strategies

## 🎯 Mga Hands-On Deployment Exercises

### Exercise 1: Incremental Deployment Workflow (20 minuto)
**Layunin**: Masterin ang pagkakaiba ng full at incremental deployments

```bash
# Paunang pag-deploy
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Irekord ang oras ng paunang pag-deploy
echo "Full deployment: $(date)" > deployment-log.txt

# Gumawa ng pagbabago sa code
echo "// Updated $(date)" >> src/api/src/server.js

# I-deploy lamang ang code (mabilis)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Ihambing ang mga oras
cat deployment-log.txt

# Linisin
azd down --force --purge
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Ang full deployment ay tumatagal ng 5-15 minuto
- [ ] Ang code-only deployment ay tumatagal ng 2-5 minuto
- [ ] Ang mga pagbabago sa code ay makikita sa deployed app
- [ ] Walang pagbabago sa infrastructure pagkatapos ng `azd deploy`

**Resulta ng Pag-aaral**: Ang `azd deploy` ay 50-70% mas mabilis kaysa sa `azd up` para sa mga pagbabago sa code

### Exercise 2: Custom Deployment Hooks (30 minuto)
**Layunin**: Magpatupad ng pre at post-deployment automation

```bash
# Gumawa ng pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Suriin kung pumasa ang mga pagsusuri
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Suriin kung may mga hindi nakatuon na pagbabago
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Gumawa ng post-deploy smoke test
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

# Subukan ang deployment gamit ang mga hook
azd deploy
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Ang pre-deploy script ay tumatakbo bago ang deployment
- [ ] Ang deployment ay tumitigil kung nabigo ang mga tests
- [ ] Ang post-deploy smoke test ay nagva-validate ng health
- [ ] Ang mga hooks ay tumatakbo sa tamang pagkakasunod-sunod

### Exercise 3: Multi-Environment Deployment Strategy (45 minuto)
**Layunin**: Magpatupad ng staged deployment workflow (dev → staging → production)

```bash
# Gumawa ng deployment script
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

# Hakbang 3: Manu-manong pag-apruba para sa production
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

**Mga Pamantayan ng Tagumpay:**
- [ ] Ang dev environment ay matagumpay na na-deploy
- [ ] Ang staging environment ay matagumpay na na-deploy
- [ ] Kinakailangan ang manual approval para sa production
- [ ] Lahat ng environment ay may gumaganang health checks
- [ ] Maaaring mag-roll back kung kinakailangan

### Exercise 4: Rollback Strategy (25 minuto)
**Layunin**: Magpatupad at mag-test ng deployment rollback

```bash
# I-deploy ang v1
azd env set APP_VERSION "1.0.0"
azd up

# I-save ang configuration ng v1
cp -r .azure/production .azure/production-v1-backup

# I-deploy ang v2 na may breaking change
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Tukuyin ang pagkabigo
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # I-rollback ang code
    git checkout src/api/src/server.js
    
    # I-rollback ang environment
    azd env set APP_VERSION "1.0.0"
    
    # I-redeploy ang v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Maaaring matukoy ang mga pagkabigo sa deployment
- [ ] Ang rollback script ay tumatakbo nang awtomatiko
- [ ] Ang application ay bumabalik sa gumaganang estado
- [ ] Ang health checks ay pumasa pagkatapos ng rollback

## 📊 Pagsubaybay sa Deployment Metrics

### Subaybayan ang Iyong Deployment Performance

```bash
# Gumawa ng script para sa deployment metrics
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

# Mag-log sa file
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Gamitin ito
./track-deployment.sh
```

**Suriin ang iyong metrics:**
```bash
# Tingnan ang kasaysayan ng deployment
cat deployment-metrics.csv

# Kalkulahin ang karaniwang oras ng deployment
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Karagdagang Resources

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Pag-navigate**
- **Nakaraang Aralin**: [Ang Iyong Unang Proyekto](../getting-started/first-project.md)
- **Susunod na Aralin**: [Pag-provision ng Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->