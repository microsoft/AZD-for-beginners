# تعیناتی گائیڈ - AZD تعیناتیوں میں مہارت حاصل کریں

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [AZD ابتدائیوں کے لیے](../../README.md)
- **📖 موجودہ باب**: باب 4 - کوڈ اور تعیناتی کے طور پر انفراسٹرکچر
- **⬅️ پچھلا باب**: [باب 3: کنفیگریشن](../getting-started/configuration.md)
- **➡️ اگلا**: [وسائل کی فراہمی](provisioning.md)
- **🚀 اگلا باب**: [باب 5: ملٹی ایجنٹ AI حل](../../examples/retail-scenario.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI کے ذریعے ایپلیکیشنز کی تعیناتی کے بارے میں سب کچھ شامل کرتی ہے، بنیادی سنگل کمانڈ تعیناتیوں سے لے کر پروڈکشن کے پیچیدہ منظرناموں تک، جن میں کسٹم ہکس، متعدد ماحول، اور CI/CD انضمام شامل ہیں۔ عملی مثالوں اور بہترین طریقوں کے ساتھ مکمل تعیناتی کے لائف سائیکل میں مہارت حاصل کریں۔

## سیکھنے کے اہداف

اس گائیڈ کو مکمل کرنے کے بعد، آپ:
- Azure Developer CLI تعیناتی کمانڈز اور ورک فلو میں مہارت حاصل کریں گے
- تعیناتی کے مکمل لائف سائیکل کو فراہمی سے مانیٹرنگ تک سمجھیں گے
- پری اور پوسٹ تعیناتی آٹومیشن کے لیے کسٹم ہکس نافذ کریں گے
- ماحول کے مخصوص پیرامیٹرز کے ساتھ متعدد ماحول کو ترتیب دیں گے
- بلیو-گرین اور کینری تعیناتی سمیت جدید تعیناتی حکمت عملی ترتیب دیں گے
- azd تعیناتیوں کو CI/CD پائپ لائنز اور DevOps ورک فلو میں ضم کریں گے

## سیکھنے کے نتائج

گائیڈ مکمل کرنے کے بعد، آپ:
- azd تعیناتی ورک فلو کو خود مختاری سے انجام دیں گے اور ان میں خرابیوں کو دور کریں گے
- کسٹم تعیناتی آٹومیشن کو ہکس کے ذریعے ڈیزائن اور نافذ کریں گے
- مناسب سیکیورٹی اور مانیٹرنگ کے ساتھ پروڈکشن کے لیے تیار تعیناتی ترتیب دیں گے
- پیچیدہ ملٹی ماحول تعیناتی منظرناموں کا انتظام کریں گے
- تعیناتی کی کارکردگی کو بہتر بنائیں گے اور رول بیک حکمت عملی نافذ کریں گے
- azd تعیناتیوں کو انٹرپرائز DevOps طریقوں میں ضم کریں گے

## تعیناتی کا جائزہ

Azure Developer CLI کئی تعیناتی کمانڈز فراہم کرتا ہے:
- `azd up` - مکمل ورک فلو (فراہم + تعیناتی)
- `azd provision` - صرف Azure وسائل بنائیں/اپ ڈیٹ کریں
- `azd deploy` - صرف ایپلیکیشن کوڈ تعینات کریں
- `azd package` - ایپلیکیشنز کو بنائیں اور پیک کریں

## بنیادی تعیناتی ورک فلو

### مکمل تعیناتی (azd up)
نئے پروجیکٹس کے لیے سب سے عام ورک فلو:
```bash
# سب کچھ شروع سے تعینات کریں
azd up

# مخصوص ماحول کے ساتھ تعینات کریں
azd up --environment production

# حسب ضرورت پیرامیٹرز کے ساتھ تعینات کریں
azd up --parameter location=westus2 --parameter sku=P1v2
```

### صرف انفراسٹرکچر کی تعیناتی
جب آپ کو صرف Azure وسائل کو اپ ڈیٹ کرنے کی ضرورت ہو:
```bash
# انفراسٹرکچر فراہم کریں/اپ ڈیٹ کریں
azd provision

# تبدیلیوں کا پیش نظارہ کرنے کے لیے ڈرائی رن کے ساتھ فراہم کریں
azd provision --preview

# مخصوص خدمات فراہم کریں
azd provision --service database
```

### صرف کوڈ کی تعیناتی
تیز ایپلیکیشن اپ ڈیٹس کے لیے:
```bash
# تمام سروسز کو تعینات کریں
azd deploy

# متوقع نتیجہ:
# سروسز کو تعینات کرنا (azd deploy)
# - ویب: تعینات ہو رہا ہے... مکمل
# - ایپ آئی: تعینات ہو رہا ہے... مکمل
# کامیابی: آپ کی تعیناتی 2 منٹ 15 سیکنڈ میں مکمل ہوئی

# مخصوص سروس کو تعینات کریں
azd deploy --service web
azd deploy --service api

# حسب ضرورت تعمیر دلائل کے ساتھ تعینات کریں
azd deploy --service api --build-arg NODE_ENV=production

# تعیناتی کی تصدیق کریں
azd show --output json | jq '.services'
```

### ✅ تعیناتی کی تصدیق

کسی بھی تعیناتی کے بعد، کامیابی کی تصدیق کریں:

```bash
# تمام سروسز کے چلنے کی تصدیق کریں
azd show

# صحت کے اختتامی نکات کی جانچ کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# غلطیوں کے لیے لاگز چیک کریں
azd logs --service api --since 5m | grep -i error
```

**کامیابی کے معیار:**
- ✅ تمام سروسز "Running" اسٹیٹس دکھائیں
- ✅ ہیلتھ اینڈ پوائنٹس HTTP 200 واپس کریں
- ✅ آخری 5 منٹ میں کوئی ایرر لاگز نہ ہوں
- ✅ ایپلیکیشن ٹیسٹ درخواستوں کا جواب دے

## 🏗️ تعیناتی کے عمل کو سمجھنا

### مرحلہ 1: پری-فراہم ہکس
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

### مرحلہ 2: انفراسٹرکچر کی فراہمی
- انفراسٹرکچر ٹیمپلیٹس (Bicep/Terraform) پڑھتا ہے
- Azure وسائل بناتا یا اپ ڈیٹ کرتا ہے
- نیٹ ورکنگ اور سیکیورٹی ترتیب دیتا ہے
- مانیٹرنگ اور لاگنگ سیٹ اپ کرتا ہے

### مرحلہ 3: پوسٹ-فراہم ہکس
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

### مرحلہ 4: ایپلیکیشن پیکجنگ
- ایپلیکیشن کوڈ بناتا ہے
- تعیناتی آرٹفیکٹس بناتا ہے
- ہدف پلیٹ فارم کے لیے پیک کرتا ہے (کنٹینرز، ZIP فائلز، وغیرہ)

### مرحلہ 5: پری-تعیناتی ہکس
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

### مرحلہ 6: ایپلیکیشن کی تعیناتی
- پیک شدہ ایپلیکیشنز کو Azure سروسز پر تعینات کرتا ہے
- کنفیگریشن سیٹنگز اپ ڈیٹ کرتا ہے
- سروسز کو شروع/دوبارہ شروع کرتا ہے

### مرحلہ 7: پوسٹ-تعیناتی ہکس
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

## 🎛️ تعیناتی کی کنفیگریشن

### سروس کے مخصوص تعیناتی سیٹنگز
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

### ماحول کے مخصوص کنفیگریشنز
```bash
# ترقیاتی ماحول
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# اسٹیجنگ ماحول
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# پیداواری ماحول
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 جدید تعیناتی منظرنامے

### ملٹی سروس ایپلیکیشنز
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

### بلیو-گرین تعیناتیاں
```bash
# نیلا ماحول بنائیں
azd env new production-blue
azd up --environment production-blue

# نیلا ماحول آزمائیں
./scripts/test-environment.sh production-blue

# ٹریفک کو نیلے پر منتقل کریں (دستی DNS/لوڈ بیلینسر اپ ڈیٹ)
./scripts/switch-traffic.sh production-blue

# سبز ماحول کو صاف کریں
azd env select production-green
azd down --force
```

### کینری تعیناتیاں
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

### مرحلہ وار تعیناتیاں
```bash
#!/bin/bash
# تعینات-مرحلہ وار.sh

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

## 🐳 کنٹینر تعیناتیاں

### کنٹینر ایپ تعیناتیاں
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

### ملٹی اسٹیج Dockerfile کی اصلاح
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

## ⚡ کارکردگی کی اصلاح

### متوازی تعیناتیاں
```bash
# متوازی تعیناتی ترتیب دیں
azd config set deploy.parallelism 5

# خدمات کو متوازی طور پر تعینات کریں
azd deploy --parallel
```

### بلڈ کیشنگ
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

### انکریمنٹل تعیناتیاں
```bash
# صرف تبدیل شدہ سروسز کو نافذ کریں
azd deploy --incremental

# تبدیلی کی شناخت کے ساتھ نافذ کریں
azd deploy --detect-changes
```

## 🔍 تعیناتی کی مانیٹرنگ

### ریئل ٹائم تعیناتی کی مانیٹرنگ
```bash
# تعیناتی کی پیشرفت کی نگرانی کریں
azd deploy --follow

# تعیناتی کے لاگز دیکھیں
azd logs --follow --service api

# تعیناتی کی حیثیت چیک کریں
azd show --service api
```

### ہیلتھ چیکس
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

### پوسٹ-تعیناتی کی توثیق
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ایپلیکیشن کی صحت کو چیک کریں
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

## 🔐 سیکیورٹی کے تحفظات

### رازوں کا انتظام
```bash
# رازوں کو محفوظ طریقے سے ذخیرہ کریں
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# رازوں کو azure.yaml میں حوالہ دیں
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

### نیٹ ورک سیکیورٹی
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### شناخت اور رسائی کا انتظام
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

## 🚨 رول بیک حکمت عملی

### فوری رول بیک
```bash
# پچھلے تعیناتی پر واپس جائیں
azd deploy --rollback

# مخصوص سروس پر واپس جائیں
azd deploy --service api --rollback

# مخصوص ورژن پر واپس جائیں
azd deploy --service api --version v1.2.3
```

### انفراسٹرکچر رول بیک
```bash
# بنیادی ڈھانچے کی تبدیلیوں کو واپس کریں
azd provision --rollback

# واپس کی گئی تبدیلیوں کا پیش نظارہ کریں
azd provision --rollback --preview
```

### ڈیٹا بیس مائیگریشن رول بیک
```bash
#!/bin/bash
# اسکرپٹس/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 تعیناتی میٹرکس

### تعیناتی کی کارکردگی کو ٹریک کریں
```bash
# تعیناتی میٹرکس کو فعال کریں
azd config set telemetry.deployment.enabled true

# تعیناتی کی تاریخ دیکھیں
azd history

# تعیناتی کے اعدادوشمار حاصل کریں
azd metrics --type deployment
```

### کسٹم میٹرکس کلیکشن
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

## 🎯 بہترین طریقے

### 1. ماحول کی مستقل مزاجی
```bash
# مستقل نام رکھنے کا استعمال کریں
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ماحول کی برابری کو برقرار رکھیں
./scripts/sync-environments.sh
```

### 2. انفراسٹرکچر کی توثیق
```bash
# تعیناتی سے پہلے تصدیق کریں
azd provision --preview
azd provision --what-if

# ARM/Bicep لنٹنگ استعمال کریں
az bicep lint --file infra/main.bicep
```

### 3. ٹیسٹنگ انضمام
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

### 4. دستاویزات اور لاگنگ
```bash
# تعیناتی کے طریقہ کار کو دستاویز کریں
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## اگلے مراحل

- [وسائل کی فراہمی](provisioning.md) - انفراسٹرکچر مینجمنٹ میں گہرائی سے غوطہ لگائیں
- [پری-تعیناتی منصوبہ بندی](../pre-deployment/capacity-planning.md) - اپنی تعیناتی حکمت عملی کی منصوبہ بندی کریں
- [عام مسائل](../troubleshooting/common-issues.md) - تعیناتی کے مسائل حل کریں
- [بہترین طریقے](../troubleshooting/debugging.md) - پروڈکشن کے لیے تیار تعیناتی حکمت عملی

## 🎯 عملی تعیناتی مشقیں

### مشق 1: انکریمنٹل تعیناتی ورک فلو (20 منٹ)
**مقصد**: مکمل اور انکریمنٹل تعیناتیوں کے فرق کو سمجھیں

```bash
# ابتدائی تعیناتی
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ابتدائی تعیناتی وقت ریکارڈ کریں
echo "Full deployment: $(date)" > deployment-log.txt

# کوڈ میں تبدیلی کریں
echo "// Updated $(date)" >> src/api/src/server.js

# صرف کوڈ تعینات کریں (تیز)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# وقت کا موازنہ کریں
cat deployment-log.txt

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] مکمل تعیناتی میں 5-15 منٹ لگتے ہیں
- [ ] صرف کوڈ کی تعیناتی میں 2-5 منٹ لگتے ہیں
- [ ] کوڈ کی تبدیلیاں تعینات ایپ میں ظاہر ہوتی ہیں
- [ ] انفراسٹرکچر `azd deploy` کے بعد غیر تبدیل شدہ رہتا ہے

