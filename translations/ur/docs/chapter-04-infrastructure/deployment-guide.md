# تعیناتی گائیڈ - AZD تعیناتیوں میں مہارت حاصل کرنا

**باب کی نیویگیشن:**
- **📚 کورس ہوم**: [نو آموزوں کے لیے AZD](../../README.md)
- **📖 موجودہ باب**: باب 4 - انفراسٹرکچر بطور کوڈ اور تعیناتی
- **⬅️ پچھلا باب**: [باب 3: کنفیگریشن](../chapter-03-configuration/configuration.md)
- **➡️ اگلا**: [وسائل کی فراہمی](provisioning.md)
- **🧩 اس باب میں بھی**: [اپنا ٹیمپلیٹ تخلیق کرنا](custom-templates.md)
- **🚀 اگلا باب**: [باب 5: کثیر ایجنٹ AI حل](../../examples/retail-scenario.md)

## تعارف

> کو `azd 1.37.2` (نومبر 2026) کے خلاف جائزہ لیا گیا۔ کمانڈز Bash استعمال کرتی ہیں؛ JSON مثالوں کے لیے `jq` ضروری ہے۔ واضح طور پر شروع کیے گئے todo مشق کے علاوہ، جدید مثالیں **انٹیگریشن کے ٹکڑے** ہیں: اپنا ماخذ، بنیادی ڈھانچہ، ٹیسٹ، اور اسکرپٹس فراہم کریں۔ اس جائزے میں کوئی Azure ڈپلائمنٹ انجام نہیں دی گئی۔

یہ جامع رہنما Azure Developer CLI کا استعمال کرتے ہوئے ایپلیکیشنز کی تعیناتی کے بارے میں ہر چیز کا احاطہ کرتا ہے، بنیادی سنگل کمانڈ ڈپلائمنٹس سے لے کر کسٹم ہُکس، متعدد ماحول، اور CI/CD انٹیگریشن کے ساتھ جدید پروڈکشن منظرناموں تک۔ عملی مثالوں اور بہترین طریقوں کے ساتھ مکمل ڈپلائمنٹ لائف سائیکل میں مہارت حاصل کریں۔

## سیکھنے کے مقاصد

اس گائیڈ کو مکمل کرکے، آپ:
- Azure Developer CLI کی تمام ڈیپلائمنٹ کمانڈز اور ورک فلو پر عبور حاصل کریں گے
- پروویژننگ سے مانیٹرنگ تک مکمل ڈیپلائمنٹ لائف سائیکل کو سمجھیں گے
- پری اور پوسٹ ڈیپلائمنٹ آٹومیشن کے لیے کسٹم ڈیپلائمنٹ ہُکس نافذ کریں گے
- متعدد ماحولیاتی نظام کو مخصوص پیرامیٹرز کے ساتھ ترتیب دیں گے
- بلیو-گرین اور کینیری ڈیپلائمنٹس سمیت جدید ڈیپلائمنٹ حکمت عملی قائم کریں گے
- azd ڈیپلائمنٹس کو CI/CD پائپ لائنز اور DevOps ورک فلو کے ساتھ مربوط کریں گے

## سیکھنے کے نتائج

مکمل ہونے پر، آپ قابل ہوں گے کہ:
- تمام azd تعیناتی کے ورک فلو کو خودمختاری سے چلائیں اور مسائل حل کریں
- ہُکس کا استعمال کرتے ہوئے اپنی مرضی کی تعیناتی خود کاری ڈیزائن اور نافذ کریں
- مناسب سیکیورٹی اور نگرانی کے ساتھ پروڈکشن کے قابل تعیناتی تشکیل دیں
- پیچیدہ کثیر ماحول تعیناتی کے منظرنامے منظم کریں
- تعیناتی کی کارکردگی کو بہتر بنائیں اور رول بیک حکمت عملی نافذ کریں
- azd تعیناتی کو انٹرپرائز ڈیواپس عملی طریقوں میں ضم کریں

