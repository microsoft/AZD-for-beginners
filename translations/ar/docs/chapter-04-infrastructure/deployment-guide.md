# دليل النشر - إتقان نشرات AZD

**التنقل بين الفصول:**
- **🏠 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 4 - البنية التحتية ككود والنشر
- **⬅️ الفصل السابق**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)
- **➡️ التالي**: [توفير الموارد](provisioning.md)
- **🧩 أيضًا في هذا الفصل**: [كتابة قالبك الخاص](custom-templates.md)
- **🚀 الفصل التالي**: [الفصل 5: حلول الذكاء الاصطناعي المتعددة الوكلاء](../../examples/retail-scenario.md)

## مقدمة

> تمت المراجعة مقابل `azd 1.37.2` (نوفمبر 2026). تستخدم الأوامر باش؛ تتطلب أمثلة JSON `jq`. باستثناء التمرين المحدد للمهمة، الأمثلة المتقدمة هي **مقتطفات تكامل**: قدم مصدر البنية التحتية والاختبارات والسكربتات الخاصة بك. لم يتم تنفيذ نشرات Azure في هذا الاستعراض.

يغطي هذا الدليل الشامل كل ما تحتاج لمعرفته حول نشر التطبيقات باستخدام Azure Developer CLI، من النشرات البسيطة بأمر واحد إلى السيناريوهات المتقدمة في الإنتاج مع الخطافات المخصصة، والبيئات المتعددة، والتكامل مع CI/CD. إتقان دورة حياة النشر الكاملة من خلال أمثلة عملية وأفضل الممارسات.

## أهداف التعلم

باكمال هذا الدليل، ستتمكن من:
- إتقان جميع أوامر ونماذج تشغيل نشر Azure Developer CLI
- فهم دورة حياة النشر من التزويد إلى المراقبة
- تنفيذ خطافات نشر مخصصة لأتمتة ما قبل وما بعد النشر
- تكوين بيئات متعددة مع معلمات مخصصة لكل بيئة
- إعداد استراتيجيات نشر متقدمة بما في ذلك النشر الأزرق-الأخضر والكناري
- دمج نشرات azd مع خطوط أنابيب CI/CD وتدفقات عمل DevOps

## نتائج التعلم

عند الانتهاء، ستتمكن من:
- تنفيذ واستكشاف جميع نماذج نشر azd بشكل مستقل
- تصميم وتنفيذ أتمتة نشر مخصصة باستخدام الخطافات
- تكوين نشرات جاهزة للإنتاج مع الأمان والمراقبة المناسبة
- إدارة سيناريوهات النشر المعقدة متعددة البيئات
- تحسين أداء النشر وتنفيذ استراتيجيات التراجع
- دمج نشرات azd في ممارسات DevOps المؤسسية

## نظرة عامة على النشر

توفر Azure Developer CLI عدة أوامر للنشر:
- `azd up` - نموذج تشغيل كامل (التزويد + النشر)
- `azd provision` - إنشاء/تحديث موارد Azure فقط
- `azd deploy` - نشر كود التطبيق فقط
- `azd package` - بناء وتغليف التطبيقات

## نماذج النشر الأساسية

### النشر الكامل (azd up)
النموذج الأكثر شيوعًا للمشاريع الجديدة:
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

### نشر البنية التحتية فقط
عندما تحتاج فقط إلى تحديث موارد Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### نشر الكود فقط
لتحديثات التطبيق السريعة:
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

### ✅ التحقق من النشر

بعد أي نشر، تحقق من النجاح:

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

**معايير النجاح:**
- ✅ يتحقق `azd show` من أهداف الخدمة/عناوين URL المتوقعة
- ✅ الطلبات إلى مسارات التطبيق الفعلية تعيد الحالة والمحتوى المتوقع
- ✅ لا توجد سجلات خطأ في آخر 5 دقائق
- ✅ التطبيق يستجيب لطلبات الاختبار

## 🏗️ فهم عملية النشر

### جديد على الخطافات؟ ابدأ هنا

**الخطاف** هو أمر ينفذه azd تلقائيًا في لحظة محددة من عملية النشر—قبل أو بعد التزويد، وقبل أو بعد نشر الكود. يسمح لك بأتمتة المهام الصغيرة التي تحيط دائمًا بعملية النشر: تهيئة قاعدة بيانات، تشغيل الترحيلات، بناء الأصول، أو اختبار التطبيق الحي.

