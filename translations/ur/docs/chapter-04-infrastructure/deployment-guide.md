# تعیناتی کی رہنمائی - AZD تعیناتیوں میں مہارت حاصل کرنا

**باب کی رہنمائی:**
- **📚 کورس کا ہوم**: [AZD برائے مبتدی](../../README.md)
- **📖 موجودہ باب**: باب 4 - انفراسٹرکچر بطور کوڈ اور تعیناتی
- **⬅️ پچھلا باب**: [باب 3: تشکیل](../chapter-03-configuration/configuration.md)
- **➡️ اگلا**: [وسائل کی فراہمی](provisioning.md)
- **🧩 اسی باب میں**: [اپنا مخصوص ٹیمپلیٹ بنانا](custom-templates.md)
- **🚀 اگلا باب**: [باب 5: کثیر ایجنٹ AI حل](../../examples/retail-scenario.md)

## تعارف

یہ جامع رہنما Azure Developer CLI استعمال کرتے ہوئے ایپلیکیشنز کی تعیناتی کے بارے میں تمام ضروری معلومات فراہم کرتا ہے، بنیادی ایک کمانڈ تعیناتی سے لے کر کسٹم ہُکس، متعدد ماحول، اور CI/CD انٹیگریشن کے ساتھ جدید پیداوار کے مناظر تک۔ عملی مثالوں اور بہترین طریقوں کے ساتھ مکمل تعیناتی کے دوران زندگی کا دورانیہ سیکھیں۔

## سیکھنے کے اہداف

اس رہنما کو مکمل کرنے کے بعد آپ:
- Azure Developer CLI کے تمام تعیناتی کمانڈز اور ورک فلو میں مہارت حاصل کریں گے
- تعیناتی کے پورے عمل کو فراہمی سے مانیٹرنگ تک سمجھیں گے
- تعیناتی سے پہلے اور بعد کی خودکار کاری کے لیے کسٹم ہکس نافذ کریں گے
- ماحول مخصوص پیرامیٹرز کے ساتھ متعدد ماحول ترتیب دیں گے
- ترقی یافتہ تعیناتی کی حکمت عملیاں جیسے بلیو-گرین اور کینیری تعیناتی ترتیب دیں گے
- azd تعیناتیاں CI/CD پائپ لائنز اور ڈی وُوپس ورک فلو کے ساتھ ضم کریں گے

## سیکھنے کے نتائج

مکمل کرنے پر، آپ کر سکیں گے:
- تمام azd تعیناتی ورک فلو کو خود مختاری سے چلانا اور مسائل حل کرنا
- ہکس استعمال کرتے ہوئے کسٹم تعیناتی خودکار کاری ڈیزائن اور نافذ کرنا
- مناسب سیکیورٹی اور نگرانی کے ساتھ پیداوار کے لیے تیار تعیناتیاں ترتیب دینا
- پیچیدہ کثیر ماحول تعیناتی مناظر کا انتظام کرنا
- تعیناتی کی کارکردگی کو بہتر بنانا اور رول بیک حکمت عملی نافذ کرنا
- azd تعیناتیوں کو اینٹرپرائز ڈی وُوپس طریقوں میں شامل کرنا

## تعیناتی کا جائزہ

Azure Developer CLI چند تعیناتی کمانڈز فراہم کرتا ہے:
- `azd up` - مکمل ورک فلو (فراہم + تعینات)
- `azd provision` - صرف Azure وسائل بنائیں/اپڈیٹ کریں
- `azd deploy` - صرف ایپلیکیشن کوڈ تعینات کریں
- `azd package` - ایپلیکیشنز بنائیں اور پیکیج کریں

## بنیادی تعیناتی ورک فلو

### مکمل تعیناتی (azd up)
نئے پروجیکٹس کے لیے سب سے عام ورک فلو:
```bash
# سب کچھ صفر سے تعینات کریں
azd up

# مخصوص ماحول کے ساتھ تعینات کریں
azd up --environment production

# کسٹم پیرامیٹرز کے ساتھ تعینات کریں
azd up --parameter location=westus2 --parameter sku=P1v2
```

