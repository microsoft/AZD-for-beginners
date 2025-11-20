<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-20T07:17:50+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "ar"
}
-->
# دليل الإعداد

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل الثالث - الإعداد والمصادقة
- **⬅️ السابق**: [مشروعك الأول](first-project.md)
- **➡️ التالي**: [دليل النشر](../deployment/deployment-guide.md)
- **🚀 الفصل التالي**: [الفصل الرابع: البنية التحتية ككود](../deployment/deployment-guide.md)

## المقدمة

يغطي هذا الدليل الشامل جميع جوانب إعداد Azure Developer CLI لتحقيق أفضل تدفقات العمل للتطوير والنشر. ستتعلم عن التسلسل الهرمي للإعداد، إدارة البيئات، طرق المصادقة، وأنماط الإعداد المتقدمة التي تمكنك من نشر آمن وفعال على Azure.

## أهداف التعلم

بنهاية هذا الدرس، ستتمكن من:
- إتقان التسلسل الهرمي لإعداد azd وفهم كيفية تحديد الأولويات للإعدادات
- إعداد الإعدادات العامة والخاصة بالمشروع بشكل فعال
- إدارة بيئات متعددة بإعدادات مختلفة
- تنفيذ أنماط المصادقة والتفويض الآمنة
- فهم أنماط الإعداد المتقدمة للسيناريوهات المعقدة

## نتائج التعلم

بعد إكمال هذا الدرس، ستكون قادرًا على:
- إعداد azd لتحقيق أفضل تدفقات العمل للتطوير
- إنشاء وإدارة بيئات نشر متعددة
- تنفيذ ممارسات إدارة إعدادات آمنة
- حل المشكلات المتعلقة بالإعداد
- تخصيص سلوك azd لتلبية متطلبات تنظيمية محددة

يغطي هذا الدليل الشامل جميع جوانب إعداد Azure Developer CLI لتحقيق أفضل تدفقات العمل للتطوير والنشر.

## التسلسل الهرمي للإعداد

يستخدم azd نظام إعداد هرمي:
1. **علامات سطر الأوامر** (أعلى أولوية)
2. **متغيرات البيئة**
3. **إعداد المشروع المحلي** (`.azd/config.json`)
4. **إعداد المستخدم العام** (`~/.azd/config.json`)
5. **القيم الافتراضية** (أقل أولوية)

## الإعداد العام

### إعداد القيم الافتراضية العامة
```bash
# تعيين الاشتراك الافتراضي
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# تعيين الموقع الافتراضي
azd config set defaults.location "eastus2"

# تعيين اتفاقية تسمية مجموعة الموارد الافتراضية
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# عرض جميع التكوينات العالمية
azd config list

# إزالة التكوين
azd config unset defaults.location
```

### إعدادات عامة شائعة
```bash
# تفضيلات التطوير
azd config set alpha.enable true                    # تمكين الميزات التجريبية
azd config set telemetry.enabled false             # تعطيل القياس عن بعد
azd config set output.format json                  # تعيين تنسيق الإخراج

# إعدادات الأمان
azd config set auth.useAzureCliCredential true     # استخدام Azure CLI للمصادقة
azd config set tls.insecure false                  # فرض التحقق من TLS

# تحسين الأداء
azd config set provision.parallelism 5             # إنشاء الموارد بشكل متوازي
azd config set deploy.timeout 30m                  # مهلة النشر
```

## 🏗️ إعداد المشروع

### هيكل azure.yaml
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

### خيارات إعداد الخدمة

#### أنواع المضيف
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

#### إعدادات خاصة باللغة
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

## 🌟 إدارة البيئة

### إنشاء بيئات
```bash
# إنشاء بيئة جديدة
azd env new development

# إنشاء بموقع محدد
azd env new staging --location "westus2"

# إنشاء من قالب
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### إعداد البيئة
لكل بيئة إعداد خاص بها في `.azure/<env-name>/config.json`:

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
# (يجب أن لا يُرجع شيئًا)
```

### قوالب البيئة
قم بإنشاء `.azure/env.template` لإعداد بيئة متسق:
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

## 🔐 إعداد المصادقة

