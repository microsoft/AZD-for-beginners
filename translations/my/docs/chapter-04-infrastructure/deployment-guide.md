# သွင်းပို့လမ်းညွှန် - AZD သွင်းပို့မှုများ ကျွမ်းကျင်ခြင်း

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ မတိုင်မီ အခန်း**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ နောက်တစ်ခု**: [Provisioning Resources](provisioning.md)
- **🚀 နောက် အခန်း**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## မိတ်ဆက်

ဤ## သွင်းပို့မှု လုပ်ငန်းစဉ်နားလည်ခြင်းကျယ်ပြန့်သော လမ်းညွှန်သည် Azure Developer CLI ကို အသုံးပြု၍ အပလီကေးရှင်းများကို သွင်းပို့ခြင်းဆိုင်ရာ လိုအပ်သော အရာများအားလုံးကို ဖော်ပြပေးသည်၊ မူလ တစ်ချက်အမိန့် သွင်းပို့မှုမှ စ၍ custom hooks များ၊ ပတ်ဝန်းကျင် အမျိုးမျိုးနှင့် CI/CD ထည့်သွင်းမှုတို့ ပါဝင်သည့် ထုတ်လုပ်မှုဆိုင်ရာ အဆင့်မြင့် အခြေအနေများအထိ။ လက်တွေ့ ဥပမာများနှင့် အကောင်းဆုံး အလေ့အကျင့်များဖြင့် သင်သည် သွင်းပို့မှု ဘဝစဉ်အားလုံးကို ကျွမ်းကျင်နိုင်မည်။

## လေ့လာရမည့် ရည်မှန်းချက်များ

ဤလမ်းညွှန်ကို ပြီးမြောက်စေခြင်းဖြင့် သင်သည်:
- Azure Developer CLI သွင်းပို့မှု အမိန့်များနှင့် အလုပ်စဉ်များအားလုံးကို ကျွမ်းကျင်မည်
- ပရိုဗျှင်းရှင်းမှ ကြည့်ရှုမှ စ၍ စောင့်ကြည့်မှုထိ သွင်းပို့မှု ဘဝစဉ်အားလုံးကို နားလည်မည်
- သွင်းပို့မှု မတိုင်မီနှင့် မပြီးပြီ Hooks များဖြင့် ကိုယ်ပိုင် အလိုအလျောက်လုပ်ဆောင်မှုများကို အကောင်အထည်ဖော်မည်
- ပတ်ဝန်းကျင် အလိုက် ပါရာမီတာများဖြင့် မတူညီသော ပတ်ဝန်းကျင်များကို ပြင်ဆင်မည်
- blue-green နှင့် canary သွင်းပို့မှုများအပါအဝင် အဆင့်မြင့် သွင်းပို့မှု မဟာဗျူဟာများကို ဖန်တီးမည်
- azd သွင်းပို့မှုများကို CI/CD ပိုင်းနှင့် DevOps လမ်းကြောင်းများနှင့် ပေါင်းစည်းမည်

## လေ့လာပြီးရမည့် ရလဒ်များ

ပြီးမြောက်စဉ်၊ သင်သည်:
- `azd` သွင်းပို့မှု အလုပ်စဉ်အားလုံးကို ကိုယ့်တိုင် ဖြေရှင်း၍ အမှားရှာနိုင်မည်
- Hooks များကို အသုံးပြုပြီး ကိုယ်ပိုင် သွင်းပို့မှု အလိုအလျောက်လုပ်ဆောင်မှုကို ဒီဇိုင်းဆွဲ၍ အကောင်အထည်ဖော်နိုင်မည်
- စိုက်ထုတ်ရန် အဆင်သင့်ရှိသည့် သွင်းပို့မှုများကို လုံခြုံရေးနှင့် စောင့်ကြည့်မှု စနစ်များဖြင့် ပြင်ဆင်နိုင်မည်
- ပတ်ဝန်းကျင် များစွာပါဝင်သည့် စီမံခန့်ခွဲမှုကို ကိုင်တွယ်နိုင်မည်
- သွင်းပို့မှု စွမ်းဆောင်ရည်ကို တိုးတက်စေပြီး ပြန်လှန်မှု မဟာဗျူဟာများကို အကောင်အထည်ဖော်နိုင်မည်
- azd သွင်းပို့မှုများကို စီးပွားရေးအဆင့် DevOps လက်တွေ့များသို့ ပေါင်းစည်းနိုင်မည်