## تعیناتی کا جائزہ

Azure Developer CLI کئی تعیناتی کمانڈز فراہم کرتا ہے:
- `azd up` - مکمل ورک فلو (پروویژن + تعیناتی)
- `azd provision` - صرف Azure وسائل تخلیق/اپ ڈیٹ کریں
- `azd deploy` - صرف درخواست کا کوڈ تعینات کریں
- `azd package` - ایپلیکیشنز بنائیں اور پیکیج کریں

## بنیادی تعیناتی کے ورک فلو

### مکمل تعیناتی (azd up)
نئے پروجیکٹس کے لیے سب سے عام ورک فلو:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### صرف بنیادی ڈھانچے کی تعیناتی
جب آپ کو صرف ایژر وسائل کو اپ ڈیٹ کرنے کی ضرورت ہو:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### صرف کوڈ کی تعیناتی
تیز تر ایپلیکیشن اپ ڈیٹس کے لیے:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ تعیناتی کی تصدیق

کسی بھی تعیناتی کے بعد، کامیابی کی تصدیق کریں:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**کامیابی کے معیار:**
- ✅ `azd show` متوقع سروس اہداف/URLs کو حل کرتا ہے
- ✅ اصل ایپلیکیشن راستوں پر درخواستیں متوقع اسٹیٹس اور مواد واپس کرتی ہیں
- ✅ پچھلے 5 منٹوں میں کوئی ایرر لاگز نہیں
- ✅ ایپلیکیشن ٹیسٹ درخواستوں کا جواب دیتی ہے

## 🏗️ تعیناتی کے عمل کو سمجھنا

### ہوک کے بارے میں نیا؟ یہاں سے شروع کریں

ایک **ہوک** azd کا وہ کمانڈ ہے جو خود بخود تعیناتی کے عمل کے ایک مخصوص لمحے پر چلایا جاتا ہے — وسائل مہیا کرنے سے پہلے یا بعد، اور آپ کے کوڈ کی تعیناتی سے پہلے یا بعد۔ یہ آپ کو چھوٹے کام خودکار کرنے دیتے ہیں جو ہمیشہ تعیناتی کے گرد ہوتے ہیں: ڈیٹا بیس میں بیج لگانا، مائیگریشنز چلانا، اثاثے بنانا، یا زندہ ایپ کا سموک ٹیسٹ کرنا۔

| ہوک | کب چلتا ہے… | عام استعمال |
|------|-------|------------|
| `preprovision` | وسائل تخلیق ہونے سے پہلے | شرائط کی توثیق کریں، رجسٹری میں لاگ ان کریں |
| `postprovision` | وسائل موجود ہونے کے بعد | وسائل کو ترتیب دیں، ڈیٹا بیس قائم کریں |
| `predeploy` | کوڈ کی تعیناتی سے پہلے | فرنٹ اینڈ اثاثے بنائیں، یونٹ ٹیسٹ چلائیں |
| `postdeploy` | کوڈ لائیو ہونے کے بعد | ڈی بی مائیگریشنز چلائیں، اینڈ پوائنٹ کا سموک ٹیسٹ کریں |

ہوکس آپ کے `azure.yaml` میں ہوتے ہیں۔ یہاں سب سے چھوٹا ممکنہ مثال ہے — یہ تعیناتی کے بعد صرف ایک پیغام پرنٹ کرتا ہے:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

بس یہی ہے—اگلی بار جب آپ `azd up` چلائیں گے، پیغام خودبخود پرنٹ ہو جائے گا۔ آپ ہک کو خود بھی چلا سکتے ہیں، بغیر مکمل ڈیپلائے کے، جو کہ ٹیسٹنگ کے لیے بہترین ہے:

```bash
azd hooks run postdeploy
```

نیچے دی گئی مراحل ہر مرحلے کے لیے حقیقی دنیا کے ہک دکھاتے ہیں (مائگریشنز، ٹیسٹ، ویلیڈیشن)۔

