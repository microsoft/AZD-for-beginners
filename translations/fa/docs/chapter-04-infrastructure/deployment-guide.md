# راهنمای استقرار - تسلط بر استقرارهای AZD

**ناوبری فصل:**
- **📚 صفحه دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل فعلی**: فصل 4 - زیرساخت به‌عنوان کد و استقرار
- **⬅️ فصل قبلی**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ بعدی**: [Provisioning Resources](provisioning.md)
- **🧩 همچنین در این فصل**: [Authoring Your Own Template](custom-templates.md)
- **🚀 فصل بعدی**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## مقدمه

این راهنمای جامع همه چیزهایی را که باید درباره استقرار برنامه‌ها با استفاده از Azure Developer CLI بدانید پوشش می‌دهد، از استقرارهای ساده با یک فرمان تا سناریوهای پیشرفته تولید با هوک‌های سفارشی، چندین محیط، و یکپارچه‌سازی CI/CD. چرخه کامل عمر استقرار را با مثال‌های عملی و بهترین شیوه‌ها یاد بگیرید.

## اهداف یادگیری

با تکمیل این راهنما، شما:
- همه دستورات و جریان‌های کاری استقرار Azure Developer CLI را به‌خوبی فراخواهید گرفت
- چرخه کامل عمر استقرار را از تأمین منابع تا مانیتورینگ درک خواهید کرد
- هوک‌های استقرار سفارشی برای اتوماسیون پیش و پس از استقرار پیاده‌سازی خواهید کرد
- چندین محیط را با پارامترهای مخصوص هر محیط پیکربندی خواهید کرد
- استراتژی‌های پیشرفته استقرار مانند blue-green و canary را راه‌اندازی خواهید کرد
- استقرارهای azd را با خطوط لوله CI/CD و گردش‌کارهای DevOps یکپارچه خواهید کرد

## نتایج یادگیری

پس از اتمام، شما قادر خواهید بود:
- تمام جریان‌های کاری استقرار `azd` را به‌طور مستقل اجرا و عیب‌یابی کنید
- اتوماسیون استقرار سفارشی را با استفاده از هوک‌ها طراحی و پیاده‌سازی کنید
- استقرارهای آماده تولید را با امنیت و مانیتورینگ مناسب پیکربندی کنید
- سناریوهای پیچیده چندمحیطی را مدیریت کنید
- عملکرد استقرار را بهینه کرده و استراتژی‌های بازگشت را پیاده‌سازی کنید
- استقرارهای `azd` را در رویه‌های DevOps سازمانی یکپارچه کنید

## نمای کلی استقرار

Azure Developer CLI چندین فرمان استقرار ارائه می‌دهد:
- `azd up` - جریان کاری کامل (provision + deploy)
- `azd provision` - فقط ایجاد/به‌روزرسانی منابع Azure
- `azd deploy` - فقط استقرار کد برنامه
- `azd package` - ساخت و بسته‌بندی برنامه‌ها

## جریان‌های کاری پایه استقرار

### استقرار کامل (azd up)
رایج‌ترین جریان کاری برای پروژه‌های جدید:
```bash
# همه چیز را از ابتدا مستقر کنید
azd up

# با محیط مشخص مستقر کنید
azd up --environment production

# با پارامترهای سفارشی مستقر کنید
azd up --parameter location=westus2 --parameter sku=P1v2
```

### فقط زیرساخت
وقتی فقط نیاز به به‌روزرسانی منابع Azure دارید:
```bash
# تأمین/به‌روزرسانی زیرساخت
azd provision

# تأمین با اجرای آزمایشی (dry-run) برای پیش‌نمایش تغییرات
azd provision --preview

# تأمین سرویس‌های مشخص
azd provision --service database
```

