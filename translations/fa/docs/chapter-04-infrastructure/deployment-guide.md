# راهنمای استقرار - تسلط بر استقرارهای AZD

**📚 صفحه دوره**: [AZD برای مبتدیان](../../README.md)
**📖 فصل جاری**: فصل 4 - زیرساخت به‌عنوان کد و استقرار
**⬅️ فصل قبلی**: [فصل 3: پیکربندی](../chapter-03-configuration/configuration.md)
**➡️ بعدی**: [تأمین منابع](provisioning.md)
**🚀 فصل بعدی**: [فصل 5: راهکارهای هوش مصنوعی چندعاملی](../../examples/retail-scenario.md)

## مقدمه

این## درک فرآیند استقرارراهنمای جامع همه چیزهایی را که باید درباره استقرار برنامه‌ها با استفاده از Azure Developer CLI بدانید پوشش می‌دهد، از استقرارهای تک‌دستوری ساده تا سناریوهای تولید پیشرفته با هوک‌های سفارشی، چندین محیط و یکپارچه‌سازی CI/CD. چرخه کامل عمر استقرار را با مثال‌های عملی و بهترین شیوه‌ها فراگیرید.

## اهداف یادگیری

با تکمیل این راهنما، شما خواهید:
- تسلط بر تمام دستورات و گردش‌کارهای استقرار Azure Developer CLI
- درک چرخه کامل عمر استقرار از تأمین منابع تا پایش
- پیاده‌سازی هوک‌های استقرار سفارشی برای خودکارسازی قبل و بعد از استقرار
- پیکربندی چندین محیط با پارامترهای مخصوص هر محیط
- راه‌اندازی استراتژی‌های پیشرفته استقرار از جمله استقرارهای آبی-سبز و کاناری
- یکپارچه‌سازی استقرارهای azd با خطوط لوله CI/CD و گردش‌کارهای DevOps

## نتایج یادگیری

با اتمام، شما قادر خواهید بود:
- اجرای مستقل و عیب‌یابی تمام گردش‌کارهای استقرار azd
- طراحی و پیاده‌سازی خودکارسازی استقرار سفارشی با استفاده از هوک‌ها
- پیکربندی استقرارهای آماده تولید با امنیت و پایش مناسب
- مدیریت سناریوهای استقرار پیچیده چندمحیطی
- بهینه‌سازی عملکرد استقرار و پیاده‌سازی استراتژی‌های بازگرداندن
- یکپارچه‌سازی استقرارهای azd در شیوه‌های DevOps سازمانی

## مرور کلی استقرار

Azure Developer CLI چندین فرمان استقرار ارائه می‌دهد:
- `azd up` - گردش‌کار کامل (تأمین + استقرار)
- `azd provision` - فقط ایجاد/به‌روزرسانی منابع Azure
- `azd deploy` - فقط استقرار کد برنامه
- `azd package` - ساخت و بسته‌بندی برنامه‌ها

## گردش‌کارهای استقرار پایه

### استقرار کامل (azd up)
The most common workflow for new projects:
```bash
# همه چیز را از ابتدا مستقر کنید
azd up

# با محیط مشخص مستقر کنید
azd up --environment production

# با پارامترهای سفارشی مستقر کنید
azd up --parameter location=westus2 --parameter sku=P1v2
```

### استقرار فقط زیرساخت
وقتی فقط نیاز به به‌روزرسانی منابع Azure دارید:
```bash
# تأمین/به‌روزرسانی زیرساخت‌ها
azd provision

# تأمین با اجرای آزمایشی برای پیش‌نمایش تغییرات
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
# موفقیت: استقرار شما در 2 دقیقه و 15 ثانیه تکمیل شد

# یک سرویس مشخص را مستقر کنید
azd deploy --service web
azd deploy --service api

# استقرار با آرگومان‌های ساخت سفارشی
azd deploy --service api --build-arg NODE_ENV=production

# استقرار را تأیید کنید
azd show --output json | jq '.services'
```