### مرحلہ 1: پری-پروویژن ہک
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
- انفراسٹرکچر ٹیمپلز (Bicep/Terraform) پڑھتا ہے
- Azure وسائل بناتا یا اپڈیٹ کرتا ہے
- نیٹ ورکنگ اور سیکیورٹی کی ترتیب دیتا ہے
- مانیٹرنگ اور لاگنگ سیٹ اپ کرتا ہے

### مرحلہ 3: پوسٹ-پروویژن ہک
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
- ڈیپلائیمنٹ آرٹیفیکٹس تیار کرتا ہے
- ہدف پلیٹ فارم کے لیے پیکیج کرتا ہے (کنٹینرز، ZIP فائلز، وغیرہ)

### مرحلہ 5: پری-ڈیپلائے ہک
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
- پیک کیے گئے ایپلیکیشنز کو Azure سروسز میں تعینات کرتا ہے
- کنفیگریشن سیٹنگز کو اپ ڈیٹ کرتا ہے
- سروسز کو اسٹارٹ/ری اسٹارٹ کرتا ہے

### مرحلہ 7: پوسٹ-ڈیپلائے ہک
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### ہک کی غلطیوں کا ہینڈلنگ

ڈیفالٹ طور پر، **اگر ہک کمانڈ غیر زیرو کوڈ کے ساتھ نکلتی ہے، تو azd پوری کارروائی کو روک دیتا ہے۔** یہ عموماً وہی ہوتا ہے جو آپ چاہتے ہیں—ناکام مائگریشن سے ڈیپلائے رک جانا چاہیے، نہ کہ خراب ایپ کو بھیجنا۔ لیکن اس کا مطلب ہے کہ ہکس کو احتیاط سے لکھنا ضروری ہے۔

**1. ناکامیاں واضح اور جان بوجھ کر بنائیں۔** ایک ہک اس وقت ناکام ہوتا ہے جب اس کا آخری کمانڈ غیر زیرو ایگزٹ کوڈ دیتا ہے۔ شیل اسکرپٹس میں، `set -e` شامل کریں تاکہ ہک پہلے ناکام کمانڈ پر رکے نہ کہ خاموشی سے آگے بڑھتا رہے:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2۔ azd کو روکنے کے بغیر ہک کو ناکام ہونے کی اجازت دیں۔** غیر اہم اقدامات (اختیاری کیچ وارم اپ، بہترین کوشش اطلاع) کے لیے، `continueOnError: true` سیٹ کریں۔ azd ناکامی کو لاگ کرتا ہے لیکن جاری رکھتا ہے:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3۔ مکمل رن سے پہلے ہکس کو الگ سے ٹیسٹ کریں۔** آپ کو ہک کو ڈیبگ کرنے کے لیے `azd up` چلانے کی ضرورت نہیں—اسے الگ چلائیں اور تیزی سے دوبارہ آزمائیں:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4۔ OS مخصوص شیلز کا خیال رکھیں۔** ایک ہک جو `shell: pwsh` استعمال کرتا ہے اسے چلانے والی مشین پر PowerShell نصب ہونا چاہیے (CI ایجنٹس سمیت)۔ سب سے زیادہ پورٹیبیلٹی کے لیے `shell: sh` استعمال کریں، یا دونوں `windows` اور `posix` ورژن فراہم کریں:

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

> **ڈیبگنگ ٹپ:** کسی بھی azd کمانڈ کو `--debug` کے ساتھ چلائیں تاکہ ہک کمانڈ لائن اور اس کی مکمل آؤٹ پٹ دیکھ سکیں—یہ بہت قیمتی ہے جب ہک مقامی طور پر کام کرتا ہو لیکن CI میں ناکام ہو۔

## 🎛️ تعیناتی کی ترتیب

### سروس مخصوص تعیناتی کی ترتیبات
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### ماحول مخصوص ترتیبیں

