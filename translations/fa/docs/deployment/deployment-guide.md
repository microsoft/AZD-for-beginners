<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6ae5503cd909d625f01efa4d9e99799e",
  "translation_date": "2025-11-19T23:41:42+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "fa"
}
-->
# راهنمای استقرار - تسلط بر استقرارهای AZD

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۴ - زیرساخت به عنوان کد و استقرار
- **⬅️ فصل قبلی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)
- **➡️ بعدی**: [تأمین منابع](provisioning.md)
- **🚀 فصل بعدی**: [فصل ۵: راه‌حل‌های هوش مصنوعی چندعاملی](../../examples/retail-scenario.md)

## مقدمه

این راهنمای جامع همه چیزهایی که باید درباره استقرار برنامه‌ها با استفاده از Azure Developer CLI بدانید را پوشش می‌دهد، از استقرارهای ساده با یک دستور تا سناریوهای پیشرفته تولید با هوک‌های سفارشی، محیط‌های متعدد و یکپارچه‌سازی CI/CD. با مثال‌های عملی و بهترین شیوه‌ها، چرخه کامل استقرار را بیاموزید.

## اهداف یادگیری

با تکمیل این راهنما، شما:
- به تمام دستورات و جریان‌های کاری استقرار Azure Developer CLI مسلط خواهید شد.
- چرخه کامل استقرار از تأمین منابع تا نظارت را درک خواهید کرد.
- هوک‌های سفارشی برای اتوماسیون قبل و بعد از استقرار پیاده‌سازی خواهید کرد.
- محیط‌های متعدد را با پارامترهای خاص هر محیط پیکربندی خواهید کرد.
- استراتژی‌های پیشرفته استقرار از جمله استقرار آبی-سبز و قناری را تنظیم خواهید کرد.
- استقرارهای azd را با خطوط لوله CI/CD و جریان‌های کاری DevOps یکپارچه خواهید کرد.

## نتایج یادگیری

پس از اتمام، شما قادر خواهید بود:
- تمام جریان‌های کاری استقرار azd را به طور مستقل اجرا و عیب‌یابی کنید.
- اتوماسیون استقرار سفارشی با استفاده از هوک‌ها طراحی و پیاده‌سازی کنید.
- استقرارهای آماده تولید با امنیت و نظارت مناسب پیکربندی کنید.
- سناریوهای پیچیده استقرار چندمحیطی را مدیریت کنید.
- عملکرد استقرار را بهینه کرده و استراتژی‌های بازگشت به حالت قبل را پیاده‌سازی کنید.
- استقرارهای azd را در شیوه‌های DevOps سازمانی ادغام کنید.

## نمای کلی استقرار

Azure Developer CLI چندین دستور استقرار ارائه می‌دهد:
- `azd up` - جریان کاری کامل (تأمین + استقرار)
- `azd provision` - فقط ایجاد/به‌روزرسانی منابع Azure
- `azd deploy` - فقط استقرار کد برنامه
- `azd package` - ساخت و بسته‌بندی برنامه‌ها

## جریان‌های کاری استقرار پایه

### استقرار کامل (azd up)
رایج‌ترین جریان کاری برای پروژه‌های جدید:
```bash
# همه چیز را از ابتدا مستقر کنید
azd up

# با محیط خاص مستقر کنید
azd up --environment production

# با پارامترهای سفارشی مستقر کنید
azd up --parameter location=westus2 --parameter sku=P1v2
```

### استقرار فقط زیرساخت
زمانی که فقط نیاز به به‌روزرسانی منابع Azure دارید:
```bash
# تهیه/به‌روزرسانی زیرساخت
azd provision

# تهیه با اجرای آزمایشی برای پیش‌نمایش تغییرات
azd provision --preview

# تهیه خدمات خاص
azd provision --service database
```

### استقرار فقط کد
برای به‌روزرسانی سریع برنامه:
```bash
# همه خدمات را مستقر کنید
azd deploy

# خروجی مورد انتظار:
# استقرار خدمات (azd deploy)
# - وب: در حال استقرار... انجام شد
# - ای‌پی‌آی: در حال استقرار... انجام شد
# موفقیت: استقرار شما در ۲ دقیقه و ۱۵ ثانیه تکمیل شد

# استقرار یک خدمت خاص
azd deploy --service web
azd deploy --service api

# استقرار با آرگومان‌های ساخت سفارشی
azd deploy --service api --build-arg NODE_ENV=production

# تأیید استقرار
azd show --output json | jq '.services'
```

### ✅ تأیید استقرار

پس از هر استقرار، موفقیت را تأیید کنید:

```bash
# بررسی کنید که همه خدمات در حال اجرا هستند
azd show

# نقاط پایانی سلامت را آزمایش کنید
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# لاگ‌ها را برای خطاها بررسی کنید
azd logs --service api --since 5m | grep -i error
```