## သွင်းပို့မှု အကျဉ်းချုံး

Azure Developer CLI သည် သွင်းပို့ရန် အမိန့်များ အမျိုးမျိုးကို ပေးသည်:
- `azd up` - ပြည့်စုံ အလုပ်စဉ် (provision + deploy)
- `azd provision` - Azure အရင်းအမြစ်များကို ဖန်တီး/အပ်ဒိတ်လုပ်ခြင်း သာ
- `azd deploy` - အပလီကေးရှင်း ကုဒ်ကို သွင်းပို့ခြင်း သာ
- `azd package` - အပလီကေးရှင်းများကို တည်ဆောက်၍ ပက်ကေ့ချ်ဖို့

## အခြေခံ သွင်းပို့မှု လုပ်ငန်းစဉ်များ

### ပြည့်စုံ သွင်းပို့မှု (azd up)
အချို့သော ပရောဂျက်အသစ်များအတွက် အများဆုံး အသုံးပြုသော အလုပ်စဉ်:
```bash
# အစမှစ၍ အားလုံးကို ဖြန့်ချိပါ
azd up

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်ဖြင့် ဖြန့်ချိပါ
azd up --environment production

# စိတ်ကြိုက်ပါရာမီတာများဖြင့် ဖြန့်ချိပါ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### အင်ဖရားစထရပ် သီးသန့် သွင်းပို့မှု
Azure အရင်းအမြစ်များကိုသာ အပ်ဒိတ် လုပ်လိုသော အချိန်များတွင်:
```bash
# အခြေခံအဆောက်အအုံကို ပံ့ပိုး/အပ်ဒိတ်လုပ်ရန်
azd provision

# ပြောင်းလဲမှုများကို ကြိုကြည့်ရန် dry-run ဖြင့် ပံ့ပိုးရန်
azd provision --preview

# သီးသန့် ဝန်ဆောင်မှုများကို ပံ့ပိုးရန်
azd provision --service database
```

### ကုဒ် သီးသန့် သွင်းပို့မှု
အလျင်အမြန် အပလီကေးရှင်း အသစ်များထည့်သွင်းရန်:
```bash
# ဝန်ဆောင်မှုအားလုံးကို တပ်ဆင်ပါ
azd deploy

# မျှော်မှန်းထားသော ထွက်:
# ဝန်ဆောင်မှုများကို တပ်ဆင်နေသည် (azd deploy)
# - web: တပ်ဆင်နေသည်... ပြီးသွားပါပြီ
# - api: တပ်ဆင်နေသည်... ပြီးသွားပါပြီ
# အောင်မြင်ပါသည်: သင့်တပ်ဆင်မှုသည် 2 မိနစ် 15 စက္ကန့်အတွင်း ပြီးစီးခဲ့ပါသည်

# သီးသန့် ဝန်ဆောင်မှုတစ်ခုကို တပ်ဆင်ပါ
azd deploy --service web
azd deploy --service api

# ကိုယ်ပိုင် ဆောက်လုပ်မှု အချက်အလက်များဖြင့် တပ်ဆင်ပါ
azd deploy --service api --build-arg NODE_ENV=production

# တပ်ဆင်မှုကို စစ်ဆေးပါ
azd show --output json | jq '.services'
```

### ✅ သွင်းပို့မှု အတည်ပြုခြင်း

သွင်းပို့ချက် မည်မျှ မဆို ပြီးဆုံးပြီးနောက် အောင်မြင်မှုအား အတည်ပြုပါ:

```bash
# ဝန်ဆောင်မှုအားလုံး လည်ပတ်နေကြောင်း စစ်ဆေးပါ
azd show