یہ صرف مقامی azd اقدار ہیں۔ انہیں واضح طور پر انفراسٹرکچر/رن ٹائم کنفیگریشن کے ساتھ میپ کریں۔ `NODE_ENV` عام طور پر ایک تعینات Node ایپ کے لیے `production` ہوتا ہے، جس میں اسٹیجنگ تعیناتی بھی شامل ہے؛ تعیناتی کے مراحل کو مختلف کرنے کے لیے ایک الگ ایپ مخصوص متغیر استعمال کریں۔

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 جدید تعیناتی کے منظرنامے

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

**مثالی عملی خاکہ:** آپ کو دونوں ماحول فراہم کرنے ہوں گے، ایک مشترکہ ٹریفک-راؤٹنگ پرت، اور نیچے دیئے گئے دو اسکرپٹس۔ azd خودکار طور پر ٹریفک کو منتقل نہیں کرتا یا رول بیک کی تیاری کی تصدیق نہیں کرتا۔ جب تک کہ نیلا ٹیسٹنگ پاس نہیں کر لیتا اور رول بیک کی ضرورت نہیں رہتی، سبز برقرار رکھیں۔

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### کینری تعیناتیاں
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

ٹریفک کی تقسیم کنٹینر ایپس کی تشکیل (بائسک یا ایذور CLI) سے متعلق ہے، نہ کہ `azure.yaml` `trafficSplit` پراپرٹی کی۔ پریویو/پروویژننگ اور بعد کی تعیناتیوں کو آپ کے منتخب شدہ نظرثانی موڈ اور راؤٹنگ قواعد کو برقرار رکھنا چاہیے۔

### مرحلہ وار تعیناتیاں
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
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
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

کنٹینر ایپ کے انفراسٹرکچر میں `configuration.secrets`/`secretRef` (یا کی ویالٹ ریفرنسز) کے ساتھ رن ٹائم سیکریٹس کی ترتیب دیں اور `template.scale` کے ذریعے اسکیلنگ کریں۔ سرویس لیول `secrets` یا `scale` خصوصیات کو `azure.yaml` میں مت ایجاد کریں۔

### ملٹی اسٹیج ڈوکر فائل کی اصلاح
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ کارکردگی میں بہتری

### سروس-مخصوص تعینات
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### بلڈ کیشنگ
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

معیاری نوڈ ورک فلو پیکیج اسکرپٹس استعمال کرتا ہے؛ سروس `prepackage` ہکس ضروری مراحل شامل کر سکتے ہیں۔ ڈاکر لیئر کیشنگ سروس بلڈ کمانڈ کی تعریف سے الگ ہے۔

### مؤثر کوڈ تعیناتیاں
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 تعیناتی کی نگرانی

### حقیقی وقت کی تعیناتی کی نگرانی
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### صحت کی جانچ
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

آپ کی ایپلیکیشن کو `/health` کو نافذ کرنا ہوگا؛ یہ azd خود بخود فراہم نہیں کرتا۔ کوئی عمومی `azure.yaml` `healthCheck` سروس پراپرٹی موجود نہیں ہے۔

### تعیناتی کے بعد کی توثیق
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 سلامتی کے پہلو