### فقط کد
برای به‌روزرسانی سریع برنامه:
```bash
# همه سرویس‌ها را مستقر کنید
azd deploy

# خروجی مورد انتظار:
# در حال استقرار سرویس‌ها (azd deploy)
# - web: در حال استقرار... انجام شد
# - api: در حال استقرار... انجام شد
# موفقیت: استقرار شما در 2 دقیقه و 15 ثانیه تکمیل شد

# یک سرویس مشخص را مستقر کنید
azd deploy --service web
azd deploy --service api

# استقرار با آرگومان‌های ساخت سفارشی
azd deploy --service api --build-arg NODE_ENV=production

# استقرار را تأیید کنید
azd show --output json | jq '.services'
```

### ✅ تایید استقرار

پس از هر استقرار، موفقیت را بررسی کنید:

```bash
# اطمینان حاصل کنید که همه سرویس‌ها در حال اجرا هستند
azd show

# نقاط پایانی سلامت را آزمایش کنید
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# برای خطاها نظارت کنید (به‌طور پیش‌فرض در مرورگر باز می‌شود)
azd monitor --logs
```

**معیارهای موفقیت:**
- ✅ همه سرویس‌ها وضعیت "Running" را نشان می‌دهند
- ✅ نقاط بررسی سلامت پاسخ HTTP 200 بازمی‌گردانند
- ✅ در 5 دقیقه گذشته خطای لاگ وجود ندارد
- ✅ برنامه به درخواست‌های تست پاسخ می‌دهد

## 🏗️ درک فرایند استقرار

### با هوک‌ها تازه‌کار هستید؟ از اینجا شروع کنید

یک **هوک** فرمانی است که `azd` به‌صورت خودکار در لحظه‌ای مشخص از روند استقرار اجرا می‌کند — قبل یا بعد از تأمین منابع، و قبل یا بعد از استقرار کد شما. آن‌ها به شما اجازه می‌دهند کارهای کوچکی را که همیشه اطراف یک استقرار وجود دارد خودکار کنید: پر کردن دیتابیس، اجرای مهاجرت‌ها، ساخت دارایی‌ها، یا انجام تست‌های دود (smoke-testing) روی برنامه زنده.

| Hook | اجرا می‌شود… | کاربرد معمول |
|------|---------------|---------------|
| `preprovision` | قبل از ایجاد منابع | اعتبارسنجی پیش‌نیازها، ورود به یک رجیستری |
| `postprovision` | بعد از اینکه منابع ایجاد شدند | پیکربندی منابع، راه‌اندازی دیتابیس |
| `predeploy` | قبل از استقرار کد | ساخت دارایی‌های فرانت‌اند، اجرای تست‌های واحد |
| `postdeploy` | بعد از زنده شدن کد | اجرای مهاجرت‌های دیتابیس، تست دود از نقطه پایان |

هوک‌ها در فایل `azure.yaml` شما زندگی می‌کنند. در اینجا کوچک‌ترین مثال ممکن را می‌بینید — فقط پس از استقرار یک پیام چاپ می‌کند:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

همین است — دفعه بعد که `azd up` را اجرا کنید، پیام به‌صورت خودکار چاپ می‌شود. همچنین می‌توانید یک هوک را به‌تنهایی اجرا کنید، بدون یک استقرار کامل، که برای تست عالی است:

```bash
azd hooks run postdeploy
```

فازهای زیر هوک‌های دنیای واقعی (مهاجرت‌ها، تست‌ها، اعتبارسنجی) را برای هر مرحله نشان می‌دهند.

### فاز 1: هوک‌های پیش از تأمین
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

### فاز 2: تأمین زیرساخت
- خواندن قالب‌های زیرساخت (Bicep/Terraform)
- ایجاد یا به‌روزرسانی منابع Azure
- پیکربندی شبکه و امنیت
- راه‌اندازی مانیتورینگ و لاگ‌گیری

### فاز 3: هوک‌های پس از تأمین
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

### فاز 4: بسته‌بندی برنامه
- ساخت کد برنامه
- ایجاد آثار استقراری
- بسته‌بندی برای پلتفرم هدف (کانتینرها، فایل‌های ZIP و غیره)

