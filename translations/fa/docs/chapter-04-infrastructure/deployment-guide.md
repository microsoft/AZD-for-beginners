# راهنمای استقرار - تسلط بر استقرارهای AZD

**هدایت فصل:**
- **📚 خانه دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل جاری**: فصل ۴ - زیرساخت به‌عنوان کد و استقرار
- **⬅️ فصل قبلی**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)
- **➡️ بعدی**: [تأمین منابع](provisioning.md)
- **🧩 همچنین در این فصل**: [نوشتن قالب خودتان](custom-templates.md)
- **🚀 فصل بعدی**: [فصل ۵: راه‌حل‌های هوش مصنوعی چندعاملی](../../examples/retail-scenario.md)

## مقدمه

> بررسی شده در برابر `azd 1.37.2` (نوامبر ۲۰۲۶). دستورات از Bash استفاده می‌کنند؛ مثال‌های JSON نیاز به `jq` دارند. به جز تمرین todo که صراحتاً مقداردهی اولیه شده است، مثال‌های پیشرفته **قطعات یکپارچه‌سازی** هستند: منبع، زیرساخت، آزمایش‌ها و اسکریپت‌های خود را تأمین کنید. در این بررسی هیچ استقرار Azure اجرا نشده است.

این راهنمای جامع همه چیزهایی را که باید درباره استقرار برنامه‌ها با استفاده از Azure Developer CLI بدانید پوشش می‌دهد، از استقرارهای ساده با یک دستور تا سناریوهای پیشرفته تولید با قلاب‌های سفارشی، محیط‌های متعدد و ادغام CI/CD. چرخه کامل استقرار را با مثال‌های عملی و بهترین روش‌ها به‌خوبی بیاموزید.

## اهداف یادگیری

با تکمیل این راهنما، شما خواهید توانست:
- تسلط بر همه دستورات و روندهای استقرار Azure Developer CLI
- درک کامل چرخه عمر استقرار از تأمین تا نظارت
- پیاده‌سازی قلاب‌های سفارشی استقرار برای اتوماسیون پیش و پس از استقرار
- پیکربندی چندین محیط با پارامترهای مخصوص هر محیط
- راه‌اندازی استراتژی‌های پیشرفته استقرار از جمله استقرارهای آبی-سبز و کناری
- ادغام استقرارهای azd با خطوط CI/CD و روندهای DevOps

## نتایج یادگیری

پس از اتمام، شما قادر خواهید بود:
- به‌صورت مستقل همه روندهای استقرار azd را اجرا و عیب‌یابی کنید
- اتوماسیون استقرار سفارشی با استفاده از قلاب‌ها طراحی و پیاده‌سازی کنید
- استقرارهای آماده تولید با امنیت و نظارت مناسب پیکربندی کنید
- مدیریت سناریوهای پیچیده استقرار چندمحیطی را انجام دهید
- عملکرد استقرار را بهینه کنید و استراتژی‌های بازگشت به عقب را پیاده‌سازی کنید
- استقرارهای azd را در رویه‌های سازمانی DevOps ادغام کنید

## نمای کلی استقرار

Azure Developer CLI چندین دستور استقرار دارد:
- `azd up` - روند کامل (تأمین + استقرار)
- `azd provision` - فقط ایجاد/به‌روزرسانی منابع Azure
- `azd deploy` - فقط استقرار کد برنامه
- `azd package` - ساخت و بسته‌بندی برنامه‌ها

## روندهای پایه استقرار

### استقرار کامل (azd up)
رایج‌ترین روند برای پروژه‌های جدید:
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

### استقرار فقط زیرساخت
زمانی که فقط نیاز به به‌روزرسانی منابع Azure دارید:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### استقرار فقط کد
برای به‌روزرسانی سریع برنامه:
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

### ✅ تأیید استقرار

پس از هر استقرار، موفقیت را بررسی کنید:

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