# အခြေအနေ စစ်ဆေးရေး endpoint များကို စမ်းသပ်ပါ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# အမှားများအတွက် စောင့်ကြည့်ပါ (ပုံမှန်အားဖြင့် ဘရောက်ဇာတွင် ဖွင့်သည်)
azd monitor --logs
```

**အောင်မြင်မှု သတ်မှတ်ချက်များ:**
- ✅ အားလုံး ဝန်ဆောင်မှုများတွင် "Running" အခြေအနေ ပြသထားသည်
- ✅ Health endpoints များ HTTP 200 ပြန်လည်ပေးပို့သည်
- ✅ နောက်ဆုံး ၅ မိနစ်အတွင်း အမှား မှတ်တမ်းများ မရှိပါ
- ✅ အပလီကေးရှင်းသည် စမ်းသပ် တောင်းဆိုမှုများကို တုံ့ပြန်သည်

## 🏗️ သွင်းပို့မှု လုပ်ငန်းစဉ်ကို နားလည်ခြင်း

### အဆင့် 1: Provision မလုပ်မီ Hooks
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

### အဆင့် 2: အဆောက်အအုံ ပံ့ပိုးပေးခြင်း
- အဆောက်အအုံ template များ (Bicep/Terraform) ကို ဖတ်ရှုသည်
- Azure အရင်းအမြစ်များကို ဖန်တီး သို့မဟုတ် အပ်ဒိတ်လုပ်သည်
- ကွန်ယက်နှင့် လုံခြုံရေးကို ဆက်တင်ပေးသည်
- စောင့်ကြည့်မှုနှင့် မှတ်တမ်းတင်ခြင်း စနစ်များကို တပ်ဆင်ပေးသည်

### အဆင့် 3: Provision ပြီးနောက် Hooks
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

### အဆင့် 4: အပလီကေးရှင်း ထုပ်ပိုးခြင်း
- အပလီကေးရှင်း ကုဒ်ကို တည်ဆောက်သည်
- သွင်းပို့ရန် အတ္ထရစ်ဖက်များ ဖန်တီးသည်
- ရည်ရွယ်ရာ ပလက်ဖောင်းအတွက် ပက်ကေ့ခ််များ ပြုလုပ်သည် (containers, ZIP ဖိုင်များ, အစရှိများ)

### အဆင့် 5: သွင်းပို့မီ Hooks
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

### အဆင့် 6: အပလီကေးရှင်း သွင်းပို့ခြင်း
- ထုပ်ပိုးထားသော အပလီကေးရှင်းများကို Azure ဝန်ဆောင်မှုများသို့ သွင်းပို့သည်
- စီတန်းချက်များကို အပ်ဒိတ်လုပ်သည်
- ဝန်ဆောင်မှုများကို စတင်/ပြန်စတင်သည်

### အဆင့် 7: သွင်းပို့ပြီးနောက် Hooks
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

## 🎛️ သွင်းပို့မှု ဆက်တင်များ

### ဝန်ဆောင်မှု အလိုက် သတ်မှတ်ချက်များ
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

### ပတ်ဝန်းကျင် အလိုက် ဆက်တင်များ
```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# စမ်းသပ်ခြင်း ပတ်ဝန်းကျင်
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ထုတ်လုပ်မှု ပတ်ဝန်းကျင်
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 အဆင့်မြင့် သွင်းပို့မှု ကိစ္စရပ်များ

### ဝန်ဆောင်မှု များစုပေါင်း အပလီကေးရှင်းများ
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

### Blue-Green သွင်းပို့မှုများ
```bash
# ပြာရောင်ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new production-blue
azd up --environment production-blue

# ပြာရောင်ပတ်ဝန်းကျင်ကို စမ်းသပ်ပါ
./scripts/test-environment.sh production-blue

# သယ်ယူပို့ဆောင်မှုကို ပြာရောင်ပတ်ဝန်းကျင်သို့ ပြောင်းပါ (DNS/Load Balancer ကို လက်ဖြင့် အပ်ဒိတ်လုပ်ပါ)
./scripts/switch-traffic.sh production-blue

# အစိမ်းရောင်ပတ်ဝန်းကျင်ကို သန့်ရှင်းပါ
azd env select production-green
azd down --force
```