### صرف انفراسٹرکچر تعیناتی
جب آپ کو صرف Azure وسائل اپڈیٹ کرنے کی ضرورت ہو:
```bash
# انفراسٹرکچر فراہم کریں/اپ ڈیٹ کریں
azd provision

# تبدیلیوں کا جائزہ لینے کے لیے ڈرائی رن کے ساتھ فراہم کریں
azd provision --preview

# مخصوص خدمات فراہم کریں
azd provision --service database
```

### صرف کوڈ تعیناتی
تیز ایپلیکیشن اپڈیٹس کے لیے:
```bash
# تمام خدمات کو تعینات کریں
azd deploy

# متوقع نتیجہ:
# خدمات کو تعینات کر رہے ہیں (azd تعینات کریں)
# - ویب: تعینات کر رہے ہیں... مکمل
# - ای پی آی: تعینات کر رہے ہیں... مکمل
# کامیابی: آپ کی تعیناتی 2 منٹ 15 سیکنڈ میں مکمل ہو گئی

# مخصوص خدمت کو تعینات کریں
azd deploy --service web
azd deploy --service api

# کسٹم بلڈ آرگیومنٹس کے ساتھ تعینات کریں
azd deploy --service api --build-arg NODE_ENV=production

# تعیناتی کی تصدیق کریں
azd show --output json | jq '.services'
```

### ✅ تعیناتی کی تصدیق

کسی بھی تعیناتی کے بعد کامیابی کی تصدیق کریں:

```bash
# چیک کریں کہ تمام خدمات چل رہی ہیں
azd show

# ہیلتھ اینڈ پوائنٹس کی جانچ کریں
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# غلطیوں کی نگرانی کریں (ڈیفالٹ کے طور پر براؤزر میں کھلتا ہے)
azd monitor --logs
```

**کامیابی کے معیارات:**
- ✅ تمام سروسز "چل رہے ہیں" کی حیثیت دکھائیں
- ✅ صحت کے اینڈپوائنٹس HTTP 200 واپس کریں
- ✅ گزشتہ 5 منٹ میں کوئی ایرر لاگز نہیں
- ✅ ایپلیکیشن ٹیسٹ درخواستوں کا جواب دیتی ہے

## 🏗️ تعیناتی کے عمل کو سمجھنا

### ہکس کے لیے نئے؟ یہاں سے شروع کریں

**ہک** ایک کمانڈ ہے جو azd تعیناتی کے عمل کے مخصوص لمحے پر خود بخود چلتا ہے — سہولت سے پہلے یا بعد، اور آپ کے کوڈ کو تعینات کرنے سے پہلے یا بعد۔ یہ آپ کو چھوٹے چھوٹے کام خودکار کرنے دیتے ہیں جو ہمیشہ تعیناتی کے گرد ہوتے ہیں: ڈیٹا بیس کی بیجکاری، مائگریشنز چلانا، اثاثے بنانا، یا لائیو ایپ کا سمک ٹیسٹ کرنا۔

| ہک | کب چلتا ہے… | عام استعمال |
|------|-------|------------|
| `preprovision` | وسائل بننے سے پہلے | پری ریکوائرمنٹس کی تصدیق، ریجسٹری میں لاگ ان کرنا |
| `postprovision` | وسائل موجود ہونے کے بعد | وسائل کو ترتیب دینا، ڈیٹا بیس سیٹ اپ کرنا |
| `predeploy` | کوڈ تعینات کرنے سے پہلے | فرنٹ اینڈ اثاثے بنانا، یونٹ ٹیسٹ چلانا |
| `postdeploy` | کوڈ لائیو ہونے کے بعد | ڈی بی مائگریشنز چلانا، اینڈپوائنٹ کا سمک ٹیسٹ کرنا |

ہکس آپ کے `azure.yaml` میں موجود ہوتے ہیں۔ یہاں سب سے چھوٹا ممکنہ مثال ہے — یہ فقط تعیناتی کے بعد ایک پیغام پرنٹ کرتا ہے:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

یہی ہے — اگلی بار جب آپ `azd up` چلائیں گے، پیغام خودکار طور پر پرنٹ ہوگا۔ آپ ایک ہک کو خود بھی چلا سکتے ہیں، مکمل تعیناتی کے بغیر، جو ٹیسٹنگ کے لیے بہت کارآمد ہے:

```bash
azd hooks run postdeploy
```