| الخطاف | يُشغل… | الاستخدام الشائع |
|------|-------|------------|
| `preprovision` | قبل إنشاء الموارد | التحقق من المتطلبات الأساسية، تسجيل الدخول إلى سجل |
| `postprovision` | بعد وجود الموارد | تكوين الموارد، إعداد قاعدة البيانات |
| `predeploy` | قبل نشر الكود | بناء أصول الواجهة الأمامية، تشغيل اختبارات الوحدة |
| `postdeploy` | بعد نشر الكود | تشغيل ترحيلات قاعدة البيانات، اختبار نقاط النهاية |

توجد الخطافات في ملف `azure.yaml`. إليك أصغر مثال ممكن—يكتفي بطباعة رسالة بعد النشر:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

هذا كل شيء—في المرة التالية التي تشغل فيها `azd up`، سيتم طباعة الرسالة تلقائيًا. يمكنك أيضًا تشغيل خطاف بمفرده، دون نشر كامل، وهو رائع للاختبار:

```bash
azd hooks run postdeploy
```

توضح المراحل أدناه خطافات من العالم الحقيقي (الترحيلات، الاختبارات، التحقق) لكل مرحلة.

### المرحلة 1: خطافات ما قبل التزويد
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

### المرحلة 2: تزويد البنية التحتية
- قراءة قوالب البنية التحتية (Bicep/Terraform)
- إنشاء أو تحديث موارد Azure
- تكوين الشبكات والأمان
- إعداد المراقبة والسجلات

### المرحلة 3: خطافات ما بعد التزويد
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

### المرحلة 4: تغليف التطبيق
- بناء كود التطبيق
- إنشاء عناصر النشر
- التغليف للمنصة المستهدفة (حاويات، ملفات ZIP، إلخ)

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
      curl --fail "$WEB_URL/health"
