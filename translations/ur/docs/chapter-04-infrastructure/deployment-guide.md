# تعیناتی گائیڈ - AZD تعیناتی میں مہارت حاصل کرنا

**باب کی نیویگیشن:**
- **📚 کورس ہوم:** [AZD برائے مبتدی](../../README.md)
- **📖 موجودہ باب:** باب 4 - انفراسٹرکچر از کوڈ اور تعیناتی
- **⬅️ پچھلا باب:** [باب 3: تشکیل](../chapter-03-configuration/configuration.md)
- **➡️ اگلا:** [وسائل کی تعیناتی](provisioning.md)
- **🚀 اگلا باب:** [باب 5: ملٹی ایجنٹ AI حل](../../examples/retail-scenario.md)

## تعارف

یہ جامع گائیڈ Azure Developer CLI کے استعمال سے ایپلیکیشنز کو تعینات کرنے کے لیے آپ کو جو کچھ جاننے کی ضرورت ہے، اس کا احاطہ کرتا ہے، بنیادی سنگل کمانڈ تعینات کاری سے لے کر کسٹم ہوکس، متعدد ماحول، اور CI/CD انضمام کے ساتھ ایڈوانس پروڈکشن منظرناموں تک۔ عملی مثالوں اور بہترین طریقوں کے ساتھ مکمل تعیناتی لائف سائیکل میں مہارت حاصل کریں۔

## سیکھنے کے اہداف

اس گائیڈ کو مکمل کرکے آپ:
- Azure Developer CLI کے تمام تعیناتی کمانڈز اور ورک فلوؤں میں مہارت حاصل کریں گے
- تعیناتی کے مکمل عمل کو پوہچنے سے مانیٹرنگ تک سمجھیں گے
- پری اور پوسٹ تعیناتی آٹومیشن کیلئے کسٹم تعیناتی هوکس نافذ کریں گے
- ماحول کے مخصوص پیرا میٹرز کے ساتھ متعدد ماحول کو ترتیب دیں گے
- بلو-گرین اور کینری تعیناتی سمیت ایڈوانسڈ تعیناتی حکمت عملی مرتب کریں گے
- azd تعیناتیوں کو CI/CD پائپلائنز اور DevOps ورک فلو کے ساتھ مربوط کریں گے

## سیکھنے کے نتائج

مکمل کرنے کے بعد، آپ قابل ہوں گے کہ:
- تمام azd تعیناتی ورک فلو کو خود مختاری سے چلائیں اور مسائل حل کریں
- ہوکس استعمال کرتے ہوئے کسٹم تعیناتی آٹومیشن ڈیزائن اور نافذ کریں
- مناسب سیکیورٹی اور مانیٹرنگ کے ساتھ پروڈکشن تیار تعیناتی مرتب کریں
- پیچیدہ ملٹی-ماحول تعیناتی منظرناموں کا انتظام کریں
- تعیناتی کی کارکردگی کو بہتر بنائیں اور رول بیک حکمت عملی نافذ کریں
- azd تعیناتیوں کو ادارہ جاتی DevOps طریقوں میں شامل کریں

## تعیناتی کا جائزہ

Azure Developer CLI کئی تعیناتی کمانڈز فراہم کرتا ہے:
- `azd up` - مکمل ورک فلو (پروویژن + تعیناتی)
- `azd provision` - صرف Azure وسائل بنائیں/اپ ڈیٹ کریں
- `azd deploy` - صرف ایپلیکیشن کوڈ تعینات کریں
- `azd package` - ایپلیکیشنز کو بلڈ اور پیکج کریں

## بنیادی تعیناتی ورک فلو

### مکمل تعیناتی (azd up)
نئے منصوبوں کے لیے سب سے عام ورک فلو:
```bash
# سب کچھ شروع سے تعینات کریں
azd up

# مخصوص ماحول کے ساتھ تعینات کریں
azd up --environment production

# حسب ضرورت پیرامیٹرز کے ساتھ تعینات کریں
azd up --parameter location=westus2 --parameter sku=P1v2
```

### صرف انفراسٹرکچر تعیناتی
جب آپ کو صرف Azure وسائل کو اپ ڈیٹ کرنے کی ضرورت ہو:
```bash
# انفراسٹرکچر فراہم کریں/اپ ڈیٹ کریں
azd provision

# تبدیلیوں کا پیش نظارہ کرنے کے لیے خشک تجربہ کے ساتھ فراہمی
azd provision --preview

# مخصوص خدمات فراہم کریں
azd provision --service database
```