نیچے درج مراحل میں ہر اسٹیج کے لیے حقیقی دنیا کے ہکس دکھائے گئے ہیں (مائگریشنز، ٹیسٹ، تصدیق)۔

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

### مرحلہ 2: انفراسٹرکچر فراہمی
- انفراسٹرکچر ٹیمپلیٹس پڑھتا ہے (بیسپ/ٹیرافارم)
- Azure وسائل بناتا یا اپڈیٹ کرتا ہے
- نیٹ ورکنگ اور سیکیورٹی سیٹ کرتا ہے
- مانیٹرنگ اور لاگنگ ترتیب دیتا ہے

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
- تعیناتی آرٹیفیکٹس تیار کرتا ہے
- ٹارگٹ پلیٹ فارم کے لیے پیکیج کرتا ہے (کنٹینرز، ZIP فائلز وغیرہ)

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
- پیکیج کی گئی ایپلیکیشنز کو Azure سروسز پر تعینات کرتا ہے
- تشکیل کی ترتیبات کو اپڈیٹ کرتا ہے
- سروسز کو شروع یا دوبارہ شروع کرتا ہے

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

### ہک کی غلطیوں کا انتظام

ڈیفالٹ کے طور پر، **اگر ہک کمانڈ نان-زیرو کوڈ کے ساتھ باہر نکلے، تو azd پورے عمل کو روک دیتا ہے۔** یہ عموماً وہی ہوتا ہے جو آپ چاہتے ہیں — ناکام مائگریشن تعیناتی کو روک دے، خراب ایپ نہ بھیجے۔ لیکن اس کا مطلب ہے کہ ہکس کو احتیاط سے لکھنا ضروری ہے۔

**1. ناکامیاں واضح اور جان بوجھ کر کریں۔** ہک ناکام ہوتا ہے جب اس کا آخری کمانڈ نان-زیرو ایگزٹ کوڈ واپس کرتا ہے۔ شیل اسکرپٹس میں `set -e` شامل کریں تاکہ ہک پہلے ناکام کمانڈ پر رک جائے، خاموشی سے جاری نہ رہے:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. ہک کو azd روکنے کے بغیر ناکام ہونے دیں۔** غیر ضروری مراحل (مثلاً اختیاری کیشے وارم اپ، بہترین کوشش اطلاع) کے لیے `continueOnError: true` سیٹ کریں۔ azd ناکامی کو لاگ کرتا ہے لیکن جاری رہتا ہے:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. مکمل عمل سے پہلے ہکس کو الگ سے ٹیسٹ کریں۔** آپ کو ہک ڈیبگ کرنے کے لیے `azd up` چلانا ضروری نہیں — اسے اکیلے چلائیں اور تیزی سے ترمیم کریں:

```bash
azd hooks run predeploy          # صرف پیشگی تعیناتی ہُک چلائیں
azd hooks run postdeploy --service api
```

**4. OS مخصوص شیلز پر نظر رکھیں۔** `shell: pwsh` استعمال کرنے والا ہک چلانے والی مشین پر PowerShell انسٹال ہونا ضروری ہے (جیسے CI ایجنٹ شامل ہیں)۔ سب سے زیادہ پورٹ ایبلٹی کے لیے `shell: sh` استعمال کریں، یا دونوں `windows` اور `posix` ورژنز فراہم کریں:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **ڈیبگنگ ٹپ:** کوئی بھی azd کمانڈ `--debug` کے ساتھ چلائیں تاکہ ہک کی اصل کمانڈ لائن اور مکمل آؤٹ پٹ دیکھ سکیں — انتہائی قیمتی جب ہک لوکل کام کرے لیکن CI میں ناکام ہو۔

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

### ماحول مخصوص کنفیگریشنز
```bash
# ترقیاتی ماحول
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# مرحلہ وار ماحول
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# پیداوار کا ماحول
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 اعلیٰ درجے کے تعیناتی مناظر

### کثیر سروس ایپلیکیشنز
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

# نیلا ماحول ٹیسٹ کریں
./scripts/test-environment.sh production-blue

# ٹریفک نیلے میں منتقل کریں (دستی DNS/لوڈ بیلینسر اپ ڈیٹ)
./scripts/switch-traffic.sh production-blue

# سبز ماحول کی صفائی کریں
azd env select production-green
azd down --force
```

