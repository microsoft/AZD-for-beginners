# راهنمای استقرار - تسلط بر استقرارهای AZD

**ناوبری فصل:**
- **📚 Course Home**: [AZD برای مبتدیان](../../README.md)
- **📖 Current Chapter**: فصل ۴ - زیرساخت به‌عنوان کد و استقرار
- **⬅️ Previous Chapter**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [تأمین منابع](provisioning.md)
- **🚀 Next Chapter**: [فصل ۵: راه‌حل‌های چندعاملهٔ هوش مصنوعی](../../examples/retail-scenario.md)

## مقدمه

این راهنمای جامع همه چیزهایی را که برای استقرار برنامه‌ها با استفاده از Azure Developer CLI نیاز دارید پوشش می‌دهد، از استقرارهای ابتدایی با یک فرمان تا سناریوهای پیچیدهٔ تولیدی با هوک‌های سفارشی، محیط‌های متعدد و یکپارچه‌سازی CI/CD. چرخهٔ کامل استقرار را با مثال‌های عملی و بهترین شیوه‌ها فرا بگیرید.

## اهداف یادگیری

با تکمیل این راهنما، شما:
- بر تمام دستورات و جریان‌های کاری استقرار Azure Developer CLI تسلط پیدا خواهید کرد
- چرخهٔ کامل استقرار را از تأمین تا پایش درک خواهید کرد
- هوک‌های استقرار سفارشی برای اتوماسیون قبل و بعد از استقرار پیاده‌سازی خواهید کرد
- محیط‌های متعدد را با پارامترهای مخصوص هر محیط پیکربندی خواهید کرد
- استراتژی‌های پیشرفتهٔ استقرار از جمله blue-green و canary را راه‌اندازی خواهید کرد
- استقرارهای azd را با پایپلاین‌های CI/CD و فرایندهای DevOps یکپارچه خواهید کرد

## خروجی‌های یادگیری

پس از اتمام، شما قادر خواهید بود:
- تمام جریان‌های کاری استقرار azd را به‌صورت مستقل اجرا و رفع‌عیب کنید
- اتوماسیون استقرار سفارشی با استفاده از هوک‌ها طراحی و پیاده‌سازی کنید
- استقرارهای آمادهٔ تولید را با امنیت و پایش مناسب پیکربندی کنید
- سناریوهای پیچیدهٔ استقرار چندمحیطی را مدیریت کنید
- عملکرد استقرار را بهینه کرده و استراتژی‌های بازگرداندن را پیاده‌سازی کنید
- استقرارهای azd را در شیوه‌های DevOps سازمانی یکپارچه کنید

## مروری بر استقرار

Azure Developer CLI چندین دستور استقرار فراهم می‌کند:
- `azd up` - روند کامل (provision + deploy)
- `azd provision` - فقط ایجاد/به‌روزرسانی منابع Azure
- `azd deploy` - فقط استقرار کد برنامه
- `azd package` - ساخت و بسته‌بندی برنامه‌ها

## روندهای پایه استقرار

### استقرار کامل (azd up)
رایج‌ترین روند برای پروژه‌های جدید:
```bash
# همه‌چیز را از ابتدا مستقر کنید
azd up

# با محیط مشخص مستقر کنید
azd up --environment production

# با پارامترهای سفارشی مستقر کنید
azd up --parameter location=westus2 --parameter sku=P1v2
```

### استقرار فقط زیرساخت
وقتی فقط نیاز به به‌روزرسانی منابع Azure دارید:
```bash
# تأمین/به‌روزرسانی زیرساخت
azd provision

# تأمین با اجرای آزمایشی (dry-run) برای پیش‌نمایش تغییرات
azd provision --preview

# تأمین سرویس‌های مشخص
azd provision --service database
```

### استقرار فقط کد
برای به‌روزرسانی‌های سریع برنامه:
```bash
# تمام سرویس‌ها را مستقر کنید
azd deploy

# خروجی مورد انتظار:
# در حال استقرار سرویس‌ها (azd deploy)
# - web: در حال استقرار... انجام شد
# - api: در حال استقرار... انجام شد
# موفقیت: استقرار شما در ۲ دقیقه و ۱۵ ثانیه تکمیل شد

# یک سرویس خاص را مستقر کنید
azd deploy --service web
azd deploy --service api

# استقرار با آرگومان‌های ساخت سفارشی
azd deploy --service api --build-arg NODE_ENV=production

# استقرار را تأیید کنید
azd show --output json | jq '.services'
```

### ✅ تأیید استقرار

بعد از هر استقرار، موفقیت را بررسی کنید:

```bash
# بررسی کنید که همه سرویس‌ها در حال اجرا هستند
azd show

# تست نقاط انتهایی سلامت
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# نظارت بر خطاها (به‌صورت پیش‌فرض در مرورگر باز می‌شود)
azd monitor --logs
```