### Canary သွင်းပို့မှုများ
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

### အဆင့်လိုက် သွင်းပို့မှုများ
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

## 🐳 ကွန်တိန်းနာ သွင်းပို့မှုများ

### Container App သွင်းပို့မှုများ
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

### Multi-Stage Dockerfile ထိရောက်မှု မြှင့်တင်ခြင်း
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

## ⚡ စွမ်းဆောင်ရည် တိုးတက်ရေး

### ဝန်ဆောင်မှု အလိုက် သွင်းပို့မှုများ
```bash
# ပိုမိုမြန်ဆန်စွာ လုပ်ဆောင်နိုင်ရန် အတွက် တိကျသော ဝန်ဆောင်မှုတစ်ခုကို တပ်ဆင်ပါ
azd deploy --service web
azd deploy --service api

# ဝန်ဆောင်မှုအားလုံးကို တပ်ဆင်ပါ
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

### ထိရောက်သော ကုဒ် သွင်းပို့မှုများ
```bash
# ကုဒ်သာပြောင်းလဲမှုများအတွက် azd up မဟုတ်ပဲ azd deploy ကို အသုံးပြုပါ
# ဒါက အောက်ခံအဆောက်အအုံ ပံ့ပိုးမှုကို ကျော်လွှားပေးပြီး ပိုမိုလျင်မြန်ပါတယ်
azd deploy

# အမြန်ဆုံး ပြန်လည်တင်သွင်းရန် တစ်ဝန်ဆောင်မှုကိုပဲ deploy လုပ်ပါ
azd deploy --service api
```

## 🔍 သွင်းပို့မှု စောင့်ကြည့်မှု

### တပြေးညီ အချိန်မှန် သွင်းပို့မှု စောင့်ကြည့်မှု
```bash
# အက်ပလီကေးရှင်းကို အချိန်နှင့်တပြေးညီ စောင့်ကြည့်ပါ
azd monitor --live

# အက်ပလီကေးရှင်း၏ လော့ဂ်များကို ကြည့်ရှုပါ
azd monitor --logs

# တပ်ဆင်မှု အခြေအနေကို စစ်ဆေးပါ
azd show
```

### စနစ် ကျန်းမာရေး စစ်ဆေးမှုများ
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

### သွင်းပို့ပြီးနောက် အတည်ပြုခြင်း
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

## 🔐 လုံခြုံရေး အရေးကြီးချက်များ

### လျှို့ဝှက် စီမံခန့်ခွဲမှု
```bash
# လျှို့ဝှက်ချက်များကို လုံခြုံစွာ သိမ်းဆည်းပါ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ဖိုင်တွင် လျှို့ဝှက်ချက်များကို ကိုးကားပါ
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

### ကွန်ယက် လုံခြုံရေး
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### အသိအမှတ်ပြုခြင်းနှင့် ဝင်ရောက်ခွင့် စီမံခန့်ခွဲမှု
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

## 🚨 ပြန်လှန်ရန် မဟာဗျူဟာများ

### အမြန် ပြန်လှန်ခြင်း
```bash
# AZD တွင် အလိုအလျောက် ပြန်လည်ပြင်ဆင်ရေး (rollback) မရှိပါ။ အကြံပြုသောနည်းလမ်းများ:

# ရွေးချယ်စရာ ၁: Git မှာမှ ပြန်လည်တင်ပို့ခြင်း (အကြံပြု)
git revert HEAD  # ပြဿနာဖြစ်နေသော commit ကို ပြန်လည်မူလအခြေအနေသို့ ပြန်ယူပါ
git push
azd deploy

# ရွေးချယ်စရာ ၂: သတ်မှတ်ထားသော commit ကို ပြန်လည်တင်ပို့ခြင်း
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### အဆောက်အအုံ ပြန်လှန်ခြင်း
```bash
# တပ်ဆင်မလုပ်ခင် အခြေခံစနစ် (infrastructure) ပြောင်းလဲမှုများကို ကြိုမြင်ကြည့်ပါ
azd provision --preview

