# ထည့်သွင်းခြင်းလမ်းညွှန် - AZD ထည့်သွင်းမှုများ ကျွမ်းကျင်ခြင်း

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD စတင်သူများအတွက်](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း ၄ - အဆောက်အုံကို ကုဒ်အဖြစ် နှင့် ထည့်သွင်းခြင်း
- **⬅️ ယခင် အခန်း**: [အခန်း ၃: ဖွဲ့စည်းမှု](../chapter-03-configuration/configuration.md)
- **➡️ နောက်တစ်ခု**: [အရင်းအမြစ်များ ပံ့ပိုးခြင်း](provisioning.md)
- **🚀 နောက်ထပ် အခန်း**: [အခန်း ၅: မျိုးစုံ အေးဂျင့် AI ဖြေရှင်းချက်များ](../../examples/retail-scenario.md)

## နိဒါန်း

ဤလမ်းညွှန်စာတမ်းသည် Azure Developer CLI ကို အသုံးပြု၍ အပလီကေရှင်းများကို ထည့်သွင်းရာ၌ မိမိမှာ လိုအပ်သော အချက်အားလုံးကို အစမှ အဆုံးအထိ ဖေါ်ပြထားသည်။ တစ်ချက် command ဖြင့် လုပ်ဆောင်ခြင်းမှ စ၍ custom hooks များ၊ မတူကွဲပြားသော ပတ်ဝန်းကျင်များနှင့် CI/CD အညွှန်းများထိ တိုးတက်ပြည့်စုံသော ထုတ်လုပ်ရေးအခြေအနေများအထိ လက်တွေ့ ဥပမာများနှင့် အကောင်းဆုံး နည်းလမ်းများဖြင့် deployment လေစီကို ကျွမ်းကျင်စေပါမည်။

## သင်ယူရန်ရည်ရွယ်ချက်များ

- Azure Developer CLI ထည့်သွင်းရေး command များနှင့် workflow များအားလုံးကို ကျွမ်းကျင်စွာ သိရှိရန်
- ပံ့ပိုးမှုမှစ၍ မော်နီတာထိ ထည့်သွင်းမှု၏ လုပ်ငန်းစဉ်လုံးဝကို နားလည်ရန်
- မပေးမပျက် အလိုအလျောက်လုပ်ဆောင်ရန် pre/post-deployment custom hooks များကို သတ်မှတ်တပ်ဆင်ရန်
- ပတ်ဝန်းကျင်အလိုက် အချိန်နှင့် parameter များကို သတ်မှတ်၍ အများပြည်သူပတ်ဝန်းကျင်များကို ဖွဲ့စည်းရန်
- blue-green နှင့် canary တို့ပါသည့် တိုးတက်သော deployment မဟာဗျုဟာများကို ပြင်ဆင်ရန်
- azd deployments များကို CI/CD pipeline များနှင့် DevOps workflow များသို့ ပေါင်းစည်းရန်

## သင်ယူပြီးရလဒ်များ

ပြီးဆုံးပြီးနောက် သင်သည် အောက်ပါများကို အလုပ်လုပ်နိုင်မည်ဖြစ်သည်။
- azd ထည့်သွင်းမှု workflow များအားလုံးကို လွတ်လပ်စွာ အလွယ်တကူ လည်ပတ်ပြုပြင်နိုင်ခြင်း
- hooks များကို အသုံးပြု၍ custom deployment automation များကို ဒီဇိုင်းရေးဆွဲနှင့် တည်ဆောက်နိုင်ခြင်း
- လုံခြုံရေးနှင့် မော်နီတာလုပ်ငန်းစဉ်တို့ပါဝင်သည့် ထုတ်လုပ်ရေးသင့် သတ်မှတ်ချက်ရှိ deployments များကို ဖွဲ့စည်းနိုင်ခြင်း
- လူကြီးမင်း၏ မဟာဗျုဟာအရ မျိုးစုံပတ်ဝန်းကျင်များ၏ ခက်ခဲသော ထည့်သွင်းမှုကိစ္စများကို စီမံနိုင်ခြင်း
- ထည့်သွင်းမှု လုပ်ငန်းစဉ်ကို အမြန်ဆုံး ပြုလုပ်နိုင်စေပြီး ပြန်လည်မူလအခြေအနေသို့ ပြန်သွားစေသော မဟာဗျုဟာများကို အကောင်အထည်ဖော်နိုင်ခြင်း
- azd deployments များကို စီးပွားရေး DevOps လက်ရှိနည်းလမ်းများနှင့် ပေါင်းစည်းနိုင်ခြင်း

## ထည့်သွင်းမှု အနှစ်ချုပ်

Azure Developer CLI သည် အောက်ပါထည့်သွင်းရန် command များကို ပံ့ပိုးပေးသည်။
- `azd up` - ပြည့်စုံသော workflow (ပံ့ပိုးခြင်း + ထည့်သွင်းခြင်း)
- `azd provision` - Azure အရင်းအမြစ်များသာ ဖန်တီး/ပြင်ဆင်ခြင်း
- `azd deploy` - အပလီကေရှင်းကုဒ်ကိုသာ ထည့်သွင်းခြင်း
- `azd package` - အပလီကေရှင်းများကို build ပြုလုပ်၍ ပက်ကေ့ချ် ဖန်တီးခြင်း

## အခြေခံ ထည့်သွင်းမှု လုပ်ငန်းစဉ်များ

### ပြည့်စုံသော ထည့်သွင်းမှု (azd up)
ပရောဂျက်အသစ်များအတွက် အများဆုံး အသုံးများသော workflow:
```bash
# အစမှ စ၍ အားလုံးကို ဖြန့်ချိပါ
azd up

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်ဖြင့် ဖြန့်ချိပါ
azd up --environment production

# စိတ်ကြိုက် ပါရာမီတာများဖြင့် ဖြန့်ချိပါ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### အဆောက်အုံသာ အတွက် ထည့်သွင်းမှု
Azure အရင်းအမြစ်များကိုသာ အပ်ဒိတ်လုပ်ရန်လိုသောအခါ:
```bash
# အခြေခံအဆောက်အအုံကို ထောက်ပံ့/အပ်ဒိတ်လုပ်ရန်
azd provision

# ပြောင်းလဲမည့်အရာများကို ကြိုကြည့်ရန် dry-run ဖြင့် ထောက်ပံ့ရန်
azd provision --preview

# တိကျသတ်မှတ်ထားသော ဝန်ဆောင်မှုများကို ထောက်ပံ့ရန်
azd provision --service database
```

### ကုဒ်ပင်သာ ထည့်သွင်းမှု
အလုပ်လျင်မြန်သော အပလီကေရှင်း အပ်ဒိတ်များအတွက်:
```bash
# ဝန်ဆောင်မှုအားလုံးကို တင်ပါ
azd deploy

# မျှော်မှန်းထားသော အထွက်:
# ဝန်ဆောင်မှုများကို တင်နေသည် (azd deploy)
# - web: တင်နေသည်... ပြီးပြီ
# - api: တင်နေသည်... ပြီးပြီ
# အောင်မြင်ပါသည်: သင့်တပ်ဆင်မှုကို 2 မိနစ် 15 စက္ကန့်အတွင်း ပြီးစီးခဲ့သည်

# သီးသန့် ဝန်ဆောင်မှုကို တပ်ဆင်ပါ
azd deploy --service web
azd deploy --service api

# စိတ်ကြိုက် build အချက်အလက်များဖြင့် တပ်ဆင်ပါ
azd deploy --service api --build-arg NODE_ENV=production

# တပ်ဆင်မှုကို စစ်ဆေးပါ
azd show --output json | jq '.services'
```

### ✅ ထည့်သွင်းမှု စစ်ဆေးခြင်း

ထည့်သွင်းမှု မည်သည်ဖြစ်စေ အောင်မြင်မှုကို အောက်ပါအတိုင်း စစ်ဆေးပါ။

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

**အောင်မြင်မှု အချက်များ:**
- ✅ အားလုံးသော ဝန်ဆောင်မှုများတွင် "Running" အခြေအနေ ပြသမှသာ
- ✅ Health endpoint များမှ HTTP 200 ပြန်လာရမည်
- ✅ နောက်ဆုံး ၅ မိနစ်အတွင်း အမှားမှတ်တမ်း မရှိရပါ
- ✅ အပလီကေရှင်းသည် စမ်းသပ်မက်ဆေ့များအား တုံ့ပြန်နိုင်ရမည်

## 🏗️ ထည့်သွင်းမှု လုပ်ငန်းစဉ်ကို နားလည်ခြင်း

### အဆင့် ၁: ပံ့ပိုးမီ Hooks
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

### အဆင့် ၂: အဆောက်အုံ ပံ့ပိုးခြင်း
- အဆောက်အုံ template များကို ဖတ်ယူသည် (Bicep/Terraform)
- Azure အရင်းအမြစ်များ ဖန်တီး/အပ်ဒိတ်လုပ်သည်
- နက်၀ါ့ခ်နှင့် လုံခြုံရေးကို ပုံသေနည်း ဖြင့် ဆက်တင်သည်
- မော်နီတာနှင့် မှတ်တမ်းတင်ခြင်းကို စနစ်တကျ သတ်မှတ်သည်

### အဆင့် ၃: ပံ့ပိုးပြီးနောက် Hooks
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

### အဆင့် ၄: အပလီ케ရှင်း ပက်ကေ့ခ်် ဖန်တီးခြင်း
- အပလီကေရှင်းကုဒ်ကို build ပြုလုပ်သည်
- ထည့်သွင်းရန် အရာအဝတ်များ (artifacts) ဖန်တီးသည်
- ရည်ရွယ်ထားသည့် ပလက်ဖောင်းအတွက် package ပြုလုပ်သည် (containers, ZIP ဖိုင်များ စသည်)

### အဆင့် ၅: ထည့်သွင်းမီ Hooks
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

### အဆင့် ၆: အပလီကေရှင်း ထည့်သွင်းခြင်း
- ပက်ကေ့ခ််ထားသော အပလီကေရှင်းများကို Azure ဝန်ဆောင်မှုများသို့ ထည့်သွင်းသည်
- ဖွဲ့စည်းမှု ဆက်တင်များကို အပ်ဒိတ်လုပ်သည်
- ဝန်ဆောင်မှုများကို စတင်/ပြန်စတင် လုပ်ဆောင်သည်

### အဆင့် ၇: ထည့်သွင်းပြီးနောက် Hooks
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

## 🎛️ ထည့်သွင်းမှု ဖော်ပြချက်များ

### ဝန်ဆောင်မှု သီးသန့် ထည့်သွင်းမှု ဆက်တင်များ
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

### ပတ်ဝန်းကျင် သီးသန့် ဖော်ပြချက်များ
```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# ထုတ်လုပ်မီ စမ်းသပ်ရေး ပတ်ဝန်းကျင်
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

## 🔧 တိုးတက်သော ထည့်သွင်းမှု အခြေအနေများ

### မျိုးစုံ ဝန်ဆောင်မှု အပလီကေရှင်းများ
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

### ပြာ-စိမ်း (Blue-Green) ထည့်သွင်းမှုများ
```bash
# အပြာရောင် ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new production-blue
azd up --environment production-blue

# အပြာရောင် ပတ်ဝန်းကျင်ကို စမ်းသပ်ပါ
./scripts/test-environment.sh production-blue

# ဆက်သွယ်မှုများကို အပြာသို့ လက်ဖြင့် DNS/လော့ဒ်ဘလေဆာကို မွမ်းမံ၍ လွှဲပြောင်းပါ
./scripts/switch-traffic.sh production-blue

# အစိမ်းရောင် ပတ်ဝန်းကျင်ကို ရှင်းလင်းပါ
azd env select production-green
azd down --force
```

### ကနေရီ (Canary) ထည့်သွင်းမှုများ
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

### အဆင့်လိုက် (Staged) ထည့်သွင်းမှုများ
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

## 🐳 ကွန်တိတ်နာ ထည့်သွင်းမှုများ

### Container App ထည့်သွင်းခြင်း
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

### Multi-Stage Dockerfile တိုးတက်ချက်များ
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

## ⚡ အ výkon တိုးတက်စေမှု

### ဝန်ဆောင်မှု သီးသန့် ထည့်သွင်းမှုများ
```bash
# မြန်ဆန်စွာ အလှည့်လည်လုပ်ရန် သတ်မှတ်ထားသော ဝန်ဆောင်မှုတစ်ခုကို တပ်ဆင်ပါ
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

### ထိရောက်သော ကုဒ် ထည့်သွင်းမှုများ
```bash
# ကုဒ်သာ ပြင်ဆင်တဲ့အချိန် azd up မဟုတ်ဘဲ azd deploy ကို အသုံးပြုပါ
# ဒီဟာက အခြေခံအဆောက်အအုံ ပို့ဆောင်မှုကို ကျော်လွှားပေးလို့ ပိုမြန်ပါတယ်
azd deploy

# အမြန်ဆုံး ပြန်လည်လုပ်ဆောင်နိုင်ဖို့ သတ်မှတ် ဝန်ဆောင်မှုကို ဖြန့်ချိပါ
azd deploy --service api
```

## 🔍 ထည့်သွင်းမှု မော်နီတာလုပ်ငန်း

### အချိန်နှင့်တပြေးညီ ထည့်သွင်းမှု မော်နီတာလုပ်ခြင်း
```bash
# တစ်ချိန်တည်းတွင် အက်ပလီကေးရှင်းကို စောင့်ကြည့်ပါ
azd monitor --live

# အက်ပလီကေးရှင်းလော့ဂ်များကို ကြည့်ရှုပါ
azd monitor --logs

# ဖြန့်ချိမှု အခြေအနေကို စစ်ဆေးပါ
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

### ထည့်သွင်းပြီးနောက် စစ်ဆေးခြင်း
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# အပလီကေးရှင်းကျန်းမာရေးကို စစ်ဆေးပါ
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

## 🔐 လုံခြုံရေး သတိပြုရန်အချက်များ

### Secrets စီမံခန့်ခွဲမှု
```bash
# လျှို့ဝှက်ချက်များကို လုံခြုံစိတ်ချစွာ သိမ်းဆည်းပါ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ဖိုင်ထဲရှိ လျှို့ဝှက်ချက်များကို ကိုးကားပါ
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

### အိုင်ဒင်တစ်တီနှင့် အသုံးပြုခွင့် စီမံခန့်ခွဲမှု
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

## 🚨 ပြန်လှန် မူလအခြေအနေ သတ်မှတ်ချက်များ

### အမြန် ပြန်လှန်ခြင်း
```bash
# AZD တွင် အလိုအလျောက် ပြန်လည်ရုပ်သိမ်း (rollback) လုပ်နိုင်မှု မရှိပါ။ အကြံပြုထားသော နည်းလမ်းများ:

# ရွေးချယ်စရာ ၁: Git မှ ပြန်လည်တင်သွင်းခြင်း (အကြံပြု)
git revert HEAD  # ပြဿနာဖြစ်စေသော commit ကို မူလအခြေအနေသို့ ပြန်လည်ပြင်ဆင်ပါ
git push
azd deploy

# ရွေးချယ်စရာ ၂: အထူးသတ်မှတ်ထားသော commit ကို ပြန်လည်တင်သွင်းခြင်း
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### အဆောက်အုံ ပြန်လှန်ခြင်း
```bash
# အသုံးချမတိုင်ခင် အောက်ခံအဆောက်အအုံ ပြောင်းလဲမှုများကို ကြိုကြည့်ပါ
azd provision --preview

# အောက်ခံအဆောက်အအုံ ပြန်လုပ်ရန် ဗားရှင်းထိန်းချုပ်မှုကို အသုံးပြုပါ:
git revert HEAD  # အောက်ခံအဆောက်အအုံ ပြောင်းလဲမှုများကို အရင်အခြေအနေသို့ ပြန်ပြင်ပါ
azd provision    # အရင်အခြေနေအထားရှိသော အောက်ခံအဆောက်အအုံကို အသုံးချပါ
```

### ဒေတာဘေ့(စ်) မိုက်ရေးရှင်း ပြန်လှန်ခြင်း
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ထည့်သွင်းမှု တိုင်းတာချက်များ

### ထည့်သွင်းမှု လုပ်ဆောင်ရည်ကို ဆက်လက် လိုက်ကြည့်ရန်
```bash
# လက်ရှိ တပ်ဆင်မှု အခြေအနေကို ကြည့်ရန်
azd show

# Application Insights ဖြင့် အပလီကေးရှင်းကို စောင့်ကြည့်ရန်
azd monitor --overview

# တိုက်ရိုက် မက်ထရစ်များကို ကြည့်ရန်
azd monitor --live
```

### စိတ်ကြိုက် တိုင်းတာချက်များ စုဆောင်းခြင်း
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

## 🎯 အကောင်းဆုံး လေ့လာမှု နည်းလမ်းများ

### 1. ပတ်ဝန်းကျင် တစ်ညီတစ်နိုင်မှု
```bash
# နာမည်ပေးရာတွင် တူညီစွာ အသုံးပြုပါ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ပတ်ဝန်းကျင်များအကြား တူညီမှုကို ထိန်းသိမ်းပါ
./scripts/sync-environments.sh
```

### 2. အဆောက်အုံ အတည်ပြုခြင်း
```bash
# တပ်ဆင်မတိုင်မီ အခြေခံအဆောက်အအုံ ပြောင်းလဲမှုများကို ကြိုမြင်ကြည့်ရှုပါ
azd provision --preview

# ARM/Bicep linting ကို အသုံးပြုပါ
az bicep lint --file infra/main.bicep

# Bicep စာမူပုံစံကို အတည်ပြုပါ
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

### 4. စာရွက်စာတမ်းနှင့် မှတ်တမ်းတင်ခြင်း
```bash
# တပ်ဆင်ခြင်း လုပ်ထုံးလုပ်နည်းများကို မှတ်တမ်းတင်ပါ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## နောက်ထပ် ဆက်လက်လုပ်ဆောင်ရန်

- [အရင်းအမြစ်များ ပံ့ပိုးခြင်း](provisioning.md) - အဆောက်အုံ စီမံခန့်ခွဲမှုကို နက်နက်ရှိုင်းရှိုင်း လေ့လာရန်
- [ထည့်သွင်းမီ စီစဉ်မှု](../chapter-06-pre-deployment/capacity-planning.md) - သင့် ထည့်သွင်းမှု မဟာဗျုဟာကို စီမံရန်
- [ရောဂါပျက်များ နှုတ်ကုန်များ](../chapter-07-troubleshooting/common-issues.md) - ထည့်သွင်းမှု ပြဿနာများကို ဖြေရှင်းရန်
- [အကောင်းဆုံး လေ့လာမှု နည်းလမ်းများ](../chapter-07-troubleshooting/debugging.md) - ထုတ်လုပ်ရေးအဆင့် သင့်တော်သော ထည့်သွင်းမှု မဟာဗျုဟာများ

## 🎯 လက်တွေ့ ထည့်သွင်းမှု လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း ၁: တိုးတက်လာသော ထည့်သွင်းမှု လုပ်ငန်းစဉ် (20 မိနစ်)
**ရည်ရွယ်ချက်**: ပြည့်စုံသော ထည့်သွင်းမှုနှင့် တိုးချဲ့ထည့်သွင်းမှု၏ ကွာခြားချက်ကို ကျွမ်းကျင်စေခြင်း

```bash
# အစပိုင်း တပ်ဆင်ခြင်း
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# အစပိုင်း တပ်ဆင်ချိန်ကို မှတ်တမ်းတင်ရန်
echo "Full deployment: $(date)" > deployment-log.txt

# ကုဒ်ပြောင်းလဲရန်
echo "// Updated $(date)" >> src/api/src/server.js

# ကုဒ်ပဲ တင်သွင်းရန် (လျင်မြန်)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# အချိန်များကို နှိုင်းယှဉ်ရန်
cat deployment-log.txt

# ရှင်းလင်းရန်
azd down --force --purge
```

**အောင်မြင်မှု အချက်များ:**
- [ ] ပြည့်စုံ ထည့်သွင်းမှု သာမန်အားဖြင့် 5-15 မိနစ် ကြားယူသည်
- [ ] ကုဒ်ပင်သာ ထည့်သွင်းမှု 2-5 မိနစ် ကြားယူသည်
- [ ] ကုဒ်ပြင်နိုင်မှုများသည် ထည့်သွင်းထားသည့် အပလီကေရှင်းတွင် ထင်ရှားပြဿနာများကို ပြန်လည်ထုတ်ဖော်သည်
- [ ] `azd deploy` ပြုလုပ်ပြီးနောက် အဆောက်အုံတွင် မပြောင်းလဲပါ

**သင်ယူရလဒ်**: `azd deploy` သည် ကုဒ်ပြင်ပြင်ဆင်မှုများအတွက် `azd up` ထက် 50-70% အမြန်ဖြစ်သည်

### လေ့ကျင့်ခန်း ၂: Custom Deployment Hooks (30 မိနစ်)
**ရည်ရွယ်ချက်**: ပံ့ပိုးမီနှင့် ပြီးနောက် ထည့်သွင်းမှု အလိုအလျောက်လုပ်ငန်းစဉ်များကို တည်ဆောက်မှု

```bash
# deploy မလုပ်ခင် အတည်ပြုစစ်ဆေးရေး script တစ်ခု ဖန်တီးပါ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# စမ်းသပ်မှုများ အောင်မြင်ပါသလား စစ်ဆေးပါ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# commit မထိုးထားသေးသော ပြောင်းလဲမှုများ ရှိမရှိ စစ်ဆေးပါ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# deploy ပြီးနောက် smoke test တစ်ခု ဖန်တီးပါ
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

# azure.yaml ဖိုင်ထဲသို့ hooks များ ထည့်ပါ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hooks များနှင့်အတူ deployment ကို စမ်းသပ်ပါ
azd deploy
```

**အောင်မြင်မှု အချက်များ:**
- [ ] ထည့်သွင်းမီ စက္ကူ script သည် ထည့်သွင်းမှုမပြုမီ အသောက်လည်သည်
- [ ] စမ်းသပ်မှု မအောင်မြင်ပါက ထည့်သွင်းမှု ရပ်ဆိုင်းသည်
- [ ] ထည့်သွင်းပြီးနောက် smoke test သည် ကျန်းမာအခြေအနေ ကို အတည်ပြုသည်
- [ ] Hooks များသည် မှန်ကန်သော အစဉ်အတိုင်း အလုပ်လုပ်သည်

### လေ့ကျင့်ခန်း ၃: မျိုးစုံ ပတ်ဝန်းကျင် ထည့်သွင်း မဟာဗျုဟာ (45 မိနစ်)
**ရည်ရွယ်ချက်**: အဆင့်လိုက် ထည့်သွင်းမှု လုပ်ငန်းစဉ် (dev → staging → production) ကို တည်ဆောက်ခြင်း

```bash
# တပ်ဆင်ရေး စကရစ်ပ့် ဖန်တီးပါ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# အဆင့် 1: dev သို့ တပ်ဆင်ပါ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် 2: staging သို့ တပ်ဆင်ပါ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် 3: production အတွက် လက်ဖြင့် အတည်ပြုရမည်
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

# အဆင့်လိုက် တပ်ဆင်မှုကို ဆောင်ရွက်ပါ
./deploy-staged.sh
```

**အောင်မြင်မှု အချက်များ:**
- [ ] Dev ပတ်ဝန်းကျင်ကို အောင်မြင်စွာ ထည့်သွင်းနိုင်ရမည်
- [ ] Staging ပတ်ဝန်းကျင်ကို အောင်မြင်စွာ ထည့်သွင်းနိုင်ရမည်
- [ ] ထုတ်လုပ်ရေးအတွက် လက်မှတ် ခွင့်ပြုချက် လိုအပ်သည်
- [ ] အရာအားလုံးတွင် Health check များ လုပ်ငန်းဆောင်ခဲ့ရမည်
- [ ] လိုအပ်လျှင် ပြန်လှန်နိုင်ရမည်

### လေ့ကျင့်ခန်း ၄: ပြန်လှန်မှု မဟာဗျုဟာ (25 မိနစ်)
**ရည်ရွယ်ချက်**: Git ကို အသုံးပြု၍ ထည့်သွင်းမှု ပြန်လှန်ခြင်းကို တည်ဆောက်၍ စမ်းသပ်ခြင်း

```bash
# v1 ကို ဖြန့်ချိခြင်း
azd env set APP_VERSION "1.0.0"
azd up

# v1 commit hash ကို သိမ်းဆည်းခြင်း
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# အနှောင့်အယှက် ဖြစ်စေမည့် ပြောင်းလဲမှုပါရှိသည့် v2 ကို ဖြန့်ချိခြင်း
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ပြဿနာကို တွေ့ရှိပြီး နောက်သို့ ပြန်လုပ်ခြင်း
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ဖြင့် နောက်သို့ ပြန်လုပ်ခြင်း
    git revert HEAD --no-edit
    
    # ပတ်ဝန်းကျင်ကို နောက်သို့ ပြန်လုပ်ခြင်း
    azd env set APP_VERSION "1.0.0"
    
    # v1 ကို ထပ်မံ ဖြန့်ချိခြင်း
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**အောင်မြင်မှု အချက်များ:**
- [ ] ထည့်သွင်းမှု မအောင်မြင်မှုများကို ချက်ချင်း သိရှိနိုင်ရမည်
- [ ] ပြန်လှန်မှု script ကို အလိုအလျောက် လည်ပတ်စေခြင်း
- [ ] အပလီကေရှင်း ကို အလုပ်လုပ်နိုင်သည့် အခြေအနေသို့ ပြန်လည်ရောက်လာစေခြင်း
- [ ] ပြန်လှန်ပြီးနောက် Health check များ ဖြတ်ကျော်ရမည်

## 📊 ထည့်သွင်းမှု တိုင်းတာချက် လိုက်နာခြင်း

### သင့် ထည့်သွင်းမှု လုပ်ဆောင်ရည်ကို လိုက်နာခြင်း

```bash
# တပ်ဆင်မှု မက်ထရစ်များအတွက် စကရစ်ဖိုင် တစ်ခု ဖန်တီးပါ
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

# ဖိုင်ထဲသို့ မှတ်တမ်းတင်ပါ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ဒါကို အသုံးပြုပါ
./track-deployment.sh
```

**သင်၏ တိုင်းတာချက်များကို ချိတ်ဆက် စစ်ဆေးပါ:**
```bash
# ဖြန့်ချိမှုမှတ်တမ်း ကြည့်ရန်
cat deployment-metrics.csv

# ပျမ်းမျှ ဖြန့်ချိမှုအချိန်ကို တွက်ချက်ပါ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## အပိုဆောင်း အရင်းအမြစ်များ

- [Azure Developer CLI ထည့်သွင်းမှု ကိုးကားချက်](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service ထည့်သွင်းခြင်း](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps ထည့်သွင်းခြင်း](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions ထည့်သွင်းခြင်း](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**လမ်းညွှန်**
- **ယခင် မိနစ်**: [သင့် ပထမ ပရိုဂျက်](../chapter-01-foundation/first-project.md)
- **နောက်တစ်ခု မိနစ်**: [အရင်းအမြစ်များ ပံ့ပိုးခြင်း](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**အသိပေးချက်**:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းပါသော်လည်း၊ အလိုအလျော့ ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုလျော့ပါးမှုများ ရှိနိုင်ကြောင်း သတိပေးလိုပါသည်။ မူလဘာသာဖြင့် ရှိသော မူရင်းစာတမ်းကို တရားဝင် အချက်အလက်ရင်းမြစ်အဖြစ် သတ်မှတ်ထောင့်ထားသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်ကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုချိန်တွင် ဖြစ်ပေါ်နိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မမှန်ကန်သော ဖတ်ရှုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->