### کینیری تعیناتیاں
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

### کنٹینر ایپ کی تعیناتی
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

### کثیر مرحلہ ڈوکر فائل آپٹیمائزیشن
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
# تیز تر اصلاح کے لیے مخصوص خدمت کو تعینات کریں
azd deploy --service web
azd deploy --service api

# تمام خدمات کو تعینات کریں
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

### موثر کوڈ تعیناتیاں
```bash
# صرف کوڈ کی تبدیلیوں کے لیے azd deploy استعمال کریں (azd up نہیں)
# یہ بنیادی ڈھانچے کی فراہمی کو چھوڑ دیتا ہے اور بہت تیز ہے
azd deploy

# تیز ترین تکرار کے لیے مخصوص سروس کو تعینات کریں
azd deploy --service api
```

## 🔍 تعیناتی کی نگرانی

### حقیقی وقت میں تعیناتی کی نگرانی
```bash
# ایپلیکیشن کو حقیقی وقت میں مانیٹر کریں
azd monitor --live

# ایپلیکیشن کے لاگز دیکھیں
azd monitor --logs

# تعیناتی کی حیثیت چیک کریں
azd show
```

### صحت کے چیک
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

# درخواست کی صحت کی جانچ کریں
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

## 🔐 سیکیورٹی کے امور

### رازوں کا انتظام
```bash
# رازوں کو محفوظ طریقے سے محفوظ کریں
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

## 🚨 رول بیک حکمت عملیاں

### فوری رول بیک
```bash
# AZD میں بلٹ ان رول بیک نہیں ہے۔ تجویز کردہ طریقہ کار:

# آپشن 1: Git سے دوبارہ تعینات کریں (تجویز کردہ)
git revert HEAD  # مسئلے کا باعث بننے والا کمیٹ واپس لائیں
git push
azd deploy

# آپشن 2: مخصوص کمیٹ کو دوبارہ تعینات کریں
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### انفراسٹرکچر رول بیک
```bash
# لاگو کرنے سے پہلے بنیادی ڈھانچے میں تبدیلیوں کا جائزہ لیں
azd provision --preview

# بنیادی ڈھانچے کو واپس کرنے کے لیے، ورژن کنٹرول استعمال کریں:
git revert HEAD  # بنیادی ڈھانچے میں کی گئی تبدیلیوں کو واپس کریں
azd provision    # پچھلے بنیادی ڈھانچے کی حالت لاگو کریں
```

### ڈیٹا بیس مائگریشن رول بیک
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

### تعیناتی کارکردگی کی ٹریکنگ
```bash
# موجودہ تعیناتی کی حیثیت دیکھیں
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

### 1. ماحول کی مستقل مزاجی
```bash
# مستقل نام استعمال کریں
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ماحولیاتی مماثلت کو برقرار رکھیں
./scripts/sync-environments.sh
```

### 2. انفراسٹرکچر کی تصدیق
```bash
# تعیناتی سے پہلے بنیادی ڈھانچے کی تبدیلیوں کا پیش نظارہ کریں
azd provision --preview

# ARM/Bicep لنٹنگ استعمال کریں
az bicep lint --file infra/main.bicep

# Bicep نحو کی توثیق کریں
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
# دستاویز تعیناتی کے طریقہ کار
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## اگلے اقدامات

- [وسائل کی فراہمی](provisioning.md) - انفراسٹرکچر مینجمنٹ میں گہرائی سے جائزہ
- [پہلے سے تعیناتی کی منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md) - اپنی تعیناتی کی حکمت عملی بنائیں
- [عام مسائل](../chapter-07-troubleshooting/common-issues.md) - تعیناتی کے مسائل حل کریں
- [بہترین طریقے](../chapter-07-troubleshooting/debugging.md) - پیداوار کے لیے تیار تعیناتی کی حکمت عملیاں

## 🎯 عملی تعیناتی کی مشقیں

### مشق 1: تدریجی تعیناتی ورک فلو (20 منٹ)
**ہدف**: مکمل اور تدریجی تعیناتی کے فرق میں مہارت حاصل کریں

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