**معیارهای موفقیت:**
- ✅ همه سرویس‌ها وضعیت "Running" را نشان دهند
- ✅ نقاط پایانی سلامت HTTP 200 برگردانند
- ✅ در ۵ دقیقهٔ گذشته هیچ لاگ خطا وجود نداشته باشد
- ✅ اپلیکیشن به درخواست‌های تست پاسخ دهد

## 🏗️ درک فرایند استقرار

### فاز ۱: هوک‌های پیش از پروویژن
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

### فاز ۲: تأمین زیرساخت
- الگوهای زیرساخت (Bicep/Terraform) را می‌خواند
- منابع Azure را ایجاد یا به‌روزرسانی می‌کند
- شبکه و امنیت را پیکربندی می‌کند
- نظارت و لاگ‌گیری را راه‌اندازی می‌کند

### فاز ۳: هوک‌های پس از پروویژن
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

### فاز ۴: بسته‌بندی اپلیکیشن
- کد برنامه را می‌سازد
- آرتیفکت‌های استقرار را ایجاد می‌کند
- برای پلتفرم هدف بسته‌بندی می‌کند (کانتینرها، فایل‌های ZIP و غیره)

### فاز ۵: هوک‌های قبل از استقرار
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

### فاز ۶: استقرار اپلیکیشن
- اپلیکیشن‌های بسته‌بندی‌شده را به سرویس‌های Azure مستقر می‌کند
- تنظیمات پیکربندی را به‌روزرسانی می‌کند
- سرویس‌ها را راه‌اندازی/راه‌اندازی مجدد می‌کند

### فاز ۷: هوک‌های پس از استقرار
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

## 🎛️ پیکربندی استقرار

### تنظیمات استقرار مخصوص سرویس
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

# محیط آزمایشی
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

### اپلیکیشن‌های چندسرویسی
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

### استقرار آبی-سبز
```bash
# ایجاد محیط آبی
azd env new production-blue
azd up --environment production-blue

# تست محیط آبی
./scripts/test-environment.sh production-blue

# هدایت ترافیک به آبی (به‌روزرسانی دستی DNS/لود بالانسر)
./scripts/switch-traffic.sh production-blue

# پاک‌سازی محیط سبز
azd env select production-green
azd down --force
```

### استقرار کاناری
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

### استقرار مرحله‌ای
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

## 🐳 استقرار کانتینرها

### استقرار اپلیکیشن‌های کانتینری
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
# برای تکرار سریع‌تر یک سرویس مشخص را مستقر کنید
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
# برای تغییرات فقط مربوط به کد از azd deploy (نه azd up) استفاده کنید
# این فرآیند فراهم‌سازی زیرساخت را رد می‌کند و بسیار سریع‌تر است
azd deploy

# برای سریع‌ترین تکرار، سرویس مشخص را مستقر کنید
azd deploy --service api
```

## 🔍 پایش استقرار

### نظارت بلادرنگ بر استقرار
```bash
# نظارت بر برنامه به‌صورت بلادرنگ
azd monitor --live

# مشاهده لاگ‌های برنامه
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

# سلامت برنامه را بررسی کنید
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
# اطلاعات محرمانه را به‌صورت ایمن ذخیره کنید
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# به اسرار در فایل azure.yaml ارجاع دهید
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

## 🚨 استراتژی‌های بازگرداندن

### بازگشت سریع
```bash
# AZD قابلیت بازگردانی (rollback) داخلی ندارد. راهکارهای پیشنهادی:

# گزینهٔ ۱: استقرار مجدد از Git (توصیه‌شده)
git revert HEAD  # کامیت مشکل‌دار را بازگردانید
git push
azd deploy

# گزینهٔ ۲: استقرار مجدد یک کامیت مشخص
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### بازگشت زیرساخت
```bash
# پیش‌نمایش تغییرات زیرساخت قبل از اعمال
azd provision --preview

# برای بازگردانی زیرساخت، از کنترل نسخه استفاده کنید:
git revert HEAD  # تغییرات زیرساخت را بازگردانید
azd provision    # وضعیت قبلی زیرساخت را اعمال کنید
```

### بازگردانی مهاجرت پایگاه‌داده
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 شاخص‌های استقرار

### ردیابی عملکرد استقرار
```bash
# مشاهده وضعیت فعلی استقرار
azd show

# نظارت بر برنامه با Application Insights
azd monitor --overview

# مشاهده معیارهای بلادرنگ
azd monitor --live
```

### جمع‌آوری متریک‌های سفارشی
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

### 1. سازگاری محیط
```bash
# از نام‌گذاری سازگار استفاده کنید
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# هماهنگی محیط‌ها را حفظ کنید
./scripts/sync-environments.sh
```

### 2. اعتبارسنجی زیرساخت
```bash
# قبل از استقرار، تغییرات زیرساخت را پیش‌نمایش کنید
azd provision --preview

