# ورقة غش الأوامر - أوامر AZD الأساسية

**مرجع سريع لجميع الفصول**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../README.md)
- **📖 البدء السريع**: [الفصل 1: الأساسيات والبدء السريع](../README.md#-chapter-1-foundation--quick-start)
- **🤖 أوامر الذكاء الاصطناعي**: [الفصل 2: تطوير يركز على الذكاء الاصطناعي](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 متقدم**: [الفصل 4: البنية التحتية كرمز](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## مقدمة

توفر لك ورقة الغش هذه مرجعًا سريعًا لأكثر أوامر Azure Developer CLI استخدامًا، منظمة حسب الفئة مع أمثلة عملية. مثالية للبحث السريع أثناء التطوير، واستكشاف الأخطاء، والعمليات اليومية مع مشاريع azd.

## أهداف التعلم

باستخدامك لورقة الغش هذه، ستتمكن من:
- الوصول الفوري إلى أوامر Azure Developer CLI الأساسية والصياغة الخاصة بها
- فهم تنظيم الأوامر حسب الفئات الوظيفية وحالات الاستخدام
- الرجوع إلى أمثلة عملية لسيناريوهات التطوير والنشر الشائعة
- الوصول إلى أوامر استكشاف الأخطاء لإصلاح المشكلات بسرعة
- العثور على خيارات التهيئة والتخصيص المتقدمة بكفاءة
- تحديد أوامر إدارة البيئة وتدفقات العمل متعددة البيئات

## نتائج التعلم

باستخدامك المنتظم لورقة الغش هذه، ستكون قادرًا على:
- تنفيذ أوامر azd بثقة دون الحاجة إلى الرجوع للتوثيق الكامل
- حل المشكلات الشائعة بسرعة باستخدام أوامر التشخيص المناسبة
- إدارة بيئات ونشرات متعددة بكفاءة
- تطبيق ميزات azd المتقدمة وخيارات التكوين حسب الحاجة
- استكشاف مشكلات النشر باستخدام تتابعات أوامر منهجية
- تحسين تدفقات العمل من خلال الاستخدام الفعال لاختصارات وخيارات azd

## أوامر البدء

### التوثيق
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### تهيئة المشروع
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## أوامر النشر الأساسية

### تدفق عمل النشر الكامل
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### البنية التحتية فقط
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### التطبيق فقط
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### البناء والحزم
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** يقوم بتنزيل تبعيات تطبيقك (npm، pip، NuGet، Maven، إلخ). يتم تشغيله تلقائيًا أثناء `azd package` و`azd deploy`، لذلك نادرًا ما تستدعيه مباشرة — شغله يدويًا لتحميل التبعيات مسبقًا (على سبيل المثال، لتسخين ذاكرة التخزين المؤقت لـ CI أو للعمل دون اتصال بعد ذلك).

> **`azd package`** يحضر قطعة قابلة للنشر دون نشر خدمة التطبيق. يعتمد السلوك على اللغة والمضيف: يمكن أن يستخدم تغليف الحاويات عمليات بناء عن بُعد في Azure وينشر الصور إلى سجل، لذا قد لا يكون دائمًا دون اتصال أو خالي من عمليات الكتابة على Azure. يمكن لـ `azd deploy` التعبئة تلقائيًا؛ استخدم خطوة تعبئة منفصلة عندما تحتاج إلى قطعة أو فحص بناء.


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

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### متغيرات البيئة
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

ملفات البيئة هي نص عادي. لا تعامل `azd env set` كمخزن أسرار؛ استخدم مراجع Key Vault أو الهوية المدار حسب الاقتضاء.

## ⚙️ أوامر التهيئة

### التهيئة العالمية
```bash
# List all configuration
azd config show

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### تهيئة المشروع
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 المراقبة والتشخيص

### لوحة المراقبة
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

يجب تهيئة Application Insights بواسطة القالب. خيار المقاييس الحية في AZD غير مدعوم حاليًا لتطبيقات Python؛ استخدم النظرة العامة، السجلات، أو تدفق التتبع الموثق في العينة بدلاً من ذلك.

### عرض سجلات الحاوية
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### استعلامات تحليلات السجلات
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
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
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 أوامر متقدمة

### خطوط الأنابيب وCI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### إدارة البنية التحتية
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### معلومات المشروع
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 أوامر الذكاء الاصطناعي والإضافات

### إضافات AZD

تم تحديث مرجع Foundry GA في 09-11-2026: `microsoft.foundry` الحزمة 1.0، أعلن عنها في [5 نوفمبر 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). استخدم `azd >= 1.37.0`؛ المكونات يتم إصدارها بشكل مستقل وميزات المعاينة الاختيارية تحتفظ بوضعها الخاص.

```bash
# List all available extensions (including AI)
azd extension list

# Check/update the core CLI before updating extensions
azd version
azd update

# Install the GA bundle (agents, connections, inspector, projects,
# routines, skills, and toolboxes)
azd ext install microsoft.foundry

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Inspect installed versions and upgrade the bundle
azd ext list --installed
azd ext upgrade microsoft.foundry
```

الحزمة لا تشمل التقييمات، أو مجموعات البيانات، أو التدريب الدقيق، أو النماذج المخصصة. لا يزال تثبيت الإضافات الأساسية الفردية مدعومًا. اتبع [دليل المضيف GA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) لعينة قابلة للتشغيل مع Python 3.13+، uv الحالي، الأذونات، وحصة النماذج.

### أوامر وكيل الذكاء الاصطناعي
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# For a code-based hosted agent, add --deploy-mode code during init
# Review azure.yaml, then provision before running locally
azd provision
azd ai agent run

# In a second terminal in the same project directory
azd ai agent invoke --local "Explain how this agent is deployed."

# Upload source for a remote Foundry build (code mode)
azd deploy

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Review hosted-agent changes, stream logs, or diagnose permissions
azd deploy --preview
azd ai agent monitor --follow
azd ai agent doctor

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` يستبدل تهجئة `--manifest`/`-m` القديمة؛ تحتاج ملفات المظاهر القديمة إلى ترحيل. لا يوجد خيار `--host containerapp` agent-init حاليًا. تحتاج المعاينة المدارة والصوت والمعاينة طويلة التشغيل إلى خيارات صَدْفُ الغلاف / بيئة CI مستقلة؛ راجع [مرجع AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

لا يزال الاختبار المحلي يستخدم نشرات نماذج Azure ويتكبد رسومًا. للتنظيف، `azd down` يحذف مجموعة موارد مشروع Foundry الذي تم إنشاؤه حديثًا، لكنه يترك موارد المشاريع المعاد استخدامها في مكانها؛ قم بإزالة الموارد غير المرغوب فيها التي تملكها فقط بشكل منفصل.

### تقييمات وتحسينات AI
```bash
# Generate and review a draft dataset and rubric (Dataset and evaluator / Turn)
azd ai eval generate

# In the initialized agent project, select those assets and a judge model
azd ai eval init --name quality

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --eval quality --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

استبدلت Agents beta.22 أوامر التقييم القديمة بـ `azd ai eval` من `azure.ai.evaluations`. يستخدم تكوين التقييم الجديد مفاتيح camelCase. يأخذ تحسين `--config` طلب API تحسين مستقل، **وليس** أمر `eval.yaml` القديم أو `azure.eval.yaml` الجديد؛ استخدم `--eval`/`--eval-config` لإعادة استخدام التقييم. انظر [إعداد التقييم](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) و [ترحيل التحسين](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Foundry CI/CD
```bash
# After a successful local deployment, generate and review the pipeline
azd up
azd pipeline config

# Runner steps: install extensions, authenticate, then deploy
azd ext install microsoft.foundry azure.ai.evaluations
# Keep the generated OIDC sign-in and environment settings here
azd up --no-prompt
azd ai eval run start --eval quality --wait --no-prompt --fail-on "pass-rate=0.9"
```

مقطع المشغّل ليس سير عمل كامل. قم بإيداع تكوين التقييم المراجع والأصول غير السرية، وامنح الوصول إلى مجموعة البيانات/المُقيّم/النموذج، واستخدم بيئة منفصلة لكل مرحلة. راجع [مثال CI/CD المصادق عليه](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### خادم MCP (ألفا)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### إنشاء البنية التحتية
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 سير العمل السريع

### سير عمل التطوير
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### سير عمل متعدد البيئات
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

### سير عمل استكشاف الأخطاء
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 أوامر تصحيح الأخطاء

### معلومات التصحيح
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### تصحيح القوالب
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 أوامر الملفات والمجلدات

### هيكل المشروع
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 تنسيق الإخراج

### إخراج JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### إخراج الجدول
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 مجموعات الأوامر الشائعة

### برنامج فحص الصحة
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### التحقق من النشر
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### مقارنة البيئات
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### برنامج تنظيف الموارد
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 متغيرات البيئة

### متغيرات البيئة الشائعة
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 أوامر الطوارئ

### إصلاحات سريعة
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### أوامر الاسترداد
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 نصائح احترافية

### الأسماء المستعارة لتسريع سير العمل
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### اختصارات الدوال
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
azd-status() {
    echo "Current environment:"
    azd env get-values
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

**نصيحة**: أضف هذه الورقة المختصرة إلى المفضلة واستخدم `Ctrl+F` للعثور بسرعة على الأوامر التي تحتاجها!

---

**التنقل**
- **الدرس السابق**: [فحوصات ما قبل الإقلاع](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **الدرس التالي**: [المعجم](glossary.md)

---

> **💡 هل تريد مساعدة أوامر Azure في محرر النصوص الخاص بك؟** قم بتثبيت [مهارات الوكيل مايكروسوفت أزور](https://skills.sh/microsoft/github-copilot-for-azure) باستخدام `npx skills add microsoft/github-copilot-for-azure` — 37 مهارة للذكاء الاصطناعي، Foundry، النشر، التشخيص والمزيد.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->