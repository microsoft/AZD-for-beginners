# تعیناتی کا رہنما - AZD تعیناتیوں میں مہارت حاصل کریں

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [ابتدائیوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 4 - بطور کوڈ انفراسٹرکچر اور تعیناتی
- **⬅️ پچھلا باب**: [باب 3: ترتیب](../chapter-03-configuration/configuration.md)
- **➡️ اگلا**: [وسائل کی فراہمی](provisioning.md)
- **🚀 اگلا باب**: [باب 5: ملٹی ایجنٹ AI حل](../../examples/retail-scenario.md)

## تعارف

یہ جامع رہنما Azure Developer CLI استعمال کرتے ہوئے ایپلیکیشنز کی تعیناتی کے بارے میں ہر وہ چیز کا احاطہ کرتا ہے جو آپ کو جاننے کی ضرورت ہے، بنیادی واحد کمانڈ تعیناتیوں سے لے کر جدید پیداوار کے منظرناموں تک جیسے کسٹم ہکس، متعدد ماحول، اور CI/CD انٹیگریشن۔ عملی مثالوں اور بہترین طریقوں کے ساتھ مکمل تعیناتی کے لائف سائیکل میں مہارت حاصل کریں۔

## سیکھنے کے مقاصد

اس رہنما کو مکمل کرنے سے آپ:
- تمام Azure Developer CLI تعیناتی کمانڈز اور ورک فلو میں مہارت حاصل کریں گے
- تعیناتی کے مکمل لائف سائیکل کو فراہمی سے مانیٹرنگ تک سمجھیں گے
- پیشگی اور بعد از تعیناتی آٹومیشن کے لیے کسٹم تعیناتی ہکس نافذ کریں گے
- مخصوص ماحول کے پیرامیٹرز کے ساتھ متعدد ماحول کو ترتیب دیں گے
- بلیو-گرین اور کینری تعیناتی سمیت جدید تعیناتی حکمت عملیاں سیٹ اپ کریں گے
- azd تعیناتیوں کو CI/CD پائپ لائنز اور DevOps ورک فلو میں ضم کریں گے

## سیکھنے کے نتائج

مکمل کرنے پر، آپ کر سکیں گے:
- تمام azd تعیناتی ورک فلو کو خود مختاری سے چلائیں اور مسائل حل کریں
- ہکس کے ذریعے کسٹم تعیناتی آٹومیشن ڈیزائن اور نافذ کریں
- مناسب سیکیورٹی اور مانیٹرنگ کے ساتھ پیداوار کے لیے تیار تعیناتیاں ترتیب دیں
- پیچیدہ ملٹی-ماحول تعیناتی منظرنامے سنبھالیں
- تعیناتی کی کارکردگی بہتر بنائیں اور رول بیک حکمت عملی نافذ کریں
- azd تعیناتیوں کو انٹرپرائز DevOps طریقوں میں ضم کریں

## تعیناتی کا جائزہ

Azure Developer CLI کئی تعیناتی کمانڈز فراہم کرتا ہے:
- `azd up` - مکمل ورک فلو (فراہم + تعیناتی)
- `azd provision` - صرف Azure وسائل بنائیں/اپ ڈیٹ کریں
- `azd deploy` - صرف ایپلیکیشن کوڈ تعینات کریں
- `azd package` - ایپلیکیشنز کو تعمیر اور پیکیج کریں

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
جب آپ کو صرف Azure وسائل کو اپ ڈیٹ کرنا ہو:
```bash
# بنیادی ڈھانچہ فراہم کریں/اپ ڈیٹ کریں
azd provision

# تبدیلیوں کا جائزہ لینے کے لیے خشک رن کے ساتھ فراہم کریں
azd provision --preview

# مخصوص خدمات فراہم کریں
azd provision --service database
```

### صرف کوڈ کی تعیناتی
جلدی اپ ڈیٹس کے لیے:
```bash
# تمام خدمات تعینات کریں
azd deploy

# متوقع نتیجہ:
# خدمات تعینات کی جارہی ہیں (azd deploy)
# - ویب: تعینات کیا جا رہا ہے... مکمل
# - API: تعینات کیا جا رہا ہے... مکمل
# کامیابی: آپ کی تعیناتی 2 منٹ 15 سیکنڈ میں مکمل ہو گئی

# مخصوص خدمت تعینات کریں
azd deploy --service web
azd deploy --service api

# حسب ضرورت بلڈ دلائل کے ساتھ تعینات کریں
azd deploy --service api --build-arg NODE_ENV=production

# تعیناتی کی تصدیق کریں
azd show --output json | jq '.services'
```

### ✅ تعیناتی کی تصدیق

کسی بھی تعیناتی کے بعد کامیابی کی تصدیق کریں:

```bash
# چیک کریں کہ تمام سروسز چل رہی ہیں
azd show

# صحت کے اینڈ پوائنٹس کا ٹیسٹ کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# غلطیوں کے لیے نگرانی کریں (ڈیفالٹ طور پر براؤزر میں کھلتا ہے)
azd monitor --logs
```

**کامیابی کے معیارات:**
- ✅ تمام خدمات "Running" اسٹیٹس دکھاتی ہیں
- ✅ ہیلتھ اینڈ پوائنٹس HTTP 200 واپس کرتے ہیں
- ✅ پچھلے 5 منٹ میں کوئی ایرر لاگز نہیں ہیں
- ✅ ایپلیکیشن ٹیسٹ درخواستوں کا جواب دیتا ہے

## 🏗️ تعیناتی کے عمل کو سمجھنا

### مرحلہ 1: پری-پروویژن ہکس
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
- نیٹ ورکنگ اور سیکیورٹی کو ترتیب دیتا ہے
- مانیٹرنگ اور لاگنگ سیٹ کرتا ہے

### مرحلہ 3: پوسٹ-پروویژن ہکس
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

### مرحلہ 4: ایپلیکیشن پیکیجنگ
- ایپلیکیشن کوڈ بناتا ہے
- تعیناتی آرٹیفیکٹس بناتا ہے
- ہدف پلیٹ فارم کے لیے پیکیج کرتا ہے (کنٹینرز، ZIP فائلز، وغیرہ)

### مرحلہ 5: پری-ڈیپلائے ہکس
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

### مرحلہ 6: ایپلیکیشن تعیناتی
- پیکیج کی گئی ایپلیکیشنز کو Azure خدمات پر تعینات کرتا ہے
- ترتیب کی ترتیبات کو اپ ڈیٹ کرتا ہے
- خدمات کو شروع/ری اسٹارٹ کرتا ہے

### مرحلہ 7: پوسٹ-ڈیپلائے ہکس
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

### سروس مخصوص تعیناتی کی ترتیبات
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

### ماحول مخصوص ترتیبیں
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

# نیلے ماحول کا ٹیسٹ کریں
./scripts/test-environment.sh production-blue

# نیلے کی طرف ٹریفک سوئچ کریں (دستی ڈی این ایس/لوڈ بیلینسر اپڈیٹ)
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

### ملٹی-اسٹیج Dockerfile کی بہتری
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

### سروس مخصوص تعیناتیاں
```bash
# تیزی سے تبدیلی کے لئے ایک مخصوص سروس تعینات کریں
azd deploy --service web
azd deploy --service api

# تمام خدمات تعینات کریں
azd deploy
```

### تعمیر کی کیشنگ
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### موثر کوڈ تعیناتیاں
```bash
# کوڈ کی صرف تبدیلیوں کے لیے azd deploy استعمال کریں (azd up نہیں)
# یہ انفرا اسٹرکچر کی فراہمی کو چھوڑ دیتا ہے اور بہت تیز ہے
azd deploy

# تیز ترین تکرار کے لیے مخصوص سروس کو ڈپلائے کریں
azd deploy --service api
```

## 🔍 تعیناتی کی نگرانی

### حقیقی وقت کی تعیناتی کی نگرانی
```bash
# درخواست کو حقیقی وقت میں مانیٹر کریں
azd monitor --live

# درخواست کے لاگز دیکھیں
azd monitor --logs

# تعیناتی کی حیثیت چیک کریں
azd show
```

### صحت کی جانچ
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

### رازوں کا انتظام
```bash
# خفیہ معلومات کو محفوظ طریقے سے ذخیرہ کریں
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml میں خفیہ معلومات کا حوالہ دیں
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

## 🚨 رول بیک حکمت عملیاں

### فوری رول بیک
```bash
# اے زی ڈی میں بلٹ ان رول بیک نہیں ہے۔ تجویز کردہ طریقے:

# آپشن 1: گٹ سے دوبارہ تعینات کریں (تجویز کردہ)
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
# تبدیلیوں کو لاگو کرنے سے پہلے انفراسٹرکچر کا جائزہ لیں
azd provision --preview

# انفراسٹرکچر رول بیک کے لیے، ورژن کنٹرول استعمال کریں:
git revert HEAD  # انفراسٹرکچر کی تبدیلیوں کو واپس کریں
azd provision    # پچھلی انفراسٹرکچر کی حالت لاگو کریں
```

### ڈیٹا بیس مائیگریشن رول بیک
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 تعیناتی کے میٹرکس

### تعیناتی کی کارکردگی کا پتہ لگائیں
```bash
# موجودہ تعیناتی کی حیثیت دیکھیں
azd show

# ایپلیکیشن انسائٹس کے ساتھ ایپلیکیشن کی نگرانی کریں
azd monitor --overview

# زندہ میٹرکس دیکھیں
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

### 1. ماحولیاتی تسلسل
```bash
# مستقل نام کاری استعمال کریں
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ماحولیاتی ہم آہنگی برقرار رکھیں
./scripts/sync-environments.sh
```

### 2. انفراسٹرکچر کی توثیق
```bash
# تعیناتی سے پہلے انفراسٹرکچر میں تبدیلیوں کا جائزہ لیں
azd provision --preview

# ARM/Bicep لنٹنگ استعمال کریں
az bicep lint --file infra/main.bicep

# Bicep کا کوئی بھی نحو چیک کریں
az bicep build --file infra/main.bicep
```

### 3. ٹیسٹنگ انٹیگریشن
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
# دستاویز کریں تعیناتی کے طریقہ کار
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## اگلے اقدامات

- [وسائل کی فراہمی](provisioning.md) - انفراسٹرکچر مینجمنٹ میں گہرائی سے مطالعہ  
- [تعیناتی سے پہلے کی منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md) - اپنی تعیناتی کی حکمت عملی تیار کریں  
- [عام مسائل](../chapter-07-troubleshooting/common-issues.md) - تعیناتی کے مسائل حل کریں  
- [بہترین طریقے](../chapter-07-troubleshooting/debugging.md) - پیداوار کے لیے تیار تعیناتی کی حکمت عملیاں

## 🎯 عملی تعیناتی کی مشقیں

### مشق 1: اضافی تعیناتی ورک فلو (20 منٹ)
**مقصد**: مکمل اور اضافی تعیناتی کے درمیان فرق میں مہارت حاصل کریں

```bash
# ابتدائی تعیناتی
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ابتدائی تعیناتی کا وقت ریکارڈ کریں
echo "Full deployment: $(date)" > deployment-log.txt

# کوڈ میں تبدیلی کریں
echo "// Updated $(date)" >> src/api/src/server.js

# صرف کوڈ تعینات کریں (تیز)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# اوقات کا موازنہ کریں
cat deployment-log.txt

# صفائی کریں
azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] مکمل تعیناتی 5-15 منٹ لے
- [ ] صرف کوڈ تعیناتی 2-5 منٹ لے
- [ ] کوڈ کی تبدیلیاں تعینات شدہ ایپ میں ظاہر ہوں
- [ ] `azd deploy` کے بعد انفراسٹرکچر بغیر تبدیلی کے رہے

**سیکھنے کا نتیجہ**: کوڈ تبدیلیوں کے لیے `azd deploy`، `azd up` سے 50-70٪ تیز ہے

### مشق 2: کسٹم تعیناتی ہکس (30 منٹ)
**مقصد**: پری اور پوسٹ تعیناتی آٹومیشن نافذ کریں

```bash
# پری-ڈپلائے ویلیڈیشن اسکرپٹ بنائیں
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# چیک کریں کہ ٹیسٹ پاس ہوتے ہیں
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# بغیر کمیٹ کیے گئے تبدیلیوں کی جانچ کریں
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# پوسٹ-ڈپلائے سمک ٹیسٹ بنائیں
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

# ہکس کے ساتھ ڈپلائمنٹ کی جانچ کریں
azd deploy
```

**کامیابی کے معیار:**
- [ ] پری-ڈیپلائے اسکرپٹ تعیناتی سے پہلے چلے
- [ ] اگر ٹیسٹ ناکام ہوجائیں تو تعیناتی منسوخ ہو جائے
- [ ] پوسٹ-ڈیپلائے سموک ٹیسٹ صحت کی تصدیق کرے
- [ ] ہکس صحیح ترتیب میں چلیں

### مشق 3: ملٹی-ماحول تعیناتی کی حکمت عملی (45 منٹ)
**مقصد**: مرحلہ وار تعیناتی ورک فلو نافذ کریں (dev → staging → production)

```bash
# تعیناتی کا اسکرپٹ بنائیں
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# مرحلہ 1: ڈیولپمنٹ میں تعینات کریں
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

# مرحلہ 3: پروڈکشن کے لیے دستی منظوری
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

# اسٹیجڈ تعیناتی چلائیں
./deploy-staged.sh
```

**کامیابی کے معیار:**
- [ ] dev ماحول کامیابی سے تعینات ہو
- [ ] staging ماحول کامیابی سے تعینات ہو
- [ ] پیداوار کے لیے دستی منظوری درکار ہو
- [ ] تمام ماحول میں صحت کے چیک کام کرتے ہوں
- [ ] ضرورت پڑنے پر واپس لوٹ سکیں

### مشق 4: رول بیک حکمت عملی (25 منٹ)
**مقصد**: Git استعمال کرکے تعیناتی کا رول بیک نافذ اور پرکھیں

```bash
# ورژن 1 کو ڈپلائی کریں
azd env set APP_VERSION "1.0.0"
azd up

# ورژن 1 کمیٹ ہیش کو محفوظ کریں
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# بریکنگ چینج کے ساتھ ورژن 2 کو ڈپلائی کریں
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ناکامی کا پتہ لگائیں اور رول بیک کریں
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # گٹ استعمال کرتے ہوئے رول بیک کریں
    git revert HEAD --no-edit
    
    # ماحول کا رول بیک کریں
    azd env set APP_VERSION "1.0.0"
    
    # ورژن 1 کو دوبارہ ڈپلائی کریں
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**کامیابی کے معیار:**
- [ ] تعیناتی کی ناکامیوں کا سراغ لگا سکیں
- [ ] رول بیک اسکرپٹ خودکار طریقے سے چلے
- [ ] ایپلیکیشن کام کرنے والی حالت میں واپس آئے
- [ ] رول بیک کے بعد ہیلتھ چیکس کامیاب ہوں

## 📊 تعیناتی کے میٹرکس کی نگرانی

### اپنی تعیناتی کی کارکردگی کو ٹریک کریں

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
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# فائل میں لاگ کریں
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# استعمال کریں اسے
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
- **پچھلا سبق**: [آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **اگلا سبق**: [وسائل کی فراہمی](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈسکلیمر**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کی کوشش کرتے ہیں، براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر یقینی باتیں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں معتبر ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والے کسی بھی غلط فہمی یا غلط تشریح کے لئے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->