**سیکھنے کا نتیجہ**: کوڈ کی تبدیلیوں کے لیے `azd deploy` `azd up` کے مقابلے میں 50-70% تیز ہے

### مشق 2: کسٹم تعیناتی ہکس (30 منٹ)
**مقصد**: پری اور پوسٹ-تعیناتی آٹومیشن نافذ کریں

```bash
# پری ڈپلائے ویلیڈیشن اسکرپٹ بنائیں
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# چیک کریں کہ ٹیسٹ پاس ہوتے ہیں
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# غیر کمیٹ شدہ تبدیلیوں کو چیک کریں
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# پوسٹ ڈپلائے اسموک ٹیسٹ بنائیں
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

# azure.yaml میں ہکس شامل کریں
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ہکس کے ساتھ ڈپلائے منتحن کریں
azd deploy
```

**کامیابی کے معیار:**
- [ ] پری-تعیناتی اسکرپٹ تعیناتی سے پہلے چلتا ہے
- [ ] اگر ٹیسٹ ناکام ہوں تو تعیناتی منسوخ ہو جاتی ہے
- [ ] پوسٹ-تعیناتی اسموک ٹیسٹ صحت کی توثیق کرتا ہے
- [ ] ہکس صحیح ترتیب میں چلتے ہیں

### مشق 3: ملٹی ماحول تعیناتی حکمت عملی (45 منٹ)
**مقصد**: مرحلہ وار تعیناتی ورک فلو نافذ کریں (dev → staging → production)