# အခြေခံစနစ်ကို ပြန်လဲချင်ပါက ဗားရှင်းထိန်းချုပ်မှုကို အသုံးပြုပါ:
git revert HEAD  # အခြေခံစနစ် ပြောင်းလဲမှုများကို ယခင်အခြေအနေသို့ ပြန်ပြင်ပါ
azd provision    # ယခင် အခြေခံစနစ် အခြေအနေကို အသုံးပြု၍ ပြန်လည်တပ်ဆင်ပါ
```

### ဒေတာဘေ့စ် မိုက်ဂရေးရှင်း ပြန်လှန်ခြင်း
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 သွင်းပို့မှု တိုင်းတာချက်များ

### သွင်းပို့မှု စွမ်းဆောင်ရည်ကို ထိန်းသိမ်းခြင်း
```bash
# လက်ရှိ ဖြန့်ချိမှု အခြေအနေကို ကြည့်ရန်
azd show

# Application Insights ဖြင့် အက်ပလီကေးရှင်းကို စောင့်ကြည့်ရန်
azd monitor --overview

# တိုက်ရိုက် မက်ထရစ်များကို ကြည့်ရန်
azd monitor --live
```

### စိတ်ကြိုက် တိုင်းတာချက် စုဆောင်းမှု
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

## 🎯 အကောင်းဆုံး အလေ့အကျင့်များ

### 1. ပတ်ဝန်းကျင် တူညီမှု
```bash
# အမည်ပေးပုံကို တည်ငြိမ်စွာ အသုံးပြုပါ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ပတ်ဝန်းကျင်များအကြား တူညီမှုကို ထိန်းသိမ်းပါ
./scripts/sync-environments.sh
```

### 2. အဆောက်အအုံ အတည်ပြုပြင်ခြင်း
```bash
# တပ်ဆင်ခြင်းမပြုမီ အောက်ခံစနစ်ပြောင်းလဲမှုများကို ကြိုကြည့်ပါ
azd provision --preview

# ARM/Bicep linting ကို အသုံးပြုပါ
az bicep lint --file infra/main.bicep

# Bicep သဒ္ဒါကို အတည်ပြုပါ
az bicep build --file infra/main.bicep
```

### 3. စမ်းသပ်မှု ပေါင်းစည်းမှု
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

### 4. စာတမ်းပြုစုခြင်းနှင့် မှတ်တမ်းတင်ခြင်း
```bash
# တပ်ဖြန့်မှု လုပ်ထုံးလုပ်နည်းများကို မှတ်တမ်းတင်ပါ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## နောက်ဆက်တွဲ လုပ်ငန်းများ

- [Provisioning Resources](provisioning.md) - အဆောက်အအုံ စီမံခန့်ခွဲမှုကို အနက်ရှိုင်းစွာ လေ့လာရန်
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - သင့် သွင်းပို့ မဟာဗျူဟာကို စီစဉ်ရန်
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - သွင်းပို့မှု ပြဿနာများ ဖြေရှင်းရန်
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - ထုတ်လုပ်မှုအဆင့် သွင်းပို့မှု မဟာဗျူဟာများ

## 🎯 လက်တွေ့ သွင်းပို့မှု လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း 1: တိုးတက်သွင်းပို့မှု လုပ်ငန်းစဉ် (20 မိနစ်)
**ရည်မှန်းချက်**: ပြည့်စုံ သွင်းပို့မှုနှင့် တိုးတက်သွင်းပို့မှု တို့၏ ကွာခြားချက်ကို ကျွမ်းကျင်စွာ သိရှိရန်

```bash
# အစပိုင်းတပ်ဆင်ခြင်း
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# အစပိုင်းတပ်ဆင်ချိန်ကို မှတ်တမ်းတင်ပါ
echo "Full deployment: $(date)" > deployment-log.txt

# ကုဒ်ကို ပြောင်းလဲပါ
echo "// Updated $(date)" >> src/api/src/server.js

# ကုဒ်ပဲတပ်ဆင်ပါ (လျင်မြန်)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# အချိန်များကို နှိုင်းယှဉ်ပါ
cat deployment-log.txt

# ရှင်းလင်းရေးလုပ်ဆောင်ပါ
azd down --force --purge
```

