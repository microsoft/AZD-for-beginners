# دليل التكوين

**الملاحة في الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 3 - التكوين والمصادقة
- **⬅️ السابق**: [مشروعك الأول](first-project.md)
- **➡️ التالي**: [دليل النشر](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 الفصل التالي**: [الفصل 4: البنية التحتية كرمز](../chapter-04-infrastructure/deployment-guide.md)

## مقدمة

يغطي هذا الدليل الشامل جميع جوانب تكوين Azure Developer CLI لتهيئة سير عمل التطوير والنشر الأمثل. ستتعلم عن تسلسل التكوين، إدارة البيئات، طرق المصادقة، وأنماط التكوين المتقدمة التي تمكّن نشرات Azure الفعّالة والآمنة.

## أهداف التعلم

بحلول نهاية هذا الدرس، سوف:
- تتقن تسلسل تكوين azd وتفهم كيفية تحديد أولويات الإعدادات
- تقوم بتكوين الإعدادات العامة والخاصة بالمشروع بفعالية
- تدير بيئات متعددة بإعدادات مختلفة
- تنفذ نماذج مصادقة وتفويض آمنة
- تفهم أنماط التكوين المتقدمة للسيناريوهات المعقدة

## نتائج التعلم

بعد إكمال هذا الدرس، ستكون قادرًا على:
- تكوين azd لتهيئة سير عمل التطوير الأمثل
- إعداد وإدارة بيئات نشر متعددة
- تنفيذ ممارسات إدارة التكوين الآمنة
- استكشاف المشكلات المتعلقة بالتكوين وإصلاحها
- تخصيص سلوك azd لمتطلبات المنظمة المحددة

يغطي هذا الدليل الشامل جميع جوانب تكوين Azure Developer CLI لتهيئة سير عمل التطوير والنشر الأمثل.

## فهم وكلاء الذكاء الاصطناعي في مشروع azd

إذا كنت جديدًا على وكلاء الذكاء الاصطناعي، فإليك طريقة بسيطة للتفكير بهم داخل عالم azd.

### ما هو الوكيل؟

الوكيل هو قطعة برمجية يمكن أن تستقبل طلبًا، وتفكر فيه، وتتخذ إجراءات — غالبًا عن طريق استدعاء نموذج ذكاء اصطناعي، أو البحث عن بيانات، أو استدعاء خدمات أخرى. في مشروع azd، الوكيل هو مجرد **خدمة** أخرى بجانب الواجهة الأمامية للويب أو واجهة برمجة التطبيقات الخلفية.

### كيف يتناسب الوكلاء مع بنية مشروع azd

يتكون مشروع azd من ثلاث طبقات: **البنية التحتية** و**الكود** و**التكوين**. يتصل الوكلاء بهذه الطبقات بنفس طريقة اتصال أي خدمة أخرى:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **البنية التحتية** (`infra/`) | يوفر تطبيق ويب وقاعدة بيانات | يوفر نقطة نهاية نموذج ذكاء اصطناعي، فهرس بحث، أو مضيف للوكيل |
| **الكود** (`src/`) | يحتوي على كود الواجهة الأمامية وواجهة برمجة التطبيقات | يحتوي على منطق الوكيل وتعريفات المطالبات |
| **التكوين** (`azure.yaml`) | يسرد خدماتك وأهداف الاستضافة الخاصة بها | يسرد وكيلك كخدمة، مشيرًا إلى كوده ومضيفه |

### دور `azure.yaml`

لا تحتاج إلى حفظ البنية النحوية الآن. من الناحية المفاهيمية، `azure.yaml` هو الملف الذي تخبر فيه azd: *"هذه هي الخدمات التي تشكل تطبيقي، وهذه هي مواقع العثور على كودها."*

عندما يتضمن مشروعك وكيل ذكاء اصطناعي، يدرج `azure.yaml` ببساطة هذا الوكيل كواحدة من الخدمات. عندها يعرف azd كيفية توفير البنية التحتية المناسبة (مثل نقطة نهاية Microsoft Foundry Models أو تطبيق حاوية لاستضافة الوكيل) ونشر كود الوكيل — تمامًا كما يفعل لتطبيق ويب أو واجهة برمجة تطبيقات.

هذا يعني أنه لا يوجد شيء جديد جوهريًا لتعلمه. إذا فهمت كيفية إدارة azd لخدمة ويب، فأنت بالفعل تفهم كيفية إدارته لوكيل.

## تسلسل التكوين

يستخدم azd نظام تكوين هرمي:
1. **أعلام سطر الأوامر** (الأولوية الأعلى)
2. **متغيرات البيئة**
3. **تكوين المشروع المحلي** (`.azd/config.json`)
4. **تكوين المستخدم العام** (`~/.azd/config.json`)
5. **القيم الافتراضية** (الأولوية الأدنى)

## التكوين العام

### تعيين القيم الافتراضية العامة
```bash
# تعيين الاشتراك الافتراضي
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# تعيين الموقع الافتراضي
azd config set defaults.location "eastus2"

# تعيين قواعد تسمية مجموعة الموارد الافتراضية
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# عرض جميع التكوينات العالمية
azd config show

# إزالة تكوين
azd config unset defaults.location
```

### إعدادات عامة شائعة
```bash
# تفضيلات التطوير
azd config set alpha.enable true                    # تمكين ميزات ألفا
azd config set telemetry.enabled false             # تعطيل القياس عن بعد
azd config set output.format json                  # تعيين تنسيق الإخراج

# إعدادات الأمان
azd config set auth.useAzureCliCredential true     # استخدام Azure CLI للمصادقة
azd config set tls.insecure false                  # فرض التحقق من TLS

# ضبط الأداء
azd config set provision.parallelism 5             # إنشاء الموارد بالتوازي
azd config set deploy.timeout 30m                  # مهلة النشر
```

## 🏗️ تكوين المشروع

### بنية azure.yaml
ملف `azure.yaml` هو قلب مشروع azd الخاص بك:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### خيارات تكوين الخدمة

#### أنواع الاستضافة
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### إعدادات خاصة باللغات
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 إدارة البيئات

### إنشاء بيئات
```bash
# أنشئ بيئة جديدة
azd env new development

# أنشئ في موقع محدد
azd env new staging --location "westus2"

# أنشئ من قالب
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### تكوين البيئة
لكل بيئة تكوينها الخاص في `.azure/<env-name>/config.json`:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### متغيرات البيئة
```bash
# تعيين متغيرات خاصة بالبيئة
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# عرض متغيرات البيئة
azd env get-values

# المخرجات المتوقعة:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# إزالة متغير البيئة
azd env unset DEBUG

# التحقق من الإزالة
azd env get-values | grep DEBUG
# (ينبغي ألا يُرجع شيئًا)
```

### قوالب البيئة
قم بإنشاء `.azure/env.template` لإعداد بيئة متسقة:
```bash
# المتغيرات المطلوبة
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# إعدادات التطبيق
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# إعدادات التطوير الاختيارية
DEBUG=false
LOG_LEVEL=info
```

### مشاركة البيئات عبر الفريق

عندما يعمل أكثر من شخص على مشروع، تحتاجون إلى الاتفاق على **ما الذي ينتقل مع المستودع وما الذي يبقى محليًا**. يحتفظ azd بكل بيئة تحت مجلد `.azure/`، وليس كل شيء فيه يجب أن يُلتزم.

**ما الموجود في `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**ما الذي يجب تجاهله في git.** يستبعد `.gitignore` الافتراضي لـ azd بالفعل `.azure/`. احتفظ بهذا السلوك — ملفات `.env` قد تحتوي على أسرار، ومعرّفات الموارد خاصة بمن قام بتوفيرها. كل عضو في الفريق ينشئ بيئته **الخاصة** محليًا:

```bash
# يشغّل كل مطور هذا مرة واحدة للحصول على بيئته المعزولة الخاصة
azd env new dev-alice
azd up
```

**التبديل بين البيئات.** المطور الذي يدير عدة بيئات يحدد البيئة النشطة قبل تشغيل الأوامر:

```bash
azd env list                 # اطلع على جميع البيئات المحلية وأيها الافتراضي
azd env select staging       # اجعل 'staging' البيئة النشطة
azd env get-values           # تأكد من أنك موجه إلى البيئة الصحيحة
```

**تقديم القيم الافتراضية غير السرية للفريق.** التزم بقالب (مثل `.azure/env.template` أعلاه) حتى يعرف الجميع المتغيرات التي يجب تعيينها — ولكن لا تلتزم أبدًا بالقيم المملوءة. ينسخ الزملاء الجدد القالب ويملؤون قيمهم الخاصة.

**البيئات في CI/CD.** لا تقرأ خطوط الأنابيب مجلد `.azure/` المحلي لديك. بدلاً من ذلك، قدّم قيم البيئة كمتغيرات/أسرار في خط الأنابيب، ويقرأ azd هذه القيم من بيئة العملية:

```bash
# في CI، يقرأ azd هذه من البيئة، وليس من .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **قاعدة عامة:** كود البنية التحتية (`infra/`, `azure.yaml`) يُشارك في Git؛ *حالة البيئة والأسرار* (`.azure/`) تكون لكل مطور ولكل خط أنابيب. يقوم `azd pipeline config` بإعداد متغيرات خط الأنابيب لك تلقائيًا.

## 🔐 تكوين المصادقة

### تكامل Azure CLI
```bash
# استخدم بيانات اعتماد Azure CLI (افتراضي)
azd config set auth.useAzureCliCredential true

# تسجيل الدخول باستخدام مستأجر محدد
az login --tenant <tenant-id>

# تعيين الاشتراك الافتراضي
az account set --subscription <subscription-id>
```

### مصادقة Service Principal
لـ CI/CD pipelines:
```bash
# ضبط متغيرات البيئة
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# أو قم بالتكوين مباشرةً
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### الهوية المُدارة
لـ البيئات المستضافة في Azure:
```bash
# تمكين المصادقة باستخدام الهوية المُدارة
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ تكوين البنية التحتية

### معلمات Bicep
قم بتكوين معلمات البنية التحتية في `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### تكوين Terraform
لمشاريع Terraform، قم بالتكوين في `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 تكوين النشر

### تكوين البناء
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### تكوين Docker
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
        NODE_ENV: production
        API_VERSION: v1.0.0
```
مثال `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 التكوين المتقدم

### تسمية الموارد المخصصة
```bash
# تعيين قواعد التسمية
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### تكوين الشبكة
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### تكوين المراقبة
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 تكوينات خاصة بالبيئة

### بيئة التطوير
```bash
# .azure/التطوير/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### بيئة الاختبار
```bash
# .أزور/المرحلة/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### بيئة الإنتاج
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 التحقق من التكوين

### التحقق من التكوين
```bash
# تحقق من صحة تركيب التكوين
azd config validate

# اختبر متغيرات البيئة
azd env get-values

# تحقق من صحة البنية التحتية
azd provision --dry-run
```

### سكربتات التكوين
قم بإنشاء سكربتات التحقق في `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# التحقق من متغيرات البيئة المطلوبة
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# التحقق من صحة بناء جملة ملف azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 أفضل الممارسات

### 1. استخدم متغيرات البيئة
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. نظم ملفات التكوين
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. اعتبارات التحكم في الإصدار
```bash
# .gitignore
.azure/*/config.json         # تكوينات البيئة (تحتوي على معرفات الموارد)
.azure/*/.env               # متغيرات البيئة (قد تحتوي على أسرار)
.env                        # ملف البيئة المحلية
```

### 4. توثيق التكوين
قم بتوثيق تكوينك في `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 تمارين عملية

### التمرين 1: تكوين متعدد البيئات (15 دقيقة)

**الهدف**: إنشاء وتكوين ثلاث بيئات بإعدادات مختلفة

```bash
# إنشاء بيئة التطوير
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# إنشاء بيئة التدريج
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# إنشاء بيئة الإنتاج
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# التحقق من كل بيئة
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**معايير النجاح:**
- [ ] تم إنشاء ثلاث بيئات بنجاح
- [ ] كل بيئة لها تكوين فريد
- [ ] يمكن التبديل بين البيئات دون أخطاء
- [ ] يعرض `azd env list` جميع البيئات الثلاث

### التمرين 2: إدارة الأسرار (10 دقائق)

**الهدف**: ممارسة التكوين الآمن مع البيانات الحساسة

```bash
# تعيين الأسرار (لا يتم عرضها في الإخراج)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# تعيين إعدادات غير سرية
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# عرض البيئة (يجب أن تُحجب الأسرار)
azd env get-values

# التحقق من تخزين الأسرار
azd env get DB_PASSWORD  # ينبغي أن يعرض القيمة الفعلية
```

**معايير النجاح:**
- [ ] تم تخزين الأسرار دون عرضها في الطرفية
- [ ] يعرض `azd env get-values` أسرارًا مخفية
- [ ] يقوم الأمر الفردي `azd env get <SECRET_NAME>` باسترداد القيمة الفعلية

## الخطوات القادمة

- [مشروعك الأول](first-project.md) - طبق التكوين عمليًا
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - استخدم التكوين للنشر
- [توفير الموارد](../chapter-04-infrastructure/provisioning.md) - تكوينات جاهزة للإنتاج

## المراجع

- [مرجع تكوين azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [مخطط azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [متغيرات البيئة](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**الملاحة في الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 3 - التكوين والمصادقة
- **⬅️ السابق**: [مشروعك الأول](first-project.md)
- **➡️ الفصل التالي**: [الفصل 4: البنية التحتية كرمز](../chapter-04-infrastructure/deployment-guide.md)
- **الدرس التالي**: [مشروعك الأول](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->