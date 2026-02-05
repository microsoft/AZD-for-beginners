# တင်သွင်းလမ်းညွှန် - AZD တင်သွင်းမှုများကို ကျွမ်းကျင်စွာ လုပ်ဆောင်ခြင်း

**အခန်းများအကြောင်းအရာ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD အခြေခံများ](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၄ - Code နှင့် တင်သွင်းမှုအဖြစ် Infrastructure
- **⬅️ ယခင်အခန်း**: [အခန်း ၃: Configuration](../getting-started/configuration.md)
- **➡️ နောက်တစ်ခု**: [အရင်းအမြစ်များ Provisioning](provisioning.md)
- **🚀 နောက်အခန်း**: [အခန်း ၅: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## အကျဉ်းချုပ်

ဒီလမ်းညွှန်မှာ Azure Developer CLI ကို အသုံးပြုပြီး application များကို တင်သွင်းခြင်းအကြောင်းကို အခြေခံ single-command တင်သွင်းမှုများမှ စ၍ custom hooks, အမျိုးမျိုးသောပတ်ဝန်းကျင်များနှင့် CI/CD integration ပါဝင်သော အဆင့်မြင့် production အခြေအနေများအထိ လေ့လာနိုင်ပါသည်။ လက်တွေ့နမူနာများနှင့် အကောင်းဆုံးလေ့လာမှုများဖြင့် တင်သွင်းမှု၏ အပြည့်အစုံကို ကျွမ်းကျင်စွာ လေ့လာပါ။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကို ပြီးမြောက်ပါက၊ သင်သည်:
- Azure Developer CLI တင်သွင်းမှု command များနှင့် workflow များကို ကျွမ်းကျင်စွာ လုပ်ဆောင်နိုင်မည်
- Provisioning မှ Monitoring အထိ တင်သွင်းမှု lifecycle အပြည့်အစုံကို နားလည်နိုင်မည်
- Pre နှင့် Post-deployment automation အတွက် custom deployment hooks များကို အကောင်အထည်ဖော်နိုင်မည်
- ပတ်ဝန်းကျင်-specific parameters များဖြင့် အမျိုးမျိုးသောပတ်ဝန်းကျင်များကို configure လုပ်နိုင်မည်
- Blue-Green နှင့် Canary တင်သွင်းမှုများအပါအဝင် အဆင့်မြင့် deployment strategy များကို စီစဉ်နိုင်မည်
- azd တင်သွင်းမှုများကို CI/CD pipelines နှင့် DevOps workflow များနှင့် ပေါင်းစပ်နိုင်မည်

## သင်ယူရမည့်ရလဒ်များ

ဒီလမ်းညွှန်ကို ပြီးမြောက်ပါက၊ သင်သည်:
- azd တင်သွင်းမှု workflow များကို ကိုယ်တိုင် လုပ်ဆောင်နိုင်ပြီး အခက်အခဲများကို ဖြေရှင်းနိုင်မည်
- Custom deployment automation ကို hooks အသုံးပြု၍ ဒီဇိုင်းဆွဲနိုင်မည်
- လုံခြုံရေးနှင့် monitoring အပြည့်အစုံပါဝင်သော production-ready တင်သွင်းမှုများကို configure လုပ်နိုင်မည်
- အဆင့်မြင့် multi-environment တင်သွင်းမှု scenario များကို စီမံနိုင်မည်
- တင်သွင်းမှု performance ကို အကောင်းဆုံးဖြစ်အောင် optimize လုပ်ပြီး rollback strategy များကို အကောင်အထည်ဖော်နိုင်မည်
- azd တင်သွင်းမှုများကို စီးပွားရေး DevOps လုပ်ငန်းစဉ်များနှင့် ပေါင်းစပ်နိုင်မည်

## တင်သွင်းမှုအကျဉ်းချုပ်

Azure Developer CLI သည် တင်သွင်းမှု command များစွာကို ပေးထားသည်:
- `azd up` - Workflow အပြည့်အစုံ (provision + deploy)
- `azd provision` - Azure resources များကို ဖန်တီး/အပ်ဒိတ်လုပ်ခြင်းသာ
- `azd deploy` - Application code ကိုသာ တင်သွင်းခြင်း
- `azd package` - Application များကို Build နှင့် Package လုပ်ခြင်း

## အခြေခံတင်သွင်းမှု Workflow များ

### တင်သွင်းမှုအပြည့်အစုံ (azd up)
Project အသစ်များအတွက် အများဆုံးအသုံးပြုသော workflow:
```bash
# အစမှစ၍ အားလုံးကို တင်ဆောင်ပါ
azd up

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်နှင့် တင်ဆောင်ပါ
azd up --environment production

# စိတ်ကြိုက် ပါရာမီတာများနှင့် တင်ဆောင်ပါ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only တင်သွင်းမှု
Azure resources များကိုသာ အပ်ဒိတ်လုပ်ရန်လိုအပ်သောအခါ:
```bash
# အခြေခံအဆောက်အအုံများကို ပံ့ပိုး/အပ်ဒိတ်လုပ်ပါ
azd provision

# ပြောင်းလဲမှုများကို ကြိုတင်ကြည့်ရှုရန် dry-run ဖြင့် ပံ့ပိုးပါ
azd provision --preview

# သတ်မှတ်ထားသော ဝန်ဆောင်မှုများကို ပံ့ပိုးပါ
azd provision --service database
```

### Code-Only တင်သွင်းမှု
Application ကို အမြန်အပ်ဒိတ်လုပ်ရန်:
```bash
# ဝန်ဆောင်မှုအားလုံးကို တင်သွင်းပါ
azd deploy

# မျှော်မှန်းထားသော အထွက်:
# ဝန်ဆောင်မှုများကို တင်သွင်းနေသည် (azd deploy)
# - web: တင်သွင်းနေသည်... ပြီးဆုံး
# - api: တင်သွင်းနေသည်... ပြီးဆုံး
# အောင်မြင်မှု: သင့်တင်သွင်းမှုသည် ၂ မိနစ် ၁၅ စက္ကန့်အတွင်း ပြီးဆုံးခဲ့သည်

# သတ်မှတ်ထားသော ဝန်ဆောင်မှုကို တင်သွင်းပါ
azd deploy --service web
azd deploy --service api

# စိတ်ကြိုက် တည်ဆောက်မှု အချက်အလက်များနှင့် တင်သွင်းပါ
azd deploy --service api --build-arg NODE_ENV=production

# တင်သွင်းမှုကို အတည်ပြုပါ
azd show --output json | jq '.services'
```

### ✅ တင်သွင်းမှုအောင်မြင်မှုအတည်ပြုခြင်း

တင်သွင်းမှုတိုင်းပြီးနောက်၊ အောင်မြင်မှုကို အတည်ပြုပါ:

```bash
# ဝန်ဆောင်မှုအားလုံးအလုပ်လုပ်နေမှုကိုစစ်ဆေးပါ
azd show

# ကျန်းမာရေး endpoint များကိုစမ်းသပ်ပါ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# အမှားများအတွက် log များကိုစစ်ဆေးပါ
azd logs --service api --since 5m | grep -i error
```

**အောင်မြင်မှုအချက်များ:**
- ✅ အားလုံးသော service များ "Running" status ပြသခြင်း
- ✅ Health endpoints မှ HTTP 200 ပြန်လာခြင်း
- ✅ နောက်ဆုံး ၅ မိနစ်အတွင်း error logs မရှိခြင်း
- ✅ Application သည် test requests များကို တုံ့ပြန်ခြင်း

## 🏗️ တင်သွင်းမှုလုပ်ငန်းစဉ်ကို နားလည်ခြင်း

### အဆင့် ၁: Pre-Provision Hooks
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

### အဆင့် ၂: Infrastructure Provisioning
- Infrastructure templates (Bicep/Terraform) များကို ဖတ်ခြင်း
- Azure resources များကို ဖန်တီး/အပ်ဒိတ်လုပ်ခြင်း
- Networking နှင့် Security ကို configure လုပ်ခြင်း
- Monitoring နှင့် Logging ကို စီစဉ်ခြင်း

### အဆင့် ၃: Post-Provision Hooks
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

### အဆင့် ၄: Application Packaging
- Application code ကို Build လုပ်ခြင်း
- Deployment artifacts များကို ဖန်တီးခြင်း
- Target platform အတွက် Package လုပ်ခြင်း (containers, ZIP files, စသည်)

### အဆင့် ၅: Pre-Deploy Hooks
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

### အဆင့် ၆: Application Deployment
- Packaged applications များကို Azure services တွင် တင်သွင်းခြင်း
- Configuration settings များကို အပ်ဒိတ်လုပ်ခြင်း
- Services များကို စတင်/ပြန်စတင်ခြင်း

### အဆင့် ၇: Post-Deploy Hooks
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

## 🎛️ တင်သွင်းမှု Configuration

### Service-Specific တင်သွင်းမှု Settings
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

### Environment-Specific Configurations
```bash
# ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင်
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# စမ်းသပ်မှုပတ်ဝန်းကျင်
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ထုတ်လုပ်မှုပတ်ဝန်းကျင်
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 အဆင့်မြင့်တင်သွင်းမှု Scenario များ

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

### Blue-Green တင်သွင်းမှု
```bash
# အပြာရောင်ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new production-blue
azd up --environment production-blue

# အပြာရောင်ပတ်ဝန်းကျင်ကို စမ်းသပ်ပါ
./scripts/test-environment.sh production-blue

# အပြာရောင်သို့ traffic ကို ပြောင်းပါ (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# အစိမ်းရောင်ပတ်ဝန်းကျင်ကို ရှင်းလင်းပါ
azd env select production-green
azd down --force
```

### Canary တင်သွင်းမှု
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

### Staged တင်သွင်းမှု
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

## 🐳 Container တင်သွင်းမှု

### Container App တင်သွင်းမှု
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

## ⚡ Performance Optimization

### Parallel တင်သွင်းမှု
```bash
# မျှတစွာ တင်သွင်းမှုကို ဖွဲ့စည်းပါ
azd config set deploy.parallelism 5

# ဝန်ဆောင်မှုများကို မျှတစွာ တင်သွင်းပါ
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

### Incremental တင်သွင်းမှု
```bash
# ပြောင်းလဲမှုရှိသော service များကိုသာ deploy လုပ်ပါ။
azd deploy --incremental

# ပြောင်းလဲမှုကို detect လုပ်ပြီး deploy လုပ်ပါ။
azd deploy --detect-changes
```

## 🔍 တင်သွင်းမှု Monitoring

### Real-Time တင်သွင်းမှု Monitoring
```bash
# တပ်ဆင်မှုတိုးတက်မှုကိုကြည့်ရှုပါ
azd deploy --follow

# တပ်ဆင်မှုမှတ်တမ်းများကိုကြည့်ရှုပါ
azd logs --follow --service api

# တပ်ဆင်မှုအခြေအနေကိုစစ်ဆေးပါ
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

# အက်ဉ်းချုပ်လျှောက်လွှာကျန်းမာရေးကိုစစ်ဆေးပါ
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

## 🔐 လုံခြုံရေးအချက်များ

### Secrets Management
```bash
# လျှို့ဝှက်ချက်များကို လုံခြုံစွာ သိမ်းဆည်းပါ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml တွင် လျှို့ဝှက်ချက်များကို ရည်ညွှန်းပါ
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

## 🚨 Rollback Strategy များ

### Quick Rollback
```bash
# ယခင်တင်သွင်းမှုသို့ ပြန်လည်ဆုတ်ခွာပါ
azd deploy --rollback

# သတ်မှတ်ထားသော ဝန်ဆောင်မှုကို ပြန်လည်ဆုတ်ခွာပါ
azd deploy --service api --rollback

# သတ်မှတ်ထားသော ဗားရှင်းသို့ ပြန်လည်ဆုတ်ခွာပါ
azd deploy --service api --version v1.2.3
```

### Infrastructure Rollback
```bash
# အခြေခံအဆောက်အအုံပြောင်းလဲမှုများကို ပြန်လည်ရုပ်သိမ်းပါ။
azd provision --rollback

# ပြန်လည်ရုပ်သိမ်းမှုအပြောင်းအလဲများကို ကြိုတင်ကြည့်ရှုပါ။
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

## 📊 တင်သွင်းမှု Metrics

### တင်သွင်းမှု Performance ကို Track လုပ်ခြင်း
```bash
# တင်သွင်းမှုမီထရစ်များကိုဖွင့်ပါ
azd config set telemetry.deployment.enabled true

# တင်သွင်းမှုသမိုင်းကြောင်းကိုကြည့်ရှုပါ
azd history

# တင်သွင်းမှုစာရင်းအင်းများကိုရယူပါ
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

## 🎯 အကောင်းဆုံးလေ့လာမှုများ

### ၁. Environment Consistency
```bash
# အမည်ပေးမှုကို တစ်စည်းတစ်လုံးဖြစ်အောင် အသုံးပြုပါ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ပတ်ဝန်းကျင်အချိုးအစားကို ထိန်းသိမ်းပါ
./scripts/sync-environments.sh
```

### ၂. Infrastructure Validation
```bash
# တင်သွင်းမည့်အခါမတိုင်မီအတည်ပြုပါ
azd provision --preview
azd provision --what-if

# ARM/Bicep linting ကိုအသုံးပြုပါ
az bicep lint --file infra/main.bicep
```

### ၃. Testing Integration
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

### ၄. Documentation နှင့် Logging
```bash
# တင်သွင်းမှုလုပ်ငန်းစဉ်များကိုစာရွက်စာတမ်းပြုလုပ်ပါ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## နောက်တစ်ဆင့်များ

- [Provisioning Resources](provisioning.md) - Infrastructure စီမံခန့်ခွဲမှုအကြောင်း အနက်နက်လေ့လာပါ
- [Pre-Deployment Planning](../pre-deployment/capacity-planning.md) - သင်၏တင်သွင်းမှု strategy ကို စီစဉ်ပါ
- [Common Issues](../troubleshooting/common-issues.md) - တင်သွင်းမှုအခက်အခဲများကို ဖြေရှင်းပါ
- [Best Practices](../troubleshooting/debugging.md) - Production-ready တင်သွင်းမှု strategy များ

## 🎯 လက်တွေ့တင်သွင်းမှု လေ့ကျင့်မှုများ

### လေ့ကျင့်မှု ၁: Incremental တင်သွင်းမှု Workflow (၂၀ မိနစ်)
**ရည်မှန်းချက်**: Full နှင့် Incremental တင်သွင်းမှုများ၏ ကွာခြားချက်ကို ကျွမ်းကျင်စွာ လေ့လာပါ

```bash
# မူလဖြန့်ချိမှု
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# မူလဖြန့်ချိမှုအချိန်ကို မှတ်တမ်းတင်ပါ
echo "Full deployment: $(date)" > deployment-log.txt

# ကုဒ်ကို ပြောင်းလဲပါ
echo "// Updated $(date)" >> src/api/src/server.js

# ကုဒ်ကိုသာ ဖြန့်ချိပါ (လျင်မြန်)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# အချိန်များကို နှိုင်းယှဉ်ပါ
cat deployment-log.txt

# ရှင်းလင်းပါ
azd down --force --purge
```

**အောင်မြင်မှုအချက်များ:**
- [ ] Full တင်သွင်းမှု ၅-၁၅ မိနစ်ကြာ
- [ ] Code-only တင်သွင်းမှု ၂-၅ မိနစ်ကြာ
- [ ] Code ပြောင်းလဲမှုများသည် တင်သွင်းထားသော app တွင် ပြသခြင်း
- [ ] Infrastructure သည် `azd deploy` ပြုလုပ်ပြီးနောက် မပြောင်းလဲခြင်း

**သင်ယူရလဒ်**: `azd deploy` သည် code ပြောင်းလဲမှုများအတွက် `azd up` ထက် ၅၀-၇၀% အမြန်ဆုံးဖြစ်သည်

### လေ့ကျင့်မှု ၂: Custom တင်သွင်းမှု Hooks (၃၀ မိနစ်)
**ရည်မှန်းချက်**: Pre နှင့် Post-deployment automation ကို အကောင်အထည်ဖော်ပါ

```bash
# အကြို-တင်သွင်းမှု အတည်ပြု script ဖန်တီးပါ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# စမ်းသပ်မှုများ အောင်မြင်ကြောင်း စစ်ဆေးပါ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# မတင်သွင်းရသေးသော ပြောင်းလဲမှုများ ရှိကြောင်း စစ်ဆေးပါ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# တင်သွင်းပြီးနောက် smoke စမ်းသပ်မှု ဖန်တီးပါ
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

# azure.yaml တွင် hooks ထည့်ပါ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hooks ဖြင့် တင်သွင်းမှုကို စမ်းသပ်ပါ
azd deploy
```

**အောင်မြင်မှုအချက်များ:**
- [ ] Pre-deploy script သည် တင်သွင်းမှုမတိုင်မီ run ဖြစ်ခြင်း
- [ ] Test မအောင်မြင်ပါက တင်သွင်းမှု ရပ်တန့်ခြင်း
- [ ] Post-deploy smoke test သည် health ကို အတည်ပြုခြင်း
- [ ] Hooks များသည် မှန်ကန်သော အစီအစဉ်အတိုင်း run ဖြစ်ခြင်း

### လေ့ကျင့်မှု ၃: Multi-Environment တင်သွင်းမှု Strategy (၄၅ မိနစ်)
**ရည်မှန်းချက်**: Staged တင်သွင်းမှု workflow (dev → staging → production) ကို အကောင်အထည်ဖော်ပါ

```bash
# တင်သွင်းမှု script ဖန်တီးပါ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# အဆင့် ၁: အဆင့်တိုးတက်မှုကို dev တွင် တင်ပါ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် ၂: အဆင့်တိုးတက်မှုကို staging တွင် တင်ပါ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် ၃: production အတွက် လက်ဖြင့် အတည်ပြုမှု
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

# ပတ်ဝန်းကျင်များ ဖန်တီးပါ
azd env new dev
azd env new staging
azd env new production

# အဆင့်လိုက် တင်သွင်းမှုကို အလုပ်လုပ်ပါ
./deploy-staged.sh
```

**အောင်မြင်မှုအချက်များ:**
- [ ] Dev environment သည် အောင်မြင်စွာ တင်သွင်းခြင်း
- [ ] Staging environment သည် အောင်မြင်စွာ တင်သွင်းခြင်း
- [ ] Production အတွက် Manual အတည်ပြုမှုလိုအပ်ခြင်း
- [ ] အားလုံးသော environment များတွင် working health checks ရှိခြင်း
- [ ] လိုအပ်ပါက Rollback ပြုလုပ်နိုင်ခြင်း

### လေ့ကျင့်မှု ၄: Rollback Strategy (၂၅ မိနစ်)
**ရည်မှန်းချက်**: တင်သွင်းမှု Rollback ကို အကောင်အထည်ဖော်ပြီး စမ်းသပ်ပါ

```bash
# v1 ကိုဖြန့်ချိပါ
azd env set APP_VERSION "1.0.0"
azd up

# v1 configuration ကိုသိမ်းဆည်းပါ
cp -r .azure/production .azure/production-v1-backup

# အဆက်မပြတ်ပြောင်းလဲမှုနှင့်အတူ v2 ကိုဖြန့်ချိပါ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# မအောင်မြင်မှုကိုရှာဖွေပါ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # code ကိုပြန်လည်ရုပ်သိမ်းပါ
    git checkout src/api/src/server.js
    
    # environment ကိုပြန်လည်ရုပ်သိမ်းပါ
    azd env set APP_VERSION "1.0.0"
    
    # v1 ကိုပြန်လည်ဖြန့်ချိပါ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**အောင်မြင်မှုအချက်များ:**
- [ ] တင်သွင်းမှု fail ဖြစ်မှုကို ရှာဖွေနိုင်ခြင်း
- [ ] Rollback script သည် အလိုအလျောက် run ဖြစ်ခြင်း
- [ ] Application သည် ပြန်လည်အလုပ်လုပ်နိုင်သော အခြေအနေသို့ ပြန်သွားခြင်း
- [ ] Rollback ပြုလုပ်ပြီးနောက် Health checks pass ဖြစ်ခြင်း

## 📊 တင်သွင်းမှု Metrics Tracking

### သင်၏တင်သွင်းမှု Performance ကို Track လုပ်ပါ

```bash
# တပ်ဆင်မှုမီထရစ်စကရစ်ပြုလုပ်ပါ
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

# ဖိုင်တွင်မှတ်တမ်းတင်ပါ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ဒါကိုသုံးပါ
./track-deployment.sh
```

**သင်၏ Metrics ကို ခွဲခြမ်းစိတ်ဖြာပါ:**
```bash
# တင်သွင်းမှုမှတ်တမ်းကိုကြည့်ပါ
cat deployment-metrics.csv

# ပျမ်းမျှတင်သွင်းချိန်ကိုတွက်ချက်ပါ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## အပိုဆောင်းအရင်းအမြစ်များ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**အခန်းများ Navigation**
- **ယခင်သင်ခန်းစာ**: [သင်၏ပထမဆုံး Project](../getting-started/first-project.md)
- **နောက်သင်ခန်းစာ**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->