**အောင်မြင်မှု သတ်မှတ်ချက်များ:**
- [ ] ပြည့်စုံ သွင်းပို့မှုသည် 5-15 မိနစ်ကြား ကြာမြင့်သည်
- [ ] ကုဒ် သီးသန့် သွင်းပို့မှုသည် 2-5 မိနစ် ကြား ကြာမြင့်သည်
- [ ] ကုဒ် ပြောင်းလဲမှုများသည် သွင်းပို့ထားသည့် အက်ပ်တွင် ဖော်ပြသည်
- [ ] `azd deploy` ပြီးနောက် အဆောက်အအုံ မပြောင်းလဲပါ

**လေ့လာပြီးရမည့် ရလဒ်**: `azd deploy` သည် ကုဒ် ပြောင်းလဲမှုများအတွက် `azd up` ထက် 50-70% ပိုမိုလျင်မြန်သည်

### လေ့ကျင့်ခန်း 2: စိတ်ကြိုက် သွင်းပို့ Hooks (30 မိနစ်)
**ရည်မှန်းချက်**: မျှဝေရန်မပြုမီနှင့် မပြီးနောက် အလိုအလျောက်လုပ်ဆောင်မှုများကို အကောင်အထည်ဖော်ရန်

```bash
# Deploy မတိုင်မီ အတည်ပြု စစ်ဆေးရေး script ဖန်တီးပါ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# စမ်းသပ်ချက်များ အောင်မြင်ကြောင်း စစ်ဆေးပါ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# commit မလုပ်ထားသေးသော ပြင်ဆင်ချက်များ ရှိမရှိ စစ်ဆေးပါ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# တပ်ဆင်ပြီးနောက် အခြေခံစမ်းသပ်မှု (smoke test) ဖန်တီးပါ
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

# azure.yaml ထဲသို့ hook များ ထည့်ပါ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hook များနှင့် တပ်ဆင်မှုကို စမ်းသပ်ပါ
azd deploy
```

**အောင်မြင်မှု သတ်မှတ်ချက်များ:**
- [ ] သွင်းပို့မီ script သည် သွင်းပို့မှုမပြုမီ ထရပ်လည်အဖြစ် သွားလည်သည်
- [ ] စမ်းသပ်မှု မအောင်မြင်သျှင် သွင်းပို့မှု သပ်ရပ်သည်
- [ ] သွင်းပို့ပြီးနောက် smoke test သည် ကျန်းမာရေးကို အတည်ပြုသည်
- [ ] Hooks များသည် မှန်ကန်သော အစီအစဉ်အတိုင်း လည်ပတ်သည်

### လေ့ကျင့်ခန်း 3: ဘက်စုံ ပတ်ဝန်းကျင် သွင်းပို့ မဟာဗျူဟာ (45 မိနစ်)
**ရည်မှန်းချက်**: အဆင့်လိုက် သွင်းပို့မှု လုပ်ငန်းစဉ် (dev → staging → production) ကို အကောင်အထည်ဖော်ရန်

```bash
# တပ်ဆင်ရေး script တစ်ခု ဖန်တီးပါ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# အဆင့် 1: ဖွံ့ဖြိုးရေး (dev) ပတ်ဝန်းကျင်သို့ တပ်ဆင်ပါ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် 2: စမ်းသပ်ပတ်ဝန်းကျင် (staging) သို့ တပ်ဆင်ပါ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် 3: ထုတ်လုပ်ရေး (production) အတွက် ကိုယ်တိုင် အတည်ပြုချက် လိုအပ်သည်
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

# အဆင့်လိုက် တပ်ဆင်မှုကို ဆောင်ရွက်ပါ
./deploy-staged.sh
```

