# دليل النشر - إتقان نشر AZD

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 4 - البنية التحتية كرمز والنشر
- **⬅️ الفصل السابق**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)
- **➡️ التالي**: [توفير الموارد](provisioning.md)
- **🚀 الفصل التالي**: [الفصل 5: حلول الذكاء الاصطناعي متعددة الوكلاء](../../examples/retail-scenario.md)

## مقدمة

يغطي هذا الدليل الشامل كل ما تحتاج لمعرفته حول نشر التطبيقات باستخدام Azure Developer CLI، من عمليات النشر الأساسية بأمر واحد إلى السيناريوهات الإنتاجية المتقدمة مع خطافات مخصصة، وبيئات متعددة، وتكامل CI/CD. اتقن دورة حياة النشر الكاملة مع أمثلة عملية وأفضل الممارسات.

## أهداف التعلم

عند إكمال هذا الدليل، ستتمكن من:
- إتقان جميع أوامر وسير عمل نشر Azure Developer CLI
- فهم دورة حياة النشر كاملة من التهيئة إلى المراقبة
- تنفيذ خطافات نشر مخصصة للأتمتة قبل وبعد النشر
- تكوين بيئات متعددة بوسائط محددة لكل بيئة
- إعداد استراتيجيات نشر متقدمة بما في ذلك النشر الأزرق-الأخضر والكاناري
- دمج نشرات azd مع خطوط CI/CD وتدفقات عمل DevOps

## مخرجات التعلم

عند الانتهاء، ستكون قادرًا على:
- تنفيذ واستكشاف أخطاء جميع سير عمل نشر azd بشكل مستقل
- تصميم وتنفيذ أتمتة نشر مخصصة باستخدام الخطافات
- تكوين نشرات جاهزة للإنتاج مع الأمان والمراقبة المناسبة
- إدارة سيناريوهات نشر معقدة متعددة البيئات
- تحسين أداء النشر وتنفيذ استراتيجيات التراجع
- دمج نشرات azd في ممارسات DevOps على مستوى المؤسسة

## نظرة عامة على النشر

يوفر Azure Developer CLI عدة أوامر للنشر:
- `azd up` - سير العمل الكامل (تهيئة + نشر)
- `azd provision` - إنشاء/تحديث موارد Azure فقط
- `azd deploy` - نشر كود التطبيق فقط
- `azd package` - بناء وتجهيز التطبيقات

## سير عمل النشر الأساسي

### النشر الكامل (azd up)
سير العمل الأكثر شيوعًا للمشاريع الجديدة:
```bash
# نشر كل شيء من الصفر
azd up

# نشر في بيئة محددة
azd up --environment production

# نشر بمعلمات مخصصة
azd up --parameter location=westus2 --parameter sku=P1v2
```

### نشر البنية التحتية فقط
عندما تحتاج فقط إلى تحديث موارد Azure:
```bash
# نشر/تحديث البنية التحتية
azd provision

# نشر مع تشغيل تجريبي لمعاينة التغييرات
azd provision --preview

# نشر خدمات محددة
azd provision --service database
```

### نشر الكود فقط
لتحديثات التطبيق السريعة:
```bash
# نشر جميع الخدمات
azd deploy

# المخرجات المتوقعة:
# جاري نشر الخدمات (azd deploy)
# - web: جاري النشر... تم
# - api: جاري النشر... تم
# نجاح: اكتمل النشر بعد دقيقتين و15 ثانية

# نشر خدمة محددة
azd deploy --service web
azd deploy --service api

# النشر باستخدام وسائط بناء مخصصة
azd deploy --service api --build-arg NODE_ENV=production

# التحقق من النشر
azd show --output json | jq '.services'
```

### ✅ التحقق من النشر

بعد أي نشر، تحقق من النجاح:

```bash
# تحقق من أن جميع الخدمات تعمل
azd show

# اختبر نقاط النهاية الصحية
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# راقب وجود أخطاء (يفتح في المتصفح بشكل افتراضي)
azd monitor --logs
```

**معايير النجاح:**
- ✅ تظهر جميع الخدمات حالة "تشغيل"
- ✅ تُرجع نقاط النهاية للحالة HTTP 200
- ✅ لا توجد سجلات أخطاء خلال آخر 5 دقائق
- ✅ يستجيب التطبيق لطلبات الاختبار

## 🏗️ فهم عملية النشر

### المرحلة 1: خطافات ما قبل التوفير
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

