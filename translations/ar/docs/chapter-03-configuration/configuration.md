# دليل التكوين

**تصفح الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 3 - التكوين والمصادقة
- **⬅️ السابق**: [مشروعك الأول](../chapter-01-foundation/first-project.md)
- **➡️ التالي**: [دليل النشر](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 الفصل التالي**: [الفصل 4: البنية التحتية ككود](../chapter-04-infrastructure/deployment-guide.md)

## مقدمة

> تم المراجعة مقابل `azd 1.37.2` (نوفمبر 2026). افترض أن أوامر Bash تستخدم مشروع azd مهيأ. إلا إذا تم وصفها صراحة كملف كامل، فإن مقتطفات YAML/Bicep هي أجزاء لدمجها في ملفات المشروع المطابقة، وليست مشاريع قابلة للتشغيل منفصلة.

يغطي هذا الدليل الشامل جميع جوانب تكوين Azure Developer CLI من أجل سير عمل تطوير ونشر مثالي. ستتعلم عن هيكلية التكوين، إدارة البيئة، طرق المصادقة، وأنماط التكوين المتقدمة التي تتيح نشرات Azure فعالة وآمنة.

## أهداف التعلم

بحلول نهاية هذا الدرس، ستتمكن من:
- إتقان هيكلية تكوين azd وفهم كيفية ترتيب أولوية الإعدادات
- تكوين الإعدادات العالمية والخاصة بالمشروع بفعالية
- إدارة بيئات متعددة مع تكوينات مختلفة
- تنفيذ أنماط مصادقة وتفويض آمنة
- فهم أنماط التكوين المتقدمة للسيناريوهات المعقدة

## مخرجات التعلم

بعد إتمام هذا الدرس، ستتمكن من:
- تكوين azd لسير عمل تطوير مثالي
- إعداد وإدارة بيئات نشر متعددة
- تنفيذ ممارسات إدارة تكوين آمنة
- استكشاف مشكلات التكوين وحلها
- تخصيص سلوك azd لمتطلبات المؤسسة المحددة

يغطي هذا الدليل الشامل جميع جوانب تكوين Azure Developer CLI من أجل سير عمل تطوير ونشر مثالي.

## فهم وكلاء الذكاء الاصطناعي في مشروع azd

إذا كنت جديدًا على وكلاء الذكاء الاصطناعي، إليك طريقة بسيطة للتفكير بهم ضمن عالم azd.

### ما هو الوكيل؟

الوكيل هو برنامج يمكنه استلام طلب، التفكير فيه، واتخاذ إجراءات — غالبًا عبر استدعاء نموذج ذكاء اصطناعي، البحث عن بيانات، أو استدعاء خدمات أخرى. في مشروع azd، الوكيل هو مجرد **خدمة** إلى جانب واجهة الويب الأمامية أو واجهة برمجة التطبيقات الخلفية.

### كيف يلائم الوكلاء بنية مشروع azd

يتكون مشروع azd من ثلاث طبقات: **البنية التحتية**، **الكود**، و**التكوين**. الوكلاء يتصلون بهذه الطبقات كما تفعل أي خدمة أخرى:

| الطبقة | ما تفعله لتطبيق نموذجي | ما يفعله لوكيل |
|-------|-------------------------------------|---------------------------|
| **البنية التحتية** (`infra/`) | يوفر تطبيق ويب وقاعدة بيانات | يوفر نقطة نهاية نموذج ذكاء اصطناعي، فهرس بحث، أو مضيف وكيل |
| **الكود** (`src/`) | يحتوي على كود الواجهة الأمامية وواجهة برمجة التطبيقات | يحتوي على منطق الوكيل وتعريفات المطالبات |
| **التكوين** (`azure.yaml`) | يسرد خدماتك وأهداف استضافتها | يسرد وكيلك كخدمة، مشيرًا إلى كوده ومضيفه |

### دور `azure.yaml`

لست بحاجة لحفظ الصياغة الآن. مفهوميًا، `azure.yaml` هو الملف الذي تخبر فيه azd: *"هذه هي الخدمات التي تشكل تطبيقي، وهذا موقع كودها."*

عندما يشمل مشروعك وكيل ذكاء اصطناعي، فإن `azure.yaml` يسرد ذلك الوكيل كواحدة من الخدمات. عندها يعرف azd أن يوفّر البنية التحتية المناسبة (مثل نقطة نهاية Microsoft Foundry Models أو تطبيق حاوية لاستضافة الوكيل) وينشر كود الوكيل — كما يفعل مع تطبيق ويب أو API.

هذا يعني أنه لا يوجد جديد جوهري لتعلمه. إذا كنت تفهم كيفية إدارة azd لخدمة ويب، فأنت تفهم بالفعل كيف يدير وكيلًا.

## هيكلية التكوين

لدى azd أسطح تكوين متميزة، وليست طبقة شاملة واحدة:
- **تفضيلات المستخدم العالمية**: `~/.azd/config.json`، تُدار بواسطة `azd config`.
- **تعريف المشروع**: `azure.yaml` يحدد الخدمات، البنية التحتية، والربط.
- **اختيار البيئة المحلية**: `.azure/config.json`.
- **قيم لكل بيئة**: `.azure/<name>/.env`، تُدار بواسطة `azd env`؛ الإعدادات الإضافية موجودة في `config.json` لتلك البيئة.
- **الأعلام والمتغيرات العملية**: يُلغى فقط الإعدادات التي يدعمها أمر/مقدم خدمة معين.

لا تتحول قيمة `azd env set` عشوائيًا تلقائيًا إلى معلمة بنية تحتية أو إعداد تطبيق منشور. اذكرها صراحة في ملف المعلمات، تكوين الخدمة المدعوم، أو الربط.

## التكوين العالمي

### تعيين الافتراضات العالمية
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### الإعدادات العالمية الشائعة
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ تكوين المشروع

### هيكل azure.yaml
ملف `azure.yaml` هو قلب مشروع azd الخاص بك:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

هذا **مثال تعريف مشروع**، وليس نموذج بدء تشغيل مسلّم. أنشئ أدلة المصدر المذكورة، نصوص الربط، نصوص الحزم، و`infra/main.bicep`/`main.parameters.json` المطابقة قبل تشغيله. قواعد البيانات تخص البنية التحتية؛ `postgres` ليس مضيف خدمة مدمج. تذهب معلمات البنية التحتية في ملف معلمات المزود، وليس في `infra.parameters`.

### خيارات تكوين الخدمة

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

#### ربطات الإنشاء الخاصة باللغة

توضح المقتطفات التالية خدمات الربط؛ ادمجها مع `project` و`host` الحقيقية لكل خدمة. `buildCommand` و`startCommand` ليستا خصائص عامة لخدمة azd. قم بتكوين بدء التشغيل في التطبيق، ملف Dockerfile، أو بنية المضيف الأساسية.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 إدارة البيئة

### إنشاء البيئات
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### تكوين البيئة
القيم الأساسية للبيئة موجودة في `.azure/<env-name>/.env`، بما في ذلك `AZURE_ENV_NAME`، `AZURE_SUBSCRIPTION_ID`، و`AZURE_LOCATION`. استخدم `azd env config get/set` لإعدادات JSON إضافية للبيئة. JSON التالي هو **حالة تطبيق مفهومية**، وليس مخطط تكوين azd؛ لا تنسخه إلى ملفات azd:

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

**عرض توضيحي بالنص الصريح فقط.** القيم العادية `azd env set` تُكتب في `.azure/<name>/.env` ويمكن طباعتها بواسطة أوامر القراءة. لا تستخدم مفتاح API المثال كبيانات اعتماد حقيقية. للمعلومات السرية، استخدم `azd env set-secret` وربط وقت التشغيل الصريح.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### قوالب البيئة
أنشئ **ملف إعداد يدوي وغير سري** `.env.example` في جذر المشروع لإعداد متناسق. لا يقوم azd بتحميل ملف يُسمى `env.template` تلقائيًا:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### مشاركة البيئات عبر الفريق

عندما يعمل أكثر من شخص على مشروع، يجب الاتفاق على **ما يتم تضمينه مع المستودع وما يبقى محليًا**. يحتفظ azd بكل بيئة تحت مجلد `.azure/`، وليس كل ذلك يجب الالتزام به.

**ما هو موجود في `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**ما يجب إضافته إلى gitignore.** استبعاد azd الافتراضي لـ `.gitignore` بالفعل يستبعد `.azure/`. حافظ على ذلك—ملفات `.env` يمكن أن تحتوي على أسرار، ومعرّفات الموارد خاصة بمن قام بتوفيرها. يقوم كل عضو فريق بإنشاء بيئته **الخاصة به** محليًا:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**التبديل بين البيئات.** يختار المطور الذي يدير عدة بيئات البيئة النشطة قبل تنفيذ الأوامر:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**توفير القيم الافتراضية غير السرية للفريق.** التزم بـ `.env.example` خارج الدليل `.azure/` المتجاهل. ينسخ الأعضاء الجدد الملف إلى ملف محلي متجاهل، يملأ القيم، ويستوردها صراحة باستخدام `azd env set --file <local-file>`. لا تستورد أبداً المتغيرات الفارغة فوق بيئة تعمل.

**البيئات في CI/CD.** خطوط الأنابيب لا تقرأ مجلد `.azure/` المحلي الخاص بك. بدلاً من ذلك، قدّم قيم البيئة كمتغيرات/أسرار في خط الأنابيب، ويقرأ azd تلك القيم من بيئة العملية:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **قاعدة عامة:** كود البنية التحتية (`infra/`، `azure.yaml`) مشترك في Git؛ *حالة البيئة والأسرار* (`.azure/`) تكون لكل مطور ولكل خط أنابيب. `azd pipeline config` تقوم بضبط متغيرات خط الأنابيب لك تلقائياً.

## 🔐 تكوين المصادقة

### تكامل Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### مصادقة الخدمة المُفوضة
لخطوط أنابيب CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### الهوية المُدارة
للبيئات المستضافة على Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
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
لمشاريع Terraform، يستبدل azd العناصر النائبة في `infra/main.tfvars.json`. يجب أن تتطابق هذه الأسماء مع متغيرات الإدخال المُعلنة في Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 تكوين النشر

### تكوين البناء
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### تكوين Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
المسارات نسبية إلى مشروع الخدمة. يجب أن يعلن Dockerfile عن أي قيم `ARG` يستخدمها. لبناء متعدد المراحل، ضع مرحلة النشر الأخيرة أو استخدم سير عمل تعبئة مخصص؛ `docker.target` ليست خاصية مدعومة في المخطط المراجع.

## 🔧 التكوين المتقدم

### تسمية الموارد المخصصة
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

عرّف أسماء الموارد الفعلية في Bicep/Terraform وحافظ على تناسق إنشاء مجموعة الموارد مع هذا الإعداد. لا توجد مفاتيح تكوين عامة `naming.storageAccount` أو `naming.keyVault`.

### تكوين الشبكة
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

ادمج هذه **إدخالات المعلمات التوضيحية** في `infra/main.parameters.json` تحت `parameters`، وأعلن واستهلك المعلمات المطابقة في Bicep. فهي لا تفعل شيئًا بمفردها.

### تكوين المراقبة
قم بإعداد Application Insights وLog Analytics في Bicep/Terraform وقم بتكوين قياس أداء التطبيق في SDK الخاص بك. لا يوجد كتلة `monitoring` عامة على المستوى الأعلى في `azure.yaml` تنشئ هذه الموارد. انظر [البنية التحتية للمراقبة](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 التكوين حسب البيئة

### بيئة التطوير
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### بيئة مرحلة الاختبار
```bash
# .azure/staging/.env
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

### تحقق من صحة التكوين
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### سكريبتات التكوين
أنشئ سكريبتات تحقق في `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
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

```

تجنب ترميز القيم الحساسة بشكل صلب (تكوين توضيحي منفصل، وليس مفتاح `database` ثاني في نفس الملف):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. تنظيم ملفات التكوين
```
.azure/
├── config.json              # Global project config
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
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. توثيق التكوين
وثق تكوينك في `CONFIG.md`:
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

**الهدف**: إنشاء وتكوين ثلاث بيئات محلية بقيم مختلفة. ابدأ في مشروع مهيأ؛ استخدم أسماء غير مستخدمة إذا كانت موجودة مسبقًا. هذه القيم الخاصة بالتطبيق لا تغير إعدادات القياس/التشغيل حتى يستهلكها قالبك.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**معايير النجاح:**
- [ ] تم إنشاء ثلاث بيئات بنجاح
- [ ] لكل بيئة تكوين فريد
- [ ] يمكن التبديل بين البيئات بدون أخطاء
- [ ] `azd env list` يعرض كل البيئات الثلاث

### التمرين 2: مراجع أسرار Key Vault (10-20 دقيقة)

**الهدف**: تخزين مرجع Key Vault بدلاً من نص عادي. **نقطة البداية:** بيئة مهيأة، تسجيل الدخول إلى Azure، والوصول إلى Key Vault أذونات لإنشاء/قراءة سر وهمي. قد تترتب رسوم على عمليات المخزن.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**معايير النجاح:**
- [ ] الأمر التفاعلي يبلغ عن المخزن المختار ومرجع السر
- [ ] يحتوي `.env` المحلي على مرجع وليس السر الوهمي
- [ ] يمكنه شرح أن هوية وقت التشغيل/RBAC والاستهلاك يجب أن يتم تكوينها

**المشكلات الشائعة:** خطأ 403 يتطلب دور مستوى البيانات الصحيح في المخزن ووقت الانتشار؛ `azd env set ... --secret` ليس أمرًا صالحًا. لا يجب افتراض أن إخراج `get-values`/`get-value` العادي تم حذفه. أزل المرجع التدريبي باستخدام `azd env unset TRAINING_API_KEY`؛ هذا لا يحذف سر المخزن، والذي يجب تنظيفه منفردًا إذا أنشأته.

## الخطوات التالية

- [مشروعك الأول](../chapter-01-foundation/first-project.md) - تطبيق التكوين عمليًا
- [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) - استخدام التكوين للنشر
- [توفير الموارد](../chapter-04-infrastructure/provisioning.md) - تكوينات جاهزة للإنتاج

## المراجع

- [مرجع تكوين azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [مخطط azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [متغيرات البيئة](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 3 - التكوين والمصادقة
- **⬅️ السابق**: [مشروعك الأول](../chapter-01-foundation/first-project.md)
- **➡️ الفصل التالي**: [الفصل 4: البنية التحتية كرمز](../chapter-04-infrastructure/deployment-guide.md)
- **الدروس التالية**: [المصادقة والأمان](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->