**معیارهای موفقیت:**
- ✅ `azd show` به اهداف سرویس/آدرس‌های URL مورد انتظار پاسخ می‌دهد
- ✅ درخواست‌ها به مسیرهای واقعی برنامه وضعیت و بدنه مورد انتظار را برمی‌گردانند
- ✅ هیچ خطای لاگ در ۵ دقیقه اخیر ثبت نشده است
- ✅ برنامه به درخواست‌های آزمایشی پاسخ می‌دهد

## 🏗️ درک فرآیند استقرار

### تازه با قلاب‌ها آشنا شده‌اید؟ اینجا شروع کنید

**قلاب** دستوری است که azd به طور خودکار در لحظه مشخصی از فرایند استقرار اجرا می‌کند - پیش یا پس از تأمین و قبل یا پس از استقرار کد شما. این‌ها به شما اجازه می‌دهند کارهای کوچک اطراف استقرار را اتوماتیک کنید: بذر زدن پایگاه داده، اجرای مهاجرت‌ها، ساخت دارایی‌ها یا تست دود اپ زنده.

| قلاب | اجرا می‌شود… | کاربرد رایج |
|------|-------|------------|
| `preprovision` | قبل از ایجاد منابع | اعتبارسنجی پیش‌نیازها، وارد شدن به رجیستری |
| `postprovision` | پس از وجود منابع | پیکربندی منابع، راه‌اندازی پایگاه داده |
| `predeploy` | قبل از استقرار کد | ساخت دارایی‌های فرانت‌اند، اجرای تست‌های واحد |
| `postdeploy` | پس از زنده شدن کد | اجرای مهاجرت‌های پایگاه داده، تست دود نقطه پایانی |

قلاب‌ها در `azure.yaml` شما قرار دارند. در اینجا کوچک‌ترین مثال ممکن است — فقط پس از استقرار پیغامی را چاپ می‌کند:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

همین است — دفعه بعد که `azd up` را اجرا کنید، پیغام به‌صورت خودکار چاپ می‌شود. همچنین می‌توانید یک قلاب را به‌تنهایی اجرا کنید، بدون استقرار کامل، که برای آزمایش عالی است:

```bash
azd hooks run postdeploy
```

مراحل زیر قلاب‌های دنیای واقعی (مهاجرت‌ها، تست‌ها، اعتبارسنجی) را برای هر مرحله نشان می‌دهند.

### مرحله ۱: قلاب‌های پیش از تأمین منابع
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

### مرحله ۲: تأمین زیرساخت
- خواندن قالب‌های زیرساخت (Bicep/Terraform)
- ایجاد یا به‌روزرسانی منابع Azure
- پیکربندی شبکه و امنیت
- راه‌اندازی نظارت و ثبت لاگ

### مرحله ۳: قلاب‌های پس از تأمین منابع
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

### مرحله ۴: بسته‌بندی برنامه
- ساخت کد برنامه
- ایجاد مواد استقرار
- بسته‌بندی برای پلتفرم هدف (کانتینرها، فایل‌های ZIP و غیره)

### مرحله ۵: قلاب‌های پیش از استقرار
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

### مرحله ۶: استقرار برنامه
- استقرار برنامه‌های بسته‌بندی‌شده به سرویس‌های Azure
- به‌روزرسانی تنظیمات پیکربندی
- راه‌اندازی/راه‌اندازی مجدد سرویس‌ها

### مرحله ۷: قلاب‌های پس از استقرار
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

### مدیریت خطاهای قلاب

به طور پیش‌فرض، **اگر دستور قلاب با کد غیر صفر خارج شود، azd کل عملیات را متوقف می‌کند.** این معمولاً همان چیزی است که می‌خواهید — یک مهاجرت شکست‌خورده باید استقرار را متوقف کند نه اینکه یک برنامه خراب را منتشر کند. اما یعنی قلاب‌ها باید با دقت نوشته شوند.

