<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0b97d7e7c56825f0da031b9706d7f1ca",
  "translation_date": "2025-09-17T18:31:08+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "ar"
}
-->
# قائمة أوامر - أهم أوامر AZD

**مرجع سريع لجميع الفصول**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../README.md)
- **📖 البداية السريعة**: [الفصل الأول: الأساسيات والبداية السريعة](../README.md#-chapter-1-foundation--quick-start)
- **🤖 أوامر الذكاء الاصطناعي**: [الفصل الثاني: تطوير يعتمد على الذكاء الاصطناعي](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 متقدم**: [الفصل الرابع: البنية التحتية ككود](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## المقدمة

تقدم هذه القائمة الشاملة مرجعًا سريعًا لأكثر أوامر Azure Developer CLI استخدامًا، مرتبة حسب الفئات مع أمثلة عملية. مثالية للبحث السريع أثناء التطوير، حل المشكلات، والعمليات اليومية مع مشاريع azd.

## أهداف التعلم

باستخدام هذه القائمة، ستتمكن من:
- الوصول الفوري إلى أوامر Azure Developer CLI الأساسية وصيغها
- فهم تنظيم الأوامر حسب الفئات الوظيفية وحالات الاستخدام
- الرجوع إلى أمثلة عملية لسيناريوهات التطوير والنشر الشائعة
- الوصول إلى أوامر حل المشكلات بسرعة
- العثور على خيارات التكوين والتخصيص المتقدمة بكفاءة
- تحديد أوامر إدارة البيئة وسير العمل متعدد البيئات

## نتائج التعلم

مع الرجوع المنتظم إلى هذه القائمة، ستتمكن من:
- تنفيذ أوامر azd بثقة دون الحاجة إلى الرجوع إلى الوثائق الكاملة
- حل المشكلات الشائعة بسرعة باستخدام أوامر التشخيص المناسبة
- إدارة بيئات متعددة وسيناريوهات النشر بكفاءة
- تطبيق ميزات azd المتقدمة وخيارات التكوين حسب الحاجة
- حل مشكلات النشر باستخدام تسلسل أوامر منهجي
- تحسين سير العمل من خلال الاستخدام الفعال لاختصارات وخيارات azd

## أوامر البداية

### المصادقة
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### تهيئة المشروع
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## أوامر النشر الأساسية

### سير عمل النشر الكامل
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### البنية التحتية فقط
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### التطبيق فقط
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### البناء والتغليف
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 إدارة البيئة

### عمليات البيئة
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### متغيرات البيئة
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ أوامر التكوين

### التكوين العام
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### تكوين المشروع
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 المراقبة والسجلات

### سجلات التطبيق
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### المراقبة
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ أوامر الصيانة

### التنظيف
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### التحديثات
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 أوامر متقدمة

### خطوط الأنابيب وCI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### إدارة البنية التحتية
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### إدارة الخدمات
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 سير العمل السريع

### سير عمل التطوير
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### سير العمل متعدد البيئات
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### سير عمل حل المشكلات
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 أوامر التصحيح

### معلومات التصحيح
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### تصحيح القوالب
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 أوامر الملفات والمجلدات

### هيكل المشروع
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 تنسيق الإخراج

### إخراج JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### إخراج الجدول
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 تركيبات الأوامر الشائعة

### نص التحقق من الصحة
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### التحقق من النشر
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### مقارنة البيئة
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### نص تنظيف الموارد
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 متغيرات البيئة

### متغيرات البيئة الشائعة
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 أوامر الطوارئ

### الإصلاحات السريعة
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### أوامر الاسترداد
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 نصائح احترافية

### الأسماء المستعارة لتسريع سير العمل
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### اختصارات الوظائف
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 المساعدة والوثائق

### الحصول على المساعدة
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### روابط الوثائق
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**نصيحة**: ضع إشارة مرجعية على هذه القائمة واستخدم `Ctrl+F` للعثور بسرعة على الأوامر التي تحتاجها!

---

**التنقل**
- **الدرس السابق**: [فحوصات ما قبل النشر](../docs/pre-deployment/preflight-checks.md)
- **الدرس التالي**: [المصطلحات](glossary.md)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.