**معیارهای موفقیت:**
- ✅ تمام سرویس‌ها وضعیت "در حال اجرا" را نشان می‌دهند.
- ✅ نقاط پایانی سلامت HTTP 200 بازمی‌گردانند.
- ✅ هیچ خطای لاگی در ۵ دقیقه گذشته وجود ندارد.
- ✅ برنامه به درخواست‌های آزمایشی پاسخ می‌دهد.

## 🏗️ درک فرآیند استقرار

### فاز ۱: هوک‌های پیش از تأمین
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
- خواندن قالب‌های زیرساخت (Bicep/Terraform)
- ایجاد یا به‌روزرسانی منابع Azure
- پیکربندی شبکه و امنیت
- تنظیم نظارت و لاگ‌گیری

### فاز ۳: هوک‌های پس از تأمین
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

### فاز ۴: بسته‌بندی برنامه
- ساخت کد برنامه
- ایجاد مصنوعات استقرار
- بسته‌بندی برای پلتفرم هدف (کانتینرها، فایل‌های ZIP و غیره)

### فاز ۵: هوک‌های پیش از استقرار
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

### فاز ۶: استقرار برنامه
- استقرار برنامه‌های بسته‌بندی‌شده در سرویس‌های Azure
- به‌روزرسانی تنظیمات پیکربندی
- شروع/راه‌اندازی مجدد سرویس‌ها

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

### تنظیمات استقرار خاص سرویس
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

### پیکربندی‌های خاص محیط
```bash
# محیط توسعه
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# محیط مرحله‌بندی
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

### استقرار آبی-سبز
```bash
# ایجاد محیط آبی
azd env new production-blue
azd up --environment production-blue

# آزمایش محیط آبی
./scripts/test-environment.sh production-blue

# تغییر ترافیک به آبی (به‌روزرسانی دستی DNS/متعادل‌کننده بار)
./scripts/switch-traffic.sh production-blue

# پاکسازی محیط سبز
azd env select production-green
azd down --force
```

### استقرار قناری
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

## 🐳 استقرار کانتینر

### استقرار برنامه‌های کانتینری
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

### بهینه‌سازی چندمرحله‌ای Dockerfile
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

### استقرارهای موازی
```bash
# پیکربندی استقرار موازی
azd config set deploy.parallelism 5

# استقرار خدمات به صورت موازی
azd deploy --parallel
```

### کش‌سازی ساخت
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

### استقرارهای افزایشی
```bash
# فقط سرویس‌های تغییر یافته را مستقر کنید
azd deploy --incremental

# با تشخیص تغییر مستقر کنید
azd deploy --detect-changes
```

## 🔍 نظارت بر استقرار

### نظارت بر استقرار در زمان واقعی
```bash
# نظارت بر پیشرفت استقرار
azd deploy --follow

# مشاهده گزارش‌های استقرار
azd logs --follow --service api

# بررسی وضعیت استقرار
azd show --service api
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
# ذخیره اسرار به صورت امن
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# ارجاع اسرار در azure.yaml
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

## 🚨 استراتژی‌های بازگشت به حالت قبل

### بازگشت سریع
```bash
# بازگشت به استقرار قبلی
azd deploy --rollback

# بازگشت سرویس خاص
azd deploy --service api --rollback

# بازگشت به نسخه خاص
azd deploy --service api --version v1.2.3
```

### بازگشت زیرساخت
```bash
# بازگرداندن تغییرات زیرساخت
azd provision --rollback

# پیش‌نمایش تغییرات بازگردانی
azd provision --rollback --preview
```

### بازگشت مهاجرت پایگاه داده
```bash
#!/bin/bash
# اسکریپت‌ها/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 معیارهای استقرار

### ردیابی عملکرد استقرار
```bash
# فعال کردن معیارهای استقرار
azd config set telemetry.deployment.enabled true

# مشاهده تاریخچه استقرار
azd history

# دریافت آمار استقرار
azd metrics --type deployment
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

### ۱. ثبات محیط
```bash
# از نامگذاری یکسان استفاده کنید
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# برابری محیط را حفظ کنید
./scripts/sync-environments.sh
```

### ۲. اعتبارسنجی زیرساخت
```bash
# قبل از استقرار اعتبارسنجی کنید
azd provision --preview
azd provision --what-if

# از linting ARM/Bicep استفاده کنید
az bicep lint --file infra/main.bicep
```

### ۳. یکپارچه‌سازی تست
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

