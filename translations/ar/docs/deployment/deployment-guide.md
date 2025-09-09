<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T19:18:34+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ar"
}
-->
# دليل النشر - إتقان عمليات نشر AZD

## المقدمة

هذا الدليل الشامل يغطي كل ما تحتاج إلى معرفته حول نشر التطبيقات باستخدام Azure Developer CLI، بدءًا من عمليات النشر الأساسية بأمر واحد وصولاً إلى سيناريوهات الإنتاج المتقدمة مع الخطافات المخصصة، البيئات المتعددة، وتكامل CI/CD. أتقن دورة حياة النشر بالكامل مع أمثلة عملية وأفضل الممارسات.

## أهداف التعلم

عند إكمال هذا الدليل، ستتمكن من:
- إتقان جميع أوامر وعمليات نشر Azure Developer CLI
- فهم دورة حياة النشر بالكامل من التهيئة إلى المراقبة
- تنفيذ خطافات مخصصة للنشر التلقائي قبل وبعد النشر
- إعداد بيئات متعددة مع معلمات خاصة بكل بيئة
- تطبيق استراتيجيات نشر متقدمة مثل النشر الأزرق-الأخضر ونشر الكناري
- دمج عمليات نشر azd مع خطوط CI/CD وعمليات DevOps

## نتائج التعلم

عند الانتهاء، ستكون قادرًا على:
- تنفيذ واستكشاف جميع عمليات نشر azd بشكل مستقل
- تصميم وتنفيذ أتمتة النشر المخصصة باستخدام الخطافات
- إعداد عمليات نشر جاهزة للإنتاج مع أمان ومراقبة مناسبين
- إدارة سيناريوهات نشر متعددة البيئات المعقدة
- تحسين أداء النشر وتنفيذ استراتيجيات التراجع
- دمج عمليات نشر azd في ممارسات DevOps المؤسسية

## نظرة عامة على النشر

يوفر Azure Developer CLI عدة أوامر للنشر:
- `azd up` - سير العمل الكامل (تهيئة + نشر)
- `azd provision` - إنشاء/تحديث موارد Azure فقط
- `azd deploy` - نشر كود التطبيق فقط
- `azd package` - بناء وتعبئة التطبيقات

## سير العمل الأساسي للنشر

### النشر الكامل (azd up)
أكثر سير العمل شيوعًا للمشاريع الجديدة:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### نشر البنية التحتية فقط
عندما تحتاج فقط إلى تحديث موارد Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### نشر الكود فقط
للتحديثات السريعة للتطبيق:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ فهم عملية النشر

### المرحلة 1: خطافات ما قبل التهيئة
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

### المرحلة 2: تهيئة البنية التحتية
- قراءة قوالب البنية التحتية (Bicep/Terraform)
- إنشاء أو تحديث موارد Azure
- إعداد الشبكات والأمان
- إعداد المراقبة وتسجيل الأحداث

### المرحلة 3: خطافات ما بعد التهيئة
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

### المرحلة 4: تعبئة التطبيق
- بناء كود التطبيق
- إنشاء ملفات النشر
- تعبئة للتطبيق المستهدف (حاويات، ملفات ZIP، إلخ)

### المرحلة 5: خطافات ما قبل النشر
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

### المرحلة 6: نشر التطبيق
- نشر التطبيقات المعبأة إلى خدمات Azure
- تحديث إعدادات التكوين
- بدء/إعادة تشغيل الخدمات

### المرحلة 7: خطافات ما بعد النشر
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

## 🎛️ إعدادات النشر

### إعدادات النشر الخاصة بالخدمة
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

### إعدادات خاصة بالبيئة
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

## 🔧 سيناريوهات النشر المتقدمة

### تطبيقات متعددة الخدمات
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

### النشر الأزرق-الأخضر
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

### نشر الكناري
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

### النشر المرحلي
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

## 🐳 نشر الحاويات

### نشر تطبيقات الحاويات
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

### تحسين Dockerfile متعدد المراحل
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

## ⚡ تحسين الأداء

### النشر المتوازي
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### تخزين البناء المؤقت
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

### النشر التدريجي
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 مراقبة النشر

### مراقبة النشر في الوقت الحقيقي
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### فحوصات الصحة
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

### التحقق بعد النشر
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

## 🔐 اعتبارات الأمان

### إدارة الأسرار
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

### أمان الشبكة
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### إدارة الهوية والوصول
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

## 🚨 استراتيجيات التراجع

### التراجع السريع
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### تراجع البنية التحتية
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### تراجع ترحيل قاعدة البيانات
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 مقاييس النشر

### تتبع أداء النشر
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### جمع المقاييس المخصصة
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

## 🎯 أفضل الممارسات

### 1. اتساق البيئة
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. التحقق من البنية التحتية
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. تكامل الاختبار
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

### 4. التوثيق وتسجيل الأحداث
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## الخطوات التالية

- [تهيئة الموارد](provisioning.md) - نظرة معمقة على إدارة البنية التحتية
- [التخطيط قبل النشر](../pre-deployment/capacity-planning.md) - خطط استراتيجية النشر الخاصة بك
- [المشاكل الشائعة](../troubleshooting/common-issues.md) - حل مشاكل النشر
- [أفضل الممارسات](../troubleshooting/debugging.md) - استراتيجيات نشر جاهزة للإنتاج

## موارد إضافية

- [مرجع نشر Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [نشر Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [نشر Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [نشر Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**التنقل**
- **الدرس السابق**: [مشروعك الأول](../getting-started/first-project.md)
- **الدرس التالي**: [تهيئة الموارد](provisioning.md)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.