### تكامل Azure CLI
```bash
# استخدم بيانات اعتماد Azure CLI (الافتراضية)
azd config set auth.useAzureCliCredential true

# تسجيل الدخول باستخدام مستأجر محدد
az login --tenant <tenant-id>

# تعيين الاشتراك الافتراضي
az account set --subscription <subscription-id>
```

### مصادقة المسؤول عن الخدمة
لأنظمة CI/CD:
```bash
# تعيين متغيرات البيئة
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# أو التكوين مباشرة
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### الهوية المُدارة
للبيئات المستضافة على Azure:
```bash
# تمكين مصادقة الهوية المُدارة
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ إعداد البنية التحتية

### معلمات Bicep
قم بإعداد معلمات البنية التحتية في `infra/main.parameters.json`:
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

### إعداد Terraform
لمشاريع Terraform، قم بالإعداد في `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 إعداد النشر

### إعداد البناء
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

### إعداد Docker
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

## 🔧 إعدادات متقدمة

### تسمية الموارد المخصصة
```bash
# تعيين قواعد التسمية
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### إعداد الشبكة
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### إعداد المراقبة
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

## 🎯 إعدادات خاصة بالبيئة

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
# .azure/التخزين المؤقت/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### بيئة الإنتاج
```bash
# .azure/الإنتاج/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 التحقق من الإعداد

### التحقق من الإعداد
```bash
# تحقق من بناء الجملة للتكوين
azd config validate

# اختبار متغيرات البيئة
azd env get-values

# التحقق من البنية التحتية
azd provision --dry-run
```

### نصوص الإعداد
قم بإنشاء نصوص التحقق في `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# التحقق من متغيرات البيئة المطلوبة
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# التحقق من صحة صيغة azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 أفضل الممارسات

### 1. استخدام متغيرات البيئة
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. تنظيم ملفات الإعداد
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

### 3. اعتبارات التحكم في الإصدارات
```bash
# .gitignore
.azure/*/config.json         # تكوينات البيئة (تحتوي على معرفات الموارد)
.azure/*/.env               # متغيرات البيئة (قد تحتوي على أسرار)
.env                        # ملف البيئة المحلية
```

### 4. توثيق الإعداد
وثق إعدادك في `CONFIG.md`:
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

### التمرين 1: إعداد بيئات متعددة (15 دقيقة)

**الهدف**: إنشاء وإعداد ثلاث بيئات بإعدادات مختلفة

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
- [ ] لكل بيئة إعداد فريد
- [ ] يمكن التبديل بين البيئات دون أخطاء
- [ ] `azd env list` يعرض جميع البيئات الثلاث

### التمرين 2: إدارة الأسرار (10 دقائق)

**الهدف**: ممارسة الإعداد الآمن للبيانات الحساسة

```bash
# تعيين الأسرار (لا يتم عرضها في الإخراج)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# تعيين إعدادات غير سرية
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# عرض البيئة (يجب إخفاء الأسرار)
azd env get-values

# التحقق من تخزين الأسرار
azd env get DB_PASSWORD  # يجب أن يظهر القيمة الفعلية
```

**معايير النجاح:**
- [ ] تم تخزين الأسرار دون عرضها في الطرفية
- [ ] `azd env get-values` يعرض الأسرار المحجوبة
- [ ] استرجاع القيمة الفعلية باستخدام `azd env get <SECRET_NAME>` لكل سر

## الخطوات التالية

- [مشروعك الأول](first-project.md) - تطبيق الإعداد عمليًا
- [دليل النشر](../deployment/deployment-guide.md) - استخدام الإعداد للنشر
- [توفير الموارد](../deployment/provisioning.md) - إعدادات جاهزة للإنتاج

## المراجع

- [مرجع إعداد azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [مخطط azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [متغيرات البيئة](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل الثالث - الإعداد والمصادقة
- **⬅️ السابق**: [مشروعك الأول](first-project.md)
- **➡️ الفصل التالي**: [الفصل الرابع: البنية التحتية ككود](../deployment/deployment-guide.md)
- **الدرس التالي**: [مشروعك الأول](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->