### ۴. مستندسازی و لاگ‌گیری
```bash
# مستندسازی روش‌های استقرار
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## گام‌های بعدی

- [تأمین منابع](provisioning.md) - بررسی عمیق مدیریت زیرساخت
- [برنامه‌ریزی پیش از استقرار](../pre-deployment/capacity-planning.md) - برنامه‌ریزی استراتژی استقرار
- [مشکلات رایج](../troubleshooting/common-issues.md) - حل مشکلات استقرار
- [بهترین شیوه‌ها](../troubleshooting/debugging.md) - استراتژی‌های استقرار آماده تولید

## 🎯 تمرین‌های عملی استقرار

### تمرین ۱: جریان کاری استقرار افزایشی (۲۰ دقیقه)
**هدف**: تفاوت بین استقرار کامل و افزایشی را بیاموزید

```bash
# استقرار اولیه
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ثبت زمان استقرار اولیه
echo "Full deployment: $(date)" > deployment-log.txt

# ایجاد تغییر در کد
echo "// Updated $(date)" >> src/api/src/server.js

# فقط کد را مستقر کنید (سریع)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# مقایسه زمان‌ها
cat deployment-log.txt

# پاکسازی
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار کامل ۵-۱۵ دقیقه طول می‌کشد.
- [ ] استقرار فقط کد ۲-۵ دقیقه طول می‌کشد.
- [ ] تغییرات کد در برنامه مستقر منعکس می‌شود.
- [ ] زیرساخت پس از `azd deploy` بدون تغییر باقی می‌ماند.

**نتیجه یادگیری**: `azd deploy` برای تغییرات کد ۵۰-۷۰٪ سریع‌تر از `azd up` است.

### تمرین ۲: هوک‌های سفارشی استقرار (۳۰ دقیقه)
**هدف**: پیاده‌سازی اتوماسیون قبل و بعد از استقرار

```bash
# ایجاد اسکریپت اعتبارسنجی قبل از استقرار
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# بررسی کنید که آیا تست‌ها موفق هستند
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# بررسی تغییرات ذخیره‌نشده
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ایجاد تست دود پس از استقرار
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
- [ ] اسکریپت پیش از استقرار قبل از استقرار اجرا می‌شود.
- [ ] استقرار در صورت شکست تست‌ها متوقف می‌شود.
- [ ] تست دود پس از استقرار سلامت را اعتبارسنجی می‌کند.
- [ ] هوک‌ها به ترتیب صحیح اجرا می‌شوند.

### تمرین ۳: استراتژی استقرار چندمحیطی (۴۵ دقیقه)
**هدف**: پیاده‌سازی جریان کاری استقرار مرحله‌ای (dev → staging → production)

```bash
# ایجاد اسکریپت استقرار
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# مرحله ۱: استقرار در توسعه
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحله ۲: استقرار در مرحله‌بندی
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# مرحله ۳: تأیید دستی برای تولید
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
- [ ] محیط توسعه با موفقیت مستقر می‌شود.
- [ ] محیط staging با موفقیت مستقر می‌شود.
- [ ] تأیید دستی برای تولید مورد نیاز است.
- [ ] تمام محیط‌ها بررسی‌های سلامت کارآمد دارند.
- [ ] امکان بازگشت به حالت قبل وجود دارد.

### تمرین ۴: استراتژی بازگشت به حالت قبل (۲۵ دقیقه)
**هدف**: پیاده‌سازی و آزمایش بازگشت به حالت قبل

```bash
# استقرار نسخه ۱
azd env set APP_VERSION "1.0.0"
azd up

# ذخیره تنظیمات نسخه ۱
cp -r .azure/production .azure/production-v1-backup

# استقرار نسخه ۲ با تغییرات مخرب
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# شناسایی خرابی
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # بازگرداندن کد
    git checkout src/api/src/server.js
    
    # بازگرداندن محیط
    azd env set APP_VERSION "1.0.0"
    
    # استقرار مجدد نسخه ۱
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**معیارهای موفقیت:**
- [ ] می‌توان شکست‌های استقرار را شناسایی کرد.
- [ ] اسکریپت بازگشت به حالت قبل به طور خودکار اجرا می‌شود.
- [ ] برنامه به حالت کاری بازمی‌گردد.
- [ ] بررسی‌های سلامت پس از بازگشت به حالت قبل موفقیت‌آمیز هستند.

## 📊 ردیابی معیارهای استقرار

### عملکرد استقرار خود را ردیابی کنید

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

**تحلیل معیارهای خود:**
```bash
# مشاهده تاریخچه استقرار
cat deployment-metrics.csv

# محاسبه میانگین زمان استقرار
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## منابع اضافی

- [مرجع استقرار Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [استقرار Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [استقرار Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [استقرار Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ناوبری**
- **درس قبلی**: [اولین پروژه شما](../getting-started/first-project.md)
- **درس بعدی**: [تأمین منابع](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->