### صرف کوڈ تعیناتی
تیز ایپلیکیشن اپ ڈیٹس کے لیے:
```bash
# تمام خدمات کو تعینات کریں
azd deploy

# متوقع نتیجہ:
# خدمات کی تعیناتی (azd deploy)
# - ویب: تعیناتی جاری ہے... مکمل
# - ای پی آئی: تعیناتی جاری ہے... مکمل
# کامیابی: آپ کی تعیناتی 2 منٹ 15 سیکنڈ میں مکمل ہو گئی

# مخصوص خدمت کی تعیناتی
azd deploy --service web
azd deploy --service api

# حسبِ ضرورت تعمیر کے دلائل کے ساتھ تعیناتی
azd deploy --service api --build-arg NODE_ENV=production

# تعیناتی کی تصدیق کریں
azd show --output json | jq '.services'
```

### ✅ تعیناتی کی تصدیق

کسی بھی تعیناتی کے بعد کامیابی کی تصدیق کریں:

```bash
# تمام خدمات کے چلنے کی جانچ کریں
azd show

# صحت کے نقاط کا ٹیسٹ کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# غلطیوں کی نگرانی کریں (براہِ راست براؤزر میں کھلتا ہے)
azd monitor --logs
```

**کامیابی کے معیار:**
- ✅ تمام سروسز کا "چل رہا ہے" اسٹیٹس دکھانا
- ✅ ہیلتھ اینڈ پوائنٹس HTTP 200 واپس کریں
- ✅ پچھلے 5 منٹ میں کوئی ایرر لاگز نہ ہوں
- ✅ ایپلیکیشن ٹیسٹ درخواستوں کا جواب دیتی ہو

## 🏗️ تعیناتی کے عمل کو سمجھنا

### مرحلہ 1: پری پروویژن هوکس
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

### مرحلہ 2: انفراسٹرکچر کی پروویژننگ
- انفراسٹرکچر ٹیمپلیٹس (Bicep/Terraform) پڑھتا ہے
- Azure وسائل بناتا یا اپ ڈیٹ کرتا ہے
- نیٹ ورکنگ اور سیکیورٹی کو ترتیب دیتا ہے
- مانیٹرنگ اور لاگنگ سیٹ اپ کرتا ہے

### مرحلہ 3: پوسٹ پروویژن هوکس
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
- تعیناتی آرتیفیکٹس بناتا ہے
- ہدف پلیٹ فارم کے لیے پیکجنگ کرتا ہے (کنٹینرز، ZIP فائلز، وغیرہ)

### مرحلہ 5: پری ڈپلائے هوکس
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
- پیکج کردہ ایپلیکیشنز کو Azure سروسز پر تعینات کرتا ہے
- کنفیگریشن سیٹنگز کو اپ ڈیٹ کرتا ہے
- سروسز کو شروع یا ری اسٹارٹ کرتا ہے

### مرحلہ 7: پوسٹ ڈپلائے هوکس
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

## 🎛️ تعیناتی کی ترتیب

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

### ماحول کے مخصوص ترتیبیں
```bash
# ترقیاتی ماحول
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# جائزہ لینے کا ماحول
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

## 🔧 ایڈوانس تعیناتی منظرنامے

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

### بلو-گرین تعیناتیاں
```bash
# نیلا ماحول بنائیں
azd env new production-blue
azd up --environment production-blue

# نیلے ماحول کا ٹیسٹ کریں
./scripts/test-environment.sh production-blue

# نیلے کی طرف ٹریفک سوئچ کریں (دستی DNS/لوڈ بیلنسر اپڈیٹ)
./scripts/switch-traffic.sh production-blue

# سبز ماحول کی صفائی کریں
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
#!/بن/بش
# تعیناتی-مرحلہ.sh

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

## 🐳 کنٹینر کی تعیناتیاں

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

### ملٹی-اسٹیج Dockerfile آپٹیمائزیشن
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

## ⚡ کارکردگی کی بہتری

### سروس کے مخصوص تعیناتیاں
```bash
# تیز رفتار تکرار کے لیے مخصوص سروس تعینات کریں
azd deploy --service web
azd deploy --service api

# تمام خدمات تعینات کریں
azd deploy
```

### بلڈ کیشنگ
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### مؤثر کوڈ تعیناتیاں
```bash
# صرف کوڈ کی تبدیلیوں کے لیے azd deploy استعمال کریں (azd up نہیں)
# یہ بنیادی ڈھانچے کی فراہمی کو چھوڑ دیتا ہے اور کہیں زیادہ تیز ہے
azd deploy

# تیز ترین تکرار کے لیے مخصوص سروس کو تعینات کریں
azd deploy --service api
```