### ✅ تأیید استقرار

پس از هر استقرار، موفقیت را تأیید کنید:

```bash
# بررسی کنید که همه سرویس‌ها در حال اجرا باشند
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
- ✅ همه سرویس‌ها وضعیت «در حال اجرا» را نشان می‌دهند
- ✅ نقاط پایش سلامت پاسخ HTTP 200 باز می‌گردانند
- ✅ در پنج دقیقه گذشته لاگ خطا وجود ندارد
- ✅ برنامه به درخواست‌های تست پاسخ می‌دهد

## 🏗️ درک فرآیند استقرار

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
- راه‌اندازی پایش و لاگ‌گیری

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
- ایجاد مصنوعات استقرار
- بسته‌بندی برای پلتفرم هدف (کانتینرها، فایل‌های ZIP، و غیره)

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
- استقرار برنامه‌های بسته‌بندی‌شده به سرویس‌های Azure
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

### پیکربندی‌های مخصوص هر محیط
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

### استقرارهای آبی-سبز
```bash
# ایجاد محیط آبی
azd env new production-blue
azd up --environment production-blue

# آزمایش محیط آبی
./scripts/test-environment.sh production-blue

# انتقال ترافیک به محیط آبی (به‌روزرسانی دستی DNS/تعادل بار)
./scripts/switch-traffic.sh production-blue

# پاک‌سازی محیط سبز
azd env select production-green
azd down --force
```

### استقرارهای کاناری
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
# استقرار-مرحله‌ای.sh

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

# همه سرویس‌ها را مستقر کنید
azd deploy
```

### کش‌بندی ساخت
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### استقرار کد بهینه
```bash
# برای تغییرات فقط کد از azd deploy استفاده کنید (نه azd up)
# این تهیهٔ زیرساخت را انجام نمی‌دهد و بسیار سریع‌تر است
azd deploy

# برای سریع‌ترین تکرار، سرویس مشخص را مستقر کنید
azd deploy --service api
```

## 🔍 پایش استقرار

### پایش استقرار در زمان واقعی
```bash
# نظارت بلادرنگ بر برنامه
azd monitor --live

# مشاهده لاگ‌های برنامه
azd monitor --logs

# بررسی وضعیت استقرار
azd show
```

### بررسی‌های سلامتی
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
# اطلاعات حساس را به‌صورت ایمن ذخیره کنید
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

## 🚨 استراتژی‌های بازگشت

### بازگشت سریع
```bash
# AZD قابلیت بازگردانی داخلی ندارد. راهکارهای پیشنهادی:

# گزینهٔ ۱: استقرار مجدد از Git (توصیه‌شده)
git revert HEAD  # کامیت مشکل‌دار را بازگردانید
git push
azd deploy

# گزینهٔ ۲: استقرار مجدد یک کامیت خاص
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### بازگشت زیرساخت
```bash
# قبل از اعمال، تغییرات زیرساخت را پیش‌نمایش کنید
azd provision --preview

# برای بازگردانی زیرساخت، از کنترل نسخه استفاده کنید:
git revert HEAD  # تغییرات زیرساخت را بازگردانید
azd provision    # وضعیت قبلی زیرساخت را اعمال کنید
```

### بازگشت مهاجرت پایگاه‌داده
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

# مشاهده شاخص‌های زنده
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

### 1. سازگاری محیط
```bash
# از نام‌گذاری سازگار استفاده کنید
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# تطابق محیط‌ها را حفظ کنید
./scripts/sync-environments.sh
```

### 2. اعتبارسنجی زیرساخت
```bash
# پیش‌نمایش تغییرات زیرساخت قبل از استقرار
azd provision --preview

# از linting برای ARM/Bicep استفاده کنید
az bicep lint --file infra/main.bicep

