<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-17T16:24:32+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "fa"
}
-->
# راهنمای استقرار - تسلط بر استقرارهای AZD

**فهرست فصل‌ها:**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل ۴ - زیرساخت به عنوان کد و استقرار
- **⬅️ فصل قبلی**: [فصل ۳: پیکربندی](../getting-started/configuration.md)
- **➡️ بعدی**: [تأمین منابع](provisioning.md)
- **🚀 فصل بعدی**: [فصل ۵: راه‌حل‌های چندعاملی هوش مصنوعی](../../examples/retail-scenario.md)

## مقدمه

این راهنمای جامع همه چیزهایی که باید درباره استقرار برنامه‌ها با استفاده از Azure Developer CLI بدانید را پوشش می‌دهد، از استقرارهای ساده با یک دستور گرفته تا سناریوهای پیشرفته تولید با هوک‌های سفارشی، محیط‌های متعدد و یکپارچه‌سازی CI/CD. چرخه کامل استقرار را با مثال‌های عملی و بهترین روش‌ها بیاموزید.

## اهداف یادگیری

با تکمیل این راهنما، شما:
- به تمام دستورات و جریان‌های کاری استقرار Azure Developer CLI مسلط خواهید شد
- چرخه کامل استقرار از تأمین منابع تا نظارت را درک خواهید کرد
- هوک‌های سفارشی برای اتوماسیون قبل و بعد از استقرار پیاده‌سازی خواهید کرد
- محیط‌های متعدد را با پارامترهای خاص محیط پیکربندی خواهید کرد
- استراتژی‌های پیشرفته استقرار از جمله استقرار آبی-سبز و قناری را تنظیم خواهید کرد
- استقرارهای azd را با خطوط لوله CI/CD و جریان‌های کاری DevOps یکپارچه خواهید کرد

## نتایج یادگیری

پس از تکمیل، شما قادر خواهید بود:
- تمام جریان‌های کاری استقرار azd را به طور مستقل اجرا و رفع اشکال کنید
- اتوماسیون سفارشی استقرار را با استفاده از هوک‌ها طراحی و پیاده‌سازی کنید
- استقرارهای آماده تولید را با امنیت و نظارت مناسب پیکربندی کنید
- سناریوهای پیچیده استقرار چند محیطی را مدیریت کنید
- عملکرد استقرار را بهینه کنید و استراتژی‌های بازگشت به عقب را پیاده‌سازی کنید
- استقرارهای azd را در شیوه‌های DevOps سازمانی ادغام کنید

## نمای کلی استقرار

Azure Developer CLI چندین دستور استقرار ارائه می‌دهد:
- `azd up` - جریان کامل (تأمین منابع + استقرار)
- `azd provision` - فقط ایجاد/به‌روزرسانی منابع Azure
- `azd deploy` - فقط استقرار کد برنامه
- `azd package` - ساخت و بسته‌بندی برنامه‌ها

## جریان‌های کاری استقرار پایه

### استقرار کامل (azd up)
رایج‌ترین جریان کاری برای پروژه‌های جدید:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### استقرار فقط زیرساخت
زمانی که فقط نیاز به به‌روزرسانی منابع Azure دارید:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### استقرار فقط کد
برای به‌روزرسانی سریع برنامه:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ درک فرآیند استقرار

### مرحله ۱: هوک‌های پیش از تأمین منابع
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
- تنظیم نظارت و ثبت وقایع

### مرحله ۳: هوک‌های پس از تأمین منابع
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
- ایجاد مصنوعات استقرار
- بسته‌بندی برای پلتفرم هدف (کانتینرها، فایل‌های ZIP و غیره)

### مرحله ۵: هوک‌های پیش از استقرار
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
- استقرار برنامه‌های بسته‌بندی شده در سرویس‌های Azure
- به‌روزرسانی تنظیمات پیکربندی
- شروع/راه‌اندازی مجدد سرویس‌ها

### مرحله ۷: هوک‌های پس از استقرار
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
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 سناریوهای پیشرفته استقرار

### برنامه‌های چند سرویس
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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
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
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 نظارت بر استقرار

### نظارت بر استقرار در زمان واقعی
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### بررسی سلامت
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

# Check application health
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
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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

## 🚨 استراتژی‌های بازگشت به عقب

### بازگشت سریع
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### بازگشت زیرساخت
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
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

### ردیابی عملکرد استقرار
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
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

## 🎯 بهترین روش‌ها

### ۱. سازگاری محیط
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
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
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

### ۴. مستندسازی و ثبت وقایع
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## مراحل بعدی

- [تأمین منابع](provisioning.md) - بررسی عمیق مدیریت زیرساخت
- [برنامه‌ریزی پیش از استقرار](../pre-deployment/capacity-planning.md) - برنامه‌ریزی استراتژی استقرار
- [مشکلات رایج](../troubleshooting/common-issues.md) - رفع مشکلات استقرار
- [بهترین روش‌ها](../troubleshooting/debugging.md) - استراتژی‌های استقرار آماده تولید

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

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.