### فاز 5: هوک‌های پیش از استقرار
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

### فاز 6: استقرار برنامه
- استقرار برنامه‌های بسته‌بندی شده به سرویس‌های Azure
- به‌روزرسانی تنظیمات پیکربندی
- راه‌اندازی/راه‌اندازی مجدد سرویس‌ها

### فاز 7: هوک‌های پس از استقرار
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

### مدیریت خطاهای هوک

به‌طور پیش‌فرض، **اگر یک فرمان هوک با کد خروجی غیرصفر خاتمه یابد، azd کل عملیات را متوقف می‌کند.** این معمولاً همان چیزی است که می‌خواهید — یک مهاجرت ناموفق باید استقرار را متوقف کند، نه اینکه یک برنامه خراب را منتشر کند. اما این یعنی هوک‌ها باید با دقت نوشته شوند.

**1. شکست‌ها را بلند و عمدی کنید.** یک هوک زمانی شکست می‌خورد که آخرین فرمان آن کد خروجی غیرصفر برگرداند. در اسکریپت‌های شل، `set -e` اضافه کنید تا هوک در اولین فرمان شکست‌خورده متوقف شود به‌جای اینکه به‌طور مخفیانه ادامه دهد:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. اجازه دهید یک هوک بدون متوقف کردن `azd` شکست بخورد.** برای مراحل غیرضروری (گرم‌کردن کش اختیاری، اطلاع‌رسانی بهترین تلاش)، `continueOnError: true` را تنظیم کنید. azd شکست را لاگ می‌کند اما ادامه می‌دهد:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. هوک‌ها را جداگانه قبل از اجرای کامل تست کنید.** لازم نیست برای اشکال‌زدایی یک هوک `azd up` را اجرا کنید — آن را به‌تنهایی اجرا کنید و سریع تکرار کنید:

```bash
azd hooks run predeploy          # فقط هوک predeploy را اجرا می‌کند
azd hooks run postdeploy --service api
```

**4. مراقب شل‌های مخصوص سیستم‌عامل باشید.** یک هوک که از `shell: pwsh` استفاده می‌کند نیاز به نصب PowerShell روی ماشینی دارد که آن را اجرا می‌کند (از جمله عامل‌های CI). برای گسترده‌ترین قابلیت حمل از `shell: sh` استفاده کنید، یا هر دو نسخه `windows` و `posix` را فراهم کنید:

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

> **نکته اشکال‌زدایی:** هر فرمان `azd` را با `--debug` اجرا کنید تا خط فرمان دقیق هوک و خروجی کامل آن را ببینید — بسیار ارزشمند وقتی که یک هوک به‌صورت محلی کار می‌کند اما در CI شکست می‌خورد.

## 🎛️ پیکربندی استقرار

### تنظیمات استقرار اختصاصی سرویس
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

### پیکربندی‌های مخصوص محیط
```bash
# محیط توسعه
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# محیط پیش‌تولید
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# محیط تولید
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 سناریوهای پیشرفته استقرار

### برنامه‌های چندسرویسی
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

### استقرارهای Blue-Green
```bash
# ایجاد محیط آبی
azd env new production-blue
azd up --environment production-blue

# آزمایش محیط آبی
./scripts/test-environment.sh production-blue

# هدایت ترافیک به محیط آبی (به‌روزرسانی دستی DNS/توازن بار)
./scripts/switch-traffic.sh production-blue

# پاک‌سازی محیط سبز
azd env select production-green
azd down --force
```

### استقرارهای Canary
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

### استقرارهای مرحله‌ای
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

## 🐳 استقرار کانتینر

### استقرارهای Container App
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

### بهینه‌سازی Dockerfile چندمرحله‌ای
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

## ⚡ بهینه‌سازی عملکرد

### استقرارهای مخصوص سرویس
```bash
# یک سرویس مشخص را برای تکرار سریع‌تر مستقر کنید
azd deploy --service web
azd deploy --service api