### خفیہ معلومات کا انتظام
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` غیر معتبر ہے۔ عام ماحول کے اقدار مقامی سادہ متن ہوتے ہیں؛ یہ فرض نہ کریں کہ پڑھنے والے کمانڈز انہیں ترتیب دیں گے۔ مذکورہ بالا کمانڈز کی وائلیٹ کے حوالہ جات محفوظ کرتے ہیں، لیکن آپ کا انفراسٹرکچر/ایپلیکیشن اب بھی خفیہ معلومات کا استعمال کرنا اور رن ٹائم شناخت کی رسائی دینا ہوگی۔

### نیٹ ورک کی سلامتی
بائسک میں نیٹ ورک کے پیرامیٹرز کا اعلان کریں اور انہیں `infra/main.parameters.json` میں میپ کریں۔ `azure.yaml` میں کوئی عمومی `infra.parameters` اوورلے نہیں ہے۔ مثال کے طور پر دستاویزات کی رینجز `203.0.113.0/24` اور `198.51.100.0/24` حقیقی آفس/وی پی این نیٹ ورکس نہیں ہیں؛ انہیں مجاز نیٹ ورک رینجز سے تبدیل کریں۔

### شناخت اور رسائی کا انتظام
بائسک میں کنٹینر ایپ کا `identity` فعال کریں اور وولٹ اسکوپ پر ضروری کی والٹ ڈیٹا-پلین کردار تفویض کریں۔ اس ریسورس میں نامزد کی والٹ-بیکڈ راز اور رن ٹائم حوالہ جات ترتیب دیں؛ `identity` اور `keyVault` عمومی azd سروس خصوصیات نہیں ہیں۔ دیکھیں [توثیق اور منیجڈ شناخت](../chapter-03-configuration/authsecurity.md)۔

## 🚨 رول بیک حکمت عملیاں

### فوری رول بیک
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### انفراسٹرکچر کا رول بیک
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

### تعیناتی کی کارکردگی کا تعاقب کریں
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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

### 1. ماحولیاتی مستقل مزاجی
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. انفراسٹرکچر کی توثیق
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## اگلے اقدامات

- [وسائل کی فراہمی](provisioning.md) - انفراسٹرکچر مینجمنٹ میں گہرا جائزہ
- [پری-تعیناتی کی منصوبہ بندی](../chapter-06-pre-deployment/capacity-planning.md) - اپنی تعیناتی کی حکمت عملی بنائیں
- [عام مسائل](../chapter-07-troubleshooting/common-issues.md) - تعیناتی کے مسائل حل کریں
- [بہترین طریقے](../chapter-07-troubleshooting/debugging.md) - پروڈکشن کے لیے تیار تعیناتی کی حکمت عملی

## 🎯 عملی تعیناتی کی مشقیں

### مشق 1: انکریمنٹل تعیناتی کا ورک فلو (20 منٹ)
**مقصد**: مکمل اور انکریمنٹل تعیناتوں کے فرق میں مہارت حاصل کریں

**آغاز نقطہ:** Bash, Node.js 22, Git, azd سائن ان، اور تعیناتی کی اجازتوں کے ساتھ ایک Azure سبسکرپشن۔ نئی ڈائرکٹری میں چلائیں؛ قابل بل App Service/Cosmos DB وسائل کی توقع کریں۔ اوقات کا انحصار خطے اور ٹیمپلیٹ پر ہے۔

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**کامیابی کے معیار:**
- [ ] دونوں کمانڈز کے لیے گزرا ہوا وقت ریکارڈ کریں (کوئی گارنٹی شدہ دورانیہ نہیں ہے)
- [ ] دونوں کمانڈز کامیابی سے مکمل ہوں
- [ ] API فعال رہے؛ صرف کمنٹ کی ایڈیٹ UI میں کوئی مرئی تبدیلی نہیں ہے
- [ ] `azd deploy` کے بعد انفراسٹرکچر بدلا نہ جائے

**سیکھنے کا نتیجہ**: `azd deploy` انفراسٹرکچر کی پروویژنگ چھوڑ دیتا ہے۔ فرض کرنے کی بجائے ماپے گئے اوقات کا موازنہ کریں کہ کوئی مقررہ فیصد رفتار میں اضافہ ہوتا ہے۔

### مشق 2: کسٹم تعیناتی کے ہکس (30 منٹ)
**مقصد**: تعیناتی سے پہلے اور بعد خود کار عمل درآمد کو نافذ کریں

**آغاز نقطہ:** اوپر دیے گئے انیشئیلائزڈ `deployment-practice` پروجیکٹ۔ اگر آپ نے اسے صاف کیا ہے، تو کوڈ-صرف تعیناتی کی جانچ سے پہلے دوبارہ `azd up` چلائیں۔ ذیل کی تصدیق API کے اصل بلڈ اسکرپٹ کا استعمال کرتی ہے، غیر موجود روٹ `test:unit` اسکرپٹ نہیں۔ ٹیمپلیٹ کے API ٹیسٹوں کو مکمل ڈیٹا بیس رسائی کی ضرورت ہے؛ یہ الگ تھلگ یونٹ ٹیسٹ نہیں ہیں۔

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**کامیابی کے معیار:**
- [ ] پری-ڈپلائے اسکرپٹ ڈپلائمنٹ سے پہلے چلتا ہے
- [ ] اگر بلڈ کی تصدیق ناکام ہو تو ڈپلائمنٹ منسوخ ہو جاتی ہے
- [ ] پوسٹ-ڈپلائے سموک ٹیسٹ صحت کی تصدیق کرتا ہے
- [ ] ہُکس صحیح ترتیب میں چلتے ہیں

### مشق ۳: متعدد ماحول کی ڈپلائمنٹ اسٹریٹجی (۴۵ منٹ)
**مقصد**: مرحلہ وار ڈپلائمنٹ ورک فلو کو نافذ کرنا (ڈویلپ → اسٹیجنگ → پروڈکشن)

**آغاز کا نقطہ:** وہی ابتدائی شدہ todo پروجیکٹ جس میں `jq` ہے۔ نیچے دیے گئے ماحولیات بنائیں جن میں حقیقی سبسکرپشن/لوکیشن کی قدریں ہوں (یا ہر ایک میں `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` سیٹ کریں) **اس سے پہلے** کہ no-prompt ورک فلو کو چلایا جائے۔ یہ جان بوجھ کر ناکام ہو جاتا ہے بجائے کہ غائب قدروں کو فرض کرنے کے۔ صرف وقتی تربیتی ماحول استعمال کریں، اصل پروڈکشن سبسکرپشن نہیں۔

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**کامیابی کے معیارات:**
- [ ] ڈیولپمنٹ ماحو ل کامیابی سے تعینات ہوتا ہے
- [ ] اسٹیجنگ ماحول کامیابی سے تعینات ہوتا ہے
- [ ] پروڈکشن کے لئے دستی منظوری ضروری ہے
- [ ] تمام ماحولیات میں صحت کے چیک کام کر رہے ہیں
- [ ] ضرورت پڑنے پر رول بیک کیا جا سکتا ہے

### مشق ۴: رول بیک حکمت عملی (۲۵ منٹ)
**مقصد**: Git استعمال کرتے ہوئے تعیناتی کے رول بیک کو نافذ کرنا اور ٹیسٹ کرنا

**آغاز کا نقطہ:** todo ٹیمپلیٹ کی ایک علیحدہ تربیتی چیک آؤٹ جس میں تمام بنیادی ماخذ کمٹ ہو چکے ہوں، صاف Git ورکنگ ٹری، اور ایک استعمال کے قابل محیط ماحول۔ حقیقی پروڈکشن پروجیکٹ میں جان بوجھ کر ناکامیاں مت متعارف کروائیں۔ نیچے دیا گیا `APP_VERSION` صرف کتابت کے لئے ہے جب تک کہ آپ اسے واضح طور پر ایپ میں شامل نہ کریں۔

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**کامیابی کے معیارات:**
- [ ] تعیناتی کی ناکامیوں کا پتہ لگا سکتا ہے
- [ ] رول بیک اسکرپٹ خود بخود چلتی ہے
- [ ] ایپلیکیشن کام کرنے کی حالت میں واپس آتی ہے
- [ ] رول بیک کے بعد صحت کے چیک پاس ہوتے ہیں

## 📊 تعیناتی کے میٹرکس کی ٹریکنگ

### اپنی تعیناتی کی کارکردگی کا جائزہ لیں

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**اپنے میٹرکس کا تجزیہ کریں:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## اضافی وسائل

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**نیویگیشن**
- **پچھلا سبق**: [آپ کا پہلا پروجیکٹ](../chapter-01-foundation/first-project.md)
- **اگلا سبق**: [وسائل کی فراہمی](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->