# از linting برای ARM/Bicep استفاده کنید
az bicep lint --file infra/main.bicep

# نحو Bicep را اعتبارسنجی کنید
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
# مستندسازی فرآیندهای استقرار
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## گام‌های بعدی

- [تأمین منابع](provisioning.md) - بررسی عمیق مدیریت زیرساخت
- [برنامه‌ریزی قبل از استقرار](../chapter-06-pre-deployment/capacity-planning.md) - استراتژی استقرار خود را برنامه‌ریزی کنید
- [مشکلات رایج](../chapter-07-troubleshooting/common-issues.md) - حل مسائل استقرار
- [بهترین شیوه‌ها](../chapter-07-troubleshooting/debugging.md) - استراتژی‌های آمادهٔ تولید برای استقرار

## 🎯 تمرینات عملی استقرار

### تمرین ۱: روند استقرار افزایشی (۲۰ دقیقه)
**هدف**: تسلط بر تفاوت بین استقرار کامل و افزایشی

```bash
# استقرار اولیه
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# زمان استقرار اولیه را ثبت کنید
echo "Full deployment: $(date)" > deployment-log.txt

# تغییری در کد ایجاد کنید
echo "// Updated $(date)" >> src/api/src/server.js

# فقط کد را مستقر کنید (سریع)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# زمان‌ها را مقایسه کنید
cat deployment-log.txt

# پاک‌سازی کنید
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار کامل ۵-۱۵ دقیقه طول بکشد
- [ ] استقرار فقط کد ۲-۵ دقیقه طول بکشد
- [ ] تغییرات کد در اپ مستقر منعکس شده باشند
- [ ] زیرساخت پس از `azd deploy` تغییر نکرده باشد

**خروجی یادگیری**: `azd deploy` برای تغییرات کد ۵۰–۷۰٪ سریع‌تر از `azd up` است

### تمرین ۲: هوک‌های استقرار سفارشی (۳۰ دقیقه)
**هدف**: پیاده‌سازی اتوماسیون قبل و بعد از استقرار

```bash
# ایجاد اسکریپت اعتبارسنجی قبل از استقرار
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# بررسی اینکه تست‌ها موفقیت‌آمیز هستند
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

# ایجاد تست سریع پس از استقرار
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
- [ ] اسکریپت پیش‌استقرار قبل از استقرار اجرا شود
- [ ] در صورت شکست تست‌ها، استقرار متوقف شود
- [ ] تست دود پس از استقرار سلامت را اعتبارسنجی کند
- [ ] هوک‌ها به ترتیب درست اجرا شوند

### تمرین ۳: استراتژی استقرار چندمحیطی (۴۵ دقیقه)
**هدف**: پیاده‌سازی گردش کار استقرار مرحله‌ای (dev → staging → production)

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

# مرحله ۲: استقرار در محیط آزمایشی
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
- [ ] برای Production تأیید دستی لازم باشد
- [ ] همهٔ محیط‌ها بررسی‌های سلامت کارآمد داشته باشند
- [ ] در صورت نیاز امکان بازگردانی وجود داشته باشد

### تمرین ۴: استراتژی بازگرداندن (۲۵ دقیقه)
**هدف**: پیاده‌سازی و تست بازگرداندن استقرار با استفاده از Git

```bash
# استقرار نسخه v1
azd env set APP_VERSION "1.0.0"
azd up

# ذخیره هش کامیت نسخه v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# استقرار نسخه v2 با تغییر ناسازگار
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# شناسایی خطا و بازگردانی
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # بازگردانی با استفاده از git
    git revert HEAD --no-edit
    
    # بازگردانی محیط
    azd env set APP_VERSION "1.0.0"
    
    # استقرار مجدد نسخه v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**معیارهای موفقیت:**
- [ ] توانایی تشخیص شکست‌های استقرار وجود داشته باشد
- [ ] اسکریپت بازگردانی به‌صورت خودکار اجرا شود
- [ ] اپلیکیشن به حالت کاری بازگردد
- [ ] بعد از بازگردانی بررسی‌های سلامت گذرانده شوند

## 📊 ردیابی متریک‌های استقرار

### عملکرد استقرار خود را پیگیری کنید

```bash
# ایجاد اسکریپت متریک‌های استقرار
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

# ثبت در فایل
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# از آن استفاده کنید
./track-deployment.sh
```

**متریک‌های خود را تحلیل کنید:**
```bash
# ‎مشاهدهٔ تاریخچهٔ استقرار
cat deployment-metrics.csv

# ‎محاسبهٔ میانگین زمان استقرار
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## منابع بیشتر

- [مرجع استقرار Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [استقرار Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [استقرار Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [استقرار Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ناوبری**
- **جلسهٔ قبلی**: [پروژهٔ اول شما](../chapter-01-foundation/first-project.md)
- **جلسهٔ بعدی**: [تأمین منابع](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->