**۱. خطاها باید بلند و عمدی باشند.** یک قلاب زمانی شکست می‌خورد که آخرین دستور آن کد خروجی غیر صفر برگرداند. در اسکریپت‌های شل، `set -e` را اضافه کنید تا قلاب در اولین دستور شکست‌خورده متوقف شود و ادامه خاموش نداشته باشد:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**۲. اجازه دهید یک قلاب بدون توقف azd شکست بخورد.** برای مراحل غیر بحرانی (گرم کردن اختیاری کش، اعلان بهترین تلاش)، `continueOnError: true` را تنظیم کنید. azd خطا را لاگ می‌کند اما ادامه می‌دهد:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**۳. قلاب‌ها را به‌صورت جداگانه قبل از اجرای کامل تست کنید.** نیازی نیست برای اشکال‌زدایی قلاب `azd up` را اجرا کنید — آن را به‌تنهایی اجرا کنید و سریع تکرار کنید:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**۴. حواس‌تان به شل‌های مخصوص سیستم‌عامل باشد.** یک قلاب که از `shell: pwsh` استفاده می‌کند به PowerShell نصب‌شده روی ماشینی که آن را اجرا می‌کند نیاز دارد (از جمله عوامل CI). برای بیشترین حمل‌پذیری از `shell: sh` استفاده کنید، یا هر دو نسخه `windows` و `posix` را ارائه دهید:

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

> **نکته اشکال‌زدایی:** هر دستور azd را با `--debug` اجرا کنید تا دستور قلاب دقیق و خروجی کامل آن را ببینید — این در مواقعی که قلاب به‌صورت محلی کار می‌کند اما در CI شکست می‌خورد بسیار ارزشمند است.

## 🎛️ پیکربندی استقرار

### تنظیمات استقرار مخصوص سرویس
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

### پیکربندی‌های مخصوص محیط

این‌ها فقط مقادیر محلی azd هستند. آن‌ها را صریحاً به پیکربندی زیرساخت/رانتایم نگاشت دهید. `NODE_ENV` معمولاً `production` برای یک برنامه Node مستقر است، از جمله استقرار مرحله استیجینگ؛ از یک متغیر جداگانه مخصوص برنامه برای تمایز مراحل استقرار استفاده کنید.

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

**طرح عملیاتی نمونه:** شما باید هر دو محیط، لایه مشترک مسیریابی ترافیک و دو اسکریپت زیر را تأمین کنید. azd به‌صورت خودکار ترافیک را تغییر نمی‌دهد یا آمادگی بازگشت به عقب را اعتبارسنجی نمی‌کند. تا زمانی که آبی تست‌ها را بگذراند و بازگشت به عقب لازم نباشد، سبز را نگه دارید.

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

### استقرار کناری
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

تقسیم ترافیک به پیکربندی برنامه‌های کانتینری (Bicep یا Azure CLI) مربوط می‌شود، نه خاصیت `azure.yaml` `trafficSplit`. پیش‌نمایش/تأمین و استقرارهای بعدی باید حالت نسخه و قوانین مسیریابی انتخاب‌شده شما را حفظ کنند.

### استقرار مرحله‌ای
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

## 🐳 استقرار کانتینرها

### استقرار برنامه کانتینر
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

اسرار زمان اجرا را با `configuration.secrets`/`secretRef` (یا ارجاع به Key Vault) و مقیاس‌دهی با `template.scale` در زیرساخت برنامه کانتینر پیکربندی کنید. ویژگی‌های سطح سرویس `secrets` یا `scale` را در `azure.yaml` اختراع نکنید.

### بهینه‌سازی Dockerfile چندمرحله‌ای
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

## ⚡ بهینه‌سازی عملکرد

### استقرارهای مخصوص سرویس
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### کش ساخت
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

روند معمول Node از اسکریپت‌های بسته استفاده می‌کند؛ قلاب‌های سرویس `prepackage` می‌توانند مراحل مورد نیاز را اضافه کنند. کش لایه داکر جدا از تعریف دستور ساخت سرویس است.