### المرحلة 2: توفير البنية التحتية
- يقرأ قوالب البنية التحتية (Bicep/Terraform)
- ينشئ أو يحدّث موارد Azure
- يُهيئ الشبكات والأمان
- يُعد المراقبة والتسجيل

### المرحلة 3: خطافات ما بعد التوفير
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

### المرحلة 4: تجميع التطبيق
- يبني كود التطبيق
- ينشئ ملفات النشر
- يعبئ للمنصة المستهدفة (حاويات، ملفات ZIP، إلخ.)

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
- ينشر التطبيقات المعبأة إلى خدمات Azure
- يحدّث إعدادات التكوين
- يشغّل/يعيد تشغيل الخدمات

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

## 🎛️ تكوين النشر

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

### تكوينات خاصة بالبيئة
```bash
# بيئة التطوير
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# بيئة الاختبار قبل الإنتاج
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# بيئة الإنتاج
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

### نشر أزرق-أخضر
```bash
# إنشاء البيئة الزرقاء
azd env new production-blue
azd up --environment production-blue

# اختبار البيئة الزرقاء
./scripts/test-environment.sh production-blue

# تحويل حركة المرور إلى الأزرق (تحديث DNS/موازن التحميل يدويًا)
./scripts/switch-traffic.sh production-blue

# تنظيف البيئة الخضراء
azd env select production-green
azd down --force
```

### نشر كاناري
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

### نشر مرحلي
```bash
#!/bin/باش
# نشر-مرحلي.sh

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

### نشر خاص بالخدمة
```bash
# نشر خدمة محددة لتسريع التكرار
azd deploy --service web
azd deploy --service api

# نشر جميع الخدمات
azd deploy
```

### تخزين مؤقت للبناء
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### نشر الكود بكفاءة
```bash
# استخدم azd deploy (ليس azd up) للتغييرات التي تقتصر على الكود
# هذا يتخطى توفير البنية التحتية ويكون أسرع بكثير
azd deploy

# انشر الخدمة المحددة من أجل أسرع تكرار
azd deploy --service api
```

## 🔍 مراقبة النشر

### مراقبة النشر في الوقت الحقيقي
```bash
# راقب التطبيق في الوقت الحقيقي
azd monitor --live

# عرض سجلات التطبيق
azd monitor --logs

# التحقق من حالة النشر
azd show
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

# التحقق من صحة التطبيق
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
# تخزين الأسرار بشكل آمن
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# الإشارة إلى الأسرار في ملف azure.yaml
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
# لا يحتوي AZD على ميزة التراجع المدمجة. الطرق الموصى بها:

# الخيار 1: إعادة النشر من Git (موصى به)
git revert HEAD  # التراجع عن الالتزام المسبب للمشكلة
git push
azd deploy

# الخيار 2: إعادة نشر التزام محدد
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### التراجع عن البنية التحتية
```bash
# عاين تغييرات البنية التحتية قبل تطبيقها
azd provision --preview

# للتراجع عن تغييرات البنية التحتية، استخدم نظام التحكم في الإصدارات:
git revert HEAD  # تراجع عن تغييرات البنية التحتية
azd provision    # طبق حالة البنية التحتية السابقة
```

### التراجع عن ترحيل قاعدة البيانات
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
# عرض حالة النشر الحالية
azd show

# مراقبة التطبيق باستخدام Application Insights
azd monitor --overview

# عرض المقاييس الحية
azd monitor --live
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
# استخدم تسميات متسقة
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# حافظ على تماثل البيئات
./scripts/sync-environments.sh
```

### 2. التحقق من البنية التحتية
```bash
# معاينة تغييرات البنية التحتية قبل النشر
azd provision --preview

# استخدم فحص lint لـ ARM/Bicep
az bicep lint --file infra/main.bicep

# تحقق من صحة تركيب Bicep
az bicep build --file infra/main.bicep
```

### 3. تكامل الاختبارات
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

### 4. التوثيق والتسجيل
```bash
# وثق إجراءات النشر
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## الخطوات التالية

- [توفير الموارد](provisioning.md) - غوص عميق في إدارة البنية التحتية
- [التخطيط قبل النشر](../chapter-06-pre-deployment/capacity-planning.md) - خطط لاستراتيجية النشر الخاصة بك
- [المشكلات الشائعة](../chapter-07-troubleshooting/common-issues.md) - حل مشكلات النشر
- [أفضل الممارسات](../chapter-07-troubleshooting/debugging.md) - استراتيجيات نشر جاهزة للإنتاج

## 🎯 تمارين عملية على النشر

### التمرين 1: سير عمل النشر التزايدي (20 دقيقة)
**الهدف**: إتقان الفرق بين النشر الكامل والتزايدي

```bash
# النشر الأولي
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# تسجيل وقت النشر الأولي
echo "Full deployment: $(date)" > deployment-log.txt