**အောင်မြင်မှု သတ်မှတ်ချက်များ:**
- [ ] Dev ပတ်ဝန်းကျင်အား ယုံကြည်စွာ သွင်းပို့နိုင်ရမည်
- [ ] Staging ပတ်ဝန်းကျင်အား ယုံကြည်စွာ သွင်းပို့နိုင်ရမည်
- [ ] ထုတ်လုပ်မှုအတွက် လက်မှတ်အတည်ပြုခြင်း လိုအပ်ရမည်
- [ ] အားလုံးသော ပတ်ဝန်းကျင်များတွင် ကျန်းမာရေး စစ်ဆေးမှုများ အလုပ်လုပ်နေရမည်
- [ ] လိုအပ်ပါက ပြန်လှန်နိုင်ရမည်

### လေ့ကျင့်ခန်း 4: ပြန်လှန်မှု မဟာဗျူဟာ (25 မိနစ်)
**ရည်မှန်းချက်**: Git ကို အသုံးပြုပြီး သွင်းပို့မှု ပြန်လှန်မှုကို အကောင်အထည် ဖော်၍ စမ်းသပ်ရန်

```bash
# v1 ကို ဖြန့်ချိခြင်း
azd env set APP_VERSION "1.0.0"
azd up

# v1 commit hash ကို သိမ်းဆည်းခြင်း
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ပျက်စီးစေသည့် ပြောင်းလဲမှုပါရှိသည့် v2 ကို ဖြန့်ချိခြင်း
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# မအောင်မြင်မှုကို ဖော်ထုတ်ပြီး ပြန်လှန်ခြင်း
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ကို အသုံးပြုပြီး ပြန်လှန်ခြင်း
    git revert HEAD --no-edit
    
    # ပတ်ဝန်းကျင်ကို ပြန်လှန်ခြင်း
    azd env set APP_VERSION "1.0.0"
    
    # v1 ကို ပြန်လည် ဖြန့်ချိခြင်း
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**အောင်မြင်မှု သတ်မှတ်ချက်များ:**
- [ ] သွင်းပို့မှု ပျက်ကွက်မှုများကို တွေ့ရှိနိုင်ရမည်
- [ ] ပြန်လှန်ရေး script ကို အလိုအလျောက် လည်ပတ်စေသည်
- [ ] အပလီကေးရှင်းသည် အလုပ်လုပ်နေသည့် နေ့စဉ် အခြေအနေသို့ ပြန်လှန်သည်
- [ ] ပြန်လှန်ပြီးနောက် ကျန်းမာရေး စစ်ဆေးမှုများ ဖြတ်လျှားသည်

## 📊 သွင်းပို့မှု တိုင်းတာချက် ထိန်းသိမ်းခြင်း

### သင့် သွင်းပို့မှု စွမ်းဆောင်ရည်ကို လိုက်လံကြည့်ရန်

```bash
# တပ်ဆင်မှုများဆိုင်ရာ မီထရစ်များကို တိုင်းတာမည့် စကရစ် ဖန်တီးပါ
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

# ဖိုင်ထဲသို့ မှတ်တမ်းတင်ပါ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# အသုံးပြုပါ
./track-deployment.sh
```

**သင့် မက်ထရစ်များကို စိတ်ဖြင့် သုံးသပ်ပါ:**
```bash
# တပ်ဆင်မှုမှတ်တမ်းများကို ကြည့်ပါ
cat deployment-metrics.csv

# တပ်ဆင်ချိန်၏ ပျမ်းမျှကို တွက်ချက်ပါ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ထပ်ဆင့် အရင်းအမြစ်များ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**လမ်းကြောင်း**
- **မတိုင်မီ သင်ခန်းစာ**: [Your First Project](../chapter-01-foundation/first-project.md)
- **နောက် သင်ခန်းစာ**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အာမခံချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု Co-op Translator (https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းသော်လည်း အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်ကြောင်း ကျေးဇူးပြု၍ သတိပြုပါ။ မူရင်းစာတမ်းကို မူရင်းဘာသာစကားဖြင့်သာ တရားဝင် အချက်အလက်အနေဖြင့် ယုံကြည်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူ့ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုရာမှ ဖြစ်ပေါ်လာသည့် နားလည်မှုပျက်လမ်းများ သို့မဟုတ် မွားယွင်းချက်များအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->