# تمام سرویس‌ها را مستقر کنید
azd deploy
```

### کش‌سازی ساخت
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### استقرارهای کد کارآمد
```bash
# برای تغییراتی که فقط به کد مربوط‌اند، از azd deploy (نه azd up) استفاده کنید
# این مرحلهٔ تأمین زیرساخت را رد می‌کند و بسیار سریع‌تر است
azd deploy

# برای سریع‌ترین تکرار، سرویس مشخص را مستقر کنید
azd deploy --service api
```

## 🔍 مانیتورینگ استقرار

### مانیتورینگ استقرار در زمان واقعی
```bash
# نظارت بر برنامه در زمان واقعی
azd monitor --live

# مشاهده گزارش‌های برنامه
azd monitor --logs

# بررسی وضعیت استقرار
azd show
```

### بررسی‌های سلامت
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

### اعتبارسنجی پس از استقرار
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# بررسی سلامت برنامه
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

## 🔐 ملاحظات امنیتی

### مدیریت اسرار
```bash
# اسرار را به‌صورت ایمن ذخیره کنید
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# در azure.yaml به اسرار ارجاع دهید
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

### امنیت شبکه
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### مدیریت هویت و دسترسی
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

## 🚨 استراتژی‌های بازگشت (Rollback)

### بازگشت سریع
```bash
# AZD بازگردانی داخلی (rollback) ندارد. رویکردهای پیشنهادی:

# گزینهٔ ۱: استقرار مجدد از Git (توصیه‌شده)
git revert HEAD  # کامیت مشکل‌دار را برگردانید
git push
azd deploy

# گزینهٔ ۲: استقرار مجدد یک کامیت مشخص
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### بازگشت زیرساخت
```bash
# قبل از اعمال، تغییرات زیرساخت را پیش‌نمایش کنید
azd provision --preview

# برای بازگردانی زیرساخت، از کنترل نسخه استفاده کنید:
git revert HEAD  # تغییرات زیرساخت را برگردانید
azd provision    # وضعیت قبلی زیرساخت را اعمال کنید
```

### بازگشت مهاجرت دیتابیس
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 معیارهای استقرار

### ردیابی عملکرد استقرار
```bash
# مشاهده وضعیت فعلی استقرار
azd show

# نظارت بر برنامه با Application Insights
azd monitor --overview

# مشاهده معیارهای بلادرنگ
azd monitor --live
```

### جمع‌آوری معیارهای سفارشی
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

## 🎯 بهترین شیوه‌ها

### 1. تناسب محیط‌ها
```bash
# از نام‌گذاری یکسان استفاده کنید
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# شباهت محیط‌ها را حفظ کنید
./scripts/sync-environments.sh
```

### 2. اعتبارسنجی زیرساخت
```bash
# پیش‌نمایش تغییرات زیرساخت قبل از استقرار
azd provision --preview

# استفاده از linting برای ARM و Bicep
az bicep lint --file infra/main.bicep

# اعتبارسنجی سینتکس Bicep
az bicep build --file infra/main.bicep
```

### 3. یکپارچه‌سازی تست
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

### 4. مستندسازی و لاگ‌گیری
```bash
# فرآیندهای استقرار را مستندسازی کنید
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## گام‌های بعدی

- [Provisioning Resources](provisioning.md) - بررسی عمیق مدیریت زیرساخت
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - برنامه‌ریزی استراتژی استقرار
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - حل مشکلات استقرار
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - استراتژی‌های استقرار آماده تولید

## 🎯 تمرین‌های عملی استقرار

### تمرین 1: جریان کاری استقرار افزایشی (20 دقیقه)
**هدف**: تفاوت بین استقرار کامل و افزایشی را تسلط یابید