## 🔍 تعیناتی کی مانیٹرنگ

### حقیقی وقت کی تعیناتی مانیٹرنگ
```bash
# درخواست کو حقیقی وقت میں مانیٹر کریں
azd monitor --live

# درخواست کے لاگز دیکھیں
azd monitor --logs

# تعیناتی کی حیثیت چیک کریں
azd show
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

### تعیناتی کے بعد کی تصدیق
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ایپلیکیشن کی صحت چیک کریں
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

## 🔐 سیکیورٹی کے پہلو

### سیکرٹس کی مدیریت
```bash
# رازوں کو محفوظ طریقے سے ذخیرہ کریں
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml میں رازوں کا حوالہ دیں
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

### تیز رول بیک
```bash
# AZD میں بلٹ ان رول بیک شامل نہیں ہے۔ سفارش کردہ طریقے:

# آپشن 1: Git سے دوبارہ تعیناتی (سفارش کی گئی)
git revert HEAD  # مسئلہ پیدا کرنے والی کمیٹ کو واپس کریں
git push
azd deploy

# آپشن 2: مخصوص کمیٹ کو دوبارہ تعینات کریں
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### انفراسٹرکچر رول بیک
```bash
# تبدیل کرنے سے پہلے انفراسٹرکچر کی تبدیلیوں کا پیش نظارہ کریں
azd provision --preview

# انفراسٹرکچر کو واپس پلٹانے کے لئے، ورژن کنٹرول استعمال کریں:
git revert HEAD  # انفراسٹرکچر کی تبدیلیوں کو واپس کریں
azd provision    # پچھلی انفراسٹرکچر حالت کو نافذ کریں
```

### ڈیٹابیس مائیگریشن رول بیک
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 تعیناتی میٹرکس

### تعیناتی کی کارکردگی کا تعاقب کریں
```bash
# موجودہ تنصیب کی حالت دیکھیں
azd show

# ایپلیکیشن انسائٹس کے ساتھ ایپلیکیشن کی نگرانی کریں
azd monitor --overview

# لائیو میٹرکس دیکھیں
azd monitor --live
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

### 1. ماحول کی مطابقت
```bash
# یکساں ناموں کا استعمال کریں
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ماحول کی ہم آہنگی برقرار رکھیں
./scripts/sync-environments.sh
```

### 2. انفراسٹرکچر کی توثیق
```bash
# تعیناتی سے پہلے انفراسٹرکچر کی تبدیلیوں کا پیش نظارہ کریں
azd provision --preview

# ARM/Bicep لینٹنگ کا استعمال کریں
az bicep lint --file infra/main.bicep

# Bicep نحو کی توثیق کریں
az bicep build --file infra/main.bicep
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
# دستاویز تعیناتی کے طریقہ کار
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## اگلے اقدامات

- [وسائل کی تعیناتی](provisioning.md) - انفراسٹرکچر مینجمنٹ میں گہرائی سے جائزہ
- [پری-ڈپلائے منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md) - اپنی تعیناتی حکمت عملی منصوبہ بنائیں
- [عام مسائل](../chapter-07-troubleshooting/common-issues.md) - تعیناتی کے مسائل حل کریں
- [بہترین طریقے](../chapter-07-troubleshooting/debugging.md) - پروڈکشن تیار تعیناتی حکمت عملی

## 🎯 عملی تعیناتی مشقیں

### مشق 1: انکریمنٹل تعیناتی ورک فلو (20 منٹ)
**مقصد:** مکمل اور انکریمنٹل تعیناتیوں میں فرق میں مہارت حاصل کریں

```bash
# ابتدائی نفاذ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ابتدائی نفاذ کا وقت ریکارڈ کریں
echo "Full deployment: $(date)" > deployment-log.txt

# کوڈ میں تبدیلی کریں
echo "// Updated $(date)" >> src/api/src/server.js

# صرف کوڈ نافذ کریں (تیز)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# اوقات کا موازنہ کریں
cat deployment-log.txt

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] مکمل تعیناتی 5-15 منٹ لیتی ہے
- [ ] صرف کوڈ تعیناتی 2-5 منٹ لیتی ہے
- [ ] کوڈ کی تبدیلیاں تعینات ایپ میں ظاہر ہوں
- [ ] `azd deploy` کے بعد انفراسٹرکچر بغیر تبدیلی کے رہے

**سیکھنے کا نتیجہ:** کوڈ کی تبدیلیوں کے لیے `azd deploy`، `azd up` کی نسبت 50-70% تیز ہے