```

### التعامل مع أخطاء الخطاف

بشكل افتراضي، **إذا خرج أمر الخطاف برمز غير صفري، يتوقف azd عن العملية بأكملها.** هذا غالبًا ما يكون مرغوبًا—فشل ترحيل يجب أن يوقف النشر وليس شحن تطبيق معطل. لكن هذا يعني وجوب كتابة الخطافات بعناية.

**1. اجعل الأخطاء واضحة ومقصودة.** يفشل الخطاف عندما يرجع الأمر الأخير به رمز خروج غير صفري. في سكربتات الشل، أضف `set -e` حتى يتوقف الخطاف عند أول أمر فاشل بدلاً من الاستمرار بصمت:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. اسمح لفشل الخطاف دون إيقاف azd.** للخطوات غير الحرجة (تسخين كاش اختياري، إشعار بأفضل جهد)، اضبط `continueOnError: true`. azd يسجل الفشل لكنه يستمر:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. اختبر الخطافات بشكل منفصل قبل التشغيل الكامل.** لست مضطرًا لتشغيل `azd up` لتصحيح الخطاف—شغّله بمفرده وكرر بسرعة:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. انتبه لأنظمة الشل الخاصة بنظام التشغيل.** خطاف يستخدم `shell: pwsh` يحتاج إلى PowerShell مثبت على الجهاز الذي يشغله (بما في ذلك وكلاء CI). استخدم `shell: sh` لأوسع قابلية للتنقل، أو قدّم متغيرات `windows` و `posix` معًا:

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

> **نصيحة تصحيح:** شغل أي أمر azd مع `--debug` لرؤية أمر الخطاف الدقيق ومخرجاته كاملة—هذا لا يقدر بثمن عندما يعمل الخطاف محليًا لكنه يفشل في CI.

## 🎛️ تكوين النشر

### إعدادات نشر خاصة بالخدمة
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

### تكوينات خاصة بالبيئة

هذه قيم محلية لـ azd فقط. قم بتعيينها صراحة إلى تكوين البنية التحتية/وقت التشغيل. عادةً ما يكون `NODE_ENV` هو `production` لتطبيق Node المنشور، بما في ذلك نشرات الاختبار؛ استخدم متغير خاص بالتطبيق لتحديد مراحل النشر.

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

## 🔧 سيناريوهات نشر متقدمة

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

### نشرات أزرق-أخضر

**مخطط تشغيل توضيحي:** يجب توفير كلتا البيئتين، طبقة مشتركة لتوجيه المرور، والسكريبتين أدناه. لا يقوم azd بتحويل المرور أو التحقق من جاهزية التراجع تلقائيًا. احتفظ بالبيئة الخضراء حتى ينجح البيئة الزرقاء بالاختبار ولا حاجة للتراجع.

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

### نشرات الكناري
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

تقسيم المرور ينتمي إلى تكوين تطبيقات الحاويات (Bicep أو Azure CLI)، وليس خاصية `azure.yaml` `trafficSplit` في azd. يجب أن تحافظ عمليات المعاينة/التزويد والعمليات التالية على وضع المراجعة وقواعد التوجيه التي اخترتها.

### نشرات مرحلية
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

## 🐳 نشر الحاويات

### نشر تطبيقات الحاويات
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

قم بتكوين الأسرار وقت التشغيل مع `configuration.secrets`/`secretRef` (أو مراجع Key Vault) والتحجيم مع `template.scale` في بنية تطبيق الحاوية. لا تخترع خصائص `secrets` أو `scale` على مستوى الخدمة في `azure.yaml`.

### تحسين Dockerfile متعددة المراحل
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

## ⚡ تحسين الأداء

### نشر خاص بالخدمة
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### تخزين بناء مؤقت
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

يستخدم نموذج Node القياسي سكربتات الحزمة؛ يمكن لخطافات خدمة `prepackage` إضافة الخطوات المطلوبة. تخزين طبقة Docker مؤقتًا منفصل عن تحديد أمر بناء الخدمة.

### نشرات كود فعالة
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 مراقبة النشر

### مراقبة النشر في الوقت الحقيقي
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### فحوصات الصحة
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

يجب أن ينفذ تطبيقك `/health`؛ هذه غير مزودة تلقائيًا من azd. لا توجد خاصية خدمة `azure.yaml` `healthCheck` عامة.

### التحقق بعد النشر
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

## 🔐 اعتبارات الأمان

### إدارة الأسرار
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` غير صالح. قيم البيئة العادية نص واضح محلي؛ لا تفترض أن أوامر القراءة تخفيها. الأوامر أعلاه تحفظ مراجع Key Vault، لكن بنيتك/تطبيقك لا يزال يجب أن يستهلك الأسرار ويمنح هوية وقت التشغيل الوصول.

### أمان الشبكة
أعلن واستخدم معلمات الشبكة في Bicep، وربطها في `infra/main.parameters.json`. لا يوجد تراكب `infra.parameters` عام في `azure.yaml`. نطاقات التوثيق النموذجية `203.0.113.0/24` و`198.51.100.0/24` ليست شبكات مكتب/VPN حقيقية؛ استبدلها بنطاقات شبكة مرخصة.

### إدارة الهوية والوصول
فعّل `identity` لتطبيق الحاوية في Bicep وخصص الدور المناسب على نطاق Key Vault لبيانات الطائرة. قم بتكوين الأسرار المسندة إلى Key Vault والمراجع في وقت التشغيل في ذلك المورد؛ `identity` و`keyVault` ليست خصائص خدمة azd عامة. انظر [المصادقة والهوية المدارية](../chapter-03-configuration/authsecurity.md).

## 🚨 استراتيجيات التراجع

### تراجع سريع
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

### تراجع البنية التحتية
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
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
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. التحقق من البنية التحتية
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. دمج الاختبارات
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

### 4. التوثيق والسجلات
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## الخطوات التالية

- [توفير الموارد](provisioning.md) - استكشاف عميق لإدارة البنية التحتية
- [التخطيط ما قبل النشر](../chapter-06-pre-deployment/capacity-planning.md) - خطط استراتيجية النشر الخاصة بك
- [المشاكل الشائعة](../chapter-07-troubleshooting/common-issues.md) - حل مشاكل النشر
- [أفضل الممارسات](../chapter-07-troubleshooting/debugging.md) - استراتيجيات نشر جاهزة للإنتاج

## 🎯 تمارين نشر عملية