```bash
# استقرار اولیه
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ثبت زمان استقرار اولیه
echo "Full deployment: $(date)" > deployment-log.txt

# اعمال تغییر در کد
echo "// Updated $(date)" >> src/api/src/server.js

# فقط کد را مستقر کنید (سریع)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# مقایسه زمان‌ها
cat deployment-log.txt

# پاک‌سازی
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار کامل 5-15 دقیقه طول بکشد
- [ ] استقرار فقط-کد 2-5 دقیقه طول بکشد
- [ ] تغییرات کد در برنامه مستقر منعکس شوند
- [ ] زیرساخت پس از `azd deploy` تغییر نکند

**نتیجه یادگیری**: `azd deploy` برای تغییرات کد 50-70% سریع‌تر از `azd up` است

### تمرین 2: هوک‌های استقرار سفارشی (30 دقیقه)
**هدف**: اتوماسیون پیش و پس از استقرار را پیاده‌سازی کنید

```bash
# ایجاد اسکریپت اعتبارسنجی قبل از استقرار
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# بررسی موفقیت‌آمیز بودن تست‌ها
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# بررسی وجود تغییرات ثبت‌نشده
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ایجاد تست سریع (smoke) پس از استقرار
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

# افزودن هوک‌ها به azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# تست استقرار با هوک‌ها
azd deploy
```

**معیارهای موفقیت:**
- [ ] اسکریپت پیش-استقرار قبل از استقرار اجرا شود
- [ ] در صورت شکست تست‌ها، استقرار متوقف شود
- [ ] تست دود پس از استقرار سلامت را تایید کند
- [ ] هوک‌ها به ترتیب صحیح اجرا شوند

### تمرین 3: استراتژی استقرار چندمحیطی (45 دقیقه)
**هدف**: جریان کاری استقرار مرحله‌ای را پیاده‌سازی کنید (dev → staging → production)

```bash
# ایجاد اسکریپت استقرار
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# مرحله ۱: استقرار در محیط توسعه
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحله ۲: استقرار در محیط آماده‌سازی
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحله ۳: تأیید دستی برای محیط تولید
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

# ایجاد محیط‌ها
azd env new dev
azd env new staging
azd env new production

# اجرای استقرار مرحله‌ای
./deploy-staged.sh
```

**معیارهای موفقیت:**
- [ ] محیط Dev با موفقیت مستقر شود
- [ ] محیط Staging با موفقیت مستقر شود
- [ ] برای تولید تأیید دستی لازم باشد
- [ ] همه محیط‌ها چک‌های سلامت کارآمد داشته باشند
- [ ] امکان بازگشت در صورت نیاز وجود داشته باشد

### تمرین 4: استراتژی بازگشت (25 دقیقه)
**هدف**: بازگشت استقرار با استفاده از Git را پیاده‌سازی و تست کنید

```bash
# استقرار v1
azd env set APP_VERSION "1.0.0"
azd up

# ذخیرهٔ هش کامیت v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# استقرار v2 با تغییر ناسازگار
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# شناسایی خرابی و بازگردانی
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # بازگردانی با استفاده از git
    git revert HEAD --no-edit
    
    # بازگردانی محیط
    azd env set APP_VERSION "1.0.0"
    
    # استقرار مجدد v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**معیارهای موفقیت:**
- [ ] قادر به شناسایی خطاهای استقرار باشید
- [ ] اسکریپت بازگشت به‌صورت خودکار اجرا شود
- [ ] برنامه به حالت کار بازگردد
- [ ] پس از بازگشت، چک‌های سلامت برقرار باشند

## 📊 ردیابی معیارهای استقرار

### عملکرد استقرار خود را ردیابی کنید

```bash
# ایجاد اسکریپت معیارهای استقرار
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

# نوشتن لاگ در فایل
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# از آن استفاده کنید
./track-deployment.sh
```

**متریک‌های خود را تحلیل کنید:**
```bash
# مشاهده تاریخچه استقرار
cat deployment-metrics.csv

# محاسبه میانگین زمان استقرار
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## منابع بیشتر

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ناوبری**
- **درس قبلی**: [Your First Project](../chapter-01-foundation/first-project.md)
- **درس بعدی**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->