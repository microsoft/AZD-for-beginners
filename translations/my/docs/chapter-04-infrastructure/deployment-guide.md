# တပ်ဆင်ခြင်း လမ်းညွှန် - AZD တပ်ဆင်မှုများ ကျွမ်းကျင်ခြင်း

**အခန်းလမ်းညွှန်:**
- **📚 သင်တန်း မူလ စာမျက်နှာ**: [AZD စတင်သူများအတွက်](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၄ - Infrastructure as Code နှင့် တပ်ဆင်ခြင်း
- **⬅️ Previous Chapter**: [အခန်း ၃: ဆက်တင်များ](../chapter-03-configuration/configuration.md)
- **➡️ နောက်တစ်ခု**: [အရင်းအမြစ်များ ပေးအပ်ခြင်း](provisioning.md)
- **🚀 နောက် အခန်း**: [အခန်း ၅: Multi-Agent AI ဖြေရှင်းချက်များ](../../examples/retail-scenario.md)

## နိဒါန်း

ဤ စုံလင်သည့် လမ်းညွှန်သည် Azure Developer CLI ကို အသုံးပြု၍ လျှောက်လွှာများကို တပ်ဆင်ခြင်းအကြောင်း သင့်အား လိုအပ်သမျှ အားလုံးကို ဖုံးလွှမ်းပေးပါသည်၊ အခြေခံ တစ်ချက်-ကွန်မန်း တပ်ဆင်ခြင်းမှ စ၍ စိတ်ကြိုက် hooks များ၊ မျိုးစုံပတ်ဝန်းကျင်များနှင့် CI/CD ပေါင်းစည်းမှုပါသော ထုတ်လုပ်မှုပတ်ဝန်းကျင်များအထိ။ လက်တွေ့ ဥပမာများနှင့် အကောင်းဆုံး လမ်းစဉ်များဖြင့် တပ်ဆင်မှု အသက်တာလုံးကို ကျွမ်းကျင်ပါ။

## သင်ယူရမည့် ရည်မှန်းချက်များ

By completing this guide, you will:
- Azure Developer CLI ၏ တပ်ဆင်မှု အမိန့်များနှင့် လုပ်ငန်းစဉ်များအားလုံးကို ကျွမ်းကျင်ပါ
- Provisioning မှ monitoring ထိ တပ်ဆင်မှု အသက်တာလုံးကို နားလည်ပါ
- Pre- နှင့် post-deployment အလိုအလျောက်လုပ်ဆောင်မှုများအတွက် စိတ်ကြိုက် deployment hooks များ အကောင်အထည်ဖော်ပါ
- ပတ်ဝန်းကျင်အလိုက် parameters များဖြင့် မျိုးစုံပတ်ဝန်းကျင်များကို ဖော်ပြင်ပါ
- blue-green နှင့် canary တပ်ဆင်မှုများ ပါဝင်သည့် အဆင့်မြင့် deployment ပြုပြင်များကို တပ်ဆင်ပါ
- azd တပ်ဆင်မှုများကို CI/CD pipeline များနှင့် DevOps လုပ်ငန်းစဉ်များထဲသို့ ပေါင်းစည်းပါ

## သင်ယူပြီးရလဒ်များ

Upon completion, you will be able to:
- တစ်ကိုယ်တော် အနေဖြင့် `azd` တပ်ဆင်မှု လုပ်ငန်းစဉ်များအားလုံးကို အကောင်အထည်ဖော်ပြီး ဖြေရှင်းနိုင်မည်
- Hooks အသုံးပြု၍ စိတ်ကြိုက် တပ်ဆင်မှု အလိုအလျောက်လုပ်ဆောင်မှုများကို ဒီဇိုင်းဆွဲပြီး ထည့်သွင်းနိုင်မည်
- ဘေးကင်းလုံခြုံမှုနှင့် ကြပ်မတ်မှုမရှိသော ထုတ်လုပ်မှု အတွက် ပြင်ဆင်ထားသော တပ်ဆင်မှုများ ဖော်ဆောင်နိုင်မည်
- များစွာသော ပတ်ဝန်းကျင်များနှင့် ရှုပ်ထွေးသော deployment အခြေအနေများကို စီမံနိုင်မည်
- တပ်ဆင်မှု စွမ်းဆောင်ရည်ကို အကောင်းဆုံးဖြစ်စေပြီး ပြန်လှန်ပြင်ဆင်မှု များကို ထိန်းချုပ်နိုင်မည်
- azd တပ်ဆင်မှုများကို ကုမ္ပဏီပတ်ဝန်းကျင် DevOps လုပ်ငန်းစဉ်များထဲသို့ ပေါင်းစည်းနိုင်မည်

## တပ်ဆင်မှု အကျဉ်းချုပ်

Azure Developer CLI သည် အများအပြားတပ်ဆင်မှု အမိန့်များပေးစွမ်းပါသည်:
- `azd up` - အပြည့်အစုံ လုပ်ငန်းစဉ် (provision + deploy)
- `azd provision` - Azure အရင်းအမြစ်များသာ ဖန်တီး/အပ်ဒိတ်လုပ်ခြင်း
- `azd deploy` - လျှောက်လွှာကုဒ်ကိုသာ တပ်ဆင်ခြင်း
- `azd package` - လျှောက်လွှာများ တည်ဆောက်ပြီး ထုပ်ပိုးခြင်း

## မူလ တပ်ဆင်မှု လုပ်ငန်းစဉ်များ

### Complete Deployment (azd up)
The most common workflow for new projects:
```bash
# အစမှ စ၍ အားလုံးကို တပ်ဆင်ပါ
azd up

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်ဖြင့် တပ်ဆင်ပါ
azd up --environment production

# စိတ်ကြိုက် ပါရာမီတာများဖြင့် တပ်ဆင်ပါ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Infrastructure-Only Deployment
When you only need to update Azure resources:
```bash
# အောက်ခံအဆောက်အအုံကို တပ်ဆင်/အပ်ဒိတ်လုပ်ခြင်း
azd provision

# ပြောင်းလဲမှုများကို ကြိုကြည့်ရန် dry-run ဖြင့် ထောက်ပံ့ခြင်း
azd provision --preview

# သီးသန့် ဝန်ဆောင်မှုများကို ထောက်ပံ့ခြင်း
azd provision --service database
```

### Code-Only Deployment
For quick application updates:
```bash
# ဝန်ဆောင်မှုအားလုံးကို ဖြန့်ချိပါ
azd deploy

# မျှော်မှန်းထားသော ထွက်စာရင်း:
# ဝန်ဆောင်မှုများကို ဖြန့်ချိနေသည် (azd deploy)
# - web: ဖြန့်ချိနေသည်... ပြီးစီးပါပြီ
# - api: ဖြန့်ချိနေသည်... ပြီးစီးပါပြီ
# အောင်မြင်: သင့် ဖြန့်ချိမှုကို 2 မိနစ် 15 စက္ကန့်အတွင်း ပြီးစီးခဲ့သည်

# တိကျသော ဝန်ဆောင်မှုကို ဖြန့်ချိပါ
azd deploy --service web
azd deploy --service api

# စိတ်ကြိုက် တည်ဆောက်မှု အချက်များဖြင့် ဖြန့်ချိပါ
azd deploy --service api --build-arg NODE_ENV=production

# ဖြန့်ချိမှုကို စစ်ဆေးပါ
azd show --output json | jq '.services'
```

### ✅ Deployment Verification

After any deployment, verify success:

```bash
# ဝန်ဆောင်မှုအားလုံး လည်ပတ်နေကြောင်း စစ်ဆေးပါ
azd show

# ကျန်းမာရေး အဆုံးချက်များကို စမ်းသပ်ပါ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# အမှားများကို စောင့်ကြည့်ပါ (ပုံမှန်အားဖြင့် ဘရောက်ဇာတွင် ဖွင့်မည်)
azd monitor --logs
```

**အောင်မြင်မှု ချက်များ:**
- ✅ ဝန်ဆောင်မှုများအားလုံးတွင် "Running" အခြေအနေပြသည်
- ✅ Health endpoints များသည် HTTP 200 ပြန်လည်ပေးပို့သည်
- ✅ လွန်ခဲ့သည့် ၅ မိနစ်အတွင်း မှားယွင်းချက်မှတ်တမ်း မရှိပါ
- ✅ လျှောက်လွှာသည် စမ်းသပ်မှု တောင်းဆိုချက်များကို တုံ့ပြန်ပေးသည်

## 🏗️ တပ်ဆင်မှု လုပ်ငန်းစဉ်ကို နားလည်ခြင်း

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
- အင်ဖရာစထရပ် မော်ဒယ်များ (Bicep/Terraform) ကို ဖတ်ထုတ်သည်
- Azure အရင်းအမြစ်များကို ဖန်တီးသို့မဟုတ် အပ်ဒိတ်လုပ်သည်
- ကွန်ယက်နှင့် လုံခြုံရေးကို ပြင်ဆင်သည်
- ကြပ်မတ်မှုနှင့် မှတ်တမ်းတင်မှုကို စီစဉ်ပေးသည်

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
- လျှောက်လွှာကုဒ်ကို တည်ဆောက်သည်
- တပ်ဆင်မှု အရာဝတ္ထုများကို ဖန်တီးသည်
- ရည်ရွယ်ထားသော ပလက်ဖောင်းအတွက် ထုပ်ပိုးသည် (containers, ZIP ဖိုင်များ စသည်)

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
- ထုပ်ပိုးထားသော လျှောက်လွှာများကို Azure ဝန်ဆောင်မှုများသို့ တပ်ဆင်သည်
- ဖော်ပြချက်ဆက်တင်များကို အပ်ဒိတ်လုပ်သည်
- ဝန်ဆောင်မှုများကို စတင်/ပြန်စတင်သည်

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

## 🎛️ တပ်ဆင်မှု ဖော်ပြချက်

### Service-Specific Deployment Settings
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
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# စတေဂျ် ပတ်ဝန်းကျင်
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 အဆင့်မြင့် တပ်ဆင်မှု အခြေအနေများ

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
# အပြာရောင် ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new production-blue
azd up --environment production-blue

# အပြာရောင် ပတ်ဝန်းကျင်ကို စမ်းသပ်ပါ
./scripts/test-environment.sh production-blue

# ကွန်ယက်ရောက်လာမှုကို အပြာသို့ ပြောင်းပါ (DNS/Load Balancer ကို လက်ဖြင့် အပ်ဒိတ်ပြုလုပ်ရန်)
./scripts/switch-traffic.sh production-blue

# အစိမ်းရောင် ပတ်ဝန်းကျင်ကို ရှင်းလင်းပါ
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

## 🐳 ကွန်တိန်နာ တပ်ဆင်မှုများ

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

### Multi-Stage Dockerfile အကောင်းမြှင့်ခြင်း
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

## ⚡ စွမ်းဆောင်ရည် တိုးတက်စေခြင်း

### Service-Specific Deployments
```bash
# ပိုမိုမြန်ဆန်စေဖို့ တိကျသော ဝန်ဆောင်မှုတစ်ခုကို ဖြန့်ချိပါ
azd deploy --service web
azd deploy --service api

# ဝန်ဆောင်မှုအားလုံးကို ဖြန့်ချိပါ
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

### Efficient Code Deployments
```bash
# ကုဒ်သာ ပြင်ဆင်မှုများအတွက် azd up မဟုတ်ဘဲ azd deploy ကို သုံးပါ
# ဤနည်းလမ်းသည် အင်ဖရားစထက် ဖွဲ့စည်းရေး (infrastructure provisioning) ကို ကျော်လွှတ်ပေး၍ ပိုမိုလျင်မြန်သည်
azd deploy

# အမြန်ဆုံး ပြန်လည်တိုးတက်မှုအတွက် သတ်မှတ်ထားသော ဝန်ဆောင်မှုကိုသာ deploy လုပ်ပါ
azd deploy --service api
```

## 🔍 တပ်ဆင်မှု ကြီးကြပ်ခြင်း

### Real-Time Deployment Monitoring
```bash
# အက်ပလီကေးရှင်းကို အချိန်နှင့်တပြေးညီ စောင့်ကြည့်ပါ
azd monitor --live

# အက်ပလီကေးရှင်း လော့ဂ်များ ကြည့်ရှုပါ
azd monitor --logs

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
azd show
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

# အပလီကေးရှင်း၏ ကျန်းမာရေးကို စစ်ဆေးပါ
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

## 🔐 လုံခြုံရေးဆိုင်ရာ တွေးခေါ်ရန်များ

### Secrets Management
```bash
# လျှို့ဝှက်ချက်များကို လုံခြုံစိတ်ချစွာ သိမ်းဆည်းပါ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml တွင် လျှို့ဝှက်ချက်များကို ကိုးကားပါ
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

## 🚨 ပြန်လှန်ရန် 전략များ

### Quick Rollback
```bash
# AZD တွင် အတွင်းတည်ဆောက်ထားသည့် rollback မရှိပါ။ အကြံပြုသော နည်းလမ်းများ:

# ရွေးချယ်စရာ ၁: Git မှ ပြန်လည်တပ်ဆင်ခြင်း (အကြံပြု)
git revert HEAD  # ပြဿနာရှိသော commit ကို ပြန်လည်မူလအခြေအနေသို့ ပြန်ထားပါ
git push
azd deploy

# ရွေးချယ်စရာ ၂: သတ်မှတ် commit ကို ပြန်လည်တပ်ဆင်ခြင်း
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Infrastructure Rollback
```bash
# ဖွဲ့စည်းပုံပြောင်းလဲမှုများကို လုပ်ဆောင်မပြုမီ ကြိုကြည့်ပါ
azd provision --preview

# ဖွဲ့စည်းပုံ ပြန်လှန်ရန် ဗားရှင်းထိန်းချုပ်မှုကို အသုံးပြုပါ:
git revert HEAD  # ဖွဲ့စည်းပုံ ပြောင်းလဲမှုများကို ပြန်လှန်ပြုလုပ်ပါ
azd provision    # ယခင် ဖွဲ့စည်းပုံ အခြေအနေကို ပြန်တပ်ဆင်ပါ
```

### Database Migration Rollback
```bash
#bash interpreter ကို သတ်မှတ်သော shebang (#!/bin/bash)
# scripts/rollback-database.sh - ဒေတာဘေ့စ်ကို နောက်ပြန်ပြန်လည်ယူရန် script ဖိုင်

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 တပ်ဆင်မှု မက်ထရစ်များ

### Track Deployment Performance
```bash
# လက်ရှိ တပ်ဆင်မှု အခြေအနေကို ကြည့်ရန်
azd show

# Application Insights ဖြင့် အက်ပလီကေးရှင်းကို စောင့်ကြည့်ရန်
azd monitor --overview

# တိုက်ရိုက် မက်ထရစ်များကို ကြည့်ရန်
azd monitor --live
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

## 🎯 အကောင်းဆုံး လက်တွေ့လမ်းစဉ်များ

### 1. Environment Consistency
```bash
# နာမည်ပေးခြင်းကို တစ်မျိုးတည်း စည်းမျဉ်းဖြင့် အသုံးပြုပါ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ပတ်ဝန်းကျင်များ၏ တူညီမှုကို ထိန်းသိမ်းပါ
./scripts/sync-environments.sh
```

### 2. Infrastructure Validation
```bash
# တပ်ဆင်မတိုင်မီ အခြေခံအဆောက်အဦး ပြောင်းလဲမှုများကို ကြိုကြည့်ပါ
azd provision --preview

# ARM/Bicep linting ကို အသုံးပြုပါ
az bicep lint --file infra/main.bicep

# Bicep syntax ကို အတည်ပြုပါ
az bicep build --file infra/main.bicep
```

### 3. Testing Integration
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

### 4. Documentation and Logging
```bash
# တပ်ဆင်ခြင်းလုပ်ထုံးလုပ်နည်းများအား မှတ်တမ်းတင်ပါ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## နောက်တစ်ပိုင်း အဆင့်များ

- [အရင်းအမြစ်များ ပေးအပ်ခြင်း](provisioning.md) - အင်ဖရာစထရပ် စီမံခန့်ခွဲခြင်းအကြောင်း နက်ချိတ်ပါစေ
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - သင့် တပ်ဆင်မှု မဟာဗျူဟာကို စီစဉ်ပါ
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - တပ်ဆင်မှု ပြဿနာများကို ဖြေရှင်းပါ
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - ထုတ်လုပ်မှုသုံး တပ်ဆင်မှု မဟာဗျူဟာများ

## 🎯 လက်တွေ့ တပ်ဆင်မှု လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း ၁: တိုးတက်အဆင့်လိုက် တပ်ဆင်မှု လုပ်ငန်းစဉ် (20 minutes)
**ရည်မှန်းချက်**: အပြည့်အစုံနှင့် တိုးတက်အဆင့်လိုက် တပ်ဆင်မှုများ၏ မတူကွဲပြားချက်ကို ကျွမ်းကျင်ပါ

```bash
# ပထမဆုံး တပ်ဆင်ခြင်း
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ပထမဆုံး တပ်ဆင်သည့် အချိန်ကို မှတ်တမ်းတင်ခြင်း
echo "Full deployment: $(date)" > deployment-log.txt

# ကုဒ် ပြောင်းလဲခြင်း
echo "// Updated $(date)" >> src/api/src/server.js

# ကုဒ်ပဲ တပ်ဆင်ခြင်း (မြန်)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# အချိန်များကို နှိုင်းယှဉ်ခြင်း
cat deployment-log.txt

# သန့်ရှင်းရေး ပြုလုပ်ခြင်း
azd down --force --purge
```

**အောင်မြင်မှု ချက်များ:**
- [ ] Full deployment takes 5-15 minutes
- [ ] Code-only deployment takes 2-5 minutes
- [ ] Code changes reflected in deployed app
- [ ] Infrastructure unchanged after `azd deploy`

**သင်ယူပြီးရလဒ်**: `azd deploy` သည် code ပြင်ဆင်မှုများအတွက် `azd up` ထက် 50-70% ပိုလျင်မြန်သည်

### လေ့ကျင့်ခန်း ၂: စိတ်ကြိုက် တပ်ဆင်မှု Hooks များ (30 minutes)
**ရည်မှန်းချက်**: Pre- နှင့် post-deployment အလိုအလျောက်လုပ်ဆောင်မှုများကို အကောင်အထည်ဖော်ပါ

```bash
# တပ်ဆင်မီ အတည်ပြုရန် စကရစ်ပ့် တစ်ခု ဖန်တီးပါ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# စမ်းသပ်မှုများ အောင်မြင်သလား စစ်ဆေးပါ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# commit မထားသေးသော ပြောင်းလဲမှုများ ရှိမရှိ စစ်ဆေးပါ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# တပ်ဆင်ပြီးနောက် smoke test တစ်ခု ဖန်တီးပါ
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

# azure.yaml ဖိုင်ထဲသို့ hooks ထည့်ပါ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hooks များဖြင့် တပ်ဆင်မှုကို စမ်းသပ်ပါ
azd deploy
```

**အောင်မြင်မှု ချက်များ:**
- [ ] Pre-deploy script သည် တပ်ဆင်မှုမပြုမီ အလုပ်လုပ်သည်
- [ ] စမ်းသပ်မှု မအောင်မြင်လျှင် တပ်ဆင်မှု ပိတ်သိမ်းသည်
- [ ] Post-deploy smoke test သည် ကျန်းမာရေးကို အတည်ပြုသည်
- [ ] Hooks များသည် မှန်ကန်သော အစီအစဉ်အတိုင်း အလုပ်လုပ်သည်

### လေ့ကျင့်ခန်း ၃: မျိုးစုံပတ်ဝန်းကျင် တပ်ဆင်မှု မဟာဗျူဟာ (45 minutes)
**ရည်မှန်းချက်**: အဆင့်လိုက် တပ်ဆင်မှု လုပ်ငန်းစဉ် (dev → staging → production) ကို အကောင်အထည်ဖော်ပါ

```bash
# deployment script တစ်ခု ဖန်တီးပါ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# အဆင့် ၁: dev ပတ်ဝန်းကျင်သို့ တပ်ဆင်ပါ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် ၂: staging ပတ်ဝန်းကျင်သို့ တပ်ဆင်ပါ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် ၃: ထုတ်လုပ်ရေး (production) အတွက် လက်တွေ့ အတည်ပြုချက် လိုအပ်သည်
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

# ပတ်ဝန်းကျင်များကို ဖန်တီးပါ
azd env new dev
azd env new staging
azd env new production

# အဆင့်လိုက် တပ်ဆင်မှုကို စတင် လုပ်ဆောင်ပါ
./deploy-staged.sh
```

**အောင်မြင်မှု ချက်များ:**
- [ ] Dev ပတ်ဝန်းကျင် တပ်ဆင်မှု အောင်မြင်စွာ ပြီးမြောက်သည်
- [ ] Staging ပတ်ဝန်းကျင် တပ်ဆင်မှု အောင်မြင်စွာ ပြီးမြောက်သည်
- [ ] Production အတွက် လက်မှတ် အတည်ပြုချက် လိုအပ်သည်
- [ ] အားလုံးသော ပတ်ဝန်းကျင်များတွင် ကျန်းမာရေး စစ်ဆေးမှုများ လုပ်ငန်းသုံးနိုင်သည်
- [ ] လိုအပ်ပါက ပြန်လှန်စိတ်ချနိုင်သည်

### လေ့ကျင့်ခန်း ၄: ပြန်လှန်ရန် မဟာဗျူဟာ (25 minutes)
**ရည်မှန်းချက်**: Git ကို အသုံးပြု၍ တပ်ဆင်မှု ပြန်လှန်ခြင်းကို အကောင်အထည်ဖော်၍ စမ်းသပ်ပါ

```bash
# v1 ကို ဖြန့်ချိပါ
azd env set APP_VERSION "1.0.0"
azd up

# v1 commit hash ကို သိမ်းဆည်းပါ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ချိုးဖောက်မှုပါသော ပြောင်းလဲမှုနဲ့ v2 ကို ဖြန့်ချိပါ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ပျက်ကွက်မှုကို တွေ့ရှိပြီး မူလအခြေအနေသို့ ပြန်လည်သွားပါ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ကို အသုံးပြုပြီး ပြန်လည်သွားပါ
    git revert HEAD --no-edit
    
    # ပတ်ဝန်းကျင်ကို ပြန်လည်သွားပါ
    azd env set APP_VERSION "1.0.0"
    
    # v1 ကို ထပ်မံဖြန့်ချိပါ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**အောင်မြင်မှု ချက်များ:**
- [ ] တပ်ဆင်မှု မအောင်မြင်မှုများကို တွေ့နိုင်သည်
- [ ] Rollback script ကို အလိုအလျောက် လည်ပတ်စေသည်
- [ ] လျှောက်လွှာသည် လုပ်ဆောင်နိုင်သော အခြေအနေသို့ ပြန်သွားသည်
- [ ] Rollback အပြီးတွင် ကျန်းမာရေး စစ်ဆေးမှုများ ဖြတ်ผ่านသည်

## 📊 တပ်ဆင်မှု မက်ထရစ်များ ထိန်းသိမ်းခြင်း

### သင့် တပ်ဆင်မှု စွမ်းဆောင်ရည်ကို တိုင်းတာပါ

```bash
# တပ်ဆင်မှု မီထရစ် စကရစ် ဖန်တီးပါ
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

# ဖိုင်သို့ မှတ်တမ်းတင်ပါ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# အသုံးပြုပါ
./track-deployment.sh
```

**သင့် မက်ထရစ်များကို သုံးသပ်ပါ:**
```bash
# ဖြန့်ချိမှုမှတ်တမ်းများကို ကြည့်ရှုရန်
cat deployment-metrics.csv

# ပျမ်းမျှဖြန့်ချိချိန်ကို တွက်ချက်ရန်
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## အပို အရင်းအမြစ်များ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**လမ်းကြောင်း**
- **Previous Lesson**: [Your First Project](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [အရင်းအမြစ်များ ပေးအပ်ခြင်း](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးစားသော်လည်း အလိုအလျောက်ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါရှိနိုင်ကြောင်း သတိပေးပါသည်။ မူလဘာသာဖြင့် ရေးသားထားသော မူရင်းစာတမ်းကို တရားဝင်အရင်းမြစ်အဖြစ် ယူဆသင့်သည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူဘာသာပြန်အား အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းကြောင့် ဖြစ်ပေါ်လာသော နားမလည်မှုများ သို့မဟုတ် မှားယွင်းသတ်မှတ်ခြင်းများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->