# نحو Bicep را اعتبارسنجی کنید
az bicep build --file infra/main.bicep
```

### 3. یکپارچه‌سازی تست‌ها
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
# مستندسازی رویه‌های استقرار
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## مراحل بعدی

- [تأمین منابع](provisioning.md) - بررسی عمیق مدیریت زیرساخت
- [برنامه‌ریزی پیش از استقرار](../chapter-06-pre-deployment/capacity-planning.md) - استراتژی استقرار خود را برنامه‌ریزی کنید
- [مسائل رایج](../chapter-07-troubleshooting/common-issues.md) - رفع مشکلات استقرار
- [بهترین شیوه‌ها](../chapter-07-troubleshooting/debugging.md) - استراتژی‌های استقرار آماده تولید

## 🎯 تمرین‌های عملی استقرار

### تمرین 1: گردش‌کار استقرار افزایشی (20 دقیقه)
**هدف**: تسلط بر تفاوت بین استقرار کامل و افزایشی

```bash
# استقرار اولیه
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ثبت زمان استقرار اولیه
echo "Full deployment: $(date)" > deployment-log.txt

# ایجاد تغییر در کد
echo "// Updated $(date)" >> src/api/src/server.js

# فقط کد را مستقر کن (سریع)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# مقایسهٔ زمان‌ها
cat deployment-log.txt

# پاک‌سازی
azd down --force --purge
```

**معیارهای موفقیت:**
- [ ] استقرار کامل 5-15 دقیقه طول بکشد
- [ ] استقرار فقط کد 2-5 دقیقه طول بکشد
- [ ] تغییرات کد در برنامه مستقر بازتاب یابد
- [ ] زیرساخت پس از `azd deploy` تغییر نکند

**نتیجه یادگیری**: `azd deploy` برای تغییرات کد 50-70٪ سریع‌تر از `azd up` است

### تمرین 2: هوک‌های استقرار سفارشی (30 دقیقه)
**هدف**: پیاده‌سازی خودکارسازی قبل و بعد از استقرار

```bash
# ایجاد اسکریپت اعتبارسنجی قبل از استقرار
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# بررسی موفقیت تست‌ها
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

# ایجاد تست سریع (smoke test) پس از استقرار
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

# افزودن هوک‌ها به فایل azure.yaml
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
- [ ] تست دود (smoke test) پس از استقرار سلامت را تأیید کند
- [ ] هوک‌ها به ترتیب صحیح اجرا شوند

### تمرین 3: استراتژی استقرار چندمحیطی (45 دقیقه)
**هدف**: پیاده‌سازی گردش‌کار استقرار مرحله‌ای (dev → staging → production)

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

# مرحله ۲: استقرار در محیط پیش‌تولید
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
- [ ] محیط dev با موفقیت مستقر شود
- [ ] محیط staging با موفقیت مستقر شود
- [ ] برای production تأیید دستی لازم باشد
- [ ] تمام محیط‌ها چک‌های سلامتی فعال داشته باشند
- [ ] در صورت نیاز قابلیت بازگردانی وجود داشته باشد

### تمرین 4: استراتژی بازگشت (25 دقیقه)
**هدف**: پیاده‌سازی و آزمایش بازگشت استقرار با استفاده از Git

```bash
# استقرار v1
azd env set APP_VERSION "1.0.0"
azd up

# ذخیره هش کامیت v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# استقرار v2 با تغییر ناسازگار
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# شناسایی شکست و بازگردانی
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
- [ ] قادر به شناسایی شکست‌های استقرار باشد
- [ ] اسکریپت بازگشت به‌صورت خودکار اجرا شود
- [ ] برنامه به حالت کاری بازگردد
- [ ] پس از بازگشت، بررسی‌های سلامتی موفق باشند

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
- **درس قبلی**: [اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **درس بعدی**: [تأمین منابع](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ مبتنی بر هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. هرچند ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطا یا نادرستی باشند. نسخهٔ اصلی سند به زبان بومی آن باید به‌عنوان مرجع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا برداشت نادرستی که از استفاده از این ترجمه ناشی شود مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->