### التمرين 1: نموذج نشر تكاملي (20 دقيقة)
**الهدف**: اتقن الفرق بين النشر الكامل والتكاملي

**نقطة البداية:** Bash، Node.js 22، Git، تسجيل دخول azd، واشتراك Azure مع أذونات النشر. شغّل في دليل جديد؛ توقع موارد App Service/Cosmos DB قابلة للفوترة. التوقيتات تعتمد على المنطقة والقالب.

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

**معايير النجاح:**
- [ ] سجل الوقت المنقضي لكلا الأمرين (لا يوجد زمن مضمون)
- [ ] اكتمال كلا الأمرين بنجاح
- [ ] تظل واجهة برمجة التطبيقات وظيفية؛ تعديل تعليق فقط ليس تغييرًا ظاهرًا في الواجهة
- [ ] لم تتغير البنية التحتية بعد `azd deploy`

**نتيجة التعلم**: `azd deploy` يتخطى تزويد البنية التحتية. قارن التوقيتات المقاسة بدلًا من افتراض زيادة سرعة بنسبة ثابتة.

### التمرين 2: خطافات نشر مخصصة (30 دقيقة)
**الهدف**: تنفيذ أتمتة ما قبل وما بعد النشر

**نقطة البداية:** المشروع `deployment-practice` المُهيأ أعلاه. إذا قمت بتنظيفه، شغّل `azd up` مرة أخرى قبل اختبار نشر الكود فقط. يستخدم التحقق أدناه سكربت بناء API الفعلي، وليس سكربت `test:unit` الجذري غير الموجود. تحتاج اختبارات قالب API إلى وصول قاعدة بيانات مُكون؛ ليست اختبارات وحدة معزولة.

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

**معايير النجاح:**
- [ ] تشغيل سكربت ما قبل النشر قبل العملية
- [ ] إلغاء النشر إذا فشل التحقق من البناء
- [ ] اختبار ما بعد النشر يتحقق من الصحة
- [ ] تنفيذ الخطافات بالترتيب الصحيح

### التمرين 3: استراتيجية النشر متعددة البيئات (45 دقيقة)
**الهدف**: تنفيذ نموذج نشر مرحلي (تطوير → اختبار → إنتاج)

**نقطة البداية:** نفس مشروع المهام المبدئي مع `jq`. أنشئ البيئات أدناه بقيم اشتراك/موقع فعلية (أو ضبط `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` في كل منها) **قبل** استدعاء سير العمل بدون مطالبات. يفشل عمداً بدلاً من اختلاق القيم المفقودة. استخدم فقط بيئات تدريب يمكن التخلص منها، وليس اشتراك إنتاج فعلي.

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

**معايير النجاح:**
- [ ] يتم نشر بيئة التطوير بنجاح
- [ ] يتم نشر بيئة الاختبار بنجاح
- [ ] يتطلب الموافقة اليدوية للإنتاج
- [ ] جميع البيئات تحتوي على فحوصات صحة تعمل
- [ ] يمكن التراجع إذا لزم الأمر

### التمرين 4: استراتيجية التراجع (25 دقيقة)
**الهدف**: تنفيذ واختبار التراجع عن النشر باستخدام Git

**نقطة البداية:** نسخة تدريب معزولة من قالب المهام مع جميع المصدر الأساسي ملتزم، شجرة عمل Git نظيفة، وبيئة مضبوطة يمكن التخلص منها. لا تُدخل أخطاء مقصودة في مشروع إنتاج حقيقي. `APP_VERSION` أدناه هو للمتابعة فقط ما لم توصلها صراحة بالتطبيق.

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

**معايير النجاح:**
- [ ] يمكن اكتشاف فشل النشر
- [ ] يتم تنفيذ سكريبت التراجع تلقائياً
- [ ] يعود التطبيق إلى حالة العمل
- [ ] تجتاز فحوصات الصحة بعد التراجع

## 📊 تتبع مقاييس النشر

### تتبع أداء نشر التطبيق الخاص بك

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

**حلل مقاييسك:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## موارد إضافية

- [مرجع نشر Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [نشر Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [نشر Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [نشر Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**التنقل**
- **الدرس السابق**: [مشروعك الأول](../chapter-01-foundation/first-project.md)
- **الدرس التالي**: [توفير الموارد](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->