### مشق 2: کسٹم تعیناتی هوکس (30 منٹ)
**مقصد:** پری اور پوسٹ تعیناتی خودکار عمل درآمد نافذ کریں

```bash
# پری-ڈیپلائے ویلیڈیشن اسکرپٹ بنائیں
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# چیک کریں کہ ٹیسٹ پاس ہوتے ہیں
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ان کمیٹڈ تبدیلیوں کے لیے چیک کریں
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# پوسٹ-ڈیپلائے سموک ٹیسٹ بنائیں
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

# azure.yaml میں ہُکس شامل کریں
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ہُکس کے ساتھ ڈیپلائیمنٹ کا ٹیسٹ کریں
azd deploy
```

**کامیابی کے معیار:**
- [ ] پری ڈپلائے اسکرپٹ تعیناتی سے پہلے چلتا ہے
- [ ] اگر ٹیسٹ ناکام ہوں تو تعیناتی منسوخ ہوجائے
- [ ] پوسٹ ڈپلائے سمک ٹیسٹ صحت کی تصدیق کرتا ہے
- [ ] هوکس درست ترتیب میں چلائے جائیں

### مشق 3: ملٹی-ماحول تعیناتی حکمت عملی (45 منٹ)
**مقصد:** مرحلہ وار تعیناتی ورک فلو نافذ کریں (ڈیولپ → اسٹیجنگ → پروڈکشن)

```bash
# تعیناتی اسکرپٹ بنائیں
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# مرحلہ 1: ترقی میں تعینات کریں
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحلہ 2: اسٹیجنگ میں تعینات کریں
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحلہ 3: پیداواری کے لئے دستی منظوری
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

# ماحولیات بنائیں
azd env new dev
azd env new staging
azd env new production

# مرحلہ وار تعیناتی چلائیں
./deploy-staged.sh
```

**کامیابی کے معیار:**
- [ ] ڈیولپ ماحول کامیابی سے تعینات ہو
- [ ] اسٹیجنگ ماحول کامیابی سے تعینات ہو
- [ ] پروڈکشن کے لیے دستی منظوری درکار ہو
- [ ] تمام ماحولوں میں کام کرنے والے ہیلتھ چیکس ہوں
- [ ] ضرورت پڑنے پر رول بیک کیا جا سکتا ہو

### مشق 4: رول بیک حکمت عملی (25 منٹ)
**مقصد:** Git استعمال کرکے تعیناتی کا رول بیک نافذ اور ٹیسٹ کریں

```bash
# تعینات کریں v1
azd env set APP_VERSION "1.0.0"
azd up

# v1 کمیٹ ہیش محفوظ کریں
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# توڑ پھوڑ والی تبدیلی کے ساتھ v2 تعینات کریں
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ناکامی کا پتہ لگائیں اور پچھلی حالت پر لوٹ جائیں
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # گٹ کا استعمال کرتے ہوئے پچھلی حالت پر واپس جائیں
    git revert HEAD --no-edit
    
    # ماحول کی پچھلی حالت پر واپس آنا
    azd env set APP_VERSION "1.0.0"
    
    # v1 دوبارہ تعینات کریں
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**کامیابی کے معیار:**
- [ ] تعیناتی کی ناکامیوں کی نشاندہی کر سکتا ہو
- [ ] رول بیک اسکرپٹ خودکار طور پر چلتا ہو
- [ ] ایپلیکیشن کام کرنے والی حالت میں واپس آئے
- [ ] رول بیک کے بعد ہیلتھ چیکس پاس ہوں

## 📊 تعیناتی میٹرکس کا تعاقب

### اپنی تعیناتی کی کارکردگی کا جائزہ لیں

```bash
# تعیناتی کے میٹرکس کا اسکرپٹ بنائیں
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

# اوسط تعیناتی کا وقت حساب کریں
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## اضافی وسائل

- [Azure Developer CLI تعیناتی حوالہ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service تعیناتی](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps تعیناتی](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions تعیناتی](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**نیویگیشن**
- **پچھلا سبق:** [آپ کا پہلا منصوبہ](../chapter-01-foundation/first-project.md)
- **اگلا سبق:** [وسائل کی تعیناتی](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:  
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ اگرچہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم آگاہ رہیں کہ خودکار تراجم میں غلطیاں یا عدم مطابقت ہو سکتی ہے۔ اصل دستاویز اپنی مادری زبان میں مستند ماخذ سمجھا جانا چاہیے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمہ کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تعبیرات کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->