**کامیابی کے معیارات:**
- [ ] مکمل تعیناتی 5-15 منٹ لیتی ہے
- [ ] صرف کوڈ تعیناتی 2-5 منٹ لیتی ہے
- [ ] کوڈ تبدیلیاں تعینات کی گئی ایپ میں ظاہر ہوتی ہیں
- [ ] `azd deploy` کے بعد انفراسٹرکچر میں کوئی تبدیلی نہیں ہوئی

**سیکھنے کا نتیجہ**: `azd deploy` کوڈ تبدیلیوں کے لیے `azd up` سے 50-70% تیز ہے

### مشق 2: کسٹم تعیناتی ہکس (30 منٹ)
**ہدف**: تعیناتی سے پہلے اور بعد کی خودکار کاری نافذ کریں

```bash
# پیش از تعین جانچ کرنے کا اسکرپٹ بنائیں
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# جانچیں کہ آزمائشیں کامیاب ہیں
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# غیر محفوظ شدہ تبدیلیوں کی جانچ کریں
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# تعین کے بعد سموک ٹیسٹ بنائیں
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

# ہُکس کے ساتھ تعین کی جانچ کریں
azd deploy
```

**کامیابی کے معیارات:**
- [ ] تعیناتی سے پہلے اسکرپٹ چلتی ہے
- [ ] اگر ٹیسٹ ناکام ہوں تو تعیناتی منسوخ ہو جائے
- [ ] تعیناتی کے بعد سمک ٹیسٹ صحت کی تصدیق کرتا ہے
- [ ] ہکس صحیح ترتیب میں اجرا ہوتے ہیں

### مشق 3: کثیر ماحول تعیناتی کی حکمت عملی (45 منٹ)
**ہدف**: مرحلہ وار تعیناتی ورک فلو نافذ کریں (dev → staging → production)

```bash
# تعیناتی اسکرپٹ بنائیں
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# مرحلہ 1: ڈیو میں تعینات کریں
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

# مرحلہ 3: پیداواری کے لیے دستی منظوری
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

# اسٹیجڈ تعیناتی چلائیں
./deploy-staged.sh
```

**کامیابی کے معیارات:**
- [ ] ڈیولپمنٹ ماحول کامیابی سے تعینات ہے
- [ ] سٹیجنگ ماحول کامیابی سے تعینات ہے
- [ ] پیداوار کے لیے دستی منظوری ضروری ہے
- [ ] تمام ماحول میں صحت کے چیک کام کر رہے ہیں
- [ ] ضرورت پڑنے پر رول بیک کیا جا سکتا ہے

### مشق 4: رول بیک حکمت عملی (25 منٹ)
**ہدف**: گٹ استعمال کرتے ہوئے تعیناتی کا رول بیک نافذ اور ٹیسٹ کریں

```bash
# ورژن 1 تعینات کریں
azd env set APP_VERSION "1.0.0"
azd up

# ورژن 1 کمیٹ ہیش محفوظ کریں
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ورژن 2 تعینات کریں جس میں تباہ کن تبدیلی ہو
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ناکامی کا پتہ لگائیں اور واپس جائیں
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # گٹ کا استعمال کرتے ہوئے واپس جائیں
    git revert HEAD --no-edit
    
    # ماحول کو واپس کریں
    azd env set APP_VERSION "1.0.0"
    
    # ورژن 1 دوبارہ تعینات کریں
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**کامیابی کے معیارات:**
- [ ] تعیناتی کی ناکامیوں کا پتہ لگا سکتے ہیں
- [ ] رول بیک اسکرپٹ خودکار چلتا ہے
- [ ] ایپلیکیشن کام کرنے والی حالت میں واپس آجاتی ہے
- [ ] رول بیک کے بعد صحت کے چیک کامیاب ہوتے ہیں

## 📊 تعیناتی میٹرکس کی ٹریکنگ

### اپنی تعیناتی کی کارکردگی کا ٹریک رکھیں

```bash
# ڈپلائمنٹ میٹرکس اسکرپٹ بنائیں
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

- [Azure Developer CLI تعیناتی ریفرنس](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service تعیناتی](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps تعیناتی](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions تعیناتی](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**رہنمائی**
- **پچھلا سبق**: [آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **اگلا سبق**: [وسائل کی فراہمی](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->