# إجراء تغيير في الشيفرة
echo "// Updated $(date)" >> src/api/src/server.js

# نشر الكود فقط (سريع)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# مقارنة الأوقات
cat deployment-log.txt

# تنظيف
azd down --force --purge
```

**معايير النجاح:**
- [ ] يستغرق النشر الكامل 5-15 دقيقة
- [ ] يستغرق نشر الكود فقط 2-5 دقائق
- [ ] تظهر تغييرات الكود في التطبيق المنشور
- [ ] تظل البنية التحتية بدون تغيير بعد `azd deploy`

**نتيجة التعلم**: `azd deploy` أسرع بنسبة 50-70% من `azd up` لتغييرات الكود

### التمرين 2: خطافات نشر مخصصة (30 دقيقة)
**الهدف**: تنفيذ أتمتة قبل وبعد النشر

```bash
# إنشاء برنامج نصي للتحقق قبل النشر
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# التحقق من نجاح الاختبارات
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# التحقق من وجود تغييرات غير مُلتزم بها
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# إنشاء اختبار أولي بعد النشر
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

# إضافة نقاط الربط (hooks) إلى azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# اختبار النشر باستخدام نقاط الربط (hooks)
azd deploy
```

**معايير النجاح:**
- [ ] يعمل السكربت ما قبل النشر قبل البدء بالنشر
- [ ] يتم إيقاف النشر إذا فشلت الاختبارات
- [ ] اختبار سطحي بعد النشر يتحقق من الحالة الصحية
- [ ] تنفّذ الخطافات بالترتيب الصحيح

### التمرين 3: استراتيجية النشر متعددة البيئات (45 دقيقة)
**الهدف**: تنفيذ سير نشر مرحلي (dev → staging → production)

```bash
# إنشاء نص برمجي للنشر
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# الخطوة 1: النشر إلى بيئة التطوير
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# الخطوة 2: النشر إلى بيئة المعاينة
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# الخطوة 3: موافقة يدوية للنشر إلى الإنتاج
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

# إنشاء بيئات
azd env new dev
azd env new staging
azd env new production

# تشغيل النشر المرحلي
./deploy-staged.sh
```

**معايير النجاح:**
- [ ] يتم نشر بيئة Dev بنجاح
- [ ] يتم نشر بيئة Staging بنجاح
- [ ] مطلوب موافقة يدوية للإنتاج
- [ ] جميع البيئات لديها فحوصات حالة عاملة
- [ ] إمكانية التراجع عند الحاجة

### التمرين 4: استراتيجية التراجع (25 دقيقة)
**الهدف**: تنفيذ واختبار التراجع عن النشر باستخدام Git

```bash
# نشر v1
azd env set APP_VERSION "1.0.0"
azd up

# حفظ هاش الالتزام v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# نشر الإصدار v2 مع تغيير كاسر
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# اكتشاف الفشل والتراجع
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # التراجع باستخدام git
    git revert HEAD --no-edit
    
    # التراجع عن تغييرات البيئة
    azd env set APP_VERSION "1.0.0"
    
    # إعادة نشر v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**معايير النجاح:**
- [ ] يمكن اكتشاف فشل النشر
- [ ] ينفّذ سكربت التراجع تلقائيًا
- [ ] يعود التطبيق إلى حالة عمل
- [ ] تجتاز فحوصات الحالة بعد التراجع

## 📊 تتبع مقاييس النشر

### تتبع أداء النشر

```bash
# إنشاء برنامج نصي لمقاييس النشر
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

# سجل إلى ملف
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# استخدمه
./track-deployment.sh
```

**حلل مقاييسك:**
```bash
# عرض سجل النشر
cat deployment-metrics.csv

# حساب متوسط وقت النشر
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## موارد إضافية

- [مرجع نشر Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [نشر Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [نشر تطبيقات حاويات Azure](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [نشر Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**التنقل**
- **الدرس السابق**: [مشروعك الأول](../chapter-01-foundation/first-project.md)
- **الدرس التالي**: [توفير الموارد](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تم ترجمة هذا المستند باستخدام خدمة الترجمة الآلية Co-op Translator (https://github.com/Azure/co-op-translator). بينما نسعى إلى الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر المرجعي المعتمد. للمعلومات الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. لا نتحمل أي مسؤولية عن أي سوء فهم أو تفسيرات خاطئة قد تنشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->