### استقرارهای کد کارآمد
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 نظارت بر استقرار

### نظارت بر استقرار در زمان واقعی
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### بررسی سلامت
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

برنامه شما باید `/health` را پیاده‌سازی کند؛ این به‌صورت خودکار توسط azd تأمین نمی‌شود. خصوصیت عمومی `azure.yaml` `healthCheck` وجود ندارد.

### اعتبارسنجی پس از استقرار
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

## 🔐 ملاحظات امنیتی

### مدیریت اسرار
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` نامعتبر است. مقادیر محیطی معمولی متن ساده محلی هستند؛ فرض نکنید دستورات خواندن آن‌ها را مخفی کنند. دستورات بالا ارجاع به Key Vault را ذخیره می‌کنند، اما زیرساخت/برنامه شما هنوز باید اسرار را مصرف و دسترسی هویت زمان اجرا را بدهد.

### امنیت شبکه
پارامترهای شبکه را در Bicep اعلام و مصرف کنید و آن‌ها را در `infra/main.parameters.json` نگاشت دهید. پوشش عمومی `infra.parameters` در `azure.yaml` وجود ندارد. دامنه‌های مستندات نمونه `203.0.113.0/24` و `198.51.100.0/24` شبکه‌های واقعی دفتر/VPN نیستند؛ آن‌ها را با دامنه‌های شبکه مجاز جایگزین کنید.

### مدیریت هویت و دسترسی
توان‌سازی `identity` برنامه کانتینر در Bicep و اختصاص نقش داده‌پلان لازم Key Vault در محدوده قلعه. اسرار نامگذاری شده پشتیبانی شده توسط Key Vault و ارجاعات زمان اجرا را در آن منبع پیکربندی کنید؛ `identity` و `keyVault` ویژگی‌های عمومی سرویس azd نیستند. به [احراز هویت و هویت مدیریت‌شده](../chapter-03-configuration/authsecurity.md) مراجعه کنید.

## 🚨 استراتژی‌های بازگشت به عقب

### بازگشت سریع
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

### بازگشت زیرساخت
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### بازگشت مهاجرت پایگاه داده
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

### پیگیری عملکرد استقرار
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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

## 🎯 بهترین روش‌ها

### ۱. ثبات محیط
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### ۲. اعتبارسنجی زیرساخت
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### ۳. ادغام تست
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

### ۴. مستندسازی و ثبت لاگ
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## مراحل بعدی

- [تأمین منابع](provisioning.md) - بررسی عمیق مدیریت زیرساخت
- [برنامه‌ریزی پیش از استقرار](../chapter-06-pre-deployment/capacity-planning.md) - برنامه‌ریزی استراتژی استقرار شما
- [مسائل رایج](../chapter-07-troubleshooting/common-issues.md) - حل مشکلات استقرار
- [بهترین روش‌ها](../chapter-07-troubleshooting/debugging.md) - استراتژی‌های استقرار آماده تولید

## 🎯 تمرین‌های عملی استقرار

### تمرین ۱: روند استقرار تدریجی (۲۰ دقیقه)
**هدف**: تسلط بر تفاوت بین استقرار کامل و تدریجی

**نقطه شروع:** Bash، Node.js نسخه ۲۲، Git، ورود به azd و اشتراک Azure با مجوز استقرار. در یک پوشه جدید اجرا کنید؛ انتظار داشته باشید منابع App Service/Cosmos DB قابل صورتحساب باشند. زمان‌بندی بستگی به منطقه و قالب دارد.

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

**معیارهای موفقیت:**
- [ ] زمان سپری‌شده برای هر دو دستور ثبت شود (مدت زمان تضمین‌شده‌ای نیست)
- [ ] هر دو دستور با موفقیت کامل اجرا شوند
- [ ] API عملکردی باقی بماند؛ ویرایش فقط نظر تغییر قابل مشاهده در UI نیست
- [ ] هیچ تغییری در زیرساخت بعد از `azd deploy` وجود نداشته باشد

**نتیجه یادگیری**: `azd deploy` از تأمین زیرساخت صرف‌نظر می‌کند. زمان‌های اندازه‌گیری‌شده را مقایسه کنید به جای اینکه فرض کنید سرعت ثابتی وجود دارد.

### تمرین ۲: قلاب‌های استقرار سفارشی (۳۰ دقیقه)
**هدف**: پیاده‌سازی اتوماسیون پیش و پس از استقرار

**نقطه شروع:** پروژه مقداردهی اولیه‌شده `deployment-practice` بالا. اگر آن را پاک کرده‌اید، قبل از آزمایش استقرار فقط کد، دوباره `azd up` را اجرا کنید. اعتبارسنجی زیر از اسکریپت ساخت واقعی API استفاده می‌کند، نه اسکریپت ریشه `test:unit` غیرممکن. تست‌های API قالب نیاز به دسترسی پیکربندی‌شده پایگاه داده دارند؛ آن‌ها تست‌های واحد مجزایی نیستند.

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

**معیارهای موفقیت:**
- [ ] اسکریپت پیش از استقرار قبل از استقرار اجرا شود
- [ ] اگر اعتبارسنجی ساخت شکست خورد، استقرار متوقف شود
- [ ] تست دود پس از استقرار سلامت را تایید کند
- [ ] قلاب‌ها به ترتیب درست اجرا شوند

### تمرین ۳: استراتژی استقرار چندمحیطی (۴۵ دقیقه)
**هدف**: پیاده‌سازی روند استقرار مرحله‌ای (توسعه → مرحله → تولید)

**نقطه شروع:** همان پروژه todo مقداردهی اولیه شده با `jq`. محیط‌های زیر را با مقادیر واقعی اشتراک/مکان ایجاد کنید (یا در هر کدام `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` را تنظیم کنید) **قبل از** اجرای روند کاری بدون درخواست ورودی. این کار عمداً در صورت نبود مقادیر آنها را اختراع نمی‌کند و عملیات را شکست می‌دهد. تنها از محیط‌های آموزشی یک‌بار مصرف استفاده کنید، نه اشتراک تولید واقعی.

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

**معیارهای موفقیت:**
- [ ] محیط توسعه با موفقیت مستقر شود
- [ ] محیط استیجینگ با موفقیت مستقر شود
- [ ] برای تولید نیاز به تایید دستی باشد
- [ ] همه محیط‌ها چک‌های سلامتی فعال داشته باشند
- [ ] در صورت نیاز بتوان بازگشت انجام داد

### تمرین ۴: استراتژی بازگشت (۲۵ دقیقه)
**هدف**: پیاده‌سازی و آزمایش بازگشت استقرار با استفاده از Git

**نقطه شروع:** بررسی ایزوله شده تمرینی از قالب todo با کل کد پایه ثبت شده، درخت کاری تمیز Git و محیط پیکربندی شده یک‌بار مصرف. هرگز در پروژه تولید واقعی شکست عمدی وارد نکنید. `APP_VERSION` زیر فقط برای حسابداری است مگر اینکه خودتان صراحتاً آن را به برنامه وصل کنید.

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

**معیارهای موفقیت:**
- [ ] قادر به تشخیص شکست‌های استقرار باشد
- [ ] اسکریپت بازگشت به طور خودکار اجرا شود
- [ ] برنامه به حالت کاری بازگردد
- [ ] پس از بازگشت، چک‌های سلامتی موفق باشند

## 📊 پیگیری معیارهای استقرار

### عملکرد استقرار خود را پیگیری کنید

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

**معیارهای خود را تحلیل کنید:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## منابع بیشتر

- [مراجعه به استقرار Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [استقرار Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [استقرار Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [استقرار Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ناوبری**
- **درس قبلی**: [اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **درس بعدی**: [تهیه منابع](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->