```bash
# تعیناتی اسکرپٹ بنائیں
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# مرحلہ 1: ڈیولپمنٹ پر تعینات کریں
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحلہ 2: اسٹیجنگ پر تعینات کریں
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحلہ 3: پروڈکشن کے لئے دستی منظوری
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

# ماحول بنائیں
azd env new dev
azd env new staging
azd env new production

# مرحلہ وار تعیناتی چلائیں
./deploy-staged.sh
```

**کامیابی کے معیار:**
- [ ] dev ماحول کامیابی سے تعینات ہوتا ہے
- [ ] staging ماحول کامیابی سے تعینات ہوتا ہے
- [ ] پروڈکشن کے لیے دستی منظوری درکار ہے
- [ ] تمام ماحول کام کرنے والے ہیلتھ چیکس رکھتے ہیں
- [ ] ضرورت پڑنے پر رول بیک کر سکتے ہیں

### مشق 4: رول بیک حکمت عملی (25 منٹ)
**مقصد**: تعیناتی رول بیک نافذ کریں اور ٹیسٹ کریں

```bash
# v1 تعین کریں
azd env set APP_VERSION "1.0.0"
azd up

# v1 ترتیب محفوظ کریں
cp -r .azure/production .azure/production-v1-backup

# v2 تعین کریں جس میں تبدیلی ہو
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# ناکامی کا پتہ لگائیں
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # کوڈ واپس پلٹائیں
    git checkout src/api/src/server.js
    
    # ماحول واپس پلٹائیں
    azd env set APP_VERSION "1.0.0"
    
    # v1 دوبارہ تعین کریں
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**کامیابی کے معیار:**
- [ ] تعیناتی کی ناکامیوں کا پتہ لگا سکتے ہیں
- [ ] رول بیک اسکرپٹ خود بخود چلتا ہے
- [ ] ایپلیکیشن کام کرنے والی حالت میں واپس آتی ہے
- [ ] رول بیک کے بعد ہیلتھ چیکس پاس کرتے ہیں

## 📊 تعیناتی میٹرکس ٹریکنگ

### اپنی تعیناتی کی کارکردگی کو ٹریک کریں

```bash
# تعیناتی میٹرکس اسکرپٹ بنائیں
cat > track-deployment.sh << 'EOF'
#!/بن/بش
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

# فائل میں لاگ کریں
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# اسے استعمال کریں
./track-deployment.sh
```

**اپنے میٹرکس کا تجزیہ کریں:**
```bash
# تعیناتی کی تاریخ دیکھیں
cat deployment-metrics.csv

# اوسط تعیناتی وقت کا حساب لگائیں
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## اضافی وسائل

- [Azure Developer CLI تعیناتی حوالہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service تعیناتی](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps تعیناتی](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions تعیناتی](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**نیویگیشن**
- **پچھلا سبق**: [آپ کا پہلا پروجیکٹ](../getting-started/first-project.md)
- **اگلا سبق**: [وسائل کی فراہمی](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ لاتعلقی**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->